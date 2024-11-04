
  CREATE TABLE movieRental (
    movies_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_year INTEGER NOT NULL,
    genre TEXT NOT NULL,
    director TEXT NOT NULL
  ); 

  CREATE TABLE customer (
    customers_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT NOT NULL
  );

  CREATE TABLE rental (
    rentals_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customers_id),
    movie_id INTEGER REFERENCES movies(movies_id),
    rental_date DATE NOT NULL,
    return_date DATE
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
  );

  INSERT INTO movieRental (title, release_year, genre, director_name) VALUES
    ('Gremlins', 1984, 'Horror', 'Joe Dante'),
    ('Nightmare Before Christmas', 2007, 'Fantasy', 'Tim Burton'), -- Disney screwed over Tim Burton, the actual person who created the movie.
    ('Alice in Wonderland', 2010, 'Fantasy', 'Tim Burton'), -- I have a deep love for Tim Burton movies. 
    ('Sweeney Todd', 2007, 'Horror', 'Tim Burton'),
    ('IT', 1990, 'Horror', 'Tommy Lee Wallace');

INSERT INTO customer (first_name, last_name, email, phone) VALUES
    ('Coraline', 'Jones', 'cjones@example.com', '999-999-9999'),
    ('Mad', 'Hatter', 'Mad_Hatter@example.com', '999-999-9999'),
    ('Cheshire', 'Cat', 'all_mad_here@example.com', '999-999-9999'),
    ('Fizz', 'Gig', 'fizzgig@example.com', '999-999-9999'), -- Fizz Gig is a little fluff ball of a dog from The Dark Crystal - 1982
    ('Gizmo', 'Gremlins', 'ilovegizmo@example.com', '999-999-9999');

INSERT INTO rentals (customer_id, movie_id, rental_date, return_date) VALUES
    (3, 1, '2024-01-15', '2024-01-30'),
    (5, 3, '2024-03-29', '2024-04-11'),
    (1, 1, '2024-04-17', '2024-04-28'),
    (1, 4, '2024-06-07', '2024-06-13'),
    (4, 5, '2024-07-12', '2024-08-01'),
    (4, 5, '2024-08-05', '2024-08-19'),
    (5, 2, '2024-09-02', '2024-09-21'),
    (2, 4, '2024-10-03', '2024-10-30'),
    (5, 3, '2024-11-15', '2024-11-23'),
    (1, 2, '2024-11-27', '2024-12-07');

    SELECT m.title, m.release_year, m.genre, m.director_name, r.rental_date, r.return_date
FROM rentals r
JOIN movies m ON r.movie_id = m.movie_id
JOIN customers c ON r.customer_id = c.customer_id
WHERE c.email = 'all_mad_here@example.com';

SELECT c.first_name, c.last_name, c.email, c.phone, r.rental_date, r.return_date
FROM rentals r
JOIN customers c ON r.customer_id = c.customer_id
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.title = 'Gremlins';

SELECT c.first_name, c.last_name, c.email, r.rental_date, r.return_date
FROM rentals r
JOIN customers c ON r.customer_id = c.customer_id
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.title = 'Nightmare Before Christmas'
ORDER BY r.rental_date;

SELECT c.first_name, c.last_name, m.title, r.rental_date
FROM rentals r
JOIN movies m ON r.movie_id = m.movie_id
JOIN customers c ON r.customer_id = c.customer_id
WHERE m.director_name = 'Tim Burton';

SELECT m.title, c.first_name, c.last_name, r.rental_date, r.return_date
FROM rentals r
JOIN movies m ON r.movie_id = m.movie_id
JOIN customers c ON r.customer_id = c.customer_id
WHERE r.return_date > DATE;