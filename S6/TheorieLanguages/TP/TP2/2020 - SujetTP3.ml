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
let an1  = {sigmaN= ['a';'b'] ; nN = 5; initN = [1] ; 
			eN = function	
			    1 -> {acceptN = false ;
				      tN = function
					       'e'->[2]
					       | _ -> [5]}
				|2 -> {acceptN = false ;
				      tN = function
					       'e'->[1;3]
					       | _ -> [5]}   
				|3 -> {acceptN = true ;
				      tN = function 
					       'e'->[1;4]
					       | _ -> [5]}
				|4 -> {acceptN = false ;
				      tN = function 
					       'e'->[1]
					       | _ -> [5]}
                |5 -> {acceptN = false ;
				      tN = function _ -> [5]}
		};;
		
		
(* L'automate de l'animation "Déterminiser un automate" disponible sur Moodle *)
let an2  = {sigmaN= ['a';'b'] ; nN = 4; initN = [1] ; 
			eN = function 	
			    1 -> {acceptN = false ;
				      tN = function 
							'a' -> [2]
							| _ -> [5]}
				|2 -> {acceptN = false ;
				      tN = function 
					       'e' -> [3]
					       | _ -> [5]}   
				|3 -> {acceptN = true ;
				      tN = function
					      'b' -> [2]
						| 'e' -> [4]
						| _ -> [5]}
				|4 -> {acceptN = false ;
						tN = function
							'b' -> [4]
                        | 'a' -> [2]
                        | _ -> [5]}
                |5 -> {acceptN = false ;
						tN = function _ -> [5]}
		};;			

(* --------------------------------------------------------- *)
					(* PasTransition *)
exception PasTransition ;;
		
let transitN = fun (aut, i, c) ->
	try (aut.eN(i)).tN(c) 
	with Match_failure _-> raise PasTransition;;
		
		
		
(* --------------------------------------------------------- *)
				(* Le calcul des clotures *)
 

 
let test = an1.eN 1 ;;
test.tN 'e';;
 
 let cloture (automate:afn) = 
    
    let compteur = automate.nN in
    let maliste = [] in
    let maCloture a = [ a ] in
    
    
    (*
    Verification des ensembles parcourus depuis le sommet initial
    *)
    let verification_ensemble ensemble nouveau_ensemble =
            ensemble = nouveau_ensemble
    in
    
    (*
    On ajoute la e-transition dans la cloture
    *)
    let cloturation sommet maCloture =
        ((automate.eN sommet).tN 'e' ) @ maCloture
    in
    

    
    (*
    on parcours tous les sommets de l'automate
    *)
    let rec balade compteur = match compteur with
        | 0 -> maliste
        | _ -> (List.append maliste [compteur])@(balade (compteur-1))
    
    in
    balade compteur;;
    
cloture an1 ;;




let cloture automate sommet = 

    let liste = [sommet] in

    
    
    let rec parcours liste = match liste with
        let verif = ((List.length liste) < 3 )in
                
            | verif -> liste
            | _ -> parcours ( ((automate.eN sommet).tN 'e')::liste )
            
    in
    
    parcours liste

;;

 
 
(************************** 

(*                    Tests                   *)

let clotureDansAN1 = cloture an1 ;; 	 (* clotureDansAN1 : int -> int list *)
let clotureDansAN2 = cloture an2 ;;		(* clotureDansAN2 : int -> int list *)

List.map clotureDansAN1 [1;2;3;4] ;;
(*int list list = [[2; 3; 1; 4]; [4; 2; 1; 3]; [2; 3; 1; 4]; [4; 2; 1; 3]] *)
List.map clotureDansAN2 [1;2;3;4] ;;
(*int list list = [[2; 3; 1; 4]; [4; 2; 1; 3]; [2; 3; 1; 4]; [4; 2; 1; 3]] *)


(* --------------------------------------------------------- *)
				(* Les nouveaux états acceptants *)

				

				
				
				
				
				


(*                    Tests                   *)

let nouveauxAcceptantsAN2 = nouvelEtatAcceptant an2 ;;
(*nouveauxAcceptantsAN2 : int -> bool*)

List.map nouveauxAcceptantsAN2 [1;2;3;4] ;;
(*bool list = [false; true; true; false]*)
	


(* --------------------------------------------------------- *)
				(* Calcul des transitions étendues *)



				
				
				
				
				
				
				
				
			

(*                    Tests                   *)

let tN_AN2_a = transitionsEtendues an2 'a' ;; (*tN_AN2_a : int -> int list*)
List.map tN_AN2_a [1;2;3;4] ;;
(* int list list = [[2]; [2]; [2]; [2]]*)

let tN_AN2_b = transitionsEtendues an2 'b' ;;	(*tN_AN2_b : int -> int list*)		
List.map tN_AN2_b [1;2;3;4] ;;
(* : int list list = [[]; [2; 4]; [4; 2]; [4]]*)



(* --------------------------------------------------------- *)
			(* Construction du nouvel automate *)












(*                    Tests                   *)



**************************)
