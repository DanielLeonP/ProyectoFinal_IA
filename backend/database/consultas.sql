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
VALUES ( 'Poiderma', 0.1, 0.0, 0.0, 0.1, 0.7, 0.9, 0.1, 0.4, 0.3, 0.1, 0.1, 0.1, 0.9, 0.2, 0.0, 'Es un trastorno poco frecuente que provoca la aparición de llagas grandes y dolorosas (úlceras) en la piel, en especial en las piernas.', 'Se desconocen las causas exactas del pioderma gangrenoso, pero parece ser un trastorno del sistema inmunitario. 
Aquellas personas que padecen ciertos trastornos ocultos, tales como enfermedad intestinal inflamatoria o artritis, tienen mayor riesgo de padecer pioderma gangrenoso.
Esta afección no es infecciosa ni contagiosa. A menudo se asocia con enfermedades autoinmunes, como la colitis ulcerosa, la enfermedad de Crohn y la artritis. Además, puede tener un componente genético.');

INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Habla con tu médico si desarrollas una herida cutánea dolorosa y de crecimiento rápido.',2);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Existen ciertos factores que pueden aumentar el riesgo de presentar pioderma gangrenoso, como los siguientes: edad y el sexo, padecer una enfermedad inflamatoria intestinal, tener artritis o tener un trastorno de la sangre.',2);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Las posibles complicaciones del pioderma gangrenoso incluyen infección, cicatrización, dolor no controlado, depresión y pérdida de movilidad.',2);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('No puedes evitar el pioderma gangrenoso por completo. Si padeces de la enfermedad, intenta no lastimarte la piel. ',2);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Las lesiones o los traumatismos en la piel, incluso los que se producen a partir de una cirugía, pueden provocar que se formen nuevas úlceras.',2);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('También puede ser de ayuda que se controle cualquier enfermedad no diagnosticada que pueda estar causando las úlceras.',2);


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Dermatitis', 0.0, 0.0, 0.3, 0.5, 0.0, 0.8, 0.0, 0.6, 0.0, 0.5, 0.8, 0.8, 0.0, 0.0, 0.1, 'Es una irritación común de la piel, que generalmente implica piel seca y con comezón o con sarpullido, o puede hacer que la piel se ampolle, exude, forme costras o se descame.
Existen 3 tipos comunes de esta afección; dermatitis atópica (eccema), dermatitis seborreica y dermatitis por contacto.
Algunos de los sintomas son: Picazón (prurito), piel seca, erupción en la piel hinchada que varía de color según el color de piel, ampollas, descamación de la piel (caspa), piel engrosada o bultos en los folículos pilosos.', 'Una causa común de la dermatitis es el contacto con algún agente que irrita la piel o que provoca una reacción alérgica, por ejemplo, hiedra venenosa, perfumes, lociones y joyas que contienen níquel. 
Otras causas de la dermatitis incluyen la piel seca, una infección viral, bacterias, estrés, la composición genética y un problema en el sistema inmunitario.');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Evita la piel seca adoptando mejores hábitos al bañarte, como: tomar baños y duchas más cortos, usa un limpiador suave, sin jabón, sécate suavemente y humedece la piel.',3);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Los tratamientos para la dermatitis dependen del tipo, la gravedad de los síntomas y la causa.',3);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Tu piel puede sanar por sí sola después de una a cuatro semanas. Si no es así, tu dermatólogo te recomendará:Cremas o lociones para pieles secas, medicamentos para reducir las alergias y la picazón, exponer las áreas afectadas a cantidades controladas de luz, cremas tópicas para aliviar la picazón y la inflamación, baños de avena para aliviar la picazón, medicamentos antimicóticos que generalmente se administran sólo si se ha desarrollado una infección.',3);

INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Consulta al médico cuando sientes tanta molestia que tienes problemas para dormir o te distraes de tus rutinas diarias, tu piel se vuelve dolorosa, sospechas que tienes la piel infectada, o has intentado tomar medidas de autocuidado, pero los signos y síntomas persisten.',3);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('La conciencia es el primer paso para evitar la dermatitis. La única forma de prevenir una reacción alérgica es evitar el contacto con alérgenos o sustancias que causan erupciones. No obstante, si sufres de eczemas, que no siempre se pueden prevenir, tu mejor opción es evitar un brote.',3);




// FALTAN A PARTIR DE AQUI



INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Celulitis', 0.2, 0.0, 0.3, 0.0, 0.0, 0.5, 0.0, 0.0, 0.8, 0.7, 0.6, 0.0, 0.0, 0.0, 0.0, '', '');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('',4);


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Eczema', 0.0, 0.6, 0.6, 0.9, 0.0, 0.3, 0.0, 0.2, 0.0, 0.0, 0.2, 0.1, 0.0, 0.1, 0.3, '', '');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('',5);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Urticaria', 0.0, 0.0, 0.7, 0.0, 0.1, 0.9, 0.0, 0.3, 0.0, 0.0, 0.2, 0.0, 0.0, 0.0, 1.0, '', '');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('',6);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Psoriasis', 0.0, 0.3, 0.7, 0.8, 0.2, 0.7, 0.2, 0.2, 0.0, 0.2, 0.1, 0.6, 0.0, 0.0, 0.1, '', '');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('',7);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Cáncer de Piel', 0.6, 0.0, 0.2, 0.3, 0.5, 0.4, 0.8, 0.0, 0.0, 0.0, 0.0, 0.1, 0.2, 0.0, 0.2, '', '');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('',8);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Acné', 0.1, 0.0, 0.7, 0.1, 0.4, 0.6, 0.0, 0.1, 0.2, 0.3, 0.3, 0.2, 0.0, 0.9, 0.1, '', '');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('',9);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Vitíligio', 0.0, 1.0, 0.2, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, '', '');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('',10);


//eliminar todo
DROP DATABASE IF EXISTS quickstartdb;
//crear
CREATE DATABASE quickstartdb;
//usar bd
USE quickstartdb;
