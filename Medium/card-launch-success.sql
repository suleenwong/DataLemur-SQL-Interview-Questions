-- Card Launch Success
WITH cards_launch AS (
  SELECT 
    card_name, 
    issued_amount,
    RANK() OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) AS rnk
  FROM monthly_cards_issued
)
SELECT 
  card_name, 
  issued_amount
FROM cards_launch
WHERE rnk = 1
ORDER BY issued_amount DESC;