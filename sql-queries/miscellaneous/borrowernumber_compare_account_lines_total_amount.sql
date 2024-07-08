/*================================================================
 Query Name  : borrowernumber_compare_account_lines_total_amount
 Description : Jämför columenen total_amount_outstanding med värdet om 
 man summerar amountoutstanding och skriver ut rader 
 som diffar
 Author      : Stefan Norinder
 Created     : 2024-07-08
 Updated     : 
 ================================================================*/
SELECT b.cardnumber,
    -- CONCAT('<a href="https://koha-intra.sh.se/cgi-bin/koha/members/moremember.pl?borrowernumber=', TRIM(b.borrowernumber), '">', IF(b.cardnumber IS NULL, 'No cardnumber', b.cardnumber), '</a>') AS link,
    COALESCE(a.total_amount_outstanding, 0) AS total_amount_outstanding,
    al.amountoutstanding
FROM borrowers b
    JOIN accountlines al ON b.borrowernumber = al.borrowernumber
    LEFT JOIN (
        SELECT borrowernumber,
            SUM(amountoutstanding) AS total_amount_outstanding
        FROM accountlines
        GROUP BY borrowernumber
    ) a ON a.borrowernumber = b.borrowernumber
    LEFT JOIN messages m ON m.borrowernumber = b.borrowernumber
WHERE COALESCE(a.total_amount_outstanding, 0) <> al.amountoutstanding
ORDER BY b.categorycode,
    b.dateexpiry DESC;