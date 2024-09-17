SELECT * FROM Location;

SELECT * FROM Person;

SELECT first_name, last_name FROM Person;

-- 1st

CREATE DATABASE changes165;
USE changes165;

CREATE TABLE Location (
    location_id SERIAL PRIMARY KEY,
    city VARCHAR(50),
    state VARCHAR(2),
    country VARCHAR(50)
);

CREATE TABLE Person (
    person_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE Interest (
    interest_id SERIAL PRIMARY KEY,
    title VARCHAR(50)
);

CREATE TABLE Person_Interest (
    person_id INT,
    interest_id INT,
    PRIMARY KEY (person_id, interest_id),
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    FOREIGN KEY (interest_id) REFERENCES Interest(interest_id)
);

-- 2nd

INSERT INTO Location (city, state, country) VALUES
    ('Nashville', 'TN', 'United States'),
    ('Memphis', 'TN', 'United States'),
    ('Phoenix', 'AZ', 'United States'),
    ('Denver', 'CO', 'United States');


-- 3rd

INSERT INTO Person (first_name, last_name, age, location_id) VALUES
    ('Chickie', 'Ourtic', 21, 1),
    ('Hilton', 'O''Hanley', 37, 1),
    ('Barbe', 'Purver', 50, 3),
    ('Reeta', 'Sammons', 34, 2),
    ('Abbott', 'Fisbburne', 49, 1),
    ('Winnie', 'Whines', 19, 4),
    ('Samantha', 'Leese', 35, 2),
    ('Edouard', 'Lorimer', 29, 1),
    ('Mattheus', 'Shaplin', 27, 3),
    ('Donnell', 'Corney', 25, 3),
    ('Wallis', 'Kauschke', 28, 3),
    ('Melva', 'Lanham', 20, 2),
    ('Amelina', 'McNirlan', 22, 4),
    ('Courtney', 'Holley', 22, 1),
    ('Sigismond', 'Vala', 21, 4),
    ('Jacquelynn', 'Halfacre', 24, 2),
    ('Alanna', 'Spino', 25, 3);

-- 4th

INSERT INTO Interest (title) VALUES
    ('Programming'),
    ('Gaming'),
    ('Computers'),
    ('Music'),
    ('Movies'),
    ('Cooking'),
    ('Sports');

-- 5th

INSERT INTO Person_Interest (person_id, interest_id) VALUES
    (1, 1), (1, 2), (1, 6),
    (2, 1), (2, 7), (2, 4),
    (3, 1), (3, 3), (3, 4),
    (4, 1), (4, 2), (4, 7),
    (5, 6), (5, 3), (5, 4),
    (6, 2), (6, 7),
    (7, 1), (7, 3),
    (8, 2), (8, 4),
    (9, 5), (9, 6),
    (10, 7), (10, 5),
    (11, 1), (11, 2), (11, 5),
    (12, 1), (12, 4), (12, 5),
    (13, 2), (13, 3), (13, 7),
    (14, 2), (14, 4), (14, 6),
    (15, 1), (15, 5), (15, 7),
    (16, 2), (16, 3), (16, 4),
    (17, 1), (17, 3), (17, 5), (17, 7),
    (18, 2), (18, 4), (18, 6),
    (19, 1), (19, 2), (19, 3), (19, 4), (19, 5), (19, 6), (19, 7);


-- 6th

UPDATE Person
SET age = age + 1
WHERE (first_name, last_name) IN (
    ('Chickie', 'Ourtic'),
    ('Winnie', 'Whines'),
    ('Edouard', 'Lorimer'),
    ('Courtney', 'Holley'),
    ('Melva', 'Lanham'),
    ('Isa', 'Slight'),
    ('Abbott', 'Fisbburne'),
    ('Reeta', 'Sammons')
);
	

-- 7th

-- Delete associated interests
DELETE FROM Person_Interest
WHERE person_id IN (
    SELECT person_id FROM Person
    WHERE (first_name, last_name) IN (
        ('Hilton', 'O''Hanley'),
        ('Alanna', 'Spino')
    )
);

-- Delete users
DELETE FROM Person
WHERE (first_name, last_name) IN (
    ('Hilton', 'O''Hanley'),
    ('Alanna', 'Spino')
);