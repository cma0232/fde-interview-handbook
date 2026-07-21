import { NextRequest, NextResponse } from "next/server";
import { createServiceClient } from "@/lib/supabase-service";

const QUERIES = [
  '"forward deployed engineer"',
  '"forward deployed" engineer',
  "palantir FDE deployment",
  "databricks field engineer",
  "AI deployment enterprise engineer",
];

type HNHit = {
  objectID: string;
  title: string;
  url?: string;
  author: string;
  created_at: string;
  points: number;
  num_comments: number;
};

async function fetchHN(query: string): Promise<HNHit[]> {
  try {
    const res = await fetch(
      `https://hn.algolia.com/api/v1/search_by_date?query=${encodeURIComponent(query)}&tags=story&hitsPerPage=10&numericFilters=points>2`
    );
    if (!res.ok) return [];
    const data = await res.json();
    return data.hits ?? [];
  } catch { return []; }
}

export async function POST(req: NextRequest) {
  const auth = req.headers.get("authorization");
  if (auth !== `Bearer ${process.env.CRON_SECRET}`) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const allHits = (await Promise.all(QUERIES.map(fetchHN))).flat();

  // Dedupe by objectID
  const seen = new Set<string>();
  const unique = allHits.filter((h) => {
    if (seen.has(h.objectID)) return false;
    seen.add(h.objectID);
    return true;
  });

  const rows = unique.map((h) => ({
    hn_id: h.objectID,
    title: h.title,
    url: h.url ?? `https://news.ycombinator.com/item?id=${h.objectID}`,
    author: h.author,
    points: h.points ?? 0,
    comments: h.num_comments ?? 0,
    published_at: h.created_at,
    fetched_date: new Date().toISOString().split("T")[0],
  }));

  const db = createServiceClient();
  const { error } = await db
    .from("fde_news")
    .upsert(rows, { onConflict: "hn_id" });

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  return NextResponse.json({ ok: true, count: rows.length });
}
