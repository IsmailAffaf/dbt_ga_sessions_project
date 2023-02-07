SELECT 
    operationSystem,
    distincCountCountry
FROM {{ ref('distinct_country_count') }}
WHERE distincCountCountry < 0 OR distincCountCountry IS NULL