import type { Metadata } from "next";
import Link from "next/link";
import { unstable_cache } from "next/cache";

export const metadata: Metadata = {
  title: "FDE Interview Handbook — Forward Deployed Engineer Prep",
  description: "2,186+ open FDE positions. The complete interview prep guide for Forward Deployed Engineer roles at Palantir, Databricks, Scale AI, Anduril, and beyond.",
  alternates: { canonical: "https://fdehandbook.com" },
};

import { getStartupJobs, UNICORNS } from "@/lib/jobs";

const jsonLd = {
  "@context": "https://schema.org",
  "@type": "WebSite",
  name: "FDE Interview Handbook",
  url: "https://fdehandbook.com",
  description: "The complete interview prep guide for Forward Deployed Engineer roles.",
  potentialAction: {
    "@type": "SearchAction",
    target: "https://fdehandbook.com/practice",
    "query-input": "required name=search_term_string",
  },
};
import { createServiceClient } from "@/lib/supabase-service";
import FDETrendChart from "@/components/FDETrendChart";
import CompanyTicker, { UnicornTicker } from "@/components/CompanyTicker";

export const revalidate = 3600;

const getTrendData = unstable_cache(
  async () => {
    const db = createServiceClient();
    const { data } = await db
      .from("fde_job_snapshots")
      .select("week, count")
      .order("week", { ascending: true });

    if (!data || data.length === 0) return [];

    const byWeek = new Map<string, number>();
    for (const row of data) {
      byWeek.set(row.week, (byWeek.get(row.week) ?? 0) + row.count);
    }

    return Array.from(byWeek.entries()).map(([week, total]) => ({ week, total }));
  },
  ["fde-trend-data"],
  { revalidate: 259200 } // 3 days
);

export default async function HomePage() {
  const [startups, trendData] = await Promise.all([
    getStartupJobs(),
    getTrendData(),
  ]);

  return (
    <>
    <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
    <main className="min-h-screen bg-white">
      {/* Hero */}
      <div className="border-b px-6 py-20 text-center">
        <div className="inline-flex items-center gap-2 bg-gray-100 border border-gray-200 text-gray-700 text-sm font-semibold px-4 py-1.5 rounded-full mb-6">
          <span className="w-2 h-2 rounded-full bg-green-500 animate-pulse" />
          2,186+ open FDE positions right now
        </div>
        <h1 className="text-5xl font-extrabold tracking-tight text-gray-900 max-w-3xl mx-auto leading-tight">
          <mark className="bg-yellow-200 px-2 rounded-md">Forward Deployed Engineer</mark>{" "}
          Interview Handbook
        </h1>
        <p className="mt-6 text-xl text-gray-500 max-w-2xl mx-auto leading-relaxed">
          The only prep guide built for FDE interviews — agentic system design,
          live demo rounds, customer-facing scenarios, and LLM deployment questions.
        </p>
        <div className="mt-9 flex gap-3 justify-center flex-wrap">
          <Link
            href="/practice"
            className="bg-gray-900 text-white text-base font-semibold px-7 py-3.5 rounded-xl hover:bg-gray-700 transition-colors"
          >
            Start practicing free →
          </Link>
          <a
            href="https://discord.gg/GnUdge3k3"
            target="_blank"
            rel="noopener noreferrer"
            className="bg-indigo-600 text-white text-base font-semibold px-7 py-3.5 rounded-xl hover:bg-indigo-500 transition-colors flex items-center gap-2"
          >
            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M20.317 4.37a19.791 19.791 0 0 0-4.885-1.515.074.074 0 0 0-.079.037c-.21.375-.444.864-.608 1.25a18.27 18.27 0 0 0-5.487 0 12.64 12.64 0 0 0-.617-1.25.077.077 0 0 0-.079-.037A19.736 19.736 0 0 0 3.677 4.37a.07.07 0 0 0-.032.027C.533 9.046-.32 13.58.099 18.057a.082.082 0 0 0 .031.057 19.9 19.9 0 0 0 5.993 3.03.078.078 0 0 0 .084-.028c.462-.63.874-1.295 1.226-1.994a.076.076 0 0 0-.041-.106 13.107 13.107 0 0 1-1.872-.892.077.077 0 0 1-.008-.128 10.2 10.2 0 0 0 .372-.292.074.074 0 0 1 .077-.01c3.928 1.793 8.18 1.793 12.062 0a.074.074 0 0 1 .078.01c.12.098.246.198.373.292a.077.077 0 0 1-.006.127 12.299 12.299 0 0 1-1.873.892.077.077 0 0 0-.041.107c.36.698.772 1.362 1.225 1.993a.076.076 0 0 0 .084.028 19.839 19.839 0 0 0 6.002-3.03.077.077 0 0 0 .032-.054c.5-5.177-.838-9.674-3.549-13.66a.061.061 0 0 0-.031-.03zM8.02 15.33c-1.183 0-2.157-1.085-2.157-2.419 0-1.333.956-2.419 2.157-2.419 1.21 0 2.176 1.096 2.157 2.42 0 1.333-.956 2.418-2.157 2.418zm7.975 0c-1.183 0-2.157-1.085-2.157-2.419 0-1.333.955-2.419 2.157-2.419 1.21 0 2.176 1.096 2.157 2.42 0 1.333-.946 2.418-2.157 2.418z"/></svg>
            Join Discord
          </a>
          <Link
            href="/upgrade"
            className="border border-gray-300 text-base font-semibold px-7 py-3.5 rounded-xl hover:bg-gray-50 transition-colors text-gray-700"
          >
            View plans
          </Link>
        </div>
      </div>

      {/* FDE Market Trend */}
      <div className="border-b px-6 py-14">
        <div className="max-w-4xl mx-auto">
          <div className="flex items-center gap-2 mb-2">
            <span className="w-2 h-2 rounded-full bg-green-500 animate-pulse" />
            <span className="text-sm text-gray-400 font-medium uppercase tracking-widest">FDE job market</span>
          </div>
          <h2 className="text-2xl font-bold tracking-tight text-gray-900 mb-6">
            Weekly FDE openings
          </h2>
          <FDETrendChart data={trendData} />
          <p className="mt-3 text-sm text-gray-400">
            Tracked weekly from public job boards · updated every Monday
          </p>
        </div>
      </div>

      {/* Who's hiring FDEs */}
      <div className="pt-14 px-6">
        <div className="max-w-4xl mx-auto">
          <div className="text-sm text-gray-400 font-medium uppercase tracking-widest mb-3">
            Live hiring data
          </div>
          <h2 className="text-4xl font-extrabold tracking-tight text-gray-900">
            Who&apos;s hiring FDEs{" "}
            <mark className="bg-yellow-200 px-2 rounded-md">right now</mark>
          </h2>
          <p className="text-base text-gray-500 mt-3">
            Open-role counts pulled weekly from public job boards.
          </p>
        </div>
      </div>

      {/* Unicorns */}
      <div className="border-b py-12">
        <div className="max-w-4xl mx-auto px-6 mb-6">
          <h2 className="text-2xl font-bold tracking-tight text-gray-900">Top Tech &amp; Frontier Labs</h2>
          <p className="text-base text-gray-400 mt-1">The companies defining what AI deployment looks like</p>
        </div>
        <UnicornTicker companies={UNICORNS} />
      </div>

      {/* Startups */}
      {startups.length > 0 && (
        <div className="border-b py-14">
          <div className="max-w-4xl mx-auto px-6 mb-6">
            <div className="flex items-center gap-2 mb-2">
              <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
              <span className="text-sm text-gray-400 font-medium uppercase tracking-widest">Startups</span>
            </div>
            <h2 className="text-2xl font-bold tracking-tight text-gray-900">Startups</h2>
            <p className="text-base text-gray-400 mt-1">
              Startups with open FDE roles · <span className="text-emerald-600 font-medium">green badge</span> = recently raised B+ round
            </p>
          </div>
          <CompanyTicker companies={startups} />
        </div>
      )}

      {/* Start here CTA */}
      <div className="max-w-4xl mx-auto px-6 py-16">
        <div className="border border-gray-200 rounded-2xl px-8 py-14 text-center bg-white shadow-sm">
          <h2 className="text-3xl font-extrabold tracking-tight text-gray-900">Ready to prep?</h2>
          <p className="mt-4 text-lg text-gray-500 max-w-lg mx-auto leading-relaxed">
            <mark className="bg-yellow-200 px-1.5 rounded-md font-semibold text-gray-900">195 curated questions</mark>{" "}
            across behavioral, system design, coding, GenAI architecture, and
            customer-facing case studies.
          </p>
          <Link
            href="/practice"
            className="mt-8 inline-block bg-gray-900 text-white text-base font-semibold px-8 py-3.5 rounded-xl hover:bg-gray-700 transition-colors"
          >
            Start here →
          </Link>
        </div>
      </div>
    </main>
    </>
  );
}
