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
Umwalimu SACCO is a Savings and Credit Cooperative Organization (SACCO) in Rwanda that primarily serves teachers and education sector employees. The SACCO provides financial services such as savings accounts, loans, and other credit facilities aimed at improving the financial stability and welfare of its members. As a member-owned financial institution, Umwalimu SACCO relies heavily on accurate financial data to guide decision-making and policy formulation.

### Data Challenge
Although Umwalimu SACCO collects large volumes of transactional data related to member savings and loans, the data is mostly stored in raw tables without advanced analytical reporting. Management faces challenges in identifying highly active members, tracking savings growth over time, monitoring loan activity, and understanding member engagement patterns. Without analytical insights, it becomes difficult to design targeted financial products, manage financial risk, and improve member participation.

### Expected Outcome
The objective of this project is to use SQL JOINs and Window Functions to transform raw transactional data into meaningful insights. The analysis aims to:
- Identify highly engaged members based on savings and loan activity
- Monitor cumulative savings growth over time
- Analyze trends and changes in financial behavior
- Segment members into loyalty groups
- Support data-driven decision-making for improved financial services

---

## 2. Success Criteria

1. Rank members based on savings activity → `RANK()`
2. Compute running totals of savings per member → `SUM() OVER()`
3. Analyze period-to-period growth → `LAG()`
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

 The ER diagram illustrating these relationships is included in the er_diagram folder.

---

## 4. SQL JOIN Implementations

### INNER JOIN – Members with Savings
Used to combine member and savings data to calculate total savings per member.

### INNER JOIN – Members with Active Loans
Used to identify members who currently have active loans.

### LEFT JOIN – Members Without Savings
Used to identify members who have not yet made any savings contributions.

### RIGHT JOIN / FULL JOIN – Data Consistency Verification
Used to demonstrate advanced JOIN usage and verify data completeness.

### SELF JOIN – Member Comparison
Used to compare members within the same employment category.

 Screenshots are stored in `screenshots/joins/`

---

## 5. SQL Window Functions Implementation

### 5.1 Ranking Function – `RANK()`
Ranks members based on total savings contribution, helping identify top savers.

### 5.2 Aggregate Window Function – `SUM() OVER()`
Calculates running totals of savings per member to track cumulative financial growth.

### 5.3 Navigation Function – `LAG()`
Compares current values with previous records to analyze changes and growth trends.

### 5.4 Distribution Function – `NTILE(4)`
Segments members into four loyalty quartiles based on savings activity.

### 5.5 Moving Average – `AVG() OVER()`
Calculates rolling averages to smooth fluctuations and observe long-term trends.

📸 Screenshots are stored in `screenshots/window_functions/`

---

## 6. Results Analysis

### 6.1 Descriptive Analysis (What Happened?)
The analysis shows that savings contributions are not evenly distributed among members. A relatively small group of members contributes a large proportion of total savings, while many members save irregularly or in small amounts. Loan activity is also concentrated among members who demonstrate consistent saving behavior.

### 6.2 Diagnostic Analysis (Why Did It Happen?)
Members with stable employment and regular income tend to save more consistently, which explains their higher savings and loan eligibility. New or less active members may lack financial awareness or confidence in the SACCO’s services. Additionally, salary-based savings deductions encourage disciplined saving among employed teachers.

### 6.3 Prescriptive Analysis (What Should Be Done?)
Umwalimu SACCO should introduce incentive programs to encourage inactive members to start saving regularly. Loyal savers could be rewarded with lower interest rates or faster loan approvals. Member segmentation results can be used to design tailored financial products and targeted financial literacy programs to increase engagement.

---

## 7. References

- PostgreSQL Official Documentation  
- Mode Analytics – SQL Window Functions  
- W3Schools – SQL Window Functions  
- LearnSQL – Window Functions Guide  

---

## 8. Academic Integrity Statement

“All sources were properly cited. Implementations and analysis represent original work. No AI-generated content was copied without attribution or adaptation.”

---

## 9. Selected Screenshots

Selected screenshots demonstrating SQL query execution and results are included in the repository to prove originality and personal work.
