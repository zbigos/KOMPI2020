## Ćwiczenia II
### Zadanie 1
niedeterministyczne arcydzieło
```mermaid
graph TD;
    E -->|A|c1[ABA+a];
    c1 -->|B|c2[ABA+b];
    c2 -->|A|c3[ABA+c];

    c3 -->|A|c4[ABA+d];
    c4 -->|B|c5[ABA+e];
    c5 -->|A|c3;

    E --> |A|d1[AB*A+a]
    d1 --> |B|d1[AB*A+a]
    d1 --> |A|d2[AB*A+b]
    
    E --> |A|A;
    E --> |B|B;
    
    
style c3 fill:#00a000
style d2 fill:#00a000
style A fill:#00a000
style B fill:#00a000
```

_Seeing this beautifull finite automata fills you with determination_

```mermaid
graph TD;
    E-->|A|a[A + ABA+a + AB*A+a];
    E-->|B|b[B];

    a[A + ABA+a + AB*A+a]-->|A|c[AB*A+b];
    a[A + ABA+a + AB*A+a]-->|B|d[ABA+b + AB*A+a];

    d[ABA+b + AB*A+a]-->|A|e[ABA+c + AB*A+b];
    d[ABA+b + AB*A+a]-->|B|f[AB*A+a];
    f[AB*A+a]-->|B|f;
    f[AB*A+a]-->|A|g[AB*A+b];
    
    e[ABA+c + AB*A+b]-->|A|h[ABA+d];
    h[ABA+d]-->|B|i[ABA+e];
    i[ABA+e]-->|A|j[ABA+c];

    j[ABA+c]-->|A|k[ABA+d];
    k[ABA+d]-->|B|l[ABA+e];
    l[ABA+d]-->|A|j;


style b fill:#00a000
style a fill:#00a000
style c fill:#00a000
style e fill:#00a000
style g fill:#00a000
style j fill:#00a000

```
***
### Zadanie 2

_akcje semantyczne_ = jest to jakiś kawałek kodu jaki lekser wykonuje gdy zmatchowany zostanie kawałek tekstu.

```
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
```

on tam sobie buduje taki automat
```mermaid
graph TD;
    0-->|A|2
    0-->|B|1
    1-->|eof|13
    2-->|B|5
    2-->|A|4
    2-->|eof|3
    3-->|fin|A
    4-->|eof|9
    5-->|B|7
    5-->|A|6
    6-->|A|8
    6-->|eof|9
    7-->|B|7
    7-->|A|4
    8-->|B|10
    9-->|fin|ABBBA
    10-->|A|11
    11-->|eof|12
    11-->|A|8
    12-->|fin|ABAABA
    13-->|fin|B

style 2 fill:#00a000
style 1 fill:#00a000

style 3 fill:#777777
style 13 fill:#777777
style A fill:#00ff00
style B fill:#00ff00
style 4 fill:#777777
style 12 fill:#777777
style 9 fill:#777777
style ABAABA fill:#00ff00
style ABBBA fill:#00ff00

style 8 fill:#ffa500
style 10 fill:#ffa500
style 11 fill:#ffa500
linkStyle 0 stroke-width:2px,fill:none,stroke:red;
linkStyle 3 stroke-width:2px,fill:none,stroke:red;
linkStyle 9 stroke-width:2px,fill:none,stroke:red;
linkStyle 11 stroke-width:2px,fill:none,stroke:red;
linkStyle 15 stroke-width:2px,fill:none,stroke:red;

```
***
### Zadanie 3
Zaczniemy od pokazania że języki dane w zadaniu
$$ S \rightarrow (S) | SS | \varepsilon $$
oraz
$$ S \rightarrow S(S) | \varepsilon $$
generują te same języki. 
Żeby pokazać że L1 == L2 pokażemy że L1 zawiera się w L2 i L2 zawiera się w L1.
* **L1 w L2** Tutaj jest prosto.  

Widzimy że:
L1:   
$$ S \rightarrow \varepsilon $$   
ma odpowiednik w L2: 
$$ S \rightarrow \varepsilon $$
Oraz L1: 
$$ S \rightarrow S(S)  $$
ma odpowiednik w L2:
$$ S \rightarrow SS \rightarrow (S)S $$
A skoro każdą produkcję L1 możemy uzyskać złożeniem produkcji w L2, każde wyprowadzenie słowa L1 możemy emulować produkcjami L2. Stąd, L1 należy do L2
* **L2 w L1** Tutaj jest ciężej:  

_powiemy że nawiasowanie ma długość k, jeśli występuje w nim k * '(' oraz k * ')'_
Zakładamy (na mocy indukcji mocnej) że dla każdego nawiasowania długości k-1 wygenerowanego przez L1, mamy odpowiednik produkcji w L2.
Weźmy teraz jakieś nawiasowanie z L2 długości k. Nawiasowanie to będzie skonkatenowanym wyrażeniem `(n)` gdzie n to jakieś (różne) nawiasowania długości mniejszej niż k. Wiemy że umiemy je wyprowadzić w L2 z założeń indukcyjnych. Czyli widzimy że jeśli L2 będzie umiał wyprodukować `(S)(S)(S)...(S)` (tyle nawiasów ile dane nawiasowanie z L1 posiada) to produkcje S->n są już pokazane. No i widać że tak się da (tldr cały czas rozwijamy s bez nawiasu i na koniec ubijamy je epsilonem)

L2 jest jednoznaczna, bo każde nawiasowanie generuje nam graf produkcji. Na wzór tego co było w dowodzie indukcyjnym

***
### Zadanie 4
$$ S \rightarrow (S) | [S] | SS | \varepsilon $$
Jest niejednoznaczny z bardzo prostego powodu. Słowo SSS mogło powstać na dwa sposoby.
$$ S \rightarrow \color{red}SS \rightarrow \color{red}S\color{red}SS $$ 
$$ S \rightarrow S\color{red}S \rightarrow S\color{red}S\color{red}S $$ 

Dlatego też użyjemy tricku z wykładu i dodamy drugi nieterminal.
$$ S \rightarrow S' | SS' | \varepsilon $$
$$ S' \rightarrow (S) | [S] $$
***
### Zadanie 5
E -> E+E' | E-E' | E'
E' -> E' * E'' | E''
E'' -> E''' ^ E'' | E'''
E''' -> id | (E)
***
### Zadanie 6
***
### Zadanie 7
***
### Zadanie 8
***
