WITH 
survey AS(
    SELECT * FROM `cloudside-academy.dbt_sample_data.annual-enterprise-survey02`
),

a AS(
    SELECT 
        Year,
        value,
        serial_number
    FROM a 
)

select * from a