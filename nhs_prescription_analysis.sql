-- NHS Prescription Cost Analysis — England 2025/26
-- BNF Chapter-Level Analysis
-- Google BigQuery SQL

-- 1. Overall Prescription KPIs
SELECT
  SUM(total_items) AS total_prescription_items,
  ROUND(SUM(total_cost), 2) AS total_prescription_cost,
  ROUND(SUM(total_cost) / SUM(total_items), 2) AS average_cost_per_item
FROM `businessanalyst-portfolio-2026.nhs_prescription_analysis.bnf_chapters_final`;


-- 2. BNF Chapters Ranked by Prescription Expenditure
SELECT
  bnf_chapter_name,
  total_items,
  ROUND(total_cost, 2) AS total_cost,
  ROUND(cost_per_item, 2) AS cost_per_item
FROM `businessanalyst-portfolio-2026.nhs_prescription_analysis.bnf_chapters_final`
ORDER BY total_cost DESC;


-- 3. Prescription Expenditure Share by BNF Chapter
SELECT
  bnf_chapter_name,
  ROUND(total_cost, 2) AS total_cost,
  ROUND(
    100 * total_cost / SUM(total_cost) OVER (),
    2
  ) AS cost_share_pct
FROM `businessanalyst-portfolio-2026.nhs_prescription_analysis.bnf_chapters_final`
ORDER BY total_cost DESC;


-- 4. BNF Chapters with the Highest Cost per Item
SELECT
  bnf_chapter_name,
  total_items,
  ROUND(total_cost, 2) AS total_cost,
  ROUND(cost_per_item, 2) AS cost_per_item
FROM `businessanalyst-portfolio-2026.nhs_prescription_analysis.bnf_chapters_final`
ORDER BY cost_per_item DESC
LIMIT 10;


-- 5. BNF Chapters with the Highest Prescription Volume
SELECT
  bnf_chapter_name,
  total_items,
  ROUND(total_cost, 2) AS total_cost
FROM `businessanalyst-portfolio-2026.nhs_prescription_analysis.bnf_chapters_final`
ORDER BY total_items DESC
LIMIT 10;
