let f x = x+2;;
f 3;;

let rec longueur l = match l with
    | x::q -> 1 + longueur(q)
    |_->0;;
    
longueur [1;3;4;4;1;1;1;1;2;2;2];;

let egal = fun (x,y) -> x = y;;
let egal x y = x=y;;
let egal (x, y) = x=y;;
let egal ((x : int), (y:int)) =  x=y;;

let fois_n n m = n*m;;
let fois_n = fun n -> (fun m -> n*m);;

let double m = fois_n 2 m ;;
double 3;;

let divx f a = match a with 
    |0. -> failwith "x est nul"
    | x -> (f x) /.x;;

divx sin;;
divx sin 0.1;;
let divsin a = divx sin a;;
divsin 0.1;;

let rec sigma f n = match n with
    | 0 -> f(0)
    | n -> f(n) + sigma f (n-1);;
    
type expression = Const of int | Var of char | Add of expression*expression | Mult of expression*expression | Puiss of expression*int;;

let e1 = Add (Const 1 , Mult (Const 2, Puiss ( Var 'x', 3) ) );;
let e2 = Add (Const 1 , Puiss ( Var 'a', 2) );;

type liaison = {id : char; valeur : int};;

let envC = [{id='a'; valeur=3};{id='b'; valeur=4}];;
