SET search_path to ticketchema;

DROP VIEW IF EXISTS PurchaseConcertInfo CASCADE;
DROP VIEW IF EXISTS PurchasePrice CASCADE;
DROP VIEW IF EXISTS TotalPrice CASCADE;

/*
PurchaseConcertInfo is purchase table info (concert_id and section_id) combine with 
concert info (datetime, name of the concert and venue_id)
*/
CREATE VIEW PurchaseConcertInfo AS
Select p.concert_id, p.section_id, c.datetime, c.concert_name, c.venue_id
From Purchase p, Concert c
Where p.concert_id = c.concert_id;

/*
PurchasePrice is each the total sale value for each concert in each venue
*/
CREATE VIEW PurchasePrice AS
Select sum(p.price) as price, c.concert_name, c.venue_id
From PriceInfo p, PurchaseConcertInfo c
Where p.datetime = c.datetime and p.section_id = c.section_id
Group by c.concert_name, c.venue_id;

/*
TotalPrice is each the total sale value for each concert
*/
CREATE VIEW TotalPrice AS
Select sum(p.price) as total_value, p.concert_name
From PurchasePrice p
Group by p.concert_name;

/*
concert_name is the name of concert, total_value is total value of all tickets sold for that concert, venue_name
is the name of venue that concert is in, venue_id is the id of that venue, percent is the percentage of the venue 
that was sold.
*/
Select p.concert_name, t.total_value, v.venue_name, v.venue_id, (p.price * 1.0) / (t.total_value * 1.0) as percent
    From PurchasePrice p, TotalPrice t, Venue v
    Where p.concert_name = t.concert_name and v.venue_id = p.venue_id
