# Processed Data Layer

## 📌 Purpose
This folder represents **analytics-ready data outputs** generated from the transformation process.

Data here is derived from the **raw layer** after applying cleaning, standardization, and modeling logic.

---

## 🧱 Contents
Processed data includes:
- Staging tables (cleaned and standardized)
- Fact and dimension tables
- Analytics-ready datasets

> In this project, processed data is materialized inside the database (MySQL) rather than stored as files.

---

## 🏗️ Transformation Logic
All transformations follow an **ELT approach**:
1. Load raw data into the database
2. Apply SQL-based transformations
3. Build business-friendly analytical models

Transformation scripts are located in:
