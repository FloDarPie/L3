(* L3 infoContrôle					Décembre 2020
 _____                                 ___________   _____                 _ 
|  ___|                               |_   _| ___ \ /  __ \               | |
| |____  ____ _ _ __ ___   ___ _ __     | | | |_/ / | /  \/ __ _ _ __ ___ | |
|  __\ \/ / _` | '_ ` _ \ / _ \ '_ \    | | |  __/  | |    / _` | '_ ` _ \| |
| |___>  < (_| | | | | | |  __/ | | |   | | | |     | \__/\ (_| | | | | | | |
\____/_/\_\__,_|_| |_| |_|\___|_| |_|   \_/ \_|      \____/\__,_|_| |_| |_|_|  *)



(* Exercice 1 : Gloire aux deuxièmes! Recherche du deuxième élément d'une liste. *)
(* L'exception ListeVide est définie.*)

let rec maxi l = match l with
    |[]-> failwith "La liste est vide"
    |[b] -> b 
    |tete::corps -> max tete (maxi corps);;
    
(*
maxi : 'a list -> 'a = <fun>*)
maxi [3;2;5;2;7;1;9;4;3;2;5];;
(*- : int = 9*)

let rec elimine a l = match (a,l) with
    |(a,[b]) -> if a==b then [] else [b]
    |(a,tete::corps) -> if a== tete then corps else tete::elimine a corps
    |_->[];;
    
let rec elimine2 elem liste = match liste with
    | tete::corps when elem==tete -> corps
    | tete:: corps -> tete::elimine elem corps
    |_->[];;
(*
elimine : 'a * 'a list -> 'a list = <fun>*)
elimine(9, [3;2;5;2;7;1;9;4;3;2;5]);;
elimine2(9, [3;2;5;2;7;1;9;4;3;2;5]);;
(*- : int list = [3; 2; 5; 2; 7; 1; 4; 3; 2; 5]*)


(* L'exception TropCourte est définie.*)

exception TropCourte of string;;

let deuxieme l = match l with
    |[] -> raise TropCourte "il manque 2 éléments dans la liste"
    |[e] -> raise TropCourte "il manque 1 élément dans la liste"
    | _ -> maxi (elimine (maxi l) l);;
(*
val deuxieme : 'a list -> 'a = <fun>
*)

(* à compléter
deuxieme : 'a list -> 'a = <fun>*)
deuxieme [3;2;5;2;7;1;9;4;3;2;5];;
(*- : int = 7*)


(*
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
*)

(* Exercice 2 :  Deux fonctions récursives simples sur les listes*)

let rec applique fonction liste = match liste with
    | [e] -> [fonction e]
    | tete::corps -> (fonction tete)::(applique fonction corps)
    | _ -> [];;
    
let rec applique2 fonction liste match liste with
    | tete::corps -> fonction tete::applique fonction corps
    | _ -> [];;
(* à compléter
applique : ('a -> 'b) * 'a list -> 'b list = <fun>*)
applique ((fun n->n*n),[1;2;3;4;5]);;
(*- : int list = [1; 4; 9; 16; 25]*)


(*
let nbPairChiff n=

    let rec nbChiffre n = 
        match n with
        |0->1
        |n->1+nbChiffre (n/10)

    in
    nbChiffre n mod 2 =0;;

*)

(*
let f = fun a -> fun b -> a+b ;; 
(* int -> int -> int *)
let test = f 3 ;; 
(* int -> int *)
test 4 ;;
test 5 ;; 
test 6 ;;
*)




let rec applatir liste = match liste with
    | tete::corps -> tete @ applatir corps
    | _ -> [];;
    
let rec applatir2 matrice = match matrice with
    |(tete::corps)::locomotive -> tete :: applatir2 (corps::locomotive)
    |_::locomotive -> applatir2 locomotive
    |_ -> [];;


(* à compléter
applatir : 'a list list -> 'a list = <fun>*)


(* Exercice 3 : types sommes et types produits : Gestion du personnel *)
type famille = {nom : string ; agesParents : int list ; agesEnfants : int list};;
(*Le type famille est défini.*)
type foyer = Celib of string*int
              | Famille of famille;;
(*Le type foyer est défini.*)

let rec long liste =
    match liste with
    | [] -> 0
    | tete::corps -> 1+ long corps;;
(*long : 'a list -> int = <fun>*)

let nbIndiv personne =
    match personne with
    | Celib _ -> 1
    | Famille _ -> 2;; (*a expliciter en entier*)
(* à compléter
nbIndiv(Celib ("Durand",18));;
- : int = 1
nbIndiv(Famille {Nom = "Martin"; AgesParents = [32; 30]; AgesEnfants = [2; 4; 6]});;
- : int = 5*)


let rec nbCelib = fun 
(* à compléter
nbCelib : foyer list -> int = <fun>
nbCelib(enterprise);;
- : int = 1*)





let rec nbEnfants = fun
(* à compléter
nbEnfants : foyer list -> int = <fun>
nbEnfants(enterprise);;
- : int = 4*)



let rec naissance = fun 
(* à compléter
naissance : string * foyer list -> foyer list = <fun>
naissance  ("Martin",enterprise) ;;*)

let rec plusUn = fun
(* à compléter
plusUn : int list -> int list = <fun>*)


let rec miseAJour = fun 
(* à compléter
miseAJour : foyer list -> foyer list = <fun>*)



(* Exercice 4 : types sommes récursifs, les tournois *)


type tournoi = joueur of int 
               | partie of int*tournoi*tournoi;;
			   

let rec initialise = fun 
(* à compléter
initialise : int list -> tournoi list = <fun>

initialise([3;2;5;2;7;1;9;4;3;2;6]);;
- : tournoi list =
 [joueur 3; joueur 2; joueur 5; joueur 2; joueur 7; joueur 1; joueur 9;
  joueur 4; joueur 3; joueur 2; joueur 6]*)
  
let vainqueur = fun 
(* à compléter
vainqueur : tournoi -> int = <fun> 
vainqueur (joueur 5);;  vainqueur (partie (3, joueur 3, joueur 2));;
- : int = 5				- : int = 3  *)
  



let jeu = fun 
(* à compléter
jeu : tournoi * tournoi -> tournoi = <fun>
jeu (joueur 4,partie (5, joueur 5, joueur 2));;
- : tournoi = partie (5, joueur 4, partie (5, joueur 5, joueur 2))*)


let rec ronde = fun
(* à compléter
ronde : tournoi list -> tournoi list = <fun>

let ronde1=ronde(init);;
ronde1 : tournoi list =
 [partie (3, joueur 3, joueur 2); partie (5, joueur 5, joueur 2);
  partie (7, joueur 7, joueur 1); partie (9, joueur 9, joueur 4);
  partie (3, joueur 3, joueur 2); joueur 6]
  
  
let ronde2=ronde(ronde1);;
ronde2 : tournoi list =
 [partie (5, partie (3, joueur 3, joueur 2), partie (5, joueur 5, joueur 2));
  partie (9, partie (7, joueur 7, joueur 1), partie (9, joueur 9, joueur 4));
  partie (6, partie (3, joueur 3, joueur 2), joueur 6)]*)
  
let rec leTournoi = fun 
(* à compléter
leTournoi : tournoi list -> tournoi = <fun>)

leTournoi(init);;
- : tournoi =
 partie
  (9,
   partie
    (9,
     partie
      (5, partie (3, joueur 3, joueur 2), partie (5, joueur 5, joueur 2)),
     partie
      (9, partie (7, joueur 7, joueur 1), partie (9, joueur 9, joueur 4))),
   partie (6, partie (3, joueur 3, joueur 2), joueur 6))*)


let leChampion = fun
(* à compléter
leChampion([3;2;5;2;7;1;9;4;3;2;6]);;
- : int = 9*)
