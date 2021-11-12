(* INU J-F. Champollion 	          	                
Albi					                                     
L3 Semestre 5  		Programmation fonctionnelle en Caml	      

TP 1 (3 heures)*)

Dans ce premier TP, vous n'avez rien d'autre � faire que de recopier les expressions Caml et de les ex�cuter dans l'environnement Caml Light. Parfois tout se passe comme pr�vu et il n'y a rien de plus � en dire. Parfois le r�sultat est surprenant et vous devez le commenter dans votre compte rendu. D'autre fois encore le r�sultat ne r�pond pas � toute vos questions et vous devez prendre l'initiative de compl�ter les tests effectu�s.
Votre compte rendu de TP est un objet p�dagogique fondamental : C'est lui que vous devrez relire pour r�viser une notion. Il est donc important d'y consacrer du temps et de le r�aliser avec soin.

 (* 2  Expressions �l�mentaires et types de base *)

(* Entiers et r�els *)
1.2+1;;	
>^^^
Cette expression est de type float,
mais est utilis�e avec le type int.
(*Attention, entier et r�els sont des types diff�rents en Caml, 
 on ne peut op�rer directement entre les deux sans conversion (voir plus loin) *)
		
1.2+2.3;;
>^^^
Cette expression est de type float,
mais est utilis�e avec le type int.
(* Attention : l'op�rateur + est l'addition des entiers, tous les op�rateurs r�els soint "point�s" +., -., *., /. *)

-2E-1+.2.;;		
- : float = 1.8

(sqrt(4.)+.2.)/.3.5;;
- : float = 1.14285714286
(* L'environnement initial de Caml conna�t les fonctions math�matiques �l�mentaires telles que la racine carr�e (sqrt), on peut en essayer d'autres :
#log(exp(1.));;
- : float = 1.0
log est donc le logarithme n�p�rien.
Attention, ce sont toutes des fonctions de type float-> float 
# sqrt;;
- : float -> float = <fun>*)

 -2 * 3;;
- : int = -6
 
 2.1 +. 4.9;;
 - : float = 7.0
 
 sqrt 9.;;
- : float = 3.0
 
 10/3;;
 - : int = 3
(*  / est l'op�rateur de division enti�re, il donne donc le quotient de la division enti�re (aussi appel�e division euclidienne) *)
 
 10 mod 3;;	
- : int = 1
(* mod donne le reste de cette division enti�re qui sur notre exemple s'�crit 10 = 3*q+r avec le quotient q=3 et le reste r=1  *)
 
 2+3*5;;
 - : int = 17
 (* la multiplication est prioritaire sur l'addition! *)
 
 -(5+1)*(-2+5)+2*3;;
- : int = -12
(* Les parenth�ses permettent de forcer les priorit�s. *)
 
(* Bool�ens *)
(* Les bool�ens sont souvent construits par comparaison d'expressions de tout type entier, r�els, bool�ens etc.*)
 1=2;;
- : bool = false
 
 4<5;;
 - : bool = true
 
 4.2<4.7;;
 - : bool = true
 
 (1=1)=(2<1);;
 - : bool = false
 (* on compare les bool�ens true et false qui ne sont pas �gaux *)
 
 true=1;;	
Cette expression est de type int,
mais est utilis�e avec le type bool.
(* On doit comparer des expressions de m�mes type, pas un entier avec un bool�en *)
 
 (* Les bool�ens sont �galement obtenus par op�rations logiques enter bool�ens *)
 true or false;;
 - : bool = true
 
 true or false=(1=1) & (4<5);;
 - : bool = true
 (* Ca se complique, on obtient :
 true or false=true & true
 D'apr�s le cours on commence par comparaison puis et puis ou donc
 true or ((false=true) & true)
 = true or (false & true)
 = true or false
 = true *)
 
 (1+2=2+1)& 4>5;;
 - : bool = false
 (* (3=3) & false = true & false = false *)
 
 1+2=2+1 & 4>5;;
 - : bool = false
 (* idem car l'addition est prioritaire sur les comparaisons puis le &
 C'est donc �quivalent � 
 ((1+2)=(2+1)) & (4>5) *)
 
 1+2=2+1 or 4 > 5;;
 - : bool = true
 (* idem, on obtient true or false = true *)
 
 1+2=2+1 > 4 > 5;;
 Cette expression est de type int,
mais est utilis�e avec le type bool.
(* Cette fois-ci, il faut parentheser car les priorit�s donnent :
((1+2)=(2+1)) > 4 donc true > 4 qui provoque une erreur de type *)


 1+2=2+1 > (4 > 5);;
 - : bool = true
 (* donne (3=3) > (4>5) donc true > false ce qui est vrai comme le prouve l'exemple suivant *)
 false < true;;
 (* L'ensemble des bool�ens (comme tous les types Caml) est donc un ensemble ordonn�. *)
 
4 + 1< 6 & (`a`<`h` or "debut"="fin");;
- : bool = true
(* en respectant les priorit�s :
((4+1) < 6) & (true or false)
= true & true
= true *)

(* Retenons de tout cela qu'il faut conna�tre les priorit�s, mais qu'en cas de doute, il ne faut pas h�siter � parenth�ser *)

(* Cha�nes de caract�res *)
 "salut";;
 - : string = "salut"
 
 (* ^ est l'op�rateur de concat�nation des cha�nes de caract�res *)
 "salut" ^ "� tous";;
 - : string = "salut� tous"
  
 "salut" ^ " � tous";;
 - : string = "salut � tous"
 
 "salut" < "bonjour";;
 - : bool = false
 (* Les cha�nes de caract�res sont ordonn�es dans l'ordre lexicographique (l'ordre du dictionnaire) *)
 
 "salut" < "Salut";;
 - : bool = false
 (* Rappelons que dans la table ASCII, les majuscules sont avant les minuscules *)
 
 "A" < "a";;
 - : bool = true
 `A` < `a`;;
 - : bool = true
 (* On rappelle que Caml Light, les caract�res s'�crivent � l'aide de l'apostrophe du 7 *)
 `a`;;
- : char = `a`
 
 int_of_char(`a`);;
 - : int = 97
 (* Donne le num�ro du caract�re dans la table ASCII *)
 
 `a`<`b`;;
 - : bool = true
 (* Les caract�res sont ordonn�es dans l'ordre de la table ASCII *)
 
 `a`<"bonjour";;
 Cette expression est de type string,
mais est utilis�e avec le type char.
(* On ne peut comparer un acarat�re avec une cha�ne **)

 "a"<"bonjour";;
  - : bool = true
  
 `a`^"pr�s";;
 Cette expression est de type char,
mais est utilis�e avec le type string.
 (* On ne peut concat�ner un caract�re et une cha�ne mais seulement deux cha�nes *)
 "a"^"pr�s";;
 - : string = "apr�s"
 
 "12">"2";;
- : bool = false
(* Ce sont des chaines et non des entiers, dans l'ordre lexicographique "12" est avant "2" car il commence par "1". *)




(* 3  Conversion de types 
Caml offre plusieurs fonctions permettant de convertir certaines valeurs d�un type dans un autre. La fonction int_of_float convertit par exemple un r�el en entier.
 Testez les fonctions de conversions des exemples suivants :  *)

int_of_float;;
- : float -> int = <fun>
(* a un r�el on associe un entier mais lequel ? La partie enti�re, la troncature, l'arrondi?*)  			
int_of_float(4.0);;	
- : int = 4
	
int_of_float(4.25);;
- : int = 4	
		
int_of_float(-4.25);;
- : int = -4
(* ce n'est pas la partie enti�re car E(-4.25) est le plus grand entier inf�rieur � -4.25 donc -5. On prend l'initiative d'ajouter un test car on ne peut encore distinguer entre trocature et arrondi *)
int_of_float(4.85);;
- : int = 4
(* Cette fois, plus de doute, ce n'est pas l'arrondi mais la simple troncature, obtenue � partir de x en lui enlevant ses d�cimales.*)
	
int_of_float(4.25e-34);;
- : int = 0

string_of_int(-235);;
- : string = "-235"
			
string_of_int(55e2);;
Cette expression est de type float,
mais est utilis�e avec le type int.
	
string_of_float(55e2);;	
- : string = "5500.0"
	
string_of_float(-55e-2);;
- : string = "-0.55"

int_of_string "345";;
- : int = 345
			
int_of_string "34.5";;
Exception non rattrap�e: Failure "int_of_string"
	
float_of_string "34.5";;
- : float = 34.5

float_of_string "99999999999999999999999.9";;
- : float = 1e+023


 (* 4  D�finitions globales et locales 

  Donner la valeur de chaque expression : *)

let x = 2 ;;
x : int = 2

let y = x+3 ;;
y : int = 5

let x = y+5 ;;
x : int = 10

(* A ce moment l'environnement est E=[(x,10), (y,5), (x,2)] *)

let z = y*2 in x+z+y*y;;
- : int = 45
(* 	1) �valuation de y*2 dans E  y*2 -> 10
	2) cr�ation d'un environnement temporaire 
         ET=[(z,10), (x,10), (y,5), (x,2)]
	3) �valuation dans ET de x+z+y*y ->10+10+5*5 -> 45
       C'est le r�sultat de l'�valuation
	4) destruction de ET et retour � l'environnement E *)	   

let x = 3 in x*x+2*x*y+4*y ;;
- : int = 59
(* 	1) �valuation de 3 dans E   -> 3
	2) cr�ation d'un environnement temporaire 
         ET=[(x,3), (x,10), (y,5), (x,2)]
	3) �valuation dans ET de x*x+2*x*y+4*y ->3*3+2*3*5 + 4*5 ->59
       C'est le r�sultat de l'�valuation
	4) destruction de ET et retour � l'environnement E *)
	
let x = 1 in x=2*x ;;
- : bool = false
(* 	1) �valuation de 1 dans E   -> 1
	2) cr�ation d'un environnement temporaire 
         ET=[(x,1), (x,10), (y,5), (x,2)]
	3) �valuation dans ET de x=2*x -> 1=2 -> false
       C'est le r�sultat de l'�valuation
	4) destruction de ET et retour � l'environnement E *)
	
let x = 0 in x=2*x;;
- : bool = true



(* Expressions utilisant des d�finitions locales embo�t�es.  Donner la valeur de chaque expression�: *)
 let x=5 in
	let prod = x*x in
		prod+prod*prod;;
- : int = 650
(* 	On repart de l'environnement E=[ ] 
	1) �valuation de 5 dans E   -> 5
	2) cr�ation d'un environnement temporaire 
         ET=[(x,5)]
	3) �valuation dans ET de let prod = x*x in prod+prod*prod;;
	    Il s'agit d'une d�finition locale, l'�valuation prend donc 4 �tapes :
				1) �valuation de x*x dans ET   -> 25
				2) cr�ation d'un environnement temporaire 
					 ET2=[(prod,25), (x,1)]
				3) �valuation dans ET2 de prod+prod*prod -> 25+625 -> 650
				   C'est le r�sultat de l'�valuation
				4) destruction de ET2 et retour � l'environnement ET	
	4) destruction de ET et retour � l'environnement E *)
(* Voila comment s'�value une imbrication de d�finitions locales, il suffit, � chaque �tape d'appliquer tranquillement la m�thode d'�valuation du cours *)

let resultat= let x=5 in
	let prod = x*x in
		prod +prod*prod;;
resultat : int = 650
(* C'est la m�me expression incluse dans la d�finition globale
let resultat=exp 
cela donnne la m�me �valuation mais modifie l'environnement :
E=[(resultat,650)] *)

let val= let x=3 and y=4 in
	let x=x+y and y=x-y in 
		x*x+y*y;;
val : int = 50

(* "and" permet de regrouper deux d�finitions locales : l'�valuation donne :
	1) 	�valuation de 3 dans E   -> 3
		�valuation de 4 dans E   -> 4
	2) cr�ation d'un environnement temporaire 
         ET=[(x,3), (y,4)]
	3) �valuation dans ET de "let x=x+y and y=x-y in x*x+y*y;;"
	    Il s'agit d'une d�finition locale, l'�valuation prend donc 4 �tapes :
				1) 	�valuation de x+y dans ET   -> 7
					�valuation de x-y dans ET   -> -1
				2) cr�ation d'un environnement temporaire 
					 ET2=[(x,7), (y,-1), (x,3), (y,4)]
				3) �valuation dans ET2 de x*x+y*y -> 49+1 -> 50
				   C'est le r�sultat de l'�valuation
				4) destruction de ET2 et retour � l'environnement ET	
	4) destruction de ET et retour � l'environnement E 
Cr�ation d'une liaison entre val et le r�sultat, on passe dans l'environnement
E2=[(val,50)] *)

	(* Attention : C'est une erreur classique que de confondre "and", qui permet de lier deux d�finitions, avec le "et logique" qui s'�crit &. Vous serez un peu moins d�butants en Caml quand vous ne la ferez plus...*)
	
let y=2 in val*val+2*val*y ;;
- : int = 2700
(* Sans surprise maintenant qu'on a compris *)


(*    Expressions conditionnelles. Donner le type et la valeur de chaque expression : *)
(* Rappel : l'�valuation du branchement conditionnel n�cessite deux �valuations :
1) celle de la condition
2) celle de l'expression1 si la condition vaut vrai et celle de l'expression 2 sinon *)


if (1=1) 
	then "salut" else "au revoir";;
- : string = "salut"
(* Le type du r�sultat est le type commun des deux expressions "salut" et "au revoir" donc string.
La condition est vrai, on �value donc la premi�re expression *)

let x= 3 in 
	if(x<0) then x else x*x;;
- : int = 9
(* 	1) �valuation de 3 dans E   -> 3
	2) cr�ation d'un environnement temporaire 
         ET=[(x,3)]
	3) �valuation dans ET de "if(x<0) then x else x*x"
			�valuation de (x<0) -> faux
			�valuation de x*x -> 9
		C'est le r�sultat de l'�valuation	
	4) destruction de ET et retour � l'environnement E *)

if (5>0) 
	then 1 else "erreur";;
Cette expression est de type string,
mais est utilis�e avec le type int.
(* les deux expressions doivent avoir m�me type *)


let x=3 and y=3 in
	let y=y*x in
		if y mod 2 = 0 then "pair"
		else "impair";;
- : string = "impair"
(* on a un branchement inclus dans deux d�finitions imbriqu�es...Prenons donc notre temps et appliquons les m�thodes :
	1) 	�valuation de 3 dans E   -> 3
		�valuation de 3 dans E   -> 3
	2) cr�ation d'un environnement temporaire 
         ET=[(x,3), (y,3)]
	3) �valuation dans ET de "let y=y*x in ..."
	    Il s'agit d'une d�finition locale, l'�valuation prend donc 4 �tapes :
				1) �valuation de x*y dans ET   -> 9
				2) cr�ation d'un environnement temporaire 
					 ET2=[ (y,9), (x,3), (y,3)]
				3) �valuation dans ET2 de "if y mod 2 = 0 then "pair" else "impair"
				   C'est un branchement donc deux �tapes :
						1) �valuation dans ET2 de 	y mod 2 = 0 ->
													9 mod 2 = 0 -> false
						2) �valuation de "impair" -> "impair"	
				4) destruction de ET2 et retour � l'environnement ET	
	4) destruction de ET et retour � l'environnement E *)
	
	(* Ce n'est pas plus difficile que �a...*)
