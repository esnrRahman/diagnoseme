SELECT DISTINCT * FROM patients WHERE lower(last_name) LIKE '%mit%';

SELECT DISTINCT * FROM encounters where discharged_at IS NOT NULL;

SELECT DISTINCT * FROM encounters where discharged_at >= '2014-07-05' and discharged_at <= '2014-08-19';
