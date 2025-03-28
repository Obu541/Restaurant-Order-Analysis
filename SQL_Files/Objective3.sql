-- 1. Combine the menu_items and order_details tables into a single table.
SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT * 
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id;

-- 2. What were the top 5 the least and most ordered items? What categories were they in?    

SELECT item_name, price, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
Order by num_purchases
Limit 5;

SELECT item_name, price, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
Order by num_purchases DESC
Limit 5;

-- 3. What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spend 
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;
    
-- 4. View the details of the highest spent order. What insights can you gather from the results?  
-- the highest spend order from the previous task was 440
SELECT category, item_name, price, COUNT(item_id) AS num_items 
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category, item_name, price
ORDER BY num_items DESC; -- The Italian food ordered the most in the highest order, the most popular are 
-- two dishes: Spaghetti&Meatballs and Fettuccine Alredo

-- 5. View the details of the top 5 highest spent orders.What insights can you gather from the results? 
SELECT order_id, category, COUNT(item_id) AS num_items 
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;
-- From these top 5 orders we have seen that they tend to spend mostly on Italian food. 
-- We should keep these expensive Italian dishes on our menu, because they are very popular.
