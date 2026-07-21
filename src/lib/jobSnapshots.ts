import { createServiceClient } from "@/lib/supabase-service";

// Maps any date to the next Monday — daily snapshots are treated as that week's Sunday,
// and the chart shows each Monday with the previous week's average.
function getNextMonday(dateStr: string): string {
  const d = new Date(dateStr + "T12:00:00Z"); // noon UTC to avoid timezone shift
  const day = d.getUTCDay(); // 0=Sun … 6=Sat
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

  // Average multiple readings that fall in the same week bucket
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
