# my solution
SELECT h.hacker_id, h.name
FROM (SELECT s.hacker_id, COUNT(s.challenge_id) AS cnt
      FROM submissions s, challenges c, difficulty d
      WHERE s.challenge_id = c.challenge_id AND d.difficulty_level = c.difficulty_level
      AND s.score = d.score
      GROUP BY s.hacker_id) AS t
JOIN hackers AS h ON h.hacker_id = t.hacker_id
WHERE cnt > 1
ORDER BY cnt DESC, hacker_id

# alternative solution
SELECT h.hacker_id, h.name
FROM submissions AS s
INNER JOIN challenges AS c ON s.challenge_id = c.challenge_id
INNER JOIN difficulty AS d ON d.difficulty_level = c.difficulty_level
INNER JOIN hackers AS h ON h.hacker_id = s.hacker_id
WHERE d.score = s.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(h.hacker_id) > 1
ORDER BY COUNT(h.hacker_id) DESC, hacker_id 

