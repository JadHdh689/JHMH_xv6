
_kthread_sbrk:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  exit();
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 1c             	sub    $0x1c,%esp
  printf(1, "kthread_sbrk: starting test\n");
  11:	68 01 0a 00 00       	push   $0xa01
  16:	6a 01                	push   $0x1
  18:	e8 43 05 00 00       	call   560 <printf>

  void *stack = alloc_stack();
  1d:	e8 1e 01 00 00       	call   140 <alloc_stack>
  if (stack == 0) {
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	74 6c                	je     95 <main+0x95>
    printf(1, "kthread_sbrk: alloc_stack failed\n");
    exit();
  }

  int pid = clone(sbrk_thread, 0, 0, stack);
  29:	50                   	push   %eax
  2a:	6a 00                	push   $0x0
  2c:	6a 00                	push   $0x0
  2e:	68 f0 00 00 00       	push   $0xf0
  33:	e8 6f 04 00 00       	call   4a7 <clone>
  if (pid < 0) {
  38:	83 c4 10             	add    $0x10,%esp
  3b:	85 c0                	test   %eax,%eax
  3d:	78 43                	js     82 <main+0x82>
    printf(1, "kthread_sbrk: clone failed\n");
    exit();
  }

  void *joined_stack;
  if (join(&joined_stack) < 0) {
  3f:	83 ec 0c             	sub    $0xc,%esp
  42:	8d 45 f4             	lea    -0xc(%ebp),%eax
  45:	50                   	push   %eax
  46:	e8 64 04 00 00       	call   4af <join>
  4b:	83 c4 10             	add    $0x10,%esp
  4e:	85 c0                	test   %eax,%eax
  50:	78 56                	js     a8 <main+0xa8>
    printf(1, "kthread_sbrk: join failed\n");
    exit();
  }

  // Now global_ptr should be valid and visible in the main thread
  if (global_ptr == 0) {
  52:	8b 15 78 0e 00 00    	mov    0xe78,%edx
  58:	85 d2                	test   %edx,%edx
  5a:	74 5f                	je     bb <main+0xbb>
    printf(1, "kthread_sbrk: global_ptr is NULL (FAIL)\n");
    exit();
  }

  if (global_ptr[0] != 123 || global_ptr[PGSIZE - 1] != 77) {
  5c:	0f be 02             	movsbl (%edx),%eax
  5f:	0f be 92 ff 0f 00 00 	movsbl 0xfff(%edx),%edx
  66:	3c 7b                	cmp    $0x7b,%al
  68:	75 05                	jne    6f <main+0x6f>
  6a:	80 fa 4d             	cmp    $0x4d,%dl
  6d:	74 5f                	je     ce <main+0xce>
    printf(1, "kthread_sbrk: memory contents wrong (%d, %d) (FAIL)\n",
  6f:	52                   	push   %edx
  70:	50                   	push   %eax
  71:	68 cc 09 00 00       	push   $0x9cc
  76:	6a 01                	push   $0x1
  78:	e8 e3 04 00 00       	call   560 <printf>
           global_ptr[0], global_ptr[PGSIZE - 1]);
    exit();
  7d:	e8 7d 03 00 00       	call   3ff <exit>
    printf(1, "kthread_sbrk: clone failed\n");
  82:	50                   	push   %eax
  83:	50                   	push   %eax
  84:	68 1e 0a 00 00       	push   $0xa1e
  89:	6a 01                	push   $0x1
  8b:	e8 d0 04 00 00       	call   560 <printf>
    exit();
  90:	e8 6a 03 00 00       	call   3ff <exit>
    printf(1, "kthread_sbrk: alloc_stack failed\n");
  95:	50                   	push   %eax
  96:	50                   	push   %eax
  97:	68 7c 09 00 00       	push   $0x97c
  9c:	6a 01                	push   $0x1
  9e:	e8 bd 04 00 00       	call   560 <printf>
    exit();
  a3:	e8 57 03 00 00       	call   3ff <exit>
    printf(1, "kthread_sbrk: join failed\n");
  a8:	51                   	push   %ecx
  a9:	51                   	push   %ecx
  aa:	68 3a 0a 00 00       	push   $0xa3a
  af:	6a 01                	push   $0x1
  b1:	e8 aa 04 00 00       	call   560 <printf>
    exit();
  b6:	e8 44 03 00 00       	call   3ff <exit>
    printf(1, "kthread_sbrk: global_ptr is NULL (FAIL)\n");
  bb:	52                   	push   %edx
  bc:	52                   	push   %edx
  bd:	68 a0 09 00 00       	push   $0x9a0
  c2:	6a 01                	push   $0x1
  c4:	e8 97 04 00 00       	call   560 <printf>
    exit();
  c9:	e8 31 03 00 00       	call   3ff <exit>
  }

  printf(1, "kthread_sbrk: PASS\n");
  ce:	50                   	push   %eax
  cf:	50                   	push   %eax
  d0:	68 55 0a 00 00       	push   $0xa55
  d5:	6a 01                	push   $0x1
  d7:	e8 84 04 00 00       	call   560 <printf>
  exit();
  dc:	e8 1e 03 00 00       	call   3ff <exit>
  e1:	66 90                	xchg   %ax,%ax
  e3:	66 90                	xchg   %ax,%ax
  e5:	66 90                	xchg   %ax,%ax
  e7:	66 90                	xchg   %ax,%ax
  e9:	66 90                	xchg   %ax,%ax
  eb:	66 90                	xchg   %ax,%ax
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <sbrk_thread>:
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	83 ec 14             	sub    $0x14,%esp
  char *p = sbrk(PGSIZE);
  f6:	68 00 10 00 00       	push   $0x1000
  fb:	e8 87 03 00 00       	call   487 <sbrk>
  if (p == (char*)-1) {
 100:	83 c4 10             	add    $0x10,%esp
 103:	83 f8 ff             	cmp    $0xffffffff,%eax
 106:	74 19                	je     121 <sbrk_thread+0x31>
  global_ptr = p;
 108:	a3 78 0e 00 00       	mov    %eax,0xe78
  global_ptr[0] = 123;
 10d:	c6 00 7b             	movb   $0x7b,(%eax)
  global_ptr[PGSIZE - 1] = 77;
 110:	a1 78 0e 00 00       	mov    0xe78,%eax
 115:	c6 80 ff 0f 00 00 4d 	movb   $0x4d,0xfff(%eax)
  exit();
 11c:	e8 de 02 00 00       	call   3ff <exit>
    printf(1, "kthread_sbrk: sbrk in thread failed\n");
 121:	50                   	push   %eax
 122:	50                   	push   %eax
 123:	68 54 09 00 00       	push   $0x954
 128:	6a 01                	push   $0x1
 12a:	e8 31 04 00 00       	call   560 <printf>
    exit();
 12f:	e8 cb 02 00 00       	call   3ff <exit>
 134:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 13b:	00 
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000140 <alloc_stack>:
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	83 ec 14             	sub    $0x14,%esp
  void *mem = sbrk(2 * PGSIZE);
 146:	68 00 20 00 00       	push   $0x2000
 14b:	e8 37 03 00 00       	call   487 <sbrk>
  if (mem == (void*)-1)
 150:	83 c4 10             	add    $0x10,%esp
}
 153:	c9                   	leave
  void *mem = sbrk(2 * PGSIZE);
 154:	89 c1                	mov    %eax,%ecx
  addr = (addr + PGSIZE - 1) & ~(PGSIZE - 1);
 156:	8d 80 ff 0f 00 00    	lea    0xfff(%eax),%eax
 15c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 161:	89 c2                	mov    %eax,%edx
 163:	31 c0                	xor    %eax,%eax
 165:	83 f9 ff             	cmp    $0xffffffff,%ecx
 168:	0f 45 c2             	cmovne %edx,%eax
}
 16b:	c3                   	ret
 16c:	66 90                	xchg   %ax,%ax
 16e:	66 90                	xchg   %ax,%ax

00000170 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 170:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 171:	31 c0                	xor    %eax,%eax
{
 173:	89 e5                	mov    %esp,%ebp
 175:	53                   	push   %ebx
 176:	8b 4d 08             	mov    0x8(%ebp),%ecx
 179:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 180:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 184:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 187:	83 c0 01             	add    $0x1,%eax
 18a:	84 d2                	test   %dl,%dl
 18c:	75 f2                	jne    180 <strcpy+0x10>
    ;
  return os;
}
 18e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 191:	89 c8                	mov    %ecx,%eax
 193:	c9                   	leave
 194:	c3                   	ret
 195:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 19c:	00 
 19d:	8d 76 00             	lea    0x0(%esi),%esi

000001a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	53                   	push   %ebx
 1a4:	8b 55 08             	mov    0x8(%ebp),%edx
 1a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1aa:	0f b6 02             	movzbl (%edx),%eax
 1ad:	84 c0                	test   %al,%al
 1af:	75 17                	jne    1c8 <strcmp+0x28>
 1b1:	eb 3a                	jmp    1ed <strcmp+0x4d>
 1b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1bc:	83 c2 01             	add    $0x1,%edx
 1bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1c2:	84 c0                	test   %al,%al
 1c4:	74 1a                	je     1e0 <strcmp+0x40>
 1c6:	89 d9                	mov    %ebx,%ecx
 1c8:	0f b6 19             	movzbl (%ecx),%ebx
 1cb:	38 c3                	cmp    %al,%bl
 1cd:	74 e9                	je     1b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1cf:	29 d8                	sub    %ebx,%eax
}
 1d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1d4:	c9                   	leave
 1d5:	c3                   	ret
 1d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1dd:	00 
 1de:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 1e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1e4:	31 c0                	xor    %eax,%eax
 1e6:	29 d8                	sub    %ebx,%eax
}
 1e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1eb:	c9                   	leave
 1ec:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 1ed:	0f b6 19             	movzbl (%ecx),%ebx
 1f0:	31 c0                	xor    %eax,%eax
 1f2:	eb db                	jmp    1cf <strcmp+0x2f>
 1f4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1fb:	00 
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000200 <strlen>:

uint
strlen(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 206:	80 3a 00             	cmpb   $0x0,(%edx)
 209:	74 15                	je     220 <strlen+0x20>
 20b:	31 c0                	xor    %eax,%eax
 20d:	8d 76 00             	lea    0x0(%esi),%esi
 210:	83 c0 01             	add    $0x1,%eax
 213:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 217:	89 c1                	mov    %eax,%ecx
 219:	75 f5                	jne    210 <strlen+0x10>
    ;
  return n;
}
 21b:	89 c8                	mov    %ecx,%eax
 21d:	5d                   	pop    %ebp
 21e:	c3                   	ret
 21f:	90                   	nop
  for(n = 0; s[n]; n++)
 220:	31 c9                	xor    %ecx,%ecx
}
 222:	5d                   	pop    %ebp
 223:	89 c8                	mov    %ecx,%eax
 225:	c3                   	ret
 226:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 22d:	00 
 22e:	66 90                	xchg   %ax,%ax

00000230 <memset>:

void*
memset(void *dst, int c, uint n)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 237:	8b 4d 10             	mov    0x10(%ebp),%ecx
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	89 d7                	mov    %edx,%edi
 23f:	fc                   	cld
 240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 242:	8b 7d fc             	mov    -0x4(%ebp),%edi
 245:	89 d0                	mov    %edx,%eax
 247:	c9                   	leave
 248:	c3                   	ret
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000250 <strchr>:

char*
strchr(const char *s, char c)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 25a:	0f b6 10             	movzbl (%eax),%edx
 25d:	84 d2                	test   %dl,%dl
 25f:	75 12                	jne    273 <strchr+0x23>
 261:	eb 1d                	jmp    280 <strchr+0x30>
 263:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 268:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 26c:	83 c0 01             	add    $0x1,%eax
 26f:	84 d2                	test   %dl,%dl
 271:	74 0d                	je     280 <strchr+0x30>
    if(*s == c)
 273:	38 d1                	cmp    %dl,%cl
 275:	75 f1                	jne    268 <strchr+0x18>
      return (char*)s;
  return 0;
}
 277:	5d                   	pop    %ebp
 278:	c3                   	ret
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 280:	31 c0                	xor    %eax,%eax
}
 282:	5d                   	pop    %ebp
 283:	c3                   	ret
 284:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 28b:	00 
 28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000290 <gets>:

char*
gets(char *buf, int max)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 295:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 298:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 299:	31 db                	xor    %ebx,%ebx
{
 29b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 29e:	eb 27                	jmp    2c7 <gets+0x37>
    cc = read(0, &c, 1);
 2a0:	83 ec 04             	sub    $0x4,%esp
 2a3:	6a 01                	push   $0x1
 2a5:	56                   	push   %esi
 2a6:	6a 00                	push   $0x0
 2a8:	e8 6a 01 00 00       	call   417 <read>
    if(cc < 1)
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	85 c0                	test   %eax,%eax
 2b2:	7e 1d                	jle    2d1 <gets+0x41>
      break;
    buf[i++] = c;
 2b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2b8:	8b 55 08             	mov    0x8(%ebp),%edx
 2bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2bf:	3c 0a                	cmp    $0xa,%al
 2c1:	74 10                	je     2d3 <gets+0x43>
 2c3:	3c 0d                	cmp    $0xd,%al
 2c5:	74 0c                	je     2d3 <gets+0x43>
  for(i=0; i+1 < max; ){
 2c7:	89 df                	mov    %ebx,%edi
 2c9:	83 c3 01             	add    $0x1,%ebx
 2cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2cf:	7c cf                	jl     2a0 <gets+0x10>
 2d1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
 2d6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 2da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2dd:	5b                   	pop    %ebx
 2de:	5e                   	pop    %esi
 2df:	5f                   	pop    %edi
 2e0:	5d                   	pop    %ebp
 2e1:	c3                   	ret
 2e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2e9:	00 
 2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f5:	83 ec 08             	sub    $0x8,%esp
 2f8:	6a 00                	push   $0x0
 2fa:	ff 75 08             	push   0x8(%ebp)
 2fd:	e8 3d 01 00 00       	call   43f <open>
  if(fd < 0)
 302:	83 c4 10             	add    $0x10,%esp
 305:	85 c0                	test   %eax,%eax
 307:	78 27                	js     330 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 309:	83 ec 08             	sub    $0x8,%esp
 30c:	ff 75 0c             	push   0xc(%ebp)
 30f:	89 c3                	mov    %eax,%ebx
 311:	50                   	push   %eax
 312:	e8 40 01 00 00       	call   457 <fstat>
  close(fd);
 317:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 31a:	89 c6                	mov    %eax,%esi
  close(fd);
 31c:	e8 06 01 00 00       	call   427 <close>
  return r;
 321:	83 c4 10             	add    $0x10,%esp
}
 324:	8d 65 f8             	lea    -0x8(%ebp),%esp
 327:	89 f0                	mov    %esi,%eax
 329:	5b                   	pop    %ebx
 32a:	5e                   	pop    %esi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 330:	be ff ff ff ff       	mov    $0xffffffff,%esi
 335:	eb ed                	jmp    324 <stat+0x34>
 337:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 33e:	00 
 33f:	90                   	nop

00000340 <atoi>:

int
atoi(const char *s)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	53                   	push   %ebx
 344:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 347:	0f be 02             	movsbl (%edx),%eax
 34a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 34d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 350:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 355:	77 1e                	ja     375 <atoi+0x35>
 357:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35e:	00 
 35f:	90                   	nop
    n = n*10 + *s++ - '0';
 360:	83 c2 01             	add    $0x1,%edx
 363:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 366:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 36a:	0f be 02             	movsbl (%edx),%eax
 36d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 370:	80 fb 09             	cmp    $0x9,%bl
 373:	76 eb                	jbe    360 <atoi+0x20>
  return n;
}
 375:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 378:	89 c8                	mov    %ecx,%eax
 37a:	c9                   	leave
 37b:	c3                   	ret
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	8b 45 10             	mov    0x10(%ebp),%eax
 387:	8b 55 08             	mov    0x8(%ebp),%edx
 38a:	56                   	push   %esi
 38b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 38e:	85 c0                	test   %eax,%eax
 390:	7e 13                	jle    3a5 <memmove+0x25>
 392:	01 d0                	add    %edx,%eax
  dst = vdst;
 394:	89 d7                	mov    %edx,%edi
 396:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 39d:	00 
 39e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 3a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3a1:	39 f8                	cmp    %edi,%eax
 3a3:	75 fb                	jne    3a0 <memmove+0x20>
  return vdst;
}
 3a5:	5e                   	pop    %esi
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	5f                   	pop    %edi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret
 3ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000003b0 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 55 10             	mov    0x10(%ebp),%edx
 3b7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ba:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(n > 0 && *p && *p == *q)
 3bd:	85 d2                	test   %edx,%edx
 3bf:	75 16                	jne    3d7 <strncmp+0x27>
 3c1:	eb 2d                	jmp    3f0 <strncmp+0x40>
 3c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 3c8:	3a 19                	cmp    (%ecx),%bl
 3ca:	75 12                	jne    3de <strncmp+0x2e>
    n--, p++, q++;
 3cc:	83 c0 01             	add    $0x1,%eax
 3cf:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
 3d2:	83 ea 01             	sub    $0x1,%edx
 3d5:	74 19                	je     3f0 <strncmp+0x40>
 3d7:	0f b6 18             	movzbl (%eax),%ebx
 3da:	84 db                	test   %bl,%bl
 3dc:	75 ea                	jne    3c8 <strncmp+0x18>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
 3de:	0f b6 00             	movzbl (%eax),%eax
 3e1:	0f b6 11             	movzbl (%ecx),%edx
}
 3e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3e7:	c9                   	leave
  return (uchar)*p - (uchar)*q;
 3e8:	29 d0                	sub    %edx,%eax
}
 3ea:	c3                   	ret
 3eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 3f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 3f3:	31 c0                	xor    %eax,%eax
}
 3f5:	c9                   	leave
 3f6:	c3                   	ret

000003f7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3f7:	b8 01 00 00 00       	mov    $0x1,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret

000003ff <exit>:
SYSCALL(exit)
 3ff:	b8 02 00 00 00       	mov    $0x2,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret

00000407 <wait>:
SYSCALL(wait)
 407:	b8 03 00 00 00       	mov    $0x3,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret

0000040f <pipe>:
SYSCALL(pipe)
 40f:	b8 04 00 00 00       	mov    $0x4,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret

00000417 <read>:
SYSCALL(read)
 417:	b8 05 00 00 00       	mov    $0x5,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret

0000041f <write>:
SYSCALL(write)
 41f:	b8 10 00 00 00       	mov    $0x10,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret

00000427 <close>:
SYSCALL(close)
 427:	b8 15 00 00 00       	mov    $0x15,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret

0000042f <kill>:
SYSCALL(kill)
 42f:	b8 06 00 00 00       	mov    $0x6,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret

00000437 <exec>:
SYSCALL(exec)
 437:	b8 07 00 00 00       	mov    $0x7,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret

0000043f <open>:
SYSCALL(open)
 43f:	b8 0f 00 00 00       	mov    $0xf,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret

00000447 <mknod>:
SYSCALL(mknod)
 447:	b8 11 00 00 00       	mov    $0x11,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret

0000044f <unlink>:
SYSCALL(unlink)
 44f:	b8 12 00 00 00       	mov    $0x12,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret

00000457 <fstat>:
SYSCALL(fstat)
 457:	b8 08 00 00 00       	mov    $0x8,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret

0000045f <link>:
SYSCALL(link)
 45f:	b8 13 00 00 00       	mov    $0x13,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret

00000467 <mkdir>:
SYSCALL(mkdir)
 467:	b8 14 00 00 00       	mov    $0x14,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret

0000046f <chdir>:
SYSCALL(chdir)
 46f:	b8 09 00 00 00       	mov    $0x9,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret

00000477 <dup>:
SYSCALL(dup)
 477:	b8 0a 00 00 00       	mov    $0xa,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret

0000047f <getpid>:
SYSCALL(getpid)
 47f:	b8 0b 00 00 00       	mov    $0xb,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret

00000487 <sbrk>:
SYSCALL(sbrk)
 487:	b8 0c 00 00 00       	mov    $0xc,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret

0000048f <sleep>:
SYSCALL(sleep)
 48f:	b8 0d 00 00 00       	mov    $0xd,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret

00000497 <uptime>:
SYSCALL(uptime)
 497:	b8 0e 00 00 00       	mov    $0xe,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret

0000049f <getprocs>:
SYSCALL(getprocs)
 49f:	b8 16 00 00 00       	mov    $0x16,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret

000004a7 <clone>:
SYSCALL(clone)
 4a7:	b8 17 00 00 00       	mov    $0x17,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret

000004af <join>:
SYSCALL(join)
 4af:	b8 18 00 00 00       	mov    $0x18,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret
 4b7:	66 90                	xchg   %ax,%ax
 4b9:	66 90                	xchg   %ax,%ax
 4bb:	66 90                	xchg   %ax,%ax
 4bd:	66 90                	xchg   %ax,%ax
 4bf:	90                   	nop

000004c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4c8:	89 d1                	mov    %edx,%ecx
{
 4ca:	83 ec 3c             	sub    $0x3c,%esp
 4cd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 4d0:	85 d2                	test   %edx,%edx
 4d2:	0f 89 80 00 00 00    	jns    558 <printint+0x98>
 4d8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4dc:	74 7a                	je     558 <printint+0x98>
    x = -xx;
 4de:	f7 d9                	neg    %ecx
    neg = 1;
 4e0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 4e5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 4e8:	31 f6                	xor    %esi,%esi
 4ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4f0:	89 c8                	mov    %ecx,%eax
 4f2:	31 d2                	xor    %edx,%edx
 4f4:	89 f7                	mov    %esi,%edi
 4f6:	f7 f3                	div    %ebx
 4f8:	8d 76 01             	lea    0x1(%esi),%esi
 4fb:	0f b6 92 c8 0a 00 00 	movzbl 0xac8(%edx),%edx
 502:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 506:	89 ca                	mov    %ecx,%edx
 508:	89 c1                	mov    %eax,%ecx
 50a:	39 da                	cmp    %ebx,%edx
 50c:	73 e2                	jae    4f0 <printint+0x30>
  if(neg)
 50e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 511:	85 c0                	test   %eax,%eax
 513:	74 07                	je     51c <printint+0x5c>
    buf[i++] = '-';
 515:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 51a:	89 f7                	mov    %esi,%edi
 51c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 51f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 522:	01 df                	add    %ebx,%edi
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 528:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 52b:	83 ec 04             	sub    $0x4,%esp
 52e:	88 45 d7             	mov    %al,-0x29(%ebp)
 531:	8d 45 d7             	lea    -0x29(%ebp),%eax
 534:	6a 01                	push   $0x1
 536:	50                   	push   %eax
 537:	56                   	push   %esi
 538:	e8 e2 fe ff ff       	call   41f <write>
  while(--i >= 0)
 53d:	89 f8                	mov    %edi,%eax
 53f:	83 c4 10             	add    $0x10,%esp
 542:	83 ef 01             	sub    $0x1,%edi
 545:	39 c3                	cmp    %eax,%ebx
 547:	75 df                	jne    528 <printint+0x68>
}
 549:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54c:	5b                   	pop    %ebx
 54d:	5e                   	pop    %esi
 54e:	5f                   	pop    %edi
 54f:	5d                   	pop    %ebp
 550:	c3                   	ret
 551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 558:	31 c0                	xor    %eax,%eax
 55a:	eb 89                	jmp    4e5 <printint+0x25>
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000560 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 569:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 56c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 56f:	0f b6 1e             	movzbl (%esi),%ebx
 572:	83 c6 01             	add    $0x1,%esi
 575:	84 db                	test   %bl,%bl
 577:	74 67                	je     5e0 <printf+0x80>
 579:	8d 4d 10             	lea    0x10(%ebp),%ecx
 57c:	31 d2                	xor    %edx,%edx
 57e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 581:	eb 34                	jmp    5b7 <printf+0x57>
 583:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 588:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 58b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 590:	83 f8 25             	cmp    $0x25,%eax
 593:	74 18                	je     5ad <printf+0x4d>
  write(fd, &c, 1);
 595:	83 ec 04             	sub    $0x4,%esp
 598:	8d 45 e7             	lea    -0x19(%ebp),%eax
 59b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 59e:	6a 01                	push   $0x1
 5a0:	50                   	push   %eax
 5a1:	57                   	push   %edi
 5a2:	e8 78 fe ff ff       	call   41f <write>
 5a7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5aa:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5ad:	0f b6 1e             	movzbl (%esi),%ebx
 5b0:	83 c6 01             	add    $0x1,%esi
 5b3:	84 db                	test   %bl,%bl
 5b5:	74 29                	je     5e0 <printf+0x80>
    c = fmt[i] & 0xff;
 5b7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5ba:	85 d2                	test   %edx,%edx
 5bc:	74 ca                	je     588 <printf+0x28>
      }
    } else if(state == '%'){
 5be:	83 fa 25             	cmp    $0x25,%edx
 5c1:	75 ea                	jne    5ad <printf+0x4d>
      if(c == 'd'){
 5c3:	83 f8 25             	cmp    $0x25,%eax
 5c6:	0f 84 04 01 00 00    	je     6d0 <printf+0x170>
 5cc:	83 e8 63             	sub    $0x63,%eax
 5cf:	83 f8 15             	cmp    $0x15,%eax
 5d2:	77 1c                	ja     5f0 <printf+0x90>
 5d4:	ff 24 85 70 0a 00 00 	jmp    *0xa70(,%eax,4)
 5db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e3:	5b                   	pop    %ebx
 5e4:	5e                   	pop    %esi
 5e5:	5f                   	pop    %edi
 5e6:	5d                   	pop    %ebp
 5e7:	c3                   	ret
 5e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5ef:	00 
  write(fd, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
 5f3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5f6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5fa:	6a 01                	push   $0x1
 5fc:	52                   	push   %edx
 5fd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 600:	57                   	push   %edi
 601:	e8 19 fe ff ff       	call   41f <write>
 606:	83 c4 0c             	add    $0xc,%esp
 609:	88 5d e7             	mov    %bl,-0x19(%ebp)
 60c:	6a 01                	push   $0x1
 60e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 611:	52                   	push   %edx
 612:	57                   	push   %edi
 613:	e8 07 fe ff ff       	call   41f <write>
        putc(fd, c);
 618:	83 c4 10             	add    $0x10,%esp
      state = 0;
 61b:	31 d2                	xor    %edx,%edx
 61d:	eb 8e                	jmp    5ad <printf+0x4d>
 61f:	90                   	nop
        printint(fd, *ap, 16, 0);
 620:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 623:	83 ec 0c             	sub    $0xc,%esp
 626:	b9 10 00 00 00       	mov    $0x10,%ecx
 62b:	8b 13                	mov    (%ebx),%edx
 62d:	6a 00                	push   $0x0
 62f:	89 f8                	mov    %edi,%eax
        ap++;
 631:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 634:	e8 87 fe ff ff       	call   4c0 <printint>
        ap++;
 639:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 63c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 63f:	31 d2                	xor    %edx,%edx
 641:	e9 67 ff ff ff       	jmp    5ad <printf+0x4d>
        s = (char*)*ap;
 646:	8b 45 d0             	mov    -0x30(%ebp),%eax
 649:	8b 18                	mov    (%eax),%ebx
        ap++;
 64b:	83 c0 04             	add    $0x4,%eax
 64e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 651:	85 db                	test   %ebx,%ebx
 653:	0f 84 87 00 00 00    	je     6e0 <printf+0x180>
        while(*s != 0){
 659:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 65c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 65e:	84 c0                	test   %al,%al
 660:	0f 84 47 ff ff ff    	je     5ad <printf+0x4d>
 666:	8d 55 e7             	lea    -0x19(%ebp),%edx
 669:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 66c:	89 de                	mov    %ebx,%esi
 66e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 670:	83 ec 04             	sub    $0x4,%esp
 673:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 676:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 679:	6a 01                	push   $0x1
 67b:	53                   	push   %ebx
 67c:	57                   	push   %edi
 67d:	e8 9d fd ff ff       	call   41f <write>
        while(*s != 0){
 682:	0f b6 06             	movzbl (%esi),%eax
 685:	83 c4 10             	add    $0x10,%esp
 688:	84 c0                	test   %al,%al
 68a:	75 e4                	jne    670 <printf+0x110>
      state = 0;
 68c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 68f:	31 d2                	xor    %edx,%edx
 691:	e9 17 ff ff ff       	jmp    5ad <printf+0x4d>
        printint(fd, *ap, 10, 1);
 696:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 699:	83 ec 0c             	sub    $0xc,%esp
 69c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6a1:	8b 13                	mov    (%ebx),%edx
 6a3:	6a 01                	push   $0x1
 6a5:	eb 88                	jmp    62f <printf+0xcf>
        putc(fd, *ap);
 6a7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6aa:	83 ec 04             	sub    $0x4,%esp
 6ad:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 6b0:	8b 03                	mov    (%ebx),%eax
        ap++;
 6b2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 6b5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6b8:	6a 01                	push   $0x1
 6ba:	52                   	push   %edx
 6bb:	57                   	push   %edi
 6bc:	e8 5e fd ff ff       	call   41f <write>
        ap++;
 6c1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6c4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6c7:	31 d2                	xor    %edx,%edx
 6c9:	e9 df fe ff ff       	jmp    5ad <printf+0x4d>
 6ce:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 6d0:	83 ec 04             	sub    $0x4,%esp
 6d3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6d6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6d9:	6a 01                	push   $0x1
 6db:	e9 31 ff ff ff       	jmp    611 <printf+0xb1>
 6e0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 6e5:	bb 69 0a 00 00       	mov    $0xa69,%ebx
 6ea:	e9 77 ff ff ff       	jmp    666 <printf+0x106>
 6ef:	90                   	nop

000006f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	a1 7c 0e 00 00       	mov    0xe7c,%eax
{
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	57                   	push   %edi
 6f9:	56                   	push   %esi
 6fa:	53                   	push   %ebx
 6fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 708:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70a:	39 c8                	cmp    %ecx,%eax
 70c:	73 32                	jae    740 <free+0x50>
 70e:	39 d1                	cmp    %edx,%ecx
 710:	72 04                	jb     716 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 712:	39 d0                	cmp    %edx,%eax
 714:	72 32                	jb     748 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 716:	8b 73 fc             	mov    -0x4(%ebx),%esi
 719:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 71c:	39 fa                	cmp    %edi,%edx
 71e:	74 30                	je     750 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 720:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 723:	8b 50 04             	mov    0x4(%eax),%edx
 726:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 729:	39 f1                	cmp    %esi,%ecx
 72b:	74 3a                	je     767 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 72d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 72f:	5b                   	pop    %ebx
  freep = p;
 730:	a3 7c 0e 00 00       	mov    %eax,0xe7c
}
 735:	5e                   	pop    %esi
 736:	5f                   	pop    %edi
 737:	5d                   	pop    %ebp
 738:	c3                   	ret
 739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 740:	39 d0                	cmp    %edx,%eax
 742:	72 04                	jb     748 <free+0x58>
 744:	39 d1                	cmp    %edx,%ecx
 746:	72 ce                	jb     716 <free+0x26>
{
 748:	89 d0                	mov    %edx,%eax
 74a:	eb bc                	jmp    708 <free+0x18>
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 750:	03 72 04             	add    0x4(%edx),%esi
 753:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 756:	8b 10                	mov    (%eax),%edx
 758:	8b 12                	mov    (%edx),%edx
 75a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 75d:	8b 50 04             	mov    0x4(%eax),%edx
 760:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 763:	39 f1                	cmp    %esi,%ecx
 765:	75 c6                	jne    72d <free+0x3d>
    p->s.size += bp->s.size;
 767:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 76a:	a3 7c 0e 00 00       	mov    %eax,0xe7c
    p->s.size += bp->s.size;
 76f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 772:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 775:	89 08                	mov    %ecx,(%eax)
}
 777:	5b                   	pop    %ebx
 778:	5e                   	pop    %esi
 779:	5f                   	pop    %edi
 77a:	5d                   	pop    %ebp
 77b:	c3                   	ret
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000780 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 789:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 78c:	8b 15 7c 0e 00 00    	mov    0xe7c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 792:	8d 78 07             	lea    0x7(%eax),%edi
 795:	c1 ef 03             	shr    $0x3,%edi
 798:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 79b:	85 d2                	test   %edx,%edx
 79d:	0f 84 8d 00 00 00    	je     830 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7a5:	8b 48 04             	mov    0x4(%eax),%ecx
 7a8:	39 f9                	cmp    %edi,%ecx
 7aa:	73 64                	jae    810 <malloc+0x90>
  if(nu < 4096)
 7ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7b1:	39 df                	cmp    %ebx,%edi
 7b3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7b6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7bd:	eb 0a                	jmp    7c9 <malloc+0x49>
 7bf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7c2:	8b 48 04             	mov    0x4(%eax),%ecx
 7c5:	39 f9                	cmp    %edi,%ecx
 7c7:	73 47                	jae    810 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c9:	89 c2                	mov    %eax,%edx
 7cb:	3b 05 7c 0e 00 00    	cmp    0xe7c,%eax
 7d1:	75 ed                	jne    7c0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7d3:	83 ec 0c             	sub    $0xc,%esp
 7d6:	56                   	push   %esi
 7d7:	e8 ab fc ff ff       	call   487 <sbrk>
  if(p == (char*)-1)
 7dc:	83 c4 10             	add    $0x10,%esp
 7df:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e2:	74 1c                	je     800 <malloc+0x80>
  hp->s.size = nu;
 7e4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e7:	83 ec 0c             	sub    $0xc,%esp
 7ea:	83 c0 08             	add    $0x8,%eax
 7ed:	50                   	push   %eax
 7ee:	e8 fd fe ff ff       	call   6f0 <free>
  return freep;
 7f3:	8b 15 7c 0e 00 00    	mov    0xe7c,%edx
      if((p = morecore(nunits)) == 0)
 7f9:	83 c4 10             	add    $0x10,%esp
 7fc:	85 d2                	test   %edx,%edx
 7fe:	75 c0                	jne    7c0 <malloc+0x40>
        return 0;
  }
}
 800:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 803:	31 c0                	xor    %eax,%eax
}
 805:	5b                   	pop    %ebx
 806:	5e                   	pop    %esi
 807:	5f                   	pop    %edi
 808:	5d                   	pop    %ebp
 809:	c3                   	ret
 80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 810:	39 cf                	cmp    %ecx,%edi
 812:	74 4c                	je     860 <malloc+0xe0>
        p->s.size -= nunits;
 814:	29 f9                	sub    %edi,%ecx
 816:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 81c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 81f:	89 15 7c 0e 00 00    	mov    %edx,0xe7c
}
 825:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 828:	83 c0 08             	add    $0x8,%eax
}
 82b:	5b                   	pop    %ebx
 82c:	5e                   	pop    %esi
 82d:	5f                   	pop    %edi
 82e:	5d                   	pop    %ebp
 82f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 830:	c7 05 7c 0e 00 00 80 	movl   $0xe80,0xe7c
 837:	0e 00 00 
    base.s.size = 0;
 83a:	b8 80 0e 00 00       	mov    $0xe80,%eax
    base.s.ptr = freep = prevp = &base;
 83f:	c7 05 80 0e 00 00 80 	movl   $0xe80,0xe80
 846:	0e 00 00 
    base.s.size = 0;
 849:	c7 05 84 0e 00 00 00 	movl   $0x0,0xe84
 850:	00 00 00 
    if(p->s.size >= nunits){
 853:	e9 54 ff ff ff       	jmp    7ac <malloc+0x2c>
 858:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 85f:	00 
        prevp->s.ptr = p->s.ptr;
 860:	8b 08                	mov    (%eax),%ecx
 862:	89 0a                	mov    %ecx,(%edx)
 864:	eb b9                	jmp    81f <malloc+0x9f>
 866:	66 90                	xchg   %ax,%ax
 868:	66 90                	xchg   %ax,%ax
 86a:	66 90                	xchg   %ax,%ax
 86c:	66 90                	xchg   %ax,%ax
 86e:	66 90                	xchg   %ax,%ax

00000870 <thread_create>:
#include "user.h"
#include "uthread.h"

#define PGSIZE 4096

int thread_create(void (*start_routine)(void*,void*), void *arg1, void *arg2) {
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	53                   	push   %ebx
 874:	83 ec 10             	sub    $0x10,%esp
  // allocate a user stack for the new thread
  void *stack = malloc(PGSIZE);
 877:	68 00 10 00 00       	push   $0x1000
 87c:	e8 ff fe ff ff       	call   780 <malloc>
  if(stack == 0) return -1;
 881:	83 c4 10             	add    $0x10,%esp
 884:	85 c0                	test   %eax,%eax
 886:	74 3d                	je     8c5 <thread_create+0x55>
 888:	89 c3                	mov    %eax,%ebx

  // align to page boundary (defensive)
  if((uint)stack % PGSIZE) stack = (void*)(((uint)stack + PGSIZE) & ~(PGSIZE-1));
 88a:	8d 80 00 10 00 00    	lea    0x1000(%eax),%eax
 890:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 895:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 89b:	0f 45 d8             	cmovne %eax,%ebx

  int pid = clone(start_routine, arg1, arg2, stack);
 89e:	53                   	push   %ebx
 89f:	ff 75 10             	push   0x10(%ebp)
 8a2:	ff 75 0c             	push   0xc(%ebp)
 8a5:	ff 75 08             	push   0x8(%ebp)
 8a8:	e8 fa fb ff ff       	call   4a7 <clone>
  if(pid < 0) {
 8ad:	83 c4 10             	add    $0x10,%esp
 8b0:	85 c0                	test   %eax,%eax
 8b2:	78 05                	js     8b9 <thread_create+0x49>
    free(stack);
    return -1;
  }
  return pid;
}
 8b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8b7:	c9                   	leave
 8b8:	c3                   	ret
    free(stack);
 8b9:	83 ec 0c             	sub    $0xc,%esp
 8bc:	53                   	push   %ebx
 8bd:	e8 2e fe ff ff       	call   6f0 <free>
    return -1;
 8c2:	83 c4 10             	add    $0x10,%esp
  if(stack == 0) return -1;
 8c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8ca:	eb e8                	jmp    8b4 <thread_create+0x44>
 8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008d0 <thread_join>:

int thread_join(void) {
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	53                   	push   %ebx
  void *stack;
  int pid = join(&stack);
 8d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
int thread_join(void) {
 8d7:	83 ec 20             	sub    $0x20,%esp
  int pid = join(&stack);
 8da:	50                   	push   %eax
 8db:	e8 cf fb ff ff       	call   4af <join>
  if(pid >= 0 && stack) free(stack);
 8e0:	83 c4 10             	add    $0x10,%esp
  int pid = join(&stack);
 8e3:	89 c3                	mov    %eax,%ebx
  if(pid >= 0 && stack) free(stack);
 8e5:	85 c0                	test   %eax,%eax
 8e7:	78 13                	js     8fc <thread_join+0x2c>
 8e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ec:	85 c0                	test   %eax,%eax
 8ee:	74 0c                	je     8fc <thread_join+0x2c>
 8f0:	83 ec 0c             	sub    $0xc,%esp
 8f3:	50                   	push   %eax
 8f4:	e8 f7 fd ff ff       	call   6f0 <free>
 8f9:	83 c4 10             	add    $0x10,%esp
  return pid;
}
 8fc:	89 d8                	mov    %ebx,%eax
 8fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 901:	c9                   	leave
 902:	c3                   	ret
 903:	66 90                	xchg   %ax,%ax
 905:	66 90                	xchg   %ax,%ax
 907:	66 90                	xchg   %ax,%ax
 909:	66 90                	xchg   %ax,%ax
 90b:	66 90                	xchg   %ax,%ax
 90d:	66 90                	xchg   %ax,%ax
 90f:	90                   	nop

00000910 <lock_init>:
#include "types.h"
#include "ulock.h"

// Simple user-space spinlock using GCC builtins.
// Works with your 32-bit toolchain and static linking.
void lock_init(lock_t *l) {
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
  l->locked = 0;
 913:	8b 45 08             	mov    0x8(%ebp),%eax
 916:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 91c:	5d                   	pop    %ebp
 91d:	c3                   	ret
 91e:	66 90                	xchg   %ax,%ax

00000920 <lock_acquire>:

void lock_acquire(lock_t *l) {
 920:	55                   	push   %ebp
  // spin until we acquire (returns previous value)
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
 921:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *l) {
 926:	89 e5                	mov    %esp,%ebp
 928:	8b 45 08             	mov    0x8(%ebp),%eax
 92b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
 930:	89 ca                	mov    %ecx,%edx
 932:	87 10                	xchg   %edx,(%eax)
 934:	85 d2                	test   %edx,%edx
 936:	75 f8                	jne    930 <lock_acquire+0x10>
  // full barrier after acquiring
  __sync_synchronize();
 938:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 93d:	5d                   	pop    %ebp
 93e:	c3                   	ret
 93f:	90                   	nop

00000940 <lock_release>:

void lock_release(lock_t *l) {
 940:	55                   	push   %ebp
  // full barrier before releasing
  __sync_synchronize();
 941:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
void lock_release(lock_t *l) {
 946:	89 e5                	mov    %esp,%ebp
  __sync_lock_release(&l->locked);   // atomic store 0 with release semantics
 948:	8b 45 08             	mov    0x8(%ebp),%eax
 94b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 951:	5d                   	pop    %ebp
 952:	c3                   	ret
