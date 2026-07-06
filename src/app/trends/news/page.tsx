import type { Metadata } from "next";
import { createServiceClient } from "@/lib/supabase-service";

export const revalidate = 3600;

export const metadata: Metadata = {
  title: "FDE Industry News — Daily AI Deployment Updates",
  description: "Daily news on Forward Deployed Engineers, AI deployment, and the companies hiring FDEs. Stay current on the FDE job market.",
  alternates: { canonical: "https://fdehandbook.com/trends/news" },
};

type NewsItem = {
  hn_id: string;
  title: string;
  url: string;
  author: string;
  points: number;
  comments: number;
  published_at: string;
};

async function fetchLiveHN(): Promise<NewsItem[]> {
  const queries = ['"forward deployed engineer"', '"forward deployed" engineer'];
  const seen = new Set<string>();
  const results: NewsItem[] = [];

  await Promise.all(
    queries.map(async (q) => {
      try {
        const res = await fetch(
          `https://hn.algolia.com/api/v1/search_by_date?query=${encodeURIComponent(q)}&tags=story&hitsPerPage=15`,
          { next: { revalidate: 3600 } }
        );
        if (!res.ok) return;
        const data = await res.json();
        for (const h of data.hits ?? []) {
          if (!seen.has(h.objectID)) {
            seen.add(h.objectID);
            results.push({
              hn_id: h.objectID,
              title: h.title,
              url: h.url ?? `https://news.ycombinator.com/item?id=${h.objectID}`,
              author: h.author,
              points: h.points ?? 0,
              comments: h.num_comments ?? 0,
              published_at: h.created_at,
            });
          }
        }
      } catch { /* ignore */ }
    })
  );

  return results.sort(
    (a, b) => new Date(b.published_at).getTime() - new Date(a.published_at).getTime()
  );
}

function timeAgo(dateStr: string) {
  const diff = Date.now() - new Date(dateStr).getTime();
  const days = Math.floor(diff / 86400000);
  const hours = Math.floor(diff / 3600000);
  if (days > 0) return `${days}d ago`;
  if (hours > 0) return `${hours}h ago`;
  return "just now";
}

function domain(url: string) {
  try { return new URL(url).hostname.replace("www.", ""); }
  catch { return "ycombinator.com"; }
}

export default async function NewsPage() {
  const db = createServiceClient();
  const { data: dbRows } = await db
    .from("fde_news")
    .select("hn_id, title, url, author, points, comments, published_at")
    .order("published_at", { ascending: false })
    .limit(40);

  const items: NewsItem[] = (dbRows && dbRows.length > 0) ? dbRows : await fetchLiveHN();

  return (
    <main className="max-w-3xl mx-auto px-6 py-14">
      <div className="mb-10">
        <div className="text-xs text-gray-400 font-medium uppercase tracking-widest mb-2">Trends · Industry News</div>
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Industry News</h1>
        <p className="text-gray-500">
          FDE and AI deployment stories surfaced daily from Hacker News and the web.
        </p>
      </div>

      {items.length === 0 ? (
        <div className="border rounded-2xl p-10 text-center text-gray-400">
          <div className="text-3xl mb-3">📰</div>
          <div className="font-medium text-gray-600 mb-1">No stories yet</div>
          <div className="text-sm">Check back tomorrow after the first daily snapshot runs.</div>
        </div>
      ) : (
        <div className="divide-y border rounded-2xl overflow-hidden">
          {items.map((item, i) => (
            <a
              key={item.hn_id}
              href={item.url}
              target="_blank"
              rel="noopener noreferrer"
              className="flex gap-4 px-5 py-4 hover:bg-gray-50 transition-colors group"
            >
              <div className="text-sm text-gray-300 font-mono w-5 shrink-0 pt-0.5">{i + 1}</div>
              <div className="min-w-0 flex-1">
                <div className="text-sm font-medium text-gray-900 group-hover:text-black leading-snug mb-1">
                  {item.title}
                </div>
                <div className="flex items-center gap-3 text-xs text-gray-400">
                  <span className="text-gray-500">{domain(item.url)}</span>
                  <span>·</span>
                  <span>{item.points} pts</span>
                  <span>·</span>
                  <span>{item.comments} comments</span>
                  <span>·</span>
                  <span>{timeAgo(item.published_at)}</span>
                </div>
              </div>
              <svg className="w-4 h-4 text-gray-300 group-hover:text-gray-500 shrink-0 mt-1 transition-colors" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
              </svg>
            </a>
          ))}
        </div>
      )}

      <p className="mt-6 text-xs text-gray-400 text-center">
        Sourced from Hacker News · updated daily
      </p>
    </main>
  );
}
