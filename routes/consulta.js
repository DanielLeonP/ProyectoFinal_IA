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
    sql = "SELECT * FROM Enfermedades WHERE nombre = 'Cloasma / Melasma';";
    const resultados = database.consultar(sql);
    console.log("Respuesta en router "+resultados);


    // db.query({sql:"SELECT * FROM Enfermedades WHERE nombre = 'Cloasma / Melasma';", timeout:5000,},
    //     function (err, results, fields) {
    //         //console.log(fields);    
    //         if (err) {
    //             console.log(fields)

    //         } else {
    //             res.status(200);
    //             console.log(fields)
    //             //res.send(fields);
    //         }
    //     })
    // //db.end();
});










module.exports = router;






