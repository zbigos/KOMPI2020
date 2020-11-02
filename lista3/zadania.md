# KOMPI 3
### Zadanie 1
***
### Zadanie 2
***
### Zadanie 3
***
### Zadanie 4
dobra, zanim zaczniemy grzebać w bebechach tego arcydzieła fajnie byłoby spojrzeć na produkcje tego parsera  

```ocaml
main:
| e = expr EOL
    { e }

expr:
| i = INT
    { i }
| LPAREN e = expr RPAREN
    { e }
| e1 = expr PLUS e2 = expr
    { e1 + e2 }
| e1 = expr MINUS e2 = expr
    { e1 - e2 }
| e1 = expr TIMES e2 = expr
    { e1 * e2 }
| e1 = expr DIV e2 = expr
    { e1 / e2 }
| MINUS e = expr %prec UMINUS
    { - e }
```
#### A
No jest to raczej superdefaultowa rzecz, ale niestety widać od razu że jest to cholernie niedeterministyczne, możemy tak naprawdę zrobić tutaj cokolwiek (dowolne wyrażenie docisnąć do bardzo dużej liczby rozbiorów).  
Idąc trochę przeciwnie do poleceń autora najpierw wywalimy te `%left` i `nonassos` w definicji tokenu, bo w sumie czemu nie.  
zapisujemy ten parser i prosimy ładnie menhera żeby wypisał konflikty  
podczas budowania już widać że musiał się zastanowić co zrobić jak nie ma tego prec i %noassoc.  
```
Built an LR(0) automaton with 19 states.
The construction mode is pager.
Built an LR(1) automaton with 19 states.
16 shift/reduce conflicts were silently solved.
```
`$menhir parser.mly --explain`  
to nic nie daje xD
dobra, no to zobaczmy sobie w bebechy tego dumpa, zrzućmy go do parser.automaton_b, zróbmy jeszcze raz tę rzecz z tym %prec, porównajmy diffem


#### B
wrzucamy poprzednią rzecz do parser.automaton_nothings, porównujemy do przypadku w którym jednak mamy to noassoc i to drugie coś, zrobimy sobie na tym diff

***
### Zadanie 5
***
### Zadanie 6
***
### Zadanie 7
***
### Zadanie 8
***