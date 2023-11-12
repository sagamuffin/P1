module Sostree =
    sig
      type sostree
      val add : string -> sostree -> sostree
      val isIn : string -> sostree -> bool
      val string_of_tree : sostree -> string
      
    end
  