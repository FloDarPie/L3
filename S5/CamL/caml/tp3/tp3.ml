	(* 1. Premiere fonction definie par filtrage *)

let entier = fun
	| 0 -> "zero"
	| 1 -> "un"
	| n -> if n mod 2 = 0 then "pair" else "impair";;
(* entier : int -> string = <fun> *)
	
entier 0;;
(* - : string = "zero" *)
entier 1;;
(* - : string = "impair" *)
entier 2;;
(* - : string = "pair" *)


	(* 2. Un peu de geometrie *)

let point = fun
	| (0., 0.) -> "origine"
	| (0., y) -> "Axe des ordonnees"
	| (x, 0.) -> "Axe des abscisses"
	| (x, y) -> if x > 0. then "point du demi plan x>0"
				else "point du demi plan x<0";;
				
(* point : float * float -> string = <fun> *)
point(0., 0.);;
(* - : string = "origine" *)
point(0., 1.);;
(* - : string = "Axe des ordonnees" *)
point(1., 0.);;
(* - : string = "Axe des abscisses" *)
point(1., 1.);;
(* - : string = "point du demi plan x>0" *)
point(-1., 1.);;
(* - : string = "point du demi plan x<0" *)


	(* 3. Operations *)

let operation = fun
	| (x, y, `+`) -> x + y
	| (x, y, `-`) -> x - y
	| (x, y, `*`) -> x * y
	| (x, y, `/`) -> if y = 0 then failwith "Diviser par zero? Serieusement?"
		else x / y
	| (x, y, _) -> failwith   "Tu es vraiment mauvais.";;
(* operation : int * int * char -> int = <fun> *)

operation (7, 3, `+`);;
(* - : int = 10 *)
operation (7, 3, `-`);;
(* - : int = 4 *)
operation (7, 3, `*`);;
(* - : int = 21 *)
operation (7, 3, `/`);;
(* - : int = 2 *)
operation (7, 0, `/`);;
(* Exception non rattrapee: Failure "Diviser par zero? Serieusement?" *)
operation (7, 3, `!`);;
(* Exception non rattrapee: Failure "Ce n'est pas une operation connue." *)


	(* 4. Calcul de TVA *)

let arrondi = fun x -> 
	let troncature = fun x ->
	int_of_float x in
	
	let partie_entiere = fun x ->
	let tx = troncature x in
	if x -. float_of_int tx >= 0.
	then tx
	else tx - 1 in
	
	let plus_proche_entier = fun x ->
	partie_entiere(x +. 0.5) in

	float_of_int(plus_proche_entier(x *. 1E2)) /. 1E2;;
(* arrondi : float -> float = <fun> *)

		(* 1. *)
let prixTTC = fun (a, b) -> a *. (1. +. b /. 1E2);;
(* prixTTC : float * float -> float = <fun> *)

prixTTC(200., 12.);;
(* - : float = 224.0 *)

		(* 2. *)
let prix = fun
	| "pain" -> (1.05, 5.5)
	| "conserve" -> (3.5, 7.)
	| "disque" -> (12.3, 18.6)
	| "bijou" -> (356., 33.)
	| _ -> failwith "Article indisponible";;
	
prix "pain";;
(* - : float * float = 1.05, 5.5 *)
prix "conserve";;
(* - : float * float = 3.5, 7.0 *)
prix "disque";;
(* - : float * float = 12.3, 18.6 *)
prix "bijou";;
(* - : float * float = 356.0, 33.0 *)
prix"objet_qui_n'est_pas_dans_la_liste_d'objet_definie_mais_
que_je_dois_inventer_pour_verifier_la_fonction";;
(* Exception non rattrapee: Failure "Article indisponible" *)


		(* 3. *)
let sommeAPayer = fun (x, y) ->
	let px = prix x in arrondi(prixTTC px *. float_of_int y);;
(* sommeAPayer : string * int -> float = <fun> *)

prixTTC(1.05, 5.5) *. 2.;;
(* - : float = 2.2155 *)
sommeAPayer("pain", 2);;
(* - : float = 2.22 *)


	(* 5. Un calendrier perpetuel *)

		(* 1. *)
let formule = fun (j, m, p, s) ->
	j + (48 * m - 1) / 5 + p / 4 + p + s / 4 - 2 * s;;
(* formule : int * int * int * int -> int = <fun> *)

		(* 2. *)
let decoupe = fun n -> (n / 100, n mod 100);;
(* decoupe : int -> int * int = <fun> *)

decoupe(2014);;
(* - : int * int = 20, 14 *)

		(* 3. *)
let deuxMoisAvant = fun
	| (1, a) ->  (11, a - 1)
	| (2, a) -> (12, a - 1)
	| (m, a) -> if m > 12
	then failwith "il n'y a pas plus de 12 mois en une annee"
	else (m - 2, a);;
(* deuxMoisAvant : int * int -> int * int = <fun> *)

deuxMoisAvant(2, 2014);;
(* - : int * int = 12, 2013 *)
deuxMoisAvant(1, 2014);;
(* - : int * int = 11, 2013 *)
deuxMoisAvant(3, 2014);;
(* - : int * int = 1, 2014 *)

		(* 4. *)
let leJour = fun
	| 0 -> "Dimanche"
	| 1 -> "Lundi"
	| 2 -> "Mardi"
	| 3 -> "Mercredi"
	| 4 -> "Jeudi"
	| 5 -> "Vendredi"
	| 6 -> "Samedi"
	| _ -> failwith "Il n'y a pas plus de 7 jours differents dans une semaine";;
(* leJour : int -> string = <fun> *)
	
	(* Je n'apprecie pas faire des filtrage non exhaustifs,
	mais pour le faire il faudrait simplement mettre en commentaire
	"| _ -> failwith "Il n'y a pas plus de 7 jours differents dans une semaine"". *)

leJour 2;;
(* - : string = "Mardi" *)

		(* 5. *)
let modulo7 = fun n ->
	let nmod7 = n mod 7 in
	if n < 0 then nmod7 + 7 else nmod7;;
(* modulo7 : int -> int = <fun> *)

modulo7(20);;
(* - : int = 6 *)
modulo7(-4);;
(* - : int = 3 *)

		(* 6. *)
let quelJour = fun (j, m, a) ->
		let (M, A) = deuxMoisAvant(m, a) in
		let (S, P) = (A / 100, A mod 100) in
		let K = formule(j, M, P, S)in
		leJour(modulo7 K);;
(* quelJour : int * int * int -> string = <fun> *)

quelJour(14,7,1789);;
(* - : string = "Mardi" *)
quelJour(14,10,2014);;
(* - : string = "Mardi" *)
quelJour(28,9,2019);;
(* - : string = "Samedi" *)
quelJour(29,9,2019);;
(* - : string = "Dimanche" *)
