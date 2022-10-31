-- Spare Server Capacity
WITH forecasted_total AS (
  SELECT datacenter_id, SUM(monthly_demand) AS total_demand 
  FROM forecasted_demand
  GROUP BY datacenter_id
)
SELECT d.datacenter_id, (monthly_capacity-total_demand) AS spare_capacity
FROM datacenters AS d
JOIN forecasted_total AS f
  ON d.datacenter_id = f.datacenter_id
ORDER BY 1;