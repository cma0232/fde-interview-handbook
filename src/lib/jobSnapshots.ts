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
  const { data } = await db
    .from("fde_job_snapshots")
    .select("week, count")
    .eq("company", "TOTAL")
    .order("week", { ascending: true });

  if (!data || data.length === 0) return [];

  const byWeek = new Map<string, number>();
  for (const row of data) {
    const monday = getNextMonday(row.week);
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
