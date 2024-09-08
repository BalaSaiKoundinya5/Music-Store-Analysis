SELECT *  FROM employee ORDER BY levels DESC LIMIT 1;

SELECT * FROM employee;

SELECT * FROM invoice;
SELECT * FROM customer;

SELECT COUNT(invoice_id) AS Total_number_of_invoices,billing_country FROM invoice GROUP BY billing_country ORDER BY Total_number_of_invoices DESC;

SELECT total FROM invoice ORDER BY total DESC LIMIT 3;

SELECT SUM(total) AS invoice_total,billing_city FROM invoice GROUP BY billing_city ORDER BY invoice_total DESC LIMIT 1;

SELECT customer.customer_id,customer.first_name,customer.last_name, SUM(invoice.total) AS total
FROM customer 
JOIN invoice ON customer.customer_id = invoice.customer_id 
GROUP BY customer.customer_id 
ORDER BY total DESC
LIMIT 1;

SELECT DISTINCT email,first_name,last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id 
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN (
	SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;


SELECT artist.artist_id,artist.name,COUNT(artist.artist_id) AS Number_of_songs 
FROM track
JOIN album ON track.album_id = album.album_id
JOIN artist ON album.artist_id = artist.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;


SELECT name, milliseconds 
FROM track 
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_length
	FROM track)
ORDER BY milliseconds DESC;







