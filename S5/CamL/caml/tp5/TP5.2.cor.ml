(* INU J-F. Champollion Albi
Double Licence Maths-Info	          	                
L1 Semestre 1					                                     
Programmation fonctionnelle en Caml	
TP 5 : Récursivité sur les chaînes de caractères *)

(* Les chiffres romains :
Un petit problème pour finir...*)

(* On fait un simple filtrage des différents chiffres utilisés *)
let chiffre = fun
`I`->1
|`V`->5
|`X`->10
| _ ->failwith " ce n'est pas un chiffre romain";;
chiffre : char -> int = <fun>

chiffre(`V`);;
- : int = 5


(* c'est récursivement la valeur du premier chiffre plus la valeur du reste *)
let rec rom1 = fun
""->0
|s -> chiffre(tetec(s))+rom1(reste(s));;
rom1 : string -> int = <fun>

rom1 "XXVIII";;
- : int = 28

let valeurI  = fun
`I`->2
|`V`->4
|`X`->9
| _ ->failwith " ce n'est pas un chiffre romain";;
valeurI : char -> int = <fun>

valeurI `X`;;
- : int = 9

let rec romain = fun
""->0
|s -> let a = tetec(s) and r=reste(s) in
	if a=`I` then
	   if r="" then 1
	   else let b= tetec(r) in
                valeurI(b) + romain(reste(r))			
  	else chiffre(a)+romain(r);;
romain : string -> int = <fun>

(* Ou mieux, en filtrant le cas du dernier I *)
let rec romain = fun 
"" -> 0
|"I"->1 (* dans la suite , on est sûr que tout I est suivi d'un caractère *)
|s -> let c = tetec(s) and r=reste(s) in 
 	  (match c with
	        `I` -> valeurI(tetec(r))+romain(reste(r))
            |x  -> chiffre(x)+romain(r)  );;

romain "XXIV";;
- : int = 24
romain "XXXIX";;
- : int = 39