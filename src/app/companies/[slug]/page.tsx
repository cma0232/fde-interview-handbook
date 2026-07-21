import type { Metadata } from "next";
import { notFound } from "next/navigation";
import Link from "next/link";
import { COMPANY_GUIDES, getCompanyGuide } from "@/lib/companies";

export function generateStaticParams() {
  return COMPANY_GUIDES.map((c) => ({ slug: c.slug }));
}

export async function generateMetadata({ params }: { params: Promise<{ slug: string }> }): Promise<Metadata> {
  const { slug } = await params;
  const company = getCompanyGuide(slug);
  if (!company) return {};
  return {
    title: `${company.name} Forward Deployed Engineer Interview Guide`,
    description: `Everything you need to prep for the ${company.name} FDE interview — process, skills, sample questions, and expert tips.`,
    alternates: { canonical: `https://fdehandbook.com/companies/${slug}` },
  };
}

export default async function CompanyPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const company = getCompanyGuide(slug);
  if (!company) notFound();

  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    mainEntity: company.faqs.map((faq) => ({
      "@type": "Question",
      name: faq.q,
      acceptedAnswer: { "@type": "Answer", text: faq.a },
    })),
  };

  return (
    <>
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
      <main className="max-w-3xl mx-auto px-6 py-14">

        {/* Breadcrumb */}
        <div className="text-sm text-gray-400 mb-8">
          <Link href="/" className="hover:text-gray-700">Home</Link>
          <span className="mx-2">›</span>
          <Link href="/companies" className="hover:text-gray-700">Companies</Link>
          <span className="mx-2">›</span>
          <span className="text-gray-700">{company.name}</span>
        </div>

        {/* Header */}
        <div className="flex items-center gap-4 mb-4">
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img src={company.logo} alt={company.name} width={48} height={48} className="rounded-xl border" />
          <div>
            <div className="text-xs text-gray-400 uppercase tracking-widest font-medium mb-1">FDE Interview Guide</div>
            <h1 className="text-3xl font-extrabold tracking-tight text-gray-900">{company.tagline}</h1>
          </div>
        </div>
        <p className="text-lg text-gray-600 leading-relaxed mb-10">{company.description}</p>

        {/* What they build */}
        <section className="mb-10">
          <h2 className="text-xl font-bold text-gray-900 mb-3">What {company.name} builds</h2>
          <p className="text-gray-600 leading-relaxed">{company.whatTheyBuild}</p>
        </section>

        {/* FDE role */}
        <section className="mb-10">
          <h2 className="text-xl font-bold text-gray-900 mb-3">The FDE role at {company.name}</h2>
          <p className="text-gray-600 leading-relaxed">{company.fdeSummary}</p>
        </section>

        {/* Skills */}
        <section className="mb-10">
          <h2 className="text-xl font-bold text-gray-900 mb-4">Key skills to develop</h2>
          <div className="flex flex-wrap gap-2">
            {company.skills.map((skill) => (
              <span key={skill} className="bg-gray-100 text-gray-700 text-sm font-medium px-3 py-1.5 rounded-full">
                {skill}
              </span>
            ))}
          </div>
        </section>

        {/* Interview process */}
        <section className="mb-10">
          <h2 className="text-xl font-bold text-gray-900 mb-4">Interview process</h2>
          <div className="space-y-4">
            {company.interviewStages.map((stage, i) => (
              <div key={i} className="flex gap-4">
                <div className="flex-shrink-0 w-7 h-7 rounded-full bg-gray-900 text-white text-xs font-bold flex items-center justify-center mt-0.5">
                  {i + 1}
                </div>
                <div>
                  <div className="font-semibold text-gray-900">{stage.title}</div>
                  <div className="text-gray-500 text-sm mt-0.5 leading-relaxed">{stage.description}</div>
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* FAQ */}
        <section className="mb-12">
          <h2 className="text-xl font-bold text-gray-900 mb-4">Frequently asked questions</h2>
          <div className="space-y-6">
            {company.faqs.map((faq, i) => (
              <div key={i}>
                <div className="font-semibold text-gray-900 mb-1">{faq.q}</div>
                <div className="text-gray-500 text-sm leading-relaxed">{faq.a}</div>
              </div>
            ))}
          </div>
        </section>

        {/* CTA */}
        <div className="border border-gray-200 rounded-2xl p-8 text-center bg-gray-50">
          <h2 className="text-xl font-bold text-gray-900 mb-2">Ready to prep for {company.name}?</h2>
          <p className="text-gray-500 text-sm mb-6">Practice the exact question types that appear in {company.name} FDE interviews.</p>
          <div className="flex gap-3 justify-center flex-wrap">
            <Link href="/practice/behavioral" className="bg-gray-900 text-white text-sm font-semibold px-5 py-2.5 rounded-xl hover:bg-gray-700 transition-colors">
              Behavioral questions →
            </Link>
            <Link href="/practice/system-design" className="border border-gray-300 text-sm font-semibold px-5 py-2.5 rounded-xl hover:bg-white transition-colors text-gray-700">
              System design →
            </Link>
            <Link href="/practice/case-study" className="border border-gray-300 text-sm font-semibold px-5 py-2.5 rounded-xl hover:bg-white transition-colors text-gray-700">
              Case studies →
            </Link>
          </div>
          <div className="mt-4">
            <a href={company.careersUrl} target="_blank" rel="noopener noreferrer" className="text-sm text-gray-400 hover:text-gray-600 underline">
              View open {company.name} roles →
            </a>
          </div>
        </div>
      </main>
    </>
  );
}
