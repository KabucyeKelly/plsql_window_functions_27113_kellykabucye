# plsql_window_functions_27113_kellykabucye
SQL JOINs and Window Functions project – Umwalimu SACCO case study
# SQL JOINs & Window Functions Project  
**Course:** Database Development with PL/SQL (INSY 8311)  
**Student Name:** Kelly Kabucye  
**Student ID:** 27113  
**Institution:** Adventist University of Central Africa (AUCA)  
**DBMS Used:** PostgreSQL  

---

## 1. Business Problem

### Business Context
Umwalimu SACCO is a Savings and Credit Cooperative Organization in Rwanda serving teachers and education sector employees. It provides savings accounts, loans, and other financial services aimed at improving members’ financial welfare.

### Data Challenge
Although Umwalimu SACCO collects large volumes of member savings and loan data, management lacks analytical reports to track member engagement, savings growth, loan activity, and financial trends over time.

### Expected Outcome
The goal is to analyze member savings and loan data to identify financial trends, segment members based on activity, monitor growth patterns, and support better financial decision-making.

---

## 2. Success Criteria

1. Rank members based on savings activity → `RANK()`
2. Compute running totals of savings per member → `SUM() OVER()`
3. Analyze month-over-month growth → `LAG()`
4. Segment members into loyalty quartiles → `NTILE(4)`
5. Calculate moving averages for trend analysis → `AVG() OVER()`

---

## 3. Database Schema & ER Diagram

### Tables Used
- **MEMBERS** (`member_id`, full_name, national_id, phone, email, employment_type)
- **SAVINGS** (`savings_id`, member_id, amount)
- **LOANS** (`loan_id`, member_id, loan_type, amount, interest_rate, start_date, status)

### Relationships
- One member can have multiple savings records
- One member can have multiple loans

📸 ER Diagram is available in the `er_diagram/` folder.

---

## 4. SQL JOIN Implementations

### INNER JOIN – Members with Savings
Used to calculate total savings per member.

### INNER JOIN – Members with Active Loans
Used to identify members currently servicing loans.

### LEFT JOIN – Members Without Savings
Used to identify members who have not started saving.

### RIGHT JOIN / FULL JOIN – Data Consistency Check
Used to demonstrate understanding of advanced JOIN types.

### SELF JOIN – Member Comparison
Used to compare members within the same employment category.

📸 Screenshots are stored in `screenshots/joins/`

---

## 5. SQL Window Functions Implementation

### 5.1 Ranking Function – `RANK()`
Ranks members based on total savings contribution.

### 5.2 Aggregate Window Function – `SUM() OVER()`
Calculates running total of savings per member.

### 5.3 Navigation Function – `LAG()`
Analyzes period-to-period growth in savings or activity.

### 5.4 Distribution Function – `NTILE(4)`
Segments members into four loyalty quartiles.

### 5.5 Moving Average – `AVG() OVER()`
Calculates rolling averages to observe financial trends.

📸 Screenshots are stored in `screenshots/window_functions/`

---

## 6. Results Analysis

### Descriptive Analysis (What Happened?)
- A small group of members contributes most of the savings.
- Many members maintain low or irregular savings activity.
- Loan uptake is concentrated among active savers.

### Diagnostic Analysis (Why It Happened?)
- Regular salary deductions encourage consistent saving.
- Teachers with stable employment show higher financial engagement.
- New members have not fully adopted saving behavior.

### Prescriptive Analysis (What Should Be Done?)
- Introduce incentives to encourage inactive members to save.
- Reward consistent savers with better loan terms.
- Use segmentation to tailor financial products per member group.

---

## 7. References

- PostgreSQL Official Documentation  
- Mode Analytics SQL Window Functions Tutorial  
- W3Schools SQL Window Functions  
- LearnSQL Window Functions Guide  

---

## 8. Academic Integrity Statement

“All sources were properly cited. Implementations and analysis represent original work. No AI-generated content was copied without attribution or adaptation.”

---

## 9. Selected Screenshots

Selected screenshots demonstrating query execution and results are included to prove originality and personal work.
