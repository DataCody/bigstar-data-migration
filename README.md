# 📊 End-to-End Data Engineering Pipeline for Big Star
[![AWS](https://img.shields.io/badge/Cloud-AWS-FF9900?logo=amazon-aws)](https://aws.amazon.com/)
[![SQL](https://img.shields.io/badge/Query-SQL-336791?logo=postgresql)]()
[![Airbyte](https://img.shields.io/badge/Ingestion-Airbyte-20B2AA?logo=airbyte)](https://airbyte.com/)
[![dbt](https://img.shields.io/badge/Modeling-dbt-FF694B?logo=dbt)](https://getdbt.com/)
[![Redshift](https://img.shields.io/badge/Warehouse-Redshift-8B0000?logo=amazon-redshift)](https://aws.amazon.com/redshift/)
[![Postgres](https://img.shields.io/badge/Database-Postgres-4169E1?logo=postgresql)](https://www.postgresql.org/)
[![Docker](https://img.shields.io/badge/Deployment-Docker-2496ED?logo=docker)](https://www.docker.com/)


This project builds a modern ELT pipeline to process raw e-commerce data into analytics-ready tables in Amazon Redshift. The pipeline powers dashboards for marketing, sales, and operations, enabling real-time decision-making.
💡 **Automated ELT pipeline** for ingesting data with **Airbyte**, transforming it with **dbt**, and orchestrating analytics on **AWS Redshift**, powered by **Postgres** and containerized with **Docker**.
> ✅ Designed as a **portfolio project for Data Engineer roles**, integrating batch processing, modeling, BI reporting, and AI-based interaction.

## 🚀Project Overview
> 🚗 **Use case:** Help sales & operations teams explore EV product configurations, color options, and sales trends via a conversational interface.

[Big Star Collectibles](https://bigstarcollectibles.com/) is an e-commerce platform specializing in unique merchandise such as stickers, stationery, apparel, and collectibles.  
This project demonstrates the design and implementation of an **end-to-end ELT data pipeline** to support data-driven decision-making for Big Star’s operations.  

### Key Objectives

- **Automated Data Extraction**: Use **Airbyte** to extract raw tables (orders, customers, products, order_items) from a PostgreSQL database.  
- **Centralized Data Loading**: Load extracted data into **AWS Redshift** as the single source of truth for analytics.  
- **Robust Data Modeling**: Build layered models with **dbt** (staging → intermediate → marts), including:
  - **fact_orders** (fact table for transactions)  
  - **dim_customers**, **dim_products** (dimension tables)  
  - Enriched intermediate models for order items and order totals  
- **Data Quality Assurance**: Apply schema descriptions and dbt tests (`not_null`, `unique`, `accepted_values`, `relationships`) to ensure reliable and trusted data.  
- **Containerized Deployment**: Use **Docker** to package dbt and Airbyte for scalable deployment with CI/CD integration.  
- **Business Value**: Deliver curated data marts that power BI dashboards, Customer Lifetime Value (CLV) analysis, and sales performance tracking.  

This project showcases modern data engineering best practices by combining **SQL, AWS, Airbyte, dbt, Redshift, and Postgres** into a production-ready ELT workflow.

## 🏗️ Architecture

This project implements a modern **ELT pipeline** for Big Star Collectibles. The architecture is designed to be **scalable, modular, and production-ready**, leveraging cloud infrastructure and orchestration tools.

### Architecture Diagram

![📷 Workflow](readme_assets/images/aws.drawio.png)

### Data Flow

1. **Data Sources**  
   - PostgreSQL transactional database for orders, customers, products, and order_items.  
   - Optional external CSV/JSON sources for enrichment.

2. **Ingestion Layer**  
   - **Airbyte** is used to extract raw data from PostgreSQL and other sources.  
   - Supports incremental and full-load extraction.  

3. **Data Warehouse / Storage**  
   - **AWS Redshift** serves as the centralized data warehouse.  
   - Raw data is loaded into **staging tables** for processing.

4. **Transformation Layer**  
   - **dbt** is used to build modular, layered models:  
     - **Staging Models**: Clean and normalize raw data.  
     - **Intermediate Models**: Enrich data, calculate order totals, item counts, etc.  
     - **Marts / Fact & Dimension Tables**: Ready for analytics and BI dashboards (e.g., `fact_orders`, `dim_customers`, `dim_products`).

5. **Data Quality & Testing**  
   - dbt tests (`not_null`, `unique`, `accepted_values`, `relationships`) ensure data integrity across all layers.  
   - Schema documentation provides observability and governance.

6. **Orchestration & Deployment**  
   - **Docker** containerizes dbt and Airbyte jobs.  
   - **CI/CD** pipelines automate testing, builds, and deployments for consistent data workflows.

7. **Analytics & Business Insights**  
   - Final data marts support:  
     - **Customer Lifetime Value (CLV)** calculations  
     - **Sales trend analysis**  
     - **Dashboard visualizations** with BI tools  

## Prerequisites
Ensure you have Python 3 installed. If not, you can download and install it from Python's official website.

## Installing
1. Fork the Repository:
    - Click the "Fork" button on the top right corner of this repository.
2. Clone the repository:
    - `git clone https://github.com/YOUR_USERNAME/end-to-end-data-engineering-project-4413618.git`
    - Note: Replace YOUR_USERNAME with your GitHub username
3. Navigate to the directory:
    - `cd end-to-end-data-engineering-project-4413618`
4. Set Up a Virtual Environment:
    - For Mac:
        - `python3 -m venv venv` 
        - `source venv/bin/activate`
    - For Windows:
        - `python -m venv venv`
        - `.\venv\Scripts\activate`
5. Install Dependencies:
    - `pip install -e ".[dev]"`

## ⚙️ Tech Stack

This project leverages a modern **Data Engineering toolkit** to ensure scalability, modularity, and maintainability.

- **Languages**
  - Python 🐍 – scripting, orchestration, and automation
  - SQL – transformations, modeling, and analytics

- **Data Ingestion**
  - Airbyte – ELT pipeline for extracting and loading data from PostgreSQL and external sources

- **Data Warehouse**
  - Amazon Redshift – scalable, columnar cloud data warehouse

- **Transformation & Modeling**
  - dbt (Data Build Tool) – modular transformations, testing, documentation, and lineage tracking

- **Containerization & Orchestration**
  - Docker – containerized environments for reproducibility
  - (Optional) Airflow – workflow orchestration and scheduling

- **Version Control & CI/CD**
  - Git + GitHub – collaborative development and version control
  - GitHub Actions – automated testing, builds, and deployments

- **Data Visualization**
  - Power BI / Tableau – dashboards and business intelligence reporting

- **Monitoring & Data Quality**
  - dbt tests – built-in validation (`unique`, `not_null`, `relationships`, `accepted_values`)
  - Documentation & lineage – automatic docs generated in dbt
Change Data Capture (CDC)

/docker-entrypoint-initdb.d # psql -U postgres -d big-star-db
psql (15.3)
Type "help" for help.

big-star-db=# \dt
            List of relations
 Schema |    Name     | Type  |  Owner   
--------+-------------+-------+----------
 public | customers   | table | postgres
 public | order_items | table | postgres
 public | orders      | table | postgres
 public | products    | table | postgres
(4 rows)

big-star-db=# ALTER TABLE customers REPLICA IDENTITY DEFAULT;
ALTER TABLE
big-star-db=# ALTER TABLE order_items REPLICA IDENTITY DEFAULT;
ALTER TABLE
big-star-db=# ALTER TABLE orders REPLICA IDENTITY DEFAULT;
ALTER TABLE
big-star-db=# ALTER TABLE products REPLICA IDENTITY DEFAULT;
ALTER TABLE
big-star-db=# SELECT pg_create_logical_replication_slot('airbyte_slot', 'pgoutput');
 pg_create_logical_replication_slot 
------------------------------------
 (airbyte_slot,0/254B6A8)
(1 row)

big-star-db=# CREATE PUBLICATION airbyte_publication FOR TABLE customers, order_items, orders, products;
CREATE PUBLICATION
big-star-db=# 

Install Airbyte reference

https://docs.airbyte.com/platform/using-airbyte/getting-started/oss-quickstart

## 数据建模



