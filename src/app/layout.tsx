import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import NavBar from "@/components/NavBar";
import { Analytics } from "@vercel/analytics/next";
import WelcomeEmailTrigger from "@/components/WelcomeEmailTrigger";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
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
  description: "The complete interview prep guide for Forward Deployed Engineer roles at Palantir, Databricks, Scale AI, Anduril, and beyond. 195 curated questions across behavioral, system design, coding, GenAI architecture, and case studies.",
  keywords: ["forward deployed engineer", "FDE interview", "Palantir FDE", "Databricks FDE", "Scale AI interview", "Anduril interview prep", "FDE questions", "forward deployed engineer interview prep"],
  openGraph: {
    type: "website",
    siteName: "FDE Interview Handbook",
    title: "Forward Deployed Engineer Interview Handbook",
    description: "The complete prep guide for FDE roles at Palantir, Databricks, Scale AI, Anduril & beyond.",
    url: BASE_URL,
  },
  twitter: {
    card: "summary_large_image",
    title: "Forward Deployed Engineer Interview Handbook",
    description: "The complete prep guide for FDE roles at Palantir, Databricks, Scale AI, Anduril & beyond.",
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
      className={`${geistSans.variable} ${geistMono.variable} h-full antialiased`}
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
