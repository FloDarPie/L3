(* Trie naif*)

let rec min liste = match liste with
    |tete::cou::corps -> if tete < cou
                            then min (tete::corps)
                            else min (cou::corps)
    |a::[] -> a
    |_ ->  failwith "err" ;;

min [1;2;3;5;8;5;0];;


let enleve (elem, liste) = 
    let rec enleve (elem, liste , bool) = match liste with
        | tete::corps -> if tete = elem && bool
                            then enleve (elem, corps, false)
                            else tete::(enleve (elem ,corps, bool))
        | [] -> []
    in 
enleve (elem, liste, true)
;;

let enleve (elem, liste) = 
    match liste with
        | tete::corps -> if tete = elem 
                            then corps
                            else tete::enleve (elem ,corps)
        | [] -> []

;;



enleve (4 ,
    [4;5;8;3;4;2]);;


let rec naif liste = 
    match liste with
    |[] -> []
    | corps -> (min corps):: naif (enleve (min corps, corps))
    ;;


naif [4;3;8;6;2;2;3;7;];;





(* Tri par insertion *)

let rec insertion a liste = match liste with
    | tete::corps when tete<a -> tete::insertion a corps
    | corps -> a::corps;;

insertion 5 [1;2;3;8;9;10];;

let rec tri_insere liste = match liste with
    | [a] -> [a]
    | tete :: corps -> insertion tete (tri_insere corps)
    | _ -> failwith "bip bop";;

tri_insere [6;5;9;5;1;15;3;435;468;486];;

(* tri par fusion

    -> c'est "diviser pour regner"
 *)


 let rec divise liste = match liste with
    | [] -> [],[]
    | [a] -> [a], []
    | tete::cou::corps -> 
                let l1, l2 = divise corps in
                tete::l1,cou::l2;;

divise [1];;
divise [1;2;3;5;8;9;3;5;69];;

let rec fusion (l1, l2) = match l1, l2 with
    (*|[],[] -> []*)
    |cuerpo,[] -> cuerpo
    |[],cuerpo -> cuerpo
    |mains::corps, mano::cuerpo when mains < mano -> mains ::fusion(corps, mano::cuerpo)
    |corps, mano::cuerpo -> mano::fusion(corps, cuerpo)


;;

fusion ([1;2;4;8;8;9] ,[2;3;4;5;6;7;8;9]);;

let rec tri_fusion liste = match liste with
    | [] -> []
    | [a] -> [a]
    | lista -> let izquierda, derecha = divise lista in
                fusion(tri_fusion izquierda, tri_fusion derecha);;

tri_fusion [87;45;53;354;354;21;00;90;1;2;3;5;65;62;63;45];;
tri_fusion [813;18;4;8641;48;4;4;65;456];;




(*Tri a bulle*)

let rec parcours liste balise = 

    let balise = balise in

    match liste with
    | [] -> [],balise
    | [a] -> [a], balise
    | cabeza :: cuello :: cuerpo  when cabeza <= cuello -> 
            let liste,balise = (parcours (cuello::cuerpo) balise) in
               cabeza:: liste, balise
                                    
    | cabeza :: cuello :: cuerpo -> 
            let liste,balise = (parcours (cabeza::cuerpo) balise )in
               cuello :: liste, true


;;

parcours [4;2;6;8;65848;454;8;3;9;01;10;47;23] false ;;


let tri_bulle liste = 

let rec tri_bulleAux liste boolean  = match boolean with
    | true -> 
    
    let liste, boolean = parcours liste false in
            tri_bulleAux liste boolean 
    
    | false -> liste

    in

    
    let liste, boolean = parcours liste false in
tri_bulleAux liste boolean;;


tri_bulle [1];;

tri_bulle [];;

tri_bulle [1;2];;
tri_bulle [2;1];;


tri_bulle [4;2;6;8;3;7;89;456;09;1234;98;34;33;678];;
tri_bulle [3;5;6;6];;





(*Exercice 4*)
