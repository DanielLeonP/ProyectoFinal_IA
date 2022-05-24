function Diagnostico(respuestaUsuario, matriz, umbral) {
    // Cada enfermedad    
    //Aplicar Max-Min
    let min = [];
    let enfermedad = [];
    let temporal = [];
    let minimosSumados = [];
    let sumaMinimosFila = 0;
    for (let i = 0; i < matriz.length; i++) {
        console.log("Enfermedad " + (i + 1) + " ------------")
        enfermedad = matriz[i];
        console.log("La enfermedad es " + enfermedad)
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
        console.log("Sus minimos son " + min[i])
        console.log("La suma de los minimos en enfermedad " + minimosSumados[i][0] + " es " + minimosSumados[i][1]);


        //NOtas que deben hacer en este codigo:   YA LO IMPLEMENTE TODO
        //sumar los mininos
        //La maxima sumado
        //mencionar las primeras enf cuando son muy cercanos
        //

        //especifico: lo mismo pero con menos enfermedades
    }
    console.log("\n Minimos Sumados: ------------------")
    console.log(minimosSumados)

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

    var respuesta=[];
    for (let e = 0; e < minimosSumadosOrdenados.length; e++) {//Validar que enfermedades sí sobrepasan el umbra
        if(minimosSumadosOrdenados[e][1] > umbral){
            respuesta.push(minimosSumadosOrdenados[e]);            
        }        
    }

    //Verificar que las enfermedades que sobrepasan el umbral tengan un margen de valor mínimo. EJ: 2.7, 2.72, 2.27, y no sean asi: 2.7 2.9 3.2


    if (respuesta.length != 0 ) {
        return respuesta; //Devueve el nombre y el valor maximo que tubo esa enfermedad
    }else {
        return [['', -1]];//Devueve el nombre vacio (no existe) y -1 como valor maximo (no existió) debido al umbral;
    }

    // let mayor;

    // mayor = minimosSumadosOrdenados[0]

    // if (mayor[1] > umbral) {//DUDA ES MAYOR O IGUAL o solo mayor QUE EL UMBRALconsole.log("\n ---------------------------");
    //     console.log("\n ////////////////// \n El mayor es " + mayor);
    //     return [mayor];  //Devueve el id y el valor maximo que tubo esa enfermedad
    // } else {
    //     console.log("\n ---------------------------");
    //     console.log("Ninguna enfermedad sobrepaso el umbral");
    //     return [['', -1]];//Devueve el nombre vacio (no existe) y -1 como valor maximo (no existió) debido al umbral;
    // }
}

module.exports = {
    "Diagnostico": Diagnostico,
}