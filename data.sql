-- Cleaned SQL schema for project (matches src/ code expectations)
-- Generated: 2025-11-07

CREATE DATABASE IF NOT EXISTS hostel;
USE hostel;

-- Rooms
CREATE TABLE IF NOT EXISTS room (
  number VARCHAR(10) PRIMARY KEY,
  activate VARCHAR(50) DEFAULT 'Yes',
  roomStatus VARCHAR(50) DEFAULT 'Not Booked'
);

-- Students (mobileNo is primary key; roomNo references room.number)
CREATE TABLE IF NOT EXISTS student (
  mobileNo VARCHAR(20) PRIMARY KEY,
  name VARCHAR(200),
  father VARCHAR(200),
  mother VARCHAR(200),
  email VARCHAR(200) UNIQUE,
  address VARCHAR(200),
  college VARCHAR(100),
  aadhaar VARCHAR(12) UNIQUE,
  roomNo VARCHAR(10),
  status VARCHAR(20) DEFAULT 'Active',
  FOREIGN KEY (roomNo) REFERENCES room(number) ON UPDATE CASCADE ON DELETE SET NULL
);

-- Fees linked to students
CREATE TABLE IF NOT EXISTS fees (
  fee_id INT PRIMARY KEY AUTO_INCREMENT,
  mobileNo VARCHAR(20),
  month VARCHAR(20),
  amount DOUBLE,
  FOREIGN KEY (mobileNo) REFERENCES student(mobileNo) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Employees
CREATE TABLE IF NOT EXISTS employee (
  mobileNo VARCHAR(20) PRIMARY KEY,
  name VARCHAR(200),
  father VARCHAR(200),
  mother VARCHAR(200),
  email VARCHAR(200) UNIQUE,
  address VARCHAR(200),
  aadhaar VARCHAR(12) UNIQUE,
  designation VARCHAR(100),
  status VARCHAR(50) DEFAULT 'Working'
);

-- Employee payments
CREATE TABLE IF NOT EXISTS employee_payment (
  payment_id INT PRIMARY KEY AUTO_INCREMENT,
  mobileNo VARCHAR(20),
  month VARCHAR(20),
  amount DOUBLE,
  FOREIGN KEY (mobileNo) REFERENCES employee(mobileNo) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Sample data (safe to re-run)
INSERT INTO room (number) VALUES ('001') ON DUPLICATE KEY UPDATE number=number;
INSERT INTO room (number) VALUES ('002') ON DUPLICATE KEY UPDATE number=number;
INSERT INTO room (number) VALUES ('003') ON DUPLICATE KEY UPDATE number=number;

INSERT INTO student (mobileNo, name, father, mother, email, address, college, aadhaar, roomNo, status)
VALUES ('0909123456','Nguyen Van A','Nguyen Van B','Le Thi C','a@gmail.com','123 Duong ABC','Dai hoc KHTN','123456789012','001','Active')
ON DUPLICATE KEY UPDATE mobileNo=mobileNo;

INSERT INTO fees (mobileNo, month, amount) VALUES ('0909123456','2025-11',500000) ON DUPLICATE KEY UPDATE fee_id=fee_id;

INSERT INTO employee (mobileNo, name, father, mother, email, address, aadhaar, designation, status)
VALUES ('0911222333','Tran Van Minh','Tran Van Ba','Nguyen Thi Tu','minh.tran@hostel.com','456 Duong DEF','987654321001','Warden','Working')
ON DUPLICATE KEY UPDATE mobileNo=mobileNo;

INSERT INTO employee_payment (mobileNo, month, amount) VALUES ('0911222333','2025-11',1000000) ON DUPLICATE KEY UPDATE payment_id=payment_id;

-- End of file
