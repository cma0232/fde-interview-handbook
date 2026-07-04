export type CompanyJobs = {
  name: string;
  logo: string;
  count: number;
  url: string;
};

const FDE_KEYWORDS = ["forward deployed", "fde", "solutions engineer", "field engineer", "applied ai engineer"];

function isFDE(title: string) {
  const lower = title.toLowerCase();
  return FDE_KEYWORDS.some((k) => lower.includes(k));
}

async function fetchGreenhouse(slug: string): Promise<number> {
  try {
    const res = await fetch(
      `https://boards-api.greenhouse.io/v1/boards/${slug}/jobs`,
      { next: { revalidate: 3600 } }
    );
    if (!res.ok) return 0;
    const data = await res.json();
    return (data.jobs ?? []).filter((j: { title: string }) => isFDE(j.title)).length;
  } catch {
    return 0;
  }
}

async function fetchLever(slug: string): Promise<number> {
  try {
    const res = await fetch(
      `https://api.lever.co/v0/postings/${slug}?mode=json`,
      { next: { revalidate: 3600 } }
    );
    if (!res.ok) return 0;
    const data = await res.json();
    return (data as { text: string }[]).filter((j) => isFDE(j.text)).length;
  } catch {
    return 0;
  }
}

export async function getFDEJobs(): Promise<CompanyJobs[]> {
  const [palantir, databricks, scaleai, anduril] = await Promise.all([
    fetchLever("palantir"),
    fetchGreenhouse("databricks"),
    fetchGreenhouse("scaleai"),
    fetchGreenhouse("andurilindustries"),
  ]);

  return [
    { name: "Palantir", logo: "/logos/palantir.svg", count: palantir, url: "https://www.palantir.com/careers/" },
    { name: "Databricks", logo: "/logos/databricks.svg", count: databricks, url: "https://www.databricks.com/company/careers" },
    { name: "Scale AI", logo: "/logos/scaleai.svg", count: scaleai, url: "https://scale.com/careers" },
    { name: "Anduril", logo: "/logos/anduril.svg", count: anduril, url: "https://www.anduril.com/open-roles/" },
  ].filter((c) => c.count > 0);
}
