(* INU J-F. Champollion Albi
Double Licence Maths-Info	          	                
L1 Semestre 1					                                     
Programmation fonctionnelle en Caml	
TP 4 : Récursivité sur les nombres entiers *)

En ce qui concerne les fonctions récursives, il faut prendre les bonnes habitudes de méthode dès le début :

La première chose à faire est de chercher une "idée récursive" c'est-à-dire "comment ramener le problème au même problème sur une donnée plus petite?" On peut également se demander "est-ce que je saurais le faire si on me donnait la réponse pour une donnée plus petite?"
Il est parfois utilie de chercher ou d'exprimer cette idée à l'aide d''un exemple concret.

Retenez bien cela : Un programmeur récursif ne résout jamais un problème, il se contente de le ramener à un objet plus petit!

Quand on a l'idée récursive, on la fait tourner sur un ou deux exemples pour vérifier son fonctionnement.

On détermine alors seulement le cas de base, en cherchant vers quels cas notre idée récursive ramène tous les cas.
ATTENTION : C'est une erreur classique de méthode que de chercher d'abord à traiter à la main quelques cas simples avant même d'avoir une idée récursive. Par définition, le ou les cas de baes ne peuvent être déterminés qu'une fois l'idée récursive connue.

On distingue en général le cas récursif du ou des cas de base par filtrage.

Une fois programmée, on teste la fonction récursive sur les exemples étudiés en la traçant pour bien vérifier que le comportement obtenu est celui qu'on attend. 

 
Si vous souhaitez des compléménts d'explication sur un de ces corrigés, n'hésitez pas à poster une question sur le forum.

(* Exo 1 :  Puissance naïve
 **************************)
 
 L'idée est que x^n = x * x^(n-1) ce qui ramenera au cas de base x^0=1.
 
 
 
 let rec puiss = fun
 (_,0)->1  (* Cas de base *)
|(x,n)-> x*puiss(x,n-1) (* idée récursive *);;
puiss : int * int -> int = <fun>
 
trace "puiss";;
La fonction puiss est dorénavant tracée.
puiss <-- 2, 5
puiss <-- 2, 4
puiss <-- 2, 3
puiss <-- 2, 2
puiss <-- 2, 1
puiss <-- 2, 0
puiss --> 1
puiss --> 2
puiss --> 4
puiss --> 8
puiss --> 16
puiss --> 32
- : int = 32
 
 Cette fonction ne marche qu'avec les puissances positives, si on est inquiet, on peut le vérifier et exclure les puissances négatives :
 
 let puissance = fun (x,n) -> 
    if n<0 then failwith "Cette foncttion ne calcule que les puissances positives!"
    else puiss(x,n);;
puissance : int * int -> int = <fun>
 
puissance (2,-5);;
Exception non rattrapée: Failure "Cette foncttion ne calcule que les puissances positives!"

 
 (* Exo 2 :  
 **********)
 (* Repet *) : 5555 = 555*10 +5 donc l'idée récursive est
 repet(c,n)=repet(c,n-1)*10+c
 On se ramène à repet(c,1) qui vaut c ou repet (c,0) qui vaut 0.
 
 let rec repet = fun 
(c,1)->c
|(c,n)->repet(c,n-1)*10+c;;
repet : int * int -> int = <fun>

repet(5,4);;
repet <-- 5, 4
repet <-- 5, 3
repet <-- 5, 2
repet <-- 5, 1
repet --> 5
repet --> 55
repet --> 555
repet --> 5555
- : int = 5555
 
(* unChiffre *) : On se ramène à un nombre plus petit par le principe suivant 
555755 n'a que des 5 si 55575 n'a que des 5
55575  n'a que des 5 si 5557 n'a que des 5
en regardant son dernier chiffre, on peut affirmer que 5557 n'a pas que des 5

Si on arrive à 0 par division successives, c'est qu'il n'y avait que des 5.

let rec unChiffre = fun 
(0,c)-> true
|(n,c)-> let q = n/10 and r=n mod 10 in 
             if r<>c then false
             else unChiffre(q,c);;
unChiffre : int * int -> bool = <fun>

unChiffre(555755,5);;
unChiffre <-- 555755, 5
unChiffre <-- 55575, 5
unChiffre <-- 5557, 5
unChiffre --> false
unChiffre --> false
unChiffre --> false
- : bool = false
unChiffre <-- 5555, 5
unChiffre <-- 555, 5
unChiffre <-- 55, 5
unChiffre <-- 5, 5
unChiffre <-- 0, 5
unChiffre --> true
unChiffre --> true
unChiffre --> true
unChiffre --> true
unChiffre --> true
- : bool = true

(* pgd *)
Si d divise n c'est lui le plus grand, sinon on essaie à partir de d-1.
1 divisant tout le monde, on finit toujours par tomber sur un diviseur, il n'est donc pas utile ici de préciser le cas de base.

let rec pgd = fun 
(n,d)-> if n mod d = 0 then d else pgd(n,d-1);;
pgd : int * int -> int = <fun>

pgd(18,12);;
pgd <-- 18, 12
pgd <-- 18, 11
pgd <-- 18, 10
pgd <-- 18, 9
pgd --> 9
pgd --> 9
pgd --> 9
pgd --> 9
- : int = 9
pgd <-- 7, 6
pgd <-- 7, 5
pgd <-- 7, 4
pgd <-- 7, 3
pgd <-- 7, 2
pgd <-- 7, 1
pgd --> 1
pgd --> 1
pgd --> 1
pgd --> 1
pgd --> 1
pgd --> 1
- : int = 1

(* nbPairChif *)
Première idée : On se ramène à un nombre plus petit en enlevant deux chiffres (ce qui conserve la parité) :
123456 -> 1234->12->0
12345 ->123->1
Le cas de base est alors celui des nombres à 1 chiffre. Il y a un nombre pair de chiffres initialement si on obtient 0.

Un nombre n'a qu'un chiffre ssi n/10=0

let rec nbPairChif = fun n->
 let q = n/10 in 
     if q=0 then (* cas de base des nombres à un chiffre *)
            n=0 (* vrai si n est nul et faux sinon *)
     else
     let q=q/10  (* n a enlevé deux chiffres à n *)
         in nbPairChif(q);;
nbPairChif : int -> bool = <fun>

nbPairChif <-- 654321
nbPairChif <-- 6543
nbPairChif <-- 65
nbPairChif <-- 0
nbPairChif --> true
nbPairChif --> true
nbPairChif --> true
nbPairChif --> true
- : bool = true
nbPairChif <-- 65432
nbPairChif <-- 654
nbPairChif <-- 6
nbPairChif --> false
nbPairChif --> false
nbPairChif --> false
- : bool = false

Une autre idée est de dire que la parité change quand on enlève un chiffre. Et on connaît la parité des nombres à un chiffre qui restent le cas de base.

let rec nbPairChif = fun n->
   let q = n/10 in 
       if q = 0 then false
       else not(nbPairChif(q));;
nbPairChif : int -> bool = <fun>

nbPairChif(12345);;
nbPairChif <-- 12345
nbPairChif <-- 1234
nbPairChif <-- 123
nbPairChif <-- 12
nbPairChif <-- 1
nbPairChif --> false
nbPairChif --> true
nbPairChif --> false
nbPairChif --> true
nbPairChif --> false
- : bool = false

(* Exo 3 :  la miltiplication egyptienne
 ***************************************)
Remarquons que la récursivité porte sur n et non sur p. L'idée est donnée par l'énoncé et permet au scribe egyptien de se ramener à une multiplication par n=1 qui est le cas de base.


let rec mult_egypt = fun 
(1,p)-> p
|(n,p)-> if n mod 2 = 0 (* cas n pair *)
        then mult_egypt (n/2,p+p)
        else p+ mult_egypt(n-1,p);;
mult_egypt : int * int -> int = <fun>
 
On remarque bien que cette méthode n'utilise que des additions et des partages en deux qui étaient les deux opérations élémentaires du scribe égyptien.
mult_egypt <-- 19, 5
mult_egypt <-- 18, 5
mult_egypt <-- 9, 10
mult_egypt <-- 8, 10
mult_egypt <-- 4, 20
mult_egypt <-- 2, 40
mult_egypt <-- 1, 80
mult_egypt --> 80
mult_egypt --> 80
mult_egypt --> 80
mult_egypt --> 80
mult_egypt --> 90
mult_egypt --> 90
mult_egypt --> 95
- : int = 95
mult_egypt <-- 59, 17
mult_egypt <-- 58, 17
mult_egypt <-- 29, 34
mult_egypt <-- 28, 34
mult_egypt <-- 14, 68
mult_egypt <-- 7, 136
mult_egypt <-- 6, 136
mult_egypt <-- 3, 272
mult_egypt <-- 2, 272
mult_egypt <-- 1, 544
mult_egypt --> 544
mult_egypt --> 544
mult_egypt --> 816
mult_egypt --> 816
mult_egypt --> 952
mult_egypt --> 952
mult_egypt --> 952
mult_egypt --> 986
mult_egypt --> 986
mult_egypt --> 1003
- : int = 1003


(* Exo 4 :  Somme de Chiffres
 ***************************************)
L'idée réccursive est simple : 
La somme des chiffres de 45634 est la somme des chiffres de 4563 plus 4. Le cas de base est 0 dont la somme des chiffres vaut 0.
let rec s_chif = fun
0->0
| n-> s_chif(n/10)+ n mod 10;;
s_chif : int -> int = <fun>
s_chif (302091);;
s_chif <-- 302091
s_chif <-- 30209
s_chif <-- 3020
s_chif <-- 302
s_chif <-- 30
s_chif <-- 3
s_chif <-- 0
s_chif --> 0
s_chif --> 3
s_chif --> 3
s_chif --> 5
s_chif --> 5
s_chif --> 14
s_chif --> 15
- : int = 15


l'idée est que som_chif (302091) se ramène à som_chif(15)
Le cas de base est celui des nombres à un chiffre.

let rec som_chif = fun n-> 
       if n/10=0 then n
       else som_chif(s_chif(n));;

som_chif : int -> int = <fun>

som_chif <-- 302091
som_chif <-- 15
som_chif <-- 6
som_chif --> 6
som_chif --> 6
som_chif --> 6
- : int = 6
som_chif <-- 18925
som_chif <-- 25
som_chif <-- 7
som_chif --> 7
som_chif --> 7
som_chif --> 7
- : int = 7



 

.
