let rec linear terme = 
    
    let rec etudi motif liste = match liste with
        | tete::corps -> if motif = tete 
                                then etudi motif corps 
                                else false
        | [] -> true
    in
    
    let rec verif liste = match liste with
        | tete::corps -> if etudi a corps 
                                then verif corps 
                                else false
        | [] -> true
    in
    
    match terme with
        | Var a -> a
        | Appl(_,liste) -> verif List.map (linear ,liste)
;;



(*
List.map (linear ,liste)
    => 'linear' sur chaque element de liste
    
verif [a;b;c;d;e;f;g;h;i]
    => 'verif' regarde l'unicite des éléments dans la liste
    *)
