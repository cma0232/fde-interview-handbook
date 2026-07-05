import { notFound } from "next/navigation";
import Link from "next/link";
import { CATEGORIES } from "@/lib/categories";
import { getQuestions, getQuestion } from "@/lib/questions";
import { Category } from "@/types";

const DIFFICULTY_COLOR = {
  easy: "bg-green-100 text-green-700",
  medium: "bg-yellow-100 text-yellow-700",
  hard: "bg-red-100 text-red-700",
};

export default async function QuestionPage({
  params,
}: {
  params: Promise<{ category: string; id: string }>;
}) {
  const { category, id } = await params;
  const cat = CATEGORIES.find((c) => c.id === category);
  if (!cat) notFound();

  const [question, questions] = await Promise.all([
    getQuestion(category as Category, id),
    getQuestions(category as Category),
  ]);

  if (!question) notFound();

  const currentIndex = questions.findIndex((q) => q.id === id);
  const prevQ = questions[currentIndex - 1];
  const nextQ = questions[currentIndex + 1];
  const locked = !question.is_free && !question.content;

  return (
    <main className="max-w-3xl mx-auto px-6 py-12">
      {/* Breadcrumb */}
      <div className="flex items-center gap-2 text-sm text-gray-400 mb-6">
        <Link href="/practice" className="hover:text-gray-600">Practice</Link>
        <span>›</span>
        <Link href={`/practice/${category}`} className="hover:text-gray-600">{cat.label}</Link>
        <span>›</span>
        <span className="text-gray-600">Q{currentIndex + 1}</span>
      </div>

      {/* Header */}
      <div className="mb-6">
        <div className="flex items-center gap-2 mb-3">
          <span className={`text-xs px-2 py-0.5 rounded-full font-medium ${DIFFICULTY_COLOR[question.difficulty]}`}>
            {question.difficulty}
          </span>
          <span className="text-xs text-gray-400">{cat.icon} {cat.label}</span>
          {locked && <span className="text-xs text-gray-400">🔒 Members only</span>}
        </div>
        <h1 className="text-2xl md:text-3xl font-extrabold tracking-tight text-gray-900 leading-snug">
          {locked
            ? <span className="blur-[4px] select-none">Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempore</span>
            : question.title}
        </h1>
      </div>

      {locked ? (
        /* Paywall */
        <div className="border border-gray-200 rounded-2xl px-6 py-12 text-center bg-white shadow-sm">
          <div className="w-12 h-12 mx-auto mb-4 rounded-xl bg-gray-100 flex items-center justify-center text-xl">
            🔒
          </div>
          <h2 className="text-xl font-bold tracking-tight text-gray-900 mb-1">
            This question is for members only
          </h2>
          <p className="text-base text-gray-500 mb-6">
            Unlock all {questions.filter(q => !q.is_free).length} questions with a membership.
          </p>
          <div className="flex flex-col sm:flex-row gap-3 justify-center">
            <Link
              href="/upgrade"
              className="bg-gray-900 text-white text-sm font-medium px-6 py-2.5 rounded-lg hover:bg-gray-700 transition-colors"
            >
              View plans →
            </Link>
            <Link
              href="/login"
              className="border text-sm font-medium px-6 py-2.5 rounded-lg hover:bg-gray-50 transition-colors text-gray-700"
            >
              Sign in
            </Link>
          </div>
        </div>
      ) : (
        <>
          {/* Question content */}
          <div className="mb-8 text-gray-700 whitespace-pre-wrap leading-relaxed text-base">
            {question.content}
          </div>

          {/* Hints */}
          {question.hints && question.hints.length > 0 && (
            <details className="mb-6 border rounded-lg p-4">
              <summary className="cursor-pointer text-base font-medium text-gray-600 select-none">
                💡 Hints ({question.hints.length})
              </summary>
              <ul className="mt-3 space-y-2">
                {question.hints.map((hint, i) => (
                  <li key={i} className="text-base text-gray-600 flex gap-2">
                    <span className="text-gray-400">{i + 1}.</span>
                    {hint}
                  </li>
                ))}
              </ul>
            </details>
          )}

          {/* Solution */}
          {question.solution && (
            <details className="mb-8 border border-gray-200 rounded-lg p-4 bg-gray-50">
              <summary className="cursor-pointer text-base font-medium text-gray-700 select-none">
                ✅ View Solution
              </summary>
              <div className="mt-3 text-base text-gray-700 whitespace-pre-wrap leading-relaxed">
                {question.solution}
              </div>
            </details>
          )}
        </>
      )}

      {/* Navigation */}
      <div className="flex justify-between pt-4 border-t mt-4">
        {prevQ ? (
          <Link href={`/practice/${category}/${prevQ.id}`} className="text-base text-gray-500 hover:text-gray-900">
            ← Previous
          </Link>
        ) : <span />}
        {nextQ ? (
          <Link href={`/practice/${category}/${nextQ.id}`} className="text-base text-gray-500 hover:text-gray-900">
            Next →
          </Link>
        ) : (
          <Link href={`/practice/${category}`} className="text-base text-gray-500 hover:text-gray-900">
            ↩ Back to {cat.label}
          </Link>
        )}
      </div>
    </main>
  );
}
