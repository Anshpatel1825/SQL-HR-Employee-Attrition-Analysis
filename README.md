# 📊 SQL HR Employee Attrition Analysis

## 📌 Project Overview

This project analyzes **employee attrition trends using SQL**.

The dataset contains **10,000 employee records** with information about employee demographics, department, salary, experience, promotion history, and attrition status.

The goal of this project is to use **SQL queries to explore HR data and generate business insights** that help organizations understand workforce behavior and employee attrition.

---

# 🎯 Project Objectives

The objectives of this project are:

- Explore HR employee data using SQL
- Validate dataset quality
- Analyze employee attrition patterns
- Study salary and experience impact
- Identify high-risk employees
- Generate HR business insights

---

# 🗂 Dataset Information

Total Records: **10,000 Employees**

Important Columns:

- Employee_ID
- Age
- Gender
- Department
- Job_Role
- Monthly_Income
- Years_at_Company
- Attrition
- Distance_From_Home
- Work_Environment_Satisfaction
- Income_Category
- Experience_Level
- Promotion_Status
- Risk_Flag

Additional columns were created during data preparation to support better analysis.

---

# 💾 Step 1: Data Validation

Before analysis, SQL queries were used to validate the dataset.

## Total Employees

```sql
SELECT COUNT(*) AS total_employees
FROM employees;
```
### Result

| total_employees |
|----------------|
| 10000 |


📌 **Insight**

The dataset contains **10,000 employee records**.


## Duplicate Record Check

```sql
SELECT Employee_ID, COUNT(*)
FROM employees
GROUP BY Employee_ID
HAVING COUNT(*) > 1;
```

### Result

| Employee_ID | Count |
|-------------|------|
| No duplicate records found | |

📌 **Insight**

Each employee record is **unique**.


## Missing Value Check

```sql
SELECT *
FROM employees
WHERE Monthly_Income IS NULL;
```

### Result

| Result |
|--------|
| No missing values found |

📌 **Insight**

The dataset is **clean and reliable for analysis**.



# 📊 Step 2: Employee Attrition Analysis


## Employees Who Left the Company

```sql
SELECT Attrition, COUNT(*) AS employee_count
FROM employees
GROUP BY Attrition;
```
### Result

| Attrition | Employees |
|----------|-----------|
| No | 8003 |
| Yes | 1997 |

📌 **Insight**

A total of **1,997 employees left the company**.



## Attrition Rate
```sql
SELECT 
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS attrition_rate
FROM employees;
```
### Result

| Attrition Rate |
|---------------|
| 19.97% |

📌 **Insight**

Almost **1 in every 5 employees leaves the company**.


# 📊 Step 3: Department Analysis
## Unique Departments 
```sql
SELECT DISTINCT Department
FROM employees;
```


### Result

| Departments |
|-------------|
| Finance |
| HR |
| Marketing |
| Sales |
| IT |

📌 **Insight**

The company workforce is distributed across **five main departments**.



## Department Attrition
```sql
SELECT Department,
COUNT(*) AS attrition_count
FROM employees
WHERE Attrition='Yes'
GROUP BY Department;
```
### Result

| Department | Attrition |
|------------|-----------|
| Finance | 415 |
| Marketing | 413 |
| Sales | 398 |
| IT | 390 |
| HR | 381 |

📌 **Insight**

Attrition occurs across **all departments**, with **Finance and Marketing slightly higher**.


# 📊 Step 4: Income Category Analysis
## Employee Distribution by Income
```sql
SELECT Income_Category,
COUNT(*) AS employees
FROM employees
GROUP BY Income_Category;
```
### Result

| Income Category | Employees |
|-----------------|-----------|
| Medium | 5871 |
| High | 2908 |
| Low | 1221 |

📌 **Insight**

Most employees belong to the **medium salary group**.


## Attrition by Income Category
```sql
SELECT Income_Category,
COUNT(*) AS attrition_count
FROM employees
WHERE Attrition='Yes'
GROUP BY Income_Category;
```

### Result

| Income Category | Attrition |
|-----------------|-----------|
| Medium | 1176 |
| High | 587 |
| Low | 234 |

📌 **Insight**

Employees in the **medium income category** show the **highest attrition**.


# 📊 Step 5: Experience Level Analysis
## Employee Distribution by Experience
```sql
SELECT Experience_Level,
COUNT(*) AS employees
FROM employees
GROUP BY Experience_Level;
```

### Result

| Experience Level | Employees |
|------------------|-----------|
| Senior | 7194 |
| Mid | 1771 |
| Junior | 1035 |

📌 **Insight**

The workforce mainly consists of **senior employees**.


## Attrition by Experience
```sql
SELECT Experience_Level,
COUNT(*) AS attrition_count
FROM employees
WHERE Attrition='Yes'
GROUP BY Experience_Level;
```
### Result

| Experience Level | Attrition |
|------------------|-----------|
| Senior | 1438 |
| Mid | 359 |
| Junior | 200 |

📌 **Insight**

Most attrition occurs among **senior employees**.


# 📊 Step 6: Promotion Analysis
## Promotion Distribution
```sql
SELECT Promotion_Status,
COUNT(*) AS employees
FROM employees
GROUP BY Promotion_Status;
```
### Result

| Promotion Status | Employees |
|------------------|-----------|
| Recently Promoted | 5020 |
| No Promotion 5+ Years | 4980 |

📌 **Insight**

Promotion distribution is **almost balanced across employees**.


## Attrition by Promotion Status
``` sql
SELECT Promotion_Status,
COUNT(*) AS attrition_count
FROM employees
WHERE Attrition='Yes'
GROUP BY Promotion_Status;
```
### Result

| Promotion Status | Attrition |
|------------------|-----------|
| Recently Promoted | 1021 |
| No Promotion 5+ Years | 976 |

📌 **Insight**

Promotion delay alone **does not fully explain employee attrition**.


# 📊 Step 7: High Risk Employee Analysis
```sql
SELECT Risk_Flag,
COUNT(*) AS employees
FROM employees
GROUP BY Risk_Flag;
```
### Result

| Risk Flag | Employees |
|-----------|-----------|
| Normal | 9440 |
| High Risk | 560 |

📌 **Insight**

Around **5.6% employees** are classified as **high risk**.

These employees may leave the company if **retention strategies are not implemented**.


## 🧠 Key Business Insights

From the SQL analysis:

- The company has a **19.97% attrition rate**
- Most employees fall into the **medium salary band**
- The workforce mainly consists of **senior employees**
- Attrition is distributed across **all departments**
- Around **560 employees are classified as high risk**

These insights help HR teams **improve employee retention strategies**.

---

## 🛠 SQL Concepts Used

This project demonstrates the use of:

- SELECT  
- WHERE  
- GROUP BY  
- ORDER BY  
- Aggregate Functions  
- CASE WHEN  
- Data Validation Queries  

---

## 📈 Business Value

This SQL analysis helps organizations:

- Identify attrition trends  
- Monitor workforce distribution  
- Detect high-risk employees  
- Improve HR decision making  

---

## 👨‍💻 Author

**Ansh Patel**  
Data Analyst Portfolio Project







