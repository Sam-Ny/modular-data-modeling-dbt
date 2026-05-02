# 🔧 Modular Data Modeling with dbt Core

<p align="center"><img width=35% src="https://media2.giphy.com/media/L1R1tvI9svkIWwpVYr/giphy.gif?cid=ecf05e47pzi2rpig0vc8pjusra8hiai1b91zgiywvbubu9vu&rid=giphy.gif"></p>

<div align="center">

![dbt](https://img.shields.io/badge/dbt_Core-FF694B?style=for-the-badge&logo=dbt&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Jinja](https://img.shields.io/badge/Jinja2-B41717?style=for-the-badge&logo=jinja&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![MIT License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**A focused dbt Core project demonstrating modular SQL transformation — from raw source data to analytics-ready models using Staging, Intermediate, and Analytics layers with SCD Type 2, custom tests, Jinja macros, and auto-generated documentation.**

[Architecture](#-architecture) • [Features](#-dbt-features-covered) • [Project Structure](#-project-structure) • [Setup](#-setup-guide) • [Key Decisions](#-key-engineering-decisions)

</div>

---

## 📌 Project Overview

This project treats **data transformation like software engineering** — modular, tested, documented, and version controlled. Rather than writing one giant SQL query, each transformation is broken into small, reusable models with clear responsibilities.

Built to demonstrate dbt Core proficiency across the full toolkit — snapshots, seeds, macros, tests, and docs — on a real dataset with meaningful business logic.

| Metric | Value |
|---|---|
| dbt Models | Staging + Intermediate + Analytics layers |
| Snapshot Strategy | SCD Type 2 (check strategy) |
| Tests | Generic + Custom data quality tests |
| Macros | Jinja-powered reusable SQL logic |
| Seeds | Static CSV reference data |
| Documentation | Auto-generated data dictionary + lineage DAG |

---

## 🏗️ Architecture

```
┌──────────────────────────────────────────────────────┐
│                    SOURCE DATA                        │
│          Raw normalized tables / CSV seeds            │
└──────────────────────────┬───────────────────────────┘
                           │
                           ▼
┌──────────────────────────────────────────────────────┐
│                  STAGING LAYER                        │
│   Type casting · Column renaming · Basic cleaning     │
│   One model per source table · Views                  │
└──────────────────────────┬───────────────────────────┘
                           │
                           ▼
┌──────────────────────────────────────────────────────┐
│               INTERMEDIATE / CORE LAYER               │
│   Business logic joins · Deduplication                │
│   Wide table construction · Aggregations              │
└──────────────────────────┬───────────────────────────┘
                           │
                           ▼
┌──────────────────────────────────────────────────────┐
│                 ANALYTICS LAYER                       │
│   One Big Table (OBT) · Analytics ready              │
│   BI tool optimized · Tested + Documented            │
└──────────────────────────────────────────────────────┘
                           │
                  ┌────────┴────────┐
                  ▼                 ▼
           SNAPSHOTS           SEEDS
        SCD Type 2          Static reference
        history tracking     data (CSV)
```

---

## ✅ dbt Features Covered

| Feature | What was built |
|---|---|
| **Staging Models** | Standardised types, renamed columns, basic cleaning per source |
| **Intermediate Models** | Business logic joins, wide table construction |
| **Analytics Models** | Final OBT ready for BI consumption |
| **SCD Type 2 Snapshots** | Historical tracking of slowly changing dimensions using `check` strategy |
| **Seeds** | Static business mapping CSVs loaded as reference tables |
| **Generic Tests** | `unique`, `not_null`, `accepted_values`, `relationships` |
| **Custom Tests** | Singular SQL tests for complex business rule validation |
| **Jinja Macros** | Reusable SQL logic to eliminate repetition across models |
| **dbt Docs** | Auto-generated searchable data dictionary and lineage DAG |
| **Source Freshness** | Defined `loaded_at_field` for staleness detection |

---

## 📁 Project Structure

```
modular-data-modeling-dbt/
│
├── sameer_dbt_practice/
│   ├── models/
│   │   ├── staging/
│   │   │   ├── sources.yml              # Source definitions
│   │   │   ├── schema.yml               # Staging tests + docs
│   │   │   └── stg_*.sql               # One model per source
│   │   ├── intermediate/
│   │   │   └── int_*.sql               # Business logic joins
│   │   └── analytics/
│   │       ├── schema.yml               # Analytics tests + docs
│   │       └── obt_*.sql               # Final wide tables
│   ├── snapshots/
│   │   └── *_snapshot.sql              # SCD Type 2 snapshots
│   ├── seeds/
│   │   └── *.csv                       # Static reference data
│   ├── tests/
│   │   └── *.sql                       # Custom singular tests
│   ├── macros/
│   │   └── *.sql                       # Reusable Jinja macros
│   ├── analyses/
│   └── dbt_project.yml
│
├── .gitignore
├── requirements.txt
├── pyproject.toml
└── README.md
```

---

## ⚙️ Key Engineering Decisions

**1. Modular layered architecture over a single query**
Each layer has a single responsibility. Staging cleans, intermediate joins, analytics serves. This means any layer can be debugged, tested, or replaced independently without touching the others.

**2. SCD Type 2 for historical tracking**
Used dbt's `check` strategy snapshot to track changes in slowly changing dimensions — capturing full history with `dbt_valid_from` and `dbt_valid_to` timestamps. Enables point-in-time analysis without any custom merge logic.

**3. Seeds for static reference data**
Business mapping tables (categories, status codes, lookup values) are version controlled as CSV seeds — not hardcoded in SQL. Changes to reference data are tracked in Git like any other code change.

**4. Jinja macros for DRY SQL**
Repetitive filtering logic extracted into macros. Instead of copying the same `WHERE` clause across 10 models, one macro call keeps everything consistent and maintainable.

**5. Tests as data contracts**
Generic tests on every primary key and foreign key. Custom singular tests for complex business rules. If data breaks these contracts, dbt fails loudly rather than silently producing wrong numbers.

---

## 🚀 Setup Guide

### Prerequisites
- Python 3.11+
- dbt Core + relevant adapter (e.g. `dbt-snowflake`, `dbt-postgres`)
- A database connection (Snowflake, Postgres, etc.)

### 1. Clone the repo
```bash
git clone https://github.com/Sam-Ny/modular-data-modeling-dbt.git
cd modular-data-modeling-dbt
```

### 2. Create virtual environment
```bash
uv venv
source .venv/bin/activate      # Mac/Linux
.venv\Scripts\activate         # Windows
```

### 3. Install dependencies
```bash
uv pip install -r requirements.txt
```

### 4. Configure dbt profile
Create `~/.dbt/profiles.yml` with your database connection. See [dbt docs](https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml) for format.

### 5. Run the project
```bash
cd sameer_dbt_practice

dbt debug          # verify connection
dbt seed           # load reference CSVs
dbt run            # run all models
dbt snapshot       # run SCD Type 2 snapshots
dbt test           # run all data quality tests
dbt docs generate  # generate documentation
dbt docs serve     # view docs at localhost:8080
```

### 6. Run everything at once
```bash
dbt build          # seed + run + test + snapshot in dependency order
```

---

## 📖 How dbt Concepts Connect

```
sources.yml
└── {{ source('raw', 'orders') }}      ← reads from database source
        ↓
stg_orders.sql                         ← staging model cleans it
        ↓
{{ ref('stg_orders') }}                ← ref() builds the DAG
        ↓
int_orders_enriched.sql                ← intermediate joins it
        ↓
{{ ref('int_orders_enriched') }}
        ↓
obt_orders.sql                         ← analytics layer serves it
        ↓
schema.yml tests                       ← tests validate it
        ↓
dbt docs                               ← docs describe it
```

---

## 👤 Author

**Sameer Nayak**
Data Engineer | Azure · Snowflake · Databricks · dbt

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/sameer-nayak-202a01194)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Sam-Ny)

---

> 💡 **Also check out:** [Snowflake Supply Chain Analytics](https://github.com/Sam-Ny/snowflake-supply-chain-analytics) — a full end-to-end pipeline using Databricks + Snowflake + dbt on 1.5M rows of real e-commerce data.

---

<div align="center">
⭐ If you found this useful, consider starring the repo!
</div>
