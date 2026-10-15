CREATE TABLE customer_churn(
CustomerID INT PRIMARY KEY,
Age INT,
Gender VARCHAR(20),
Tenure INT,
Usage_Frequency INT,
Support_Calls INT,
Payment_Delay INT,
Subscription_Type VARCHAR(50),
Contract_Length VARCHAR(50),
Total_Spend DECIMAL,
Last_Interaction INT,
Churn INT
);
SELECT * FROM customer_churn;

--Total customers active & churned
SELECT COUNT(*)AS Total_Customers,
SUM(Churn)AS Churned_Customers,
COUNT(*)-SUM(Churn)AS Active_Customers
FROM customer_churn;

--Churn Rate
SELECT ROUND(100.0*SUM(Churn)::numeric/COUNT(*),2)AS Churn_Rate_Percent
FROM customer_churn;

--Average Tenure by Churn
SELECT Churn,ROUND(AVG(Tenure),2)AS AVG_Tenure
FROM customer_churn
GROUP BY Churn;

--churn rate by subscription type
SELECT Subscription_Type,
ROUND(100.0*SUM(Churn)::numeric/COUNT(*),2) AS Churn_Rate
FROM customer_churn
GROUP BY Subscription_Type
ORDER BY Churn_Rate DESC;

--churn rate by contract length
SELECT Contract_Length,
ROUND(100.0*SUM(Churn)::numeric/COUNT(*),2)AS Churn_Rate
FROM customer_churn
GROUP BY Contract_Length
ORDER BY Churn_Rate DESC;

--Gender-wise Churn
SELECT Gender,
COUNT(*)AS Total_Customers,
SUM(Churn)AS Churned,
ROUND(100.0*SUM(Churn)::numeric/COUNT(*),2)AS Churn_Rate
FROM customer_churn
GROUP BY Gender;

 --High support call customers churn rate
 SELECT CASE 
 			WHEN Support_Calls >=5 THEN 'High Calls'
 			ELSE 'Low Calls'
			 END AS Call_Category,
			 ROUND(100.0*SUM(Churn)::numeric/COUNT(*),2)AS Churn_Rate
			 FROM customer_churn
			 GROUP BY Call_Category;

--Top 10 customers by spend (Loyalty check)
SELECT CustomerID,Total_Spend
FROM customer_churn
ORDER BY Total_Spend DESC
LIMIT 10;