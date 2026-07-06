import { MetadataRoute } from "next";
import { CATEGORIES } from "@/lib/categories";

export default function sitemap(): MetadataRoute.Sitemap {
  const base = "https://fdehandbook.com";
  const now = new Date();

  const categoryPages = CATEGORIES.map((cat) => ({
    url: `${base}/practice/${cat.id}`,
    lastModified: now,
    changeFrequency: "weekly" as const,
    priority: 0.8,
  }));

  return [
    { url: base,                           lastModified: now, changeFrequency: "daily",   priority: 1.0 },
    { url: `${base}/start-here`,           lastModified: now, changeFrequency: "monthly", priority: 0.9 },
    { url: `${base}/practice`,             lastModified: now, changeFrequency: "weekly",  priority: 0.9 },
    ...categoryPages,
    { url: `${base}/trends/open-roles`,    lastModified: now, changeFrequency: "weekly",  priority: 0.8 },
    { url: `${base}/trends/news`,          lastModified: now, changeFrequency: "daily",   priority: 0.7 },
    { url: `${base}/upgrade`,              lastModified: now, changeFrequency: "monthly", priority: 0.6 },
  ];
}
