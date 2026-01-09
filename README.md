This repository contains **end-to-end data analytics projects** demonstrating practical problem-solving using SQL, Excel, Power BI, and data modeling techniques.

Each project focuses on transforming raw data into **actionable business insights** using industry-style workflows.

---

## 🧠 Skills Demonstrated

- SQL (data cleaning, joins, aggregations, window functions)
- ELT pipelines and data modeling
- Star schema design (fact & dimension tables)
- Microsoft Excel dashboards
- Power BI dashboards & DAX
- Business KPI development
- Analytical thinking and insight storytelling

---

## 📁 Projects

### 1️⃣ E-Commerce Analytics (ELT + SQL)

**Tools:** SQL (MySQL), Data Modeling  

**Overview:**  
Built a complete **ELT analytics pipeline** using raw e-commerce data.
The project includes raw ingestion, staging transformations, star schema modeling, and business KPI analysis.

**Project Folder:**  
`ecommerce-analytics-elt/`

**Key Highlights:**
- Raw → staging → marts architecture
- Star schema with fact and dimension tables
- Revenue, delivery, seller, payment analysis
- Business KPIs written using analytical SQL
- Interview-ready insights and explanations

---

### 2️⃣ Sales Performance Analysis

**Tools:** SQL, Excel  

**Overview:**  
Analyzed retail sales data to evaluate revenue trends, profitability, and discount impact.
Focused on identifying revenue drivers and loss areas.

**Project Folder:**  
`sales-performance-analysis/`

**Key Highlights:**
- Profit margin analysis by category
- Discount bucket impact analysis
- Year-over-year growth using window functions
- Excel dashboards for reporting

---

### 3️⃣ HR Analytics Dashboard

**Tools:** Power BI, DAX  

**Overview:**  
Analyzed employee attrition data to identify workforce turnover patterns and risk drivers.
Separated high-level KPIs from detailed driver analysis.

**Project Folder:**  
`hr-analytics-dashboard/`

**Key Highlights:**
- Attrition rate and workforce metrics
- Department and role-based analysis
- Risk analysis using count vs rate
- Clean executive-style dashboard design

---

## 🗂️ Repository Structure

```
data-analytics-portfolio/
├── .gitignore                                             # Git ignore rules (temp, editor, OS files)
├── README.md                                              # Portfolio overview and project index
│
├── assets/                                                # Shared assets across projects
│   └── dashboard_theme_notes.md                           # Dashboard design & visualization standards
│
├── ecommerce-analytics-elt/                               # End-to-end ELT & data modeling project
│   ├── README.md                                          # Project overview & architecture
│   │
│   ├── analytics/                                         # Business & analytical SQL queries
│   │   ├── advanced_joins.sql
│   │   ├── business_questions.sql
│   │   └── kpi_queries.sql
│   │
│   ├── data/                                              # Data storage
│   │   ├── raw/                                           # Raw source datasets
│   │   │   ├── olist_customers_dataset.zip
│   │   │   └── README.md
│   │   └── processed/                                     # Processed / transformed data notes
│   │       └── README.md
│   │
│   ├── diagrams/                                          # Data model & schema diagrams
│   │   └── data_schemas.png
│   │
│   ├── insights/                                          # Business insights & conclusions
│   │   └── business_insights.md
│   │
│   └── sql/                                               # ELT pipeline SQL
│       ├── raw/                                           # Raw table creation & loading
│       │   ├── create_raw_tables.sql
│       │   └── load_raw_data.sql
│       │
│       ├── staging/                                       # Data cleaning & standardization layer
│       │   ├── stg_customers.sql
│       │   ├── stg_orders.sql
│       │   ├── stg_order_items.sql
│       │   ├── stg_payments.sql
│       │   ├── stg_products.sql
│       │   └── stg_sellers.sql
│       │
│       └── marts/                                         # Analytics-ready star schema
│           ├── dim_customers.sql
│           ├── dim_date.sql
│           ├── dim_payments.sql
│           ├── dim_products.sql
│           ├── dim_sellers.sql
│           └── fact_orders.sql
│
├── hr-analytics-dashboard/                                # HR attrition analysis & dashboard
│   ├── README.md
│   ├── charts/                                            # Dashboard screenshots
│   │   ├── overview_page.png
│   │   └── attrition_drivers_page.png
│   ├── data/                                              # HR dataset
│   │   └── hr_attrition.csv
│   ├── insights/                                          # HR insights & findings
│   │   └── insights.md
│   └── powerbi/                                           # Power BI report file
│       └── hr_attrition_dashboard.pbix
│
└── sales-performance-analysis/                            # Sales & profitability analysis
    ├── README.md
    ├── charts/                                            # Analysis visualizations
    │   ├── sales_by_region.png
    │   ├── monthly_sales_trend.png
    │   ├── yoy_sales_growth.png
    │   └── discount_vs_profit.png
    ├── excel/                                             # Excel analysis workbook
    │   └── superstore_analysis.xlsx
    ├── insights/                                          # Sales insights
    │   └── business_insights.md
    └── sql/                                               # SQL scripts
        ├── schema.sql
        ├── data_cleaning.sql
        └── analysis_queries.sql

```
---

## 👤 About

Aspiring Data Analyst with hands-on experience in SQL, ELT pipelines, data modeling, and dashboarding.
Focused on delivering **clear, business-oriented analytics solutions**.
