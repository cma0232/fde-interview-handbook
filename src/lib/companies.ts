export type CompanyGuide = {
  slug: string;
  name: string;
  tagline: string;
  description: string;
  logo: string;
  careersUrl: string;
  whatTheyBuild: string;
  fdeSummary: string;
  skills: string[];
  interviewStages: { title: string; description: string }[];
  faqs: { q: string; a: string }[];
};

function favicon(domain: string) {
  return `https://www.google.com/s2/favicons?domain=${domain}&sz=128`;
}

export const COMPANY_GUIDES: CompanyGuide[] = [
  {
    slug: "palantir",
    name: "Palantir",
    tagline: "Forward Deployed Engineer at Palantir",
    description: "Palantir's FDE role is one of the most demanding and well-known in the industry. FDEs embed directly at customer sites — government agencies, defense contractors, hospitals — and build mission-critical software in the field.",
    logo: favicon("palantir.com"),
    careersUrl: "https://www.palantir.com/careers/",
    whatTheyBuild: "Palantir builds Gotham (defense/intelligence), Foundry (commercial data ops), and AIP (AI platform). FDEs deploy and extend these platforms for individual customers.",
    fdeSummary: "Palantir FDEs are expected to write production-quality code on-site, run technical demos, drive adoption, and act as the primary technical contact for major enterprise clients. The role is roughly 60% engineering, 40% customer-facing.",
    skills: ["Python", "SQL", "TypeScript/JavaScript", "Data pipelines", "System design", "Customer communication", "Rapid prototyping"],
    interviewStages: [
      { title: "Resume screen", description: "Focus on technical depth and evidence of impact. Palantir looks for candidates who have shipped real software." },
      { title: "Decomposition exercise", description: "Given a vague problem (often a real customer scenario), break it into components and propose a solution. Tests structured thinking." },
      { title: "Technical interview", description: "Coding (algorithms + SQL) and system design. Expect questions about data models, pipeline architecture, and trade-offs." },
      { title: "Culture interview", description: "Mission alignment. Palantir cares deeply about why you want to work there — generic answers won't pass." },
      { title: "On-site / final round", description: "Full loop with engineering and business teams. Includes a live demo exercise and customer scenario roleplay." },
    ],
    faqs: [
      { q: "Is the Palantir FDE role more engineering or consulting?", a: "More engineering. You write production code on-site. It's not consulting — you own the technical outcome, not just the advice." },
      { q: "Do Palantir FDEs travel a lot?", a: "Yes. Expect 50-80% travel, especially early in your tenure. You're physically embedded at customer sites." },
      { q: "What coding language does Palantir use for FDE interviews?", a: "Python is most common. SQL is tested heavily. Occasionally TypeScript for front-end scenarios." },
      { q: "How hard is it to get a Palantir FDE offer?", a: "Very competitive. Acceptance rate is estimated under 2%. The bar for both technical skill and mission alignment is high." },
    ],
  },
  {
    slug: "databricks",
    name: "Databricks",
    tagline: "Forward Deployed Engineer at Databricks",
    description: "Databricks FDEs (called Solutions Engineers or Field Engineers internally) work with enterprise data and AI teams to implement the Databricks Lakehouse platform. The role sits at the intersection of data engineering, ML, and enterprise sales.",
    logo: favicon("databricks.com"),
    careersUrl: "https://www.databricks.com/company/careers",
    whatTheyBuild: "Databricks builds the Lakehouse Platform — Delta Lake, Apache Spark, MLflow, Unity Catalog. FDEs help customers migrate data workloads, build ML pipelines, and deploy AI applications.",
    fdeSummary: "Databricks FDEs are senior technical advisors who run workshops, build POCs, and guide customer architecture decisions. Expect to be fluent in Spark, Python, and cloud infrastructure (AWS/Azure/GCP).",
    skills: ["Apache Spark", "Python", "SQL", "Delta Lake", "MLflow", "Cloud platforms (AWS/Azure/GCP)", "Data engineering", "ML/AI pipelines"],
    interviewStages: [
      { title: "Recruiter screen", description: "Background and motivation. Be ready to explain your data engineering and/or ML experience." },
      { title: "Technical phone screen", description: "Coding problem (Python/SQL) and a discussion of a data architecture you've built or debugged." },
      { title: "Platform demo", description: "Build a live Databricks notebook solving a real-world data problem. Tests hands-on familiarity with the platform." },
      { title: "Customer scenario", description: "Role-play a customer conversation: handle technical objections, explain trade-offs, guide architecture decisions." },
      { title: "Final panel", description: "Loop with engineering, sales, and product. Tests cross-functional communication and strategic thinking." },
    ],
    faqs: [
      { q: "Do I need to know Spark to interview at Databricks?", a: "Yes. Deep Spark knowledge is expected for FDE roles. Know how to optimize jobs, debug failures, and explain the execution model." },
      { q: "Is the Databricks FDE role quota-carrying?", a: "Sometimes. Some FDE roles are tied to sales targets, others are pure technical. Check the specific job description." },
      { q: "What cloud platform does Databricks focus on?", a: "All three — AWS, Azure, and GCP — but Azure is historically strongest due to the Microsoft partnership." },
      { q: "How technical is the Databricks FDE interview?", a: "Very. The platform demo round separates candidates who have used Databricks in production from those who haven't." },
    ],
  },
  {
    slug: "scale-ai",
    name: "Scale AI",
    tagline: "Forward Deployed Engineer at Scale AI",
    description: "Scale AI FDEs work at the frontier of AI deployment, helping enterprise and government customers build, evaluate, and improve AI systems. The role is heavily focused on LLM evaluation, data pipelines, and AI quality.",
    logo: favicon("scale.com"),
    careersUrl: "https://scale.com/careers",
    whatTheyBuild: "Scale AI builds data annotation infrastructure, RLHF pipelines, and AI evaluation platforms. FDEs help customers integrate Scale's APIs, design evaluation frameworks, and deploy AI applications at scale.",
    fdeSummary: "Scale AI FDEs are expected to understand LLM internals, evaluation methodology, and enterprise data pipelines. The role is newer and fast-evolving — expect ambiguity and rapid product changes.",
    skills: ["Python", "LLM APIs (OpenAI, Anthropic, etc.)", "Prompt engineering", "Data pipelines", "AI evaluation", "REST APIs", "Statistical analysis"],
    interviewStages: [
      { title: "Recruiter screen", description: "Background check focused on AI/ML experience and customer-facing work." },
      { title: "Technical interview", description: "Python coding + questions about LLMs, evaluation metrics, and data quality." },
      { title: "AI system design", description: "Design an end-to-end AI pipeline for a real use case. Tests understanding of the full ML lifecycle." },
      { title: "Customer scenario", description: "How would you help a Fortune 500 company evaluate and improve their LLM application? Tests communication and strategic thinking." },
      { title: "Final round", description: "Panel with engineering and GTM leadership. Emphasis on mission alignment with AI safety and responsible AI." },
    ],
    faqs: [
      { q: "Do I need ML research experience for Scale AI FDE?", a: "Not research experience, but production AI experience matters. Know how to evaluate models, handle data quality issues, and debug AI systems." },
      { q: "Is Scale AI FDE more focused on government or enterprise?", a: "Both. Scale has a strong government/defense vertical (Donovan) and a growing enterprise AI business. FDE roles vary by team." },
      { q: "How important is prompt engineering for Scale AI FDE interviews?", a: "Very. Be ready to write and evaluate prompts, discuss evaluation strategies, and talk about LLM failure modes." },
      { q: "What sets Scale AI FDE apart from other FDE roles?", a: "The AI-native focus. You're not deploying legacy enterprise software — you're working on cutting-edge AI systems, often before best practices exist." },
    ],
  },
  {
    slug: "anduril",
    name: "Anduril",
    tagline: "Forward Deployed Engineer at Anduril",
    description: "Anduril FDEs work at the intersection of defense technology and software engineering, deploying autonomous systems and AI capabilities for US military and allied government customers.",
    logo: favicon("anduril.com"),
    careersUrl: "https://www.anduril.com/open-roles/",
    whatTheyBuild: "Anduril builds autonomous defense systems — Lattice (AI command software), Ghost (autonomous drones), Sentry Tower (autonomous surveillance). FDEs deploy and customize these systems for specific mission requirements.",
    fdeSummary: "Anduril FDEs must be comfortable in operational environments, often working alongside military personnel. The role requires strong systems programming skills, real-time software experience, and mission-driven motivation.",
    skills: ["C++", "Python", "ROS/robotics", "Distributed systems", "Real-time systems", "Linux", "Networking", "Mission planning systems"],
    interviewStages: [
      { title: "Recruiter screen", description: "Background and motivation. Mission alignment is paramount — Anduril asks why you want to work in defense tech." },
      { title: "Technical screen", description: "Systems programming (C++ or Python), algorithms, and a discussion of real-time or distributed systems experience." },
      { title: "Systems design", description: "Design a real-time command-and-control or sensor fusion system. Tests understanding of latency, reliability, and safety constraints." },
      { title: "On-site loop", description: "Multiple rounds including coding, systems design, and culture fit. Expect hands-on hardware/software integration questions." },
      { title: "Clearance check", description: "Many Anduril FDE roles require or prefer a security clearance. Active clearance is a significant advantage." },
    ],
    faqs: [
      { q: "Do I need a security clearance for Anduril FDE?", a: "Not always, but it helps significantly. Anduril can sponsor clearances, but active clearance holders move faster through the process." },
      { q: "Is Anduril FDE open to software engineers without defense experience?", a: "Yes, but mission alignment is non-negotiable. If you're not genuinely interested in national security and defense technology, it will show." },
      { q: "What programming languages does Anduril use?", a: "C++ for systems-critical code, Python for tooling and data work. Some teams use Rust. Know your fundamentals well." },
      { q: "How is working at Anduril different from other FDE roles?", a: "The operational context. You may be on a military base, in a field environment, or working with classified systems. The stakes feel much higher." },
    ],
  },
  {
    slug: "google",
    name: "Google",
    tagline: "Forward Deployed Engineer at Google",
    description: "Google's FDE roles (often titled Customer Engineer or Applied AI Engineer) sit within Google Cloud and DeepMind teams. FDEs help enterprise customers adopt Google Cloud, Vertex AI, and Gemini-powered applications.",
    logo: favicon("google.com"),
    careersUrl: "https://careers.google.com/",
    whatTheyBuild: "Google Cloud Platform, Vertex AI, BigQuery, Gemini API. FDEs help customers migrate to GCP, build ML pipelines on Vertex, and deploy Gemini-powered enterprise applications.",
    fdeSummary: "Google FDEs (Customer Engineers) are senior technical advisors who run architecture reviews, build prototypes, and guide customers through complex cloud and AI migrations. The role requires broad cloud knowledge and strong presentation skills.",
    skills: ["Python", "SQL", "Google Cloud Platform", "Vertex AI / Gemini API", "BigQuery", "Kubernetes", "TensorFlow / JAX", "Enterprise architecture"],
    interviewStages: [
      { title: "Recruiter screen", description: "Background and experience with cloud platforms. Google looks for candidates with direct enterprise customer experience." },
      { title: "Technical phone screen", description: "Cloud architecture questions, coding (Python/SQL), and a discussion of a complex technical project you've led." },
      { title: "Customer scenario", description: "Present a solution to a real enterprise problem using Google Cloud. Tests communication, technical depth, and product knowledge." },
      { title: "On-site loop (4-5 rounds)", description: "Coding, systems design, Googleyness/leadership, and a cloud architecture deep-dive. Similar to SWE interviews with more customer focus." },
      { title: "Hiring committee review", description: "Google's standard HC process applies. FDE roles have slightly different leveling criteria emphasizing customer impact." },
    ],
    faqs: [
      { q: "Is the Google Customer Engineer role the same as FDE?", a: "Essentially yes. Google calls them Customer Engineers (CE) or Applied AI Engineers. The FDE title is used less formally internally." },
      { q: "How important is GCP knowledge for Google FDE interviews?", a: "Critical. Know the major GCP services deeply — especially BigQuery, Vertex AI, Cloud Run, and GKE. Hands-on experience is expected." },
      { q: "Does Google FDE require coding interviews?", a: "Yes. Expect LeetCode-style coding at the same level as SWE interviews, plus cloud architecture and customer scenario rounds." },
      { q: "What level does Google hire FDEs at?", a: "Typically L4-L6 (equivalent to SWE levels). L5+ is most common for experienced FDE candidates." },
    ],
  },
];

export function getCompanyGuide(slug: string): CompanyGuide | undefined {
  return COMPANY_GUIDES.find((c) => c.slug === slug);
}
