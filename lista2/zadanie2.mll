{ 
  open Printf
}

rule automat = parse
  | "B" { printf "AUTOMAT AKCEPTUJE <B>\n" 
  }
  | "A"	{ printf "AUTOMAT AKCEPTUJE <A>\n" 
  }
  | eof { raise End_of_file 
  }

{
  let main () =
    let lexbuf = Lexing.from_channel stdin in
    while true do
      automat lexbuf
    done

  let _ = Printexc.print main ()
}
