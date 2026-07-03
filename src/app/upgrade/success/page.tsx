import Link from "next/link";

export default function SuccessPage() {
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
