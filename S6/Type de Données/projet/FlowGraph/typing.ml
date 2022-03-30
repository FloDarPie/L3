(* Typechecking of source programs *)

open Lang

(* Environments *)

type environment = 
    {localvar: (vname * tp) list; 
     returntp: tp}

