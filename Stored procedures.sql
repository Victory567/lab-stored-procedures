
#2



CREATE PROCEDURE get_action_movie_customers()
BEGIN
  SELECT first_name, last_name, email 
  FROM customer 
  JOIN rental ON customer.customer_id = rental.customer_id 
  JOIN inventory ON rental.inventory_id = inventory.inventory_id 
  JOIN film ON film.film_id = inventory.film_id 
  JOIN film_category ON film_category.film_id = film.film_id 
  JOIN category ON category.category_id = film_category.category_id 
  WHERE category.name = "Action" 
  GROUP BY first_name, last_name, email;
END;

#3
#This stored procedure takes an integer argument min_num_movies 
#and returns only those categories that have a number of movies released greater than the value of min_num_movies.

CREATE PROCEDURE filter_movie_categories(IN min_num_movies INT)
BEGIN
  SELECT category.name, COUNT(*) AS num_movies 
  FROM film_category 
  JOIN category ON film_category.category_id = category.category_id 
  GROUP BY category.name 
  HAVING num_movies > min_num_movies;
END