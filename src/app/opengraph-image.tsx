import { ImageResponse } from "next/og";

export const runtime = "edge";
export const alt = "FDE Interview Handbook";
export const size = { width: 1200, height: 630 };
export const contentType = "image/png";

export default function OGImage() {
  return new ImageResponse(
    (
      <div
        style={{
          background: "#fff",
          width: "100%",
          height: "100%",
          display: "flex",
          flexDirection: "column",
          justifyContent: "center",
          padding: "80px",
          fontFamily: "sans-serif",
          borderTop: "8px solid #111827",
        }}
      >
        <div style={{ fontSize: 22, color: "#6b7280", marginBottom: 24, letterSpacing: 4, textTransform: "uppercase" }}>
          fdehandbook.com
        </div>
        <div style={{ fontSize: 64, fontWeight: 800, color: "#111827", lineHeight: 1.1, marginBottom: 32 }}>
          Forward Deployed Engineer{"\n"}Interview Handbook
        </div>
        <div style={{ fontSize: 28, color: "#6b7280", lineHeight: 1.5 }}>
          The complete prep guide for FDE roles at Palantir,{"\n"}Databricks, Scale AI, Anduril &amp; beyond.
        </div>
        <div style={{ marginTop: 48, display: "flex", gap: 16 }}>
          {["Behavioral", "System Design", "Coding", "GenAI Architecture", "Case Study"].map((tag) => (
            <div key={tag} style={{ background: "#f3f4f6", borderRadius: 8, padding: "8px 16px", fontSize: 18, color: "#374151", fontWeight: 600 }}>
              {tag}
            </div>
          ))}
        </div>
      </div>
    ),
    { ...size }
  );
}
