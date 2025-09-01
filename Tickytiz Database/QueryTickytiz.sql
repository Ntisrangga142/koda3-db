-- Active: 1756207751880@@172.31.157.215@5432@tickytiz

-- Login
SELECT "Email", "Password"
FROM "Account"
WHERE "Email" = 'user2@mail.com' AND "Password" = 'pass2';

-- Register
INSERT INTO "Account" ("Email", "Password")
VALUES ('user11@mail.com', 'pass11'); 

-- Get Upcoming Movies
SELECT "ID", "Title", "Poster", "Backdrop", "Release_Date", "Duration", "Synopsis", "Rating"
FROM "Movies"
WHERE "Release_Date" > CURRENT_DATE;

-- Get Popular Movies
SELECT "ID", "Title", "Poster", "Backdrop", "Release_Date", "Duration", "Synopsis", "Rating"
FROM "Movies"
WHERE "Rating" > 5.0;

--Filter Movie by Name & Genre with Pagination
SELECT DISTINCT m."ID", m."Title", m."Poster", m."Backdrop", m."Release_Date", m."Duration", m."Synopsis", m."Rating"
FROM "Movies" m
JOIN "Movies_Genres" mg ON m."ID" = mg."ID_Movie"
JOIN "Genres" g ON mg."ID_Genre" = g."ID"
WHERE m."Title" ILIKE '%Movie%' AND g."Name" ILIKE '%Genre%' 
LIMIT 5
OFFSET 5*0;

--Get Schedule
SELECT ns."ID", mv."Title", ns."Date", ti."Time"
FROM "NowShowing" ns
INNER JOIN "Movies" mv ON mv."ID" = ns."ID_Movie"
INNER JOIN "Cinema" cn ON cn."ID" = ns."ID_Cinema"
INNER JOIN "Location" lc ON lc."ID" = ns."ID_Location"
INNER JOIN "Time" ti ON ti."ID" = ns."ID_Time"
WHERE mv."ID" = 3;

--Get Seat Sold
SELECT se."ID"
FROM "Seat" se
INNER JOIN "OrderDetails" ode ON se."ID" = ode."ID_Seat"
WHERE ode."ID_Order" = 1;

--Get Movie Details
SELECT mv."ID", mv."Title", mv."Poster", mv."Backdrop", mv."Release_Date", mv."Duration", mv."Synopsis", mv."Rating", ge."Name"
FROM "Movies" mv
INNER JOIN "Directors" dr ON dr."ID" = mv."ID_Director"
INNER JOIN "Movies_Genres" mg ON mg."ID_Movie" = mv."ID"
INNER JOIN "Genres" ge ON ge."ID" = mg."ID_Genre"
INNER JOIN "Movies_Actors" ma ON ma."ID_Movie" = mv."ID"
INNER JOIN "Actors" ac ON ac."ID" = ma."ID_Actor"
WHERE mv."ID" = 1;

--Create Order
INSERT INTO "Orders" ("isPaid", "Total_Price", "QRCode", "Name", "Email", "Phone", "ID_NowShowing", "ID_PaymentMethod", "ID_User") VALUES
(TRUE, 20, 'QR0001', 'Buyer1', 'buyer1@mail.com', '08222222001', 10, 10, 9);
INSERT INTO "OrderDetails" ("ID_Order", "ID_Seat") VALUES
((SELECT "ID" FROM "Orders" ORDER BY "ID" DESC LIMIT 1), 'A1'),
((SELECT "ID" FROM "Orders" ORDER BY "ID" DESC LIMIT 1), 'A2');

--Get Profile
SELECT u."ID", u."ProfileImg", u."FirstName", u."LastName", u."Phone", u."Point", a."Email"
FROM "Users" u
INNER JOIN "Account" a ON a."ID" = u."ID"
WHERE u."ID" = 1

--Get History
SELECT od."ID", od."isPaid", od."Total_Price", od."QRCode", od."Name", od."Email", od."Phone", pm."Name"
FROM "Orders" od
INNER JOIN "PaymentMethod" pm ON od."ID_PaymentMethod" = pm."ID"
WHERE od."ID_User" = 9;

--Edit Profile
UPDATE "User" SET
"ProfileImg" = 'img20.png',
"FirstName"  = 'Titus',
"LastName"   = 'Rangga',
"Phone"      = '08888888888888'
WHERE "ID" = 1

--ADMIN
--Get All Movie
SELECT mv."ID", mv."Title", mv."Poster", mv."Backdrop", mv."Release_Date", mv."Duration", mv."Synopsis", mv."Rating"
FROM "Movies" mv;

--Delete All Movie
DELETE FROM "Movies" WHERE "ID" = 1;

--Edit Movie
UPDATE "Movies" mv
SET
  "Title"         = 'New Title',
  "Poster"        = 'new-poster.jpg',
  "Backdrop"      = 'new-backdrop.jpg',
  "Release_Date"  = '2025-12-01',
  "Duration"      = 135,
  "Synopsis"      = 'Updated synopsis for the movie.',
  "Rating"        = 8.7,
  "ID_Director"   = 3
WHERE "ID" = 5;
