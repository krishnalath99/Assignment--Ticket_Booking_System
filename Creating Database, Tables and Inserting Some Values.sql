create database ticketbookingsystem;

use ticketbookingsystem;

CREATE TABLE Venue (
    venue_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_name VARCHAR(100),
    address VARCHAR(150)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    email VARCHAR(60),
    phone_number CHAR(15)
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
    event_id INT,
    num_tickets INT,
    total_cost DECIMAL(10, 2),
    booking_date DATE
);

CREATE TABLE Event (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(100),
    event_date DATE,
    event_time TIME,
    venue_id INT,
    FOREIGN KEY (venue_id) REFERENCES Venue(venue_id) ON DELETE CASCADE,
    total_seats INT,
    available_seats INT,
    ticket_price DECIMAL(10, 2),
    event_type ENUM('Movie', 'Sports', 'Concert')
);


INSERT INTO Venue (venue_id, venue_name, address) VALUES
	(1, 'CinePlex Movie Theater', '123 Movie Street, Mumbai'),
	(2, 'Sports Arena Stadium', '456 Sports Avenue, Delhi'),
	(3, 'Concert Hall Central', '789 Music Road, Kolkata'),
	(4, 'City Movie Multiplex', '101 Cinema Lane, Jaipur'),
	(5, 'Stadium Greens', '555 Sports Park, Pune'),
	(6, 'Melody Concert Hall', '777 Symphony Plaza, Bangalore'),
	(7, 'Movie Magic Theater', '888 Film Boulevard, Kochi'),
	(8, 'Sports World Arena', '333 Athletics Street, Chennai'),
	(9, 'Concert Gardens', '999 Harmony Road, Hyderabad'),
	(10, 'Film Fiesta Theater', '222 Entertainment Street, Ahmedabad');
    
INSERT INTO Event (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type) VALUES
	(001, 'Bollywood Movie Night', '2023-09-15', '18:00:00', 10, 500, 350, 799, 'Movie'),
	(002, 'Cricket Cup Tournament', '2023-10-20', '14:30:00', 2, 70000, 10000, 2499, 'Sports'),
	(003, 'Concert Under the Stars', '2023-11-25', '20:00:00', 6, 1000, 800, 999, 'Concert'),
	(004, 'Rajasthan Folk Dance Show', '2023-12-18', '19:00:00', 3, 300, 0, 599, 'Concert'),
	(005, 'Movie Marathon Weekend', '2023-09-22', '12:00:00', 1, 400, 150, 1199, 'Movie'),
	(006, 'Kerala Boat Race Championship', '2023-10-28', '15:30:00', 8, 1500, 1200, 899, 'Sports'),
	(007, 'Classical Music Concert', '2023-10-26', '19:00:00', 6, 600, 500, 1199, 'Concert'),
	(008, 'South Indian Film Awards', '2023-12-21', '17:30:00', 7, 5000, 2000, 1799, 'Movie'),
	(009, 'Football Friendly Match', '2023-10-23', '16:00:00', 5, 4000, 2000, 999, 'Sports'),
	(010, 'Jazz and Blues Festival', '2023-11-29', '20:30:00', 3, 3500, 2000, 1599, 'Concert'),
	(011, 'Yo Yo Rap Night', '2023-12-17', '21:30:00', 9, 47000, 25000, 7599, 'Concert');

INSERT INTO Customer (customer_id, customer_name, email, phone_number) VALUES
	(111, 'Aarav Patel', 'aarav.patel@email.com', '+91 98765 43210'),
	(112, 'Aanya Gupta', 'aanya.gupta@email.com', '+91 87654 32109'),
	(113, 'Advait Sharma', 'advait.sharma@email.com', '+91 78901 23000'),
	(114, 'Anaya Verma', 'anaya.verma@email.com', '+91 89012 34567'),
	(115, 'Aryan Singh', 'aryan.singh@email.com', '+91 90123 45678'),
	(116, 'Ishita Kapoor', 'ishita.kapoor@email.com', '+91 98765 43210'),
	(117, 'Rudra Mishra', 'rudra.mishra@email.com', '+91 87654 32109'),
	(118, 'Zara Reddy', 'zara.reddy@email.com', '+91 78901 23456'),
	(119, 'Vivaan Kumar', 'vivaan.kumar@email.com', '+91 89012 34567'),
	(120, 'Amara Desai', 'amara.desai@email.com', '+91 90123 45000'),
	(121, 'Vihaan Malhotra', 'vihaan.malhotra@email.com', '+91 98765 43210'),
	(122, 'Myra Joshi', 'myra.joshi@email.com', '+91 87654 32109'),
	(123, 'Reyansh Sharma', 'reyansh.sharma@email.com', '+91 78901 23456'),
	(124, 'Ira Khan', 'ira.khan@email.com', '+91 89012 34567'),
	(125, 'Kabir Bhat', 'kabir.bhat@email.com', '+91 90123 45678'),
	(126, 'Aisha Dubey', 'aisha.dubey@email.com', '+91 98765 43210'),
	(127, 'Advika Nair', 'advika.nair@email.com', '+91 87654 32109'),
	(128, 'Aarush Khanna', 'aarush.khanna@email.com', '+91 78901 23456'),
	(129, 'Ria Mehra', 'ria.mehra@email.com', '+91 89012 34567'),
	(130, 'Arjun Kapoor', 'arjun.kapoor@email.com', '+91 90123 45678');
    
ALTER TABLE Booking ADD FOREIGN KEY (event_id) REFERENCES Event(event_id) ON DELETE CASCADE;
    
INSERT INTO Booking (booking_id, customer_id, event_id, num_tickets, total_cost, booking_date) VALUES
	(101, 119, 002, 5, 12495, '2023-10-10'),
    (102, 127, 010, 2, 3198, '2023-11-27'),
    (103, 114, 003, 4, 3996, '2023-11-23'),
    (104, 125, 011, 5, 37995, '2023-12-10'),
    (105, 118, 002, 2, 4998, '2023-10-13'),
    (106, 128, 008, 2, 3598, '2023-12-20'),
    (107, 112, 007, 2, 2398, '2023-10-22'),
    (108, 120, 009, 5, 4995, '2023-10-21'),
    (109, 117, 002, 7, 17493, '2023-10-18'),
    (110, 123, 008, 4, 7196, '2023-12-18'),
    (111, 126, 007, 1, 1199, '2023-10-23'),
    (112, 111, 007, 2, 2398, '2023-10-24'),
    (113, 122, 011, 3, 22797, '2023-12-15'),
    (114, 115, 001, 2, 1598, '2023-09-14'),
    (115, 130, 003, 2, 1998, '2023-11-24'),
    (116, 124, 001, 4, 3196, '2023-09-13'),
	(117, 129, 009, 3, 2997, '2023-10-20'),
    (118, 120, 005, 3, 3597, '2023-09-21'),	
	(119, 113, 001, 2, 1598, '2023-09-13'),
	(120, 116, 011, 6, 45594, '2023-12-13');