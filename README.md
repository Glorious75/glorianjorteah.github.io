# Instacart Data Analytics:Driving E-Commerce Profitability & Operational Efficiency (SQL & Power BI)
# Project Overview
This project is an in-depth, data-driven analysis of Instacart's operational and sales data, utilizing SQL for complex data manipulation and Power BI for interactive visualization.
The primary goal is to provide Instacart's Management with a dynamic, centralized dashboard that shifts focus from high-level performance metrics to granular insights into profitability, demand forecasting, and inventory optimization

# Key Performance Indicators (KPIs)

The primary dashboard tracks the following core KPIs to monitor business health:

-  Total Orders: Volume of completed transactions.

-  Total Customers: Count of unique customers served.

-  Total Revenue: Gross sales generated.

-  Average Order Value (AOV): Revenue per order, indicating customer spending behavior.

# Business Objectives & Strategic Problems
This analysis directly addresses four (4) critical business problems through data interrogation:

- Profit Leakage in Aisles (Optimizing Margins):

  Goal: Inform purchasing teams to negotiate better supplier pricing or reduce low-margin items in underperforming aisles.

  Requirement: Identify aisles with high customer demand but disproportionately low profitability.

- Product Portfolio Review (Inventory Management):

  Goal: Promote high-performing products through marketing campaigns and evaluate underperforming products for potential discontinuation or improvement.

  Requirement: Identify the top 5 best-performing and bottom 5 worst-performing products based on total sales volume and revenue.

- Labor Cost Optimization (Operational Efficiency):

  Goal: Optimize employee shift scheduling to match demand, ensuring peak efficiency and reducing labor costs during low-activity periods.

  Requirement: Determine the busiest time blocks (hour of day/day of week) for order activity.

- Inventory & Marketing Alignment (Demand Forecasting):

  Goal: Plan inventory levels and align marketing spend ahead of predicted demand spikes, minimizing overstocking risks.

  Requirement: Analyze historical sales trends to predict future demand spikes and seasonal dips.

# Technical Stack (The Tools Checklist)

## Database: SQL (for data cleaning, transformation, and aggregation)

## Visualization:Power BI (for interactive dashboard creation)

## Documentation: GitHub (for project management and portfolio presentation)

# Dashboard Visualizations

The Power BI dashboard includes, but is not limited to, the following visualizations:

* **Order Volume by Hour and Day:** Heatmap demonstrating hourly and daily staffing requirements.

* **Revenue by Department (Top 5/Bottom 5):** Bar chart for quick identification of core drivers.

* **Aisle Profitability Scatter Plot:** Visualizes demand (x-axis) vs. profit margin (y-axis) to flag low-profit, high-demand areas.

* **Monthly Sales Trend Line:** Includes a moving average to highlight seasonal spikes and predict the upcoming holiday demand.

![Instacart_Dashboard_Preview jpeg](https://github.com/user-attachments/assets/57cc8031-3543-478f-af9a-f0668bfd562a)

![Instacart_Dashboard_2](https://github.com/user-attachments/assets/41c618ec-f31b-4733-a475-40ab2a8a7ae3)

# Detailed SQL Analysis and Business Questions

The following specific questions were translated into complex SQL queries to generate the necessary datasets for Power BI. The full SQL code for these solutions is available here:

**Direct Link to SQL Code:** [View All Instacart SQL Queries Here](Instacart_SQL_Queries.sql)

### 1. What are the Top 5 Departments by Total Revenue?

* **Business Context:** Essential for prioritizing investments and resource allocation toward the primary revenue-driving categories.
* **Strategic Approach:** Requires **JOINing** Order and Product tables to the Department table, calculating total revenue (`SUM(price * quantity)`), and using `GROUP BY` and `LIMIT` to isolate the top contributors.

### 2. What are the Top 3 Products Sold Most During the Weekends?

* **Business Context:** Understanding weekend consumer behavior allows for highly targeted weekend marketing campaigns and ensures adequate shelf stock before high-traffic days.
* **Strategic Approach:** Involves filtering orders where the `order_day_of_week` column corresponds to Friday, Saturday, or Sunday. The analysis then counts the distinct purchases of each product, using `GROUP BY` and `ORDER BY` to find the top three.

### 3. Does Bread Generate More Profit than Alcoholic Products?

* **Business Context:** This is a crucial margin optimization question, comparing a high-volume, low-margin category (Bread) against a lower-volume, higher-margin category (Alcohol). The goal is to determine which category deserves more shelf space and promotional focus.
* **Strategic Approach:** Requires joining product data to an assumed **Profit Margin** column (or calculated cost data). The query aggregates total profit for the aisles/departments, enabling a direct, actionable comparison.

### 4. Which Products have Not Been Sold at All (Dead Stock)?

* **Business Context:** Identifies inventory that is consuming warehouse space, contributing to clutter, and generating zero revenue. This drives immediate decisions on product discontinuation.
* **Strategic Approach:** Solved using a **LEFT JOIN** from the main **Products** table to the **Order Products** table. We then filter for records where the corresponding order ID is **NULL**, indicating the product has never appeared in a customer order.

### 5. Calculate the Hourly Order Volume to Identify Peak Staffing Times.

* **Business Context:** The foundation for labor cost optimization. Granular order volume data by hour is necessary to align employee shifts precisely with customer demand peaks, minimizing unnecessary labor during slow periods.
* **Strategic Approach:** Requires simple aggregation, counting orders (`COUNT(order_id)`) and grouping by the `order_hour_of_day` column, combined with the `order_day_of_week` to identify specific staffing windows.

# Key Findings & Strategic Recommendations

This section translates the data from the dashboard visualizations directly into actionable business insights for Instacart management.

* **Finding 1: High-Volume, High-Revenue Departments**

  * **Result:** **Personal Care** and **Snacks** departments represent the highest total profit, each generating over **2.3 Million** units of profit (and combined revenue of over $760K). The **Beverages** department, while generating high volume (62,282 units sold), only ranks 4th in total profit (1.6M).
  * **Recommendation:** Leverage the high profit and volume in **Snacks** and **Personal Care** by increasing promotional spend in these departments. Conduct a deeper cost analysis on **Beverages** to see if vendor pricing can be negotiated, or if high-margin items can be promoted over low-margin bulk items.

* **Finding 2: Labor Cost Optimization based on Peak Demand**

  * **Result:** The highest volume of orders consistently occurs during the **9 AM, 10 AM, and 11 AM** blocks on weekdays. For instance, on Monday, orders peak at **1,483** at 10 AM and 12 PM. The period between **2 PM and 7 PM (hours 14-19)** sees a steady, high volume, with a clear drop-off after 7 PM.
  * **Recommendation:** Implement a staggered shift schedule to maximize staff presence between **9 AM and 1 PM**. Reduce staff levels by at least **30%** during the off-peak hours (1 AM to 5 AM) and after 10 PM to minimize labor costs during low-demand windows.

* **Finding 3: Inventory and Marketing Alignment (Seasonal Trend)**

  * **Result:** Monthly sales volume shows a clear **seasonal spike** in **October and November**, reaching a peak of over **1,647K** orders. Volume drops significantly in the middle of the year, particularly in July.
  * **Recommendation:** Ensure **inventory and marketing spend are budgeted to increase by at least 5%** leading into the Q4 holiday season (September/October). Conversely, reduce inventory commitments for non-perishables during the low-volume months of July and August.
 
