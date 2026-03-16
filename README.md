# Northwind Traders Sales Analysis (SQL Portfolio)

![Northwind ER Diagram](images/northwind_er_diagram.png)  
*(Entity-Relationship diagram of the Northwind database)*

End-to-end SQL analysis of the classic **Northwind** sample database (a fictional trading company) to uncover sales trends, customer behavior, product performance, and growth opportunities.

This project demonstrates:
- Relational querying (joins, aggregations, date functions)
- Business-oriented insights (revenue trends, normalized growth, partial-year handling)
- Clean, commented SQL code
- Data storytelling and recommendations

Built as part of my transition into data analysis roles, leveraging my quantitative foundation from a **Math & Physics degree at Trent University**.

## Project Overview

**Database**: PostgreSQL + Northwind Traders sample  
- ~830 orders, 2155 line items  
- Tables: orders, order_details, customers, products, categories, employees, etc.  
- Data span: July 1996 – May 1998 (partial years at start/end)

**Tools Used**  
- PostgreSQL (pgAdmin / psql)  
- SQL for querying and analysis  
- Markdown for documentation

**Setup Instructions**  
1. Create a new database named `northwind` in PostgreSQL.  
2. Run the `northwind.sql` script (schema + data load) — available in this repo or from [pthom/northwind_psql](https://github.com/pthom/northwind_psql).  
3. Execute queries from the `queries/` folder.

## Key Analyses (Completed So Far)

### 1. Total Revenue
- File: [queries/Total_Revenue.sql](queries/Total_Revenue.sql)  
- Question: What is the overall revenue after discounts?  
- Result: **$1,265,793.04**  
- Insight: Provides baseline business scale for all subsequent analyses.

### 2. Revenue & Order Volume Trend by Year (with Normalized Growth)
- File: [queries/revenue_trend_with_normalized_growth.sql](queries/revenue_trend_with_normalized_growth.sql)  
- Questions:  
  - How has revenue and order volume changed over time?  
  - What is the true growth rate when accounting for partial years (1996 & 1998)?  
- Key Results:
  - 1996: $208,083.97 | 152 orders | 181 active days | Daily avg: $1,149.64
  - 1997: $617,085.20 | 408 orders | 365 active days | Daily avg: $1,690.64 (+47.06% vs 1996)
  - 1998: $440,623.87 | 270 orders | 126 active days | Daily avg: $3,497.01 (+106.85% vs 1997)

- Insights:
  - Strong revenue growth from partial 1996 to full 1997 (~3× increase).
  - Daily performance accelerated significantly into 1998, even with only ~4 months of data — indicates improving efficiency/momentum.
  - Normalization using active days avoids misleading conclusions from partial-year totals.

## Entity-Relationship Diagram
![Northwind ER Diagram](images/northwind_er_diagram.png)

(If the image doesn't display, download a clean version from:  
- Microsoft Support: https://support.microsoft.com/en-us/office/northwind-database-diagram-cd422d47-e4e3-4819-8100-cdae6aaa0857  
- Wikiversity: https://en.wikiversity.org/wiki/File:Northwind_E-R_Diagram.png  
Save as `images/northwind_er_diagram.png`)

## Next Steps / In Progress
- Revenue & units by product category
- Top products & customers
- Discount impact analysis
- Employee performance

## About Me
Math & Physics graduate (Trent University, Peterborough, ON)  
Transitioning into data analysis — building skills in SQL, Python, data storytelling, and insight generation.  
Open to feedback, collaboration, or entry-level opportunities!

Questions or suggestions? Feel free to open an issue or connect on LinkedIn / X (@Tejas55065247).

Last updated: March 2025