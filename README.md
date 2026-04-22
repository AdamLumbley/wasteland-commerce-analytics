# ☢️ Wasteland Commerce Analytics (SQLite)

## 📌 Overview

This project is a simulated e-commerce analytics system built in SQLite, modeled as a Fallout-inspired East Coast trade network. It represents a fictional marketplace where multiple factions purchase weapons, armor, medical supplies, and survival gear across distributed locations.

The goal is to practice real-world BI and SQL analytics workflows using structured transactional data.

---

## 🧠 Business Simulation Context

In this world, a hidden supplier operates across 22 East Coast trading hubs, selling goods to competing factions including:

- Brotherhood of Steel  
- Raiders  
- Vault Dwellers  
- NCR Remnants  
- Caesar Legion Cells  

Transactions are logged across multiple years, simulating a persistent black-market economy.

---

## 🗄️ Database Schema

The system consists of 5 core tables:

- **customers** → faction-based buyers with city/state metadata  
- **products** → weapons, armor, medical supplies, explosives  
- **locations** → 22 trade hubs across the East Coast  
- **orders** → transactional sales records  
- **order_items** → line-level purchase data  

This follows a simplified star-schema structure designed for analytics workloads.

---

## ⚙️ Key Features

### 📊 Revenue Analytics
- Product-level revenue breakdown
- Category-based performance ranking
- Total sales contribution by item

### 🧍 Customer Analytics
- Faction-based segmentation
- Regional purchasing behavior
- Demand concentration analysis

### 📈 Time-Series Metrics
- Month-over-month (MoM) revenue growth
- Cumulative revenue tracking
- Long-term trend analysis

### 🧮 Advanced SQL Techniques
- Common Table Expressions (CTEs)
- Window Functions (LAG, DENSE_RANK, SUM OVER)
- Partitioned ranking logic
- Time-based aggregation using `strftime`

---

## 🔍 Example Queries

### Top Products by Category (Revenue)
Uses window functions to rank products within each category based on total revenue.

### Monthly Revenue Trends
Tracks revenue over time including:
- MoM change
- Percentage growth
- Cumulative revenue

---

## 📊 Example Insights

- Energy weapons and armor generate the highest revenue concentration, indicating a premium-heavy sales structure  
- Faction behavior varies significantly, with Brotherhood of Steel favoring armor purchases while Raiders skew toward improvised weapons and explosives  
- Revenue trends show periodic spikes driven by high-value bulk transactions rather than steady demand  
- A small subset of products drives a disproportionate share of total revenue, confirming a strong Pareto (80/20) distribution  

---

## 🧪 Tech Stack

- SQLite  
- SQL (CTEs, Window Functions, Aggregations)  
- Relational data modeling  
- Synthetic dataset generation  

---

## 🎯 Purpose

This project was built to practice:

- Analytical SQL thinking  
- Business KPI generation  
- Data modeling for transactional systems  
- Realistic dataset simulation for portfolio development  

---

## 🚀 Future Improvements

- Add Power BI / Tableau dashboard layer  
- Introduce supply constraints and pricing inflation  
- Expand customer behavior modeling (RFM analysis)  
- Add returns and failed transaction tracking  
- Introduce seasonal demand simulation  

---

## 📌 Notes

This project is fully simulated and inspired by Fallout lore. It is intended strictly for data analytics practice and portfolio demonstration.
