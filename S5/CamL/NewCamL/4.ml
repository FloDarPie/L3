(*Exercice TD A*)

let f n = match n with
0 -> 1
|n -> 2*n -3 ;;


let f x=  match x with
    (0,_)-> 0
    |(_,0) -> 5
    |(1,x) -> x+50
    |(x,1) -> x+35
    | _ -> 3;;
    
f(0,1);;
f(1,0);;
f(1,4);;
f(4,1);;
f(25,5);;
