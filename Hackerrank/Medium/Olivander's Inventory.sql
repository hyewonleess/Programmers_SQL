SELECT id, age, w1.coins_needed, w1.power
FROM (SELECT code, power, MIN(coins_needed) AS coins_needed 
      FROM wands
      GROUP BY code, power) AS w1
JOIN wands AS w2 ON w1.code = w2.code AND w1.power = w2.power AND w2.coins_needed = w1.coins_needed
JOIN wands_property AS p ON p.code = w1.code
WHERE p.is_evil = 0
ORDER BY w1.power DESC, age DESC
