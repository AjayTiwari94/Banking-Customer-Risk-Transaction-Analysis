# Banking Customer Risk & Transaction Analysis

## Overview
This project focuses on analyzing banking transaction data to understand customer behavior, identify high-value transactions, and detect unusual transaction patterns. The analysis is performed using SQL, Python, and Power BI.

---

## Dataset
The dataset used in this project is the **PaySim Synthetic Financial Dataset for Fraud Detection**, which simulates real-world mobile money transactions.

- Total dataset size: ~6.3 million transactions  
- Working sample: ~60,000 transactions  
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
- Clean and prepare transaction data for analysis  
- Analyze customer transaction behavior  
- Identify high-value and unusual transactions  
- Segment customers based on activity and value  
- Build a dashboard to track key metrics  

---

## Data Preparation
The dataset was pre-structured but required preprocessing before analysis:
- Sampled ~60,000 records from the original dataset  
- Checked and handled missing or inconsistent values  
- Converted time (`step`) into readable date/time format  
- Verified transaction amounts and balances  
- Created derived features such as:
  - Total transactions per customer  
  - Total spend per customer  
  - High-value transaction flag  

---

## Analysis Performed

### 1. Transaction Trends
- Monthly and daily transaction volume analysis  
- Distribution of transaction types  

### 2. Customer Analysis
- Customer segmentation based on transaction value and frequency  
- Identification of high-value customers  

### 3. High-Value Transactions
- Analysis of top 5% transactions by amount  
- Detection of unusual transaction patterns  

### 4. Fraud & Risk Indicators
- Basic analysis of fraud-labeled transactions  
- Pattern comparison between normal and flagged transactions  

---

## Dashboard
A Power BI dashboard was created to visualize:
- Transaction trends over time  
- Customer segmentation  
- High-value transaction distribution  
- Transaction type breakdown  

---

## Tools & Technologies
- **SQL** – Data querying and analysis  
- **Python (Pandas)** – Data cleaning and preprocessing  
- **Power BI** – Data visualization and dashboarding  

---

## Project Structure
banking-analysis/
│
├── data/
│   ├── raw_data.csv
│   ├── cleaned_data.csv
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
├── README.md


---

## 💡 Key Takeaways
- A small percentage of customers contribute a large portion of total transaction value  
- High-value transactions show distinct patterns in frequency and type  
- Transaction type plays a key role in identifying unusual activity  

---

## 🚀 Future Improvements
- Add advanced fraud detection techniques  
- Incorporate machine learning models  
- Expand dashboard with real-time insights  

---

## 📬 Contact
**Ajay Tiwari**  
📧 tiwariajay110125@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/ajay-tiwari-849725284/)  
🔗 [Portfolio](https://ajay-tiwari94-portfolio.vercel.app/)  
