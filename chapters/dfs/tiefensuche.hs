dfs ::(a -> Bool)   -- Zieltest (goal)
  -> (a -> [a])     -- Nachfolgerfunktion (succ)
  -> [a]            -- Startknoten
  -> Maybe (a, [a]) -- Ergebnis: Just (Zielknoten,Pfad)
                    --      oder Nothing
dfs goal succ stack =
  -- Einfuegen der Anfangspfade, dann mit iterieren mit go
  go [(k,[k]) | k <- stack]
 where
  go [] = Nothing         -- Alles abgesucht, nichts gefunden
  go ((k,p):r)
    | goal k = Just (k,p) -- Ziel gefunden
    | otherwise = go ([(k',k':p) | k' <- succ k] ++ r)
