# Banking Customer Risk & Transaction Analysis

## Overview
This project analyzes banking transaction data to understand **customer behavior, transaction patterns, and fraud risk**. The analysis focuses on identifying high-value transactions, evaluating fraud distribution, and deriving insights that support data-driven decision-making using **SQL, Python, and Power BI**.

---

## Dataset
The dataset used is the **PaySim Synthetic Financial Dataset for Fraud Detection**, which simulates real-world mobile money transactions.

- Total dataset size: ~6.3 million transactions  
- Working sample: ~55,000 transactions  
- Key fields:
  - `step` – time (in hours)
  - `type` – transaction type (PAYMENT, TRANSFER, CASH_OUT, etc.)
  - `amount` – transaction value
  - `nameOrig` – customer ID
  - `nameDest` – recipient ID
  - `oldbalanceOrg`, `newbalanceOrig` – sender balance
  - `isFraud` – fraud indicator (0/1)

---

## Objective
- Validate and prepare transaction data for analysis  
- Analyze customer transaction behavior  
- Identify high-value transactions and spending patterns  
- Detect fraud-prone transaction types  
- Build a dashboard to track key metrics  

---

## Data Preparation
The dataset was structured but required validation before analysis:

- Sampled ~55,000 records from the original dataset for efficient processing  
- Checked for duplicate records using SQL window functions (**no duplicates found**)  
- Identified and handled negligible missing values  
- Performed transaction consistency checks using debit–credit logic  
- Created derived features such as:
  - Customer transaction frequency  
  - Total spend per customer  
  - High-value transaction classification  

---

## Analysis Performed

### 1. Transaction Distribution
- PAYMENT transactions accounted for the **highest volume (~23K transactions)**  
- CASH_OUT and CASH_IN had **significantly higher average transaction values**  

---

### 2. Customer Behavior Analysis
- Identified that **~18% of customers contributed ~62% of total transaction value**  
- Highlighted concentration of transaction activity among high-value users  

---

### 3. Fraud Analysis
- Fraud was **entirely concentrated in TRANSFER and CASH_OUT transactions**  
- TRANSFER had the **highest fraud rate (~0.94%)**, followed by CASH_OUT (~0.33%)  
- No fraud observed in PAYMENT, CASH_IN, or DEBIT transactions  

---

### 4. Transaction Value vs Fraud Risk
- Low-value transactions had more fraud cases due to higher volume  
- However, **high-value transactions showed higher fraud probability (~0.20%) compared to low-value (~0.17%)**  
- Indicates increased risk per transaction for larger amounts  

---

### 5. Data Consistency Insight
- Approximately **58% of transactions showed balance inconsistencies** when validated using debit–credit logic  
- Indicates limitations in balance tracking within the dataset  
- Analysis focused on reliable features such as transaction amount and type  

---

## Dashboard
A Power BI dashboard was created to visualize:

- Transaction type distribution  
- Fraud distribution and fraud rate by type  
- High-value vs low-value transaction analysis  
- Customer behavior and segmentation  

---

## Tools & Technologies
- **SQL** – Data querying and analysis  
- **Python (Pandas)** – Data validation and preprocessing  
- **Power BI** – Data visualization and dashboarding  

---

## Project Structure

```bash
Banking-Customer-Risk-Transaction-Analysis/
├── data/
│   ├── raw_data.csv
│   └── cleaned_data.csv
│
├── notebooks/
│   └── data_cleaning_analysis.ipynb
│
├── sql/
│   └── analysis_queries.sql
│
├── dashboard/
│   └── powerbi_dashboard.pbix
│
└── README.md

```
---

## Key Takeaways
- Transaction value is **highly concentrated among a small group of customers**  
- Fraud is **not random and occurs only in specific transaction types**  
- **TRANSFER transactions carry the highest fraud risk**  
- High-value transactions have **higher fraud probability per transaction**  
- Data validation revealed **inconsistencies in balance fields**, requiring selective feature usage  

---

## Future Improvements
- Apply fraud detection models using machine learning  
- Perform deeper time-based trend analysis  
- Enhance dashboard with additional filters and drill-down features  

---

## Contact
**Ajay Tiwari**  
📧 tiwariajay110125@gmail.com  
🔗 LinkedIn: https://www.linkedin.com/in/ajay-tiwari-849725284/  
🔗 Portfolio: https://ajay-tiwari94-portfolio.vercel.app/  