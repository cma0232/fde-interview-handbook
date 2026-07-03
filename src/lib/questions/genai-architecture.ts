import { Question } from "@/types";

const questions: Question[] = [
  {
    id: "g1",
    category: "genai-architecture",
    title: "Design a RAG pipeline for a customer support chatbot with 10M documents.",
    difficulty: "hard",
    content: `A B2B SaaS company wants to build a customer support chatbot that answers questions using their internal knowledge base (10M support articles, product docs, and resolved tickets).

**Requirements:**
- Response latency < 3s
- Answers must cite sources
- Must handle multi-turn conversations
- Knowledge base updates daily

**Design the RAG pipeline.**`,
    hints: [
      "10M documents — think about chunking strategy and vector index at scale (pgvector? Pinecone? Weaviate?).",
      "Multi-turn: where do you store conversation history? How do you reformulate follow-up questions?",
      "Daily updates: incremental indexing vs full re-index.",
    ],
    solution: `**Pipeline:**

1. **Ingestion** — Chunk documents (512 tokens, 10% overlap). Embed with text-embedding-3-large. Store in Pinecone or pgvector.
2. **Query reformulation** — Use LLM to rewrite follow-up questions into standalone queries (HyDE or summarization of chat history).
3. **Retrieval** — Hybrid search: dense (vector) + sparse (BM25). Re-rank with cross-encoder.
4. **Generation** — GPT-4o with retrieved chunks as context. Prompt enforces citation.
5. **Updates** — Incremental upsert on document change events via webhook.

**Trade-offs:** pgvector is cheaper; Pinecone scales better at 10M+. Cross-encoder re-ranking adds ~300ms latency.`,
  },
  {
    id: "g2",
    category: "genai-architecture",
    title: "How would you evaluate and prevent hallucination in a production LLM app?",
    difficulty: "medium",
    content: `Your team has shipped an LLM-powered feature that summarizes legal contracts. A customer reports the model invented a clause that wasn't in the document.

**Questions:**
1. How do you evaluate hallucination at scale before shipping?
2. What architectural changes reduce hallucination risk?
3. How do you monitor for hallucination in production?`,
    hints: [
      "Evaluation: LLM-as-judge, faithfulness metrics (RAGAS), human spot-checks.",
      "Architecture: grounding (only answer from retrieved text), citation enforcement, confidence scores.",
      "Production: user feedback loop, automated consistency checks.",
    ],
    solution: `**Evaluation:**
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
- PII detection on outputs`,
  },
  {
    id: "g3",
    category: "genai-architecture",
    title: "Design an agent that can autonomously query a company's internal data warehouse.",
    difficulty: "hard",
    content: `A company wants a natural language interface to their Snowflake data warehouse. Analysts should be able to ask questions like "What was our churn rate in Q1 by product tier?" and get accurate answers.

**Design the agent architecture.**

**Constraints:**
- Snowflake schema has 300+ tables
- Queries must be accurate (wrong data is worse than no data)
- Some analysts have row-level access restrictions
- Must log all queries for compliance`,
    hints: [
      "Schema discovery at 300 tables — you can't put the whole schema in context. How do you select relevant tables?",
      "RLS: the agent must generate queries that respect the user's permissions, not run as a superuser.",
      "Query validation before execution — how do you prevent destructive queries?",
    ],
    solution: `**Architecture:**

1. **Schema indexing** — Embed table/column descriptions. Retrieve top-K relevant tables for each question.
2. **SQL generation** — LLM generates SQL with only the relevant schema in context. Few-shot examples from validated past queries.
3. **Validation layer** — Parse generated SQL: block DDL/DML, enforce read-only. Dry-run with EXPLAIN.
4. **Execution** — Run as the user's service account (inherits their RLS). Return results + generated SQL for transparency.
5. **Audit log** — Every query, user, timestamp, and result row count logged to immutable store.

**Key safety principle:** treat the LLM as untrusted input. Always validate SQL before execution.`,
  },
];

export default questions;
