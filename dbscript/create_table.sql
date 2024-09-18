CREATE TABLE IF NOT EXISTS departement (
    departement_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    departement_code VARCHAR(3) DEFAULT NULL,
    departement_nom VARCHAR(250) DEFAULT NULL,
    departement_nom_uppercase VARCHAR(250) DEFAULT NULL,
    departement_slug VARCHAR(250) DEFAULT NULL,
    departement_nom_soundex VARCHAR(20) DEFAULT NULL
    );

CREATE TABLE IF NOT EXISTS villes_france_free (
    ville_id MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ville_departement VARCHAR(3) DEFAULT NULL,
    ville_slug VARCHAR(250) DEFAULT NULL,
    ville_nom VARCHAR(45) DEFAULT NULL,
    ville_nom_simple VARCHAR(40) DEFAULT NULL,
    ville_nom_reel VARCHAR(45) DEFAULT NULL,
    ville_nom_soundex VARCHAR(45) DEFAULT NULL,
    ville_nom_metaphone VARCHAR(45) DEFAULT NULL,
    ville_code_postal  VARCHAR(250) DEFAULT NULL,
    ville_commune VARCHAR(3) DEFAULT NULL,
    ville_code_commune VARCHAR(5) DEFAULT NULL,
    ville_arrondissement SMALLINT(3) UNSIGNED DEFAULT NULL,
    ville_canton VARCHAR(4) DEFAULT NULL,
    ville_amdi SMALLINT(5) DEFAULT NULL,
    ville_population_2010 MEDIUMINT(11) UNSIGNED DEFAULT NULL,
    ville_population_1999 MEDIUMINT(11) UNSIGNED DEFAULT NULL,
    ville_population_2012 MEDIUMINT(11) UNSIGNED DEFAULT NULL COMMENT 'approximation',
    ville_densite_2010 int(11) DEFAULT NULL,
    ville_surface FLOAT DEFAULT NULL,
    ville_longitude_deg FLOAT DEFAULT NULL,
    ville_latitude_deg FLOAT DEFAULT NULL,
    ville_longitude_grd VARCHAR(9) DEFAULT NULL,
    ville_latitude_grd VARCHAR(8) DEFAULT NULL,
    ville_longitude_dms VARCHAR(9) DEFAULT NULL,
    ville_latitude_dms VARCHAR(8) DEFAULT NULL,
    ville_zmin MEDIUMINT(4) DEFAULT NULL,
    ville_zmax MEDIUMINT(4) DEFAULT NULL
    );
    


