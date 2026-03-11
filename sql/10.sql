/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */


SELECT special_feature, sum(profit) as profit
FROM (
    SELECT f.title, sum(p.amount) as profit, sp.special_feature
    FROM film f
    JOIN inventory i on f.film_id = i.film_id
    JOIN rental r on i.inventory_id = r.inventory_id
    JOIN payment p on r.rental_id = p.rental_id
    CROSS JOIN UNNEST(special_features) AS sp(special_feature)
    GROUP BY f.title, sp.special_feature
    ORDER BY profit DESC
) as foo
GROUP BY special_feature
ORDER BY special_feature;
