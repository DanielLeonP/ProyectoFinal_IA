const mysql = require('mysql');


var config =
{
    host: 'basedatosia.mysql.database.azure.com',
    user: 'IAAdmin',
    password: 'Administrador123456',
    database: 'quickstartdb',
    port: 3306,
};



function consultar(sql) {
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
    // const resultados = conn.query(sql,
    //     function (err, results, fields) {
    //         if (err) {
    //             // console.log(results);

    //         } else {

    //             // console.log(results);
    //             return results;
    //         }
    //     })
    const resultados = conn.query(sql);
    conn.end(
        function (err) {
            if (err) throw err;
            else console.log('Closing connection.')
        });

    console.log(resultados.result);
    return resultados
};

module.exports = {
    "consultar": consultar,
}
//Base de datos:
// usuario: IAAdmin
// contraseña: Administrador123456