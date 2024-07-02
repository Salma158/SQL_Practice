-- using self join
SELECT W2.id
FROM Weather W2
JOIN Weather W1 ON DATEDIFF(W2.recordDate, W1.recordDate) = 1
WHERE W2.temperature > W1.temperature;


-- using subquery
SELECT W1.id
FROM Weather W1
WHERE W1.temperature > (
    SELECT W2.temperature
    FROM Weather W2
    WHERE W2.recordDate = DATE_SUB(W1.recordDate, INTERVAL 1 DAY)
);