var express = require('express');
var router = express.Router();
var database = require("../database/database.js");



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

router.get('/Resultados', function (req, res, next) {

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
                for (var i = 0; i < rows.length; i++) {
                    matriz.push([rows[i].manchasMarrones, rows[i].manchasBlancas, rows[i].manchasRojas, rows[i].descamacionDeLaPiel, rows[i].SangradoDeLaPiel, rows[i].Picazon, rows[i].Lunares, rows[i].ampollas, rows[i].hongos, rows[i].sudoracion, rows[i].inflamacionDeLaPiel, rows[i].pielSeca, rows[i].pielGangena, rows[i].granosConSebo, rows[i].ronchas]);
                }
                console.log(matriz)







                const respuestaUsuario = [0, 0.3, 0.5, 0.4, 08, 0.9, 0.4, 0.0, 0.7, 0.1, 0.1, 0.6, 0.2, 0.0, 0.5];

                const umbral = 0.3;
                //procesar

                // Cada enfermedad    
                //Aplicar Max-Min
                let min = [];
                let enfermedad= [];
                let temporal = [];
                for (let i = 0; i < matriz.length; i++) {
                    console.log("enfermedad " + (i+1))
                    enfermedad= matriz[i];
                    
                    for (let j = 0; j < enfermedad.length; j++) {
                        temporal[j] = Math.min(respuestaUsuario[j],enfermedad[j])
                        //console.log(temporal[j])

                    } 
                    min[i]= temporal;
                    temporal = [];
                    min
                    console.log("El minimo en "+  (i+1) +" es " + min[i])
                }
                






            }
        })
    //Terminar conexion
    db.end(function (err) { err ? console.log(err) : console.log('Conexión terminada.'); });




    //procesar las respuestas

    //obtener datos de la enfermedadad con la que coincide

    var nombreEnfermedad = 'Cloasma / Melasma';
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
                    function (err, results2, fields) {
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


});

module.exports = router;






