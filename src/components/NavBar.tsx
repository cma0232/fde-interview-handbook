"use client";

import Link from "next/link";
import { createClient } from "@/lib/supabase-browser";
import { useEffect, useState } from "react";
import { User } from "@supabase/supabase-js";

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

  async function signOut() {
    await supabase.auth.signOut();
    setUser(null);
  }

  return (
    <nav className="border-b px-6 py-3 flex items-center justify-between">
      <Link href="/" className="font-bold text-gray-900 text-sm">FDE Handbook</Link>
      <div className="flex items-center gap-4">
        <a
          href="mailto:chokochanghong@gmail.com"
          className="text-sm text-gray-400 hover:text-gray-600"
        >
          Contact
        </a>
        <Link
          href="/upgrade"
          className="text-sm border border-gray-300 text-gray-700 px-3 py-1.5 rounded-lg hover:bg-gray-50 transition-colors"
        >
          Join Membership
        </Link>
        {user ? (
          <button
            onClick={signOut}
            className="text-sm text-gray-500 hover:text-gray-900"
          >
            Sign out
          </button>
        ) : (
          <Link
            href="/login"
            className="text-sm bg-gray-900 text-white px-3 py-1.5 rounded-lg hover:bg-gray-700 transition-colors"
          >
            Sign in
          </Link>
        )}
      </div>
    </nav>
  );
}
