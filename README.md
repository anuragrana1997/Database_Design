# Jungle Library Database Management System

## Overview

Jungle Library is a relational database project designed to manage the major operations of a library.

The system provides structured storage and management for:

- People
- Employees
- Library members
- Books
- Authors
- Publishers
- Borrowing records
- Payments
- Promotions
- Guests
- Book comments
- Member inquiries
- Employee training
- Cataloging assignments

The database was designed using an EER model and converted into a relational schema for implementation in MySQL.

---

## Project Structure

```text
project/
│
├── DB_FINAL_QUERIES.sql
├── DATA_POPULATION_SCRIPTS_FOR_MYSQL.sql
├── Project_Description.pdf
├── Project_Solution.pdf
└── README.md
```

### Files

`DB_FINAL_QUERIES.sql`

Contains:

- Table creation statements
- Primary and foreign key constraints
- Check constraints
- Triggers
- Views
- Required SQL queries

`DATA_POPULATION_SCRIPTS_FOR_MYSQL.sql`

Contains sample data used to populate the database and test the SQL queries.

`Project_Description.pdf`

Contains the original project requirements and database specifications.

`Project_Solution.pdf`

Contains the completed project design, including:

- Project questions
- Assumptions
- EER diagram
- Relational model
- SQL implementation
- Views
- Queries

---

## Database Design

The database is centered around the `PERSON` entity.

A person may participate in the system as:

```text
PERSON
├── EMPLOYEE
│   ├── LIBRARY_SUPERVISOR
│   ├── CATALOGING_MANAGER
│   └── RECEPTIONIST
│
└── MEMBER
    ├── GOLD_MEMBER
    └── SILVER_MEMBER
```

A person can also be both an employee and a member.

---

## Main Tables

The database contains tables including:

- `PERSON`
- `PERSON_PHONE`
- `EMPLOYEE`
- `LIBRARY_SUPERVISOR`
- `CATALOGING_MANAGER`
- `RECEPTIONIST`
- `TRAINING`
- `MEMBER`
- `GOLD_MEMBER`
- `SILVER_MEMBER`
- `GUEST`
- `PROMOTION`
- `MEMBER_PROMOTION`
- `PUBLISHER`
- `AUTHOR`
- `BOOK`
- `BOOK_AUTHOR`
- `BOOK_COMMENT`
- `BORROWING`
- `PAYMENT`
- `INQUIRY`
- `CATALOGING_ASSIGNMENT`

---

## Important Relationships

### Person and Employee

`EMPLOYEE` is a specialization of `PERSON`.

Each employee can be one of the following:

- Library Supervisor
- Cataloging Manager
- Receptionist

### Person and Member

A `MEMBER` is associated with a person and has a library card.

Members are classified as:

- Gold Member
- Silver Member

### Books and Authors

A book can have multiple authors, and an author can write multiple books.

This many-to-many relationship is implemented using:

```text
BOOK_AUTHOR
```

### Books and Publishers

A publisher can publish multiple books, while each book is associated with one publisher.

### Borrowing

The `BORROWING` table stores:

- Borrowed book
- Borrower
- Library card
- Responsible receptionist
- Issue date
- Due date
- Return date

### Training

Receptionists receive training from either:

- Library Supervisors
- Cataloging Managers

### Guests

Gold members can invite guests.

A guest is identified using a combination of:

```text
card_id + guest_id
```

---

## Database Constraints

The project uses several constraints to maintain data integrity.

Examples include:

- Primary keys
- Foreign keys
- Composite keys
- `CHECK` constraints
- `NOT NULL` constraints
- Referential integrity
- Cascading deletes

Examples:

```sql
CHECK (membership_level IN ('SILVER', 'GOLD'))
```

```sql
CHECK (rating BETWEEN 1 AND 5)
```

---

## Triggers

Triggers are used to enforce rules that cannot easily be handled using basic table constraints.

### Employee Age Validation

Employees must be at least 18 years old.

The trigger checks the employee's date of birth before allowing the operation.

### Training Role Validation

A trainer must be either:

```text
LIBRARY_SUPERVISOR
```

or

```text
CATALOGING_MANAGER
```

The trainee must be a:

```text
RECEPTIONIST
```

### Borrowing Card Validation

If a library card is supplied during borrowing, the system checks that the card actually belongs to the person borrowing the book.

---

## Views

The project implements five database views.

### TopGoldMember

Returns Gold Members who borrowed more than five books during the past month.

### PopularBooks

Returns the most borrowed books during the past year.

### BestRatingPublisher

Returns publishers whose books have an average rating of at least 4.0.

### PotentialGoldMember

Returns Silver Members who borrowed books every month during the past year.

### ActiveReceptionist

Returns receptionists who resolved more than five inquiries during the past month.

---

## SQL Queries

The project includes SQL queries for retrieving information such as:

1. Supervisors hired during the past two months
2. Employees who are also library members
3. Average books borrowed by the top five Gold Members
4. Most popular book for each publisher
5. Books not borrowed during the past five months
6. Members who borrowed all books written by the most popular author
7. Gold Member with the greatest number of guests
8. Year with the highest number of borrowed books
9. Members who borrowed the most popular books
10. Employees who became Gold Members within one month of employment
11. Receptionists with an average inquiry rating of at least 4.0
12. Receptionists and trainers meeting inquiry-resolution requirements
13. Employee who trained the greatest number of receptionists
14. Cataloging Managers who cataloged all categories every week during the past four weeks

---

## Technologies Used

- MySQL
- SQL
- MySQL Workbench
- Relational Database Design
- EER Modeling
- Database Normalization

---

## Running the Project

### 1. Create the Database

Create and select a database in MySQL:

```sql
CREATE DATABASE jungle_library;

USE jungle_library;
```

### 2. Create the Database Structure

Open:

```text
DB_FINAL_QUERIES.sql
```

Run the table creation, constraint, trigger, and view statements.

### 3. Populate the Database

Run:

```text
DATA_POPULATION_SCRIPTS_FOR_MYSQL.sql
```

This inserts the sample data required to test the database.

### 4. Execute Queries

After the database has been populated, execute the query section from:

```text
DB_FINAL_QUERIES.sql
```

to test the required database operations.

---

## Example Workflow

```text
Create Database
      ↓
Create Tables
      ↓
Add Primary / Foreign Keys
      ↓
Add Constraints
      ↓
Create Triggers
      ↓
Create Views
      ↓
Populate Sample Data
      ↓
Run Queries
      ↓
Analyze Results
```

---

## Project Goals

The main goals of this project are to demonstrate:

- Conceptual database design using EER modeling
- Conversion of an EER model into a relational schema
- Database normalization
- Primary and foreign key design
- Referential integrity
- Many-to-many relationship implementation
- SQL table creation
- Data population
- Triggers
- Views
- Complex SQL queries
- Practical relational database design

---

## Course

**CS 6360 – Database Design**

## Project

**Jungle Library Database Management System**
