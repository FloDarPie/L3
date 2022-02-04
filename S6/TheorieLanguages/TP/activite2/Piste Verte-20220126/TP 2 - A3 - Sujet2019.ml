(* Bibliothèque sur les listes et les chaînes de caractères en fin de page *)

(* 		Un type pour les AFN 	*)

type etatN = {acceptN : bool ; tN : char -> int list};;

type afn = {sigmaN: char list; (* l'alphabet *)
			nN: int; (* Q est l'ensemble {1..N} *)
			initN: int list; (* les états initiaux *)
			eN : int -> etatN};; 
			
			
(*		Lecture d'un mot par un AFN			*)

let an1  = {sigmaN= ['a';'b'] ; nN = 3; initN = [1] ; 
			eN = function	
			    1 -> {acceptN = false ;
				      tN = function 
					       'a'->[2] }
				|2 -> {acceptN = true ;
				      tN = function 
					       'a'->[2] 
						   |'b'-> [2;3] }		   
				|3 -> {acceptN = false ;
				      tN = function 
					       'a'->[2]
						   |'b'->[3]   }					   
		};;
		





















(* ******************************************************************* *)
 (* Bibliothèque sur les listes *)  
let rec appartient = function 
(a,b::l)-> if a=b then true else appartient(a,l)
|(_,[])-> false;;
appartient : 'a * 'a list -> bool = <fun>

let rec union l = function 
(a::l2)-> if appartient(a,l) then union l l2 else a:: (union l l2)
| []->l;;
union : 'a list -> 'a list -> 'a list = <fun>

let rec long = function
(_::l)->1+long(l)
|[]-> 0;;

(* Fin de la biliothèque sur les listes *)
(* ******************************************************************* *)
(*				Bibliothèque sur les chaînes de caractères 					 *)


let string_of_char = String.make 1 ;;

let tetec = function
| "" -> failwith "Erreur : chaine vide"
| s -> s.[0] ;;
(*val tetec : string -> char = <fun>*)

let tetes = fun s -> string_of_char (tetec(s));;

let reste = function 
| "" -> failwith "Erreur : chaine vide"
| s -> String.sub s 1  ((String.length s) - 1 ) ;;
(*val reste : string -> string = <fun>*)