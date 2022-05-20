function DiagnosticoGeneral(respuestaUsuario, matriz, umbral){

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
}

function DiagnosticoEspecifico(respuestaUsuario, matriz, umbral){
}


module.exports = {
    "DiagnosticoGeneral": DiagnosticoGeneral,
    "DiagnosticoEspecifico": DiagnosticoEspecifico
}