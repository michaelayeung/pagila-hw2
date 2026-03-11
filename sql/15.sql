/*
 * Compute the total revenue for each film.
 */

SELECT title, COALESCE(SUM(payment.amount), 0.00) as revenue
FROM film
LEFT JOIN inventory USING (film_id)
LEFT JOIN rental USING (inventory_id)
LEFT JOIN payment USING (rental_id)
GROUP BY film_id
ORDER BY revenue DESC, title;
