-- Developing a database system for a hospital
-- Create the database name to house all the hospital records
CREATE DATABASE Hospital;

-- a patients' table is created to house all records of the patients
CREATE TABLE Patients(
	PatientID INT IDENTITY(1, 1) PRIMARY KEY,
	"Full Name" VARCHAR(100) NOT NULL,
	"Address" VARCHAR(255) NOT NULL, 
	"Date of Birth" DATE NOT NULL, 
	"Insurance" VARCHAR(100) NOT NULL,
	"Username" VARCHAR(100) UNIQUE NOT NULL,
	"Password" VARCHAR(100) NOT NULL,
	"Email" VARCHAR(255) NOT NULL, 
	"Phone Number" VARCHAR(30) NOT NULL,
	"Date Discharged" DATE 
);

SELECT * FROM Patients;

CREATE TABLE Departments(
	DepartmentID INT IDENTITY(1, 1) PRIMARY KEY,
	"Department Name" VARCHAR(50) UNIQUE NOT NULL
);

SELECT * FROM Departments;

CREATE TABLE Doctors(
	"Doctor ID" INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	"Full Name" VARCHAR(100) NOT NULL,
	DepartmentID INT NOT NULL,
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

SELECT * FROM Doctors;

CREATE TABLE Appointments(
	"Appointment ID" INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	PatientID INT NOT NULL,
	"Doctor ID" INT NOT NULL,
	"Appointment Date" DATE NOT NULL,
	"Appointment Time" TIME NOT NULL,
	DepartmentID INT NOT NULL,
	"Appointment Status" VARCHAR(50) NOT NULL CHECK ("Appointment Status" IN ('pending', 'cancelled', 'completed')),
	FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
	FOREIGN KEY ("Doctor ID") REFERENCES Doctors("Doctor ID"),
	FOREIGN KEY ("DepartmentID") REFERENCES Departments(DepartmentID)
);

SELECT * FROM Appointments

CREATE TABLE "Medical Records"(
	RecordID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	PatientID INT NOT NULL, 
	"Appointment ID" INT NOT NULL,
	Diagnoses TEXT NOT NULL,
	Medication TEXT NOT NULL,
	"Date Prescribed" DATE NOT NULL,
	Allergies TEXT NOT NULL,
	FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
	FOREIGN KEY ("Appointment ID") REFERENCES Appointments("Appointment ID")
);

SELECT * FROM "Medical Records";

CREATE TABLE "Doctor Reviews"(
	"Review ID" INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	"Doctor ID" INT NOT NULL,
	DepartmentID INT NOT NULL,
	Review TEXT,
	Rating INT CHECK (rating >= 1 AND rating <= 5),
	FOREIGN KEY ("Doctor ID") REFERENCES Doctors("Doctor ID"),
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
)

SELECT * FROM "Doctor Reviews";

-- inputing patient details into the patients table

INSERT INTO Patients ("Full Name", "Address", "Date of Birth", "Insurance", "Username", "Password", "Email", "Phone Number", "Date Discharged") VALUES
('Adewale Adekunle', '15 Obafemi Awolowo Way, Ikeja, Lagos', '1988-03-20', 'NHIS - Axa Mansard', 'aadekunle', 'naijapass1', 'adewale.a@gmail.com', '08031234567', NULL),
('Chioma Okoro', '7 Unity Road, Trans Amadi, Port Harcourt', '1992-07-11', 'NHIS - Leadway', 'cokoro', 'securechi', 'chioma.o@yahoo.com', '07062345678', NULL),
('Emeka Nnamdi', '23 Ahmadu Bello Way, Kaduna', '1975-01-05', 'NHIS - AIICO', 'enamdi', 'emeka123', 'emeka.n@proton.me', '08093456789', NULL),
('Fatima Abubakar', '8 Kano Street, Area 10, Garki, Abuja', '1990-09-01', 'NHIS - Cornerstone', 'fabubakar', 'fatimapw', 'fatima.a@hotmail.com', '08124567890', '2024-07-15'),
('Gabriel Ekeh', '34 Okpara Avenue, Enugu', '1983-04-29', 'NHIS - Old Mutual', 'gekeh', 'gabehpass', 'gabriel.e@yahoo.com', '09055678901', NULL),
('Hauwa Usman', '12 Sokoto Road, Barnawa, Kaduna', '1995-11-03', 'NHIS - FBNInsurance', 'husman', 'hauwapass', 'hauwa.u@gmail.com', '08076789012', NULL),
('Ibrahim Musa', '5 Calabar Street, Wuse 2, Abuja', '1970-02-18', 'NHIS - Zenith', 'imusa', 'ibropwd', 'ibrahim.m@hotmail.com', '08087890123', NULL),
('Joy Adebayo', '45 Marina Road, Ikoyi, Lagos', '1991-08-25', 'NHIS - Prestige', 'jadebayo', 'joyfulpw', 'joy.a@gmail.com', '08028901234', NULL),
('Kunle Ajayi', '6 Ibadan Express, Sagamu, Ogun', '1980-06-10', 'NHIS - Capital', 'kajayi', 'kunlepass', 'kunle.a@yahoo.com', '07039012345', NULL),
('Linda Kalu', '10 Aba Road, Umuahia, Abia', '1993-12-07', 'NHIS - Custodian', 'lkalu', 'linda.k', 'linda.k@proton.me', '08060123456', NULL),
('Mohammed Yusuf', '2 Gombe Street, Ungwan Sarki, Kaduna', '1968-05-02', 'NHIS - Allianz', 'myusuf', 'mohpwd', 'mohammed.y@gmail.com', '08051234567', NULL),
('Ngozi Obi', '3 Enugu Road, Onitsha, Anambra', '1986-09-19', 'NHIS - Cornerstone', 'nobi', 'ngozi.o', 'ngozi.o@gmail.com', '08102345678', NULL),
('Olumide Ojo', '7 Victoria Island Crescent, Lekki, Lagos', '1997-03-01', 'NHIS - Leadway', 'oojo', 'olumipass', 'olumide.o@gmail.com', '09093456789', NULL),
('Peace Chukwu', '22 Garden City Estate, Rumuigbo, Port Harcourt', '1979-07-07', 'NHIS - Axa Mansard', 'pchukwu', 'peacepw', 'peace.c@gmail.com', '08044567890', NULL),
('Quadri Salami', '9 Lagos Island Close, Surulere, Lagos', '1994-01-28', 'NHIS - Prestige', 'qsalami', 'salamipass', 'quadri.s@proton.me', '07085678901', NULL),
('Rosemary Idem', '18 Uyo Road, Eket, Akwa Ibom', '1984-10-14', 'NHIS - AIICO', 'ridem', 'rosemaryp', 'rosemary.i@yahoo.com', '08136789012', NULL),
('Segun Popoola', '33 Ring Road, Molete, Ibadan, Oyo', '1977-04-03', 'NHIS - FBNInsurance', 'spopoola', 'segunpwd', 'segun.p@yahoo.com', '08017890123', NULL),
('Tina Danjuma', '6 Jos Road, Bukuru, Plateau', '1996-02-09', 'NHIS - Zenith', 'tdanjuma', 'tinapass', 'tina.d@hotmail.com', '08098901234', NULL),
('Uche Okeke', '14 Benin-Sapele Road, Warri, Delta', '1971-08-08', 'NHIS - Capital', 'uokeke', 'uche.o', 'uche.o@hotmail.com', '07050123456', NULL),
('Victor Obi', '21 Port Novo Street, Apapa, Lagos', '1989-05-23', 'NHIS - Custodian', 'vobi', 'victorpw', 'victor.o@hotmail.com', '08021234567', NULL),
('Wasiu Aliyu', '25 Katsina Street, Sabon Gari, Kano', '1981-11-30', 'NHIS - Allianz', 'waliyu', 'wasiu.a', 'wasiu.a@gmail.com', '08032345678', NULL),
('Yemisi Balogun', '1 Lagos-Abeokuta Exp., Sango, Ogun', '1990-06-05', 'NHIS - Leadway', 'ybalogun', 'yemisi_pw', 'yemisi.b@gmail.com', '09013456789', NULL);

-- populate the departments table

INSERT INTO Departments ("Department Name") VALUES
('Cardiology'),
('Neurology'),
('Orthopaedics'), 
('Paediatrics'),  
('Oncology'),
('Dermatology'),
('Radiology'),
('Emergency Medicine'),
('Internal Medicine'),
('Surgery'),
('Anaesthesiology'), 
('Psychiatry'),
('Ophthalmology'),
('Urology'),
('Gastroenterology'),
('Pulmonology'),
('Endocrinology'),
('Nephrology'),
('Rheumatology'),
('Infectious Diseases'),
('Haematology'), 
('Geriatrics'),
('Physiotherapy'),
('Dietetics'),
('Pharmacy');

SELECT * FROM Departments;

INSERT INTO Doctors ("Full Name", DepartmentID) VALUES
('Dr. Ngozi Eze', 1),  
('Dr. Tunde Ahmed', 2),  
('Dr. Amina Bello', 3), 
('Dr. Kemi Okoro', 4),  
('Dr. Chinedu Okafor', 5),
('Dr. Zara Bello', 1),   
('Dr. Femi Johnson', 2), 
('Dr. Adaeze Williams', 3),
('Dr. Segun Adeoye', 4),  
('Dr. Aisha Yakubu', 5), 
('Dr. Ifeanyi Kalu', 6), 
('Dr. Bola Adekunle', 7),
('Dr. Chris Obinna', 8), 
('Dr. Maryam Bello', 9), 
('Dr. David Idem', 10),  
('Dr. Precious Chukwu', 11), 
('Dr. Jide Olawale', 12),  
('Dr. Hauwa Sani', 13),  
('Dr. Emeka Ani', 14),   
('Dr. Bimpe Alabi', 15), 
('Dr. Musa Dankano', 16),
('Dr. Gloria Uche', 17);

SELECT * FROM Doctors;

INSERT INTO Appointments (PatientID, "Doctor ID", "Appointment Date", "Appointment Time", DepartmentID, "Appointment Status") VALUES
(1, 1, '2025-08-20', '10:00:00', 1, 'completed'),
(2, 2, '2025-08-21', '11:30:00', 2, 'pending'),
(3, 3, '2025-08-22', '09:00:00', 3, 'completed'),
(4, 4, '2025-08-23', '14:00:00', 4, 'cancelled'),
(5, 5, '2025-08-24', '15:00:00', 5, 'pending'),
(6, 6, '2025-08-25', '09:30:00', 1, 'completed'),
(7, 7, '2025-08-26', '10:00:00', 2, 'pending'),
(8, 8, '2025-08-27', '11:00:00', 3, 'completed'),
(9, 9, '2025-08-28', '13:00:00', 4, 'pending'),
(10, 10, '2025-08-29', '14:30:00', 5, 'completed'),
(11, 11, '2025-09-01', '08:00:00', 6, 'pending'),
(12, 12, '2025-09-02', '16:00:00', 7, 'completed'),
(13, 13, '2025-09-03', '09:00:00', 8, 'pending'),
(14, 14, '2025-09-04', '10:00:00', 9, 'completed'),
(15, 15, '2025-09-05', '11:00:00', 10, 'pending'),
(16, 16, '2025-09-06', '12:00:00', 11, 'completed'),
(17, 17, '2025-09-07', '13:00:00', 12, 'pending'),
(18, 18, '2025-09-08', '14:00:00', 13, 'completed'),
(19, 19, '2025-09-09', '15:00:00', 14, 'pending'),
(20, 20, '2025-09-10', '16:00:00', 15, 'completed'),
(21, 1, '2025-09-11', '09:00:00', 1, 'pending'),
(22, 2, '2025-09-12', '10:00:00', 2, 'completed');

SELECT * FROM Appointments;

-- populating the medical records

INSERT INTO "Medical Records" (PatientID, "Appointment ID", Diagnoses, Medication, "Date Prescribed", Allergies) VALUES
(1, 1, 'Malaria (confirmed)', 'Artemether/Lumefantrine 80/480mg', '2025-08-20', 'Sulfonamides'),
(3, 3, 'Typhoid Fever', 'Ciprofloxacin 500mg', '2025-08-22', 'No known allergies'),
(2, 7, 'Hypertension, Stage 1', 'Lisinopril 5mg', '2025-08-26', 'ACE inhibitors (cough)'),
(4, 4, 'Common cold, re-scheduled for flu', 'Paracetamol 500mg, Decongestant nasal spray', '2025-08-23', 'None'),
(5, 5, 'Suspected Prostate Cancer', 'Biopsy scheduled', '2025-08-24', 'Contrast Dye'),
(6, 6, 'Routine antenatal check-up', 'Folic Acid, Iron supplements', '2025-08-25', 'None'),
(7, 7, 'Chronic Back Pain (Lumbar)', 'NSAIDs topical gel, Physiotherapy referral', '2025-08-26', 'Ibuprofen'),
(8, 8, 'Diabetic Foot Ulcer', 'Antibiotics (Amoxicillin/Clavulanic Acid), Wound dressing', '2025-08-27', 'Penicillin'),
(9, 9, 'Childhood Malaria', 'Artemether/Lumefantrine (paediatric suspension)', '2025-08-28', 'None'),
(10, 10, 'Asthma exacerbation', 'Salbutamol inhaler, Prednisolone', '2025-08-29', 'Aspirin'),
(11, 11, 'Skin Rash (Dermatitis)', 'Hydrocortisone cream', '2025-09-01', 'Latex'),
(12, 12, 'Fractured Tibia (closed)', 'Painkillers, Cast application', '2025-09-02', 'Tramadol'),
(13, 13, 'Viral Fever', 'Paracetamol, Rest', '2025-09-03', 'None'),
(14, 14, 'Cataract (right eye)', 'Surgery scheduled', '2025-09-04', 'Lidocaine'),
(15, 15, 'Kidney Stones (minor)', 'Hydration, Pain management', '2025-09-05', 'Diclofenac'),
(16, 16, 'Post-stroke rehabilitation', 'Physiotherapy sessions, Blood thinners', '2025-09-06', 'Warfarin'),
(17, 17, 'Depression', 'Antidepressants (SSRIs)', '2025-09-07', 'St. John''s Wort'),
(18, 18, 'Childhood Immunization', 'Vaccine administered', '2025-09-08', 'Egg proteins'),
(19, 19, 'Routine Check-up', 'Multivitamins', '2025-09-09', 'None'),
(20, 20, 'Arthritis (Osteoarthritis)', 'NSAIDs, Glucosamine', '2025-09-10', 'Codeine'),
(21, 1, 'Follow-up for Hypertension', 'Medication adjusted', '2025-09-11', 'Sulfonamides'),
(22, 2, 'New patient consultation', 'Blood tests ordered', '2025-09-12', 'None');

SELECT * FROM "Medical Records";

-- Populating the "Doctor Reviews" Table 
INSERT INTO "Doctor Reviews" ("Doctor ID", DepartmentID, Review, Rating) VALUES
(1, 1, 'Dr. Eze is incredibly thorough and empathetic. Best cardiologist in Lagos!', 5),
(2, 2, 'Dr. Ahmed explained my neurological issues clearly. Very patient.', 4),
(3, 3, 'Dr. Bello is an excellent orthopaedic surgeon. My recovery has been smooth.', 5),
(4, 4, 'Dr. Okoro is wonderful with children. My child was not scared at all.', 5),
(5, 5, 'Dr. Okafor provided compassionate care and clear treatment options for oncology.', 4),
(6, 1, 'Dr. Zara Bello is highly professional and made me feel comfortable.', 5),
(7, 2, 'Dr. Femi Johnson quickly identified the cause of my migraines.', 4),
(8, 3, 'Dr. Adaeze Williams gave clear post-op instructions. Very helpful.', 5),
(9, 4, 'Dr. Segun Adeoye is very friendly and good with young patients.', 5),
(10, 5, 'Dr. Aisha Yakubu provided excellent support during a difficult time.', 5),
(11, 6, 'Dr. Kalu solved my chronic skin problem. Highly recommend!', 4),
(12, 7, 'Dr. Bola Adekunle explained the complex scan results in a simple way.', 3),
(13, 8, 'Dr. Chris Obinna handled my emergency with impressive speed and calm.', 5),
(14, 9, 'Dr. Maryam Bello is a very attentive and knowledgeable internal medicine specialist.', 4),
(15, 10, 'Dr. David Idem is a brilliant surgeon. The scar is barely visible.', 5),
(16, 11, 'Dr. Precious Chukwu made the anaesthesia process seamless and reassuring.', 5),
(17, 12, 'Dr. Jide Olawale truly listened to my concerns and offered practical solutions.', 4),
(18, 13, 'Dr. Hauwa Sani was very patient and meticulous with my eye examination.', 4),
(19, 14, 'Dr. Emeka Ani provided excellent care for my urological issue.', 5),
(20, 15, 'Dr. Bimpe Alabi helped me manage my digestive discomfort effectively.', 5),
(1, 1, 'Always a pleasure seeing Dr. Eze. She truly cares.', 5),
(2, 2, 'Another informative session with Dr. Ahmed. Feeling much better.', 4);

SELECT * FROM "Doctor Reviews";

