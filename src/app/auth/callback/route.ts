import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";
import { NextResponse, type NextRequest } from "next/server";

export async function GET(request: NextRequest) {
  const { searchParams, origin } = new URL(request.url);
  const code = searchParams.get("code");

  if (code) {
    const cookieStore = await cookies();
    const supabase = createServerClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
      {
        cookies: {
          getAll() {
            return cookieStore.getAll();
          },
          setAll(cookiesToSet) {
            cookiesToSet.forEach(({ name, value, options }) =>
              cookieStore.set(name, value, options)
            );
          },
        },
      }
    );
    const { data } = await supabase.auth.exchangeCodeForSession(code);
    const user = data?.user;

    // Send welcome email to new users (check if profile existed before)
    if (user?.email) {
      const { createServiceClient } = await import("@/lib/supabase-service");
      const db = createServiceClient();
      const { data: profile } = await db.from("profiles").select("created_at").eq("id", user.id).single();
      const isNewUser = profile && (Date.now() - new Date(profile.created_at).getTime()) < 10000;

      if (isNewUser) {
        await fetch("https://api.resend.com/emails", {
          method: "POST",
          headers: {
            "Authorization": `Bearer ${process.env.RESEND_API_KEY}`,
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            from: "FDE Handbook <onboarding@resend.dev>",
            to: user.email,
            subject: "Welcome to FDE Handbook 👋",
            text: `Hi there!\n\nWelcome to FDE Handbook — your go-to resource for Forward Deployed Engineer interviews.\n\nYou now have access to free practice questions across SQL, Python, Statistics, ML, and more.\n\nReady to start? https://www.fdehandbook.com/practice\n\nQuestions? Reply to this email anytime.\n\n— FDE Handbook`,
          }),
        });
      }
    }
  }

  return NextResponse.redirect(`${origin}/practice`);
}
