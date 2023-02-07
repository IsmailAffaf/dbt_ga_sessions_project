{{ config(materialized='table') }}

SELECT 
    date AS reportDate, 
    device.operatingSystem AS operationSystem,
    COUNT(DISTINCT geoNetwork.country) AS distincCountCountry,
FROM {{ source("google_analytics_sample", "ga_sessions_*") }}
GROUP BY date, device.operatingSystem