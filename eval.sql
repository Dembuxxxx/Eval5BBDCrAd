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

-- Insertion des scripts dans la base de donnée (fictif)

INSERT INTO Administrator ( name, First_name) VALUES ('Soumare' , 'Demba' ) , ('Serralongue' , 'Frank') , ('Dupont' , 'Michel') , ('Martin' , 'Yves') ;

INSERT INTO Infos (phone , address, postal_code , city , id_administrator ) VALUES ('0140365522' , '1 rue Buisson ' , '75019' , 'Paris' , '1') , ( '0140365522' , '38 rue Marx Dormoy ' , '75018 , 'Paris' , '2' )  , ('01487909673' , '7 route des Tarnes' , '75010' , 'Paris' , '3') , ('0143090807' , '9 Rue Montesquieu' , '75005' , 'Paris' , '4')  ;

INSERT INTO CinemaComplex (name , id_info )  VALUES ( 'Pathé Weber Paris17' , '1' ) , ( 'Pathé Weber Paris20' , '2' ) , ( 'Pathé Weber Paris14' , '3' ) , ( 'Pathé Weber Paris09' , '4' ) ;

INSERT INTO Halls (type_hall) VALUES  ( 'Privé') , ('Confort') , ('Classique') , ('3d') ;

INSERT INTO MovieTheatres
( number_halls , nbr_places , id_complex , id_type_hall )

VALUES 

('1', '10', '3', '3') ,
('2', '40', '3', '2') ,
('3', '50', '3', '5') ,
('4', '60', '3', '1') ,
('5', '22', '3', '4') ,
('6', '30', '3', '4') ,

('1', '70', '2', '2') ,
('2', '25', '2', '2') ,
('3', '45', '2', '3') ,
('4', '18', '2', '1') ,
('5', '2', '2', '2') ,
('6', '76', '2', '4') ,

('1', '34', '2', '1') ,
('2', '40', '3', '3') ,
('3', '45', '3', '2') ,
('4', '2', '1', '4') ,
('5', '18', '2', '1') ,
('6', '28', '3', '3') ,

('1', '87', '6', '4') ,
('2', '98', '7', '4') ,
('3', '67', '5', '3') ,
('4', '38', '5', '3') ,
('5', '3', '5', '1') ,
('6', '19', '4', '2') ;

INSERT INTO Genre (libelle)
VALUES ('Action') ,('Comedy') ,('Drama') ,('Aninamtion') ,('Drama') ,('Suspence') ,('Fantastic') ,('Horror')  ,('action movie')  ,('Policier') , ('Romance');

INSERT INTO Movies ( name , time , director , id_genre )
VALUES
('Conjuring 2' , '02:30:00' , 'markus dems', '1' ) ,
('Casa Del Papel' , '01:50:00' , 'Giuessepe Mielsa', '3' ) ,
('Alien 6' , '02:40:00' , 'Michael Douglas', '4' ) ,
('Dragon Ball Z revolution' , '02:00:00' , 'Aikido Fuqushima', '5' ) ,
('Resident Evil 8' , '01:45:00' , ' Marc Landers', '5' ) ,
('Blanche neige et les 7 nains' , '01:57:00' , 'Matt Hopkins,', '12' ) ,
('La colline a des yeux' , '02:40:00' , ' Arthur Rodriguez', '14' ) ,
('Le seigneur des anneaux 3' , '03:49:00' , 'Ben Sheffer', '1' ) ,
('Kirikou' , '01:34:00' , 'Fatou Ndiaye', '2' ) ,
('Megalodon' , '01:50:00' , 'Jeff Martinez', '13' ) ;


INSERT INTO Bookings ( id , start_time , id_customer , id_movie , id_movie_theatres  , id_payment)
VALUES
(UUID() , '2021-09-19 08:00:00' , 'ef34pdee-aw1c-24ac-aabb-23455cb14ai2' , '2' , '40'  , '1') ,
(UUID() , '2021-00-19 08:00:00' , 'ef34pdee-aw1c-24ac-aabb-23455cb14ai2' , '2' , '40' , '21' ) ,
(UUID() , '2021-09-19 08:00:00' , 'ef34pdee-aw1c-24ac-aabb-23455cb14ai2' , '2' , '10', '1'  ) ,
(UUID() , '2021-09-19 08:00:00' , 'ef34pdee-aw1c-24ac-aabb-23455cb14ai2' , '2' , '1' ,'25' ) ,
(UUID() , '2021-09-19 08:00:00' , 'ef34pdee-aw1c-24ac-aabb-23455cb14ai2' , '9' , '4' , '11' ) ,
(UUID() , '2021-09-19 12:40:00' , 'ef34pdee-aw1c-24ac-aabb-23455cb14ai2' , '9' , '9' , '23' ) ,
(UUID() , '2021-09-19 15:30:00' , 'ef34pdee-aw1c-24ac-aabb-23455cb14ai2' , '3' , '13'  , '13') ,
(UUID() , '2021-09-19 17:30:00' , 'ef34pdee-aw1c-24ac-aabb-23455cb14ai2' , '13' , '4' , '10' ) ,
(UUID() , '2021-09-19 20:00:00' , 'ef34pdee-aw1c-24ac-aabb-23455cb14ai2' , '1' , '1' , '13' ) ,
(UUID() , '2021-09-19 22:00:00' , 'ef34pdee-aw1c-24ac-aabb-23455cb14ai2' , '7' , '7' , '22' ) ;


INSERT INTO Payment (type_payment)
VALUES ('In place '), ('Online') ;

INSERT INTO PriceList ( type_price , price)
VALUES ('full price' , 11.40 ) , ('student' , 8.10 ) , ('under 12 years' , 4.50) ;


-- Requêtes sql qui montre que la BDD est fiable par rapport au exigences du client 


-- Par le numéro de réservation 'on peut reserver un film de notre choix dans plusieurs cinémas
SELECT bookings.id  AS 'Numéro de reservation' , Movies.name AS 'Nom du film' , CinemaArea.name AS 'Area cinema'
FROM Bookings
JOIN Movies ON Movies.id = Bookings.id_movie
JOIN MovieTheatres ON  MovieTheatres.id = Bookings.id_movie_theatres
JOIN CinemaComplex ON MovieTheatres.id_complex = CinemaArea.id
ORDER BY CinemaArea.name ;

-- On peut analyser des résa avec le meme film du meme cinema mais non de la meme salle
SELECT bookings.id  AS 'Numero de reservation' , Bookings.start_time , Movies.name AS 'Nom du film' , CinemaArea.name AS 'Area cinema' , MovieTheatres.number_halls AS 'Numéro de salle '
FROM Bookings
JOIN Movies ON Movies.id = Bookings.id_movie
JOIN MovieTheatres ON  MovieTheatres.id = Bookings.id_movie_theatres
JOIN CinemaComplex ON MovieTheatres.id_complex = CinemaArea.id
ORDER BY Bookings.start_time  ;


--  calcule le nombre d'emplacement qui reste dans une salle pour la séance
SELECT CinemaArea.name AS 'Nom du cinéma' , MovieTheatres.number_halls AS 'Numéro de salle' , MovieTheatres.nbr_places AS 'Nombre de place total' , count(Bookings.id_movie_theatres) AS 'Nombre de réservation' , MovieTheatres.nbr_places - count(Bookings.id_movie_theatres) AS 'Places restant'
FROM Bookings
JOIN MovieTheatres ON Bookings.id_movie_theatres = MovieTheatres.id
JOIN CinemaArea  ON MovieTheatres.id_complex = CinemaComplex.id
GROUP BY MovieTheatres.id ;

--  tarifs
SELECT *
FROM Payment

-- Table pour le paiement de la place sur place ou en ligne
SELECT Bookings.id AS 'Numéro de réservation' , CONCAT(Customers.name , ' ' , Customers.first_name) AS 'Nom et Prénom du client' , Payment.type_payment 'Choix du paiement'
FROM Bookings
JOIN Customers ON Bookings.id_customer = Customers.id
JOIN Payment ON Bookings.id_payment = Payment.id ;

-- Tabe qui permet de savoir qui est l'admin du cinéma
SELECT CinemaArea.name 'Nom du cinéma' ,  CONCAT(Administrator.name,  ' ' , Administrator.First_name) AS 'Nom Prenom'
FROM CinemaArea
JOIN infos ON CinemaArea.id_info = Infos.id
JOIN Administrator ON Infos.id_administrator = Administrator.id ;




-- Utilisation d'un utilitaire de sauvegarde de la base de données 
mysqldump -u root -p root -h localhost:3006 > eval.sql

--Utilisation d'un utilitaire de restauration de la base de données (je ne recrée pas la base de données, car le serveur la comportait déjà)
mysql -h localhost:3006 -u root -p root reservation_place_cinema < eval.sql