-- Seed questions table
-- Run this in Supabase SQL Editor after creating the table

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b1', 'behavioral', 'Tell me about a time you had to push back on a client request.', 'medium',
'A client asks you to build a feature that you believe will not solve their underlying problem — and may create technical debt.

**What to cover:**
- How did you identify the mismatch between their request and actual need?
- How did you communicate your concern diplomatically?
- What was the outcome?

Use the **STAR format**: Situation → Task → Action → Result.',
ARRAY['Focus on the business outcome, not just the technical concern.','Show you listened first before pushing back.','Quantify the result if possible (e.g., saved 2 weeks of rework).'],
'**Strong answer structure:**

**S** — Client at [Company] wanted a custom dashboard export in a proprietary format.
**T** — My job was to deliver value, not just ship features.
**A** — I ran a 30-min discovery call to understand *why* they wanted it. Turned out they needed the data in their BI tool — which already had a standard CSV connector. I proposed that instead.
**R** — Saved 3 weeks of eng time. Client got their insight 2 weeks faster.

**Key signals interviewers look for:** curiosity, diplomacy, outcome-orientation.'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b2', 'behavioral', 'Describe a situation where you had to learn a new domain quickly.', 'easy',
'FDEs are dropped into unfamiliar industries — oil & gas, defense, healthcare, logistics.

Describe a time you had to become "good enough" at a new domain in a short period to be effective with a client.

**What to cover:**
- What was the domain and why was it unfamiliar?
- What was your learning strategy?
- How did you demonstrate competence to the client?',
ARRAY['Mention specific resources: domain experts, documentation, shadowing.','Show you know the difference between surface-level jargon and deep understanding.'],
'**Strong answer structure:**

Emphasize *speed* and *strategy*: you didn''t try to become an expert, you identified the 20% of domain knowledge that would cover 80% of client conversations and went deep there first.

Show that you built credibility by asking good questions, not by pretending to know things.'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b3', 'behavioral', 'Give an example of when you influenced without authority.', 'hard',
'You don''t manage the client''s engineering team, but you need them to change how they work.

Describe a situation where you drove a meaningful change without having formal authority.',
ARRAY['Power comes from expertise, relationships, and framing — show all three.','Be specific about resistance you faced.'],
'**Key framing:** You built a coalition. You found internal champions. You made the path of least resistance align with what you needed.

Avoid answers where you "just convinced them" without explaining *how*.'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd1', 'system-design', 'Design a real-time supply chain visibility platform for a Fortune 500.', 'hard',
'A Fortune 500 retailer wants a platform that gives their ops team live visibility into inventory levels, shipment status, and supplier delays — across 500 warehouses globally.

**Requirements:**
- < 5 min data freshness for shipment events
- 10,000 concurrent users (ops analysts)
- Support for 50+ ERP and WMS integrations
- Alerting when KPIs breach thresholds

**Design the system.**',
ARRAY['Start with data ingestion — how do you pull from 50+ heterogeneous sources?','Think about the read vs write path separately.','Consider eventual consistency trade-offs for real-time vs batch.'],
'**High-level architecture:**

1. **Ingestion layer** — Kafka + connector framework (Kafka Connect or custom adapters per ERP). Events normalized into a canonical schema.
2. **Stream processing** — Flink or Spark Streaming for real-time aggregation.
3. **Storage** — TimescaleDB or ClickHouse for time-series analytics; Redis for hot KPI snapshots.
4. **API layer** — GraphQL subscriptions for live dashboard updates.
5. **Alerting** — Rules engine triggers on threshold breach → PagerDuty / Slack.

**Trade-offs to discuss:** pull vs push for ERP integration, cost of Kafka at scale, latency vs consistency.'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd2', 'system-design', 'Design an audit logging system that is tamper-proof.', 'medium',
'Your enterprise client operates in a regulated industry (financial services). They need an audit log of all user actions that is:

- Tamper-proof (no deletion or modification after write)
- Queryable (search by user, time range, action type)
- Retaining 7 years of data
- Compliant with SOC 2 and GDPR

**Design this system.**',
ARRAY['Think about append-only storage and cryptographic chaining.','GDPR right-to-erasure creates a tension with tamper-proof — how do you resolve it?','7 years of data at scale — what''s the tiering strategy?'],
'**Key design decisions:**

1. **Append-only store** — Write to immutable object storage (S3 with Object Lock / WORM).
2. **Cryptographic chaining** — Each log entry includes hash of previous entry (blockchain-lite).
3. **Query layer** — Index in Elasticsearch or OpenSearch for fast lookup.
4. **Tiering** — Hot (0-90 days) in fast storage, cold (90 days - 7 years) in Glacier.
5. **GDPR tension** — Store PII separately with a pointer; delete the PII record to satisfy erasure while keeping the anonymized audit event intact.'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd3', 'system-design', 'Design a multi-tenant data pipeline for healthcare customers.', 'hard',
'You''re building a data integration platform for healthcare providers. Each customer (hospital system) has their own EMR data that must be kept strictly isolated.

**Requirements:**
- HIPAA compliance
- Per-tenant data isolation
- Shared infrastructure to keep costs down
- Each tenant can have custom transformation logic

**Design the pipeline.**',
ARRAY['Tenant isolation can be at the DB level, schema level, or row level — each has trade-offs.','Custom transformation logic — plugin architecture or scripting engine?','HIPAA means audit trails, encryption at rest and in transit, minimum necessary access.'],
'**Architecture:**

1. **Ingestion** — Per-tenant Kafka topics (strict isolation at message bus level).
2. **Transformation** — Shared Airflow with tenant-scoped DAGs; custom logic via sandboxed Python scripts (per tenant config).
3. **Storage** — Schema-per-tenant in PostgreSQL for structured data; S3 with tenant-prefix + bucket policies for files.
4. **Encryption** — KMS with per-tenant CMKs.
5. **Access control** — Row-level security + service accounts scoped per tenant.'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('c1', 'coding', 'Write a SQL query to find the top 3 SKUs by revenue per region.', 'medium',
'Given the following schema:

```sql
orders (order_id, sku_id, region, quantity, unit_price, order_date)
```

Write a SQL query that returns the **top 3 SKUs by total revenue for each region**, for the last 30 days.

Output columns: `region`, `sku_id`, `total_revenue`, `rank`',
ARRAY['Window functions: ROW_NUMBER() or RANK() OVER (PARTITION BY region ORDER BY total_revenue DESC)','Filter by order_date in a CTE first, then rank.'],
'```sql
WITH revenue AS (
  SELECT
    region,
    sku_id,
    SUM(quantity * unit_price) AS total_revenue
  FROM orders
  WHERE order_date >= CURRENT_DATE - INTERVAL ''30 days''
  GROUP BY region, sku_id
),
ranked AS (
  SELECT
    region,
    sku_id,
    total_revenue,
    RANK() OVER (PARTITION BY region ORDER BY total_revenue DESC) AS rank
  FROM revenue
)
SELECT region, sku_id, total_revenue, rank
FROM ranked
WHERE rank <= 3
ORDER BY region, rank;
```'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('c2', 'coding', 'Given a CSV of IoT sensor readings, detect anomalies in Python.', 'medium',
'You have a CSV with columns: `timestamp`, `sensor_id`, `value`.

Write a Python function that:
1. Loads the CSV
2. For each sensor, flags readings that are more than **3 standard deviations** from that sensor''s mean
3. Returns a DataFrame of anomalous readings with an added `z_score` column',
ARRAY['Group by sensor_id, then compute mean and std per group.','pandas transform() lets you compute group stats while preserving the original index.'],
'```python
import pandas as pd

def detect_anomalies(csv_path: str) -> pd.DataFrame:
    df = pd.read_csv(csv_path, parse_dates=["timestamp"])

    df["mean"] = df.groupby("sensor_id")["value"].transform("mean")
    df["std"] = df.groupby("sensor_id")["value"].transform("std")
    df["z_score"] = (df["value"] - df["mean"]) / df["std"]

    anomalies = df[df["z_score"].abs() > 3].copy()
    return anomalies[["timestamp", "sensor_id", "value", "z_score"]]
```'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('c3', 'coding', 'Implement a rate limiter with a sliding window in TypeScript.', 'hard',
'Implement a `RateLimiter` class in TypeScript that:

- Allows at most **N requests per M seconds** per key (e.g., user ID)
- Uses a **sliding window** algorithm (not fixed window)
- Has methods: `allow(key: string): boolean`

```typescript
const limiter = new RateLimiter({ maxRequests: 10, windowMs: 60_000 });
limiter.allow("user_123"); // true or false
```',
ARRAY['Store a list of timestamps per key. On each request, remove timestamps older than windowMs, then check count.','This is O(N) per request — acceptable for most use cases.'],
'```typescript
class RateLimiter {
  private requests: Map<string, number[]> = new Map();
  private maxRequests: number;
  private windowMs: number;

  constructor({ maxRequests, windowMs }: { maxRequests: number; windowMs: number }) {
    this.maxRequests = maxRequests;
    this.windowMs = windowMs;
  }

  allow(key: string): boolean {
    const now = Date.now();
    const cutoff = now - this.windowMs;

    const timestamps = (this.requests.get(key) ?? []).filter(t => t > cutoff);

    if (timestamps.length >= this.maxRequests) return false;

    timestamps.push(now);
    this.requests.set(key, timestamps);
    return true;
  }
}
```'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g1', 'genai-architecture', 'Design a RAG pipeline for a customer support chatbot with 10M documents.', 'hard',
'A B2B SaaS company wants to build a customer support chatbot that answers questions using their internal knowledge base (10M support articles, product docs, and resolved tickets).

**Requirements:**
- Response latency < 3s
- Answers must cite sources
- Must handle multi-turn conversations
- Knowledge base updates daily

**Design the RAG pipeline.**',
ARRAY['10M documents — think about chunking strategy and vector index at scale (pgvector? Pinecone? Weaviate?).','Multi-turn: where do you store conversation history? How do you reformulate follow-up questions?','Daily updates: incremental indexing vs full re-index.'],
'**Pipeline:**

1. **Ingestion** — Chunk documents (512 tokens, 10% overlap). Embed with text-embedding-3-large. Store in Pinecone or pgvector.
2. **Query reformulation** — Use LLM to rewrite follow-up questions into standalone queries (HyDE or summarization of chat history).
3. **Retrieval** — Hybrid search: dense (vector) + sparse (BM25). Re-rank with cross-encoder.
4. **Generation** — GPT-4o with retrieved chunks as context. Prompt enforces citation.
5. **Updates** — Incremental upsert on document change events via webhook.

**Trade-offs:** pgvector is cheaper; Pinecone scales better at 10M+. Cross-encoder re-ranking adds ~300ms latency.'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g2', 'genai-architecture', 'How would you evaluate and prevent hallucination in a production LLM app?', 'medium',
'Your team has shipped an LLM-powered feature that summarizes legal contracts. A customer reports the model invented a clause that wasn''t in the document.

**Questions:**
1. How do you evaluate hallucination at scale before shipping?
2. What architectural changes reduce hallucination risk?
3. How do you monitor for hallucination in production?',
ARRAY['Evaluation: LLM-as-judge, faithfulness metrics (RAGAS), human spot-checks.','Architecture: grounding (only answer from retrieved text), citation enforcement, confidence scores.','Production: user feedback loop, automated consistency checks.'],
'**Evaluation:**
- Build a golden dataset of contract → expected summary pairs
- Use RAGAS faithfulness score (does answer follow from context?)
- LLM-as-judge for semantic correctness

**Architectural mitigations:**
- Strict grounding: "Answer only using the provided document. If not found, say so."
- Return citations with character offsets so the app can verify
- Low temperature (0.0-0.2) for factual extraction tasks

**Production monitoring:**
- Track user correction rate (explicit feedback)
- Automated checks: does every claim in the summary appear in the source?
- PII detection on outputs'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g3', 'genai-architecture', 'Design an agent that can autonomously query a company''s internal data warehouse.', 'hard',
'A company wants a natural language interface to their Snowflake data warehouse. Analysts should be able to ask questions like "What was our churn rate in Q1 by product tier?" and get accurate answers.

**Design the agent architecture.**

**Constraints:**
- Snowflake schema has 300+ tables
- Queries must be accurate (wrong data is worse than no data)
- Some analysts have row-level access restrictions
- Must log all queries for compliance',
ARRAY['Schema discovery at 300 tables — you can''t put the whole schema in context. How do you select relevant tables?','RLS: the agent must generate queries that respect the user''s permissions, not run as a superuser.','Query validation before execution — how do you prevent destructive queries?'],
'**Architecture:**

1. **Schema indexing** — Embed table/column descriptions. Retrieve top-K relevant tables for each question.
2. **SQL generation** — LLM generates SQL with only the relevant schema in context. Few-shot examples from validated past queries.
3. **Validation layer** — Parse generated SQL: block DDL/DML, enforce read-only. Dry-run with EXPLAIN.
4. **Execution** — Run as the user''s service account (inherits their RLS). Return results + generated SQL for transparency.
5. **Audit log** — Every query, user, timestamp, and result row count logged to immutable store.

**Key safety principle:** treat the LLM as untrusted input. Always validate SQL before execution.'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs1', 'case-study', 'A logistics company wants to reduce detention fees by 20%. How do you approach this?', 'hard',
'**Background:** Detention fees are charges incurred when a truck waits at a facility beyond the agreed free time. Your client (a large 3PL) is paying $4M/year in detention fees and wants to cut that by 20%.

They have data from their TMS (Transportation Management System) including: load details, driver check-in/out times, facility dwell times, appointment times.

**Your job as the FDE:**
1. How do you scope and prioritize this problem?
2. What data analysis would you do first?
3. What solution would you propose, and how would you validate it?',
ARRAY['Start with data, not solutions. What does the distribution of detention events look like? Which facilities? Which carriers?','The 80/20 rule almost certainly applies here — a few facilities likely drive most fees.','Consider both predictive (alert before detention happens) and operational (fix the process) solutions.'],
'**Discovery:**
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
- Target: 20% reduction in avg dwell time at pilot sites within 60 days'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs2', 'case-study', 'Your client''s ops team refuses to adopt the software you deployed. What do you do?', 'medium',
'You''ve deployed a new workflow management tool at a manufacturing client. The software works technically, but 6 weeks in, the ops team (30 people) is still using spreadsheets. The project sponsor is frustrated. You have 4 weeks before your engagement ends.

**What do you do?**',
ARRAY['Diagnose before prescribing. What''s the actual reason for non-adoption? (UX? Training? Trust? Incentives? Politics?)','Find your internal champion. Who on the ops team is already using it, even a little?','Don''t fight spreadsheets — bridge to them.'],
'**Week 1 — Diagnose:**
- Ride-along with 3-5 ops team members during their actual workflow
- Don''t ask "why aren''t you using it?" — ask "walk me through your day"
- Likely findings: the new tool adds steps for their core task, or they don''t trust the data in it yet

**Week 2 — Quick wins:**
- Fix the top 1-2 friction points surfaced in diagnosis (if technical, fix it; if UX, escalate to product)
- Find the one person who''s already using it and make them look good (public recognition from their manager)

**Week 3 — Bridge:**
- If they love spreadsheets, add a CSV export that matches their existing format
- Run a "lunch and learn" that shows the tool doing something they currently can''t do in sheets

**Week 4 — Handoff:**
- Document 3 workflows where the tool is clearly better, with before/after metrics
- Brief the sponsor on what will drive continued adoption post-engagement

**Key principle:** adoption is a change management problem, not a technical one.'
);

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs3', 'case-study', 'Prioritize a backlog of 12 feature requests from 3 different enterprise clients.', 'medium',
'You''re the FDE managing 3 enterprise clients simultaneously. Each has submitted feature requests through your ticketing system — 4 requests each, 12 total. Your eng team can ship 3 features next sprint.

**Client A** — $2M ARR, renewal in 6 weeks, health score: yellow
**Client B** — $500K ARR, renewal in 6 months, health score: green
**Client C** — $1.5M ARR, renewal in 3 months, health score: red (at-risk)

Some requests overlap across clients. Some are quick (1 day) and some are large (2 weeks).

**How do you prioritize?**',
ARRAY['ARR at risk × renewal timing is your starting frame, but it''s not the only input.','Look for overlap — a feature two clients want is more defensible to build.','Separate "what we build" from "what we communicate" — sometimes a commitment and timeline satisfies a client more than the feature itself.'],
'**Framework:**

1. **Triage by revenue at risk:**
   - Client C ($1.5M, red, 3 months) → top priority. What feature(s) would move their health score?
   - Client A ($2M, yellow, 6 weeks) → critical. Renewal is imminent.
   - Client B (green, 6 months) → can wait.

2. **Find overlap:** Map all 12 requests. Any feature requested by both A and C is high-priority leverage.

3. **Effort-impact matrix:** Of the 3 slots, prefer 1 quick win per at-risk client (shows momentum) + 1 overlapping feature (efficient use of eng time).

4. **Communicate proactively:** For features not in this sprint, set explicit timelines.

**Anti-pattern to avoid:** prioritizing by loudest client voice, or by which PM is most persistent internally.'
);
