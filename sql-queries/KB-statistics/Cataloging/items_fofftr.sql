/*================================================================
 Query Name  : items_fofftr
 Description : Böcker med skriven text: bestånd
 Author      : Mats Alexandersson
 Created     : 2024-07-05
 Updated     : 
 ================================================================*/
SELECT s.itemtype AS Exemplartyp,
    COUNT(s.itemtype) AS 'Antal initiala lån under förra året (interna lånt borträknade)'
FROM statistics AS s
    LEFT JOIN borrowers b ON b.borrowernumber = s.borrowernumber
WHERE type = 'issue'
    AND YEAR(s.datetime) = (YEAR(CURDATE()) - 1)
    AND (
        NOT b.categorycode = 'BIBLIOTEKE'
        OR b.categorycode IS NULL
    )
GROUP BY s.itemtype