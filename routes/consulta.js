var express = require('express');
var router = express.Router();
var database = require("../database/database.js");
var diagnostico = require("../funciones/diagnosticos.js");


router.get('/', function (req, res, next) {
    // Pagina de inicio
    res.status(200);
    res.render('index.ejs');
});

router.get('/Diagnostico-General', function (req, res, next) {
    // Enviar formulario
    res.render('dgeneral.ejs');
});
router.get('/Diagnostico-Especifico', function (req, res, next) {
    // Enviar formulario
    res.render('despecifico.ejs');
});

router.post('/Resultados-Diagnostico-General', function (req, res, next) {

    var manchasMarrones = parseFloat(req.body.manchasMarrones);
    var manchasBlancas = parseFloat(req.body.manchasBlancas);
    var manchasRojas = parseFloat(req.body.manchasRojas);
    var descamacion = parseFloat(req.body.descamacion);
    var dolorSangrado = parseFloat(req.body.dolorSangrado);
    var dolorPicazon = parseFloat(req.body.dolorPicazon);
    var lunares = parseFloat(req.body.lunares);
    var dolorAmpollas = parseFloat(req.body.dolorAmpollas);
    var hongos = parseFloat(req.body.hongos);
    var sudoracion = parseFloat(req.body.sudoracion);
    var inflamacion = parseFloat(req.body.inflamacion);
    var pielSeca = parseFloat(req.body.pielSeca);
    var dolorGangrena = parseFloat(req.body.dolorGangrena);
    var granosSebo = parseFloat(req.body.granosSebo);
    var ronchas = parseFloat(req.body.ronchas);
    const respuestaUsuario = [manchasMarrones, manchasBlancas, manchasRojas, descamacion, dolorSangrado, dolorPicazon, lunares, dolorAmpollas, hongos, sudoracion, inflamacion, pielSeca, dolorGangrena, granosSebo, ronchas];


    console.log("-----------------------------------------------------");
    console.log("Respuesta del usuario:");
    console.log(respuestaUsuario)

    //const respuestaUsuario = [0, 0.3, 0.5, 0.4, 08, 0.9, 0.4, 0.0, 0.7, 0.1, 0.1, 0.6, 0.2, 0.0, 0.5];

    //Matriz Enfermedades x sintomas
    let matriz = [];
    //iniciar conexion
    db = database.conectar();
    //realizar consulta
    db.query("SELECT * FROM Enfermedades;",
        function (err, rows, fields) {
            if (err) {
                console.log(err)
            } else {
                //llena la matriz enfermedades x sintomas
                for (var i = 0; i < rows.length; i++) {
                    matriz.push([rows[i].nombre, rows[i].manchasMarrones, rows[i].manchasBlancas, rows[i].manchasRojas, rows[i].descamacionDeLaPiel, rows[i].SangradoDeLaPiel, rows[i].Picazon, rows[i].Lunares, rows[i].ampollas, rows[i].hongos, rows[i].sudoracion, rows[i].inflamacionDeLaPiel, rows[i].pielSeca, rows[i].pielGangena, rows[i].granosConSebo, rows[i].ronchas]);
                }
                //console.log(matriz)
                //usa la funcion Diagnostico que realiza el proceso de buscar el minimo, sumar los maximos y devolver: [nombreEnfermedad, valor que resulto]
                let respuestaDiagnostico = diagnostico.Diagnostico(respuestaUsuario, matriz);


                var nombreEnfermedades = "("
                for (let h = 0; h < respuestaDiagnostico.length; h++) {
                    if (h + 1 == respuestaDiagnostico.length) {
                        nombreEnfermedades = nombreEnfermedades + "'" + respuestaDiagnostico[h][0] + "'";
                    } else {
                        nombreEnfermedades = nombreEnfermedades + "'" + respuestaDiagnostico[h][0] + "',";
                    }

                }
                nombreEnfermedades = nombreEnfermedades + ")";

                if (nombreEnfermedades == "()") { //No se recibio ninguna enfermedad
                    res.status(200);
                    res.json({ Enfermedad: "Ninguna enfermedad coincide con los sintomas", Recomendaciones: {} });

                } else { //existio almenos una enfermedad que paso el umbral
                    //iniciar conexion
                    //console.log("SELECT * FROM Enfermedades WHERE nombre IN " + nombreEnfermedades + ";")
                    db = database.conectar();
                    //realizar consulta
                    db.query("SELECT * FROM Enfermedades WHERE nombre IN " + nombreEnfermedades + ";",
                        function (err, results, fields) {
                            if (err) {
                                console.log(err)
                            } else {
                                //OBTENER ID DE TODAS LAS ENFERMEDADES Y CONCATENARLAS EN VARIABLE
                                var idEnfermedades = "(";
                                for (var i = 0; i < results.length; i++) {
                                    if (i + 1 == results.length) {
                                        idEnfermedades = idEnfermedades + results[i].idEnfermedad;
                                    } else {
                                        idEnfermedades = idEnfermedades + results[i].idEnfermedad + ",";
                                    }
                                }
                                idEnfermedades = idEnfermedades + ")";
                                //console.log("SELECT * FROM Recomendaciones WHERE idEnfermedad IN " + idEnfermedades + " ORDER BY idEnfermedad;")

                                //Obtener recomendaciones de la enfermedad
                                db = database.conectar();
                                //realizar consulta
                                db.query("SELECT * FROM Recomendaciones WHERE idEnfermedad IN " + idEnfermedades + " ORDER BY idEnfermedad;",
                                    function (err, results2) {
                                        if (err) {
                                            console.log(err)
                                        } else {
                                            res.status(200);
                                            // res.json({ "Enfermedad": results[0], "Recomendaciones": results2 });
                                            res.render('resultados.ejs', {Enfermedad: results[0], Recomendaciones: results2});

                                        }
                                    })
                                //Terminar conexion
                                db.end(function (err) { err ? console.log(err) : console.log('Conexión terminada.'); });
                            }
                        })
                    //Terminar conexion
                    db.end(function (err) { err ? console.log(err) : console.log('Conexión terminada.'); });
                }
            }
        })
    //Terminar conexion
    db.end(function (err) { err ? console.log(err) : console.log('Conexión terminada.'); });
});

router.post('/Resultados-Diagnostico-Especifico', function (req, res, next) {
    var reqBody = req.body;
    console.log(reqBody)

    var CloasmaMelasma = req.body.CloasmaMelasma;
    var Poiderma = req.body.Poiderma;
    var Dermatitis = req.body.Dermatitis;
    var Celulitis = req.body.Celulitis;
    var Eczema = req.body.Eczema;
    var Urticaria = req.body.Urticaria;
    var Psoriasis = req.body.Psoriasis;
    var CancerDePiel = req.body.CancerDePiel;
    var Acne = req.body.Acne;
    var Vitiligo = req.body.Vitiligo;

    var Enfermedades = "";

    if (CloasmaMelasma == 'on') {
        Enfermedades = Enfermedades + "'Cloasma / Melasma',"
    }
    if (Poiderma == 'on') {
        Enfermedades = Enfermedades + "'Poiderma',"
    }
    if (Dermatitis == 'on') {
        Enfermedades = Enfermedades + "'Dermatitis',"
    }
    if (Celulitis == 'on') {
        Enfermedades = Enfermedades + "'Celulitis',"
    }
    if (Eczema == 'on') {
        Enfermedades = Enfermedades + "'Eczema',"
    }
    if (Urticaria == 'on') {
        Enfermedades = Enfermedades + "'Urticaria',"
    }
    if (Psoriasis == 'on') {
        Enfermedades = Enfermedades + "'Psoriasis',"
    }
    if (CancerDePiel == 'on') {
        Enfermedades = Enfermedades + "'Cáncer de Piel',"
    }
    if (Acne == 'on') {
        Enfermedades = Enfermedades + "'Acné',"
    }
    if (Vitiligo == 'on') {
        Enfermedades = Enfermedades + "'Vitíligio',"
    }
    if (Enfermedades.length != 0) {
        Enfermedades = Enfermedades.substring(0, Enfermedades.length - 1);
    }


    var manchasMarrones = parseFloat(req.body.manchasMarrones);
    var manchasBlancas = parseFloat(req.body.manchasBlancas);
    var manchasRojas = parseFloat(req.body.manchasRojas);
    var descamacion = parseFloat(req.body.descamacion);
    var dolorSangrado = parseFloat(req.body.dolorSangrado);
    var dolorPicazon = parseFloat(req.body.dolorPicazon);
    var lunares = parseFloat(req.body.lunares);
    var dolorAmpollas = parseFloat(req.body.dolorAmpollas);
    var hongos = parseFloat(req.body.hongos);
    var sudoracion = parseFloat(req.body.sudoracion);
    var inflamacion = parseFloat(req.body.inflamacion);
    var pielSeca = parseFloat(req.body.pielSeca);
    var dolorGangrena = parseFloat(req.body.dolorGangrena);
    var granosSebo = parseFloat(req.body.granosSebo);
    var ronchas = parseFloat(req.body.ronchas);

    const respuestaUsuario = [manchasMarrones, manchasBlancas, manchasRojas, descamacion, dolorSangrado, dolorPicazon, lunares, dolorAmpollas, hongos, sudoracion, inflamacion, pielSeca, dolorGangrena, granosSebo, ronchas];

    console.log("Enfermedades: " + Enfermedades);
    console.log("Respuestas de usuario:" + respuestaUsuario);

    //const respuestaUsuario = [0, 0.3, 0.5, 0.4, 08, 0.9, 0.4, 0.0, 0.7, 0.1, 0.1, 0.6, 0.2, 0.0, 0.5];
    //var Enfermedades = "'Poiderma', 'Dermatitis'";

    //Matriz Enfermedades x sintomas
    let matriz = [];

    //iniciar conexion
    db = database.conectar();
    //realizar consulta
    db.query("SELECT * FROM Enfermedades WHERE nombre IN ( " + Enfermedades + " );",
        function (err, rows, fields) {
            if (err) {
                console.log(err)
            } else {
                //llena la matriz enfermedades x sintomas
                for (var i = 0; i < rows.length; i++) {
                    matriz.push([rows[i].nombre, rows[i].manchasMarrones, rows[i].manchasBlancas, rows[i].manchasRojas, rows[i].descamacionDeLaPiel, rows[i].SangradoDeLaPiel, rows[i].Picazon, rows[i].Lunares, rows[i].ampollas, rows[i].hongos, rows[i].sudoracion, rows[i].inflamacionDeLaPiel, rows[i].pielSeca, rows[i].pielGangena, rows[i].granosConSebo, rows[i].ronchas]);
                }
                //console.log(matriz)

                //usa la funcion Diagnostico que realiza el proceso de buscar el minimo, sumar los maximos y devolver: [nombreEnfermedad, valor que resulto]
                let respuestaDiagnostico = diagnostico.Diagnostico(respuestaUsuario, matriz);

                var nombreEnfermedades = "("
                for (let h = 0; h < respuestaDiagnostico.length; h++) {
                    if (h + 1 == respuestaDiagnostico.length) {
                        nombreEnfermedades = nombreEnfermedades + "'" + respuestaDiagnostico[h][0] + "'";
                    } else {
                        nombreEnfermedades = nombreEnfermedades + "'" + respuestaDiagnostico[h][0] + "',";
                    }

                }
                nombreEnfermedades = nombreEnfermedades + ")";

                if (nombreEnfermedades == "()") { //No se recibio ninguna enfermedad
                    res.status(200);
                    res.json({ Enfermedad: "Ninguna enfermedad coincide con los sintomas", Recomendaciones: {} });

                } else { //existio una enfermedad que paso el umbral
                    //obtener datos de la enfermedadad con la que coincide
                    // console.log("SELECT * FROM Enfermedades WHERE nombre IN " + nombreEnfermedades + ";")
                    //iniciar conexion
                    db = database.conectar();
                    //realizar consulta
                    db.query("SELECT * FROM Enfermedades WHERE nombre IN " + nombreEnfermedades + ";",
                        function (err, results, fields) {
                            if (err) {
                                console.log(err)
                            } else {

                                var idEnfermedades = "(";
                                for (var i = 0; i < results.length; i++) {
                                    if (i + 1 == results.length) {
                                        idEnfermedades = idEnfermedades + results[i].idEnfermedad;
                                    } else {
                                        idEnfermedades = idEnfermedades + results[i].idEnfermedad + ",";
                                    }
                                }
                                idEnfermedades = idEnfermedades + ")";

                                //console.log("SELECT * FROM Recomendaciones WHERE idEnfermedad IN " + idEnfermedades + " ORDER BY idEnfermedad;")

                                //Obtener recomendaciones de la enfermedad
                                db = database.conectar();
                                //realizar consulta
                                db.query("SELECT * FROM Recomendaciones WHERE idEnfermedad IN " + idEnfermedades + " ORDER BY idEnfermedad;",
                                    function (err, results2) {
                                        if (err) {
                                            console.log(err)
                                        } else {
                                            res.status(200);
                                            res.json({ "Enfermedad": results[0], "Recomendaciones": results2 });
                                        }
                                    })
                                //Terminar conexion
                                db.end(function (err) { err ? console.log(err) : console.log('Conexión terminada.'); });
                            }
                        })
                    //Terminar conexion
                    db.end(function (err) { err ? console.log(err) : console.log('Conexión terminada.'); });
                }
            }
        })
    //Terminar conexion
    db.end(function (err) { err ? console.log(err) : console.log('Conexión terminada.'); });
});

module.exports = router;


//COSAS QUE FALTAN
//REVISEN SI FUNCIONA BIEN
//VALIDAR QUE EN DIAGNOSTICO ESPECIFICO SEAN ALMENOS 2 ENFERMEDADES SELECCIONADAS
//VALIDAR QUE SIEMPRE SEAN REQUERIDAS CADA PREGUNTA EN D GENERAL Y DE ESPECIFICO
//RESULTADOS-EJS