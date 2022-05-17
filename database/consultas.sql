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
    origen  VARCHAR(400) NOT NULL
);


CREATE TABLE Recomendaciones (
    idRecomendacion INT PRIMARY KEY AUTO_INCREMENT, 
    recomendacion VARCHAR(300) NOT NULL,
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
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangenaL, granosConSebo, ronchas, origen) 
VALUES ( 'Cloasma / Melasma', 0.9, 0.1, 0.1, 0.0, 0.0, 0.6, 0.0, 0.0, 0.0, 0.2, 0.1, 0.1, 0.0, 0.0, 0.0, '');


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangenaL, granosConSebo, ronchas, origen) 
VALUES ( 'Poiderma', 0.1, 0.0, 0.0, 0.1, 0.7, 0.9, 0.1, 0.4, 0.3, 0.1, 0.1, 0.1, 0.9, 0.2, 0.0, '');


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangenaL, granosConSebo, ronchas, origen) 
VALUES ( 'Dermatitis', 0.0, 0.0, 0.3, 0.5, 0.0, 0.8, 0.0, 0.6, 0.0, 0.5, 0.8, 0.8, 0.0, 0.0, 0.1, origen);


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangenaL, granosConSebo, ronchas, origen) 
VALUES ( 'Celulitis', 0.2, 0.0, 0.3, 0.0, 0.0, 0.5, 0.0, 0.0, 0.8, 0.7, 0.6, 0.0, 0.0, 0.0, 0.0, origen);


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangenaL, granosConSebo, ronchas, origen) 
VALUES ( 'Eczema', 0.0, 0.6, 0.6, 0.9, 0.0, 0.3, 0.0, 0.2, 0.0, 0.0, 0.2, 0.1, 0.0, 0.1, 0.3, origen);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangenaL, granosConSebo, ronchas, origen) 
VALUES ( 'Urticaria', 0.0, 0.0, 0.7, 0.0, 0.1, 0.9, 0.0, 0.3, 0.0, 0.0, 0.2, 0.0, 0.0, 0.0, 1.0, origen);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangenaL, granosConSebo, ronchas, origen) 
VALUES ( 'Psoriasis', 0.0, 0.3, 0.7, 0.8, 0.2, 0.7, 0.2, 0.2, 0.0, 0.2, 0.1, 0.6, 0.0, 0.0, 0.1, origen);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangenaL, granosConSebo, ronchas, origen) 
VALUES ( 'Cáncer de Piel', 0.6, 0.0, 0.2, 0.3, 0.5, 0.4, 0.8, 0.0, 0.0, 0.0, 0.0, 0.1, 0.2, 0.0, 0.2, origen);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangenaL, granosConSebo, ronchas, origen) 
VALUES ( 'Acné', 0.1, 0.0, 0.7, 0.1, 0.4, 0.6, 0.0, 0.1, 0.2, 0.3, 0.3, 0.2, 0.0, 0.9, 0.1, origen);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangenaL, granosConSebo, ronchas, origen) 
VALUES ( 'Vitíligio', 0.0, 1.0, 0.2, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, origen);