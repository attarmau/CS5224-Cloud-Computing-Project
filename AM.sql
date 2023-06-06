# You are given a SELECT statement showing customer names and orders. Customer names can repeat for multiple orders. How can you change the query to return a list of customers who ordered at least once?
SELECT DISTINCT customer_name
FROM your_table_name
WHERE customer_name IS NOT NULL;

# What can you add to your table definition to ensure that only records with a tolerance value within that range can be added to the table?
CREATE TABLE your_table_name (
  -- other column definitions
  
  tolerance_level DECIMAL(3, 1) CHECK (tolerance_level >= 2.0 AND tolerance_level <= 5.1),
  
  -- other column definitions
);

# increase order; decrease order
CREATE VIEW your_view_name AS
SELECT email_address, first_name, last_name, rank
FROM your_table_name
ORDER BY rank ASC, last_name DESC, first_name DESC;

# behave more like a keyword search for phrases
## The LIKE operator is used in the WHERE clause to perform pattern matching. The percent sign (%) is a wildcard that matches any sequence of characters.
SELECT * FROM data_table WHERE search_term LIKE '%<user_input>%';

# Write a SQL query to get the average review ratings for every product every month.
