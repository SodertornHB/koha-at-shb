/*================================================================
 Query Name  : issues_per_itemtypes_and_patron_category
 Description : Antal lån per låntagarkategori och exemplaryp 
 föregående år
 Author      : Stefan Norinder
 Created     : 2024-07-08
 Updated     : 
 ================================================================*/
SELECT issue.itemtype,
    COALESCE(EXT.count, 0) AS 'EXT',
    COALESCE(SHSTUD.count, 0) AS 'SHSTUD',
    COALESCE(SHPERS.count, 0) AS 'SHPERS'
FROM itemtypes issue
    LEFT JOIN (
        SELECT itemtype,
            COUNT(*) as count,
            'EXT' as categorycode
        FROM statistics s
            LEFT JOIN borrowers b ON b.borrowernumber = s.borrowernumber
        WHERE datetime BETWEEN CONCAT(YEAR(CURDATE()) - 1, '-01-01 00:00:00') AND CONCAT(YEAR(CURDATE()) - 1, '-12-31 23:00:00')
            AND TYPE = 'issue'
            AND b.categorycode = 'EXT'
        GROUP BY itemtype
    ) AS EXT ON EXT.itemtype = issue.itemtype
    LEFT JOIN (
        SELECT itemtype,
            COUNT(*) as count,
            'SHSTUD' as categorycode
        FROM statistics s
            LEFT JOIN borrowers b ON b.borrowernumber = s.borrowernumber
        WHERE datetime BETWEEN CONCAT(YEAR(CURDATE()) - 1, '-01-01 00:00:00') AND CONCAT(YEAR(CURDATE()) - 1, '-12-31 23:00:00')
            AND TYPE = 'issue'
            AND b.categorycode = 'SHSTUD'
        GROUP BY itemtype
    ) AS SHSTUD ON SHSTUD.itemtype = issue.itemtype
    LEFT JOIN (
        SELECT itemtype,
            COUNT(*) as count,
            'SHPERS' as categorycode
        FROM statistics s
            LEFT JOIN borrowers b ON b.borrowernumber = s.borrowernumber
        WHERE datetime BETWEEN CONCAT(YEAR(CURDATE()) - 1, '-01-01 00:00:00') AND CONCAT(YEAR(CURDATE()) - 1, '-12-31 23:00:00')
            AND TYPE = 'issue'
            AND b.categorycode = 'SHPERS'
        GROUP BY itemtype
    ) AS SHPERS ON SHPERS.itemtype = issue.itemtype