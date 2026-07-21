import { NextRequest, NextResponse } from "next/server";
import Stripe from "stripe";
import { createServiceClient } from "@/lib/supabase-service";

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!);

export async function POST(req: NextRequest) {
  const body = await req.text();
  const sig = req.headers.get("stripe-signature")!;

  let event: Stripe.Event;
  try {
    event = stripe.webhooks.constructEvent(body, sig, process.env.STRIPE_WEBHOOK_SECRET!);
  } catch {
    return NextResponse.json({ error: "Invalid signature" }, { status: 400 });
  }

  const db = createServiceClient();

  if (event.type === "checkout.session.completed") {
    const session = event.data.object as Stripe.Checkout.Session;
    const userId = session.metadata?.user_id;
    if (userId) {
      await db.from("profiles").update({
        is_member: true,
        stripe_customer_id: session.customer as string,
        stripe_subscription_id: session.subscription as string,
        membership_start: new Date().toISOString(),
      }).eq("id", userId);

      // Notify owner
      await fetch("https://api.resend.com/emails", {
        method: "POST",
        headers: {
          "Authorization": `Bearer ${process.env.RESEND_API_KEY}`,
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          from: "FDE Handbook <noreply@fdehandbook.com>",
          to: "chokochanghong@gmail.com",
          subject: "💰 New subscriber!",
          text: `Someone just subscribed to FDE Handbook!\n\nEmail: ${session.customer_email}\nAmount: $${((session.amount_total ?? 0) / 100).toFixed(2)}\nTime: ${new Date().toLocaleString()}`,
        }),
      });

      // Welcome email to buyer
      if (session.customer_email) {
        await fetch("https://api.resend.com/emails", {
          method: "POST",
          headers: {
            "Authorization": `Bearer ${process.env.RESEND_API_KEY}`,
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            from: "FDE Handbook <noreply@fdehandbook.com>",
            to: session.customer_email,
            subject: "You're a member! 🎉",
            html: `<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#f9fafb;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif">
  <table width="100%" cellpadding="0" cellspacing="0" style="background:#f9fafb;padding:40px 0">
    <tr><td align="center">
      <table width="520" cellpadding="0" cellspacing="0" style="background:#ffffff;border-radius:12px;overflow:hidden;border:1px solid #e5e7eb">
        <!-- Header -->
        <tr>
          <td style="background:#111827;padding:32px 40px">
            <p style="margin:0;color:#ffffff;font-size:18px;font-weight:700;letter-spacing:-0.3px">FDE Handbook</p>
            <p style="margin:6px 0 0;color:#9ca3af;font-size:13px">Forward Deployed Engineer Interview Prep</p>
          </td>
        </tr>
        <!-- Body -->
        <tr>
          <td style="padding:36px 40px">
            <h1 style="margin:0 0 16px;font-size:22px;font-weight:700;color:#111827">Membership confirmed 🎉</h1>
            <p style="margin:0 0 20px;font-size:15px;color:#374151;line-height:1.6">
              Thank you for subscribing. Your membership is now active and all <strong>195 questions</strong> are unlocked.
            </p>
            <table cellpadding="0" cellspacing="0" style="margin:0 0 32px;background:#f9fafb;border-radius:8px;border:1px solid #e5e7eb;width:100%">
              <tr><td style="padding:16px 20px">
                <p style="margin:0 0 8px;font-size:13px;font-weight:600;color:#6b7280;text-transform:uppercase;letter-spacing:0.5px">What's unlocked</p>
                <table cellpadding="0" cellspacing="0">
                  <tr><td style="padding:3px 0;font-size:14px;color:#374151">✓ &nbsp;All SQL, Python &amp; Coding questions</td></tr>
                  <tr><td style="padding:3px 0;font-size:14px;color:#374151">✓ &nbsp;System Design &amp; GenAI Architecture</td></tr>
                  <tr><td style="padding:3px 0;font-size:14px;color:#374151">✓ &nbsp;Behavioral &amp; Case Study deep-dives</td></tr>
                  <tr><td style="padding:3px 0;font-size:14px;color:#374151">✓ &nbsp;Free updates as new questions are added</td></tr>
                </table>
              </td></tr>
            </table>
            <!-- CTAs -->
            <table cellpadding="0" cellspacing="0" style="margin:0 0 16px">
              <tr>
                <td style="background:#111827;border-radius:8px">
                  <a href="https://www.fdehandbook.com/practice" style="display:inline-block;padding:13px 28px;color:#ffffff;font-size:15px;font-weight:600;text-decoration:none">Start practicing →</a>
                </td>
              </tr>
            </table>
            <p style="margin:0;font-size:13px;color:#6b7280">
              <a href="https://www.fdehandbook.com/account/membership" style="color:#6b7280">View membership details</a>
            </p>
          </td>
        </tr>
        <!-- Footer -->
        <tr>
          <td style="padding:20px 40px 28px;border-top:1px solid #f3f4f6">
            <p style="margin:0;font-size:13px;color:#9ca3af;line-height:1.6">
              Questions or issues? Just reply to this email.<br>
              — FDE Handbook
            </p>
          </td>
        </tr>
      </table>
    </td></tr>
  </table>
</body>
</html>`,
            text: `Membership confirmed!\n\nAll 195 questions are unlocked. Start practicing: https://www.fdehandbook.com/practice\n\nView membership details: https://www.fdehandbook.com/account/membership\n\nQuestions? Reply to this email.\n\n— FDE Handbook`,
          }),
        });
      }
    }
  }

  if (event.type === "customer.subscription.deleted") {
    const sub = event.data.object as Stripe.Subscription;
    await db.from("profiles")
      .update({ is_member: false, stripe_subscription_id: null, membership_end: null })
      .eq("stripe_customer_id", sub.customer as string);
  }

  return NextResponse.json({ received: true });
}
