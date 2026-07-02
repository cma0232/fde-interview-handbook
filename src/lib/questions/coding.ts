import { Question } from "@/types";

const questions: Question[] = [
  {
    id: "c1",
    category: "coding",
    title: "Write a SQL query to find the top 3 SKUs by revenue per region.",
    difficulty: "medium",
    content: `Given the following schema:

\`\`\`sql
orders (order_id, sku_id, region, quantity, unit_price, order_date)
\`\`\`

Write a SQL query that returns the **top 3 SKUs by total revenue for each region**, for the last 30 days.

Output columns: \`region\`, \`sku_id\`, \`total_revenue\`, \`rank\``,
    hints: [
      "Window functions: ROW_NUMBER() or RANK() OVER (PARTITION BY region ORDER BY total_revenue DESC)",
      "Filter by order_date in a CTE first, then rank.",
    ],
    solution: `\`\`\`sql
WITH revenue AS (
  SELECT
    region,
    sku_id,
    SUM(quantity * unit_price) AS total_revenue
  FROM orders
  WHERE order_date >= CURRENT_DATE - INTERVAL '30 days'
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
\`\`\``,
  },
  {
    id: "c2",
    category: "coding",
    title: "Given a CSV of IoT sensor readings, detect anomalies in Python.",
    difficulty: "medium",
    content: `You have a CSV with columns: \`timestamp\`, \`sensor_id\`, \`value\`.

Write a Python function that:
1. Loads the CSV
2. For each sensor, flags readings that are more than **3 standard deviations** from that sensor's mean
3. Returns a DataFrame of anomalous readings with an added \`z_score\` column`,
    hints: [
      "Group by sensor_id, then compute mean and std per group.",
      "pandas transform() lets you compute group stats while preserving the original index.",
    ],
    solution: `\`\`\`python
import pandas as pd

def detect_anomalies(csv_path: str) -> pd.DataFrame:
    df = pd.read_csv(csv_path, parse_dates=["timestamp"])

    df["mean"] = df.groupby("sensor_id")["value"].transform("mean")
    df["std"] = df.groupby("sensor_id")["value"].transform("std")
    df["z_score"] = (df["value"] - df["mean"]) / df["std"]

    anomalies = df[df["z_score"].abs() > 3].copy()
    return anomalies[["timestamp", "sensor_id", "value", "z_score"]]
\`\`\``,
  },
  {
    id: "c3",
    category: "coding",
    title: "Implement a rate limiter with a sliding window in TypeScript.",
    difficulty: "hard",
    content: `Implement a \`RateLimiter\` class in TypeScript that:

- Allows at most **N requests per M seconds** per key (e.g., user ID)
- Uses a **sliding window** algorithm (not fixed window)
- Has methods: \`allow(key: string): boolean\`

\`\`\`typescript
const limiter = new RateLimiter({ maxRequests: 10, windowMs: 60_000 });
limiter.allow("user_123"); // true or false
\`\`\``,
    hints: [
      "Store a list of timestamps per key. On each request, remove timestamps older than windowMs, then check count.",
      "This is O(N) per request — acceptable for most use cases.",
    ],
    solution: `\`\`\`typescript
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
\`\`\``,
  },
];

export default questions;
