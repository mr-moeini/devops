Step #2 — Build and run the corresponding containers
docker-compose up -d
[+] Running 3/3
 ⠿ Container pg_grafana  Started                                                                                          0.9s
 ⠿ Container grafana     Started                                                                                          1.3s
 ⠿ Container pg_data_wh  Started                                                                                          0.9s
Step #3 — Connect to the pg_data_wh PostgreSQL database and populate some sample data
psql -h localhost -p 5488 -U my_data_wh_user -d my_data_wh_db -W
Password:
psql (15.1 (Ubuntu 15.1-1.pgdg22.04+1))
Type "help" for help.

my_data_wh_db=# create table my_table(person varchar(100), apples smallint);
CREATE TABLE
my_data_wh_db=# insert into my_table values('Anne', 10);
INSERT 0 1
my_data_wh_db=# insert into my_table values('Jane', 15);
INSERT 0 1
my_data_wh_db=# insert into my_table values('Jack', 25);
INSERT 0 1
my_data_wh_db=# insert into my_table values('Linda', 35);
INSERT 0 1


Step #4 — Open browser and access the Grafana
http://<ip_of_the_host_machine>:3111

Step #5 — Define PostgreSQL data source in Grafana; it will access data from the pg_data_wh PostgreSQL database

Step #6 — Explore the pg_data_wh PostgreSQL data from the Grafana
