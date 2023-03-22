CREATE TABLE Hotel_Chain (
	chain_name VARCHAR(20) NOT NULL,
	street_number Numeric(4,0),
	street_name VARCHAR,
	city VARCHAR,
	province VARCHAR(3),
	postal VARCHAR(6),
	Phone_numbers VARCHAR,
	email_addresses VARCHAR,
	primary key (chain_name)
);

CREATE TABLE Hotel (
	chain_name VARCHAR(20) NOT NUll,
	hotel_id INT NOT NULL,
	rating NUMERIC(2,1),
	street_number NUMERIC(4,0),
	street_name VARCHAR,
	city VARCHAR,
	province VARCHAR(3),
	postal VARCHAR(6),
	Phone_numbers VARCHAR,
	email_addresses VARCHAR,
	primary key (hotel_id,chain_name),
	FOREIGN KEY (chain_name) REFERENCES Hotel_Chain (chain_name),
	CONSTRAINT rating_constraint CHECK (rating >= 0.0 AND rating <= 5.0)
);

CREATE TABLE Room (
	chain_name VARCHAR(20) NOT NUll,
	hotel_id INT NOT NULL,
	room_id INT NOT NULL,
	price NUMERIC(7,2),
	capacity INT,
	view_type boolean,
	available boolean,
	primary key (room_id,chain_name,hotel_id),
	FOREIGN KEY (hotel_id,chain_name) REFERENCES Hotel (hotel_id,chain_name),
	CONSTRAINT capacity_constraint CHECK (capacity > 0)
);

CREATE TABLE Amenity (
	chain_name VARCHAR(20) NOT NUll,
	hotel_id INT NOT NULL,
	room_id INT NOT NULL,
	amen_type VARCHAR(20) NOT NULL,
	primary key (amen_type,chain_name,hotel_id,room_id),
	FOREIGN KEY (chain_name,hotel_id,room_id) REFERENCES Room (chain_name,hotel_id,room_id)
);

CREATE TABLE Problem (
	chain_name VARCHAR(20) NOT NUll,
	hotel_id INT NOT NULL,
	room_id INT NOT NULL,
	prob_type VARCHAR(20) NOT NULL,
	primary key (prob_type,chain_name,hotel_id,room_id),
	FOREIGN KEY (chain_name,hotel_id,room_id) REFERENCES Room (chain_name,hotel_id,room_id)
);

CREATE TABLE Employee (
	ssn NUMERIC(9,0),
	first_name VARCHAR,
	last_name VARCHAR,
	street_number NUMERIC(4,0),
	street_name VARCHAR,
	city VARCHAR,
	province VARCHAR(3),
	postal VARCHAR(6),
	role VARCHAR,
	primary key (ssn)
);

CREATE TABLE Customer (
	ssn NUMERIC(9,0),
	first_name VARCHAR,
	last_name VARCHAR,
	street_number NUMERIC(4,0),
	street_name VARCHAR,
	city VARCHAR,
	province VARCHAR(3),
	postal VARCHAR(6),
	date_of_registration date,
	primary key (ssn)
);

CREATE TABLE Renting (
	rent_id Int,
	start_date date,
	end_date date,
	cost NUMERIC(7,2),
	primary key(rent_id),
	CONSTRAINT renting_positive_cost CHECK (cost > 0),
	CONSTRAINT renting_check_dates CHECK (start_date < end_date)
);

CREATE TABLE Booking (
	booking_id Int,
	start_date date,
	end_date date,
	cost NUMERIC(7,2),
	primary key(booking_id),
	CONSTRAINT booking_positive_cost CHECK (cost > 0),
	CONSTRAINT booking_check_dates CHECK (start_date < end_date)
);

CREATE TABLE Works (
	ssn NUMERIC(9,0),
	hotel_id Int,
	chain_name VARCHAR(20),
	PRIMARY KEY (ssn,hotel_id,chain_name),
	FOREIGN KEY (ssn) REFERENCES Employee (ssn),
	FOREIGN KEY (chain_name,hotel_id) REFERENCES Hotel (chain_name,hotel_id)
);

CREATE TABLE Manages (
	ssn NUMERIC(9,0),
	hotel_id Int,
	chain_name VARCHAR(20),
	PRIMARY KEY (ssn,hotel_id,chain_name),
	FOREIGN KEY (ssn) REFERENCES Employee (ssn),
	FOREIGN KEY (chain_name,hotel_id) REFERENCES Hotel (chain_name,hotel_id)
);

CREATE TABLE Creates (
	ssn NUMERIC(9,0),
	rent_id Int,
	PRIMARY KEY (ssn,rent_id),
	FOREIGN KEY (ssn) REFERENCES Employee (ssn),
	FOREIGN KEY (rent_id) REFERENCES Renting (rent_id)
);

CREATE TABLE Pays (
	ssn NUMERIC(9,0),
	rent_id Int,
	FOREIGN KEY (ssn) REFERENCES Customer (ssn),
	FOREIGN KEY (rent_id) REFERENCES Renting (rent_id)
);

CREATE TABLE Rents (
	rent_id Int,
	chain_name VARCHAR(20),
	hotel_id Int,
	room_id Int,
	PRIMARY KEY (rent_id,chain_name,hotel_id,room_id),
	FOREIGN KEY (rent_id) REFERENCES Renting (rent_id),
	FOREIGN KEY (chain_name,hotel_id,room_id) REFERENCES Room (chain_name,hotel_id,room_id)
);

CREATE TABLE Books (
	booking_id Int,
	chain_name VARCHAR(20),
	hotel_id Int,
	room_id Int,
	PRIMARY KEY (booking_id,chain_name,hotel_id,room_id),
	FOREIGN KEY (booking_id) REFERENCES Booking (booking_id),
	FOREIGN KEY (chain_name,hotel_id,room_id) REFERENCES Room (chain_name,hotel_id,room_id)
);

CREATE TABLE Reserves (
	ssn NUMERIC(9,0),
	booking_id Int,
	PRIMARY KEY (ssn,booking_id),
	FOREIGN KEY (ssn) REFERENCES Customer (ssn),
	FOREIGN KEY (booking_id) REFERENCES Booking (booking_id)
);

CREATE TABLE Registers (
	ssn NUMERIC(9,0),
	booking_id Int,
	PRIMARY KEY (ssn,booking_id),
	FOREIGN KEY (ssn) REFERENCES Employee (ssn),
	FOREIGN KEY (booking_id) REFERENCES Booking (booking_id)
);

