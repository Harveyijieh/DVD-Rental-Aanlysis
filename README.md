# DVD Rental Aanlysis 🎬 📊 🎦

### Project Overview
The DVD Rental Database is a widely used dataset for learning database management and SQL analytics. This project aims to extract actionable insights from the database by leveraging PostgreSQL for data querying and PowerBI for data visualization. By analyzing rental trends, customer behavior, and revenue performance, we can make strategic business recommendations to enhance operations and profitability. This analysis covers various aspects, including customer spending habits, rental trends over time, and the financial performance of different movie categories. The insights derived will help in optimizing inventory management, improving customer engagement, and identifying potential areas for revenue growth. Additionally, this project serves as a demonstration of data analytics skills, including:

- Database querying with SQL
- Data visualization using PowerBI
- Business intelligence reporting

By the end of this project, stakeholders will have a better understanding of the key drivers behind the business performance of a DVD rental store, enabling them to make data-driven decisions that improve customer satisfaction and financial outcomes.

### Dataset Description 
The dataset comes from a PostgreSQL database (dvdrental) containing data on:

- Customers and payments
- Movies and categories
- Rentals and inventory
- Stores and staff

## Approach 

### Understanding the Business Problem
The aim is to answer the following business questions:

The goal of this project is to analyze the **dvdrental** database to uncover insights that can help optimize business decisions. We aim to answer key questions such as:  
- What movie categories generate the most revenue?  
- Who are the highest-paying customers?  
- What time of day do most rentals occur?
- Which cities generate the most revenue?
- What are the most rented movie genres?
- What are the most rented movies?
- How does revenue differ between store locations?

### Defining Key Metrics  
To achieve this, we focus on the following key performance indicators (KPIs):  
- **Total Revenue** (sum of `amount` from the `payment` table)  
- **Most Popular Movie Categories** (count of rentals per category)  
- **Peak Rental Hours** (rental transactions grouped by hour of the day)

### Extracting Data Using SQL  
We wrote SQL queries to retrieve data from the **dvdrental** database, using `JOINs` across multiple tables like:  
- `payment` (for revenue analysis)  
- `rental` (for rental trends)  
- `customer` (for customer insights)  
- `film_category` (for genre-based analysis)

### Data Cleaning & Preprocessing  
"Since dvdrental is a predefined PostgreSQL sample database, it is structured with clean, well-organized data. There are no missing values in key transactional tables such as `rental`, `payment`, and `customer`. Additionally, foreign key constraints prevent orphaned records, ensuring data consistency. Therefore, minimal preprocessing was required before analysis."

### Data Analysis and Visualization   
📊 **Revenue Trends** (Month-over-month revenue changes)  
🎭 **Top Movie Categories** (Most rented movie genres)  
👤 **Customer Insights** (Top-paying customers)  
⏳ **Peak Rental Hours** (When most rentals occur) 

Using **powerBI**, to create visualisation for the Dashbiard:
[View Power BI Dashboard](http://example)

Key Findings and Insights
- Top Customer: The highest-spending customer spent over $200 on rentals.
- Peak Rental Hours: Rentals peak between 6 PM - 9 PM, indicating prime business hours.
- Most Popular Category: Sports, Animation, and Action movies dominate rentals.
- City with Highest Revenue: Saint-Denis is the highest revenue-generating city, while London occupies the no 7 spot.
- Top Movie Rating: PG-13 tops rented movies rating.

### Recommendations  
Based on our analysis, we recommend:  
- Increasing inventory for **Action & Comedy** movies since they generate the most revenue  
- Offering targeted promotions to **top 10 highest-paying customers**  
- Extending rental store hours to cater to **evening peak demand (6-9 PM)**  


📦 DVD-Rental-Analysis
