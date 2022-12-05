SET GLOBAL local_infile=1;
GRANT ALL PRIVILEGES ON schoolar.* TO 'chatree'@'localhost';
FLUSH PRIVILEGES;

load data local infile 'schoolar/student_mock.csv' 
into table Student 
fields terminated by ',';

load data local infile 'schoolar/provider_mock.csv' 
into table Provider 
fields terminated by ',';

load data local infile 'schoolar/scholarship_mock.csv' 
into table Scholarship 
fields terminated by ',';

load data local infile 'schoolar/subscription_mock.csv' 
into table Subscription
fields terminated by ',';

load data local infile 'schoolar/transactionrecord_mock.csv' 
into table TransactionRecord
fields terminated by ',';

load data local infile 'schoolar/pinning_mock.csv' 
into table Pinning 
fields terminated by ',';

