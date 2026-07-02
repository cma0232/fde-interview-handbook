import Link from "next/link";
import { CATEGORIES } from "@/lib/categories";

export default function PracticePage() {
  return (
    <main className="max-w-4xl mx-auto px-6 py-12">
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Practice</h1>
      <p className="text-gray-500 mb-8">Choose a category to begin.</p>

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
    </main>
  );
}
