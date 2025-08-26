CREATE TABLE "Bookshelves" (
  "id" SERIAL PRIMARY KEY,
  "code" VARCHAR(55) UNIQUE,
  "category_id" SERIAL
);

CREATE TABLE "Categories" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(255) UNIQUE
);

CREATE TABLE "Books" (
  "id" SERIAL PRIMARY KEY,
  "title" VARCHAR(255) UNIQUE,
  "author" VARCHAR(255),
  "bookshelves_id" SERIAL
);

CREATE TABLE "Borrowing" (
  "id" SERIAL PRIMARY KEY,
  "books_id" SERIAL,
  "member_id" SERIAL,
  "librarian_id" SERIAL,
  "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "Librarians" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(255) UNIQUE
);

CREATE TABLE "Members" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(255) UNIQUE
);

ALTER TABLE "Books" ADD FOREIGN KEY ("bookshelves_id") REFERENCES "Bookshelves" ("id");

ALTER TABLE "Bookshelves" ADD FOREIGN KEY ("category_id") REFERENCES "Categories" ("id");

ALTER TABLE "Borrowing" ADD FOREIGN KEY ("books_id") REFERENCES "Books" ("id");

ALTER TABLE "Borrowing" ADD FOREIGN KEY ("member_id") REFERENCES "Members" ("id");

ALTER TABLE "Borrowing" ADD FOREIGN KEY ("librarian_id") REFERENCES "Librarians" ("id");


-- Categories
INSERT INTO "Categories" ("name") VALUES
('Fiction'),
('Non-Fiction'),
('Science'),
('Technology'),
('History'),
('Biography'),
('Philosophy'),
('Art'),
('Children'),
('Comics');

-- Bookshelves
INSERT INTO "Bookshelves" ("code", "category_id") VALUES
('S-FIC-01', 1),
('S-FIC-02', 1),
('S-NF-01', 2),
('S-SCI-01', 3),
('S-TECH-01', 4),
('S-HIS-01', 5),
('S-BIO-01', 6),
('S-PHI-01', 7),
('S-ART-01', 8),
('S-COM-01', 10);

-- Books
INSERT INTO "Books" ("title", "author", "bookshelves_id") VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 1),
('To Kill a Mockingbird', 'Harper Lee', 2),
('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 3),
('A Brief History of Time', 'Stephen Hawking', 4),
('Clean Code', 'Robert C. Martin', 5),
('The Second World War', 'Antony Beevor', 6),
('The Diary of Anne Frank', 'Anne Frank', 7),
('Meditations', 'Marcus Aurelius', 8),
('The Story of Art', 'E.H. Gombrich', 9),
('One Piece Vol.1', 'Eiichiro Oda', 10);

-- Members
INSERT INTO "Members" ("name") VALUES
('Andi'),
('Budi'),
('Citra'),
('Dewi'),
('Eka'),
('Fajar'),
('Gilang'),
('Hana'),
('Indra'),
('Joko');

-- Librarians
INSERT INTO "Librarians" ("name") VALUES
('Pak Arif'),
('Bu Sari'),
('Pak Junaedi'),
('Bu Ratna'),
('Pak Bambang'),
('Bu Rina'),
('Pak Dedi'),
('Bu Lina'),
('Pak Rudi'),
('Bu Maya');

-- Borrowing
INSERT INTO "Borrowing" ("books_id", "member_id", "librarian_id") VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);
