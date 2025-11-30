CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) 
    REFERENCES animals(animalid)
);

CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount NUMERIC(10, 2),
    paymentdate TIMESTAMP,
    FOREIGN KEY (appointid)
    REFERENCES appointments (appointid)
);

CREATE TABLE medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate DATETIME,
    doctorid INT,
    diagnosis VARCHAR(100),
    prescription VARCHAR(100),
    notes VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email) VALUES
(1, 'Count', 'Dracula', '666 Transylvania Lane, Bat City', '0917-BLOOD', 'batguy@nightmail.com'),
(2, 'Princess', 'Leia Organa', '404 Galaxy Way, Star Base', '0918-FORCE', 'leia.o@rebelmail.net'),
(3, 'Mr.', 'Snugglesworth', '789 Cozy Blanket Dr, Napville', '0919-ZZZ', 'sleepy.time@dream.org'),
(4, 'Salty', 'McFishface', '101 Seaweed Ln, Aquarium Heights', '0920-GILL', 'salty.mcf@watermail.com'),
(5, 'Dr.', 'Evil', '202 Volcano Lair, Secret Island', '0921-MINIMI', 'dre.vil@doombase.com'),
(6, 'Sheldon', 'Cooper', '303 Apartment 4A, Pasadena', '0922-BAZINGA', 'sh.cooper@scimail.edu'),
(7, 'Wanda', 'Vision', '404 Reality Dr, Westview', '0923-MAGIC', 'wanda.vision@hex.com'),
(8, 'Bartholomew', 'Jellybean', '505 Rainbow Rd, Candy Land', '0924-GUMMY', 'barty.jelly@sweets.com'),
(9, 'Mildred', 'Pancake', '606 Maple Syrup St, Breakfast Town', '0925-FLAPJ', 'm.pancake@syrup.com'),
(10, 'Indiana', 'Bones', '707 Archaeology Site, Ancient City', '0926-TREASURE', 'indy.bones@artifact.net');


INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
(1, 'Whiskers', 'Cat', 'Siamese', '2021-03-15', 'Male', 'Cream', 1),
(2, 'Bella', 'Dog', 'Labrador', '2020-07-20', 'Female', 'Black', 2),
(3, 'Max', 'Dog', 'Beagle', '2019-05-10', 'Male', 'Brown', 3),
(4, 'Luna', 'Cat', 'Persian', '2022-01-05', 'Female', 'White', 4),
(5, 'Charlie', 'Dog', 'Bulldog', '2021-12-12', 'Male', 'Grey', 5),
(6, 'Milo', 'Cat', 'Maine Coon', '2020-09-25', 'Male', 'Brown', 6),
(7, 'Lucy', 'Dog', 'Poodle', '2019-11-30', 'Female', 'White', 7),
(8, 'Simba', 'Cat', 'Bengal', '2021-06-15', 'Male', 'Orange', 8),
(9, 'Daisy', 'Dog', 'German Shepherd', '2020-08-18', 'Female', 'Black', 9),
(10, 'Oliver', 'Cat', 'Ragdoll', '2022-02-22', 'Male', 'Grey', 10);
