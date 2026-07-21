"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";

export default function CancelButton({ periodEnd }: { periodEnd: string | null }) {
  const [confirming, setConfirming] = useState(false);
  const [loading, setLoading] = useState(false);
  const router = useRouter();

  async function handleCancel() {
    setLoading(true);
    await fetch("/api/cancel-subscription", { method: "POST" });
    setLoading(false);
    router.refresh();
  }

  if (confirming) {
    return (
      <div className="border border-red-100 rounded-xl p-5 text-center">
        <p className="text-sm text-gray-700 mb-1 font-medium">Are you sure?</p>
        <p className="text-xs text-gray-400 mb-4">
          You&apos;ll keep access until {periodEnd}. No refund for the current period.
        </p>
        <div className="flex gap-3 justify-center">
          <button
            onClick={() => setConfirming(false)}
            className="text-sm px-4 py-2 border rounded-lg hover:bg-gray-50"
          >
            Keep membership
          </button>
          <button
            onClick={handleCancel}
            disabled={loading}
            className="text-sm px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 disabled:opacity-50"
          >
            {loading ? "Canceling…" : "Yes, cancel"}
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="text-center">
      <button
        onClick={() => setConfirming(true)}
        className="text-sm text-gray-400 hover:text-red-500 transition-colors"
      >
        Cancel membership
      </button>
    </div>
  );
}
