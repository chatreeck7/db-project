-- CREATE DATABASE schoolar;
-- GRANT ALL PRIVILEGES ON schoolar.* TO <''>@'localhost';
-- FLUSH PRIVILEGES;
USE schoolar;
-- Student Entity
CREATE TABLE IF NOT EXISTS Student (
	u_id varchar(10) PRIMARY KEY,
	tnid varchar(13) not null unique,
	email varchar(255) not null unique,
	fullname varchar(60) not null,
	tel char(12) not null,
	username varchar(50) not null unique,
	user_password varchar(60) not null,
	address text,
	gpax float,
	test_score text,
	skills text,
	degree char(50)
);

-- Subscription Entity
CREATE TABLE IF NOT EXISTS Subscription(
	s_type ENUM("MP","YP") PRIMARY KEY,
    description TEXT not null,
    price DECIMAL not null
);

-- Provider Entity
CREATE TABLE IF NOT EXISTS Provider(
    u_id VARCHAR(10) PRIMARY KEY,
    email VARCHAR(255) not null unique,
    tel	CHAR(12) not null,
    username VARCHAR(50) not null unique,	
    user_password VARCHAR(60) not null,	
    address	TEXT,
    fullname TEXT not null,	
    schoolar_credit	INT not null,
    approve_status BOOLEAN not null,
    visibility BOOLEAN not null,
    next_payment_date DATETIME,	
    s_type ENUM("MP","YP"),
    CONSTRAINT FK_s_type FOREIGN KEY(s_type) 
    REFERENCES Subscription(s_type) ON UPDATE CASCADE ON DELETE CASCADE 
); 
-- Scholarship Entity 
CREATE TABLE IF NOT EXISTS Scholarship (
	scholarship_id VARCHAR(10) PRIMARY KEY,
	scholarship_name VARCHAR(255) NOT NULL,
	detail TEXT,
	deadline_apply DATE NOT NULL,
	requirement TEXT NOT NULL,
	web_link VARCHAR(255),
	u_id VARCHAR(10) NOT NULL,
	CONSTRAINT FK_u_id_provider FOREIGN KEY(u_id) 
	REFERENCES Provider(u_id) ON UPDATE CASCADE ON DELETE RESTRICT
);
-- Pinning Relationship
CREATE TABLE IF NOT EXISTS Pinning(
	u_id VARCHAR(10),
	scholarship_id VARCHAR(10),
	PRIMARY KEY(u_id, scholarship_id),
	CONSTRAINT FK_u_id_student FOREIGN KEY(u_id) 
	REFERENCES Student(u_id) ON UPDATE CASCADE ON DELETE CASCADE ,
	CONSTRAINT FK_scholarship_id FOREIGN KEY(scholarship_id) 
	REFERENCES Scholarship(scholarship_id) ON UPDATE CASCADE ON DELETE CASCADE 
);

-- TransactionRecord Entity
CREATE TABLE IF NOT EXISTS TransactionRecord (
	transaction_id VARCHAR(10) PRIMARY KEY,
	payment_method TEXT not null,
	amount DECIMAL not null,
	status ENUM("PAID","UNPAID") not null,
	timestamp DATETIME,
	u_id VARCHAR(10) not null,
	CONSTRAINT FK_u_id FOREIGN KEY(u_id) 
	REFERENCES Provider(u_id) ON UPDATE CASCADE ON DELETE CASCADE 
);
