function DiagnosticoGeneral(respuestaUsuario, matriz, umbral) {

    //procesar

    // Cada enfermedad    
    //Aplicar Max-Min
    let min = [];
    let enfermedad = [];
    let temporal = [];
    let minimosSumados = [];
    let sumaMinimosFila = 0;
    for (let i = 0; i < matriz.length; i++) {
        console.log("enfermedad " + (i + 1))
        enfermedad = matriz[i];

        for (let j = 0; j < enfermedad.length; j++) {
            temporal[j] = Math.min(respuestaUsuario[j], enfermedad[j])
            sumaMinimosFila = sumaMinimosFila + temporal[j];
            //console.log(temporal[j])

        }
        min[i] = temporal;
        temporal = [];
        minimosSumados[i] = sumaMinimosFila;
        sumaMinimosFila = 0;
        console.log("El minimo en enfermedad" + (i + 1) + " es " + min[i])
        console.log("La suma de los minimos en enfermedad " + (i + 1) + " es " + minimosSumados[i]);






        //Cosas que se deben hacer:
        //sumar los mininos
        //La maxima sumado
        //mencionar las primeras enf cuando son muy cercanos
        //

        //especifico: lo mismo pero con menos enfermedades
    }

    return EnfermedadSeleccionada(minimosSumados, umbral);
}
function EnfermedadSeleccionada(minimosSumados, umbral) {
    let id = -1;
    let mayor = -1;
    for (let a = 0; a < minimosSumados.length; a++) {
        if (minimosSumados[a] > mayor) {
            mayor = minimosSumados[a];
            id = a;
        }
    }

    console.log("El mayor es " + mayor + " y su id es " + id);
    if (mayor >= umbral) {//DUDA ES MAYOR O IGUAL o solo mayor QUE EL UMBRAL
        return [id, mayor]  //Devueve el id y el valor maximo que tubo esa enfermedad
    } else {
        return [-1, -1];//Devueve el id -1 (no existe) y -1 como valor maximo (no existió) debido al umbral;
    }



    // let minimosSumadosOrdenados = minimosSumados;
    // let idEnfermedad = [-1, -1];//IdEnfermedad ,  valor
    // minimosSumadosOrdenados.sort(function (a, b) { return b - a });
    // if(minimosSumadosOrdenados[0] >= umbral) {//DUDA ES MAYOR O IGUAL o solo mayor QUE EL UMBRAL
    //     idEnfermedad = [minimosSumados.indexOf(minimosSumadosOrdenados[0]),minimosSumadosOrdenados[0]];
    //     a = minimosSumados.indexOf(minimosSumadosOrdenados[0])
    //     console.log("ENcontrado en " + a)
    //     console.log(idEnfermedad);        
    // }
    // return idEnfermedad;
}

function DiagnosticoEspecifico(respuestaUsuario, matriz, umbral) {
}


module.exports = {
    "DiagnosticoGeneral": DiagnosticoGeneral,
    "DiagnosticoEspecifico": DiagnosticoEspecifico
}