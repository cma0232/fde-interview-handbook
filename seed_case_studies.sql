-- Case Studies: Google-style GenAI FDE Case Study Playbook
-- IDs cs101-cs110 to avoid collision with existing cs1, cs2, cs3

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs101', 'case-study', 'Enterprise Sales Assistant using CRM Data, Call Transcripts, Emails, and RAG', 'hard',
'A global B2B sales organization wants a GenAI assistant that helps account executives prepare for customer meetings, summarize account history, identify renewal risks, and draft personalized follow-up emails using CRM records, call transcripts, emails, product docs, and support tickets.

Customer Situation: The customer has thousands of enterprise accounts, fragmented sales history in Salesforce, call transcripts in a conversation intelligence platform, email threads in Google Workspace or Microsoft 365, support issues in Zendesk, and product collateral in a content management system. Account executives spend hours before strategic calls collecting context, reading old notes, and asking sales operations for information. Leadership wants better meeting preparation, consistent account intelligence, and higher renewal conversion without exposing sensitive customer data across sales teams.

Stakeholders: Account executives, sales managers, sales operations, legal, security, customer success, CRM administrators, revenue leadership.

Current workflow: Manual CRM search, transcript review, copy-pasting notes into slide decks, asking customer success for risk context, and drafting follow-ups from memory.

Success criteria: Meeting prep time reduced, answer citation rate high, account access violations zero, and measurable improvement in follow-up quality and pipeline hygiene. The system must respect territory, account ownership, and document permissions.

Constraints: Sensitive customer information, CRM permission complexity, data freshness, transcript quality, and territory-based access rules. Initial pilot is read-only plus email draft generation. CRM is the system of record. Users authenticate through the enterprise IdP.

MVP scope: Account brief generation, recent activity summary, risk extraction, cited Q&A, and draft follow-up email with human approval.

Out of scope: Autonomous CRM updates, automatic customer email sending, pricing recommendations, and legal commitments without approval.',
ARRAY[
  'Do not jump to architecture: first clarify users, data ownership, permission model, risk level, and MVP boundary',
  'Authorization must happen BEFORE retrieval, never filter after the model has seen sensitive data',
  'Territory and account ownership rules must map to retrieval filters — not enforced post-generation',
  'Chunk transcripts by speaker turns and topic boundaries; use structured summaries for CRM records rather than raw JSON',
  'Use hybrid retrieval: keyword search for exact names, vector search for semantic account issues',
  'Actions such as email drafts or CRM tasks require explicit human confirmation (two-step approval)',
  'Key failure modes: permission leakage, stale renewal data, hallucinated commitments, bad transcript quality, unauthorized tool calls',
  'Evaluation must be defined before launch: golden dataset, retrieval recall, permission safety tests, latency, cost'
],
'Proposed Architecture: Secure sales assistant web app embedded in CRM or internal portal. API gateway validates identity, retrieves user entitlements, and routes to orchestration service. Data ingestion connectors pull CRM objects, transcripts, emails, support tickets, and sales collateral into a document processing pipeline. The pipeline normalizes records, extracts metadata (account_id, owner_id), chunks long transcripts, generates embeddings, stores vectors in a tenant-aware vector database, and stores metadata in a relational database. At query time, orchestrator applies permission filters BEFORE retrieval, reranks results, assembles context, prompts LLM, returns a cited answer, and records feedback and audit events.

Architecture flow: Seller -> CRM embedded UI -> API Gateway -> SSO/AuthZ -> Sales AI Orchestrator -> Permission Filter -> Hybrid Retrieval + Vector DB -> Reranker -> LLM -> Cited Account Brief -> Feedback + Audit Store -> Approved Tool Calls -> Draft Email / CRM Task

Key data entities: Tenant, User, Account, Document, Chunk (with account_id/source/sensitivity label), PermissionGrant, Conversation, ToolCall, AuditLog, Feedback.

Auth model: SSO/OIDC with IdP group mapping to sales roles. Derive account access from CRM ownership, territory rules, manager hierarchy, and opportunity teams. Apply document-level permission filters before vector search. Service-to-service mTLS for connector access.

RAG/Agent design: Hybrid retrieval with metadata filters for tenant_id, account_id, source freshness, and user permission scope. Reranking prioritizes recent customer commitments, open tickets, and latest opportunity updates. Prompt model to separate facts/inferred risks/suggested actions and require citations for factual claims. Tool calling only for controlled actions (draft_email, create_crm_task) with human approval.

Evaluation: Groundedness (human reviewers compare claims vs cited sources), retrieval recall (golden account questions must retrieve expected chunks), permission safety (negative tests verify sellers cannot retrieve outside territory), business KPIs (meeting prep time, follow-up completion rate), latency P95, cost per brief.

Failure modes and mitigations: Permission leakage -> pre-retrieval permission filters + ABAC tests; Stale renewal data -> incremental sync + stale warning in answer; Hallucinated commitments -> citation-required prompting + high-risk refusal; Bad transcript quality -> source confidence metadata; Unauthorized tool call -> two-step confirmation and scoped action tokens; High cost -> brief templates + caching + model routing.

Rollout: (1) Read-only prototype for 20 friendly sellers, (2) shadow evaluations against historical meeting prep tasks, (3) pilot with one region/product line, (4) enable draft email with mandatory approval, (5) add CRM task creation after legal/security sign-off, (6) expand by territory with adoption and safety dashboards, (7) rollback to read-only mode if safety incidents occur.

Cost/Latency: Precompute account briefs overnight for strategic accounts. Use smaller models for extraction/classification, stronger models for final synthesis. Cache retrieval results for repeated questions during meeting-prep session. Limit context by source priority (recent CRM updates, open support tickets, latest transcript, then collateral). Stream long briefs.

Strong vs Weak signals: Weak candidate jumps to vector database + LLM without clarifying permissions, evaluation, or failure modes. Strong candidate asks discovery questions, defines MVP boundaries, proposes permission-aware retrieval, cites sources, includes evaluation, human approval, rollout, and observability. Senior candidate connects architecture to business outcomes, designs for tenant/user isolation, cost controls, incident response, and governance.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs102', 'case-study', 'Customer Support Agent for Zendesk / ServiceNow', 'hard',
'A software company wants a GenAI support agent that drafts responses, retrieves known solutions, triages tickets, suggests escalation paths, and can perform low-risk workflow actions in Zendesk or ServiceNow.

Customer Situation: Support teams handle high ticket volume across product bugs, billing questions, outages, onboarding issues, and enterprise escalations. Knowledge base articles are inconsistent, ticket history is noisy, and senior support engineers are overloaded with repeated questions. The customer wants faster first response time and higher consistency, but cannot risk the bot sending incorrect technical instructions or exposing one customer''s ticket data to another. Some enterprise tickets are under strict confidentiality rules.

Stakeholders: Support agents, support managers, escalation engineers, product engineering, trust and safety, security, customer success, customers.

Current workflow: Agents search Zendesk macros, old tickets, Slack escalation channels, runbooks, and product docs, then manually draft replies and decide escalation.

Success criteria: Lower first response time, lower average handle time, improved CSAT, no cross-customer data leakage, and higher deflection for low-risk tickets.

Constraints: No automatic external replies for high-risk issues, noisy historical ticket data, sensitive logs, inconsistent KB freshness, API rate limits. Initial release is agent-assist only; outbound messages require support agent approval.

MVP scope: Ticket summarization, classification, KB-grounded draft response, escalation summary, and agent feedback buttons.

Out of scope: Autonomous refunds, legal/security incident responses, direct production changes, and customer-visible automation without review.',
ARRAY[
  'Classify ticket risk first: billing, security, outage, legal, enterprise escalations must route to human without AI drafting',
  'Prefer verified KB and runbooks over historical tickets for customer-facing responses — use tickets only for internal hints',
  'Cross-customer data leakage is the top security risk: filter by customer_id before retrieval, use sanitized corpus',
  'Agent-assist mode only for MVP: all outbound replies require human approval before sending',
  'Prompt injection risk: treat ticket text as untrusted data; customer may embed instructions to override system prompts',
  'Outdated KB is a common failure mode: track article freshness and surface version warnings in generated drafts',
  'Safe workflow actions only: add_tag, create_internal_note, route_queue — never autonomous refunds or production changes',
  'Evaluation: support SMEs grade draft correctness, measure edit distance and rejection reasons, track CSAT impact'
],
'Proposed Architecture: Embed assistant in ticketing UI. When a ticket is opened, backend fetches ticket content, customer plan, SLA, product area, and prior conversation context. Retrieval layer searches sanitized KB articles, runbooks, release notes, and permitted historical tickets. Orchestrator classifies risk, constructs a grounded prompt, generates a draft or escalation summary, and records citations and confidence. Low-risk internal actions (adding tags, internal notes) can be tool calls; external replies remain human-approved.

Architecture flow: Support Agent -> Zendesk/ServiceNow App -> API Gateway -> AuthZ + Queue Policy -> Ticket Context Service -> Retrieval over KB/Runbooks/Sanitized Tickets -> Risk Classifier -> LLM Draft Generator -> Human Approval -> Ticket Update + Audit + Feedback

Key data entities: Tenant, Ticket (ID/customer/product area/priority/SLA/status), Customer (plan/region/support tier/restrictions), Article (KB/runbook/release note/macro), TicketChunk (sanitized historical content with resolution metadata), AgentUser, DraftResponse (with citations and confidence), EscalationSummary, Feedback, AuditLog.

Auth model: Ticketing platform OAuth/OIDC with support queue mapping to access policies. Filter retrieval by customer confidentiality flags and queue membership. Separate customer-facing draft permission from internal-note permission. Log every generated external draft and approving human agent. Block retrieval of tickets from unrelated customers.

RAG/Agent design: Prefer verified KB and runbooks over historical tickets for customer-facing responses. Rerank by product version, recency, article verification status, and issue similarity. Prompt model to ask for missing logs rather than invent troubleshooting steps. Use ticket-action agent only for safe actions (add_tag, create_internal_note, route_queue). Keep risk classifier before generation.

Evaluation: Draft correctness (SMEs grade against known resolutions), deflection quality (repeated low-risk tickets resolved via AI drafts), escalation precision (compare suggested queues vs actual expert routing), safety (red-team cross-customer leakage and harmful instructions), CSAT impact, agent productivity (first response time and handle time).

Failure modes: Wrong troubleshooting steps -> cite verified runbooks only + uncertainty fallback; Cross-customer leak -> customer filters and sanitized corpus; Outdated KB -> article freshness monitoring; Bad escalation -> escalation classifier evaluation; Prompt injection in customer ticket -> treat ticket text as untrusted; API rate-limit failure -> queue, backoff, cache metadata.

Rollout: (1) Internal ticket summaries only, (2) KB-grounded drafts for narrow product area, (3) pilot with experienced agents requiring approval, (4) measure edit distance and rejection reasons, (5) routing recommendations, (6) safe workflow actions after controls verified, (7) keep automatic customer sending disabled until quality and policy thresholds are proven.

Strong vs Weak signals: Weak candidate jumps to vector database + LLM without clarifying permissions or failure modes. Strong candidate asks discovery questions, proposes permission-aware retrieval, includes risk classification, human approval, and rollout gates.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs103', 'case-study', 'Internal Knowledge Assistant for Confluence, Google Drive, and Slack', 'hard',
'A fast-growing technology company wants an internal assistant that answers employee questions across Confluence, Google Drive, Slack, Jira, and onboarding materials with citations and permission-aware retrieval.

Customer Situation: The company has grown quickly through multiple product teams, acquisitions, and offices. Knowledge exists in old Confluence pages, Google Docs, Slack threads, Jira tickets, and team-specific runbooks. Employees waste time asking repeated questions in Slack and often find outdated documents. The core risk is that internal search has hidden permissions: HR docs, legal docs, unreleased product plans, compensation information, and incident reports must not leak across teams.

Stakeholders: Employees, IT, security, HR, legal, engineering productivity, platform teams, team leads.

Current workflow: Employees ask in Slack, search Confluence, ping colleagues, and bookmark personal docs. No single source of truth exists.

Success criteria: Fewer repeated questions, higher employee self-service, strong trust in citations, and no permission violations.

Constraints: Inconsistent permissions, stale docs, Slack noise, sensitive HR/legal content, connector rate limits. MVP supports Confluence and Google Drive first; Slack is limited to public channels or curated channels.

MVP scope: Permission-aware Q&A with citations, source freshness labels, feedback, and stale-doc reporting.

Out of scope: Answering from private DMs, making HR decisions, replacing official policies, or generating final legal advice.',
ARRAY[
  'Permission complexity is the core risk: HR, legal, compensation, M&A, and incident docs must never leak across teams',
  'Mirror source-system ACLs into a central authorization index and evaluate access BEFORE retrieval AND before citation rendering',
  'Treat Slack as high-noise/high-risk: limit to public curated channels only, avoid private DMs and channels',
  'Stale documents are a major failure mode: surface freshness labels and owner metadata, create doc quality tickets when flagged',
  'Conflict detector: when two sources disagree on policy, show both with citations and escalate to owner rather than synthesizing',
  'Fail-closed if permission data is missing or stale — never show a document when auth state is uncertain',
  'Connector rate limits and ACL sync drift are operational risks: monitor sync lag and use fail-closed retrieval',
  'Use no agent for simple Q&A; limited tools only for creating doc-quality tickets or opening source links'
],
'Proposed Architecture: Internal web and chat interface backed by orchestration service. Connectors ingest documents and permissions from Confluence and Drive, normalize metadata, extract text, chunk content, and generate embeddings. Permission sync service maintains group and document ACLs. At query time, system resolves user''s groups, filters candidate documents before retrieval, reranks by semantic relevance and freshness, generates cited answer, and indicates confidence and source age. Feedback creates documentation improvement tickets when users flag stale or wrong answers.

Architecture flow: Employee -> Web/Slack UI -> API Gateway -> SSO + Group Resolver -> Knowledge Orchestrator -> ACL Filter -> Hybrid Search + Vector DB -> Reranker -> LLM -> Cited Answer + Source Freshness -> Feedback -> Doc Quality Ticket

Key data entities: Workspace, User (employee identity/groups/department/location), SourceSystem (Confluence/Drive/Slack/Jira), Document (canonical indexed object with source URL and freshness metadata), Chunk (search unit with ACL hash/labels/timestamps), Permission (user/group/document access mapping), Answer (with citations/confidence/model version), Feedback, DocQualityIssue, AuditLog.

Auth model: Enterprise SSO and group membership from IdP. Mirror source-system ACLs into central authorization index. Evaluate access before retrieval and again before citation rendering. Use least-privilege connector accounts and per-source scopes. Log admin searches and bulk exports separately.

RAG/Agent design: Chunk policies by section headings and owner metadata; chunk runbooks by procedure step. Hybrid retrieval for exact policy names and semantic questions. Rerank using freshness, owner verification, and document popularity. Ask model to quote source titles and dates; avoid answering when sources conflict. Conflict detector when two sources disagree on policy.

Evaluation: Permission correctness (synthetic users from different groups test restricted documents), answer usefulness (employee reviewers score for common onboarding and engineering questions), freshness (answers prefer latest verified document), coverage (top unanswered questions become documentation backlog), latency P95, adoption (Slack deflection and self-service usage).

Failure modes: Stale document answer -> freshness weighting and owner review workflow; Permission leak -> pre-retrieval ACL filters and negative tests; Conflicting docs -> conflict response with citations and owner escalation; Slack noise -> curate channels and downrank unverified chatter; Missing source -> reject uncited factual answer; Connector drift -> ACL sync monitoring and fail-closed retrieval.

Rollout: (1) Index curated Confluence spaces first, (2) pilot with IT and engineering onboarding questions, (3) add Drive docs with strict permission tests, (4) launch Slack bot only for public curated channels, (5) add stale-doc feedback workflow, (6) expand departments after source owner sign-off, (7) publish governance rules for authoritative content.

Strong vs Weak signals: Weak candidate indexes all sources without addressing permission complexity. Strong candidate designs ACL sync, permission-aware retrieval, conflict detection, freshness indicators, and stale-doc feedback loops.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs104', 'case-study', 'Financial Document Analysis Assistant with Strict Compliance', 'hard',
'A financial services firm wants an assistant that analyzes annual reports, earnings calls, risk disclosures, loan documents, and internal memos while satisfying audit, compliance, access control, and retention requirements.

Customer Situation: Analysts spend large amounts of time reading PDFs, extracting risk factors, comparing financial statements, and preparing briefing notes. Documents may include material non-public information (MNPI) and client confidential data. The firm wants GenAI to accelerate research and document review, but compliance requires strict auditability, data retention controls, model provider restrictions, and explainability of sources.

Stakeholders: Analysts, portfolio managers, credit officers, compliance, legal, risk, data governance, security, audit.

Current workflow: Analysts manually review PDFs, spreadsheets, filings, internal notes, and external research, then prepare memos and investment/credit summaries.

Success criteria: Reduced document review time, high citation accuracy, complete audit logs, no policy violations, and compliance-approved rollout. Assistant is decision-support only; human analyst approves all final outputs.

Constraints: Regulated data, financial consequences, PDF quality, tables, internal restricted lists, model provider restrictions. Must handle OCR/table extraction, classification, and document-level entitlements.

MVP scope: Cited Q&A over approved financial documents, risk factor summarization, covenant extraction with confidence scores, human-reviewed memo drafts.

Out of scope: Automated investment recommendations, automated credit approval, trading instructions, and unrestricted external web research.',
ARRAY[
  'MNPI (material non-public information) and fund/deal/client-level entitlements require object-level authorization before retrieval',
  'Immutable audit logs are a compliance requirement — every prompt, model version, retrieval set, and output must be reconstructable',
  'PDF quality is a real constraint: OCR confidence and table extraction confidence must be tracked as retrieval metadata',
  'Use structured extraction prompts for covenants and risk factors, not just free-form summaries — numerical claims need table-aware extraction',
  'Retention policies and legal hold controls are non-negotiable: define deletion and hold procedures before launch',
  'Prohibited actions must be hardcoded: no autonomous investment recommendations, no automated credit approval, no trading instructions',
  'Model provider restrictions may require private deployment: network allowlist and deployment policy must be enforced',
  'Agentic workflow only justified for multi-document comparison, with each step independently logged for audit trail'
],
'Proposed Architecture: Compliance-approved environment with document ingestion, OCR/table extraction, classification, embeddings, vector search, and immutable audit logging. UI supports document upload or selection from approved repositories. Orchestrator enforces user entitlements, retrieves relevant pages/chunks, asks model to generate structured answers with citations, and flags uncertain extractions for human review. Compliance can review prompts, model versions, data lineage, and outputs through an audit dashboard.

Architecture flow: Analyst -> Secure Research UI -> SSO + Entitlements -> Document Service -> OCR/Table Extraction -> Classification -> Vector DB + Metadata Store -> Compliance-Aware Orchestrator -> LLM -> Cited Analysis -> Human Review -> Immutable Audit Log

Key data entities: LegalEntity (business unit/fund/client/deal boundary), User (analyst/manager/compliance reviewer/auditor), Document (filing/loan agreement/memo/transcript with classification), Page (PDF page/OCR confidence/table metadata), Extraction (risk/covenant/financial metric/cited source span), AccessPolicy (fund/deal/client entitlement), Review (human approval/comment/rejection reason), ModelRun (prompt/model/version/retrieval set/output hash), AuditLog (immutable), RetentionPolicy.

Auth model: SSO with business-unit, fund, and deal-level entitlements. Apply row/object-level authorization before retrieval and document preview. Restrict privileged compliance/audit views with separate roles. Use approved model endpoints and private networking. Keep immutable logs of prompts, sources, outputs, and approvals. Support legal hold and retention policies.

RAG/Agent design: Chunk by section headings, page boundaries, and table references; preserve page and paragraph citations. Use OCR confidence and table extraction confidence as retrieval metadata. Use structured extraction prompts for covenants and risk factors. Use retrieval reranking preferring exact page/table matches for numerical claims. Do not allow autonomous conclusions; require source-backed evidence and caveats. Agentic workflow only for multi-step comparison across documents, with each step logged.

Evaluation: Citation accuracy (every material claim maps to correct page/table/span), extraction precision (covenants and risk factors vs analyst-labeled gold data), numerical accuracy (financial figures validated against tables), compliance safety (red-team tests for prohibited advice and MNPI leakage), audit completeness (all model runs and approvals reconstructable), review productivity (time saved in analyst memo preparation).

Failure modes: Wrong financial figure -> table-aware extraction and human review; Unsupported conclusion -> policy guardrail and prohibited advice classifier; Restricted document leak -> object-level auth and audit alerts; OCR error -> human verification and fallback to original PDF page; Retention violation -> retention policy engine and legal hold controls; Model provider misuse -> network allowlist and deployment policy.

Rollout: (1) Start with public filings only, (2) add internal approved documents for one analyst team, (3) run compliance review on prompts/logs/outputs, (4) enable human-reviewed memo drafts, (5) add restricted deal documents after entitlement tests, (6) integrate with retention/audit export, (7) expand with quarterly model/prompt review board.

Strong vs Weak signals: Weak candidate ignores MNPI, compliance, and retention requirements. Strong candidate specifies immutable audit logs, model provider restrictions, object-level entitlements, compliance review workflow, and prohibited actions list.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs105', 'case-study', 'Healthcare Intake Assistant with PII Controls', 'hard',
'A healthcare provider wants an intake assistant that collects symptoms, insurance details, medical history, and appointment preferences, summarizes intake for clinicians, and routes patients while protecting PHI/PII.

Customer Situation: Patient intake is slow and repetitive. Staff collect demographic details, symptoms, medication lists, insurance information, and appointment preferences across phone calls and forms. The organization wants an assistant to reduce staff workload and improve patient experience, but any solution must protect health information, avoid diagnosis, and clearly escalate urgent symptoms to humans or emergency guidance.

Stakeholders: Patients, intake staff, nurses, clinicians, compliance, security, scheduling, billing, patient experience leaders.

Current workflow: Manual phone calls, paper or web forms, staff-entered EHR notes, and repeated follow-up questions for missing information.

Success criteria: Higher intake completion, fewer manual follow-ups, faster routing, no PHI leakage, and safe escalation for urgent symptoms. The assistant does not diagnose; it collects information and routes to humans.

Constraints: Regulatory sensitivity (HIPAA and applicable healthcare privacy regulations), emergency symptoms, EHR integration, identity verification, patient consent, model provider restrictions. Must handle minors, guardians, and proxy access.

MVP scope: Staff-supervised intake assistant for non-emergency appointment requests with structured summary and escalation flags.

Out of scope: Diagnosis, treatment recommendation, medication changes, emergency triage without human/approved protocol, automatic EHR writes without review.',
ARRAY[
  'The assistant must NEVER diagnose or give treatment recommendations — hard refusal with constrained prompt is required',
  'Urgent symptom escalation (chest pain, stroke symptoms, etc.) must use clinician-approved rules-based classifier, not LLM judgment alone',
  'Consent gate must be enforced BEFORE any data collection: no PHI collected without explicit consent confirmation',
  'PHI minimization: collect only minimum necessary data; redact sensitive data from non-clinical logs',
  'EHR writeback requires human review step — idempotent writes and duplicate detection to prevent EHR corruption',
  'Use structured slot filling for deterministic fields (name, DOB, insurance) and LLM only for natural-language clarification',
  'Identity verification and proxy/guardian authorization must be handled explicitly: patient vs guardian vs proxy have different access',
  'Model deployment must comply with approved data processing agreements; PHI must not leave approved hosting environment'
],
'Proposed Architecture: Secure patient portal or staff console. Orchestration service manages intake conversation using structured schema, PHI minimization, and safety classifier. Stores intake data in encrypted database, integrates with scheduling and optionally EHR through approved APIs, and produces clinician-facing summary. Rules engine detects urgent symptoms and routes to human review or emergency instructions approved by clinicians. Every interaction logged for audit with secure PHI handling.

Architecture flow: Patient/Staff -> Secure Intake UI -> Identity + Consent -> Intake Orchestrator -> Approved Protocol RAG + Safety Classifier -> Structured Intake DB -> Scheduling/EHR APIs -> Clinician Summary -> Human Review + Audit

Key data entities: Patient (verified identity/demographics/consent status), Guardian (proxy relationship and authorization), IntakeSession (conversation state/status/language/urgency), Symptom (structured symptom/onset/severity/duration), Medication (name/dose/confidence), Insurance (plan details and eligibility), EscalationFlag (urgency reason and routing action), ClinicianSummary, AuditLog, RetentionRecord (consent/retention category/deletion status).

Auth model: Patient portal authentication or verified intake link with limited scope. Separate patient, staff, clinician, and admin roles. Enforce minimum necessary access for staff and services. Use service accounts with scoped EHR/scheduling API permissions. Log all PHI access and model interactions. Support proxy/guardian authorization and revocation.

RAG/Agent design: RAG limited to approved intake scripts, clinic policies, scheduling rules, insurance FAQs, and escalation protocols. Do NOT retrieve arbitrary medical knowledge for diagnosis. Use structured slot filling plus follow-up questions instead of open-ended medical advice. Prompt model to collect facts, not diagnose; escalate when uncertain or urgent. Use tool calls for scheduling lookup or eligibility verification only after consent and auth checks. Version all clinical scripts and escalation rules with clinician approval.

Evaluation: Completeness (required intake fields captured correctly), safety (urgent symptoms escalated per approved protocol), PHI handling (no PHI in unsafe logs or unauthorized outputs), patient experience (completion rate and satisfaction), clinical usefulness (clinicians rate summaries for clarity and accuracy), latency (conversation response time and scheduling API response time).

Failure modes: Missed urgent symptom -> rules-based escalation and clinician-approved classifier; Diagnosis generated -> hard refusal and constrained prompt; PHI leak in logs -> redaction, secure logging, access controls; Wrong patient match -> strong auth and confirmation screens; EHR write error -> human review and idempotent writes; Consent missing -> consent gate before data collection.

Rollout: (1) Start as staff-assist for intake summaries, (2) pilot patient-facing intake for one clinic and low-risk appointment types, (3) validate urgent escalation test suite, (4) add scheduling integration with human confirmation, (5) integrate EHR writeback after review, (6) expand departments and languages, (7) conduct regular privacy/security audits.

Strong vs Weak signals: Weak candidate ignores PHI controls, consent, and safe escalation requirements. Strong candidate specifies consent gate, PHI minimization, clinician-approved escalation rules, EHR writeback review, and prohibited actions.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs106', 'case-study', 'Legal Contract Review Copilot with Human Approval', 'hard',
'A legal department wants a copilot that reviews NDAs, MSAs, DPAs, and procurement contracts, highlights risky clauses, compares against playbooks, and drafts redlines for attorney approval.

Customer Situation: Legal teams review high volumes of contracts with similar issues: indemnity, liability caps, data processing, termination, governing law, confidentiality, and security terms. Business teams want faster turnaround, but legal cannot accept hallucinated clauses, missing context, or unauthorized redlines. The copilot must follow company playbooks and preserve attorney review.

Stakeholders: Commercial legal, procurement, sales, privacy, security, business owners, outside counsel, legal operations.

Current workflow: Attorneys manually compare contracts against clause libraries and playbooks, add comments, draft redlines, and negotiate terms via email or CLM tools.

Success criteria: Reduced review cycle time, high clause detection accuracy, consistent risk labels, no unauthorized legal advice, and full human approval. Copilot assists attorneys; it does not provide final legal advice or send redlines externally without approval.

Constraints: Legal privilege, jurisdiction variation, document formatting, negotiation nuance, high cost of false negatives for high-risk clauses. Retention and attorney-client privilege requirements apply.

MVP scope: NDA/MSA first-pass review, clause extraction, risk summary, playbook-cited comments, attorney approval workflow.

Out of scope: Autonomous negotiation, final legal approval, court filings, unrestricted legal advice to non-lawyers.',
ARRAY[
  'False negatives on high-risk clauses (indemnity, liability caps, data processing) are the most dangerous failure mode — prioritize recall',
  'Chunk contracts by clause boundaries, not arbitrary token windows — clause number and page reference must be preserved for citations',
  'Every generated comment or redline must cite the exact playbook rule AND the contract clause — uncited suggestions are rejected',
  'Attorney-client privilege requires separate access controls: privileged documents must not be accessible to business users',
  'Playbook versioning and change control are mandatory: legal operations must approve any playbook or prompt changes',
  'Jurisdiction variation means the same clause may have different risk levels in different legal systems — use metadata filters by jurisdiction',
  'Agentic workflow is justified here: extract clause -> classify risk -> retrieve playbook rule -> draft comment -> submit for attorney review',
  'Overconfident legal advice is a compliance risk: all output must include attorney-facing wording and clear disclaimers'
],
'Proposed Architecture: Integrate with contract lifecycle management (CLM) system or secure upload portal. Ingestion pipeline converts contracts to structured text preserving clause numbering and page references. Orchestration service retrieves relevant playbook sections and fallback language, extracts clauses, classifies risk, generates attorney-facing comments, and optionally produces proposed redlines. All suggestions enter a review queue. System stores model run lineage, playbook version, contract version, and approval decisions.

Architecture flow: Attorney/Business User -> CLM/Secure Upload -> AuthZ + Matter Permissions -> Contract Parser -> Clause Extractor -> Playbook Retrieval -> Review Orchestrator -> LLM Comments/Redlines -> Attorney Approval -> CLM Update + Audit

Key data entities: Matter (business transaction or review request), Contract (document version/type/counterparty/jurisdiction/value), Clause (extracted text/category/page/section number), PlaybookRule (approved policy/fallback language/risk severity), RedlineSuggestion (proposed edit/rationale/playbook citation/status), Reviewer (attorney or legal ops user), Approval, PrivilegeLabel (attorney-client privilege and access restrictions), AuditLog, Feedback.

Auth model: SSO with matter/team-level authorization. Restrict legal privileged documents to legal roles and assigned business owners. Use document-level permissions from CLM and matter management tools. Require separate approval permissions for redlines and external sharing. Log all document views, generated comments, and approvals. Allow legal operations to manage playbook versions with change control.

RAG/Agent design: Chunk contracts by clause boundaries. Index playbooks, fallback clauses, negotiation guidance, and policy exceptions. Use retrieval filters by contract type, jurisdiction, product, deal size, and risk tier. Prompt model to cite exact playbook rule and contract clause for every issue. Agent workflow: extract clauses -> classify -> retrieve rule -> draft comment -> submit for approval. Keep agent tools bounded: no external sending, no final approval, no modification without reviewer action.

Evaluation: Clause detection recall (gold contracts annotated by attorneys), risk classification (compare severity against playbook labels), citation quality (each issue cites correct contract clause and playbook rule), redline usefulness (attorney accept/modify/reject rate), false negative safety (special test set for high-risk clauses), turnaround (review cycle time reduction).

Failure modes: Missed risky clause -> high-recall extraction + mandatory human review; Wrong playbook rule -> metadata filters by contract type/jurisdiction; Unauthorized business access -> matter-level permissions and audit; Bad redline formatting -> CLM-native redline integration; Privilege leak -> privilege labels and strict access; Overconfident legal advice -> attorney-facing wording and disclaimers.

Rollout: (1) NDA clause issue spotting, (2) parallel review against attorneys without showing suggestions to business users, (3) add MSA playbooks and risk summaries, (4) enable attorney-approved comments, (5) integrate redline suggestions in CLM, (6) expand to DPAs and procurement templates, (7) review model/prompt/playbook changes through legal ops governance.

Strong vs Weak signals: Weak candidate builds summarization without addressing privilege, jurisdiction, false negative risk, or playbook citation requirements. Strong candidate designs clause-boundary chunking, metadata-filtered playbook retrieval, mandatory human approval, and legal ops governance for model/prompt changes.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs107', 'case-study', 'Retail Demand Forecasting System with GenAI Explanation Layer', 'hard',
'A retailer already has demand forecasting models but wants a GenAI layer that explains forecasts, highlights drivers, summarizes anomalies, and helps planners make inventory decisions.

Customer Situation: Retail planners use statistical or ML forecasting systems, spreadsheets, promotions data, weather, holidays, and historical sales. Forecasts are often accurate enough numerically but hard to explain to regional managers and store operators. The company wants GenAI to explain forecast changes, generate planning narratives, and answer questions such as why a product is over-forecast in a region. The LLM must not invent drivers or override the forecasting model.

Stakeholders: Demand planners, supply chain leaders, store operations, merchandising, data science, finance, IT, regional managers.

Current workflow: Planners inspect dashboards, compare spreadsheets, ask data science for explanations, and manually write narratives for forecast reviews.

Success criteria: Higher forecast trust, shorter planning meetings, better exception handling, and measurable inventory outcomes. The existing forecasting model remains source of truth; GenAI only explains and summarizes.

Constraints: Huge data volume, numeric accuracy, seasonal complexity, forecasting model ownership, risk of over-trusting generated explanations. Margin and supplier-sensitive data requires role-based field masking.

MVP scope: Explanation layer for top forecast exceptions with cited drivers from curated forecast feature tables.

Out of scope: Replacing forecasting models, autonomous inventory ordering, unsupported causal claims, supplier commitments without approval.',
ARRAY[
  'GenAI must NEVER modify forecasts or invent drivers — it only explains what the existing model produced with documented features',
  'This case is mostly structured retrieval, not classic document RAG: use curated forecast feature tables, not free-form document search',
  'Numeric consistency validation is mandatory: generated text values must match the warehouse values exactly',
  'Correlation vs causation: prompt model explicitly to label correlation, not claim causation; include caveat policy',
  'Do not allow arbitrary SQL: use safe parameterized query templates or semantic data APIs over curated warehouse views only',
  'Precompute explanations for top exceptions to meet dashboard latency requirements — on-demand generation is too slow at scale',
  'Role-based field masking for margin and supplier-sensitive data: planners should only see the data they are authorized to see',
  'Agentic workflow is justified: gather forecast data -> retrieve drivers -> fetch anomalies -> retrieve business event context -> synthesize'
],
'Proposed Architecture: Use existing forecasting pipeline to write forecasts, confidence intervals, feature contributions, anomalies, promotions, and external events into a curated explanation store. GenAI service receives planner''s selected SKU/region/time horizon, retrieves structured driver data and relevant business context, and generates a narrative with charts/tables referenced. For ad hoc questions, LLM calls safe SQL templates or semantic data APIs over curated warehouse views, not arbitrary raw SQL. Outputs include confidence, caveats, and links to source dashboards.

Architecture flow: Planner -> Forecast Dashboard -> SSO/AuthZ -> Explanation API -> Curated Forecast Store + Feature Drivers + Business Event RAG -> Safe SQL/Tool Layer -> LLM Explanation -> Numeric Validator -> Narrative + Sources -> Feedback/Decision Log

Key data entities: Product (SKU/category/lifecycle stage), Location (store/region/channel), Forecast (horizon/predicted demand/confidence interval/model version), Driver (promotion/price/holiday/weather/trend/feature contribution), Anomaly (exception/stockout/data quality issue), Planner (user role/region/category access), Explanation (generated narrative/sources/model/prompt version), Decision (planner override/rationale/approval), Feedback, AuditLog.

Auth model: Enterprise SSO mapping planners to categories and regions. Restrict financial margin or supplier-sensitive data by role. Allow read-only access to curated forecast/explanation views. Use service identities for warehouse access and parameterized query tools. Log generated explanations used in official planning meetings.

RAG/Agent design: Mostly structured retrieval. Use RAG for planning policies, promotion calendars, and historical event notes. Use tool calls to query curated forecast feature tables through safe templates. Prompt LLM to explain only provided drivers and clearly label correlation vs causation. Include numeric validation to ensure generated text matches forecast values. Agentic workflows gather forecast, drivers, anomalies, and policy context, then synthesize.

Evaluation: Numerical consistency (generated explanation values match warehouse values), driver faithfulness (narrative includes only supported drivers), planner usefulness (planner ratings and override quality), business KPI (stockout rate/overstock/forecast override accuracy), latency (dashboard P95 explanation time), regression (model/prompt changes tested on past forecast cycles).

Failure modes: Invented driver -> grounding checks and source-limited prompting; Wrong numbers -> structured data injection and validation; Latency too high -> precompute explanations for top exceptions; Bad business action -> human approval and outcome tracking; Sensitive margin leak -> role-based field masking; Confusing causality -> correlation/caveat policy.

Rollout: (1) Explanation-only for top category exceptions, (2) precompute weekly narratives for planning meeting, (3) add planner Q&A over curated views, (4) measure planner trust and override outcomes, (5) expand product categories and regions, (6) add executive summaries, (7) govern explanation templates through demand planning leadership.

Strong vs Weak signals: Weak candidate treats this as standard RAG and forgets numeric consistency, driver faithfulness, and the constraint that forecasting model is source of truth. Strong candidate separates explanation layer from forecast generation, uses curated feature tables, validates numbers, and prevents invented drivers.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs108', 'case-study', 'AI Incident Triage Bot for SRE / DevOps Teams', 'hard',
'An SRE organization wants a GenAI bot that summarizes alerts, correlates logs/metrics/traces, suggests probable causes, links runbooks, and drafts incident updates during production outages.

Customer Situation: Production incidents create noisy alerts across monitoring tools, logs, traces, deploy systems, and chat channels. Incident commanders waste time collecting context, while engineers repeatedly search runbooks and dashboards. The team wants an assistant that accelerates triage but must not perform risky remediation automatically. It should summarize evidence, suggest next checks, and draft stakeholder updates.

Stakeholders: SREs, incident commanders, service owners, platform engineers, support, executives, customer success, security.

Current workflow: Engineers manually inspect alerts, dashboards, logs, deploy history, runbooks, and Slack threads, then write incident updates.

Success criteria: Faster triage, better evidence summaries, high-quality status updates, and no unsafe autonomous changes. Bot is advisory; remediation actions require explicit human approval and existing change controls.

Constraints: Noisy telemetry, sensitive logs (may contain PII or secrets), time pressure, risk of unsafe remediation, tool rate limits during outages. Read-only by default.

MVP scope: Read-only triage summary, runbook retrieval, service ownership lookup, and stakeholder update drafts.

Out of scope: Autonomous rollback, production config changes, secret access, and root-cause certainty without evidence.',
ARRAY[
  'Bot is ADVISORY ONLY: any remediation action requires explicit human approval and existing change management controls',
  'Secrets and PII in logs/traces must be redacted BEFORE they reach the model input — log scanning and redaction pipeline required',
  'Use live tool queries for telemetry (metrics/logs/traces), not embeddings — fast-changing operational data should not be in a vector store',
  'Separate evidence from hypothesis: prompt model explicitly to label what is observed vs what is inferred vs what is a suggested next check',
  'High availability during incidents is critical: the triage bot itself must not become a dependency that fails during outages',
  'Runbook staleness is a real risk: surface last-validated timestamp and owner with every retrieved runbook',
  'Audience-scoped stakeholder updates: incident details should not be broadcast to broad channels without appropriate filtering',
  'Agentic workflow is justified: gather alerts -> check recent deploys -> query metrics -> retrieve runbooks -> synthesize evidence summary'
],
'Proposed Architecture: Deploy bot in incident chat and web console. Incident context service receives alerts, severity, affected services, deploy events, and telemetry links. Orchestrator uses safe read-only tools to query metrics, logs, traces, and service catalog data, retrieves relevant runbooks, and asks LLM to generate evidence-based summary with suggested next checks. All outputs cite telemetry links and runbook sections. Remediation tools, if added later, require explicit approval and change-management integration.

Architecture flow: Alert/IC -> Slack/Web Bot -> Incident AuthZ -> Incident Context Service -> Read-only Observability Tools + Service Catalog + Runbook RAG -> Triage Orchestrator -> LLM Evidence Summary -> Update Drafts -> Human Approval + Audit

Key data entities: Incident (severity/status/timeline/commander/affected services), Alert (source/labels/threshold/firing time), Service (owner/dependencies/SLOs/runbooks), Signal (metric/log/trace query result with time window), DeployEvent (release/config change/rollback status), Runbook (procedure/owner/last validated time), Suggestion (next check or mitigation with evidence), UpdateDraft (customer/internal status update), Approval, AuditLog.

Auth model: SSO mapping users to incident roles and service ownership. Read-only telemetry access for most users; action permissions separate. Mask secrets and PII in logs before model input. Restrict high-severity channels and incident details by audience. Use scoped service tokens for observability APIs. Audit all tool calls during incidents.

RAG/Agent design: Retrieve runbooks by service, alert labels, error signatures, and dependency graph. Use tools for live telemetry rather than embedding fast-changing metrics. Prompt model to separate evidence from hypothesis and suggested next steps. Use agentic workflow: gather alerts -> check recent deploys -> query metrics -> retrieve runbooks -> summarize. Block write actions unless they go through approval tool and change policy. Generate stakeholder updates from incident timeline and verified impact only.

Evaluation: Triage usefulness (SREs rate suggested next checks against historical incidents), evidence grounding (each hypothesis must link to telemetry or runbook evidence), communication quality (incident commander rates update drafts), safety (red-team unsafe remediation and secret leakage), MTTA/MTTD impact (compare pilot vs baseline incident metrics), latency (time to generate initial triage summary).

Failure modes: Wrong root cause -> label hypotheses and require evidence; Secret leak -> redaction pipeline and secret detectors; Unsafe remediation -> read-only default and approval gates; Runbook stale -> freshness labels and owner review; Telemetry outage -> fallback to links and manual workflow; Broad info leak -> audience-scoped update templates.

Rollout: (1) Post-incident summarization on historical incidents, (2) read-only Slack bot for low-severity incidents, (3) add runbook retrieval and service owner lookup, (4) add stakeholder update drafts, (5) pilot in one on-call rotation, (6) expand to higher severity after safety review, (7) only later consider approval-gated remediation suggestions.

Strong vs Weak signals: Weak candidate proposes autonomous remediation or ignores secrets/PII risks. Strong candidate designs read-only default, secret redaction, evidence vs hypothesis separation, agentic triage workflow, and approval gates for any write action.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs109', 'case-study', 'Multi-Tenant SaaS GenAI Assistant', 'hard',
'A SaaS platform wants to offer a GenAI assistant to all enterprise tenants. The assistant answers product questions, analyzes tenant data, drafts workflow actions, and adapts to each tenant''s permissions and configuration.

Customer Situation: The SaaS company serves many enterprise customers with strict tenant isolation. Each tenant has custom data, roles, workflows, and integrations. Product leadership wants an AI assistant as a platform feature. The assistant must scale across tenants, enforce isolation, control cost, support different model policies, and allow enterprise admins to configure what AI can access and do.

Stakeholders: Product, platform engineering, enterprise customers, tenant admins, security, privacy, finance, customer success, support.

Current workflow: Users navigate dashboards, ask support, export CSVs, and manually perform workflows inside the SaaS product.

Success criteria: High adoption across tenants, low support burden, clear ROI, strict isolation, and controlled unit economics. Assistant starts with read-only Q&A and limited draft actions; tenant admins enable capabilities.

Constraints: Multi-tenant leakage risk, varied customer policies, high scale, per-tenant customization, cost margins. Each request must carry tenant_id and user permissions.

MVP scope: Product-help RAG plus tenant-aware data Q&A over a small set of safe objects, with audit logs and admin controls.

Out of scope: Cross-tenant analytics, autonomous destructive actions, unrestricted SQL, and tenant data use for other tenants.',
ARRAY[
  'Cross-tenant data leakage is the top existential risk: a single leak destroys trust with all enterprise customers',
  'Never share cache entries across tenants unless content is exclusively global public product documentation',
  'Use tenant-scoped indexes OR strong metadata filters with fail-closed checks — never retrieve first and filter after generation',
  'Separate global product-help RAG path from tenant-private data RAG path — these have fundamentally different isolation requirements',
  'Tenant admin controls must be a first-class feature: retention, model policy, data source authorization, and audit exports',
  'Cost control is a product margin problem: per-tenant rate limits, quotas, and model routing based on plan tier are required',
  'Prompt injection from tenant-uploaded content is a real attack vector: instruction hierarchy and content sanitization required',
  'Bring-your-own-key (BYOK) or private model endpoint requirements may differ per enterprise customer — design for configurability'
],
'Proposed Architecture: AI platform layer inside SaaS architecture. Global product docs indexed separately from tenant-private data. Each request includes tenant_id, user_id, role, plan, AI policy, and capability flags. Orchestrator enforces policy, retrieves from tenant-scoped indexes or metadata-filtered vector stores, calls tools with tenant-scoped tokens, and records per-tenant usage. Admins configure allowed data sources, model provider settings, retention, and action permissions. Rate limit and budget service protects margins.

Architecture flow: Tenant User -> SaaS UI Assistant -> SaaS Auth -> AI Policy Service -> Tenant-Aware Orchestrator -> Global Product RAG / Tenant Private RAG / Tenant-Scoped Tools -> LLM -> Guardrails -> Response/Action Approval -> Usage + Audit + Billing

Key data entities: Tenant (isolation boundary/plan/AI settings/model policy), User (tenant user identity/roles/permissions), Capability (enabled assistant features per tenant), DataSource (tenant objects/docs/tickets/analytics views), Chunk (tenant-scoped indexed content), Tool (safe product action with schema and permissions), Conversation (tenant-bound chat session), UsageRecord (tokens/tool calls/cost/latency by tenant), AdminPolicy (retention/model/data access/budget limits), AuditLog (tenant-exportable record).

Auth model: Every request carries tenant_id and user permissions from SaaS auth system. Use tenant-scoped indexes or strong metadata filters with fail-closed checks. Use row-level/object-level authorization for tenant data tools. Separate global product-help access from tenant-private data access. Provide tenant admin controls for capabilities, retention, and audit exports. Do not share cache entries across tenants except for global public product docs.

RAG/Agent design: Maintain separate global product RAG and tenant-private RAG paths. Use metadata filters for tenant_id, object_id, sensitivity, and user permissions. Use tenant-specific terminology dictionaries and configuration in prompts. Use tool calling for product workflows with permission and confirmation for writes. Use model routing based on tenant policy and plan tier. Guard against prompt injection from tenant-uploaded content.

Evaluation: Tenant isolation (cross-tenant negative retrieval tests), answer quality (tenant-specific golden questions), tool safety (permission tests for each action), cost (margin per tenant and budget alerts), latency (P95 by tenant tier), admin trust (audit export completeness and policy enforcement).

Failure modes: Cross-tenant leak -> tenant-scoped storage/cache keys/tests/alerts; Budget overrun -> rate limits/quotas/model routing; Unauthorized action -> tool permission enforcement and confirmation; Policy mismatch -> policy service as mandatory gate; Noisy tenant docs -> tenant curation and feedback; Prompt injection -> instruction hierarchy and content sanitization.

Rollout: (1) Private beta with internal tenant and one design partner, (2) global product-help assistant only, (3) add tenant data Q&A for read-only safe objects, (4) enable admin policy controls, (5) add limited approved actions, (6) expand to more tenants by plan tier, (7) introduce billing/quotas after usage data stabilizes.

Strong vs Weak signals: Weak candidate builds a single-tenant assistant and assumes tenant isolation is straightforward. Strong candidate designs separate RAG paths, tenant-scoped indexes, fail-closed checks, per-tenant cost controls, admin policy service, and thorough cross-tenant negative testing suite.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs110', 'case-study', 'Executive Dashboard Copilot over BigQuery / Data Warehouse', 'hard',
'Executives want a copilot over BigQuery or a cloud data warehouse that answers business questions, explains metrics, generates board-ready summaries, and helps explore dashboards safely.

Customer Situation: Executives rely on dashboards, BI teams, analysts, and weekly reports. They want natural-language answers to revenue, churn, growth, operational, and customer metrics. The risk is that natural language to SQL can produce wrong numbers, leak restricted metrics, or encourage decisions based on misunderstood definitions. The copilot must use governed semantic layers and explain metric definitions.

Stakeholders: Executives, analysts, data engineering, finance, sales operations, product, security, data governance.

Current workflow: Executives ask analysts, inspect dashboards, request CSVs, and wait for manually prepared summaries.

Success criteria: Lower analyst load, faster metric exploration, consistent definitions, and no unauthorized data exposure. Copilot uses a semantic layer or approved query templates; it does not run arbitrary SQL generated from scratch against raw tables.

Constraints: Ambiguous business language, expensive warehouse queries, metric governance, row/column security, high-stakes executive decisions. Query cost must be estimated and guarded before execution.

MVP scope: Natural-language Q&A over top 30 governed metrics with chart links, citations, and analyst-reviewed executive summaries.

Out of scope: Unrestricted raw SQL, customer-level exports for unauthorized users, financial guidance without finance review, board materials without approval.',
ARRAY[
  'Never allow arbitrary free-form SQL generated from scratch: use a semantic layer or approved parameterized query templates',
  'Metric definitions must be cited for every number: ambiguous terms like "revenue" have multiple valid definitions in most companies',
  'Query cost estimation and guardrail must run BEFORE execution — runaway BigQuery queries can incur massive costs',
  'Numerical correctness is the primary quality metric: generated narrative must be validated against structured query results before returning',
  'Row/column-level security must be enforced at the warehouse or semantic layer, not just in the application layer',
  'Clarifying questions are required when metric, time period, or dimension is ambiguous — do not guess and return possibly wrong numbers',
  'Board-ready summaries require analyst/finance approval before sharing externally — do not allow direct executive-to-board publishing',
  'Agentic workflow for multi-metric questions: plan multiple governed metric queries, cost-check each, execute, then synthesize'
],
'Proposed Architecture: UI embedded in BI dashboards and executive portal. Orchestrator maps questions to governed metrics, resolves ambiguity, checks user entitlements, and calls semantic metric API or parameterized query service over BigQuery. A metadata/RAG layer retrieves metric definitions, dashboard descriptions, and business glossary entries. LLM explains results, trends, and caveats using only validated query outputs. A query cost guard estimates cost before execution and rejects risky scans.

Architecture flow: Executive -> BI/Portal Copilot -> SSO + Data Entitlements -> Metric Intent Parser -> Business Glossary RAG -> Semantic Layer / BigQuery Query Service -> Cost Guard + RLS/CLS -> LLM Narrative -> Numeric Validator -> Answer + Dashboard Links + Audit

Key data entities: User (executive/analyst identity and data entitlements), Metric (governed definition/owner/formula/grain/freshness), Dimension (region/product/segment/time period), QueryRequest (natural-language request/parsed intent/parameters), QueryResult (validated numeric result/query ID/cost/freshness), Narrative (generated explanation/caveats/citations), Dashboard (source report and link), Approval (analyst/finance review for board-ready outputs), UsageRecord (warehouse cost/tokens/latency), AuditLog (question/permissions/query/output).

Auth model: Enterprise SSO with data warehouse entitlements and BI permissions. Enforce row/column-level security through warehouse or semantic layer. Limit customer-level or employee-level data by role. Use service accounts with query scopes and cost quotas. Audit all generated queries and outputs. Require analyst/finance approval for board-ready narratives.

RAG/Agent design: Use RAG over business glossary, metric definitions, dashboard docs, and data quality notes. Use tools for governed metric queries; avoid free-form SQL where possible. Ask clarifying questions when metric, time period, or dimension is ambiguous. Validate generated narrative against structured query results. Cite metric definitions and dashboard sources for every number. Agentic workflow can plan multiple metric queries, but each must be governed and cost-checked.

Evaluation: Numeric correctness (answers match semantic layer outputs), metric interpretation (analysts validate glossary usage), permission safety (restricted dimensions/columns inaccessible to unauthorized users), cost (BigQuery cost per interaction and rejected expensive queries), executive usefulness (reduction in ad hoc analyst requests), latency (P95 query and answer time).

Failure modes: Wrong number -> semantic layer + numeric validation + regression tests; Ambiguous metric -> clarify or show definition choices; Excessive query cost -> query guardrails and aggregates; Unauthorized detail -> warehouse RLS/CLS and policy checks; Stale data -> freshness warnings and source timestamp; Overconfident narrative -> caveats and source-limited explanations.

Rollout: (1) Start with glossary and metric explanation mode, (2) add Q&A for top governed metrics, (3) pilot with analysts supporting executives, (4) enable executive portal with query cost guard, (5) add board-summary draft with approval workflow, (6) expand metric coverage, (7) continuously review wrong-number incidents and usage patterns.

Strong vs Weak signals: Weak candidate builds text-to-SQL and ignores metric governance, cost guardrails, and numerical validation. Strong candidate specifies semantic layer requirement, governed metric APIs, query cost estimation, numeric consistency validation, clarifying question strategy, and analyst/finance approval for board outputs.');
