-- 1. Sử dụng database
USE hostel;

-- 2. XÓA BẢNG 'employee' CŨ ĐI
DROP TABLE IF EXISTS employee_payment; -- Xóa bảng thanh toán trước (vì nó tham chiếu đến employee)
DROP TABLE IF EXISTS employee; -- Xóa bảng employee

-- 3. TẠO LẠI BẢNG 'employee' VỚI THỨ TỰ CỘT MỚI
-- phải thêm một cột 'id' giả ở đầu (để Java bỏ qua)
-- và xếp 'name' ở vị trí 2, 'mobileNo' ở vị trí 3
CREATE TABLE IF NOT EXISTS employee (
    id INT PRIMARY KEY AUTO_INCREMENT,  -- Cột 1 (Java bỏ qua)
    name VARCHAR(200),                  -- Cột 2 (rs.getString(2) -> JTable "Name")
    mobileNo VARCHAR(20) UNIQUE,        -- Cột 3 (rs.getString(3) -> JTable "Mobile Number")
    father VARCHAR(200),                -- Cột 4 (rs.getString(4) -> JTable "Father Name")
    mother VARCHAR(200),                -- Cột 5 (rs.getString(5) -> JTable "Mother Name")
    email VARCHAR(200) UNIQUE,          -- Cột 6 (rs.getString(6) -> JTable "Email")
    address VARCHAR(200),               -- Cột 7 (rs.getString(7) -> JTable "Address")
    aadhaar VARCHAR(12) UNIQUE,         -- Cột 8 (rs.getString(8) -> JTable "Aadhaar Number")
    
    -- Các cột này (9 và 10) code Java không đọc,
    -- nên JTable "Designation" sẽ bị trống
    designation VARCHAR(100),           -- Cột 9
    status VARCHAR(50) DEFAULT 'Working'-- Cột 10
);

-- 4. TẠO LẠI BẢNG 'employee_payment' (Nếu bạn cần)
CREATE TABLE IF NOT EXISTS employee_payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    mobileNo VARCHAR(20),
    month VARCHAR(20),
    amount DOUBLE,
    FOREIGN KEY (mobileNo) REFERENCES employee(mobileNo)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- 5. THÊM LẠI DỮ LIỆU MẪU (Thứ tự INSERT phải khớp với bảng mới)

-- Mẫu cho 'All Employee Working Page'
INSERT INTO employee (name, mobileNo, father, mother, email, address, aadhaar, designation, status)
VALUES (
    'Tran Van Minh', 
    '0911222333', 
    'Tran Van Ba', 
    'Nguyen Thi Tu', 
    'minh.tran@hostel.com', 
    '456 Duong DEF, Q3, TPHCM', 
    '987654321001', 
    'Warden', 
    'Working'
);

-- Mẫu cho 'Leaved Employee Page'
INSERT INTO employee (name, mobileNo, father, mother, email, address, aadhaar, designation, status)
VALUES (
    'Le Thi Binh', 
    '0911222444', 
    'Le Van An', 
    'Ho Thi Tam', 
    'binh.le@hostel.com', 
    '789 Duong GHI, Q5, TPHCM', 
    '987654321002', 
    'Cleaner', 
    'Not working'
);

-- 6. Kiểm tra dữ liệu
SELECT * FROM employee;