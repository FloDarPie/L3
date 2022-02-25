(* Engendré l'ensemble des parties non vide de 1,...,n *)				
let rec aux  x = function
	| [] -> []
	| a :: q -> (x::a) :: (aux x q) ;;
		
let rec parties = function
	| 0 -> [[]]
	| n -> parties(n-1)@( aux n (parties(n-1))) ;;

let rec enleve = function 
	| [] -> []
	| x :: q -> if long(x) = 0 then q else x :: (enleve q) ;;
	

(* Trier les listes *)	
let rec insere x = function 
	| [] -> [x] 
	| a :: q -> if x < a then x :: a ::q else a :: (insere x q) ;;

let rec tri = function 
	| [] -> []
	| x :: q -> insere x (tri q) ;;
	
(*Multi-tri*)	
let rec multi_tri = function
	| [] -> []
	| x :: q -> (tri x)::(multi_tri q) ;;
	

(* Finalement, la liste des nouveaux états de l'automate : *)

let nouveauxetats = function n -> multi_tri (enleve(parties n)) ;;
(*val nouveauxetats : int -> int list list = <fun>
# nouveauxetats 3 ;;
- : int list list = [[1]; [2]; [1; 2]; [3]; [1; 3]; [2; 3]; [1; 2; 3]] *)