INSERT INTO Owner(owner_id, owner_name, phone_number) VALUES
    (1, 'Corporation of Massey Hall and Roy Thomson Hall', 123456),
    (2, 'Maple Leaf Sports & Entertainment', 223456);

INSERT INTO Venue(venue_id, venue_name, city, street_address, owner_id) VALUES
    (1, 'Massey Hall', 'Toronto', '178 Victoria Street', 1),
    (2, 'Roy Thomson Hall', 'Toronto', '60 Simcoe St', 1),
    (3, 'ScotiaBank Arena', 'Toronto', '40 Bay St', 2);

INSERT INTO Section(section_id, section_name, venue_id) VALUES
    (1, 'floor', 1),
    (2, 'balcony', 1),
    (3, 'main hall', 2),
    (4, '100', 3),
    (5, '200', 3),
    (6, '300', 3);


INSERT INTO Seat(seat_id, accessible, section_id, seat_name) VALUES
    (1, true, 1, 'A1'),
    (2, true, 1, 'A2'),
    (3, true, 1, 'A3'),
    (4, false, 1, 'A4'),
    (5, false, 1, 'A5'),
    (6, false, 1, 'A6'),
    (7, false, 1, 'A7'),
    (8, true, 1, 'A8'),
    (9, true, 1, 'A9'),
    (10, true, 1, 'A10'),
    (11, false, 2, 'C1'),
    (12, false, 2, 'C2'),
    (13, false, 2, 'C3'),
    (14, false, 2, 'C4'),
    (15, false, 2, 'C5'),
    (16, false, 3, 'AA1'),
    (17, false, 3, 'AA2'),
    (18, false, 3, 'AA3'),
    (19, false, 3, 'BB1'),
    (20, false, 3, 'BB2'),
    (21, false, 3, 'BB3'),
    (22, false, 3, 'BB4'),
    (23, false, 3, 'BB5'),
    (24, false, 3, 'BB6'),
    (25, false, 3, 'BB7'),
    (26, false, 3, 'BB8'),
    (27, false, 3, 'CC1'),
    (28, false, 3, 'CC2'),
    (29, false, 3, 'CC3'),
    (30, false, 3, 'CC4'),
    (31, false, 3, 'CC5'),
    (32, false, 3, 'CC6'),
    (33, false, 3, 'CC7'),
    (34, false, 3, 'CC8'),
    (35, false, 3, 'CC9'),
    (36, false, 3, 'CC10'),
    (37, true, 4, 'row 1, seat 1'),
    (38, true, 4, 'row 1, seat 2'),
    (39, true, 4, 'row 1, seat 3'),
    (40, true, 4, 'row 1, seat 4'),
    (41, true, 4, 'row 1, seat 5'),
    (42, true, 4, 'row 2, seat 1'),
    (43, true, 4, 'row 2, seat 2'),
    (44, true, 4, 'row 2, seat 3'),
    (45, true, 4, 'row 2, seat 4'),
    (46, true, 4, 'row 2, seat 5'),
    (47, false, 5, 'row 1, seat 1'),
    (48, false, 5, 'row 1, seat 2'),
    (49, false, 5, 'row 1, seat 3'),
    (50, false, 5, 'row 1, seat 4'),
    (51, false, 5, 'row 1, seat 5'),
    (52, false, 5, 'row 2, seat 1'),
    (53, false, 5, 'row 2, seat 2'),
    (54, false, 5, 'row 2, seat 3'),
    (55, false, 5, 'row 2, seat 4'),
    (56, false, 5, 'row 2, seat 5'),
    (57, false, 6, 'row 1, seat 1'),
    (58, false, 6, 'row 1, seat 2'),
    (59, false, 6, 'row 1, seat 3'),
    (60, false, 6, 'row 1, seat 4'),
    (61, false, 6, 'row 1, seat 5'),
    (62, false, 6, 'row 2, seat 1'),
    (63, false, 6, 'row 2, seat 2'),
    (64, false, 6, 'row 2, seat 3'),
    (65, false, 6, 'row 2, seat 4'),
    (66, false, 6, 'row 2, seat 5'),
    (67, false, 1, 'B1'),
    (68, false, 1, 'B2'),
    (69, false, 1, 'B3'),
    (70, false, 1, 'B4'),
    (71, false, 1, 'B5'),
    (72, false, 1, 'B6'),
    (73, false, 1, 'B7'),
    (74, false, 1, 'B8'),
    (75, false, 1, 'B9'),
    (76, false, 1, 'B10');

INSERT INTO Concert(concert_id, concert_name, datetime, venue_id) VALUES
    (1, 'Ron Sexsmith', '2022-12-03 19:30', 1),
    (2, 'Women s Blues Review', '2022-11-25 20:00', 1),
    (3, 'Mariah Carey - Merry Christmas', '2022-12-09 20:00', 3),
    (4, 'Mariah Carey - Merry Christmas', '2022-12-11 20:00', 3),
    (5, 'TSO - Elf', '2022-12-09 19:30', 2),
    (6, 'TSO - Elf', '2022-12-10 14:30', 2),
    (7, 'TSO - Elf', '2022-12-10 19:30', 2);

INSERT INTO PriceInfo(price_id, price, datetime, section_id) VALUES
    (1, 130, '2022-12-03 19:30', 1),
    (2, 99, '2022-12-03 19:30', 2),
    (3, 150, '2022-11-25 20:00', 1),
    (4, 125, '2022-11-25 20:00', 2),
    (5, 986, '2022-12-09 20:00', 4),
    (6, 244, '2022-12-09 20:00', 5),
    (7, 176, '2022-12-09 20:00', 6),
    (8, 936, '2022-12-11 20:00', 4),
    (9, 194, '2022-12-11 20:00', 5),
    (10, 126, '2022-12-11 20:00', 6),
    (11, 159, '2022-12-10 19:30', 3);
    
INSERT INTO User1(username) VALUES
    ('ahightower'),
    ('d_targaryen'),
    ('cristonc');

INSERT INTO Purchase(ticket_id, username, seat_name, section_id, concert_id) VALUES
    (1, 'ahightower', 'A5', 1, 2),
    (2, 'ahightower', 'C2', 2, 2),
    (3, 'd_targaryen', 'B3', 1, 1),
    (4, 'd_targaryen', 'BB7', 3, 7),
    (5, 'cristonc', 'row 1, seat 3', 4, 3),
    (6, 'cristonc', 'row 2, seat 3', 5, 4),
    (7, 'cristonc', 'row 2, seat 4', 5, 4);
