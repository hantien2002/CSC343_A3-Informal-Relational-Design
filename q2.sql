SET search_path to ticketchema;

/*
owner_id is the id of the owner, owner_name is the name of that owner, venue_owned
if the number of venue owned by that owned.
*/
Select v.owner_id, o.owner_name, count(*) as venue_owned
    From Venue v, Owner o
    Where v.owner_id = o.owner_id
    Group by v.owner_id, o.owner_name
