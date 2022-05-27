
DROP DATABASE IF EXISTS quickstartdb;

CREATE DATABASE quickstartdb;

USE quickstartdb;


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
    descripcion VARCHAR(1500) NOT NULl,
    origen  VARCHAR(1500) NOT NULL
);


CREATE TABLE Recomendaciones (
    idRecomendacion INT PRIMARY KEY AUTO_INCREMENT, 
    recomendacion VARCHAR(1000) NOT NULL,
    idEnfermedad INT
);

ALTER TABLE Recomendaciones
    ADD FOREIGN KEY (idEnfermedad) REFERENCES Enfermedades(idEnfermedad);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Cloasma / Melasma', 0.9, 0.1, 0.1, 0.0, 0.0, 0.6, 0.0, 0.0, 0.0, 0.2, 0.1, 0.1, 0.0, 0.0, 0.0, 'Son unas manchas oscuras, marrones o grisáceas que pueden causar picazón, aunque sus consecuencias no van más allá de las estéticas de forma general. Sus consecuencias son por tanto más emocionales que físicas, pudiendo causar una baja autoestima o depresión por el aspecto que se presenta.
','Aparecen como reacción a las hormonas como los estrógenos o la progesterona. Es por esto que es frecuente en las mujeres embarazadas, que producen estas hormonas de forma natural (para las embarazadas se conoce como “cloasma gravídico”), pero también en mujeres que estén tomando pastillas anticonceptivas o hormonoterapia sustitutiva, hormonas que se suministran para aliviar los síntomas de la menopausia.
La exposición a la luz del sol también puede provocar cloasmas, o hacerlos más notables en caso de que ya estuvieran previamente. Aparecen con más frecuencia, por tanto, en climas tropicales.
');

INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('El uso de cremas solares de forma diaria ayuda a prevenir los cloasmas. Las características físicas también son un factor a tener en cuenta: las mujeres con cabello oscuro y piel pálida son las que más probabilidades tienen de tener cloasmas.
',1);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Existe también una predisposición genética a tener cloasmas: una de cada tres mujeres con cloasmas, conocen casos en su misma familia. La edad media sobre la que aparecen cloasmas es entre los 20 y 40 años.
',1);



INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Pioderma', 0.1, 0.0, 0.0, 0.1, 0.7, 0.9, 0.1, 0.4, 0.3, 0.1, 0.1, 0.1, 0.9, 0.2, 0.0, 'Es un trastorno poco frecuente que provoca la aparición de llagas grandes y dolorosas (úlceras) en la piel, en especial en las piernas, es una dermatosis infrecuente, inflamatoria, destructiva, caracterizada por nódulos o pústulas hemorrágicas dolorosas que al romperse forman úlceras que se agrandan progresivamente.
','Se desconocen las causas exactas del pioderma gangrenoso, pero parece ser un trastorno del sistema inmunitario. 
Aquellas personas que padecen ciertos trastornos ocultos, tales como enfermedad intestinal inflamatoria o artritis, tienen mayor riesgo de padecer pioderma gangrenoso.
Esta afección no es infecciosa ni contagiosa. A menudo se asocia con enfermedades autoinmunes, como la colitis ulcerosa, la enfermedad de Crohn y la artritis. Además, puede tener un componente genético.
');

INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Habla con tu médico si desarrollas una herida cutánea dolorosa y de crecimiento rápido. Existen ciertos factores que pueden aumentar el riesgo de presentar pioderma gangrenoso, como los siguientes: edad y el sexo, padecer una enfermedad inflamatoria intestinal, tener artritis o tener un trastorno de la sangre.
',2);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Las posibles complicaciones del pioderma gangrenoso incluyen infección, cicatrización, dolor no controlado, depresión y pérdida de movilidad. No puedes evitar el pioderma gangrenoso por completo. Si padeces de la enfermedad, intenta no lastimarte la piel. 
',2);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Las lesiones o los traumatismos en la piel, incluso los que se producen a partir de una cirugía, pueden provocar que se formen nuevas úlceras.
',2);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('También puede ser de ayuda que se controle cualquier enfermedad no diagnosticada que pueda estar causando las úlceras.
',2);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Dermatitis', 0.0, 0.0, 0.3, 0.5, 0.0, 0.8, 0.0, 0.6, 0.0, 0.5, 0.8, 0.8, 0.0, 0.0, 0.1, 'Es una irritación común de la piel, que generalmente implica piel seca y con comezón o con sarpullido, o puede hacer que la piel se ampolle, exude, forme costras o se descame. Existen tres tipos comunes de esta afección; dermatitis atópica (eccema), dermatitis seborreica y dermatitis por contacto.
Algunos de los síntomas son la picazón (prurito), piel seca, erupción en la piel hinchada que varía de color según el color de piel, ampollas, descamación de la piel (caspa), piel engrosada o bultos en los folículos pilosos.
', 'Una causa común de la dermatitis es el contacto con algún agente que irrita la piel o que provoca una reacción alérgica, por ejemplo, hiedra venenosa, perfumes, lociones y joyas que contienen níquel.
Otras causas de la dermatitis incluyen la piel seca, una infección viral, bacterias, estrés, la composición genética y un problema en el sistema inmunitario.
');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Evita la piel seca adoptando mejores hábitos al bañarte, como: tomar baños y duchas más cortos, usa un limpiador suave, sin jabón, sécate suavemente y humedece la piel. Los tratamientos para la dermatitis dependen del tipo, la gravedad de los síntomas y la causa.
',3);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Tu piel puede sanar por sí sola después de una a cuatro semanas. Si no es así, tu dermatólogo te recomendará: Cremas o lociones para pieles secas, medicamentos para reducir las alergias y la picazón, exponer las áreas afectadas a cantidades controladas de luz, cremas tópicas para aliviar la picazón y la inflamación, baños de avena para aliviar la picazón, medicamentos antimicóticos que generalmente se administran sólo si se ha desarrollado una infección.
',3);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Consulta al médico cuando sientes tanta molestia que tienes problemas para dormir o te distraes de tus rutinas diarias, tu piel se vuelve dolorosa, sospechas que tienes la piel infectada, o has intentado tomar medidas de autocuidado, pero los signos y síntomas persisten.
',3);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('La conciencia es el primer paso para evitar la dermatitis. La única forma de prevenir una reacción alérgica es evitar el contacto con alérgenos o sustancias que causan erupciones. No obstante, si sufres de eczemas, que no siempre se pueden prevenir, tu mejor opción es evitar un brote.',3);


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Celulitis', 0.2, 0.0, 0.3, 0.0, 0.0, 0.5, 0.0, 0.0, 0.8, 0.7, 0.6, 0.0, 0.0, 0.0, 0.0, 'Es una patología que ocurre en las piernas usualmente de mujeres, que genera fatiga, astenia, sensación de peso en las piernas y a veces dolores espontáneos difusos que aumentan de intensidad con el reposo, pudiendo presentar calambres nocturnos.
Su formación se presenta como una superficie irregular, ondulada, piel acolchada, (con depresiones alternadas con protuberancias) y piel en cáscara de naranja, por tumefacción de los planos superficiales y dilatación de los orificios foliculares. Puede haber estrías por ruptura de fibras elásticas de la dermis, equimosis por fragilidad capilar y varículas.
En la celulitis dura podemos encontrar, que la piel presenta un engrosamiento muy acentuado y un aumento de los tejidos superficiales, y en la celulitis blanda podemos encontrarla en todo el cuerpo, y modifica la anatomía normal provocando una gran deformación de la región pélvica, la piel llega a tener un espesor de cinco a ocho centímetros.
', 'Una causa común de la celulitis es la herencia, la susceptibilidad genética es un factor importante en cuanto al desarrollo de ésta, la obesidad es una causa principal de la generación de la celulitis.
El hiperestrogenismo es la participación de las hormonas femeninas en la etiopatogenia de la celulitis es sin duda uno de los dos factores principales involucrados, considerado como fuente del proceso y protagonista de la mayor responsabilidad en la evolución, agravamiento y perpetuación de la lipodistrofia (celulitis).
Otros factores que pueden afectar y participar en el proceso del desarrollo de la celulitis es el sedentarismo, tabaquismo, alcoholismo, factores biológicos o ambientales.
');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('El mejor tratamiento es el tratamiento preventivo controlando siempre en la medida de lo posible los factores influyentes. Si bien es cierto que cuando la paciente acude a tratarse la celulitis ya está presente e instalada, aun así resulta útil educar en sentido preventivo, porque en muchos casos colaborarán en el resultado del tratamiento que le estamos aplicando.
',4);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Evitar el sedentarismo, realizando ejercicio físico lo cual es importante como prevención en esta patología, evitar el tabaquismo y prendas ajustadas, evitar el calzado incorrecto, el estrés, el estreñimiento, la toma de anticonceptivos orales, el exceso de calor, las exposiciones prolongadas al sol, calefacciones y locales cerrados con exceso de temperatura. Otro punto importante es mantener el peso ideal.
',4);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('La cafeína es el ingrediente básico de muchas cremas anticelulitis en porcentajes que varían hasta el 5%, activa las enzimas que aceleran la ruptura de moléculas de grasa, ya que ésta inhibe la fosfodiesterasa que generan la celulitis, además, se reporta que estas cremas son seguras de usar.
',4);


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Eczema', 0.0, 0.6, 0.6, 0.9, 0.0, 0.3, 0.0, 0.2, 0.0, 0.0, 0.2, 0.1, 0.0, 0.1, 0.3, 'El eczema es una enfermedad inflamatoria de la piel de carácter crónico y recidivante, que usualmente se utiliza para referirse a una fase muy aguda, suele ser muy pruriginosa y afectar sobre todo las superficies flexoras de los codos y de las rodillas y, en menor grado, el cuero cabelludo, la cara o el torso.
Los síntomas más frecuentes del eczema son el escozor intenso y persistente (incluso nocturno), inflamación cutánea, erupción cutánea, ampollas que llegan a supurar y a formar costras, excoriación debido al rascado pudiendo llegar a infección, áreas de la piel secas, pigmentación de la piel irregular, y liquenización (piel con aspecto de cuero) por rascado o irritación prolongados.
', 'Es una de las enfermedades cutáneas más frecuentes, la cual suele iniciarse antes del primer año de vida en más de 60% de los afectados. A la edad de 12 años se inicia en solo un 5% de niños y su aparición en adultos es muy raro.
Existen varias hipótesis para explicar las causas de la aparición del eczema. Se consideran aspectos genéticos, ya que en un 50 a 70% de los afectados con eczema existen antecedentes de atopia personal o familiar, se postulan aspectos ambientales, infecciosos, neurovegetativos, alimentarios, entre otros.
');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Los corticosteroides tópicos han demostrado buenos resultados (de acuerdo a la severidad se pueden considerar preparaciones leves, moderadas, fuertes y muy fuertes). Cuando estos no son efectivos, se pueden usar por periodos cortos inmunosupresores tópicos (inhibidores de calcineurina) como ungüentos de tacrolimus o crema de pimecrolimus.',5);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Los antihistamínicos por vía oral pueden ayudar a disminuir el escozor, inmunosupresores sistémicos y fototerapia, antibióticos tópicos y/o orales cuando hay infecciones.',5);


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Urticaria', 0.0, 0.0, 0.7, 0.0, 0.1, 0.9, 0.0, 0.3, 0.0, 0.0, 0.2, 0.0, 0.0, 0.0, 1.0, 'La urticaria, llamada también ronchas o erupción de ortiga y el angioedema, son reacciones vasculares de la piel caracterizada por ronchas evanescentes de variado tamaño y de vida corta, eritematosas, pruriginosas y, generalmente, sin manifestaciones sistémicas, salvo ocasionalmente pueden progresar a anafilaxis.
La urticaria y el angioedema son problemas dermatológicos comunes, con una prevalencia aproximada de 20%, aunque no suele poner en riesgo la vida, pero, puede alterar la calidad de vida de quien lo padece en un grado comparable con los que sufren una triple enfermedad coronaria.
La urticaria consiste de ronchas recurrentes, usualmente pruriginosas, circunscritas, elevadas, eritematosas, a menudo con el centro pálido, áreas evanescentes de edema que involucran la porción superficial de la dermis. Las ronchas varían en tamaño, de unos pocos milímetros a varios centímetros en su diámetro, y pueden localizarse en cualquier lugar del cuerpo.
', 'Las urticarias en las que está involucrado el complemento incluyen las causadas por infecciones bacterianas o virales, la enfermedad del suero y las reacciones transfusionales; así como las generadas por ciertas drogas como los opioides, vecuronio, succinilcolina, vancomicina y agentes de radiocontraste, que causan urticaria porque desgranulan al mastocito.
Las urticarias físicas son desencadenadas por un estímulo físico. En muchas de las urticarias crónicas no se encuentra causa alguna, son las denominadas urticarias idiopáticas, a pesar de que muchas de ellas son urticarias crónicas autoinmunes, lo que se constata por pruebas cutáneas positivas a suero autólogo.
');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Es indiscutible el uso de antihistamínicos, aunque no todos los pacientes responden a plenitud e, incluso, algunos hasta empeoran. Los antihistamínicos tienen la capacidad de inhibir la liberación de histamina de los mastocitos y de los basófilos.
',6);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Los antidepresivos tricíclicos, los corticoides, los antagonistas de los canales de calcio, los suplementos de levotiroxina, los antagonistas de los receptores de los leucotrienos, entre otros. Se opta cuando la urticaria no ha respondido a los fármacos de la primera línea. 
',6);


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Psoriasis', 0.0, 0.3, 0.7, 0.8, 0.2, 0.7, 0.2, 0.2, 0.0, 0.2, 0.1, 0.6, 0.0, 0.0, 0.1, 'La psoriasis es una enfermedad inflamatoria crónica cuya alteración más evidente es la hiperproliferación y aberrante diferenciación de los queratinocitos.
La piel psoriática se caracteriza porque este ciclo se completa en sólo 4 días; así los queratinocitos se van acumulando y la piel se va haciendo hiperplásica lo cual se manifiesta clínicamente por placas gruesas y con abundantes escamas. Es una afección cutánea que provoca enrojecimiento, escamas plateadas e irritación de la piel. La mayoría de las personas con psoriasis presentan parches gruesos, rojos y bien definidos de piel y escamas de color blanco plateado.
', 'Hasta el presente se considera una enfermedad de causa desconocida con base genética e inmunomediada, donde influyen factores ambientales y psicosomáticos.
El carácter familiar de la psoriasis es conocido. La frecuencia de psoriasis en los niños, si uno de los padres es psoriásico, sería del 30 %, y del 60% si los dos padres están afectados, existe relación entre psoriasis, estrés psíquico y los factores psicosociales.
Como la concordancia en monocigotos no es del 100% como sería expresado en una enfermedad de origen genético, es evidente que existe una importante contribución de factores ambientales como son infecciones bacterianas, traumas físicos, fármacos, tabaquismo, alcohol, estrés psíquico, no demostrados totalmente.
');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('En ocasiones, puede ser difícil de diagnosticar, porque los síntomas se parecen a los de otras enfermedades cutáneas, por lo que puede ser necesario examinar una pequeña muestra de piel en el microscopio. Aunque todos los tratamientos de la psoriasis son efectivos para la mayoría de los pacientes, ninguno lo es para todo el mundo, ya que la respuesta a cada tratamiento varía de una persona a otra.
',7);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Con lociones, ungüentos, cremas y champús, se utilizan sobre todo corticoides tópicos, sustancias derivadas de la vitamina D, para reducir la inflamación y el reemplazo celular, reducir la actividad del sistema inmunitario, descamar la piel y destapar los poros y suavizar la piel.
',7);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('En casos de psoriasis más extensa, se utiliza la exposición a la radiación ultravioleta UVB, bien sea natural (producida por el sol), bien artificial.
',7);


INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Cáncer de Piel', 0.6, 0.0, 0.2, 0.3, 0.5, 0.4, 0.8, 0.0, 0.0, 0.0, 0.0, 0.1, 0.2, 0.0, 0.2, 'El cáncer de piel es una de las neoplasias más comunes, el término cáncer de piel incluye tumores de diversa estirpe celular y diferente agresividad y pronóstico. Aproximadamente el 70% de los casos de cáncer de piel, ocurre en la cara, y como antecedente etiológico consistente está la radiación solar. El 15% se localiza en el tronco y muy raramente se encuentra en áreas como el pene, la vulva o la piel perianal.
El cáncer nodular, se presenta principalmente en la cara como una neoformación exofítica generalmente de aspecto rosado. La lesión presenta una apariencia perlada o traslúcida que comúnmente presenta telangiectasias.
En el cáncer superficial, los hombres presentan una mayor incidencia de éstos. Se presentan con mayor frecuencia en el tronco, principalmente como manchas o neoformaciones planas que pueden ser rosadas o eritematosas con una ligera descamación. Ocasionalmente puede haber pigmento café o negro, que puede contribuir a que se le confunda con melanoma.
El cáncer morfeiforme, son neoformaciones suaves, pálidas o con un leve eritema y atróficas. Usualmente presentan una consistencia firme o indurada.
', 'El riesgo de un sujeto para desarrollar cáncer en la piel depende de factores constitucionales y ambientales. Los factores constitucionales incluyen la historia familiar, cabello claro o rojo, múltiples nevos melanocíticos, sensibilidad a la exposición solar, entre otros. Mientras que la radiación ultravioleta (UV) es un factor de riesgo ambiental bien establecido, y el más importante.
La exposición a la radiación UV es el factor más importante. Otros factores de riesgo establecidos incluyen la exposición crónica al arsénico, terapia con radiación, terapia inmunosupresora, traumas mecánicos, cicatrices recalcitrantes y el síndrome de nevos de células basales.
La mayoría de los factores de riesgo tienen una relación directa con los hábitos de exposición y la susceptibilidad del huésped a la radiación solar. Estos factores de riesgo incluyen piel clara, ojos claros, cabello rojo, ascendencia europea y la edad; el tipo, la cantidad y el tiempo de exposición solar asociados a la incidencia incrementada del cáncer no están claramente definidos.
La exposición solar durante la infancia parece ser más importante que durante la edad adulta. La frecuencia e intensidad de la exposición solar son factores igualmente importantes. La exposición solar de manera intermitente e intensa incrementa más el riesgo de presentar el cáncer, que la exposición continua.
');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('El objetivo del tratamiento será la escisión completa del tumor con una apariencia cosmética aceptable. Se tienen varias modalidades de tratamiento disponibles, su elección dependerá del tipo de lesión, su localización, las características del paciente y los recursos con los que se cuente. Podemos resumir el tratamiento en dos variantes: los procedimientos quirúrgicos y los no quirúrgicos.
',8);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Dentro del primer grupo podemos enumerar las técnicas excisionales, es decir, la extirpación quirúrgica, y la cirugía micrográfica de Mohsx. En el grupo de los procedimientos no quirúrgicos tenemos el curetaje, la electrodesecación y la criocirugía, la radioterapia, el interferón intralesional, el 5-fluorouracilo (5-FU), la terapia fotodinámica, los retinoides, la quimioterapia y el imiquimod.
',8);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Acné', 0.1, 0.0, 0.7, 0.1, 0.4, 0.6, 0.0, 0.1, 0.2, 0.3, 0.3, 0.2, 0.0, 0.9, 0.1, 'El acné es una enfermedad multifactorial y una de las dermatosis más frecuentes. El acné se clasifica de acuerdo al tipo de lesión en no inflamatorio y en inflamatorio (pápulas, pústulas, nódulos y quistes); y también de acuerdo a su severidad en leve, moderado o severo dependiendo de la cantidad de lesiones presentes.
El acné no inflamatorio se caracteriza por presentar comedones de cabeza abierta y cerrada que afectan la región frontal, nasal y mentoniana, el acné inflamatorio es cuando se agrega al cuadro la diseborrea, pápulas y pústulas y de acuerdo con el número de lesiones se considera leve, moderado y severo, en ocasiones se pueden observar trayectos fistulosos y considerarse severos por la secuela cicatrizal que éstos conllevan.
', 'Hoy en día se considera como una enfermedad crónica con episodios de empeoramiento y remisión. Esta entidad afecta principalmente a la gente joven; tiene una incidencia de 35 a 80% entre los 12 y 24 años.
Si hay un exceso de sebo y demasiadas células cutáneas muertas, los poros se tapan, y las bacterias pueden quedar atrapadas dentro de los poros y multiplicarse. Esto hace que la piel se hinche y enrojezca: el comienzo del acné, si los poros se cierran, o se obstruyen, pueden encerrar a las bacterias y células de la piel muerta, se almacenan y generan espinillas que pueden derivar en nódulos.
');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('El acné es una enfermedad de gran impacto psicológico y social, en el que se pueden presentar ansiedad, depresión o aislamiento social, por lo que la tendencia actual es iniciar el tratamiento lo más temprano posible para evitar las cicatrices físicas y psicológicas. Entre los tratamientos podemos encontrar:',9);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Los más utilizados son los antibióticos tópicos (eritromicina y clindamicina), peróxido de benzoilo (PB) y ácido azelaico, los antibióticos se utilizan en el tratamiento de acné inflamatorio de leve a moderado.
',9);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('El ácido salicílico tiene efectos anti-inflamatorios y comedolíticos leves, puede ser utilizado como terapia inicial en el acné leve o como coadyuvante, y se encuentra disponible en geles, cremas, ungüentos, lociones y espumas.
',9);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('La Isotretinoína, se utiliza en el acné moderado y severo que no responde al tratamiento tópico y en el acné nodular severo, el tratamiento hormonal, es usada en aquellas mujeres adultas con hiperandrogenismo que no responden a la terapia tópica convencional.
',9);

INSERT INTO Enfermedades 
( nombre, manchasMarrones, manchasBlancas, manchasRojas, descamacionDeLaPiel, SangradoDeLaPiel, Picazon, Lunares, ampollas, hongos, sudoracion, inflamacionDeLaPiel, pielSeca, pielGangena, granosConSebo, ronchas, descripcion, origen) 
VALUES ( 'Vitíligo', 0.0, 1.0, 0.2, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 'El vitíligo es una enfermedad adquirida de la piel de causa desconocida, caracterizada por ausencia de melanocitos funcionales provocando máculas despigmentadas y afecta aproximadamente al 1% de la población.
También, se considera como un trastorno caracterizado clásicamente por despigmentación cutánea debido a ausencia de melanocitos funcionales, células encargadas de la producción del pigmento, causada por la destrucción de los mismos, originando las máculas despigmentadas, particularmente en áreas como cara, axila y zonas expuestas que son normalmente hiperpigmentadas.
', 'La causa no se conoce y los tratamientos actuales no son del todo satisfactorios, afecta a un 0,5 - 1% de la población mundial, con independencia de la edad o el sexo, aunque en un 50% se presenta en los primeros 20 años de vida y, en el 14%, antes de los 10 años. Alrededor del 30% de los pacientes presentan antecedentes familiares de vitíligo y con una frecuencia similar se observan antecedentes personales o familiares de otras enfermedades autoinmunes.
Se han formulado diferentes teorías destacando principalmente la que considera a esta enfermedad de origen autoinmune, se ha observado que situaciones como el estrés o los traumatismos pueden precipitar la aparición de estas lesiones en pacientes predispuestos, a veces se asocia a otro tipo de enfermedades como la diabetes, la anemia perniciosa, la enfermedad de Addison o enfermedades tiroideas.
');
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('En algunos casos se presenta una repigmentación espontánea o tras tratamiento, sobre todo cuando no está afectado el bulbo piloso, ya que es la fuente de nuevos melanocitos.
',10);
INSERT INTO Recomendaciones 
( recomendacion, idEnfermedad) VALUES ('Cuando se trata de vitíligos más extensos se suele emplear lo que se conoce como foto quimioterapia oral que consiste en la administración de un fármaco por vía oral, más la exposición a rayos UVA (PUVA). Se logra la repigmentación en ocasiones de un 50% de los casos.
',10);


