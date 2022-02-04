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
let rec appartient (a,l) = match (a,l) with
(a,b::l)-> if a=b then true else appartient(a,l)
|(_,[])-> false;;
(*appartient : 'a * 'a list -> bool = <fun>*)

let rec union l l2 = match l2 with
(a::l2)-> if appartient(a,l) then union l l2 else a:: (union l l2)
| []->l;;
(*union : 'a list -> 'a list -> 'a list = <fun>*)

let rec long l = match l with
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

(* Fin de la biliothèque sur les chaînes de caractères *)
(* ******************************************************************* *)

let transition chiffre automate = automate.eN chiffre;;
let etat = transition 1 an1;;
(an1.eN 1).tN 'a';;
(an1.eN 1).acceptN;;

let rec acceptN_parChiffre mot automate chiffre = match mot with
        | "" -> (automate.eN chiffre).acceptN
        | mot ->
            let lettre = tetec mot in
            
                
                let etat_courant = try (automate.eN chiffre).tN lettre
                with Match_failure _ -> []
            
            in
        
        let rec parcours liste = match liste with
        | a::b ->  acceptN_parChiffre (reste mot) automate a || parcours b
        | [] -> acceptN_parChiffre (reste mot) automate 1  (*Peut-etre a revoir*)
        
        in parcours etat_courant
;;

acceptN_parChiffre "b" an1 1;;




let acceptN mot automate = 
    let depart = automate.initN in
    
    match depart with
    [] -> false
    | chiffre::depart -> acceptN_parChiffre mot automate chiffre

;;

acceptN "aaa" an1 ;;
acceptN "aba" an1 ;;
acceptN "abb" an1 ;;
acceptN "bbb" an1 ;;
acceptN "aabbaa" an1 ;;
acceptN "aabaab" an1 ;;
acceptN "ab" an1 ;;
    
