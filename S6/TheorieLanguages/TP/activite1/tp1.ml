
(*		TP n°2 - Automate fini déterministe			*)

type etat = {accept : bool ; t : char -> int} ;;		(* type etat = { accept : bool; t : char -> int; } *)


type afd = {sigma : char list ; nQ : int ; init : int ; e : int -> etat} ;;

(* L'automate exemple a1 *)
let a1 = {sigma= ['a';'b'] ; nQ = 3; init = 1 ;
			e = function
			    1 -> {accept = false ;
				      t = function
					       'a'->2
						   |'b'-> 1  }
				|2 -> {accept = false ;
				      t = function
					       'a'->2
						   |'b'-> 3  }
				|3 -> {accept = true ;
				      t = function
					       'a'->3
						   |'b'->3   }
		};;

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





(*****************************************************************************)
(*				Bibliothèque sur les chaînes de caractères 					 *)

(* Fonctions usuelles sur les chaînes de caractères *)
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


(******************* GET STARTED **********************************************************)


let accepte ({init = depart; e = fonction}:afd) (mot:string) =

    let rec aux fonction (mot:string) (position:int) = match mot with
        | "" -> (fonction position).accept
        | mot ->
            let numero = (fonction position).t (tetec mot)
        in
        aux fonction (reste mot) numero
    in
    try aux fonction mot depart with Match_failure _ -> false
;;

let ac1 = accepte a1 ;;
List.map ac1 ["abba" ;"bbaaa" ;"bbaaba" ;"ba" ;"ab" ;""] ;;

let ac2 = accepte a2 ;;
List.map ac2 ["abba" ;"bbaaa" ;"bbaaba" ;"ba" ;"ab" ;""] ;;
accepte a2 "babb";;

let automate = {sigma= ['a';'b'] ; nQ = 3; init = 1 ;
			e = function
			    1 -> {accept = false ;
				      t = function
					       'a'->1
						   |'b'-> 2  }
				|2 -> {accept = true ;
				      t = function
					       'a'->3
						   |'b'-> 3  }
				|3 -> {accept = false ;
				      t = function
					       'a'->3
						   |'b'->3   }
		};;

let ac3 = accepte automate ;;
List.map ac3 ["abba" ;"bbaaa" ;"bbaaba" ;"ba" ;"ab" ;""; "aaaaaba"; "aaa"; "aaab"] ;;

