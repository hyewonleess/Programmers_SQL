SELECT h.hacker_id, name, COUNT(challenge_id) AS c_count
FROM hackers AS h
JOIN challenges AS c ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, name
HAVING c_count = (SELECT MAX(c1.c_count)
                  FROM (SELECT COUNT(challenge_id) AS c_count FROM challenges
                  GROUP BY hacker_id) AS c1)
OR c_count IN (SELECT c_count
               FROM (SELECT hacker_id, COUNT(*) AS c_count FROM challenges GROUP BY hacker_id) AS c2
               GROUP BY c2.c_count
               HAVING COUNT(*) = 1)
ORDER BY c_count DESC, h.hacker_id
