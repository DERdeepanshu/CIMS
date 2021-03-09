create database CMS;
use CMS;
drop database CMS;

create table Student(	S_no int primary key,
						S_name varchar(30),
                        Gender char(1),
                        DOB varchar(10),
                        Fee int,
                        DOJ varchar(10),
                        A_year varchar(9),
                        Course varchar(50),
                        Fname varchar(30),
                        Phone varchar(10));

insert into Student values(39, 'Deepanshu', 'm', '20/07/2000', 85000, '23/07/2018', '2018-2021', 'BCA', 'Dilip Sarkar', '8587809764');
alter table Student auto_increment=100000;

create table Fee(	S_no int, 
					Amount int,
                    Paid int,
                    Balance int,
                    primary key(S_no),
                    foreign key (S_no) references Student(S_no) on delete cascade on update cascade);

create table Attendance(	Sno int,
                            Att_month varchar(3),
                            Now int(2),
                            Nop int(2),
                            primary key (Sno, Att_month),
                            foreign key (Sno) references Student(S_no) on delete cascade on update cascade
                        );

create table Result( 	Sno int,
							Sem int,
							Marks int,
							Result varchar(4),
                            primary key(Sno, Sem),
							foreign key (Sno) references Student(S_no) on delete cascade);

create table Staff_d(	Staff_id int primary key auto_increment,
						Experience int,
						Subjects varchar(40),
                        T_name varchar(30),
                        Salary int);
alter table Staff_d auto_increment=1000;

create table Research(	Staff_id int,
						R_id int,
						Sub varchar(20),
                        University varchar(40),
                        Guide varchar(20),
                        primary key (Staff_id, R_id),
                        foreign key (Staff_id) references Staff_d(Staff_id) on delete cascade);

select * from Student;
create table Student_login( S_no int,
							pass varchar(20),
                            primary key (S_no),
                            foreign key (S_no) references Student(S_no) on delete cascade);
                            
create table Staff_login( Staff_id int,
							pass varchar(20),
                            primary key (Staff_id),
                            foreign key (Staff_id) references Staff_d(Staff_id) on delete cascade);
                            
insert into Student_login values (39, "admin");
insert into Student_login values (29, "admin");
select * from Staff_login;
insert into Staff_login values (1001, "admin");
describe Staff_login;
