import { createClient } from "@supabase/supabase-js";

export function createServiceClient() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    {
      global: {
        // Bypass Next.js fetch cache so queries always hit Supabase directly
        fetch: (url, opts) => fetch(url, { ...opts, cache: "no-store" }),
      },
    }
  );
}
