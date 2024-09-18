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


# Exercice : 

    Obtenir la liste des 10 villes les plus peuplées en 2012
        select ville_id, ville_nom, ville_population_2012 from villes_france_free order by ville_population_2012;

    Obtenir la liste des 50 villes ayant la plus faible superficie
        SELECT * FROM `villes_france_free` ORDER BY `ville_surface` ASC LIMIT 50

    Obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département commencent par “97”
        select ville_id, ville_nom, ville_population_2012 from villes_france_free order by ville_population_2012 like '%97';

    Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé
        select ville_id, ville_nom, ville_population_2012 from villes_france_free order by ville_population_2012;

    Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces département, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes
        SELECT departement_nom, ville_departement, COUNT(*) AS nbr_items FROM `villes_france_free` LEFT JOIN departement ON departement_code = ville_departement GROUP BY ville_departement ORDER BY `nbr_items` DESC;

    Obtenir la liste des 10 plus grands départements, en terme de superficie
        select departement_nom, sum(ville_surface) as dptSurface from villes_france_free left join departement on departement_code = ville_departement group by ville_departement order by dptSurface DESC limit 10;

    Compter le nombre de villes dont le nom commence par “Saint”
     - select count(*) as NombreSaint from villes_france_free where ville_nom like 'Saint%';

    Obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes
     - select ville_nom, count(*) as nbt_item from villes_france_free group by ville_nom order by nbt_item desc limit 40;
        

    Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieur à la superficie moyenne
     - SELECT ville_nom,ville_surface  FROM `villes_france_free`  WHERE `ville_surface` > (SELECT AVG(`ville_surface`) FROM `villes_france_free`) order by ville_surface desc limit 10;

    Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants
     - select ville_departement, sum(ville_population_2012) as population_2012 from villes_france_free group by ville_departement having population_2012 > 2000000 order by population_2012 desc;

    Remplacez les tirets par un espace vide, pour toutes les villes commençant par “SAINT-” (dans la colonne qui contient les noms en majuscule)
     - update villes_france_free set ville_nom = replace(ville_nom, '-', ' ') where ville_nom like 'Saint-%';


    

 - select count(*) from departement

 - describe villes_france_free

 - select * from villes_france_free /G

 - select ville_id, ville_nom, ville_population_2012 from villes_france_free order by ville_population_2012;

 - select * from departement limit 5;



SELECT * 
FROM `villes_france_free` 
ORDER BY `ville_population_2012` DESC 
LIMIT 10


SELECT * FROM `villes_france_free` ORDER BY `ville_surface` ASC LIMIT 50


SELECT * 
FROM `departement` 
WHERE `departement_code` LIKE '97%'


SELECT * 
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
ORDER BY `ville_population_2012` DESC 
LIMIT 10


SELECT departement_nom, ville_departement, COUNT(*) AS nbr_items 
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
GROUP BY ville_departement
ORDER BY `nbr_items` DESC


SELECT departement_nom, ville_departement, SUM(`ville_surface`) AS dpt_surface 
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
GROUP BY ville_departement  
ORDER BY dpt_surface  DESC
LIMIT 10


SELECT COUNT(*) 
FROM `villes_france_free` 
WHERE `ville_nom` LIKE 'saint%'


SELECT ville_nom, COUNT(*) AS nbt_item 
FROM `villes_france_free` 
GROUP BY `ville_nom` 
ORDER BY nbt_item DESC


SELECT * 
FROM `villes_france_free` 
WHERE `ville_surface` > (SELECT AVG(`ville_surface`) FROM `villes_france_free`)


SELECT ville_departement, SUM(`ville_population_2012`) AS population_2012
FROM `villes_france_free` 
GROUP BY `ville_departement`
HAVING population_2012 > 2000000
ORDER BY population_2012 DESC


UPDATE `villes_france_free` 
SET ville_nom = REPLACE(ville_nom, '-', ' ') 
WHERE `ville_nom` LIKE 'SAINT-%'




# Exercice 02 :
 - il faut optimiser les requêtes, pour cela on peut créer des "vues" qui sonts des tables construites par le systeme de gestion de base de donnée en readONLY.
 - on peut aussi utiliser des "index" pour améliorer les performances

/!\ CREATION VUE /!\ 
 - create view ville_dep as select ville_nom, departement_nom from villes_france_free left join departement on departement_
code = ville_departement;

 - update villes_france_free set ville_nom = "TROIS BASSINS" where ville_nom = 'TROIS-BASSINS'


*On veut créer une nouvelle bdd, pour cela on passe en root afin de parer les droits.
