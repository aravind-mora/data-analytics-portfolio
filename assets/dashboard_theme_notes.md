# Dashboard Theme & Design Notes

This document outlines the visual design choices used across dashboards in this repository.  
The goal of the theme is to improve **readability, consistency, and insight clarity**, not decoration.

---

## 🎯 Design Principles

- Prioritize **data clarity over aesthetics**
- Maintain **visual consistency** across all dashboards
- Avoid unnecessary colors, gradients, and effects
- Ensure dashboards are readable in screenshots and presentations

---

## 🎨 Color Theme

### Page Background
- Color: `#121212` (dark gray / near-black)
- Reason:
  - Reduces eye strain
  - Improves contrast for charts and KPI cards
  - Common in professional analytics tools

---

### Chart Containers
- Charts are placed over **subtle dark backgrounds**
- In some dashboards, **shape-based gradients** are used behind charts to add depth
- Chart backgrounds themselves remain transparent

Example gradient colors:
- `#1B1F2A` → `#2C3242`
- `#1C1C1C` → `#2A2A2A`

Gradients are applied **only via shapes**, not directly on chart visuals, due to Power BI limitations.

---

## 🧾 Typography

- Font color: White or light gray for contrast
- Font size:
  - Titles: 12–14
  - Axis labels: 10–11
  - KPI values: Larger for emphasis
- Avoided decorative fonts to maintain professionalism

---

## 📊 Chart Design Rules

- Gridlines: ❌ Removed to reduce clutter
- Legends:
  - Disabled where unnecessary
  - Enabled only for multi-measure charts
- Data labels:
  - Used selectively
  - Avoided where they overlap or reduce readability

---

## 📈 Chart Selection Guidelines

- Bar / Column charts → Category comparison
- Line charts → Trends and ordered analysis
- Combo charts → Comparing volume vs rate (e.g., count vs percentage)
- KPI cards → High-level metrics only

Each chart type is chosen based on **analytical purpose**, not appearance.

---

## 🎯 Conditional Formatting

- Used sparingly to highlight key patterns
- Applied only when it adds meaning (e.g., income bands, risk areas)
- Avoided excessive color usage to prevent misinterpretation

---

## 🧠 Rationale

The theme is designed to:
- Make insights immediately visible
- Support executive and recruiter review
- Ensure dashboards remain understandable when exported as images
- Reflect real-world business dashboard standards

---

## ✅ Final Note

Visual design choices are intentionally minimal and consistent to ensure that **data insights remain the primary focus**.

