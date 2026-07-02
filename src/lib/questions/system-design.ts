import { Question } from "@/types";

const questions: Question[] = [
  {
    id: "sd1",
    category: "system-design",
    title: "Design a real-time supply chain visibility platform for a Fortune 500.",
    difficulty: "hard",
    content: `A Fortune 500 retailer wants a platform that gives their ops team live visibility into inventory levels, shipment status, and supplier delays — across 500 warehouses globally.

**Requirements:**
- < 5 min data freshness for shipment events
- 10,000 concurrent users (ops analysts)
- Support for 50+ ERP and WMS integrations
- Alerting when KPIs breach thresholds

**Design the system.**`,
    hints: [
      "Start with data ingestion — how do you pull from 50+ heterogeneous sources?",
      "Think about the read vs write path separately.",
      "Consider eventual consistency trade-offs for real-time vs batch.",
    ],
    solution: `**High-level architecture:**

1. **Ingestion layer** — Kafka + connector framework (Kafka Connect or custom adapters per ERP). Events normalized into a canonical schema.
2. **Stream processing** — Flink or Spark Streaming for real-time aggregation.
3. **Storage** — TimescaleDB or ClickHouse for time-series analytics; Redis for hot KPI snapshots.
4. **API layer** — GraphQL subscriptions for live dashboard updates.
5. **Alerting** — Rules engine triggers on threshold breach → PagerDuty / Slack.

**Trade-offs to discuss:** pull vs push for ERP integration, cost of Kafka at scale, latency vs consistency.`,
  },
  {
    id: "sd2",
    category: "system-design",
    title: "Design an audit logging system that is tamper-proof.",
    difficulty: "medium",
    content: `Your enterprise client operates in a regulated industry (financial services). They need an audit log of all user actions that is:

- Tamper-proof (no deletion or modification after write)
- Queryable (search by user, time range, action type)
- Retaining 7 years of data
- Compliant with SOC 2 and GDPR

**Design this system.**`,
    hints: [
      "Think about append-only storage and cryptographic chaining.",
      "GDPR right-to-erasure creates a tension with tamper-proof — how do you resolve it?",
      "7 years of data at scale — what's the tiering strategy?",
    ],
    solution: `**Key design decisions:**

1. **Append-only store** — Write to immutable object storage (S3 with Object Lock / WORM).
2. **Cryptographic chaining** — Each log entry includes hash of previous entry (blockchain-lite).
3. **Query layer** — Index in Elasticsearch or OpenSearch for fast lookup.
4. **Tiering** — Hot (0-90 days) in fast storage, cold (90 days - 7 years) in Glacier.
5. **GDPR tension** — Store PII separately with a pointer; delete the PII record to satisfy erasure while keeping the anonymized audit event intact.`,
  },
  {
    id: "sd3",
    category: "system-design",
    title: "Design a multi-tenant data pipeline for healthcare customers.",
    difficulty: "hard",
    content: `You're building a data integration platform for healthcare providers. Each customer (hospital system) has their own EMR data that must be kept strictly isolated.

**Requirements:**
- HIPAA compliance
- Per-tenant data isolation
- Shared infrastructure to keep costs down
- Each tenant can have custom transformation logic

**Design the pipeline.**`,
    hints: [
      "Tenant isolation can be at the DB level, schema level, or row level — each has trade-offs.",
      "Custom transformation logic — plugin architecture or scripting engine?",
      "HIPAA means audit trails, encryption at rest and in transit, minimum necessary access.",
    ],
    solution: `**Architecture:**

1. **Ingestion** — Per-tenant Kafka topics (strict isolation at message bus level).
2. **Transformation** — Shared Airflow with tenant-scoped DAGs; custom logic via sandboxed Python scripts (per tenant config).
3. **Storage** — Schema-per-tenant in PostgreSQL for structured data; S3 with tenant-prefix + bucket policies for files.
4. **Encryption** — KMS with per-tenant CMKs.
5. **Access control** — Row-level security + service accounts scoped per tenant.`,
  },
];

export default questions;
