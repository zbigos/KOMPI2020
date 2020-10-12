## Ćwiczenia 1
***
### Zadanie 1
Automat skończony do rozponznania ciągów reprezentujących komentarze. Czyli <// rzeczy \n> oraz </* */>
```mermaid
graph LR;
    A[ε]-->|/|/;
    /-->|*|C((/*));
    C((/*))-->|cokolwiek poza *|C((/*));
    
    /-->|/|D[\/\/];
    D[\/\/]-->|cokolwiek poza \n|D((/));

    D[ // ]-->|\n|E[OK];
    C[*/ <rzeczy> ]-->|*|F[*];
    F[*/ <rzeczy> *]-->|/|E[OK];

style E fill:#00a000
```

(Zakładamy że każde nielegalne przejście powoduje wejście w stan nieakceptujący, bez możliwości wyjścia z niego)


***
### Zadanie 2
Napisz regex akceptujący wyrażenia regularne  
`(\/\*[^\*]*\*\/)|(\/\/.*$)`

objaśnienie:  
- capture group1 `(\/\*[^\*]*\*\/)`
    - literalnie `/*`
    - następnie dowolnie wiele znaków niebędących literalnie `*` (za pomocą `[^\*]*`)
    - następnie literalnie `*/` 
- capture group2 `(\/\/.*$)`
    - literalnie `//`
    - następnie dowolnie wiele dowolnych znaków `.*`
    - zakończenie stringa `$` chociaż bezpieczniej zamiast `.*` prosić o `[^\n]*` i literalnie `\n`

***
### Zadanie 3

***
### Zadanie 4
Weźmy automat deterministyczny mający N stanów. Podczas konsumowania jakiegoś ciągu w danym momencie znajdujemy się w wyłącznie jednym z N stanów. Z zasady szufladkowej wiemy ży po skonsumowaniu N+1 razy ciągu `/*` (który jest dla nas istotny, i to go chcemy zliczać), w conajmniej jednym stanie znajdziemy się conajmniej dwa razy. Oznacza to, że nasz automat nie rozpozna od siebie stanu w którym ma N+1 i `<jakaś inna, mniejsza liczba>` zagłębień komentarza. 

Oznacza to, że albo nie będzie wymagał domknięcia wszystkich początków komentarza, bądź stwierdzi że taki komentarz zostal zamknięty przedwcześnie

***
### Zadanie 5
Automat (0+1)*0(0+1) definiuje język sładający się z [skończonych ciągów zer bądź skończonych ciągów 1] + zera + [0 bądź 1]

```mermaid
graph LR;
    A-->|0|A;
    A-->|0|B;
    B-->|0|C;
    B-->|1|C;
style C fill:#00a000
```

zdeterminizuj polaka
```mermaid
graph LR;
    eps-->|1|p1;
    eps-->|0|succ0;
    succ0[0]-->|0|succ00;
    succ00[00000...0]-->|0|succ00;
    succ00-->|1|a[acc];
    
    p1-->|1|p1;

    p1-->|0|bp;
    bp-->|0|acc;
    bp-->|1|acc;
    

style acc fill:#00a000
style succ00 fill:#00a000
style a fill:#00a000
```


***
### Zadanie 6

***
### Zadanie 7
```mermaid
graph LR;
    A-->|0/1|A;
    A-->|0|B;
    B-->|0/1|C[...];
    C-->|0/1|E;
    E-->|0/1|F;
    
style F fill:#00a000
```

A zje wszystkie ciągi 0 i 1 z prefiksu,  
A->B zjada to wymuszone zero  
Następnie N-1 stanów zjada ciąg 0 bądź 1 długości N-1.  
Łącznie N+1 stanów

***
### Zadanie 8