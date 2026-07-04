import Link from "next/link";
import { CATEGORIES } from "@/lib/categories";
import { getFDEJobs } from "@/lib/jobs";

export const revalidate = 3600;

export default async function HomePage() {
  const companies = await getFDEJobs();
  const totalJobs = companies.reduce((sum, c) => sum + c.count, 0);

  return (
    <main className="min-h-screen bg-white">
      {/* Hero */}
      <div className="border-b px-6 py-20 text-center">
        <div className="inline-block bg-gray-100 text-gray-600 text-xs font-medium px-3 py-1 rounded-full mb-4">
          {totalJobs}+ open FDE positions right now
        </div>
        <h1 className="text-4xl font-bold tracking-tight text-gray-900 max-w-2xl mx-auto leading-tight">
          Forward Deployed Engineer Interview Handbook
        </h1>
        <p className="mt-4 text-lg text-gray-500 max-w-xl mx-auto">
          The complete interview prep guide for FDE roles at Palantir, Databricks,
          Scale AI, Anduril, and beyond.
        </p>
        <div className="mt-8 flex gap-3 justify-center">
          <Link
            href="/practice"
            className="bg-gray-900 text-white text-sm font-medium px-6 py-3 rounded-lg hover:bg-gray-700 transition-colors"
          >
            Start practicing free →
          </Link>
          <Link
            href="/upgrade"
            className="border text-sm font-medium px-6 py-3 rounded-lg hover:bg-gray-50 transition-colors text-gray-700"
          >
            View plans
          </Link>
        </div>
      </div>

      {/* Live job market */}
      <div className="border-b px-6 py-14">
        <div className="max-w-4xl mx-auto">
          <div className="flex items-center gap-2 mb-2">
            <span className="w-2 h-2 rounded-full bg-green-500 animate-pulse" />
            <span className="text-xs text-gray-400 font-medium uppercase tracking-widest">Live hiring data</span>
          </div>
          <h2 className="text-xl font-bold text-gray-900 mb-8">
            Companies actively hiring FDEs
          </h2>
          <div className="grid grid-cols-2 sm:grid-cols-4 gap-4">
            {companies.map((c) => (
              <a
                key={c.name}
                href={c.url}
                target="_blank"
                rel="noopener noreferrer"
                className="border rounded-xl p-5 hover:shadow-md transition-shadow text-center group"
              >
                <div className="text-2xl font-bold text-gray-900 mb-1">{c.count}</div>
                <div className="text-xs text-gray-500 mb-2">open roles</div>
                <div className="text-sm font-medium text-gray-700 group-hover:text-gray-900">{c.name}</div>
              </a>
            ))}
          </div>
          <p className="mt-4 text-xs text-gray-400">
            Updated hourly from public job boards · {new Date().toLocaleDateString("en-US", { month: "long", year: "numeric" })}
          </p>
        </div>
      </div>

      {/* Categories */}
      <div className="max-w-4xl mx-auto px-6 py-14">
        <h2 className="text-sm font-semibold uppercase tracking-widest text-gray-400 mb-6">
          Practice by category
        </h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          {CATEGORIES.map((cat) => (
            <Link
              key={cat.id}
              href={`/practice/${cat.id}`}
              className={`border rounded-xl p-5 hover:shadow-md transition-shadow ${cat.color}`}
            >
              <div className="text-2xl mb-2">{cat.icon}</div>
              <div className="font-semibold text-base">{cat.label}</div>
              <div className="mt-1 text-sm opacity-75">{cat.description}</div>
            </Link>
          ))}
        </div>
      </div>
    </main>
  );
}
