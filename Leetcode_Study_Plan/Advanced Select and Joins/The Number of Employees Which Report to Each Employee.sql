WITH cte AS (
    SELECT 
        reports_to, 
        COUNT(employee_id) AS reports_count, 
        ROUND(AVG(age), 0) AS average_age
    FROM 
        Employees
    WHERE 
        reports_to IS NOT NULL
    GROUP BY 
        reports_to
)
SELECT 
    c.reports_to AS employee_id, 
    e.name, 
    c.reports_count, 
    c.average_age
FROM 
    cte c
JOIN 
    Employees e
ON 
    c.reports_to = e.employee_id
ORDER BY 
    employee_id;
