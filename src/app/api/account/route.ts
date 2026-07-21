import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase-server";
import { createServiceClient } from "@/lib/supabase-service";

export async function PATCH(req: NextRequest) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const { username, avatar_url, linkedin_url, github_url } = await req.json();

  const db = createServiceClient();
  await db.from("profiles").update({ username, avatar_url, linkedin_url, github_url }).eq("id", user.id);

  return NextResponse.json({ ok: true });
}
