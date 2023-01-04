-- Maximize Prime Item Inventory [Amazon SQL Interview Question]
WITH summary AS (
  SELECT 
    item_type, 
    SUM(square_footage) AS total_footage,
    COUNT(*) AS item_count
  FROM inventory
  GROUP BY item_type
  ),
  prime_items AS ( 
  SELECT 
    DISTINCT item_type, 
    total_footage, 
    FLOOR(500000/total_footage) AS prime_item_combo,
    FLOOR(500000/total_footage) * item_count AS prime_item_count
  FROM summary
  WHERE item_type = 'prime_eligible'
  ),
  non_prime_items AS (
    SELECT DISTINCT 
      item_type, 
      total_footage, 
      FLOOR(
      (500000 - (SELECT total_footage*prime_item_combo FROM prime_items))
      /total_footage)*item_count AS non_prime_item_count
    FROM summary
    WHERE item_type = 'not_prime'
  )
  SELECT item_type, prime_item_count
  FROM prime_items
  UNION ALL
  SELECT item_type, non_prime_item_count
  FROM non_prime_items