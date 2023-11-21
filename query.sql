--1 show all passengers
--2 book ticket (trigger)
--3 veiw ticket
--4 flight related query


--1 show all passengers

select t.ticket_num,t.price,t.seat_num,p.*,f.*
from ticket t,passenger p,flight f
where(t.passport_number=p.passport_number and t.flight_number=f.flight_number);


--3 veiw ticket

select t.ticket_num,t.price,t.seat_num,p.*,f.*
from ticket t,passenger p,flight f
where(t.passport_number=p.passport_number and t.flight_number=f.flight_number and t.ticket_num="    ");


--2 trigger

CREATE TRIGGER exp_trig 
ON ticket
FOR EACH ROW
AFTER INSERT
BEGIN
   SELECT t.ticket_num, t.price, t.seat_num, p.passenger_name, f.flight_number
   FROM ticket t, passenger p, flight f
   WHERE t.passport_number = p.passport_number AND t.flight_number = f.flight_number AND t.ticket_num = LAST_INSERT_ID();
END;








