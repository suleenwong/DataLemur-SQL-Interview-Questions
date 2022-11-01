-- Compensation Outliers
WITH compensation AS (
  SELECT employee_id, 
         salary, 
         title,
         2*(AVG(salary) OVER (PARTITION BY title)) AS average_2times,
         0.5*(AVG(salary) OVER (PARTITION BY title)) AS half_average
  FROM employee_pay
)
SELECT employee_id, salary, 
       CASE WHEN salary > average_2times THEN 'Overpaid'
            WHEN salary < half_average THEN 'Underpaid' END AS status
FROM compensation
WHERE salary > average_2times
  OR salary < half_average;