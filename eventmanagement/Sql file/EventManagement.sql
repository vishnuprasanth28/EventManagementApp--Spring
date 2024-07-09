create table Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    email VARCHAR(100) unique not NULL,
    mobile varchar(10),
    is_admin boolean
);
CREATE TABLE Venue (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    venue_name VARCHAR(100) NOT NULL,
    venue_address VARCHAR(255) NOT NULL,
    capacity int,
    contact_phone VARCHAR(20),
    price int,
    venue_image longblob
    
);
create table vendor(vendor_id int auto_increment primary key,
vendor_name varchar(20), vendor_contact varchar(10), 
vendor_type varchar(20), price int ,profile longblob);
CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    event_name VARCHAR(100) NOT NULL,
    event_date date,
    venue_id int,
    photography_id int,
    catering_id int,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (venue_id) REFERENCES Venue(venue_id),
      FOREIGN KEY (photography_id) REFERENCES vendor(vendor_id),
        FOREIGN KEY (catering_id) REFERENCES vendor(vendor_id)
    
);

CREATE TABLE shows (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    location VARCHAR(100),
    date DATE,
    start_time TIME,
    end_time Time,
    tickets_count INT DEFAULT 0,
    ticket_price int,
    poster_image longblob
);

CREATE TABLE ticket_bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    show_id INT,
    tickets_count INT,
    amount int,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (show_id) REFERENCES shows(id)
);