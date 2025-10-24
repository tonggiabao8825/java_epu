create database hostel;
use hostel;

create table room
(number varchar(10) primary key,
activate varchar(50),
roomStatus varchar(50)
);
desc room;
select *from room;
update room 
set roomStatus="Booked" where number="001";