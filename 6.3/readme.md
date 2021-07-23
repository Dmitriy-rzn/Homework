# 6.3. MySQL

1.  
docker run --name ms_net -v /home/vagrant/doker/MySQL/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=QweAsd -d mysql:8  
```
mysql> \s
--------------
mysql  Ver 8.0.26 for Linux on x86_64 (MySQL Community Server - GPL)
```
```
mysql> SELECT table_name FROM information_schema.tables WHERE table_schema = 'test';
+------------+
| TABLE_NAME |
+------------+
| orders     |
+------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM test.orders WHERE price > 300;
+----+----------------+-------+
| id | title          | price |
+----+----------------+-------+
|  2 | My little pony |   500 |
+----+----------------+-------+
1 row in set (0.02 sec)

```
2.  
```
mysql> CREATE USER 'test'@'localhost' IDENTIFIED WITH mysql_native_password BY 'test-pass'
    -> WITH MAX_QUERIES_PER_HOUR 100
    -> FAILED_LOGIN_ATTEMPTS 3
    -> PASSWORD EXPIRE INTERVAL 180 DAY
    -> ATTRIBUTE '{"Name": "James", "Lastname": "Pretty"}';
Query OK, 0 rows affected (0.02 sec)

mysql> GRANT SELECT ON test.* TO 'test'@'localhost';
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> SELECT * FROM INFORMATION_SCHEMA.USER_ATTRIBUTES WHERE USER = 'test'
    -> ;
+------+-----------+-----------------------------------------+
| USER | HOST      | ATTRIBUTE                               |
+------+-----------+-----------------------------------------+
| test | localhost | {"Name": "James", "Lastname": "Pretty"} |
+------+-----------+-----------------------------------------+
1 row in set (0.03 sec)
```
3.  
```
SELECT TABLE_NAME, ENGINE FROM information_schema.TABLES where TABLE_SCHEMA = 'test';
+------------+--------+
| TABLE_NAME | ENGINE |
+------------+--------+
| orders     | InnoDB |
+------------+--------+
1 row in set (0.00 sec)
```
```
mysql> SHOW PROFILES;
+----------+------------+--------------------------------------------------------------------------------------+
| Query_ID | Duration   | Query                                                                                |
+----------+------------+--------------------------------------------------------------------------------------+
|        5 | 0.04096600 | ALTER TABLE orders ENGINE = InnoDB                                                   |
|        6 | 0.03425900 | ALTER TABLE orders ENGINE = MyISAM                                                   |
+----------+------------+--------------------------------------------------------------------------------------+
```
4.  

На машине 1 Gb RAM
```
[mysqld]
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
datadir         = /var/lib/mysql
secure-file-priv= NULL

 #Custom config should go here
!includedir /etc/mysql/conf.d/

innodb_buffer_pool_size = 300M
innodb_log_file_size = 100M
innodb_log_buffer_size = 1M
innodb_file_per_table = 1
innodb_flush_log_at_trx_commit = 2
```

