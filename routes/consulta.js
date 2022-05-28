var express = require('express');
var router = express.Router();
var database = require("../database/database.js");
var diagnostico = require("../funciones/diagnosticos.js");
var alert = require('alert');

router.get('/', function (req, res, next) {
    // Página de inicio
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

    // Matriz Enfermedades x sintomas
    let matriz = [];
    // Iniciar conexion
    db = database.conectar();
    // Realizar consulta
    db.query("SELECT * FROM Enfermedades;",
        function (err, rows, fields) {
            if (err) {
                console.log(err)
            } else {
                // Llena la matriz enfermedades x sintomas
                for (var i = 0; i < rows.length; i++) {
                    matriz.push([rows[i].nombre, rows[i].manchasMarrones, rows[i].manchasBlancas, rows[i].manchasRojas, rows[i].descamacionDeLaPiel, rows[i].SangradoDeLaPiel, rows[i].Picazon, rows[i].Lunares, rows[i].ampollas, rows[i].hongos, rows[i].sudoracion, rows[i].inflamacionDeLaPiel, rows[i].pielSeca, rows[i].pielGangena, rows[i].granosConSebo, rows[i].ronchas]);
                }
                // Usa la funcion Diagnostico que realiza el proceso de buscar el minimo, sumar los maximos y devolver: [nombreEnfermedad, valor que resulto]
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

                if (nombreEnfermedades == "()") { // No se recibio ninguna enfermedad
                    res.status(200);
                    res.render('diagnostico.ejs', {Enfermedades: {}, Recomendaciones: {}, respuesta:"false"});

                } else { // Existio almenos una enfermedad que paso el umbral
                    // Iniciar conexion
                    db = database.conectar();
                    // Realizar consulta
                    db.query("SELECT * FROM Enfermedades WHERE nombre IN " + nombreEnfermedades + ";",
                        function (err, REnfermedades, fields) {
                            if (err) {
                                console.log(err)
                            } else {
                                // Obtener ID de todas las enfermedades y concatenarlas en variable
                                var idEnfermedades = "(";
                                for (var i = 0; i < REnfermedades.length; i++) {
                                    if (i + 1 == REnfermedades.length) {
                                        idEnfermedades = idEnfermedades + REnfermedades[i].idEnfermedad;
                                    } else {
                                        idEnfermedades = idEnfermedades + REnfermedades[i].idEnfermedad + ",";
                                    }
                                }
                                idEnfermedades = idEnfermedades + ")";

                                // Obtener recomendaciones de la enfermedad
                                db = database.conectar();
                                // Realizar consulta
                                db.query("SELECT * FROM Recomendaciones WHERE idEnfermedad IN " + idEnfermedades + " ORDER BY idEnfermedad;",
                                    function (err, RRecomendaciones) {
                                        if (err) {
                                            console.log(err)
                                        } else {
                                            res.status(200);
                                            res.render('diagnostico.ejs', {Enfermedades: REnfermedades, Recomendaciones: RRecomendaciones, respuesta:"true"});
                                        }
                                    })
                                // Terminar conexion
                                db.end(function (err) { err ? console.log(err) : console.log('Conexión terminada.'); });
                            }
                        })
                    // Terminar conexion
                    db.end(function (err) { err ? console.log(err) : console.log('Conexión terminada.'); });
                }
            }
        })
    // Terminar conexion
    db.end(function (err) { err ? console.log(err) : console.log('Conexión terminada.'); });
});

router.post('/Resultados-Diagnostico-Especifico', function (req, res, next) {
    var counter = 0;

    var CloasmaMelasma = req.body.CloasmaMelasma;
    var Pioderma = req.body.Pioderma;
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
        counter++
    }
    if (Pioderma == 'on') {
        Enfermedades = Enfermedades + "'Pioderma',"
        counter++
    }
    if (Dermatitis == 'on') {
        Enfermedades = Enfermedades + "'Dermatitis',"
        counter++
    }
    if (Celulitis == 'on') {
        Enfermedades = Enfermedades + "'Celulitis',"
        counter++
    }
    if (Eczema == 'on') {
        Enfermedades = Enfermedades + "'Eczema',"
        counter++
    }
    if (Urticaria == 'on') {
        Enfermedades = Enfermedades + "'Urticaria',"
        counter++
    }
    if (Psoriasis == 'on') {
        Enfermedades = Enfermedades + "'Psoriasis',"
        counter++
    }
    if (CancerDePiel == 'on') {
        Enfermedades = Enfermedades + "'Cáncer de Piel',"
        counter++
    }
    if (Acne == 'on') {
        Enfermedades = Enfermedades + "'Acné',"
        counter++
    }
    if (Vitiligo == 'on') {
        Enfermedades = Enfermedades + "'Vitíligo',"
        counter++
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

    // Matriz Enfermedades x sintomas
    let matriz = [];

    if(counter >= 2){
        // Iniciar conexion
        db = database.conectar();
        // Realizar consulta
        db.query("SELECT * FROM Enfermedades WHERE nombre IN ( " + Enfermedades + " );",
            function (err, rows, fields) {
                if (err) {
                    console.log(err)
                } else {
                    // Llena la matriz enfermedades x sintomas
                    for (var i = 0; i < rows.length; i++) {
                        matriz.push([rows[i].nombre, rows[i].manchasMarrones, rows[i].manchasBlancas, rows[i].manchasRojas, rows[i].descamacionDeLaPiel, rows[i].SangradoDeLaPiel, rows[i].Picazon, rows[i].Lunares, rows[i].ampollas, rows[i].hongos, rows[i].sudoracion, rows[i].inflamacionDeLaPiel, rows[i].pielSeca, rows[i].pielGangena, rows[i].granosConSebo, rows[i].ronchas]);
                    }
    
                    // Usa la funcion Diagnostico que realiza el proceso de buscar el minimo, sumar los maximos y devolver: [nombreEnfermedad, valor que resulto]
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
    
                    if (nombreEnfermedades == "()") { // No se recibio ninguna enfermedad
                        res.status(200);
                        res.render('diagnostico.ejs', {Enfermedades: {}, Recomendaciones: {}, respuesta:"false"});
    
                    } else { // Existio una enfermedad que paso el umbral
                        // Obtener datos de la enfermedadad con la que coincide
                        // Iniciar conexion
                        db = database.conectar();
                        // Realizar consulta
                        db.query("SELECT * FROM Enfermedades WHERE nombre IN " + nombreEnfermedades + ";",
                            function (err, REnfermedades, fields) {
                                if (err) {
                                    console.log(err)
                                } else {
    
                                    var idEnfermedades = "(";
                                    for (var i = 0; i < REnfermedades.length; i++) {
                                        if (i + 1 == REnfermedades.length) {
                                            idEnfermedades = idEnfermedades + REnfermedades[i].idEnfermedad;
                                        } else {
                                            idEnfermedades = idEnfermedades + REnfermedades[i].idEnfermedad + ",";
                                        }
                                    }
                                    idEnfermedades = idEnfermedades + ")";
    
                                    // Obtener recomendaciones de la enfermedad
                                    db = database.conectar();
                                    // Realizar consulta
                                    db.query("SELECT * FROM Recomendaciones WHERE idEnfermedad IN " + idEnfermedades + " ORDER BY idEnfermedad;",
                                        function (err, RRecomendaciones) {
                                            if (err) {
                                                console.log(err)
                                            } else {
                                                res.status(200);
                                                res.render('diagnostico.ejs', {Enfermedades: REnfermedades, Recomendaciones: RRecomendaciones, respuesta:"true"});
                                            }
                                        })
                                    // Terminar conexion
                                    db.end(function (err) { err ? console.log(err) : console.log('Conexión terminada.'); });
                                }
                            })
                        // Terminar conexion
                        db.end(function (err) { err ? console.log(err) : console.log('Conexión terminada.'); });
                    }
                }
            })
        // Terminar conexion
        db.end(function (err) { err ? console.log(err) : console.log('Conexión terminada.'); });
    }else{
        alert("Por favor, selecciona dos o más enfermedades de la lista de enfermedades.");
    }
});
router.get('/Modulo-Precargado', function (req, res, next) {
    res.render('modulo.ejs');
});
module.exports = router;