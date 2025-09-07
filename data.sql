-- ==============================
-- INSERT SAMPLE DATA
-- ==============================

INSERT INTO patients (first_name, last_name, age, gender) VALUES
('John', 'Doe', 45, 'Male'),
('Jane', 'Smith', 32, 'Female'),
('Alice', 'Brown', 60, 'Female'),
('Bob', 'Johnson', 55, 'Male'),
('Charlie', 'Miller', 28, 'Male'),
('Eva', 'Davis', 70, 'Female');

INSERT INTO doctors (doctor_name, department) VALUES
('Dr. Adams', 'Cardiology'),
('Dr. Baker', 'Neurology'),
('Dr. Clark', 'Orthopedics'),
('Dr. Davis', 'Dermatology');

INSERT INTO appointment (patient_details, doctor_details, apt_date, diagnosis, bill_amount) VALUES
(1, 1, '2025-08-01', 'Heart Checkup', 3000.00),
(2, 2, '2025-08-02', 'Migraine', 1500.00),
(3, 1, '2025-08-03', 'Heart Surgery', 10000.00),
(4, 3, '2025-08-04', 'Knee Pain', 2000.00),
(5, 4, '2025-08-05', 'Skin Rash', 800.00),
(6, 1, '2025-08-06', 'Cardiac Arrest', 12000.00),
(2, 3, '2025-08-07', 'Fracture', 2500.00);

INSERT INTO payments (appt_detials, payment_date, paid_amout) VALUES
(1, '2025-08-01', 3000.00),
(2, '2025-08-02', 1500.00),
(3, '2025-08-04', 7000.00),
(4, '2025-08-05', 2000.00),
(5, '2025-08-06', 800.00);
