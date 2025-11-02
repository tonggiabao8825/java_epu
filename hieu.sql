CREATE DATABASE hostel
USE hostel
Bảng này lưu thông tin về các phòng trong ký túc xá.
-- Phải tạo bảng này trước vì bảng 'student' sẽ tham chiếu đến nó.
CREATE TABLE IF NOT EXISTS room (
    number VARCHAR(10) PRIMARY KEY,
    activate VARCHAR(50),
    roomStatus VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS student (
    mobileNo VARCHAR(20) PRIMARY KEY, -- Thống nhất kiểu dữ liệu
    name VARCHAR(200),
    father VARCHAR(200),
    mother VARCHAR(200),
    email VARCHAR(200) UNIQUE, -- Thêm UNIQUE cho email để không trùng
    address VARCHAR(200),
    college VARCHAR(100),
    aadhaar VARCHAR(12) UNIQUE, -- Thêm UNIQUE cho số CCCD/Aadhaar
    roomNo VARCHAR(10),
    status VARCHAR(20) DEFAULT 'Active',
    
    -- Khóa ngoại liên kết với bảng 'room'
    FOREIGN KEY (roomNo) REFERENCES room(number) 
        ON UPDATE CASCADE 
        ON DELETE SET NULL -- Nếu phòng bị xóa, phòng sinh viên sẽ tự set về NULL
);

-- 3. TẠO BẢNG 'fees' (Bảng con của 'student')
-- Phải tạo sau bảng 'student'
CREATE TABLE IF NOT EXISTS fees (
    -- Thêm một khóa chính cho bảng 'fees' là rất quan trọng
    fee_id INT PRIMARY KEY AUTO_INCREMENT, 
    mobileNo VARCHAR(20), -- Phải khớp với kiểu VARCHAR(20) của 'student'
    month VARCHAR(20),
    amount DOUBLE,
    
    -- Khóa ngoại liên kết với bảng 'student'
    FOREIGN KEY (mobileNo) REFERENCES student(mobileNo)
        ON UPDATE CASCADE
        ON DELETE CASCADE -- Nếu sinh viên bị xóa, các bản ghi phí cũng sẽ bị xóa
);

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
('010', 'Yes', 'Not Booked');

INSERT INTO student (mobileNo, name, father, mother, email, address, college, aadhaar, roomNo, status)
VALUES (
    '0909123456',
    'Nguyen Van A',
    'Nguyen Van B',
    'Le Thi C',
    'a@gmail.com',
    '123 Duong ABC, Q1, TPHCM',
    'Đại học KHTN',
    '123456789012',
    '001',  -- Phải là một phòng đã tồn tại trong bảng 'room' (ví dụ: '001')
    'Active'
);

INSERT INTO fees (mobileNo, month, amount)
VALUES (
    '0909123456', -- Phải là SĐT của một sinh viên đã tồn tại trong bảng 'student'
    'Tháng 11',
    500000
);

-- =======================================================
-- 4. TẠO BẢNG 'employee' (Quản lý nhân viên)
-- =======================================================
-- Đã sửa lại cho đồng nhất với bảng 'student'

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

INSERT INTO employee (mobileNo, name, father, mother, email, address, aadhaar, designation, status)
VALUES (
    '0911222333', 
    'Tran Van Minh', 
    'Tran Van Ba', 
    'Nguyen Thi Tu', 
    'minh.tran@hostel.com', 
    '456 Duong DEF, Q3, TPHCM', 
    '987654321001', 
    'Warden', 
    'Working'
);

-- Xem cấu trúc của các bảng
DESC room;
DESC student;
DESC fees;
DESC employee;

-- Xem tất cả dữ liệu bên trong các bảng
SELECT * FROM room;
SELECT * FROM student;
SELECT * FROM fees;
SELECT * FROM employee;
