import { redirect } from "next/navigation";
import Link from "next/link";
import { createClient } from "@/lib/supabase-server";
import { createServiceClient } from "@/lib/supabase-service";
import Stripe from "stripe";
import CancelButton from "./CancelButton";

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!);

export default async function MembershipPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const db = createServiceClient();
  const { data: profile } = await db
    .from("profiles")
    .select("is_member, stripe_subscription_id, stripe_customer_id, membership_start")
    .eq("id", user.id)
    .single();

  let subscription = null;
  let invoices: Stripe.Invoice[] = [];

  if (profile?.stripe_subscription_id) {
    try {
      subscription = await stripe.subscriptions.retrieve(profile.stripe_subscription_id);
      const inv = await stripe.invoices.list({ customer: profile.stripe_customer_id!, limit: 10 });
      invoices = inv.data;
    } catch {
      // subscription may have been deleted
    }
  }

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const sub = subscription as any;
  const isCanceling = sub?.cancel_at_period_end ?? false;
  const periodEnd = sub?.current_period_end
    ? new Date(sub.current_period_end * 1000).toLocaleDateString()
    : null;

  return (
    <main className="max-w-xl mx-auto px-6 py-12">
      <div className="mb-6">
        <Link href="/account" className="text-sm text-gray-400 hover:text-gray-600">← Account</Link>
      </div>
      <h1 className="text-xl font-bold text-gray-900 mb-8">My Membership</h1>

      {/* Status */}
      <div className="border rounded-xl p-5 mb-6">
        <div className="flex items-center justify-between mb-3">
          <span className="text-sm font-medium text-gray-700">Status</span>
          {profile?.is_member ? (
            <span className="text-xs bg-green-100 text-green-700 px-2 py-0.5 rounded-full font-medium">
              {isCanceling ? "Canceling" : "Active"}
            </span>
          ) : (
            <span className="text-xs bg-gray-100 text-gray-500 px-2 py-0.5 rounded-full font-medium">Inactive</span>
          )}
        </div>
        {profile?.membership_start && (
          <div className="flex items-center justify-between text-sm text-gray-500 mb-2">
            <span>Started</span>
            <span>{new Date(profile.membership_start).toLocaleDateString()}</span>
          </div>
        )}
        {periodEnd && (
          <div className="flex items-center justify-between text-sm text-gray-500">
            <span>{isCanceling ? "Access until" : "Next billing"}</span>
            <span>{periodEnd}</span>
          </div>
        )}
      </div>

      {/* Payment history */}
      {invoices.length > 0 && (
        <div className="mb-6">
          <h2 className="text-sm font-medium text-gray-700 mb-3">Payment History</h2>
          <div className="border rounded-xl overflow-hidden">
            {invoices.map((inv) => (
              <div key={inv.id} className="flex items-center justify-between px-4 py-3 border-b last:border-0 text-sm">
                <span className="text-gray-500">
                  {new Date((inv.created) * 1000).toLocaleDateString()}
                </span>
                <span className="text-gray-700 font-medium">
                  ${((inv.amount_paid ?? 0) / 100).toFixed(2)}
                </span>
                {inv.hosted_invoice_url && (
                  <a href={inv.hosted_invoice_url} target="_blank" rel="noopener noreferrer"
                    className="text-gray-400 hover:text-gray-600 text-xs">
                    Receipt ↗
                  </a>
                )}
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Cancel */}
      {profile?.is_member && !isCanceling && subscription && (
        <CancelButton periodEnd={periodEnd} />
      )}

      {isCanceling && (
        <p className="text-sm text-gray-400 text-center">
          Your membership will remain active until {periodEnd}. No further charges.
        </p>
      )}

      {!profile?.is_member && (
        <div className="text-center">
          <p className="text-sm text-gray-500 mb-4">You don&apos;t have an active membership.</p>
          <Link href="/upgrade" className="inline-block bg-gray-900 text-white text-sm font-medium px-5 py-2.5 rounded-lg hover:bg-gray-700 transition-colors">
            View plans →
          </Link>
        </div>
      )}
    </main>
  );
}
