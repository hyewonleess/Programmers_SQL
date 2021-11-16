SELECT ai.animal_id, ai.animal_type, ai.name
FROM animal_ins as ai
     INNER JOIN animal_outs as ao ON ai.animal_id = ao.animal_id
WHERE (ao.sex_upon_outcome LIKE '%Spayed%' OR ao.sex_upon_outcome LIKE '%Neutered%')
      AND ai.sex_upon_intake LIKE '%Intact%'
ORDER BY ai.animal_id
