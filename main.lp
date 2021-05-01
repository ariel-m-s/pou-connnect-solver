cell(Y, X) :- column(Y), row(X).
possibleColor(C) :- color(C, Y, X).

terminalCell(Y, X) :- color(C, Y, X).
1 { initial(C, Y, X) : color(C, Y, X) } 1 :- possibleColor(C).
1 { final(C, Y, X) : color(C, Y, X) } 1 :- possibleColor(C).

% No cell can be initial and final at the same time.
:- initial(C, Y, X), final(C, Y, X).

adjacent(Y+1, X, Y, X) :- cell(Y, X), column(Y+1).
adjacent(Y-1, X, Y, X) :- cell(Y, X), column(Y-1).
adjacent(Y, X+1, Y, X) :- cell(Y, X), row(X+1).
adjacent(Y, X-1, Y, X) :- cell(Y, X), row(X-1).

% Only one path is built per color, from the initial cell to the final cell.
1 { path(C, YO, XO, YD, XD) : adjacent(YD, XD, YO, XO) } 1 :- initial(C, YO, XO).
1 { path(C, YO, XO, YD, XD) : adjacent(YD, XD, YO, XO) } 1 :- path(C, YA, XA, YO, XO), not terminalCell(YO, XO).

% A cell is connected if it has at least one entering or exiting path.
connected(YO, XO) :- path(C, YO, XO, YD, XD).
connected(YD, XD) :- path(C, YO, XO, YD, XD).

% All cells must be connected.
:- cell(Y, X), not connected(Y, X).

% A cell is painted a certain color if it belongs to a path of said color.
painted(C, YO, XO) :- path(C, YO, XO, YD, XD).
painted(C, YD, XD) :- path(C, YO, XO, YD, XD).

% No cell can be painted two different colors.
% That is, it must not belong to two different paths (i.e., no crossing paths).
:- painted(C1, Y, X), painted(C2, Y, X), C1!=C2.

% A cell is reachable by another if there is a path that goes from the latter to the former.
reachable(C, YO, XO, YD, XD) :- path(C, YO, XO, YD, XD).
reachable(C, YO, XO, YD, XD) :- reachable(C, YO, XO, YI, XI), reachable(C, YI, XI, YD, XD).

% No cell can be rechable by itself (i.e., no cycles).
:- reachable(C, Y, X, Y, X).

% The final cell of a path must be reachable by the initial cell of the same path.
:- initial(C, YO, XO), final(C, YD, XD), not reachable(C, YO, XO, YD, XD).

#show path/5.
