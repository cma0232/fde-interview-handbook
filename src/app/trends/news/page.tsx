import type { Metadata } from "next";
import { createServiceClient } from "@/lib/supabase-service";

export const revalidate = 3600;

export const metadata: Metadata = {
  title: "FDE Industry News — Forward Deployed Engineer Updates",
  description: "Curated news on Forward Deployed Engineers, AI deployment, and the companies hiring FDEs.",
  alternates: { canonical: "https://fdehandbook.com/trends/news" },
};

type NewsItem = {
  id: number;
  url: string;
  title: string;
  description: string | null;
  og_image: string | null;
  source: string;
  published_at: string;
};

function timeAgo(dateStr: string) {
  const diff = Date.now() - new Date(dateStr).getTime();
  const days = Math.floor(diff / 86400000);
  const hours = Math.floor(diff / 3600000);
  if (days > 30) return new Date(dateStr).toLocaleDateString("en-US", { month: "short", day: "numeric", year: "numeric" });
  if (days > 0) return `${days}d ago`;
  if (hours > 0) return `${hours}h ago`;
  return "just now";
}

export default async function NewsPage() {
  const db = createServiceClient();
  const { data: items } = await db
    .from("fde_news")
    .select("id, url, title, description, og_image, source, published_at")
    .order("published_at", { ascending: false })
    .limit(50);

  const news: NewsItem[] = items ?? [];

  return (
    <main className="max-w-4xl mx-auto px-6 py-14">
      <div className="mb-10">
        <div className="text-xs text-gray-400 font-medium uppercase tracking-widest mb-2">Trends · Industry News</div>
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Industry News</h1>
      </div>

      {news.length === 0 ? (
        <div className="border rounded-2xl p-10 text-center text-gray-400">
          <div className="text-3xl mb-3">📰</div>
          <div className="font-medium text-gray-600 mb-1">No articles yet</div>
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
          {news.map((item) => (
            <a
              key={item.id}
              href={item.url}
              target="_blank"
              rel="noopener noreferrer"
              className="group flex flex-col rounded-2xl border overflow-hidden hover:shadow-lg transition-shadow"
            >
              {/* OG image */}
              <div className="h-44 bg-gray-100 overflow-hidden">
                {item.og_image ? (
                  <img
                    src={item.og_image}
                    alt={item.title}
                    className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                  />
                ) : (
                  <div className="w-full h-full flex items-center justify-center text-gray-300 text-4xl">📰</div>
                )}
              </div>

              {/* Content */}
              <div className="flex flex-col flex-1 p-4">
                <div className="text-xs text-gray-400 mb-1.5 flex items-center gap-2">
                  <span className="font-medium text-gray-500">{item.source}</span>
                  <span>·</span>
                  <span>{timeAgo(item.published_at)}</span>
                </div>
                <h2 className="text-sm font-semibold text-gray-900 leading-snug mb-2 group-hover:text-black line-clamp-2">
                  {item.title}
                </h2>
                {item.description && (
                  <p className="text-xs text-gray-500 leading-relaxed line-clamp-2 mt-auto">
                    {item.description}
                  </p>
                )}
              </div>
            </a>
          ))}
        </div>
      )}
    </main>
  );
}
