/*================================================================
 Query Name  : borrowers_with_invalid_emailaddresses
 Description : Låntagar med felaktig e-postadress
 Author      : Stefan Norinder
 Created     : 2024-07-08
 Updated     : 
 ================================================================*/
SELECT -- CONCAT('<a href="https://koha-intra.sh.se/cgi-bin/koha/members/moremember.pl?borrowernumber=', TRIM(b.borrowernumber), '">', if(b.firstname IS NULL, 'no name', b.firstname), ' ', b.surname, '</a>') AS borrower,
    b.cardnumber,
    b.email
FROM borrowers b
WHERE email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'
ORDER BY email DESC