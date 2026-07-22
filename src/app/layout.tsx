import type { Metadata } from "next";
import { Geist_Mono } from "next/font/google";
import NavBar from "@/components/NavBar";
import { Analytics } from "@vercel/analytics/next";
import WelcomeEmailTrigger from "@/components/WelcomeEmailTrigger";
import "./globals.css";

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

const BASE_URL = "https://fdehandbook.com";

export const metadata: Metadata = {
  metadataBase: new URL(BASE_URL),
  title: {
    default: "FDE Interview Handbook — Forward Deployed Engineer Prep",
    template: "%s | FDE Interview Handbook",
  },
  description: "The only interview prep guide built specifically for Forward Deployed Engineers. 195 questions covering agentic system design, live demo interviews, customer-facing scenarios, and LLM deployment — for FDE roles at Palantir, Databricks, Scale AI, Anduril, and beyond.",
  keywords: [
    "forward deployed engineer interview",
    "FDE interview prep",
    "agentic system design interview",
    "live demo interview",
    "customer-facing engineer interview",
    "LLM deployment interview",
    "agent architecture interview",
    "forward deployed software engineer",
    "FDE technical interview",
    "Palantir FDE interview",
    "Databricks forward deployed engineer",
    "Scale AI FDE",
    "Anduril FDE interview",
  ],
  openGraph: {
    type: "website",
    siteName: "FDE Interview Handbook",
    title: "Forward Deployed Engineer Interview Handbook",
    description: "The only prep guide built for FDE interviews — agentic system design, live demos, customer scenarios, LLM deployment.",
    url: BASE_URL,
  },
  twitter: {
    card: "summary_large_image",
    title: "Forward Deployed Engineer Interview Handbook",
    description: "The only prep guide built for FDE interviews — agentic system design, live demos, customer scenarios, LLM deployment.",
  },
  alternates: { canonical: BASE_URL },
  icons: {
    icon: "/favicon.ico",
    apple: "/apple-touch-icon.png",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      className={`${geistMono.variable} h-full antialiased`}
    >
      <body className="min-h-full flex flex-col">
        <NavBar />
        <WelcomeEmailTrigger />
        <div className="flex-1">{children}</div>
        <footer className="border-t bg-gray-50 mt-16">
          <div className="max-w-4xl mx-auto px-6 py-12 grid grid-cols-1 sm:grid-cols-3 gap-8">
            <div>
              <div className="font-extrabold text-gray-900 text-[15px] mb-2">FDE Interview Handbook</div>
              <p className="text-sm text-gray-400 leading-relaxed">
                The complete prep guide for Forward Deployed Engineer interviews.
              </p>
            </div>
            <div>
              <div className="text-xs font-semibold uppercase tracking-widest text-gray-400 mb-3">Resources</div>
              <ul className="space-y-2 text-sm text-gray-500">
                <li><a href="/start-here" className="hover:text-gray-900 transition-colors">Study Plan</a></li>
                <li><a href="/practice" className="hover:text-gray-900 transition-colors">Practice Questions</a></li>
                <li><a href="/companies" className="hover:text-gray-900 transition-colors">Company Guides</a></li>
                <li><a href="/trends/open-roles" className="hover:text-gray-900 transition-colors">Job Market</a></li>
              </ul>
            </div>
            <div>
              <div className="text-xs font-semibold uppercase tracking-widest text-gray-400 mb-3">Contact</div>
              <ul className="space-y-2 text-sm text-gray-500">
                <li>
                  <a href="mailto:support@fdehandbook.com" className="hover:text-gray-900 transition-colors">
                    support@fdehandbook.com
                  </a>
                </li>
                <li>
                  <a href="https://discord.gg/GnUdge3k3" target="_blank" rel="noopener noreferrer" className="hover:text-gray-900 transition-colors">
                    Discord community
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div className="border-t">
            <div className="max-w-4xl mx-auto px-6 py-4 text-xs text-gray-400">
              © {new Date().getFullYear()} FDE Interview Handbook
            </div>
          </div>
        </footer>
        <Analytics />
      </body>
    </html>
  );
}
