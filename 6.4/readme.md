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
По идее можно было избежать воспользовавшись командой PARTITION by RANGE(price) при создании таблицы

4.  
```
pg_dump -Fc -Z 6 -f /var/lib/postgresql/data/test.tar.gz test
```
```
при создании таблицы в секции 
title character varying(80) добавляем ограничение UNIQUE NOT NULL
```
