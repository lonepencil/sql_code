USE dealership;

CREATE TABLE cityState(

    varchar[90] NOT NULL city,
    char[2] NOT NULL state,
    char[5] NOT NULL zipCode,
    PRIMARY KEY (zipCode) 
);

INSERT into cityState
VALUES
    (Piscataway, NJ, 08854),
    (Clover, SC, 29710),
    (Duluth, GA, 30096),
    (Nashville, TN, 37205),
    (Willoughby, OH, 44094),
    (Jupiter, FL, 33458),
    (Huntington Beach, CA, 92647),
    (Memphis, TN, 38117),
    (Abingdon, VA, 24210),
    (San Marcos, CA, 92078),
    (Jefferson, LA, 70121),
    (Covington, LA, 70433),
    (Ontario, CA, 91764),
    (Cuyahoga Falls, OH, 44223),
    (Battle Creek, MI, 49016),
    (Scottsdale, AZ, 85260),
    (Glenarden, MD, 20706);

ALTER TABLE employee
    FOREIGN KEY REFERENCES cityState(zipCode);

ALTER TABLE customer
    FOREIGN KEY REFERENCES cityState(zipCode);

CREATE VIEW customerView(
    SELECT firstName, lastName, address from customer,
    SELECT city, state from cityState,
    SELECT zipCode, phone, email from customer
);

CREATE VIEW employeeView(
    SELECT firstName, lastName, address from employee,
    SELECT city, state from cityState,
    SELECT zipCode, phone, email from employee
);

CREATE TABLE sale(
    int NOT NULL employeeID,
    int NOT NULL customerID,
    int NOT NULL vehicleID,
    decimal[(8 [,2])] NOT NULL salePrice,
    PRIMARY KEY (employeeID, customerID, vehicleID),
    FOREIGN KEY (employeeID) REFERENCES employee,
    FOREIGN KEY (customerID) REFERENCES customer,
    FOREIGN KEY (vehicleID) REFERENCES vehicle
);