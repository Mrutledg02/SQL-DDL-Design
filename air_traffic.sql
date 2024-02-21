-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INT NOT NULL REFERENCES countries (id)
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT NOT NULL REFERENCES airlines (id),
  from_city_id INT NOT NULL REFERENCES cities (id),
  to_city_id INT NOT NULL REFERENCES cities (id)
);

INSERT INTO passengers (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');

INSERT INTO airlines (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO countries (name)
VALUES
  ('United States'),
  ('Japan'),
  ('France'),
  ('UAE'),
  ('Brazil'),
  ('United Kingdom'),
  ('Morocco'),
  ('China'),
  ('Mexico'),
  ('Chile');


INSERT INTO cities (name, country_id)
VALUES
  ('Washington DC', 1),
  ('Tokyo', 2),
  ('Los Angeles', 1),
  ('Seattle', 1),
  ('Paris', 3),
  ('Dubai', 4),
  ('New York', 1),
  ('Cedar Rapids', 1),
  ('Charlotte', 1),
  ('Sao Paolo', 5),
  ('Seattle', 1),
  ('London', 6),
  ('Las Vegas', 1),
  ('Mexico City', 7),
  ('Casablanca', 8),
  ('Beijing', 9),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Santiago', 10);

INSERT INTO flights (departure, arrival, airline_id, from_city_id, to_city_id)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 11),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 12),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 13),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 14),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 15),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 16),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 8),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 17),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 9, 18),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 10, 19);