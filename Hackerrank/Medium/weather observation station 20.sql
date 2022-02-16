SET @rownum = -1;
SELECT ROUND(AVG(lat_n), 4) AS median
FROM (SELECT @rownum:=@rownum + 1 AS rnum, lat_n 
      FROM station
      ORDER BY lat_n) AS stat
WHERE rnum IN (FLOOR(@rownum/2), CEIL(@rownum/2))
