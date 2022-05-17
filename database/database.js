const mysql = require('mysql');

function conectar() {
    var config =
    {
        host: 'basedatosia.mysql.database.azure.com',
        user: 'IAAdmin',
        password: 'Administrador123456',
        database: 'quickstartdb',
        port: 3306,
    };
    const conn = new mysql.createConnection(config);
    conn.connect(
        function (err) {
            if (err) {
                console.log("!!! No se pudo conectar !!! Error:");
                throw err;
            }
            else {
                console.log("Conexión establecida a la base de datos.");
            }
        });
};
module.exports = {
    "conectar": conectar
}
//Base de datos:
// usuario: IAAdmin
// contraseña: Administrador123456

// sql = "INSERT INTO Medicos (nombre, apellido, correo, contrasena, cedulaProfesional, especialidad) VALUES ('" + nombre + "', '" + apellido + "', '" + correo + "', '" + contrasena + "', " + cedula + ", '" + especialidad + "');";
// console.log(sql)
// db.query(sql,
//   function (err, results, fields) {
//     if (err) {
//       console.log(err);
//       res.render('registroMedico.ejs', { validacion: 'I' });
//     } else {
//       res.status(200);
//       res.redirect('/medico');
//     }
//   })