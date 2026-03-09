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

### Result

| total_employees |
|----------------|
| 10000 |







