import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase-server";
import { createServiceClient } from "@/lib/supabase-service";
import AccountForm from "./AccountForm";

export default async function AccountPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const db = createServiceClient();
  const { data: profile } = await db.from("profiles").select("*").eq("id", user.id).single();

  return (
    <main className="max-w-xl mx-auto px-6 py-12">
      <h1 className="text-xl font-bold text-gray-900 mb-8">My Account</h1>
      <AccountForm user={user} profile={profile} />
    </main>
  );
}
