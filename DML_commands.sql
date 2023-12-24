-- DML COMMANDS (Data Manipulation Language commands)
-- UPDATE, INSERT AND DELETE
-- ON UPDATE CASCADE, ON DELETE CASCADE, ON DELETE SET NULL

drop table employee;
create table employee(
Emp_id varchar(20) Primary Key,
Emp_Refferal_code varchar(10) unique,
Emp_Name varchar(50) NOT NULL,
Age int check(Age between 21 and 55),
DOJ Datetime default current_timestamp
);

drop table Refferals;
create table Refferals(
Ref_id varchar(20) Primary Key,
Ref_Emp_id varchar(20),
Ref_Name varchar(50) NOT NULL,
Ref_date Datetime default current_timestamp,
foreign key(Ref_Emp_id) references employee(Emp_id) ON DELETE SET NULL
);


select * from employee;
select * from refferals;

insert into employee(Emp_id,Emp_Refferal_code,Emp_Name,Age)
values
("EV113","EV113Ref3","Ajay",28),
("EV114","EV114Ref4","Geeta",33),
("EV115","EV115Ref5","Sunitha",24),
("EV116","EV116Ref6","Rohit",38);

insert into Refferals(Ref_id,Ref_Emp_id,Ref_Name)
values
("Ref12","EV113","Murphy"),
("Ref13","EV114","John"),
("Ref14","EV115","Peter"),
("Ref15","EV113","Lucas");

-- Updating value of Geeta to Seeta from employee table 
Update employee
SET Emp_Name="Seeta"
where Emp_id="EV114";

-- ON UPDATE CASCADE: Will update the records from Parents table and relevant records from child table as well. 
-- It should be written next to the point where we define the foreign key in child table.
Update employee
SET Emp_id="EV117"
where Emp_id="EV114";

-- Delete the record of Peter from Referels table (Delete from Child table)
Delete from refferals
where Ref_id="Ref14";

-- Delete the record of Peter from Employee table (Delete from Parent table)
-- ON DELETE CASCADE: Will delete the records from Parents table and relevant records from child table as well. 
-- It should be written next to the point where we define the foreign key in child table.
Delete from employee
where Emp_id="EV114";

-- ON DELETE SET NULL: Will delete the records from Parents table and relevant records from child table will be SET to NULL. 
-- It should be written next to the point where we define the foreign key in child table.
Delete from employee
where Emp_id="EV113";
