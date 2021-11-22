(* L3 infoContrle					Dcembre 2020
 _____                                 ___________   _____                 _ 
|  ___|                               |_   _| ___ \ /  __ \               | |
| |____  ____ _ _ __ ___   ___ _ __     | | | |_/ / | /  \/ __ _ _ __ ___ | |
|  __\ \/ / _` | '_ ` _ \ / _ \ '_ \    | | |  __/  | |    / _` | '_ ` _ \| |
| |___>  < (_| | | | | | |  __/ | | |   | | | |     | \__/\ (_| | | | | | | |
\____/_/\_\__,_|_| |_| |_|\___|_| |_|   \_/ \_|      \____/\__,_|_| |_| |_|_|  *)



(* Exercice 1 : Gloire aux deuximes! Recherche du deuxime lment d'une liste. *)
(* L'exception ListeVide est dfinie.*)
let rec maxi liste = match liste with
  | tete::cou::corps when tete>cou -> maxi (tete::corps)
  | tete::cou::corps -> maxi(cou::corps)
  | [a] -> a
  | _ -> failwith "Aucun element";;
(*
maxi : 'a list -> 'a = <fun>*)
maxi [3;2;5;2;7;1;9;4;3;2;5];;
(*- : int = 9*)



let rec elimine(elem, liste) = match liste with
  | tete::corps -> 
          if elem = tete 
                        then corps
                        else tete::(elimine(elem, corps))
  | _ -> failwith "Aucun element"
;;

(*elimine : 'a * 'a list -> 'a list = <fun>*)
elimine(9, [3;2;5;2;7;1;9;4;3;2;5]);;
(*- : int list = [3; 2; 5; 2; 7; 1; 4; 3; 2; 5]*)

exception TropCourte of string;;
(* L'exception TropCourte est dfinie.*)

let deuxieme liste = match liste with
| [] -> raise (TropCourte "Il manque des elements dans la liste")
| [a] -> raise (TropCourte "Il manque des elements dans la liste")
| _ -> maxi(
            elimine (maxi liste,liste)
            );;

(*deuxieme : 'a list -> 'a = <fun>*)
deuxieme [3;2;5;2;7;1;9;4;3;2;5];;
(*- : int = 7*)



(* Exercice 2 :  Deux fonctions rcursives simples sur les listes*)

let rec applique(f,liste) = match liste with
  | tete::corps -> f(tete)::applique(f,corps)
  |_ -> [];;
(* applique : ('a -> 'b) * 'a list -> 'b list = <fun>*)
applique ((fun n->n*n),[1;2;3;4;5]);;
(*- : int list = [1; 4; 9; 16; 25]*)

let rec applatir liste = match liste with
| tete::corps -> tete
                  @
                  applatir(corps)
| _ -> []
;;
(*applatir : 'a list list -> 'a list = <fun>*)
applatir ([[1;3];[];[2];[6;4;2];[1;5]]);;
(*- : int list = [1; 3; 2; 6; 4; 2; 1; 5]*)


(*
(* Exercice 3 : types sommes et types produits : Gestion du personnel *)
type famille = {Nom : string ; AgesParents : int list ; AgesEnfants : int list};;
(*Le type famille est dfini.*)
type foyer = Celib of string*int | Famille of famille;;
(*Le type foyer est dfini.*)

let nbIndiv = fun
(*  complter
nbIndiv(Celib ("Durand",18));;
- : int = 1
nbIndiv(Famille {Nom = "Martin"; AgesParents = [32; 30]; AgesEnfants = [2; 4; 6]});;
- : int = 5*)

let rec nbCelib = fun 
(*  complter
nbCelib : foyer list -> int = <fun>
nbCelib(enterprise);;
- : int = 1*)

let rec long = fun 
(*  complter
long : 'a list -> int = <fun>*)



let rec nbEnfants = fun
(*  complter
nbEnfants : foyer list -> int = <fun>
nbEnfants(enterprise);;
- : int = 4*)



let rec naissance = fun 
(*  complter
naissance : string * foyer list -> foyer list = <fun>
naissance  ("Martin",enterprise) ;;*)

let rec plusUn = fun
(*  complter
plusUn : int list -> int list = <fun>*)


let rec miseAJour = fun 
(*  complter
miseAJour : foyer list -> foyer list = <fun>*)

*)

(* Exercice 4 : types sommes rcursifs, les tournois *)


type tournoi = Joueur of int 
               | Partie of int*tournoi*tournoi;;
			   

let rec initialise liste = match liste with
  | tete::corps -> (Joueur tete)::initialise(corps)
  |_-> []
;;
(* initialise : int list -> tournoi list = <fun>*)

initialise([3;2;5;2;7;1;9;4;3;2;6]);;
let init = initialise([3;2;5;2;7;1;9;4;3;2;6]);;
(*- : tournoi list =
 [joueur 3; joueur 2; joueur 5; joueur 2; joueur 7; joueur 1; joueur 9;
  joueur 4; joueur 3; joueur 2; joueur 6]*)
  



let rec vainqueur truc = match truc with
  | Joueur a -> a
  | Partie (a,b,c) -> a
;;
(*  complter
vainqueur : tournoi -> int = <fun> *)
vainqueur (Joueur 5);; 
 vainqueur (Partie (3, Joueur 3, Joueur 2));;
(*- : int = 5				- : int = 3  *)



let jeu (a, b) = match a,b with
  | Joueur a, Joueur b -> Partie (max a b, Joueur a, Joueur b)
  | Partie(a,b,c), Joueur d -> Partie (max a d, Partie (a,b,c), Joueur d)
  | Joueur d ,Partie(a,b,c) -> Partie (max a d, Joueur d, Partie (a,b,c))
  | Partie(d,e,f) ,Partie(a,b,c) -> Partie (max a d, Partie(d,e,f), Partie (a,b,c))

  ;;

jeu (Joueur 3, Joueur 5);;
(* jeu : tournoi * tournoi -> tournoi = <fun>*)
jeu (Joueur 4,Partie (5, Joueur 5, Joueur 2));;
(*- : tournoi = partie (5, joueur 4, partie (5, joueur 5, joueur 2))*)


let rec ronde liste = match liste with
  | a::b::c -> [jeu(a,b)]@ronde(c)
  | [a] -> [a]
  |_ -> failwith "hehe"
;;
(* ronde : tournoi list -> tournoi list = <fun>*)

let ronde1=ronde(init);;
(*ronde1 : tournoi list =
 [partie (3, joueur 3, joueur 2); partie (5, joueur 5, joueur 2);
  partie (7, joueur 7, joueur 1); partie (9, joueur 9, joueur 4);
  partie (3, joueur 3, joueur 2); joueur 6]*)
  
  
(*let ronde2=ronde(ronde1);;*)
(*ronde2 : tournoi list =
 [partie (5, partie (3, joueur 3, joueur 2), partie (5, joueur 5, joueur 2));
  partie (9, partie (7, joueur 7, joueur 1), partie (9, joueur 9, joueur 4));
  partie (6, partie (3, joueur 3, joueur 2), joueur 6)]*)
  
  (*
let rec leTournoi = fun 
(*  complter
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
(*  complter
leChampion([3;2;5;2;7;1;9;4;3;2;6]);;
- : int = 9*)

*)