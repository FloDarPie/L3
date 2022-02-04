
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

		



