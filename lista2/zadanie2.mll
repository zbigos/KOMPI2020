{
  open Printf
}


rule automat = parse
  | "A""B"*"A"eof { printf "AUTOMAT AKCEPTUJE AB*A\n"
  }
  | "ABA"+eof { printf "AUTOMAT AKCEPTUJE ABA+\n"
  }
  | "B"eof { printf "AUTOMAT AKCEPTUJE <B>\n" 
  }
  | "A"eof	{ printf "AUTOMAT AKCEPTUJE <A>\n" 
  }


{
  let main () =
    let lexbuf = Lexing.from_channel stdin in
    automat lexbuf

  let _ = Printexc.print main ()
}
