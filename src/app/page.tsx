import Link from "next/link";
import { getEstablishedJobs, getFundedStartupJobs } from "@/lib/jobs";
import { createServiceClient } from "@/lib/supabase-service";
import FDETrendChart from "@/components/FDETrendChart";
import CompanyTicker from "@/components/CompanyTicker";

export const revalidate = 3600;

async function getTrendData() {
  const db = createServiceClient();
  const { data } = await db
    .from("fde_job_snapshots")
    .select("week, count")
    .order("week", { ascending: true });

  if (!data || data.length === 0) return [];

  // Aggregate total per week
  const byWeek = new Map<string, number>();
  for (const row of data) {
    byWeek.set(row.week, (byWeek.get(row.week) ?? 0) + row.count);
  }

  return Array.from(byWeek.entries()).map(([week, total]) => ({ week, total }));
}

export default async function HomePage() {
  const [established, funded, trendData] = await Promise.all([
    getEstablishedJobs(),
    getFundedStartupJobs(),
    getTrendData(),
  ]);

  const totalJobs = [...established, ...funded].reduce((sum, c) => sum + c.count, 0);

  return (
    <main className="min-h-screen bg-white">
      {/* Hero */}
      <div className="border-b px-6 py-20 text-center">
        <div className="inline-flex items-center gap-2 bg-gray-100 border border-gray-200 text-gray-700 text-sm font-semibold px-4 py-1.5 rounded-full mb-6">
          <span className="w-2 h-2 rounded-full bg-green-500 animate-pulse" />
          {totalJobs}+ open FDE positions right now
        </div>
        <h1 className="text-5xl font-extrabold tracking-tight text-gray-900 max-w-3xl mx-auto leading-tight">
          <mark className="bg-yellow-200 px-2 rounded-md">Forward Deployed Engineer</mark>{" "}
          Interview Handbook
        </h1>
        <p className="mt-6 text-xl text-gray-500 max-w-2xl mx-auto leading-relaxed">
          The complete interview prep guide for FDE roles at Palantir, Databricks,
          Scale AI, Anduril, and beyond.
        </p>
        <div className="mt-9 flex gap-3 justify-center">
          <Link
            href="/practice"
            className="bg-gray-900 text-white text-base font-semibold px-7 py-3.5 rounded-xl hover:bg-gray-700 transition-colors"
          >
            Start practicing free →
          </Link>
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

      {/* Established companies */}
      <div className="border-b py-12">
        <div className="max-w-4xl mx-auto px-6 mb-6">
          <div className="flex items-center gap-2 mb-2">
            <span className="w-2 h-2 rounded-full bg-green-500 animate-pulse" />
            <span className="text-sm text-gray-400 font-medium uppercase tracking-widest">Live</span>
          </div>
          <h2 className="text-2xl font-bold tracking-tight text-gray-900">Top Tech &amp; Unicorns</h2>
          <p className="text-base text-gray-400 mt-1">Established tech companies and unicorn startups</p>
        </div>
        <CompanyTicker companies={established} />
      </div>

      {/* Recently funded startups */}
      {funded.length > 0 && (
        <div className="border-b py-14">
          <div className="max-w-4xl mx-auto px-6 mb-6">
            <div className="flex items-center gap-2 mb-2">
              <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
              <span className="text-sm text-gray-400 font-medium uppercase tracking-widest">Fresh funding</span>
            </div>
            <h2 className="text-2xl font-bold tracking-tight text-gray-900">Recently Funded Growth Startups</h2>
            <p className="text-base text-gray-400 mt-1">Series B+ startups with fresh capital</p>
          </div>
          <CompanyTicker companies={funded} reverse />
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
  );
}
