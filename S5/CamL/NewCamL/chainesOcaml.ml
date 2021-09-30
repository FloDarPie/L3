let longChaine s =
    String.length s
;;
(* val longChaine : string -> int = <fun> *)

(* flemme de faire des tests *)


let niemeCar (n, s) =
    String.get s (n - 1)
;;
(* val niemeCar : int * string -> char = <fun> *)

(* flemme de faire des tests *)


let sousChaine (s, n, m) =
    if m < n then
        ""
    else
        String.sub s (n - 1) (m - n + 1)
;;
(* val sousChaine : string * int * int -> string = <fun> *)

sousChaine ("coucou, comment ca va?", 4, 6);;
(* - : string = "cou" *)
sousChaine ("coucou, comment ca va?", 4, 2);;
(* - : string = "" *)
sousChaine ("coucou, comment ca va?", 4, -2);;
(* - : string = "" *)

(* sousChaine ("coucou, comment ca va?", 0, 0);; *)
(* Exception: Invalid_argument "String.sub / Bytes.sub". *)


let tetec s =
    match s with
    | "" -> failwith "la chaine est vide"
    | s -> niemeCar (1, s)
;;
(* val tetec : string -> char = <fun> *)

(* flemme de faire des tests *)


let tetes s =
    Char.escaped (tetec s)
;;
(* val tetes : string -> string = <fun> *)

(* flemme de faire des tests *)


let reste s =
    match s with
    | "" -> failwith "la chaine est vide"
    | s -> sousChaine (s, 2, longChaine(s))
;;
(* val reste : string -> string = <fun> *)

reste "coucou";;
(* - : string = "oucou" *)
