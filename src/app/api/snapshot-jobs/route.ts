import { NextRequest, NextResponse } from "next/server";
import { createServiceClient } from "@/lib/supabase-service";
import { getAllFDEJobs } from "@/lib/jobs";

export async function POST(req: NextRequest) {
  // Protect with a secret so only Vercel cron can call it
  const auth = req.headers.get("authorization");
  if (auth !== `Bearer ${process.env.CRON_SECRET}`) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const companies = await getAllFDEJobs();
  const week = new Date().toISOString().split("T")[0]; // YYYY-MM-DD of Monday

  const db = createServiceClient();
  const rows = companies.map((c) => ({
    week,
    company: c.name,
    count: c.count,
  }));

  // Upsert to avoid duplicates if run multiple times in same week
  const { error } = await db
    .from("fde_job_snapshots")
    .upsert(rows, { onConflict: "week,company" });

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  return NextResponse.json({ ok: true, week, rows });
}
