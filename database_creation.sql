use fms2;


create table employee(
phone_num varchar(20) ,
name_ varchar(20),
emp_id varchar(10) primary key
);

CREATE TABLE airline (
    airline_name varchar(20),
    airline_id varchar(10) PRIMARY KEY
);

create table passenger(
passport_number varchar(20) primary key,
Name_  varchar (20),
age varchar(3),
phoneno varchar (10)
);

create table flight(
flight_number varchar(10) primary key,
sourcec varchar(20),
destination varchar (20),
arrival_time varchar(10),
departure_time varchar(10),
airline_id varchar(10),
FOREIGN KEY (airline_id) REFERENCES airline(airline_id));


create table ticket(
ticket_num varchar(10) primary key,
price varchar(10),
seat_num varchar(10),
passport_number varchar(20),
flight_number varchar(10),
FOREIGN KEY (passport_number) REFERENCES passenger(passport_number),
FOREIGN KEY (flight_number) REFERENCES flight(flight_number)
);


insert into employee values('9865745698','jaswanth','007');
insert into employee values('5565745548','mayank','008');
insert into employee values('8865745698','mustaffa','009');

insert into airline values('Boeing','107');
insert into airline values('airbus','108');
insert into airline values('airindia','109');
insert into airline values('lufthansa','110');

insert into passenger values('207','pranay','22','7845326951');
insert into passenger values('208','lokesh','2','7944726951');
insert into passenger values('209','sandeep','20','7854326951');
insert into passenger values('210','sita','19','7845789951');
insert into passenger values('211','krishna','20','7147326951');
insert into passenger values('212','geetha','25','9875326951');
insert into passenger values('213','gandhi','100','8755326951');

insert into flight values('307','mumbai','karachi','16:00:00','17:00:00','107');
insert into flight values('308','kolkata','bangalore','11:30:00','19:00:00','108');
insert into flight values('309','delhi','kadapa','05:00:00','09:10:00','109');
insert into flight values('310','cochin','london','05:00:00','19:15:00','110');

insert into ticket values('407','15000','15','207','307');
insert into ticket values('408','7850','8','208','307');
insert into ticket values('409','3200','85','209','308');
insert into ticket values('410','1650','57','210','308');
insert into ticket values('411','1800','17','211','309');
insert into ticket values('412','19000','31','212','310');
insert into ticket values('413','25000','19','213','308');


UPDATE flight 
SET 
    destination = 'las vegas'
WHERE
    flight_number = 307;
    
    
    
    select * from ticket;

select t.ticket_num,t.price,t.seat_num,p.*,f.*
from ticket t,passenger p,flight f
where(t.passport_number=p.passport_number and t.flight_number=f.flight_number);

select t.ticket_num,t.price,t.seat_num,p.*,f.*
from ticket t,passenger p,flight f
where(t.passport_number=p.passport_number and t.flight_number=f.flight_number and t.ticket_num='407');


delete from ticket;
set sql_safe_updates=0;





delimiter //
CREATE TRIGGER exp_trig BEFORE INSERT
ON ticket
FOR EACH ROW

SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'new ticket generated!!!!!';
 //
delimiter ;

insert into passenger values('215','maya',28,'714326951');
insert into ticket values(415,15080,45,'215','308');

select* from ticket;
 drop trigger exp_trig;
 
 
 
 
 



