# Commandes
 - $ docker run -dit --name siteweb -p 8181:80 -v "$PWD":/usr/local/apache2/htdocs/ httpd:2.4
 - $ nano index.html
 - On ouvre dans vscode l'index, puis on crée un dockerfile.
 - $ docker run -dit --name madb -p 3308:3306 -e MYSQL_ROOT_PASSWORD=admin mon_mysql
 - $ docker build -t mon_mysql .
 - $ docker exec -it madb mysql -u root -p
 - mysql> show databases;
 - mysql> select user, plugin, host from mysql.user;
 - mysql> alter user 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'admin';
 - mysql> select user, plugin, host from mysql.user;
 - mysql> create user 'totoapp'@'localhost' identified by 'admin2024’;
 - mysql> grant all privileges on . to 'totoapp'@'localhost' with grant option;
 - $ docker exec -it madb mysql -u totoapp -p
 - mysql> create database application;
 - mysql> show databases;
 - mysql> use application;
 - mysql> show tables;
 - mysql> create table login ( id int(11), identifiant varchar(100), mdp varchar(250), email varchar(250))des;
 - mysql> describe login;

 aprés avoir crée le create_table.sql
 - $ docker exec -it monmaria sh

 - source /script/create_table.Sql
 - source /script/departement.sql
 - source /script/villes_france.sql

 - select count(*) from departement

 - describe villes_france_free

 - select * from villes_france_free /G

 - select ville_id, ville_nom, ville_population_2012 from villes_france_free order by ville_population_2012;

 - MariaDB [application]> select ville_id, ville_nom, ville_population_2012 from villes_france_free order by ville_population_2012;

 - select * from departement limit 5;

 - select ville_id, ville_nom, ville_population_2012 from villes_france_free order by ville_population_2012 like '%97';

 - obtenir le nom des 10 villes les plus peuplés en 2012, ainsi que le nom du departement associée : 
  -select ville_id, ville_nom, departement_nom, ville_population_2012 from villes_france_free left join departement on departement_code = ville_departement order by ville_population_2012 DESC limit 10;

 - obtenir la liste du nom de chaque departement, associé à son code et du nombre de communes au sein de ces départements, en triant afin d'obtenir en priorité les départements qui possédent le plus de communes.

 - select departement_nom, departement_code, count(*) as nombre_communes from departement left join ville on ville_departement = departement_code group by departement_code order by nombre_communes DESC;

ou
- select departement_code, departement_nom, count(ville_id) as nombre_communes from departement left join villes_france_free on departement_code = ville_departement group by departement_code order by nombre_communes DESC;

