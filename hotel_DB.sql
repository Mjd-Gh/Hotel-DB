CREATE SCHEMA `‘hoteldb’` ;
CREATE TABLE hotel 
( hotelID  INT NOT NULL, 
hName  VARCHAR(20), 
telephone INT ,
hEmail  VARCHAR(30),
CONSTRAINT hotel_PK PRIMARY KEY (hotelID)
);
CREATE TABLE hotelState 
( hotelID  INT NOT NULL ,
state VARCHAR(20) NOT NULL ,
city VARCHAR(20),
street VARCHAR(20),
CONSTRAINT hotelState_PK PRIMARY KEY (hotelID , state),
CONSTRAINT hotelState_FK1 FOREIGN KEY (hotelID) REFERENCES hotel (hotelID)
);
CREATE TABLE room 
( roomID VARCHAR(10) NOT NULL,
roomNo INT,  hotelID INT , 
CONSTRAINT room_PK PRIMARY KEY (roomID),
CONSTRAINT room_FK1 FOREIGN KEY (hotelID) REFERENCES hotel (hotelID)
);
CREATE TABLE roomFloor 
( roomID VARCHAR(10) NOT NULL , 
floor VARCHAR(10) NOT NULL ,
type VARCHAR(20) UNIQUE NOT NULL,
CONSTRAINT roomFloor_PK PRIMARY KEY (roomID , floor),
CONSTRAINT roomFloor_FK1 FOREIGN KEY (roomID) REFERENCES room (roomID)
);
CREATE TABLE roomBeds
( roomID VARCHAR(10) NOT NULL ,
noBeds INT,
CONSTRAINT roomBeds_PK PRIMARY KEY (roomID),
CONSTRAINT roomBeds_FK1 FOREIGN KEY (roomID) REFERENCES room (roomID)
);
CREATE TABLE roomRate 
( type VARCHAR(20) NOT NULL  REFERENCES roomFloor(type),
rate INT,
CONSTRAINT roomRate_PK PRIMARY KEY (type)
);
CREATE TABLE  staff 
( staffID VARCHAR(10) NOT  NULL ,
sName VARCHAR(45),
sPhone INT,
sZipcode INT,
salary INT, hotelID INT , 
CONSTRAINT staff_PK PRIMARY KEY  (staffID),
CONSTRAINT staff_FK1 FOREIGN KEY (hotelID) REFERENCES hotel (hotelID)
);
CREATE TABLE staffDepart
( staffID VARCHAR(10) NOT NULL ,
department VARCHAR(20) NOT NULL ,
CONSTRAINT staffDepart_PK PRIMARY KEY (staffID,department),
CONSTRAINT staffDepart_FK1 FOREIGN KEY (staffID) REFERENCES staff (staffID)
);
CREATE TABLE staffState 
(staffID VARCHAR(10) NOT NULL ,
state VARCHAR(20) NOT NULL  UNIQUE,
CONSTRAINT staffState_PK PRIMARY KEY (staffID),
CONSTRAINT staffState_FK1 FOREIGN KEY (staffID) REFERENCES staff (staffID)
);
CREATE TABLE staffCity
(state VARCHAR(20) NOT NULL REFERENCES staffState (state) ,
city VARCHAR(20),
CONSTRAINT staffCity_PK PRIMARY KEY (state)
);
CREATE TABLE guest 
( guestID INT NOT NULL ,
fName VARCHAR(20),
lName VARCHAR(20),
phoneNo INT,
zipcode INT,
email VARCHAR(30),  hotelID INT , 
CONSTRAINT guest_PK PRIMARY KEY (guestID),
CONSTRAINT guest_FK1 FOREIGN KEY (hotelID) REFERENCES hotel (hotelID)
);
CREATE TABLE guestState 
( guestID INT NOT NULL,
state VARCHAR(30) NOT NULL ,
city VARCHAR(30),
CONSTRAINT guestState_PK PRIMARY KEY (guestID,state),
CONSTRAINT guestState_FK1 FOREIGN KEY (guestID) REFERENCES guest (guestID)
);

INSERT INTO hotel
VALUES (43801,'Fairmont',2535981,'f-f2011@hotmail.com');
INSERT INTO hotel
VALUES (43802,'Pullman',2793724,'pull2015@gmail.com');
INSERT INTO hotel
VALUES (43803,'Raffles',2173822,'ra2727@outlook.com');
INSERT INTO hotel
VALUES (43804,'Novotel',2899031,'nov2013@gmail.com');
INSERT INTO hotel
VALUES (43805,'Triple tree',2930035,'tt2200@outlook.sa');

INSERT INTO hotelstate
VALUES (43801,'USA','Newyork','21street');
INSERT INTO hotelstate
VALUES (43802,'USA','LosAngeles','KingStreet');
INSERT INTO hotelstate
VALUES (43803,'KSA','Makkah','AlKaldiya');
INSERT INTO hotelstate
VALUES (43804,'KSA','Jedah','Alsafa');
INSERT INTO hotelstate
VALUES (43805,'USE','Dubai','ShehkZaiedStreet');

INSERT INTO room
VALUES ('23801A',125,43801);
INSERT INTO room
VALUES ('23802C',36,43803);
INSERT INTO room
VALUES ('23802B',27,43802);
INSERT INTO room
VALUES ('23803D',144,43804);
INSERT INTO room
VALUES ('23804A',99,43805);

INSERT INTO roomfloor
VALUES ('23801A','A','Single');
INSERT INTO roomfloor
VALUES ('23802C','C','Twin');
INSERT INTO roomfloor
VALUES ('23802B','B','Queen');
INSERT INTO roomfloor
VALUES ('23803D','D','King');
INSERT INTO roomfloor
VALUES ('23804A','A','Quad');

INSERT INTO roombeds
VALUES ('23801A',1);
INSERT INTO roombeds
VALUES ('23802C',2);
INSERT INTO roombeds
VALUES ('23802B',1);
INSERT INTO roombeds
VALUES ('23803D',1);
INSERT INTO roombeds
VALUES ('23804A',4);

INSERT INTO roomrate
VALUES ('Single',250);
INSERT INTO roomrate
VALUES ('Twin',400);
INSERT INTO roomrate
VALUES ('Queen',600);
INSERT INTO roomrate
VALUES ('King',650);
INSERT INTO roomrate
VALUES ('Quad',800);

INSERT INTO staff
VALUES ('T43905','Tom',0529418205,23710,5000,43801);
INSERT INTO staff
VALUES ('J43801','Jhon',0369158204,27194,3000,43802);
INSERT INTO staff
VALUES ('A53702','Ahmad',0831042872,28910,5000,43803);
INSERT INTO staff
VALUES ('E53800','Eyad',0185015932,28739,7000,43805);
INSERT INTO staff
VALUES ('R42305','Rashid',0528219205,29910,9000,43804);

INSERT INTO staffdepart
VALUES ('T43905','Accounting');
INSERT INTO staffdepart
VALUES ('J43801','Food&Beverage');
INSERT INTO staffdepart
VALUES ('A53702','Accounting');
INSERT INTO staffdepart
VALUES ('E53800','Marketing');
INSERT INTO staffdepart
VALUES ('R42305','Engineering');

INSERT INTO staffstate
VALUES ('T43905','USA');
INSERT INTO staffstate
VALUES ('J43801','UK');
INSERT INTO staffstate
VALUES ('A53702','KSA');
INSERT INTO staffstate
VALUES ('E53800','AlBahren');
INSERT INTO staffstate
VALUES ('R42305','USE');

INSERT INTO staffcity
VALUES ('USA','Newyork');
INSERT INTO staffcity
VALUES ('UK','London');
INSERT INTO staffcity
VALUES ('KSA','Makkah');
INSERT INTO staffcity
VALUES ('AlBahren','Manama');
INSERT INTO staffcity
VALUES ('USE','Dubai');

INSERT INTO guest
VALUES (438018224,'Majed','Hassan',0581692017,27529,'mj1999@hotmail.com',43802);
INSERT INTO guest
VALUES (436319620,'Anas','Faleh',0561903289,26453,'$n599@gotmail.com',43803);
INSERT INTO guest
VALUES (431062819,'Mohanad','AlShareef',0502595661,27129,'m1413@hotmail.com',43804);
INSERT INTO guest
VALUES (439001271,'Farah','Omar',0579521623,29371,'fof2525@outlock.com',43801);
INSERT INTO guest
VALUES (418307159,'Remas','AlHindi',0590371829,29240,'r-r2050@hotmail.com',43805);

INSERT INTO gueststate
VALUES (438018224,'KSA','Makkah');
INSERT INTO gueststate
VALUES (436319620,'KSA','Jedah');
INSERT INTO gueststate
VALUES (431062819,'USE','Abuzabi');
INSERT INTO gueststate
VALUES (439001271,'AlBahrin','Manamh');
INSERT INTO gueststate
VALUES (418307159,'USE','Dubai');

UPDATE roomrate
SET rate=rate*1.15;
UPDATE staff
SET salary=salary*1.05;

 DELETE FROM staffcity;
 DELETE FROM gueststate;


-- show all hotels info that located in KSA
SELECT *
   FROM  hotelState
   WHERE state = 'KSA' ;
   
-- show all guests info ordred by first name and guest ID 
SELECT *
 FROM guest
ORDER BY fname , guestID ;

-- show all rooms whose rate is less than or equal1 700 in order 
SELECT *
FROM roomRate
WHERE rate <= 700
ORDER BY rate ;

-- show staff Eyad department 
SELECT department 
   FROM  staffDepart
   WHERE staffID =  ( SELECT staffID
                            FROM  staff
						    WHERE staffID = 'E53800' ) ;
  
-- show the type and flore of room at the Raffles Hotel
SELECT floor , type
  FROM roomFloor
  WHERE roomID = ( SELECT roomID 
                    FROM room
                    WHERE hotelID = (SELECT hotelID 
                                       FROM hotel
                                       WHERE hotelID = 43803));

   
      --  Display specified values ​​with condition 
                                       
 SELECT   sName , count(staffID) AS c , sum(salary) AS ss
 FROM  staff
 group by  staffID
 HAVING sum(salary)<9000;
 
 
 --  listing the ordered rows from hotel table start with hName
 
 SELECT hName , telephone
 FROM   hotel
 group by    hName 
 order by    hName;
 
 --  join operation from hotel and room tables
 
 SELECT   h.hotelID , hName , telephone , roomNO , roomID 
 FROM     hotel h , room r
 WHERE    h.hotelID = r.hotelID 
group by   h.hotelID  ;


-- display the room that have less than 2 beds
 
 SELECT    noBeds ,roomID
 FROM      roombeds
 group by  noBeds
 HAVING     noBeds<2;
 
 
-- joining to room and staff tables 
 
 select   a.hotelID , roomNo , staffID , sPhone , sZipcode
 FROM     room a , staff s
 where    a.hotelID = s.hotelID
 group by   a.hotelID
 order by   a.hotelID ;
 






