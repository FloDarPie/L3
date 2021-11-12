
	(* 1. Quelques fonctions sur les nombres *)

		(* 1. *)
let troncature = fun x -> int_of_float x;;
(* troncature : float -> int <fun> *)

troncature 42.45;;
(* - : int = 42 *)
troncature(-42.45);;
(* - : int = -42 *)

		(* 2. *)
let decimales = fun x -> abs_float(x -. float_of_int(troncature x));;
(* decimales : float -> float = <fun> *)

decimales 42.45;;
(* - : float = 0.45 *)
decimales(-42.46);;
(* - : float = 0.45 *)

		(* 3. *)
let partie_entiere = fun x ->
	let tx = troncature x in
	if x -. float_of_int tx >= 0.
	then tx
	else tx - 1;;
(* partie_entiere : float -> int = <fun> *)

partie_entiere(-5.61);;
(* - : int = -6 *)
partie_entiere 5.61;;
(* - : int = 5 *)

		(* 4. *)
let plus_proche_entier = fun x -> partie_entiere(x +. 0.5);;
(* plus_proche_entier : float -> int = <fun> *)

plus_proche_entier(-5.52);;
(* - : int = -6 *)
plus_proche_entier(-5.48);;
(* - : int = -5 *)
plus_proche_entier 5.52;;
(* - : int = 6 *)
plus_proche_entier 5.48;;
(* - : int = 5 *)

		(* 5. *)
let arrondi = fun x -> float_of_int(plus_proche_entier(x *. 1E2)) /. 1E2;;
(* arrondi : float -> float = <fun> *)

arrondi 52.6543;;
(* - : float = 52.65 *)
arrondi(-52.6543);;
(* - : float = -52.65 *)


	(* 2. Fonction de conversion francs-euros *)

let francs_en_euros = fun x ->  arrondi(x /. 6.55957);;
(* francs_en_euros : float -> float = <fun> *)

francs_en_euros 6.55;;
(* - : float = 1.0 *)
francs_en_euros 10.;;
(* - : float = 1.52 *)


	(* 3. Quelle heure est-il ? *)
	
let heures = fun x -> troncature x;;
(* heures : float -> int = <fun> *)
let minutes = fun x -> plus_proche_entier(decimales x *. 1E2);;
(* minutes : float -> int = <fun> *)

heures 23.45;;
(* - : int = 23 *)
minutes 23.45;;
(* - : int = 45 *)

let quel_heure_est_il = fun x ->
	let hx = heures x and mx = minutes x in
	let h = 
        if hx = 0 then "minuit"
            else
        if hx = 12 then "midi" 
            else string_of_int hx ^ " heure"
        and
        m = 
        if mx = 0 then "pile." 
            else string_of_int mx 
    in
        "Il est " ^ h ^ " " ^ m;;
(* quel_heure_est_il : float -> string = <fun> *)

quel_heure_est_il(14.45);;
(* - : string = "Il est 14 heure 45" *)
quel_heure_est_il(12.0);;
(* - : string = "Il est midi pile." *)
quel_heure_est_il(0.34);;
(* - : string = "Il est minuit 34" *)


	(* 4. Fonctions sur un produit cartésion *)

let reel = fun (a, b, x) ->
	let ab = if a < b then b else a in
	float_of_int(ab) +. decimales x;;
(* reel : int * int * float -> float = <fun> *)
	
reel(4,5, -4.123);;
(* - : float = 5.123 *)
reel(7,5,4.123);;
(* - : float = 7.123 *)


	(* 5. Écrire les fonctions entières suivantes : *)
	
		(* 1. *)
let chiffre = fun n ->
	abs(n mod 10);;
(* chiffre : int -> int = <fun> *)

chiffre 1235;;
(* - : int = 5 *)
chiffre(-1235);;
(* - : int = 5 *)

let echange = fun (n,p) ->
	let np = abs n - chiffre n + chiffre p in
	if n < 0 then -np else np;;
(* echange : int * int -> int = <fun> *)

	(* "n - chiffre n + chiffre p" est faux si n < 0
	exemple : n = -123 et p = 45
	-123 - chiffre (-123) + chiffre 45 = -123 - 3 + 5 = -126 + 5 = -121	*)

echange(123,45);;
(* - : int = 125 *)
echange(-123,45);;
(* - : int = -125 *)


	(* 6. Fonction booléennes *)
		
		(* 1. *)
let bool_01 = fun (a, b, c) -> a + 0 = b && a = c;;
(* bool_01 : int * int * int -> bool = <fun> *)

	(* "a + 0" rend la fonction bool_01 monomorphe *)

bool_01(1, 1, 1);;
(* - : bool = true *)
bool_01(1, 1, 0);;
(* - : bool = false *)

		(* 2. *)
let bool_02 = fun (a, b, c) -> a + 0 = b && a <> c;;
(* bool_02 : int * int * int -> bool = <fun> *)

bool_02(1, 1, 1);;
(* - : bool = false *)
bool_02(1, 1, 0);;
(* - : bool = true *)

	(* 3. *)
let bool_03 = fun (a, b, c) -> a + 0 < b && b < c ;;
(* bool_03 : int * int * int -> bool = <fun> *)

bool_03(1, 1, 1);;
(* - : bool = false *)
bool_03(1, 1, 0);;
(* - : bool = false *)
bool_03(-1, 0, 1);;
(* - : bool = true *)

	(* 4. *)
let bool_04 = fun (a, b, c) ->
	a + 0 = b || a = c || b = c;;
(* bool_04 : int * int * int -> bool = <fun> *)

bool_04(1, 1, 1);;
(* - : bool = true *)
bool_04(1, 1, 0);;
(* - : bool = true *)
bool_04(-1, 0, 1);;
(* - : bool = false *)

	(* 5. *)
let bool_05 = fun (a, b, c) ->
	a + 0 = b && a <> c ||
	a = c && a <> b ||
	b = c && a <> b;;
(* bool_05 : int * int * int -> bool = <fun> *)

bool_05(1, 1, 1);;
(* - : bool = false *)
bool_05(1, 1, 0);;
(* - : bool = true *)
bool_05(-1, 0, 1);;
(* - : bool = false *)

	(* 6. *)
let bool_06 = fun (a, b, c) ->
	a + 0 <> b ||
	a <> c ||
	b <> c;;
(* bool_06 : int * int * int -> bool = <fun> *)

bool_06(1, 1, 1);;
(* - : bool = false *)
bool_06(1, 1, 0);;
(* - : bool = true *)
bool_06(-1, 0, 1);;
(* - : bool = true *)


	(* 7. Résolution de l’équation du second degré *)

let nb_sol = fun (a, b, c) ->
	if a = 0. then failwith "ce n'est pas une équation du second degré"
	else let dis = b *. b -. 4. *. a *. c in 
		if dis > 0. then 2
		else if dis = 0. then 1
			else 0;;
(* nb_sol : float * float * float -> int = <fun> *)

nb_sol(1., 1., 1.);;
(* - : int = 0 *)
nb_sol(4., 4., 1.);;
(* - : int = 1 *)
nb_sol(1., 1., -2.);;
(* - : int = 2 *)
nb_sol(0., 1., 1.);;
(* Exception non rattrapée: Failure "ce n'est pas une équation du second degré" *)


	(* 8. Évaluation d’un appel de fonction *)

		(* A. *)
(* Env0 *)

let x = 3;;
(* x : int = 3 *)
(* Env1=[(x,3)><Env0] *)

let y = 4;;
(* y : int = 4 *)
(* Env2=[(y,4)><Env1] *)

let f = fun x -> 3*x + y*2;;
(* f : int -> int = <fun> *)
(* Env3=[(f,<x,3*x + y*2)><Env2]
ou peut-être Env3=[(f,<x,3*x + 8)><Env2]*)

let x = 2 in
(* EnvT=[(x,2)><Env3] *)
y = x+1;;
(* - : bool = false *)
(* Env3 *)

f 4;;
(* - : int = 20 *)
(* Env_appel_1=[(x,3)><Env2] *)

f x;;
(* - : int = 17 *)
(* Env_appel_2=[(x,x)><Env2]
ou peut-être Env_appel_2=[(x,3)><Env2]*)

		(* B. *)
(* Env0 *)

let f = fun a -> let b = 2 in
(* EnvT=[(b,2)><Env0] *)
a * b;;
(* f : int -> int = <fun> *)
(* Env1=[(f,<x,a*2)><Env0] *)

let b = 3 and x = 2;;
(* b : int = 3 *)
(* x : int = 2 *)
(* Env2=[(x,2),(b,3)><Env1] *)

f(x);;
(* - : int = 4 *)
(* Env_appel_1=[(x,x)><Env1]
ou peut-être Env_appel_1=[(x,2)><Env1] *)

f(b);;
(* - : int = 6 *)
(* Env_appel_2=[(x,b)><Env1]
ou peut-être Env_appel_2=[(x,3)><Env1] *)

		(* C. *)
(* Env0 *)

let a = 2;;
(* a : int = 2 *)
(* Env1=[(a,2)><Env0] *)

let b = 12 in
(* EnvT=[(b,12)><Env1] *)
2*b + 4;;
(* - : int = 28 *)
(* Env1 *)

let f = fun x -> 2*x + a;;
(* f : int -> int = <fun> *)
(* Env2=[(f,<x,2*x + a)><Env1]
ou peut-être Env2=[(f,<x,2*x + 2)><Env1] *)

f(a);;
(* - : int = 6 *)
(* Env_appel_1=[(x,a)><Env1]
ou peut-être Env_appel_1=[(x,2)><Env1] *)


	(* 9. Bonus : Résolution de l’équation du second degré*)

let rc_sol = fun (a, b, c) ->
	if a = 0. then failwith "ce n'est pas une équation du second degré"
	else let dis = b *. b -. 4. *. a *. c in
		if dis < 0. then failwith "Cette équation du second degré n'a pas de solution dans |R"
		else let a2 = 2. *. a in
		let b2a = -. b /. a2 and dis2a = sqrt dis /. a2 in
		(b2a -. dis2a, b2a +. dis2a);;
(* rc_sol : float * float * float -> float * float = <fun> *)

rc_sol(0., 1., 1.);;
(* Exception non rattrapée: Failure "ce n'est pas une équation du second degré" *)
rc_sol(1., 1., -2.);;
(* - : float * float = -2.0, 1.0 *)
rc_sol(1., 1., 1.);;
(* Exception non rattrapée: Failure "Cette équation du second degré n'a pas de solution dans |R" *)
rc_sol(4., 4., 1.);;
(* - : float * float = -0.5, -0.5 *)
rc_sol(1., 4., 0.);;
(* - : float * float = -4.0, 0.0 *)
