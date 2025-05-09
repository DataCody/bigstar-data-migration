# StackFusion: Modern Data Pipeline for SaaS Analytics
✅ 项目逻辑回顾

架构：
	1.	数据创建源：Salesforce
	•	将模拟的 raw 数据（如 CSV）加载为 Salesforce 中的标准/自定义对象（如 Customers, Products, Transactions）
	•	实际等同于“公司业务数据已经产生在 CRM 系统中”
	2.	EL：Airbyte 自动抽取 Salesforce 数据
	•	使用 Salesforce connector 增量同步至 BigQuery（或 Snowflake）
	•	保存为 raw_data 表格，反映最真实的原始业务记录
	3.	T：dbt 清洗建模
	•	构建 stg_*、dim_*、fct_* 层
	•	例如：dim_customer、dim_product、fct_transaction
	4.	调度和依赖控制：Dagster
	•	控制整个 pipeline：从 Airbyte sync → 到 dbt model → 再到数据验证 / 流程通知

