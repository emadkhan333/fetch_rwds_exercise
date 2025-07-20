
### What I’ve Noticed
- **Weird Spending Values**  
  A small handful of receipts show negative or missing totals. I want to make sure we handle those correctly—should we treat them as $0, drop them, or flag them for review?

- **Item Count Discrepancies**  
  In a few cases, the number of items recorded on the receipt doesn’t match the individual line-items. Any rules on how to reconcile those?

- **Unexpected Status Labels**  
  Most receipts are marked “Accepted,” “Rejected,” or “Pending,” but I saw a couple labeled “Error.” Is that expected, or should we map those differently?

- **Date Oddities**  
  We have a couple of receipts dated in the future and a few that seem really old. What date range would you consider valid for our reports?

---

### A Few Quick Questions
1. **Handling Anomalies:** How would you like us to treat negative or missing spend values?  
2. **Line-Item Detail:** Do you need every field from the raw receipt items, or just the basics (brand, quantity, price)?  
3. **Status Definitions:** Can you share the full list of receipt statuses and what each means for our analysis?  
4. **Valid Date Range:** Should we ignore anything outside a specific window (e.g., last five years, no future dates)?  
5. **Extra Context:** Is there any other user or brand information (e.g., marketing flags, CPG details) you’d like included before we go live?

---

### Looking Ahead
- I’m planning to organize the data so we can run reports quickly—things like top brands, average spend, and so on.  
- In production, we’ll partition data by month for fast queries and load daily batches in parallel.  
- What’s our target for report refresh times or dashboard load speed?

Let me know if you’d like a quick demo or a short call to talk through these points. Thanks for your input!

Best,  
Emad 
Analytics Engineer  
