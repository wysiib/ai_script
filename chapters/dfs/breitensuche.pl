loesung(Start,Ziel):-
    weg([Start],Ziel,[],Pfad),% Aufruf der Breitensuche,
    write('Pfad: '),
    write(Pfad).

% weg(Startknotenliste, Zielknoten, Liste der besuchten
%Knoten, Ergebnispfad)

weg(Startliste,Ziel,_,Pfad):-
         Startliste=[Ziel|_],
         reverse(Startliste,Pfad).

weg(Startliste,Ziel,Liste,Pfad):-
         Startliste=[Start|_],
         findall([Knoten|Startliste],
            (kante(Start,Knoten),
             not(member(Knoten,Startliste))),
            Knotenliste),
         append(Liste,Knotenliste,Listeneu),
         Listeneu=[PfadN|RestPfad],
         weg(PfadN,Ziel,RestPfad,Pfad).
