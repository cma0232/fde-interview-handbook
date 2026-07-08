"use client";

import Link from "next/link";
import { createClient } from "@/lib/supabase-browser";
import { useEffect, useState, useRef } from "react";
import { User } from "@supabase/supabase-js";
import UserMenu from "./UserMenu";
import OctopusLogo from "./OctopusLogo";
import { CATEGORIES } from "@/lib/categories";

function NavDropdown({
  label,
  items,
}: {
  label: string;
  items: { href: string; label: string; description?: string }[];
}) {
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    function handleClick(e: MouseEvent) {
      if (ref.current && !ref.current.contains(e.target as Node)) {
        setOpen(false);
      }
    }
    document.addEventListener("mousedown", handleClick);
    return () => document.removeEventListener("mousedown", handleClick);
  }, []);

  return (
    <div ref={ref} className="relative">
      <button
        onClick={() => setOpen((o) => !o)}
        className="flex items-center gap-1 text-[15px] text-gray-600 hover:text-gray-900 transition-colors py-1"
      >
        {label}
        <svg
          className={`w-3.5 h-3.5 transition-transform ${open ? "rotate-180" : ""}`}
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          strokeWidth={2}
        >
          <path strokeLinecap="round" strokeLinejoin="round" d="M19 9l-7 7-7-7" />
        </svg>
      </button>

      {open && (
        <div className="absolute top-full left-0 mt-2 w-56 bg-white border border-gray-100 rounded-xl shadow-lg z-50 py-1.5 overflow-hidden">
          {items.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              onClick={() => setOpen(false)}
              className="block px-4 py-2.5 hover:bg-gray-50 transition-colors"
            >
              <div className="text-[15px] font-medium text-gray-800">{item.label}</div>
              {item.description && (
                <div className="text-[13px] text-gray-400 mt-0.5">{item.description}</div>
              )}
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}

export default function NavBar() {
  const [user, setUser] = useState<User | null>(null);
  const supabase = createClient();

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => setUser(data.user));
    const { data: listener } = supabase.auth.onAuthStateChange((_e, session) => {
      setUser(session?.user ?? null);
    });
    return () => listener.subscription.unsubscribe();
  }, []);

  const practiceItems = CATEGORIES.map((c) => ({
    href: `/practice/${c.id}`,
    label: `${c.icon} ${c.label}`,
    description: c.description,
  }));

  const trendsItems = [
    {
      href: "/trends/open-roles",
      label: "Open Roles",
      description: "Live FDE openings & weekly trend",
    },
    {
      href: "/trends/news",
      label: "Industry News",
      description: "Daily FDE & AI deployment news",
    },
  ];

  return (
    <nav className="border-b px-6 py-3 flex items-center justify-between sticky top-0 bg-white z-40">
      <Link href="/" className="flex items-center gap-2 shrink-0">
        <OctopusLogo size={26} />
        <span className="font-extrabold tracking-tight text-[17px] text-gray-900">
          FDE Interview Handbook
        </span>
      </Link>

      <div className="flex items-center gap-5">
        <NavDropdown label="Trends" items={trendsItems} />
        <Link href="/start-here" className="text-[15px] text-gray-600 hover:text-gray-900 transition-colors">
          Start Here
        </Link>
        <Link href="/companies" className="text-[15px] text-gray-600 hover:text-gray-900 transition-colors">
          Companies
        </Link>
        <NavDropdown label="Practice" items={practiceItems} />
      </div>

      <div className="flex items-center gap-3">
        <Link
          href="/upgrade"
          className="text-[15px] border border-gray-300 text-gray-700 px-3.5 py-1.5 rounded-lg hover:bg-gray-50 transition-colors"
        >
          Membership
        </Link>
        <a
          href="https://discord.gg/GnUdge3k3"
          target="_blank"
          rel="noopener noreferrer"
          className="text-[15px] bg-indigo-600 text-white px-3.5 py-1.5 rounded-lg hover:bg-indigo-500 transition-colors flex items-center gap-1.5"
        >
          <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M20.317 4.37a19.791 19.791 0 0 0-4.885-1.515.074.074 0 0 0-.079.037c-.21.375-.444.864-.608 1.25a18.27 18.27 0 0 0-5.487 0 12.64 12.64 0 0 0-.617-1.25.077.077 0 0 0-.079-.037A19.736 19.736 0 0 0 3.677 4.37a.07.07 0 0 0-.032.027C.533 9.046-.32 13.58.099 18.057a.082.082 0 0 0 .031.057 19.9 19.9 0 0 0 5.993 3.03.078.078 0 0 0 .084-.028c.462-.63.874-1.295 1.226-1.994a.076.076 0 0 0-.041-.106 13.107 13.107 0 0 1-1.872-.892.077.077 0 0 1-.008-.128 10.2 10.2 0 0 0 .372-.292.074.074 0 0 1 .077-.01c3.928 1.793 8.18 1.793 12.062 0a.074.074 0 0 1 .078.01c.12.098.246.198.373.292a.077.077 0 0 1-.006.127 12.299 12.299 0 0 1-1.873.892.077.077 0 0 0-.041.107c.36.698.772 1.362 1.225 1.993a.076.076 0 0 0 .084.028 19.839 19.839 0 0 0 6.002-3.03.077.077 0 0 0 .032-.054c.5-5.177-.838-9.674-3.549-13.66a.061.061 0 0 0-.031-.03zM8.02 15.33c-1.183 0-2.157-1.085-2.157-2.419 0-1.333.956-2.419 2.157-2.419 1.21 0 2.176 1.096 2.157 2.42 0 1.333-.956 2.418-2.157 2.418zm7.975 0c-1.183 0-2.157-1.085-2.157-2.419 0-1.333.955-2.419 2.157-2.419 1.21 0 2.176 1.096 2.157 2.42 0 1.333-.946 2.418-2.157 2.418z"/></svg>
          Discord
        </a>
        {user ? (
          <UserMenu />
        ) : (
          <Link
            href="/login"
            className="text-[15px] bg-gray-900 text-white px-3.5 py-1.5 rounded-lg hover:bg-gray-700 transition-colors"
          >
            Sign in / up
          </Link>
        )}
      </div>
    </nav>
  );
}
