create table student(
    rollno int(3) primary key,
    sname char(20) not null,
    address varchar(10) not null,
    class char(5) not null,
    phoneno int(10) not null
);
DESCRIBE student;