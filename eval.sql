-- connexion au serveur MySQL
mysql -h localhost:3306 -u root -p root

-- Afficher la liste des bases de données
SHOW databases;

-- Création de la  base de données
CREATE DATABASE  resa_place_cinema ;

-- Sélectionner la bbd souhaité pour la création de table
USE resa_place_cinema ;

--Creation des tables

CREATE TABLE Administrator
(
   id INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL ,
    First_name VARCHAR(60) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
