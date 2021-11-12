(* 1- Les couleurs  *)

type couleur = Blanc | Noir | Rouge | Vert | Bleu | Jaune | Cyan | Magenta;;


let est_colore color = match color with
    | Blanc -> false
    | Noir -> false
    | _ -> true
;;

est_colore(Bleu);;
est_colore(Noir);;

let complementaire color = match color with
     |Noir->Blanc
     |Blanc -> Noir
     |Rouge -> Vert
     |Vert -> Rouge
     |Jaune -> Bleu
     |Bleu -> Jaune
     |Cyan -> Magenta
     |Magenta -> Cyan
;;
    
(*2- Nombre entier, nombre réels et complexes*)

type nombreNR = N of int | R of float;;

let somme a b = match a,b with
    |(N a, N b) -> N ( a + b)
    |(N a, R b) -> R (float_of_int(a) +. b)
    |(R a, N b) -> R ( float_of_int(b) +. a)
    |(R a, R b) -> R (a +. b)
;;
somme (N 8) (N 4);;
somme (R 6.5) (N 94);;

let prod a b = match a,b with
    |(N a, N b) -> N ( a * b)
    |(N a, R b) -> R (float_of_int(a) *. b)
    |(R a, N b) -> R ( float_of_int(b) *. a)
    |(R a, R b) -> R (a *. b)
;;
prod (N 8) (N 4);;
prod (R 6.5) (N 94);;


type nombreRC = RC of (nombreNR * nombreNR);;

let sommeRC (RC(a,b)) (RC(c,d)) = RC (somme a c, somme b d)
;;

sommeRC (RC (N 4, N 8 )) (RC (R 2.3, N 3));;
