import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "AI Native Blogs — Reads for Forward Deployed Engineers",
  description: "What practitioners are saying about AI-native engineering.",
  alternates: { canonical: "https://fdehandbook.com/ai-native/blogs" },
};

type BlogPost = {
  url: string;
  title: string;
  description: string;
  og_image: string | null;
  source: string;
  published_at: string;
};

function timeAgo(dateStr: string) {
  const diff = Date.now() - new Date(dateStr).getTime();
  const days = Math.floor(diff / 86400000);
  const hours = Math.floor(diff / 3600000);
  if (days > 30) return new Date(dateStr).toLocaleDateString("en-US", { month: "short", day: "numeric", year: "numeric" });
  if (days > 0) return `${days}d ago`;
  if (hours > 0) return `${hours}h ago`;
  return "just now";
}

const BLOGS: BlogPost[] = [
  {
    url: "/ai-native/blogs/fde-30-day-guide",
    title: "How to Prepare for an FDE Interview in 30 Days (2026 Guide)",
    description: "Most engineers treat FDE interviews like SDE interviews. That's the mistake. Here's how to actually prep.",
    og_image: "https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=1200&h=630&fit=crop&q=80",
    source: "FDE Handbook",
    published_at: "2026-07-14T00:00:00Z",
  },
  {
    url: "https://blog.bytebytego.com/p/a-practical-guide-to-becoming-an",
    title: "A Practical Guide to Becoming an AI-Native Engineer",
    description: "This piece is a working guide for engineers who want to land on the productive side of that split.",
    og_image: "https://substackcdn.com/image/fetch/$s_!I3y0!,w_1200,h_675,c_fill,f_jpg,q_auto:good,fl_progressive:steep,g_auto/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8bcec742-8919-4c38-9f8b-6697fa0b6423_2048x1076.png",
    source: "ByteByteGo",
    published_at: "2025-06-01T00:00:00Z",
  },
];

export default function BlogsPage() {
  return (
    <main className="w-full max-w-4xl mx-auto px-6 py-14">
      <div className="mb-10">
        <div className="text-xs text-gray-400 font-medium uppercase tracking-widest mb-2">AI Native · Blogs</div>
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Blogs</h1>
        <p className="text-base text-gray-500">What practitioners are saying about AI-native engineering.</p>
      </div>

      {BLOGS.length === 0 ? (
        <div className="border rounded-2xl p-10 text-center text-gray-400">
          <div className="text-3xl mb-3">📝</div>
          <div className="font-medium text-gray-600">No posts yet</div>
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
          {BLOGS.map((post) => {
            const isInternal = post.url.startsWith("/");
            const Wrapper = isInternal ? Link : "a";
            const extra = isInternal ? {} : { target: "_blank", rel: "noopener noreferrer" };
            return (
            <Wrapper
              key={post.url}
              href={post.url}
              {...extra}
              className="group flex flex-col rounded-2xl border overflow-hidden hover:shadow-lg transition-shadow"
            >
              <div className="h-44 bg-gray-100 overflow-hidden">
                {post.og_image ? (
                  <img
                    src={post.og_image}
                    alt={post.title}
                    className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                  />
                ) : (
                  <div className="w-full h-full flex items-center justify-center text-gray-300 text-4xl">📝</div>
                )}
              </div>
              <div className="flex flex-col flex-1 p-4">
                <div className="text-xs text-gray-400 mb-1.5 flex items-center gap-2">
                  <span className="font-medium text-gray-500">{post.source}</span>
                  <span>·</span>
                  <span>{timeAgo(post.published_at)}</span>
                </div>
                <h2 className="text-sm font-semibold text-gray-900 leading-snug mb-2 group-hover:text-black line-clamp-2">
                  {post.title}
                </h2>
                {post.description && (
                  <p className="text-xs text-gray-500 leading-relaxed line-clamp-2 mt-auto">
                    {post.description}
                  </p>
                )}
              </div>
            </Wrapper>
            );
          })}
        </div>
      )}
    </main>
  );
}
