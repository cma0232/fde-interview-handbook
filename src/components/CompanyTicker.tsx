"use client";

import { useRef } from "react";
import type { CompanyJobs } from "@/lib/jobs";

export type SimpleCompany = { name: string; logo: string; url: string };

const TILE_CLASS = "flex items-center gap-3 shrink-0 rounded-2xl px-5 py-4 w-52";

function TickerTrack({
  count,
  reverse,
  children,
}: {
  count: number;
  reverse?: boolean;
  children: React.ReactNode;
}) {
  const trackRef = useRef<HTMLDivElement>(null);
  const duration = Math.max(count * 5, 25);
  const animation = reverse
    ? `ticker-reverse ${duration}s linear infinite`
    : `ticker ${duration}s linear infinite`;

  return (
    <div
      className="relative overflow-hidden w-full"
      onMouseEnter={() => { if (trackRef.current) trackRef.current.style.animationPlayState = "paused"; }}
      onMouseLeave={() => { if (trackRef.current) trackRef.current.style.animationPlayState = "running"; }}
    >
      <div className="pointer-events-none absolute left-0 top-0 h-full w-32 z-10 bg-gradient-to-r from-white to-transparent" />
      <div className="pointer-events-none absolute right-0 top-0 h-full w-32 z-10 bg-gradient-to-l from-white to-transparent" />
      <div ref={trackRef} className="flex gap-4 w-max" style={{ animation }}>
        {children}
      </div>
    </div>
  );
}

/** Row 1 — Unicorns: logo + name, scrolls left */
export function UnicornTicker({ companies }: { companies: SimpleCompany[] }) {
  if (companies.length === 0) return null;
  const items = [...companies, ...companies, ...companies];
  return (
    <TickerTrack count={companies.length}>
      {items.map((c, i) => (
        <a
          key={`${c.name}-${i}`}
          href={c.url}
          target="_blank"
          rel="noopener noreferrer"
          className={`${TILE_CLASS} border bg-white hover:shadow-lg transition-shadow`}
        >
          <div className="w-8 h-8 rounded-xl overflow-hidden flex items-center justify-center shrink-0 bg-white border">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src={c.logo} alt={c.name} width={32} height={32} className="object-contain" />
          </div>
          <div className="min-w-0">
            <div className="text-sm font-bold text-gray-900 truncate">{c.name}</div>
            <div className="mt-1 h-[18px]" />
          </div>
        </a>
      ))}
    </TickerTrack>
  );
}

/** Row 2 — Startups: logo + name + funding badge, scrolls right */
export default function CompanyTicker({ companies }: { companies: CompanyJobs[] }) {
  if (companies.length === 0) return null;
  const items = [...companies, ...companies, ...companies];
  return (
    <TickerTrack count={companies.length} reverse>
      {items.map((c, i) => (
        <a
          key={`${c.name}-${i}`}
          href={c.url}
          target="_blank"
          rel="noopener noreferrer"
          className={`${TILE_CLASS} transition-all ${
            c.funding
              ? "bg-emerald-50 border-2 border-emerald-400 hover:shadow-lg hover:shadow-emerald-100"
              : "bg-white border hover:shadow-lg"
          }`}
        >
          <div className="w-8 h-8 rounded-xl overflow-hidden flex items-center justify-center shrink-0 bg-white border">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src={c.logo} alt={c.name} width={32} height={32} className="object-contain" />
          </div>
          <div className="min-w-0">
            <div className="text-sm font-bold text-gray-900 truncate">{c.name}</div>
            {c.funding ? (
              <div className="mt-1 inline-flex items-center gap-1 bg-emerald-500 text-white text-[10px] font-black px-2 py-0.5 rounded-full uppercase tracking-wide whitespace-nowrap">
                {c.funding}
              </div>
            ) : null}
          </div>
        </a>
      ))}
    </TickerTrack>
  );
}
