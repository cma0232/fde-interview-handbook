import { CategoryMeta } from "@/types";

export const CATEGORIES: CategoryMeta[] = [
  {
    id: "behavioral",
    label: "Behavioral",
    description: "STAR-format situational questions for FDE soft skills",
    icon: "Users",
    color: "shadow-blue-200",
  },
  {
    id: "system-design",
    label: "System Design",
    description: "Design scalable systems under real-world constraints",
    icon: "Network",
    color: "shadow-purple-200",
  },
  {
    id: "coding",
    label: "Coding",
    description: "Algorithms, SQL, and rapid prototyping challenges",
    icon: "Code2",
    color: "shadow-green-200",
  },
  {
    id: "genai-architecture",
    label: "GenAI Architecture",
    description: "RAG pipelines, agent design, and LLM system trade-offs",
    icon: "BrainCircuit",
    color: "shadow-orange-200",
  },
  {
    id: "case-study",
    label: "Customer-Facing Case Study",
    description: "Decompose ambiguous customer problems end-to-end",
    icon: "MessageSquare",
    color: "shadow-rose-200",
  },
];
