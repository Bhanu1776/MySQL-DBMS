use Bhanu57;            -- * Bhanu57 is database

create table emp57(
    empno int(6) primary key,
    ename char(20) not null,
    job char(10) not null,
    sal float(7,2)
);

describe emp57;             -- To print table output we use DESCRIBE