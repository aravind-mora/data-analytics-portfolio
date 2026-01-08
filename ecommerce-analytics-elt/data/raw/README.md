# Raw Data Layer

## 📌 Purpose
This folder contains the **raw source data** ingested into the analytics pipeline.

Data in this layer is stored **exactly as received** from the source system, without any transformations applied.  
It represents the **single source of truth** for downstream processing.

---

## 📊 Data Source
- **Dataset**: Olist Brazilian E-Commerce Dataset
- **Source**: Kaggle
- **Format**: CSV files
- **Domain**: E-commerce transactions

---

## 📁 Contents
Typical files in this folder include:
- customers
- orders
- order_items
- payments
- products
- sellers
- geolocation
- product_category_translation

> File names and structure are preserved from the original dataset.

---

## 🔒 Data Handling Principles
- No cleaning or filtering is applied in this layer
- No business logic is implemented here
- All transformations occur in the **staging** and **marts** layers

---

## ⚠️ Version Control Note
Raw data files are **not committed** to GitHub to avoid:
- Large file sizes
- Redundant storage
- Licensing concerns

The schema and load logic are documented in SQL scripts.

---

## 🎯 Usage
This layer is used as input for:
- Staging transformations
- Data quality checks
- Reprocessing if transformation logic changes
