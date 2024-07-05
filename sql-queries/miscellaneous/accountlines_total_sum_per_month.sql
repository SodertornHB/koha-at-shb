/*================================================================
 Query Name  : accountlines_total_sum_per_month
 Description : Grupperar account_lines per månad och summerar 
 låntagarnas avgifter
 Author      : Stefan Norinder
 Created     : 2024-07-05
 Updated     : 
 ================================================================*/
SELECT DATE_FORMAT(date, '%Y-%m') AS month,
  sum(amount) AS total_amount
FROM accountlines a
WHERE credit_type_code = 'PAYMENT'
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month DESC