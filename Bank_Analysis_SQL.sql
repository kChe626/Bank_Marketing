-- Banking SQL Queries
-- Description: Business analysis on Bank cleaned dataset

SELECT * FROM bank_cleaned
LIMIT 10;

DESCRIBE bank_cleaned;

SELECT COUNT(*) AS total_rows FROM bank_cleaned;

-- Total number of clients
SELECT COUNT(*) AS total_clients
FROM bank_cleaned;

-- Deposit conversion rate
SELECT 
    COUNT(*) AS total_clients,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS deposits_made,
    ROUND(SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS conversion_rate_percent
FROM bank_cleaned;

-- Deposits by job
SELECT 
    job,
    COUNT(*) AS total_clients,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS deposits,
    ROUND(SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS conversion_rate_percent
FROM bank_cleaned
GROUP BY job
ORDER BY conversion_rate_percent DESC;

--  Deposits by education level
SELECT 
    education,
    COUNT(*) AS total_clients,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS deposits,
    ROUND(SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS conversion_rate_percent
FROM bank_cleaned
GROUP BY education
ORDER BY conversion_rate_percent DESC;

-- Does having a housing loan affect deposit signups?
SELECT 
    housing,
    COUNT(*) AS total_clients,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS deposits,
    ROUND(SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS conversion_rate_percent
FROM bank_cleaned
GROUP BY housing;

--  Monthly trend of deposits
SELECT 
  DATE_FORMAT(date, '%Y-%m') AS month,
  COUNT(*) AS total_contacts,
  SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS deposits
FROM bank_cleaned
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY DATE_FORMAT(date, '%Y-%m');

-- Age group segmentation
SELECT 
    CASE 
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25–34'
        WHEN age BETWEEN 35 AND 44 THEN '35–44'
        WHEN age BETWEEN 45 AND 54 THEN '45–54'
        WHEN age BETWEEN 55 AND 64 THEN '55–64'
        ELSE '65+'
    END AS age_group,
    COUNT(*) AS total_clients,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS deposits,
    ROUND(SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS conversion_rate_percent
FROM bank_cleaned
GROUP BY age_group
ORDER BY age_group;
