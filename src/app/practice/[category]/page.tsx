import { notFound } from "next/navigation";
import Link from "next/link";
import { CATEGORIES } from "@/lib/categories";
import { getQuestions } from "@/lib/questions";
import { getMembership } from "@/lib/membership";
import { Category } from "@/types";

const FAKE_TITLES = [
  "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod?",
  "Ut enim ad minim veniam quis nostrud.",
  "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur?",
  "Excepteur sint occaecat cupidatat non proident.",
  "Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur?",
  "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque?",
  "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
  "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet consectetur?",
  "Ut labore et dolore magnam aliquam quaerat voluptatem incididunt.",
  "Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse?",
  "Temporibus autem quibusdam et aut officiis debitis rerum necessitatibus.",
  "Nam libero tempore cum soluta nobis eligendi optio cumque nihil impedit?",
];

const DIFFICULTY_COLOR = {
  easy: "bg-green-100 text-green-700",
  medium: "bg-yellow-100 text-yellow-700",
  hard: "bg-red-100 text-red-700",
};

export default async function CategoryPage({
  params,
}: {
  params: Promise<{ category: string }>;
}) {
  const { category } = await params;
  const cat = CATEGORIES.find((c) => c.id === category);
  if (!cat) notFound();

  const [questions, { isMember }] = await Promise.all([
    getQuestions(category as Category),
    getMembership(),
  ]);

  return (
    <main className="max-w-3xl mx-auto px-6 py-12">
      <div className="mb-2">
        <Link href="/practice" className="text-sm text-gray-400 hover:text-gray-600">
          ← Practice
        </Link>
      </div>

      <div className="flex items-center gap-3 mb-2">
        <span className="text-3xl">{cat.icon}</span>
        <h1 className="text-3xl font-extrabold tracking-tight text-gray-900">{cat.label}</h1>
      </div>
      <p className="text-lg text-gray-500 mb-8">{cat.description}</p>

      <div className="flex flex-col gap-3">
        {questions.map((q, i) => {
          const locked = !q.is_free && !isMember;
          return locked ? (
            <div
              key={q.id}
              className="flex items-center justify-between border rounded-lg px-4 py-3 bg-gray-50 opacity-70 cursor-not-allowed"
            >
              <div className="flex items-center gap-3">
                <span className="text-xs font-mono text-gray-400 w-6">{String(i + 1).padStart(2, "0")}</span>
                <span className="text-base font-medium text-gray-700 blur-[3px] select-none">
                {FAKE_TITLES[i % FAKE_TITLES.length]}
              </span>
              </div>
              <div className="flex items-center gap-2 shrink-0 ml-4">
                <span className={`text-xs px-2 py-0.5 rounded-full font-medium ${DIFFICULTY_COLOR[q.difficulty]}`}>
                  {q.difficulty}
                </span>
                <span className="text-gray-400">🔒</span>
              </div>
            </div>
          ) : (
            <Link
              key={q.id}
              href={`/practice/${category}/${q.id}`}
              className="flex items-center justify-between border border-gray-200 rounded-xl px-4 py-3 hover:border-gray-400 hover:shadow-sm transition-all"
            >
              <div className="flex items-center gap-3">
                <span className="text-xs font-mono text-gray-400 w-6">{String(i + 1).padStart(2, "0")}</span>
                <span className="text-base font-medium text-gray-800">{q.title}</span>
              </div>
              <span className={`text-xs px-2 py-0.5 rounded-full font-medium shrink-0 ml-4 ${DIFFICULTY_COLOR[q.difficulty]}`}>
                {q.difficulty}
              </span>
            </Link>
          );
        })}
      </div>

      {!isMember && (
        <div className="mt-8 border border-gray-200 rounded-2xl px-6 py-10 text-center bg-white shadow-sm">
          <p className="text-base text-gray-500 mb-1">
            🔒 {questions.filter(q => !q.is_free).length} questions locked
          </p>
          <h3 className="text-xl font-bold tracking-tight text-gray-900 mb-4">
            Unlock <mark className="bg-yellow-200 px-1 rounded">all questions</mark> with a membership
          </h3>
          <Link
            href="/upgrade"
            className="inline-block bg-gray-900 text-white text-base font-semibold px-7 py-3 rounded-xl hover:bg-gray-700 transition-colors"
          >
            View plans →
          </Link>
        </div>
      )}
    </main>
  );
}
