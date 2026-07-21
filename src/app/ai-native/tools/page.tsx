import type { Metadata } from "next";
import ToolsShowcase from "./ToolsShowcase";

export const metadata: Metadata = {
  title: "AI Native Tools — Forward Deployed Engineer Toolkit",
  description: "AI-native tools to boost your productivity as a Forward Deployed Engineer.",
  alternates: { canonical: "https://fdehandbook.com/ai-native/tools" },
};

export default function ToolsPage() {
  return (
    <main className="w-full max-w-4xl mx-auto px-6 py-14">
      <div className="mb-10">
        <div className="text-xs text-gray-400 font-medium uppercase tracking-widest mb-2">AI Native · Tools</div>
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Tools</h1>
        <p className="text-base text-gray-500">AI-native tools to boost your productivity as an FDE.</p>
      </div>

      <ToolsShowcase />
    </main>
  );
}
