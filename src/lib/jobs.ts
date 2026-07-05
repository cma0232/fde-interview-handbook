export type CompanyJobs = {
  name: string;
  count: number;
  url: string;
  logo: string;
  funding?: string;
};

const FDE_KEYWORDS = ["forward deployed", "fde", "solutions engineer", "field engineer", "applied ai engineer"];

function isFDE(title: string) {
  return FDE_KEYWORDS.some((k) => title.toLowerCase().includes(k));
}

async function fetchGreenhouse(slug: string): Promise<number> {
  try {
    const res = await fetch(`https://boards-api.greenhouse.io/v1/boards/${slug}/jobs`, {
      next: { revalidate: 604800 },
    });
    if (!res.ok) return 0;
    const data = await res.json();
    return (data.jobs ?? []).filter((j: { title: string }) => isFDE(j.title)).length;
  } catch { return 0; }
}

async function fetchLever(slug: string): Promise<number> {
  try {
    const res = await fetch(`https://api.lever.co/v0/postings/${slug}?mode=json`, {
      next: { revalidate: 604800 },
    });
    if (!res.ok) return 0;
    const data = await res.json();
    return (data as { text: string }[]).filter((j) => isFDE(j.text)).length;
  } catch { return 0; }
}

function favicon(domain: string) {
  return `https://www.google.com/s2/favicons?domain=${domain}&sz=128`;
}

// ─── Established companies ────────────────────────────────────────────────────
const ESTABLISHED = [
  { name: "Palantir",   platform: "lever",      slug: "palantir",          url: "https://www.palantir.com/careers/",          logo: favicon("palantir.com") },
  { name: "Databricks", platform: "greenhouse",  slug: "databricks",        url: "https://www.databricks.com/company/careers", logo: favicon("databricks.com") },
  { name: "Scale AI",   platform: "greenhouse",  slug: "scaleai",           url: "https://scale.com/careers",                  logo: favicon("scale.com") },
  { name: "Anduril",    platform: "greenhouse",  slug: "andurilindustries", url: "https://www.anduril.com/open-roles/",         logo: favicon("anduril.com") },
  { name: "Cloudflare", platform: "greenhouse",  slug: "cloudflare",        url: "https://www.cloudflare.com/careers/",         logo: favicon("cloudflare.com") },
  { name: "MongoDB",    platform: "greenhouse",  slug: "mongodb",           url: "https://www.mongodb.com/careers",            logo: favicon("mongodb.com") },
  { name: "Datadog",    platform: "greenhouse",  slug: "datadog",           url: "https://www.datadoghq.com/careers/",          logo: favicon("datadoghq.com") },
] as const;

// ─── Recently funded B+ startups (update quarterly) ───────────────────────────
const FUNDED_STARTUPS = [
  { name: "Mistral AI", platform: "lever",      slug: "mistral",    url: "https://mistral.ai/careers",              logo: favicon("mistral.ai"),    funding: "Series B · $1B+" },
  { name: "Verkada",    platform: "greenhouse",  slug: "verkada",    url: "https://www.verkada.com/careers/",         logo: favicon("verkada.com"),   funding: "Series D · $205M" },
] as const;

async function fetchCount(platform: string, slug: string): Promise<number> {
  return platform === "lever" ? fetchLever(slug) : fetchGreenhouse(slug);
}

export async function getEstablishedJobs(): Promise<CompanyJobs[]> {
  const counts = await Promise.all(ESTABLISHED.map((c) => fetchCount(c.platform, c.slug)));
  return ESTABLISHED.map((c, i) => ({ name: c.name, count: counts[i], url: c.url, logo: c.logo })).filter((c) => c.count > 0);
}

export async function getFundedStartupJobs(): Promise<CompanyJobs[]> {
  const counts = await Promise.all(FUNDED_STARTUPS.map((c) => fetchCount(c.platform, c.slug)));
  return FUNDED_STARTUPS.map((c, i) => ({ name: c.name, count: counts[i], url: c.url, logo: c.logo, funding: c.funding })).filter((c) => c.count > 0);
}

export async function getAllFDEJobs(): Promise<CompanyJobs[]> {
  const [established, funded] = await Promise.all([getEstablishedJobs(), getFundedStartupJobs()]);
  return [...established, ...funded];
}
