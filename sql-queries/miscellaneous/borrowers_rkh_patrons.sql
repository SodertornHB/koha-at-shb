/*================================================================
 Query Name  : borrowers_rkh_patrons
 Description : Låntagar som är RKH studenter
 Author      : Stefan Norinder
 Created     : 2024-08-28
 Updated     : 
 ================================================================*/
SELECT b.surname,
    b.firstname,
    a.attribute
FROM borrowers b
    JOIN borrower_attributes a on b.borrowernumber = a.borrowernumber
WHERE b.categorycode like '%rkh%'
    and dateexpiry > now()
    and a.code = 'PNR'
order by b.surname,
    b.firstname;