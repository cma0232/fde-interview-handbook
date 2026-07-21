import { createServiceClient } from "@/lib/supabase-service";
import { createClient } from "@/lib/supabase-server";
import { Question, Category } from "@/types";

async function getIsMember(): Promise<boolean> {
  const userClient = await createClient();
  const { data: { user } } = await userClient.auth.getUser();
  if (!user) return false;
  const { data: profile } = await userClient.from("profiles").select("is_member").eq("id", user.id).single();
  return profile?.is_member ?? false;
}

export async function getQuestions(category: Category): Promise<Question[]> {
  const [isMember, db] = await Promise.all([getIsMember(), Promise.resolve(createServiceClient())]);

  const { data, error } = await db
    .from("questions")
    .select("id, category, title, difficulty, is_free")
    .eq("category", category)
    .eq("status", "published")
    .order("id");

  if (error) throw new Error(error.message);

  const questions = (data ?? []).map((q) => ({
    ...q,
    title: q.is_free || isMember ? q.title : null,
  })) as Question[];

  if (!isMember) {
    questions.sort((a, b) => (b.is_free ? 1 : 0) - (a.is_free ? 1 : 0));
  }

  return questions;
}

export async function getQuestion(category: Category, id: string): Promise<Question | undefined> {
  const [isMember, db] = await Promise.all([getIsMember(), Promise.resolve(createServiceClient())]);

  const { data, error } = await db
    .from("questions")
    .select("*")
    .eq("category", category)
    .eq("id", id)
    .eq("status", "published")
    .single();

  if (error || !data) return undefined;

  const locked = !data.is_free && !isMember;
  if (locked) {
    return {
      id: data.id,
      category: data.category,
      title: "",
      difficulty: data.difficulty,
      content: "",
      is_free: false,
    } as Question;
  }

  return { ...data } as Question;
}
