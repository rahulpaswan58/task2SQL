CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    dob DATE,
    nationality VARCHAR
);

INSERT INTO actors (name, dob, nationality) VALUES
    ('Shah Rukh Khan', '1965-11-02', 'Indian'),
    ('Priyanka Chopra', '1982-07-18', 'Indian'),
    ('Aamir Khan', '1965-03-14', 'Indian'),
    ('Madhuri Dixit', '1967-05-15', 'Indian'),
    ('Hrithik Roshan', '1974-01-10', 'Indian');

CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR NOT NULL,
    release_year INT,
    director VARCHAR,
    actor_id INT NOT NULL,
    CONSTRAINT fk_movie_actors FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);

INSERT INTO movies (title, release_year, director, actor_id) VALUES
    ('Dilwale Dulhania Le Jayenge', 1995, 'Aditya Chopra', 1),
    ('Bajirao Mastani', 2015, 'Sanjay Leela Bhansali', 2),
    ('Lagaan', 2001, 'Ashutosh Gowariker', 3),
    ('Devdas', 2002, 'Sanjay Leela Bhansali', 4),
    ('Dhoom 2', 2006, 'Sanjay Gadhvi', 5),
    ('Rang De Basanti', 2006, 'Rakeysh Omprakash Mehra', 3);

CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    movie_title VARCHAR NOT NULL,
    character_name VARCHAR,
    actor_ref_id INT NOT NULL,
    CONSTRAINT fk_roles_movies FOREIGN KEY (actor_ref_id) REFERENCES movies(movie_id)
);

INSERT INTO roles (movie_title, character_name, actor_ref_id) VALUES
    ('Dilwale Dulhania Le Jayenge', 'Raj Malhotra', 1),
    ('Bajirao Mastani', 'Kashibai', 2),
    ('Lagaan', 'Bhuvan', 3),
    ('Devdas', 'Chandramukhi', 4),
    ('Dhoom 2', 'Aryan', 5),
    ('Rang De Basanti', 'DJ', 6);

SELECT * FROM actors;
SELECT * FROM movies;
SELECT * FROM roles;
