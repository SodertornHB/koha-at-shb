/*================================================================
 Query Name  : items_number_of_items
 Description : Number of new items from last year
 Author      : Stefan Norinder
 Created     : 2024-07-05
 Updated     : 
 ================================================================*/
SELECT COUNT(*) AS 'Antal nya exemplar under förra året'
FROM items i
    JOIN biblio b ON b.biblionumber = i.biblionumber
WHERE (
        i.itype LIKE 'BOK7D'
        OR i.itype LIKE 'BOK3V'
        OR i.itype LIKE 'BOKDAG'
        OR i.itype LIKE 'BOKEJHEM'
        OR i.itype LIKE 'BOKREF'
    )
    AND YEAR(dateaccessioned) = (YEAR(CURDATE()) - 1)