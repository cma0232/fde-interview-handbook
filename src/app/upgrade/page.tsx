"use client";

import { useState } from "react";
import Link from "next/link";

const PLANS = [
  {
    id: "monthly",
    label: "Monthly",
    price: "$29",
    period: "/ month",
    note: "",
    highlight: false,
  },
  {
    id: "quarterly",
    label: "3 Months",
    price: "$49",
    period: "/ 3 months",
    note: "Save 44%",
    highlight: true,
  },
  {
    id: "annual",
    label: "Annual",
    price: "$99",
    period: "/ year",
    note: "Save 71%",
    highlight: false,
  },
];

export default function UpgradePage() {
  const [loading, setLoading] = useState<string | null>(null);

  async function handleCheckout(plan: string) {
    setLoading(plan);
    const res = await fetch("/api/checkout", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ plan }),
    });
    const { url, error } = await res.json();
    if (error) {
      alert(error === "Not authenticated" ? "Please sign in first." : "Something went wrong.");
      setLoading(null);
      return;
    }
    window.location.href = url;
  }

  return (
    <main className="max-w-3xl mx-auto px-6 py-16 text-center">
      <h1 className="text-3xl font-bold text-gray-900 mb-3">Unlock All Questions</h1>
      <p className="text-gray-500 mb-10">
        Full access to 195 FDE interview questions. Free updates included.
      </p>

      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 mb-8">
        {PLANS.map((plan) => (
          <div
            key={plan.id}
            className={`border rounded-2xl p-6 flex flex-col items-center ${
              plan.highlight
                ? "border-gray-900 shadow-md"
                : "border-gray-200"
            }`}
          >
            {plan.highlight && (
              <span className="text-xs font-semibold bg-gray-900 text-white px-3 py-0.5 rounded-full mb-3">
                Most popular
              </span>
            )}
            <div className="text-sm font-medium text-gray-500 mb-1">{plan.label}</div>
            <div className="text-4xl font-bold text-gray-900">{plan.price}</div>
            <div className="text-xs text-gray-400 mb-1">{plan.period}</div>
            {plan.note && (
              <div className="text-xs text-green-600 font-medium mb-4">{plan.note}</div>
            )}
            {!plan.note && <div className="mb-4" />}
            <button
              onClick={() => handleCheckout(plan.id)}
              disabled={loading !== null}
              className={`w-full py-2.5 rounded-xl text-sm font-medium transition-colors disabled:opacity-50 ${
                plan.highlight
                  ? "bg-gray-900 text-white hover:bg-gray-700"
                  : "border border-gray-300 text-gray-700 hover:bg-gray-50"
              }`}
            >
              {loading === plan.id ? "Redirecting…" : "Get started →"}
            </button>
          </div>
        ))}
      </div>

      <ul className="text-sm text-gray-500 space-y-2 mb-8">
        <li>✓ All 195 questions unlocked instantly</li>
        <li>✓ SQL, Python, Statistics, ML, Business Analytics</li>
        <li>✓ Hints + model answers included</li>
        <li>✓ Free updates as new questions are added</li>
        <li>✓ Cancel anytime</li>
      </ul>

      <p className="text-xs text-gray-400 mb-6">Secure checkout via Stripe</p>

      <Link href="/practice" className="text-sm text-gray-400 hover:text-gray-600">
        ← Back to practice
      </Link>
    </main>
  );
}
