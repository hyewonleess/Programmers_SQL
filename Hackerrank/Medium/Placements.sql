SELECT s.name
FROM friends AS f
JOIN students AS s ON f.id = s.id
JOIN packages AS p ON f.id = p.id
JOIN packages AS pf ON f.friend_id = pf.id
WHERE p.salary < pf.salary
ORDER BY pf.salary
