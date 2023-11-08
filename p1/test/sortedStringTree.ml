module SoStree = 
  struct
    type sostree = 
      | (sostree * string * sostree)
      | leaf

    let rec add (s: string) (t: sostree): sostree =
      match t with
        | (t1, str, t2) -> if (String.compare str s) = 0 then failwith "ERROR: name already in tree"
                          else if (String.compare str s) < 0 then ((add s t1), str, t2)
                          else if (String.compare str s) > 0 then (t1, str, (add s t2))
                          else failwith "INTERNAL ERROR: failed to add string to tree"
        | leaf -> (leaf, s, leaf)

    let rec isIn (s: string) (t: sostree): bool =
      match t with 
        | (t1, str, t2) -> if (String.compare str s) = 0 then true
                          else if (String.compare str s) < 0 then (isIn s t1)
                          else if (String.compare str s) > 0 then (isIn s t2)
                          else failwith "INTERNAL ERROR: failed to compare string to tree"
        | leaf -> false
  end
    