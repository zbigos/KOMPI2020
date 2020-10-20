# 1 "tst.mll"
  
# 4 "tst.ml"
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
(* |eof *)
  |256 ->
    __ocaml_lex_state1 lexbuf
(* |'c' *)
  |99 ->
    __ocaml_lex_state3 lexbuf
  | _ ->
    __ocaml_lex_state2 lexbuf

and __ocaml_lex_state1 lexbuf = (* *)
  2

and __ocaml_lex_state2 lexbuf = (* *)
  1

and __ocaml_lex_state3 lexbuf = (* *)
  lexbuf.Lexing.lex_last_pos <- lexbuf.Lexing.lex_curr_pos ;
  lexbuf.Lexing.lex_last_action <- 1 ;
match __ocaml_lex_next_char lexbuf with
(* |'u' *)
  |117 ->
    __ocaml_lex_state4 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state4 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'r' *)
  |114 ->
    __ocaml_lex_state5 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state5 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'r' *)
  |114 ->
    __ocaml_lex_state6 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state6 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'e' *)
  |101 ->
    __ocaml_lex_state7 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state7 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'n' *)
  |110 ->
    __ocaml_lex_state8 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state8 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'t' *)
  |116 ->
    __ocaml_lex_state9 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state9 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'_' *)
  |95 ->
    __ocaml_lex_state10 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state10 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'d' *)
  |100 ->
    __ocaml_lex_state11 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state11 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'i' *)
  |105 ->
    __ocaml_lex_state12 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state12 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'r' *)
  |114 ->
    __ocaml_lex_state13 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state13 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'e' *)
  |101 ->
    __ocaml_lex_state14 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state14 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'c' *)
  |99 ->
    __ocaml_lex_state15 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state15 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'t' *)
  |116 ->
    __ocaml_lex_state16 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state16 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'o' *)
  |111 ->
    __ocaml_lex_state17 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state17 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'r' *)
  |114 ->
    __ocaml_lex_state18 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state18 lexbuf = match __ocaml_lex_next_char lexbuf with
(* |'y' *)
  |121 ->
    __ocaml_lex_state19 lexbuf
  | _ ->
    lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_last_pos ;
    lexbuf.Lexing.lex_last_action

and __ocaml_lex_state19 lexbuf = (* *)
  0

let rec translate lexbuf =
  __ocaml_lex_init_lexbuf lexbuf 0; 
  let __ocaml_lex_result = __ocaml_lex_state0 lexbuf in
  lexbuf.Lexing.lex_start_p <- lexbuf.Lexing.lex_curr_p;
  lexbuf.Lexing.lex_curr_p <- {lexbuf.Lexing.lex_curr_p with
    Lexing.pos_cnum = lexbuf.Lexing.lex_abs_pos+lexbuf.Lexing.lex_curr_pos};
  match __ocaml_lex_result with
  | 0 ->
# 4 "tst.mll"
                        ( print_string (Sys.getcwd ()) )
# 187 "tst.ml"

  | 1 ->
let
# 5 "tst.mll"
         c
# 193 "tst.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 5 "tst.mll"
            ( print_char c )
# 197 "tst.ml"

  | 2 ->
# 6 "tst.mll"
          ( exit 0 )
# 202 "tst.ml"

  | _ -> raise (Failure "lexing: empty token")


;;

# 8 "tst.mll"
 
  let main () =
    let lexbuf = Lexing.from_channel stdin in
    while true do
      translate lexbuf
    done

  let _ = Printexc.print main ()

# 219 "tst.ml"
