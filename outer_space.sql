DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- Create the stars table
CREATE TABLE stars (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Insert data into the stars table
INSERT INTO stars (name)
VALUES 
    ('The Sun'),
    ('Proxima Centauri'),
    ('Gliese 876');

-- Create the planets table with improvements
CREATE TABLE planets (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbital_period_in_days NUMERIC NOT NULL,
    star_id INT REFERENCES stars(id)
);

-- Create a separate moons table
CREATE TABLE moons (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    planet_id INT NOT NULL REFERENCES planets(id)
);

-- Insert data into the planets table
INSERT INTO planets (name, orbital_period_in_days, star_id)
VALUES 
    ('Earth', 365.25, 1),
    ('Mars', 686.97, 1),
    ('Venus', 224.70, 1),
    ('Neptune', 60190, 1),
    ('Proxima Centauri b', 0.03, 2),
    ('Gliese 876 b', 0.23, 3);

-- Insert data into the moons table
INSERT INTO moons (name, planet_id)
VALUES
    ('The Moon', 1),
    ('Phobos', 2),
    ('Deimos', 2);
