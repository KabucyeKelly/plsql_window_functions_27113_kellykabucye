
-- 1. RANK() – Top members based on total savings
SELECT m.member_id, m.full_name, SUM(s.amount) AS total_savings,
       RANK() OVER (ORDER BY SUM(s.amount) DESC) AS rank_savings
FROM members m
JOIN savings s ON m.member_id = s.member_id
GROUP BY m.member_id, m.full_name
ORDER BY rank_savings;

-- 2. SUM() OVER() – Running total of savings per member
SELECT m.member_id, m.full_name, s.amount,
       SUM(s.amount) OVER (PARTITION BY m.member_id ORDER BY s.savings_id) AS running_total
FROM members m
JOIN savings s ON m.member_id = s.member_id
ORDER BY m.member_id, s.savings_id;

-- 3. LAG() – Month-over-month growth in savings
-- Assumes you have a date column in savings called saved_at
SELECT TO_CHAR(s.saved_at, 'YYYY-MM') AS month,
       SUM(s.amount) AS monthly_savings,
       LAG(SUM(s.amount)) OVER (ORDER BY TO_CHAR(s.saved_at, 'YYYY-MM')) AS prev_month,
       ROUND(
         (SUM(s.amount) - LAG(SUM(s.amount)) OVER (ORDER BY TO_CHAR(s.saved_at, 'YYYY-MM')))
         / NULLIF(LAG(SUM(s.amount)) OVER (ORDER BY TO_CHAR(s.saved_at, 'YYYY-MM')),0) * 100, 2
       ) AS growth_percent
FROM savings s
GROUP BY TO_CHAR(s.saved_at, 'YYYY-MM')
ORDER BY month;

-- 4. NTILE(4) – Segment members into loyalty quartiles based on number of savings deposits
SELECT m.member_id, m.full_name, COUNT(s.savings_id) AS deposit_count,
       NTILE(4) OVER (ORDER BY COUNT(s.savings_id) DESC) AS quartile
FROM members m
JOIN savings s ON m.member_id = s.member_id
GROUP BY m.member_id, m.full_name
ORDER BY quartile, deposit_count DESC;

-- 5. AVG() OVER() – 3-month rolling average of savings per member
SELECT TO_CHAR(s.saved_at, 'YYYY-MM') AS month,
       SUM(s.amount) AS monthly_savings,
       ROUND(
         AVG(SUM(s.amount)) OVER (
           ORDER BY TO_CHAR(s.saved_at, 'YYYY-MM') ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
         ), 2
       ) AS three_month_avg
FROM savings s
GROUP BY TO_CHAR(s.saved_at, 'YYYY-MM')
ORDER BY month;

