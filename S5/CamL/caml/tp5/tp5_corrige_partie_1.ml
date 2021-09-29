(* INU J-F. Champollion Albi
Double Licence Maths-Info	          	                
L1 Semestre 1					                                     
Programmation fonctionnelle en Caml	
TP 5 : Récursivité sur les chaînes de caractères *)

Les chaînes de caractères se prètent bien au traitement récursif, on utilise pour cela les fonctions tete et reste, présentes dans la bibliothèque chainesCaml.ml, qui permettent d'enlever l'initiale d'un mot et donc de se ramener à un mot plus court, que l'on traite récursivement. Le cas de base est alors souvent celui de la chaînes vide ou des chaînes réduites à une seule lettre.


(* Exo 1 :  Fonctions usuelles
 *****************************)
Les lettres minuscules sont celles qui sont comprises entre 'a' et 'z', on pense donc souvent à la solution suivante :

let minus = fun c->
 if c<=`z`& c>=`a` then true 
 else false;;
 
Il faut comprendre qu'ici une selection est inutile, le l'expression booléenne  c<=`z`& c>=`a` vaut soit vrai soit faux, quand elle vaut vrai on veut que minus soit vrai et quand elle vaut faux, on veut que minus soit faux. Il suffit donc de donner à minus la valeur de cette expression:

let minus = fun c->
	c<=`z`& c>=`a` ;;
minus : char -> bool = <fun>
	
De même pour majus :
  
let majus = fun c->
	c<=`Z`& c>=`A` ;;
majus : char -> bool = <fun>

let lettre = fun c-> 
	minus(c) or majus(c);;  
lettre : char -> bool = <fun>

(* Premières fonctions récursives sur les listes
************************************************)
(* appartient 
**************)
Idée récursive :
----------------
Si le caractère est l'initiale du mot, alors il appartient au mot, sinon on regarde récursivement s'il appartient au reste.
Le cas de base est le mot vide. Le caractère ne lui appartient pas.

let rec appartient = fun 
(_,"")->false
|(c,w) -> if tetec(w)=c then true
          else appartient(c,reste(w));;
appartient : char * string -> bool = <fun>

trace "appartient";;
La fonction appartient est dorénavant tracée.
appartient <-- `t`, "appartient"
appartient <-- `t`, "ppartient"
appartient <-- `t`, "partient"
appartient <-- `t`, "artient"
appartient <-- `t`, "rtient"
appartient <-- `t`, "tient"
appartient --> true
appartient --> true
appartient --> true
appartient --> true
appartient --> true
appartient --> true
- : bool = true

appartient <-- `z`, "appartient"
appartient <-- `z`, "ppartient"
appartient <-- `z`, "partient"
appartient <-- `z`, "artient"
appartient <-- `z`, "rtient"
appartient <-- `z`, "tient"
appartient <-- `z`, "ient"
appartient <-- `z`, "ent"
appartient <-- `z`, "nt"
appartient <-- `z`, "t"
appartient <-- `z`, ""
appartient --> false
appartient --> false
appartient --> false
appartient --> false
appartient --> false
appartient --> false
appartient --> false
appartient --> false
appartient --> false
appartient --> false
appartient --> false
- : bool = false



(* début
********)
Idée récursive :
----------------
Il est clair que "papa" n'est pas le début de "maman" car il n'ont pas la même initiale.
Comme "papa" et "papou" ont la même initiale, il faut récursivement comparer "apa" et "apou" qui ont le même initiale, puis "pa" et "pou" qui ont même initiale puis "a" et "ou" et là ça ne marche plus.
Si on teste "pa" et "papa", ils ont la même initiale, on compare alors "a" et "apa" qui ont même initiale puis "" et "pa". Le cas de base est celui où le premier mot est vide, dans ce cas le résultat est vrai.
Si le deuxième mot est vide avant le premier ("papa" est-il le début de "pa"?) alors la réponse est faux.

Ce qui donne :
let rec debut = fun 
  ("",_)->	true
| (_,"")-> 	false
| (m,w)-> 	if tetec(m)=tetec(w)
			then debut(reste(m),reste(w))
			else false;;
debut : string * string -> bool = <fun>

debut <-- "papa", "papou"
debut <-- "apa", "apou"
debut <-- "pa", "pou"
debut <-- "a", "ou"
debut --> false
debut --> false
debut --> false
debut --> false
- : bool = false

debut <-- "papa", "pa"
debut <-- "apa", "a"
debut <-- "pa", ""
debut --> false
debut --> false
debut --> false
- : bool = false

debut ("pa", "papa");;
debut <-- "pa", "papa"
debut <-- "a", "apa"
debut <-- "", "pa"
debut --> true
debut --> true
debut --> true
- : bool = true
(* incluse 
***********)
si m est le début de w, alors m est inclus dans w, sinon on regarde récursivement si m est inclus dans le reste de w. On peut prendre comme cas de base celui ou w est plus court que m.

let rec incluse = fun (m,w)->
	if longChaine(m)>longChaine(w) then false
	else
		if debut(m,w) then true
		else incluse(m,reste(w));;
incluse : string * string -> bool = <fun>

incluse("ama","maman");;
incluse <-- "ama", "maman"
incluse <-- "ama", "aman"
incluse --> true
incluse --> true
- : bool = true
incluse <-- "mana", "maman"
incluse <-- "mana", "aman"
incluse <-- "mana", "man"
incluse --> false
incluse --> false
incluse --> false
- : bool = false


(* Pour des raisons de lisibilité, je ne donnerais plus systématiquement les traces d'éxecution de toutes les fonctions récursives, mais il vous appartient de toujours les tester à l'aide de la trace.

A partir de maintenant, vous devez commencer à "penser récursif", vous devez avoir compris qu'on ne parcours rien, qu'on évite toute description utilisant les expressions : "on n'a qu'à faire ça jusqu'à...", "on répète ça tant que..." etc. Ce n'est pas nous qui itérons, ce sont les appels récursifs. Nous on se contente de ramener le problème au même problème sur des données plus petite. *)


(* frequence
************)
C'est le nombre de fois que le caractère apparait dans le reste, plus 1 si c'est aussi l'initiale.
Le cas de base est celui du mot vide.
let rec frequence = fun 
(c,"")-> 0
|(c,w)-> if tetec(w)=c then 1+frequence(c,reste(w))
         else frequence(c,reste(w));;
frequence : char * string -> int = <fun>

frequence(`a`,"Dakar");;
- : int = 2


(* elimine
***********)
On élimine le caractère du reste du mot et on garde l'initiale si elle est différente du caractère à éliminer.
Le cas de base est celui du mot vide.
let rec elimine = fun 
(_,"")->""
|(c,w)-> if tetec(w)=c then elimine(c,reste(w))
         else tetes(w)^elimine(c,reste(w));;
elimine : char * string -> string = <fun>

elimine(`a`,"Dakar");;
- : string = "Dkr"

(* renverse 
***********)
On renverse le reste et on ajoute l'initiale...à la fin.
Le cas du mot vide est clair.

let rec renverse = fun
""->""
|w-> renverse(reste(w))^tetes(w);;
renverse : string -> string = <fun>

(* On appelle palindrome, un mot qui peut se lire dans les deux sens, comme "elle", "non" ou "kayak" *)
renverse "palindrome";;
- : string = "emordnilap"
(* donc "palindrome" n'est pas un palindrome *)
renverse "kayak";;
- : string = "kayak"


