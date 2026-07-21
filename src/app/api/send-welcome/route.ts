import { NextRequest, NextResponse } from "next/server";
import { createServiceClient } from "@/lib/supabase-service";

export async function POST(req: NextRequest) {
  const { userId, email } = await req.json();
  if (!userId || !email) return NextResponse.json({ ok: false });

  const db = createServiceClient();
  const { data: profile } = await db
    .from("profiles")
    .select("welcome_email_sent")
    .eq("id", userId)
    .single();

  if (profile?.welcome_email_sent) return NextResponse.json({ ok: true, skipped: true });

  await db.from("profiles").update({ welcome_email_sent: true }).eq("id", userId);

  const html = [
    "<div style='font-family:sans-serif;max-width:520px;margin:0 auto;padding:40px 20px'>",
    "<div style='background:#111827;border-radius:12px 12px 0 0;padding:28px 32px'>",
    "<p style='margin:0;color:#fff;font-size:18px;font-weight:700'>FDE Handbook</p>",
    "<p style='margin:4px 0 0;color:#9ca3af;font-size:13px'>Forward Deployed Engineer Interview Prep</p>",
    "</div>",
    "<div style='border:1px solid #e5e7eb;border-top:none;border-radius:0 0 12px 12px;padding:32px'>",
    "<h1 style='margin:0 0 16px;font-size:22px;font-weight:700;color:#111827'>Welcome aboard!</h1>",
    "<p style='margin:0 0 20px;color:#374151;line-height:1.6'>You now have access to free practice questions across SQL, Python, Statistics, ML, System Design, and more.</p>",
    "<a href='https://www.fdehandbook.com/practice' style='display:inline-block;background:#111827;color:#fff;padding:12px 28px;border-radius:8px;text-decoration:none;font-weight:600'>Start practicing</a>",
    "<p style='margin:24px 0 0;color:#9ca3af;font-size:13px'>Questions? Just reply to this email. &mdash; FDE Handbook</p>",
    "</div></div>",
  ].join("");

  const res = await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${process.env.RESEND_API_KEY}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      from: "FDE Handbook <noreply@fdehandbook.com>",
      to: email,
      subject: "Welcome to FDE Handbook",
      html,
      text: "Welcome to FDE Handbook!\n\nStart practicing: https://www.fdehandbook.com/practice\n\n— FDE Handbook",
    }),
  });

  return NextResponse.json({ ok: res.ok, status: res.status });
}
