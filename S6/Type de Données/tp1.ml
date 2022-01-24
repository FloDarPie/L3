(* Représentation De Caml en Caml *)

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

type (’k, ’v) map = ’k -> ’v option;;
