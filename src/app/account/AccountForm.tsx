"use client";

import { useState } from "react";
import { User } from "@supabase/supabase-js";

interface Profile {
  username?: string | null;
  avatar_url?: string | null;
  linkedin_url?: string | null;
  github_url?: string | null;
}

export default function AccountForm({ user, profile }: { user: User; profile: Profile | null }) {
  const [form, setForm] = useState({
    username: profile?.username ?? "",
    avatar_url: profile?.avatar_url ?? "",
    linkedin_url: profile?.linkedin_url ?? "",
    github_url: profile?.github_url ?? "",
  });
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);

  async function handleSave() {
    setSaving(true);
    await fetch("/api/account", {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(form),
    });
    setSaving(false);
    setSaved(true);
    setTimeout(() => setSaved(false), 2000);
  }

  return (
    <div className="space-y-5">
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
        <input
          value={user.email ?? ""}
          disabled
          className="w-full border rounded-lg px-3 py-2 text-sm text-gray-400 bg-gray-50"
        />
      </div>

      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Username</label>
        <input
          value={form.username}
          onChange={e => setForm(f => ({ ...f, username: e.target.value }))}
          placeholder="your name"
          className="w-full border rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-gray-300"
        />
      </div>

      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Avatar URL</label>
        <input
          value={form.avatar_url}
          onChange={e => setForm(f => ({ ...f, avatar_url: e.target.value }))}
          placeholder="https://..."
          className="w-full border rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-gray-300"
        />
      </div>

      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">LinkedIn</label>
        <input
          value={form.linkedin_url}
          onChange={e => setForm(f => ({ ...f, linkedin_url: e.target.value }))}
          placeholder="https://linkedin.com/in/..."
          className="w-full border rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-gray-300"
        />
      </div>

      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">GitHub</label>
        <input
          value={form.github_url}
          onChange={e => setForm(f => ({ ...f, github_url: e.target.value }))}
          placeholder="https://github.com/..."
          className="w-full border rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-gray-300"
        />
      </div>

      <button
        onClick={handleSave}
        disabled={saving}
        className="w-full bg-gray-900 text-white text-sm font-medium py-2.5 rounded-lg hover:bg-gray-700 transition-colors disabled:opacity-50"
      >
        {saved ? "Saved ✓" : saving ? "Saving…" : "Save changes"}
      </button>
    </div>
  );
}
