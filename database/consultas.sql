CREATE TABLE Enfermedades (
    idEnfermedad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    manchasMarrones FLOAT NOT NULL,
    manchasBlancas FLOAT NOT NULL,
    manchasRojas FLOAT NOT NULL,
    descamacionDeLaPiel FLOAT NOT NULL,
    SangradoDeLaPiel FLOAT NOT NULL,
    Picazon FLOAT NOT NULL,
    Lunares FLOAT NOT NULL,
    ampollas FLOAT NOT NULL,
    hongos FLOAT NOT NULL,
    sudoracion FLOAT NOT NULL,
    inflamacionDeLaPiel FLOAT NOT NULL,
    pielSeca FLOAT NOT NULL,
    pielGangena FLOAT NOT NULL,
    granosConSebo FLOAT NOT NULL,
    ronchas FLOAT NOT NULL,
    descripcion VARCHAR(800) NOT NULl,
    origen  VARCHAR(1000) NOT NULL
);


CREATE TABLE Recomendaciones (
    idRecomendacion INT PRIMARY KEY AUTO_INCREMENT, 
    recomendacion VARCHAR(500) NOT NULL,
    idEnfermedad INT
);




CREATE TABLE Usuarios (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(50) NOT NULL, 
    correo VARCHAR(30) UNIQUE NOT NULL, 
    contrasena VARCHAR(20)  NOT NULL
);


CREATE TABLE Resultados (
    idResultado INT PRIMARY KEY AUTO_INCREMENT, 
    nombreEnfermedad VARCHAR(30) NOT NULL,
    manchasMarrones FLOAT NOT NULL,
    manchasBlancas FLOAT NOT NULL,
    manchasRojas FLOAT NOT NULL,
    descamacionDeLaPiel FLOAT NOT NULL,
    SangradoDeLaPiel FLOAT NOT NULL,
    Picazon FLOAT NOT NULL,
    Lunares FLOAT NOT NULL,
    ampollas FLOAT NOT NULL,
    hongos FLOAT NOT NULL,
    sudoracion FLOAT NOT NULL,
    inflamacionDeLaPiel FLOAT NOT NULL,
    idUsuario int    
);

ALTER TABLE Recomendaciones
    ADD FOREIGN KEY (idEnfermedad) REFERENCES Enfermedades(idEnfermedad);

ALTER TABLE Resultados
    ADD FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario);


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Cloasma / Melasma', 0.9, 0.1, 0.1, 0.0, 0.0, 0.6, 0.0, 0.0, 0.0, 0.2, 0.1, 0.1, 0.0, 0.0, 0.0, 'Son unas manchas oscuras, marrones o grisáceas que pueden causar picazón, aunque sus consecuencias no van más allá de las estéticas de forma general. Sus consecuencias son por tanto más emocionales que físicas, pudiendo causar una baja autoestima o depresión por el aspecto que se presenta.', 'Aparecen como reacción a las hormonas como los estrógenos o la progesterona. Es por esto que es frecuente en las mujeres embarazadas, que producen estas hormonas de forma natural (para las embarazadas se conoce como “cloasma gravídico”), pero también en mujeres que estén tomando pastillas anticonceptivas o hormonoterapia sustitutiva, hormonas que se suministran para aliviar los síntomas de la menopausia.
La exposición a la luz del sol también puede provocar cloasmas, o hacerlos más notables en caso de que ya estuvieran previamente. Aparecen con más frecuencia, por tanto, en climas tropicales.
');

INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('El uso de cremas solares de forma diaria ayuda a prevenir los cloasmas.',1);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Las características físicas también son un factor a tener en cuenta: las mujeres con cabello oscuro y piel pálida son las que más probabilidades tienen de tener cloasmas.',1);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Existe también una predisposición genética a tener cloasmas: una de cada tres mujeres con cloasmas conocen casos en su misma familia.',1);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('La edad media sobre la que aparecen cloasmas es entre los 20 y 40 años.',1);








INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Poiderma', 0.1, 0.0, 0.0, 0.1, 0.7, 0.9, 0.1, 0.4, 0.3, 0.1, 0.1, 0.1, 0.9, 0.2, 0.0, '', '');

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Dermatitis', 0.0, 0.0, 0.3, 0.5, 0.0, 0.8, 0.0, 0.6, 0.0, 0.5, 0.8, 0.8, 0.0, 0.0, 0.1, '', '');


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Celulitis', 0.2, 0.0, 0.3, 0.0, 0.0, 0.5, 0.0, 0.0, 0.8, 0.7, 0.6, 0.0, 0.0, 0.0, 0.0, '', '');


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Eczema', 0.0, 0.6, 0.6, 0.9, 0.0, 0.3, 0.0, 0.2, 0.0, 0.0, 0.2, 0.1, 0.0, 0.1, 0.3, '', '');

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Urticaria', 0.0, 0.0, 0.7, 0.0, 0.1, 0.9, 0.0, 0.3, 0.0, 0.0, 0.2, 0.0, 0.0, 0.0, 1.0, '', '');

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Psoriasis', 0.0, 0.3, 0.7, 0.8, 0.2, 0.7, 0.2, 0.2, 0.0, 0.2, 0.1, 0.6, 0.0, 0.0, 0.1, '', '');

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Cáncer de Piel', 0.6, 0.0, 0.2, 0.3, 0.5, 0.4, 0.8, 0.0, 0.0, 0.0, 0.0, 0.1, 0.2, 0.0, 0.2, '', '');

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Acné', 0.1, 0.0, 0.7, 0.1, 0.4, 0.6, 0.0, 0.1, 0.2, 0.3, 0.3, 0.2, 0.0, 0.9, 0.1, '', '');

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Vitíligio', 0.0, 1.0, 0.2, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, '', '');



//eliminar todo
DROP DATABASE IF EXISTS quickstartdb;
//crear
CREATE DATABASE quickstartdb;
//usar bd
USE quickstartdb;
