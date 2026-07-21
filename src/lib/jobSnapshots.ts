import { createServiceClient } from "@/lib/supabase-service";

// Return the Monday of the ISO week that dateStr falls in (Mon–Sun)
function getWeekMonday(dateStr: string): string {
  const d = new Date(dateStr);
  const day = d.getUTCDay(); // 0=Sun, 1=Mon … 6=Sat
  const diff = day === 0 ? -6 : 1 - day; // Sunday goes back 6 days, others back to Monday
  d.setUTCDate(d.getUTCDate() + diff);
  return d.toISOString().split("T")[0];
}

export async function getTrendData() {
  const db = createServiceClient();
  const { data } = await db
    .from("fde_job_snapshots")
    .select("week, count")
    .eq("company", "TOTAL")
    .order("week", { ascending: true });

  if (!data || data.length === 0) return [];

  const byWeek = new Map<string, number>();
  for (const row of data) {
    const monday = getWeekMonday(row.week);
    // If multiple rows in same week, keep the latest (highest count or last inserted)
    byWeek.set(monday, row.count);
  }

  const today = new Date().toISOString().split("T")[0];

  return Array.from(byWeek.entries())
    .filter(([week]) => week <= today)
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([week, total]) => ({ week, total }));
}

export async function getLatestJobCount(): Promise<number> {
  const db = createServiceClient();
  const { data } = await db
    .from("fde_job_snapshots")
    .select("count")
    .eq("company", "TOTAL")
    .order("week", { ascending: false })
    .limit(1);

  return data?.[0]?.count ?? 0;
}
