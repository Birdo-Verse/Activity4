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

CREATE TABLE doctors (
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    speciality VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
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

INSERT INTO appointments (appointid, animalid, appointdate, reason) VALUES
(1, 1, '2023-11-01', 'Routine checkup for Whiskers the Siamese Cat'),
(2, 2, '2023-11-05', 'Vaccination Booster for Bella the Labrador Dog'),
(3, 3, '2023-11-08', 'Limping after play for Max the Beagle Dog'),
(4, 4, '2023-11-10', 'Annual Dental Cleaning for Luna the Persian Cat'),
(5, 5, '2023-11-14', 'Skin rash evaluation for Charlie the Bulldog Dog'),
(6, 6, '2023-11-18', 'Hairball issue for Milo the Maine Coon Cat'),
(7, 7, '2023-11-20', 'Ear infection check for Lucy the Poodle Dog'),
(8, 8, '2023-11-25', 'Spay surgery consultation for Simba the Bengal Cat'),
(9, 9, '2023-11-28', 'Fever/Lethargy check for Daisy the German Shepherd Dog'),
(10, 10, '2023-12-01', 'General Wellness Exam for Oliver the Ragdoll Cat');

INSERT INTO doctors (doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Ophthalmology Specialist', '333-222-1111', 'carmen@example.com'),
(7, 'Dr.Nathapon', 'Thongtam', 'Exotic Animals Specialist', '434-355-6366', 'nate@example.com'),
(8, 'Dr.Ivy', 'Ona', 'Dental Specialist', '222-333-7644', 'ivy@example.com'),
(9, 'Dr.Miguel', 'Patio', 'Cardiology Specialist', '988-757-6766', 'miguel@example.com'),
(10, 'Dr.Ethan', 'Sapuay', 'Emergency Care Specialist', '777-666-5555', 'ethan@example.com');

INSERT INTO invoices (invoiceid, appointid, totalamount, paymentdate) VALUES
(1, 1, 50.00, '2023-11-01 11:30:00'), -- to Whiskers' checkup
(2, 2, 75.00, '2023-11-05 15:00:00'), -- to Bella's vaccination
(3, 3, 100.00, '2023-11-08 12:00:00'), -- to Max's limping check
(4, 4, 200.00, '2023-11-10 13:00:00'), -- to Luna's dental cleaning
(5, 5, 80.00, '2023-11-14 16:00:00'), -- to Charlie's rash evaluation
(6, 6, 30.00, '2023-11-18 17:30:00'), -- to Milo's hairball issue
(7, 7, 75.00, '2023-11-20 14:30:00'), -- to Lucy's ear infection check
(8, 8, 150.00, '2023-11-25 11:30:00'), -- to Simba's spay consultation
(9, 9, 600.00, '2023-11-28 13:00:00'), -- to Daisy's fever/lethargy check
(10, 10, 400.00, '2023-12-01 16:30:00');--to Oliver's wellness exam

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes) VALUES 
(1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
(2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
(3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
(4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
(5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
(6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
(7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
(8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
(9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
(10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners
ADD registereddate DATE;

ALTER TABLE invoices
RENAME COLUMN paymentdate TO paymenttime;

DELETE FROM appointments
WHERE animalid = 8;

UPDATE doctors
SET dlastname = 'Reyes-Gonzales'
WHERE dlastname = 'Reyes';

SELECT DISTINCT species
FROM animals;

SELECT SUM(totalamount) AS total_sales
FROM invoices;


SELECT&&&
    o.ofirstname,
    o.olastname,
    a.name AS pet_name 
FROM
    owners o         
JOIN
    animals a ON o.ownerid = a.ownerid;