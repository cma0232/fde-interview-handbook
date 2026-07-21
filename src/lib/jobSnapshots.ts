import { createServiceClient } from "@/lib/supabase-service";

export async function getTrendData() {
  const db = createServiceClient();
  const { data } = await db
    .from("fde_job_snapshots")
    .select("week, count")
    .eq("company", "TOTAL")
    .order("week", { ascending: true });

  if (!data || data.length === 0) return [];

  // Each TOTAL row is one data point — no bucketing needed
  return data.map((row) => ({ week: row.week, total: row.count }));
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
