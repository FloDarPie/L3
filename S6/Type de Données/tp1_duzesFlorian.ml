(* 
*
* @author : Duzes Florian
* @date : 08/02/2022
*
*


Représentation De Caml en Caml *)

type base_tp = BoolT | IntT ;;
type tp = ConsT of base_tp | FunT of tp * tp ;;


FunT (ConsT IntT, ConsT BoolT) ;;

(*1*)

FunT (ConsT IntT, FunT (ConsT BoolT, ConsT IntT) ) ;;


(*2*)

FunT ( FunT (ConsT IntT, ConsT BoolT ) , ConsT IntT ) ;;


(*3*)

FunT ( FunT (ConsT IntT, ConsT IntT) ,  FunT (ConsT IntT, ConsT IntT) ) ;;



(*Excercice 2 : Représentation d'expression*)

type const_expr = BoolE of bool | IntE of int;;

type expr = Const of const_expr | Var of string | Abs of string * tp * expr | App of expr * expr;;


App ( Abs ( "x", ConsT IntT, Var "x"), Const (IntE 2) );;

(*1*)

App (App ( Abs ( "x", ConsT IntT, Var "x"), Const (IntE 2) ) , Const (IntE 3));;


(*2*)

App (App ( Abs ( "x", ConsT IntT, Abs (  "y", ConsT BoolT, Var "y") ), Const (IntE 2) ), Const (IntE 3) );;


(*3*)

App (App ( Abs ( "f", FunT (ConsT IntT, ConsT BoolT), Var "f") , Const (IntE 2)),App (Abs ( "x" , ConsT IntT, Var "x") , Const (BoolE true) ));;


(*Exercice 3 : Affichage de Types*)


let rec string_of_type typeA = match typeA with
    | FunT (a, b) -> "("^(string_of_type a)^" -> "^(string_of_type b)^")"
    | ConsT BoolT -> "Bool"
    | ConsT IntT -> "Int" ;;
    
    
let exemple = FunT (ConsT IntT, ConsT BoolT) ;;
let exo11 = FunT (ConsT IntT, FunT (ConsT BoolT, ConsT IntT) ) ;;
let exo12 = FunT ( FunT (ConsT IntT, ConsT BoolT ) , ConsT IntT ) ;;
let exo13 = FunT ( FunT (ConsT IntT, ConsT IntT) ,  FunT (ConsT IntT, ConsT IntT) ) ;;

string_of_type exemple;;
string_of_type exo11;;
string_of_type exo12;;
string_of_type exo13;;

let rec string_of_expr exprA = match exprA with
    | App (a,b) -> "("^string_of_expr(a)^string_of_expr(b)^")"
    | Abs (a,b,c) -> "fun ("^a^" : "^string_of_type(b)^" -> "^string_of_expr(c)^") "
    | Var a -> a
    | Const BoolE a -> string_of_bool(a)
    | Const IntE b ->  string_of_int(b);;
    
let e = App ( Abs ( "x", ConsT IntT, Var "x"), Const (IntE 2) );;
string_of_expr(e);;
let e = App (App ( Abs ( "x", ConsT IntT, Var "x"), Const (IntE 2) ) , Const (IntE 3));;
string_of_expr(e);;
let e = App (App ( Abs ( "x", ConsT IntT, Abs (  "y", ConsT BoolT, Var "y") ), Const (IntE 2) ), Const (IntE 3) );;
string_of_expr(e);;
let e = App (App ( Abs ( "f", FunT (ConsT IntT, ConsT BoolT), Var "f") , Const (IntE 2)),App (Abs ( "x" , ConsT IntT, Var "x") , Const (BoolE true) ));;
string_of_expr(e);;


(*Partie 2, Interlude : Liste d'association et maps*)

type 'a option = None | Some of 'a;;
let liste = [("Max", 10); ("Nicolas", 4); ("Nicole", 9)];;

(*Liste d'association*)
let rec lookup_assoc cle liste = match liste with
    | (a,b)::c -> if a = cle then Some b
                              else lookup_assoc cle c
    | [] -> None;;

lookup_assoc "Max" liste;;
lookup_assoc "Nico" liste;;

let add_assoc cle valeur liste = (cle,valeur)::liste;;
add_assoc "Martin" 100 liste;;

let rec remove_assoc cle liste = match liste with
    | (a,b)::c -> if a = cle then remove_assoc cle c
                             else (a,b)::(remove_assoc cle c)
    | [] -> [];;
remove_assoc "Martin" liste;;

lookup_assoc "k" (add_assoc "k" 3 liste) = Some 3;;

(*MAP*)
(*
type (’k, ’v) map = ’k -> ’v option;;

Exercice 6 --*)

module Mymap = Map.Make(String);;

let lookup_map cle map = Mymap.find cle map;;

let add_map cle valeur map = Mymap.add cle valeur map;;

let remove_map cle valeur map = Mymap.remove cle map;;


let empty_map = 
        let map = Mymap.empty
 in map ;;
 
 
let assoc2map liste = 
    let map = empty_map in
        let rec ajout liste map = match liste with 
        | (a,b)::c -> ajout c (add_map a b map)
        |_ -> map
    in ajout liste map
;;


lookup_map "Nicole" (assoc2map [("Max",10);("Nicolas",4);("Nicole",9)]);;



type ('k, 'v) map = 'k -> 'v option;;

let mymap:(string,int) map = function
    "Max" -> Some 10
    |"Nicolas" -> Some 4
    |"Nicole" -> Some 9
    |_ -> None;;

let lookup_map cle map = map cle;;
lookup_map "Max" mymap;;
lookup_map "Maxime" mymap;;

let add_map cle valeur map = fun cle2 -> if cle2=cle then Some valeur else map cle2;;

let map2 = add_map "Jo" 24 mymap;;
lookup_map "Jo" map2;;
lookup_map "Max" map2;;

let remove_map cle map = fun cle2 -> if cle2 = cle then None else map cle2;;

let map3 = remove_map "Jo" map2;;
lookup_map "Jo" map3;;
lookup_map "Nicole" map3;;

let empty_map = fun _ -> None;;

let map4 = empty_map;;
let map5 = add_map "Nico" 10 map4;;
lookup_map "Nico" map5;;

let assoc2map liste = 
    let map = empty_map in
    let rec rempli map liste = match liste with
        |(a,b)::c -> rempli (add_map a b map) c
        |_ -> map
    in rempli map liste
;;

lookup_map "Nicole" (assoc2map [("Max",10);("Nicolas",4);("Nicole",9)]);;


(*Exercice 7 --

Règle de typage élémentaires
*)
(*
type const_expr2 = BoolE of bool | IntE of int;;
type expr2 = Const of const_expr | Var of string | Abs of string * tp * expr | App of expr * expr;;

type base_tp2 = BoolT | IntT ;;
type tp2 = ConsT of base_tp2 | FunT of tp2 * tp2 ;;
*)

exception Failure;;

let rec recherche var environnement = match environnement with
    | (a,b)::liste -> if var = a then b else recherche var liste
    | [] -> raise Failure
;;

let renvoie = function
    | BoolE _ -> ConsT BoolT
    | IntE _ -> ConsT IntT
;;


let analyse tpa tpb = match tpa,tpb with
    | (FunT (a,b) , c) -> if a = c then b else raise Failure
    | ( _ ) -> raise Failure

;;



let rec tp_of_expr environnement expression = match expression with
    
    | App (a , b) -> analyse ( tp_of_expr environnement a ) ( tp_of_expr environnement b )
    
    | Abs (x,a,ex) -> 
                let b = tp_of_expr ((x,a)::environnement) ex in FunT (a, b)
    
    | Var a -> recherche a environnement
    | Const constante -> renvoie constante
    
;;

tp_of_expr [] (Abs ("x", ConsT IntT, Var "x")) ;;
tp_of_expr [] (Var "x") ;;
tp_of_expr [("x", ConsT IntT)] (Var "x") ;;

(*exemple cours*)
tp_of_expr [] (App (Abs ("x", ConsT IntT, Var "x"), Const (IntE 2))) ;;
tp_of_expr [] (App (Abs ("x", ConsT IntT, Var "x"), Const (BoolE true))) ;;
tp_of_expr [] (App (Abs ("x", ConsT BoolT, Var "x"), Const (BoolE true))) ;;


tp_of_expr [] ( 
App (App ( Abs ( "x", ConsT IntT, Var "x"), Const (IntE 2) ) , Const (IntE 3))
    )
;;

(**********************************************************************************)
(* Exercice 8 -
*)
let _ = print_string "Exercice 8";;


type expr_paire = ConstP of const_expr |
                VarP of string |
                AbsP of string * tp * expr |
                AppP of expr * expr |
                Paire of const_expr * const_expr;;


type tp_paire = ConsTP of base_tp | FunTP of tp * tp | PaireT of base_tp * base_tp ;;

(*
let rec string_of_typeP typeA = match typeA with
    | PaireT (a,b) -> "("^(string_of_typeP a)^","^(string_of_typeP b)^")"
    | FunTP (a, b) -> "("^(string_of_typeP a)^" -> "^(string_of_typeP b)^")"
    | ConsTP BoolT -> "Bool"
    | ConsTP IntT -> "Int" ;;


let rec string_of_expr exprA = match exprA with
    | Paire (a,b) -> "("^(string_of_expr a)^","^(string_of_expr b)^")"
    | AppP (a,b) -> "("^string_of_expr(a)^string_of_expr(b)^")"
    | AbsP (a,b,c) -> "fun ("^a^" : "^string_of_type(b)^" -> "^string_of_expr(c)^") "
    | VarP a -> a
    | ConstP BoolE a -> string_of_bool(a)
    | ConstP IntE b ->  string_of_int(b);;
    
let rec tp_of_expr environnement expression = match expression with
    
    | App (a , b) -> analyse ( tp_of_expr environnement a ) ( tp_of_expr environnement b )
    
    | Abs (x,a,ex) -> 
                let b = tp_of_expr ((x,a)::environnement) ex in FunT (a, b)
    
    | Var a -> recherche a environnement
    | Const constante -> renvoie constante
    
    
;;*)
