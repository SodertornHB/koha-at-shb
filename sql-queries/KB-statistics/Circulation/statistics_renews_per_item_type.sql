/*================================================================
 Query Name  : statistics_renews_per_item_type
 Description : Omlån per låntagarkategori från föregående år
 Author      : Stefan Norinder
 Created     : 2024-07-05
 Updated     : 
 ================================================================*/
SELECT s.itemtype AS Exemplartyp,
    COUNT(s.itemtype) AS 'Antal omlån förra året (interna lånt borträknade)'
FROM statistics AS s
    LEFT JOIN borrowers b ON b.borrowernumber = s.borrowernumber
WHERE type = 'renew'
    AND YEAR(s.datetime) = (YEAR(CURDATE()) - 1)
    AND (
        NOT b.categorycode = 'BIBLIOTEKE'
        OR b.categorycode IS NULL
    )
GROUP BY s.itemtype