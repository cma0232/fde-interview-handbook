"use client";

import { useState } from "react";
import Link from "next/link";

export default function UpgradePage() {
  const [loading, setLoading] = useState(false);

  async function handleCheckout() {
    setLoading(true);
    const res = await fetch("/api/checkout", { method: "POST" });
    const { url, error } = await res.json();
    if (error) {
      alert(error === "Not authenticated" ? "Please sign in first." : "Something went wrong.");
      setLoading(false);
      return;
    }
    window.location.href = url;
  }

  return (
    <main className="max-w-2xl mx-auto px-6 py-16 text-center">
      <h1 className="text-3xl font-bold text-gray-900 mb-3">Unlock All Questions</h1>
      <p className="text-gray-500 mb-10">
        One-time payment. Lifetime access to 195 FDE interview questions across 5 categories.
      </p>

      <div className="border border-gray-200 rounded-2xl p-8 mb-6 bg-white shadow-sm">
        <div className="text-5xl font-bold text-gray-900 mb-1">$29</div>
        <div className="text-sm text-gray-400 mb-8">one-time · no subscription</div>

        <ul className="text-sm text-gray-600 space-y-3 mb-8 text-left max-w-xs mx-auto">
          <li className="flex gap-2"><span className="text-green-500">✓</span> All 195 questions unlocked</li>
          <li className="flex gap-2"><span className="text-green-500">✓</span> SQL, Python, Statistics, ML, Business Analytics</li>
          <li className="flex gap-2"><span className="text-green-500">✓</span> Hints + model answers included</li>
          <li className="flex gap-2"><span className="text-green-500">✓</span> Lifetime access, no renewal</li>
        </ul>

        <button
          onClick={handleCheckout}
          disabled={loading}
          className="w-full bg-gray-900 text-white font-medium py-3 rounded-xl hover:bg-gray-700 transition-colors disabled:opacity-50"
        >
          {loading ? "Redirecting…" : "Get lifetime access →"}
        </button>

        <p className="text-xs text-gray-400 mt-4">Secure checkout via Stripe</p>
      </div>

      <Link href="/practice" className="text-sm text-gray-400 hover:text-gray-600">
        ← Back to practice
      </Link>
    </main>
  );
}
