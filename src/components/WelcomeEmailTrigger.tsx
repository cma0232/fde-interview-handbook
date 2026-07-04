"use client";

import { useEffect } from "react";
import { createClient } from "@/lib/supabase-browser";

export default function WelcomeEmailTrigger() {
  useEffect(() => {
    const run = async () => {
      const supabase = createClient();
      const { data: { user } } = await supabase.auth.getUser();
      if (!user?.email) return;

      // Server handles deduplication via welcome_email_sent flag
      fetch("/api/send-welcome", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ userId: user.id, email: user.email }),
      }).catch(() => {});
    };
    run();
  }, []);

  return null;
}
