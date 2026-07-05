import { getEstablishedJobs, getFundedStartupJobs } from "@/lib/jobs";
import { createServiceClient } from "@/lib/supabase-service";
import FDETrendChart from "@/components/FDETrendChart";

export const revalidate = 3600;

async function getTrendData() {
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
}

export default async function OpenRolesPage() {
  const [established, funded, trendData] = await Promise.all([
    getEstablishedJobs(),
    getFundedStartupJobs(),
    getTrendData(),
  ]);

  const totalJobs = [...established, ...funded].reduce((sum, c) => sum + c.count, 0);

  return (
    <main className="max-w-4xl mx-auto px-6 py-14">
      <div className="mb-10">
        <div className="text-xs text-gray-400 font-medium uppercase tracking-widest mb-2">Trends · Open Roles</div>
        <h1 className="text-3xl font-bold text-gray-900 mb-2">FDE Job Market</h1>
        <p className="text-gray-500">
          {totalJobs}+ open Forward Deployed Engineer positions tracked weekly from public job boards.
        </p>
      </div>

      {/* Trend chart */}
      <div className="border rounded-2xl p-6 mb-10">
        <h2 className="text-sm font-semibold text-gray-500 uppercase tracking-widest mb-4">
          Weekly FDE openings
        </h2>
        <FDETrendChart data={trendData} />
        <p className="mt-3 text-xs text-gray-400">Updated every Monday · accumulating from {new Date().toLocaleDateString("en-US", { month: "long", year: "numeric" })}</p>
      </div>

      {/* Established */}
      <section className="mb-10">
        <h2 className="text-sm font-semibold uppercase tracking-widest text-gray-400 mb-4">
          Top companies
        </h2>
        <div className="grid grid-cols-2 sm:grid-cols-3 gap-4">
          {established.map((c) => (
            <a
              key={c.name}
              href={c.url}
              target="_blank"
              rel="noopener noreferrer"
              className="border rounded-xl p-5 hover:shadow-md transition-shadow group"
            >
              <div className="text-2xl font-bold text-gray-900 mb-1">{c.count}</div>
              <div className="text-xs text-gray-400 mb-2">open roles</div>
              <div className="text-sm font-medium text-gray-700 group-hover:text-gray-900">{c.name}</div>
            </a>
          ))}
        </div>
      </section>

      {/* Funded startups */}
      {funded.length > 0 && (
        <section>
          <h2 className="text-sm font-semibold uppercase tracking-widest text-gray-400 mb-4">
            Recently funded · hiring FDEs
          </h2>
          <div className="grid grid-cols-2 sm:grid-cols-3 gap-4">
            {funded.map((c) => (
              <a
                key={c.name}
                href={c.url}
                target="_blank"
                rel="noopener noreferrer"
                className="border rounded-xl p-5 hover:shadow-md transition-shadow group"
              >
                <div className="text-2xl font-bold text-gray-900 mb-1">{c.count}</div>
                <div className="text-xs text-gray-400 mb-2">open roles</div>
                <div className="text-sm font-medium text-gray-700 group-hover:text-gray-900">{c.name}</div>
                {c.funding && (
                  <div className="mt-2 text-xs text-emerald-600 font-medium">{c.funding}</div>
                )}
              </a>
            ))}
          </div>
        </section>
      )}
    </main>
  );
}
