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
        <NavDropdown label="Practice" items={practiceItems} />
      </div>

      <div className="flex items-center gap-3">
        <Link
          href="/upgrade"
          className="text-[15px] border border-gray-300 text-gray-700 px-3.5 py-1.5 rounded-lg hover:bg-gray-50 transition-colors"
        >
          Membership
        </Link>
        {user ? (
          <UserMenu />
        ) : (
          <Link
            href="/login"
            className="text-[15px] bg-gray-900 text-white px-3.5 py-1.5 rounded-lg hover:bg-gray-700 transition-colors"
          >
            Sign in
          </Link>
        )}
      </div>
    </nav>
  );
}
