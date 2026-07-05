"use client";

import { useRef } from "react";
import type { CompanyJobs } from "@/lib/jobs";

export default function CompanyTicker({
  companies,
  reverse = false,
}: {
  companies: CompanyJobs[];
  reverse?: boolean;
}) {
  const trackRef = useRef<HTMLDivElement>(null);

  if (companies.length === 0) return null;

  const items = [...companies, ...companies, ...companies];

  return (
    <div
      className="relative overflow-hidden w-full"
      onMouseEnter={() => {
        if (trackRef.current) trackRef.current.style.animationPlayState = "paused";
      }}
      onMouseLeave={() => {
        if (trackRef.current) trackRef.current.style.animationPlayState = "running";
      }}
    >
      <div className="pointer-events-none absolute left-0 top-0 h-full w-24 z-10 bg-gradient-to-r from-white to-transparent" />
      <div className="pointer-events-none absolute right-0 top-0 h-full w-24 z-10 bg-gradient-to-l from-white to-transparent" />

      <div
        ref={trackRef}
        className="flex gap-3 w-max"
        style={{ animation: `${reverse ? "ticker-reverse" : "ticker"} ${companies.length * 5}s linear infinite` }}
      >
        {items.map((c, i) => (
          <a
            key={`${c.name}-${i}`}
            href={c.url}
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center gap-3 shrink-0 border rounded-xl px-4 py-3 bg-white hover:shadow-md transition-shadow min-w-44"
          >
            <div className="w-8 h-8 rounded-lg overflow-hidden bg-gray-50 border flex items-center justify-center shrink-0">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src={c.logo} alt={c.name} width={32} height={32} className="object-contain" />
            </div>
            <div className="min-w-0">
              <div className="text-sm font-semibold text-gray-900 truncate">{c.name}</div>
              <div className="text-xs text-gray-400">
                <span className="font-medium text-gray-700">{c.count}</span> open roles
              </div>
              {c.funding && (
                <div className="text-xs text-emerald-600 font-medium">{c.funding}</div>
              )}
            </div>
          </a>
        ))}
      </div>
    </div>
  );
}
