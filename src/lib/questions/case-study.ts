import { Question } from "@/types";

const questions: Question[] = [
  {
    id: "cs1",
    category: "case-study",
    title: "A logistics company wants to reduce detention fees by 20%. How do you approach this?",
    difficulty: "hard",
    content: `**Background:** Detention fees are charges incurred when a truck waits at a facility beyond the agreed free time. Your client (a large 3PL) is paying $4M/year in detention fees and wants to cut that by 20%.

They have data from their TMS (Transportation Management System) including: load details, driver check-in/out times, facility dwell times, appointment times.

**Your job as the FDE:**
1. How do you scope and prioritize this problem?
2. What data analysis would you do first?
3. What solution would you propose, and how would you validate it?`,
    hints: [
      "Start with data, not solutions. What does the distribution of detention events look like? Which facilities? Which carriers?",
      "The 80/20 rule almost certainly applies here — a few facilities likely drive most fees.",
      "Consider both predictive (alert before detention happens) and operational (fix the process) solutions.",
    ],
    solution: `**Discovery:**
- Pull detention events by facility, carrier, time-of-day, day-of-week
- Hypothesis: 20% of facilities → 80% of fees (confirm with data)
- Identify root causes per cluster: missed appointments? Slow unloading? Staffing gaps?

**Analysis:**
- Average dwell time vs scheduled dwell time per facility
- Correlation: which appointment slots have highest detention rate?
- Carrier-level analysis: is detention concentrated with specific drivers/carriers?

**Proposed solution:**
- Real-time dwell time alerting: when a truck hits 80% of free time, auto-alert the facility manager
- Appointment slot optimization: reschedule high-risk slots to low-contention windows
- Carrier scorecard: surface detention rate per carrier to procurement team

**Validation:**
- Pilot at top 3 detention facilities
- A/B test: treated vs control appointment slots
- Target: 20% reduction in avg dwell time at pilot sites within 60 days`,
  },
  {
    id: "cs2",
    category: "case-study",
    title: "Your client's ops team refuses to adopt the software you deployed. What do you do?",
    difficulty: "medium",
    content: `You've deployed a new workflow management tool at a manufacturing client. The software works technically, but 6 weeks in, the ops team (30 people) is still using spreadsheets. The project sponsor is frustrated. You have 4 weeks before your engagement ends.

**What do you do?**`,
    hints: [
      "Diagnose before prescribing. What's the actual reason for non-adoption? (UX? Training? Trust? Incentives? Politics?)",
      "Find your internal champion. Who on the ops team is already using it, even a little?",
      "Don't fight spreadsheets — bridge to them.",
    ],
    solution: `**Week 1 — Diagnose:**
- Ride-along with 3-5 ops team members during their actual workflow
- Don't ask "why aren't you using it?" — ask "walk me through your day"
- Likely findings: the new tool adds steps for their core task, or they don't trust the data in it yet

**Week 2 — Quick wins:**
- Fix the top 1-2 friction points surfaced in diagnosis (if technical, fix it; if UX, escalate to product)
- Find the one person who's already using it and make them look good (public recognition from their manager)

**Week 3 — Bridge:**
- If they love spreadsheets, add a CSV export that matches their existing format
- Run a "lunch and learn" that shows the tool doing something they currently can't do in sheets

**Week 4 — Handoff:**
- Document 3 workflows where the tool is clearly better, with before/after metrics
- Brief the sponsor on what will drive continued adoption post-engagement

**Key principle:** adoption is a change management problem, not a technical one.`,
  },
  {
    id: "cs3",
    category: "case-study",
    title: "Prioritize a backlog of 12 feature requests from 3 different enterprise clients.",
    difficulty: "medium",
    content: `You're the FDE managing 3 enterprise clients simultaneously. Each has submitted feature requests through your ticketing system — 4 requests each, 12 total. Your eng team can ship 3 features next sprint.

**Client A** — $2M ARR, renewal in 6 weeks, health score: yellow
**Client B** — $500K ARR, renewal in 6 months, health score: green
**Client C** — $1.5M ARR, renewal in 3 months, health score: red (at-risk)

Some requests overlap across clients. Some are quick (1 day) and some are large (2 weeks).

**How do you prioritize?**`,
    hints: [
      "ARR at risk × renewal timing is your starting frame, but it's not the only input.",
      "Look for overlap — a feature two clients want is more defensible to build.",
      "Separate 'what we build' from 'what we communicate' — sometimes a commitment and timeline satisfies a client more than the feature itself.",
    ],
    solution: `**Framework:**

1. **Triage by revenue at risk:**
   - Client C ($1.5M, red, 3 months) → top priority. What feature(s) would move their health score?
   - Client A ($2M, yellow, 6 weeks) → critical. Renewal is imminent.
   - Client B (green, 6 months) → can wait.

2. **Find overlap:** Map all 12 requests. Any feature requested by both A and C is high-priority leverage.

3. **Effort-impact matrix:** Of the 3 slots, prefer 1 quick win per at-risk client (shows momentum) + 1 overlapping feature (efficient use of eng time).

4. **Communicate proactively:** For features not in this sprint, set explicit timelines.

**Anti-pattern to avoid:** prioritizing by loudest client voice, or by which PM is most persistent internally.`,
  },
];

export default questions;
