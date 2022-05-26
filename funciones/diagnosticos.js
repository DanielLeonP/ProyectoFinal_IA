function Diagnostico(respuestaUsuario, matriz) {
    // Cada enfermedad    
    //Aplicar Max-Min
    let umbral = 1.3;
    let min = [];
    let enfermedad = [];
    let temporal = [];
    let minimosSumados = [];
    let sumaMinimosFila = 0;
    console.log("-----------------------------------------------------");
    console.log("SUMATORIA DE LOS MINIMOS POR ENFERMEDAD ");
    for (let i = 0; i < matriz.length; i++) {
        console.log("Enfermedad " + (i + 1) + " ------------")
        enfermedad = matriz[i];
        //console.log("La enfermedad es " + enfermedad)
        for (let j = 0; j < enfermedad.length; j++) {
            if (j + 1 != enfermedad.length) {
                temporal[j] = Math.min(respuestaUsuario[j], enfermedad[j + 1])
                sumaMinimosFila = sumaMinimosFila + temporal[j];
            }
        }
        min[i] = temporal;
        temporal = [];
        minimosSumados[i] = [enfermedad[0], sumaMinimosFila];
        sumaMinimosFila = 0;
        // console.log("Sus minimos son " + min[i])
        console.log("La suma de los minimos en enfermedad " + minimosSumados[i][0] + " es " + minimosSumados[i][1]);
        //umbral = umbral + minimosSumados[i][1];
    }
    // console.log("-----------------------------------------------------");
    // console.log("\n Minimos Sumados: \n");
    // console.log(minimosSumados);
    //umbral = umbral / 10;
    console.log("-----------------------------------------------------");
    console.log("El umbral es: " + umbral);

    return EnfermedadSeleccionada(minimosSumados, umbral);
}
function EnfermedadSeleccionada(minimosSumados, umbral) {

    const bubbleSort = arr => {
        const l = arr.length;
        for (let i = 0; i < l; i++) {
            for (let j = 0; j < l - 1 - i; j++) {
                if (arr[j][1] < arr[j + 1][1]) {
                    [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]];
                }
            }
        }
        return arr;
    };
    console.log("\n Suma de minimos ordenados mayor - menor: ------------------")
    const minimosSumadosOrdenados = bubbleSort(minimosSumados);
    console.log(minimosSumadosOrdenados);

    var respuesta = [];
    var temporal = true;
    let e = 0;
    while (temporal) {
        //console.log(parseFloat(minimosSumadosOrdenados[e][1]) + " > " + umbral)
        if (parseFloat(minimosSumadosOrdenados[e][1]) > umbral) {
            if (e == 0) {
                respuesta.push(minimosSumadosOrdenados[e]);
            } else {
                if (respuesta[respuesta.length - 1][1] <= (parseFloat(minimosSumadosOrdenados[e][1]) + 0.13)) { //0.19 es el valor que hay de diferencia entre el minimo sumado entre 2 enfermedades, si tiene una diferencia mayor a 0.15 ya no pasa
                    respuesta.push(minimosSumadosOrdenados[e]);
                } else {
                    temporal = false;
                }
            }
            e++;
        } else {
            temporal = false;
        }
    }
    console.log("-----------------------------------------------------");
    console.log("Los valores que sobrepasan el umbral y que tienen un valor con un rango menor a 0.19 son:");
    console.log(respuesta);

    if (respuesta.length != 0) {
        return respuesta; //Devueve el nombre y el valor maximo que tubo esa enfermedad
    } else {
        return []//Devuelve arreglo vacio por que no se encontro ninguna enfermedad
    }
}

module.exports = {
    "Diagnostico": Diagnostico,
}