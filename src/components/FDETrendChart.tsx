"use client";

import { LineChart, Line, XAxis, YAxis, Tooltip, ResponsiveContainer, CartesianGrid } from "recharts";

type Snapshot = { week: string; total: number };

export default function FDETrendChart({ data }: { data: Snapshot[] }) {
  if (data.length < 2) {
    return (
      <div className="h-48 flex items-center justify-center text-sm text-gray-400 border rounded-xl">
        Collecting data — chart will appear after a few weeks
      </div>
    );
  }

  return (
    <ResponsiveContainer width="100%" height={200}>
      <LineChart data={data} margin={{ top: 8, right: 8, left: -16, bottom: 0 }}>
        <CartesianGrid strokeDasharray="3 3" stroke="#f3f4f6" />
        <XAxis
          dataKey="week"
          tick={{ fontSize: 11, fill: "#9ca3af" }}
          tickFormatter={(v) => new Date(v).toLocaleDateString("en-US", { month: "short", day: "numeric" })}
        />
        <YAxis tick={{ fontSize: 11, fill: "#9ca3af" }} />
        <Tooltip
          formatter={(v) => [`${v} open roles`, "FDE positions"]}
          labelFormatter={(v) => new Date(v).toLocaleDateString("en-US", { month: "long", day: "numeric" })}
          contentStyle={{ fontSize: 12, borderRadius: 8, border: "1px solid #e5e7eb" }}
        />
        <Line
          type="monotone"
          dataKey="total"
          stroke="#111827"
          strokeWidth={2}
          dot={{ r: 4, fill: "#111827" }}
          activeDot={{ r: 6 }}
        />
      </LineChart>
    </ResponsiveContainer>
  );
}
