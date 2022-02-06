SELECT h.hacker_id, h.name, SUM(score) AS total
FROM (SELECT hacker_id, challenge_id, MAX(score) AS score
      FROM submissions GROUP BY hacker_id, challenge_id) AS s
JOIN hackers AS h ON h.hacker_id = s.hacker_id
GROUP BY h.hacker_id, h.name
HAVING total > 0
ORDER BY total DESC, hacker_id
