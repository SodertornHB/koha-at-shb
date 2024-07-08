/*================================================================
 Query Name  : borrowernumber_inactive_patrons
 Description :  Låntagare 
 - vars kort gått ut 
 - som aldrig loggat in i koha 
 - som aldrig har lånat någon bok de senaste tre åren (så länge har vi statistik)
 - inte är lt-kategri bibliotek eller automat 
 Author      : Stefan Norinder
 Created     : 2024-07-08
 Updated     : 
 ================================================================*/
SELECT b.cardnumber,
	-- CONCAT('<a href="https://koha-intra.sh.se/cgi-bin/koha/members/moremember.pl?borrowernumber=', TRIM(b.borrowernumber), '">', IF( cardnumber IS NULL, 'No cardnumber',cardnumber), '</a>') AS link,
	dateexpiry,
	CONCAT(b.firstname, ' ', b.surname) as Name,
	sort1 as Ssn,
	categorycode,
	b.borrowernotes
FROM borrowers b
	LEFT JOIN statistics s ON b.borrowernumber = s.borrowernumber
	AND s.type = 'issue'
	LEFT JOIN accountlines a ON a.borrowernumber = b.borrowernumber
	LEFT JOIN messages m ON m.borrowernumber = b.borrowernumber
WHERE lastseen IS NULL
	AND s.borrowernumber IS NULL
	AND DATE_ADD(dateexpiry, INTERVAL 3 MONTH) < NOW()
	AND categorycode NOT IN ('SVEBIBL', 'UTLBIBL', 'AUT', 'REG')
	AND not b.borrowernumber IN (
		SELECT borrowernumber
		FROM borrower_debarments
	)
	AND (
		a.amountoutstanding IS NULL
		OR a.amountoutstanding = 0.000000
	)
	AND (
		m.message IS NULL
		OR m.message = ''
	)
ORDER BY b.borrowernotes DESC