import { NextRequest, NextResponse } from "next/server";
import { createServiceClient } from "@/lib/supabase-service";
import { createClient } from "@/lib/supabase-server";

export async function GET(req: NextRequest) {
  const idsParam = req.nextUrl.searchParams.get("ids");
  if (!idsParam) return NextResponse.json({ questions: [] });
  const ids = idsParam.split(",").filter(Boolean);
  if (!ids.length) return NextResponse.json({ questions: [] });

  // Check membership to decide whether to reveal paid question titles
  const userClient = await createClient();
  const { data: { user } } = await userClient.auth.getUser();
  let isMember = false;
  if (user) {
    const { data: profile } = await userClient.from("profiles").select("is_member").eq("id", user.id).single();
    isMember = profile?.is_member ?? false;
  }

  const db = createServiceClient();
  const { data, error } = await db
    .from("questions")
    .select("id, category, title, difficulty, is_free")
    .in("id", ids)
    .eq("status", "published");

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  const questions = (data ?? []).map((q) => ({
    id: q.id,
    category: q.category,
    difficulty: q.difficulty,
    is_free: q.is_free,
    title: q.is_free || isMember ? q.title : null,
  }));

  return NextResponse.json({ questions });
}
