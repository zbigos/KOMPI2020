#include <stdio.h>

static int magic(int y) {
    int sum = 0, x = 1;
    while (x > 0) {
        sum += x ^ y;
        y *= 13;
        x += x / 2 + 1;
    }

    return sum * 42;
}

int main() {
    printf("%d\n", magic(33));
}

// z Os wykonuje się długo (nie wykonał się)
// z O0 wykonuje się instantly i zwraca -608705964

/*
0000000000001135 <magic>:
    1135:	89 7c 24 ec          	mov    %edi,-0x14(%rsp)
    1139:	c7 44 24 fc 00 00 00 	movl   $0x0,-0x4(%rsp)
    1140:	00 
    1141:	c7 44 24 f8 01 00 00 	movl   $0x1,-0x8(%rsp)
    1148:	00 
    1149:	eb 33                	jmp    117e <magic+0x49>
    114b:	8b 44 24 f8          	mov    -0x8(%rsp),%eax
    114f:	33 44 24 ec          	xor    -0x14(%rsp),%eax
    1153:	01 44 24 fc          	add    %eax,-0x4(%rsp)
    1157:	8b 54 24 ec          	mov    -0x14(%rsp),%edx
    115b:	89 d0                	mov    %edx,%eax
    115d:	01 c0                	add    %eax,%eax
    115f:	01 d0                	add    %edx,%eax
    1161:	c1 e0 02             	shl    $0x2,%eax
    1164:	01 d0                	add    %edx,%eax
    1166:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
    116a:	8b 44 24 f8          	mov    -0x8(%rsp),%eax
    116e:	89 c2                	mov    %eax,%edx
    1170:	c1 ea 1f             	shr    $0x1f,%edx
    1173:	01 d0                	add    %edx,%eax
    1175:	d1 f8                	sar    %eax
    1177:	83 c0 01             	add    $0x1,%eax
    117a:	01 44 24 f8          	add    %eax,-0x8(%rsp)
    117e:	83 7c 24 f8 00       	cmpl   $0x0,-0x8(%rsp)
    1183:	7f c6                	jg     114b <magic+0x16>
    1185:	8b 44 24 fc          	mov    -0x4(%rsp),%eax
    1189:	6b c0 2a             	imul   $0x2a,%eax,%eax
    118c:	c3                   	retq   
*/

