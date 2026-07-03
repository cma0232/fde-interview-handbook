import Link from "next/link";
import Stripe from "stripe";
import { createServiceClient } from "@/lib/supabase-service";
import { createClient } from "@/lib/supabase-server";

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!);

export default async function SuccessPage({
  searchParams,
}: {
  searchParams: Promise<{ session_id?: string }>;
}) {
  const { session_id } = await searchParams;

  // Verify the session with Stripe
  let verified = false;
  if (session_id) {
    try {
      const session = await stripe.checkout.sessions.retrieve(session_id);
      if (session.payment_status === "paid" || session.status === "complete") {
        // Manually activate membership in case webhook was delayed
        const userId = session.metadata?.user_id;
        if (userId) {
          const db = createServiceClient();
          await db.from("profiles").update({ is_member: true }).eq("id", userId);
        }
        verified = true;
      }
    } catch {
      verified = false;
    }
  }

  // Also check current user's membership as fallback
  if (!verified) {
    try {
      const supabase = await createClient();
      const { data: { user } } = await supabase.auth.getUser();
      if (user) {
        const db = createServiceClient();
        const { data } = await db.from("profiles").select("is_member").eq("id", user.id).single();
        verified = data?.is_member ?? false;
      }
    } catch {
      verified = false;
    }
  }

  if (!verified) {
    return (
      <main className="max-w-lg mx-auto px-6 py-20 text-center">
        <div className="text-5xl mb-4">⏳</div>
        <h1 className="text-2xl font-bold text-gray-900 mb-3">Processing your payment…</h1>
        <p className="text-gray-500 mb-8">
          This can take a few seconds. Please refresh the page or contact us if this persists.
        </p>
        <div className="flex flex-col sm:flex-row gap-3 justify-center">
          <Link
            href="/upgrade/success"
            className="inline-block bg-gray-900 text-white font-medium px-6 py-3 rounded-xl hover:bg-gray-700 transition-colors"
          >
            Refresh →
          </Link>
          <a
            href="mailto:chokochanghong@gmail.com"
            className="inline-block border font-medium px-6 py-3 rounded-xl hover:bg-gray-50 transition-colors text-gray-700"
          >
            Contact support
          </a>
        </div>
      </main>
    );
  }

  return (
    <main className="max-w-lg mx-auto px-6 py-20 text-center">
      <div className="text-5xl mb-4">🎉</div>
      <h1 className="text-2xl font-bold text-gray-900 mb-3">You&apos;re in!</h1>
      <p className="text-gray-500 mb-8">
        Your membership is active. All 195 questions are now unlocked.
      </p>
      <Link
        href="/practice"
        className="inline-block bg-gray-900 text-white font-medium px-6 py-3 rounded-xl hover:bg-gray-700 transition-colors"
      >
        Start practicing →
      </Link>
    </main>
  );
}
