bestFirstSearchMitSharing cmp heuristic goal successor start =
  let -- sortiere die Startknoten
    list = sortByHeuristic (map (\k -> (k,[k])) (start))
  in go list []
 where
  go ((k,path):r) mem
    | goal k    = Just (k,path) -- Zielknoten erreicht
    | otherwise =
       let
         -- Berechne die Nachfolger und nehme nur neue Knoten
         nf = (successor k) \\ mem
         -- aktualisiere Pfade
         l' = map (\k -> (k,k:path)) nf
         -- Sortiere alle Knoten nach der Heuristik
         l'' = sortByHeuristic (l' ++ r)
       in go l'' (k:mem)
  sortByHeuristic =
    sortBy (\(a,_) (b,_)-> cmp (heuristic a) (heuristic b))
