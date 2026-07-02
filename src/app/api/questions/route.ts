import { NextRequest, NextResponse } from "next/server";
import { createServiceClient } from "@/lib/supabase-service";
import { createClient } from "@/lib/supabase-server";

export async function GET(req: NextRequest) {
  const category = req.nextUrl.searchParams.get("category");
  if (!category) return NextResponse.json({ error: "missing category" }, { status: 400 });

  // Check membership
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
    .eq("category", category)
    .eq("status", "published")
    .order("id");

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  // For non-members, don't reveal title of locked questions
  const questions = (data ?? []).map((q) => ({
    ...q,
    title: q.is_free || isMember ? q.title : null,
  }));

  // Sort: free first for non-members
  if (!isMember) {
    questions.sort((a, b) => (b.is_free ? 1 : 0) - (a.is_free ? 1 : 0));
  }

  return NextResponse.json({ questions, isMember });
}
