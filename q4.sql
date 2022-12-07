SET search_path to ticketchema;

DROP VIEW IF EXISTS Buy CASCADE;
DROP VIEW IF EXISTS BuyMax CASCADE;

/*
Buy is how number of ticket bought for each username
*/
CREATE VIEW Buy AS
Select count(*) as c, p.username
From Purchase p
Group By p.username;

/*
BuyMax gives max number of ticket bought among every user
*/
CREATE VIEW BuyMax AS
Select max(b.c) as m
From Buy b;

/*
username is the person's username who has purchased the most tickets
*/

Select b1.username 
From Buy b1, BuyMax b2
Where b1.c = b2.m