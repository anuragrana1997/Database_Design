-- =============================================
-- DATA POPULATION SCRIPTS FOR MYSQL
-- =============================================

-- 1. PERSON Table
INSERT INTO PERSON (person_id, first_name, middle_name, last_name, date_of_birth, gender, address) VALUES
(1, 'John', 'Michael', 'Smith', '1985-03-15', 'Male', '123 Main St, Dallas, TX 75201'),
(2, 'Sarah', 'Jane', 'Johnson', '1990-07-22', 'Female', '456 Oak Ave, Dallas, TX 75202'),
(3, 'Michael', 'Robert', 'Williams', '1988-11-30', 'Male', '789 Pine Rd, Dallas, TX 75203'),
(4, 'Emily', 'Grace', 'Brown', '1992-05-18', 'Female', '321 Elm St, Dallas, TX 75204'),
(5, 'David', 'James', 'Jones', '1987-09-25', 'Male', '654 Maple Dr, Dallas, TX 75205'),
(6, 'Jennifer', 'Marie', 'Garcia', '1991-12-10', 'Female', '987 Cedar Ln, Dallas, TX 75206'),
(7, 'Christopher', 'Lee', 'Martinez', '1989-04-08', 'Male', '147 Birch Ave, Dallas, TX 75207'),
(8, 'Jessica', 'Ann', 'Rodriguez', '1993-08-14', 'Female', '258 Walnut St, Dallas, TX 75208'),
(9, 'Matthew', 'Thomas', 'Wilson', '1986-02-20', 'Male', '369 Spruce Rd, Dallas, TX 75209'),
(10, 'Ashley', 'Nicole', 'Anderson', '1994-06-05', 'Female', '741 Hickory Dr, Dallas, TX 75210'),
(11, 'Daniel', 'Patrick', 'Taylor', '1985-10-12', 'Male', '852 Ash Ave, Dallas, TX 75211'),
(12, 'Amanda', 'Lynn', 'Thomas', '1991-03-28', 'Female', '963 Poplar St, Dallas, TX 75212'),
(13, 'Joshua', 'Ryan', 'Moore', '1988-07-16', 'Male', '159 Willow Ln, Dallas, TX 75213'),
(14, 'Melissa', 'Dawn', 'Jackson', '1992-11-23', 'Female', '357 Sycamore Dr, Dallas, TX 75214'),
(15, 'Andrew', 'Scott', 'Martin', '1987-01-09', 'Male', '486 Magnolia Ave, Dallas, TX 75215'),
(16, 'Stephanie', 'Rose', 'Lee', '1993-05-31', 'Female', '624 Dogwood St, Dallas, TX 75216'),
(17, 'Ryan', 'Joseph', 'Perez', '1989-09-17', 'Male', '735 Redwood Rd, Dallas, TX 75217'),
(18, 'Nicole', 'Michelle', 'White', '1990-12-04', 'Female', '846 Cypress Ln, Dallas, TX 75218'),
(19, 'Brandon', 'Keith', 'Harris', '1986-04-21', 'Male', '957 Laurel Dr, Dallas, TX 75219'),
(20, 'Rebecca', 'Elizabeth', 'Clark', '1994-08-07', 'Female', '168 Beech Ave, Dallas, TX 75220'),
(21, 'Kevin', 'Paul', 'Lewis', '1988-02-14', 'Male', '279 Fir St, Dallas, TX 75221'),
(22, 'Laura', 'Christine', 'Robinson', '1992-06-19', 'Female', '381 Hemlock Rd, Dallas, TX 75222'),
(23, 'Jason', 'Alexander', 'Walker', '1987-10-26', 'Male', '492 Juniper Ln, Dallas, TX 75223'),
(24, 'Michelle', 'Renee', 'Young', '1991-01-13', 'Female', '513 Alder Dr, Dallas, TX 75224'),
(25, 'Justin', 'Daniel', 'Allen', '1989-05-30', 'Male', '624 Locust Ave, Dallas, TX 75225'),
(26, 'Kimberly', 'Sue', 'King', '1993-09-08', 'Female', '735 Chestnut St, Dallas, TX 75226'),
(27, 'Timothy', 'Mark', 'Wright', '1985-12-15', 'Male', '846 Cottonwood Rd, Dallas, TX 75227'),
(28, 'Heather', 'Joy', 'Lopez', '1990-03-22', 'Female', '957 Sequoia Ln, Dallas, TX 75228'),
(29, 'Eric', 'William', 'Hill', '1988-07-29', 'Male', '168 Acacia Dr, Dallas, TX 75229'),
(30, 'Rachel', 'Marie', 'Scott', '1992-11-06', 'Female', '279 Eucalyptus Ave, Dallas, TX 75230');

-- 2. PERSON_PHONE Table
INSERT INTO PERSON_PHONE (person_id, phone_number) VALUES
(1, '214-555-0101'), (1, '214-555-0102'),
(2, '214-555-0201'), (3, '214-555-0301'),
(4, '214-555-0401'), (5, '214-555-0501'),
(6, '214-555-0601'), (7, '214-555-0701'),
(8, '214-555-0801'), (9, '214-555-0901'),
(10, '214-555-1001'), (11, '214-555-1101'),
(12, '214-555-1201'), (13, '214-555-1301'),
(14, '214-555-1401'), (15, '214-555-1501'),
(16, '214-555-1601'), (17, '214-555-1701'),
(18, '214-555-1801'), (19, '214-555-1901'),
(20, '214-555-2001'), (21, '214-555-2101'),
(22, '214-555-2201'), (23, '214-555-2301'),
(24, '214-555-2401'), (25, '214-555-2501'),
(26, '214-555-2601'), (27, '214-555-2701'),
(28, '214-555-2801'), (29, '214-555-2901'),
(30, '214-555-3001');

-- 3. EMPLOYEE Table (persons 1-10 are employees)
INSERT INTO EMPLOYEE (person_id, employee_start_date, employee_type) VALUES
(1, '2023-01-15', 'LIBRARY_SUPERVISOR'),
(2, '2023-02-20', 'LIBRARY_SUPERVISOR'),
(3, '2023-03-10', 'CATALOGING_MANAGER'),
(4, '2023-04-05', 'CATALOGING_MANAGER'),
(5, '2023-05-12', 'RECEPTIONIST'),
(6, '2023-06-18', 'RECEPTIONIST'),
(7, '2023-07-22', 'RECEPTIONIST'),
(8, '2024-10-15', 'RECEPTIONIST'),
(9, '2024-11-01', 'LIBRARY_SUPERVISOR'),
(10, '2024-11-20', 'CATALOGING_MANAGER');

-- 4. LIBRARY_SUPERVISOR Table
INSERT INTO LIBRARY_SUPERVISOR (person_id) VALUES
(1), (2), (9);

-- 5. CATALOGING_MANAGER Table
INSERT INTO CATALOGING_MANAGER (person_id) VALUES
(3), (4), (10);

-- 6. RECEPTIONIST Table
INSERT INTO RECEPTIONIST (person_id) VALUES
(5), (6), (7), (8);

-- 7. TRAINING Table
INSERT INTO TRAINING (trainer_id, trainee_id, training_date) VALUES
(1, 5, '2023-05-15'),
(1, 6, '2023-06-20'),
(2, 7, '2023-07-25'),
(3, 5, '2023-06-01'),
(4, 6, '2023-07-01'),
(1, 8, '2024-10-20'),
(2, 8, '2024-11-05');

-- 8. MEMBER Table (persons 11-30 are members)
INSERT INTO MEMBER (card_id, person_id, issue_date, membership_level) VALUES
(1001, 11, '2023-01-10', 'GOLD'),
(1002, 12, '2023-02-15', 'GOLD'),
(1003, 13, '2023-03-20', 'GOLD'),
(1004, 14, '2023-04-25', 'GOLD'),
(1005, 15, '2023-05-30', 'GOLD'),
(1006, 16, '2023-06-10', 'SILVER'),
(1007, 17, '2023-07-15', 'SILVER'),
(1008, 18, '2023-08-20', 'SILVER'),
(1009, 19, '2023-09-25', 'SILVER'),
(1010, 20, '2023-10-30', 'SILVER'),
(1011, 21, '2023-11-05', 'GOLD'),
(1012, 22, '2023-12-10', 'GOLD'),
(1013, 23, '2024-01-15', 'SILVER'),
(1014, 24, '2024-02-20', 'SILVER'),
(1015, 25, '2024-03-25', 'GOLD'),
(1016, 26, '2024-04-30', 'SILVER'),
(1017, 27, '2024-05-05', 'GOLD'),
(1018, 28, '2024-06-10', 'SILVER'),
(1019, 29, '2024-07-15', 'GOLD'),
(1020, 30, '2024-08-20', 'SILVER'),
-- Some employees are also members
(1021, 5, '2023-06-01', 'GOLD'),
(1022, 6, '2023-07-01', 'SILVER');

-- 9. GOLD_MEMBER Table
INSERT INTO GOLD_MEMBER (card_id) VALUES
(1001), (1002), (1003), (1004), (1005),
(1011), (1012), (1015), (1017), (1019), (1021);

-- 10. SILVER_MEMBER Table
INSERT INTO SILVER_MEMBER (card_id) VALUES
(1006), (1007), (1008), (1009), (1010),
(1013), (1014), (1016), (1018), (1020), (1022);

-- 11. GUEST Table
INSERT INTO GUEST (card_id, guest_id, guest_name, guest_address, guest_contact) VALUES
(1001, 1, 'Alice Cooper', '100 Guest St, Dallas, TX', '214-555-9001'),
(1001, 2, 'Bob Dylan', '101 Guest St, Dallas, TX', '214-555-9002'),
(1001, 3, 'Charlie Brown', '102 Guest St, Dallas, TX', '214-555-9003'),
(1002, 1, 'Diana Ross', '103 Guest St, Dallas, TX', '214-555-9004'),
(1002, 2, 'Edward Norton', '104 Guest St, Dallas, TX', '214-555-9005'),
(1003, 1, 'Fiona Apple', '105 Guest St, Dallas, TX', '214-555-9006'),
(1004, 1, 'George Martin', '106 Guest St, Dallas, TX', '214-555-9007'),
(1005, 1, 'Helen Mirren', '107 Guest St, Dallas, TX', '214-555-9008'),
(1011, 1, 'Ian McKellen', '108 Guest St, Dallas, TX', '214-555-9009'),
(1012, 1, 'Julia Roberts', '109 Guest St, Dallas, TX', '214-555-9010');

-- 12. PROMOTION Table
INSERT INTO PROMOTION (promo_code, promo_description) VALUES
('SUMMER2023', 'Summer Reading Program - 20% off late fees'),
('WINTER2023', 'Winter Book Festival - Free guest passes'),
('SPRING2024', 'Spring into Reading - Extra borrowing time'),
('FALL2024', 'Fall Favorites - Priority book reservations'),
('NEWMEMBER', 'New Member Welcome - First month free'),
('STUDENT2024', 'Student Discount - 15% off membership'),
('SENIOR2024', 'Senior Citizen Special - Extended due dates'),
('FAMILY2024', 'Family Package - Multiple guest passes');

-- 13. MEMBER_PROMOTION Table
INSERT INTO MEMBER_PROMOTION (card_id, promo_code) VALUES
(1001, 'SUMMER2023'), (1001, 'WINTER2023'),
(1002, 'SUMMER2023'), (1003, 'FALL2024'),
(1004, 'SPRING2024'), (1005, 'WINTER2023'),
(1006, 'NEWMEMBER'), (1007, 'STUDENT2024'),
(1008, 'SENIOR2024'), (1009, 'FAMILY2024'),
(1010, 'SUMMER2023'), (1011, 'FALL2024'),
(1012, 'SPRING2024'), (1013, 'NEWMEMBER'),
(1014, 'STUDENT2024'), (1015, 'WINTER2023');

-- 14. PUBLISHER Table
INSERT INTO PUBLISHER (publisher_id, publisher_name, publisher_info) VALUES
(1, 'Penguin Random House', 'Leading global trade book publisher'),
(2, 'HarperCollins', 'Second largest consumer book publisher'),
(3, 'Simon & Schuster', 'Major American publishing company'),
(4, 'Hachette Book Group', 'Third largest publisher in US'),
(5, 'Macmillan Publishers', 'British publishing company'),
(6, 'Scholastic Corporation', 'American multinational publishing company'),
(7, 'Pearson Education', 'Educational publishing and services'),
(8, 'Oxford University Press', 'University press of the University of Oxford'),
(9, 'Cambridge University Press', 'Publishing business of the University of Cambridge'),
(10, 'Wiley', 'Global publishing company specializing in academic publishing');

-- 15. AUTHOR Table
INSERT INTO AUTHOR (author_id, author_name, author_info) VALUES
(1, 'J.K. Rowling', 'British author, best known for Harry Potter series'),
(2, 'Stephen King', 'American author of horror, supernatural fiction'),
(3, 'Agatha Christie', 'English writer known for detective novels'),
(4, 'Dan Brown', 'American author of thriller fiction'),
(5, 'John Grisham', 'American novelist and attorney'),
(6, 'Nora Roberts', 'American author of romance novels'),
(7, 'James Patterson', 'American author and philanthropist'),
(8, 'Michael Crichton', 'American author and filmmaker'),
(9, 'Margaret Atwood', 'Canadian poet, novelist, and essayist'),
(10, 'George R.R. Martin', 'American novelist and short story writer'),
(11, 'Neil Gaiman', 'English author of fantasy works'),
(12, 'Suzanne Collins', 'American television writer and author'),
(13, 'Rick Riordan', 'American author of fantasy-adventure novels'),
(14, 'Gillian Flynn', 'American author and critic'),
(15, 'Haruki Murakami', 'Japanese writer and translator');

-- 16. BOOK Table
INSERT INTO BOOK (book_id, title, category, publisher_id, publication_year) VALUES
(1, 'Harry Potter and the Philosopher''s Stone', 'Cate1', 1, 1997),
(2, 'The Shining', 'Cate2', 2, 1977),
(3, 'Murder on the Orient Express', 'Cate2', 3, 1934),
(4, 'The Da Vinci Code', 'Cate2', 2, 2003),
(5, 'A Time to Kill', 'Cate2', 2, 1989),
(6, 'Vision in White', 'Cate1', 1, 2009),
(7, 'Along Came a Spider', 'Cate2', 4, 1993),
(8, 'Jurassic Park', 'Cate3', 5, 1990),
(9, 'The Handmaid''s Tale', 'Cate1', 4, 1985),
(10, 'A Game of Thrones', 'Cate1', 1, 1996),
(11, 'American Gods', 'Cate1', 3, 2001),
(12, 'The Hunger Games', 'Cate1', 6, 2008),
(13, 'Percy Jackson: The Lightning Thief', 'Cate1', 6, 2005),
(14, 'Gone Girl', 'Cate2', 2, 2012),
(15, 'Norwegian Wood', 'Cate1', 7, 1987),
(16, 'Harry Potter and the Chamber of Secrets', 'Cate1', 1, 1998),
(17, 'It', 'Cate2', 2, 1986),
(18, 'And Then There Were None', 'Cate2', 3, 1939),
(19, 'Angels & Demons', 'Cate2', 2, 2000),
(20, 'The Firm', 'Cate2', 2, 1991),
(21, 'The Lost Continent', 'Cate3', 8, 1995),
(22, 'Timeline', 'Cate3', 5, 1999),
(23, 'Oryx and Crake', 'Cate3', 4, 2003),
(24, 'A Clash of Kings', 'Cate1', 1, 1998),
(25, 'Coraline', 'Cate1', 3, 2002),
(26, 'Catching Fire', 'Cate1', 6, 2009),
(27, 'The Sea of Monsters', 'Cate1', 6, 2006),
(28, 'Dark Places', 'Cate2', 2, 2009),
(29, 'Kafka on the Shore', 'Cate1', 7, 2002),
(30, '1984', 'Cate3', 8, 1949);

-- 17. BOOK_AUTHOR Table
INSERT INTO BOOK_AUTHOR (book_id, author_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 1), (17, 2), (18, 3), (19, 4), (20, 5),
(21, 8), (22, 8), (23, 9), (24, 10), (25, 11),
(26, 12), (27, 13), (28, 14), (29, 15), (30, 9);

-- 18. BOOK_COMMENT Table
INSERT INTO BOOK_COMMENT (comment_id, person_id, book_id, comment_time, rating, comment_content) VALUES
(1, 11, 1, '2024-01-15', 5, 'Absolutely magical! A timeless classic.'),
(2, 12, 1, '2024-02-20', 5, 'Best book series ever written!'),
(3, 13, 2, '2024-03-10', 4, 'Terrifying and gripping. Classic King.'),
(4, 14, 3, '2024-04-05', 5, 'Masterpiece of mystery writing.'),
(5, 15, 4, '2024-05-12', 4, 'Page-turner with fascinating historical elements.'),
(6, 16, 5, '2024-06-18', 4, 'Compelling legal thriller.'),
(7, 17, 6, '2024-07-22', 5, 'Beautiful romance story.'),
(8, 18, 7, '2024-08-14', 4, 'Great detective thriller.'),
(9, 19, 8, '2024-09-20', 5, 'Brilliant sci-fi adventure!'),
(10, 20, 9, '2024-10-05', 5, 'Powerful and thought-provoking.'),
(11, 21, 10, '2024-11-12', 5, 'Epic fantasy at its finest!'),
(12, 22, 11, '2024-11-20', 4, 'Imaginative and beautifully written.'),
(13, 23, 12, '2024-11-25', 5, 'Intense and captivating dystopian tale.'),
(14, 24, 13, '2024-12-01', 5, 'Perfect for young readers!'),
(15, 25, 14, '2024-12-05', 4, 'Twisted and unpredictable.'),
(16, 11, 10, '2024-11-15', 5, 'Cannot wait for the next book!'),
(17, 12, 12, '2024-11-22', 5, 'Addictive reading!'),
(18, 13, 8, '2024-11-28', 5, 'Dinosaurs done right!'),
(19, 14, 4, '2024-12-02', 4, 'Mystery and art history combined perfectly.'),
(20, 15, 1, '2024-12-06', 5, 'Read it for the 10th time, still amazing!');

-- 19. BORROWING Table (including recent activity for testing queries)
INSERT INTO BORROWING (borrow_id, book_id, borrower_person_id, borrower_card_id, receptionist_person_id, issue_date, due_date, return_date) VALUES
-- Recent borrowings (within past month) for gold members
(1, 1, 11, 1001, 5, DATE_SUB(CURDATE(), INTERVAL 5 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 5 DAY), INTERVAL 14 DAY), NULL),
(2, 2, 11, 1001, 5, DATE_SUB(CURDATE(), INTERVAL 10 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 10 DAY), INTERVAL 14 DAY), NULL),
(3, 3, 11, 1001, 6, DATE_SUB(CURDATE(), INTERVAL 15 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 15 DAY), INTERVAL 14 DAY), NULL),
(4, 4, 11, 1001, 6, DATE_SUB(CURDATE(), INTERVAL 20 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 20 DAY), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 5 DAY)),
(5, 5, 11, 1001, 7, DATE_SUB(CURDATE(), INTERVAL 22 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 22 DAY), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 7 DAY)),
(6, 6, 11, 1001, 7, DATE_SUB(CURDATE(), INTERVAL 25 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 25 DAY), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 10 DAY)),
(7, 7, 11, 1001, 8, DATE_SUB(CURDATE(), INTERVAL 28 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 28 DAY), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 13 DAY)),

-- More gold members borrowing
(8, 8, 12, 1002, 5, DATE_SUB(CURDATE(), INTERVAL 3 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 3 DAY), INTERVAL 14 DAY), NULL),
(9, 9, 12, 1002, 5, DATE_SUB(CURDATE(), INTERVAL 8 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 8 DAY), INTERVAL 14 DAY), NULL),
(10, 10, 12, 1002, 6, DATE_SUB(CURDATE(), INTERVAL 12 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 12 DAY), INTERVAL 14 DAY), NULL),
(11, 11, 12, 1002, 6, DATE_SUB(CURDATE(), INTERVAL 18 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 18 DAY), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 3 DAY)),
(12, 12, 12, 1002, 7, DATE_SUB(CURDATE(), INTERVAL 23 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 23 DAY), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 8 DAY)),
(13, 13, 12, 1002, 7, DATE_SUB(CURDATE(), INTERVAL 26 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 26 DAY), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 11 DAY)),

-- Silver members borrowing throughout the year
(14, 14, 16, 1006, 5, DATE_SUB(CURDATE(), INTERVAL 1 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 25 DAY)),
(15, 15, 16, 1006, 5, DATE_SUB(CURDATE(), INTERVAL 2 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 55 DAY)),
(16, 16, 16, 1006, 6, DATE_SUB(CURDATE(), INTERVAL 3 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 3 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 85 DAY)),
(17, 17, 16, 1006, 6, DATE_SUB(CURDATE(), INTERVAL 4 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 4 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 115 DAY)),
(18, 18, 16, 1006, 7, DATE_SUB(CURDATE(), INTERVAL 5 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 5 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 145 DAY)),
(19, 19, 16, 1006, 7, DATE_SUB(CURDATE(), INTERVAL 6 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 6 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 175 DAY)),
(20, 20, 16, 1006, 8, DATE_SUB(CURDATE(), INTERVAL 7 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 7 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 205 DAY)),
(21, 21, 16, 1006, 8, DATE_SUB(CURDATE(), INTERVAL 8 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 8 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 235 DAY)),
(22, 22, 16, 1006, 5, DATE_SUB(CURDATE(), INTERVAL 9 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 9 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 265 DAY)),
(23, 23, 16, 1006, 5, DATE_SUB(CURDATE(), INTERVAL 10 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 10 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 295 DAY)),
(24, 24, 16, 1006, 6, DATE_SUB(CURDATE(), INTERVAL 11 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 11 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 325 DAY)),
(25, 25, 16, 1006, 6, DATE_SUB(CURDATE(), INTERVAL 12 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 12 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 355 DAY)),

-- Popular books (book_id 1 and 10 are most popular in last 12 months)
(26, 1, 13, 1003, 5, DATE_SUB(CURDATE(), INTERVAL 2 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 50 DAY)),
(27, 1, 14, 1004, 5, DATE_SUB(CURDATE(), INTERVAL 3 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 3 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 80 DAY)),
(28, 1, 15, 1005, 6, DATE_SUB(CURDATE(), INTERVAL 4 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 4 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 110 DAY)),
(29, 1, 17, 1007, 6, DATE_SUB(CURDATE(), INTERVAL 5 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 5 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 140 DAY)),
(30, 1, 18, 1008, 7, DATE_SUB(CURDATE(), INTERVAL 6 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 6 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 170 DAY)),

(31, 10, 19, 1009, 7, DATE_SUB(CURDATE(), INTERVAL 2 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 45 DAY)),
(32, 10, 20, 1010, 8, DATE_SUB(CURDATE(), INTERVAL 3 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 3 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 75 DAY)),
(33, 10, 21, 1011, 8, DATE_SUB(CURDATE(), INTERVAL 4 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 4 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 105 DAY)),
(34, 10, 22, 1012, 5, DATE_SUB(CURDATE(), INTERVAL 5 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 5 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 135 DAY)),
(35, 10, 23, 1013, 5, DATE_SUB(CURDATE(), INTERVAL 6 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 6 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 165 DAY)),

-- Books not borrowed in last 5 months
(36, 26, 24, 1014, 6, DATE_SUB(CURDATE(), INTERVAL 6 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 6 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 160 DAY)),
(37, 27, 25, 1015, 6, DATE_SUB(CURDATE(), INTERVAL 7 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 7 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 190 DAY)),
(38, 28, 26, 1016, 7, DATE_SUB(CURDATE(), INTERVAL 8 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 8 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 220 DAY)),
(39, 29, 27, 1017, 7, DATE_SUB(CURDATE(), INTERVAL 9 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 9 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 250 DAY)),
(40, 30, 28, 1018, 8, DATE_SUB(CURDATE(), INTERVAL 10 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 10 MONTH), INTERVAL 14 DAY), DATE_SUB(CURDATE(), INTERVAL 280 DAY)),

-- Employees who are also members borrowing books in past month
(41, 2, 5, 1021, 6, DATE_SUB(CURDATE(), INTERVAL 5 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 5 DAY), INTERVAL 14 DAY), NULL),
(42, 3, 5, 1021, 6, DATE_SUB(CURDATE(), INTERVAL 10 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 10 DAY), INTERVAL 14 DAY), NULL),
(43, 4, 6, 1022, 7, DATE_SUB(CURDATE(), INTERVAL 8 DAY), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 8 DAY), INTERVAL 14 DAY), NULL),

-- Additional historical borrowings
(44, 5, 29, 1019, 5, '2023-05-15', '2023-05-29', '2023-05-28'),
(45, 6, 30, 1020, 5, '2023-06-20', '2023-07-04', '2023-07-03'),
(46, 7, 11, 1001, 6, '2023-07-15', '2023-07-29', '2023-07-28'),
(47, 8, 12, 1002, 6, '2023-08-10', '2023-08-24', '2023-08-23'),
(48, 9, 13, 1003, 7, '2023-09-05', '2023-09-19', '2023-09-18'),
(49, 10, 14, 1004, 7, '2023-10-12', '2023-10-26', '2023-10-25'),
(50, 11, 15, 1005, 8, '2023-11-08', '2023-11-22', '2023-11-21');

-- 20. PAYMENT Table
INSERT INTO PAYMENT (payment_id, borrow_id, payment_method, payment_time, amount_paid) VALUES
(1, 4, 'Credit Card', DATE_SUB(CURDATE(), INTERVAL 5 DAY), 5.00),
(2, 5, 'Cash', DATE_SUB(CURDATE(), INTERVAL 7 DAY), 5.00),
(3, 6, 'Credit Card', DATE_SUB(CURDATE(), INTERVAL 10 DAY), 5.00),
(4, 7, 'Debit Card', DATE_SUB(CURDATE(), INTERVAL 13 DAY), 5.00),
(5, 11, 'Cash', DATE_SUB(CURDATE(), INTERVAL 3 DAY), 5.00),
(6, 12, 'Credit Card', DATE_SUB(CURDATE(), INTERVAL 8 DAY), 5.00),
(7, 13, 'Credit Card', DATE_SUB(CURDATE(), INTERVAL 11 DAY), 5.00),
(8, 14, 'Cash', DATE_SUB(CURDATE(), INTERVAL 25 DAY), 0.00),
(9, 15, 'Debit Card', DATE_SUB(CURDATE(), INTERVAL 55 DAY), 0.00),
(10, 16, 'Credit Card', DATE_SUB(CURDATE(), INTERVAL 85 DAY), 2.50);

-- 21. INQUIRY Table
INSERT INTO INQUIRY (inquiry_id, member_card_id, person_id, receptionist_person_id, inquiry_time, resolution_status, inquiry_rating) VALUES
-- Recent inquiries (past month) for receptionist 5
(1, 1001, 11, 5, DATE_SUB(CURDATE(), INTERVAL 2 DAY), 'Resolved', 5),
(2, 1002, 12, 5, DATE_SUB(CURDATE(), INTERVAL 5 DAY), 'Resolved', 5),
(3, 1003, 13, 5, DATE_SUB(CURDATE(), INTERVAL 8 DAY), 'Resolved', 4),
(4, 1004, 14, 5, DATE_SUB(CURDATE(), INTERVAL 12 DAY), 'Resolved', 5),
(5, 1005, 15, 5, DATE_SUB(CURDATE(), INTERVAL 15 DAY), 'Resolved', 4),
(6, 1006, 16, 5, DATE_SUB(CURDATE(), INTERVAL 18 DAY), 'Resolved', 5),
(7, 1007, 17, 5, DATE_SUB(CURDATE(), INTERVAL 22 DAY), 'Resolved', 5),

-- Recent inquiries for receptionist 6
(8, 1008, 18, 6, DATE_SUB(CURDATE(), INTERVAL 3 DAY), 'Resolved', 4),
(9, 1009, 19, 6, DATE_SUB(CURDATE(), INTERVAL 6 DAY), 'Resolved', 5),
(10, 1010, 20, 6, DATE_SUB(CURDATE(), INTERVAL 9 DAY), 'Resolved', 4),
(11, 1011, 21, 6, DATE_SUB(CURDATE(), INTERVAL 13 DAY), 'Resolved', 5),
(12, 1012, 22, 6, DATE_SUB(CURDATE(), INTERVAL 16 DAY), 'Resolved', 4),
(13, 1013, 23, 6, DATE_SUB(CURDATE(), INTERVAL 20 DAY), 'Resolved', 5),
(14, 1014, 24, 6, DATE_SUB(CURDATE(), INTERVAL 24 DAY), 'Resolved', 4),

-- Recent inquiries for receptionist 7
(15, 1015, 25, 7, DATE_SUB(CURDATE(), INTERVAL 4 DAY), 'Resolved', 5),
(16, 1016, 26, 7, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 'Resolved', 4),
(17, 1017, 27, 7, DATE_SUB(CURDATE(), INTERVAL 11 DAY), 'Resolved', 5),
(18, 1018, 28, 7, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 'Resolved', 4),
(19, 1019, 29, 7, DATE_SUB(CURDATE(), INTERVAL 17 DAY), 'Resolved', 5),
(20, 1020, 30, 7, DATE_SUB(CURDATE(), INTERVAL 21 DAY), 'Resolved', 5),

-- Inquiries for past 3 months for receptionist 5 (for query 12)
(21, 1001, 11, 5, DATE_SUB(CURDATE(), INTERVAL 35 DAY), 'Resolved', 4),
(22, 1002, 12, 5, DATE_SUB(CURDATE(), INTERVAL 38 DAY), 'Resolved', 5),
(23, 1003, 13, 5, DATE_SUB(CURDATE(), INTERVAL 42 DAY), 'Resolved', 4),
(24, 1004, 14, 5, DATE_SUB(CURDATE(), INTERVAL 45 DAY), 'Resolved', 5),
(25, 1005, 15, 5, DATE_SUB(CURDATE(), INTERVAL 65 DAY), 'Resolved', 5),
(26, 1006, 16, 5, DATE_SUB(CURDATE(), INTERVAL 68 DAY), 'Resolved', 4),
(27, 1007, 17, 5, DATE_SUB(CURDATE(), INTERVAL 72 DAY), 'Resolved', 5),
(28, 1008, 18, 5, DATE_SUB(CURDATE(), INTERVAL 75 DAY), 'Resolved', 4),

-- Pending/In Progress inquiries
(29, 1009, 19, 6, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'In Progress', NULL),
(30, 1010, 20, 7, DATE_SUB(CURDATE(), INTERVAL 2 DAY), 'Pending', NULL);

-- 22. CATALOGING_ASSIGNMENT Table
INSERT INTO CATALOGING_ASSIGNMENT (assign_date, manager_person_id, category) VALUES
-- Past 4 weeks for manager 3 (all categories each week)
(DATE_SUB(CURDATE(), INTERVAL 2 DAY), 3, 'Cate1'),
(DATE_SUB(CURDATE(), INTERVAL 3 DAY), 3, 'Cate2'),
(DATE_SUB(CURDATE(), INTERVAL 4 DAY), 3, 'Cate3'),
(DATE_SUB(CURDATE(), INTERVAL 9 DAY), 3, 'Cate1'),
(DATE_SUB(CURDATE(), INTERVAL 10 DAY), 3, 'Cate2'),
(DATE_SUB(CURDATE(), INTERVAL 11 DAY), 3, 'Cate3'),
(DATE_SUB(CURDATE(), INTERVAL 16 DAY), 3, 'Cate1'),
(DATE_SUB(CURDATE(), INTERVAL 17 DAY), 3, 'Cate2'),
(DATE_SUB(CURDATE(), INTERVAL 18 DAY), 3, 'Cate3'),
(DATE_SUB(CURDATE(), INTERVAL 23 DAY), 3, 'Cate1'),
(DATE_SUB(CURDATE(), INTERVAL 24 DAY), 3, 'Cate2'),
(DATE_SUB(CURDATE(), INTERVAL 25 DAY), 3, 'Cate3'),

-- Past 4 weeks for manager 4 (missing some categories)
(DATE_SUB(CURDATE(), INTERVAL 1 DAY), 4, 'Cate1'),
(DATE_SUB(CURDATE(), INTERVAL 2 DAY), 4, 'Cate2'),
(DATE_SUB(CURDATE(), INTERVAL 8 DAY), 4, 'Cate1'),
(DATE_SUB(CURDATE(), INTERVAL 9 DAY), 4, 'Cate3'),
(DATE_SUB(CURDATE(), INTERVAL 15 DAY), 4, 'Cate2'),
(DATE_SUB(CURDATE(), INTERVAL 16 DAY), 4, 'Cate3'),
(DATE_SUB(CURDATE(), INTERVAL 22 DAY), 4, 'Cate1'),

-- Past 4 weeks for manager 10 (recent hire, incomplete)
(DATE_SUB(CURDATE(), INTERVAL 1 DAY), 10, 'Cate1'),
(DATE_SUB(CURDATE(), INTERVAL 2 DAY), 10, 'Cate2'),
(DATE_SUB(CURDATE(), INTERVAL 8 DAY), 10, 'Cate1'),

-- Older assignments
(DATE_SUB(CURDATE(), INTERVAL 35 DAY), 3, 'Cate1'),
(DATE_SUB(CURDATE(), INTERVAL 40 DAY), 3, 'Cate2'),
(DATE_SUB(CURDATE(), INTERVAL 45 DAY), 4, 'Cate3'),
(DATE_SUB(CURDATE(), INTERVAL 50 DAY), 4, 'Cate1');

-- =============================================
-- VERIFICATION QUERIES
-- =============================================

-- Check row counts
SELECT 'PERSON' AS table_name, COUNT(*) AS row_count FROM PERSON
UNION ALL SELECT 'PERSON_PHONE', COUNT(*) FROM PERSON_PHONE
UNION ALL SELECT 'EMPLOYEE', COUNT(*) FROM EMPLOYEE
UNION ALL SELECT 'LIBRARY_SUPERVISOR', COUNT(*) FROM LIBRARY_SUPERVISOR
UNION ALL SELECT 'CATALOGING_MANAGER', COUNT(*) FROM CATALOGING_MANAGER
UNION ALL SELECT 'RECEPTIONIST', COUNT(*) FROM RECEPTIONIST
UNION ALL SELECT 'TRAINING', COUNT(*) FROM TRAINING
UNION ALL SELECT 'MEMBER', COUNT(*) FROM MEMBER
UNION ALL SELECT 'GOLD_MEMBER', COUNT(*) FROM GOLD_MEMBER
UNION ALL SELECT 'SILVER_MEMBER', COUNT(*) FROM SILVER_MEMBER
UNION ALL SELECT 'GUEST', COUNT(*) FROM GUEST
UNION ALL SELECT 'PROMOTION', COUNT(*) FROM PROMOTION
UNION ALL SELECT 'MEMBER_PROMOTION', COUNT(*) FROM MEMBER_PROMOTION
UNION ALL SELECT 'PUBLISHER', COUNT(*) FROM PUBLISHER
UNION ALL SELECT 'AUTHOR', COUNT(*) FROM AUTHOR
UNION ALL SELECT 'BOOK', COUNT(*) FROM BOOK
UNION ALL SELECT 'BOOK_AUTHOR', COUNT(*) FROM BOOK_AUTHOR
UNION ALL SELECT 'BOOK_COMMENT', COUNT(*) FROM BOOK_COMMENT
UNION ALL SELECT 'BORROWING', COUNT(*) FROM BORROWING
UNION ALL SELECT 'PAYMENT', COUNT(*) FROM PAYMENT
UNION ALL SELECT 'INQUIRY', COUNT(*) FROM INQUIRY
UNION ALL SELECT 'CATALOGING_ASSIGNMENT', COUNT(*) FROM CATALOGING_ASSIGNMENT;