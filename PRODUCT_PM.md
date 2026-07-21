# FDE Handbook — Product Overview & Roadmap

*Generated from a codebase audit on 2026-07-04. This reflects what's actually implemented, not the marketing copy.*

## 1. What this product is

FDE Handbook is an interview-prep SaaS for Forward Deployed Engineer (and adjacent solutions/field engineer) roles at companies like Palantir, Databricks, Scale AI, and Anduril. The core loop: a visitor lands on the homepage, sees live job-market signal (open FDE roles, weekly trend), browses practice questions across five categories, hits a paywall on most questions, and converts to one of three subscription tiers via Stripe.

**Target user**: engineers or technical hires (often SWE/data background) preparing for FDE-style interviews, who need both technical practice (system design, coding, GenAI architecture) and role-specific framing (behavioral STAR stories, customer-facing case studies) that generic interview-prep sites don't cover.

## 2. What's actually built today

**Content & practice**
- Five categories: Behavioral, System Design, Coding, GenAI Architecture, Customer-Facing Case Study. Each question has a difficulty tag (easy/medium/hard) and a free/locked flag.
- Question gating is enforced server-side (`getQuestions`/`getQuestion` in `src/lib/questions/index.ts`) — locked question titles are nulled out on the server, not just hidden with CSS. This is correct and worth keeping as-is.
- Practice question titles for locked items on the category-listing page are currently replaced with placeholder lorem-ipsum text (`FAKE_TITLES` in `practice/[category]/page.tsx`) rather than the real (blurred) titles — intentional obfuscation, but worth a sanity check that this still looks reasonable at all list lengths.

**Monetization**
- Three Stripe plans: Monthly $29, 3-Month $49 ("save 44%", marked most-popular), Annual $99 ("save 71%").
- Membership status is read from a `profiles.is_member` flag in Supabase; checkout, webhook, and cancel-subscription routes exist (`/api/checkout`, `/api/webhook`, `/api/cancel-subscription`).

**Acquisition / trust surfaces**
- Homepage hero shows a live count of open FDE roles, sourced by polling Greenhouse/Lever job boards for FDE-keyword matches (`src/lib/jobs.ts`), revalidated weekly.
- Company ticker shows named companies with live open-role counts — currently hardcoded to 6 "established" companies (Palantir, Databricks, Scale AI, Anduril, Cloudflare, MongoDB) and 1 "recently funded" startup (Mistral AI). This list requires a manual code change to grow.
- `/start-here` is a static onboarding page: what an FDE actually does, an FDE-vs-SWE comparison table, and a 30-day prep plan.
- `/trends/open-roles` — job market trend page (same data source as homepage).
- `/trends/essays` — **placeholder only**, renders "Coming soon."

**Account & auth**
- Supabase auth (magic-link style), account page, membership management with a cancel flow, welcome email trigger on signup.

**Design system**: Next.js 16 + Tailwind v4 + shadcn primitives (`Button`/`Card`/`Badge`/`Progress` exist under `src/components/ui` but aren't used anywhere yet — all current pages hand-roll Tailwind classes directly).

## 3. Gaps and risks worth knowing about

- **`UserProgress` type exists in `src/types/index.ts` but has zero usages anywhere in the codebase.** Progress tracking (which questions a user has done/attempted) was clearly planned but never wired up. This is probably the single highest-leverage retention feature missing today — without it, there's no reason for a paying member to come back to the same category twice.
- **Essays section is a stub.** It's linked from the nav (`Trends → Industry Essays`) but has no content. Either fill it or remove the nav entry — a dead-end "coming soon" page hurts trust on a paid product.
- **Company ticker data is hardcoded and thin** (6 + 1 companies). The homepage's implicit promise ("beyond" Palantir/Databricks/Scale AI/Anduril) isn't backed by breadth in the ticker itself.
- **No search or filtering** on the practice question lists — fine at low question counts, will matter once content grows past a page or two per category.
- **Marketing copy claims "195 questions"** (upgrade page) — this number lives in hand-written copy, not derived from the actual question count in Supabase. Worth automating or at least periodically re-verifying so the number never drifts from reality.
- Two pre-existing lint issues fixed during this session: a conditional-hook bug in `CompanyTicker` (hook was called after an early return) and a lint rule flagging direct `window.location.href` assignment in the checkout flow (left as-is, functionally fine, but worth a follow-up if you want a clean lint run).

## 4. Suggested roadmap

**P0 — before pushing much more traffic**
1. Ship basic progress tracking (mark question as done/in-progress) using the already-defined `UserProgress` type. Minimum viable version: a `question_progress` table + a checkbox on the question page. This is the biggest lever for member retention and justifies the subscription price beyond a one-time content dump.
2. Decide on Essays: either publish 3-5 launch posts (good, low-cost SEO surface for "FDE interview" long-tail search terms) or remove the nav link until there's content.
3. Verify the "195 questions" claim against the live Supabase count, and set a process (even a manual monthly check) to keep it accurate.

**P1 — growth & conversion**
4. Expand the company ticker data source — either add more companies to the hardcoded list or (better) move it to a small config table so it doesn't require a code deploy to update.
5. Add a lightweight search/filter on `/practice/[category]` once any category exceeds ~20 questions.
6. Instrument the funnel: homepage visit → practice page → locked-question hit → `/upgrade` view → checkout start → paid. Right now there's no way to see where people drop off (Vercel Analytics is installed but likely only tracking page views).

**P2 — differentiation**
7. A timed/mock-interview mode (pick N questions across categories, simulate a real interview block) — natural extension of the existing category + difficulty model.
8. Referral or team/cohort pricing — FDE candidates often prep in cohorts (bootcamps, new-grad programs); a group discount could be a distinct acquisition channel from solo SEO/organic traffic.
9. Migrate hand-rolled Tailwind markup to the existing shadcn primitives (`Button`, `Card`, `Badge`) now that they're installed but unused — mostly a maintainability investment, not user-facing, but worth doing before the page count grows much further.

## 5. Metrics to start tracking now

- Free → paid conversion rate (visit to `/upgrade` → completed checkout).
- Question completion rate per category, once progress tracking ships.
- 7-day and 30-day member retention (does a paying member come back?).
- Weekly-active-question-solvers vs. total members — the real signal of whether the product is "used," not just "paid for."
- Essay/organic traffic → signup conversion, once Essays has real content — validates whether SEO is worth continued investment.

---

*This document is meant to be a living reference — update it as features ship or priorities change. It was written after reading the actual `src/` codebase, not from the marketing copy alone, so treat code-level claims (file paths, table names) as current as of this audit date.*
