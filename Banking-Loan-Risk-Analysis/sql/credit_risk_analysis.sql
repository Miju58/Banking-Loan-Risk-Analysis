CREATE DATABASE banking_risk_analysis;

USE banking_risk_analysis;

SELECT *
FROM credit_risk_dataset
LIMIT 5;

SELECT COUNT(*)
FROM credit_risk_dataset;

SELECT COUNT(*) AS total_customers
FROM credit_risk_dataset;

SELECT risk_category,
       COUNT(*) AS customers
FROM credit_risk_dataset
GROUP BY risk_category;

SELECT risk_category,
       ROUND(AVG(credit_score),2) AS avg_credit_score
FROM credit_risk_dataset
GROUP BY risk_category;

SELECT fraud_flag,
       risk_category,
       COUNT(*) AS customers
FROM credit_risk_dataset
GROUP BY fraud_flag, risk_category;

SELECT loan_default_history,
       risk_category,
       COUNT(*) AS customers
FROM credit_risk_dataset
GROUP BY loan_default_history, risk_category;

##Risk Category Summary
SELECT
    risk_category,
    COUNT(*) AS total_customers,
    ROUND(AVG(credit_score),2) AS avg_credit_score,
    ROUND(AVG(annual_income),2) AS avg_income,
    ROUND(AVG(loan_application_amount),2) AS avg_loan_amount
FROM credit_risk_dataset
GROUP BY risk_category;

##Top 10 Highest Debt Customers
SELECT
    total_outstanding_debt,
    credit_score,
    risk_category
FROM credit_risk_dataset
ORDER BY total_outstanding_debt DESC
LIMIT 10;

##Credit Score Segmentation
SELECT
CASE
    WHEN credit_score >= 750 THEN 'Excellent'
    WHEN credit_score >= 650 THEN 'Good'
    WHEN credit_score >= 550 THEN 'Fair'
    ELSE 'Poor'
END AS credit_segment,
COUNT(*) AS customers
FROM credit_risk_dataset
GROUP BY credit_segment
ORDER BY customers DESC;

##Fraud Risk Analysis
SELECT
    fraud_flag,
    COUNT(*) AS customers,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM credit_risk_dataset),
        2
    ) AS percentage
FROM credit_risk_dataset
GROUP BY fraud_flag;