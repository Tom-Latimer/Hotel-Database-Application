/* Table Creation */
CREATE TABLE Hotel_Chain (
	chain_name VARCHAR(20) NOT NULL,
	street_number Numeric(4,0),
	street_name VARCHAR,
	city VARCHAR,
	province VARCHAR(2),
	postal VARCHAR(6),
	phone_numbers VARCHAR,
	email_addresses VARCHAR,
	primary key (chain_name)
);

CREATE TABLE Hotel (
	chain_name VARCHAR(20) NOT NUll,
	hotel_id SERIAL,
	hotel_name VARCHAR(30),
	rating NUMERIC(2,1),
	street_number NUMERIC(4,0),
	street_name VARCHAR,
	city VARCHAR,
	province VARCHAR(2),
	postal VARCHAR(6),
	phone_numbers VARCHAR,
	email_addresses VARCHAR,
	primary key (hotel_id,chain_name),
	FOREIGN KEY (chain_name) REFERENCES Hotel_Chain (chain_name),
	CONSTRAINT rating_constraint CHECK (rating >= 0.0 AND rating <= 5.0)
);

CREATE TABLE Room (
	chain_name VARCHAR(20) NOT NUll,
	hotel_id INT NOT NULL,
	room_id SERIAL,
	price NUMERIC(7,2),
	capacity INT,
	view_type boolean,
	available boolean,
	primary key (room_id,chain_name,hotel_id),
	FOREIGN KEY (hotel_id,chain_name) REFERENCES Hotel (hotel_id,chain_name),
	CONSTRAINT capacity_constraint CHECK (capacity > 0),
	CONSTRAINT room_positive_cost CHECK (price > 0)
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
	province VARCHAR(2),
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
	province VARCHAR(2),
	postal VARCHAR(6),
	date_of_registration date,
	primary key (ssn)
);

CREATE TABLE Renting (
	rent_id SERIAL,
	start_date date,
	end_date date,
	cost NUMERIC(7,2),
	primary key(rent_id),
	CONSTRAINT renting_positive_cost CHECK (cost > 0),
	CONSTRAINT renting_check_dates CHECK (start_date < end_date)
);

CREATE TABLE Booking (
	booking_id SERIAL,
	start_date date,
	end_date date,
	cost NUMERIC(7,2),
	primary key(booking_id),
	CONSTRAINT booking_positive_cost CHECK (cost > 0),
	CONSTRAINT booking_check_dates CHECK (start_date < end_date)
);

CREATE TABLE Works (
	ssn NUMERIC(9,0),
	hotel_id Int NOT NULL,
	chain_name VARCHAR(20),
	PRIMARY KEY (ssn,hotel_id,chain_name),
	FOREIGN KEY (ssn) REFERENCES Employee (ssn),
	FOREIGN KEY (chain_name,hotel_id) REFERENCES Hotel (chain_name,hotel_id)
);

CREATE TABLE Manages (
	ssn NUMERIC(9,0),
	hotel_id Int NOT NULL,
	chain_name VARCHAR(20),
	PRIMARY KEY (ssn,hotel_id,chain_name),
	FOREIGN KEY (ssn) REFERENCES Employee (ssn),
	FOREIGN KEY (chain_name,hotel_id) REFERENCES Hotel (chain_name,hotel_id)
);

CREATE TABLE Creates (
	ssn NUMERIC(9,0),
	rent_id Int NOT NULL,
	PRIMARY KEY (ssn,rent_id),
	FOREIGN KEY (ssn) REFERENCES Employee (ssn),
	FOREIGN KEY (rent_id) REFERENCES Renting (rent_id)
);

CREATE TABLE Pays (
	ssn NUMERIC(9,0),
	rent_id Int NOT NULL,
	PRIMARY KEY (ssn,rent_id),
	FOREIGN KEY (ssn) REFERENCES Customer (ssn),
	FOREIGN KEY (rent_id) REFERENCES Renting (rent_id)
);

CREATE TABLE Rents (
	rent_id Int NOT NULL,
	chain_name VARCHAR(20),
	hotel_id Int NOT NULL,
	room_id Int NOT NULL,
	PRIMARY KEY (rent_id,chain_name,hotel_id,room_id),
	FOREIGN KEY (rent_id) REFERENCES Renting (rent_id),
	FOREIGN KEY (chain_name,hotel_id,room_id) REFERENCES Room (chain_name,hotel_id,room_id)
);

CREATE TABLE Books (
	booking_id Int NOT NULL,
	chain_name VARCHAR(20),
	hotel_id Int NOT NULL,
	room_id Int NOT NULL,
	PRIMARY KEY (booking_id,chain_name,hotel_id,room_id),
	FOREIGN KEY (booking_id) REFERENCES Booking (booking_id),
	FOREIGN KEY (chain_name,hotel_id,room_id) REFERENCES Room (chain_name,hotel_id,room_id)
);

CREATE TABLE Reserves (
	ssn NUMERIC(9,0),
	booking_id Int NOT NULL,
	PRIMARY KEY (ssn,booking_id),
	FOREIGN KEY (ssn) REFERENCES Customer (ssn),
	FOREIGN KEY (booking_id) REFERENCES Booking (booking_id)
);

CREATE TABLE Registers (
	ssn NUMERIC(9,0),
	booking_id Int NOT NULL,
	PRIMARY KEY (ssn,booking_id),
	FOREIGN KEY (ssn) REFERENCES Employee (ssn),
	FOREIGN KEY (booking_id) REFERENCES Booking (booking_id)
);

/* Triggers */

create function check_chain_name()
	returns trigger as
$body$
begin

if NEW.chain_name not in (select chain_name from hotel_chain)
then raise exception 'Hotel must belong to an established chain.';
end if;

return new;

end
$body$ LANGUAGE plpgsql;

create trigger chain_name_check before insert on Hotel
for each row
execute procedure check_chain_name();

create trigger chain_name_check before insert on Room
for each row
execute procedure check_chain_name();

create function check_hotel_id()
returns trigger as
$body$
begin

if NEW.hotel_id not in (select hotel_id from hotel)
then raise exception 'Room must belong to a valid hotel.';
end if;

return new;

end
$body$ LANGUAGE plpgsql;

create trigger hotel_id_check before insert on Room
for each row
execute procedure check_hotel_id();

/* Views */

create view room_capacity as
select hotel_name,room_id,capacity
from (select hotel.hotel_name,room_id,capacity
	 from hotel,room
	 where room.hotel_id = hotel.hotel_id) as temp;

create view room_availability as 
select city as area, count(room_id) as available
from (select room_id, city
	  from room,hotel
	  where room.hotel_id = hotel.hotel_id
	  and room.available =true) as temp
group by area;

create view room_view as
select city, hotel_name, room.*
from hotel,room
where room.hotel_id = hotel.hotel_id;

/* Indexes */
CREATE INDEX booking_index
ON booking (start_date, end_date);

CREATE INDEX room_cost_index
ON room (price);

CREATE INDEX hotel_name_index
ON hotel (city,province);

/* Data Insertion */

INSERT INTO hotel_chain (chain_name, street_number, street_name, city, province, postal, phone_numbers, email_addresses)
VALUES
   ('Blue Star Hotels', 1234, 'Main Street', 'Toronto', 'ON', 'M5V2G3', '416-555-1234', 'info@bluestarhotels.com'),
   ('Green Leaf Resorts', 5678, '1st Avenue', 'Vancouver', 'BC', 'V6B1A8', '604-555-5678', 'info@greenleafresorts.com'),
   ('Red Rock Hotels', 9012, 'High Street', 'Calgary', 'AB', 'T2P1J9', '403-555-9012', 'info@redrockhotels.com'),
   ('Golden Sands Resorts', 3456, 'Ocean Boulevard', 'Halifax', 'NS', 'B3H4R2', '902-555-3456', 'info@goldensandsresorts.com'),
   ('Silver Peak Hotels', 7890, 'Mountain Road', 'Montreal', 'QC', 'G1B0C5', '403-555-7890', 'info@silverpeakhotels.com');

INSERT INTO Hotel (chain_name, hotel_name, rating, street_number, street_name, city, province, postal, phone_numbers, email_addresses)
VALUES
('Blue Star Hotels', 'Ocean View Hotel', 4.1, 1001, 'Beach Road', 'Victoria', 'BC', 'V8W1W5', '250-555-1234', 'info@oceanviewhotel.com'),
('Blue Star Hotels', 'Majestic Hotel', 2.9, 1234, 'Park Ave', 'Toronto', 'ON', 'M4T2N7', '416-555-5678', 'info@majestichotel.com'),
('Blue Star Hotels', 'Sunrise Suites', 3.8, 4567, 'Sunrise Blvd', 'Halifax', 'NS', 'B3J3J5', '902-555-9101', 'info@sunrisesuites.com'),
('Blue Star Hotels', 'Starlight Inn', 3.3, 7890, 'Orchard Rd', 'Montreal', 'QC', 'H3W2T2', '514-555-2468', 'info@starlightinn.com'),
('Blue Star Hotels', 'Paradise Hotel', 4.5, 2345, 'Paradise Rd', 'Vancouver', 'BC', 'V6B3T6', '604-555-7890', 'info@paradisehotel.com'),
('Blue Star Hotels', 'Seaside Resort', 2.5, 3456, 'Seaside Ave', 'St. Johns', 'NL', 'A1A1A1', '709-555-3456', 'info@seasideresort.com'),
('Blue Star Hotels', 'Harbor View Inn', 3.6, 5678, 'Harbor St', 'Charlottetown', 'PE', 'C1A4A2', '902-555-5678', 'info@harborviewinn.com'),
('Blue Star Hotels', 'Riverfront Hotel', 4.0, 6789, 'Riverfront Rd', 'Calgary', 'AB', 'T2G5A6', '403-555-2345', 'info@riverfronthotel.com');

INSERT INTO Hotel (chain_name, hotel_name, rating, street_number, street_name, city, province, postal, phone_numbers, email_addresses)
VALUES
('Green Leaf Resorts', 'Green Leaf Resort Banff', 4.1, 1234, 'Banff Avenue', 'Banff', 'AB', 'T1L1A1', '403-555-1234', 'banff@greenleafresorts.com'),
('Green Leaf Resorts', 'Green Leaf Resort Whistler', 3.9, 5678, 'Blackcomb Way', 'Whistler', 'BC', 'V0N1B4', '604-555-5678', 'whistler@greenleafresorts.com'),
('Green Leaf Resorts', 'Green Leaf Resort Lake Louise', 3.2, 910, 'Bow Valley Parkway', 'Lake Louise', 'AB', 'T0L1E0', '403-555-9100', 'lakelouise@greenleafresorts.com'),
('Green Leaf Resorts', 'Green Leaf Resort Canmore', 2.5, 4567, 'Bow Valley Trail', 'Canmore', 'AB', 'T1W1N5', '403-555-4567', 'canmore@greenleafresorts.com'),
('Green Leaf Resorts', 'Green Leaf Resort Jasper', 3.8, 2468, 'Connaught Drive', 'Jasper', 'AB', 'T0E1E0', '780-555-2468', 'jasper@greenleafresorts.com'),
('Green Leaf Resorts', 'Green Leaf Resort Fernie', 4.5, 369, 'Fernie Ski Hill Road', 'Fernie', 'BC', 'V0B1M0', '250-555-3690', 'fernie@greenleafresorts.com'),
('Green Leaf Resorts', 'Green Leaf Resort Revelstoke', 4.8, 1010, 'Mackenzie Avenue', 'Revelstoke', 'BC', 'V0E2S0', '250-555-1010', 'revelstoke@greenleafresorts.com'),
('Green Leaf Resorts', 'Green Leaf Resort Golden', 3.6, 246, 'Kicking Horse Trail', 'Golden', 'BC', 'V0A1H0', '250-555-2460', 'golden@greenleafresorts.com');


INSERT INTO Hotel (chain_name, hotel_name, rating, street_number, street_name, city, province, postal, phone_numbers, email_addresses)
VALUES
('Red Rock Hotels', 'Red Rock Resort Toronto', 3.6, 123, 'Yonge Street', 'Toronto', 'ON', 'M5C1W6', '416-555-1234', 'toronto@redrockhotels.com'),
('Red Rock Hotels', 'Red Rock Resort Vancouver', 4.1, 567, 'Granville Street', 'Vancouver', 'BC', 'V6C1W6', '604-555-5678', 'vancouver@redrockhotels.com'),
('Red Rock Hotels', 'Red Rock Resort Calgary', 3.2, 910, '7th Avenue SW', 'Calgary', 'AB', 'T2P3N8', '403-555-9100', 'calgary@redrockhotels.com'),
('Red Rock Hotels', 'Red Rock Resort Halifax', 2.5, 4567, 'Barrington Street', 'Halifax', 'NS', 'B3J1Z3', '902-555-4567', 'halifax@redrockhotels.com'),
('Red Rock Hotels', 'Red Rock Resort Quebec City', 3.8, 2468, 'Rue Saint-Jean', 'Quebec City', 'QC', 'G1V1Y1', '418-555-2468', 'quebec@redrockhotels.com'),
('Red Rock Hotels', 'Red Rock Resort Edmonton', 4.5, 369, 'Jasper Avenue', 'Edmonton', 'AB', 'T5J3N8', '780-555-3690', 'edmonton@redrockhotels.com'),
('Red Rock Hotels', 'Red Rock Resort Montreal', 4.8, 1010, 'Rue de la Gauchetière Ouest', 'Montreal', 'QC', 'H3B2N2', '514-555-1010', 'montreal@redrockhotels.com'),
('Red Rock Hotels', 'Red Rock Resort St. Johns', 3.6, 246, 'Water Street', 'St. Johns', 'NL', 'A1C1A9', '709-555-2460', 'stjohns@redrockhotels.com');


INSERT INTO Hotel (chain_name, hotel_name, rating, street_number, street_name, city, province, postal, phone_numbers, email_addresses)
VALUES
('Golden Sands Resorts', 'Sunset Paradise', 4.2, 4567, 'Sunset Boulevard', 'Vancouver', 'BC', 'V6B4N9', '604-123-4567', 'sunsetparadise@goldensands.com'),
('Golden Sands Resorts', 'Golden Oasis', 3.8, 9876, 'Gold Coast Highway', 'Toronto', 'ON', 'M4B1R7', '416-987-6543', 'goldenoasis@goldensands.com'),
('Golden Sands Resorts', 'Sands of Time', 4.5, 1234, 'Beach Avenue', 'Halifax', 'NS', 'B3J1N5', '902-456-7890', 'sandsoftime@goldensands.com'),
('Golden Sands Resorts', 'Island Retreat', 3.3, 5678, 'Island Road', 'Victoria', 'BC', 'V8W1Y5', '250-234-5678', 'islandretreat@goldensands.com'),
('Golden Sands Resorts', 'Paradise Cove', 4.0, 8765, 'Cove Road', 'Kelowna', 'BC', 'V1Y8R1', '778-345-6789', 'paradisecove@goldensands.com'),
('Golden Sands Resorts', 'Sunny Sands', 4.1, 3456, 'Sunny Boulevard', 'Montreal', 'QC', 'H1A1B1', '514-456-7890', 'sunnysands@goldensands.com'),
('Golden Sands Resorts', 'Crystal Beach', 3.5, 6543, 'Crystal Drive', 'Calgary', 'AB', 'T2E1S5', '403-567-8901', 'crystalbeach@goldensands.com'),
('Golden Sands Resorts', 'Ocean View', 4.8, 2345, 'Ocean Avenue', 'Ottawa', 'ON', 'K1N7E9', '613-678-9012', 'oceanview@goldensands.com');

INSERT INTO Hotel (chain_name, hotel_name, rating, street_number, street_name, city, province, postal, phone_numbers, email_addresses)
VALUES
('Silver Peak Hotels', 'Silver Peak Inn', 3.9, 1234, 'Main Street', 'Montreal', 'QC', 'H3B2T6', '514-555-1234', 'info@silverpeakinn.com'),
('Silver Peak Hotels', 'The Silver Lodge', 4.5, 5678, 'Queen Street', 'Ottawa', 'ON', 'K1P5G9', '613-555-1234', 'info@silverlodge.com'),
('Silver Peak Hotels', 'Alpine Heights Resort', 4.3, 9012, 'Mountain Road', 'Calgary', 'AB', 'T2G4M9', '403-555-1234', 'info@alpineheights.com'),
('Silver Peak Hotels', 'Silver View Suites', 3.5, 3456, 'Ocean Avenue', 'Vancouver', 'BC', 'V6B3N8', '604-555-1234', 'info@silverviewsuites.com'),
('Silver Peak Hotels', 'Silver Palm Resort', 4.2, 7890, 'Palm Street', 'Toronto', 'ON', 'M4C1M5', '416-555-1234', 'info@silverpalmresort.com'),
('Silver Peak Hotels', 'Mountain View Lodge', 4.1, 2345, 'Mountain Road', 'Halifax', 'NS', 'B3K2Z4', '902-555-1234', 'info@mountainviewlodge.com'),
('Silver Peak Hotels', 'Silver Valley Inn', 3.8, 6789, 'Valley Street', 'Winnipeg', 'MB', 'R3B2E9', '204-555-1234', 'info@silvervalleyinn.com'),
('Silver Peak Hotels', 'The Silver Star Hotel', 4.7, 1111, 'Star Boulevard', 'Victoria', 'BC', 'V8W1N4', '250-555-1234', 'info@silverstarhotel.com');


INSERT INTO Room (chain_name, hotel_id, price, capacity, view_type, available)
VALUES
('Blue Star Hotels', 1, 100.00, 1, FALSE, TRUE),
('Blue Star Hotels', 1, 120.00, 2, TRUE, TRUE),
('Blue Star Hotels', 1, 150.00, 3, TRUE, TRUE),
('Blue Star Hotels', 1, 180.00, 4, FALSE, TRUE),
('Blue Star Hotels', 1, 200.00, 5, TRUE, TRUE),
('Blue Star Hotels', 1, 250.00, 6, FALSE, TRUE),

('Blue Star Hotels', 2, 120.00, 2, FALSE, TRUE),
('Blue Star Hotels', 2, 180.00, 4, TRUE, TRUE),
('Blue Star Hotels', 2, 300.00, 6, TRUE, TRUE),
('Blue Star Hotels', 2, 75.00,  1, FALSE, TRUE),
('Blue Star Hotels', 2, 190.00, 3, FALSE, TRUE),

('Blue Star Hotels', 3, 175.00, 2, TRUE, TRUE),
('Blue Star Hotels', 3, 250.00, 4, TRUE, TRUE),
('Blue Star Hotels', 3, 400.00, 6, FALSE, TRUE),
('Blue Star Hotels', 3, 90.00,  1, FALSE, TRUE),
('Blue Star Hotels', 3, 225.00, 4, FALSE, TRUE),

('Blue Star Hotels', 4, 120.00, 2, TRUE, TRUE),
('Blue Star Hotels', 4, 175.00, 4, TRUE, TRUE),
('Blue Star Hotels', 4, 200.00, 4, FALSE, TRUE),
('Blue Star Hotels', 4, 250.00, 6, TRUE, TRUE),
('Blue Star Hotels', 4, 300.00, 6, FALSE, TRUE),

('Blue Star Hotels', 5, 120.00, 2, TRUE, TRUE),
('Blue Star Hotels', 5, 150.00, 2, TRUE, TRUE),
('Blue Star Hotels', 5, 180.00, 3, TRUE, TRUE),
('Blue Star Hotels', 5, 200.00, 4, FALSE, TRUE),
('Blue Star Hotels', 5, 250.00, 4, TRUE, TRUE),

('Blue Star Hotels', 6, 110.00, 2, FALSE, TRUE),
('Blue Star Hotels', 6, 140.00, 2, TRUE, TRUE),
('Blue Star Hotels', 6, 180.00, 3, TRUE, TRUE),
('Blue Star Hotels', 6, 220.00, 4, TRUE, TRUE),
('Blue Star Hotels', 6, 270.00, 4, TRUE, TRUE),

('Blue Star Hotels', 7, 100.00, 2, FALSE, TRUE),
('Blue Star Hotels', 7, 130.00, 2, TRUE, TRUE),
('Blue Star Hotels', 7, 170.00, 3, TRUE, TRUE),
('Blue Star Hotels', 7, 220.00, 4, FALSE, TRUE),
('Blue Star Hotels', 7, 280.00, 4, TRUE, TRUE),

('Blue Star Hotels', 8, 125.00, 2, FALSE, TRUE),
('Blue Star Hotels', 8, 225.00, 4, TRUE, TRUE),
('Blue Star Hotels', 8, 325.00, 6, FALSE, TRUE),
('Blue Star Hotels', 8, 275.00, 3, TRUE, TRUE),
('Blue Star Hotels', 8, 190.00, 2, FALSE, TRUE);

INSERT INTO Room (chain_name, hotel_id, price, capacity, view_type, available)
VALUES
('Green Leaf Resorts', 9, 150.00, 2, TRUE, TRUE),
('Green Leaf Resorts', 9, 200.00, 4, TRUE, TRUE),
('Green Leaf Resorts', 9, 225.00, 4, FALSE, TRUE),
('Green Leaf Resorts', 9, 275.00, 6, TRUE, TRUE),
('Green Leaf Resorts', 9, 325.00, 6, FALSE, TRUE),

('Green Leaf Resorts', 10, 100.00, 2, TRUE, TRUE),
('Green Leaf Resorts', 10, 150.00, 4, TRUE, TRUE),
('Green Leaf Resorts', 10, 175.00, 4, FALSE, TRUE),
('Green Leaf Resorts', 10, 225.00, 6, TRUE, TRUE),
('Green Leaf Resorts', 10, 275.00, 6, FALSE, TRUE),

('Green Leaf Resorts', 11, 200.00, 2, TRUE, TRUE),
('Green Leaf Resorts', 11, 250.00, 4, TRUE, TRUE),
('Green Leaf Resorts', 11, 275.00, 4, FALSE, TRUE),
('Green Leaf Resorts', 11, 325.00, 6, TRUE, TRUE),
('Green Leaf Resorts', 11, 375.00, 6, FALSE, TRUE),

('Green Leaf Resorts', 12, 175.00, 2, TRUE, TRUE),
('Green Leaf Resorts', 12, 225.00, 4, TRUE, TRUE),
('Green Leaf Resorts', 12, 250.00, 4, FALSE, TRUE),
('Green Leaf Resorts', 12, 300.00, 6, TRUE, TRUE),
('Green Leaf Resorts', 12, 350.00, 6, FALSE, TRUE),

('Green Leaf Resorts', 13, 150.00, 2, TRUE, TRUE),
('Green Leaf Resorts', 13, 200.00, 3, FALSE, TRUE),
('Green Leaf Resorts', 13, 225.00, 4, FALSE, TRUE),
('Green Leaf Resorts', 13, 275.00, 5, FALSE, TRUE),
('Green Leaf Resorts', 13, 325.00, 6, FALSE, TRUE),

('Green Leaf Resorts', 14, 100.00, 2, TRUE, TRUE),
('Green Leaf Resorts', 14, 150.00, 3, TRUE, TRUE),
('Green Leaf Resorts', 14, 175.00, 4, FALSE, TRUE),
('Green Leaf Resorts', 14, 225.00, 5, TRUE, TRUE),
('Green Leaf Resorts', 14, 275.00, 6, FALSE, TRUE),

('Green Leaf Resorts', 15, 200.00, 3, TRUE, TRUE),
('Green Leaf Resorts', 15, 250.00, 4, TRUE, TRUE),
('Green Leaf Resorts', 15, 275.00, 5, FALSE, TRUE),
('Green Leaf Resorts', 15, 325.00, 6, TRUE, TRUE),
('Green Leaf Resorts', 15, 375.00, 6, FALSE, TRUE),

('Green Leaf Resorts', 16, 175.00, 2, TRUE, TRUE),
('Green Leaf Resorts', 16, 225.00, 3, TRUE, TRUE),
('Green Leaf Resorts', 16, 250.00, 4, FALSE, TRUE),
('Green Leaf Resorts', 16, 300.00, 5, TRUE, TRUE),
('Green Leaf Resorts', 16, 350.00, 6, FALSE, TRUE);

INSERT INTO Room (chain_name, hotel_id, price, capacity, view_type, available)
VALUES
('Red Rock Hotels', 17, 125.00, 2, FALSE, TRUE),
('Red Rock Hotels', 17, 175.00, 3, TRUE, TRUE),
('Red Rock Hotels', 17, 250.00, 4, TRUE, FALSE),
('Red Rock Hotels', 17, 300.00, 5, TRUE, TRUE),
('Red Rock Hotels', 17, 375.00, 6, FALSE, FALSE),

('Red Rock Hotels', 18, 75.00, 2, FALSE, TRUE),
('Red Rock Hotels', 18, 100.00, 3, TRUE, TRUE),
('Red Rock Hotels', 18, 150.00, 4, FALSE, TRUE),
('Red Rock Hotels', 18, 225.00, 5, TRUE, FALSE),
('Red Rock Hotels', 18, 275.00, 6, TRUE, TRUE),

('Red Rock Hotels', 19, 100.00, 2, FALSE, TRUE),
('Red Rock Hotels', 19, 150.00, 3, TRUE, TRUE),
('Red Rock Hotels', 19, 225.00, 4, TRUE, FALSE),
('Red Rock Hotels', 19, 275.00, 5, TRUE, TRUE),
('Red Rock Hotels', 19, 325.00, 6, FALSE, FALSE),

('Red Rock Hotels', 20, 150.00, 2, FALSE, TRUE),
('Red Rock Hotels', 20, 200.00, 3, TRUE, TRUE),
('Red Rock Hotels', 20, 275.00, 4, TRUE, FALSE),
('Red Rock Hotels', 20, 325.00, 5, TRUE, TRUE),
('Red Rock Hotels', 20, 400.00, 6, FALSE, FALSE),

('Red Rock Hotels', 21, 156.25, 2, TRUE, TRUE),
('Red Rock Hotels', 21, 250.00, 4, FALSE, TRUE),
('Red Rock Hotels', 21, 312.50, 6, TRUE, TRUE),
('Red Rock Hotels', 21, 400.00, 8, FALSE, TRUE),
('Red Rock Hotels', 21, 468.75, 10, TRUE, TRUE),

('Red Rock Hotels', 22, 125.00, 2, TRUE, TRUE),
('Red Rock Hotels', 22, 200.00, 4, FALSE, TRUE),
('Red Rock Hotels', 22, 250.00, 6, TRUE, TRUE),
('Red Rock Hotels', 22, 320.00, 8, FALSE, TRUE),
('Red Rock Hotels', 22, 375.00, 10, TRUE, TRUE),

('Red Rock Hotels', 23, 187.50, 2, TRUE, TRUE),
('Red Rock Hotels', 23, 300.00, 4, FALSE, TRUE),
('Red Rock Hotels', 23, 375.00, 6, TRUE, TRUE),
('Red Rock Hotels', 23, 480.00, 8, FALSE, TRUE),
('Red Rock Hotels', 23, 562.50, 10, TRUE, TRUE),

('Red Rock Hotels', 24, 218.75, 2, TRUE, TRUE),
('Red Rock Hotels', 24, 350.00, 4, FALSE, TRUE),
('Red Rock Hotels', 24, 437.50, 6, TRUE, TRUE),
('Red Rock Hotels', 24, 560.00, 8, FALSE, TRUE),
('Red Rock Hotels', 24, 656.25, 10, TRUE, TRUE);

INSERT INTO Room (chain_name, hotel_id, price, capacity, view_type, available)
VALUES

('Golden Sands Resorts', 25, 72.50, 1, FALSE, TRUE),
('Golden Sands Resorts', 25, 52.50, 1, TRUE, TRUE),
('Golden Sands Resorts', 25, 82.50, 1, FALSE, TRUE),
('Golden Sands Resorts', 25, 62.50, 1, TRUE, TRUE),
('Golden Sands Resorts', 25, 92.50, 1, FALSE, TRUE),

('Golden Sands Resorts', 26, 100.00, 1, TRUE, TRUE),
('Golden Sands Resorts', 26, 150.00, 2, FALSE, TRUE),
('Golden Sands Resorts', 26, 200.00, 3, TRUE, TRUE),
('Golden Sands Resorts', 26, 120.00, 2, FALSE, TRUE),
('Golden Sands Resorts', 26, 250.00, 4, TRUE, TRUE),

('Golden Sands Resorts', 27, 87.50, 1, TRUE, TRUE),
('Golden Sands Resorts', 27, 67.50, 1, FALSE, TRUE),
('Golden Sands Resorts', 27, 97.50, 1, TRUE, TRUE),
('Golden Sands Resorts', 27, 77.50, 1, FALSE, TRUE),
('Golden Sands Resorts', 27, 107.50, 1, TRUE, TRUE),

('Golden Sands Resorts', 28, 75.00, 2, TRUE, TRUE),
('Golden Sands Resorts', 28, 55.00, 1, FALSE, TRUE),
('Golden Sands Resorts', 28, 85.00, 1, TRUE, TRUE),
('Golden Sands Resorts', 28, 65.00, 1, FALSE, TRUE),
('Golden Sands Resorts', 28, 95.00, 2, TRUE, TRUE),

('Golden Sands Resorts', 29, 137.50, 2, TRUE, TRUE),
('Golden Sands Resorts', 29, 171.88, 4, FALSE, TRUE),
('Golden Sands Resorts', 29, 214.06, 6, TRUE, TRUE),
('Golden Sands Resorts', 29, 228.13, 3, FALSE, TRUE),
('Golden Sands Resorts', 29, 308.59, 8, FALSE, TRUE),

('Golden Sands Resorts', 30, 143.75, 2, TRUE, TRUE),
('Golden Sands Resorts', 30, 179.69, 4, FALSE, TRUE),
('Golden Sands Resorts', 30, 224.61, 6, TRUE, TRUE),
('Golden Sands Resorts', 30, 239.06, 3, FALSE, TRUE),
('Golden Sands Resorts', 30, 322.27, 8, FALSE, TRUE),

('Golden Sands Resorts', 31, 118.75, 2, TRUE, TRUE),
('Golden Sands Resorts', 31, 148.44, 4, FALSE, TRUE),
('Golden Sands Resorts', 31, 185.94, 6, TRUE, TRUE),
('Golden Sands Resorts', 31, 198.44, 3, FALSE, TRUE),
('Golden Sands Resorts', 31, 267.19, 8, FALSE, TRUE),

('Golden Sands Resorts', 32, 106.25, 2, TRUE, TRUE),
('Golden Sands Resorts', 32, 132.81, 4, FALSE, TRUE),
('Golden Sands Resorts', 32, 166.02, 6, TRUE, TRUE),
('Golden Sands Resorts', 32, 177.08, 3, FALSE, TRUE),
('Golden Sands Resorts', 32, 239.06, 8, FALSE, TRUE);

INSERT INTO Room (chain_name, hotel_id, price, capacity, view_type, available) VALUES

('Silver Peak Hotels', 33, 500.00, 1, TRUE, TRUE),
('Silver Peak Hotels', 33, 700.00, 2, FALSE, TRUE),
('Silver Peak Hotels', 33, 1500.00, 4, TRUE, TRUE),
('Silver Peak Hotels', 33, 3000.00, 6, FALSE, TRUE),
('Silver Peak Hotels', 33, 6000.00, 8, TRUE, TRUE),

('Silver Peak Hotels', 34, 1000.00, 2, FALSE, TRUE),
('Silver Peak Hotels', 34, 2500.00, 4, TRUE, TRUE),
('Silver Peak Hotels', 34, 5000.00, 6, FALSE, TRUE),
('Silver Peak Hotels', 34, 10000.00, 8, TRUE, TRUE),
('Silver Peak Hotels', 34, 15000.00, 10, FALSE, TRUE),

('Silver Peak Hotels', 35, 2000.00, 2, TRUE, TRUE),
('Silver Peak Hotels', 35, 4000.00, 4, FALSE, TRUE),
('Silver Peak Hotels', 35, 8000.00, 6, TRUE, TRUE),
('Silver Peak Hotels', 35, 1200.00, 8, FALSE, TRUE),
('Silver Peak Hotels', 35, 2000.00, 10, TRUE, TRUE),

('Silver Peak Hotels', 36, 500.00, 2, FALSE, TRUE),
('Silver Peak Hotels', 36, 1000.00, 4, TRUE, TRUE),
('Silver Peak Hotels', 36, 2000.00, 6, FALSE, TRUE),
('Silver Peak Hotels', 36, 4000.00, 8, TRUE, TRUE),
('Silver Peak Hotels', 36, 6000.00, 10, FALSE, TRUE),

('Silver Peak Hotels', 37, 500.00, 2, TRUE, TRUE),
('Silver Peak Hotels', 37, 800.00, 4, FALSE, TRUE),
('Silver Peak Hotels', 37, 1000.00, 6, FALSE, FALSE),
('Silver Peak Hotels', 37, 1500.00, 8, TRUE, FALSE),
('Silver Peak Hotels', 37, 2000.00, 10, TRUE, TRUE),

('Silver Peak Hotels', 38, 1000.00, 2, FALSE, FALSE),
('Silver Peak Hotels', 38, 1500.00, 4, TRUE, TRUE),
('Silver Peak Hotels', 38, 2000.00, 6, FALSE, TRUE),
('Silver Peak Hotels', 38, 2500.00, 8, TRUE, TRUE),
('Silver Peak Hotels', 38, 3000.00, 10, FALSE, FALSE),

('Silver Peak Hotels', 39, 800.00, 2, TRUE, TRUE),
('Silver Peak Hotels', 39, 1200.00, 4, FALSE, TRUE),
('Silver Peak Hotels', 39, 1600.00, 6, TRUE, FALSE),
('Silver Peak Hotels', 39, 2000.00, 8, FALSE, FALSE),
('Silver Peak Hotels', 39, 2500.00, 10, TRUE, TRUE),

('Silver Peak Hotels', 40, 2000.00, 2, TRUE, FALSE),
('Silver Peak Hotels', 40, 2500.00, 4, FALSE, TRUE),
('Silver Peak Hotels', 40, 3000.00, 6, FALSE, FALSE),
('Silver Peak Hotels', 40, 4000.00, 8, TRUE, TRUE),
('Silver Peak Hotels', 40, 5000.00, 10, TRUE, TRUE);


