var express = require('express');
const { timeout } = require('nodemon/lib/config');
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
                            res.json({"Enfermedad":results[0], "Recomendaciones": results2});
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






