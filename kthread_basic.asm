
_kthread_basic:     file format elf32-i386


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
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
  // init shared array
  for (i = 0; i < NTHREADS; i++)
    shared_array[i] = 0;

  // Create threads
  for (i = 0; i < NTHREADS; i++) {
   f:	31 db                	xor    %ebx,%ebx
{
  11:	51                   	push   %ecx
  12:	83 ec 20             	sub    $0x20,%esp
  printf(1, "kthread_basic: starting %d threads\n", NTHREADS);
  15:	6a 04                	push   $0x4
  17:	68 d4 09 00 00       	push   $0x9d4
  1c:	6a 01                	push   $0x1
  1e:	e8 bd 05 00 00       	call   5e0 <printf>
    shared_array[i] = 0;
  23:	83 c4 10             	add    $0x10,%esp
  26:	c7 05 04 0f 00 00 00 	movl   $0x0,0xf04
  2d:	00 00 00 
  30:	c7 05 08 0f 00 00 00 	movl   $0x0,0xf08
  37:	00 00 00 
  3a:	c7 05 0c 0f 00 00 00 	movl   $0x0,0xf0c
  41:	00 00 00 
  44:	c7 05 10 0f 00 00 00 	movl   $0x0,0xf10
  4b:	00 00 00 
  void *mem = sbrk(2 * PGSIZE);
  4e:	83 ec 0c             	sub    $0xc,%esp
  51:	68 00 20 00 00       	push   $0x2000
  56:	e8 ac 04 00 00       	call   507 <sbrk>
  if (mem == (void*)-1)
  5b:	83 c4 10             	add    $0x10,%esp
  5e:	83 f8 ff             	cmp    $0xffffffff,%eax
  61:	0f 84 b7 00 00 00    	je     11e <main+0x11e>
  addr = (addr + PGSIZE - 1) & ~(PGSIZE - 1);
  67:	05 ff 0f 00 00       	add    $0xfff,%eax
    void *stack = alloc_stack();
    if (stack == 0) {
  6c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  71:	0f 84 a7 00 00 00    	je     11e <main+0x11e>
      printf(1, "kthread_basic: alloc_stack() failed for thread %d\n", i);
      exit();
    }

    int pid = clone(worker, (void*)i, (void*)loops, stack);
  77:	50                   	push   %eax
  78:	68 e8 03 00 00       	push   $0x3e8
  7d:	53                   	push   %ebx
  7e:	68 60 01 00 00       	push   $0x160
  83:	e8 9f 04 00 00       	call   527 <clone>
    if (pid < 0) {
  88:	83 c4 10             	add    $0x10,%esp
  8b:	85 c0                	test   %eax,%eax
  8d:	0f 88 b1 00 00 00    	js     144 <main+0x144>
  for (i = 0; i < NTHREADS; i++) {
  93:	83 c3 01             	add    $0x1,%ebx
  96:	83 fb 04             	cmp    $0x4,%ebx
  99:	75 b3                	jne    4e <main+0x4e>
  9b:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  }

  // Join all threads
  for (i = 0; i < NTHREADS; i++) {
    void *joined_stack;
    int pid = join(&joined_stack);
  9e:	83 ec 0c             	sub    $0xc,%esp
  a1:	56                   	push   %esi
  a2:	e8 88 04 00 00       	call   52f <join>
    if (pid < 0) {
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	0f 88 7f 00 00 00    	js     131 <main+0x131>
  for (i = 0; i < NTHREADS; i++) {
  b2:	83 eb 01             	sub    $0x1,%ebx
  b5:	75 e7                	jne    9e <main+0x9e>
    }
    // printf(1, "kthread_basic: joined thread pid %d\n", pid);
  }

  // Check results
  int ok = 1;
  b7:	ba 01 00 00 00       	mov    $0x1,%edx
  for (i = 0; i < NTHREADS; i++) {
  bc:	31 db                	xor    %ebx,%ebx
  be:	66 90                	xchg   %ax,%ax
    if (shared_array[i] != loops) {
  c0:	8b 04 9d 04 0f 00 00 	mov    0xf04(,%ebx,4),%eax
  c7:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  cc:	74 1b                	je     e9 <main+0xe9>
      printf(1, "kthread_basic: shared_array[%d] = %d (expected %d)\n",
  ce:	83 ec 0c             	sub    $0xc,%esp
  d1:	68 e8 03 00 00       	push   $0x3e8
  d6:	50                   	push   %eax
  d7:	53                   	push   %ebx
  d8:	68 88 0a 00 00       	push   $0xa88
  dd:	6a 01                	push   $0x1
  df:	e8 fc 04 00 00       	call   5e0 <printf>
  e4:	83 c4 20             	add    $0x20,%esp
             i, shared_array[i], loops);
      ok = 0;
  e7:	31 d2                	xor    %edx,%edx
  for (i = 0; i < NTHREADS; i++) {
  e9:	83 c3 01             	add    $0x1,%ebx
  ec:	83 fb 04             	cmp    $0x4,%ebx
  ef:	75 cf                	jne    c0 <main+0xc0>
    }
  }

  if (ok)
  f1:	85 d2                	test   %edx,%edx
  f3:	74 16                	je     10b <main+0x10b>
    printf(1, "kthread_basic: PASS\n");
  f5:	52                   	push   %edx
  f6:	52                   	push   %edx
  f7:	68 bc 0a 00 00       	push   $0xabc
  fc:	6a 01                	push   $0x1
  fe:	e8 dd 04 00 00       	call   5e0 <printf>
 103:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "kthread_basic: FAIL\n");

  exit();
 106:	e8 74 03 00 00       	call   47f <exit>
    printf(1, "kthread_basic: FAIL\n");
 10b:	50                   	push   %eax
 10c:	50                   	push   %eax
 10d:	68 d1 0a 00 00       	push   $0xad1
 112:	6a 01                	push   $0x1
 114:	e8 c7 04 00 00       	call   5e0 <printf>
 119:	83 c4 10             	add    $0x10,%esp
 11c:	eb e8                	jmp    106 <main+0x106>
      printf(1, "kthread_basic: alloc_stack() failed for thread %d\n", i);
 11e:	50                   	push   %eax
 11f:	53                   	push   %ebx
 120:	68 f8 09 00 00       	push   $0x9f8
 125:	6a 01                	push   $0x1
 127:	e8 b4 04 00 00       	call   5e0 <printf>
      exit();
 12c:	e8 4e 03 00 00       	call   47f <exit>
      printf(1, "kthread_basic: join failed (returned %d)\n", pid);
 131:	51                   	push   %ecx
 132:	50                   	push   %eax
 133:	68 5c 0a 00 00       	push   $0xa5c
 138:	6a 01                	push   $0x1
 13a:	e8 a1 04 00 00       	call   5e0 <printf>
      exit();
 13f:	e8 3b 03 00 00       	call   47f <exit>
      printf(1, "kthread_basic: clone failed for thread %d\n", i);
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
 146:	68 30 0a 00 00       	push   $0xa30
 14b:	6a 01                	push   $0x1
 14d:	e8 8e 04 00 00       	call   5e0 <printf>
      exit();
 152:	e8 28 03 00 00       	call   47f <exit>
 157:	66 90                	xchg   %ax,%ax
 159:	66 90                	xchg   %ax,%ax
 15b:	66 90                	xchg   %ax,%ax
 15d:	66 90                	xchg   %ax,%ax
 15f:	90                   	nop

00000160 <worker>:
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	57                   	push   %edi
 164:	56                   	push   %esi
 165:	53                   	push   %ebx
 166:	83 ec 0c             	sub    $0xc,%esp
 169:	8b 7d 0c             	mov    0xc(%ebp),%edi
 16c:	8b 75 08             	mov    0x8(%ebp),%esi
  for (i = 0; i < loops; i++) {
 16f:	85 ff                	test   %edi,%edi
 171:	7e 40                	jle    1b3 <worker+0x53>
 173:	31 db                	xor    %ebx,%ebx
 175:	eb 10                	jmp    187 <worker+0x27>
 177:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17e:	00 
 17f:	90                   	nop
 180:	83 c3 01             	add    $0x1,%ebx
 183:	39 df                	cmp    %ebx,%edi
 185:	74 2c                	je     1b3 <worker+0x53>
    shared_array[tid]++;
 187:	69 c3 29 5c 8f c2    	imul   $0xc28f5c29,%ebx,%eax
 18d:	83 04 b5 04 0f 00 00 	addl   $0x1,0xf04(,%esi,4)
 194:	01 
 195:	c1 c8 02             	ror    $0x2,%eax
    if (i % 100 == 0)
 198:	3d 28 5c 8f 02       	cmp    $0x28f5c28,%eax
 19d:	77 e1                	ja     180 <worker+0x20>
      sleep(1);
 19f:	83 ec 0c             	sub    $0xc,%esp
  for (i = 0; i < loops; i++) {
 1a2:	83 c3 01             	add    $0x1,%ebx
      sleep(1);
 1a5:	6a 01                	push   $0x1
 1a7:	e8 63 03 00 00       	call   50f <sleep>
 1ac:	83 c4 10             	add    $0x10,%esp
  for (i = 0; i < loops; i++) {
 1af:	39 df                	cmp    %ebx,%edi
 1b1:	75 d4                	jne    187 <worker+0x27>
  exit();
 1b3:	e8 c7 02 00 00       	call   47f <exit>
 1b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1bf:	00 

000001c0 <alloc_stack>:
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	83 ec 14             	sub    $0x14,%esp
  void *mem = sbrk(2 * PGSIZE);
 1c6:	68 00 20 00 00       	push   $0x2000
 1cb:	e8 37 03 00 00       	call   507 <sbrk>
  if (mem == (void*)-1)
 1d0:	83 c4 10             	add    $0x10,%esp
}
 1d3:	c9                   	leave
  void *mem = sbrk(2 * PGSIZE);
 1d4:	89 c1                	mov    %eax,%ecx
  addr = (addr + PGSIZE - 1) & ~(PGSIZE - 1);
 1d6:	8d 80 ff 0f 00 00    	lea    0xfff(%eax),%eax
 1dc:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 1e1:	89 c2                	mov    %eax,%edx
 1e3:	31 c0                	xor    %eax,%eax
 1e5:	83 f9 ff             	cmp    $0xffffffff,%ecx
 1e8:	0f 45 c2             	cmovne %edx,%eax
}
 1eb:	c3                   	ret
 1ec:	66 90                	xchg   %ax,%ax
 1ee:	66 90                	xchg   %ax,%ax

000001f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1f1:	31 c0                	xor    %eax,%eax
{
 1f3:	89 e5                	mov    %esp,%ebp
 1f5:	53                   	push   %ebx
 1f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 200:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 204:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 207:	83 c0 01             	add    $0x1,%eax
 20a:	84 d2                	test   %dl,%dl
 20c:	75 f2                	jne    200 <strcpy+0x10>
    ;
  return os;
}
 20e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 211:	89 c8                	mov    %ecx,%eax
 213:	c9                   	leave
 214:	c3                   	ret
 215:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 21c:	00 
 21d:	8d 76 00             	lea    0x0(%esi),%esi

00000220 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 55 08             	mov    0x8(%ebp),%edx
 227:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 22a:	0f b6 02             	movzbl (%edx),%eax
 22d:	84 c0                	test   %al,%al
 22f:	75 17                	jne    248 <strcmp+0x28>
 231:	eb 3a                	jmp    26d <strcmp+0x4d>
 233:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 238:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 23c:	83 c2 01             	add    $0x1,%edx
 23f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 242:	84 c0                	test   %al,%al
 244:	74 1a                	je     260 <strcmp+0x40>
 246:	89 d9                	mov    %ebx,%ecx
 248:	0f b6 19             	movzbl (%ecx),%ebx
 24b:	38 c3                	cmp    %al,%bl
 24d:	74 e9                	je     238 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 24f:	29 d8                	sub    %ebx,%eax
}
 251:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 254:	c9                   	leave
 255:	c3                   	ret
 256:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 25d:	00 
 25e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 260:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 264:	31 c0                	xor    %eax,%eax
 266:	29 d8                	sub    %ebx,%eax
}
 268:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 26b:	c9                   	leave
 26c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 26d:	0f b6 19             	movzbl (%ecx),%ebx
 270:	31 c0                	xor    %eax,%eax
 272:	eb db                	jmp    24f <strcmp+0x2f>
 274:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 27b:	00 
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <strlen>:

uint
strlen(const char *s)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 286:	80 3a 00             	cmpb   $0x0,(%edx)
 289:	74 15                	je     2a0 <strlen+0x20>
 28b:	31 c0                	xor    %eax,%eax
 28d:	8d 76 00             	lea    0x0(%esi),%esi
 290:	83 c0 01             	add    $0x1,%eax
 293:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 297:	89 c1                	mov    %eax,%ecx
 299:	75 f5                	jne    290 <strlen+0x10>
    ;
  return n;
}
 29b:	89 c8                	mov    %ecx,%eax
 29d:	5d                   	pop    %ebp
 29e:	c3                   	ret
 29f:	90                   	nop
  for(n = 0; s[n]; n++)
 2a0:	31 c9                	xor    %ecx,%ecx
}
 2a2:	5d                   	pop    %ebp
 2a3:	89 c8                	mov    %ecx,%eax
 2a5:	c3                   	ret
 2a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ad:	00 
 2ae:	66 90                	xchg   %ax,%ax

000002b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bd:	89 d7                	mov    %edx,%edi
 2bf:	fc                   	cld
 2c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2c5:	89 d0                	mov    %edx,%eax
 2c7:	c9                   	leave
 2c8:	c3                   	ret
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002d0 <strchr>:

char*
strchr(const char *s, char c)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
 2d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2da:	0f b6 10             	movzbl (%eax),%edx
 2dd:	84 d2                	test   %dl,%dl
 2df:	75 12                	jne    2f3 <strchr+0x23>
 2e1:	eb 1d                	jmp    300 <strchr+0x30>
 2e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 2e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2ec:	83 c0 01             	add    $0x1,%eax
 2ef:	84 d2                	test   %dl,%dl
 2f1:	74 0d                	je     300 <strchr+0x30>
    if(*s == c)
 2f3:	38 d1                	cmp    %dl,%cl
 2f5:	75 f1                	jne    2e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2f7:	5d                   	pop    %ebp
 2f8:	c3                   	ret
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 300:	31 c0                	xor    %eax,%eax
}
 302:	5d                   	pop    %ebp
 303:	c3                   	ret
 304:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 30b:	00 
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <gets>:

char*
gets(char *buf, int max)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 315:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 318:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 319:	31 db                	xor    %ebx,%ebx
{
 31b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 31e:	eb 27                	jmp    347 <gets+0x37>
    cc = read(0, &c, 1);
 320:	83 ec 04             	sub    $0x4,%esp
 323:	6a 01                	push   $0x1
 325:	56                   	push   %esi
 326:	6a 00                	push   $0x0
 328:	e8 6a 01 00 00       	call   497 <read>
    if(cc < 1)
 32d:	83 c4 10             	add    $0x10,%esp
 330:	85 c0                	test   %eax,%eax
 332:	7e 1d                	jle    351 <gets+0x41>
      break;
    buf[i++] = c;
 334:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 338:	8b 55 08             	mov    0x8(%ebp),%edx
 33b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 33f:	3c 0a                	cmp    $0xa,%al
 341:	74 10                	je     353 <gets+0x43>
 343:	3c 0d                	cmp    $0xd,%al
 345:	74 0c                	je     353 <gets+0x43>
  for(i=0; i+1 < max; ){
 347:	89 df                	mov    %ebx,%edi
 349:	83 c3 01             	add    $0x1,%ebx
 34c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 34f:	7c cf                	jl     320 <gets+0x10>
 351:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 353:	8b 45 08             	mov    0x8(%ebp),%eax
 356:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 35a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 35d:	5b                   	pop    %ebx
 35e:	5e                   	pop    %esi
 35f:	5f                   	pop    %edi
 360:	5d                   	pop    %ebp
 361:	c3                   	ret
 362:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 369:	00 
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <stat>:

int
stat(const char *n, struct stat *st)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 375:	83 ec 08             	sub    $0x8,%esp
 378:	6a 00                	push   $0x0
 37a:	ff 75 08             	push   0x8(%ebp)
 37d:	e8 3d 01 00 00       	call   4bf <open>
  if(fd < 0)
 382:	83 c4 10             	add    $0x10,%esp
 385:	85 c0                	test   %eax,%eax
 387:	78 27                	js     3b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 389:	83 ec 08             	sub    $0x8,%esp
 38c:	ff 75 0c             	push   0xc(%ebp)
 38f:	89 c3                	mov    %eax,%ebx
 391:	50                   	push   %eax
 392:	e8 40 01 00 00       	call   4d7 <fstat>
  close(fd);
 397:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 39a:	89 c6                	mov    %eax,%esi
  close(fd);
 39c:	e8 06 01 00 00       	call   4a7 <close>
  return r;
 3a1:	83 c4 10             	add    $0x10,%esp
}
 3a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3a7:	89 f0                	mov    %esi,%eax
 3a9:	5b                   	pop    %ebx
 3aa:	5e                   	pop    %esi
 3ab:	5d                   	pop    %ebp
 3ac:	c3                   	ret
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3b5:	eb ed                	jmp    3a4 <stat+0x34>
 3b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3be:	00 
 3bf:	90                   	nop

000003c0 <atoi>:

int
atoi(const char *s)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	53                   	push   %ebx
 3c4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3c7:	0f be 02             	movsbl (%edx),%eax
 3ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3cd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3d5:	77 1e                	ja     3f5 <atoi+0x35>
 3d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3de:	00 
 3df:	90                   	nop
    n = n*10 + *s++ - '0';
 3e0:	83 c2 01             	add    $0x1,%edx
 3e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3ea:	0f be 02             	movsbl (%edx),%eax
 3ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3f0:	80 fb 09             	cmp    $0x9,%bl
 3f3:	76 eb                	jbe    3e0 <atoi+0x20>
  return n;
}
 3f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3f8:	89 c8                	mov    %ecx,%eax
 3fa:	c9                   	leave
 3fb:	c3                   	ret
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000400 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	8b 45 10             	mov    0x10(%ebp),%eax
 407:	8b 55 08             	mov    0x8(%ebp),%edx
 40a:	56                   	push   %esi
 40b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 40e:	85 c0                	test   %eax,%eax
 410:	7e 13                	jle    425 <memmove+0x25>
 412:	01 d0                	add    %edx,%eax
  dst = vdst;
 414:	89 d7                	mov    %edx,%edi
 416:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 41d:	00 
 41e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 420:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 421:	39 f8                	cmp    %edi,%eax
 423:	75 fb                	jne    420 <memmove+0x20>
  return vdst;
}
 425:	5e                   	pop    %esi
 426:	89 d0                	mov    %edx,%eax
 428:	5f                   	pop    %edi
 429:	5d                   	pop    %ebp
 42a:	c3                   	ret
 42b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000430 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	53                   	push   %ebx
 434:	8b 55 10             	mov    0x10(%ebp),%edx
 437:	8b 45 08             	mov    0x8(%ebp),%eax
 43a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(n > 0 && *p && *p == *q)
 43d:	85 d2                	test   %edx,%edx
 43f:	75 16                	jne    457 <strncmp+0x27>
 441:	eb 2d                	jmp    470 <strncmp+0x40>
 443:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 448:	3a 19                	cmp    (%ecx),%bl
 44a:	75 12                	jne    45e <strncmp+0x2e>
    n--, p++, q++;
 44c:	83 c0 01             	add    $0x1,%eax
 44f:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
 452:	83 ea 01             	sub    $0x1,%edx
 455:	74 19                	je     470 <strncmp+0x40>
 457:	0f b6 18             	movzbl (%eax),%ebx
 45a:	84 db                	test   %bl,%bl
 45c:	75 ea                	jne    448 <strncmp+0x18>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
 45e:	0f b6 00             	movzbl (%eax),%eax
 461:	0f b6 11             	movzbl (%ecx),%edx
}
 464:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 467:	c9                   	leave
  return (uchar)*p - (uchar)*q;
 468:	29 d0                	sub    %edx,%eax
}
 46a:	c3                   	ret
 46b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 470:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 473:	31 c0                	xor    %eax,%eax
}
 475:	c9                   	leave
 476:	c3                   	ret

00000477 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 477:	b8 01 00 00 00       	mov    $0x1,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret

0000047f <exit>:
SYSCALL(exit)
 47f:	b8 02 00 00 00       	mov    $0x2,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret

00000487 <wait>:
SYSCALL(wait)
 487:	b8 03 00 00 00       	mov    $0x3,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret

0000048f <pipe>:
SYSCALL(pipe)
 48f:	b8 04 00 00 00       	mov    $0x4,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret

00000497 <read>:
SYSCALL(read)
 497:	b8 05 00 00 00       	mov    $0x5,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret

0000049f <write>:
SYSCALL(write)
 49f:	b8 10 00 00 00       	mov    $0x10,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret

000004a7 <close>:
SYSCALL(close)
 4a7:	b8 15 00 00 00       	mov    $0x15,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret

000004af <kill>:
SYSCALL(kill)
 4af:	b8 06 00 00 00       	mov    $0x6,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret

000004b7 <exec>:
SYSCALL(exec)
 4b7:	b8 07 00 00 00       	mov    $0x7,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret

000004bf <open>:
SYSCALL(open)
 4bf:	b8 0f 00 00 00       	mov    $0xf,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret

000004c7 <mknod>:
SYSCALL(mknod)
 4c7:	b8 11 00 00 00       	mov    $0x11,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret

000004cf <unlink>:
SYSCALL(unlink)
 4cf:	b8 12 00 00 00       	mov    $0x12,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret

000004d7 <fstat>:
SYSCALL(fstat)
 4d7:	b8 08 00 00 00       	mov    $0x8,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret

000004df <link>:
SYSCALL(link)
 4df:	b8 13 00 00 00       	mov    $0x13,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret

000004e7 <mkdir>:
SYSCALL(mkdir)
 4e7:	b8 14 00 00 00       	mov    $0x14,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret

000004ef <chdir>:
SYSCALL(chdir)
 4ef:	b8 09 00 00 00       	mov    $0x9,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret

000004f7 <dup>:
SYSCALL(dup)
 4f7:	b8 0a 00 00 00       	mov    $0xa,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret

000004ff <getpid>:
SYSCALL(getpid)
 4ff:	b8 0b 00 00 00       	mov    $0xb,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret

00000507 <sbrk>:
SYSCALL(sbrk)
 507:	b8 0c 00 00 00       	mov    $0xc,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret

0000050f <sleep>:
SYSCALL(sleep)
 50f:	b8 0d 00 00 00       	mov    $0xd,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret

00000517 <uptime>:
SYSCALL(uptime)
 517:	b8 0e 00 00 00       	mov    $0xe,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret

0000051f <getprocs>:
SYSCALL(getprocs)
 51f:	b8 16 00 00 00       	mov    $0x16,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret

00000527 <clone>:
SYSCALL(clone)
 527:	b8 17 00 00 00       	mov    $0x17,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret

0000052f <join>:
SYSCALL(join)
 52f:	b8 18 00 00 00       	mov    $0x18,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret
 537:	66 90                	xchg   %ax,%ax
 539:	66 90                	xchg   %ax,%ax
 53b:	66 90                	xchg   %ax,%ax
 53d:	66 90                	xchg   %ax,%ax
 53f:	90                   	nop

00000540 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 548:	89 d1                	mov    %edx,%ecx
{
 54a:	83 ec 3c             	sub    $0x3c,%esp
 54d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 550:	85 d2                	test   %edx,%edx
 552:	0f 89 80 00 00 00    	jns    5d8 <printint+0x98>
 558:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 55c:	74 7a                	je     5d8 <printint+0x98>
    x = -xx;
 55e:	f7 d9                	neg    %ecx
    neg = 1;
 560:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 565:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 568:	31 f6                	xor    %esi,%esi
 56a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 570:	89 c8                	mov    %ecx,%eax
 572:	31 d2                	xor    %edx,%edx
 574:	89 f7                	mov    %esi,%edi
 576:	f7 f3                	div    %ebx
 578:	8d 76 01             	lea    0x1(%esi),%esi
 57b:	0f b6 92 48 0b 00 00 	movzbl 0xb48(%edx),%edx
 582:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 586:	89 ca                	mov    %ecx,%edx
 588:	89 c1                	mov    %eax,%ecx
 58a:	39 da                	cmp    %ebx,%edx
 58c:	73 e2                	jae    570 <printint+0x30>
  if(neg)
 58e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 591:	85 c0                	test   %eax,%eax
 593:	74 07                	je     59c <printint+0x5c>
    buf[i++] = '-';
 595:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 59a:	89 f7                	mov    %esi,%edi
 59c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 59f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 5a2:	01 df                	add    %ebx,%edi
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 5a8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 5ab:	83 ec 04             	sub    $0x4,%esp
 5ae:	88 45 d7             	mov    %al,-0x29(%ebp)
 5b1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 5b4:	6a 01                	push   $0x1
 5b6:	50                   	push   %eax
 5b7:	56                   	push   %esi
 5b8:	e8 e2 fe ff ff       	call   49f <write>
  while(--i >= 0)
 5bd:	89 f8                	mov    %edi,%eax
 5bf:	83 c4 10             	add    $0x10,%esp
 5c2:	83 ef 01             	sub    $0x1,%edi
 5c5:	39 c3                	cmp    %eax,%ebx
 5c7:	75 df                	jne    5a8 <printint+0x68>
}
 5c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cc:	5b                   	pop    %ebx
 5cd:	5e                   	pop    %esi
 5ce:	5f                   	pop    %edi
 5cf:	5d                   	pop    %ebp
 5d0:	c3                   	ret
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5d8:	31 c0                	xor    %eax,%eax
 5da:	eb 89                	jmp    565 <printint+0x25>
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
 5e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5e9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 5ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 5ef:	0f b6 1e             	movzbl (%esi),%ebx
 5f2:	83 c6 01             	add    $0x1,%esi
 5f5:	84 db                	test   %bl,%bl
 5f7:	74 67                	je     660 <printf+0x80>
 5f9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 5fc:	31 d2                	xor    %edx,%edx
 5fe:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 601:	eb 34                	jmp    637 <printf+0x57>
 603:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 608:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 60b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 610:	83 f8 25             	cmp    $0x25,%eax
 613:	74 18                	je     62d <printf+0x4d>
  write(fd, &c, 1);
 615:	83 ec 04             	sub    $0x4,%esp
 618:	8d 45 e7             	lea    -0x19(%ebp),%eax
 61b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 61e:	6a 01                	push   $0x1
 620:	50                   	push   %eax
 621:	57                   	push   %edi
 622:	e8 78 fe ff ff       	call   49f <write>
 627:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 62a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 62d:	0f b6 1e             	movzbl (%esi),%ebx
 630:	83 c6 01             	add    $0x1,%esi
 633:	84 db                	test   %bl,%bl
 635:	74 29                	je     660 <printf+0x80>
    c = fmt[i] & 0xff;
 637:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 63a:	85 d2                	test   %edx,%edx
 63c:	74 ca                	je     608 <printf+0x28>
      }
    } else if(state == '%'){
 63e:	83 fa 25             	cmp    $0x25,%edx
 641:	75 ea                	jne    62d <printf+0x4d>
      if(c == 'd'){
 643:	83 f8 25             	cmp    $0x25,%eax
 646:	0f 84 04 01 00 00    	je     750 <printf+0x170>
 64c:	83 e8 63             	sub    $0x63,%eax
 64f:	83 f8 15             	cmp    $0x15,%eax
 652:	77 1c                	ja     670 <printf+0x90>
 654:	ff 24 85 f0 0a 00 00 	jmp    *0xaf0(,%eax,4)
 65b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 660:	8d 65 f4             	lea    -0xc(%ebp),%esp
 663:	5b                   	pop    %ebx
 664:	5e                   	pop    %esi
 665:	5f                   	pop    %edi
 666:	5d                   	pop    %ebp
 667:	c3                   	ret
 668:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 66f:	00 
  write(fd, &c, 1);
 670:	83 ec 04             	sub    $0x4,%esp
 673:	8d 55 e7             	lea    -0x19(%ebp),%edx
 676:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 67a:	6a 01                	push   $0x1
 67c:	52                   	push   %edx
 67d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 680:	57                   	push   %edi
 681:	e8 19 fe ff ff       	call   49f <write>
 686:	83 c4 0c             	add    $0xc,%esp
 689:	88 5d e7             	mov    %bl,-0x19(%ebp)
 68c:	6a 01                	push   $0x1
 68e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 691:	52                   	push   %edx
 692:	57                   	push   %edi
 693:	e8 07 fe ff ff       	call   49f <write>
        putc(fd, c);
 698:	83 c4 10             	add    $0x10,%esp
      state = 0;
 69b:	31 d2                	xor    %edx,%edx
 69d:	eb 8e                	jmp    62d <printf+0x4d>
 69f:	90                   	nop
        printint(fd, *ap, 16, 0);
 6a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6a3:	83 ec 0c             	sub    $0xc,%esp
 6a6:	b9 10 00 00 00       	mov    $0x10,%ecx
 6ab:	8b 13                	mov    (%ebx),%edx
 6ad:	6a 00                	push   $0x0
 6af:	89 f8                	mov    %edi,%eax
        ap++;
 6b1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 6b4:	e8 87 fe ff ff       	call   540 <printint>
        ap++;
 6b9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6bf:	31 d2                	xor    %edx,%edx
 6c1:	e9 67 ff ff ff       	jmp    62d <printf+0x4d>
        s = (char*)*ap;
 6c6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6c9:	8b 18                	mov    (%eax),%ebx
        ap++;
 6cb:	83 c0 04             	add    $0x4,%eax
 6ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6d1:	85 db                	test   %ebx,%ebx
 6d3:	0f 84 87 00 00 00    	je     760 <printf+0x180>
        while(*s != 0){
 6d9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 6dc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 6de:	84 c0                	test   %al,%al
 6e0:	0f 84 47 ff ff ff    	je     62d <printf+0x4d>
 6e6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6e9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6ec:	89 de                	mov    %ebx,%esi
 6ee:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 6f0:	83 ec 04             	sub    $0x4,%esp
 6f3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 6f6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6f9:	6a 01                	push   $0x1
 6fb:	53                   	push   %ebx
 6fc:	57                   	push   %edi
 6fd:	e8 9d fd ff ff       	call   49f <write>
        while(*s != 0){
 702:	0f b6 06             	movzbl (%esi),%eax
 705:	83 c4 10             	add    $0x10,%esp
 708:	84 c0                	test   %al,%al
 70a:	75 e4                	jne    6f0 <printf+0x110>
      state = 0;
 70c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 70f:	31 d2                	xor    %edx,%edx
 711:	e9 17 ff ff ff       	jmp    62d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 716:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 719:	83 ec 0c             	sub    $0xc,%esp
 71c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 721:	8b 13                	mov    (%ebx),%edx
 723:	6a 01                	push   $0x1
 725:	eb 88                	jmp    6af <printf+0xcf>
        putc(fd, *ap);
 727:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 72a:	83 ec 04             	sub    $0x4,%esp
 72d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 730:	8b 03                	mov    (%ebx),%eax
        ap++;
 732:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 735:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 738:	6a 01                	push   $0x1
 73a:	52                   	push   %edx
 73b:	57                   	push   %edi
 73c:	e8 5e fd ff ff       	call   49f <write>
        ap++;
 741:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 744:	83 c4 10             	add    $0x10,%esp
      state = 0;
 747:	31 d2                	xor    %edx,%edx
 749:	e9 df fe ff ff       	jmp    62d <printf+0x4d>
 74e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 750:	83 ec 04             	sub    $0x4,%esp
 753:	88 5d e7             	mov    %bl,-0x19(%ebp)
 756:	8d 55 e7             	lea    -0x19(%ebp),%edx
 759:	6a 01                	push   $0x1
 75b:	e9 31 ff ff ff       	jmp    691 <printf+0xb1>
 760:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 765:	bb e6 0a 00 00       	mov    $0xae6,%ebx
 76a:	e9 77 ff ff ff       	jmp    6e6 <printf+0x106>
 76f:	90                   	nop

00000770 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 770:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	a1 14 0f 00 00       	mov    0xf14,%eax
{
 776:	89 e5                	mov    %esp,%ebp
 778:	57                   	push   %edi
 779:	56                   	push   %esi
 77a:	53                   	push   %ebx
 77b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 77e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 788:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78a:	39 c8                	cmp    %ecx,%eax
 78c:	73 32                	jae    7c0 <free+0x50>
 78e:	39 d1                	cmp    %edx,%ecx
 790:	72 04                	jb     796 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 792:	39 d0                	cmp    %edx,%eax
 794:	72 32                	jb     7c8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 796:	8b 73 fc             	mov    -0x4(%ebx),%esi
 799:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 79c:	39 fa                	cmp    %edi,%edx
 79e:	74 30                	je     7d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7a0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7a3:	8b 50 04             	mov    0x4(%eax),%edx
 7a6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7a9:	39 f1                	cmp    %esi,%ecx
 7ab:	74 3a                	je     7e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7ad:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7af:	5b                   	pop    %ebx
  freep = p;
 7b0:	a3 14 0f 00 00       	mov    %eax,0xf14
}
 7b5:	5e                   	pop    %esi
 7b6:	5f                   	pop    %edi
 7b7:	5d                   	pop    %ebp
 7b8:	c3                   	ret
 7b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c0:	39 d0                	cmp    %edx,%eax
 7c2:	72 04                	jb     7c8 <free+0x58>
 7c4:	39 d1                	cmp    %edx,%ecx
 7c6:	72 ce                	jb     796 <free+0x26>
{
 7c8:	89 d0                	mov    %edx,%eax
 7ca:	eb bc                	jmp    788 <free+0x18>
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7d0:	03 72 04             	add    0x4(%edx),%esi
 7d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d6:	8b 10                	mov    (%eax),%edx
 7d8:	8b 12                	mov    (%edx),%edx
 7da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7dd:	8b 50 04             	mov    0x4(%eax),%edx
 7e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7e3:	39 f1                	cmp    %esi,%ecx
 7e5:	75 c6                	jne    7ad <free+0x3d>
    p->s.size += bp->s.size;
 7e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7ea:	a3 14 0f 00 00       	mov    %eax,0xf14
    p->s.size += bp->s.size;
 7ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7f5:	89 08                	mov    %ecx,(%eax)
}
 7f7:	5b                   	pop    %ebx
 7f8:	5e                   	pop    %esi
 7f9:	5f                   	pop    %edi
 7fa:	5d                   	pop    %ebp
 7fb:	c3                   	ret
 7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000800 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 809:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 80c:	8b 15 14 0f 00 00    	mov    0xf14,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 812:	8d 78 07             	lea    0x7(%eax),%edi
 815:	c1 ef 03             	shr    $0x3,%edi
 818:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 81b:	85 d2                	test   %edx,%edx
 81d:	0f 84 8d 00 00 00    	je     8b0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 823:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 825:	8b 48 04             	mov    0x4(%eax),%ecx
 828:	39 f9                	cmp    %edi,%ecx
 82a:	73 64                	jae    890 <malloc+0x90>
  if(nu < 4096)
 82c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 831:	39 df                	cmp    %ebx,%edi
 833:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 836:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 83d:	eb 0a                	jmp    849 <malloc+0x49>
 83f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 840:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 842:	8b 48 04             	mov    0x4(%eax),%ecx
 845:	39 f9                	cmp    %edi,%ecx
 847:	73 47                	jae    890 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 849:	89 c2                	mov    %eax,%edx
 84b:	3b 05 14 0f 00 00    	cmp    0xf14,%eax
 851:	75 ed                	jne    840 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 853:	83 ec 0c             	sub    $0xc,%esp
 856:	56                   	push   %esi
 857:	e8 ab fc ff ff       	call   507 <sbrk>
  if(p == (char*)-1)
 85c:	83 c4 10             	add    $0x10,%esp
 85f:	83 f8 ff             	cmp    $0xffffffff,%eax
 862:	74 1c                	je     880 <malloc+0x80>
  hp->s.size = nu;
 864:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 867:	83 ec 0c             	sub    $0xc,%esp
 86a:	83 c0 08             	add    $0x8,%eax
 86d:	50                   	push   %eax
 86e:	e8 fd fe ff ff       	call   770 <free>
  return freep;
 873:	8b 15 14 0f 00 00    	mov    0xf14,%edx
      if((p = morecore(nunits)) == 0)
 879:	83 c4 10             	add    $0x10,%esp
 87c:	85 d2                	test   %edx,%edx
 87e:	75 c0                	jne    840 <malloc+0x40>
        return 0;
  }
}
 880:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 883:	31 c0                	xor    %eax,%eax
}
 885:	5b                   	pop    %ebx
 886:	5e                   	pop    %esi
 887:	5f                   	pop    %edi
 888:	5d                   	pop    %ebp
 889:	c3                   	ret
 88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 890:	39 cf                	cmp    %ecx,%edi
 892:	74 4c                	je     8e0 <malloc+0xe0>
        p->s.size -= nunits;
 894:	29 f9                	sub    %edi,%ecx
 896:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 899:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 89c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 89f:	89 15 14 0f 00 00    	mov    %edx,0xf14
}
 8a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8a8:	83 c0 08             	add    $0x8,%eax
}
 8ab:	5b                   	pop    %ebx
 8ac:	5e                   	pop    %esi
 8ad:	5f                   	pop    %edi
 8ae:	5d                   	pop    %ebp
 8af:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 8b0:	c7 05 14 0f 00 00 18 	movl   $0xf18,0xf14
 8b7:	0f 00 00 
    base.s.size = 0;
 8ba:	b8 18 0f 00 00       	mov    $0xf18,%eax
    base.s.ptr = freep = prevp = &base;
 8bf:	c7 05 18 0f 00 00 18 	movl   $0xf18,0xf18
 8c6:	0f 00 00 
    base.s.size = 0;
 8c9:	c7 05 1c 0f 00 00 00 	movl   $0x0,0xf1c
 8d0:	00 00 00 
    if(p->s.size >= nunits){
 8d3:	e9 54 ff ff ff       	jmp    82c <malloc+0x2c>
 8d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8df:	00 
        prevp->s.ptr = p->s.ptr;
 8e0:	8b 08                	mov    (%eax),%ecx
 8e2:	89 0a                	mov    %ecx,(%edx)
 8e4:	eb b9                	jmp    89f <malloc+0x9f>
 8e6:	66 90                	xchg   %ax,%ax
 8e8:	66 90                	xchg   %ax,%ax
 8ea:	66 90                	xchg   %ax,%ax
 8ec:	66 90                	xchg   %ax,%ax
 8ee:	66 90                	xchg   %ax,%ax

000008f0 <thread_create>:
#include "user.h"
#include "uthread.h"

#define PGSIZE 4096

int thread_create(void (*start_routine)(void*,void*), void *arg1, void *arg2) {
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
 8f3:	53                   	push   %ebx
 8f4:	83 ec 10             	sub    $0x10,%esp
  // allocate a user stack for the new thread
  void *stack = malloc(PGSIZE);
 8f7:	68 00 10 00 00       	push   $0x1000
 8fc:	e8 ff fe ff ff       	call   800 <malloc>
  if(stack == 0) return -1;
 901:	83 c4 10             	add    $0x10,%esp
 904:	85 c0                	test   %eax,%eax
 906:	74 3d                	je     945 <thread_create+0x55>
 908:	89 c3                	mov    %eax,%ebx

  // align to page boundary (defensive)
  if((uint)stack % PGSIZE) stack = (void*)(((uint)stack + PGSIZE) & ~(PGSIZE-1));
 90a:	8d 80 00 10 00 00    	lea    0x1000(%eax),%eax
 910:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 915:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 91b:	0f 45 d8             	cmovne %eax,%ebx

  int pid = clone(start_routine, arg1, arg2, stack);
 91e:	53                   	push   %ebx
 91f:	ff 75 10             	push   0x10(%ebp)
 922:	ff 75 0c             	push   0xc(%ebp)
 925:	ff 75 08             	push   0x8(%ebp)
 928:	e8 fa fb ff ff       	call   527 <clone>
  if(pid < 0) {
 92d:	83 c4 10             	add    $0x10,%esp
 930:	85 c0                	test   %eax,%eax
 932:	78 05                	js     939 <thread_create+0x49>
    free(stack);
    return -1;
  }
  return pid;
}
 934:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 937:	c9                   	leave
 938:	c3                   	ret
    free(stack);
 939:	83 ec 0c             	sub    $0xc,%esp
 93c:	53                   	push   %ebx
 93d:	e8 2e fe ff ff       	call   770 <free>
    return -1;
 942:	83 c4 10             	add    $0x10,%esp
  if(stack == 0) return -1;
 945:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 94a:	eb e8                	jmp    934 <thread_create+0x44>
 94c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000950 <thread_join>:

int thread_join(void) {
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	53                   	push   %ebx
  void *stack;
  int pid = join(&stack);
 954:	8d 45 f4             	lea    -0xc(%ebp),%eax
int thread_join(void) {
 957:	83 ec 20             	sub    $0x20,%esp
  int pid = join(&stack);
 95a:	50                   	push   %eax
 95b:	e8 cf fb ff ff       	call   52f <join>
  if(pid >= 0 && stack) free(stack);
 960:	83 c4 10             	add    $0x10,%esp
  int pid = join(&stack);
 963:	89 c3                	mov    %eax,%ebx
  if(pid >= 0 && stack) free(stack);
 965:	85 c0                	test   %eax,%eax
 967:	78 13                	js     97c <thread_join+0x2c>
 969:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96c:	85 c0                	test   %eax,%eax
 96e:	74 0c                	je     97c <thread_join+0x2c>
 970:	83 ec 0c             	sub    $0xc,%esp
 973:	50                   	push   %eax
 974:	e8 f7 fd ff ff       	call   770 <free>
 979:	83 c4 10             	add    $0x10,%esp
  return pid;
}
 97c:	89 d8                	mov    %ebx,%eax
 97e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 981:	c9                   	leave
 982:	c3                   	ret
 983:	66 90                	xchg   %ax,%ax
 985:	66 90                	xchg   %ax,%ax
 987:	66 90                	xchg   %ax,%ax
 989:	66 90                	xchg   %ax,%ax
 98b:	66 90                	xchg   %ax,%ax
 98d:	66 90                	xchg   %ax,%ax
 98f:	90                   	nop

00000990 <lock_init>:
#include "types.h"
#include "ulock.h"

// Simple user-space spinlock using GCC builtins.
// Works with your 32-bit toolchain and static linking.
void lock_init(lock_t *l) {
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
  l->locked = 0;
 993:	8b 45 08             	mov    0x8(%ebp),%eax
 996:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 99c:	5d                   	pop    %ebp
 99d:	c3                   	ret
 99e:	66 90                	xchg   %ax,%ax

000009a0 <lock_acquire>:

void lock_acquire(lock_t *l) {
 9a0:	55                   	push   %ebp
  // spin until we acquire (returns previous value)
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
 9a1:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *l) {
 9a6:	89 e5                	mov    %esp,%ebp
 9a8:	8b 45 08             	mov    0x8(%ebp),%eax
 9ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
 9b0:	89 ca                	mov    %ecx,%edx
 9b2:	87 10                	xchg   %edx,(%eax)
 9b4:	85 d2                	test   %edx,%edx
 9b6:	75 f8                	jne    9b0 <lock_acquire+0x10>
  // full barrier after acquiring
  __sync_synchronize();
 9b8:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 9bd:	5d                   	pop    %ebp
 9be:	c3                   	ret
 9bf:	90                   	nop

000009c0 <lock_release>:

void lock_release(lock_t *l) {
 9c0:	55                   	push   %ebp
  // full barrier before releasing
  __sync_synchronize();
 9c1:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
void lock_release(lock_t *l) {
 9c6:	89 e5                	mov    %esp,%ebp
  __sync_lock_release(&l->locked);   // atomic store 0 with release semantics
 9c8:	8b 45 08             	mov    0x8(%ebp),%eax
 9cb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 9d1:	5d                   	pop    %ebp
 9d2:	c3                   	ret
