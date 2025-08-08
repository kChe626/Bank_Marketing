# **Bank Marketing Campaign Analysis — Python Cleaning, SQL Analysis & Power BI Dashboard**  
![Python](https://img.shields.io/badge/Python-3776AB.svg?style=for-the-badge&logo=Python&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/power_bi-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

---

## **Overview**  
This project analyzes a bank’s marketing campaign dataset to uncover customer deposit behavior and improve targeting strategies.  
It includes Python-based cleaning, SQL-driven analysis, and an interactive multi-page Power BI dashboard.

---

## **Dataset**
- **Source:** [bank.csv](https://github.com/kChe626/Bank_Marketing/blob/main/bank.csv)  
- **Columns:** age, job, marital, education, balance, housing, loan, contact, campaign, previous outcome, deposit, and others

---

## **Objectives**
- Clean and prepare the dataset for SQL analysis  
- Identify key customer segments with high deposit conversion rates  
- Visualize campaign performance in Power BI  

---

## **Data Cleaning Process (Python)**
**Key Steps:**
- Standardized column names for SQL compatibility  
- Replaced `'unknown'` values with `NULL`  
- Cleaned text fields (lowercase, trimmed spaces)  
- Removed trailing punctuation in job titles  
- Constructed a valid `date` column from day, month, and a fixed year  
- Converted numeric fields and removed duplicates

**Example Snippets:**  
```python
# Replace 'unknown' with NaN
df.replace('unknown', np.nan, inplace=True)

# Create date column from day, month, and fixed year
df['day'] = df['day'].astype(str).str.zfill(2)
df['date'] = pd.to_datetime(df['day'] + '-' + df['month'] + '-2014', dayfirst=True, errors='coerce')

# Clean text fields
for col in df.select_dtypes(include='object').columns:
    df[col] = df[col].astype(str).str.strip().str.lower()
```

**Full Cleaning Script:** [Bank_cleaning_Python.ipynb](https://github.com/kChe626/Bank_Marketing/blob/main/Bank_cleaning_Python)  
**Cleaned Dataset:** [bank_cleaned.csv](https://github.com/kChe626/Bank_Marketing/blob/main/bank_cleaned.csv)

---

## **SQL Analysis**
**Objectives:**
- Calculate overall deposit conversion rate  
- Analyze deposits by job, education, and age group  
- Track monthly deposit trends  
- Examine financial behavior impact on deposits

**Example Queries:**
```sql
-- Conversion rate
SELECT 
    COUNT(*) AS total_clients,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS deposits_made,
    ROUND(SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS conversion_rate_percent
FROM bank_cleaned;

-- Deposits by job
SELECT job, COUNT(*) AS total_clients,
       SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS deposits,
       ROUND(SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS conversion_rate_percent
FROM bank_cleaned
GROUP BY job
ORDER BY conversion_rate_percent DESC;
```

**Full Analysis Script:** [Bank_Analysis_SQL.sql](https://github.com/kChe626/Bank_Marketing/blob/main/Bank_Analysis_SQL.sql)

---

## **Key Insights**
- Certain occupations and education levels have significantly higher conversion rates  
- Seasonal patterns suggest optimal campaign timing  
- Customers with no housing or personal loans are more likely to make deposits  
- Balance distribution indicates distinct customer segments

---

## **Preview**
![Bank Marketing Power BI Dashboard](https://github.com/kChe626/Bank_Marketing/blob/main/Bank_dashboard_preview.gif)

---

## **How to Open**
1. Download the Power BI dashboard: [bank_power_bi.pbix](https://github.com/kChe626/Bank_Marketing/blob/main/bank_power_bi.pbix)  
2. Open in Power BI Desktop  
3. Connect to the cleaned dataset: [bank_cleaned.csv](https://github.com/kChe626/Bank_Marketing/blob/main/bank_cleaned.csv)  
---

## **Use Cases**
- **Marketing Optimization:** Target high-conversion customer segments  
- **Campaign Planning:** Schedule campaigns during peak performance months  
- **Product Strategy:** Identify customer needs based on loan and balance data  
- **Data-Driven Decision-Making:** Use conversion metrics to refine outreach
  
---

## **Files**
- [Python Cleaning Script](https://github.com/kChe626/Bank_Marketing/blob/main/Bank_cleaning_Python)
- [Cleaned Dataset](https://github.com/kChe626/Bank_Marketing/blob/main/bank_cleaned.csv)  
- [SQL Analysis Script](https://github.com/kChe626/Bank_Marketing/blob/main/Bank_Analysis_SQL.sql)  
- [Power BI Dashboard](https://github.com/kChe626/Bank_Marketing/blob/main/bank_power_bi.pbix)  

---


## Dataset Source

- Melbourne Housing dataset from [https://www.kaggle.com/datasets/janiobachmann/bank-marketing-dataset?select=bank.csv]

