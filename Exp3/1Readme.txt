Exp 3 ...
Basic stuff of MySQL
All commands based on Data defination Language (DDL)



While executing if you get an error like,
ER_ACCESS_DENIED_ERROR: Access denied for user 'root'@'localhost' (using password: YES)

Run this command in terminal --> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'insert_password';