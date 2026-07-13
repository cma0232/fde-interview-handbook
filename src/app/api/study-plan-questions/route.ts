import { NextRequest, NextResponse } from "next/server";
import { createServiceClient } from "@/lib/supabase-service";

export async function GET(req: NextRequest) {
  const idsParam = req.nextUrl.searchParams.get("ids");
  if (!idsParam) return NextResponse.json({ questions: [] });
  const ids = idsParam.split(",").filter(Boolean);
  if (!ids.length) return NextResponse.json({ questions: [] });

  const db = createServiceClient();
  const { data, error } = await db
    .from("questions")
    .select("id, category, title, difficulty, is_free")
    .in("id", ids)
    .eq("status", "published");

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  // Always return titles — paywall is enforced on the question detail page
  return NextResponse.json({ questions: data ?? [] });
}
