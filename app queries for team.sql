-- Get all names

SELECT first_name, last_name FROM Person;

-- All the people in Nashville

SELECT first_name, last_name, city, state FROM Person
JOIN Location ON Person.location_id = Location.location_id
WHERE city = 'Nashville' AND state = 'TN';

-- COUNT & GROUP BY all four cities

SELECT city, COUNT(*) AS count
FROM Person
JOIN Location ON Person.location_id = Location.location_id
GROUP BY city;

-- COUNT & GROUP BY 7 interests

SELECT title, COUNT(*) AS count
FROM Interest
JOIN Person_Interest ON Interest.interest_id = Person_Interest.interest_id
GROUP BY title;

-- First and Last People who Live in NASH and like programming

SELECT p.first_name, p.last_name, l.city, l.state, i.title
FROM Person p
JOIN Location l ON p.location_id = l.location_id
JOIN Person_Interest pi ON p.person_id = pi.person_id
JOIN Interest i ON pi.interest_id = i.interest_id
WHERE l.city = 'Nashville' AND l.state = 'TN' AND i.title = 'Programming';


-- bonus GROUP BY cases age ranges

SELECT
    CASE
        WHEN age BETWEEN 20 AND 30 THEN '20-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Other'
    END AS age_range,
    COUNT(*) AS count
FROM Person
GROUP BY age_range;