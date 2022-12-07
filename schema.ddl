/* Could not: What constraints from the domain specification could not be 
enforced without assertions or triggers, if any?

Each venue must have at least 10 seat is the constraints could not be 
enforced without assertions or triggers.


Did not: What constraints from the domain specification could have been enforced 
without assertions or triggers, but were not enforced, if any? Why not?

We did not enforce 'Every concert in exactly one venue', we can do it buy 
creating another table,

for example:
CREATE TABLE Performance (
  concert_name varchar(50) PRIMARY KEY,
  venue_id varchar(50) NOT NULL
);

But doing so will cause redundancy, venue_id will be in Performance and Concert. And this 
will cause anomalies. 
Only one of 'enfore a venue can only have one concert at a given time' 
and 'Every concert in exactly one venue' can be enforced without causing redundancy,
we chose the first one, which is a more realistic constraints.

Extra constraints: What additional constraints that we didn’t mention did you 
enforce, if any? 

None

Assumptions: What assumptions did you make? 
All concert in 2022.

*/

DROP schema if exists ticketchema cascade;
CREATE schema ticketchema;
SET search_path to ticketchema;

/* 
A person or an organization or company <owner_id>, who own at least one venue. 
The <owner_id> is the identifier of the owner.
The owner has the phone number <phone_number>.
*/
CREATE TABLE Owner (
  owner_id integer PRIMARY KEY,
  owner_name varchar(50) NOT NULL,
  phone_number varchar(50) UNIQUE NOT NULL
);

/* 
A venue has a name <venue_name> (not unique), city <city>, and street address <street_address>.
The <venue_id> is the identifier of the venue.
The <owner_id> is the owner of the venue.
*/
CREATE TABLE Venue (
  venue_id integer PRIMARY KEY,
  venue_name varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  street_address varchar(50) NOT NULL,
  owner_id integer NOT NULL references Owner(owner_id)
);

/* 
Each section has a name that is unique to that venue <venue_name>.
Seats in a venue are organized into sections <section_id>.
The <section_id> is the identifier of the section.
The <venue_id> is the venue of the section.
UNIQUE (section_name, venue_id) can enfore that every section in the same venue is unique in this venue.
*/
CREATE TABLE Section (
  section_id integer PRIMARY KEY,
  section_name varchar(50) NOT NULL,
  venue_id integer NOT NULL,
  UNIQUE (section_name, venue_id)
);

/* 
Each seat has an identifier <seat_id>, and the name <seat_name>.
Seats are organized into section <section_id>.
Accessible <accessible> indicates whether or not the seat is for the people with mobility issues.
UNIQUE (section_name, venue_id) can enfore that every seat in the same section is unique in this section.
*/
CREATE TABLE Seat (
  seat_id integer primary key,
  accessible boolean NOT NULL,
  section_id integer NOT NULL references Section(section_id),
  seat_name varchar(50) NOT NULL,
  UNIQUE (seat_name, section_id)
);

/*
The concert with name <concert_name> will be performed in the <venue_id> on <datetime>.
The <concert_id> is the identifier of the concert.
UNIQUE (venue_id, datetime) can enfore a venue can only have one concert at a given time.
*/
CREATE TABLE Concert (
  concert_id integer PRIMARY KEY,
  concert_name varchar(50) NOT NULL,
  datetime timestamp NOT NULL,
  venue_id integer NOT NULL references Venue(venue_id),
  UNIQUE (venue_id, datetime)
);

/* 
A user <username> can purchase one or more tickets <ticket_id> to any concert <concert_id>. 
The ticket is in the section <section_id>, with the seat name <seat_name>.
*/
CREATE TABLE Purchase (
  ticket_id integer PRIMARY KEY,
  username varchar(50) NOT NULL,
  seat_name varchar(50) UNIQUE NOT NULL,
  section_id integer NOT NULL references Section(section_id),
  concert_id integer NOT NULL references Concert(concert_id)
);

/* 
The PriceInfo refer to the information of price in the section <section_id>.
The <price_id> is the identifier of PriceInfo.
We record the date and time <datetime> of purchasing ticket.
UNIQUE (datetime, section_id) can enfore a section given a datetime is unique in this price <price_id>.
*/
CREATE TABLE PriceInfo (
  price_id integer PRIMARY KEY,
  price integer NOT NULL,
  datetime timestamp NOT NULL,
  section_id integer NOT NULL references Section(section_id),
  UNIQUE (datetime, section_id)
);

/* 
Users of the app have a unique username <username>.
*/
CREATE TABLE User1 (
    username varchar(50) PRIMARY KEY
);