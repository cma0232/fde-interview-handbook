import Link from "next/link";
import { CATEGORIES } from "@/lib/categories";

const PLAN = [
  {
    week: "Week 1",
    theme: "Understand the role",
    tasks: [
      "Read what FDE actually means at 3 target companies (Palantir, Databricks, Scale AI)",
      "Watch 3–5 FDE interview experience videos on YouTube",
      "Map your past projects to FDE-relevant skills: data, systems, customer problem-solving",
    ],
  },
  {
    week: "Week 2",
    theme: "Behavioral foundations",
    tasks: [
      "Write 5 core STAR stories that cover: ambiguity, technical depth, customer impact, failure, leadership",
      "Practice answering behavioral questions out loud — record yourself",
      "Do 10 behavioral questions on this platform",
    ],
  },
  {
    week: "Week 3",
    theme: "Technical depth",
    tasks: [
      "Review SQL, Python data manipulation, and REST API basics",
      "Do 5 system design questions focused on data pipelines and integrations",
      "Do 5 GenAI architecture questions — RAG, agents, LLM trade-offs",
    ],
  },
  {
    week: "Week 4",
    theme: "Case studies & mock interviews",
    tasks: [
      "Do 10 customer-facing case study questions end-to-end",
      "Do a full mock interview covering behavioral + technical + case",
      "Apply to 3–5 FDE roles with tailored STAR stories ready",
    ],
  },
];

export default function StartHerePage() {
  return (
    <main className="max-w-3xl mx-auto px-6 py-14">
      {/* Header */}
      <div className="mb-12">
        <div className="text-xs text-gray-400 font-medium uppercase tracking-widest mb-2">Start Here</div>
        <h1 className="text-3xl font-bold text-gray-900 mb-3">What is a Forward Deployed Engineer?</h1>
        <p className="text-gray-500 text-lg leading-relaxed">
          FDE is a hybrid role that sits at the intersection of software engineering and customer success.
          You build, deploy, and iterate on software — directly at client sites, alongside the people using it.
        </p>
      </div>

      {/* What you actually do */}
      <section className="mb-12">
        <h2 className="text-base font-semibold text-gray-900 mb-4">What you actually do</h2>
        <div className="space-y-3">
          {[
            { icon: "🏗️", text: "Integrate the product into a client's existing stack — often under tight timelines and messy real-world data" },
            { icon: "🤝", text: "Sit with the customer, understand their workflows, and translate that into technical requirements" },
            { icon: "⚡", text: "Write production code quickly — Python scripts, SQL pipelines, dashboards, APIs" },
            { icon: "📣", text: "Act as the feedback bridge between customers and the core product team" },
            { icon: "🔥", text: "Own outcomes end-to-end: if the deployment breaks at 2am, you fix it" },
          ].map((item) => (
            <div key={item.text} className="flex gap-3 p-4 border rounded-xl">
              <span className="text-xl shrink-0">{item.icon}</span>
              <p className="text-sm text-gray-600 leading-relaxed">{item.text}</p>
            </div>
          ))}
        </div>
      </section>

      {/* Why it's different */}
      <section className="mb-12">
        <h2 className="text-base font-semibold text-gray-900 mb-4">Why FDE is different from SWE</h2>
        <div className="overflow-hidden border rounded-xl">
          <table className="w-full text-sm">
            <thead>
              <tr className="bg-gray-50 border-b">
                <th className="text-left px-4 py-3 text-gray-500 font-medium">Dimension</th>
                <th className="text-left px-4 py-3 text-gray-500 font-medium">SWE</th>
                <th className="text-left px-4 py-3 text-gray-500 font-medium">FDE</th>
              </tr>
            </thead>
            <tbody className="divide-y">
              {[
                ["Customer contact", "Rare / indirect", "Daily — you're on-site"],
                ["Codebase", "Long-lived, large", "Fast scripts, integrations"],
                ["Feedback loop", "Weeks / sprints", "Hours / days"],
                ["Ambiguity", "Defined tickets", "You define the problem"],
                ["Travel", "Minimal", "Often 30–50%"],
              ].map(([dim, swe, fde]) => (
                <tr key={dim} className="hover:bg-gray-50">
                  <td className="px-4 py-3 text-gray-700 font-medium">{dim}</td>
                  <td className="px-4 py-3 text-gray-500">{swe}</td>
                  <td className="px-4 py-3 text-gray-700">{fde}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </section>

      {/* 30-day plan */}
      <section className="mb-12">
        <h2 className="text-base font-semibold text-gray-900 mb-1">30-Day Prep Plan</h2>
        <p className="text-sm text-gray-400 mb-6">~1–2 hours per day. Adjust based on your interview timeline.</p>
        <div className="space-y-4">
          {PLAN.map((week, i) => (
            <div key={week.week} className="border rounded-xl overflow-hidden">
              <div className="flex items-center gap-3 px-5 py-3 bg-gray-50 border-b">
                <span className="w-6 h-6 rounded-full bg-gray-900 text-white text-xs flex items-center justify-center font-bold shrink-0">
                  {i + 1}
                </span>
                <div>
                  <span className="text-sm font-semibold text-gray-800">{week.week}</span>
                  <span className="mx-2 text-gray-300">·</span>
                  <span className="text-sm text-gray-500">{week.theme}</span>
                </div>
              </div>
              <ul className="px-5 py-3 space-y-2">
                {week.tasks.map((task) => (
                  <li key={task} className="flex gap-2.5 text-sm text-gray-600">
                    <span className="text-gray-300 shrink-0 mt-0.5">→</span>
                    {task}
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>
      </section>

      {/* CTA */}
      <div className="border rounded-2xl p-8 text-center bg-gray-50">
        <div className="font-semibold text-gray-900 mb-1">Ready to start?</div>
        <p className="text-sm text-gray-500 mb-5">Pick a category and start practicing real FDE interview questions.</p>
        <div className="flex flex-wrap gap-3 justify-center">
          {CATEGORIES.map((c) => (
            <Link
              key={c.id}
              href={`/practice/${c.id}`}
              className="text-sm border rounded-lg px-4 py-2 hover:bg-white transition-colors text-gray-700 hover:shadow-sm"
            >
              {c.icon} {c.label}
            </Link>
          ))}
        </div>
      </div>
    </main>
  );
}
