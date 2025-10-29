-- Tạo database cho hệ thống quản lý ký túc xá
CREATE DATABASE IF NOT EXISTS hostel;
USE hostel;

-- Bảng quản lý phòng
CREATE TABLE IF NOT EXISTS room (
    number VARCHAR(10) PRIMARY KEY,
    activate VARCHAR(50),
    roomStatus VARCHAR(50)
);

-- Bảng quản lý sinh viên
CREATE TABLE IF NOT EXISTS student (
    mobileNo VARCHAR(10) PRIMARY KEY,
    name VARCHAR(200),
    father VARCHAR(200),
    mother VARCHAR(200),
    email VARCHAR(200),
    address VARCHAR(200),
    college VARCHAR(100),
    aadhaar VARCHAR(12),
    roomNo VARCHAR(10),
    status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (roomNo) REFERENCES room(number) ON UPDATE CASCADE ON DELETE SET NULL
);
INSERT INTO student (mobileNo, name, father, mother, email, address, college, aadhaar, roomNo, status)
VALUES (
    '001',
    'giá_trị_cho_name',
    'giá_trị_cho_father',
    'giá_trị_cho_mother',
    'giá_trị_cho_email',
    'giá_trị_cho_address',
    'giá_trị_cho_college',
    '002',
    'giá_trị_cho_roomNo',
    'giá_trị_cho_status'
);
-- Xem cấu trúc bảng
DESC room;
DESC student;

-- Xem dữ liệu
SELECT * FROM room;
SELECT * FROM student;
SELECT * FROM fees;


-- Ví dụ thêm phòng mẫu
INSERT INTO room (number, activate, roomStatus) VALUES
('001', 'Yes', 'Not Booked'),
('002', 'Yes', 'Not Booked'),
('003', 'Yes', 'Not Booked'),
('004', 'Yes', 'Not Booked'),
('005', 'Yes', 'Not Booked'),
('006', 'Yes', 'Not Booked'),
('007', 'Yes', 'Not Booked'),
('008', 'Yes', 'Not Booked'),
('009', 'Yes', 'Not Booked'),
('010', 'Yes', 'Not Booked')
ON DUPLICATE KEY UPDATE number=number;
CREATE TABLE students (
    mobileNo VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    roomNo VARCHAR(10)
);
drop table fees
CREATE TABLE fees (
    mobileNo VARCHAR(20),
    month VARCHAR(20),
    amount DOUBLE,
    FOREIGN KEY (mobileNo) REFERENCES student(mobileNo)
);
ALTER TABLE student DROP FOREIGN KEY student_ibfk_1;


-- Cập nhật trạng thái phòng (ví dụ)
-- UPDATE room SET roomStatus='Booked' WHERE number='001';