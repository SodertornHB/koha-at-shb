/*================================================================
 Query Name  : message_queue_last_messages
 Description : Meddelanden de tio senaste minuterna
 Author      : Stefan Norinder
 Created     : 2024-07-08
 Updated     : 
 ================================================================*/
SELECT message_id AS 'message_id',
       b.borrowernumber AS 'borrowernumber',
       'e-mail' AS 'message_type',
       subject AS 'subject',
       content AS 'message',
       time_queued AS 'message_date',
       email AS 'email',
       emailpro AS 'emailpro',
       userid AS 'userId',
       'koha:email_messages' AS 'source'
       /* CONCAT('<a href="https://koha-intra.sh.se/cgi-bin/koha/members/moremember.pl?borrowernumber=', TRIM(b.borrowernumber), '">', if(b.firstname IS NULL, 'no name', b.firstname), ' ', b.surname, '</a>') AS borrower */
FROM message_queue m
       LEFT JOIN borrowers b ON m.borrowernumber = b.borrowernumber
WHERE message_transport_type = 'email'
       and time_queued > NOW() - INTERVAL 10 MINUTE
ORDER BY time_queued DESC
LIMIT 3000