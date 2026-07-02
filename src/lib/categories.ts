import { CategoryMeta } from "@/types";

export const CATEGORIES: CategoryMeta[] = [
  {
    id: "behavioral",
    label: "Behavioral",
    description: "STAR-format situational questions for FDE soft skills",
    icon: "🧠",
    color: "bg-blue-50 border-blue-200 text-blue-700",
  },
  {
    id: "system-design",
    label: "System Design",
    description: "Design scalable systems under real-world constraints",
    icon: "🏗️",
    color: "bg-purple-50 border-purple-200 text-purple-700",
  },
  {
    id: "coding",
    label: "Coding",
    description: "Algorithms, SQL, and rapid prototyping challenges",
    icon: "💻",
    color: "bg-green-50 border-green-200 text-green-700",
  },
  {
    id: "genai-architecture",
    label: "GenAI Architecture",
    description: "RAG pipelines, agent design, and LLM system trade-offs",
    icon: "🤖",
    color: "bg-orange-50 border-orange-200 text-orange-700",
  },
  {
    id: "case-study",
    label: "Customer-Facing Case Study",
    description: "Decompose ambiguous customer problems end-to-end",
    icon: "📋",
    color: "bg-rose-50 border-rose-200 text-rose-700",
  },
];
