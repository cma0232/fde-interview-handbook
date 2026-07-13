import type { Metadata } from "next";
import Link from "next/link";
import { CATEGORIES } from "@/lib/categories";
import * as LucideIcons from "lucide-react";
import { LucideProps } from "lucide-react";

export const metadata: Metadata = {
  title: "Practice FDE Interview Questions",
  description: "195 curated Forward Deployed Engineer interview questions across behavioral, system design, coding, GenAI architecture, and customer-facing case studies.",
  alternates: { canonical: "https://fdehandbook.com/practice" },
};

function Icon({ name, ...props }: { name: string } & LucideProps) {
  const Comp = (LucideIcons as unknown as Record<string, React.ComponentType<LucideProps>>)[name];
  if (!Comp) return null;
  return <Comp {...props} />;
}

export default function PracticePage() {
  return (
    <main className="max-w-4xl mx-auto px-6 py-12">
      <h1 className="text-3xl font-extrabold tracking-tight text-gray-900 mb-2">Practice</h1>
      <p className="text-lg text-gray-500 mb-8">Choose a category to begin.</p>

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        {CATEGORIES.map((cat) => (
          <Link
            key={cat.id}
            href={`/practice/${cat.id}`}
            className={`bg-white border border-gray-100 rounded-2xl p-6 shadow-md transition-all duration-200 hover:scale-[1.03] hover:shadow-xl ${cat.color}`}
          >
            <Icon name={cat.icon} size={28} className="mb-3 text-gray-800" />
            <div className="font-bold text-lg">{cat.label}</div>
            <div className="mt-1 text-base opacity-75">{cat.description}</div>
          </Link>
        ))}
      </div>
    </main>
  );
}
