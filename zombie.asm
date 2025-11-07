
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 a1 02 00 00       	call   2b7 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 2b 03 00 00       	call   34f <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 93 02 00 00       	call   2bf <exit>
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  30:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  31:	31 c0                	xor    %eax,%eax
{
  33:	89 e5                	mov    %esp,%ebp
  35:	53                   	push   %ebx
  36:	8b 4d 08             	mov    0x8(%ebp),%ecx
  39:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  40:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  44:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  47:	83 c0 01             	add    $0x1,%eax
  4a:	84 d2                	test   %dl,%dl
  4c:	75 f2                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  51:	89 c8                	mov    %ecx,%eax
  53:	c9                   	leave
  54:	c3                   	ret
  55:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  5c:	00 
  5d:	8d 76 00             	lea    0x0(%esi),%esi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 55 08             	mov    0x8(%ebp),%edx
  67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  6a:	0f b6 02             	movzbl (%edx),%eax
  6d:	84 c0                	test   %al,%al
  6f:	75 17                	jne    88 <strcmp+0x28>
  71:	eb 3a                	jmp    ad <strcmp+0x4d>
  73:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  78:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  7c:	83 c2 01             	add    $0x1,%edx
  7f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  82:	84 c0                	test   %al,%al
  84:	74 1a                	je     a0 <strcmp+0x40>
  86:	89 d9                	mov    %ebx,%ecx
  88:	0f b6 19             	movzbl (%ecx),%ebx
  8b:	38 c3                	cmp    %al,%bl
  8d:	74 e9                	je     78 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  8f:	29 d8                	sub    %ebx,%eax
}
  91:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  94:	c9                   	leave
  95:	c3                   	ret
  96:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  9d:	00 
  9e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
  a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  a4:	31 c0                	xor    %eax,%eax
  a6:	29 d8                	sub    %ebx,%eax
}
  a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ab:	c9                   	leave
  ac:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  ad:	0f b6 19             	movzbl (%ecx),%ebx
  b0:	31 c0                	xor    %eax,%eax
  b2:	eb db                	jmp    8f <strcmp+0x2f>
  b4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  bb:	00 
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000c0 <strlen>:

uint
strlen(const char *s)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  c6:	80 3a 00             	cmpb   $0x0,(%edx)
  c9:	74 15                	je     e0 <strlen+0x20>
  cb:	31 c0                	xor    %eax,%eax
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  d0:	83 c0 01             	add    $0x1,%eax
  d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  d7:	89 c1                	mov    %eax,%ecx
  d9:	75 f5                	jne    d0 <strlen+0x10>
    ;
  return n;
}
  db:	89 c8                	mov    %ecx,%eax
  dd:	5d                   	pop    %ebp
  de:	c3                   	ret
  df:	90                   	nop
  for(n = 0; s[n]; n++)
  e0:	31 c9                	xor    %ecx,%ecx
}
  e2:	5d                   	pop    %ebp
  e3:	89 c8                	mov    %ecx,%eax
  e5:	c3                   	ret
  e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ed:	00 
  ee:	66 90                	xchg   %ax,%ax

000000f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	89 d7                	mov    %edx,%edi
  ff:	fc                   	cld
 100:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 102:	8b 7d fc             	mov    -0x4(%ebp),%edi
 105:	89 d0                	mov    %edx,%eax
 107:	c9                   	leave
 108:	c3                   	ret
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000110 <strchr>:

char*
strchr(const char *s, char c)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 11a:	0f b6 10             	movzbl (%eax),%edx
 11d:	84 d2                	test   %dl,%dl
 11f:	75 12                	jne    133 <strchr+0x23>
 121:	eb 1d                	jmp    140 <strchr+0x30>
 123:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 128:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 12c:	83 c0 01             	add    $0x1,%eax
 12f:	84 d2                	test   %dl,%dl
 131:	74 0d                	je     140 <strchr+0x30>
    if(*s == c)
 133:	38 d1                	cmp    %dl,%cl
 135:	75 f1                	jne    128 <strchr+0x18>
      return (char*)s;
  return 0;
}
 137:	5d                   	pop    %ebp
 138:	c3                   	ret
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 140:	31 c0                	xor    %eax,%eax
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret
 144:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 14b:	00 
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <gets>:

char*
gets(char *buf, int max)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 155:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 158:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 159:	31 db                	xor    %ebx,%ebx
{
 15b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 15e:	eb 27                	jmp    187 <gets+0x37>
    cc = read(0, &c, 1);
 160:	83 ec 04             	sub    $0x4,%esp
 163:	6a 01                	push   $0x1
 165:	56                   	push   %esi
 166:	6a 00                	push   $0x0
 168:	e8 6a 01 00 00       	call   2d7 <read>
    if(cc < 1)
 16d:	83 c4 10             	add    $0x10,%esp
 170:	85 c0                	test   %eax,%eax
 172:	7e 1d                	jle    191 <gets+0x41>
      break;
    buf[i++] = c;
 174:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 178:	8b 55 08             	mov    0x8(%ebp),%edx
 17b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 17f:	3c 0a                	cmp    $0xa,%al
 181:	74 10                	je     193 <gets+0x43>
 183:	3c 0d                	cmp    $0xd,%al
 185:	74 0c                	je     193 <gets+0x43>
  for(i=0; i+1 < max; ){
 187:	89 df                	mov    %ebx,%edi
 189:	83 c3 01             	add    $0x1,%ebx
 18c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 18f:	7c cf                	jl     160 <gets+0x10>
 191:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 19a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 19d:	5b                   	pop    %ebx
 19e:	5e                   	pop    %esi
 19f:	5f                   	pop    %edi
 1a0:	5d                   	pop    %ebp
 1a1:	c3                   	ret
 1a2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1a9:	00 
 1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b5:	83 ec 08             	sub    $0x8,%esp
 1b8:	6a 00                	push   $0x0
 1ba:	ff 75 08             	push   0x8(%ebp)
 1bd:	e8 3d 01 00 00       	call   2ff <open>
  if(fd < 0)
 1c2:	83 c4 10             	add    $0x10,%esp
 1c5:	85 c0                	test   %eax,%eax
 1c7:	78 27                	js     1f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1c9:	83 ec 08             	sub    $0x8,%esp
 1cc:	ff 75 0c             	push   0xc(%ebp)
 1cf:	89 c3                	mov    %eax,%ebx
 1d1:	50                   	push   %eax
 1d2:	e8 40 01 00 00       	call   317 <fstat>
  close(fd);
 1d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1da:	89 c6                	mov    %eax,%esi
  close(fd);
 1dc:	e8 06 01 00 00       	call   2e7 <close>
  return r;
 1e1:	83 c4 10             	add    $0x10,%esp
}
 1e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e7:	89 f0                	mov    %esi,%eax
 1e9:	5b                   	pop    %ebx
 1ea:	5e                   	pop    %esi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 1f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1f5:	eb ed                	jmp    1e4 <stat+0x34>
 1f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1fe:	00 
 1ff:	90                   	nop

00000200 <atoi>:

int
atoi(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	53                   	push   %ebx
 204:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 207:	0f be 02             	movsbl (%edx),%eax
 20a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 20d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 210:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 215:	77 1e                	ja     235 <atoi+0x35>
 217:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 21e:	00 
 21f:	90                   	nop
    n = n*10 + *s++ - '0';
 220:	83 c2 01             	add    $0x1,%edx
 223:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 226:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 22a:	0f be 02             	movsbl (%edx),%eax
 22d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 230:	80 fb 09             	cmp    $0x9,%bl
 233:	76 eb                	jbe    220 <atoi+0x20>
  return n;
}
 235:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 238:	89 c8                	mov    %ecx,%eax
 23a:	c9                   	leave
 23b:	c3                   	ret
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000240 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	8b 45 10             	mov    0x10(%ebp),%eax
 247:	8b 55 08             	mov    0x8(%ebp),%edx
 24a:	56                   	push   %esi
 24b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 24e:	85 c0                	test   %eax,%eax
 250:	7e 13                	jle    265 <memmove+0x25>
 252:	01 d0                	add    %edx,%eax
  dst = vdst;
 254:	89 d7                	mov    %edx,%edi
 256:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 25d:	00 
 25e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 260:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 261:	39 f8                	cmp    %edi,%eax
 263:	75 fb                	jne    260 <memmove+0x20>
  return vdst;
}
 265:	5e                   	pop    %esi
 266:	89 d0                	mov    %edx,%eax
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret
 26b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000270 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 55 10             	mov    0x10(%ebp),%edx
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(n > 0 && *p && *p == *q)
 27d:	85 d2                	test   %edx,%edx
 27f:	75 16                	jne    297 <strncmp+0x27>
 281:	eb 2d                	jmp    2b0 <strncmp+0x40>
 283:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 288:	3a 19                	cmp    (%ecx),%bl
 28a:	75 12                	jne    29e <strncmp+0x2e>
    n--, p++, q++;
 28c:	83 c0 01             	add    $0x1,%eax
 28f:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
 292:	83 ea 01             	sub    $0x1,%edx
 295:	74 19                	je     2b0 <strncmp+0x40>
 297:	0f b6 18             	movzbl (%eax),%ebx
 29a:	84 db                	test   %bl,%bl
 29c:	75 ea                	jne    288 <strncmp+0x18>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
 29e:	0f b6 00             	movzbl (%eax),%eax
 2a1:	0f b6 11             	movzbl (%ecx),%edx
}
 2a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2a7:	c9                   	leave
  return (uchar)*p - (uchar)*q;
 2a8:	29 d0                	sub    %edx,%eax
}
 2aa:	c3                   	ret
 2ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 2b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 2b3:	31 c0                	xor    %eax,%eax
}
 2b5:	c9                   	leave
 2b6:	c3                   	ret

000002b7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2b7:	b8 01 00 00 00       	mov    $0x1,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret

000002bf <exit>:
SYSCALL(exit)
 2bf:	b8 02 00 00 00       	mov    $0x2,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret

000002c7 <wait>:
SYSCALL(wait)
 2c7:	b8 03 00 00 00       	mov    $0x3,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret

000002cf <pipe>:
SYSCALL(pipe)
 2cf:	b8 04 00 00 00       	mov    $0x4,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret

000002d7 <read>:
SYSCALL(read)
 2d7:	b8 05 00 00 00       	mov    $0x5,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret

000002df <write>:
SYSCALL(write)
 2df:	b8 10 00 00 00       	mov    $0x10,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret

000002e7 <close>:
SYSCALL(close)
 2e7:	b8 15 00 00 00       	mov    $0x15,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret

000002ef <kill>:
SYSCALL(kill)
 2ef:	b8 06 00 00 00       	mov    $0x6,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret

000002f7 <exec>:
SYSCALL(exec)
 2f7:	b8 07 00 00 00       	mov    $0x7,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret

000002ff <open>:
SYSCALL(open)
 2ff:	b8 0f 00 00 00       	mov    $0xf,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret

00000307 <mknod>:
SYSCALL(mknod)
 307:	b8 11 00 00 00       	mov    $0x11,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret

0000030f <unlink>:
SYSCALL(unlink)
 30f:	b8 12 00 00 00       	mov    $0x12,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret

00000317 <fstat>:
SYSCALL(fstat)
 317:	b8 08 00 00 00       	mov    $0x8,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret

0000031f <link>:
SYSCALL(link)
 31f:	b8 13 00 00 00       	mov    $0x13,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret

00000327 <mkdir>:
SYSCALL(mkdir)
 327:	b8 14 00 00 00       	mov    $0x14,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret

0000032f <chdir>:
SYSCALL(chdir)
 32f:	b8 09 00 00 00       	mov    $0x9,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret

00000337 <dup>:
SYSCALL(dup)
 337:	b8 0a 00 00 00       	mov    $0xa,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret

0000033f <getpid>:
SYSCALL(getpid)
 33f:	b8 0b 00 00 00       	mov    $0xb,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret

00000347 <sbrk>:
SYSCALL(sbrk)
 347:	b8 0c 00 00 00       	mov    $0xc,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret

0000034f <sleep>:
SYSCALL(sleep)
 34f:	b8 0d 00 00 00       	mov    $0xd,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret

00000357 <uptime>:
SYSCALL(uptime)
 357:	b8 0e 00 00 00       	mov    $0xe,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret

0000035f <getprocs>:
SYSCALL(getprocs)
 35f:	b8 16 00 00 00       	mov    $0x16,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret

00000367 <clone>:
SYSCALL(clone)
 367:	b8 17 00 00 00       	mov    $0x17,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret

0000036f <join>:
SYSCALL(join)
 36f:	b8 18 00 00 00       	mov    $0x18,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret
 377:	66 90                	xchg   %ax,%ax
 379:	66 90                	xchg   %ax,%ax
 37b:	66 90                	xchg   %ax,%ax
 37d:	66 90                	xchg   %ax,%ax
 37f:	90                   	nop

00000380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	53                   	push   %ebx
 386:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 388:	89 d1                	mov    %edx,%ecx
{
 38a:	83 ec 3c             	sub    $0x3c,%esp
 38d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 390:	85 d2                	test   %edx,%edx
 392:	0f 89 80 00 00 00    	jns    418 <printint+0x98>
 398:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 39c:	74 7a                	je     418 <printint+0x98>
    x = -xx;
 39e:	f7 d9                	neg    %ecx
    neg = 1;
 3a0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 3a5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 3a8:	31 f6                	xor    %esi,%esi
 3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3b0:	89 c8                	mov    %ecx,%eax
 3b2:	31 d2                	xor    %edx,%edx
 3b4:	89 f7                	mov    %esi,%edi
 3b6:	f7 f3                	div    %ebx
 3b8:	8d 76 01             	lea    0x1(%esi),%esi
 3bb:	0f b6 92 74 08 00 00 	movzbl 0x874(%edx),%edx
 3c2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 3c6:	89 ca                	mov    %ecx,%edx
 3c8:	89 c1                	mov    %eax,%ecx
 3ca:	39 da                	cmp    %ebx,%edx
 3cc:	73 e2                	jae    3b0 <printint+0x30>
  if(neg)
 3ce:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3d1:	85 c0                	test   %eax,%eax
 3d3:	74 07                	je     3dc <printint+0x5c>
    buf[i++] = '-';
 3d5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 3da:	89 f7                	mov    %esi,%edi
 3dc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 3df:	8b 75 c0             	mov    -0x40(%ebp),%esi
 3e2:	01 df                	add    %ebx,%edi
 3e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 3e8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 3eb:	83 ec 04             	sub    $0x4,%esp
 3ee:	88 45 d7             	mov    %al,-0x29(%ebp)
 3f1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 3f4:	6a 01                	push   $0x1
 3f6:	50                   	push   %eax
 3f7:	56                   	push   %esi
 3f8:	e8 e2 fe ff ff       	call   2df <write>
  while(--i >= 0)
 3fd:	89 f8                	mov    %edi,%eax
 3ff:	83 c4 10             	add    $0x10,%esp
 402:	83 ef 01             	sub    $0x1,%edi
 405:	39 c3                	cmp    %eax,%ebx
 407:	75 df                	jne    3e8 <printint+0x68>
}
 409:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40c:	5b                   	pop    %ebx
 40d:	5e                   	pop    %esi
 40e:	5f                   	pop    %edi
 40f:	5d                   	pop    %ebp
 410:	c3                   	ret
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 418:	31 c0                	xor    %eax,%eax
 41a:	eb 89                	jmp    3a5 <printint+0x25>
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000420 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 429:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 42c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 42f:	0f b6 1e             	movzbl (%esi),%ebx
 432:	83 c6 01             	add    $0x1,%esi
 435:	84 db                	test   %bl,%bl
 437:	74 67                	je     4a0 <printf+0x80>
 439:	8d 4d 10             	lea    0x10(%ebp),%ecx
 43c:	31 d2                	xor    %edx,%edx
 43e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 441:	eb 34                	jmp    477 <printf+0x57>
 443:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 448:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 44b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 450:	83 f8 25             	cmp    $0x25,%eax
 453:	74 18                	je     46d <printf+0x4d>
  write(fd, &c, 1);
 455:	83 ec 04             	sub    $0x4,%esp
 458:	8d 45 e7             	lea    -0x19(%ebp),%eax
 45b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 45e:	6a 01                	push   $0x1
 460:	50                   	push   %eax
 461:	57                   	push   %edi
 462:	e8 78 fe ff ff       	call   2df <write>
 467:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 46a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 46d:	0f b6 1e             	movzbl (%esi),%ebx
 470:	83 c6 01             	add    $0x1,%esi
 473:	84 db                	test   %bl,%bl
 475:	74 29                	je     4a0 <printf+0x80>
    c = fmt[i] & 0xff;
 477:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 47a:	85 d2                	test   %edx,%edx
 47c:	74 ca                	je     448 <printf+0x28>
      }
    } else if(state == '%'){
 47e:	83 fa 25             	cmp    $0x25,%edx
 481:	75 ea                	jne    46d <printf+0x4d>
      if(c == 'd'){
 483:	83 f8 25             	cmp    $0x25,%eax
 486:	0f 84 04 01 00 00    	je     590 <printf+0x170>
 48c:	83 e8 63             	sub    $0x63,%eax
 48f:	83 f8 15             	cmp    $0x15,%eax
 492:	77 1c                	ja     4b0 <printf+0x90>
 494:	ff 24 85 1c 08 00 00 	jmp    *0x81c(,%eax,4)
 49b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a3:	5b                   	pop    %ebx
 4a4:	5e                   	pop    %esi
 4a5:	5f                   	pop    %edi
 4a6:	5d                   	pop    %ebp
 4a7:	c3                   	ret
 4a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4af:	00 
  write(fd, &c, 1);
 4b0:	83 ec 04             	sub    $0x4,%esp
 4b3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 4b6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4ba:	6a 01                	push   $0x1
 4bc:	52                   	push   %edx
 4bd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 4c0:	57                   	push   %edi
 4c1:	e8 19 fe ff ff       	call   2df <write>
 4c6:	83 c4 0c             	add    $0xc,%esp
 4c9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4cc:	6a 01                	push   $0x1
 4ce:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4d1:	52                   	push   %edx
 4d2:	57                   	push   %edi
 4d3:	e8 07 fe ff ff       	call   2df <write>
        putc(fd, c);
 4d8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4db:	31 d2                	xor    %edx,%edx
 4dd:	eb 8e                	jmp    46d <printf+0x4d>
 4df:	90                   	nop
        printint(fd, *ap, 16, 0);
 4e0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4e3:	83 ec 0c             	sub    $0xc,%esp
 4e6:	b9 10 00 00 00       	mov    $0x10,%ecx
 4eb:	8b 13                	mov    (%ebx),%edx
 4ed:	6a 00                	push   $0x0
 4ef:	89 f8                	mov    %edi,%eax
        ap++;
 4f1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 4f4:	e8 87 fe ff ff       	call   380 <printint>
        ap++;
 4f9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4fc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4ff:	31 d2                	xor    %edx,%edx
 501:	e9 67 ff ff ff       	jmp    46d <printf+0x4d>
        s = (char*)*ap;
 506:	8b 45 d0             	mov    -0x30(%ebp),%eax
 509:	8b 18                	mov    (%eax),%ebx
        ap++;
 50b:	83 c0 04             	add    $0x4,%eax
 50e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 511:	85 db                	test   %ebx,%ebx
 513:	0f 84 87 00 00 00    	je     5a0 <printf+0x180>
        while(*s != 0){
 519:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 51c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 51e:	84 c0                	test   %al,%al
 520:	0f 84 47 ff ff ff    	je     46d <printf+0x4d>
 526:	8d 55 e7             	lea    -0x19(%ebp),%edx
 529:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 52c:	89 de                	mov    %ebx,%esi
 52e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
 533:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 536:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 539:	6a 01                	push   $0x1
 53b:	53                   	push   %ebx
 53c:	57                   	push   %edi
 53d:	e8 9d fd ff ff       	call   2df <write>
        while(*s != 0){
 542:	0f b6 06             	movzbl (%esi),%eax
 545:	83 c4 10             	add    $0x10,%esp
 548:	84 c0                	test   %al,%al
 54a:	75 e4                	jne    530 <printf+0x110>
      state = 0;
 54c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 54f:	31 d2                	xor    %edx,%edx
 551:	e9 17 ff ff ff       	jmp    46d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 556:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 559:	83 ec 0c             	sub    $0xc,%esp
 55c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 561:	8b 13                	mov    (%ebx),%edx
 563:	6a 01                	push   $0x1
 565:	eb 88                	jmp    4ef <printf+0xcf>
        putc(fd, *ap);
 567:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 56a:	83 ec 04             	sub    $0x4,%esp
 56d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 570:	8b 03                	mov    (%ebx),%eax
        ap++;
 572:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 575:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 578:	6a 01                	push   $0x1
 57a:	52                   	push   %edx
 57b:	57                   	push   %edi
 57c:	e8 5e fd ff ff       	call   2df <write>
        ap++;
 581:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 584:	83 c4 10             	add    $0x10,%esp
      state = 0;
 587:	31 d2                	xor    %edx,%edx
 589:	e9 df fe ff ff       	jmp    46d <printf+0x4d>
 58e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 590:	83 ec 04             	sub    $0x4,%esp
 593:	88 5d e7             	mov    %bl,-0x19(%ebp)
 596:	8d 55 e7             	lea    -0x19(%ebp),%edx
 599:	6a 01                	push   $0x1
 59b:	e9 31 ff ff ff       	jmp    4d1 <printf+0xb1>
 5a0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 5a5:	bb 14 08 00 00       	mov    $0x814,%ebx
 5aa:	e9 77 ff ff ff       	jmp    526 <printf+0x106>
 5af:	90                   	nop

000005b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b1:	a1 e8 0b 00 00       	mov    0xbe8,%eax
{
 5b6:	89 e5                	mov    %esp,%ebp
 5b8:	57                   	push   %edi
 5b9:	56                   	push   %esi
 5ba:	53                   	push   %ebx
 5bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5c8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ca:	39 c8                	cmp    %ecx,%eax
 5cc:	73 32                	jae    600 <free+0x50>
 5ce:	39 d1                	cmp    %edx,%ecx
 5d0:	72 04                	jb     5d6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d2:	39 d0                	cmp    %edx,%eax
 5d4:	72 32                	jb     608 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5d6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5d9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5dc:	39 fa                	cmp    %edi,%edx
 5de:	74 30                	je     610 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5e0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5e3:	8b 50 04             	mov    0x4(%eax),%edx
 5e6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5e9:	39 f1                	cmp    %esi,%ecx
 5eb:	74 3a                	je     627 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5ed:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5ef:	5b                   	pop    %ebx
  freep = p;
 5f0:	a3 e8 0b 00 00       	mov    %eax,0xbe8
}
 5f5:	5e                   	pop    %esi
 5f6:	5f                   	pop    %edi
 5f7:	5d                   	pop    %ebp
 5f8:	c3                   	ret
 5f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 600:	39 d0                	cmp    %edx,%eax
 602:	72 04                	jb     608 <free+0x58>
 604:	39 d1                	cmp    %edx,%ecx
 606:	72 ce                	jb     5d6 <free+0x26>
{
 608:	89 d0                	mov    %edx,%eax
 60a:	eb bc                	jmp    5c8 <free+0x18>
 60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 610:	03 72 04             	add    0x4(%edx),%esi
 613:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 616:	8b 10                	mov    (%eax),%edx
 618:	8b 12                	mov    (%edx),%edx
 61a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 61d:	8b 50 04             	mov    0x4(%eax),%edx
 620:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 623:	39 f1                	cmp    %esi,%ecx
 625:	75 c6                	jne    5ed <free+0x3d>
    p->s.size += bp->s.size;
 627:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 62a:	a3 e8 0b 00 00       	mov    %eax,0xbe8
    p->s.size += bp->s.size;
 62f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 632:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 635:	89 08                	mov    %ecx,(%eax)
}
 637:	5b                   	pop    %ebx
 638:	5e                   	pop    %esi
 639:	5f                   	pop    %edi
 63a:	5d                   	pop    %ebp
 63b:	c3                   	ret
 63c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000640 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 649:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 64c:	8b 15 e8 0b 00 00    	mov    0xbe8,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 652:	8d 78 07             	lea    0x7(%eax),%edi
 655:	c1 ef 03             	shr    $0x3,%edi
 658:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 65b:	85 d2                	test   %edx,%edx
 65d:	0f 84 8d 00 00 00    	je     6f0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 663:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 665:	8b 48 04             	mov    0x4(%eax),%ecx
 668:	39 f9                	cmp    %edi,%ecx
 66a:	73 64                	jae    6d0 <malloc+0x90>
  if(nu < 4096)
 66c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 671:	39 df                	cmp    %ebx,%edi
 673:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 676:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 67d:	eb 0a                	jmp    689 <malloc+0x49>
 67f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 680:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 682:	8b 48 04             	mov    0x4(%eax),%ecx
 685:	39 f9                	cmp    %edi,%ecx
 687:	73 47                	jae    6d0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 689:	89 c2                	mov    %eax,%edx
 68b:	3b 05 e8 0b 00 00    	cmp    0xbe8,%eax
 691:	75 ed                	jne    680 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 693:	83 ec 0c             	sub    $0xc,%esp
 696:	56                   	push   %esi
 697:	e8 ab fc ff ff       	call   347 <sbrk>
  if(p == (char*)-1)
 69c:	83 c4 10             	add    $0x10,%esp
 69f:	83 f8 ff             	cmp    $0xffffffff,%eax
 6a2:	74 1c                	je     6c0 <malloc+0x80>
  hp->s.size = nu;
 6a4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6a7:	83 ec 0c             	sub    $0xc,%esp
 6aa:	83 c0 08             	add    $0x8,%eax
 6ad:	50                   	push   %eax
 6ae:	e8 fd fe ff ff       	call   5b0 <free>
  return freep;
 6b3:	8b 15 e8 0b 00 00    	mov    0xbe8,%edx
      if((p = morecore(nunits)) == 0)
 6b9:	83 c4 10             	add    $0x10,%esp
 6bc:	85 d2                	test   %edx,%edx
 6be:	75 c0                	jne    680 <malloc+0x40>
        return 0;
  }
}
 6c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6c3:	31 c0                	xor    %eax,%eax
}
 6c5:	5b                   	pop    %ebx
 6c6:	5e                   	pop    %esi
 6c7:	5f                   	pop    %edi
 6c8:	5d                   	pop    %ebp
 6c9:	c3                   	ret
 6ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6d0:	39 cf                	cmp    %ecx,%edi
 6d2:	74 4c                	je     720 <malloc+0xe0>
        p->s.size -= nunits;
 6d4:	29 f9                	sub    %edi,%ecx
 6d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6dc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 6df:	89 15 e8 0b 00 00    	mov    %edx,0xbe8
}
 6e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6e8:	83 c0 08             	add    $0x8,%eax
}
 6eb:	5b                   	pop    %ebx
 6ec:	5e                   	pop    %esi
 6ed:	5f                   	pop    %edi
 6ee:	5d                   	pop    %ebp
 6ef:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 6f0:	c7 05 e8 0b 00 00 ec 	movl   $0xbec,0xbe8
 6f7:	0b 00 00 
    base.s.size = 0;
 6fa:	b8 ec 0b 00 00       	mov    $0xbec,%eax
    base.s.ptr = freep = prevp = &base;
 6ff:	c7 05 ec 0b 00 00 ec 	movl   $0xbec,0xbec
 706:	0b 00 00 
    base.s.size = 0;
 709:	c7 05 f0 0b 00 00 00 	movl   $0x0,0xbf0
 710:	00 00 00 
    if(p->s.size >= nunits){
 713:	e9 54 ff ff ff       	jmp    66c <malloc+0x2c>
 718:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 71f:	00 
        prevp->s.ptr = p->s.ptr;
 720:	8b 08                	mov    (%eax),%ecx
 722:	89 0a                	mov    %ecx,(%edx)
 724:	eb b9                	jmp    6df <malloc+0x9f>
 726:	66 90                	xchg   %ax,%ax
 728:	66 90                	xchg   %ax,%ax
 72a:	66 90                	xchg   %ax,%ax
 72c:	66 90                	xchg   %ax,%ax
 72e:	66 90                	xchg   %ax,%ax

00000730 <thread_create>:
#include "user.h"
#include "uthread.h"

#define PGSIZE 4096

int thread_create(void (*start_routine)(void*,void*), void *arg1, void *arg2) {
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	53                   	push   %ebx
 734:	83 ec 10             	sub    $0x10,%esp
  // allocate a user stack for the new thread
  void *stack = malloc(PGSIZE);
 737:	68 00 10 00 00       	push   $0x1000
 73c:	e8 ff fe ff ff       	call   640 <malloc>
  if(stack == 0) return -1;
 741:	83 c4 10             	add    $0x10,%esp
 744:	85 c0                	test   %eax,%eax
 746:	74 3d                	je     785 <thread_create+0x55>
 748:	89 c3                	mov    %eax,%ebx

  // align to page boundary (defensive)
  if((uint)stack % PGSIZE) stack = (void*)(((uint)stack + PGSIZE) & ~(PGSIZE-1));
 74a:	8d 80 00 10 00 00    	lea    0x1000(%eax),%eax
 750:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 755:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 75b:	0f 45 d8             	cmovne %eax,%ebx

  int pid = clone(start_routine, arg1, arg2, stack);
 75e:	53                   	push   %ebx
 75f:	ff 75 10             	push   0x10(%ebp)
 762:	ff 75 0c             	push   0xc(%ebp)
 765:	ff 75 08             	push   0x8(%ebp)
 768:	e8 fa fb ff ff       	call   367 <clone>
  if(pid < 0) {
 76d:	83 c4 10             	add    $0x10,%esp
 770:	85 c0                	test   %eax,%eax
 772:	78 05                	js     779 <thread_create+0x49>
    free(stack);
    return -1;
  }
  return pid;
}
 774:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 777:	c9                   	leave
 778:	c3                   	ret
    free(stack);
 779:	83 ec 0c             	sub    $0xc,%esp
 77c:	53                   	push   %ebx
 77d:	e8 2e fe ff ff       	call   5b0 <free>
    return -1;
 782:	83 c4 10             	add    $0x10,%esp
  if(stack == 0) return -1;
 785:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 78a:	eb e8                	jmp    774 <thread_create+0x44>
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000790 <thread_join>:

int thread_join(void) {
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	53                   	push   %ebx
  void *stack;
  int pid = join(&stack);
 794:	8d 45 f4             	lea    -0xc(%ebp),%eax
int thread_join(void) {
 797:	83 ec 20             	sub    $0x20,%esp
  int pid = join(&stack);
 79a:	50                   	push   %eax
 79b:	e8 cf fb ff ff       	call   36f <join>
  if(pid >= 0 && stack) free(stack);
 7a0:	83 c4 10             	add    $0x10,%esp
  int pid = join(&stack);
 7a3:	89 c3                	mov    %eax,%ebx
  if(pid >= 0 && stack) free(stack);
 7a5:	85 c0                	test   %eax,%eax
 7a7:	78 13                	js     7bc <thread_join+0x2c>
 7a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ac:	85 c0                	test   %eax,%eax
 7ae:	74 0c                	je     7bc <thread_join+0x2c>
 7b0:	83 ec 0c             	sub    $0xc,%esp
 7b3:	50                   	push   %eax
 7b4:	e8 f7 fd ff ff       	call   5b0 <free>
 7b9:	83 c4 10             	add    $0x10,%esp
  return pid;
}
 7bc:	89 d8                	mov    %ebx,%eax
 7be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7c1:	c9                   	leave
 7c2:	c3                   	ret
 7c3:	66 90                	xchg   %ax,%ax
 7c5:	66 90                	xchg   %ax,%ax
 7c7:	66 90                	xchg   %ax,%ax
 7c9:	66 90                	xchg   %ax,%ax
 7cb:	66 90                	xchg   %ax,%ax
 7cd:	66 90                	xchg   %ax,%ax
 7cf:	90                   	nop

000007d0 <lock_init>:
#include "types.h"
#include "ulock.h"

// Simple user-space spinlock using GCC builtins.
// Works with your 32-bit toolchain and static linking.
void lock_init(lock_t *l) {
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
  l->locked = 0;
 7d3:	8b 45 08             	mov    0x8(%ebp),%eax
 7d6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 7dc:	5d                   	pop    %ebp
 7dd:	c3                   	ret
 7de:	66 90                	xchg   %ax,%ax

000007e0 <lock_acquire>:

void lock_acquire(lock_t *l) {
 7e0:	55                   	push   %ebp
  // spin until we acquire (returns previous value)
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
 7e1:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *l) {
 7e6:	89 e5                	mov    %esp,%ebp
 7e8:	8b 45 08             	mov    0x8(%ebp),%eax
 7eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
 7f0:	89 ca                	mov    %ecx,%edx
 7f2:	87 10                	xchg   %edx,(%eax)
 7f4:	85 d2                	test   %edx,%edx
 7f6:	75 f8                	jne    7f0 <lock_acquire+0x10>
  // full barrier after acquiring
  __sync_synchronize();
 7f8:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 7fd:	5d                   	pop    %ebp
 7fe:	c3                   	ret
 7ff:	90                   	nop

00000800 <lock_release>:

void lock_release(lock_t *l) {
 800:	55                   	push   %ebp
  // full barrier before releasing
  __sync_synchronize();
 801:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
void lock_release(lock_t *l) {
 806:	89 e5                	mov    %esp,%ebp
  __sync_lock_release(&l->locked);   // atomic store 0 with release semantics
 808:	8b 45 08             	mov    0x8(%ebp),%eax
 80b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 811:	5d                   	pop    %ebp
 812:	c3                   	ret
