-- Q51–100 seed data for the questions table
-- Security, Compliance, and Permissions (Q51–60) → system-design, sd201–sd210
-- Observability and Production Operations (Q61–70) → system-design, sd211–sd220
-- Latency, Cost, and Scalability (Q71–80) → system-design, sd221–sd230
-- Troubleshooting and Failure Modes (Q81–90) → genai-architecture, g301–g310
-- Stakeholder Communication and Implementation Planning (Q91–100) → behavioral, b301–b310

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd201', 'system-design', 'How would you design permission-aware retrieval for enterprise documents?', 'medium',
'How would you design permission-aware retrieval for enterprise documents?

What the Interviewer Is Testing
The interviewer is testing whether you can protect customer data and design GenAI systems with authorization, tenant isolation, prompt-injection defense, auditability, and compliance constraints. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you enforce document-level permissions?
- How would you defend against prompt injection?
- What data should not be logged?
- How would you handle regulated customer data?
- What security control must live outside the LLM?',
ARRAY['Trusting the LLM to enforce security rules.','Applying permissions after retrieval instead of before generation.','Logging sensitive prompts and outputs carelessly.','Ignoring tenant isolation and auditability.'],
'Strong Answer: I would implement authentication, authorization, tenant isolation, encrypted transport and storage, secret management, and permission-aware retrieval or tool access. I would treat prompts and retrieved data as untrusted inputs, add prompt-injection defenses, prevent cross-tenant leakage, and log sensitive events without storing unnecessary PII. Scenario-specific implementation detail: I would model invoice exception handling as a state machine: classify exception, gather evidence, propose resolution, request approval, execute ERP update, and record audit evidence. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design assumes the model is not a security boundary. I would enforce permissions outside the LLM, filter retrieval by user entitlement before generation, scope tool tokens to the minimum required action, and add policy checks before any data exposure or write operation. I would define data retention, audit logs, redaction, DLP checks, incident response, vendor data-processing constraints, and customer-specific compliance needs. I would also red-team prompt injection, indirect injection from documents, malicious tool outputs, and privilege escalation paths. Senior execution detail: I would protect against duplicate payments, wrong vendor updates, missing approval, partial ERP failures, and unclear financial accountability. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd202', 'system-design', 'How would you defend a RAG system against prompt injection hidden inside retrieved documents?', 'medium',
'How would you defend a RAG system against prompt injection hidden inside retrieved documents?

What the Interviewer Is Testing
The interviewer is testing whether you can protect customer data and design GenAI systems with authorization, tenant isolation, prompt-injection defense, auditability, and compliance constraints. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you enforce document-level permissions?
- How would you defend against prompt injection?
- What data should not be logged?
- How would you handle regulated customer data?
- What security control must live outside the LLM?',
ARRAY['Trusting the LLM to enforce security rules.','Applying permissions after retrieval instead of before generation.','Logging sensitive prompts and outputs carelessly.','Ignoring tenant isolation and auditability.'],
'Strong Answer: I would implement authentication, authorization, tenant isolation, encrypted transport and storage, secret management, and permission-aware retrieval or tool access. I would treat prompts and retrieved data as untrusted inputs, add prompt-injection defenses, prevent cross-tenant leakage, and log sensitive events without storing unnecessary PII. Scenario-specific implementation detail: I would enforce access control and policy outside the model, minimize sensitive data in prompts, redact logs, and treat retrieved content and tool outputs as untrusted. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design assumes the model is not a security boundary. I would enforce permissions outside the LLM, filter retrieval by user entitlement before generation, scope tool tokens to the minimum required action, and add policy checks before any data exposure or write operation. I would define data retention, audit logs, redaction, DLP checks, incident response, vendor data-processing constraints, and customer-specific compliance needs. I would also red-team prompt injection, indirect injection from documents, malicious tool outputs, and privilege escalation paths. Senior execution detail: I would prepare threat models for data leakage, indirect prompt injection, privilege escalation, overbroad tool tokens, and cross-tenant retrieval mistakes. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd203', 'system-design', 'A customer asks whether the LLM provider can train on their data. How do you respond architecturally?', 'medium',
'A customer asks whether the LLM provider can train on their data. How do you respond architecturally?

What the Interviewer Is Testing
The interviewer is testing whether you can protect customer data and design GenAI systems with authorization, tenant isolation, prompt-injection defense, auditability, and compliance constraints. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you enforce document-level permissions?
- How would you defend against prompt injection?
- What data should not be logged?
- How would you handle regulated customer data?
- What security control must live outside the LLM?',
ARRAY['Trusting the LLM to enforce security rules.','Applying permissions after retrieval instead of before generation.','Logging sensitive prompts and outputs carelessly.','Ignoring tenant isolation and auditability.'],
'Strong Answer: I would implement authentication, authorization, tenant isolation, encrypted transport and storage, secret management, and permission-aware retrieval or tool access. I would treat prompts and retrieved data as untrusted inputs, add prompt-injection defenses, prevent cross-tenant leakage, and log sensitive events without storing unnecessary PII. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design assumes the model is not a security boundary. I would enforce permissions outside the LLM, filter retrieval by user entitlement before generation, scope tool tokens to the minimum required action, and add policy checks before any data exposure or write operation. I would define data retention, audit logs, redaction, DLP checks, incident response, vendor data-processing constraints, and customer-specific compliance needs. I would also red-team prompt injection, indirect injection from documents, malicious tool outputs, and privilege escalation paths. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd204', 'system-design', 'How would you design audit logging for AI-generated recommendations and actions?', 'medium',
'How would you design audit logging for AI-generated recommendations and actions?

What the Interviewer Is Testing
The interviewer is testing whether you can protect customer data and design GenAI systems with authorization, tenant isolation, prompt-injection defense, auditability, and compliance constraints. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you enforce document-level permissions?
- How would you defend against prompt injection?
- What data should not be logged?
- How would you handle regulated customer data?
- What security control must live outside the LLM?',
ARRAY['Trusting the LLM to enforce security rules.','Applying permissions after retrieval instead of before generation.','Logging sensitive prompts and outputs carelessly.','Ignoring tenant isolation and auditability.'],
'Strong Answer: I would implement authentication, authorization, tenant isolation, encrypted transport and storage, secret management, and permission-aware retrieval or tool access. I would treat prompts and retrieved data as untrusted inputs, add prompt-injection defenses, prevent cross-tenant leakage, and log sensitive events without storing unnecessary PII. Scenario-specific implementation detail: I would capture correlation IDs, user context, permission decisions, retrieved source IDs, prompt/model versions, tool calls, and final decision metadata. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design assumes the model is not a security boundary. I would enforce permissions outside the LLM, filter retrieval by user entitlement before generation, scope tool tokens to the minimum required action, and add policy checks before any data exposure or write operation. I would define data retention, audit logs, redaction, DLP checks, incident response, vendor data-processing constraints, and customer-specific compliance needs. I would also red-team prompt injection, indirect injection from documents, malicious tool outputs, and privilege escalation paths. Senior execution detail: I would avoid storing raw sensitive content unless necessary, implement retention controls, and make audit trails usable for compliance and incident review. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd205', 'system-design', 'How would you prevent cross-tenant data leakage in a multi-tenant GenAI platform?', 'medium',
'How would you prevent cross-tenant data leakage in a multi-tenant GenAI platform?

What the Interviewer Is Testing
The interviewer is testing whether you can protect customer data and design GenAI systems with authorization, tenant isolation, prompt-injection defense, auditability, and compliance constraints. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you enforce document-level permissions?
- How would you defend against prompt injection?
- What data should not be logged?
- How would you handle regulated customer data?
- What security control must live outside the LLM?',
ARRAY['Trusting the LLM to enforce security rules.','Applying permissions after retrieval instead of before generation.','Logging sensitive prompts and outputs carelessly.','Ignoring tenant isolation and auditability.'],
'Strong Answer: I would implement authentication, authorization, tenant isolation, encrypted transport and storage, secret management, and permission-aware retrieval or tool access. I would treat prompts and retrieved data as untrusted inputs, add prompt-injection defenses, prevent cross-tenant leakage, and log sensitive events without storing unnecessary PII. Scenario-specific implementation detail: I would enforce access control and policy outside the model, minimize sensitive data in prompts, redact logs, and treat retrieved content and tool outputs as untrusted. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design assumes the model is not a security boundary. I would enforce permissions outside the LLM, filter retrieval by user entitlement before generation, scope tool tokens to the minimum required action, and add policy checks before any data exposure or write operation. I would define data retention, audit logs, redaction, DLP checks, incident response, vendor data-processing constraints, and customer-specific compliance needs. I would also red-team prompt injection, indirect injection from documents, malicious tool outputs, and privilege escalation paths. Senior execution detail: I would prepare threat models for data leakage, indirect prompt injection, privilege escalation, overbroad tool tokens, and cross-tenant retrieval mistakes. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd206', 'system-design', 'Design tool permissions for an agent that can read tickets, draft responses, and update records. What would you do?', 'medium',
'Design tool permissions for an agent that can read tickets, draft responses, and update records. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can protect customer data and design GenAI systems with authorization, tenant isolation, prompt-injection defense, auditability, and compliance constraints. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you enforce document-level permissions?
- How would you defend against prompt injection?
- What data should not be logged?
- How would you handle regulated customer data?
- What security control must live outside the LLM?',
ARRAY['Trusting the LLM to enforce security rules.','Applying permissions after retrieval instead of before generation.','Logging sensitive prompts and outputs carelessly.','Ignoring tenant isolation and auditability.'],
'Strong Answer: I would implement authentication, authorization, tenant isolation, encrypted transport and storage, secret management, and permission-aware retrieval or tool access. I would treat prompts and retrieved data as untrusted inputs, add prompt-injection defenses, prevent cross-tenant leakage, and log sensitive events without storing unnecessary PII. Scenario-specific implementation detail: I would begin with agent-assist mode: classify the ticket, retrieve relevant knowledge, draft a reply, and escalate when confidence, policy, or sentiment thresholds require human review. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design assumes the model is not a security boundary. I would enforce permissions outside the LLM, filter retrieval by user entitlement before generation, scope tool tokens to the minimum required action, and add policy checks before any data exposure or write operation. I would define data retention, audit logs, redaction, DLP checks, incident response, vendor data-processing constraints, and customer-specific compliance needs. I would also red-team prompt injection, indirect injection from documents, malicious tool outputs, and privilege escalation paths. Senior execution detail: I would measure resolution time, deflection without quality loss, escalation correctness, customer-satisfaction impact, and incidents caused by incorrect automation. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd207', 'system-design', 'How would you handle PII in prompts, logs, and evaluation datasets?', 'medium',
'How would you handle PII in prompts, logs, and evaluation datasets?

What the Interviewer Is Testing
The interviewer is testing whether you can protect customer data and design GenAI systems with authorization, tenant isolation, prompt-injection defense, auditability, and compliance constraints. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you enforce document-level permissions?
- How would you defend against prompt injection?
- What data should not be logged?
- How would you handle regulated customer data?
- What security control must live outside the LLM?',
ARRAY['Trusting the LLM to enforce security rules.','Applying permissions after retrieval instead of before generation.','Logging sensitive prompts and outputs carelessly.','Ignoring tenant isolation and auditability.'],
'Strong Answer: I would implement authentication, authorization, tenant isolation, encrypted transport and storage, secret management, and permission-aware retrieval or tool access. I would treat prompts and retrieved data as untrusted inputs, add prompt-injection defenses, prevent cross-tenant leakage, and log sensitive events without storing unnecessary PII. Scenario-specific implementation detail: I would enforce access control and policy outside the model, minimize sensitive data in prompts, redact logs, and treat retrieved content and tool outputs as untrusted. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design assumes the model is not a security boundary. I would enforce permissions outside the LLM, filter retrieval by user entitlement before generation, scope tool tokens to the minimum required action, and add policy checks before any data exposure or write operation. I would define data retention, audit logs, redaction, DLP checks, incident response, vendor data-processing constraints, and customer-specific compliance needs. I would also red-team prompt injection, indirect injection from documents, malicious tool outputs, and privilege escalation paths. Senior execution detail: I would prepare threat models for data leakage, indirect prompt injection, privilege escalation, overbroad tool tokens, and cross-tenant retrieval mistakes. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd208', 'system-design', 'How would you prepare a GenAI system for a security review by a regulated enterprise customer?', 'medium',
'How would you prepare a GenAI system for a security review by a regulated enterprise customer?

What the Interviewer Is Testing
The interviewer is testing whether you can protect customer data and design GenAI systems with authorization, tenant isolation, prompt-injection defense, auditability, and compliance constraints. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you enforce document-level permissions?
- How would you defend against prompt injection?
- What data should not be logged?
- How would you handle regulated customer data?
- What security control must live outside the LLM?',
ARRAY['Trusting the LLM to enforce security rules.','Applying permissions after retrieval instead of before generation.','Logging sensitive prompts and outputs carelessly.','Ignoring tenant isolation and auditability.'],
'Strong Answer: I would implement authentication, authorization, tenant isolation, encrypted transport and storage, secret management, and permission-aware retrieval or tool access. I would treat prompts and retrieved data as untrusted inputs, add prompt-injection defenses, prevent cross-tenant leakage, and log sensitive events without storing unnecessary PII. Scenario-specific implementation detail: I would model invoice exception handling as a state machine: classify exception, gather evidence, propose resolution, request approval, execute ERP update, and record audit evidence. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design assumes the model is not a security boundary. I would enforce permissions outside the LLM, filter retrieval by user entitlement before generation, scope tool tokens to the minimum required action, and add policy checks before any data exposure or write operation. I would define data retention, audit logs, redaction, DLP checks, incident response, vendor data-processing constraints, and customer-specific compliance needs. I would also red-team prompt injection, indirect injection from documents, malicious tool outputs, and privilege escalation paths. Senior execution detail: I would protect against duplicate payments, wrong vendor updates, missing approval, partial ERP failures, and unclear financial accountability. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd209', 'system-design', 'How would you handle user requests that ask the assistant to reveal confidential data?', 'medium',
'How would you handle user requests that ask the assistant to reveal confidential data?

What the Interviewer Is Testing
The interviewer is testing whether you can protect customer data and design GenAI systems with authorization, tenant isolation, prompt-injection defense, auditability, and compliance constraints. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you enforce document-level permissions?
- How would you defend against prompt injection?
- What data should not be logged?
- How would you handle regulated customer data?
- What security control must live outside the LLM?',
ARRAY['Trusting the LLM to enforce security rules.','Applying permissions after retrieval instead of before generation.','Logging sensitive prompts and outputs carelessly.','Ignoring tenant isolation and auditability.'],
'Strong Answer: I would implement authentication, authorization, tenant isolation, encrypted transport and storage, secret management, and permission-aware retrieval or tool access. I would treat prompts and retrieved data as untrusted inputs, add prompt-injection defenses, prevent cross-tenant leakage, and log sensitive events without storing unnecessary PII. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design assumes the model is not a security boundary. I would enforce permissions outside the LLM, filter retrieval by user entitlement before generation, scope tool tokens to the minimum required action, and add policy checks before any data exposure or write operation. I would define data retention, audit logs, redaction, DLP checks, incident response, vendor data-processing constraints, and customer-specific compliance needs. I would also red-team prompt injection, indirect injection from documents, malicious tool outputs, and privilege escalation paths. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd210', 'system-design', 'How would you design least-privilege access for model, retrieval, and tool layers?', 'medium',
'How would you design least-privilege access for model, retrieval, and tool layers?

What the Interviewer Is Testing
The interviewer is testing whether you can protect customer data and design GenAI systems with authorization, tenant isolation, prompt-injection defense, auditability, and compliance constraints. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you enforce document-level permissions?
- How would you defend against prompt injection?
- What data should not be logged?
- How would you handle regulated customer data?
- What security control must live outside the LLM?',
ARRAY['Trusting the LLM to enforce security rules.','Applying permissions after retrieval instead of before generation.','Logging sensitive prompts and outputs carelessly.','Ignoring tenant isolation and auditability.'],
'Strong Answer: I would implement authentication, authorization, tenant isolation, encrypted transport and storage, secret management, and permission-aware retrieval or tool access. I would treat prompts and retrieved data as untrusted inputs, add prompt-injection defenses, prevent cross-tenant leakage, and log sensitive events without storing unnecessary PII. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design assumes the model is not a security boundary. I would enforce permissions outside the LLM, filter retrieval by user entitlement before generation, scope tool tokens to the minimum required action, and add policy checks before any data exposure or write operation. I would define data retention, audit logs, redaction, DLP checks, incident response, vendor data-processing constraints, and customer-specific compliance needs. I would also red-team prompt injection, indirect injection from documents, malicious tool outputs, and privilege escalation paths. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

-- Observability and Production Operations (Q61–70)

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd211', 'system-design', 'What dashboards would you build for a production GenAI assistant?', 'medium',
'What dashboards would you build for a production GenAI assistant?

What the Interviewer Is Testing
The interviewer is testing whether you can run GenAI systems in production by instrumenting traces, metrics, logs, evaluations, alerts, and customer-facing incident processes. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics belong on a GenAI production dashboard?
- How would you debug a hallucination report?
- How would you avoid logging sensitive data?
- What SLOs would you define?
- What would be your phase-one delivery plan?',
ARRAY['Only tracking infrastructure metrics.','Not recording model, prompt, and retrieval versions.','Logging raw sensitive prompts without controls.','Failing to connect technical metrics to customer impact.'],
'Strong Answer: I would instrument each stage of the request: user input, retrieval, reranking, prompt construction, model call, tool call, response validation, and final response. I would track latency, cost, token usage, error rate, retrieval hit rate, low-confidence answers, refusal rate, hallucination reports, and user feedback. Alerts should distinguish infrastructure issues from quality regressions. Scenario-specific implementation detail: I would build dashboards that connect engineering signals to user impact: quality, retrieval, latency, cost, errors, feedback, escalation, and adoption. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer creates observability for both engineering and customer trust. I would use request-level traces with correlation IDs, structured logs with redaction, model and prompt versions, retrieval metadata, tool-call outcomes, eval scores, and user-impact metrics. Dashboards should support triage: is the problem data, retrieval, prompt, model, tool, permission, latency, cost, or customer workflow mismatch? I would define SLOs, alert thresholds, incident playbooks, customer communication templates, and post-incident regression tests. Senior execution detail: I would make dashboards actionable by showing stage-level traces and version changes so teams can distinguish data, retrieval, prompt, model, tool, and workflow failures. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd212', 'system-design', 'How would you debug a customer report that the assistant gave a hallucinated answer?', 'medium',
'How would you debug a customer report that the assistant gave a hallucinated answer?

What the Interviewer Is Testing
The interviewer is testing whether you can run GenAI systems in production by instrumenting traces, metrics, logs, evaluations, alerts, and customer-facing incident processes. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics belong on a GenAI production dashboard?
- How would you debug a hallucination report?
- How would you avoid logging sensitive data?
- What SLOs would you define?
- What would be your phase-one delivery plan?',
ARRAY['Only tracking infrastructure metrics.','Not recording model, prompt, and retrieval versions.','Logging raw sensitive prompts without controls.','Failing to connect technical metrics to customer impact.'],
'Strong Answer: I would instrument each stage of the request: user input, retrieval, reranking, prompt construction, model call, tool call, response validation, and final response. I would track latency, cost, token usage, error rate, retrieval hit rate, low-confidence answers, refusal rate, hallucination reports, and user feedback. Alerts should distinguish infrastructure issues from quality regressions. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer creates observability for both engineering and customer trust. I would use request-level traces with correlation IDs, structured logs with redaction, model and prompt versions, retrieval metadata, tool-call outcomes, eval scores, and user-impact metrics. Dashboards should support triage: is the problem data, retrieval, prompt, model, tool, permission, latency, cost, or customer workflow mismatch? I would define SLOs, alert thresholds, incident playbooks, customer communication templates, and post-incident regression tests. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd213', 'system-design', 'How would you instrument traces across retrieval, prompt construction, model calls, and tools?', 'medium',
'How would you instrument traces across retrieval, prompt construction, model calls, and tools?

What the Interviewer Is Testing
The interviewer is testing whether you can run GenAI systems in production by instrumenting traces, metrics, logs, evaluations, alerts, and customer-facing incident processes. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics belong on a GenAI production dashboard?
- How would you debug a hallucination report?
- How would you avoid logging sensitive data?
- What SLOs would you define?
- What would be your phase-one delivery plan?',
ARRAY['Only tracking infrastructure metrics.','Not recording model, prompt, and retrieval versions.','Logging raw sensitive prompts without controls.','Failing to connect technical metrics to customer impact.'],
'Strong Answer: I would instrument each stage of the request: user input, retrieval, reranking, prompt construction, model call, tool call, response validation, and final response. I would track latency, cost, token usage, error rate, retrieval hit rate, low-confidence answers, refusal rate, hallucination reports, and user feedback. Alerts should distinguish infrastructure issues from quality regressions. Scenario-specific implementation detail: I would build dashboards that connect engineering signals to user impact: quality, retrieval, latency, cost, errors, feedback, escalation, and adoption. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer creates observability for both engineering and customer trust. I would use request-level traces with correlation IDs, structured logs with redaction, model and prompt versions, retrieval metadata, tool-call outcomes, eval scores, and user-impact metrics. Dashboards should support triage: is the problem data, retrieval, prompt, model, tool, permission, latency, cost, or customer workflow mismatch? I would define SLOs, alert thresholds, incident playbooks, customer communication templates, and post-incident regression tests. Senior execution detail: I would make dashboards actionable by showing stage-level traces and version changes so teams can distinguish data, retrieval, prompt, model, tool, and workflow failures. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd214', 'system-design', 'A customer complains that quality dropped after a release. How do you investigate?', 'medium',
'A customer complains that quality dropped after a release. How do you investigate?

What the Interviewer Is Testing
The interviewer is testing whether you can run GenAI systems in production by instrumenting traces, metrics, logs, evaluations, alerts, and customer-facing incident processes. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics belong on a GenAI production dashboard?
- How would you debug a hallucination report?
- How would you avoid logging sensitive data?
- What SLOs would you define?
- What would be your phase-one delivery plan?',
ARRAY['Only tracking infrastructure metrics.','Not recording model, prompt, and retrieval versions.','Logging raw sensitive prompts without controls.','Failing to connect technical metrics to customer impact.'],
'Strong Answer: I would instrument each stage of the request: user input, retrieval, reranking, prompt construction, model call, tool call, response validation, and final response. I would track latency, cost, token usage, error rate, retrieval hit rate, low-confidence answers, refusal rate, hallucination reports, and user feedback. Alerts should distinguish infrastructure issues from quality regressions. Scenario-specific implementation detail: I would separate answer correctness, retrieval relevance, grounding, refusal correctness, and user usefulness instead of treating quality as one vague metric. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer creates observability for both engineering and customer trust. I would use request-level traces with correlation IDs, structured logs with redaction, model and prompt versions, retrieval metadata, tool-call outcomes, eval scores, and user-impact metrics. Dashboards should support triage: is the problem data, retrieval, prompt, model, tool, permission, latency, cost, or customer workflow mismatch? I would define SLOs, alert thresholds, incident playbooks, customer communication templates, and post-incident regression tests. Senior execution detail: I would build a regression suite from real failures and require new releases to pass quality gates by scenario, customer segment, and risk tier. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd215', 'system-design', 'How would you monitor cost, latency, and quality together?', 'medium',
'How would you monitor cost, latency, and quality together?

What the Interviewer Is Testing
The interviewer is testing whether you can run GenAI systems in production by instrumenting traces, metrics, logs, evaluations, alerts, and customer-facing incident processes. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics belong on a GenAI production dashboard?
- How would you debug a hallucination report?
- How would you avoid logging sensitive data?
- What SLOs would you define?
- What would be your phase-one delivery plan?',
ARRAY['Only tracking infrastructure metrics.','Not recording model, prompt, and retrieval versions.','Logging raw sensitive prompts without controls.','Failing to connect technical metrics to customer impact.'],
'Strong Answer: I would instrument each stage of the request: user input, retrieval, reranking, prompt construction, model call, tool call, response validation, and final response. I would track latency, cost, token usage, error rate, retrieval hit rate, low-confidence answers, refusal rate, hallucination reports, and user feedback. Alerts should distinguish infrastructure issues from quality regressions. Scenario-specific implementation detail: I would break down p50/p95 latency by retrieval, reranking, model call, tool calls, network, and post-processing, then optimize the largest contributor first. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer creates observability for both engineering and customer trust. I would use request-level traces with correlation IDs, structured logs with redaction, model and prompt versions, retrieval metadata, tool-call outcomes, eval scores, and user-impact metrics. Dashboards should support triage: is the problem data, retrieval, prompt, model, tool, permission, latency, cost, or customer workflow mismatch? I would define SLOs, alert thresholds, incident playbooks, customer communication templates, and post-incident regression tests. Senior execution detail: I would use streaming only as UX relief, not as a substitute for reducing critical-path work, and define workflow-specific SLOs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd216', 'system-design', 'How would you design alerting for a GenAI system without creating noise?', 'medium',
'How would you design alerting for a GenAI system without creating noise?

What the Interviewer Is Testing
The interviewer is testing whether you can run GenAI systems in production by instrumenting traces, metrics, logs, evaluations, alerts, and customer-facing incident processes. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics belong on a GenAI production dashboard?
- How would you debug a hallucination report?
- How would you avoid logging sensitive data?
- What SLOs would you define?
- What would be your phase-one delivery plan?',
ARRAY['Only tracking infrastructure metrics.','Not recording model, prompt, and retrieval versions.','Logging raw sensitive prompts without controls.','Failing to connect technical metrics to customer impact.'],
'Strong Answer: I would instrument each stage of the request: user input, retrieval, reranking, prompt construction, model call, tool call, response validation, and final response. I would track latency, cost, token usage, error rate, retrieval hit rate, low-confidence answers, refusal rate, hallucination reports, and user feedback. Alerts should distinguish infrastructure issues from quality regressions. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer creates observability for both engineering and customer trust. I would use request-level traces with correlation IDs, structured logs with redaction, model and prompt versions, retrieval metadata, tool-call outcomes, eval scores, and user-impact metrics. Dashboards should support triage: is the problem data, retrieval, prompt, model, tool, permission, latency, cost, or customer workflow mismatch? I would define SLOs, alert thresholds, incident playbooks, customer communication templates, and post-incident regression tests. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd217', 'system-design', 'What logs should be captured and what should be redacted?', 'medium',
'What logs should be captured and what should be redacted?

What the Interviewer Is Testing
The interviewer is testing whether you can run GenAI systems in production by instrumenting traces, metrics, logs, evaluations, alerts, and customer-facing incident processes. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics belong on a GenAI production dashboard?
- How would you debug a hallucination report?
- How would you avoid logging sensitive data?
- What SLOs would you define?
- What would be your phase-one delivery plan?',
ARRAY['Only tracking infrastructure metrics.','Not recording model, prompt, and retrieval versions.','Logging raw sensitive prompts without controls.','Failing to connect technical metrics to customer impact.'],
'Strong Answer: I would instrument each stage of the request: user input, retrieval, reranking, prompt construction, model call, tool call, response validation, and final response. I would track latency, cost, token usage, error rate, retrieval hit rate, low-confidence answers, refusal rate, hallucination reports, and user feedback. Alerts should distinguish infrastructure issues from quality regressions. Scenario-specific implementation detail: I would capture correlation IDs, user context, permission decisions, retrieved source IDs, prompt/model versions, tool calls, and final decision metadata. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer creates observability for both engineering and customer trust. I would use request-level traces with correlation IDs, structured logs with redaction, model and prompt versions, retrieval metadata, tool-call outcomes, eval scores, and user-impact metrics. Dashboards should support triage: is the problem data, retrieval, prompt, model, tool, permission, latency, cost, or customer workflow mismatch? I would define SLOs, alert thresholds, incident playbooks, customer communication templates, and post-incident regression tests. Senior execution detail: I would avoid storing raw sensitive content unless necessary, implement retention controls, and make audit trails usable for compliance and incident review. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd218', 'system-design', 'How would you build a production support playbook for a GenAI pilot?', 'medium',
'How would you build a production support playbook for a GenAI pilot?

What the Interviewer Is Testing
The interviewer is testing whether you can run GenAI systems in production by instrumenting traces, metrics, logs, evaluations, alerts, and customer-facing incident processes. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics belong on a GenAI production dashboard?
- How would you debug a hallucination report?
- How would you avoid logging sensitive data?
- What SLOs would you define?
- What would be your phase-one delivery plan?',
ARRAY['Only tracking infrastructure metrics.','Not recording model, prompt, and retrieval versions.','Logging raw sensitive prompts without controls.','Failing to connect technical metrics to customer impact.'],
'Strong Answer: I would instrument each stage of the request: user input, retrieval, reranking, prompt construction, model call, tool call, response validation, and final response. I would track latency, cost, token usage, error rate, retrieval hit rate, low-confidence answers, refusal rate, hallucination reports, and user feedback. Alerts should distinguish infrastructure issues from quality regressions. Scenario-specific implementation detail: I would begin with agent-assist mode: classify the ticket, retrieve relevant knowledge, draft a reply, and escalate when confidence, policy, or sentiment thresholds require human review. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer creates observability for both engineering and customer trust. I would use request-level traces with correlation IDs, structured logs with redaction, model and prompt versions, retrieval metadata, tool-call outcomes, eval scores, and user-impact metrics. Dashboards should support triage: is the problem data, retrieval, prompt, model, tool, permission, latency, cost, or customer workflow mismatch? I would define SLOs, alert thresholds, incident playbooks, customer communication templates, and post-incident regression tests. Senior execution detail: I would measure resolution time, deflection without quality loss, escalation correctness, customer-satisfaction impact, and incidents caused by incorrect automation. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd219', 'system-design', 'How would you use user feedback signals in monitoring without overreacting to noisy feedback?', 'medium',
'How would you use user feedback signals in monitoring without overreacting to noisy feedback?

What the Interviewer Is Testing
The interviewer is testing whether you can run GenAI systems in production by instrumenting traces, metrics, logs, evaluations, alerts, and customer-facing incident processes. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics belong on a GenAI production dashboard?
- How would you debug a hallucination report?
- How would you avoid logging sensitive data?
- What SLOs would you define?
- What would be your phase-one delivery plan?',
ARRAY['Only tracking infrastructure metrics.','Not recording model, prompt, and retrieval versions.','Logging raw sensitive prompts without controls.','Failing to connect technical metrics to customer impact.'],
'Strong Answer: I would instrument each stage of the request: user input, retrieval, reranking, prompt construction, model call, tool call, response validation, and final response. I would track latency, cost, token usage, error rate, retrieval hit rate, low-confidence answers, refusal rate, hallucination reports, and user feedback. Alerts should distinguish infrastructure issues from quality regressions. Scenario-specific implementation detail: I would build dashboards that connect engineering signals to user impact: quality, retrieval, latency, cost, errors, feedback, escalation, and adoption. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer creates observability for both engineering and customer trust. I would use request-level traces with correlation IDs, structured logs with redaction, model and prompt versions, retrieval metadata, tool-call outcomes, eval scores, and user-impact metrics. Dashboards should support triage: is the problem data, retrieval, prompt, model, tool, permission, latency, cost, or customer workflow mismatch? I would define SLOs, alert thresholds, incident playbooks, customer communication templates, and post-incident regression tests. Senior execution detail: I would make dashboards actionable by showing stage-level traces and version changes so teams can distinguish data, retrieval, prompt, model, tool, and workflow failures. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd220', 'system-design', 'How would you report reliability and quality to customer executives?', 'medium',
'How would you report reliability and quality to customer executives?

What the Interviewer Is Testing
The interviewer is testing whether you can run GenAI systems in production by instrumenting traces, metrics, logs, evaluations, alerts, and customer-facing incident processes. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics belong on a GenAI production dashboard?
- How would you debug a hallucination report?
- How would you avoid logging sensitive data?
- What SLOs would you define?
- What would be your phase-one delivery plan?',
ARRAY['Only tracking infrastructure metrics.','Not recording model, prompt, and retrieval versions.','Logging raw sensitive prompts without controls.','Failing to connect technical metrics to customer impact.'],
'Strong Answer: I would instrument each stage of the request: user input, retrieval, reranking, prompt construction, model call, tool call, response validation, and final response. I would track latency, cost, token usage, error rate, retrieval hit rate, low-confidence answers, refusal rate, hallucination reports, and user feedback. Alerts should distinguish infrastructure issues from quality regressions. Scenario-specific implementation detail: I would separate answer correctness, retrieval relevance, grounding, refusal correctness, and user usefulness instead of treating quality as one vague metric. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer creates observability for both engineering and customer trust. I would use request-level traces with correlation IDs, structured logs with redaction, model and prompt versions, retrieval metadata, tool-call outcomes, eval scores, and user-impact metrics. Dashboards should support triage: is the problem data, retrieval, prompt, model, tool, permission, latency, cost, or customer workflow mismatch? I would define SLOs, alert thresholds, incident playbooks, customer communication templates, and post-incident regression tests. Senior execution detail: I would build a regression suite from real failures and require new releases to pass quality gates by scenario, customer segment, and risk tier. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

-- Latency, Cost, and Scalability (Q71–80)

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd221', 'system-design', 'A GenAI assistant has p95 latency of 18 seconds. How would you reduce it?', 'medium',
'A GenAI assistant has p95 latency of 18 seconds. How would you reduce it?

What the Interviewer Is Testing
The interviewer is testing whether you can make GenAI systems usable and economically viable through token budgeting, caching, routing, streaming, batching, concurrency control, and SLO-driven design. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you reduce p95 latency?
- How would you control model cost per customer?
- When would you use caching?
- How would you design graceful degradation?
- Which optimization would you try first and why?',
ARRAY['Optimizing the model before measuring the whole workflow.','Ignoring p95/p99 latency and only quoting averages.','Letting agents run unbounded loops.','Failing to connect cost to customer value.'],
'Strong Answer: I would define latency and cost budgets per workflow, then inspect the critical path: retrieval, reranking, tool calls, model latency, output length, and post-processing. Optimization options include prompt compression, context pruning, caching, streaming, smaller-model routing, asynchronous steps, batching, and avoiding unnecessary agent loops. Scenario-specific implementation detail: I would break down p50/p95 latency by retrieval, reranking, model call, tool calls, network, and post-processing, then optimize the largest contributor first. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer optimizes around business value, not just milliseconds. I would classify requests by risk, complexity, and urgency, then route them to the cheapest reliable path: deterministic logic, retrieval-only answer, smaller model, larger model, or human review. I would track cost per successful task, latency percentiles, token usage by customer and feature, cache hit rates, and agent loop counts. I would also set guardrails such as max tokens, tool-call limits, timeout budgets, graceful degradation, and customer-specific quotas. Senior execution detail: I would use streaming only as UX relief, not as a substitute for reducing critical-path work, and define workflow-specific SLOs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd222', 'system-design', 'A customer is worried about unpredictable LLM cost. How would you control it?', 'medium',
'A customer is worried about unpredictable LLM cost. How would you control it?

What the Interviewer Is Testing
The interviewer is testing whether you can make GenAI systems usable and economically viable through token budgeting, caching, routing, streaming, batching, concurrency control, and SLO-driven design. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you reduce p95 latency?
- How would you control model cost per customer?
- When would you use caching?
- How would you design graceful degradation?
- Which optimization would you try first and why?',
ARRAY['Optimizing the model before measuring the whole workflow.','Ignoring p95/p99 latency and only quoting averages.','Letting agents run unbounded loops.','Failing to connect cost to customer value.'],
'Strong Answer: I would define latency and cost budgets per workflow, then inspect the critical path: retrieval, reranking, tool calls, model latency, output length, and post-processing. Optimization options include prompt compression, context pruning, caching, streaming, smaller-model routing, asynchronous steps, batching, and avoiding unnecessary agent loops. Scenario-specific implementation detail: I would calculate cost per successful task and segment traffic by complexity, then use model routing, caching, context pruning, and deterministic shortcuts. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer optimizes around business value, not just milliseconds. I would classify requests by risk, complexity, and urgency, then route them to the cheapest reliable path: deterministic logic, retrieval-only answer, smaller model, larger model, or human review. I would track cost per successful task, latency percentiles, token usage by customer and feature, cache hit rates, and agent loop counts. I would also set guardrails such as max tokens, tool-call limits, timeout budgets, graceful degradation, and customer-specific quotas. Senior execution detail: I would enforce customer budgets, alert on cost anomalies, and avoid cheap-model routing for high-risk tasks where rework or wrong answers cost more than inference. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd223', 'system-design', 'How would you design model routing between small and large models?', 'medium',
'How would you design model routing between small and large models?

What the Interviewer Is Testing
The interviewer is testing whether you can make GenAI systems usable and economically viable through token budgeting, caching, routing, streaming, batching, concurrency control, and SLO-driven design. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you reduce p95 latency?
- How would you control model cost per customer?
- When would you use caching?
- How would you design graceful degradation?
- Which optimization would you try first and why?',
ARRAY['Optimizing the model before measuring the whole workflow.','Ignoring p95/p99 latency and only quoting averages.','Letting agents run unbounded loops.','Failing to connect cost to customer value.'],
'Strong Answer: I would define latency and cost budgets per workflow, then inspect the critical path: retrieval, reranking, tool calls, model latency, output length, and post-processing. Optimization options include prompt compression, context pruning, caching, streaming, smaller-model routing, asynchronous steps, batching, and avoiding unnecessary agent loops. Scenario-specific implementation detail: I would centralize provider abstraction, prompt/model versioning, policy checks, retries, timeouts, cost tracking, and routing rules in a model gateway. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer optimizes around business value, not just milliseconds. I would classify requests by risk, complexity, and urgency, then route them to the cheapest reliable path: deterministic logic, retrieval-only answer, smaller model, larger model, or human review. I would track cost per successful task, latency percentiles, token usage by customer and feature, cache hit rates, and agent loop counts. I would also set guardrails such as max tokens, tool-call limits, timeout budgets, graceful degradation, and customer-specific quotas. Senior execution detail: I would ensure teams cannot bypass safety controls and would make model changes observable and reversible. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd224', 'system-design', 'How would you use caching safely in a permission-sensitive enterprise assistant?', 'medium',
'How would you use caching safely in a permission-sensitive enterprise assistant?

What the Interviewer Is Testing
The interviewer is testing whether you can make GenAI systems usable and economically viable through token budgeting, caching, routing, streaming, batching, concurrency control, and SLO-driven design. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you reduce p95 latency?
- How would you control model cost per customer?
- When would you use caching?
- How would you design graceful degradation?
- Which optimization would you try first and why?',
ARRAY['Optimizing the model before measuring the whole workflow.','Ignoring p95/p99 latency and only quoting averages.','Letting agents run unbounded loops.','Failing to connect cost to customer value.'],
'Strong Answer: I would define latency and cost budgets per workflow, then inspect the critical path: retrieval, reranking, tool calls, model latency, output length, and post-processing. Optimization options include prompt compression, context pruning, caching, streaming, smaller-model routing, asynchronous steps, batching, and avoiding unnecessary agent loops. Scenario-specific implementation detail: I would model invoice exception handling as a state machine: classify exception, gather evidence, propose resolution, request approval, execute ERP update, and record audit evidence. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer optimizes around business value, not just milliseconds. I would classify requests by risk, complexity, and urgency, then route them to the cheapest reliable path: deterministic logic, retrieval-only answer, smaller model, larger model, or human review. I would track cost per successful task, latency percentiles, token usage by customer and feature, cache hit rates, and agent loop counts. I would also set guardrails such as max tokens, tool-call limits, timeout budgets, graceful degradation, and customer-specific quotas. Senior execution detail: I would protect against duplicate payments, wrong vendor updates, missing approval, partial ERP failures, and unclear financial accountability. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd225', 'system-design', 'How would you optimize token usage without harming answer quality?', 'medium',
'How would you optimize token usage without harming answer quality?

What the Interviewer Is Testing
The interviewer is testing whether you can make GenAI systems usable and economically viable through token budgeting, caching, routing, streaming, batching, concurrency control, and SLO-driven design. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you reduce p95 latency?
- How would you control model cost per customer?
- When would you use caching?
- How would you design graceful degradation?
- Which optimization would you try first and why?',
ARRAY['Optimizing the model before measuring the whole workflow.','Ignoring p95/p99 latency and only quoting averages.','Letting agents run unbounded loops.','Failing to connect cost to customer value.'],
'Strong Answer: I would define latency and cost budgets per workflow, then inspect the critical path: retrieval, reranking, tool calls, model latency, output length, and post-processing. Optimization options include prompt compression, context pruning, caching, streaming, smaller-model routing, asynchronous steps, batching, and avoiding unnecessary agent loops. Scenario-specific implementation detail: I would separate answer correctness, retrieval relevance, grounding, refusal correctness, and user usefulness instead of treating quality as one vague metric. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer optimizes around business value, not just milliseconds. I would classify requests by risk, complexity, and urgency, then route them to the cheapest reliable path: deterministic logic, retrieval-only answer, smaller model, larger model, or human review. I would track cost per successful task, latency percentiles, token usage by customer and feature, cache hit rates, and agent loop counts. I would also set guardrails such as max tokens, tool-call limits, timeout budgets, graceful degradation, and customer-specific quotas. Senior execution detail: I would build a regression suite from real failures and require new releases to pass quality gates by scenario, customer segment, and risk tier. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd226', 'system-design', 'An agentic workflow costs too much because of repeated tool and model calls. What do you do?', 'medium',
'An agentic workflow costs too much because of repeated tool and model calls. What do you do?

What the Interviewer Is Testing
The interviewer is testing whether you can make GenAI systems usable and economically viable through token budgeting, caching, routing, streaming, batching, concurrency control, and SLO-driven design. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you reduce p95 latency?
- How would you control model cost per customer?
- When would you use caching?
- How would you design graceful degradation?
- Which optimization would you try first and why?',
ARRAY['Optimizing the model before measuring the whole workflow.','Ignoring p95/p99 latency and only quoting averages.','Letting agents run unbounded loops.','Failing to connect cost to customer value.'],
'Strong Answer: I would define latency and cost budgets per workflow, then inspect the critical path: retrieval, reranking, tool calls, model latency, output length, and post-processing. Optimization options include prompt compression, context pruning, caching, streaming, smaller-model routing, asynchronous steps, batching, and avoiding unnecessary agent loops. Scenario-specific implementation detail: I would add explicit step limits, loop detection, tool-call budgets, failure-state transitions, and deterministic stop conditions. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer optimizes around business value, not just milliseconds. I would classify requests by risk, complexity, and urgency, then route them to the cheapest reliable path: deterministic logic, retrieval-only answer, smaller model, larger model, or human review. I would track cost per successful task, latency percentiles, token usage by customer and feature, cache hit rates, and agent loop counts. I would also set guardrails such as max tokens, tool-call limits, timeout budgets, graceful degradation, and customer-specific quotas. Senior execution detail: I would analyze traces to see whether loops come from bad planning, bad tool feedback, missing state, or unclear success criteria, then add regression tests for those cases. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd227', 'system-design', 'How would you design graceful degradation when the LLM provider is slow or unavailable?', 'medium',
'How would you design graceful degradation when the LLM provider is slow or unavailable?

What the Interviewer Is Testing
The interviewer is testing whether you can make GenAI systems usable and economically viable through token budgeting, caching, routing, streaming, batching, concurrency control, and SLO-driven design. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you reduce p95 latency?
- How would you control model cost per customer?
- When would you use caching?
- How would you design graceful degradation?
- Which optimization would you try first and why?',
ARRAY['Optimizing the model before measuring the whole workflow.','Ignoring p95/p99 latency and only quoting averages.','Letting agents run unbounded loops.','Failing to connect cost to customer value.'],
'Strong Answer: I would define latency and cost budgets per workflow, then inspect the critical path: retrieval, reranking, tool calls, model latency, output length, and post-processing. Optimization options include prompt compression, context pruning, caching, streaming, smaller-model routing, asynchronous steps, batching, and avoiding unnecessary agent loops. Scenario-specific implementation detail: I would define fallback modes such as cached answers, retrieval-only summaries, async completion, smaller model routing, or human escalation depending on task risk. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer optimizes around business value, not just milliseconds. I would classify requests by risk, complexity, and urgency, then route them to the cheapest reliable path: deterministic logic, retrieval-only answer, smaller model, larger model, or human review. I would track cost per successful task, latency percentiles, token usage by customer and feature, cache hit rates, and agent loop counts. I would also set guardrails such as max tokens, tool-call limits, timeout budgets, graceful degradation, and customer-specific quotas. Senior execution detail: I would make degradation visible to users, log the mode used, and avoid silently returning lower-quality answers as if nothing changed. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd228', 'system-design', 'How would you scale a RAG system for thousands of concurrent users?', 'medium',
'How would you scale a RAG system for thousands of concurrent users?

What the Interviewer Is Testing
The interviewer is testing whether you can make GenAI systems usable and economically viable through token budgeting, caching, routing, streaming, batching, concurrency control, and SLO-driven design. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you reduce p95 latency?
- How would you control model cost per customer?
- When would you use caching?
- How would you design graceful degradation?
- Which optimization would you try first and why?',
ARRAY['Optimizing the model before measuring the whole workflow.','Ignoring p95/p99 latency and only quoting averages.','Letting agents run unbounded loops.','Failing to connect cost to customer value.'],
'Strong Answer: I would define latency and cost budgets per workflow, then inspect the critical path: retrieval, reranking, tool calls, model latency, output length, and post-processing. Optimization options include prompt compression, context pruning, caching, streaming, smaller-model routing, asynchronous steps, batching, and avoiding unnecessary agent loops. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer optimizes around business value, not just milliseconds. I would classify requests by risk, complexity, and urgency, then route them to the cheapest reliable path: deterministic logic, retrieval-only answer, smaller model, larger model, or human review. I would track cost per successful task, latency percentiles, token usage by customer and feature, cache hit rates, and agent loop counts. I would also set guardrails such as max tokens, tool-call limits, timeout budgets, graceful degradation, and customer-specific quotas. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd229', 'system-design', 'How would you set customer-specific quotas and budgets for GenAI usage?', 'medium',
'How would you set customer-specific quotas and budgets for GenAI usage?

What the Interviewer Is Testing
The interviewer is testing whether you can make GenAI systems usable and economically viable through token budgeting, caching, routing, streaming, batching, concurrency control, and SLO-driven design. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you reduce p95 latency?
- How would you control model cost per customer?
- When would you use caching?
- How would you design graceful degradation?
- Which optimization would you try first and why?',
ARRAY['Optimizing the model before measuring the whole workflow.','Ignoring p95/p99 latency and only quoting averages.','Letting agents run unbounded loops.','Failing to connect cost to customer value.'],
'Strong Answer: I would define latency and cost budgets per workflow, then inspect the critical path: retrieval, reranking, tool calls, model latency, output length, and post-processing. Optimization options include prompt compression, context pruning, caching, streaming, smaller-model routing, asynchronous steps, batching, and avoiding unnecessary agent loops. Scenario-specific implementation detail: I would calculate cost per successful task and segment traffic by complexity, then use model routing, caching, context pruning, and deterministic shortcuts. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer optimizes around business value, not just milliseconds. I would classify requests by risk, complexity, and urgency, then route them to the cheapest reliable path: deterministic logic, retrieval-only answer, smaller model, larger model, or human review. I would track cost per successful task, latency percentiles, token usage by customer and feature, cache hit rates, and agent loop counts. I would also set guardrails such as max tokens, tool-call limits, timeout budgets, graceful degradation, and customer-specific quotas. Senior execution detail: I would enforce customer budgets, alert on cost anomalies, and avoid cheap-model routing for high-risk tasks where rework or wrong answers cost more than inference. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('sd230', 'system-design', 'How would you design streaming responses without hiding slow backend work?', 'medium',
'How would you design streaming responses without hiding slow backend work?

What the Interviewer Is Testing
The interviewer is testing whether you can make GenAI systems usable and economically viable through token budgeting, caching, routing, streaming, batching, concurrency control, and SLO-driven design. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you reduce p95 latency?
- How would you control model cost per customer?
- When would you use caching?
- How would you design graceful degradation?
- Which optimization would you try first and why?',
ARRAY['Optimizing the model before measuring the whole workflow.','Ignoring p95/p99 latency and only quoting averages.','Letting agents run unbounded loops.','Failing to connect cost to customer value.'],
'Strong Answer: I would define latency and cost budgets per workflow, then inspect the critical path: retrieval, reranking, tool calls, model latency, output length, and post-processing. Optimization options include prompt compression, context pruning, caching, streaming, smaller-model routing, asynchronous steps, batching, and avoiding unnecessary agent loops. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer optimizes around business value, not just milliseconds. I would classify requests by risk, complexity, and urgency, then route them to the cheapest reliable path: deterministic logic, retrieval-only answer, smaller model, larger model, or human review. I would track cost per successful task, latency percentiles, token usage by customer and feature, cache hit rates, and agent loop counts. I would also set guardrails such as max tokens, tool-call limits, timeout budgets, graceful degradation, and customer-specific quotas. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

-- Troubleshooting and Failure Modes (Q81–90)

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g301', 'genai-architecture', 'A RAG assistant returns an answer that is correct for the wrong reason. How would you diagnose it?', 'medium',
'A RAG assistant returns an answer that is correct for the wrong reason. How would you diagnose it?

What the Interviewer Is Testing
The interviewer is testing whether you can diagnose production GenAI failures systematically across data, retrieval, prompt, model, tool, permission, infrastructure, and user-expectation layers. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you debug a wrong but confident answer?
- How would you triage a tool-call failure?
- How would you separate model failure from retrieval failure?
- What regression test would you add?
- What evidence would you collect before changing prompts?',
ARRAY['Changing prompts without identifying root cause.','Ignoring retrieved evidence and tool traces.','Failing to create regression tests after incidents.','Communicating technical uncertainty poorly to the customer.'],
'Strong Answer: I would isolate the failure stage. For a bad answer, I would check whether the user had permission, whether retrieval returned relevant evidence, whether the prompt used the evidence correctly, whether the model hallucinated, and whether post-processing or citations failed. For tool failures, I would inspect arguments, authorization, idempotency, retries, and partial completion. Scenario-specific implementation detail: I would separate answer correctness, retrieval relevance, grounding, refusal correctness, and user usefulness instead of treating quality as one vague metric. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior troubleshooting approach uses evidence before changing the system. I would capture the exact request trace, prompt/model/retrieval versions, retrieved chunks, tool calls, latency, cost, user context, and expected behavior. Then I would classify the incident, assess customer impact, apply a safe mitigation, and create a regression test to prevent recurrence. I would communicate clearly: what failed, who was affected, what we changed, what risk remains, and how we will verify the fix. Senior execution detail: I would build a regression suite from real failures and require new releases to pass quality gates by scenario, customer segment, and risk tier. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g302', 'genai-architecture', 'A tool-using agent updates the wrong record. How would you investigate and prevent recurrence?', 'medium',
'A tool-using agent updates the wrong record. How would you investigate and prevent recurrence?

What the Interviewer Is Testing
The interviewer is testing whether you can diagnose production GenAI failures systematically across data, retrieval, prompt, model, tool, permission, infrastructure, and user-expectation layers. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you debug a wrong but confident answer?
- How would you triage a tool-call failure?
- How would you separate model failure from retrieval failure?
- What regression test would you add?
- What evidence would you collect before changing prompts?',
ARRAY['Changing prompts without identifying root cause.','Ignoring retrieved evidence and tool traces.','Failing to create regression tests after incidents.','Communicating technical uncertainty poorly to the customer.'],
'Strong Answer: I would isolate the failure stage. For a bad answer, I would check whether the user had permission, whether retrieval returned relevant evidence, whether the prompt used the evidence correctly, whether the model hallucinated, and whether post-processing or citations failed. For tool failures, I would inspect arguments, authorization, idempotency, retries, and partial completion. Scenario-specific implementation detail: I would restrict the agent to proposing structured field changes, validate the fields deterministically, and require user approval before write operations. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior troubleshooting approach uses evidence before changing the system. I would capture the exact request trace, prompt/model/retrieval versions, retrieved chunks, tool calls, latency, cost, user context, and expected behavior. Then I would classify the incident, assess customer impact, apply a safe mitigation, and create a regression test to prevent recurrence. I would communicate clearly: what failed, who was affected, what we changed, what risk remains, and how we will verify the fix. Senior execution detail: I would implement field-level permissions, audit trails, idempotency keys, and rollback for incorrect updates before expanding beyond draft mode. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g303', 'genai-architecture', 'A customer says the assistant refuses too many valid requests. How would you fix it?', 'medium',
'A customer says the assistant refuses too many valid requests. How would you fix it?

What the Interviewer Is Testing
The interviewer is testing whether you can diagnose production GenAI failures systematically across data, retrieval, prompt, model, tool, permission, infrastructure, and user-expectation layers. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you debug a wrong but confident answer?
- How would you triage a tool-call failure?
- How would you separate model failure from retrieval failure?
- What regression test would you add?
- What evidence would you collect before changing prompts?',
ARRAY['Changing prompts without identifying root cause.','Ignoring retrieved evidence and tool traces.','Failing to create regression tests after incidents.','Communicating technical uncertainty poorly to the customer.'],
'Strong Answer: I would isolate the failure stage. For a bad answer, I would check whether the user had permission, whether retrieval returned relevant evidence, whether the prompt used the evidence correctly, whether the model hallucinated, and whether post-processing or citations failed. For tool failures, I would inspect arguments, authorization, idempotency, retries, and partial completion. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior troubleshooting approach uses evidence before changing the system. I would capture the exact request trace, prompt/model/retrieval versions, retrieved chunks, tool calls, latency, cost, user context, and expected behavior. Then I would classify the incident, assess customer impact, apply a safe mitigation, and create a regression test to prevent recurrence. I would communicate clearly: what failed, who was affected, what we changed, what risk remains, and how we will verify the fix. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g304', 'genai-architecture', 'A new document ingestion pipeline causes worse answers. How do you debug it?', 'medium',
'A new document ingestion pipeline causes worse answers. How do you debug it?

What the Interviewer Is Testing
The interviewer is testing whether you can diagnose production GenAI failures systematically across data, retrieval, prompt, model, tool, permission, infrastructure, and user-expectation layers. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you debug a wrong but confident answer?
- How would you triage a tool-call failure?
- How would you separate model failure from retrieval failure?
- What regression test would you add?
- What evidence would you collect before changing prompts?',
ARRAY['Changing prompts without identifying root cause.','Ignoring retrieved evidence and tool traces.','Failing to create regression tests after incidents.','Communicating technical uncertainty poorly to the customer.'],
'Strong Answer: I would isolate the failure stage. For a bad answer, I would check whether the user had permission, whether retrieval returned relevant evidence, whether the prompt used the evidence correctly, whether the model hallucinated, and whether post-processing or citations failed. For tool failures, I would inspect arguments, authorization, idempotency, retries, and partial completion. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior troubleshooting approach uses evidence before changing the system. I would capture the exact request trace, prompt/model/retrieval versions, retrieved chunks, tool calls, latency, cost, user context, and expected behavior. Then I would classify the incident, assess customer impact, apply a safe mitigation, and create a regression test to prevent recurrence. I would communicate clearly: what failed, who was affected, what we changed, what risk remains, and how we will verify the fix. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g305', 'genai-architecture', 'A model starts producing longer but less useful answers. What do you inspect?', 'medium',
'A model starts producing longer but less useful answers. What do you inspect?

What the Interviewer Is Testing
The interviewer is testing whether you can diagnose production GenAI failures systematically across data, retrieval, prompt, model, tool, permission, infrastructure, and user-expectation layers. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you debug a wrong but confident answer?
- How would you triage a tool-call failure?
- How would you separate model failure from retrieval failure?
- What regression test would you add?
- What evidence would you collect before changing prompts?',
ARRAY['Changing prompts without identifying root cause.','Ignoring retrieved evidence and tool traces.','Failing to create regression tests after incidents.','Communicating technical uncertainty poorly to the customer.'],
'Strong Answer: I would isolate the failure stage. For a bad answer, I would check whether the user had permission, whether retrieval returned relevant evidence, whether the prompt used the evidence correctly, whether the model hallucinated, and whether post-processing or citations failed. For tool failures, I would inspect arguments, authorization, idempotency, retries, and partial completion. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior troubleshooting approach uses evidence before changing the system. I would capture the exact request trace, prompt/model/retrieval versions, retrieved chunks, tool calls, latency, cost, user context, and expected behavior. Then I would classify the incident, assess customer impact, apply a safe mitigation, and create a regression test to prevent recurrence. I would communicate clearly: what failed, who was affected, what we changed, what risk remains, and how we will verify the fix. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g306', 'genai-architecture', 'Users in one tenant see much worse retrieval than another tenant. How do you troubleshoot?', 'medium',
'Users in one tenant see much worse retrieval than another tenant. How do you troubleshoot?

What the Interviewer Is Testing
The interviewer is testing whether you can diagnose production GenAI failures systematically across data, retrieval, prompt, model, tool, permission, infrastructure, and user-expectation layers. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you debug a wrong but confident answer?
- How would you triage a tool-call failure?
- How would you separate model failure from retrieval failure?
- What regression test would you add?
- What evidence would you collect before changing prompts?',
ARRAY['Changing prompts without identifying root cause.','Ignoring retrieved evidence and tool traces.','Failing to create regression tests after incidents.','Communicating technical uncertainty poorly to the customer.'],
'Strong Answer: I would isolate the failure stage. For a bad answer, I would check whether the user had permission, whether retrieval returned relevant evidence, whether the prompt used the evidence correctly, whether the model hallucinated, and whether post-processing or citations failed. For tool failures, I would inspect arguments, authorization, idempotency, retries, and partial completion. Scenario-specific implementation detail: I would enforce access control and policy outside the model, minimize sensitive data in prompts, redact logs, and treat retrieved content and tool outputs as untrusted. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior troubleshooting approach uses evidence before changing the system. I would capture the exact request trace, prompt/model/retrieval versions, retrieved chunks, tool calls, latency, cost, user context, and expected behavior. Then I would classify the incident, assess customer impact, apply a safe mitigation, and create a regression test to prevent recurrence. I would communicate clearly: what failed, who was affected, what we changed, what risk remains, and how we will verify the fix. Senior execution detail: I would prepare threat models for data leakage, indirect prompt injection, privilege escalation, overbroad tool tokens, and cross-tenant retrieval mistakes. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g307', 'genai-architecture', 'A prompt-injection test succeeds against your RAG assistant. What is your incident response?', 'medium',
'A prompt-injection test succeeds against your RAG assistant. What is your incident response?

What the Interviewer Is Testing
The interviewer is testing whether you can diagnose production GenAI failures systematically across data, retrieval, prompt, model, tool, permission, infrastructure, and user-expectation layers. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you debug a wrong but confident answer?
- How would you triage a tool-call failure?
- How would you separate model failure from retrieval failure?
- What regression test would you add?
- What evidence would you collect before changing prompts?',
ARRAY['Changing prompts without identifying root cause.','Ignoring retrieved evidence and tool traces.','Failing to create regression tests after incidents.','Communicating technical uncertainty poorly to the customer.'],
'Strong Answer: I would isolate the failure stage. For a bad answer, I would check whether the user had permission, whether retrieval returned relevant evidence, whether the prompt used the evidence correctly, whether the model hallucinated, and whether post-processing or citations failed. For tool failures, I would inspect arguments, authorization, idempotency, retries, and partial completion. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior troubleshooting approach uses evidence before changing the system. I would capture the exact request trace, prompt/model/retrieval versions, retrieved chunks, tool calls, latency, cost, user context, and expected behavior. Then I would classify the incident, assess customer impact, apply a safe mitigation, and create a regression test to prevent recurrence. I would communicate clearly: what failed, who was affected, what we changed, what risk remains, and how we will verify the fix. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g308', 'genai-architecture', 'An AI workflow silently fails halfway through a multi-step process. How do you design detection?', 'medium',
'An AI workflow silently fails halfway through a multi-step process. How do you design detection?

What the Interviewer Is Testing
The interviewer is testing whether you can diagnose production GenAI failures systematically across data, retrieval, prompt, model, tool, permission, infrastructure, and user-expectation layers. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you debug a wrong but confident answer?
- How would you triage a tool-call failure?
- How would you separate model failure from retrieval failure?
- What regression test would you add?
- What evidence would you collect before changing prompts?',
ARRAY['Changing prompts without identifying root cause.','Ignoring retrieved evidence and tool traces.','Failing to create regression tests after incidents.','Communicating technical uncertainty poorly to the customer.'],
'Strong Answer: I would isolate the failure stage. For a bad answer, I would check whether the user had permission, whether retrieval returned relevant evidence, whether the prompt used the evidence correctly, whether the model hallucinated, and whether post-processing or citations failed. For tool failures, I would inspect arguments, authorization, idempotency, retries, and partial completion. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior troubleshooting approach uses evidence before changing the system. I would capture the exact request trace, prompt/model/retrieval versions, retrieved chunks, tool calls, latency, cost, user context, and expected behavior. Then I would classify the incident, assess customer impact, apply a safe mitigation, and create a regression test to prevent recurrence. I would communicate clearly: what failed, who was affected, what we changed, what risk remains, and how we will verify the fix. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g309', 'genai-architecture', 'A customer pilot has low adoption despite good technical metrics. How do you diagnose the issue?', 'medium',
'A customer pilot has low adoption despite good technical metrics. How do you diagnose the issue?

What the Interviewer Is Testing
The interviewer is testing whether you can diagnose production GenAI failures systematically across data, retrieval, prompt, model, tool, permission, infrastructure, and user-expectation layers. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you debug a wrong but confident answer?
- How would you triage a tool-call failure?
- How would you separate model failure from retrieval failure?
- What regression test would you add?
- What evidence would you collect before changing prompts?',
ARRAY['Changing prompts without identifying root cause.','Ignoring retrieved evidence and tool traces.','Failing to create regression tests after incidents.','Communicating technical uncertainty poorly to the customer.'],
'Strong Answer: I would isolate the failure stage. For a bad answer, I would check whether the user had permission, whether retrieval returned relevant evidence, whether the prompt used the evidence correctly, whether the model hallucinated, and whether post-processing or citations failed. For tool failures, I would inspect arguments, authorization, idempotency, retries, and partial completion. Scenario-specific implementation detail: I would define a pilot scope with target users, data sources, success metrics, evaluation gates, security review, launch criteria, and explicit non-goals. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior troubleshooting approach uses evidence before changing the system. I would capture the exact request trace, prompt/model/retrieval versions, retrieved chunks, tool calls, latency, cost, user context, and expected behavior. Then I would classify the incident, assess customer impact, apply a safe mitigation, and create a regression test to prevent recurrence. I would communicate clearly: what failed, who was affected, what we changed, what risk remains, and how we will verify the fix. Senior execution detail: I would create decision points for continue, narrow, pause, or productionize based on measured value and risk, not stakeholder excitement alone. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g310', 'genai-architecture', 'A production issue occurs before an executive demo. How do you respond?', 'medium',
'A production issue occurs before an executive demo. How do you respond?

What the Interviewer Is Testing
The interviewer is testing whether you can diagnose production GenAI failures systematically across data, retrieval, prompt, model, tool, permission, infrastructure, and user-expectation layers. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you debug a wrong but confident answer?
- How would you triage a tool-call failure?
- How would you separate model failure from retrieval failure?
- What regression test would you add?
- What evidence would you collect before changing prompts?',
ARRAY['Changing prompts without identifying root cause.','Ignoring retrieved evidence and tool traces.','Failing to create regression tests after incidents.','Communicating technical uncertainty poorly to the customer.'],
'Strong Answer: I would isolate the failure stage. For a bad answer, I would check whether the user had permission, whether retrieval returned relevant evidence, whether the prompt used the evidence correctly, whether the model hallucinated, and whether post-processing or citations failed. For tool failures, I would inspect arguments, authorization, idempotency, retries, and partial completion. Scenario-specific implementation detail: I would add authentication, authorization, evals, observability, data governance, reliability targets, runbooks, and rollback before calling the demo production-ready. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior troubleshooting approach uses evidence before changing the system. I would capture the exact request trace, prompt/model/retrieval versions, retrieved chunks, tool calls, latency, cost, user context, and expected behavior. Then I would classify the incident, assess customer impact, apply a safe mitigation, and create a regression test to prevent recurrence. I would communicate clearly: what failed, who was affected, what we changed, what risk remains, and how we will verify the fix. Senior execution detail: I would communicate that production readiness means measured safety and reliability under real user workflows, not just a successful demo path. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

-- Stakeholder Communication and Implementation Planning (Q91–100)

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b301', 'behavioral', 'How would you explain GenAI project risk to a non-technical executive sponsor?', 'medium',
'How would you explain GenAI project risk to a non-technical executive sponsor?

What the Interviewer Is Testing
The interviewer is testing whether you can communicate trade-offs, plan delivery, manage risk, align technical choices with business outcomes, and guide customers through adoption. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you explain trade-offs to executives?
- What would you include in a pilot plan?
- How would you handle scope creep?
- How would you manage a customer who wants full automation immediately?
- What would be your phase-one delivery plan?',
ARRAY['Overpromising AI capability.','Not identifying customer dependencies.','Using overly technical language with business stakeholders.','Skipping rollout, support, and adoption planning.'],
'Strong Answer: I would present the plan in phases: discovery, prototype, pilot, production hardening, rollout, and measurement. I would make trade-offs explicit: accuracy versus latency, automation versus approval, scope versus time, and cost versus quality. I would align stakeholders on success metrics, risk owners, decision points, and what is out of scope. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE translates technical uncertainty into executive-manageable risk. I would create a delivery plan with assumptions, milestones, customer dependencies, data readiness, security review, evaluation gates, rollback criteria, adoption plan, and support model. I would communicate differently to executives, workflow owners, security teams, and engineers. I would not promise perfect AI; I would promise a controlled path to measurable business value with transparent risk management. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b302', 'behavioral', 'How would you plan a 30-day pilot for an enterprise GenAI assistant?', 'medium',
'How would you plan a 30-day pilot for an enterprise GenAI assistant?

What the Interviewer Is Testing
The interviewer is testing whether you can communicate trade-offs, plan delivery, manage risk, align technical choices with business outcomes, and guide customers through adoption. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you explain trade-offs to executives?
- What would you include in a pilot plan?
- How would you handle scope creep?
- How would you manage a customer who wants full automation immediately?
- What would be your phase-one delivery plan?',
ARRAY['Overpromising AI capability.','Not identifying customer dependencies.','Using overly technical language with business stakeholders.','Skipping rollout, support, and adoption planning.'],
'Strong Answer: I would present the plan in phases: discovery, prototype, pilot, production hardening, rollout, and measurement. I would make trade-offs explicit: accuracy versus latency, automation versus approval, scope versus time, and cost versus quality. I would align stakeholders on success metrics, risk owners, decision points, and what is out of scope. Scenario-specific implementation detail: I would model invoice exception handling as a state machine: classify exception, gather evidence, propose resolution, request approval, execute ERP update, and record audit evidence. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE translates technical uncertainty into executive-manageable risk. I would create a delivery plan with assumptions, milestones, customer dependencies, data readiness, security review, evaluation gates, rollback criteria, adoption plan, and support model. I would communicate differently to executives, workflow owners, security teams, and engineers. I would not promise perfect AI; I would promise a controlled path to measurable business value with transparent risk management. Senior execution detail: I would protect against duplicate payments, wrong vendor updates, missing approval, partial ERP failures, and unclear financial accountability. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b303', 'behavioral', 'How would you handle a customer who wants full automation but has no evaluation data?', 'medium',
'How would you handle a customer who wants full automation but has no evaluation data?

What the Interviewer Is Testing
The interviewer is testing whether you can communicate trade-offs, plan delivery, manage risk, align technical choices with business outcomes, and guide customers through adoption. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you explain trade-offs to executives?
- What would you include in a pilot plan?
- How would you handle scope creep?
- How would you manage a customer who wants full automation immediately?
- What would be your phase-one delivery plan?',
ARRAY['Overpromising AI capability.','Not identifying customer dependencies.','Using overly technical language with business stakeholders.','Skipping rollout, support, and adoption planning.'],
'Strong Answer: I would present the plan in phases: discovery, prototype, pilot, production hardening, rollout, and measurement. I would make trade-offs explicit: accuracy versus latency, automation versus approval, scope versus time, and cost versus quality. I would align stakeholders on success metrics, risk owners, decision points, and what is out of scope. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE translates technical uncertainty into executive-manageable risk. I would create a delivery plan with assumptions, milestones, customer dependencies, data readiness, security review, evaluation gates, rollback criteria, adoption plan, and support model. I would communicate differently to executives, workflow owners, security teams, and engineers. I would not promise perfect AI; I would promise a controlled path to measurable business value with transparent risk management. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b304', 'behavioral', 'How would you present architecture trade-offs between accuracy, latency, cost, and safety?', 'medium',
'How would you present architecture trade-offs between accuracy, latency, cost, and safety?

What the Interviewer Is Testing
The interviewer is testing whether you can communicate trade-offs, plan delivery, manage risk, align technical choices with business outcomes, and guide customers through adoption. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you explain trade-offs to executives?
- What would you include in a pilot plan?
- How would you handle scope creep?
- How would you manage a customer who wants full automation immediately?
- What would be your phase-one delivery plan?',
ARRAY['Overpromising AI capability.','Not identifying customer dependencies.','Using overly technical language with business stakeholders.','Skipping rollout, support, and adoption planning.'],
'Strong Answer: I would present the plan in phases: discovery, prototype, pilot, production hardening, rollout, and measurement. I would make trade-offs explicit: accuracy versus latency, automation versus approval, scope versus time, and cost versus quality. I would align stakeholders on success metrics, risk owners, decision points, and what is out of scope. Scenario-specific implementation detail: I would break down p50/p95 latency by retrieval, reranking, model call, tool calls, network, and post-processing, then optimize the largest contributor first. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE translates technical uncertainty into executive-manageable risk. I would create a delivery plan with assumptions, milestones, customer dependencies, data readiness, security review, evaluation gates, rollback criteria, adoption plan, and support model. I would communicate differently to executives, workflow owners, security teams, and engineers. I would not promise perfect AI; I would promise a controlled path to measurable business value with transparent risk management. Senior execution detail: I would use streaming only as UX relief, not as a substitute for reducing critical-path work, and define workflow-specific SLOs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b305', 'behavioral', 'How would you manage scope when a customer asks the assistant to do everything?', 'medium',
'How would you manage scope when a customer asks the assistant to do everything?

What the Interviewer Is Testing
The interviewer is testing whether you can communicate trade-offs, plan delivery, manage risk, align technical choices with business outcomes, and guide customers through adoption. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you explain trade-offs to executives?
- What would you include in a pilot plan?
- How would you handle scope creep?
- How would you manage a customer who wants full automation immediately?
- What would be your phase-one delivery plan?',
ARRAY['Overpromising AI capability.','Not identifying customer dependencies.','Using overly technical language with business stakeholders.','Skipping rollout, support, and adoption planning.'],
'Strong Answer: I would present the plan in phases: discovery, prototype, pilot, production hardening, rollout, and measurement. I would make trade-offs explicit: accuracy versus latency, automation versus approval, scope versus time, and cost versus quality. I would align stakeholders on success metrics, risk owners, decision points, and what is out of scope. Scenario-specific implementation detail: I would convert the broad request into ranked workflows, select one high-value and measurable slice, and document what is out of scope. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE translates technical uncertainty into executive-manageable risk. I would create a delivery plan with assumptions, milestones, customer dependencies, data readiness, security review, evaluation gates, rollback criteria, adoption plan, and support model. I would communicate differently to executives, workflow owners, security teams, and engineers. I would not promise perfect AI; I would promise a controlled path to measurable business value with transparent risk management. Senior execution detail: I would use a decision matrix based on data readiness, risk, business value, user frequency, and feasibility to prevent a scattered project. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b306', 'behavioral', 'How would you create an implementation roadmap from prototype to production?', 'medium',
'How would you create an implementation roadmap from prototype to production?

What the Interviewer Is Testing
The interviewer is testing whether you can communicate trade-offs, plan delivery, manage risk, align technical choices with business outcomes, and guide customers through adoption. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you explain trade-offs to executives?
- What would you include in a pilot plan?
- How would you handle scope creep?
- How would you manage a customer who wants full automation immediately?
- What would be your phase-one delivery plan?',
ARRAY['Overpromising AI capability.','Not identifying customer dependencies.','Using overly technical language with business stakeholders.','Skipping rollout, support, and adoption planning.'],
'Strong Answer: I would present the plan in phases: discovery, prototype, pilot, production hardening, rollout, and measurement. I would make trade-offs explicit: accuracy versus latency, automation versus approval, scope versus time, and cost versus quality. I would align stakeholders on success metrics, risk owners, decision points, and what is out of scope. Scenario-specific implementation detail: I would define a pilot scope with target users, data sources, success metrics, evaluation gates, security review, launch criteria, and explicit non-goals. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE translates technical uncertainty into executive-manageable risk. I would create a delivery plan with assumptions, milestones, customer dependencies, data readiness, security review, evaluation gates, rollback criteria, adoption plan, and support model. I would communicate differently to executives, workflow owners, security teams, and engineers. I would not promise perfect AI; I would promise a controlled path to measurable business value with transparent risk management. Senior execution detail: I would create decision points for continue, narrow, pause, or productionize based on measured value and risk, not stakeholder excitement alone. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b307', 'behavioral', 'How would you align security, legal, product, and engineering stakeholders?', 'medium',
'How would you align security, legal, product, and engineering stakeholders?

What the Interviewer Is Testing
The interviewer is testing whether you can communicate trade-offs, plan delivery, manage risk, align technical choices with business outcomes, and guide customers through adoption. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you explain trade-offs to executives?
- What would you include in a pilot plan?
- How would you handle scope creep?
- How would you manage a customer who wants full automation immediately?
- What would be your phase-one delivery plan?',
ARRAY['Overpromising AI capability.','Not identifying customer dependencies.','Using overly technical language with business stakeholders.','Skipping rollout, support, and adoption planning.'],
'Strong Answer: I would present the plan in phases: discovery, prototype, pilot, production hardening, rollout, and measurement. I would make trade-offs explicit: accuracy versus latency, automation versus approval, scope versus time, and cost versus quality. I would align stakeholders on success metrics, risk owners, decision points, and what is out of scope. Scenario-specific implementation detail: I would narrow the use case to clause extraction, risk highlighting, comparison with playbooks, and reviewer notes, rather than pretending the system can replace legal judgment. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE translates technical uncertainty into executive-manageable risk. I would create a delivery plan with assumptions, milestones, customer dependencies, data readiness, security review, evaluation gates, rollback criteria, adoption plan, and support model. I would communicate differently to executives, workflow owners, security teams, and engineers. I would not promise perfect AI; I would promise a controlled path to measurable business value with transparent risk management. Senior execution detail: I would require source-grounded output, versioned playbooks, privilege-aware document handling, reviewer sign-off, and measurement against lawyer-reviewed examples. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b308', 'behavioral', 'How would you communicate that the system is not ready for production?', 'medium',
'How would you communicate that the system is not ready for production?

What the Interviewer Is Testing
The interviewer is testing whether you can communicate trade-offs, plan delivery, manage risk, align technical choices with business outcomes, and guide customers through adoption. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you explain trade-offs to executives?
- What would you include in a pilot plan?
- How would you handle scope creep?
- How would you manage a customer who wants full automation immediately?
- What would be your phase-one delivery plan?',
ARRAY['Overpromising AI capability.','Not identifying customer dependencies.','Using overly technical language with business stakeholders.','Skipping rollout, support, and adoption planning.'],
'Strong Answer: I would present the plan in phases: discovery, prototype, pilot, production hardening, rollout, and measurement. I would make trade-offs explicit: accuracy versus latency, automation versus approval, scope versus time, and cost versus quality. I would align stakeholders on success metrics, risk owners, decision points, and what is out of scope. Scenario-specific implementation detail: I would add authentication, authorization, evals, observability, data governance, reliability targets, runbooks, and rollback before calling the demo production-ready. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE translates technical uncertainty into executive-manageable risk. I would create a delivery plan with assumptions, milestones, customer dependencies, data readiness, security review, evaluation gates, rollback criteria, adoption plan, and support model. I would communicate differently to executives, workflow owners, security teams, and engineers. I would not promise perfect AI; I would promise a controlled path to measurable business value with transparent risk management. Senior execution detail: I would communicate that production readiness means measured safety and reliability under real user workflows, not just a successful demo path. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b309', 'behavioral', 'How would you structure a customer workshop for GenAI workflow discovery?', 'medium',
'How would you structure a customer workshop for GenAI workflow discovery?

What the Interviewer Is Testing
The interviewer is testing whether you can communicate trade-offs, plan delivery, manage risk, align technical choices with business outcomes, and guide customers through adoption. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you explain trade-offs to executives?
- What would you include in a pilot plan?
- How would you handle scope creep?
- How would you manage a customer who wants full automation immediately?
- What would be your phase-one delivery plan?',
ARRAY['Overpromising AI capability.','Not identifying customer dependencies.','Using overly technical language with business stakeholders.','Skipping rollout, support, and adoption planning.'],
'Strong Answer: I would present the plan in phases: discovery, prototype, pilot, production hardening, rollout, and measurement. I would make trade-offs explicit: accuracy versus latency, automation versus approval, scope versus time, and cost versus quality. I would align stakeholders on success metrics, risk owners, decision points, and what is out of scope. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE translates technical uncertainty into executive-manageable risk. I would create a delivery plan with assumptions, milestones, customer dependencies, data readiness, security review, evaluation gates, rollback criteria, adoption plan, and support model. I would communicate differently to executives, workflow owners, security teams, and engineers. I would not promise perfect AI; I would promise a controlled path to measurable business value with transparent risk management. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b310', 'behavioral', 'How would you convert interview ambiguity into a clear answer without asking endless questions?', 'medium',
'How would you convert interview ambiguity into a clear answer without asking endless questions?

What the Interviewer Is Testing
The interviewer is testing whether you can communicate trade-offs, plan delivery, manage risk, align technical choices with business outcomes, and guide customers through adoption. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you explain trade-offs to executives?
- What would you include in a pilot plan?
- How would you handle scope creep?
- How would you manage a customer who wants full automation immediately?
- What would be your phase-one delivery plan?',
ARRAY['Overpromising AI capability.','Not identifying customer dependencies.','Using overly technical language with business stakeholders.','Skipping rollout, support, and adoption planning.'],
'Strong Answer: I would present the plan in phases: discovery, prototype, pilot, production hardening, rollout, and measurement. I would make trade-offs explicit: accuracy versus latency, automation versus approval, scope versus time, and cost versus quality. I would align stakeholders on success metrics, risk owners, decision points, and what is out of scope. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE translates technical uncertainty into executive-manageable risk. I would create a delivery plan with assumptions, milestones, customer dependencies, data readiness, security review, evaluation gates, rollback criteria, adoption plan, and support model. I would communicate differently to executives, workflow owners, security teams, and engineers. I would not promise perfect AI; I would promise a controlled path to measurable business value with transparent risk management. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');
