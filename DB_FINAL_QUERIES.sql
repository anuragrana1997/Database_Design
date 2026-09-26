-- =============================================
-- TABLE CREATION STATEMENTS FOR MYSQL
-- =============================================

-- 1. PERSON and Phones
CREATE TABLE PERSON (
    person_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE DEFAULT (CURRENT_DATE) NOT NULL,
    gender VARCHAR(10),
    address VARCHAR(400)
);

CREATE TABLE PERSON_PHONE (
    person_id INT NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    CONSTRAINT pk_person_phone PRIMARY KEY (person_id, phone_number),
    CONSTRAINT fk_personphone_person FOREIGN KEY (person_id) REFERENCES PERSON(person_id) ON DELETE CASCADE
);

-- 2. EMPLOYEE & ROLE tables
CREATE TABLE EMPLOYEE (
    person_id INT PRIMARY KEY,
    employee_start_date DATE DEFAULT (CURRENT_DATE) NOT NULL,
    employee_type VARCHAR(30) NOT NULL,
    CONSTRAINT fk_employee_person FOREIGN KEY (person_id) REFERENCES PERSON(person_id) ON DELETE CASCADE,
    CONSTRAINT chk_employee_type CHECK (employee_type IN ('LIBRARY_SUPERVISOR','CATALOGING_MANAGER','RECEPTIONIST'))
);

CREATE TABLE LIBRARY_SUPERVISOR (
    person_id INT PRIMARY KEY,
    CONSTRAINT fk_ls_emp FOREIGN KEY (person_id) REFERENCES EMPLOYEE(person_id) ON DELETE CASCADE
);

CREATE TABLE CATALOGING_MANAGER (
    person_id INT PRIMARY KEY,
    CONSTRAINT fk_cm_emp FOREIGN KEY (person_id) REFERENCES EMPLOYEE(person_id) ON DELETE CASCADE
);

CREATE TABLE RECEPTIONIST (
    person_id INT PRIMARY KEY,
    CONSTRAINT fk_r_emp FOREIGN KEY (person_id) REFERENCES EMPLOYEE(person_id) ON DELETE CASCADE
);

-- 3. TRAINING
CREATE TABLE TRAINING (
    trainer_id INT NOT NULL,
    trainee_id INT NOT NULL,
    training_date DATE DEFAULT (CURDATE()),
    CONSTRAINT pk_training PRIMARY KEY (trainer_id, trainee_id, training_date),
    CONSTRAINT fk_training_trainer FOREIGN KEY (trainer_id) REFERENCES EMPLOYEE(person_id),
    CONSTRAINT fk_training_trainee FOREIGN KEY (trainee_id) REFERENCES EMPLOYEE(person_id)
);

-- 4. MEMBER & GOLD/SILVER & GUEST
CREATE TABLE MEMBER (
    card_id INT PRIMARY KEY,
    person_id INT NOT NULL,
    issue_date DATE DEFAULT (CURRENT_DATE) NOT NULL,
    membership_level VARCHAR(10) NOT NULL,
    CONSTRAINT fk_member_person FOREIGN KEY (person_id) REFERENCES PERSON(person_id) ON DELETE CASCADE,
    CONSTRAINT chk_member_level CHECK (membership_level IN ('SILVER','GOLD'))
);

CREATE TABLE GOLD_MEMBER (
    card_id INT PRIMARY KEY,
    CONSTRAINT fk_gold_member FOREIGN KEY (card_id) REFERENCES MEMBER(card_id) ON DELETE CASCADE
);

CREATE TABLE SILVER_MEMBER (
    card_id INT PRIMARY KEY,
    CONSTRAINT fk_silver_member FOREIGN KEY (card_id) REFERENCES MEMBER(card_id) ON DELETE CASCADE
);

CREATE TABLE GUEST (
    card_id INT NOT NULL,
    guest_id INT NOT NULL,
    guest_name VARCHAR(200),
    guest_address VARCHAR(400),
    guest_contact VARCHAR(50),
    CONSTRAINT pk_guest PRIMARY KEY (card_id, guest_id),
    CONSTRAINT fk_guest_member FOREIGN KEY (card_id) REFERENCES MEMBER(card_id) ON DELETE CASCADE
);

-- 5. PROMOTION
CREATE TABLE PROMOTION (
    promo_code VARCHAR(20) PRIMARY KEY,
    promo_description VARCHAR(400)
);

CREATE TABLE MEMBER_PROMOTION (
    card_id INT NOT NULL,
    promo_code VARCHAR(20) NOT NULL,
    CONSTRAINT pk_member_promo PRIMARY KEY (card_id, promo_code),
    CONSTRAINT fk_mpromo_card FOREIGN KEY (card_id) REFERENCES MEMBER(card_id) ON DELETE CASCADE,
    CONSTRAINT fk_mpromo_promo FOREIGN KEY (promo_code) REFERENCES PROMOTION(promo_code)
);

-- 6. PUBLISHER, AUTHOR, BOOK, BOOK_AUTHOR
CREATE TABLE PUBLISHER (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(200) NOT NULL,
    publisher_info VARCHAR(400)
);

CREATE TABLE AUTHOR (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(200) NOT NULL,
    author_info VARCHAR(400)
);

CREATE TABLE BOOK (
    book_id INT PRIMARY KEY,
    title VARCHAR(400) NOT NULL,
    category VARCHAR(10) NOT NULL,
    publisher_id INT,
    publication_year INT,
    CONSTRAINT fk_book_publisher FOREIGN KEY (publisher_id) REFERENCES PUBLISHER(publisher_id),
    CONSTRAINT chk_book_category CHECK (category IN ('Cate1','Cate2','Cate3'))
);

CREATE TABLE BOOK_AUTHOR (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    CONSTRAINT pk_book_author PRIMARY KEY (book_id, author_id),
    CONSTRAINT fk_ba_book FOREIGN KEY (book_id) REFERENCES BOOK(book_id) ON DELETE CASCADE,
    CONSTRAINT fk_ba_author FOREIGN KEY (author_id) REFERENCES AUTHOR(author_id) ON DELETE CASCADE
);

-- 7. COMMENT
CREATE TABLE BOOK_COMMENT (
    comment_id INT PRIMARY KEY,
    person_id INT NOT NULL,
    book_id INT NOT NULL,
    comment_time DATE DEFAULT (CURDATE()),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment_content VARCHAR(2000),
    CONSTRAINT fk_comment_person FOREIGN KEY (person_id) REFERENCES PERSON(person_id),
    CONSTRAINT fk_comment_book FOREIGN KEY (book_id) REFERENCES BOOK(book_id)
);

-- 8. BORROWING & PAYMENT
CREATE TABLE BORROWING (
    borrow_id INT PRIMARY KEY,
    book_id INT NOT NULL,
    borrower_person_id INT NOT NULL,
    borrower_card_id INT,
    receptionist_person_id INT NOT NULL,
    issue_date DATE DEFAULT (CURRENT_DATE) NOT NULL,
    due_date DATE,
    return_date DATE,
    CONSTRAINT fk_borrow_book FOREIGN KEY (book_id) REFERENCES BOOK(book_id),
    CONSTRAINT fk_borrow_borrower FOREIGN KEY (borrower_person_id) REFERENCES PERSON(person_id),
    CONSTRAINT fk_borrow_recep FOREIGN KEY (receptionist_person_id) REFERENCES RECEPTIONIST(person_id),
    CONSTRAINT fk_borrow_card FOREIGN KEY (borrower_card_id) REFERENCES MEMBER(card_id)
);

CREATE TABLE PAYMENT (
    payment_id INT PRIMARY KEY,
    borrow_id INT UNIQUE,
    payment_method VARCHAR(30),
    payment_time DATE DEFAULT (CURDATE()),
    amount_paid DECIMAL(10,2) DEFAULT 0,
    CONSTRAINT fk_payment_borrow FOREIGN KEY (borrow_id) REFERENCES BORROWING(borrow_id) ON DELETE SET NULL
);

-- 9. INQUIRY
CREATE TABLE INQUIRY (
    inquiry_id INT PRIMARY KEY,
    member_card_id INT NOT NULL,
    person_id INT,
    receptionist_person_id INT,
    inquiry_time DATE DEFAULT (CURDATE()),
    resolution_status VARCHAR(50),
    inquiry_rating INT CHECK (inquiry_rating BETWEEN 1 AND 5),
    CONSTRAINT fk_inquiry_member FOREIGN KEY (member_card_id) REFERENCES MEMBER(card_id),
    CONSTRAINT fk_inquiry_person FOREIGN KEY (person_id) REFERENCES PERSON(person_id),
    CONSTRAINT fk_inquiry_recep FOREIGN KEY (receptionist_person_id) REFERENCES RECEPTIONIST(person_id)
);

-- 10. CATALOGING_ASSIGNMENT
CREATE TABLE CATALOGING_ASSIGNMENT (
    assign_date DATE DEFAULT (CURRENT_DATE) NOT NULL,
    manager_person_id INT NOT NULL,
    category VARCHAR(10) NOT NULL,
    CONSTRAINT pk_catalog_assign PRIMARY KEY (assign_date, manager_person_id),
    CONSTRAINT fk_catalog_manager FOREIGN KEY (manager_person_id) REFERENCES CATALOGING_MANAGER(person_id),
    CONSTRAINT chk_catalog_cat CHECK (category IN ('Cate1','Cate2','Cate3'))
);

-- =============================================
-- TRIGGERS FOR MYSQL
-- =============================================

-- 1. Enforce EMPLOYEE age >= 18 at insertion
DELIMITER $$
CREATE TRIGGER trg_employee_age_check_insert
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    DECLARE dob DATE;
    DECLARE age_years INT;
    
    SELECT date_of_birth INTO dob FROM PERSON WHERE person_id = NEW.person_id;
    SET age_years = FLOOR(TIMESTAMPDIFF(MONTH, dob, CURDATE()) / 12);
    
    IF age_years < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employee must be at least 18 years old.';
    END IF;
END$$
DELIMITER ;

-- 1. Enforce EMPLOYEE age >= 18 at update
DELIMITER $$
CREATE TRIGGER trg_employee_age_check_update
BEFORE UPDATE ON EMPLOYEE
FOR EACH ROW
BEGIN
    DECLARE dob DATE;
    DECLARE age_years INT;
    
    SELECT date_of_birth INTO dob FROM PERSON WHERE person_id = NEW.person_id;
    SET age_years = FLOOR(TIMESTAMPDIFF(MONTH, dob, CURDATE()) / 12);
    
    IF age_years < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employee must be at least 18 years old.';
    END IF;
END$$
DELIMITER ;

-- 2. Enforce TRAINING roles at insertion
DELIMITER $$
CREATE TRIGGER trg_training_role_check_insert
BEFORE INSERT ON TRAINING
FOR EACH ROW
BEGIN
    DECLARE trainer_type VARCHAR(30);
    DECLARE trainee_type VARCHAR(30);
    
    SELECT employee_type INTO trainer_type FROM EMPLOYEE WHERE person_id = NEW.trainer_id;
    SELECT employee_type INTO trainee_type FROM EMPLOYEE WHERE person_id = NEW.trainee_id;
    
    IF trainer_type NOT IN ('LIBRARY_SUPERVISOR','CATALOGING_MANAGER') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Trainer must be Library Supervisor or Cataloging Manager.';
    END IF;
    
    IF trainee_type <> 'RECEPTIONIST' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Trainee must be a Receptionist.';
    END IF;
END$$
DELIMITER ;

-- 2. Enforce TRAINING roles at update
DELIMITER $$
CREATE TRIGGER trg_training_role_check_update
BEFORE UPDATE ON TRAINING
FOR EACH ROW
BEGIN
    DECLARE trainer_type VARCHAR(30);
    DECLARE trainee_type VARCHAR(30);
    
    SELECT employee_type INTO trainer_type FROM EMPLOYEE WHERE person_id = NEW.trainer_id;
    SELECT employee_type INTO trainee_type FROM EMPLOYEE WHERE person_id = NEW.trainee_id;
    
    IF trainer_type NOT IN ('LIBRARY_SUPERVISOR','CATALOGING_MANAGER') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Trainer must be Library Supervisor or Cataloging Manager.';
    END IF;
    
    IF trainee_type <> 'RECEPTIONIST' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Trainee must be a Receptionist.';
    END IF;
END$$
DELIMITER ;

-- 3. BORROWING card consistency check at insertion
DELIMITER $$
CREATE TRIGGER trg_borrow_card_consistency_insert
BEFORE INSERT ON BORROWING
FOR EACH ROW
BEGIN
    DECLARE owner_person INT;
    
    IF NEW.borrower_card_id IS NOT NULL THEN
        SELECT person_id INTO owner_person FROM MEMBER WHERE card_id = NEW.borrower_card_id;
        
        IF owner_person <> NEW.borrower_person_id THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Provided borrower_card_id does not belong to borrower_person_id.';
        END IF;
    END IF;
END$$
DELIMITER ;

-- 3. BORROWING card consistency check at update
DELIMITER $$
CREATE TRIGGER trg_borrow_card_consistency_update
BEFORE UPDATE ON BORROWING
FOR EACH ROW
BEGIN
    DECLARE owner_person INT;
    
    IF NEW.borrower_card_id IS NOT NULL THEN
        SELECT person_id INTO owner_person FROM MEMBER WHERE card_id = NEW.borrower_card_id;
        
        IF owner_person <> NEW.borrower_person_id THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Provided borrower_card_id does not belong to borrower_person_id.';
        END IF;
    END IF;
END$$
DELIMITER ;

-- =============================================
-- VIEWS
-- =============================================

-- 1. TopGoldMember
CREATE OR REPLACE VIEW TopGoldMember AS
SELECT p.first_name, p.last_name, m.issue_date
FROM MEMBER m
JOIN PERSON p ON m.person_id = p.person_id
JOIN (
    SELECT borrower_person_id, COUNT(*) AS borrow_count
    FROM BORROWING
    WHERE issue_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    GROUP BY borrower_person_id
) b ON b.borrower_person_id = m.person_id
WHERE m.membership_level = 'GOLD'
AND b.borrow_count > 5;

-- 2. PopularBooks
CREATE OR REPLACE VIEW PopularBooks AS
WITH borrow_counts AS (
    SELECT book_id, COUNT(*) AS cnt
    FROM BORROWING
    WHERE issue_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
    GROUP BY book_id
),
max_count AS (
    SELECT MAX(cnt) AS max_cnt FROM borrow_counts
)
SELECT bk.book_id, bk.title, bk.category, bk.publisher_id, bc.cnt AS borrow_count
FROM BOOK bk
JOIN borrow_counts bc ON bk.book_id = bc.book_id
CROSS JOIN max_count
WHERE bc.cnt = max_count.max_cnt;

-- 3. BestRatingPublisher
CREATE OR REPLACE VIEW BestRatingPublisher AS
WITH book_avg AS (
    SELECT book_id, AVG(rating) AS avg_rating
    FROM BOOK_COMMENT
    GROUP BY book_id
)
SELECT p.publisher_name
FROM PUBLISHER p
JOIN BOOK b ON b.publisher_id = p.publisher_id
LEFT JOIN book_avg ba ON ba.book_id = b.book_id
GROUP BY p.publisher_name
HAVING MIN(ba.avg_rating) >= 4.0;

-- 4. PotentialGoldMember
CREATE OR REPLACE VIEW PotentialGoldMember AS
WITH months_borrowed AS (
    SELECT m.card_id, DATE_FORMAT(b.issue_date, '%Y-%m-01') AS month_start
    FROM MEMBER m
    JOIN BORROWING b ON b.borrower_person_id = m.person_id
    WHERE b.issue_date >= DATE_SUB(DATE_FORMAT(CURDATE(), '%Y-%m-01'), INTERVAL 11 MONTH)
    AND m.membership_level = 'SILVER'
    GROUP BY m.card_id, DATE_FORMAT(b.issue_date, '%Y-%m-01')
),
monthly_counts AS (
    SELECT card_id, COUNT(DISTINCT month_start) AS months_with_borrow
    FROM months_borrowed
    GROUP BY card_id
)
SELECT p.first_name, p.last_name, ph.phone_number, m.card_id
FROM MEMBER m
JOIN PERSON p ON m.person_id = p.person_id
LEFT JOIN PERSON_PHONE ph ON ph.person_id = p.person_id
JOIN monthly_counts mc ON mc.card_id = m.card_id
WHERE m.membership_level = 'SILVER'
AND mc.months_with_borrow = 12;

-- 5. ActiveReceptionist
CREATE OR REPLACE VIEW ActiveReceptionist AS
SELECT p.person_id, p.first_name, p.last_name, COUNT(*) AS resolved_count
FROM INQUIRY i
JOIN RECEPTIONIST r ON i.receptionist_person_id = r.person_id
JOIN PERSON p ON p.person_id = r.person_id
WHERE i.resolution_status = 'Resolved'
AND i.inquiry_time >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY p.person_id, p.first_name, p.last_name
HAVING COUNT(*) > 5;

-- =============================================
-- QUERIES
-- =============================================

-- 1. List details of all the supervisors of the library hired in the past two months
SELECT p.person_id, p.first_name, p.last_name, e.employee_start_date, p.date_of_birth, p.address, p.gender
FROM EMPLOYEE e
JOIN LIBRARY_SUPERVISOR ls ON ls.person_id = e.person_id
JOIN PERSON p ON p.person_id = e.person_id
WHERE e.employee_start_date >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH);

-- 2. Find the names of employees who are also members and the books they have borrowed in the past month
SELECT emp.person_id, p.first_name, p.last_name, bk.book_id, bk.title, br.issue_date
FROM EMPLOYEE emp
JOIN PERSON p ON p.person_id = emp.person_id
JOIN MEMBER m ON m.person_id = emp.person_id
JOIN BORROWING br ON br.borrower_person_id = emp.person_id
JOIN BOOK bk ON bk.book_id = br.book_id
WHERE br.issue_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- 3. Find the average number of books borrowed by the top five gold members in the library
WITH gold_borrows AS (
    SELECT m.card_id, m.person_id, COUNT(*) AS total_borrows
    FROM MEMBER m
    JOIN BORROWING b ON b.borrower_person_id = m.person_id
    WHERE m.membership_level = 'GOLD'
    GROUP BY m.card_id, m.person_id
),
top5 AS (
    SELECT card_id, person_id, total_borrows
    FROM gold_borrows
    ORDER BY total_borrows DESC
    LIMIT 5
)
SELECT AVG(total_borrows) AS avg_borrows_by_top5
FROM top5;

-- 4. Find the name of the publishers and the title of the most popular book for each publisher
WITH pub_book_counts AS (
    SELECT p.publisher_id, p.publisher_name, b.book_id, b.title, COUNT(br.borrow_id) AS borrow_count
    FROM PUBLISHER p
    JOIN BOOK b ON b.publisher_id = p.publisher_id
    LEFT JOIN BORROWING br ON br.book_id = b.book_id
    GROUP BY p.publisher_id, p.publisher_name, b.book_id, b.title
),
max_per_publisher AS (
    SELECT publisher_id, MAX(borrow_count) AS max_count
    FROM pub_book_counts
    GROUP BY publisher_id
)
SELECT pbc.publisher_name, pbc.title, pbc.borrow_count
FROM pub_book_counts pbc
JOIN max_per_publisher mpp ON pbc.publisher_id = mpp.publisher_id AND pbc.borrow_count = mpp.max_count
ORDER BY pbc.publisher_name;

-- 5. Find names of books that were not borrowed in the last 5 months
SELECT b.book_id, b.title
FROM BOOK b
LEFT JOIN BORROWING br ON br.book_id = b.book_id
AND br.issue_date >= DATE_SUB(CURDATE(), INTERVAL 5 MONTH)
WHERE br.borrow_id IS NULL;

-- 6. Find the members who have borrowed all the books written by the most popular author
WITH author_borrow_counts AS (
    SELECT ba.author_id, a.author_name, SUM(IFNULL(bc.cnt, 0)) AS total_borrows
    FROM BOOK_AUTHOR ba
    JOIN AUTHOR a ON a.author_id = ba.author_id
    LEFT JOIN (
        SELECT book_id, COUNT(*) AS cnt FROM BORROWING GROUP BY book_id
    ) bc ON bc.book_id = ba.book_id
    GROUP BY ba.author_id, a.author_name
),
most_pop_author AS (
    SELECT author_id
    FROM author_borrow_counts
    WHERE total_borrows = (SELECT MAX(total_borrows) FROM author_borrow_counts)
),
author_books AS (
    SELECT DISTINCT book_id
    FROM BOOK_AUTHOR
    WHERE author_id IN (SELECT author_id FROM most_pop_author)
),
author_books_count AS (
    SELECT COUNT(*) AS cnt FROM author_books
),
member_borrowed_count AS (
    SELECT m.card_id, m.person_id, COUNT(DISTINCT b.book_id) AS borrowed_count
    FROM MEMBER m
    JOIN BORROWING b ON b.borrower_person_id = m.person_id
    WHERE b.book_id IN (SELECT book_id FROM author_books)
    GROUP BY m.card_id, m.person_id
)
SELECT p.person_id, p.first_name, p.last_name, m.card_id
FROM member_borrowed_count mb
JOIN PERSON p ON p.person_id = mb.person_id
JOIN MEMBER m ON m.card_id = mb.card_id
WHERE mb.borrowed_count = (SELECT cnt FROM author_books_count);

-- 7. Find the Gold Member with the greatest number of guests
SELECT m.card_id, p.first_name, p.last_name, COUNT(g.guest_id) AS num_guests
FROM GUEST g
JOIN MEMBER m ON m.card_id = g.card_id
JOIN PERSON p ON p.person_id = m.person_id
WHERE m.membership_level = 'GOLD'
GROUP BY m.card_id, p.first_name, p.last_name
HAVING COUNT(g.guest_id) = (
    SELECT MAX(guest_count) FROM (
        SELECT COUNT(g2.guest_id) AS guest_count
        FROM GUEST g2
        JOIN MEMBER m2 ON m2.card_id = g2.card_id
        WHERE m2.membership_level = 'GOLD'
        GROUP BY m2.card_id
    ) AS subquery
);

-- 8. Find the year with the maximum number of books borrowed
SELECT YEAR(issue_date) AS borrow_year, COUNT(*) AS total_borrows
FROM BORROWING
GROUP BY YEAR(issue_date)
ORDER BY total_borrows DESC
LIMIT 1;

-- 9. Find the names of members who borrowed the most popular books
SELECT DISTINCT p.person_id, p.first_name, p.last_name, m.card_id
FROM MEMBER m
JOIN PERSON p ON p.person_id = m.person_id
JOIN BORROWING b ON b.borrower_person_id = m.person_id
WHERE b.book_id IN (
    SELECT book_id FROM (
        SELECT book_id, COUNT(*) AS cnt
        FROM BORROWING
        WHERE issue_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
        GROUP BY book_id
        HAVING COUNT(*) = (
            SELECT MAX(cnt) FROM (
                SELECT COUNT(*) AS cnt 
                FROM BORROWING 
                WHERE issue_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH) 
                GROUP BY book_id
            ) AS max_counts
        )
    ) AS popular_books
)
AND b.issue_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH);

-- 10. List all the employees that have enrolled into gold membership within a month of being employed
SELECT e.person_id, p.first_name, p.last_name, e.employee_start_date, m.issue_date AS membership_issue_date
FROM EMPLOYEE e
JOIN MEMBER m ON m.person_id = e.person_id
JOIN PERSON p ON p.person_id = e.person_id
WHERE m.membership_level = 'GOLD'
AND m.issue_date BETWEEN e.employee_start_date AND DATE_ADD(e.employee_start_date, INTERVAL 30 DAY);

-- 11. Find the names of receptionists with an average rating of 4.0 from the inquiries they resolved
SELECT r.person_id, p.first_name, p.last_name, AVG(i.inquiry_rating) AS avg_rating
FROM INQUIRY i
JOIN RECEPTIONIST r ON r.person_id = i.receptionist_person_id
JOIN PERSON p ON p.person_id = r.person_id
WHERE i.resolution_status = 'Resolved'
AND i.inquiry_rating IS NOT NULL
GROUP BY r.person_id, p.first_name, p.last_name
HAVING AVG(i.inquiry_rating) >= 4.0;

-- 12. Find the names of receptionists and their trainers who resolve at least 2 inquiries every month in the past 3 months
WITH RECURSIVE last_three_months AS (
    SELECT DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 0 MONTH), '%Y-%m-01') AS mon_start
    UNION ALL
    SELECT DATE_FORMAT(DATE_SUB(mon_start, INTERVAL 1 MONTH), '%Y-%m-01')
    FROM last_three_months
    WHERE DATE_SUB(mon_start, INTERVAL 1 MONTH) >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), '%Y-%m-01')
),
re_for_month AS (
    SELECT r.person_id AS recep_id, DATE_FORMAT(i.inquiry_time, '%Y-%m-01') AS mon_start, COUNT(*) AS resolved_count
    FROM INQUIRY i
    JOIN RECEPTIONIST r ON r.person_id = i.receptionist_person_id
    WHERE i.resolution_status = 'Resolved'
    AND i.inquiry_time >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), '%Y-%m-01')
    GROUP BY r.person_id, DATE_FORMAT(i.inquiry_time, '%Y-%m-01')
),
recep_months AS (
    SELECT recep_id, COUNT(*) AS months_with_2plus
    FROM re_for_month
    WHERE resolved_count >= 2
    GROUP BY recep_id
)
SELECT pr.recep_id AS receptionist_id, per_r.first_name AS recep_first, per_r.last_name AS recep_last,
       t.trainer_id AS trainer_id, per_t.first_name AS trainer_first, per_t.last_name AS trainer_last
FROM recep_months pr
JOIN RECEPTIONIST rct ON rct.person_id = pr.recep_id
JOIN PERSON per_r ON per_r.person_id = rct.person_id
JOIN TRAINING t ON t.trainee_id = rct.person_id
JOIN PERSON per_t ON per_t.person_id = t.trainer_id
WHERE pr.months_with_2plus = 3;

-- 13. List the employee who trained the greatest number of receptionists
SELECT t.trainer_id, p.first_name, p.last_name, COUNT(DISTINCT t.trainee_id) AS num_receptionists_trained
FROM TRAINING t
JOIN PERSON p ON p.person_id = t.trainer_id
GROUP BY t.trainer_id, p.first_name, p.last_name
HAVING COUNT(DISTINCT t.trainee_id) = (
    SELECT MAX(cnt) FROM (
        SELECT COUNT(DISTINCT trainee_id) AS cnt
        FROM TRAINING
        GROUP BY trainer_id
    ) AS trainer_counts
);

-- 14. List the Cataloging Managers who cataloged all categories every week in the past 4 weeks
WITH mgr_week_cat AS (
    SELECT ca.manager_person_id,
           YEARWEEK(ca.assign_date, 1) AS wk,
           COUNT(DISTINCT ca.category) AS cat_count
    FROM CATALOGING_ASSIGNMENT ca
    WHERE ca.assign_date >= DATE_SUB(CURDATE(), INTERVAL 21 DAY)
    GROUP BY ca.manager_person_id, YEARWEEK(ca.assign_date, 1)
)
SELECT p.person_id, p.first_name, p.last_name, count(*), Min(cat_count)
FROM mgr_week_cat mw
JOIN CATALOGING_MANAGER cm ON cm.person_id = mw.manager_person_id
JOIN PERSON p ON p.person_id = cm.person_id
GROUP BY p.person_id, p.first_name, p.last_name
HAVING COUNT(*) = 4
   AND MIN(cat_count) = 3;