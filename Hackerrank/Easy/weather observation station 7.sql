SELECT DISTINCT city
FROM station
WHERE RIGHT(city, 1) in ('a', 'e', 'i', 'o', 'u')
