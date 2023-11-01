WITH
   {{config(materialized='table')}}

survey as (
SELECT * FROM {{ref('inter_aes')}} 
)

SELECT * FROM survey