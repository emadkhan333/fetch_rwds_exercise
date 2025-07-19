## Step 1: Review Unstructured Data & Define Relational Model

The goal of Step 1 is to take the three JSON files (`users.json`, `brands.json`, and `receipts.json`) and design a clean, query-friendly relational schema. Below is our proposed star schema, with two dimension tables and two fact tables.

### ER Diagram

```mermaid
erDiagram
    DIM_USER ||--o{ FACT_RECEIPT : submits
    DIM_BRAND ||--o{ FACT_RECEIPT_ITEM : is_for
    FACT_RECEIPT ||--o{ FACT_RECEIPT_ITEM : contains

    DIM_USER {
      varchar user_id PK           “users._id”
      varchar state                “users.state”
      timestamp created_date       “users.createdDate”
      timestamp last_login         “users.lastLogin”
      varchar role                 “users.role”
      boolean active               “users.active”
    }
    DIM_BRAND {
      varchar brand_id PK          “brands._id”
      varchar barcode              “brands.barcode”
      varchar brand_code           “brands.brandCode”
      varchar name                 “brands.name”
      varchar category             “brands.category”
      varchar category_code        “brands.categoryCode”
      varchar cpg_id               “brands.cpg”
      boolean top_brand            “brands.topBrand”
    }
    FACT_RECEIPT {
      varchar receipt_id PK        “receipts._id”
      varchar user_id FK           → DIM_USER.user_id
      int     bonus_points_earned  “receipts.bonusPointsEarned”
      varchar bonus_points_reason  “receipts.bonusPointsEarnedReason”
      timestamp create_date        “receipts.createDate”
      timestamp date_scanned       “receipts.dateScanned”
      timestamp finished_date      “receipts.finishedDate”
      timestamp modify_date        “receipts.modifyDate”
      timestamp points_awarded_date“receipts.pointsAwardedDate”
      int     points_earned        “receipts.pointsEarned”
      date    purchase_date        “receipts.purchaseDate”
      int     purchased_item_count “receipts.purchasedItemCount”
      varchar rewards_receipt_status “receipts.rewardsReceiptStatus”
      numeric total_spent          “receipts.totalSpent”
    }
    FACT_RECEIPT_ITEM {
      varchar receipt_item_id PK   “generated surrogate key”
      varchar receipt_id FK        → FACT_RECEIPT.receipt_id
      varchar barcode FK           → DIM_BRAND.barcode
      int     quantity             “item quantity in JSON”
      numeric item_price           “if provided, else NULL”
    }
