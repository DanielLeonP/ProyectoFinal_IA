const express = require('express'); 
var path = require('path');
const consultaRoutes = require('./routes/consulta');

var app = express(); 
const database = require("./database/database.js");


// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(express.json());
app.use(express.urlencoded({ extended: false }));



app.use('/', consultaRoutes);

app.listen(process.env.PORT || 3000, () => { console.log('Servidor Web Iniciado'); });

module.exports = app;