(*                      Bibliothèque sur les listes                             *)  

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


						(* RAPPELS *)
							
(* Représentation des automates non-déterministes *)
type etatN = {acceptN : bool ; tN : char -> int list};;
		
type afn = {sigmaN: char list; (* l'alphabet *)
			nN: int; (* Q est l'ensemble {1..N} *)
			initN: int list; (* les états initiaux *)
			eN : int -> etatN};;
			

(* Fonction transitN *)
exception  PasTransition ;;

let transitN = fun (aut, i, c) ->
	try (aut.eN(i)).tN(c) 
	with Match_failure _-> raise PasTransition;;
	
(* Automate exemple *)
let an1  = {sigmaN= ['a';'b'] ; nN = 6; initN = [1] ; 
			eN = function	
			    1 -> {acceptN = false ;
				      tN = function 
					       'a'->[3]}
				|2 -> {acceptN = true ;
				      tN = function 
					       'a'->[2] 
						   |'b'-> [1] }		   
				|3 -> {acceptN = true ;
				      tN = function 
					       'a'->[4]
						   |'b'->[5]   }	
				|4 -> {acceptN = true ;
					   tN = function
							'a' -> [3]}
				|5 -> {acceptN = false ;
						tN = function 
							'a' -> [5]
							|'b' -> [6]}
				|6 -> {acceptN = false ;
						tN = function 
							'a' -> [5]
							|'b' -> [6]}
		};;

(* Alphabet augmenté *)	
let sigmaAug = ['a';'b';'e'];;


let etatsAccessibles automate sigmaAug =

    let rec explore sommet alphabet = match alphabet with
        _char::b -> union 
                        (try (an1.eN sommet).tN _char with Match_failure _ -> explore sommet b )
                        (explore sommet b)
        | _ -> [sommet]
    in
    
    (*Parcours de la liste de sommet acceptant*)
    (*Parcours d'une liste et exploration des sommets*)
    let rec parcour_initiaux = function
         a::b -> (union (explore a sigmaAug)  [a]) @ (parcour_initiaux b)
        | _ -> [] in
 
    
    (*premier tour*)
    let debut = (parcour_initiaux automate.initN) in
    
    
    let rec boucle debut a fin =
    (*evite l'overflow*)
    if a = fin then [a;a;a;a] else
    
    (*exploration suivante*)
    let suivant = (parcour_initiaux debut) in
    (*analyse avec l'explo precedente*)
    let etape = union debut suivant in
    
    (*conclusion de l'analyse*)
    if  etape = debut then debut else boucle etape (a+1) fin
    
    in boucle debut 0 20
;;

etatsAccessibles an1 sigmaAug;;



(*******************
CONSTRUCTION DE L'AUTOMATE INVERSE
*)

let automateInverse an1 = 

let rec etatAcceptant = function
| 0 -> []
| a -> try let k = (an1.eN a).acceptN in if k then a :: (etatAcceptant (a-1)) else etatAcceptant (a-1) with Match_failure _ -> etatAcceptant (a-1)
in

let rec inverseRelation sommet lettre = function
| 0 -> []
| a -> try

(*extraire la liste de destination*)
let k = (an1.eN a).tN lettre in 

if appartient (sommet,k) then a :: (inverseRelation sommet lettre (a-1)) else inverseRelation sommet lettre (a-1) with Match_failure _ -> inverseRelation sommet lettre (a-1)

in

            {
            sigmaN= an1.sigmaN; (* l'alphabet *)
            nN= an1.nN; (* Q est l'ensemble {1..N} *)
            initN= etatAcceptant an1.nN; (* les états initiaux *)
            eN = function sommet -> 
                {
                acceptN = not (an1.eN(sommet)).acceptN ; 
                tN = function lettre -> inverseRelation sommet lettre an1.nN
                }
            }
;;
let an2 = automateInverse an1;;
an2.initN;;
(an2.eN 3).tN 'a';;
(an2.eN 3).acceptN;;
(an2.eN(1)).tN('b') ;;
(an2.eN(1)).tN('a') ;;
(an2.eN 1).acceptN;;
(an2.eN(2)).tN('a') ;;
(an2.eN(2)).tN('b') ;;
(an2.eN 2).acceptN;;
(an2.eN(3)).tN('a') ;;











(**********************************************************************)


(* Partie 1 : Déterminer les états accessibles *)

(* Il s'agit de réaliser un parcours de l'automate selon toutes les transitions. 
Ce travail est évidemment à mettre en lien avec le TP précédent, 
dans lequel nous avons déterminé les clotures par un parcours de l'automate selon les e-transitions.

Nous choisissons de faire un parcours en largeur, 
et l'objectif est d'obtenir tous les états visités, c'est à dire, 
tous les états accessibles. Nous procédons comme suit : *)






(* Fonction auxiliaire n°1 : 
automate + etat -> liste etat + tous ses successeurs de cet état *)

let eAccessibles auto e = 
		let rec aux1 auto e = function
		| [] -> [e]
		| a :: q -> (try let k = transitN(auto, e, a) in 
					union k (aux1 auto e q)
				with PasTransition -> aux1 auto e q )
				
		in aux1 auto e sigmaAug ;;
(*val eAccessibles : afn -> int -> int list = <fun> *)

let test1 = eAccessibles an1 ;;
(*val test1 : int -> int list = <fun>*)
List.map test1 [1;2;3;4;5;6] ;;
(*- : int list list = [[1; 3]; [1; 2]; [3; 5; 4]; [4; 3]; [6; 5]; [6; 5]]*)

		
(* Remarques sur cette fonction : 

1) Par sécurité, pensez toujours à mettre les parenthèses autour de votre try..with...
j'en vois encore beaucoup qui les oublient, ce qui provoque des erreurs si le filtrage
précédent -ici celui sur la liste- n'est pas terminé 

2) Je lance la fonction auxiliaire aux1, sur "l'alphabet augmenté" sigmaAug, pour 
que ma fonction soit également capable de gérer un automate avec des e-transitions
- même si ce n'est pas le cas de l'automate fournit en exemple ici -

3) Comme nous souhaitons à l'arrivée obtenir l'ensemble des états visités, il faut bien
penser à mettre l'état de départ dans la liste renvoyée. On se rappelle d'où on part, et où on va. 

4) On utilise la fonction union pour éviter les répétitions. 

*)



(* Fonction auxiliaire n°2 : 
étendre la fonction précédente à une liste d'états *)

let rec eAccessiblesListe auto = function 
	| [] -> []
	| a::q -> union (eAccessibles auto a) (eAccessiblesListe auto q) ;;
(* val eAccessiblesListe : afn -> int list -> int list = <fun> *)

eAccessiblesListe an1 [2;6];;
(*- : int list = [6; 5; 1; 2]*)


(* Remarque : RAS, c'est un grand classique *)





(* Fonction n°3 : c'est le point principal de cette première partie 
cette fonction s'occupe de lancer récursivement la fonction précédente pour parcourrir
l'intégralité de l'automate. 

La principale difficulté est la condition d'arrêt. C'est la même que pour la cloture : 
On observe la longueur de notre liste d'états. 
On démarre avec la liste des états initiaux. 
Après un appel à eAccessiblesListe, notre liste contient les états initiaux et leurs successeurs.
Après un deuxième appel à eAccessiblesListe, notre liste contient les état initiaux et tous les états à une distance <= 2 de ces états initiaux.
... Bref, la taille de la liste va augmenter à chaque appel récursif ! 

Cette augmentation de taille va nécessairement s'arrêter un jour, puisqu'il n'y a qu'un nombre fini
d'états dans notre automate (et qu'en utilisant la fonction union, il n'y a pas de répétition dans notre liste !

Nous tenons donc notre condition d'arrêt : dès que la taille de la liste n'augmente plus, on s'arrête !
*)

let rec auxParcours auto li = 
	let l2 = eAccessiblesListe auto li in    (* on appelle eAccessiblesListe *)
	if long(li) = long(l2)  (* on compare la longueur de notre liste Avant/Après *)
		then li     (* si la longueur n'a pas évolué, c'est terminé, on renvoie la liste des sommets visités *)
		else auxParcours auto l2   (*sinon, on recommence ! *) ;;
(* val auxParcours : afn -> int list -> int list = <fun> *)

auxParcours an1 [1] ;;
(* - : int list = [1; 4; 3; 6; 5] *)



(* Fonction n°4 : la fonction d'appel 
Lance la fonction précédente sur la liste des états initiaux de l'automate *)

let etatsAccessibles auto = auxParcours auto (auto.initN) ;;
(*val etatsAccessibles : afn -> int list = <fun>*)

etatsAccessibles an1 ;;
(*- : int list = [1; 4; 3; 6; 5] *)



(*            ***                  ***                ***               ***        *)

(* Partie 2, Construction de l'automate inverse, recherche des sommets co-accessibles *)

(* Dans cette partie 2, nous allons écrire plusieurs fonctions qui renvoie un automate 
- de type afn donc. 
Il n'est pas possible de modifier la définition d'un automate déjà existant, il faudra
donc, à chaque fois, pour chaque fonction, redéfinir un automate. 
Vos fonctions ressembleront à : 

let (rec) nomDeFonction paramètres = 
		[...]
		des éventuelles définitions locales pour faire du travail préliminaire
		[...]
		{sigmaN =  ...  ;
			nN = ... ;
			initN = ... ;
			eN = function i -> [...] {acceptN = ... ; tN = ... } [...]
		) ;; 
*)



(* Ainsi, pour la première fonction, autoVide, cela donne : *)

let autoVide auto = 
	(* l'automate vide possède les mêmes propriétés que l'automate "auto"... *)
	{
	sigmaN = auto.sigmaN ; 
	nN = auto.nN ; 
	initN = auto.initN ; 
	eN = function i ->  (* pour chaque état, je donne sa description *)
			{
			acceptN = (auto.eN(i)).acceptN ; 
			tN = function _ -> raise PasTransition   (* ... SAUF qu'on enlève toutes les transitions *)
			} 
	} ;;
(*val autoVide : afn -> afn = <fun>*)
