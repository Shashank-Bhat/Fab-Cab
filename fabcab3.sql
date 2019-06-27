--Create Table Commands fro main_user and Driver Tables
DROP DATABASE fabcab;
CREATE DATABASE fabcab;
\c fabcab;
create table trip
(
    Trip_id varchar(20) PRIMARY KEY,
    Start_point varchar(20),
    Dest_Point varchar(20),
    Fare int,
    Rating int
    constraint t1
       check(Rating<=5)
);

create table main_user
(
User_ID varchar(10) PRIMARY KEY,
Rating int,
Name varchar(50) NOT NULL,
Email varchar(20) NOT NULL,
Address varchar(100),
Phone_Number varchar(10),
Booking_Type varchar(10) NOT NULL,
Booking_ID int,
constraint book_type check(Booking_Type = 'Economy' OR Booking_Type = 'Mid-range' OR Booking_Type = 'Luxury'),
trip_id varchar(20),
constraint u1
   FOREIGN KEY(trip_id) references trip(Trip_id));



create table driver
(
Driver_ID varchar(10) PRIMARY KEY,
Rating int,
Name varchar(50) NOT NULL,
DOB varchar(10) NOT NULL,
Address varchar(100),
Criminal_Check varchar(10),
Phone varchar(10),
constraint c_check check(Criminal_Check = 'YES' OR Criminal_Check = 'NO'),
Trip_id varchar(20),
constraint cs2
    FOREIGN KEY(Trip_id) references trip(Trip_ID));

create table License_Details
(
    License_Number varchar(20) PRIMARY KEY NOT NULL,
    License_Expiry varchar(20) not null,
    RTO varchar(20),
    Driver_ID varchar(10),
    constraint cs1
      FOREIGN KEY(Driver_ID) references driver(Driver_ID)
);

create table vehicle
(
    Reg_No varchar(20) PRIMARY KEY NOT NULL,
    capacity int,
    model varchar(20) NOT NULL,
    color varchar(10),
    driver_ID varchar(10),
    constraint cs2
      FOREIGN KEY(driver_ID) references driver(Driver_ID)
);

create table payment
(
    Payment_ID varchar(20) PRIMARY KEY,
    Payment_method varchar(20),
    Trip_ID varchar(20),
    User_ID varchar(20),
    constraint cs1
       FOREIGN KEY(Trip_ID) references trip(Trip_ID),
    constraint cs2
        FOREIGN KEY(User_ID) references main_user(User_ID)
);

create table Discount
(
    Trip_ID varchar(20) PRIMARY KEY,
    Customer_ID varchar(20),
    Amount int,
    constraint cs1
       FOREIGN KEY(Trip_ID) references trip(Trip_ID),
    constraint cs2
        FOREIGN KEY(Customer_ID) references main_user(User_ID)
);

create table complaint
(
    Complaint_ID  varchar(20) PRIMARY KEY,
    Customer_ID varchar(20),
    Comments varchar(100),
    constraint cs1
        FOREIGN KEY(Customer_ID) references main_user(User_ID)
);

create table customer_care
(
    Complaint_ID  varchar(20),
    Representative_ID varchar(20) PRIMARY KEY,
    constraint cs1
        FOREIGN KEY (Complaint_ID) references complaint(Complaint_ID)
);





--Insertion commands
--For main_user

insert into trip values('T00001','Thanisandra','Shivajinagar',120,3);
insert into trip values('T00002','Koramangala','Banashankari',230,4);
insert into trip values('T00003','Kalyan nagar','Electronic city',350,2);
insert into trip values('T00004','Goraguntepalya','Orion mall',175,4);
insert into trip values('T00005','Hoskote','Phoenix market city',200,5);
insert into trip values('T00006','Tannery road','Cubbon Park',110,3);
insert into trip values('T00007','Church street','Marathahalli',210,1);
insert into trip values('T00008','Indiranagar','Airport',550,4);
insert into trip values('T00009','Bannerghatta','Sarjapur road',400,5);
insert into trip values('T00010','SP road','Kalasipalya',220,4);
insert into trip values('T00011','Rajajinagar','Shivajinagar',124,3);
insert into trip values('T00012','Jayanagar','Banashankari',240,4);
insert into trip values('T00013','Tyagrajnagar','Hoskerehalli',310,2);
insert into trip values('T00014','Whitefield','Mantri Mall',195,4);
insert into trip values('T00015','Rajarajeshwarinagar','Ring Road',220,3);
insert into trip values('T00016','JC Road','Cubbon Park',100,3);
insert into trip values('T00017','MG Road','Chinnaswamy Stadium',200,2);
insert into trip values('T00018','Marathahalli','Airport',500,5);
insert into trip values('T00019','Brigade Road','Girinagar',330,5);
insert into trip values('T00020','Indiranagar','Sanjaynagar',250,4);

insert into main_user values('U00001',4,'Ramesh Rao', 'ramesh@gmail.com','#300, 5th Street, BSK, Bangalore - 560090',9988776655,'Economy',03245,'T00001');
insert into main_user values('U00002',5,'Amjad Khan', 'aj@gmail.com','#447, 5th Street, Jayanagar, Bangalore - 560093',9945676655,'Luxury',01234,'T00002');
insert into main_user values('U00003',2,'Divya Rao', 'divya@gmail.com','#90, 8th Street, Indiranagar, Bangalore - 560019',9976776655,'Economy',07245,'T00003');
insert into main_user values('U00004',2,'Priya Kumar', 'pk@gmail.com','#34, 7th Street, Koramangala, Bangalore - 560000',9338776655,'Economy',03678,'T00004');
insert into main_user values('U00005',3,'Shashank Prabhakar', 'sp@gmail.com','#987, 2nd Street, Basavangudi, Bangalore - 560070',9988776655,'Economy',04356,'T00005');
insert into main_user values('U00006',5,'Sayantan Nandy', 'nandy@gmail.com','#67, 1st Street, BSK, Bangalore - 560063',9222376655,'Mid-range',07895,'T00006');
insert into main_user values('U00007',3,'Ritesh Kumar', 'rk@gmail.com','#443, 8th Street, Jayanagar, Bangalore - 560078',9666776655,'Economy',09856,'T00007');
insert into main_user values('U00008',4,'Shashank Bhat', 'bhat@gmail.com','#456, 9th Street, Kalyan Nagar, Bangalore - 560091',9988777775,'Luxury',06543,'T00008');
insert into main_user values('U00009',5,'William Douglas', 'will@gmail.com','#54, 10th Street, JP Nagar, Bangalore - 560075',9988234365,'Luxury',08756,'T00009');
insert into main_user values('U00010',4,'Susan Hillary', 'susan@gmail.com','#6, 3rd Street, BSK, Bangalore - 560022',9988876655,'Economy',05412,'T00010');
insert into main_user values('U00011',4,'Satyam', 'satyam@gmail.com','#300, 5th Street, Jayanagar, Bangalore - 560099',9123776655,'Luxury',03265,'T00011');
insert into main_user values('U00012',5,'Rohan R', 'rr@gmail.com','#447, 5th Street, Sanjaynagar, Bangalore - 560092',9895676655,'Luxury',01245,'T00012');
insert into main_user values('U00013',2,'Neha Rao', 'neha@gmail.com','#90, 8th Street, JC Nagar, Bangalore - 560029',9976776532,'Mid-range',07247,'T00013');
insert into main_user values('U00014',2,'Sharath Menon', 'sharath@gmail.com','#368, 7th Street, Koramangala, Bangalore - 560020',9848776654,'Economy',03378,'T00014');
insert into main_user values('U00015',3,'Rohit U', 'bogi@gmail.com','#987, 2nd Street, Hoskerehalli, Bangalore - 560080',7988776655,'Mid-Range',04358,'T00015');
insert into main_user values('U00016',5,'Shailesh Sridhar', 'shailesh@gmail.com','#67, 1st Street, Vidyanagar, Bangalore - 560067',8222376655,'Mid-range',06895,'T00016');
insert into main_user values('U00017',3,'Syed Ahmed', 'syed@gmail.com','#43, 18th Street, Whitefield, Bangalore - 560077',9666778634,'Luxury',09846,'T00017');
insert into main_user values('U00018',4,'Chris Adams', 'chris@gmail.com','#46, 19th Street, Indiranagar, Bangalore - 560093',9988734695,'Economy',06542,'T00018');
insert into main_user values('U00019',5,'Sanjay Kattapa', 'sanjay@gmail.com','#54, 10th Street, Magadi Nagar, Bangalore - 560077',9788234765,'Luxury',06756,'T00019');
insert into main_user values('U00020',4,'Katrina Shenoy', 'katrina@gmail.com','#6, 3rd Street, Santa Cruz, Bangalore - 560024',9924676655,'Economy',05312,'T00020');


--for driver
insert into driver values('D00001',3,'Siddu Swamy','03-02-1978','#32, 2nd Main, 3rd Cross, Vijaynagar, Bangalore - 560080', 'NO', 9900884433,'T00001');
insert into driver values('D00002',4,'Suresh Iyer','13-03-1988','#6, 1st Main, Ashoknagar, Bangalore - 560086', 'NO', 9906545433,'T00002');
insert into driver values('D00003',2,'Mohammed Basheer','05-02-1968','#311, 3rd Cross, Jayanagar, Bangalore - 560093', 'NO', 9900004433,'T00003');
insert into driver values('D00004',5,'Junaid Khan','03-12-1978','#77, 2nd Main, 3rd Cross, BSK, Bangalore - 560010', 'YES', 8990065453,'T00004');
insert into driver values('D00005',4,'Devendra Gowda','23-04-1976','#89, 5th Main, Basavanagudi, Bangalore - 560092', 'YES', 9100884421,'T00005');
insert into driver values('D00006',3,'Shankar Deva','11-09-1979','#372, 2nd Main, HSR Layout, Bangalore - 560077', 'NO', 9231884433,'T00006');
insert into driver values('D00007',4,'Rajesh Kumar','01-10-1969','476, 8th Main, 4th Cross, Kalyan Nagar, Bangalore - 560050', 'NO', 9900884900,'T00007');
insert into driver values('D00008',5,'Eswariah S','06-04-1973','#577, 7th Main, 3rd Cross, Koramangala, Bangalore - 560043', 'NO', 9124584433,'T00008');
insert into driver values('D00009',4,'Anoop K','03-01-1979','#522, 3rd Main, 1st Cross, Jayanagar, Bangalore - 560098', 'NO', 9905434433,'T00009');
insert into driver values('D00010',3,'Yashas Rao','31-01-1978','#43, 1st Main, 7th Cross, Vijaynagar, Bangalore - 560001', 'YES', 9474954433,'T00010');
insert into driver values('D00011',3,'Diwakar Hegde','31-01-1978','#43, 1st Main, 7th Cross, Vijaynagar, Bangalore - 560001', 'YES', 9474954433,'T00011');
insert into driver values('D00012',2,'Chris Angel','31-01-1978','#43, 1st Main, 7th Cross, Vijaynagar, Bangalore - 560001', 'YES', 9474954433,'T00012');
insert into driver values('D00013',4,'Mohammed Bin Tuglaq','31-01-1978','#43, 1st Main, 7th Cross, Vijaynagar, Bangalore - 560001', 'YES', 9474954433,'T00013');
insert into driver values('D00014',4,'Alia Bhatt','31-01-1978','#43, 1st Main, 7th Cross, Vijaynagar, Bangalore - 560001', 'YES', 9474954433,'T00014');
insert into driver values('D00015',3,'','31-01-1977','#34, 4th Main, 6th Cross, KR puram, Bangalore - 560029', 'YES', 9474954433,'T00015');
insert into driver values('D00016',3,'Yashas Rao','31-01-1978','#43, 1st Main, 7th Cross, Vijaynagar, Bangalore - 560001', 'YES', 9474954433,'T00016');
insert into driver values('D00017',5,'Yashas Rao','31-01-1978','#43, 1st Main, 7th Cross, Vijaynagar, Bangalore - 560001', 'YES', 9474954433,'T00017');
insert into driver values('D00018',5,'Yashas Rao','31-01-1978','#43, 1st Main, 7th Cross, Vijaynagar, Bangalore - 560001', 'YES', 9474954433,'T00018');
insert into driver values('D00019',3,'Yashas Rao','31-01-1978','#43, 1st Main, 7th Cross, Vijaynagar, Bangalore - 560001', 'YES', 9474954433,'T00019');
insert into driver values('D00020',2,'Yashas Rao','31-01-1978','#43, 1st Main, 7th Cross, Vijaynagar, Bangalore - 560001', 'YES', 9474954433,'T00020');

insert into License_Details values('L00001','AUG 2019','KR Puram','D00002');
insert into License_Details values('L00002','FEB 2029','Electronic city','D00001');
insert into License_Details values('L00003','APR 2030','Hoskote','D00005');
insert into License_Details values('L00004','JAN 2021','Hubli','D00006');
insert into License_Details values('L00005','MAY 2022','Davangere','D00004');
insert into License_Details values('L00006','JUNE 2032','Chitradurga','D00003');
insert into License_Details values('L00007','JULY 2039','Banashankari','D00009');
insert into License_Details values('L00008','NOV 2031','Yelahanka','D00010');
insert into License_Details values('L00009','DEC 2020','Mysore','D00008');
insert into License_Details values('L00010','SEP 2025','Madikeri','D00007');
insert into License_Details values('L00011','SEP 2022','KR puram','D00011');
insert into License_Details values('L00012','AUG 2021','Electronic city','D00012');
insert into License_Details values('L00013','JUN 2031','Jayanagar','D00013');
insert into License_Details values('L00014','MAR 2029','BSK','D00014');
insert into License_Details values('L00015','FEB 2026','Vijaynagar','D00015');
insert into License_Details values('L00016','NOV 2027','Ring road','D00016');
insert into License_Details values('L00017','OCT 2025','Whitefield','D00017');
insert into License_Details values('L00018','SEP 2025','Indiranagar','D00018');
insert into License_Details values('L00019','OCT 2025','Kalasipalya','D00019');
insert into License_Details values('L00020','DEC 2021','Thodesandhi playa','D00020');

insert into vehicle values('KA045678',4,'Alto','Red','D00001');
insert into vehicle values('KA057896',6,'Honda CRV','Grey','D00003');
insert into vehicle values('KA035668',4,'Tesla model x','Black','D00002');
insert into vehicle values('KA034675',6,'G wagon','Black','D00005');
insert into vehicle values('KA025665',3,'Porsche 911','Yellow','D00006');
insert into vehicle values('KA041678',4,'Volkswagon','Blue','D00004');
insert into vehicle values('KA054678',5,'Range rover','white','D00008');
insert into vehicle values('KA064778',3,'Tata nano','yellow','D00007');
insert into vehicle values('KA039878',7,'Ford Endeavour','Black','D00010');
insert into vehicle values('KA047978',4,'Ferrari 458','Red','D00011');
insert into vehicle values('KA047978',2,'BMW Z4','Red','D00012');
insert into vehicle values('KA057178',4,'Audi R8','Black','D00013');
insert into vehicle values('KA067978',5,'Tesla model s','Red','D00014');
insert into vehicle values('KA072978',4,'BMW i8','white','D00015');
insert into vehicle values('KA084978',3,'Gumpert Apollo','Orange','D00016');
insert into vehicle values('KA091378',4,'La ferrari','Red','D00017');
insert into vehicle values('KA046678',4,'Koenigsegg Agera','Black','D00018');
insert into vehicle values('KA058478',2,'Bugatti Chiron','Blue','D00019');
insert into vehicle values('KA043578',3,'Pagani Zonda','Carbon Black','D00020');


insert into payment values('P00001','Cash','T00002','U00001');
insert into payment values('P00002','Card','T00001','U00002');
insert into payment values('P00003','FAB Wallet','T00004','U00004');
insert into payment values('P00004','Card','T00005','U00005');
insert into payment values('P00005','Cash','T00003','U00003');
insert into payment values('P00006','FAB Wallet','T00008','U00008');
insert into payment values('P00007','Paytm','T00006','U00006');
insert into payment values('P00008','Cash','T00007','U00007');
insert into payment values('P00009','Card','T00010','U00010');
insert into payment values('P00010','FAB Wallet','T00009','U00009');
insert into payment values('P00011','Cash','T00020','U00020');
insert into payment values('P00012','Card','T00011','U00011');
insert into payment values('P00013','FAB Wallet','T00012','U00012');
insert into payment values('P00014','Cash','T00013','U00013');
insert into payment values('P00015','FAB Wallet','T00014','U00014');
insert into payment values('P00016','FAB Wallet','T00015','U00015');
insert into payment values('P00017','Cash','T000016','U00016');
insert into payment values('P00018','Card','T00017','U00017');
insert into payment values('P00019','FAB Wallet','T000018','U00018');
insert into payment values('P00020','Card','T00019','U00019');



insert into discount values('T00001','U00001',35);
insert into discount values('T00002','U00002',25);
insert into discount values('T00003','U00003',47);
insert into discount values('T00004','U00004',135);
insert into discount values('T00005','U00005',76);
insert into discount values('T00006','U00006',3);
insert into discount values('T00007','U00007',50);
insert into discount values('T00008','U00008',40);
insert into discount values('T00009','U00009',0);
insert into discount values('T00010','U00010',63);
insert into discount values('T00011','U00011',35);
insert into discount values('T00012','U00012',25);
insert into discount values('T00013','U00013',47);
insert into discount values('T00014','U00014',105);
insert into discount values('T00015','U00015',73);
insert into discount values('T00016','U00016',30);
insert into discount values('T00017','U00017',5);
insert into discount values('T00018','U00018',4);
insert into discount values('T00019','U00019',10);
insert into discount values('T00020','U00020',63);



insert into complaint values('C00001','U00001','Cab can be cleaner.');
insert into complaint values('C00003','U00003','Driver did not arrive on time.');
insert into complaint values('C00006','U00006','Driver took long route.');
insert into complaint values('C00007','U00007','Driver was rude. Kept talking on the phone loudly. Drove rash.');
insert into complaint values('C00008','U00008','Driver started assaulting me.');
insert into complaint values('C00011','U00011','Driver took me through long routes');
insert into complaint values('C00019','U00019','Driver was too slow.');
insert into complaint values('C00020','U00020','Cab was dirty.');
insert into complaint values('C00016','U00016','A/C was not working in the car and the driver was extremely rude.');



insert into customer_care values('C00001','CCR01');
insert into customer_care values('C00003','CCR02');
insert into customer_care values('C00006','CCR03');
insert into customer_care values('C00007','CCR04');
insert into customer_care values('C00008','CCR08');
insert into customer_care values('C00011','CCR11');
insert into customer_care values('C00019','CCR19');
insert into customer_care values('C00020','CCR20');
insert into customer_care values('C00016','CCR16');





select * from main_user;
select * from driver;
select * from License_Details;
select * from trip;
select * from vehicle;
select * from payment;
select * from discount;
select * from complaint;
select * from customer_care;


--Queries
--1. Names of all drivers with Rating 3
select Name from driver
where Rating>'3';

--2. Drivers who have been in accidents (Criminal Check = YES)
select Name,Rating from driver
where Criminal_Check='YES'
and Rating>3;

--3. Users with rating>4 and who have a booking of a luxury car
select name
from main_user
where User_ID in(select User_ID
from main_user
where Booking_Type='Luxury'
and Rating>4);

--4. Drivers who reside in Jayanagar or Koramangala
select Name, Address
from driver
where (Address like '%Jayanagar%' or Address like '%Koramangala%');
  
--5. simple
select Name,User_ID
from main_user
where Name like '%Rao';

--6.simple
select Name 
from driver
where DOB like '%1979';

--7 simple
select c.Customer_ID
from complaint as c
where c.comments <> null;

--8 simple
select Name,Phone
from driver
where Phone like '%33';




--Query 1
--grouping by payment method and linking the user id with the user id in payment by join 
select Payment.Payment_method,main_user.Name
from (main_user inner join Payment
on Payment.User_ID = main_user.User_ID)
group by Payment.Payment_method,main_user.Name;

--Query 2
--driver and the vehicles they drive with capacity >4
select driver.Name,vehicle.capacity,vehicle.model,driver.Driver_ID
from (driver inner join vehicle
on driver.Driver_ID = vehicle.driver_ID)
where Criminal_Check = 'NO' AND vehicle.capacity>4
group by driver.Name,vehicle.capacity,driver.Driver_ID,vehicle.model;


--Query 3
--All users who have not given a complaint
select distinct m.Name
from main_user as m, complaint as c
where m.User_ID not in 
(select Customer_ID from complaint);

--Query 4
--Give +10 Rupees discount for all users who have redeemed a discount of greater than Rupees 20. 
update Discount
set Amount = Amount + 10
where Amount>20;

--Query 5
--Group by car type booked
select Booking_Type,Count(*) as Number
from main_user
group by Booking_Type;

--Query 6
--Which Driver in which RTO
select driver.name, license_details.RTO 
from driver, License_Details
where driver.driver_ID = License_Details.Driver_ID;

--Query 7
--Driver earnings in ascending order
select driver.Name, trip.Fare
from driver,trip
where driver.trip_ID = trip.trip_ID
order by trip.fare;

--Query 8
--Drivers living in jayanagar and their count
create view v1 as 
select Name, Address
from driver
where Address like '%Jayanagar%';
select *
from v1;
select COUNT(*)
from v1;

--Query 9
--Drivers and USer who have the same ratings
select distinct m.Name as Cust_name,d.Name as Driver_name,d.Rating
from driver as d join main_user as m
on d.Rating = m.Rating
group by m.Name,d.Name,d.Rating
order by d.Rating;

--Query 10
--views created and intersection made. This gives the drivers who are good inspite of being involved in  accidents before
create view v11 as
select * 
from driver
where Criminal_Check = 'YES';
create view v22 as
select * 
from driver
where Rating > 3;
select v11.name,v11.rating
from v11 Intersect
select v22.name,v22.rating 
from v22;

--Query 11
--Group by ratings
select driver.rating, count(*) as Number
from driver
group by driver.rating;

--Custom Query
create view vcomplex as 
select distinct d.Name
from main_user as m, complaint as c,driver as d
where m.User_ID = c.customer_ID 
AND 
m.trip_id = d.trip_ID;
select name,count(*) as no_of_complaints from vcomplex
group by name;
 
--driver who do not have any complaints
select d.name
from driver d
where d.name not in (select name from vcomplex)



