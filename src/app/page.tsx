import Link from "next/link";
import { CATEGORIES } from "@/lib/categories";

export default function HomePage() {
  return (
    <main className="min-h-screen bg-white">
      {/* Hero */}
      <div className="border-b px-6 py-16 text-center">
        <h1 className="text-4xl font-bold tracking-tight text-gray-900 max-w-2xl mx-auto leading-tight">
          Forward Deployed Engineer Interview Handbook
        </h1>
        <p className="mt-3 text-lg text-gray-500 max-w-xl mx-auto">
          The complete interview prep guide for FDE roles at Palantir, Anduril,
          Scale AI, and beyond.
        </p>
      </div>

      {/* Categories */}
      <div className="max-w-4xl mx-auto px-6 py-12">
        <h2 className="text-sm font-semibold uppercase tracking-widest text-gray-400 mb-6">
          5 Categories
        </h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          {CATEGORIES.map((cat) => (
            <Link
              key={cat.id}
              href={`/practice/${cat.id}`}
              className={`border rounded-xl p-5 hover:shadow-md transition-shadow ${cat.color}`}
            >
              <div className="text-2xl mb-2">{cat.icon}</div>
              <div className="font-semibold text-base">{cat.label}</div>
              <div className="mt-1 text-sm opacity-75">{cat.description}</div>
            </Link>
          ))}
        </div>
      </div>
    </main>
  );
}
