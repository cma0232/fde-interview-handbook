#!/usr/bin/env node
/**
 * Sync questions from prod Supabase → dev Supabase
 * Usage: node scripts/sync-questions.mjs
 *
 * Reads PROD_SUPABASE_URL + PROD_SERVICE_ROLE_KEY from env (or hardcoded below),
 * and writes to the dev DB via .env.local keys.
 */

import { createClient } from "@supabase/supabase-js";
import { config } from "dotenv";
import { resolve, dirname } from "path";
import { fileURLToPath } from "url";

const __dirname = dirname(fileURLToPath(import.meta.url));
config({ path: resolve(__dirname, "../.env.local") });
config({ path: resolve(__dirname, "../.env.local.prod"), override: false });

const PROD_URL = "https://qkfkgpkcvrbrsgxkaedq.supabase.co";
const PROD_KEY =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFrZmtncGtjdnJicnNneGthZWRxIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MjM0MjU1NiwiZXhwIjoyMDk3OTE4NTU2fQ.OwpI_LfAqEzi6_ez3hZ3hT3JwYMim2Tuw73l0r8JCMA";

const DEV_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const DEV_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!DEV_URL || !DEV_KEY) {
  console.error("Missing dev Supabase env vars — check .env.local");
  process.exit(1);
}

const prod = createClient(PROD_URL, PROD_KEY);
const dev = createClient(DEV_URL, DEV_KEY);

async function sync() {
  console.log("Fetching questions from prod...");
  const { data, error } = await prod
    .from("questions")
    .select("*")
    .eq("status", "published");

  if (error) throw new Error("Prod fetch failed: " + error.message);
  console.log(`Found ${data.length} published questions`);

  const rows = data.map(({ created_at, tags, ...rest }) => rest);
  const { error: upsertError } = await dev
    .from("questions")
    .upsert(rows, { onConflict: "id" });

  if (upsertError) throw new Error("Dev upsert failed: " + upsertError.message);
  console.log("Done — questions synced to dev DB");
}

sync().catch((e) => {
  console.error(e.message);
  process.exit(1);
});
