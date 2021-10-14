alter table emp57
add (
    deptno int(2), 
    constraint FK_dept foreign key(deptno)           -- ! Syntax !!
    references dept57(deptno)                       -- constraint, refrences are keyword
);

DESCRIBE emp57;
