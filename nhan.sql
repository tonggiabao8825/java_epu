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

-- Xem cấu trúc bảng
DESC room;
DESC student;

-- Xem dữ liệu
SELECT * FROM room;
SELECT * FROM student;

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

-- Cập nhật trạng thái phòng (ví dụ)
-- UPDATE room SET roomStatus='Booked' WHERE number='001';