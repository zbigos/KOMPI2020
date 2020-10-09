
void sum_rows(double *restrict a, double *restrict b, long n) {
    for (long i = 0; i < n; i++) {
        b[i] = 0;
        for (long j = 0; j < n; j++)
            b[i] += a[i * n + j];
    }
}

void sum_rows_unr(double *a, double *b, long n) {
    for (long i = 0; i < n; i++) {
        b[i] = 0;
        for (long j = 0; j < n; j++)
            b[i] += a[i * n + j];
    }
}

int main() {
    return 0;
}

/*
0000000000001135 <sum_rows>:
    1135:	4c 8d 04 d5 00 00 00 	lea    0x0(,%rdx,8),%r8
    113c:	00 
    113d:	31 c0                	xor    %eax,%eax
    113f:	48 39 d0             	cmp    %rdx,%rax
    1142:	7d 1f                	jge    1163 <sum_rows+0x2e>
    1144:	31 c9                	xor    %ecx,%ecx
    1146:	0f 57 c0             	xorps  %xmm0,%xmm0
    1149:	f2 0f 58 04 cf       	addsd  (%rdi,%rcx,8),%xmm0
    114e:	48 ff c1             	inc    %rcx
    1151:	48 39 ca             	cmp    %rcx,%rdx
    1154:	75 f3                	jne    1149 <sum_rows+0x14>
    1156:	f2 0f 11 04 c6       	movsd  %xmm0,(%rsi,%rax,8)
    115b:	4c 01 c7             	add    %r8,%rdi
    115e:	48 ff c0             	inc    %rax
    1161:	eb dc                	jmp    113f <sum_rows+0xa>
    1163:	c3                   	retq   

0000000000001164 <sum_rows_unr>:
    1164:	4c 8d 04 d5 00 00 00 	lea    0x0(,%rdx,8),%r8
    116b:	00 
    116c:	31 c9                	xor    %ecx,%ecx
    116e:	48 39 d1             	cmp    %rdx,%rcx
    1171:	7d 2a                	jge    119d <sum_rows_unr+0x39>
    1173:	48 c7 06 00 00 00 00 	movq   $0x0,(%rsi)
    117a:	31 c0                	xor    %eax,%eax
    117c:	f2 0f 10 06          	movsd  (%rsi),%xmm0
    1180:	f2 0f 58 04 c7       	addsd  (%rdi,%rax,8),%xmm0
    1185:	48 ff c0             	inc    %rax
    1188:	f2 0f 11 06          	movsd  %xmm0,(%rsi)
    118c:	48 39 c2             	cmp    %rax,%rdx
    118f:	75 eb                	jne    117c <sum_rows_unr+0x18>
    1191:	48 ff c1             	inc    %rcx
    1194:	48 83 c6 08          	add    $0x8,%rsi
    1198:	4c 01 c7             	add    %r8,%rdi
    119b:	eb d1                	jmp    116e <sum_rows_unr+0xa>
    119d:	c3                   	retq   
    119e:	66 90                	xchg   %ax,%ax

*/