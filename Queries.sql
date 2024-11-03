
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

  INSERT INTO Movies (title, release_year, genre, director_name) VALUES
    ('Gremlins', 1984, 'Horror', 'Joe Dante'),
    ('Nightmare Before Christmas', 2007, 'Horror', 'Tim Burton'), -- Disney screwed over Tim Burton, the actual person who created the movie.
    ('Alice in Wonderland', 2010, 'Fantasy', 'Tim Burton'), -- I have a deep love for Tim Burton movies. 
    ('Sweeney Todd', 2007, 'Horror', 'Tim Burton'),
    ('IT', 1990, 'Horror', 'Tommy Lee Wallace');

INSERT INTO Customers (first_name, last_name, email, phone) VALUES
    ('Coraline', 'Jones', 'cjones@example.com', '999-999-9999'),
    ('Mad', 'Hatter', 'Mad_Hatter@example.com', '999-999-9999'),
    ('Cheshire', 'Cat', 'all_mad_here@example.com', '999-999-9999'),
    ('Fizz', 'Gig', 'fizzgig@example.com', '999-999-9999'), -- Fizz Gig is a little fluff ball of a dog from The Dark Crystal - 1982
    ('Gizmo', 'Gremlins', 'ilovegizmo@example.com', '999-999-9999');
