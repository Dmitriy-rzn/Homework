# 6.4. PostgreSQL

docker run --name post_net -v /home/vagrant/doker/PostgrSQL/data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=QweAsd -dpostgres:13

1.Команды:  
* вывода списка БД  
\l
* подключения к БД  
\c
* вывода списка таблиц  
\d
* вывода описания содержимого таблиц  
\d+
* выхода из psql  
\q

2.  
create database test;
```
test=# select attname, avg_width from pg_stats where tablename = 'orders'order by avg_width DESC limit 1;
 attname | avg_width
---------+-----------
 title   |        16
```
3.  

```
test=# create table orders_1 (LIKE orders);
INSERTCREATE TABLE
test=# INSERT INTO orders_1 SELECT * FROM orders where price > 499;
INSERT 0 3
test=# create table orders_2 (LIKE orders);
INSERTCREATE TABLE
test=# INSERT INTO orders_2 SELECT * FROM orders where price <= 499;
INSERT 0 5
test=# SELECT * FROM orders_1;
 id |       title        | price
----+--------------------+-------
  2 | My little database |   500
  6 | WAL never lies     |   900
  8 | Dbiezdmin          |   501
(3 rows)

test=# SELECT * FROM orders_2;
 id |        title         | price
----+----------------------+-------
  1 | War and peace        |   100
  3 | Adventure psql time  |   300
  4 | Server gravity falls |   300
  5 | Log gossips          |   123
  7 | Me and my bash-pet   |   499
(5 rows)
```
При создании таблицы orders можно сразу включить партицирование, пользователь работает как обычно но внутри все разделяется.
CREATE TABLE orders (id integer, title character varying(30), price integer) PARTITION BY RANGE (price);  
CREATE TABLE orders_1 PARTITION OF orders FOR VALUES FROM (500) TO (9999999);  
CREATE TABLE orders_2 PARTITION OF orders FOR VALUES FROM (0) TO (499);  
```
new=# \d
                List of relations
 Schema |   Name   |       Type        |  Owner
--------+----------+-------------------+----------
 public | orders   | partitioned table | postgres
 public | orders_1 | table             | postgres
 public | orders_2 | table             | postgres
(3 rows)

new=# INSERT INTO orders (id, title, price) VALUES (1,'Шоколад',10),(2,'Принтер',300),(3,'Книга',520),(4,'Монитор',600),
(5,'Гитара',79);
INSERT 0 5
new=# select * from orders;
 id |  title  | price
----+---------+-------
  1 | Шоколад |    10
  2 | Принтер |   300
  5 | Гитара  |    79
  3 | Книга   |   520
  4 | Монитор |   600
(5 rows)

new=# select * from orders_1;
 id |  title  | price
----+---------+-------
  3 | Книга   |   520
  4 | Монитор |   600
(2 rows)

new=# select * from orders_2;
 id |  title  | price
----+---------+-------
  1 | Шоколад |    10
  2 | Принтер |   300
  5 | Гитара  |    79
(3 rows)
```



4.  
```
pg_dump -Fc -Z 6 -f /var/lib/postgresql/data/test.tar.gz test
```
```
при создании таблицы в секции 
title character varying(80) добавляем ограничение UNIQUE NOT NULL
```
