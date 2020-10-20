# 1 "zadanie2.mll"
 
  open Printf

# 6 "zadanie2.ml"
let __ocaml_lex_init_lexbuf lexbuf mem_size =
  let pos = lexbuf.Lexing.lex_curr_pos in
  lexbuf.Lexing.lex_mem <- Array.make mem_size (-1) ;
  lexbuf.Lexing.lex_start_pos <- pos ;
  lexbuf.Lexing.lex_last_pos <- pos ;
  lexbuf.Lexing.lex_last_action <- -1

let rec __ocaml_lex_next_char lexbuf =
  if lexbuf.Lexing.lex_curr_pos >= lexbuf.Lexing.lex_buffer_len then begin
    if lexbuf.Lexing.lex_eof_reached then
      256
    else begin
      lexbuf.Lexing.refill_buff lexbuf ;
      __ocaml_lex_next_char lexbuf
    end
  end else begin
    let i = lexbuf.Lexing.lex_curr_pos in
    let c = Bytes.get lexbuf.Lexing.lex_buffer i in
    lexbuf.Lexing.lex_curr_pos <- i+1 ;
    Char.code c
  end

let rec __ocaml_lex_state0 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'A' *)
  |65 ->
    __ocaml_lex_state2 lexbuf
(* |'B' *)
  |66 ->
    __ocaml_lex_state1 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state1 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |eof *)
  |256 ->
    __ocaml_lex_state13 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state2 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'B' *)
  |66 ->
    __ocaml_lex_state5 lexbuf
(* |'A' *)
  |65 ->
    __ocaml_lex_state4 lexbuf
(* |eof *)
  |256 ->
    __ocaml_lex_state3 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state3 lexbuf = (* *)
  3

and __ocaml_lex_state4 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |eof *)
  |256 ->
    __ocaml_lex_state9 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state5 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'B' *)
  |66 ->
    __ocaml_lex_state7 lexbuf
(* |'A' *)
  |65 ->
    __ocaml_lex_state6 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state6 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'A' *)
  |65 ->
    __ocaml_lex_state8 lexbuf
(* |eof *)
  |256 ->
    __ocaml_lex_state9 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state7 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'B' *)
  |66 ->
    __ocaml_lex_state7 lexbuf
(* |'A' *)
  |65 ->
    __ocaml_lex_state4 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state8 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'B' *)
  |66 ->
    __ocaml_lex_state10 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state9 lexbuf = (* *)
  0

and __ocaml_lex_state10 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'A' *)
  |65 ->
    __ocaml_lex_state11 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state11 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |eof *)
  |256 ->
    __ocaml_lex_state12 lexbuf
(* |'A' *)
  |65 ->
    __ocaml_lex_state8 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state12 lexbuf = (* *)
  1

and __ocaml_lex_state13 lexbuf = (* *)
  2

let rec automat lexbuf =
  __ocaml_lex_init_lexbuf lexbuf 0; 
  let __ocaml_lex_result = __ocaml_lex_state0 lexbuf in
  lexbuf.Lexing.lex_start_p <- lexbuf.Lexing.lex_curr_p;
  lexbuf.Lexing.lex_curr_p <- {lexbuf.Lexing.lex_curr_p with
    Lexing.pos_cnum = lexbuf.Lexing.lex_abs_pos+lexbuf.Lexing.lex_curr_pos};
  match __ocaml_lex_result with
  | 0 ->
# 7 "zadanie2.mll"
                  ( printf "AUTOMAT AKCEPTUJE AB*A\n"
  )
# 153 "zadanie2.ml"

  | 1 ->
# 9 "zadanie2.mll"
              ( printf "AUTOMAT AKCEPTUJE ABA+\n"
  )
# 159 "zadanie2.ml"

  | 2 ->
# 11 "zadanie2.mll"
           ( printf "AUTOMAT AKCEPTUJE <B>\n" 
  )
# 165 "zadanie2.ml"

  | 3 ->
# 13 "zadanie2.mll"
           ( printf "AUTOMAT AKCEPTUJE <A>\n" 
  )
# 171 "zadanie2.ml"

  | _ -> raise (Failure "lexing: empty token")


;;

# 17 "zadanie2.mll"
 
  let main () =
    let lexbuf = Lexing.from_channel stdin in
    automat lexbuf

  let _ = Printexc.print main ()

# 186 "zadanie2.ml"
