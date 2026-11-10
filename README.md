# SQL Data Warehouse | End-to-End ETL & Data Modelling

**A PostgreSQL-based data warehouse integrating CRM and ERP datasets through structured ETL workflows and a three-layer Medallion Architecture.**

**Tech Stack:** PostgreSQL 18 · SQL · PL/pgSQL · pgAdmin 4 · GitHub

---

## 1. Project Overview

Designed and implemented an end-to-end SQL data warehouse to consolidate data from multiple CRM and ERP source systems.

The solution follows a Medallion Architecture, separating raw data ingestion, transformation, and analytical consumption across Bronze, Silver, and Gold layers.

The objective is to establish a structured and reliable data processing workflow that transforms raw operational datasets into clean, standardized, and analytics-ready data.

## 2. Architecture & Implementation

### Bronze Layer – Data Ingestion
- Ingested six CSV datasets from CRM and ERP source systems.
- Created structured tables to retain raw source data.
- Developed centralized PostgreSQL stored procedures for batch data loading.
- Implemented truncate-and-reload processing, execution-time tracking, and exception handling.

### Silver Layer – Data Transformation
- Applied data cleansing and standardization rules.
- Identified and handled duplicate records and missing values.
- Implemented business transformation logic using SQL joins, window functions, and conditional expressions.
- Integrated CRM and ERP datasets to establish consistent customer, product, and sales information.
- Implemented data quality checks to validate transformed records.

### Gold Layer – Analytical Data Modelling
- Developed customer and product dimension views.
- Created a sales fact view connecting transactional data with analytical dimensions.
- Implemented surrogate key generation and dimension lookup logic.
- Structured the analytical layer using a Star Schema.

## 3. Data Sources & Processing Scope

The warehouse integrates six datasets across two operational source systems.

| Source | Dataset | Records |
|---|---|---:|
| CRM | Customer Information | 18,494 |
| CRM | Product Information | 397 |
| CRM | Sales Transactions | 60,398 |
| ERP | Customer Information | 18,484 |
| ERP | Location Information | 18,484 |
| ERP | Product Categories | 37 |
| **Total** | **6 datasets** | **56,394** |

## 4. Key Technical Capabilities

| Area | Implementation |
|---|---|
| Database Design | Relational schemas, tables, and views |
| ETL Development | SQL-based batch ingestion and transformation |
| Data Processing | Joins, CTEs, window functions, conditional logic |
| Data Quality | Duplicate detection, null checks, consistency validation |
| Error Handling | PL/pgSQL exception handling and execution logging |
| Data Modelling | Dimensions, fact views, surrogate keys, Star Schema |

## 5. Execution Workflow

1. Create the PostgreSQL `DataWarehouse` database.
2. Execute Bronze DDL scripts and import the source CSV datasets.
3. Execute the Bronze loading procedure.
4. Create Silver tables and execute transformation procedures.
5. Run Silver data quality checks.
6. Create Gold analytical views.
7. Execute Gold data quality checks.

Refer to the `scripts/` directory for the SQL implementation.

