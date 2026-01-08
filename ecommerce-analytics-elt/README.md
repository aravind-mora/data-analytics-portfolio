# 🛒 E-Commerce Analytics — End-to-End ELT & Star Schema Modeling

## 📌 Project Overview
This project demonstrates an **end-to-end analytics engineering workflow** where raw e-commerce data is transformed into a **business-ready star schema** using an **ELT approach**.

The goal is to showcase:
- Real-world data modeling
- SQL-based transformations
- Complex joins across multiple tables
- Business-focused analytics and insights

This project mirrors how data analysts and analytics engineers work in production environments.

---

## 🧠 Problem Statement
Raw transactional data from e-commerce systems is highly normalized and not suitable for analytics.  
This project converts raw data into an **analytics-optimized model** that enables fast, reliable business reporting.

---

## 📊 Dataset
- **Source**: Olist Brazilian E-Commerce Dataset (Kaggle)
- **Domain**: Online retail transactions
- **Characteristics**:
  - Multiple related tables
  - Realistic data quality issues
  - Industry-recognized dataset

### Raw Tables Used
- customers
- orders
- order_items
- payments
- products
- sellers
- reviews
- geolocation
- product_category_translation

---

## 🏗️ Architecture & Approach

### 🔄 ELT (Extract, Load, Transform)
1. **Extract**: CSV files downloaded from Kaggle
2. **Load**: Raw data loaded into MySQL without modification
3. **Transform**:
   - Staging layer for cleaning and standardization
   - Analytics layer using a star schema

This approach reflects modern analytics workflows used with cloud data warehouses.

---

## 🧱 Data Modeling

### ⭐ Star Schema
- **Fact Table**: `fact_orders`
- **Dimension Tables**:
  - `dim_customers`
  - `dim_products`
  - `dim_sellers`
  - `dim_date`
  - `dim_payments`

The fact table captures order-level metrics, while dimensions provide descriptive business context.

📁 Diagrams:
- `diagrams/source_data_model.png` — raw data relationships
- `diagrams/star_schema.png` — analytics star schema

---

## 🧹 Transformation Layers

### Raw Layer (`raw`)
- Stores data exactly as received from source
- No transformations applied

### Staging Layer (`staging`)
- Data cleaning and standardization
- Invalid timestamps handled
- Aggregations applied where required (e.g., payments)

### Marts Layer (`marts`)
- Business-ready fact and dimension tables
- Optimized for analytics queries
- Used for KPIs and reporting

---

## 📈 Analytics & Insights
All business queries are written **only on fact and dimension tables**, never on raw data.

Key insights include:
- Revenue and order volume trends
- Top-performing product categories
- Seller performance patterns
- Payment method impact
- Delivery time variations by geography
- Seasonality and time-based trends

Detailed insights are documented in:
