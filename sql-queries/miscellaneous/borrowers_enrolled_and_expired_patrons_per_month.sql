/*================================================================
 Query Name  : borrowers_enrolled_and_expired_patrons_per_month
 Description : Antal registrerade och utgångna låntagare per månad. 
 Denna finns även som en rapport i Koha
 Author      : Stefan Norinder
 Created     : 2024-07-08
 Updated     : 
 ================================================================*/
SELECT month,
  MAX(enrolled) AS enrolled,
  MAX(expiry) AS expiry
FROM (
    SELECT COALESCE(expiry.expiry_date, enrolled.date_enrolled) AS month,
      enrolled.date_enrolled_count AS enrolled,
      expiry.expiry_date_borrower_count AS expiry -- COALESCE(CONCAT('<a href="https://koha-intra.sh.se/cgi-bin/koha/reports/guided_reports.pl?reports=346&phase=Run+this+report&param_name=year&sql_params=', YEAR(enrolled.dateenrolled),'&param_name=month&sql_params=', MONTH(enrolled.dateenrolled),'">', enrolled.date_enrolled_count, '</a>'), 0) AS enrolled,
      -- COALESCE(CONCAT('<a href="https://koha-intra.sh.se/cgi-bin/koha/reports/guided_reports.pl?reports=344&phase=Run+this+report&param_name=year&sql_params=', YEAR(expiry.dateexpiry),'&param_name=month&sql_params=', MONTH(expiry.dateexpiry),'">', expiry.expiry_date_borrower_count, '</a>'), 0) AS expiry
    FROM (
        SELECT DATE_FORMAT(dateexpiry, '%Y-%m') AS expiry_date,
          DATE(dateexpiry) AS dateexpiry,
          COUNT(*) AS expiry_date_borrower_count
        FROM borrowers
        GROUP BY expiry_date
      ) AS expiry
      LEFT JOIN (
        SELECT DATE_FORMAT(dateenrolled, '%Y-%m') AS date_enrolled,
          DATE(dateenrolled) AS dateenrolled,
          COUNT(*) AS date_enrolled_count
        FROM borrowers
        GROUP BY date_enrolled
      ) AS enrolled ON expiry.expiry_date = enrolled.date_enrolled
    UNION ALL
    SELECT COALESCE(enrolled.date_enrolled, expiry.expiry_date) AS month,
      enrolled.date_enrolled_count AS enrolled,
      expiry.expiry_date_borrower_count AS expiry -- COALESCE(CONCAT('<a href="https://koha-intra.sh.se/cgi-bin/koha/reports/guided_reports.pl?reports=346&phase=Run+this+report&param_name=year&sql_params=', YEAR(enrolled.dateenrolled),'&param_name=month&sql_params=', MONTH(enrolled.dateenrolled),'">', enrolled.date_enrolled_count, '</a>'), 0) AS enrolled,
      -- COALESCE(CONCAT('<a href="https://koha-intra.sh.se/cgi-bin/koha/reports/guided_reports.pl?reports=344&phase=Run+this+report&param_name=year&sql_params=', YEAR(expiry.dateexpiry),'&param_name=month&sql_params=', MONTH(expiry.dateexpiry),'">', expiry.expiry_date_borrower_count, '</a>'), 0) AS expiry
    FROM (
        SELECT DATE_FORMAT(dateexpiry, '%Y-%m') AS expiry_date,
          DATE(dateexpiry) AS dateexpiry,
          COUNT(*) AS expiry_date_borrower_count
        FROM borrowers
        GROUP BY expiry_date
      ) AS expiry
      RIGHT JOIN (
        SELECT DATE_FORMAT(dateenrolled, '%Y-%m') AS date_enrolled,
          DATE(dateenrolled) AS dateenrolled,
          COUNT(*) AS date_enrolled_count
        FROM borrowers
        GROUP BY date_enrolled
      ) AS enrolled ON expiry.expiry_date = enrolled.date_enrolled
  ) AS combined
GROUP BY month
ORDER BY month;