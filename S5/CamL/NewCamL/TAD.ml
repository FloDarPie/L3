(*LA PILE*)
type pile = PileVide | Empile of int*pile;;

exception LaPileVide of string;;

let estvide pile =
    pile == PileVide
;;

let sommet pile = match pile with
    | Empile (a,b) -> a
    | _ -> raise (LaPileVide "Il n'y a pas de données")
;;

let empile entier pile = 
    Empile(entier,pile)
;;


let depile pile = match pile with
    | Empile (a,b) -> b
    | _ -> raise (LaPileVide "Il n'y a pas de données")
;;

(*LA FILE*)
type file = {debut: int list; fin : int list};;
exception FileVide of string;;

let fileTest = {debut=[1;3]; fin=[2;4;7]};;

let estvide file = match file with
    {debut = debut ; fin = fin} -> fin == [] && debut == []
;;

let transvase file = match file with
    {debut = [] ; fin = fin} -> {debut = fin ; fin = []}
    | _ -> file
;;

let premier file = match file with
    { debut = a::d ; fin = f } -> a
    | {debut = [] ; fin = f } -> raise (FileVide "Pas d'element dans la file")
;;

let enfiler entier file = match file with
    { debut = d ; fin = f } -> { debut = entier::d ; fin = f }
;;

let egale file1 file2 = match file1,file2 with
    | (f1,f2) -> f1.debut == f2.debut && f1.fin == f2.fin
;;



(*raise (FileVide "Pas d'element dans la file")*)

(*
| f -> f.debut ... f.fin ... 

| {debut = d ; fin = f} ->  d   f*) 

(*Les VECTEURS*)

let a = [|1;2|];;

(Array.length (a));;
(*vect_length*)

let affecte vecteur (entier1,entier2)=
    (Array.set vecteur entier1 entier2)
    and Array.to_list(vecteur)
;;


a;;
affecte a (1,23);;
