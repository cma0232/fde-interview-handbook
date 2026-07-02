export type Category =
  | "behavioral"
  | "system-design"
  | "coding"
  | "genai-architecture"
  | "case-study";

export interface CategoryMeta {
  id: Category;
  label: string;
  description: string;
  icon: string;
  color: string;
}

export interface Question {
  id: string;
  category: Category;
  title: string;
  difficulty: "easy" | "medium" | "hard";
  content: string;
  hints?: string[];
  solution?: string;
  tags?: string[];
  is_free?: boolean;
  created_at?: string;
}

export interface UserProgress {
  question_id: string;
  status: "not_started" | "in_progress" | "completed";
  updated_at: string;
}
