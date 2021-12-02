type point = {abs : float ;ord : float};;

let p1 = {abs = 0.0; ord = 0.0}
and p2 = {abs = 2.0; ord = 0.0}
and p3 = {abs = 1.0; ord = 2.0}
and p4 = {abs = 0.0; ord = 1.0};;

type forme = Cercle of point*float | Polygone of point list;;

let p = Polygone [p1;p2;p3;p4;p1];;

let dis(premierPoint, secondPoint) = 
    abs premierPoint
;;



let dico = [
    ("a","un");
    ("called","appelé");
    ("cat","chat");
    ("hand","main");
    ("is","est");
    ("language","langage");
    ("my","mon");
    ("us","notre")
];;
exception PasTrouve;;


let rec trouve a dico = match dico with
        |(un,deux)::corps -> if un = a then deux 
                                    else trouve a corps
        | _ -> raise PasTrouve
;;
trouve "cat" dico;;
trouve "dog" dico;;

let traduire a = trouve a dico;;
traduire "cat";;
traduire "dog";;




