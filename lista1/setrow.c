void set_row(long *a, long *b, long i, long n) {
    for (long j = 0 ; j < n; j++)
        a[n * i + j] = b[j];
}

int main() {
    return 0;
}

// gcc setrow.c -march=nehalem -fomit-frame-pointer -Os

/*
    1135:	48 0f af d1          	imul   %rcx,%rdx
    1139:	31 c0                	xor    %eax,%eax
    113b:	48 8d 14 d7          	lea    (%rdi,%rdx,8),%rdx
    113f:	48 39 c8             	cmp    %rcx,%rax
    1142:	7d 0d                	jge    1151 <set_row+0x1c>
    1144:	48 8b 3c c6          	mov    (%rsi,%rax,8),%rdi
    1148:	48 89 3c c2          	mov    %rdi,(%rdx,%rax,8)
    114c:	48 ff c0             	inc    %rax
    114f:	eb ee                	jmp    113f <set_row+0xa>
    1151:	c3                   	retq   
    1152:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1159:	00 00 00 
    115c:	0f 1f 40 00          	nopl   0x0(%rax)
*/

// rdi <- pointer na a
// rsi <- pointer na b 
// rdx <- szerokość rzędu w a = i
// rcx <- liczba bajtów do skopiowania = n

// 1135. Mnożymy rcx * rdx (n*i). Bo nie ma sensu żeby to liczyć za każdym razem.
// każdy access wykonujemy przy pomocy  