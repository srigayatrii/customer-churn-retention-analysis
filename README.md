# Customer Churn & Retention Analysis

## Project Overview

Customer Churn & Retention Analysis is a data analytics project that examines customer behavior and identifies patterns associated with customer churn. Using Python, PostgreSQL, SQL, and Power BI, the project explores customer demographics, subscription types, contract lengths, support-call frequency, and spending patterns.

The goal is to identify customer segments with higher churn rates, generate actionable business insights, and support data-driven customer retention strategies through data analysis and dashboard visualization.

## Objectives

- Calculate the overall customer churn rate.
- Analyze churn across subscription types and contract lengths.
- Examine churn patterns across customer demographics.
- Investigate the relationship between support-call frequency and customer churn.
- Explore customer tenure and spending patterns.
- Present key metrics and findings through a Power BI dashboard.
- Recommend potential strategies to improve customer retention.

## Dataset

The cleaned dataset contains **442,211 customer records** and 12 columns.

| Column | Description |
|---|---|
| `CustomerID` | Unique customer identifier |
| `Age` | Customer age |
| `Gender` | Customer gender |
| `Tenure` | Subscription duration in months |
| `Usage_Frequency` | Frequency of service usage |
| `Support_Calls` | Number of customer support interactions |
| `Payment_Delay` | Number of days of payment delay |
| `Subscription_Type` | Basic, Standard, or Premium |
| `Contract_Length` | Monthly, Quarterly, or Annual |
| `Total_Spend` | Total customer spending |
| `Last_Interaction` | Days since the last interaction |
| `Churn` | Customer status: 0 = Active, 1 = Churned |

## Tools & Technologies

- **Python:** Pandas, Matplotlib, Seaborn
- **Database:** PostgreSQL
- **SQL:** Aggregations, grouping, sorting, conditional segmentation, and churn-rate calculations
- **Power BI:** Customer churn dashboard design, KPI reporting, and customer segment visualization
- **Analysis:** Data cleaning, exploratory data analysis (EDA), and business insight generation

## Project Workflow

### 1. Data Cleaning and Preparation

- Loaded the training and testing datasets using Pandas.
- Combined the datasets into a single DataFrame.
- Removed duplicate customer IDs.
- Removed rows containing missing values.
- Converted selected columns to integer data types.
- Exported the cleaned dataset to a CSV file for further analysis.

### 2. Exploratory Data Analysis with Python

Used Pandas, Matplotlib, and Seaborn to explore customer churn patterns.

The analysis includes:

- Calculating the overall churn rate.
- Comparing churn across gender groups.
- Examining churn by subscription type.
- Comparing tenure distributions between active and churned customers.
- Exploring customer spending patterns.

### 3. SQL Analysis with PostgreSQL

Imported the cleaned dataset into PostgreSQL and executed queries to investigate customer churn and retention patterns.

The SQL analysis covers:

- Total customer count.
- Active and churned customer counts.
- Overall churn rate.
- Average tenure by churn status.
- Churn rate by subscription type.
- Churn rate by contract length.
- Gender-wise churn analysis.
- Churn rate by support-call category.
- Top 10 customers by total spending.

SQL concepts used include `COUNT()`, `SUM()`, `AVG()`, `ROUND()`, `GROUP BY`, `ORDER BY`, `CASE WHEN`, and `LIMIT`.

### 4. Power BI Dashboard

The project includes a customer churn dashboard design intended to present important customer metrics and make churn patterns easier to understand.

**Key Performance Indicators (KPIs)**

- Total Customers
- Active Customers
- Churned Customers
- Churn Rate (%)
- Total Spend

**Planned Visualizations and Filters**

- Active versus churned customer distribution
- Churn by contract length
- Churn by subscription type
- Churn by gender
- Average tenure and spending comparisons by churn status
- Filters for age, gender, subscription type, and contract length

The dashboard is designed to help users explore customer segments, compare churn patterns, and identify areas where retention efforts may be beneficial.

## Key Findings

The following findings were calculated using PostgreSQL queries on the cleaned dataset.

### 1. Overall Customer Churn

The overall churn rate is **49.48%**, meaning that approximately half of the customer records are marked as churned.

### 2. Churn by Subscription Type

| Subscription Type | Churn Rate |
|---|---:|
| Basic | 50.93% |
| Standard | 48.91% |
| Premium | 48.66% |

Basic subscribers have the highest churn rate among the three subscription groups.

### 3. Churn by Contract Length

| Contract Length | Churn Rate |
|---|---:|
| Monthly | 87.81% |
| Annual | 40.12% |
| Quarterly | 39.83% |

Monthly-contract customers have a substantially higher churn rate than customers on quarterly or annual contracts.

### 4. Churn by Support-Call Frequency

Customers were grouped according to whether they had five or more support calls.

| Support-Call Category | Churn Rate |
|---|---:|
| High Calls (5 or more) | 88.62% |
| Low Calls (fewer than 5) | 29.76% |

Customers with five or more support calls have a much higher churn rate, suggesting that frequent support interactions may be a useful indicator of potential retention issues.

These findings describe associations in the dataset and do not establish that any single factor causes customer churn.

## Business Recommendations

Based on the observed patterns, the following actions could be investigated:

- **Improve retention among monthly subscribers:** Investigate why these customers leave at higher rates and evaluate appropriate retention initiatives.
- **Address recurring support issues:** Review common customer complaints and improve support resolution processes.
- **Evaluate the Basic subscription plan:** Investigate whether pricing, features, or customer expectations are associated with its higher churn rate.
- **Monitor customer segments:** Track churn rates by subscription type and contract length to assess the effectiveness of future retention strategies.

## Repository Structure

```text
Customer-Churn-Retention-Analysis/
├── churn.sql
├── python_analysis.py
├── customer_churn_clean.csv
├── customer_churn_dataset-training-master.csv
├── customer_churn_dataset-testing-master.csv
├── churn_dashboard.png
└── README.md
```

## How to Run the Project

### Prerequisites

- Python 3
- PostgreSQL
- Pandas
- Matplotlib
- Seaborn

### Step 1: Install Python Dependencies

```bash
python -m pip install pandas matplotlib seaborn
```

### Step 2: Run the Python Analysis

Ensure `customer_churn_clean.csv` is available in the project directory, then execute:

```bash
python python_analysis.py
```

The script calculates the churn rate and generates exploratory visualizations.

### Step 3: Run the SQL Analysis

1. Create a PostgreSQL database.
2. Create the `customer_churn` table using the schema in `churn.sql`.
3. Import `customer_churn_clean.csv` into the table.
4. Execute the SQL queries to reproduce the customer churn statistics.

## Project Status

- Python analysis executed successfully.
- 442,211 customer records imported into PostgreSQL.
- Core SQL analyses for subscription type, contract length, and support-call frequency executed and verified.
- Dashboard image included in the repository.

