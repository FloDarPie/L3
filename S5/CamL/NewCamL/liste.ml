let fibo n = 
    let rec fibonnaci (a,b,n) = match n with
        0 -> []
        |_ -> a+b::fibonnaci (b,a+b,n-1)
        in

    match n with    
    0 -> failwith "pas de taille 0"
    |1 -> [1]
    |_ -> 1::1::fibonnaci(1,1,n-2);;


fibo 1;;
fibo 2;;
fibo 3;;
fibo 6;;
fibo 8;;


let rec estCroissante l = match l with
    [] -> true
    |[e] -> true
    |a::b::queue -> a<=b && estCroissante (b::queue);;
    
estCroissante [1;2;3;4;5];;
estCroissante [1;2;3;5;4];;
estCroissante [1;2];;
estCroissante [2;1];;

let rec fusion (a, b) = match (a,b) with
    |(tete::corps,head::body) -> if tete<head
                                    then tete:: fusion(corps,head::body)
                                    else head:: fusion(tete::corps,body)
                                    
    |([],a) -> a
    |(a,[]) -> a;;
    
    
fusion ([1;2;3], [1;2;3]);;
fusion ([2;4;6], [1;2;3]);;
fusion ([1] ,[1;2;3]);;
fusion ([1;2], [1]);;


let eratosthene n = 

    let generer n =
        let rec generer (n, u)  = match (n,u) with
            (2,u) -> [u]
            |(n,u) -> u::generer (n-1, u+1)
            
        in
    generer (n, 2)
    
    
    
    in
    
    
    generer n;;
eratosthene 7;;


