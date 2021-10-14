create table employee1 (
    ename varchar(10),
    empno int(4) primary key,
    constraint b check(empno>100)               -- Condition check
);