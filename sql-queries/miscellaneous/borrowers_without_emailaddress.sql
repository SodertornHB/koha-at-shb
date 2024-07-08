/*================================================================
 Query Name  : borrowers_without_emailaddress
 Description : Låntagar med lån som saknar e-postadress
 Author      : Stefan Norinder
 Created     : 2024-07-08
 Updated     : 
 ================================================================*/
SELECT -- CONCAT('<a href="https://koha-intra.sh.se/cgi-bin/koha/members/moremember.pl?borrowernumber=', TRIM(b.borrowernumber), '">', if(b.firstname IS NULL, 'no name', b.firstname), ' ', b.surname, '</a>') AS borrower,
    b.cardnumber,
    b.email
FROM borrowers b
    JOIN (
        SELECT borrowernumber
        FROM old_issues
        UNION
        SELECT borrowernumber
        FROM issues
    ) AS temp ON b.borrowernumber = temp.borrowernumber
WHERE b.email NOT REGEXP '^[A-Za-z0-9._%+-]*@[A-Za-z0-9.-]*\.[A-Za-z]*$';