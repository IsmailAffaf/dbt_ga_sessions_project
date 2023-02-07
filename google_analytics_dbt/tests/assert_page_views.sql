SELECT 
    operationSystem,
    totalPageViews
FROM {{ ref('total_page_views') }}
WHERE totalPageViews < 0 OR totalPageViews IS NULL