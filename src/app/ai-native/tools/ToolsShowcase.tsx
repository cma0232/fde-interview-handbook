"use client";

import { useState } from "react";

type Tool = {
  name: string;
  url: string;
  description: string;
  logo: string;
  accent: string;
  category: string;
};

const TOOLS: Tool[] = [
  {
    name: "Wispr Flow",
    url: "https://wisprflow.ai",
    description: "Voice dictation that feels like typing. Speak naturally and Flow handles the rest — works in any app, no switching required.",
    logo: "https://cdn.prod.website-files.com/682f84b3838c89f8ff7667db/68d27d1a8a10f417b5644527_flow-wc-v2.png",
    accent: "#7c3aed",
    category: "Productivity",
  },
  {
    name: "Gong",
    url: "https://gong.io",
    description: "Record, transcribe, and search every customer call. Know exactly what was said, when, and by whom.",
    logo: "https://gong.io/marketing-assets/apple-touch-icon.png",
    accent: "#2563eb",
    category: "Productivity",
  },
];

const CATEGORIES = ["All", ...Array.from(new Set(TOOLS.map((t) => t.category)))];

export default function ToolsShowcase() {
  const [activeCategory, setActiveCategory] = useState("All");
  const [active, setActive] = useState<Tool>(TOOLS[0]);
  const [isTransitioning, setIsTransitioning] = useState(false);

  const filtered = activeCategory === "All" ? TOOLS : TOOLS.filter((t) => t.category === activeCategory);

  function switchCategory(cat: string) {
    setActiveCategory(cat);
    const first = cat === "All" ? TOOLS[0] : TOOLS.find((t) => t.category === cat) ?? TOOLS[0];
    if (first.name !== active.name) {
      setIsTransitioning(true);
      setTimeout(() => { setActive(first); setIsTransitioning(false); }, 150);
    }
  }

  function switchTool(tool: Tool) {
    if (tool.name === active.name) return;
    setIsTransitioning(true);
    setTimeout(() => { setActive(tool); setIsTransitioning(false); }, 150);
  }

  return (
    <div className="flex flex-col gap-6">
      {/* Category tabs */}
      <div className="flex gap-2">
        {CATEGORIES.map((cat) => (
          <button
            key={cat}
            onClick={() => switchCategory(cat)}
            className={`px-4 py-1.5 rounded-full text-sm font-medium transition-all duration-200 ${
              activeCategory === cat
                ? "bg-gray-900 text-white shadow-sm"
                : "bg-gray-100 text-gray-500 hover:bg-gray-200 hover:text-gray-800"
            }`}
          >
            {cat}
          </button>
        ))}
      </div>

      {/* Main layout */}
      <div className="flex gap-8 items-start">
        {/* Left: tool list */}
        <div className="flex flex-col gap-1 w-52 shrink-0 pt-1">
          {filtered.map((tool, i) => {
            const isActive = active.name === tool.name;
            return (
              <button
                key={tool.name}
                onClick={() => switchTool(tool)}
                className={`group flex items-center gap-3 px-3 py-3 rounded-xl text-left transition-all duration-200 ${
                  isActive ? "bg-gray-900 text-white shadow-lg" : "text-gray-500 hover:text-gray-900 hover:bg-gray-100"
                }`}
              >
                <div className={`w-7 h-7 rounded-lg overflow-hidden shrink-0 ${isActive ? "ring-1 ring-white/20" : ""}`}>
                  <img src={tool.logo} alt={tool.name} className="w-full h-full object-cover" />
                </div>
                <span className="text-sm font-semibold truncate">{tool.name}</span>
              </button>
            );
          })}
        </div>

        {/* Right: preview */}
        <div className="flex-1 min-w-0">
          <a
            href={active.url}
            target="_blank"
            rel="noopener noreferrer"
            className={`group block rounded-2xl overflow-hidden border border-gray-200 hover:shadow-xl hover:-translate-y-0.5 ${
              isTransitioning ? "opacity-0 translate-y-1" : "opacity-100 translate-y-0"
            }`}
            style={{ transition: "opacity 150ms ease, transform 150ms ease, box-shadow 200ms ease" }}
          >
            <div className="h-1 w-full" style={{ background: active.accent }} />
            <div className="p-8 bg-white">
              <div className="flex items-start justify-between mb-6">
                <div className="flex items-center gap-4">
                  <div className="w-16 h-16 rounded-2xl overflow-hidden border border-gray-100 shadow-md">
                    <img src={active.logo} alt={active.name} className="w-full h-full object-cover" />
                  </div>
                  <div>
                    <div className="text-xs font-medium text-gray-400 mb-1">{active.category}</div>
                    <h2 className="text-2xl font-extrabold text-gray-900 tracking-tight">{active.name}</h2>
                  </div>
                </div>
                <div className="flex items-center gap-1.5 text-xs font-semibold text-gray-400 group-hover:text-gray-700 group-hover:gap-2.5 transition-all duration-200 pt-1">
                  Visit site
                  <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}>
                    <path strokeLinecap="round" strokeLinejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3" />
                  </svg>
                </div>
              </div>
              <p className="text-base text-gray-600 leading-relaxed">{active.description}</p>
              <div className="flex gap-1.5 mt-8">
                {filtered.map((t) => (
                  <div
                    key={t.name}
                    className="h-1 rounded-full transition-all duration-300"
                    style={{
                      width: t.name === active.name ? "24px" : "6px",
                      background: t.name === active.name ? active.accent : "#e5e7eb",
                    }}
                  />
                ))}
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  );
}
