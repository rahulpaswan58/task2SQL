CREATE TABLE airlines (
    airline_id SERIAL PRIMARY KEY,
    airline_name VARCHAR NOT NULL,
    country VARCHAR NOT NULL
);

INSERT INTO airlines (airline_id, airline_name, country) VALUES
    (1, 'SpiceJet', 'India'),
    (2, 'IndiGo', 'India'),
    (3, 'Air India', 'India'),
    (4, 'Vistara', 'India');

CREATE TABLE passengers (
    passenger_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    airline_id INT NOT NULL,
    CONSTRAINT fk_passengers_airlines FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
);

INSERT INTO passengers (passenger_id, name, email, airline_id) VALUES
    (1, 'Aarav Sharma', 'aarav.sharma@example.com', 1),
    (2, 'Priya Patel', 'priya.patel@example.com', 2),
    (3, 'Rohan Singh', 'rohan.singh@example.com', 3),
    (4, 'Diya Kumar', 'diya.kumar@example.com', 4);

CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    passenger_id INT NOT NULL,
    flight_number VARCHAR NOT NULL,
    departure_date DATE NOT NULL,
    arrival_date DATE NOT NULL,
    CONSTRAINT fk_bookings_passengers FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
);

INSERT INTO bookings (booking_id, passenger_id, flight_number, departure_date, arrival_date) VALUES
    (1, 1, 'SG123', '2025-04-01', '2025-04-01'),
    (2, 2, '6E456', '2025-04-03', '2025-04-03'),
    (3, 3, 'AI789', '2025-04-05', '2025-04-05'),
    (4, 4, 'UK234', '2025-04-07', '2025-04-07');

SELECT * FROM airlines;
SELECT * FROM passengers;
SELECT * FROM bookings;
