(* 
*
* @author : Duzes Florian
* @date : 16/02/2022
*
*


Implantation de l'Unification 

__________
Exercice 1 *)


type term = Var of string
            | Appl of string * term list
;;


let x = Var "X";;
let y = Var "Y";;
let f = Appl ("f"  ,[x ; y] );;

let k = Appl ("k", [Var "X"; Appl ("g", [Var "Z"])]);;
let g = Appl ("g", [ Appl("a", [] ) ]);;

let h = Appl ("h", [Appl( "f" , [Var "X"]) ; Appl ("h", [Var "Y" ; Var "Z"])]);;

let i = Appl("i", [Var "X"; Var "X"]);;


let rec applique f liste = match liste with
    | a::b -> (f a )@(applique f b)
    | [] -> []
;;
(*val applique : ('a -> 'b list) -> 'a list -> 'b list = <fun>*)

let rec appartient = function 
    (a,b::l)-> if a=b then true else appartient(a,l)
    |(_,[])-> false
;;
(*appartient : 'a * 'a list -> bool = <fun>*)
let rec union l = function 
    (a::l2)-> if appartient(a,l) then union l l2 else a:: (union l l2)
    | []->l
;;
(* union : 'a list -> 'a list -> 'a list = <fun> *)

let rec fv terme = 

    let rec fvAux liste = match liste with
        |[] -> []
        |a::b -> union (fv a) (fvAux b)
        
        
    in 
    match terme with
    | Var a -> [a]
    | Appl(_ ,liste) -> fvAux liste
    
;;
(*val fv : term -> string list = <fun>*)



List.map fv [x; y; f; k; g; h; i];;

(*
__________
Exercice 2 *)

(* [X ← f (Y ), Y ← g(a)]*)

let sub2 = ( "Y", Appl ("g", [ Appl("a", [] ) ]));;

let rec lookup cle liste = match liste with
    | a::b -> if a = cle then a
                              else lookup cle b
    | [] -> cle;;



let rec subst terme substitution = 
    
    let rec substAux liste = match liste with
        |[] -> []
        |a::b -> (subst a substitution)@ (substAux b)

    in
    match terme with
    | Var a -> [lookup (Var a) substitution]
    | Appl ( _ , liste) -> substAux liste 
                
;;

 let rec subst (chgt,cible) terme = match terme with
    | Var a -> if chgt = a then cible else Var a 
    | Appl( f, arg) -> Appl(f, List.map(subst (chgt,cible)) arg)
;;


let test = Appl("f", [Appl( "g" , [Appl("a", [] )]) ; Appl ("h", [Var "Y" ; Var "X"])]);;

subst sub2 g;;
subst sub2 test;;