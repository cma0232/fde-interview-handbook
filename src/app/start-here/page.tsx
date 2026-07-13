"use client";

import { useState, useEffect, useCallback } from "react";
import Link from "next/link";
import { createClient } from "@/lib/supabase-browser";
import { User } from "@supabase/supabase-js";

type Day30 = {
  day: number; week: number; title: string; objective: string;
  core: string[]; drill: string; deliverable: string;
};

const plan30: Day30[] = [
  { day:1, week:1, title:"Understand the FDE Role", objective:"Build a clear mental model of what FDEs do and how they differ from SWE and Solutions Engineering.", core:["Read your FDE role description and summarize it in your own words.", 'Write a two-minute answer to: "Why are you interested in Forward Deployed Engineering?"', "List your strongest proof points: coding, integrations, DevOps, customer communication, production ownership."], drill:"Record yourself explaining the FDE role in two minutes. Remove vague phrases and make it outcome-driven.", deliverable:"A polished two-minute FDE role pitch." },
  { day:2, week:1, title:"Learn the FDE Case Framework", objective:"Create a repeatable structure for ambiguous deployment and integration questions.", core:["Memorize the eight-part answer formula: clarify, map systems, define metrics, choose integration path, secure it, make it reliable, roll out, communicate trade-offs.", "Apply the formula to a simple CRM integration prompt.", "Create a one-page template you can reuse during practice."], drill:'Answer this prompt aloud: "A customer wants your product deployed in two weeks. What do you ask first?"', deliverable:"One reusable FDE case answer template." },
  { day:3, week:1, title:"Enterprise APIs and Authentication", objective:"Understand the basic building blocks of customer integrations.", core:["Review REST APIs, API keys, OAuth, service accounts, SAML/SSO, and role-based access control.", "Write down when to use service account access versus per-user OAuth.", "Practice explaining least privilege to a non-security stakeholder."], drill:"Explain why authentication and permissions can decide whether an FDE deployment succeeds.", deliverable:"A one-page auth and permission cheat sheet." },
  { day:4, week:1, title:"Data Models and Messy Customer Data", objective:"Prepare for questions about incomplete, inconsistent, and unreliable customer data.", core:["List common data problems: missing fields, duplicates, inconsistent schemas, stale data, unclear ownership, manual workarounds.", "Practice designing a mapping layer between customer data and your product data model.", "Define validation rules and reconciliation checks for a simple account dataset."], drill:'Answer: "How would you handle messy customer data during a pilot?"', deliverable:"A data quality checklist for FDE cases." },
  { day:5, week:1, title:"Reliability and Observability", objective:"Learn how to make integrations production-safe.", core:["Review retries, exponential backoff, idempotency, timeouts, rate limits, dead-letter queues, and fallback behavior.", "Design metrics for a sync job: success rate, failure count, latency, freshness, auth failures, API quota usage.", "Write a simple rollback plan for a broken deployment."], drill:'Answer: "What does production-ready mean in an FDE context?"', deliverable:"A production readiness checklist." },
  { day:6, week:1, title:"Customer Communication Basics", objective:"Practice sounding calm, structured, and customer-oriented.", core:["Write phrases for clarifying unclear requirements without sounding weak.", "Practice translating technical trade-offs into business language.", "Prepare a status update format: current status, impact, risk, next step, owner, next update time."], drill:'Role-play a call where the customer says: "The demo worked, but production users do not trust it."', deliverable:"A customer communication script." },
  { day:7, week:1, title:"Mock Interview 1: Fundamentals", objective:"Test your baseline performance after the first week.", core:["Run a 30-minute mock: 10 min role fit, 10 min integration scenario, 10 min behavioral.", "Score yourself using the scorecard.", "Identify your top three weak areas for Week 2."], drill:"Answer the same case twice: once without notes, once using the framework. Compare the difference.", deliverable:"Mock Interview 1 scorecard and improvement notes." },
  { day:8, week:2, title:"Case Study: CRM Integration", objective:"Practice the classic Salesforce or CRM deployment case.", core:["Define the pilot scope: users, objects, workflow, data freshness, permissions, success metrics.", "Choose between batch sync and webhooks.", "Discuss audit logs, API limits, field mapping, and rollback."], drill:'Give a three-minute answer to: "Integrate our AI assistant into Salesforce in two weeks."', deliverable:"A complete CRM case answer." },
  { day:9, week:2, title:"Case Study: Customer Support AI", objective:"Practice a support workflow integration with trust and escalation concerns.", core:["Map systems: Zendesk or Intercom, knowledge base, Slack, customer account data, escalation workflow.", "Define success metrics: response time, deflection, escalations, agent satisfaction.", "Address hallucination risk, human review, citations, feedback loops, safe rollout."], drill:'Answer: "Support agents do not trust the AI responses. What do you do?"', deliverable:"A complete support AI case answer." },
  { day:10, week:2, title:"Case Study: Enterprise RAG Search", objective:"Prepare for AI infrastructure and retrieval-heavy FDE interviews.", core:["Design ingestion, chunking, embeddings, vector database, search, re-ranking, permissions, evaluation.", "Explain why permission-aware retrieval matters in enterprise environments.", "Create an evaluation plan using golden questions, user feedback, failure analysis."], drill:"Explain RAG to an executive and then to an engineer. Use different levels of detail.", deliverable:"A complete enterprise search case answer." },
  { day:11, week:2, title:"Case Study: Document Intelligence", objective:"Practice an AI workflow that extracts information from PDFs or enterprise documents.", core:["Define document types, extraction fields, confidence thresholds, human review, exception handling.", "Discuss PII, retention, audit logs, customer-specific templates.", "Plan rollout from a small document set to production volume."], drill:'Answer: "Our model extracts wrong fields from invoices. How would you debug and improve it?"', deliverable:"A complete document intelligence case answer." },
  { day:12, week:2, title:"Case Study: Executive Dashboard", objective:"Practice business outcome-driven deployment design.", core:["Map the data warehouse, business metrics, refresh needs, access control, dashboard consumers.", "Choose batch refresh, live query, or event-driven updates based on freshness and complexity.", "Discuss data correctness, trust, executive communication."], drill:'Answer: "Leadership wants a customer risk dashboard in 10 days. What do you build first?"', deliverable:"A complete dashboard case answer." },
  { day:13, week:2, title:"Security and Enterprise Readiness", objective:"Make security a strength in every answer.", core:["Review least privilege, tenant isolation, secrets management, audit logs, PII handling, data retention, SOC2-style controls.", "Create a security questions checklist for discovery calls.", "Practice explaining why security can affect scope and timeline."], drill:'Answer: "The security team blocks access one day before pilot launch. What do you do?"', deliverable:"A security discovery checklist." },
  { day:14, week:2, title:"Mock Interview 2: Case Design", objective:"Practice case interviews under time pressure.", core:["Run a 45-minute mock: 5 min clarification, 20 min design, 10 min trade-offs, 10 min follow-up.", "Score yourself on clarity, technical depth, security, reliability, business judgment.", "Rewrite your weakest answer after the mock."], drill:"Use a timer. Stop at 3 minutes and summarize your recommendation clearly.", deliverable:"Mock Interview 2 scorecard and revised case answer." },
  { day:15, week:3, title:"Coding Drill: Webhook Receiver", objective:"Build a practical component that appears often in integrations.", core:["Implement an endpoint that receives events from a third-party system.", "Validate payload shape and reject malformed events.", "Discuss signature verification, replay protection, idempotency, retries."], drill:"Explain your webhook design as if an interviewer is reviewing your code.", deliverable:"Webhook receiver solution notes." },
  { day:16, week:3, title:"Coding Drill: Idempotent Sync Job", objective:"Practice safe data synchronization.", core:["Design a sync job that reads records, transforms them, stores sync state, retries failed records.", "Handle duplicate events and partial failure.", "Log enough information to debug customer-specific issues."], drill:'Answer: "How do you avoid double-writing records during retries?"', deliverable:"Idempotent sync job design and pseudocode." },
  { day:17, week:3, title:"Coding Drill: Rate Limits and Backoff", objective:"Prepare for third-party API integration constraints.", core:["Implement or describe exponential backoff with jitter.", "Handle API quota exceeded errors gracefully.", "Design dashboards and alerts for quota usage and failed retries."], drill:"Explain how API limits change your integration architecture.", deliverable:"Rate limiting and retry strategy." },
  { day:18, week:3, title:"Coding Drill: Audit Logs and RBAC", objective:"Show enterprise readiness through access control and traceability.", core:["Design tables for audit logs: who, action, resource, timestamp, tenant, request ID.", "Explain how RBAC interacts with customer permissions.", "Practice querying audit logs during an incident."], drill:'Answer: "A customer asks who viewed sensitive data last week. How would your system answer?"', deliverable:"Audit log design." },
  { day:19, week:3, title:"API Design and OpenAPI Thinking", objective:"Practice designing clean APIs for customer-facing integrations.", core:["Design endpoints for accounts, recommendations, sync status, health checks.", "Add error response patterns: validation error, unauthorized, rate limited, upstream unavailable.", "Think about versioning and backward compatibility."], drill:"Walk through your API design and explain why it is easy for customers to integrate.", deliverable:"API endpoint list with request and response examples." },
  { day:20, week:3, title:"Production Debugging", objective:"Practice diagnosing broken deployments systematically.", core:["Use a debugging checklist: scope, timeline, recent changes, logs, metrics, auth, data, dependencies, user impact.", "Practice a CRM failure: some records are missing after sync.", "Prepare a customer update while the root cause is still unknown."], drill:'Answer: "The integration worked yesterday and broke today. What do you check first?"', deliverable:"Production debugging checklist." },
  { day:21, week:3, title:"Mock Interview 3: Technical Depth", objective:"Test your coding and production readiness explanations.", core:["Run a 60-minute mock: 20 min coding/design, 20 min debugging, 10 min security, 10 min summary.", "Score technical precision: edge cases, failure handling, testing, observability.", "Rewrite your weakest technical answer."], drill:"Explain one coding drill without showing code. Make the design understandable from speech alone.", deliverable:"Mock Interview 3 scorecard and technical improvement plan." },
  { day:22, week:4, title:"Behavioral Stories for FDE", objective:"Prepare authentic stories that prove ownership and ambiguity handling.", core:["Write 6 STAR stories: ambiguity, production incident, difficult stakeholder, time pressure, disagreement, learning from failure.", "Add technical details to each story so they do not sound generic.", "End each story with measurable impact and lesson learned."], drill:'Answer: "Tell me about a time you handled ambiguity." Use a 2-minute limit.', deliverable:"Behavioral story bank." },
  { day:23, week:4, title:"Client Simulation: Discovery Call", objective:"Practice asking questions before proposing solutions.", core:["Run a mock discovery call for a customer who wants an AI assistant but has unclear requirements.", "Ask about users, workflow, pain, existing tools, data sources, security, timeline, success criteria.", "End by summarizing what you heard and proposing a small next step."], drill:"Practice not jumping into architecture for the first five minutes.", deliverable:"Discovery call question list and summary script." },
  { day:24, week:4, title:"Client Simulation: Angry Customer", objective:"Practice calm communication under pressure.", core:["Prepare an incident response structure: acknowledge, clarify impact, current mitigation, next steps, update time.", "Avoid blaming customer data, users, or another team.", "Write a short post-incident customer update."], drill:'Role-play: "Your product caused wrong recommendations in front of our executives."', deliverable:"Customer incident update template." },
  { day:25, week:4, title:"Executive Communication", objective:"Learn to explain technical choices in business language.", core:["Translate 5 technical terms into executive-friendly language: batch sync, OAuth, idempotency, feature flag, audit log.", "Practice explaining why a narrower pilot is safer than a company-wide rollout.", "Prepare a 60-second trade-off explanation for batch versus real time."], drill:'Answer: "Why can we not launch to all users tomorrow?"', deliverable:"Executive communication cheat sheet." },
  { day:26, week:4, title:"Role Fit and Motivation", objective:"Make your candidacy coherent and memorable.", core:["Write answers for: why FDE, why this company, why now, why your background fits.", "Connect your projects to FDE signals: integration, production, customer value, ambiguity, ownership.", "Prepare 5 smart questions to ask interviewers."], drill:'Record your answer to "Why should we hire you as an FDE?"', deliverable:"Final role-fit pitch and interviewer questions." },
  { day:27, week:4, title:"Mock Interview 4: Client and Behavioral", objective:"Stress-test communication and stakeholder judgment.", core:["Run a 60-minute mock: 20 min client simulation, 20 min behavioral, 20 min case follow-up.", "Score yourself on calmness, structure, empathy, ownership, specificity.", "Improve any answer that sounds too generic or defensive."], drill:"Ask a friend to interrupt you with vague or emotional customer statements.", deliverable:"Mock Interview 4 scorecard and revised scripts." },
  { day:28, week:4, title:"Weak Area Repair Day", objective:"Use data from your mock interviews to fix the biggest gaps.", core:["Review all previous scorecards and identify patterns.", "Choose one weak area: technical depth, case structure, communication, security, coding, behavioral stories.", "Do focused repetitions until your answer is clear and confident."], drill:"Repeat your weakest case three times: 5 minutes, 3 minutes, then 90 seconds.", deliverable:"Weak area repair notes." },
  { day:29, week:4, title:"Full Mock Interview 5", objective:"Simulate the real interview as closely as possible.", core:["Run a full 75–90 minute mock: role fit, coding/design, case study, client simulation, behavioral, questions.", "Use the final scorecard and write the top five improvements.", "Prepare final notes, not scripts."], drill:"After the mock, summarize your performance in one paragraph as if you were the interviewer.", deliverable:"Final mock scorecard and last improvement list." },
  { day:30, week:4, title:"Final Review and Interview Day Plan", objective:"Enter the interview with structure, calmness, and clear examples.", core:["Review your answer formula, case templates, security checklist, production readiness checklist, behavioral stories.", "Prepare a one-page interview day sheet with reminders and examples.", "Sleep, reduce new learning, focus on clarity."], drill:'Practice a final 3-minute answer: "How would you deploy an AI product into a customer environment?"', deliverable:"One-page final interview sheet. Calm recall beats more information." },
];

const WEEK_META = [
  { week: 1, label: "Week 1", title: "Build the FDE Operating System", color: "bg-blue-100 text-blue-700 border-blue-200" },
  { week: 2, label: "Week 2", title: "Master Case Interviews", color: "bg-purple-100 text-purple-700 border-purple-200" },
  { week: 3, label: "Week 3", title: "Prove Technical Depth", color: "bg-emerald-100 text-emerald-700 border-emerald-200" },
  { week: 4, label: "Week 4", title: "Become Interview Ready", color: "bg-pink-100 text-pink-700 border-pink-200" },
];

const PLAN_KEY = "30";

const DAY_QUESTIONS: Record<number, Array<{ id: string; category: string }>> = {
  1: [{ id: "b2", category: "behavioral" }, { id: "b211", category: "behavioral" }, { id: "b219", category: "behavioral" }],
  2: [{ id: "cs2", category: "case-study" }, { id: "b310", category: "behavioral" }, { id: "b302", category: "behavioral" }],
  3: [{ id: "sd210", category: "system-design" }, { id: "sd206", category: "system-design" }, { id: "sd203", category: "system-design" }],
  4: [{ id: "c102", category: "coding" }, { id: "b217", category: "behavioral" }, { id: "c118", category: "coding" }],
  5: [{ id: "c132", category: "coding" }, { id: "c136", category: "coding" }, { id: "sd227", category: "system-design" }, { id: "sd221", category: "system-design" }],
  6: [{ id: "b207", category: "behavioral" }, { id: "b301", category: "behavioral" }, { id: "b308", category: "behavioral" }],
  7: [{ id: "b1", category: "behavioral" }, { id: "b218", category: "behavioral" }, { id: "b304", category: "behavioral" }],
  8: [{ id: "cs101", category: "case-study" }, { id: "cs204", category: "case-study" }, { id: "g222", category: "genai-architecture" }],
  9: [{ id: "cs102", category: "case-study" }, { id: "cs208", category: "case-study" }, { id: "g221", category: "genai-architecture" }, { id: "g2", category: "genai-architecture" }],
  10: [{ id: "g1", category: "genai-architecture" }, { id: "g211", category: "genai-architecture" }, { id: "g212", category: "genai-architecture" }, { id: "g215", category: "genai-architecture" }, { id: "sd201", category: "system-design" }],
  11: [{ id: "cs104", category: "case-study" }, { id: "cs106", category: "case-study" }, { id: "g218", category: "genai-architecture" }, { id: "c104", category: "coding" }, { id: "c119", category: "coding" }],
  12: [{ id: "cs110", category: "case-study" }, { id: "g3", category: "genai-architecture" }, { id: "sd211", category: "system-design" }, { id: "sd220", category: "system-design" }],
  13: [{ id: "sd2", category: "system-design" }, { id: "sd204", category: "system-design" }, { id: "sd205", category: "system-design" }, { id: "sd207", category: "system-design" }, { id: "sd208", category: "system-design" }, { id: "sd202", category: "system-design" }],
  14: [{ id: "cs3", category: "case-study" }, { id: "b305", category: "behavioral" }, { id: "b306", category: "behavioral" }, { id: "g210", category: "genai-architecture" }],
  15: [{ id: "c101", category: "coding" }, { id: "c103", category: "coding" }, { id: "c105", category: "coding" }],
  16: [{ id: "c140", category: "coding" }, { id: "c144", category: "coding" }, { id: "c148", category: "coding" }],
  17: [{ id: "c3", category: "coding" }, { id: "c131", category: "coding" }, { id: "c135", category: "coding" }, { id: "sd229", category: "system-design" }],
  18: [{ id: "c117", category: "coding" }, { id: "c112", category: "coding" }, { id: "c128", category: "coding" }, { id: "c120", category: "coding" }],
  19: [{ id: "c1", category: "coding" }, { id: "c106", category: "coding" }, { id: "sd230", category: "system-design" }, { id: "sd213", category: "system-design" }],
  20: [{ id: "c114", category: "coding" }, { id: "c150", category: "coding" }, { id: "c141", category: "coding" }, { id: "sd212", category: "system-design" }, { id: "sd214", category: "system-design" }, { id: "g304", category: "genai-architecture" }],
  21: [{ id: "c149", category: "coding" }, { id: "sd215", category: "system-design" }, { id: "sd216", category: "system-design" }, { id: "g308", category: "genai-architecture" }],
  22: [{ id: "b201", category: "behavioral" }, { id: "b202", category: "behavioral" }, { id: "b203", category: "behavioral" }, { id: "b204", category: "behavioral" }, { id: "b206", category: "behavioral" }, { id: "b220", category: "behavioral" }],
  23: [{ id: "b309", category: "behavioral" }, { id: "b303", category: "behavioral" }, { id: "cs209", category: "case-study" }, { id: "cs206", category: "case-study" }],
  24: [{ id: "b209", category: "behavioral" }, { id: "b210", category: "behavioral" }, { id: "g310", category: "genai-architecture" }, { id: "g309", category: "genai-architecture" }],
  25: [{ id: "b212", category: "behavioral" }, { id: "b214", category: "behavioral" }, { id: "sd218", category: "system-design" }, { id: "g240", category: "genai-architecture" }],
  26: [{ id: "b3", category: "behavioral" }, { id: "b215", category: "behavioral" }, { id: "b216", category: "behavioral" }, { id: "b213", category: "behavioral" }],
  27: [{ id: "b205", category: "behavioral" }, { id: "b307", category: "behavioral" }, { id: "cs210", category: "case-study" }, { id: "cs1", category: "case-study" }],
  28: [{ id: "g231", category: "genai-architecture" }, { id: "g232", category: "genai-architecture" }, { id: "g233", category: "genai-architecture" }, { id: "sd1", category: "system-design" }, { id: "sd3", category: "system-design" }],
  29: [{ id: "cs103", category: "case-study" }, { id: "g201", category: "genai-architecture" }, { id: "g202", category: "genai-architecture" }, { id: "c2", category: "coding" }, { id: "g219", category: "genai-architecture" }],
  30: [{ id: "b208", category: "behavioral" }, { id: "g226", category: "genai-architecture" }, { id: "sd209", category: "system-design" }],
};

const CATEGORY_LABEL: Record<string, string> = {
  "behavioral": "Behavioral",
  "system-design": "System Design",
  "coding": "Coding",
  "genai-architecture": "GenAI",
  "case-study": "Case Study",
};

const CATEGORY_COLOR: Record<string, string> = {
  "behavioral": "bg-blue-100 text-blue-700",
  "system-design": "bg-purple-100 text-purple-700",
  "coding": "bg-green-100 text-green-700",
  "genai-architecture": "bg-orange-100 text-orange-700",
  "case-study": "bg-rose-100 text-rose-700",
};

const DIFFICULTY_COLOR: Record<string, string> = {
  easy: "bg-gray-100 text-gray-500",
  medium: "bg-yellow-100 text-yellow-700",
  hard: "bg-red-100 text-red-700",
};

function taskKey(day: number, kind: string, idx?: number) {
  return `d${day}_${kind}${idx !== undefined ? "_" + idx : ""}`;
}

function CheckBox({ checked, onToggle }: { checked: boolean; onToggle: () => void }) {
  return (
    <button
      onClick={(e) => { e.stopPropagation(); onToggle(); }}
      className={`w-5 h-5 rounded border-2 shrink-0 flex items-center justify-center transition-all ${
        checked ? "bg-gray-900 border-gray-900" : "border-gray-300 hover:border-gray-500"
      }`}
    >
      {checked && (
        <svg width="10" height="8" viewBox="0 0 10 8" fill="none">
          <path d="M1 4l3 3 5-6" stroke="white" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" />
        </svg>
      )}
    </button>
  );
}

export default function StudyPlansPage() {
  const [checked, setChecked] = useState<Record<string, boolean>>({});
  const [user, setUser] = useState<User | null>(null);
  const [shakeKey, setShakeKey] = useState(0);
  const [modal, setModal] = useState<Day30 | null>(null);
  const [questionsMap, setQuestionsMap] = useState<Record<string, { id: string; category: string; title: string; difficulty: string }>>({});
  const supabase = createClient();

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => setUser(data.user));
    const { data: listener } = supabase.auth.onAuthStateChange((_e, session) => {
      setUser(session?.user ?? null);
    });
    return () => listener.subscription.unsubscribe();
  }, []);

  useEffect(() => {
    if (user) {
      supabase.from("study_progress").select("item_key").eq("plan", PLAN_KEY).eq("completed", true).then(({ data }) => {
        if (data) {
          const map: Record<string, boolean> = {};
          data.forEach((r) => { map[r.item_key] = true; });
          setChecked(map);
        }
      });
    } else {
      try {
        const saved = sessionStorage.getItem(`study_progress_${PLAN_KEY}`);
        setChecked(saved ? JSON.parse(saved) : {});
      } catch { setChecked({}); }
    }
  }, [user]);

  const toggle = useCallback(async (key: string) => {
    const next = !checked[key];
    setChecked((prev) => ({ ...prev, [key]: next }));
    if (user) {
      if (next) {
        await supabase.from("study_progress").upsert({ user_id: user.id, plan: PLAN_KEY, item_key: key, completed: true, updated_at: new Date().toISOString() }, { onConflict: "user_id,plan,item_key" });
      } else {
        await supabase.from("study_progress").delete().eq("user_id", user.id).eq("plan", PLAN_KEY).eq("item_key", key);
      }
    } else {
      setShakeKey((k) => k + 1);
      try {
        const updated = { ...checked, [key]: next };
        if (!next) delete updated[key];
        sessionStorage.setItem(`study_progress_${PLAN_KEY}`, JSON.stringify(updated));
      } catch {}
    }
  }, [checked, user, supabase]);

  useEffect(() => {
    const allIds = Object.values(DAY_QUESTIONS).flat().map((q) => q.id);
    supabase
      .from("questions")
      .select("id, category, title, difficulty")
      .in("id", allIds)
      .then(({ data }) => {
        if (!data?.length) return;
        const map: Record<string, { id: string; category: string; title: string; difficulty: string }> = {};
        data.forEach((q) => { map[q.id] = q; });
        setQuestionsMap(map);
      });
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const allItems = plan30.flatMap((d) => [
    ...d.core.map((_, i) => taskKey(d.day, "c", i)),
    taskKey(d.day, "drill"),
    taskKey(d.day, "deliv"),
  ]);
  const total = allItems.length;
  const done = allItems.filter((k) => checked[k]).length;
  const pct = total > 0 ? Math.round((done / total) * 100) : 0;

  function getDayProgress(d: Day30) {
    const t = d.core.length + 2;
    const dn = d.core.filter((_, i) => checked[taskKey(d.day, "c", i)]).length +
      (checked[taskKey(d.day, "drill")] ? 1 : 0) + (checked[taskKey(d.day, "deliv")] ? 1 : 0);
    return { done: dn, total: t };
  }

  return (
    <main className="max-w-4xl mx-auto px-6 py-12">
      <h1 className="text-3xl font-extrabold tracking-tight text-gray-900 mb-1">30-Day FDE Study Plan</h1>
      <p className="text-lg text-gray-500 mb-8">~4h / day · ~120h total · Complete preparation — depth, mocks, and final polish.</p>

      {/* Progress */}
      <div className="mb-6 border border-gray-200 rounded-2xl px-5 py-4 bg-white flex flex-col sm:flex-row sm:items-center gap-4">
        <div className="flex-1">
          <div className="flex items-center gap-3 mb-1">
            <span className="font-bold text-gray-900">Overall Progress</span>
            <span className="text-sm font-semibold text-gray-600">{done}/{total} tasks done</span>
          </div>
          <p className="text-sm text-gray-500">Click any day card to open its tasks and check them off.</p>
        </div>
        <div className="sm:w-48 shrink-0">
          <div className="flex items-center justify-between text-xs text-gray-500 mb-1">
            <span>Completion</span>
            <span className="font-semibold text-gray-900">{pct}%</span>
          </div>
          <div className="h-2 bg-gray-100 rounded-full overflow-hidden">
            <div className="h-full bg-gray-900 rounded-full transition-all duration-300" style={{ width: `${pct}%` }} />
          </div>
        </div>
      </div>

      {/* Sign-in CTA */}
      {!user && (
        <div key={shakeKey} className={`mb-6 flex items-center gap-3 px-4 py-3 bg-yellow-100 rounded-xl text-sm ${shakeKey > 0 ? "animate-shake" : ""}`}>
          <span className="text-yellow-600">💾</span>
          <span className="text-yellow-800">Progress saved in this session. <Link href="/login" className="font-semibold underline">Sign in</Link> to save your progress permanently.</span>
        </div>
      )}

      {/* 30-Day Plan */}
      <div className="space-y-8">
        {WEEK_META.map((wm) => {
          const days = plan30.filter((d) => d.week === wm.week);
          return (
            <div key={wm.week}>
              <div className="flex items-center gap-3 mb-3">
                <span className={`text-xs font-semibold px-2.5 py-1 rounded-md border ${wm.color}`}>{wm.label}</span>
                <span className="font-semibold text-gray-800 text-sm">{wm.title}</span>
              </div>
              <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-3">
                {days.map((d) => {
                  const { done: dn, total: t } = getDayProgress(d);
                  const isDone = dn === t;
                  return (
                    <button
                      key={d.day}
                      onClick={() => setModal(d)}
                      className={`text-left border rounded-xl p-4 transition-all hover:shadow-md hover:-translate-y-0.5 ${
                        isDone ? "border-gray-200 bg-gray-50 opacity-70" : "border-gray-200 bg-white hover:border-gray-400"
                      }`}
                    >
                      <div className="flex items-center justify-between mb-2">
                        <span className="text-xs font-mono text-gray-400">Day {d.day}</span>
                        {isDone && <span className="text-xs text-green-600 font-medium">Done</span>}
                      </div>
                      <div className={`text-sm font-semibold leading-snug mb-3 ${isDone ? "line-through text-gray-400" : "text-gray-800"}`}>
                        {d.title}
                      </div>
                      <div className="flex items-center gap-2">
                        <div className="flex-1 h-1.5 bg-gray-100 rounded-full overflow-hidden">
                          <div className="h-full bg-gray-800 rounded-full transition-all" style={{ width: `${(dn / t) * 100}%` }} />
                        </div>
                        <span className="text-xs text-gray-400">{dn}/{t}</span>
                      </div>
                    </button>
                  );
                })}
              </div>
            </div>
          );
        })}
      </div>

      {/* CTA */}
      <div className="mt-10 text-center">
        <Link href="/practice" className="inline-block bg-gray-900 text-white text-sm font-semibold px-6 py-3 rounded-xl hover:bg-gray-700 transition-colors">
          Practice Questions →
        </Link>
      </div>

      {/* Day Modal */}
      {modal && (
        <div className="fixed inset-0 bg-black/50 z-50 flex items-start justify-center p-4 sm:p-8 overflow-y-auto" onClick={() => setModal(null)}>
          <div className="bg-white rounded-2xl w-full max-w-2xl shadow-2xl my-auto" onClick={(e) => e.stopPropagation()}>
            <div className="px-6 pt-6 pb-4 border-b border-gray-100">
              <div className="flex items-start justify-between gap-4">
                <div>
                  {(() => {
                    const wm = WEEK_META.find((w) => w.week === modal.week)!;
                    return <span className={`text-xs font-semibold px-2 py-0.5 rounded border ${wm.color} mb-2 inline-block`}>{wm.label} · Day {modal.day}</span>;
                  })()}
                  <h2 className="text-xl font-bold text-gray-900">{modal.title}</h2>
                </div>
                <button onClick={() => setModal(null)} className="text-gray-400 hover:text-gray-600 text-2xl leading-none shrink-0">×</button>
              </div>
              <p className="text-sm text-gray-500 mt-2">{modal.objective}</p>
            </div>

            <div className="px-6 py-4 space-y-4">
              {(() => {
                const dayQs = (DAY_QUESTIONS[modal.day] ?? [])
                  .map((q) => questionsMap[q.id])
                  .filter((q): q is NonNullable<typeof q> => q != null);
                if (!dayQs.length) return null;
                return (
                  <div className="rounded-xl overflow-hidden border border-indigo-100 bg-indigo-50">
                    <div className="px-4 py-2.5 bg-indigo-600 flex items-center gap-2">
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="white" strokeWidth={2.5}><path strokeLinecap="round" strokeLinejoin="round" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" /></svg>
                      <span className="text-xs font-bold text-white uppercase tracking-wider">Practice Questions</span>
                      <span className="ml-auto text-xs text-indigo-200">{dayQs.length} questions</span>
                    </div>
                    <div className="divide-y divide-indigo-100">
                      {dayQs.map((q) => (
                        <Link
                          key={q.id}
                          href={`/practice/${q.category}/${q.id}`}
                          onClick={() => setModal(null)}
                          className="flex items-center gap-2.5 px-4 py-3 hover:bg-indigo-100/60 transition-colors group"
                        >
                          <span className={`text-xs px-1.5 py-0.5 rounded font-semibold shrink-0 ${CATEGORY_COLOR[q.category] ?? "bg-gray-100 text-gray-500"}`}>
                            {CATEGORY_LABEL[q.category] ?? q.category}
                          </span>
                          <span className={`text-xs px-1.5 py-0.5 rounded font-medium shrink-0 ${DIFFICULTY_COLOR[q.difficulty] ?? ""}`}>
                            {q.difficulty}
                          </span>
                          <span className="text-sm text-gray-800 group-hover:text-gray-900 line-clamp-1 flex-1">{q.title}</span>
                          <svg className="w-3.5 h-3.5 text-indigo-300 group-hover:text-indigo-500 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}><path strokeLinecap="round" strokeLinejoin="round" d="M9 5l7 7-7 7" /></svg>
                        </Link>
                      ))}
                    </div>
                  </div>
                );
              })()}

              <div>
                <div className="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-2">Core Work</div>
                <div className="space-y-2">
                  {modal.core.map((task, i) => {
                    const key = taskKey(modal.day, "c", i);
                    return (
                      <div key={i} className={`flex items-start gap-3 p-3 rounded-lg cursor-pointer transition-colors ${checked[key] ? "bg-gray-50" : "hover:bg-gray-50"}`} onClick={() => toggle(key)}>
                        <CheckBox checked={!!checked[key]} onToggle={() => toggle(key)} />
                        <span className={`text-sm ${checked[key] ? "line-through text-gray-400" : "text-gray-700"}`}>{task}</span>
                      </div>
                    );
                  })}
                </div>
              </div>

              <div>
                <div className="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-2">Interview Drill</div>
                <div className={`flex items-start gap-3 p-3 rounded-lg cursor-pointer transition-colors ${checked[taskKey(modal.day, "drill")] ? "bg-gray-50" : "hover:bg-gray-50"}`} onClick={() => toggle(taskKey(modal.day, "drill"))}>
                  <CheckBox checked={!!checked[taskKey(modal.day, "drill")]} onToggle={() => toggle(taskKey(modal.day, "drill"))} />
                  <span className={`text-sm ${checked[taskKey(modal.day, "drill")] ? "line-through text-gray-400" : "text-gray-700"}`}>{modal.drill}</span>
                </div>
              </div>

              <div>
                <div className="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-2">Daily Deliverable</div>
                <div className={`flex items-start gap-3 p-3 rounded-lg cursor-pointer transition-colors ${checked[taskKey(modal.day, "deliv")] ? "bg-gray-50" : "hover:bg-gray-50"}`} onClick={() => toggle(taskKey(modal.day, "deliv"))}>
                  <CheckBox checked={!!checked[taskKey(modal.day, "deliv")]} onToggle={() => toggle(taskKey(modal.day, "deliv"))} />
                  <span className={`text-sm ${checked[taskKey(modal.day, "deliv")] ? "line-through text-gray-400" : "text-gray-700"}`}>{modal.deliverable}</span>
                </div>
              </div>

            </div>

            <div className="px-6 pb-5 flex items-center justify-between">
              <div className="flex gap-2">
                {modal.day > 1 && <button onClick={() => setModal(plan30[modal.day - 2])} className="text-sm px-3 py-1.5 border rounded-lg hover:bg-gray-50">← Day {modal.day - 1}</button>}
                {modal.day < 30 && <button onClick={() => setModal(plan30[modal.day])} className="text-sm px-3 py-1.5 border rounded-lg hover:bg-gray-50">Day {modal.day + 1} →</button>}
              </div>
              <button onClick={() => setModal(null)} className="text-sm px-4 py-1.5 bg-gray-900 text-white rounded-lg hover:bg-gray-700">Done</button>
            </div>
          </div>
        </div>
      )}
    </main>
  );
}
