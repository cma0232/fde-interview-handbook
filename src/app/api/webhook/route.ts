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
          from: "FDE Handbook <onboarding@resend.dev>",
          to: "chokochanghong@gmail.com",
          subject: "💰 New subscriber!",
          text: `Someone just subscribed to FDE Handbook!\n\nEmail: ${session.customer_email}\nAmount: $${((session.amount_total ?? 0) / 100).toFixed(2)}\nTime: ${new Date().toLocaleString()}`,
        }),
      });
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
