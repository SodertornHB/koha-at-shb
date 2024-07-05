/*================================================================
 Query Name  : statistics_initial_loans
 Description : Initial lån föregående år
 Author      : Stefan Norinder
 Created     : 2024-07-05
 Updated     : 
 ================================================================*/
SELECT COUNT(*) as initiala_lan
FROM statistics AS s,
    itemtypes as i
WHERE s.itemtype = i.itemtype
    AND s.type = 'issue'
    AND YEAR(s.datetime) = (YEAR(CURDATE()) - 1)