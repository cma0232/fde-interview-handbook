import type { Metadata } from "next";
import Link from "next/link";
import { COMPANY_GUIDES } from "@/lib/companies";

export const metadata: Metadata = {
  title: "FDE Interview Guides by Company — Palantir, Databricks, Scale AI & More",
  description: "Company-specific Forward Deployed Engineer interview guides. Learn the process, skills, and questions for FDE roles at top tech companies.",
  alternates: { canonical: "https://fdehandbook.com/companies" },
};

export default function CompaniesPage() {
  return (
    <main className="max-w-3xl mx-auto px-6 py-14">
      <div className="text-xs text-gray-400 uppercase tracking-widest font-medium mb-3">Interview Guides</div>
      <h1 className="text-3xl font-extrabold tracking-tight text-gray-900 mb-2">FDE Interview by Company</h1>
      <p className="text-gray-500 mb-10">Deep-dive guides for the companies most known for hiring Forward Deployed Engineers.</p>

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        {COMPANY_GUIDES.map((company) => (
          <Link
            key={company.slug}
            href={`/companies/${company.slug}`}
            className="border rounded-xl p-5 hover:shadow-md transition-shadow group flex items-center gap-4"
          >
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src={company.logo} alt={company.name} width={36} height={36} className="rounded-lg border shrink-0" />
            <div>
              <div className="font-bold text-gray-900 group-hover:text-gray-700">{company.name}</div>
              <div className="text-sm text-gray-400 mt-0.5">FDE interview guide →</div>
            </div>
          </Link>
        ))}
      </div>
    </main>
  );
}
