import type { Metadata } from "next";
import { Nunito, Geist_Mono } from "next/font/google";
import NavBar from "@/components/NavBar";
import { Analytics } from "@vercel/analytics/next";
import WelcomeEmailTrigger from "@/components/WelcomeEmailTrigger";
import "./globals.css";

const nunito = Nunito({
  variable: "--font-geist-sans",
  subsets: ["latin"],
  weight: ["400", "500", "600", "700", "800"],
});

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
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      className={`${nunito.variable} ${geistMono.variable} h-full antialiased`}
    >
      <body className="min-h-full flex flex-col">
        <NavBar />
        <WelcomeEmailTrigger />
        {children}
        <Analytics />
      </body>
    </html>
  );
}
