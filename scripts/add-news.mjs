/**
 * Add a news item by URL.
 * Usage: node scripts/add-news.mjs <url> [published_at]
 * Example: node scripts/add-news.mjs https://example.com/article "2026-07-13"
 */

const url = process.argv[2];
if (!url) { console.error("Usage: node scripts/add-news.mjs <url>"); process.exit(1); }

const publishedAt = process.argv[3] ?? new Date().toISOString();

const SUPABASE_URL = "https://sytaxalwtgbgvgrausas.supabase.co";
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
if (!SUPABASE_KEY) { console.error("Missing SUPABASE_SERVICE_ROLE_KEY"); process.exit(1); }

async function fetchOG(url) {
  const res = await fetch(url, {
    headers: { "User-Agent": "Mozilla/5.0 (compatible; fdehandbook-bot/1.0)" },
    redirect: "follow",
  });
  const html = await res.text();

  const get = (prop) => {
    const m = html.match(new RegExp(`<meta[^>]+(?:property|name)=["']${prop}["'][^>]+content=["']([^"']+)["']`, "i"))
      ?? html.match(new RegExp(`<meta[^>]+content=["']([^"']+)["'][^>]+(?:property|name)=["']${prop}["']`, "i"));
    return m?.[1] ?? null;
  };

  const titleMatch = html.match(/<title[^>]*>([^<]+)<\/title>/i);

  return {
    title: get("og:title") ?? titleMatch?.[1]?.trim() ?? url,
    description: get("og:description") ?? get("description") ?? null,
    og_image: get("og:image") ?? null,
    source: new URL(url).hostname.replace("www.", ""),
  };
}

async function insert(data) {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/fde_news?on_conflict=url`, {
    method: "POST",
    headers: {
      apikey: SUPABASE_KEY,
      Authorization: `Bearer ${SUPABASE_KEY}`,
      "Content-Type": "application/json",
      Prefer: "resolution=merge-duplicates",
    },
    body: JSON.stringify({ ...data, url, published_at: publishedAt }),
  });
  if (!res.ok) throw new Error(`Supabase error ${res.status}: ${await res.text()}`);
}

console.log(`Fetching OG data for: ${url}`);
fetchOG(url)
  .then(async (data) => {
    console.log("Title:      ", data.title);
    console.log("Description:", data.description);
    console.log("OG Image:   ", data.og_image);
    console.log("Source:     ", data.source);
    await insert(data);
    console.log("✓ Inserted into Supabase");
  })
  .catch((e) => { console.error(e); process.exit(1); });
