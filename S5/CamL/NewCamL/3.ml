(*1- Quelques fonctions sur les nombres*)
let troncature x = int_of_float x;;
troncature 4.2;;
troncature (-4.2);;
(*
#   val troncature : float -> int = <fun>
# - : int = 4
# - : int = -4*)
let decimales x = abs_float(x-.float_of_int(int_of_float x));;
decimales 4.2;;
decimales (-4.324);;
(*
# * *   val decimales : float -> float = <fun>
# - : float = 0.200000000000000178
# - : float = 0.323999999999999844
*)
let partie_entiere = fun x -> 
    let a = troncature x in
    if x-.float_of_int a >= 0. 
        then a
        else a - 1;;

partie_entiere 5.3;;
partie_entiere (-3.0);;
partie_entiere (-2.2);;
(*
# * * * *           val partie_entiere : float -> int = <fun>
#   - : int = 5
# - : int = -3
# - : int = -3
*)
let plus_proche_entier = fun x ->
    partie_entiere(x +. 0.5);;


plus_proche_entier(-6.6);;
plus_proche_entier(-6.4);;
plus_proche_entier 4.5;;
(*
# * * * * *     val plus_proche_entier : float -> int = <fun>
#     - : int = -7
# - : int = -6
# - : int = 5
*)
let arrondi = fun x ->
    float_of_int(plus_proche_entier( x *. 1E2))/.1E2;;

arrondi 52.324432;;
arrondi (-3.455);;
(*
# * * * * *       val arrondi : float -> float = <fun>
#   - : float = 52.32
# - : float = -3.45
*)

(*2- Conversion francs-euros*)
let francs_en_euros = fun x ->
    arrondi (x /. 6.55957);;
    
francs_en_euros 456778.;;
(*
# * * * *         val francs_en_euros : float -> float = <fun>
#   - : float = 69635.36
*)

(*3- Qu'elle heure est-il ?*)
let heure = fun x -> troncature x;;
let minutes = fun x -> int_of_float((decimales x)*.1E2);;
(*
# val heure : float -> int = <fun>
# val minutes : float -> int = <fun>
*)
let quelle_heure_est_il = fun x -> 

        let mx = minutes x and hx = heure x in
        
        let m = 
            if mx = 0 then "pile"
                else
            if mx = 15 then "et quart"
                else
            if mx = 30 then "et demi"
                else
            if mx = 45 then "moins le quart" 
                else string_of_int mx^" minutes"
            and
            let h = 
            if hx = 0 then "minuit "
                else
            if hx = 12 then "midi "
                else string_of_int hx ^" heures " 
        in 
            "Il est "^h^m;;
(*
#val quelle_heure_est_il : float -> string = <fun>
*)
quelle_heure_est_il(13.30);;
quelle_heure_est_il(12.00);;
quelle_heure_est_il(8.455);;



(*Exercice C*)



