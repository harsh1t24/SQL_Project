SELECT job_title as titls,
job_location as location,
job_posted_date at time zone 'UTC' at time zone 'IST' as date_time,
EXTRACT (month from job_posted_date) as job_date
from job_postings_fact
limit 10
