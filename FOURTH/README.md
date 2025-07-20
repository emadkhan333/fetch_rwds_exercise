**To:** @ProductOps  
**Subject:** Receipt Data Review – Findings & Questions

Hi team,

I have completed an initial review of our sample receipt data and identified a few areas where I could benefit from your input before proceeding to full-scale ingestion and reporting. Below is a summary of what I found, along with the questions that will help us ensure accuracy and performance.

---

### Data Quality Findings
1. **Null or Negative Spend**  
   • ~0.5% of receipts have `total_spent` either missing or negative.  
   - Discovered by running a simple SQL check: `WHERE total_spent IS NULL OR total_spent < 0`.

2. **Item Count Mismatches**  
   • ~1% of receipts report a `purchased_item_count` that doesn’t match the sum of line‐item quantities.  
   - Identified by exploding `rewardsReceiptItemList` and comparing `SUM(quantity)` vs. `purchased_item_count`.

3. **Unexpected Status Values**  
   • A handful of receipts show statuses outside our expected set (`Accepted`, `Rejected`, `Pending`), e.g. `Error`.  
   - Flagged via `SELECT DISTINCT rewards_receipt_status`.

4. **Out-of-Range Dates**  
   • Found receipts dated in the future (2028!) and before 2010.  
   - Spotted by converting `purchase_date` to timestamps and filtering extremes.

---

### Questions for You
1. **Spend Corrections**  
   • How should we handle negative or missing `total_spent`? Default to zero, drop the record, or flag for manual review?

2. **Line-Item Fidelity**  
   • Should every field in the JSON’s `rewardsReceiptItemList` be surfaced in our reporting schema, or only core metrics (barcode, quantity, price)?

3. **Status Glossary**  
   • Can you provide the full list of valid `rewardsReceiptStatus` values and business rules for each?

4. **Date Validation**  
   • Is there an acceptable date range for `purchase_date` we should enforce (e.g. no older than X years, not in the future)?

5. **Missing Metadata**  
   • Do we have a master list or API for CPG details referenced in the brands file?  
   • Will we need user segmentation flags (e.g. marketingOptIn) or other attributes not currently in the sample?

---

### Performance & Scaling
- **Partitioning:** Plan to partition `fact_receipt` by month and index on `purchase_date` for speedy time-based queries.  
- **Bulk Loads:** Expecting daily JSON batches—will use parallel COPY/ingest jobs to keep latency under 15 minutes.  
- **SLAs:** What’s our target query response time for dashboard lookups (top 5, drilldowns, etc.)?

---

I'd be happy to jump on a quick call to demo the schema and walk through these points. Thanks for your guidance!

Emad, 
Analytics Engineer  
