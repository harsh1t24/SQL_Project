with first_quater AS 
    (SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs )
SELECT job_title_short,
         job_location,
         job_via,
         job_posted_date :: DATE,
         salary_year_avg
FROM first_quater
WHERE salary_year_avg is NOT null
        AND salary_year_avg > 70000
        AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC