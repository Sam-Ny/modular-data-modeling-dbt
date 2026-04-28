# 🚀 dbt Fundamentals: The Transformation Engine
  
<p align="center"><img width=35% src="https://media2.giphy.com/media/L1R1tvI9svkIWwpVYr/giphy.gif?cid=ecf05e47pzi2rpig0vc8pjusra8hiai1b91zgiywvbubu9vu&rid=giphy.gif"></p>

<p align="center">
  <img src="https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white" />
  <img src="https://img.shields.io/badge/SQL-003545?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" />
</p>

---

## 📖 Project Overview
This repository is a **technical showcase** of dbt Core fundamentals. I transformed raw, normalized data into a high-performance **One Big Table (OBT)** architecture, ensuring a seamless experience for downstream BI tools.

Instead of just writing SQL, I treated data like **software code**, implementing testing, version control, and historical tracking.

---

## 📊 Lineage Graph

![Lineage Graph](sameer_dbt_practice/lineage.png)

---

## 🎯 The dbt Toolkit (Fundamentals Covered)

| Feature | Implementation |
| :--- | :--- |
| **🔄 Snapshots** | Captured **SCD Type 2** history for evolving source data. |
| **🧪 Testing** | Deployed **Generic & Custom tests** to ensure 100% data integrity. |
| **🤖 Macros** | Built **Jinja-powered macros** to automate repetitive SQL filters. |
| **🌱 Seeds** | Ingested static business mappings via CSV for instant lookup. |
| **📚 Docs** | Generated a searchable **Data Dictionary** and lineage graph. |

---

## 🏗️ Data Architecture
I followed a modular approach to build the final dataset:

1. **Staging Layer**: Standardizing types, renaming columns, and basic cleaning.
2. **Intermediate/Core**: Joining multiple entities into a **de-normalized Wide Table**.
3. **Analytics Layer**: The "Ready-to-Consume" data model for reporting.

<p align="center">
  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNmN6eXN4Z3Z3Z3Z3Z3Z3Z3Z3Z3Z3Z3Z3Z3Z3Z3Z3Z3Z3Z/l41lTjJ9O6t8D8G0M/giphy.gif" width="300" alt="Processing Data">
</p>

