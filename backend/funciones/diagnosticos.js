function Diagnostico(respuestaUsuario, matriz, umbral) {

    //procesar

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
            if(j+1 != enfermedad.length){
                temporal[j] = Math.min(respuestaUsuario[j], enfermedad[j+1])
                sumaMinimosFila = sumaMinimosFila + temporal[j];
            }            
        }
        min[i] = temporal;
        temporal = [];
        minimosSumados[i] = [enfermedad[0],sumaMinimosFila];
        sumaMinimosFila = 0;
        console.log("Sus minimos son "+ min[i])
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
    let mayor = ["", -1];
    for (let a = 0; a < minimosSumados.length; a++) {
        if (minimosSumados[a][1] > mayor[1]) {
            mayor = minimosSumados[a];
        }
    }
    console.log("\n ---------------------------");
    console.log("El mayor es " + mayor);

    if (mayor[1] >= umbral) {//DUDA ES MAYOR O IGUAL o solo mayor QUE EL UMBRAL
        return mayor;  //Devueve el id y el valor maximo que tubo esa enfermedad
    } else {
        return ['', -1];//Devueve el id -1 (no existe) y -1 como valor maximo (no existió) debido al umbral;
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

module.exports = {
    "Diagnostico": Diagnostico,
}