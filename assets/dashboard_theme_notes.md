# Dashboard Theme & Design Notes

This document describes the **visual design standards** used across dashboards in this portfolio.
The objective is to ensure **clarity, consistency, and business readability**, not visual decoration.

---

## 🎯 Design Philosophy

- Data clarity is always prioritized over aesthetics
- Visual consistency is maintained across all dashboards
- Colors are used to **communicate meaning**, not decoration
- Dashboards are designed to be readable in:
  - Executive reviews
  - Interview walkthroughs
  - Exported screenshots

---

## 🎨 Color Theme

### Page Background
- Primary background: `#121212` (dark gray / near black)
- Rationale:
  - Reduces eye strain
  - Improves contrast for charts and KPI cards
  - Common in enterprise BI tools

---

### Chart Containers
- Charts sit on **subtle dark containers**
- Depth is added using **shape-based gradients** (not chart backgrounds)

Example gradients:
- `#1B1F2A` → `#2C3242`
- `#1C1C1C` → `#2A2A2A`

> Gradients are applied via shapes due to Power BI rendering limitations.

---

## 🧾 Typography

- Font color: white or light gray
- Font sizes:
  - Titles: 12–14
  - Axis labels: 10–11
  - KPI values: larger for emphasis
- Decorative fonts are avoided to maintain a professional look

---

## 📊 Chart Design Rules

- Gridlines: ❌ removed to reduce clutter
- Legends:
  - Disabled when unnecessary
  - Enabled only for multi-measure comparisons
- Data labels:
  - Used selectively
  - Avoided when overlapping or reducing clarity

---

## 📈 Chart Selection Guidelines

- Bar / Column → category comparison
- Line → trends and time-series analysis
- Combo → volume vs rate comparisons
- KPI cards → top-level business metrics only

Each chart type is chosen based on **analytical purpose**, not appearance.

---

## 🎯 Conditional Formatting

- Used sparingly
- Applied only when it adds analytical meaning
- Avoided excessive colors to prevent misinterpretation

---

## 🧠 Design Rationale

This theme is designed to:
- Surface insights immediately
- Support executive and recruiter review
- Maintain clarity when dashboards are exported as images
- Reflect real-world business analytics standards

---

## ✅ Final Note

Design decisions are intentionally minimal and consistent so that
**business insights remain the primary focus**.
