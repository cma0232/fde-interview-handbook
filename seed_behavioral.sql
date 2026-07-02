INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b201', 'behavioral', 'Tell me about a time you handled ambiguity.', 'medium', 'Question: Tell me about a time you handled ambiguity.

What it tests: Whether you can move forward when the customer problem is unclear, requirements are incomplete, and several stakeholders disagree.

Follow-up questions:
- How did you decide what to build first when nobody agreed on scope?
- How did you define success when requirements were vague?
- What did you explicitly leave out of scope, and why?', ARRAY['Saying you waited until requirements were clear — FDEs are expected to create clarity, not wait for it', 'Jumping straight to architecture without discovery', 'Overpromising scope to make stakeholders happy'], 'Strong answer: Separate the problem into workflows instead of features. Interview key users, map where they lose time, and propose a narrow pilot with measurable success criteria. Define what you are explicitly not solving.

Senior answer: Ambiguity is not solved by asking one broad question. Decompose the workflow, define success metrics, and create a safe first step. Document the out-of-scope items so the team can align around a small first version, ship faster, find data-quality issues early, and use real feedback to decide next steps.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b202', 'behavioral', 'Tell me about a time you worked with a difficult stakeholder.', 'hard', 'Question: Tell me about a time you worked with a difficult stakeholder.

What it tests: Whether you can stay calm, translate frustration into requirements, and avoid making the customer feel blamed.

Follow-up questions:
- How did you uncover the real workflow gap behind the frustration?
- What trade-offs did you present, and how did you reach agreement?
- How did you maintain alignment after the initial conflict?', ARRAY['Describing the stakeholder as unreasonable for the whole answer — focus on how you improved alignment, not on the other person''s behavior', 'Defending the implementation instead of investigating the mismatch', 'Giving vague reassurance instead of committing to a specific next step with metrics'], 'Strong answer: Schedule a focused session to understand exactly where the mismatch happened. Ask the stakeholder to walk through a real example end to end to expose the gap. Summarize the issue in business terms, present technical options with trade-offs, and commit to a specific follow-up date with metrics.

Senior answer: Difficult stakeholders often become easier to work with when you convert frustration into a concrete workflow gap, communicate trade-offs clearly, and agree on the next measurable step. Empathy plus technical ownership — not one or the other.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b203', 'behavioral', 'Tell me about a production incident you handled.', 'hard', 'Question: Tell me about a production incident you handled.

What it tests: Incident response, prioritization, customer communication, root cause analysis, and prevention.

Follow-up questions:
- How did you assess the scope and impact before taking action?
- What did you communicate to the customer and when?
- What systemic change did you make to prevent recurrence?', ARRAY['Only describing the technical bug without covering impact, customer communication, and follow-up prevention', 'Skipping the customer communication step under pressure', 'Failing to mention how you validated the fix before re-enabling the affected path'], 'Strong answer: First assess scope — which customers, which records, how long data was stale, whether wrong data was shown. Pause the affected path, check logs, communicate to the customer in plain language with a clear next-update time. Fix the root cause, add schema-drift validation and alerting, replay failed records in staging to verify idempotency.

Senior answer: Integrations fail not only because code is wrong, but because customer systems change. Strong FDE work means designing for schema drift, partial failure, observability, and calm communication. Always write a post-incident summary covering what happened, customer impact, root cause, mitigation, and prevention.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b204', 'behavioral', 'Tell me about a time you had to ship under time pressure.', 'medium', 'Question: Tell me about a time you had to ship under time pressure.

What it tests: Whether you can reduce scope intelligently while protecting reliability and trust.

Follow-up questions:
- What did you cut, and what did you insist on keeping?
- How did you communicate the trade-offs to the customer?
- What production controls did you add even under time pressure?', ARRAY['Glorifying rushing — a strong answer shows controlled scope reduction, not heroic all-nighters', 'Cutting reliability or security to meet a deadline', 'Delivering without a rollback path or monitoring in place'], 'Strong answer: Propose a smaller version that still proves value — one core workflow, one primary data source, limited pilot group, batch sync instead of real-time. Add a minimum production checklist: authentication, least-privilege access, retry behavior, dashboards, error alerts, feature flags, rollback path. Schedule daily customer check-ins to resolve blockers early.

Senior answer: Speed in an FDE role comes from cutting scope, not cutting reliability. The goal is measurable evidence for the next phase, not a perfect full rollout on day one.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b205', 'behavioral', 'Tell me about a time customer requirements changed late in the project.', 'medium', 'Question: Tell me about a time customer requirements changed late in the project.

What it tests: Adaptability, expectation management, and whether you can keep the deployment moving without creating chaos.

Follow-up questions:
- How did you determine whether the business goal had also changed or only the implementation?
- How did you align internal teams before committing to the new direction?
- What did you explicitly defer, and how did you communicate that to the customer?', ARRAY['Simply accepting every change without protecting scope or outcomes', 'Treating late requirements as purely negative — sometimes they reveal the real workflow', 'Committing to changes without first aligning with product and engineering on maintenance implications'], 'Strong answer: First clarify whether the business goal changed or only the implementation idea. Document the new requirement, identify which existing work is still useful, and propose a revised pilot scope. Make trade-offs explicit — what is supported and what is deferred. Align with product and engineering before committing.

Senior answer: Changing requirements are not always a problem. The key is to separate the stable business outcome from the changing feature request, then adjust scope transparently. A revised pilot that fits user behavior outperforms an original plan that does not.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b206', 'behavioral', 'Tell me about a time you disagreed with engineering, product, sales, or customer success.', 'hard', 'Question: Tell me about a time you disagreed with engineering, product, sales, or customer success.

What it tests: Whether you can challenge decisions constructively and align cross-functional teams.

Follow-up questions:
- How did you frame the disagreement so it became about options and trade-offs, not opinions?
- What written artifact did you create to move the conversation forward?
- What did you ultimately decide, and why?', ARRAY['Making the story about winning an argument rather than finding the best path for customer and product', 'Staying in the disagreement without proposing a concrete path forward', 'Committing to one side without documenting trade-offs for others to review'], 'Strong answer: Reframe the discussion around the underlying capability, not the specific request. Propose a narrow implementation behind a feature flag with clear limits on what is custom vs. productizable. Write a short decision document comparing options with timeline, customer impact, maintenance cost, and risk.

Senior answer: Disagreement is easier to resolve when you translate positions into risks, options, and decision criteria. A written document moves the team from opinions to trade-offs. Look for the product-shaped pattern inside the customer-specific request.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b207', 'behavioral', 'Tell me about a time you explained a technical issue to a non-technical audience.', 'medium', 'Question: Tell me about a time you explained a technical issue to a non-technical audience.

What it tests: Whether FDEs can communicate with executives and operations teams without hiding behind jargon.

Follow-up questions:
- How did you decide which technical details to include and which to omit?
- How did you structure the options you presented?
- What did you commit to monitor and when did you give the next update?', ARRAY['Over-explaining internals instead of connecting the issue to impact, options, and next steps', 'Using terms like Kafka, Kubernetes, embeddings, or OAuth with a non-technical audience', 'Not presenting options or a clear next step — leaving the audience without a decision to make'], 'Strong answer: Explain in workflow terms, not implementation terms. Separate impact into clear categories (working, delayed, requiring cleanup). Present two options with different speed/depth trade-offs. Commit to specific monitoring and a next-update time.

Senior answer: Non-technical communication should answer four questions: what happened, who is affected, what we are doing now, and what decision is needed. Practice your technical explanation in one minute. The audience''s confidence depends on clarity, not completeness.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b208', 'behavioral', 'Tell me about a time you built something with incomplete information.', 'medium', 'Question: Tell me about a time you built something with incomplete information.

What it tests: Whether you can make reasonable assumptions, validate them quickly, and avoid irreversible decisions.

Follow-up questions:
- How did you document and isolate your assumptions so they could be changed later?
- What happened when the real data arrived, and how quickly could you adapt?
- What validation did you add to surface mismatches early?', ARRAY['Pretending incomplete information did not matter — show how you made assumptions visible and testable', 'Building the full integration blindly before any real data was available', 'Locking assumptions into the core logic instead of isolating them in a mapper or config layer'], 'Strong answer: Build a thin vertical slice using mocked data shaped around expected fields. Document assumptions explicitly — field names, null values, permissions, data freshness. Design the mapping layer so it can change without rewriting the core service. Add validation that reports missing or unexpected fields rather than failing silently.

Senior answer: Incomplete information is acceptable if assumptions are visible, reversible, and validated early. A concrete prototype helps the customer react to something real, while isolated architecture protects you from locking into wrong assumptions.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b209', 'behavioral', 'Tell me about a time you earned customer trust after something went wrong.', 'hard', 'Question: Tell me about a time you earned customer trust after something went wrong.

What it tests: Accountability, transparency, and whether you can rebuild confidence after failure.

Follow-up questions:
- How did you acknowledge the failure without being defensive?
- How did you turn customer complaints into a structured improvement plan?
- How did you show progress in a way the customer could verify?', ARRAY['Minimizing the failure or arguing that the system was generally good', 'Giving a vague plan without using the customer''s own examples as the benchmark', 'Overclaiming AI reliability before trust is rebuilt'], 'Strong answer: Acknowledge the problem directly. Ask the customer for concrete bad examples and group them into categories — missing context, wrong prioritization, stale data, unclear explanation. Build an evaluation set from real customer examples, improve retrieval inputs, add evidence behind each recommendation, and add human review for risky outputs. Share progress using the customer''s own examples.

Senior answer: Trust in FDE work comes from transparency, measurable fixes, and showing the reasoning behind the system''s output. Treat customer feedback as data, not criticism. Each progress update should use the customer''s original examples so they can see exactly what changed.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b210', 'behavioral', 'Tell me about a time you had to prioritize between multiple urgent customer requests.', 'medium', 'Question: Tell me about a time you had to prioritize between multiple urgent customer requests.

What it tests: Judgment, prioritization, and whether you can protect the highest-impact outcome.

Follow-up questions:
- What criteria did you use to rank the requests?
- How did you communicate the priority order to the customer?
- How did you confirm the customer agreed with your prioritization?', ARRAY['Saying you worked on everything at once — explain criteria and trade-offs instead', 'Prioritizing by loudness or recency rather than impact and risk', 'Surprising the customer with reprioritization instead of getting their explicit agreement'], 'Strong answer: Prioritize using three criteria — user impact, deployment risk, and whether the issue blocks success measurement. Fix blocking issues first (users cannot access the system), trust issues second (stale data), cosmetic improvements third. Communicate the priority order and ask the customer to confirm it matches their business priorities.

Senior answer: Urgency should be filtered through impact, risk, and pilot success criteria. A stressful request list becomes an agreed execution plan when you share your reasoning and get explicit customer confirmation. Show what happens today, this week, and after the pilot.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b211', 'behavioral', 'Tell me about a time you had to learn a new domain quickly.', 'easy', 'Question: Tell me about a time you had to learn a new domain quickly.

What it tests: Whether you can enter unfamiliar customer domains, learn fast, and ask good questions.

Follow-up questions:
- What methods did you use beyond reading documentation?
- How did you map domain knowledge to technical requirements?
- How did domain risk affect your system design choices?', ARRAY['Only saying you read documentation — show how you built a working mental model of the customer''s workflow', 'Pretending to be the domain expert rather than learning alongside subject-matter experts', 'Ignoring domain-specific edge cases in your evaluation set'], 'Strong answer: Use three learning methods — ask the customer to walk through real examples rather than abstract requirements, create a glossary of domain terms mapped to data fields, and review edge cases with subject-matter experts focusing on cases where a wrong recommendation would be costly.

Senior answer: Rapid domain learning is about mapping language, workflow, data, and risk. Design a safer first version by adding human review for high-risk outputs and highlighting evidence behind recommendations. Humility and structured learning are as important as technical speed in an FDE role.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b212', 'behavioral', 'Tell me about a time you improved a process, not just a piece of code.', 'medium', 'Question: Tell me about a time you improved a process, not just a piece of code.

What it tests: Outcome orientation, not only task execution.

Follow-up questions:
- What was the bottleneck in the existing process, and how did you identify it?
- What artifact did you create, and how did you get others to use it?
- How did you measure whether the process improvement worked?', ARRAY['Focusing only on code refactoring without explaining how the process improvement helped users or the customer', 'Creating a process artifact without getting buy-in from the people who need to use it', 'Not measuring whether the improvement actually reduced the bottleneck'], 'Strong answer: Create a deployment readiness checklist and lightweight onboarding template covering system owners, API access, OAuth/service account setup, required fields, sandbox access, security approvals, success metrics, monitoring, and rollback. Add a validation script to test credentials, permissions, and endpoints before engineering starts deeper work.

Senior answer: Some of the biggest FDE improvements come from reducing deployment friction. Good process prevents engineers from repeatedly solving the same avoidable problems under pressure. The test of a process improvement is whether issues are discovered before implementation, not during the final pilot week.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b213', 'behavioral', 'Tell me about a time you had to balance customer customization with product scalability.', 'hard', 'Question: Tell me about a time you had to balance customer customization with product scalability.

What it tests: Whether you can serve customers without creating unmaintainable one-off systems.

Follow-up questions:
- How did you identify the general problem pattern behind the customer-specific request?
- What parts did you make configurable vs. customer-specific, and why?
- How did you get product alignment before committing to the implementation approach?', ARRAY['Saying the customer is always right — enterprise customers matter, but maintainability matters too', 'Hard-coding logic for one customer without considering the maintenance and upgrade risk', 'Building customization without documenting which parts are temporary and which should become product features'], 'Strong answer: First understand the general problem behind the request — often the need is flexible field mapping, conditional visibility, or approval routing, which other customers might also need. Propose a configurable approach for the common parts and a narrow customer-specific layer only where absolutely necessary. Document which parts are temporary and align with product on what should become reusable.

Senior answer: FDEs should look for the product-shaped pattern inside the customer-specific request. The best answer is often configuration, extension points, or a narrow pilot behind a feature flag — not hard-coded customization. A forked deployment is a long-term tax on every future upgrade.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b214', 'behavioral', 'Tell me about a time you used data or metrics to guide a decision.', 'medium', 'Question: Tell me about a time you used data or metrics to guide a decision.

What it tests: Whether you define success and make decisions based on signals, not opinions.

Follow-up questions:
- What technical metrics did you track, and what product or adoption metrics?
- What unexpected insight did the metrics reveal?
- How did the metrics change your priorities for the next phase?', ARRAY['Only mentioning technical metrics like latency and error rate without including adoption or business workflow metrics', 'Treating a technically stable deployment as a success without checking whether users were actually getting value', 'Not changing priorities based on what the data revealed'], 'Strong answer: Define success using both technical metrics (sync success rate, data freshness, latency, error rate, API quota) and product metrics (weekly active users, summaries viewed, recommendation feedback, time saved). Use the metrics to diagnose gaps — a technically stable system that has low usage points to a trust or explainability problem, not a reliability problem.

Senior answer: A deployment can be technically healthy but still fail from a user-value perspective. FDEs need both system metrics and adoption metrics to make good decisions. When usage drops despite technical stability, shift priority to trust, explainability, and evidence — not more backend work.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b215', 'behavioral', 'Tell me about a time you had to say no or push back on a customer request.', 'hard', 'Question: Tell me about a time you had to say no or push back on a customer request.

What it tests: Whether you can protect trust and feasibility while staying helpful.

Follow-up questions:
- How did you explain the risk in terms the customer understood?
- What alternative did you offer, and what criteria would move you toward yes?
- How did the customer respond, and what happened next?', ARRAY['Giving a blunt refusal without explaining the risk or offering an alternative', 'Saying yes to avoid conflict when the request creates real deployment risk', 'Failing to define what criteria would allow you to say yes later — making the no feel permanent'], 'Strong answer: Push back by explaining the risk in business terms, not technical terms. Offer a safer alternative that still provides value — in this case, generate recommendations with evidence and allow human review, logging what would have been written. Define explicit criteria for moving toward automation: accuracy threshold, approved permission model, audit logs, rollback plan, review period.

Senior answer: Pushback works best when it protects the customer''s outcome, explains risk clearly, and offers a concrete lower-risk path. The ''no'' should feel like a path to ''yes'', not a dead end. Phased rollout and human-in-the-loop design are FDE tools for converting a risky request into a safe first step.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b216', 'behavioral', 'Tell me about a time you collaborated with sales or customer success.', 'medium', 'Question: Tell me about a time you collaborated with sales or customer success.

What it tests: Whether you can align cross-functional teams without overpromising.

Follow-up questions:
- How did you translate customer ambitions into a pilot scope you could actually deliver?
- How did you handle vague requests on customer calls without shutting down the conversation?
- How did you keep all teams aligned after each customer interaction?', ARRAY['Blaming sales for unrealistic promises instead of showing how you created alignment and protected delivery', 'Saying yes to vague requests on customer calls instead of asking clarifying questions', 'Not sharing call notes across sales, CS, product, and engineering — leaving teams with different understandings'], 'Strong answer: Work with sales to translate customer goals into a pilot scope with clear commitments, exploratory items, and deferred product work. Prepare diagrams for data flow, security boundaries, and rollout steps. On calls, ask clarifying questions tied to workflow, data availability, permissions, and timeline. Share structured notes after each call to keep all teams aligned.

Senior answer: FDE collaboration with sales is not about slowing deals down. It is about making sure the deal is grounded in a deployment path that can actually succeed. Commercial awareness and engineering discipline are not opposites — they are both required for a pilot that delivers on its promise.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b217', 'behavioral', 'Tell me about a time you handled missing, messy, or inconsistent data.', 'medium', 'Question: Tell me about a time you handled missing, messy, or inconsistent data.

What it tests: Practical data quality handling — profiling, validation, ownership, and feedback loops.

Follow-up questions:
- How did you measure the size of each data quality issue before reacting?
- How did you avoid failing the entire pipeline because of a subset of bad records?
- How did you involve the customer in resolving source-system issues vs. integration-layer issues?', ARRAY['Simply saying you cleaned the data — explain profiling, validation, ownership, and feedback loops', 'Letting one bad record fail the entire pipeline instead of categorizing and routing records', 'Blaming the customer for messy data rather than creating a shared improvement plan'], 'Strong answer: Profile the data and measure the size of each issue. Create validation rules for required identifiers, accepted formats, allowed values, and duplicate detection. Separate records into clean, warning, and blocked categories. Create a feedback report showing which issues need source-system cleanup vs. integration-layer handling. Agree on a minimum acceptable data-quality threshold and monitor it during rollout.

Senior answer: Messy data is not an exception in enterprise deployments — it is the normal operating environment. FDEs need validation, reconciliation, observability, and customer feedback loops built in from the start. The integration layer handles what it can; a feedback report handles the rest.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b218', 'behavioral', 'Tell me about a time you had to make a trade-off between speed, quality, and scope.', 'medium', 'Question: Tell me about a time you had to make a trade-off between speed, quality, and scope.

What it tests: Pragmatic FDE judgment — how you make safe decisions under constraint.

Follow-up questions:
- What did you remove from scope, and what did you insist on keeping for reliability?
- How did you frame the trade-off for stakeholders?
- Why did the narrower scope produce a better outcome than a broader one would have?', ARRAY['Saying quality was sacrificed — the correct framing is that scope was reduced to protect reliability', 'Building broad surface area with high operational risk instead of proving one workflow reliably', 'Not explaining the trade-off to stakeholders before making the decision'], 'Strong answer: Recommend narrowing scope — one high-value workflow, one pilot team, two most important data objects. Spend the saved time on production controls: authentication, permission checks, retry behavior, monitoring, and rollback. Frame the decision as: prove one workflow reliably and expand, rather than show more surface area with higher risk.

Senior answer: Quality should not be the variable you cut first. In customer deployments, reduce scope before you reduce safety, security, or observability. Users trust a smaller reliable experience more than a broad unstable one. The pilot''s purpose is measurable evidence, not maximum feature coverage.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b219', 'behavioral', 'Tell me about a time you led without formal authority.', 'medium', 'Question: Tell me about a time you led without formal authority.

What it tests: Whether you can coordinate engineers, customers, sales, support, and product without being everyone''s manager.

Follow-up questions:
- What artifact did you create to give the cross-functional team shared visibility?
- How did you handle blockers without trying to control every detail?
- How did your coordination change the customer''s experience of the rollout?', ARRAY['Relying on title or authority rather than clarity, action, and follow-up', 'Trying to control every detail instead of clarifying ownership and letting the right people decide', 'Not communicating decisions back to the group after they were made'], 'Strong answer: Create a shared rollout plan listing workstreams, owners, dependencies, risks, and dates — access, data mapping, security review, integration build, testing, pilot enablement, monitoring, and handoff. Schedule short check-ins focused only on blockers and decisions. When issues arise, clarify the decision needed, find the right owner, and communicate the result back.

Senior answer: Leadership in an FDE role means creating structure in a messy cross-functional environment. You lead by making ownership, risk, and next steps visible — not by controlling execution. The result is a more predictable rollout and a customer with more confidence because there is a clear plan.');

INSERT INTO questions (id, category, title, difficulty, content, hints, solution) VALUES
('b220', 'behavioral', 'Tell me about a time you made a mistake.', 'medium', 'Question: Tell me about a time you made a mistake.

What it tests: Accountability, learning, and whether you can talk about failure without blaming others.

Follow-up questions:
- How did you detect the mistake, and what was the immediate impact?
- What did you do to fix it, and how did you communicate with the customer?
- What process change did you make to prevent the same mistake in future integrations?', ARRAY['Choosing a catastrophic mistake that raises disqualifying concerns', 'Blaming the customer or the data instead of owning your testing gap', 'Describing the mistake without a strong learning outcome and process change'], 'Strong answer: Own the mistake directly — testing against a small clean sample and assuming production data would follow the same shape was an error. Fix the immediate issue by separating clean records from those needing review, improving error messages, and creating a report showing which fields caused failures. Then change the process: ask for representative samples, profile data before designing the mapper, define how the system behaves when fields are missing or inconsistent.

Senior answer: Enterprise data quality should never be assumed from a small sample. The safest approach is validate early, make failure modes visible, and communicate data risks before they affect the pilot. A strong mistake story shows detection, ownership, correction, prevention, and learning.');
