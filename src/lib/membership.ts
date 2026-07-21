import { createClient } from "@/lib/supabase-server";

export async function getMembership(): Promise<{ user: { id: string; email?: string } | null; isMember: boolean }> {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();

  if (!user) return { user: null, isMember: false };

  const { data: profile } = await supabase
    .from("profiles")
    .select("is_member")
    .eq("id", user.id)
    .single();

  return { user, isMember: profile?.is_member ?? false };
}
