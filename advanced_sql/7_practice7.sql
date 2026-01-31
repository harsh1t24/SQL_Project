with remote_job_skills AS 
    (SELECT skill_id,
         count(*) AS skill_count
    FROM skills_job_dim AS jobs
    JOIN job_postings_fact AS posting
        ON jobs.job_id = posting.job_id
    WHERE posting.job_work_from_home is TRUE
            AND job_title_short = 'Data Analyst'
    GROUP BY  skill_id )
SELECT skills.skill_id ,
         skills AS skill_name,
         skill_count
FROM remote_job_skills
JOIN skills_dim AS skills
    ON skills.skill_id = remote_job_skills.skill_id
ORDER BY  skill_count DESC limit 5