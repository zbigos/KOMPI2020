
(* The type of tokens. *)

type token = 
  | UMINUS
  | TIMES
  | RPAREN
  | PLUS
  | MINUS
  | LPAREN
  | INT of (int)
  | EOL
  | DIV

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (int)
