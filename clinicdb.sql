-- Final week 8 assignment, Clinic Booking System
-- Create a Clinic Database
CREATE DATABASE clinicdb;
 
 USE clinicdb;
 
 -- Creating tables for the clinicdb
 CREATE TABLE Patients (
 patient_id INT AUTO_INCREMENT PRIMARY KEY,
 first_name VARCHAR(200) NOT NULL,
 last_name VARCHAR(200) NOT NULL,
 Date_of_birth DATE,
 Address VARCHAR(100) UNIQUE,
 Phone VARCHAR(50) UNIQUE,
 Email VARCHAR(150) UNIQUE,
 );
 
 -- Table 2
 CREATE TABLE Doctors (
 doctor_id INT AUTO_INCREMENT PRIMARY KEY,
 first_name VARCHAR(200) NOT NULL,
 last_name VARCHAR(200) NOT NULL,
 specialization VARCHAR(200),
 Address VARCHAR(100) UNIQUE,
 Phone VARCHAR(50) UNIQUE,
 Email VARCHAR(150) UNIQUE,
);

-- Table 3
 CREATE TABLE services (
  service_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE,
  description TEXT,
  price DECIMAL(10,2) DEFAULT 0.00,
);

-- Table 4
CREATE TABLE doctors_services (
  doctor_id INT NOT NULL,
  service_id INT NOT NULL,
  PRIMARY KEY (doctor_id, service_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (service_id) REFERENCES services(service_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table 5
CREATE TABLE appointments (
  appointment_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  service_id INT NOT NULL,
  appointment_date DATETIME NOT NULL,
  status ENUM('scheduled','completed','cancelled') DEFAULT 'scheduled',
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (service_id) REFERENCES services(service_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT uq_patient_doctor_time UNIQUE (patient_id, doctor_id, appointment_date)
);

-- Table 6
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('admin','receptionist','doctor') NOT NULL DEFAULT 'receptionist',
);

-- Inserting data to the tables
INSERT INTO patients (first_name, last_name, date_of_birth, address, phone, email) VALUES
('Hilda', 'Waringa', '2005-03-04', 'Nairobi, Kenya', '+254712345678', 'hilda@gmail.com'),
('Paul', 'Kimani', '1990-08-20', 'Nakuru, Kenya', '075668425158', 'paul@gmail.com'),
('Christine', 'Njahira', '2011-05-27', 'Kigali, Rwanda', '07546245625', 'christine@gmail.com');

INSERT INTO doctors (first_name, last_name, specialization, Address, phone, email) VALUES
('Alice', 'Mwangi', 'General Practitioner', 'India', '07526565656', 'alice.mwangi@gmail.com'),
('John', 'Otieno', 'Pediatrics', '0794651995', 'Finland', 'john.otieno@gmail.com'),
('Damarina', 'Oyaka', 'Optician', '07565955222', 'Kenya', 'damarina@gmail.com');

INSERT INTO services (name, description, price) VALUES
('General Consultation', 'Standard doctor consultation', 10.00),
('Pediatrics Consultation', 'Child health consultation', 12.00),
('X-Ray', 'Radiology imaging', 50.00);

INSERT INTO doctors_services (doctor_id, service_id) VALUES
(1,1), (1,3), (2,2);

INSERT INTO appointments (patient_id, appointment_date, doctor_name, reason)
VALUES (1, '2025-09-25', 'Dr. Kimani', 'Checkup'),
VALUES (2, '2025-11-11', 'Dr. John', 'lab testing');















 
 
 
 
 
 
 
  