# Recursive CTE 사용하여 문제 풀이

WITH RECURSIVE timetable AS(
SELECT 0 AS hour
UNION ALL
SELECT timetable.hour+1 FROM timetable WHERE timetable.hour<23)


SELECT t.hour, COUNT(ao.animal_id) AS count
FROM timetable AS t 
     LEFT JOIN animal_outs AS ao ON t.hour = HOUR(ao.datetime)
GROUP BY t.hour
ORDER BY t.hour
