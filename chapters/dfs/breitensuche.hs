bfs goal succ start =
  go [(k,[k]) | k <- start] -- Pfade erzeugen
 where
  go [] = Nothing -- nichts gefunden
  go rs =
    case filter (goal . fst) rs of -- ein Zielknoten enthalten?
      -- Nein, mache weiter mit allen Nachfolgern
      [] -> go [(k',k':p) | (k,p) <- rs, k' <- succ k]
      -- Ja, dann stoppe:
      (r:rs) -> Just r
