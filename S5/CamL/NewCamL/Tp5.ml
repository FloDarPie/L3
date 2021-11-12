(*Exercice 6*)

let majuscule lettre =
    lettre<'a';;

majuscule 'A';;


let minuscule lettre =
    'Z'<lettre;;
    
minuscule 'b';;

let lettre l = majuscule l || minuscule l;;
lettre 'b';;

let rec appartient
