SET search_path to ticketchema;

DROP VIEW IF EXISTS Accessible CASCADE;
DROP VIEW IF EXISTS AllSeat CASCADE;
DROP VIEW IF EXISTS AccessibleFix CASCADE;

/*
Accessible is accessible seat number in each venue
*/
CREATE VIEW Accessible AS
Select count(*) as c, v.venue_id
From Seat s1, Section s2, Venue v
Where s1.section_id = s2.section_id and s2.venue_id = v.venue_id and s1.accessible = true
Group By v.venue_id;

/*
Allseat is seat number in each venue
*/
CREATE VIEW AllSeat AS
Select count(*) as c, v.venue_id
From Seat s1, Section s2, Venue v
Where s1.section_id = s2.section_id and s2.venue_id = v.venue_id
Group By v.venue_id;

/*
What AccessibleFix do is fix the Accessible View by adding row when a venue has no accessible seat
*/
CREATE VIEW AccessibleFix AS
Select case when a.c is NULL then 0 else a.c end as access, case when a.venue_id is NULL then b.venue_id else a.venue_id end
as venue_id, b.c
From Accessible a FULL JOIN AllSeat b
ON a.venue_id = b.venue_id;

/*
venue_id is the venue id, venue_name is the name of that venue, 
percent is the percentage of seats that are accessible
*/
Select (a.access * 1.0) / (a.c * 1.0) as percent, v.venue_name, v.venue_id
    From AccessibleFix a, Venue v
    Where a.venue_id = v.venue_id
    
