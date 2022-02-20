(* ******************************************************************* *)
 (* Bibliothèque sur les listes *)  
 let rec appartient = function 
(a,b::l)-> if a=b then true else appartient(a,l)
|(_,[])-> false;;
(*appartient : 'a * 'a list -> bool = <fun>*)

let rec union l = function 
(a::l2)-> if appartient(a,l) then union l l2 else a:: (union l l2)
| []->l;;
(*union : 'a list -> 'a list -> 'a list = <fun>*)

let rec longueur = function
(_::l)->1+longueur(l)
|[]-> 0;;
(*longueur : 'a list -> int*)
(* Fin de la biliothèque sur les listes *)





(* --------------------------------------------------------- *)

	(* TP 3 - Suppression des epsilon-transitions d'un AFN *)

(* --------------------------------------------------------- *)



				(* Les définitions de types *)

type etatN = {acceptN : bool ; tN : char -> int list};;

type afn = {sigmaN: char list; (* l'alphabet *)
			nN: int; (* Q est l'ensemble {1..N} *)
			initN: int list; (* les états initiaux *)
			eN : int -> etatN};; 

			
(* --------------------------------------------------------- *)
				(* Les automates exemples *)
	
(* Un automate plein d'epsilon-transitions *)	
let an1  = {sigmaN= ['a';'b'] ; nN = 4; initN = [1] ; 
			eN = function	
			    1 -> {acceptN = false ;
				      tN = function
					       'e'->[2] }
				|2 -> {acceptN = false ;
				      tN = function
					       'e'->[1;3] }		   
				|3 -> {acceptN = true ;
				      tN = fun 
					       'e'->[1;4] }
				|4 -> {acceptN = false ;
				      tN = function 
					       'e'->[1] }						   
		};;
		
		
(* L'automate de l'animation "Déterminiser un automate" disponible sur Moodle *)
let an2  = {sigmaN= ['a';'b'] ; nN = 4; initN = [1] ; 
			eN = function 	
			    1 -> {acceptN = false ;
				      tN = function 
							'a' -> [2] }
				|2 -> {acceptN = false ;
				      tN = function 
					       'e' -> [3] }		   
				|3 -> {acceptN = true ;
				      tN = function
					      'b' -> [2]
						| 'e' -> [4]}	
				|4 -> {acceptN = false ;
						tN = function
							'b' -> [4]
							| 'a' -> [2]}
		};;			

(* --------------------------------------------------------- *)
					(* PasTransition *)
exception PasTransition ;;
		
let transitN = fun (aut, i, c) ->
	try (aut.eN(i)).tN(c) 
	with Match_failure _-> raise PasTransition;;
		
		
		
(* --------------------------------------------------------- *)
				(* Le calcul des clotures *)

let eTransitionOuVide (aut : afn) (i : int) = 
   try i::transitN(aut,i,'e') 
   with  PasTransition -> [i];;
(*eTransitionOuVide : afn -> int -> int list *)

let rec eTransitionOuVideListe (aut : afn) (li : int list) = match li with
	| i :: q -> union (eTransitionOuVide aut i) (eTransitionOuVideListe aut q)
	| [] -> [] ;; 
(*eTransitionOuVideListe : afn -> int list -> int list*)


let rec parcours (aut : afn) (li : int list) = 
	let li2 = eTransitionOuVideListe aut li in 
	if longueur li = longueur li2 
	then li 
	else parcours aut li2 ;;
(*parcours : afn -> int list -> int list*)	

let cloture (aut : afn) (etat : int) = parcours aut [etat] ;;
(*cloture : afn -> int -> int list*)



(*                    Tests                   *)

let clotureDansAN1 = cloture an1 ;; 	 (* clotureDansAN1 : int -> int list *)
let clotureDansAN2 = cloture an2 ;;		(* clotureDansAN2 : int -> int list *)

List.map clotureDansAN1 [1;2;3;4] ;;
(*int list list = [[2; 3; 1; 4]; [4; 2; 1; 3]; [2; 3; 1; 4]; [4; 2; 1; 3]] *)
List.map clotureDansAN2 [1;2;3;4] ;;
(*int list list = [[1]; [4; 2; 3]; [3; 4]; [4]] *)


(* --------------------------------------------------------- *)
				(* Les nouveaux états acceptants *)

let nouvelEtatAcceptant aut etat = 

    (*Prendre la cloture de l'etat *)
    let liste = cloture aut etat in 
    
    
    let rec parcours liste = match liste with
    | a::b -> (aut.eN a).acceptN || parcours b
    | [] -> false
    
    in
    
    parcours liste

;;

(*                    Tests                   *)

let nouveauxAcceptantsAN2 = nouvelEtatAcceptant an2 ;;
(*nouveauxAcceptantsAN2 : int -> bool*)

List.map nouveauxAcceptantsAN2 [1;2;3;4] ;;
(*bool list = [false; true; true; false]*)
	


(* --------------------------------------------------------- *)
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

transitionsEtendues an2 'a' 2;;

(*                    Tests                   *)

let tN_AN2_a = transitionsEtendues an2 'a' ;; (*tN_AN2_a : int -> int list*)
List.map tN_AN2_a [1;2;3;4] ;;
(* int list list = [[2]; [2]; [2]; [2]]*)

let tN_AN2_b = transitionsEtendues an2 'b' ;;	(*tN_AN2_b : int -> int list*)		
List.map tN_AN2_b [1;2;3;4] ;;
(* : int list list = [[]; [2; 4]; [4; 2]; [4]]*)



(* --------------------------------------------------------- *)
			(* Construction du nouvel automate *)


let nouvelAuto aut =
   {sigmaN = aut.sigmaN;
   nN = aut.nN;
   initN = aut.initN;
   eN = function etat ->
            {acceptN = nouvelEtatAcceptant aut etat;
            tN = function (_char:char) -> (transitionsEtendues aut _char etat:int list)}
        } 
    ;;


(*                    Tests                   *)
let automate1 = nouvelAuto an1;;
let automate2 = nouvelAuto an2;;

(automate1.eN 1).acceptN;;
