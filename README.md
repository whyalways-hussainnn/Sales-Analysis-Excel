# Sales Analysis Portfolio Project

A beginner-friendly data analytics project demonstrating sales KPI reporting, category/region analysis, monthly trends, and SQL/Python workflows.

> **Dataset notice:** The included dataset is synthetic sample data created for practice. It does not represent a real company or real customers. Currency values are illustrative.

## Business questions
- What are total revenue, estimated profit, average revenue per order, and profit margin?
- Which categories and regions contribute most to revenue?
- How does revenue change over time?
- Which products and sales channels perform best?

## Tools
- **Excel:** KPI dashboard, PivotTables/charts (dashboard workbook can be added as a next step).
- **SQL (PostgreSQL):** Aggregations, category/region comparisons, top products, running totals.
- **Python:** pandas summaries and data validation.

## Repository structure
```
Sales-Analysis-Excel/
├── data/
│   └── sales_data.csv
├── analyze_sales.py
├── sales_analysis.sql
└── README.md
```

## How to run the Python analysis
Install:
```bash
pip install pandas
```
Run:
```bash
python analyze_sales.py
```

## SQL
Import `data/sales_data.csv` into PostgreSQL as a table named `sales_data`, then run `sales_analysis.sql` query by query.

## Important portfolio note
This is a learning project using synthetic data. Explain your assumptions honestly in interviews and be ready to walk through the queries and calculations.

## Future improvements
- Add an Excel dashboard workbook with KPI cards and charts.
- Add a Power BI or Tableau dashboard.
- Add month-over-month growth and data-quality tests.
