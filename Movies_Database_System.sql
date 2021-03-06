DROP DATABASE IF EXISTS cinema_database;
CREATE DATABASE IF NOT EXISTS cinema_database;
USE cinema_database;

DROP TABLE IF EXISTS films;
CREATE TABLE films (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL UNIQUE,
    length_min INT NOT NULL
);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS rooms;
CREATE TABLE rooms (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    no_of_seats INT NOT NULL
);

DROP TABLE IF EXISTS screenings;
CREATE TABLE screenings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    film_id INT NOT NULL,
    room_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    FOREIGN KEY (film_id)
        REFERENCES films (id),
    FOREIGN KEY (room_id)
        REFERENCES rooms (id)
);

DROP TABLE IF EXISTS seats;
CREATE TABLE seats (
    id INT PRIMARY KEY AUTO_INCREMENT,
    seat_row CHAR(1) NOT NULL,
    seat_number INT NOT NULL,
    room_id INT NOT NULL,
    FOREIGN KEY (room_id)
        REFERENCES rooms (id)
);

DROP TABLE IF EXISTS bookings;
CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    screening_id INT NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (screening_id)
        REFERENCES screenings (id),
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
);

DROP TABLE IF EXISTS reserved_seats;
CREATE TABLE reserved_seats (
    id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    seat_id INT NOT NULL,
    FOREIGN KEY (booking_id)
        REFERENCES bookings (id),
    FOREIGN KEY (seat_id)
        REFERENCES seats (id)
);



-- Schema from udemy course SQL for Beginners by Jon Avis 






