
-- 1. INNER JOIN – Members with Savings
-- Shows all members who have made at least one savings deposit
SELECT m.member_id, m.full_name, s.amount
FROM members m
INNER JOIN savings s ON m.member_id = s.member_id;

-- 2. INNER JOIN – Members with Active Loans
-- Shows members who currently have active loans
SELECT m.member_id, m.full_name, l.loan_type, l.amount, l.status
FROM members m
INNER JOIN loans l ON m.member_id = l.member_id
WHERE l.status = 'Active';

-- 3. LEFT JOIN – Members Without Savings
-- Finds members who have not yet made a savings deposit
SELECT m.member_id, m.full_name, s.amount
FROM members m
LEFT JOIN savings s ON m.member_id = s.member_id
WHERE s.amount IS NULL;

-- 4. RIGHT JOIN / FULL JOIN – Loan and Member Comparison
-- Ensures all loans are linked to members (FULL OUTER JOIN)
SELECT m.member_id, m.full_name, l.loan_id, l.amount, l.status
FROM members m
FULL OUTER JOIN loans l ON m.member_id = l.member_id
ORDER BY m.member_id;

-- 5. SELF JOIN – Compare Members in Same Employment Type
-- Compares members who share the same employment_type
SELECT a.member_id AS member1_id, a.full_name AS member1_name,
       b.member_id AS member2_id, b.full_name AS member2_name,
       a.employment_type
FROM members a
INNER JOIN members b ON a.employment_type = b.employment_type
WHERE a.member_id <> b.member_id
ORDER BY a.employment_type;

