(* Programmation fonctionnelle Caml2
   Correction en Ocaml 
   Contr�le continu 18/02/14 *)



(* I. g�n�ralit�s sur les arbres de Huffman 
********************************************)
type langage = {alphabet:char list;fProba:char->float};;
let f a = match a with 
'h'->0.1
|' '->0.1
|'e'->0.2
|'o'->0.2
|'l'->0.4
|_->0.;;
(* f : char -> int = <fun> *)

let alpha=['h';' ';'e';'o';'l'];;
(* alpha : char list = ['h'; ' '; 'e'; 'o'; 'l'] *)

let lang ={alphabet=alpha;fProba=f};;
(* lang : langage = {alphabet = ['h'; ' '; 'e'; 'o'; 'l']; fProba = <fun>} *)

type feuille={car:char;proba:float};;

type arbreH=Feuille of feuille | Noeud of arbreH*float*arbreH;;
(* Le type arbreH est d�fini. *)


let test= Noeud
  (Feuille {car = 'l'; proba = 0.4}, 
  1.0,
   Noeud
    (Feuille {car = 'o'; proba = 0.2}, 0.6,
     Noeud (Noeud (Feuille {car = 'h'; proba = 0.1}, 0.2,
                   Feuille {car = ' '; proba = 0.1}),0.4, 
         
         Feuille {car = 'e'; proba = 0.2})));;



let probabilite arbre = match arbre with
  | Feuille{proba = b}-> b
  | Noeud (a,b,c) -> b;;
(*probabilite : arbreH -> float = <fun>*)
probabilite(test);;
(*- : float = 1.0*)
probabilite(Feuille {car = 'e'; proba = 0.2});;
(*- : float = 0.2*)
probabilite(Noeud
        (Feuille {car = 'h'; proba = 0.1}, 0.2,
         Feuille {car = ' '; proba = 0.1}));;
(*- : float = 0.2*)
(*

(* hauteur : arbreH -> int = <fun> 
hauteur(test);;
- : int = 4 *)


(* fusion : arbreH -> arbreH -> arbreH = <fun> 
fusion ( Noeud
        (Feuille {car = 'h'; proba = 0.1}, 0.2,
         Feuille {car = ' '; proba = 0.1}))  
        (Feuille {car = 'e'; proba = 0.2});;
- : arbreH =
 Noeud
  (Noeud
    (Feuille {car = 'h'; proba = 0.1}, 0.2, Feuille {car = ' '; proba = 0.1}),
   0.4, Feuille {car = 'e'; proba = 0.2})
*)


(* II. Construction d'un arbre de Huffman 
*********************************************)

(* listeFeuilles : langage -> arbreH list = <fun> 
let maListe=listeFeuilles(lang);;
maListe : arbreH list =
 [Feuille {car = 'h'; proba = 0.1}; Feuille {car = ' '; proba = 0.1};
  Feuille {car = 'e'; proba = 0.2}; Feuille {car = 'o'; proba = 0.2};
  Feuille {car = 'l'; proba = 0.4}] *)


(* insere : arbreH -> arbreH list -> arbreH list = <fun> *)


(*build : arbreH list -> arbreH = <fun>

build(maListe);;
- : arbreH =
 Noeud
  (Feuille {car = 'l'; proba = 0.4}, 1.0,
   Noeud
    (Feuille {car = 'o'; proba = 0.2}, 0.6,
     Noeud
      (Noeud
        (Feuille {car = 'h'; proba = 0.1}, 0.2,
         Feuille {car = ' '; proba = 0.1}),
       0.4, Feuille {car = 'e'; proba = 0.2})))
*)	 
	 

(*construitAH : langage -> arbreH = <fun>
construitAH(lang);;
- : arbreH =
 Noeud
  (Feuille {car = 'l'; proba = 0.4}, 
  1.0,
   Noeud
    (Feuille {car = 'o'; proba = 0.2}, 0.6,
     Noeud
      (Noeud
        (Feuille {car = 'h'; proba = 0.1}, 0.2,
         Feuille {car = ' '; proba = 0.1}),
       0.4, Feuille {car = 'e'; proba = 0.2})))
*)


(* Annexe   biblioth�que sur les cha�nes de caract�res
******************************************************)	 
let niemeCar (n,s) =
	nth_char s (n-1);;
let tetec a = match a with 
""-> failwith "La chaine est vide"
| s-> niemeCar(1,s);;
let longChaine s =
    string_length s;;
let sousChaine (s,n,m) =
if m<n then ""
else sub_string s (n-1) (m-n+1);;
let reste a = match a with
""-> failwith"La chaine est vide"
| s-> sousChaine (s,2,longChaine(s));;




(* III.  Codage de Huffman
****************************)


(*ajout : char -> ('a * string) list -> ('a * string) list = <fun>
ajout  '0' [('h',"101");('e',"11")] ;;
- : (char * string) list = ['h', "0101"; 'e', "011"] *)


(* codage : arbreH -> (char * string) list = <fun>

let monCode=codage(test);;
monCode : (char * string) list =
 ['l', "0"; 'o', "10"; 'h', "1100"; ' ', "1101"; 'e', "111"] *)

 
(*codeCar : 'a -> ('a * 'b) list -> 'b = <fun>
codeCar 'h' monCode;;
- : string = "1100" *)


(* codeText : (char * string) list -> string -> string = <fun>
codeText monCode "hello leo";;
- : string = "110011100101101011110" *)



(* IV. d�codage d'un texte
*****************************)

(* decodeCar : string -> arbreH -> char * string = <fun>
decodeCar "110011100101101011110" test;;
- : char * string = 'h', "11100101101011110" *)


(* decodeText : arbreH -> string -> string = <fun>
decodeText test "110011100101101011110";;
- : string = "hello leo"*)


*)