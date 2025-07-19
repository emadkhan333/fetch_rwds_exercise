## FIRST: Review Unstructured Data & Define Relational Model

The goal is to take the three JSON files (`users.json`, `brands.json`, and `receipts.json`) and design a relational schema. Below is our proposed star schema, with two dimension tables and two fact tables.

I have chosen a simple star schema because it keeps things both clear and fast. By separating user and brand details into their own “dimension” tables and placing the actual receipt events and line items into “fact” tables, you achieve quick aggregations without having to wade through dozens of unused columns. Using surrogate keys (like a generated ID for each receipt item) and a straightforward barcode → brand lookup makes joins bulletproof and future tweaks painless. If you ever need every last bit of the raw JSON, you can stash it in a separate staging or audit table—so your analytics tables stay lean, but nothing ever gets lost. Plus, adding new dimensions later (such as time zones, regions, or sales channels) is as easy as dropping in one more table, without turning the whole thing upside down.

(https://github.com/emadkhan333/fetch_rwds_exercise/blob/main/FIRST/db_erd.png)
