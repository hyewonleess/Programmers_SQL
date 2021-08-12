SELECT HOUR(datetime) AS hour, COUNT(datetime)
FROM animal_outs
GROUP BY hour
HAVING hour >= 0 AND hour < 24
ORDER BY hour
