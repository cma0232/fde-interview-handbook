import { Question } from "@/types";

const questions: Question[] = [
  {
    id: "b1",
    category: "behavioral",
    title: "Tell me about a time you had to push back on a client request.",
    difficulty: "medium",
    content: `A client asks you to build a feature that you believe will not solve their underlying problem — and may create technical debt.

**What to cover:**
- How did you identify the mismatch between their request and actual need?
- How did you communicate your concern diplomatically?
- What was the outcome?

Use the **STAR format**: Situation → Task → Action → Result.`,
    hints: [
      "Focus on the business outcome, not just the technical concern.",
      "Show you listened first before pushing back.",
      "Quantify the result if possible (e.g., saved 2 weeks of rework).",
    ],
    solution: `**Strong answer structure:**

**S** — Client at [Company] wanted a custom dashboard export in a proprietary format.
**T** — My job was to deliver value, not just ship features.
**A** — I ran a 30-min discovery call to understand *why* they wanted it. Turned out they needed the data in their BI tool — which already had a standard CSV connector. I proposed that instead.
**R** — Saved 3 weeks of eng time. Client got their insight 2 weeks faster.

**Key signals interviewers look for:** curiosity, diplomacy, outcome-orientation.`,
  },
  {
    id: "b2",
    category: "behavioral",
    title: "Describe a situation where you had to learn a new domain quickly.",
    difficulty: "easy",
    content: `FDEs are dropped into unfamiliar industries — oil & gas, defense, healthcare, logistics.

Describe a time you had to become "good enough" at a new domain in a short period to be effective with a client.

**What to cover:**
- What was the domain and why was it unfamiliar?
- What was your learning strategy?
- How did you demonstrate competence to the client?`,
    hints: [
      "Mention specific resources: domain experts, documentation, shadowing.",
      "Show you know the difference between surface-level jargon and deep understanding.",
    ],
    solution: `**Strong answer structure:**

Emphasize *speed* and *strategy*: you didn't try to become an expert, you identified the 20% of domain knowledge that would cover 80% of client conversations and went deep there first.

Show that you built credibility by asking good questions, not by pretending to know things.`,
  },
  {
    id: "b3",
    category: "behavioral",
    title: "Give an example of when you influenced without authority.",
    difficulty: "hard",
    content: `You don't manage the client's engineering team, but you need them to change how they work.

Describe a situation where you drove a meaningful change without having formal authority.`,
    hints: [
      "Power comes from expertise, relationships, and framing — show all three.",
      "Be specific about resistance you faced.",
    ],
    solution: `**Key framing:** You built a coalition. You found internal champions. You made the path of least resistance align with what you needed.

Avoid answers where you "just convinced them" without explaining *how*.`,
  },
];

export default questions;
