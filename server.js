const express = require('express'); 
const app = express(); 
const bodyParser = require('body-parser'); 
const consultaRoutes = require('./routes/consulta');
var database = require("./database/database.js");

db = database.conectar();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));



app.use('/', consultaRoutes);

app.listen(process.env.PORT || 3000, () => { console.log('Servidor Web Iniciado'); });

module.exports = app;