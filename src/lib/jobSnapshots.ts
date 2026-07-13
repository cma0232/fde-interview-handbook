import { unstable_cache } from "next/cache";
import { createServiceClient } from "@/lib/supabase-service";

function getNextMonday(dateStr: string): string {
  const d = new Date(dateStr);
  const day = d.getUTCDay();
  const diff = day === 0 ? 1 : 8 - day;
  d.setUTCDate(d.getUTCDate() + diff);
  return d.toISOString().split("T")[0];
}

export const getTrendData = unstable_cache(
  async () => {
    const db = createServiceClient();
    const { data } = await db
      .from("fde_job_snapshots")
      .select("week, count")
      .order("week", { ascending: true });

    if (!data || data.length === 0) return [];

    const byWeek = new Map<string, number[]>();
    for (const row of data) {
      const monday = getNextMonday(row.week);
      if (!byWeek.has(monday)) byWeek.set(monday, []);
      byWeek.get(monday)!.push(row.count);
    }

    const today = new Date().toISOString().split("T")[0];

    return Array.from(byWeek.entries())
      .filter(([week]) => week <= today)
      .sort(([a], [b]) => a.localeCompare(b))
      .map(([week, counts]) => ({
        week,
        total: Math.round(counts.reduce((s, c) => s + c, 0) / counts.length),
      }));
  },
  ["fde-trend-data"],
  { revalidate: 3600 } // 1 hour
);

export const getLatestJobCount = unstable_cache(
  async () => {
    const db = createServiceClient();
    const { data } = await db
      .from("fde_job_snapshots")
      .select("count")
      .eq("company", "TOTAL")
      .order("week", { ascending: false })
      .limit(1)
      .single();
    return data?.count ?? 0;
  },
  ["fde-latest-count"],
  { revalidate: 3600 } // 1 hour
);
