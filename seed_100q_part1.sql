-- seed_100q_part1.sql
-- Questions 1–50 from GenAI FDE 100 Interview Questions
-- Categories: case-study (Q1–10), genai-architecture (Q11–50)

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs201', 'case-study', 'A bank wants an AI assistant to help relationship managers prepare for client meetings from CRM notes, emails, and policy documents. What would you do?', 'medium',
'A bank wants an AI assistant to help relationship managers prepare for client meetings from CRM notes, emails, and policy documents. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can convert an ambiguous customer situation into a structured discovery process, identify the workflow owner, expose hidden constraints, and avoid proposing AI before proving that AI is useful. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What would you ask the customer in the first 30 minutes?
- How would you identify whether GenAI is actually needed?
- What would make you reject the project or narrow the scope?
- How would you communicate uncertainty to a non-technical stakeholder?
- What would you write in the customer problem statement?',
ARRAY['Starting with a model or vendor before understanding the workflow.','Ignoring who owns the decision and who is accountable for failure.','Treating customer discovery as a checklist instead of a risk-reduction process.','Failing to define measurable success criteria.'],
'Strong Answer: I would begin by mapping the current workflow: who triggers it, what decision is made, what data is used, where the handoffs happen, and what success looks like. Then I would separate business requirements from technical assumptions and identify risk boundaries such as PII, permissions, accuracy expectations, and approval requirements. Only after that would I propose a GenAI design, usually starting with a narrow workflow slice that can be measured quickly. Scenario-specific implementation detail: I would build a meeting-prep assistant that pulls only permissioned CRM notes, approved product material, recent customer interactions, and policy snippets, then produces a sourced briefing for the relationship manager to review. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE answer treats the interview as a customer problem, not a model-selection exercise. I would establish the business outcome, the user persona, the operational bottleneck, and the cost of failure before discussing architecture. I would create a problem framing document with success metrics, non-goals, data readiness, compliance constraints, and a phased rollout plan. For example, I might recommend a human-in-the-loop assistant before full automation if the customer is operating in a regulated or high-stakes workflow. I would also define how we will know the project is working: cycle-time reduction, deflection rate, accuracy on a golden dataset, escalation rate, user adoption, and executive-visible ROI. Senior execution detail: I would not let the system recommend regulated financial advice autonomously. The pilot metric would be prep-time reduction, citation precision, RM adoption, and compliance-review findings. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs202', 'case-study', 'A healthcare operations team wants to automate prior-authorization review using internal guidelines and patient case notes. What would you do?', 'medium',
'A healthcare operations team wants to automate prior-authorization review using internal guidelines and patient case notes. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can convert an ambiguous customer situation into a structured discovery process, identify the workflow owner, expose hidden constraints, and avoid proposing AI before proving that AI is useful. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What would you ask the customer in the first 30 minutes?
- How would you identify whether GenAI is actually needed?
- What would make you reject the project or narrow the scope?
- How would you communicate uncertainty to a non-technical stakeholder?
- What would you write in the customer problem statement?',
ARRAY['Starting with a model or vendor before understanding the workflow.','Ignoring who owns the decision and who is accountable for failure.','Treating customer discovery as a checklist instead of a risk-reduction process.','Failing to define measurable success criteria.'],
'Strong Answer: I would begin by mapping the current workflow: who triggers it, what decision is made, what data is used, where the handoffs happen, and what success looks like. Then I would separate business requirements from technical assumptions and identify risk boundaries such as PII, permissions, accuracy expectations, and approval requirements. Only after that would I propose a GenAI design, usually starting with a narrow workflow slice that can be measured quickly. Scenario-specific implementation detail: I would treat this as a high-risk decision-support workflow, not an auto-denial system. The assistant should extract relevant guideline evidence, summarize missing information, and route the case to a reviewer. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE answer treats the interview as a customer problem, not a model-selection exercise. I would establish the business outcome, the user persona, the operational bottleneck, and the cost of failure before discussing architecture. I would create a problem framing document with success metrics, non-goals, data readiness, compliance constraints, and a phased rollout plan. For example, I might recommend a human-in-the-loop assistant before full automation if the customer is operating in a regulated or high-stakes workflow. I would also define how we will know the project is working: cycle-time reduction, deflection rate, accuracy on a golden dataset, escalation rate, user adoption, and executive-visible ROI. Senior execution detail: I would prioritize PHI handling, auditability, reviewer accountability, false-negative risk, and a golden set reviewed by domain experts before any production pilot. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs203', 'case-study', 'A logistics customer says their planners waste time reading exception reports and wants an AI copilot to recommend actions. What would you do?', 'medium',
'A logistics customer says their planners waste time reading exception reports and wants an AI copilot to recommend actions. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can convert an ambiguous customer situation into a structured discovery process, identify the workflow owner, expose hidden constraints, and avoid proposing AI before proving that AI is useful. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What would you ask the customer in the first 30 minutes?
- How would you identify whether GenAI is actually needed?
- What would make you reject the project or narrow the scope?
- How would you communicate uncertainty to a non-technical stakeholder?
- What would you write in the customer problem statement?',
ARRAY['Starting with a model or vendor before understanding the workflow.','Ignoring who owns the decision and who is accountable for failure.','Treating customer discovery as a checklist instead of a risk-reduction process.','Failing to define measurable success criteria.'],
'Strong Answer: I would begin by mapping the current workflow: who triggers it, what decision is made, what data is used, where the handoffs happen, and what success looks like. Then I would separate business requirements from technical assumptions and identify risk boundaries such as PII, permissions, accuracy expectations, and approval requirements. Only after that would I propose a GenAI design, usually starting with a narrow workflow slice that can be measured quickly. Scenario-specific implementation detail: I would map exception categories, SLA impact, available actions, and operational data sources before designing an assistant that ranks exceptions and explains recommended next actions. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE answer treats the interview as a customer problem, not a model-selection exercise. I would establish the business outcome, the user persona, the operational bottleneck, and the cost of failure before discussing architecture. I would create a problem framing document with success metrics, non-goals, data readiness, compliance constraints, and a phased rollout plan. For example, I might recommend a human-in-the-loop assistant before full automation if the customer is operating in a regulated or high-stakes workflow. I would also define how we will know the project is working: cycle-time reduction, deflection rate, accuracy on a golden dataset, escalation rate, user adoption, and executive-visible ROI. Senior execution detail: I would measure planner time saved, avoided SLA breaches, recommendation acceptance rate, and cases escalated because the evidence was insufficient. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs204', 'case-study', 'A sales leader asks for a GenAI tool to summarize every customer call and update Salesforce automatically. What would you do?', 'medium',
'A sales leader asks for a GenAI tool to summarize every customer call and update Salesforce automatically. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can convert an ambiguous customer situation into a structured discovery process, identify the workflow owner, expose hidden constraints, and avoid proposing AI before proving that AI is useful. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What would you ask the customer in the first 30 minutes?
- How would you identify whether GenAI is actually needed?
- What would make you reject the project or narrow the scope?
- How would you communicate uncertainty to a non-technical stakeholder?
- What would you write in the customer problem statement?',
ARRAY['Starting with a model or vendor before understanding the workflow.','Ignoring who owns the decision and who is accountable for failure.','Treating customer discovery as a checklist instead of a risk-reduction process.','Failing to define measurable success criteria.'],
'Strong Answer: I would begin by mapping the current workflow: who triggers it, what decision is made, what data is used, where the handoffs happen, and what success looks like. Then I would separate business requirements from technical assumptions and identify risk boundaries such as PII, permissions, accuracy expectations, and approval requirements. Only after that would I propose a GenAI design, usually starting with a narrow workflow slice that can be measured quickly. Scenario-specific implementation detail: I would start in draft mode: summarize calls, propose CRM field updates, show evidence, and require the account owner to approve writes before any Salesforce update. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE answer treats the interview as a customer problem, not a model-selection exercise. I would establish the business outcome, the user persona, the operational bottleneck, and the cost of failure before discussing architecture. I would create a problem framing document with success metrics, non-goals, data readiness, compliance constraints, and a phased rollout plan. For example, I might recommend a human-in-the-loop assistant before full automation if the customer is operating in a regulated or high-stakes workflow. I would also define how we will know the project is working: cycle-time reduction, deflection rate, accuracy on a golden dataset, escalation rate, user adoption, and executive-visible ROI. Senior execution detail: I would add field-level permissions, idempotent updates, audit logs, rollback for wrong writes, and metrics such as accepted update rate and manual cleanup rate. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs205', 'case-study', 'An insurance team wants claim handlers to use an AI assistant for coverage questions and next-step recommendations. What would you do?', 'medium',
'An insurance team wants claim handlers to use an AI assistant for coverage questions and next-step recommendations. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can convert an ambiguous customer situation into a structured discovery process, identify the workflow owner, expose hidden constraints, and avoid proposing AI before proving that AI is useful. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What would you ask the customer in the first 30 minutes?
- How would you identify whether GenAI is actually needed?
- What would make you reject the project or narrow the scope?
- How would you communicate uncertainty to a non-technical stakeholder?
- What would you write in the customer problem statement?',
ARRAY['Starting with a model or vendor before understanding the workflow.','Ignoring who owns the decision and who is accountable for failure.','Treating customer discovery as a checklist instead of a risk-reduction process.','Failing to define measurable success criteria.'],
'Strong Answer: I would begin by mapping the current workflow: who triggers it, what decision is made, what data is used, where the handoffs happen, and what success looks like. Then I would separate business requirements from technical assumptions and identify risk boundaries such as PII, permissions, accuracy expectations, and approval requirements. Only after that would I propose a GenAI design, usually starting with a narrow workflow slice that can be measured quickly. Scenario-specific implementation detail: I would design the assistant to retrieve policy clauses, claim history, and decision guidelines, then provide sourced recommendations for a claim handler rather than final claim decisions. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE answer treats the interview as a customer problem, not a model-selection exercise. I would establish the business outcome, the user persona, the operational bottleneck, and the cost of failure before discussing architecture. I would create a problem framing document with success metrics, non-goals, data readiness, compliance constraints, and a phased rollout plan. For example, I might recommend a human-in-the-loop assistant before full automation if the customer is operating in a regulated or high-stakes workflow. I would also define how we will know the project is working: cycle-time reduction, deflection rate, accuracy on a golden dataset, escalation rate, user adoption, and executive-visible ROI. Senior execution detail: I would explicitly manage regulatory risk, escalation thresholds, explanation requirements, and quality review for disputed or high-value claims. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs206', 'case-study', 'A legal team wants a contract-review assistant but cannot clearly explain what decisions the system should make. What would you do?', 'medium',
'A legal team wants a contract-review assistant but cannot clearly explain what decisions the system should make. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can convert an ambiguous customer situation into a structured discovery process, identify the workflow owner, expose hidden constraints, and avoid proposing AI before proving that AI is useful. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What would you ask the customer in the first 30 minutes?
- How would you identify whether GenAI is actually needed?
- What would make you reject the project or narrow the scope?
- How would you communicate uncertainty to a non-technical stakeholder?
- What would you write in the customer problem statement?',
ARRAY['Starting with a model or vendor before understanding the workflow.','Ignoring who owns the decision and who is accountable for failure.','Treating customer discovery as a checklist instead of a risk-reduction process.','Failing to define measurable success criteria.'],
'Strong Answer: I would begin by mapping the current workflow: who triggers it, what decision is made, what data is used, where the handoffs happen, and what success looks like. Then I would separate business requirements from technical assumptions and identify risk boundaries such as PII, permissions, accuracy expectations, and approval requirements. Only after that would I propose a GenAI design, usually starting with a narrow workflow slice that can be measured quickly. Scenario-specific implementation detail: I would narrow the use case to clause extraction, risk highlighting, comparison with playbooks, and reviewer notes, rather than pretending the system can replace legal judgment. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE answer treats the interview as a customer problem, not a model-selection exercise. I would establish the business outcome, the user persona, the operational bottleneck, and the cost of failure before discussing architecture. I would create a problem framing document with success metrics, non-goals, data readiness, compliance constraints, and a phased rollout plan. For example, I might recommend a human-in-the-loop assistant before full automation if the customer is operating in a regulated or high-stakes workflow. I would also define how we will know the project is working: cycle-time reduction, deflection rate, accuracy on a golden dataset, escalation rate, user adoption, and executive-visible ROI. Senior execution detail: I would require source-grounded output, versioned playbooks, privilege-aware document handling, reviewer sign-off, and measurement against lawyer-reviewed examples. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs207', 'case-study', 'A manufacturing customer wants an AI system to diagnose machine downtime from tickets, sensor summaries, and maintenance manuals. What would you do?', 'medium',
'A manufacturing customer wants an AI system to diagnose machine downtime from tickets, sensor summaries, and maintenance manuals. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can convert an ambiguous customer situation into a structured discovery process, identify the workflow owner, expose hidden constraints, and avoid proposing AI before proving that AI is useful. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What would you ask the customer in the first 30 minutes?
- How would you identify whether GenAI is actually needed?
- What would make you reject the project or narrow the scope?
- How would you communicate uncertainty to a non-technical stakeholder?
- What would you write in the customer problem statement?',
ARRAY['Starting with a model or vendor before understanding the workflow.','Ignoring who owns the decision and who is accountable for failure.','Treating customer discovery as a checklist instead of a risk-reduction process.','Failing to define measurable success criteria.'],
'Strong Answer: I would begin by mapping the current workflow: who triggers it, what decision is made, what data is used, where the handoffs happen, and what success looks like. Then I would separate business requirements from technical assumptions and identify risk boundaries such as PII, permissions, accuracy expectations, and approval requirements. Only after that would I propose a GenAI design, usually starting with a narrow workflow slice that can be measured quickly. Scenario-specific implementation detail: I would combine maintenance manuals, past tickets, operator notes, and sensor summaries to suggest likely causes and next diagnostic steps with confidence and evidence. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE answer treats the interview as a customer problem, not a model-selection exercise. I would establish the business outcome, the user persona, the operational bottleneck, and the cost of failure before discussing architecture. I would create a problem framing document with success metrics, non-goals, data readiness, compliance constraints, and a phased rollout plan. For example, I might recommend a human-in-the-loop assistant before full automation if the customer is operating in a regulated or high-stakes workflow. I would also define how we will know the project is working: cycle-time reduction, deflection rate, accuracy on a golden dataset, escalation rate, user adoption, and executive-visible ROI. Senior execution detail: I would track mean-time-to-diagnosis reduction, false recommendation risk, technician override reasons, and whether the system improves future knowledge capture. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs208', 'case-study', 'A support organization wants to reduce ticket volume with an internal knowledge assistant for agents. What would you do?', 'medium',
'A support organization wants to reduce ticket volume with an internal knowledge assistant for agents. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can convert an ambiguous customer situation into a structured discovery process, identify the workflow owner, expose hidden constraints, and avoid proposing AI before proving that AI is useful. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What would you ask the customer in the first 30 minutes?
- How would you identify whether GenAI is actually needed?
- What would make you reject the project or narrow the scope?
- How would you communicate uncertainty to a non-technical stakeholder?
- What would you write in the customer problem statement?',
ARRAY['Starting with a model or vendor before understanding the workflow.','Ignoring who owns the decision and who is accountable for failure.','Treating customer discovery as a checklist instead of a risk-reduction process.','Failing to define measurable success criteria.'],
'Strong Answer: I would begin by mapping the current workflow: who triggers it, what decision is made, what data is used, where the handoffs happen, and what success looks like. Then I would separate business requirements from technical assumptions and identify risk boundaries such as PII, permissions, accuracy expectations, and approval requirements. Only after that would I propose a GenAI design, usually starting with a narrow workflow slice that can be measured quickly. Scenario-specific implementation detail: I would begin with agent-assist mode: classify the ticket, retrieve relevant knowledge, draft a reply, and escalate when confidence, policy, or sentiment thresholds require human review. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE answer treats the interview as a customer problem, not a model-selection exercise. I would establish the business outcome, the user persona, the operational bottleneck, and the cost of failure before discussing architecture. I would create a problem framing document with success metrics, non-goals, data readiness, compliance constraints, and a phased rollout plan. For example, I might recommend a human-in-the-loop assistant before full automation if the customer is operating in a regulated or high-stakes workflow. I would also define how we will know the project is working: cycle-time reduction, deflection rate, accuracy on a golden dataset, escalation rate, user adoption, and executive-visible ROI. Senior execution detail: I would measure resolution time, deflection without quality loss, escalation correctness, customer-satisfaction impact, and incidents caused by incorrect automation. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs209', 'case-study', 'An executive asks for an agent that can answer any business question across company data. What would you do?', 'medium',
'An executive asks for an agent that can answer any business question across company data. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can convert an ambiguous customer situation into a structured discovery process, identify the workflow owner, expose hidden constraints, and avoid proposing AI before proving that AI is useful. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What would you ask the customer in the first 30 minutes?
- How would you identify whether GenAI is actually needed?
- What would make you reject the project or narrow the scope?
- How would you communicate uncertainty to a non-technical stakeholder?
- What would you write in the customer problem statement?',
ARRAY['Starting with a model or vendor before understanding the workflow.','Ignoring who owns the decision and who is accountable for failure.','Treating customer discovery as a checklist instead of a risk-reduction process.','Failing to define measurable success criteria.'],
'Strong Answer: I would begin by mapping the current workflow: who triggers it, what decision is made, what data is used, where the handoffs happen, and what success looks like. Then I would separate business requirements from technical assumptions and identify risk boundaries such as PII, permissions, accuracy expectations, and approval requirements. Only after that would I propose a GenAI design, usually starting with a narrow workflow slice that can be measured quickly. Scenario-specific implementation detail: I would push back on an open-ended enterprise brain request and propose a narrow executive dashboard assistant over governed, well-defined metrics and approved sources. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE answer treats the interview as a customer problem, not a model-selection exercise. I would establish the business outcome, the user persona, the operational bottleneck, and the cost of failure before discussing architecture. I would create a problem framing document with success metrics, non-goals, data readiness, compliance constraints, and a phased rollout plan. For example, I might recommend a human-in-the-loop assistant before full automation if the customer is operating in a regulated or high-stakes workflow. I would also define how we will know the project is working: cycle-time reduction, deflection rate, accuracy on a golden dataset, escalation rate, user adoption, and executive-visible ROI. Senior execution detail: I would separate analytics truth from narrative generation, require metric lineage, define freshness expectations, and avoid cross-domain answers without source authority. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('cs210', 'case-study', 'A recruiter tells you the RRK round will focus on building an agentic workflow for a customer problem. How do you approach the case?', 'medium',
'A recruiter tells you the RRK round will focus on building an agentic workflow for a customer problem. How do you approach the case?

What the Interviewer Is Testing
The interviewer is testing whether you can convert an ambiguous customer situation into a structured discovery process, identify the workflow owner, expose hidden constraints, and avoid proposing AI before proving that AI is useful. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What would you ask the customer in the first 30 minutes?
- How would you identify whether GenAI is actually needed?
- What would make you reject the project or narrow the scope?
- How would you communicate uncertainty to a non-technical stakeholder?
- What would you write in the customer problem statement?',
ARRAY['Starting with a model or vendor before understanding the workflow.','Ignoring who owns the decision and who is accountable for failure.','Treating customer discovery as a checklist instead of a risk-reduction process.','Failing to define measurable success criteria.'],
'Strong Answer: I would begin by mapping the current workflow: who triggers it, what decision is made, what data is used, where the handoffs happen, and what success looks like. Then I would separate business requirements from technical assumptions and identify risk boundaries such as PII, permissions, accuracy expectations, and approval requirements. Only after that would I propose a GenAI design, usually starting with a narrow workflow slice that can be measured quickly. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior FDE answer treats the interview as a customer problem, not a model-selection exercise. I would establish the business outcome, the user persona, the operational bottleneck, and the cost of failure before discussing architecture. I would create a problem framing document with success metrics, non-goals, data readiness, compliance constraints, and a phased rollout plan. For example, I might recommend a human-in-the-loop assistant before full automation if the customer is operating in a regulated or high-stakes workflow. I would also define how we will know the project is working: cycle-time reduction, deflection rate, accuracy on a golden dataset, escalation rate, user adoption, and executive-visible ROI. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

-- Q11–20: GenAI Architecture (hard)

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g201', 'genai-architecture', 'Design a production GenAI assistant for enterprise employees that can answer policy questions and complete limited workflow actions. What would you do?', 'hard',
'Design a production GenAI assistant for enterprise employees that can answer policy questions and complete limited workflow actions. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can design a production GenAI system with clear boundaries, components, data flow, model interaction, evaluation, deployment, and operational controls. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What components would you put on the critical path?
- How would you version prompts, tools, and models?
- How would you roll back a bad model or prompt release?
- What would you monitor in production?
- What would be your phase-one delivery plan?',
ARRAY['Drawing a box labeled LLM and calling it architecture.','Ignoring auth, audit, deployment, and evaluation.','Not separating model failure from retrieval, tool, product, or data failure.','Forgetting rollout, rollback, and versioning.'],
'Strong Answer: I would design the system around the user workflow and reliability target. The core components would include an API layer, authentication and authorization, orchestration, retrieval or tool access if needed, prompt/template management, model gateway, evaluation pipeline, logging/tracing, and admin controls. I would define how requests move through the system, what data is stored, how failures are handled, and how changes are tested before release. Scenario-specific implementation detail: I would model invoice exception handling as a state machine: classify exception, gather evidence, propose resolution, request approval, execute ERP update, and record audit evidence. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design makes the GenAI part only one component of a governed production system. I would separate customer-facing UX, orchestration, model gateway, retrieval/tool layer, policy layer, eval layer, and observability layer. I would define tenancy, data retention, auditability, fallback modes, prompt and model versioning, and a release process using offline evals plus controlled online rollout. I would explicitly decide what must be deterministic, what can be probabilistic, and where human approval is required. I would also design for cost and latency from day one through caching, routing, streaming, token budgets, and SLOs. Senior execution detail: I would protect against duplicate payments, wrong vendor updates, missing approval, partial ERP failures, and unclear financial accountability. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g202', 'genai-architecture', 'Design the backend architecture for a customer-facing AI support copilot that serves multiple enterprise tenants. What would you do?', 'hard',
'Design the backend architecture for a customer-facing AI support copilot that serves multiple enterprise tenants. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can design a production GenAI system with clear boundaries, components, data flow, model interaction, evaluation, deployment, and operational controls. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What components would you put on the critical path?
- How would you version prompts, tools, and models?
- How would you roll back a bad model or prompt release?
- What would you monitor in production?
- What would be your phase-one delivery plan?',
ARRAY['Drawing a box labeled LLM and calling it architecture.','Ignoring auth, audit, deployment, and evaluation.','Not separating model failure from retrieval, tool, product, or data failure.','Forgetting rollout, rollback, and versioning.'],
'Strong Answer: I would design the system around the user workflow and reliability target. The core components would include an API layer, authentication and authorization, orchestration, retrieval or tool access if needed, prompt/template management, model gateway, evaluation pipeline, logging/tracing, and admin controls. I would define how requests move through the system, what data is stored, how failures are handled, and how changes are tested before release. Scenario-specific implementation detail: I would begin with agent-assist mode: classify the ticket, retrieve relevant knowledge, draft a reply, and escalate when confidence, policy, or sentiment thresholds require human review. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design makes the GenAI part only one component of a governed production system. I would separate customer-facing UX, orchestration, model gateway, retrieval/tool layer, policy layer, eval layer, and observability layer. I would define tenancy, data retention, auditability, fallback modes, prompt and model versioning, and a release process using offline evals plus controlled online rollout. I would explicitly decide what must be deterministic, what can be probabilistic, and where human approval is required. I would also design for cost and latency from day one through caching, routing, streaming, token budgets, and SLOs. Senior execution detail: I would measure resolution time, deflection without quality loss, escalation correctness, customer-satisfaction impact, and incidents caused by incorrect automation. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g203', 'genai-architecture', 'A customer wants to embed GenAI into their existing Java/Spring platform. What architecture would you propose?', 'hard',
'A customer wants to embed GenAI into their existing Java/Spring platform. What architecture would you propose?

What the Interviewer Is Testing
The interviewer is testing whether you can design a production GenAI system with clear boundaries, components, data flow, model interaction, evaluation, deployment, and operational controls. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What components would you put on the critical path?
- How would you version prompts, tools, and models?
- How would you roll back a bad model or prompt release?
- What would you monitor in production?
- What would be your phase-one delivery plan?',
ARRAY['Drawing a box labeled LLM and calling it architecture.','Ignoring auth, audit, deployment, and evaluation.','Not separating model failure from retrieval, tool, product, or data failure.','Forgetting rollout, rollback, and versioning.'],
'Strong Answer: I would design the system around the user workflow and reliability target. The core components would include an API layer, authentication and authorization, orchestration, retrieval or tool access if needed, prompt/template management, model gateway, evaluation pipeline, logging/tracing, and admin controls. I would define how requests move through the system, what data is stored, how failures are handled, and how changes are tested before release. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design makes the GenAI part only one component of a governed production system. I would separate customer-facing UX, orchestration, model gateway, retrieval/tool layer, policy layer, eval layer, and observability layer. I would define tenancy, data retention, auditability, fallback modes, prompt and model versioning, and a release process using offline evals plus controlled online rollout. I would explicitly decide what must be deterministic, what can be probabilistic, and where human approval is required. I would also design for cost and latency from day one through caching, routing, streaming, token budgets, and SLOs. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g204', 'genai-architecture', 'How would you design a model gateway that supports multiple LLM providers, prompt versions, and safety controls?', 'hard',
'How would you design a model gateway that supports multiple LLM providers, prompt versions, and safety controls?

What the Interviewer Is Testing
The interviewer is testing whether you can design a production GenAI system with clear boundaries, components, data flow, model interaction, evaluation, deployment, and operational controls. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What components would you put on the critical path?
- How would you version prompts, tools, and models?
- How would you roll back a bad model or prompt release?
- What would you monitor in production?
- What would be your phase-one delivery plan?',
ARRAY['Drawing a box labeled LLM and calling it architecture.','Ignoring auth, audit, deployment, and evaluation.','Not separating model failure from retrieval, tool, product, or data failure.','Forgetting rollout, rollback, and versioning.'],
'Strong Answer: I would design the system around the user workflow and reliability target. The core components would include an API layer, authentication and authorization, orchestration, retrieval or tool access if needed, prompt/template management, model gateway, evaluation pipeline, logging/tracing, and admin controls. I would define how requests move through the system, what data is stored, how failures are handled, and how changes are tested before release. Scenario-specific implementation detail: I would begin with agent-assist mode: classify the ticket, retrieve relevant knowledge, draft a reply, and escalate when confidence, policy, or sentiment thresholds require human review. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design makes the GenAI part only one component of a governed production system. I would separate customer-facing UX, orchestration, model gateway, retrieval/tool layer, policy layer, eval layer, and observability layer. I would define tenancy, data retention, auditability, fallback modes, prompt and model versioning, and a release process using offline evals plus controlled online rollout. I would explicitly decide what must be deterministic, what can be probabilistic, and where human approval is required. I would also design for cost and latency from day one through caching, routing, streaming, token budgets, and SLOs. Senior execution detail: I would measure resolution time, deflection without quality loss, escalation correctness, customer-satisfaction impact, and incidents caused by incorrect automation. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g205', 'genai-architecture', 'Design an AI assistant that combines retrieval, deterministic business rules, and tool execution. What would you do?', 'hard',
'Design an AI assistant that combines retrieval, deterministic business rules, and tool execution. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can design a production GenAI system with clear boundaries, components, data flow, model interaction, evaluation, deployment, and operational controls. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What components would you put on the critical path?
- How would you version prompts, tools, and models?
- How would you roll back a bad model or prompt release?
- What would you monitor in production?
- What would be your phase-one delivery plan?',
ARRAY['Drawing a box labeled LLM and calling it architecture.','Ignoring auth, audit, deployment, and evaluation.','Not separating model failure from retrieval, tool, product, or data failure.','Forgetting rollout, rollback, and versioning.'],
'Strong Answer: I would design the system around the user workflow and reliability target. The core components would include an API layer, authentication and authorization, orchestration, retrieval or tool access if needed, prompt/template management, model gateway, evaluation pipeline, logging/tracing, and admin controls. I would define how requests move through the system, what data is stored, how failures are handled, and how changes are tested before release. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design makes the GenAI part only one component of a governed production system. I would separate customer-facing UX, orchestration, model gateway, retrieval/tool layer, policy layer, eval layer, and observability layer. I would define tenancy, data retention, auditability, fallback modes, prompt and model versioning, and a release process using offline evals plus controlled online rollout. I would explicitly decide what must be deterministic, what can be probabilistic, and where human approval is required. I would also design for cost and latency from day one through caching, routing, streaming, token budgets, and SLOs. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g206', 'genai-architecture', 'How would you structure prompt templates, system instructions, and model configuration for production releases?', 'hard',
'How would you structure prompt templates, system instructions, and model configuration for production releases?

What the Interviewer Is Testing
The interviewer is testing whether you can design a production GenAI system with clear boundaries, components, data flow, model interaction, evaluation, deployment, and operational controls. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What components would you put on the critical path?
- How would you version prompts, tools, and models?
- How would you roll back a bad model or prompt release?
- What would you monitor in production?
- What would be your phase-one delivery plan?',
ARRAY['Drawing a box labeled LLM and calling it architecture.','Ignoring auth, audit, deployment, and evaluation.','Not separating model failure from retrieval, tool, product, or data failure.','Forgetting rollout, rollback, and versioning.'],
'Strong Answer: I would design the system around the user workflow and reliability target. The core components would include an API layer, authentication and authorization, orchestration, retrieval or tool access if needed, prompt/template management, model gateway, evaluation pipeline, logging/tracing, and admin controls. I would define how requests move through the system, what data is stored, how failures are handled, and how changes are tested before release. Scenario-specific implementation detail: I would add authentication, authorization, evals, observability, data governance, reliability targets, runbooks, and rollback before calling the demo production-ready. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design makes the GenAI part only one component of a governed production system. I would separate customer-facing UX, orchestration, model gateway, retrieval/tool layer, policy layer, eval layer, and observability layer. I would define tenancy, data retention, auditability, fallback modes, prompt and model versioning, and a release process using offline evals plus controlled online rollout. I would explicitly decide what must be deterministic, what can be probabilistic, and where human approval is required. I would also design for cost and latency from day one through caching, routing, streaming, token budgets, and SLOs. Senior execution detail: I would communicate that production readiness means measured safety and reliability under real user workflows, not just a successful demo path. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g207', 'genai-architecture', 'Design an architecture for an internal GenAI platform used by multiple product teams. What would you do?', 'hard',
'Design an architecture for an internal GenAI platform used by multiple product teams. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can design a production GenAI system with clear boundaries, components, data flow, model interaction, evaluation, deployment, and operational controls. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What components would you put on the critical path?
- How would you version prompts, tools, and models?
- How would you roll back a bad model or prompt release?
- What would you monitor in production?
- What would be your phase-one delivery plan?',
ARRAY['Drawing a box labeled LLM and calling it architecture.','Ignoring auth, audit, deployment, and evaluation.','Not separating model failure from retrieval, tool, product, or data failure.','Forgetting rollout, rollback, and versioning.'],
'Strong Answer: I would design the system around the user workflow and reliability target. The core components would include an API layer, authentication and authorization, orchestration, retrieval or tool access if needed, prompt/template management, model gateway, evaluation pipeline, logging/tracing, and admin controls. I would define how requests move through the system, what data is stored, how failures are handled, and how changes are tested before release. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design makes the GenAI part only one component of a governed production system. I would separate customer-facing UX, orchestration, model gateway, retrieval/tool layer, policy layer, eval layer, and observability layer. I would define tenancy, data retention, auditability, fallback modes, prompt and model versioning, and a release process using offline evals plus controlled online rollout. I would explicitly decide what must be deterministic, what can be probabilistic, and where human approval is required. I would also design for cost and latency from day one through caching, routing, streaming, token budgets, and SLOs. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g208', 'genai-architecture', 'A customer needs on-premise or private-cloud deployment for sensitive documents. How would your architecture change?', 'hard',
'A customer needs on-premise or private-cloud deployment for sensitive documents. How would your architecture change?

What the Interviewer Is Testing
The interviewer is testing whether you can design a production GenAI system with clear boundaries, components, data flow, model interaction, evaluation, deployment, and operational controls. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What components would you put on the critical path?
- How would you version prompts, tools, and models?
- How would you roll back a bad model or prompt release?
- What would you monitor in production?
- What would be your phase-one delivery plan?',
ARRAY['Drawing a box labeled LLM and calling it architecture.','Ignoring auth, audit, deployment, and evaluation.','Not separating model failure from retrieval, tool, product, or data failure.','Forgetting rollout, rollback, and versioning.'],
'Strong Answer: I would design the system around the user workflow and reliability target. The core components would include an API layer, authentication and authorization, orchestration, retrieval or tool access if needed, prompt/template management, model gateway, evaluation pipeline, logging/tracing, and admin controls. I would define how requests move through the system, what data is stored, how failures are handled, and how changes are tested before release. Scenario-specific implementation detail: I would add authentication, authorization, evals, observability, data governance, reliability targets, runbooks, and rollback before calling the demo production-ready. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design makes the GenAI part only one component of a governed production system. I would separate customer-facing UX, orchestration, model gateway, retrieval/tool layer, policy layer, eval layer, and observability layer. I would define tenancy, data retention, auditability, fallback modes, prompt and model versioning, and a release process using offline evals plus controlled online rollout. I would explicitly decide what must be deterministic, what can be probabilistic, and where human approval is required. I would also design for cost and latency from day one through caching, routing, streaming, token budgets, and SLOs. Senior execution detail: I would communicate that production readiness means measured safety and reliability under real user workflows, not just a successful demo path. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g209', 'genai-architecture', 'Design a GenAI application that supports auditability for every generated answer and workflow action. What would you do?', 'hard',
'Design a GenAI application that supports auditability for every generated answer and workflow action. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can design a production GenAI system with clear boundaries, components, data flow, model interaction, evaluation, deployment, and operational controls. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What components would you put on the critical path?
- How would you version prompts, tools, and models?
- How would you roll back a bad model or prompt release?
- What would you monitor in production?
- What would be your phase-one delivery plan?',
ARRAY['Drawing a box labeled LLM and calling it architecture.','Ignoring auth, audit, deployment, and evaluation.','Not separating model failure from retrieval, tool, product, or data failure.','Forgetting rollout, rollback, and versioning.'],
'Strong Answer: I would design the system around the user workflow and reliability target. The core components would include an API layer, authentication and authorization, orchestration, retrieval or tool access if needed, prompt/template management, model gateway, evaluation pipeline, logging/tracing, and admin controls. I would define how requests move through the system, what data is stored, how failures are handled, and how changes are tested before release. Scenario-specific implementation detail: I would begin with agent-assist mode: classify the ticket, retrieve relevant knowledge, draft a reply, and escalate when confidence, policy, or sentiment thresholds require human review. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design makes the GenAI part only one component of a governed production system. I would separate customer-facing UX, orchestration, model gateway, retrieval/tool layer, policy layer, eval layer, and observability layer. I would define tenancy, data retention, auditability, fallback modes, prompt and model versioning, and a release process using offline evals plus controlled online rollout. I would explicitly decide what must be deterministic, what can be probabilistic, and where human approval is required. I would also design for cost and latency from day one through caching, routing, streaming, token budgets, and SLOs. Senior execution detail: I would measure resolution time, deflection without quality loss, escalation correctness, customer-satisfaction impact, and incidents caused by incorrect automation. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g210', 'genai-architecture', 'How would you migrate a successful demo into a production-grade enterprise deployment?', 'hard',
'How would you migrate a successful demo into a production-grade enterprise deployment?

What the Interviewer Is Testing
The interviewer is testing whether you can design a production GenAI system with clear boundaries, components, data flow, model interaction, evaluation, deployment, and operational controls. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What components would you put on the critical path?
- How would you version prompts, tools, and models?
- How would you roll back a bad model or prompt release?
- What would you monitor in production?
- What would be your phase-one delivery plan?',
ARRAY['Drawing a box labeled LLM and calling it architecture.','Ignoring auth, audit, deployment, and evaluation.','Not separating model failure from retrieval, tool, product, or data failure.','Forgetting rollout, rollback, and versioning.'],
'Strong Answer: I would design the system around the user workflow and reliability target. The core components would include an API layer, authentication and authorization, orchestration, retrieval or tool access if needed, prompt/template management, model gateway, evaluation pipeline, logging/tracing, and admin controls. I would define how requests move through the system, what data is stored, how failures are handled, and how changes are tested before release. Scenario-specific implementation detail: I would model invoice exception handling as a state machine: classify exception, gather evidence, propose resolution, request approval, execute ERP update, and record audit evidence. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior design makes the GenAI part only one component of a governed production system. I would separate customer-facing UX, orchestration, model gateway, retrieval/tool layer, policy layer, eval layer, and observability layer. I would define tenancy, data retention, auditability, fallback modes, prompt and model versioning, and a release process using offline evals plus controlled online rollout. I would explicitly decide what must be deterministic, what can be probabilistic, and where human approval is required. I would also design for cost and latency from day one through caching, routing, streaming, token budgets, and SLOs. Senior execution detail: I would protect against duplicate payments, wrong vendor updates, missing approval, partial ERP failures, and unclear financial accountability. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

-- Q21–30: RAG System Design (hard, genai-architecture)

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g211', 'genai-architecture', 'Design a RAG system over 200,000 internal documents with strict document-level permissions. What would you do?', 'hard',
'Design a RAG system over 200,000 internal documents with strict document-level permissions. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can design retrieval-augmented generation for enterprise data while handling access control, ingestion quality, citations, freshness, latency, cost, and answer evaluation. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you evaluate retrieval quality?
- How would you handle document permissions?
- How would you prevent hallucinated citations?
- What would you do when users ask questions outside the corpus?
- What would you show in a retrieval-quality dashboard?',
ARRAY['Assuming vector search alone solves enterprise search.','Ignoring document structure, metadata, and permissions.','Evaluating only final answers and not retrieval quality.','Not designing for stale or conflicting documents.'],
'Strong Answer: I would start by understanding the corpus, document ownership, update frequency, user permissions, and question types. The design would include ingestion, parsing, chunking, metadata extraction, embedding, hybrid retrieval, optional reranking, prompt construction with citations, answer generation, and evaluation against a representative set of queries. I would also add ACL filtering, freshness checks, observability for retrieval quality, and fallback behavior when evidence is insufficient. Scenario-specific implementation detail: I would design permission-aware retrieval where ACL filtering happens before the model sees context, with tenant, source, version, and document-level metadata preserved through ingestion. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior RAG design treats retrieval as a product-quality and governance problem. I would build an ingestion pipeline that preserves document structure, source metadata, version, tenant, and access rights. I would test multiple chunking and retrieval strategies using golden questions, recall@k, citation precision, answer faithfulness, latency, and cost per answer. I would require permission-aware retrieval before generation, cite exact evidence, and make the model say when the corpus does not contain enough support. I would also create operational dashboards for empty retrieval, low-confidence retrieval, stale documents, hallucination reports, and top failing query clusters. Senior execution detail: I would test leakage attempts, indirect prompt injection, stale documents, and retrieval recall by permission segment before allowing customer-wide rollout. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g212', 'genai-architecture', 'How would you choose chunking, metadata, and retrieval strategy for long policy documents?', 'hard',
'How would you choose chunking, metadata, and retrieval strategy for long policy documents?

What the Interviewer Is Testing
The interviewer is testing whether you can design retrieval-augmented generation for enterprise data while handling access control, ingestion quality, citations, freshness, latency, cost, and answer evaluation. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you evaluate retrieval quality?
- How would you handle document permissions?
- How would you prevent hallucinated citations?
- What would you do when users ask questions outside the corpus?
- What would you show in a retrieval-quality dashboard?',
ARRAY['Assuming vector search alone solves enterprise search.','Ignoring document structure, metadata, and permissions.','Evaluating only final answers and not retrieval quality.','Not designing for stale or conflicting documents.'],
'Strong Answer: I would start by understanding the corpus, document ownership, update frequency, user permissions, and question types. The design would include ingestion, parsing, chunking, metadata extraction, embedding, hybrid retrieval, optional reranking, prompt construction with citations, answer generation, and evaluation against a representative set of queries. I would also add ACL filtering, freshness checks, observability for retrieval quality, and fallback behavior when evidence is insufficient. Scenario-specific implementation detail: I would preserve heading hierarchy, tables, section numbers, effective dates, and metadata during parsing, then compare chunk sizes and overlap against real question types. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior RAG design treats retrieval as a product-quality and governance problem. I would build an ingestion pipeline that preserves document structure, source metadata, version, tenant, and access rights. I would test multiple chunking and retrieval strategies using golden questions, recall@k, citation precision, answer faithfulness, latency, and cost per answer. I would require permission-aware retrieval before generation, cite exact evidence, and make the model say when the corpus does not contain enough support. I would also create operational dashboards for empty retrieval, low-confidence retrieval, stale documents, hallucination reports, and top failing query clusters. Senior execution detail: I would optimize for evidence recall and citation usefulness, not just embedding similarity, and keep a regression set for policy and edge-case questions. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g213', 'genai-architecture', 'A RAG assistant gives plausible answers but often cites irrelevant sources. How would you fix it?', 'hard',
'A RAG assistant gives plausible answers but often cites irrelevant sources. How would you fix it?

What the Interviewer Is Testing
The interviewer is testing whether you can design retrieval-augmented generation for enterprise data while handling access control, ingestion quality, citations, freshness, latency, cost, and answer evaluation. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you evaluate retrieval quality?
- How would you handle document permissions?
- How would you prevent hallucinated citations?
- What would you do when users ask questions outside the corpus?
- What would you show in a retrieval-quality dashboard?',
ARRAY['Assuming vector search alone solves enterprise search.','Ignoring document structure, metadata, and permissions.','Evaluating only final answers and not retrieval quality.','Not designing for stale or conflicting documents.'],
'Strong Answer: I would start by understanding the corpus, document ownership, update frequency, user permissions, and question types. The design would include ingestion, parsing, chunking, metadata extraction, embedding, hybrid retrieval, optional reranking, prompt construction with citations, answer generation, and evaluation against a representative set of queries. I would also add ACL filtering, freshness checks, observability for retrieval quality, and fallback behavior when evidence is insufficient. Scenario-specific implementation detail: I would generate citations from retrieved evidence IDs, not from free-form model text, and verify that every cited span supports the claim made in the answer. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior RAG design treats retrieval as a product-quality and governance problem. I would build an ingestion pipeline that preserves document structure, source metadata, version, tenant, and access rights. I would test multiple chunking and retrieval strategies using golden questions, recall@k, citation precision, answer faithfulness, latency, and cost per answer. I would require permission-aware retrieval before generation, cite exact evidence, and make the model say when the corpus does not contain enough support. I would also create operational dashboards for empty retrieval, low-confidence retrieval, stale documents, hallucination reports, and top failing query clusters. Senior execution detail: I would monitor unsupported claims, citation precision, source freshness, and reviewer-disputed citations as production quality metrics. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g214', 'genai-architecture', 'Design a RAG system that handles frequently updated documents and conflicting versions. What would you do?', 'hard',
'Design a RAG system that handles frequently updated documents and conflicting versions. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can design retrieval-augmented generation for enterprise data while handling access control, ingestion quality, citations, freshness, latency, cost, and answer evaluation. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you evaluate retrieval quality?
- How would you handle document permissions?
- How would you prevent hallucinated citations?
- What would you do when users ask questions outside the corpus?
- What would you show in a retrieval-quality dashboard?',
ARRAY['Assuming vector search alone solves enterprise search.','Ignoring document structure, metadata, and permissions.','Evaluating only final answers and not retrieval quality.','Not designing for stale or conflicting documents.'],
'Strong Answer: I would start by understanding the corpus, document ownership, update frequency, user permissions, and question types. The design would include ingestion, parsing, chunking, metadata extraction, embedding, hybrid retrieval, optional reranking, prompt construction with citations, answer generation, and evaluation against a representative set of queries. I would also add ACL filtering, freshness checks, observability for retrieval quality, and fallback behavior when evidence is insufficient. Scenario-specific implementation detail: I would store document version, effective date, ingestion timestamp, owner, and supersession relationships, then prefer current authoritative sources during retrieval. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior RAG design treats retrieval as a product-quality and governance problem. I would build an ingestion pipeline that preserves document structure, source metadata, version, tenant, and access rights. I would test multiple chunking and retrieval strategies using golden questions, recall@k, citation precision, answer faithfulness, latency, and cost per answer. I would require permission-aware retrieval before generation, cite exact evidence, and make the model say when the corpus does not contain enough support. I would also create operational dashboards for empty retrieval, low-confidence retrieval, stale documents, hallucination reports, and top failing query clusters. Senior execution detail: I would alert on ingestion lag, conflicting policy versions, high usage of deprecated documents, and answers generated from stale evidence. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g215', 'genai-architecture', 'How would you evaluate whether hybrid search is better than vector-only search for a customer corpus?', 'hard',
'How would you evaluate whether hybrid search is better than vector-only search for a customer corpus?

What the Interviewer Is Testing
The interviewer is testing whether you can design retrieval-augmented generation for enterprise data while handling access control, ingestion quality, citations, freshness, latency, cost, and answer evaluation. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you evaluate retrieval quality?
- How would you handle document permissions?
- How would you prevent hallucinated citations?
- What would you do when users ask questions outside the corpus?
- What would you show in a retrieval-quality dashboard?',
ARRAY['Assuming vector search alone solves enterprise search.','Ignoring document structure, metadata, and permissions.','Evaluating only final answers and not retrieval quality.','Not designing for stale or conflicting documents.'],
'Strong Answer: I would start by understanding the corpus, document ownership, update frequency, user permissions, and question types. The design would include ingestion, parsing, chunking, metadata extraction, embedding, hybrid retrieval, optional reranking, prompt construction with citations, answer generation, and evaluation against a representative set of queries. I would also add ACL filtering, freshness checks, observability for retrieval quality, and fallback behavior when evidence is insufficient. Scenario-specific implementation detail: I would compare keyword, vector, hybrid, and reranked retrieval on the same golden query set, including exact code names, acronyms, policy references, and semantic questions. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior RAG design treats retrieval as a product-quality and governance problem. I would build an ingestion pipeline that preserves document structure, source metadata, version, tenant, and access rights. I would test multiple chunking and retrieval strategies using golden questions, recall@k, citation precision, answer faithfulness, latency, and cost per answer. I would require permission-aware retrieval before generation, cite exact evidence, and make the model say when the corpus does not contain enough support. I would also create operational dashboards for empty retrieval, low-confidence retrieval, stale documents, hallucination reports, and top failing query clusters. Senior execution detail: I would choose the retrieval stack based on measured recall, precision, latency, explainability, and operational complexity for that customer corpus. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g216', 'genai-architecture', 'A customer wants citations that legal reviewers can trust. How would you design citation handling?', 'hard',
'A customer wants citations that legal reviewers can trust. How would you design citation handling?

What the Interviewer Is Testing
The interviewer is testing whether you can design retrieval-augmented generation for enterprise data while handling access control, ingestion quality, citations, freshness, latency, cost, and answer evaluation. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you evaluate retrieval quality?
- How would you handle document permissions?
- How would you prevent hallucinated citations?
- What would you do when users ask questions outside the corpus?
- What would you show in a retrieval-quality dashboard?',
ARRAY['Assuming vector search alone solves enterprise search.','Ignoring document structure, metadata, and permissions.','Evaluating only final answers and not retrieval quality.','Not designing for stale or conflicting documents.'],
'Strong Answer: I would start by understanding the corpus, document ownership, update frequency, user permissions, and question types. The design would include ingestion, parsing, chunking, metadata extraction, embedding, hybrid retrieval, optional reranking, prompt construction with citations, answer generation, and evaluation against a representative set of queries. I would also add ACL filtering, freshness checks, observability for retrieval quality, and fallback behavior when evidence is insufficient. Scenario-specific implementation detail: I would narrow the use case to clause extraction, risk highlighting, comparison with playbooks, and reviewer notes, rather than pretending the system can replace legal judgment. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior RAG design treats retrieval as a product-quality and governance problem. I would build an ingestion pipeline that preserves document structure, source metadata, version, tenant, and access rights. I would test multiple chunking and retrieval strategies using golden questions, recall@k, citation precision, answer faithfulness, latency, and cost per answer. I would require permission-aware retrieval before generation, cite exact evidence, and make the model say when the corpus does not contain enough support. I would also create operational dashboards for empty retrieval, low-confidence retrieval, stale documents, hallucination reports, and top failing query clusters. Senior execution detail: I would require source-grounded output, versioned playbooks, privilege-aware document handling, reviewer sign-off, and measurement against lawyer-reviewed examples. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g217', 'genai-architecture', 'Design multi-tenant RAG for customers with isolated data and different embedding/index configurations. What would you do?', 'hard',
'Design multi-tenant RAG for customers with isolated data and different embedding/index configurations. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can design retrieval-augmented generation for enterprise data while handling access control, ingestion quality, citations, freshness, latency, cost, and answer evaluation. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you evaluate retrieval quality?
- How would you handle document permissions?
- How would you prevent hallucinated citations?
- What would you do when users ask questions outside the corpus?
- What would you show in a retrieval-quality dashboard?',
ARRAY['Assuming vector search alone solves enterprise search.','Ignoring document structure, metadata, and permissions.','Evaluating only final answers and not retrieval quality.','Not designing for stale or conflicting documents.'],
'Strong Answer: I would start by understanding the corpus, document ownership, update frequency, user permissions, and question types. The design would include ingestion, parsing, chunking, metadata extraction, embedding, hybrid retrieval, optional reranking, prompt construction with citations, answer generation, and evaluation against a representative set of queries. I would also add ACL filtering, freshness checks, observability for retrieval quality, and fallback behavior when evidence is insufficient. Scenario-specific implementation detail: I would enforce access control and policy outside the model, minimize sensitive data in prompts, redact logs, and treat retrieved content and tool outputs as untrusted. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior RAG design treats retrieval as a product-quality and governance problem. I would build an ingestion pipeline that preserves document structure, source metadata, version, tenant, and access rights. I would test multiple chunking and retrieval strategies using golden questions, recall@k, citation precision, answer faithfulness, latency, and cost per answer. I would require permission-aware retrieval before generation, cite exact evidence, and make the model say when the corpus does not contain enough support. I would also create operational dashboards for empty retrieval, low-confidence retrieval, stale documents, hallucination reports, and top failing query clusters. Senior execution detail: I would prepare threat models for data leakage, indirect prompt injection, privilege escalation, overbroad tool tokens, and cross-tenant retrieval mistakes. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g218', 'genai-architecture', 'How would you design RAG for tabular, PDF, image-heavy, and semi-structured documents?', 'hard',
'How would you design RAG for tabular, PDF, image-heavy, and semi-structured documents?

What the Interviewer Is Testing
The interviewer is testing whether you can design retrieval-augmented generation for enterprise data while handling access control, ingestion quality, citations, freshness, latency, cost, and answer evaluation. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you evaluate retrieval quality?
- How would you handle document permissions?
- How would you prevent hallucinated citations?
- What would you do when users ask questions outside the corpus?
- What would you show in a retrieval-quality dashboard?',
ARRAY['Assuming vector search alone solves enterprise search.','Ignoring document structure, metadata, and permissions.','Evaluating only final answers and not retrieval quality.','Not designing for stale or conflicting documents.'],
'Strong Answer: I would start by understanding the corpus, document ownership, update frequency, user permissions, and question types. The design would include ingestion, parsing, chunking, metadata extraction, embedding, hybrid retrieval, optional reranking, prompt construction with citations, answer generation, and evaluation against a representative set of queries. I would also add ACL filtering, freshness checks, observability for retrieval quality, and fallback behavior when evidence is insufficient. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior RAG design treats retrieval as a product-quality and governance problem. I would build an ingestion pipeline that preserves document structure, source metadata, version, tenant, and access rights. I would test multiple chunking and retrieval strategies using golden questions, recall@k, citation precision, answer faithfulness, latency, and cost per answer. I would require permission-aware retrieval before generation, cite exact evidence, and make the model say when the corpus does not contain enough support. I would also create operational dashboards for empty retrieval, low-confidence retrieval, stale documents, hallucination reports, and top failing query clusters. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g219', 'genai-architecture', 'A RAG system has good demos but poor production performance for real users. How do you diagnose it?', 'hard',
'A RAG system has good demos but poor production performance for real users. How do you diagnose it?

What the Interviewer Is Testing
The interviewer is testing whether you can design retrieval-augmented generation for enterprise data while handling access control, ingestion quality, citations, freshness, latency, cost, and answer evaluation. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you evaluate retrieval quality?
- How would you handle document permissions?
- How would you prevent hallucinated citations?
- What would you do when users ask questions outside the corpus?
- What would you show in a retrieval-quality dashboard?',
ARRAY['Assuming vector search alone solves enterprise search.','Ignoring document structure, metadata, and permissions.','Evaluating only final answers and not retrieval quality.','Not designing for stale or conflicting documents.'],
'Strong Answer: I would start by understanding the corpus, document ownership, update frequency, user permissions, and question types. The design would include ingestion, parsing, chunking, metadata extraction, embedding, hybrid retrieval, optional reranking, prompt construction with citations, answer generation, and evaluation against a representative set of queries. I would also add ACL filtering, freshness checks, observability for retrieval quality, and fallback behavior when evidence is insufficient. Scenario-specific implementation detail: I would add authentication, authorization, evals, observability, data governance, reliability targets, runbooks, and rollback before calling the demo production-ready. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior RAG design treats retrieval as a product-quality and governance problem. I would build an ingestion pipeline that preserves document structure, source metadata, version, tenant, and access rights. I would test multiple chunking and retrieval strategies using golden questions, recall@k, citation precision, answer faithfulness, latency, and cost per answer. I would require permission-aware retrieval before generation, cite exact evidence, and make the model say when the corpus does not contain enough support. I would also create operational dashboards for empty retrieval, low-confidence retrieval, stale documents, hallucination reports, and top failing query clusters. Senior execution detail: I would communicate that production readiness means measured safety and reliability under real user workflows, not just a successful demo path. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g220', 'genai-architecture', 'How would you handle queries where the answer is not present in the knowledge base?', 'hard',
'How would you handle queries where the answer is not present in the knowledge base?

What the Interviewer Is Testing
The interviewer is testing whether you can design retrieval-augmented generation for enterprise data while handling access control, ingestion quality, citations, freshness, latency, cost, and answer evaluation. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- How would you evaluate retrieval quality?
- How would you handle document permissions?
- How would you prevent hallucinated citations?
- What would you do when users ask questions outside the corpus?
- What would you show in a retrieval-quality dashboard?',
ARRAY['Assuming vector search alone solves enterprise search.','Ignoring document structure, metadata, and permissions.','Evaluating only final answers and not retrieval quality.','Not designing for stale or conflicting documents.'],
'Strong Answer: I would start by understanding the corpus, document ownership, update frequency, user permissions, and question types. The design would include ingestion, parsing, chunking, metadata extraction, embedding, hybrid retrieval, optional reranking, prompt construction with citations, answer generation, and evaluation against a representative set of queries. I would also add ACL filtering, freshness checks, observability for retrieval quality, and fallback behavior when evidence is insufficient. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior RAG design treats retrieval as a product-quality and governance problem. I would build an ingestion pipeline that preserves document structure, source metadata, version, tenant, and access rights. I would test multiple chunking and retrieval strategies using golden questions, recall@k, citation precision, answer faithfulness, latency, and cost per answer. I would require permission-aware retrieval before generation, cite exact evidence, and make the model say when the corpus does not contain enough support. I would also create operational dashboards for empty retrieval, low-confidence retrieval, stale documents, hallucination reports, and top failing query clusters. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

-- Q31–40: Agentic Workflows (hard, genai-architecture)

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g221', 'genai-architecture', 'Design an agent that triages support tickets, searches knowledge, drafts replies, and escalates risky cases. What would you do?', 'hard',
'Design an agent that triages support tickets, searches knowledge, drafts replies, and escalates risky cases. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can design agents as controlled workflow systems with tools, state, permissions, approvals, failure handling, observability, and rollback strategies. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- When would you avoid using an agent?
- How would you secure tool access?
- How would you design human approval?
- How would you debug a failed multi-step agent run?
- What is the safest first production mode for this agent?',
ARRAY['Letting the model freely decide dangerous actions.','Skipping approval gates and audit trails.','Using agents where a deterministic workflow is enough.','Not planning for partial failure or rollback.'],
'Strong Answer: I would first decide whether an agent is needed or whether a deterministic workflow is safer. If an agent is justified, I would constrain its tools, define allowed actions, keep state explicit, add permission checks before tool execution, and require human approval for high-impact actions. I would monitor tool calls, failures, latency, and user overrides. Scenario-specific implementation detail: I would begin with agent-assist mode: classify the ticket, retrieve relevant knowledge, draft a reply, and escalate when confidence, policy, or sentiment thresholds require human review. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer treats agents as bounded automation, not magic autonomy. I would model the workflow as states, tools, policies, approval gates, audit logs, and compensation actions. The agent should plan only within a permitted action space, with input validation, tool-specific authorization, rate limits, idempotency, and safe rollback. I would start with recommendation mode, then assisted execution, then limited automation after production evidence shows acceptable error rates. I would track task success, tool error rate, escalation rate, approval rate, cost per completed task, and incidents caused by wrong actions. Senior execution detail: I would measure resolution time, deflection without quality loss, escalation correctness, customer-satisfaction impact, and incidents caused by incorrect automation. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g222', 'genai-architecture', 'A customer wants an agent to update CRM records after meetings. How would you make it safe?', 'hard',
'A customer wants an agent to update CRM records after meetings. How would you make it safe?

What the Interviewer Is Testing
The interviewer is testing whether you can design agents as controlled workflow systems with tools, state, permissions, approvals, failure handling, observability, and rollback strategies. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- When would you avoid using an agent?
- How would you secure tool access?
- How would you design human approval?
- How would you debug a failed multi-step agent run?
- What is the safest first production mode for this agent?',
ARRAY['Letting the model freely decide dangerous actions.','Skipping approval gates and audit trails.','Using agents where a deterministic workflow is enough.','Not planning for partial failure or rollback.'],
'Strong Answer: I would first decide whether an agent is needed or whether a deterministic workflow is safer. If an agent is justified, I would constrain its tools, define allowed actions, keep state explicit, add permission checks before tool execution, and require human approval for high-impact actions. I would monitor tool calls, failures, latency, and user overrides. Scenario-specific implementation detail: I would start in draft mode: summarize calls, propose CRM field updates, show evidence, and require the account owner to approve writes before any Salesforce update. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer treats agents as bounded automation, not magic autonomy. I would model the workflow as states, tools, policies, approval gates, audit logs, and compensation actions. The agent should plan only within a permitted action space, with input validation, tool-specific authorization, rate limits, idempotency, and safe rollback. I would start with recommendation mode, then assisted execution, then limited automation after production evidence shows acceptable error rates. I would track task success, tool error rate, escalation rate, approval rate, cost per completed task, and incidents caused by wrong actions. Senior execution detail: I would add field-level permissions, idempotent updates, audit logs, rollback for wrong writes, and metrics such as accepted update rate and manual cleanup rate. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g223', 'genai-architecture', 'Design an agentic workflow for invoice exception handling with human approval. What would you do?', 'hard',
'Design an agentic workflow for invoice exception handling with human approval. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can design agents as controlled workflow systems with tools, state, permissions, approvals, failure handling, observability, and rollback strategies. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- When would you avoid using an agent?
- How would you secure tool access?
- How would you design human approval?
- How would you debug a failed multi-step agent run?
- What is the safest first production mode for this agent?',
ARRAY['Letting the model freely decide dangerous actions.','Skipping approval gates and audit trails.','Using agents where a deterministic workflow is enough.','Not planning for partial failure or rollback.'],
'Strong Answer: I would first decide whether an agent is needed or whether a deterministic workflow is safer. If an agent is justified, I would constrain its tools, define allowed actions, keep state explicit, add permission checks before tool execution, and require human approval for high-impact actions. I would monitor tool calls, failures, latency, and user overrides. Scenario-specific implementation detail: I would model invoice exception handling as a state machine: classify exception, gather evidence, propose resolution, request approval, execute ERP update, and record audit evidence. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer treats agents as bounded automation, not magic autonomy. I would model the workflow as states, tools, policies, approval gates, audit logs, and compensation actions. The agent should plan only within a permitted action space, with input validation, tool-specific authorization, rate limits, idempotency, and safe rollback. I would start with recommendation mode, then assisted execution, then limited automation after production evidence shows acceptable error rates. I would track task success, tool error rate, escalation rate, approval rate, cost per completed task, and incidents caused by wrong actions. Senior execution detail: I would protect against duplicate payments, wrong vendor updates, missing approval, partial ERP failures, and unclear financial accountability. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g224', 'genai-architecture', 'How would you prevent an agent from taking unauthorized actions through tools?', 'hard',
'How would you prevent an agent from taking unauthorized actions through tools?

What the Interviewer Is Testing
The interviewer is testing whether you can design agents as controlled workflow systems with tools, state, permissions, approvals, failure handling, observability, and rollback strategies. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- When would you avoid using an agent?
- How would you secure tool access?
- How would you design human approval?
- How would you debug a failed multi-step agent run?
- What is the safest first production mode for this agent?',
ARRAY['Letting the model freely decide dangerous actions.','Skipping approval gates and audit trails.','Using agents where a deterministic workflow is enough.','Not planning for partial failure or rollback.'],
'Strong Answer: I would first decide whether an agent is needed or whether a deterministic workflow is safer. If an agent is justified, I would constrain its tools, define allowed actions, keep state explicit, add permission checks before tool execution, and require human approval for high-impact actions. I would monitor tool calls, failures, latency, and user overrides. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer treats agents as bounded automation, not magic autonomy. I would model the workflow as states, tools, policies, approval gates, audit logs, and compensation actions. The agent should plan only within a permitted action space, with input validation, tool-specific authorization, rate limits, idempotency, and safe rollback. I would start with recommendation mode, then assisted execution, then limited automation after production evidence shows acceptable error rates. I would track task success, tool error rate, escalation rate, approval rate, cost per completed task, and incidents caused by wrong actions. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g225', 'genai-architecture', 'Design a multi-step research agent for sales teams that gathers account context and drafts a briefing. What would you do?', 'hard',
'Design a multi-step research agent for sales teams that gathers account context and drafts a briefing. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can design agents as controlled workflow systems with tools, state, permissions, approvals, failure handling, observability, and rollback strategies. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- When would you avoid using an agent?
- How would you secure tool access?
- How would you design human approval?
- How would you debug a failed multi-step agent run?
- What is the safest first production mode for this agent?',
ARRAY['Letting the model freely decide dangerous actions.','Skipping approval gates and audit trails.','Using agents where a deterministic workflow is enough.','Not planning for partial failure or rollback.'],
'Strong Answer: I would first decide whether an agent is needed or whether a deterministic workflow is safer. If an agent is justified, I would constrain its tools, define allowed actions, keep state explicit, add permission checks before tool execution, and require human approval for high-impact actions. I would monitor tool calls, failures, latency, and user overrides. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer treats agents as bounded automation, not magic autonomy. I would model the workflow as states, tools, policies, approval gates, audit logs, and compensation actions. The agent should plan only within a permitted action space, with input validation, tool-specific authorization, rate limits, idempotency, and safe rollback. I would start with recommendation mode, then assisted execution, then limited automation after production evidence shows acceptable error rates. I would track task success, tool error rate, escalation rate, approval rate, cost per completed task, and incidents caused by wrong actions. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g226', 'genai-architecture', 'When would you choose a deterministic workflow instead of an agent?', 'hard',
'When would you choose a deterministic workflow instead of an agent?

What the Interviewer Is Testing
The interviewer is testing whether you can design agents as controlled workflow systems with tools, state, permissions, approvals, failure handling, observability, and rollback strategies. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- When would you avoid using an agent?
- How would you secure tool access?
- How would you design human approval?
- How would you debug a failed multi-step agent run?
- What is the safest first production mode for this agent?',
ARRAY['Letting the model freely decide dangerous actions.','Skipping approval gates and audit trails.','Using agents where a deterministic workflow is enough.','Not planning for partial failure or rollback.'],
'Strong Answer: I would first decide whether an agent is needed or whether a deterministic workflow is safer. If an agent is justified, I would constrain its tools, define allowed actions, keep state explicit, add permission checks before tool execution, and require human approval for high-impact actions. I would monitor tool calls, failures, latency, and user overrides. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer treats agents as bounded automation, not magic autonomy. I would model the workflow as states, tools, policies, approval gates, audit logs, and compensation actions. The agent should plan only within a permitted action space, with input validation, tool-specific authorization, rate limits, idempotency, and safe rollback. I would start with recommendation mode, then assisted execution, then limited automation after production evidence shows acceptable error rates. I would track task success, tool error rate, escalation rate, approval rate, cost per completed task, and incidents caused by wrong actions. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g227', 'genai-architecture', 'How would you implement memory for an enterprise agent without creating privacy or correctness problems?', 'hard',
'How would you implement memory for an enterprise agent without creating privacy or correctness problems?

What the Interviewer Is Testing
The interviewer is testing whether you can design agents as controlled workflow systems with tools, state, permissions, approvals, failure handling, observability, and rollback strategies. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- When would you avoid using an agent?
- How would you secure tool access?
- How would you design human approval?
- How would you debug a failed multi-step agent run?
- What is the safest first production mode for this agent?',
ARRAY['Letting the model freely decide dangerous actions.','Skipping approval gates and audit trails.','Using agents where a deterministic workflow is enough.','Not planning for partial failure or rollback.'],
'Strong Answer: I would first decide whether an agent is needed or whether a deterministic workflow is safer. If an agent is justified, I would constrain its tools, define allowed actions, keep state explicit, add permission checks before tool execution, and require human approval for high-impact actions. I would monitor tool calls, failures, latency, and user overrides. Scenario-specific implementation detail: I would model invoice exception handling as a state machine: classify exception, gather evidence, propose resolution, request approval, execute ERP update, and record audit evidence. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer treats agents as bounded automation, not magic autonomy. I would model the workflow as states, tools, policies, approval gates, audit logs, and compensation actions. The agent should plan only within a permitted action space, with input validation, tool-specific authorization, rate limits, idempotency, and safe rollback. I would start with recommendation mode, then assisted execution, then limited automation after production evidence shows acceptable error rates. I would track task success, tool error rate, escalation rate, approval rate, cost per completed task, and incidents caused by wrong actions. Senior execution detail: I would protect against duplicate payments, wrong vendor updates, missing approval, partial ERP failures, and unclear financial accountability. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g228', 'genai-architecture', 'An agent gets stuck in loops and calls tools repeatedly. How would you fix the design?', 'hard',
'An agent gets stuck in loops and calls tools repeatedly. How would you fix the design?

What the Interviewer Is Testing
The interviewer is testing whether you can design agents as controlled workflow systems with tools, state, permissions, approvals, failure handling, observability, and rollback strategies. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- When would you avoid using an agent?
- How would you secure tool access?
- How would you design human approval?
- How would you debug a failed multi-step agent run?
- What is the safest first production mode for this agent?',
ARRAY['Letting the model freely decide dangerous actions.','Skipping approval gates and audit trails.','Using agents where a deterministic workflow is enough.','Not planning for partial failure or rollback.'],
'Strong Answer: I would first decide whether an agent is needed or whether a deterministic workflow is safer. If an agent is justified, I would constrain its tools, define allowed actions, keep state explicit, add permission checks before tool execution, and require human approval for high-impact actions. I would monitor tool calls, failures, latency, and user overrides. Scenario-specific implementation detail: I would add explicit step limits, loop detection, tool-call budgets, failure-state transitions, and deterministic stop conditions. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer treats agents as bounded automation, not magic autonomy. I would model the workflow as states, tools, policies, approval gates, audit logs, and compensation actions. The agent should plan only within a permitted action space, with input validation, tool-specific authorization, rate limits, idempotency, and safe rollback. I would start with recommendation mode, then assisted execution, then limited automation after production evidence shows acceptable error rates. I would track task success, tool error rate, escalation rate, approval rate, cost per completed task, and incidents caused by wrong actions. Senior execution detail: I would analyze traces to see whether loops come from bad planning, bad tool feedback, missing state, or unclear success criteria, then add regression tests for those cases. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g229', 'genai-architecture', 'Design an approval and rollback strategy for an agent that can create customer-facing messages. What would you do?', 'hard',
'Design an approval and rollback strategy for an agent that can create customer-facing messages. What would you do?

What the Interviewer Is Testing
The interviewer is testing whether you can design agents as controlled workflow systems with tools, state, permissions, approvals, failure handling, observability, and rollback strategies. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- When would you avoid using an agent?
- How would you secure tool access?
- How would you design human approval?
- How would you debug a failed multi-step agent run?
- What is the safest first production mode for this agent?',
ARRAY['Letting the model freely decide dangerous actions.','Skipping approval gates and audit trails.','Using agents where a deterministic workflow is enough.','Not planning for partial failure or rollback.'],
'Strong Answer: I would first decide whether an agent is needed or whether a deterministic workflow is safer. If an agent is justified, I would constrain its tools, define allowed actions, keep state explicit, add permission checks before tool execution, and require human approval for high-impact actions. I would monitor tool calls, failures, latency, and user overrides. Scenario-specific implementation detail: I would keep the agent in draft-and-review mode for customer-facing communication, with tone checks, policy checks, and source-backed claims. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer treats agents as bounded automation, not magic autonomy. I would model the workflow as states, tools, policies, approval gates, audit logs, and compensation actions. The agent should plan only within a permitted action space, with input validation, tool-specific authorization, rate limits, idempotency, and safe rollback. I would start with recommendation mode, then assisted execution, then limited automation after production evidence shows acceptable error rates. I would track task success, tool error rate, escalation rate, approval rate, cost per completed task, and incidents caused by wrong actions. Senior execution detail: I would require approval for sensitive cases, log why a draft was generated, and track complaint rate, edits required, and policy violations. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g230', 'genai-architecture', 'How would you monitor and evaluate agent task success in production?', 'hard',
'How would you monitor and evaluate agent task success in production?

What the Interviewer Is Testing
The interviewer is testing whether you can design agents as controlled workflow systems with tools, state, permissions, approvals, failure handling, observability, and rollback strategies. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- When would you avoid using an agent?
- How would you secure tool access?
- How would you design human approval?
- How would you debug a failed multi-step agent run?
- What is the safest first production mode for this agent?',
ARRAY['Letting the model freely decide dangerous actions.','Skipping approval gates and audit trails.','Using agents where a deterministic workflow is enough.','Not planning for partial failure or rollback.'],
'Strong Answer: I would first decide whether an agent is needed or whether a deterministic workflow is safer. If an agent is justified, I would constrain its tools, define allowed actions, keep state explicit, add permission checks before tool execution, and require human approval for high-impact actions. I would monitor tool calls, failures, latency, and user overrides. Scenario-specific implementation detail: I would build dashboards that connect engineering signals to user impact: quality, retrieval, latency, cost, errors, feedback, escalation, and adoption. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer treats agents as bounded automation, not magic autonomy. I would model the workflow as states, tools, policies, approval gates, audit logs, and compensation actions. The agent should plan only within a permitted action space, with input validation, tool-specific authorization, rate limits, idempotency, and safe rollback. I would start with recommendation mode, then assisted execution, then limited automation after production evidence shows acceptable error rates. I would track task success, tool error rate, escalation rate, approval rate, cost per completed task, and incidents caused by wrong actions. Senior execution detail: I would make dashboards actionable by showing stage-level traces and version changes so teams can distinguish data, retrieval, prompt, model, tool, and workflow failures. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

-- Q41–50: Evaluation and Quality (medium, genai-architecture)

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g231', 'genai-architecture', 'How would you design an evaluation framework for a GenAI FDE customer solution before production?', 'medium',
'How would you design an evaluation framework for a GenAI FDE customer solution before production?

What the Interviewer Is Testing
The interviewer is testing whether you can measure GenAI quality beyond demos using representative datasets, automated and human evaluation, production feedback, and release gates. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics would you use for answer quality?
- How would you build a golden dataset?
- How would you evaluate hallucination risk?
- How would you prevent eval overfitting?
- What would block release even if the demo looks good?',
ARRAY['Relying only on subjective demos.','Confusing model quality with system quality.','Ignoring negative tests and edge cases.','Not using evals as release gates.'],
'Strong Answer: I would create a golden evaluation set from real user tasks, edge cases, negative examples, and high-risk scenarios. I would measure retrieval quality, answer correctness, faithfulness, refusal behavior, latency, and cost. I would combine automated scoring with human review for ambiguous or business-critical answers and use the eval results as a release gate for prompts, models, and retrieval changes. Scenario-specific implementation detail: I would construct the eval set from real tasks, domain-expert examples, edge cases, negative tests, and high-risk policy scenarios. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer makes evaluation part of the product lifecycle. I would define task-specific metrics such as groundedness, citation precision, action correctness, escalation appropriateness, and business outcome metrics like time saved or case resolution rate. I would segment evaluation by customer, document type, user persona, language, and risk level. In production, I would add sampling, red-team tests, regression suites, feedback loops, and incident review. No prompt, model, chunking, or tool change should ship without passing the relevant eval suite and rollback criteria. Senior execution detail: I would protect the eval from leakage and overfitting, maintain it as the product changes, and combine automated metrics with calibrated human review. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g232', 'genai-architecture', 'A customer says the assistant is wrong 10 percent of the time. How would you define and measure wrong?', 'medium',
'A customer says the assistant is wrong 10 percent of the time. How would you define and measure wrong?

What the Interviewer Is Testing
The interviewer is testing whether you can measure GenAI quality beyond demos using representative datasets, automated and human evaluation, production feedback, and release gates. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics would you use for answer quality?
- How would you build a golden dataset?
- How would you evaluate hallucination risk?
- How would you prevent eval overfitting?
- What would block release even if the demo looks good?',
ARRAY['Relying only on subjective demos.','Confusing model quality with system quality.','Ignoring negative tests and edge cases.','Not using evals as release gates.'],
'Strong Answer: I would create a golden evaluation set from real user tasks, edge cases, negative examples, and high-risk scenarios. I would measure retrieval quality, answer correctness, faithfulness, refusal behavior, latency, and cost. I would combine automated scoring with human review for ambiguous or business-critical answers and use the eval results as a release gate for prompts, models, and retrieval changes. Scenario-specific implementation detail: I would separate answer correctness, retrieval relevance, grounding, refusal correctness, and user usefulness instead of treating quality as one vague metric. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer makes evaluation part of the product lifecycle. I would define task-specific metrics such as groundedness, citation precision, action correctness, escalation appropriateness, and business outcome metrics like time saved or case resolution rate. I would segment evaluation by customer, document type, user persona, language, and risk level. In production, I would add sampling, red-team tests, regression suites, feedback loops, and incident review. No prompt, model, chunking, or tool change should ship without passing the relevant eval suite and rollback criteria. Senior execution detail: I would build a regression suite from real failures and require new releases to pass quality gates by scenario, customer segment, and risk tier. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g233', 'genai-architecture', 'How would you build a golden dataset for a RAG-based enterprise assistant?', 'medium',
'How would you build a golden dataset for a RAG-based enterprise assistant?

What the Interviewer Is Testing
The interviewer is testing whether you can measure GenAI quality beyond demos using representative datasets, automated and human evaluation, production feedback, and release gates. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics would you use for answer quality?
- How would you build a golden dataset?
- How would you evaluate hallucination risk?
- How would you prevent eval overfitting?
- What would block release even if the demo looks good?',
ARRAY['Relying only on subjective demos.','Confusing model quality with system quality.','Ignoring negative tests and edge cases.','Not using evals as release gates.'],
'Strong Answer: I would create a golden evaluation set from real user tasks, edge cases, negative examples, and high-risk scenarios. I would measure retrieval quality, answer correctness, faithfulness, refusal behavior, latency, and cost. I would combine automated scoring with human review for ambiguous or business-critical answers and use the eval results as a release gate for prompts, models, and retrieval changes. Scenario-specific implementation detail: I would model invoice exception handling as a state machine: classify exception, gather evidence, propose resolution, request approval, execute ERP update, and record audit evidence. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer makes evaluation part of the product lifecycle. I would define task-specific metrics such as groundedness, citation precision, action correctness, escalation appropriateness, and business outcome metrics like time saved or case resolution rate. I would segment evaluation by customer, document type, user persona, language, and risk level. In production, I would add sampling, red-team tests, regression suites, feedback loops, and incident review. No prompt, model, chunking, or tool change should ship without passing the relevant eval suite and rollback criteria. Senior execution detail: I would protect against duplicate payments, wrong vendor updates, missing approval, partial ERP failures, and unclear financial accountability. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g234', 'genai-architecture', 'How would you evaluate an agent that performs multi-step tasks with tools?', 'medium',
'How would you evaluate an agent that performs multi-step tasks with tools?

What the Interviewer Is Testing
The interviewer is testing whether you can measure GenAI quality beyond demos using representative datasets, automated and human evaluation, production feedback, and release gates. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics would you use for answer quality?
- How would you build a golden dataset?
- How would you evaluate hallucination risk?
- How would you prevent eval overfitting?
- What would block release even if the demo looks good?',
ARRAY['Relying only on subjective demos.','Confusing model quality with system quality.','Ignoring negative tests and edge cases.','Not using evals as release gates.'],
'Strong Answer: I would create a golden evaluation set from real user tasks, edge cases, negative examples, and high-risk scenarios. I would measure retrieval quality, answer correctness, faithfulness, refusal behavior, latency, and cost. I would combine automated scoring with human review for ambiguous or business-critical answers and use the eval results as a release gate for prompts, models, and retrieval changes. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer makes evaluation part of the product lifecycle. I would define task-specific metrics such as groundedness, citation precision, action correctness, escalation appropriateness, and business outcome metrics like time saved or case resolution rate. I would segment evaluation by customer, document type, user persona, language, and risk level. In production, I would add sampling, red-team tests, regression suites, feedback loops, and incident review. No prompt, model, chunking, or tool change should ship without passing the relevant eval suite and rollback criteria. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g235', 'genai-architecture', 'How would you measure hallucination and groundedness in production?', 'medium',
'How would you measure hallucination and groundedness in production?

What the Interviewer Is Testing
The interviewer is testing whether you can measure GenAI quality beyond demos using representative datasets, automated and human evaluation, production feedback, and release gates. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics would you use for answer quality?
- How would you build a golden dataset?
- How would you evaluate hallucination risk?
- How would you prevent eval overfitting?
- What would block release even if the demo looks good?',
ARRAY['Relying only on subjective demos.','Confusing model quality with system quality.','Ignoring negative tests and edge cases.','Not using evals as release gates.'],
'Strong Answer: I would create a golden evaluation set from real user tasks, edge cases, negative examples, and high-risk scenarios. I would measure retrieval quality, answer correctness, faithfulness, refusal behavior, latency, and cost. I would combine automated scoring with human review for ambiguous or business-critical answers and use the eval results as a release gate for prompts, models, and retrieval changes. Scenario-specific implementation detail: I would separate answer correctness, retrieval relevance, grounding, refusal correctness, and user usefulness instead of treating quality as one vague metric. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer makes evaluation part of the product lifecycle. I would define task-specific metrics such as groundedness, citation precision, action correctness, escalation appropriateness, and business outcome metrics like time saved or case resolution rate. I would segment evaluation by customer, document type, user persona, language, and risk level. In production, I would add sampling, red-team tests, regression suites, feedback loops, and incident review. No prompt, model, chunking, or tool change should ship without passing the relevant eval suite and rollback criteria. Senior execution detail: I would build a regression suite from real failures and require new releases to pass quality gates by scenario, customer segment, and risk tier. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g236', 'genai-architecture', 'How would you compare two models for the same customer workflow?', 'medium',
'How would you compare two models for the same customer workflow?

What the Interviewer Is Testing
The interviewer is testing whether you can measure GenAI quality beyond demos using representative datasets, automated and human evaluation, production feedback, and release gates. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics would you use for answer quality?
- How would you build a golden dataset?
- How would you evaluate hallucination risk?
- How would you prevent eval overfitting?
- What would block release even if the demo looks good?',
ARRAY['Relying only on subjective demos.','Confusing model quality with system quality.','Ignoring negative tests and edge cases.','Not using evals as release gates.'],
'Strong Answer: I would create a golden evaluation set from real user tasks, edge cases, negative examples, and high-risk scenarios. I would measure retrieval quality, answer correctness, faithfulness, refusal behavior, latency, and cost. I would combine automated scoring with human review for ambiguous or business-critical answers and use the eval results as a release gate for prompts, models, and retrieval changes. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer makes evaluation part of the product lifecycle. I would define task-specific metrics such as groundedness, citation precision, action correctness, escalation appropriateness, and business outcome metrics like time saved or case resolution rate. I would segment evaluation by customer, document type, user persona, language, and risk level. In production, I would add sampling, red-team tests, regression suites, feedback loops, and incident review. No prompt, model, chunking, or tool change should ship without passing the relevant eval suite and rollback criteria. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g237', 'genai-architecture', 'How would you use human review without making the eval process too slow?', 'medium',
'How would you use human review without making the eval process too slow?

What the Interviewer Is Testing
The interviewer is testing whether you can measure GenAI quality beyond demos using representative datasets, automated and human evaluation, production feedback, and release gates. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics would you use for answer quality?
- How would you build a golden dataset?
- How would you evaluate hallucination risk?
- How would you prevent eval overfitting?
- What would block release even if the demo looks good?',
ARRAY['Relying only on subjective demos.','Confusing model quality with system quality.','Ignoring negative tests and edge cases.','Not using evals as release gates.'],
'Strong Answer: I would create a golden evaluation set from real user tasks, edge cases, negative examples, and high-risk scenarios. I would measure retrieval quality, answer correctness, faithfulness, refusal behavior, latency, and cost. I would combine automated scoring with human review for ambiguous or business-critical answers and use the eval results as a release gate for prompts, models, and retrieval changes. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer makes evaluation part of the product lifecycle. I would define task-specific metrics such as groundedness, citation precision, action correctness, escalation appropriateness, and business outcome metrics like time saved or case resolution rate. I would segment evaluation by customer, document type, user persona, language, and risk level. In production, I would add sampling, red-team tests, regression suites, feedback loops, and incident review. No prompt, model, chunking, or tool change should ship without passing the relevant eval suite and rollback criteria. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g238', 'genai-architecture', 'How would you design regression tests for prompts, retrieval, and tool schemas?', 'medium',
'How would you design regression tests for prompts, retrieval, and tool schemas?

What the Interviewer Is Testing
The interviewer is testing whether you can measure GenAI quality beyond demos using representative datasets, automated and human evaluation, production feedback, and release gates. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics would you use for answer quality?
- How would you build a golden dataset?
- How would you evaluate hallucination risk?
- How would you prevent eval overfitting?
- What would block release even if the demo looks good?',
ARRAY['Relying only on subjective demos.','Confusing model quality with system quality.','Ignoring negative tests and edge cases.','Not using evals as release gates.'],
'Strong Answer: I would create a golden evaluation set from real user tasks, edge cases, negative examples, and high-risk scenarios. I would measure retrieval quality, answer correctness, faithfulness, refusal behavior, latency, and cost. I would combine automated scoring with human review for ambiguous or business-critical answers and use the eval results as a release gate for prompts, models, and retrieval changes. Scenario-specific implementation detail: I would construct the eval set from real tasks, domain-expert examples, edge cases, negative tests, and high-risk policy scenarios. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer makes evaluation part of the product lifecycle. I would define task-specific metrics such as groundedness, citation precision, action correctness, escalation appropriateness, and business outcome metrics like time saved or case resolution rate. I would segment evaluation by customer, document type, user persona, language, and risk level. In production, I would add sampling, red-team tests, regression suites, feedback loops, and incident review. No prompt, model, chunking, or tool change should ship without passing the relevant eval suite and rollback criteria. Senior execution detail: I would protect the eval from leakage and overfitting, maintain it as the product changes, and combine automated metrics with calibrated human review. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g239', 'genai-architecture', 'A model upgrade improves fluency but worsens policy accuracy. How do you decide whether to ship?', 'medium',
'A model upgrade improves fluency but worsens policy accuracy. How do you decide whether to ship?

What the Interviewer Is Testing
The interviewer is testing whether you can measure GenAI quality beyond demos using representative datasets, automated and human evaluation, production feedback, and release gates. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics would you use for answer quality?
- How would you build a golden dataset?
- How would you evaluate hallucination risk?
- How would you prevent eval overfitting?
- What would block release even if the demo looks good?',
ARRAY['Relying only on subjective demos.','Confusing model quality with system quality.','Ignoring negative tests and edge cases.','Not using evals as release gates.'],
'Strong Answer: I would create a golden evaluation set from real user tasks, edge cases, negative examples, and high-risk scenarios. I would measure retrieval quality, answer correctness, faithfulness, refusal behavior, latency, and cost. I would combine automated scoring with human review for ambiguous or business-critical answers and use the eval results as a release gate for prompts, models, and retrieval changes. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer makes evaluation part of the product lifecycle. I would define task-specific metrics such as groundedness, citation precision, action correctness, escalation appropriateness, and business outcome metrics like time saved or case resolution rate. I would segment evaluation by customer, document type, user persona, language, and risk level. In production, I would add sampling, red-team tests, regression suites, feedback loops, and incident review. No prompt, model, chunking, or tool change should ship without passing the relevant eval suite and rollback criteria. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('g240', 'genai-architecture', 'How would you create customer-visible quality reporting for an AI pilot?', 'medium',
'How would you create customer-visible quality reporting for an AI pilot?

What the Interviewer Is Testing
The interviewer is testing whether you can measure GenAI quality beyond demos using representative datasets, automated and human evaluation, production feedback, and release gates. In this specific scenario, they also want to see whether you can stay structured under ambiguity and make practical delivery decisions.

Follow-Up Questions
- What metrics would you use for answer quality?
- How would you build a golden dataset?
- How would you evaluate hallucination risk?
- How would you prevent eval overfitting?
- What would block release even if the demo looks good?',
ARRAY['Relying only on subjective demos.','Confusing model quality with system quality.','Ignoring negative tests and edge cases.','Not using evals as release gates.'],
'Strong Answer: I would create a golden evaluation set from real user tasks, edge cases, negative examples, and high-risk scenarios. I would measure retrieval quality, answer correctness, faithfulness, refusal behavior, latency, and cost. I would combine automated scoring with human review for ambiguous or business-critical answers and use the eval results as a release gate for prompts, models, and retrieval changes. Scenario-specific implementation detail: I would make the answer concrete by stating the current workflow, data sources, users, constraints, and the first safe version of the system. I would explicitly identify the highest-risk assumption, design a small validation step, and define what evidence would justify moving from prototype to pilot.

Senior-Level Answer: A senior answer makes evaluation part of the product lifecycle. I would define task-specific metrics such as groundedness, citation precision, action correctness, escalation appropriateness, and business outcome metrics like time saved or case resolution rate. I would segment evaluation by customer, document type, user persona, language, and risk level. In production, I would add sampling, red-team tests, regression suites, feedback loops, and incident review. No prompt, model, chunking, or tool change should ship without passing the relevant eval suite and rollback criteria. Senior execution detail: I would define the success metric, failure mode, rollout plan, owner, and customer-facing explanation of the trade-offs. In the interview, I would make the answer concrete by naming the workflow boundary, the data sources, the responsible user, the approval point, and the measurable outcome for this scenario.');
