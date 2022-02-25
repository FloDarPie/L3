(* ----------------------- Bibliothèque sur les listes -------------------------- *)
let rec appartient = function 
(a,b::l)-> if a=b then true else appartient(a,l)
|(_,[])-> false;;
(*appartient : 'a * 'a list -> bool = <fun>*)

let rec union l = function 
(a::l2)-> if appartient(a,l) then union l l2 else a:: (union l l2)
| []->l;;
(*union : 'a list -> 'a list -> 'a list = <fun>*)

let rec enleve a = function
 x::q -> if x = a then q else x::(enleve a q)
 | [] -> [] ;;

let rec intersection l1 = function
	| [] -> []
	| a :: l2 -> if appartient(a,l1) then a::(intersection (enleve a l1) l2) else intersection l1 l2 ;;

let rec long = function
(_::l)->1+long(l)
|[]-> 0;;


(* -------------------- RAPPELS ------------------ *)

														
(* Représentation d'un automate déterministe *)
type etat = {accept : bool ; t : char -> int};;
 
type afd = {sigma : char list ; (* l'alphabet *)
			n : int ; (* Q est l'ensemble des états de 1 à n *)
			init : int ; (* l'état initial *)
			e : int -> etat};;
							
(* Représentation des automates non-déterministes *)
type etatN = {acceptN : bool ; tN : char -> int list};;
		
type afn = {sigmaN: char list; (* l'alphabet *)
			nN: int; (* Q est l'ensemble {1..N} *)
			initN: int list; (* les états initiaux *)
			eN : int -> etatN};;

			
(* Fonctions de transition *)
exception  PasTransition ;;

let transitN = function (aut, i, c) ->
	try (aut.eN(i)).tN(c) 
	with Match_failure _-> raise PasTransition;;
	
(* Liste des états Acceptants *)
let etatsAcceptants auto = 
	let rec auxi auto = function 
		| 0 -> []
		| i -> if (auto.eN(i)).acceptN then i::(auxi auto (i-1)) else auxi auto (i-1) 
	in auxi auto (auto.nN) ;;
(* val etatsAcceptants : afn -> int list = <fun> *)


(* Exemple du TP *)

let an1 = {sigmaN= ['a';'b'] ; nN = 3; initN = [1] ; 
			eN = function	
			    1 -> {acceptN = false ;
				      tN = function 
					       'a'->[1;2]
						   |'b'-> [1]}
				|2 -> {acceptN = false ;
				      tN = function  
						   'b'-> [3] }		   
				|3 -> {acceptN = true ;
				      tN = function 
					       'a'->[3]
						   |'b'->[3]   }	
				
		};;

(* Calcul des transitions étendues *)
(* construction du nouvel automate *)

	
(* Réutilisation de la fonction de l'ancien tp *)
				(* Calcul des transitions étendues *)


let transitionsEtendues aut _char etat = 

    (*Prendre la cloture de l'etat *)
    let liste = cloture aut etat in 
    
    
    let rec parcours liste = match liste with
     [] -> []
    | a::b -> union
                ( try ((aut.eN a).tN _char) with Match_failure _ -> []) 
                (parcours b)
    
    in
    
    parcours liste
;;

transitionsEtendues an1 'a' 1;;