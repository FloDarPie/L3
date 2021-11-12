(* DLMI     Programmation Caml	 CC2	décembre 2019 *)


(* Première partie *)

let enterprise = ["dupont";"durand";"martin"];;
(* enterprise : string list = ["dupont"; "durand"; "martin"] *)

let rec nombre = fun
| (a::b) -> 1 + nombre b
| _ -> 0;;
(* nombre : 'a list -> int = <fun> *)

nombre enterprise;;
(* - : int = 3 *)

let rec present = fun
| (a, b::c) -> a = b || present(a, c)
| _ -> false;;
(* present : 'a * 'a list -> bool = <fun> *)

present("montaut",enterprise);;
(* - : bool = false *)
present("martin",enterprise);;
(* - : bool = true *)

let rec embauche = fun
| (a, b::c) when b <= a -> b::embauche(a, c)
| (a, c) -> a::c;;
(* embauche : 'a * 'a list -> 'a list = <fun> *)

embauche("dupuis",enterprise);;
(* - : string list = ["dupont"; "dupuis"; "durand"; "martin"] *)


(* Deuxième partie *)
let enterprise = [("dupont",[22;25],[3]);("durand",[24],[]);("martin",[28;27],[2;4;6])];;
(* enterprise : (string * int list * int list) list = *)
 (* ["dupont", [22; 25], [3]; "durand", [24], []; "martin", [28; 27], [2; 4; 6]] *)

let rec nbEnfants = fun
| ((a, b, c)::d) -> nombre c + nbEnfants d
| _ -> 0;;
(* nbEnfants : ('a * 'b * 'c list) list -> int = <fun> *)

nbEnfants enterprise;;
(* - : int = 4 *)

let rec nbCelib = fun
| ((a, b, c)::d) -> if nombre b = 1 && nombre c = 0 then 1 + nbCelib d else nbCelib d
| _ -> 0;;
(* nbCelib : ('a * 'b list * 'c list) list -> int = <fun> *)

nbCelib enterprise;;
(* - : int = 1 *)

let rec naissance = fun
| (a, (b, c, d)::e) when a = b -> (b, c, 0::d)::e
| (a, b::e) -> b::naissance(a, e)
| _ -> failwith "Faudrait exister avant d'avoir des enfants, enfin.. je pense que c'est mieux.";;
(* naissance : 'a * ('a * 'b * int list) list -> ('a * 'b * int list) list = <fun> *)

naissance ("dupont",enterprise);;
(* - : (string * int list * int list) list = *)
 (* ["dupont", [22; 25], [0; 3]; "durand", [24], []; *)
  (* "martin", [28; 27], [2; 4; 6]] *)


(* Troisième partie *)

let enterprise=[("Martin",1,1); ("Dupond",2,1);("Dupuy",3,1);
("Durand",4,1);("Jean-Claude",5,2);("Brice",6,3);("Mr Dusse",7,3);("Pignon",8,4)];;

let rec nom = fun
| (n, (a, b, c)::d) when n = b -> a
| (n, a::d) -> nom(n, d)
| _ -> "Ce numéro ne correspond pas à un employé. Et il n'a sûrement pas d'enfant.";;
(* nom : 'a * ('b * 'a * 'c) list -> 'b = <fun> *)

nom(7, enterprise);;
(* - : string = "Mr Dusse" *)


let lechef(a, b) =
	let rec present a =
	match a with
	| (b, (c, d, e)::f) -> b = c || present(b, f)
	| _ -> false in

	if present(a, b) then
		let rec numero a =
		match a with
		| (b, (c, d, e)::f) when b = c -> e
		| (b, c::f) -> numero(b, f)
		| _ -> failwith "Si cette erreur arrive, il y a un problème." in
		
		let c = numero(a, b) in
		let d = nom(c, b) in
		if d = a then "C'est MOI le Chef!" else d
	else "Cette personne n'est pas dans l'entreprise!";;
(* lechef : string * (string * 'a * 'a) list -> string = <fun> *)

lechef("Brice",enterprise);;
(* - : string = "Dupuy" *)
lechef("Durand",enterprise);;
(* - : string = "Martin" *)
lechef("Montaut",enterprise);;
(* - : string = "Cette personne n'est pas dans l'entreprise!" *)
lechef("Martin",enterprise);;
(* - : string = "C'est MOI le Chef!" *)
