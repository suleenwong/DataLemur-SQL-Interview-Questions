-- Unique Money Transfer Relationships
SELECT COUNT(payer_id)/2
FROM (
  SELECT payer_id, recipient_id 
  FROM payments
  INTERSECT
  SELECT recipient_id, payer_id
  FROM payments
  ) AS relationships;