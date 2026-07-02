import { NextRequest, NextResponse } from "next/server";
import { createServiceClient } from "@/lib/supabase-service";
import { createClient } from "@/lib/supabase-server";

export async function GET(
  _req: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const { id } = await params;

  // Check membership
  const userClient = await createClient();
  const { data: { user } } = await userClient.auth.getUser();
  let isMember = false;
  if (user) {
    const { data: profile } = await userClient.from("profiles").select("is_member").eq("id", user.id).single();
    isMember = profile?.is_member ?? false;
  }

  const db = createServiceClient();
  const { data: question, error } = await db
    .from("questions")
    .select("*")
    .eq("id", id)
    .eq("status", "published")
    .single();

  if (error || !question) return NextResponse.json({ error: "not found" }, { status: 404 });

  const locked = !question.is_free && !isMember;

  if (locked) {
    return NextResponse.json({
      id: question.id,
      category: question.category,
      difficulty: question.difficulty,
      is_free: false,
      locked: true,
      isMember: false,
    });
  }

  return NextResponse.json({ ...question, locked: false, isMember });
}
