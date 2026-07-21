export type SimpleCompany = { name: string; logo: string; url: string };

function favicon(domain: string) {
  return `https://www.google.com/s2/favicons?domain=${domain}&sz=128`;
}

// ─── Unicorn list (static, update quarterly) ──────────────────────────────────
// Source: TrueUp unicorn tracker + industry knowledge
export const UNICORNS: SimpleCompany[] = [
  // Big Tech
  { name: "Google",       logo: favicon("google.com"),       url: "https://careers.google.com/" },
  { name: "Stripe",       logo: favicon("stripe.com"),       url: "https://stripe.com/jobs" },
  { name: "Cloudflare",   logo: favicon("cloudflare.com"),   url: "https://www.cloudflare.com/careers/" },
  { name: "Datadog",      logo: favicon("datadoghq.com"),    url: "https://www.datadoghq.com/careers/" },
  { name: "MongoDB",      logo: favicon("mongodb.com"),      url: "https://www.mongodb.com/careers" },
  // AI frontier
  { name: "OpenAI",       logo: favicon("openai.com"),       url: "https://openai.com/careers" },
  { name: "Anthropic",    logo: favicon("anthropic.com"),    url: "https://www.anthropic.com/careers" },
  { name: "Databricks",   logo: favicon("databricks.com"),   url: "https://www.databricks.com/company/careers" },
  { name: "Palantir",     logo: favicon("palantir.com"),     url: "https://www.palantir.com/careers/" },
  { name: "Scale AI",     logo: favicon("scale.com"),        url: "https://scale.com/careers" },
  { name: "Anduril",      logo: favicon("anduril.com"),      url: "https://www.anduril.com/open-roles/" },
  { name: "Mistral AI",   logo: favicon("mistral.ai"),       url: "https://mistral.ai/careers" },
  { name: "Cohere",       logo: favicon("cohere.com"),       url: "https://cohere.com/careers" },
  { name: "Perplexity",   logo: favicon("perplexity.ai"),    url: "https://www.perplexity.ai/hub/careers" },
  { name: "Harvey",       logo: favicon("harvey.ai"),        url: "https://www.harvey.ai/careers" },
  { name: "Glean",        logo: favicon("glean.com"),        url: "https://www.glean.com/careers" },
  { name: "Sierra",       logo: favicon("sierra.ai"),        url: "https://sierra.ai/careers" },
  { name: "Cursor",       logo: favicon("cursor.com"),       url: "https://www.cursor.com/careers" },
  // Consumer / Productivity
  { name: "Figma",        logo: favicon("figma.com"),        url: "https://www.figma.com/careers/" },
  { name: "Notion",       logo: favicon("notion.so"),        url: "https://www.notion.so/careers" },
  { name: "Canva",        logo: favicon("canva.com"),        url: "https://www.canva.com/careers/" },
  // Fintech
  { name: "Brex",         logo: favicon("brex.com"),         url: "https://www.brex.com/careers" },
  { name: "Ramp",         logo: favicon("ramp.com"),         url: "https://ramp.com/careers" },
  { name: "Rippling",     logo: favicon("rippling.com"),     url: "https://www.rippling.com/careers" },
  // Security
  { name: "Wiz",          logo: favicon("wiz.io"),           url: "https://www.wiz.io/careers" },
  { name: "Verkada",      logo: favicon("verkada.com"),      url: "https://www.verkada.com/careers/" },
  // Dev tools
  { name: "Replit",       logo: favicon("replit.com"),       url: "https://replit.com/site/careers" },
  { name: "Intercom",     logo: favicon("intercom.com"),     url: "https://www.intercom.com/careers" },
];

export type CompanyJobs = {
  name: string;
  count: number;
  url: string;
  logo: string;
  funding?: string;
};

const FDE_KEYWORDS = [
  "forward deployed", "fde", "solutions engineer", "field engineer",
  "implementation engineer", "customer engineer", "applied ai engineer",
];

function isFDE(title: string) {
  return FDE_KEYWORDS.some((k) => title.toLowerCase().includes(k));
}

const ASHBY_QUERY = `query ApiJobBoardWithTeams($organizationHostedJobsPageName: String!) {
  jobBoard: jobBoardWithTeams(organizationHostedJobsPageName: $organizationHostedJobsPageName) {
    jobPostings { id title }
  }
}`;

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

async function fetchAshby(slug: string): Promise<number> {
  try {
    const res = await fetch(
      "https://jobs.ashbyhq.com/api/non-user-graphql?op=ApiJobBoardWithTeams",
      {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          operationName: "ApiJobBoardWithTeams",
          variables: { organizationHostedJobsPageName: slug },
          query: ASHBY_QUERY,
        }),
        next: { revalidate: 604800 },
      }
    );
    if (!res.ok) return 0;
    const data = await res.json();
    const jobs: { title: string }[] = data?.data?.jobBoard?.jobPostings ?? [];
    return jobs.filter((j) => isFDE(j.title)).length;
  } catch { return 0; }
}

async function fetchCount(platform: string, slug: string): Promise<number> {
  if (platform === "lever") return fetchLever(slug);
  if (platform === "ashby") return fetchAshby(slug);
  return fetchGreenhouse(slug);
}

// ─── Established companies ─────────────────────────────────────────────────────
const ESTABLISHED = [
  { name: "Palantir",   platform: "lever",      slug: "palantir",          url: "https://www.palantir.com/careers/",          logo: favicon("palantir.com") },
  { name: "Databricks", platform: "greenhouse",  slug: "databricks",        url: "https://www.databricks.com/company/careers", logo: favicon("databricks.com") },
  { name: "Scale AI",   platform: "greenhouse",  slug: "scaleai",           url: "https://scale.com/careers",                  logo: favicon("scale.com") },
  { name: "Anduril",    platform: "greenhouse",  slug: "andurilindustries", url: "https://www.anduril.com/open-roles/",         logo: favicon("anduril.com") },
  { name: "Cloudflare", platform: "greenhouse",  slug: "cloudflare",        url: "https://www.cloudflare.com/careers/",         logo: favicon("cloudflare.com") },
  { name: "MongoDB",    platform: "greenhouse",  slug: "mongodb",           url: "https://www.mongodb.com/careers",            logo: favicon("mongodb.com") },
  { name: "Datadog",    platform: "greenhouse",  slug: "datadog",           url: "https://www.datadoghq.com/careers/",          logo: favicon("datadoghq.com") },
  { name: "Stripe",     platform: "greenhouse",  slug: "stripe",            url: "https://stripe.com/jobs",                    logo: favicon("stripe.com") },
  { name: "Twilio",     platform: "greenhouse",  slug: "twilio",            url: "https://www.twilio.com/en-us/company/jobs",  logo: favicon("twilio.com") },
] as const;

// ─── Startups with FDE roles (no overlap with UNICORNS list above) ────────────
// funding field → highlighted card. Update quarterly.
const STARTUPS = [
  { name: "Monte Carlo",  platform: "ashby",       slug: "montecarlodata",  url: "https://www.montecarlodata.com/careers",   logo: favicon("montecarlodata.com"), funding: "Series D · $135M" },
  { name: "Outreach",     platform: "lever",       slug: "outreach",        url: "https://www.outreach.io/company/careers",  logo: favicon("outreach.io"),        funding: "Series G · $200M" },
  { name: "Vanta",        platform: "ashby",       slug: "vanta",           url: "https://www.vanta.com/careers",            logo: favicon("vanta.com"),          funding: "Series C · $150M" },
  { name: "Drata",        platform: "ashby",       slug: "drata",           url: "https://drata.com/about/careers",          logo: favicon("drata.com"),          funding: "Series C · $200M" },
  { name: "LangChain",    platform: "ashby",       slug: "langchain",       url: "https://www.langchain.com/careers",        logo: favicon("langchain.com"),      funding: "Series A · $25M" },
  { name: "Webflow",      platform: "greenhouse",  slug: "webflow",         url: "https://webflow.com/careers",              logo: favicon("webflow.com") },
  { name: "Pendo",        platform: "greenhouse",  slug: "pendo",           url: "https://www.pendo.io/careers/",            logo: favicon("pendo.io") },
  { name: "Datafold",     platform: "ashby",       slug: "datafold",        url: "https://www.datafold.com/careers",         logo: favicon("datafold.com") },
  { name: "Teleport",     platform: "ashby",       slug: "goteleport",      url: "https://goteleport.com/careers/",          logo: favicon("goteleport.com") },
  { name: "Cribl",        platform: "greenhouse",  slug: "cribl",           url: "https://cribl.io/careers/",                logo: favicon("cribl.io") },
  { name: "Fastly",       platform: "greenhouse",  slug: "fastly",          url: "https://www.fastly.com/about/careers",     logo: favicon("fastly.com") },
] as const;

export async function getEstablishedJobs(): Promise<CompanyJobs[]> {
  const counts = await Promise.all(ESTABLISHED.map((c) => fetchCount(c.platform, c.slug)));
  return ESTABLISHED.map((c, i) => ({ name: c.name, count: counts[i], url: c.url, logo: c.logo }))
    .filter((c) => c.count > 0);
}

export async function getStartupJobs(): Promise<CompanyJobs[]> {
  const counts = await Promise.all(STARTUPS.map((c) => fetchCount(c.platform, c.slug)));
  return STARTUPS.map((c, i) => ({
    name: c.name,
    count: counts[i],
    url: c.url,
    logo: c.logo,
    funding: "funding" in c ? c.funding : undefined,
  })).filter((c) => c.count > 0);
}

export async function getAllFDEJobs(): Promise<CompanyJobs[]> {
  const [established, startups] = await Promise.all([getEstablishedJobs(), getStartupJobs()]);
  return [...established, ...startups];
}

export const getFundedStartupJobs = getStartupJobs;
