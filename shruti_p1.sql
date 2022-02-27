drop table Person cascade constraints;
drop table Employees cascade constraints;
drop table Nurses cascade constraints;
drop table Staff cascade constraints;
drop table Technicians cascade constraints;
drop table Assigned cascade constraints;
drop table Lab cascade constraints;
drop table Skill cascade constraints;
drop table Volunteer cascade constraints;
drop table Physician cascade constraints;
drop table Patients cascade constraints;
drop table Inpatient cascade constraints;
drop table Outpatient cascade constraints;
drop table Visit cascade constraints;

CREATE TABLE Person (
	Person_id int primary key, 
	Name varchar(255), 
	Phone char(10), 
	Birth_date date, 
	Street_address varchar(255), 
	City varchar(255), 
	State varchar(255), 
	Zip_code char(5));


CREATE TABLE Physician (
	Phys_ID int NOT NULL, 
	Speciality varchar(255), 
	Pager# int, 
	PRIMARY KEY (Phys_ID), 
	FOREIGN KEY (Phys_ID) REFERENCES Person(Person_ID));


CREATE TABLE Volunteer (
	Volunteer_ID int NOT NULL, 
	Skill varchar(255), 
	PRIMARY KEY(Volunteer_ID), 
	FOREIGN KEY (Volunteer_ID) REFERENCES Person(Person_ID));


CREATE TABLE Employees (
	Emp_ID int NOT NULL, 
	Date_hired date, 
	PRIMARY KEY (Emp_ID), 
	FOREIGN KEY (Emp_ID) References Person(Person_ID));


CREATE TABLE Nurses (
	Nurse_ID int NOT NULL, 
	Certificate varchar(255), 
	PRIMARY KEY (Nurse_ID), 
	FOREIGN KEY (Nurse_ID) References Employees(Emp_ID));

CREATE TABLE Technicians (
	Tech_ID int NOT NULL, 
	PRIMARY KEY (Tech_ID), 
	FOREIGN KEY (Tech_ID) References Employees(Emp_ID));


CREATE TABLE Skill (
	Tech_ID int NOT NULL, 
	Tskill varchar(255), 
	PRIMARY KEY (Tech_ID, Tskill), 
	FOREIGN KEY (Tech_ID) References Technicians(Tech_ID));


CREATE TABLE Staff (
	Staff_ID int NOT NULL, 
	Job_class varchar(255), 
	PRIMARY KEY (Staff_ID), 
	FOREIGN KEY (Staff_ID) References Employees (Emp_ID));

CREATE TABLE Lab (
	Name varchar(255), 
	Location varchar(255), 
	PRIMARY KEY (Name));


CREATE TABLE Assigned (
	Lname varchar(255), 
	Ltech_ID int NOT NULL, 
	PRIMARY KEY(Lname, Ltech_ID), 
	FOREIGN KEY (Lname) References Lab(Name), 
	FOREIGN KEY (Ltech_ID) References Technicians (Tech_ID));

CREATE TABLE Patients (
	Patient_ID int NOT NULL, 
	Contact_date date, 
	Phy_ID int, 
	PRIMARY KEY (Patient_ID), 
	FOREIGN KEY (Patient_ID) References Person(Person_ID), 
	FOREIGN KEY(Phy_ID) References Physician (Phys_ID));

CREATE TABLE Inpatient(
	In_ID int NOT NULL, 
	Date_admitted date, 
	PRIMARY KEY(In_ID), 
	FOREIGN KEY(In_ID) References Patients(Patient_ID));


CREATE TABLE Outpatient (
	Out_ID int NOT NULL, 
	PRIMARY KEY(Out_ID), 
	FOREIGN KEY(Out_ID) References Patients(Patient_ID));


CREATE TABLE Visit (
	O_ID int NOT NULL, 
	Vdate date, 
	Comments varchar(255), 
	PRIMARY KEY(Vdate), 
	FOREIGN KEY (O_ID) References Outpatient(Out_ID));

INSERT INTO Person values(1, 'Preeti', '7039098843', '19-feb-1998', '101 Chantilly Rd', 'Chantilly', 'VA', '20120');

INSERT INTO Person values(2, 'Yumna', '7038467781', '16-sep-1999', '223 Chantilly Dr', 'South Riding', 'VA', '20152');

INSERT INTO Person VALUES (3, 'Michael', '7863548891', '12-mar-1999', '254 Loudoun Rd', 'Aldie', 'VA', '20148');

INSERT INTO Person values('4', 'Dr.Smith', '7864329876', '05-aug-1988', '993 Simpsons Ln', 'Fairfax', 'VA', '22030');

INSERT INTO Person values ('5', 'Dr.Patel', '5714563455', '22-jul-1969', '345 West Dr', 'Fairfax', 'VA', '22030');

INSERT INTO Person values ('6', 'Rachel', '5719887644', '12-dec-1987', '445 Patagonia St' , 'Ashburn', 'VA', '20147');

INSERT INTO Person values ('7', 'Joe', '7035162345', '08-jul-1990', '765 King St' ,'Reston' ,'VA', '20170');

INSERT INTO Person values ('8', 'Bob', '7867458853', '15-aug-1985' , '899 Lake Hiawatha', 'Reston', 'VA', '20170');

INSERT INTO Person values ('9', 'Eddy', '5713452267', '13-jun-1983', '234 Parsipanny Dr' , 'Herndon', 'VA', '20172');

INSERT INTO Person values ('10', 'Mary', '7863426678', '24-sep-1966', '278 Herndon Junction', 'Herndon', 'VA', '20170');

INSERT INTO Person values ('11', 'Stanley', '5713672234', '17-may-1984', '778 Vestals Gap' , 'Ashburn' , 'VA', '20147');

INSERT INTO Person values ('12', 'Jennifer', '7863239987', '18-may-1991', '865 Normandy Dr', 'Alexandria', 'VA', '22206');

INSERT INTO Person values ('13', 'Luke' , '5714562231', '26-aug-2000', '645 Langley Ct', 'South Riding' , 'VA', '20152');

INSERT INTO Person values ('14', 'John', '7031145643', '12-sep-1963', '125 Red Ln', 'Annandale', 'VA', '22003');

INSERT INTO Person values ('15', 'Dr.Geller', '5714536766', '23-aug-1979', '112 Dusty Ln', 'Herndon', 'VA', '20172');

INSERT INTO Person values ('16', 'Dr.Scott', '7034552356', '13-feb-1972', '343 Shirley Ave', 'Fairfax', 'VA', '22030');

INSERT INTO Person values ('17', 'Dr.Deng', '6554358876', '29-mar-1965', '342 Reston Dr', 'Reston', 'VA', '20190');

INSERT INTO Person values ('18', 'Richard', '8145677765', '19-aug-1965', '654 Paradise St', 'Ashburn', 'VA', '20148');

INSERT INTO Person values ('19', 'Jack', '7864732344', '05-sep-1987', '745 James Ct', 'Annandale', 'VA', '22003');

INSERT INTO Person values ('20', 'Marisa', '9734468765', '15-jun-1994', '913 Jolly St', 'Aldie', 'VA', '20105');

INSERT INTO Person values ('21', 'Jill', '7868732344', '16-oct-1987', '513 Sudley Ct', 'Aldie', 'VA', '20105');

INSERT INTO Person values ('22', 'Sanjay', '5718732344', '09-feb-2001', '112 Crossing Ct', 'Ashburn', 'VA', '20148');


INSERT INTO Physician values ('4', 'Cardiologist', '1234');

INSERT INTO Physician values ('5', 'Gynecologist', '2345');

INSERT INTO Physician values ('15', 'ENT', '3422');

INSERT INTO Physician values ('16', 'Derm', '4544');

INSERT INTO Physician values ('17', 'ENT', '7866');


INSERT INTO Volunteer values('1', 'Emergency');

INSERT INTO Volunteer values('2', 'Patient Care');

INSERT INTO Volunteer values ('20', 'Front Desk');



INSERT INTO Employees values ('6', '20-feb-2005');

INSERT INTO Employees values('7', '05-jun-2007');

INSERT INTO Employees values('3', '17-sep-1999');

INSERT INTO Employees values ('12', '27-dec-2010');

INSERT INTO Employees values ('8', '17-nov-2011');

INSERT INTO Employees values('9', '19-jan-2009');

INSERT INTO Employees values ('19', '10-jan-2008');

INSERT INTO Employees values ('18', '18-oct-1996');

INSERT INTO Employees values ('21', '06-jul-2000');

INSERT INTO Employees values ('22', '12-jun-2015');


INSERT INTO Nurses values ('6', 'RN');

INSERT INTO Nurses values ('7', 'FN');

INSERT INTO Nurses values ('18', 'RN');


INSERT INTO Technicians values ('8');

INSERT INTO Technicians values ('9');

INSERT INTO Technicians values ('19');


INSERT INTO Skill values ('8', 'Patient Record');

INSERT INTO Skill values ('8', 'Pharmacy');

INSERT INTO Skill values ('8', 'Lab Equipment');

INSERT INTO Skill values ('9', 'Patient Record');

INSERT INTO Skill values ('19', 'Lab Equipment');

INSERT INTO Skill values ('19', 'Lab Cleanup');

INSERT INTO Skill values ('8', 'Chemical');

INSERT INTO Skill values ('19', 'Chemical');


INSERT INTO Staff values ('3', 'Therapist');

INSERT INTO Staff values ('12', 'Dietician');

INSERT INTO Staff values ('21', 'Therapist');

INSERT INTO Staff values ('22', 'Dietician');


INSERT INTO Lab values ('Anderson', 'Fairfax');

INSERT INTO Lab values ('Crane', 'Ashburn');

INSERT INTO Lab values ('Johnson', 'Chantilly');


INSERT INTO Assigned values ('Anderson', '8');

INSERT INTO Assigned values ('Johnson', '19');

INSERT INTO Assigned values ('Crane', '9');

INSERT INTO Assigned values ('Anderson', '9');


INSERT INTO Patients values ('1', '18-sep-2019', '15');

INSERT INTO Patients values ('20', '04-jul-2018', '4');

INSERT INTO Patients values ('10', '16-sep-2020', '4');

INSERT INTO Patients values ('11', '08-jan-2020', '5');

INSERT INTO Patients values ('13', '23-jul-2019', '16');

INSERT INTO Patients values ('14', '04-apr-2018', '4');


INSERT INTO Inpatient values ('20', '05-jul-2018');

INSERT INTO Inpatient values ('11', '09-jan-2020');

INSERT INTO Inpatient values ('14', '04-apr-2018');


INSERT INTO Outpatient values ('1');

INSERT INTO Outpatient values ('10');

INSERT INTO Outpatient values ('13');


INSERT INTO Visit values ('10', '16-oct-2020', 'Unwell');

INSERT INTO Visit values ('10', '05-nov-2020', 'Checkup');

INSERT INTO Visit values ('10', '30-nov-2020', 'Final Check');

INSERT INTO Visit values ('13', '15-aug-2019', 'Sick');

INSERT INTO Visit values ('13', '30-aug-2019', 'Sicker');

INSERT INTO Visit values ('13', '15-sep-2019', 'Checkup');

INSERT INTO Visit values ('13', '30-oct-2019', 'Checkup');

INSERT INTO Visit values ('1', '18-oct-2020', 'Checkup');

INSERT INTO Visit values ('1', '31-oct-2020', 'Final Checkup');


SELECT * FROM Person;

SELECT * FROM Physician;

SELECT * FROM Volunteer;

SELECT * FROM Employees;

SELECT * FROM Nurses;

SELECT * FROM Technicians;

SELECT * FROM Skill;

SELECT * FROM Staff;

SELECT * FROM Lab;

SELECT * FROM Assigned;

SELECT * FROM Patients;

SELECT * FROM Inpatient;

SELECT * FROM Outpatient;

SELECT * FROM Visit;


COMMIT WORK;