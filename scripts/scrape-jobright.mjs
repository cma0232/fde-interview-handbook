/**
 * Scrape total FDE job count from jobright.ai and upsert into Supabase.
 * Run: node scripts/scrape-jobright.mjs
 * Schedule: GitHub Action runs daily at 9am UTC via .github/workflows/scrape-jobs.yml
 */

import { chromium } from "playwright";
import { writeFileSync } from "fs";

const SUPABASE_URL = "https://qkfkgpkcvrbrsgxkaedq.supabase.co";
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!SUPABASE_SERVICE_KEY) {
  console.error("Missing SUPABASE_SERVICE_ROLE_KEY env var");
  process.exit(1);
}

const TARGET_URL = "https://jobright.ai/jobs/forward-deployed-engineer-jobs-in-united-states";

async function scrape() {
  const browser = await chromium.launch({
    args: ["--no-sandbox", "--disable-setuid-sandbox"],
  });
  const page = await browser.newPage();

  // Mimic a real browser to reduce bot detection
  await page.setExtraHTTPHeaders({
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36",
  });

  try {
    try {
      await page.goto(TARGET_URL, { waitUntil: "domcontentloaded", timeout: 45000 });
    } catch (gotoErr) {
      // Save whatever the page has even if goto timed out
      const html = await page.content().catch(() => "<empty>");
      writeFileSync("/tmp/jobright-page.html", html);
      await page.screenshot({ path: "/tmp/jobright-screenshot.png", fullPage: true }).catch(() => {});
      console.error("page.goto failed:", gotoErr.message);
      throw gotoErr;
    }

    // Wait for any of the known count patterns
    const countSelectors = [
      "text=/\\d+\\s+results? for/i",
      "text=/\\d+\\s+jobs? found/i",
      "text=/\\d+\\s+open roles/i",
    ];

    let countText = null;
    for (const sel of countSelectors) {
      try {
        await page.waitForSelector(sel, { timeout: 20000 });
        countText = await page.locator(sel).first().textContent();
        console.log(`Found via selector "${sel}": ${countText}`);
        break;
      } catch {
        console.log(`Selector not found: ${sel}`);
      }
    }

    if (!countText) {
      // Dump page for debugging
      const html = await page.content();
      writeFileSync("/tmp/jobright-page.html", html);
      await page.screenshot({ path: "/tmp/jobright-screenshot.png", fullPage: true });
      console.error("No count selector matched. Saved /tmp/jobright-page.html and screenshot.");
      throw new Error("Could not find job count on page — check /tmp/jobright-page.html");
    }

    const match = countText.match(/[\d,]+/);
    if (!match) throw new Error(`Could not parse count from: "${countText}"`);

    const count = parseInt(match[0].replace(/,/g, ""), 10);
    console.log(`Scraped: ${count} jobs`);
    return count;
  } finally {
    await browser.close();
  }
}

async function upsert(count) {
  const week = new Date().toISOString().split("T")[0];

  const res = await fetch(`${SUPABASE_URL}/rest/v1/fde_job_snapshots?on_conflict=week,company`, {
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
