# 6.2. SQL

1. docker run -v /home/vagrant/doker/PostgrSQL/Data:/var/lib/postgresql/data -v /home/vagrant/doker/PostgrSQL/Backup:/var/lib/postgresql/backup -e POSTGRES_PASSWORD=QweAsd -d postgres:12  

2. 
```
postgres=# \l
                                     List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |       Access privileges
-----------+----------+----------+------------+------------+--------------------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres                   +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres                   +
           |          |          |            |            | postgres=CTc/postgres
 test_db   | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =Tc/postgres                  +
           |          |          |            |            | postgres=CTc/postgres         +
           |          |          |            |            | "test-admin-user"=CTc/postgres
(4 rows)
```

```
test_db=# \d orders
                                   Table "public.orders"
 Column |         Type          | Collation | Nullable |              Default
--------+-----------------------+-----------+----------+------------------------------------
 id     | integer               |           | not null | nextval('orders_id_seq'::regclass)
 name   | character varying(30) |           |          |
 price  | integer               |           |          |
Indexes:
    "orders_pkey" PRIMARY KEY, btree (id)
```
```
test_db=# \d clients
                                    Table "public.clients"
  Column  |         Type          | Collation | Nullable |               Default
----------+-----------------------+-----------+----------+-------------------------------------
 id       | integer               |           | not null | nextval('clients_id_seq'::regclass)
 lastname | character varying(30) |           |          |
 country  | character varying(30) |           |          |
 orders   | integer               |           |          |
Indexes:
    "clients_pkey" PRIMARY KEY, btree (id)
```
```
test_db=# \dp orders;
                                      Access privileges
 Schema |  Name  | Type  |         Access privileges          | Column privileges | Policies
--------+--------+-------+------------------------------------+-------------------+----------
 public | orders | table | postgres=arwdDxt/postgres         +|                   |
        |        |       | "test-simple-user"=arwd/postgres  +|                   |
        |        |       | "test-admin-user"=arwdDxt/postgres |                   |
(1 row)

test_db=# \dp clients;
                                      Access privileges
 Schema |  Name   | Type  |         Access privileges          | Column privileges | Policies
--------+---------+-------+------------------------------------+-------------------+----------
 public | clients | table | postgres=arwdDxt/postgres         +|                   |
        |         |       | "test-simple-user"=arwd/postgres  +|                   |
        |         |       | "test-admin-user"=arwdDxt/postgres |                   |
(1 row)
```
3.   
INSERT INTO orders (id, name, price) VALUES (1,'Шоколад',10),(2,'Принтер',3000),(3,'Книга',500),(4,'Монитор',7000),(5,'Гитара',4000);   
INSERT INTO clients (id, lastname, country) VALUES (1,'Иванов Иван Иванович','USA'),(2,'Петров Петр Петрович','Canada'),(3,'Иоганн Себастьян Бах','Japan'),(4,'Ронни Джеймс Дио','Russia'),(5,'Ritchie Blackmore','Russia');
```
test_db=# select count(*) from clients;
 count
-------
     5
(1 row)

test_db=# select count(*) from orders;
 count
-------
     5
(1 row)
```
4. 

```
UPDATE clients SET orders = (SELECT id FROM orders WHERE name='Книга') WHERE lastname='Иванов Иван Иванович';     
UPDATE clients SET orders = (SELECT id FROM orders WHERE name='Монитор') WHERE lastname='Петров Петр Петрович';
UPDATE clients SET orders = (SELECT id FROM orders WHERE name='Гитара') WHERE lastname='Иоганн Себастьян Бах';
```

```
test_db=# SELECT lastname FROM clients WHERE orders IS NOT NULL;
       lastname
----------------------
 Иванов Иван Иванович
 Петров Петр Петрович
 Иоганн Себастьян Бах
(3 rows)
```
5. 
```
test_db=# EXPLAIN SELECT lastname FROM clients WHERE orders IS NOT NULL;
                        QUERY PLAN
-----------------------------------------------------------
 Seq Scan on clients  (cost=0.00..14.20 rows=418 width=78)
   Filter: (orders IS NOT NULL)
(2 rows)
```
Эта команда выводит план выполнения, генерируемый планировщиком PostgreSQL для заданного оператора. План выполнения показывает, как будут сканироваться таблицы, затрагиваемые оператором — просто последовательно, по индексу и т. д. — а если запрос связывает несколько таблиц, какой алгоритм соединения будет выбран для объединения считанных из них строк.

6. 


pg_dump -Fc -Z 6 -f /var/lib/postgresql/backup/test_db.tar.gz test_db  
pg_restore -U postgres -d test_db /var/lib/postgresql/backup/test_db.tar.gz
