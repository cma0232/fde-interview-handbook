import { createServiceClient } from "@/lib/supabase-service";

function getNextMonday(dateStr: string): string {
  const d = new Date(dateStr);
  const day = d.getUTCDay();
  const diff = day === 0 ? 1 : 8 - day;
  d.setUTCDate(d.getUTCDate() + diff);
  return d.toISOString().split("T")[0];
}

export async function getTrendData() {
  const db = createServiceClient();
  // Sum all per-company rows per week (exclude the TOTAL aggregate row to avoid double-counting)
  const { data } = await db
    .from("fde_job_snapshots")
    .select("week, count")
    .neq("company", "TOTAL")
    .order("week", { ascending: true });

  if (!data || data.length === 0) return [];

  // Sum counts per week-Monday bucket
  const byWeek = new Map<string, number>();
  for (const row of data) {
    const monday = getNextMonday(row.week);
    byWeek.set(monday, (byWeek.get(monday) ?? 0) + row.count);
  }

  const today = new Date().toISOString().split("T")[0];

  return Array.from(byWeek.entries())
    .filter(([week]) => week <= today)
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([week, total]) => ({ week, total }));
}

export async function getLatestJobCount(): Promise<number> {
  const db = createServiceClient();
  // Sum all company counts for the latest week
  const { data: latestWeekData } = await db
    .from("fde_job_snapshots")
    .select("week")
    .neq("company", "TOTAL")
    .order("week", { ascending: false })
    .limit(1);

  if (!latestWeekData?.[0]) return 0;

  const latestWeek = latestWeekData[0].week;
  const { data } = await db
    .from("fde_job_snapshots")
    .select("count")
    .neq("company", "TOTAL")
    .eq("week", latestWeek);

  return data?.reduce((sum, r) => sum + r.count, 0) ?? 0;
}
