var express = require('express');
const { timeout } = require('nodemon/lib/config');
var router = express.Router();


router.get('/', function (req, res, next) {
    res.json({ username: 'Flavio' })
});

router.get('/Diagnostico-General', function (req, res, next) {
});
router.get('/Diagnostico-Especifico', function (req, res, next) {
});

router.get('/Resultados', function (req, res, next) {
    //obtener datos de la enfermedadad

    db.query({sql:"SELECT * FROM Enfermedades WHERE nombre = 'Cloasma / Melasma';", timeout:5000,},
        function (err, results, fields) {
            //console.log(fields);    
            if (err) {
                console.log(fields)

            } else {
                res.status(200);
                console.log(fields)
                //res.send(fields);
            }
        })
});










module.exports = router;






