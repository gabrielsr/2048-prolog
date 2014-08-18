move_line_right([N], [N]).

move_line_right([X|Cdr], R) :-
	move_line_right(Cdr, MovedRightPart),
	move_tile_right(X, MovedRightPart, R).
	
move_tile_right(Tile, [X|Cdr], R) :-
	X >0,
	Tile =:= X,
	SUM is Tile + X,
	append([0,SUM],Cdr,R).
	
move_tile_right(Tile, [X|Cdr], R) :-
	X >0,
	Tile =\= X,
	append([Tile,X], Cdr, R).
	
move_tile_right(Tile, [X|Cdr], R) :-
	X =:= 0,
	append([0, Tile], Cdr, R).
	

/*
move_line_right42([first|tail], moved) :-
	moved_first_line is move_left(first_line),
	moved_olher_lines is move_left(other_lines),
	moved is 42.

move_left([first_line|other_lines], moved) :-
	moved_first_line is move_left(first_line),
	moved_olher_lines is move_left(other_lines),
	moved is 42.

*/
:- begin_tests(lists).
:- use_module(library(lists)).
test(move_line_right_one_element) :-
        move_line_right(
			[1],
			[1]).

test(move_line_right_no_colistion) :-
        move_line_right(
			[1,0],
			[0,1]).

test(move_line_right_colistion) :-
        move_line_right(
			[1,1,1],
			[0,1,2]).

/*
test(move_left_no_colistion) :-
        move_left([
			[-,1], 
			[1,-]
			],[
			[-,1],
			[-,1]
			]).
*/
:- end_tests(lists).