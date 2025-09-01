# StackFusion: Modern Data Pipeline for SaaS Analytics

workflow

## 1 Extract and Load: Airbyte
Big Star Postgres -> Big Star Warehouse (BigQuery)
## 2 Transform: dbt


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

## 数据同步
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



