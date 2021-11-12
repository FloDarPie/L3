let oui = document.getElementById("oui");
let positif = 0 ;
let non = document.getElementById("non");
let negatif = 0 ;
let abstient = document.getElementById("abstient");
let abstenir = 0;


let compte = 0;


let debut = Date.now();

let end = 0;

let attente = 3000;


oui.addEventListener("click", (event) => {
    end = Date.now()

    if (end - debut > attente ){
        positif++
        compte++
        console.log(compte,"a voté")
        debut = Date.now()
    }
})


non.addEventListener("click", (event) => {
    end = Date.now()

    if (end - debut > attente ){
        negatif++
        compte++
        console.log(compte,"a voté")
        debut = Date.now()
    }
})


abstient.addEventListener("click", (event) => {
    end = Date.now()

    if (end - debut > attente ){
        abstenir++
        compte++
        console.log(compte,"a voté")
        debut = Date.now()
    }
})


let fin = document.getElementById("fin");
fin.addEventListener("click", (event) => {
    console.log("fin de vote","\noui :",positif,"\nnon :" ,negatif,"\nabstenu :",abstenir,"\ntotal :", compte);
})