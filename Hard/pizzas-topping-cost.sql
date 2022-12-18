-- 3-Topping Pizzas
SELECT 
  p1.topping_name || ',' || p2.topping_name || ',' || p3.topping_name AS pizza,
  p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost AS total_cost
FROM pizza_toppings AS p1
JOIN pizza_toppings AS p2
  ON p1.topping_name < p2.topping_name
JOIN pizza_toppings AS p3
  ON p2.topping_name < p3.topping_name
ORDER BY total_cost DESC, pizza;