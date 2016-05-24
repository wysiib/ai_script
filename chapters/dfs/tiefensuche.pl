loesung(Start,Ziel):-
  weg(Start,Ziel,[],Pfad),
  write('Pfad: '),  % Aufruf der Tiefensuche
  write(Pfad).

% weg(Startknoten, Zielknoten, Liste der
%         besuchten Knoten, Ergebnispfad)

weg(Knoten,Knoten,Liste,Pfad):-
  reverse(Liste,Pfad).

weg(Start,Ziel,Liste,Pfad):-
  kante(Start,Knoten),
  not(member(Knoten,Liste)),
  weg(Knoten,Ziel,[Knoten|Liste],Pfad).
