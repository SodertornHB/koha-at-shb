/*================================================================
 Query Name  : statistics_ill_requests_by_category
 Description : Antal fjärrlån per låntagarkategori 
 som diffar
 Author      : Stefan Norinder
 Created     : 2024-07-08
 Updated     : 
 ================================================================*/
SELECT categorycode,
    COUNT(categorycode)
FROM statistics s
    JOIN borrowers b ON b.borrowernumber = s.borrowernumber
WHERE (
        s.type = 'issue'
        OR s.type = 'renew'
    )
    and itemtype = 'FJARRLAN'
GROUP BY categorycode