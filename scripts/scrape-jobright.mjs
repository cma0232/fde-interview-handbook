/**
 * Scrape total FDE job count from jobright.ai and upsert into Supabase.
 * Run: node scripts/scrape-jobright.mjs
 * Schedule: add to crontab, e.g. every Monday 9am:
 *   0 9 * * 1 cd /path/to/fde-prep && node scripts/scrape-jobright.mjs
 */

import { chromium } from "playwright";

const SUPABASE_URL = "https://sytaxalwtgbgvgrausas.supabase.co";
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!SUPABASE_SERVICE_KEY) {
  console.error("Missing SUPABASE_SERVICE_ROLE_KEY env var");
  process.exit(1);
}

const URL = "https://jobright.ai/jobs/forward-deployed-engineer-jobs-in-united-states";

async function scrape() {
  const browser = await chromium.launch();
  const page = await browser.newPage();

  await page.goto(URL, { waitUntil: "networkidle", timeout: 30000 });

  // Wait for the result count text to appear
  await page.waitForSelector("text=/\\d+ results for/", { timeout: 15000 });

  const text = await page.locator("text=/\\d+ results for/").first().textContent();
  await browser.close();

  const match = text?.match(/[\d,]+/);
  if (!match) throw new Error(`Could not parse count from: "${text}"`);

  const count = parseInt(match[0].replace(/,/g, ""), 10);
  console.log(`Scraped: ${count} jobs`);
  return count;
}

async function upsert(count) {
  const week = new Date().toISOString().split("T")[0];

  const res = await fetch(`${SUPABASE_URL}/rest/v1/fde_job_snapshots`, {
    method: "POST",
    headers: {
      "apikey": SUPABASE_SERVICE_KEY,
      "Authorization": `Bearer ${SUPABASE_SERVICE_KEY}`,
      "Content-Type": "application/json",
      "Prefer": "resolution=merge-duplicates",
    },
    body: JSON.stringify({ week, company: "TOTAL", count }),
  });

  if (!res.ok) {
    const text = await res.text();
    throw new Error(`Supabase error ${res.status}: ${text}`);
  }
  console.log(`Upserted: week=${week}, count=${count}`);
}

scrape()
  .then(upsert)
  .then(() => console.log("Done."))
  .catch((e) => { console.error(e); process.exit(1); });
