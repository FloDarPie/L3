		(* Contrôle continu n°1 *)

	(* 1. Conversion secondes en heures (expressions élémentaires et définitions locales) *)
	
let secEnHeures = fun s ->
	let m = s / 60 in
	m / 60, m mod 60, s mod 60;;
(* secEnHeures : int -> int * int * int = <fun> *)

secEnHeures 1000;;
(* - : int * int * int = 0, 16, 40 *)
secEnHeures 100000;;
(* - : int * int * int = 27, 46, 40 *)
secEnHeures 0;;
(* - : int * int * int = 0, 0, 0 *)
secEnHeures 1;;
(* - : int * int * int = 0, 0, 1 *)

	(* 2. Opérations booléennes (booléens et filtrage) *)
	
		(* 1. *)
let non = fun
	  true -> false
	| false -> true;;
(* non : bool -> bool = <fun> *)

non true;;
(* - : bool = false *)
non false;;
(* - : bool = true *)

		(* 2. *)
let et = fun
	  (true, true) -> true
	| (_, _) -> false;;
(* et : bool * bool -> bool = <fun> *)
	
et(true, true);;
(* - : bool = true *)
et(true, false);;
(* - : bool = false *)
et(false, true);;
(* - : bool = false *)
et(false, false);;
(* - : bool = false *)

		(* 3. *)
let ou = fun
	| (false, false) -> false
	| (_, _) -> true;;
(* ou : bool * bool -> bool = <fun> *)

ou(true, true);;
(* - : bool = true *)
ou(true, false);;
(* - : bool = true *)
ou(false, true);;
(* - : bool = true *)
ou(false, false);;
(* - : bool = false *)

		(* 4. *)
let nand = fun (a, b) -> non(et(a, b));;
(* nand : bool * bool -> bool = <fun> *)

nand(true, true);;
(* - : bool = false *)
nand(true, false);;
(* - : bool = true *)
nand(false, true);;
(* - : bool = true *)
nand(false, false);;
(* - : bool = true *)

(*	let nand = fun
	  (true, true) -> false
	| (_, _) -> true;;	*)

		(* 3. Bouge! (chaînes de caractères et filtrage) *)

let bouge = fun
	  ("est", x, y) -> x + 5, y
	| ("nord", x, y) -> x, y + 5
	| ("ouest", x, y) -> x - 5, y
	| ("sud", x, y) -> x, y - 5;;
(* Attention: ce filtrage n'est pas exhaustif. *)
(* bouge : string * int * int -> int * int = <fun> *)

bouge("ouest",15,45);;
(* - : int * int = 10, 45 *)
bouge("nord",15,45);;
(* - : int * int = 15, 50 *)
bouge("est",15,45);;
(* - : int * int = 20, 45 *)
bouge("sud",15,45);;
(* - : int * int = 15, 40 *)

		(* 4. Puissance de 2 (Récursivité élémentaire sur les entiers) *)

let rec div2 = fun n ->
	if n mod 2 = 1
	then 0
	else 1 + div2(n / 2);;
(* div2 : int -> int = <fun> *)

div2 24;;
(* - : int = 3 *)
div2 10;;
(* - : int = 1 *)
div2 7;;
(* - : int = 0 *)
div2 80;;
(* - : int = 4 *)

		(* 5. Nombres parfaits (récursivité) *)

	(* 1. *)
let rec somAux = fun
	  (_, 1) -> 1
	| (n, p) -> if n mod p = 0
				then p + somAux(n, p - 1)
				else somAux(n, p - 1);;
(* somAux : int * int -> int = <fun> *)

somAux(12, 8);;
(* - : int = 16 *)
somAux(1, 2);;
(* - : int = 1 *)

(*	let rec somAux = fun
		  (_, 0) -> 0
		| (n, p) -> if n mod p = 0
					then p + somAux(n, p - 1)
					else somAux(n, p - 1);;		*)

	(* 2. *)
let somDiv = fun n -> somAux(n, n - 1);;
(* somDiv : int -> int = <fun> *)

somDiv 36;;
(* - : int = 55 *)
somDiv 28;;
(* - : int = 28 *)
somDiv 12;;
(*  : int = 16 *)

	(* 3. *)
let parfait = fun n -> n = somDiv n;;
(* parfait : int -> bool = <fun> *)

parfait 28;;
(* - : bool = true *)
parfait 36;;
(* - : bool = false *)
parfait 6;;
(* - : bool = true *)