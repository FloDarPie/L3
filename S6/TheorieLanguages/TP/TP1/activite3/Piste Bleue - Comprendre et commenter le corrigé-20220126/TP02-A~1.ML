
(*		TP n°2 - Automate fini déterministe			*)
		
type etat = {accept : bool ; t : char -> int} ;;		(* type etat = { accept : bool; t : char -> int; } *)


type afd = {sigma : char list ; nQ : int ; init : int ; e : int -> etat} ;;

(* automate exemple a2 *)
let a2 = {sigma= ['a';'b'] ; nQ = 3; init = 1 ; 
			e = function	
			    1 -> {accept = false ;
				      t = function 
					       'a'->2 }
				|2 -> {accept = false ;
				      t = function 
					       'a'->2
						   |'b'-> 3  }		   
				|3 -> {accept = true ;
				      t = function 
					       'a'->3
						   |'b'->3   }		   				
		};;

(* On définit une exception *)		
exception  PasTransition ;;

(* et une fonction de transition levant cette exception *)
let transit = fun (aut, i, c) ->
	try (aut.e(i)).t(c) 
	with Match_failure _-> raise PasTransition;;		
		
		
(* La fonction complete à tester, comprendre et commenter *)
let complete = fun aut -> 
    let rec aux = function 
       (0,_,aut2)-> aut2                           
      |(i,[],aut2)-> aux(i-1,aut.sigma,aut2)       
      |(i,c::r,aut2)-> try 
                           let k = transit(aut,i,c)  in aux(i,r,aut2)
                     with pasTransition -> let n = aut.nQ in
										   let f = function 
												car-> if car = c then n+1
														else transit(aut2,i,car)   in 
										   let tt = function 
												j->  if j = i then {accept = (aut2.e(i)).accept ; t=f}
															  else if j = (n+1) then let g = function
																							c -> n+1 in 
																						{accept = false ; t=g}
																	else aut2.e(j) in 
											let aut3 = {sigma=aut2.sigma; nQ=n+1; init = aut2.init ; e=tt}
                                        in aux(i,r,aut3)
    in aux(aut.nQ,aut.sigma,aut);;

let a3 = complete a2 ;;

let et1 = a3.e(1) ;;

et1.t('b') ;;