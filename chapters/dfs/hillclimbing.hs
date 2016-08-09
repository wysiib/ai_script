hillclimbing cmp heuristic goal successor start =
  let -- sortiere die Startknoten
  list = map (\k -> (k,[k])) (sortByHeuristic start)
  in go list []
 where
  go ((k,path):r) mem
    | goal k
      = Just (k,path) -- Zielknoten erreicht
    | otherwise =
      let -- Berechne die Nachfolger (nur neue Knoten)
        nf = (successor k) \\ mem
        -- Sortiere die Nachfolger entsprechend der Heuristik
        l' = map (\k -> (k,k:path)) (sortByHeuristic nf)
        in go (l' ++ r) (k:mem)
  sortByHeuristic = sortBy (\a b -> cmp (heuristic a) (heuristic b))
   -- cmp ist die compare-Funktion und ermoeglicht zu
   -- maximieren oder zu minimieren
