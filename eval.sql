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

CREATE TABLE Infos
(
    id INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    phone INT(10) NOT NULL ,
    address VARCHAR(250) NOT NULL ,
    postal_code VARCHAR(5) NOT NULL ,
    city VARCHAR(60),
     id_administrator int(10) ,
    FOREIGN KEY (id_administrator) REFERENCES Administrator (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE CinemaArea
(
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    name VARCHAR(60) NOT NULL,
    id_info INT(10) NOT NULL ,
    FOREIGN KEY (id_info) REFERENCES Infos (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE Halls
(
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    type_hall VARCHAR(60) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE MovieTheatres
(
    id INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    number_halls INT(10) NOT NULL ,
    nbr_places INT(10) NOT NULL ,
    id_complex INT(10) NOT NULL ,
    id_type_hall INT(10) NOT NULL ,
    FOREIGN KEY (id_complex) REFERENCES CinemaComplex (id) ,
    FOREIGN KEY (id_type_hall) REFERENCES Halls (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE Genre
(
    id INT(100) PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    libelle VARCHAR(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE Movies
(
    id INT(100) PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    name VARCHAR(60) NOT NULL ,
    time TIME NOT NULL ,
    director VARCHAR(60) NOT NULL ,
    id_genre INT(100) NOT NULL ,
    FOREIGN KEY (id_genre) REFERENCES Genre (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE Payment
(
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    type_payment VARCHAR(60) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;


 CREATE TABLE PriceList
(
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    type_price VARCHAR(60) NOT NULL ,
    price DECIMAL (4,2) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE Customers
(
    id CHAR(36) PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL ,
    first_name VARCHAR(20) NOT NULL ,
    age INT(2) NOT NULL ,
    email VARCHAR(254) NOT NULL UNIQUE,
    passeword CHAR(60) NOT NULL,
    id_tarif INT(10) NOT NULL ,
    FOREIGN KEY (id_tarif) REFERENCES PriceList (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;
 
CREATE TABLE Bookings
(
    id CHAR(36) NOT NULL PRIMARY KEY ,
    start_time DATETIME NOT NULL,
    id_customer CHAR(36) NOT NULL,
    id_movie INT(100) NOT NULL ,
    id_movie_theatres INT(10) NOT NULL ,
    id_payment INT(10) NOT NULL ,
    FOREIGN KEY (id_customer) REFERENCES Customers (id) ,
    FOREIGN KEY (id_movie) REFERENCES Movies (id) ,
    FOREIGN KEY (id_movie_theatres) REFERENCES MovieTheatres (id),
    FOREIGN KEY (id_payment) REFERENCES Payment (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

-- Insertion des scripts  d'alimentation factice de données dans la base

INSERT INTO Administrator ( name, First_name) VALUES ('Soumare' , 'Demba' ) , ('Serralongue' , 'Frank') , ('Dupont' , 'Michel') , ('Martin' , 'Yves') ;

INSERT INTO Infos (phone , address, postal_code , city , id_administrator ) VALUES ('0140365522' , '1 rue Buisson ' , '75019' , 'Paris' , '1') , ( '0140365522' , '38 rue Marx Dormoy ' , '75018 , 'Paris' , '2' )  , ('01487909673' , '7 route des Tarnes' , '75010' , 'Paris' , '3') , ('0143090807' , '9 Rue Montesquieu' , '75005' , 'Paris' , '4')  ;

INSERT INTO CinemaComplex (name , id_info )  VALUES ( 'Pathé Weber Paris17' , '1' ) , ( 'Pathé Weber Paris20' , '2' ) , ( 'Pathé Weber Paris14' , '3' ) , ( 'Pathé Weber Paris09' , '4' ) ;

INSERT INTO Halls (type_hall) VALUES  ( 'Privé') , ('Confort') , ('Classique') , ('3d') ;

INSERT INTO MovieTheatres
( number_halls , nbr_places , id_complex , id_type_hall )
