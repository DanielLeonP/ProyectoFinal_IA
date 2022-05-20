var express = require('express');
var router = express.Router();
var database = require("../database/database.js");
var diagnostico = require("../funciones/diagnosticos.js");


router.get('/', function (req, res, next) {
    // Pagina de inicio
    res.json({ titulo: 'Pagina de inicio' })
});

router.get('/Diagnostico-General', function (req, res, next) {
    // Enviar formulario
});
router.get('/Diagnostico-Especifico', function (req, res, next) {
    // Enviar formulario
});

router.get('/Resultados-Diagnostico-General', function (req, res, next) {

    const respuestaUsuario = [0, 0.3, 0.5, 0.4, 08, 0.9, 0.4, 0.0, 0.7, 0.1, 0.1, 0.6, 0.2, 0.0, 0.5];
    const umbral = 1;

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
                console.log(matriz)

                //usa la funcion DiagnosticoGeneral que realiza el proceso de buscar el minimo, sumar los maximos y devolver: [nombreEnfermedad, valor que resulto]
                let respuestaDiagnostico = diagnostico.DiagnosticoGeneral(respuestaUsuario, matriz, umbral);

                console.log(respuestaDiagnostico)


                if (respuestaDiagnostico[0] == -1) { //El valor no paso el umbral
                    res.status(200);
                    res.json({ Enfermedad: "Ninguna enfermedad coincide con los sintomas", Recomendaciones: {} });

                } else { //existio una enfermedad que paso el umbral


                    //obtener datos de la enfermedadad con la que coincide
                    var nombreEnfermedad = respuestaDiagnostico[0];
                    //iniciar conexion
                    db = database.conectar();
                    //realizar consulta
                    db.query("SELECT * FROM Enfermedades WHERE nombre = ?;", [nombreEnfermedad],
                        function (err, results, fields) {
                            if (err) {
                                console.log(err)
                            } else {
                                //Obtener recomendaciones de la enfermedad
                                db = database.conectar();
                                //realizar consulta
                                db.query("SELECT * FROM Recomendaciones WHERE idEnfermedad = ?;", [results[0].idEnfermedad],
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

router.get('/Resultados-Diagnostico-Especifico', function (req, res, next) {

    const respuestaUsuario = [0, 0.3, 0.5, 0.4, 08, 0.9, 0.4, 0.0, 0.7, 0.1, 0.1, 0.6, 0.2, 0.0, 0.5];
    const umbral = 1;

    var nombreEnfermedades = "'Poiderma', 'Dermatitis'";

    //Matriz Enfermedades x sintomas
    let matriz = [];

    //iniciar conexion
    db = database.conectar();
    //realizar consulta
    db.query("SELECT * FROM Enfermedades WHERE nombre IN (" + nombreEnfermedades + " );",
        function (err, rows, fields) {
            if (err) {
                console.log(err)
            } else {
                //llena la matriz enfermedades x sintomas
                for (var i = 0; i < rows.length; i++) {
                    matriz.push([rows[i].nombre, rows[i].manchasMarrones, rows[i].manchasBlancas, rows[i].manchasRojas, rows[i].descamacionDeLaPiel, rows[i].SangradoDeLaPiel, rows[i].Picazon, rows[i].Lunares, rows[i].ampollas, rows[i].hongos, rows[i].sudoracion, rows[i].inflamacionDeLaPiel, rows[i].pielSeca, rows[i].pielGangena, rows[i].granosConSebo, rows[i].ronchas]);
                }
                console.log(matriz)

                //usa la funcion DiagnosticoGeneral que realiza el proceso de buscar el minimo, sumar los maximos y devolver: [nombreEnfermedad, valor que resulto]
                let respuestaDiagnostico = diagnostico.DiagnosticoGeneral(respuestaUsuario, matriz, umbral);

                console.log(respuestaDiagnostico)


                if (respuestaDiagnostico[0] == -1) { //El valor no paso el umbral
                    res.status(200);
                    res.json({ Enfermedad: "Ninguna enfermedad coincide con los sintomas", Recomendaciones: {} });

                } else { //existio una enfermedad que paso el umbral


                    //obtener datos de la enfermedadad con la que coincide
                    var nombreEnfermedad = respuestaDiagnostico[0];
                    //iniciar conexion
                    db = database.conectar();
                    //realizar consulta
                    db.query("SELECT * FROM Enfermedades WHERE nombre = ?;", [nombreEnfermedad],
                        function (err, results, fields) {
                            if (err) {
                                console.log(err)
                            } else {
                                //Obtener recomendaciones de la enfermedad
                                db = database.conectar();
                                //realizar consulta
                                db.query("SELECT * FROM Recomendaciones WHERE idEnfermedad = ?;", [results[0].idEnfermedad],
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






