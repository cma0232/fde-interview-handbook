import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Membership — Unlock All FDE Interview Questions",
  description: "Get unlimited access to 195 curated FDE interview questions, detailed answers, and expert frameworks for Forward Deployed Engineer roles.",
  alternates: { canonical: "https://fdehandbook.com/upgrade" },
};

export default function UpgradeLayout({ children }: { children: React.ReactNode }) {
  return children;
}
