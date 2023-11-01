WITH
{{config(materialized='view')}}

inter as(
    select
        CAST(value AS INT64) AS value_as_int,
        {{ dbt_utils.star(from=ref('stg_aes01'), except=["serial_number"]) }},
        {{ dbt_utils.star(from=ref('stg_aes02'), except=["Year","id","serial_number"]) }}

    FROM
        {{ ref('stg_aes02') }} AS t2
    RIGHT JOIN
        (
        SELECT
            Industry_aggregation_NZSIOC,
            year,
            id,
            serial_number,
            CAST(value AS INT64) AS value_as_int
        FROM
            {{ ref('stg_aes01') }}   
        GROUP BY
            id,
            Industry_aggregation_NZSIOC,
            serial_number,
            value,
            Year
) AS t2
    ON
        t1.id = t2.serial_number
    WHERE
        t1.year=2013
)

Select * from inter
