{
  open Printf
}


rule automat = parse
  | "A""B"*"A" { printf "AUTOMAT PRAWDOPODOBNIE AKCEPTUJE AB*A\n"
  }
  | "ABA"+ { printf "AUTOMAT PRAWDOPODOBNIE AKCEPTUJE ABA+\n"
  }
  | "B" { printf "AUTOMAT PRAWDOPODOBNIE AKCEPTUJE <B>\n" 
  }
  | "A"	{ printf "AUTOMAT AKCEPTUJE <A>\n" 
  }


{
  let main () =
    let lexbuf = Lexing.from_channel stdin in
    automat lexbuf;
    
    
  let _ = Printexc.print main ()
}
