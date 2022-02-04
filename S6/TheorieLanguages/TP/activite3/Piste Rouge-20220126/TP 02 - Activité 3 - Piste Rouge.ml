
(*		TP n°2 - Automate fini déterministe			*)
		
type etat = {accept : bool ; t : char -> int} ;;		(* type etat = { accept : bool; t : char -> int; } *)


type afd = {sigma : char list ; nQ : int ; init : int ; e : int -> etat} ;;

(* automate exemple a2 *)
let a2 = {sigma= ['a';'b'] ; nQ = 3; init = 1 ; 
			e = function	
			    1 -> {accept = false ;
				      t = function 
					       'a'->2 }
				|2 -> {accept = false ;
				      t = function 
					       'a'->2
						   |'b'-> 3  }		   
				|3 -> {accept = true ;
				      t = function 
					       'a'->3
						   |'b'->3   }		   				
		};;
		
(* On définit une exception *)		
exception  PasTransition ;;

(* et une fonction de transition levant cette exception *)
let transit = fun (aut, i, c) ->
	try (aut.e(i)).t(c) 
	with Match_failure _-> raise PasTransition;;

(* La fonction complete à compléter *)

let complete = function aut ->
			let rec aux = function 
				(0,_,aut2) -> aut2 (* On a testé toutes les transitions de tous les états. Fin de l'algorithme *)
				|(i, [], aut2) -> aux(i-1,aut.sigma,aut2) (* On a testé toutes les transitions de l'état i, on passe à l'état i-1 *)
				|(i, c::r, aut2) ->  
				(* à compléter *)
			in aux(aut.nQ , aut.sigma, aut) ;;



