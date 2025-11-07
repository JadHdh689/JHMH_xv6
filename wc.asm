
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7f 28                	jg     51 <main+0x51>
  29:	eb 54                	jmp    7f <main+0x7f>
  2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  30:	83 ec 08             	sub    $0x8,%esp
  33:	ff 33                	push   (%ebx)
  for(i = 1; i < argc; i++){
  35:	83 c6 01             	add    $0x1,%esi
  38:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  3b:	50                   	push   %eax
  3c:	e8 5f 00 00 00       	call   a0 <wc>
    close(fd);
  41:	89 3c 24             	mov    %edi,(%esp)
  44:	e8 ee 03 00 00       	call   437 <close>
  for(i = 1; i < argc; i++){
  49:	83 c4 10             	add    $0x10,%esp
  4c:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  4f:	74 29                	je     7a <main+0x7a>
    if((fd = open(argv[i], 0)) < 0){
  51:	83 ec 08             	sub    $0x8,%esp
  54:	6a 00                	push   $0x0
  56:	ff 33                	push   (%ebx)
  58:	e8 f2 03 00 00       	call   44f <open>
  5d:	83 c4 10             	add    $0x10,%esp
  60:	89 c7                	mov    %eax,%edi
  62:	85 c0                	test   %eax,%eax
  64:	79 ca                	jns    30 <main+0x30>
      printf(1, "wc: cannot open %s\n", argv[i]);
  66:	50                   	push   %eax
  67:	ff 33                	push   (%ebx)
  69:	68 87 09 00 00       	push   $0x987
  6e:	6a 01                	push   $0x1
  70:	e8 fb 04 00 00       	call   570 <printf>
      exit();
  75:	e8 95 03 00 00       	call   40f <exit>
  }
  exit();
  7a:	e8 90 03 00 00       	call   40f <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 79 09 00 00       	push   $0x979
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 7d 03 00 00       	call   40f <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  l = w = c = 0;
  a1:	31 d2                	xor    %edx,%edx
{
  a3:	89 e5                	mov    %esp,%ebp
  a5:	57                   	push   %edi
  a6:	56                   	push   %esi
  inword = 0;
  a7:	31 f6                	xor    %esi,%esi
{
  a9:	53                   	push   %ebx
  l = w = c = 0;
  aa:	31 db                	xor    %ebx,%ebx
{
  ac:	83 ec 1c             	sub    $0x1c,%esp
  l = w = c = 0;
  af:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  b6:	89 55 dc             	mov    %edx,-0x24(%ebp)
  b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 c0 0d 00 00       	push   $0xdc0
  cd:	ff 75 08             	push   0x8(%ebp)
  d0:	e8 52 03 00 00       	call   427 <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	89 c1                	mov    %eax,%ecx
  da:	85 c0                	test   %eax,%eax
  dc:	7e 62                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  de:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  e1:	31 ff                	xor    %edi,%edi
  e3:	eb 0d                	jmp    f2 <wc+0x52>
  e5:	8d 76 00             	lea    0x0(%esi),%esi
        inword = 0;
  e8:	31 f6                	xor    %esi,%esi
    for(i=0; i<n; i++){
  ea:	83 c7 01             	add    $0x1,%edi
  ed:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  f0:	74 3e                	je     130 <wc+0x90>
      if(buf[i] == '\n')
  f2:	0f be 87 c0 0d 00 00 	movsbl 0xdc0(%edi),%eax
        l++;
  f9:	31 c9                	xor    %ecx,%ecx
  fb:	3c 0a                	cmp    $0xa,%al
  fd:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 100:	83 ec 08             	sub    $0x8,%esp
 103:	50                   	push   %eax
        l++;
 104:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 106:	68 64 09 00 00       	push   $0x964
 10b:	e8 50 01 00 00       	call   260 <strchr>
 110:	83 c4 10             	add    $0x10,%esp
 113:	85 c0                	test   %eax,%eax
 115:	75 d1                	jne    e8 <wc+0x48>
      else if(!inword){
 117:	85 f6                	test   %esi,%esi
 119:	75 cf                	jne    ea <wc+0x4a>
        w++;
 11b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 11f:	be 01 00 00 00       	mov    $0x1,%esi
    for(i=0; i<n; i++){
 124:	83 c7 01             	add    $0x1,%edi
 127:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
 12a:	75 c6                	jne    f2 <wc+0x52>
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 130:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 133:	01 4d dc             	add    %ecx,-0x24(%ebp)
 136:	eb 88                	jmp    c0 <wc+0x20>
 138:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 13f:	00 
  if(n < 0){
 140:	8b 55 dc             	mov    -0x24(%ebp),%edx
 143:	75 22                	jne    167 <wc+0xc7>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 145:	83 ec 08             	sub    $0x8,%esp
 148:	ff 75 0c             	push   0xc(%ebp)
 14b:	52                   	push   %edx
 14c:	ff 75 e0             	push   -0x20(%ebp)
 14f:	53                   	push   %ebx
 150:	68 7a 09 00 00       	push   $0x97a
 155:	6a 01                	push   $0x1
 157:	e8 14 04 00 00       	call   570 <printf>
}
 15c:	83 c4 20             	add    $0x20,%esp
 15f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 162:	5b                   	pop    %ebx
 163:	5e                   	pop    %esi
 164:	5f                   	pop    %edi
 165:	5d                   	pop    %ebp
 166:	c3                   	ret
    printf(1, "wc: read error\n");
 167:	50                   	push   %eax
 168:	50                   	push   %eax
 169:	68 6a 09 00 00       	push   $0x96a
 16e:	6a 01                	push   $0x1
 170:	e8 fb 03 00 00       	call   570 <printf>
    exit();
 175:	e8 95 02 00 00       	call   40f <exit>
 17a:	66 90                	xchg   %ax,%ax
 17c:	66 90                	xchg   %ax,%ax
 17e:	66 90                	xchg   %ax,%ax

00000180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 181:	31 c0                	xor    %eax,%eax
{
 183:	89 e5                	mov    %esp,%ebp
 185:	53                   	push   %ebx
 186:	8b 4d 08             	mov    0x8(%ebp),%ecx
 189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 197:	83 c0 01             	add    $0x1,%eax
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 19e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a1:	89 c8                	mov    %ecx,%eax
 1a3:	c9                   	leave
 1a4:	c3                   	ret
 1a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ac:	00 
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	84 c0                	test   %al,%al
 1bf:	75 17                	jne    1d8 <strcmp+0x28>
 1c1:	eb 3a                	jmp    1fd <strcmp+0x4d>
 1c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1cc:	83 c2 01             	add    $0x1,%edx
 1cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1d2:	84 c0                	test   %al,%al
 1d4:	74 1a                	je     1f0 <strcmp+0x40>
 1d6:	89 d9                	mov    %ebx,%ecx
 1d8:	0f b6 19             	movzbl (%ecx),%ebx
 1db:	38 c3                	cmp    %al,%bl
 1dd:	74 e9                	je     1c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1df:	29 d8                	sub    %ebx,%eax
}
 1e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e4:	c9                   	leave
 1e5:	c3                   	ret
 1e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ed:	00 
 1ee:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 1f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1f4:	31 c0                	xor    %eax,%eax
 1f6:	29 d8                	sub    %ebx,%eax
}
 1f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fb:	c9                   	leave
 1fc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 1fd:	0f b6 19             	movzbl (%ecx),%ebx
 200:	31 c0                	xor    %eax,%eax
 202:	eb db                	jmp    1df <strcmp+0x2f>
 204:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 20b:	00 
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 216:	80 3a 00             	cmpb   $0x0,(%edx)
 219:	74 15                	je     230 <strlen+0x20>
 21b:	31 c0                	xor    %eax,%eax
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	83 c0 01             	add    $0x1,%eax
 223:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 227:	89 c1                	mov    %eax,%ecx
 229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
 22b:	89 c8                	mov    %ecx,%eax
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret
 22f:	90                   	nop
  for(n = 0; s[n]; n++)
 230:	31 c9                	xor    %ecx,%ecx
}
 232:	5d                   	pop    %ebp
 233:	89 c8                	mov    %ecx,%eax
 235:	c3                   	ret
 236:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23d:	00 
 23e:	66 90                	xchg   %ax,%ax

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	8b 7d fc             	mov    -0x4(%ebp),%edi
 255:	89 d0                	mov    %edx,%eax
 257:	c9                   	leave
 258:	c3                   	ret
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26a:	0f b6 10             	movzbl (%eax),%edx
 26d:	84 d2                	test   %dl,%dl
 26f:	75 12                	jne    283 <strchr+0x23>
 271:	eb 1d                	jmp    290 <strchr+0x30>
 273:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 278:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 27c:	83 c0 01             	add    $0x1,%eax
 27f:	84 d2                	test   %dl,%dl
 281:	74 0d                	je     290 <strchr+0x30>
    if(*s == c)
 283:	38 d1                	cmp    %dl,%cl
 285:	75 f1                	jne    278 <strchr+0x18>
      return (char*)s;
  return 0;
}
 287:	5d                   	pop    %ebp
 288:	c3                   	ret
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 290:	31 c0                	xor    %eax,%eax
}
 292:	5d                   	pop    %ebp
 293:	c3                   	ret
 294:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 29b:	00 
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2a5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 2a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2a9:	31 db                	xor    %ebx,%ebx
{
 2ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2ae:	eb 27                	jmp    2d7 <gets+0x37>
    cc = read(0, &c, 1);
 2b0:	83 ec 04             	sub    $0x4,%esp
 2b3:	6a 01                	push   $0x1
 2b5:	56                   	push   %esi
 2b6:	6a 00                	push   $0x0
 2b8:	e8 6a 01 00 00       	call   427 <read>
    if(cc < 1)
 2bd:	83 c4 10             	add    $0x10,%esp
 2c0:	85 c0                	test   %eax,%eax
 2c2:	7e 1d                	jle    2e1 <gets+0x41>
      break;
    buf[i++] = c;
 2c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c8:	8b 55 08             	mov    0x8(%ebp),%edx
 2cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2cf:	3c 0a                	cmp    $0xa,%al
 2d1:	74 10                	je     2e3 <gets+0x43>
 2d3:	3c 0d                	cmp    $0xd,%al
 2d5:	74 0c                	je     2e3 <gets+0x43>
  for(i=0; i+1 < max; ){
 2d7:	89 df                	mov    %ebx,%edi
 2d9:	83 c3 01             	add    $0x1,%ebx
 2dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2df:	7c cf                	jl     2b0 <gets+0x10>
 2e1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 2ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ed:	5b                   	pop    %ebx
 2ee:	5e                   	pop    %esi
 2ef:	5f                   	pop    %edi
 2f0:	5d                   	pop    %ebp
 2f1:	c3                   	ret
 2f2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2f9:	00 
 2fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000300 <stat>:

int
stat(const char *n, struct stat *st)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	56                   	push   %esi
 304:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 305:	83 ec 08             	sub    $0x8,%esp
 308:	6a 00                	push   $0x0
 30a:	ff 75 08             	push   0x8(%ebp)
 30d:	e8 3d 01 00 00       	call   44f <open>
  if(fd < 0)
 312:	83 c4 10             	add    $0x10,%esp
 315:	85 c0                	test   %eax,%eax
 317:	78 27                	js     340 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	ff 75 0c             	push   0xc(%ebp)
 31f:	89 c3                	mov    %eax,%ebx
 321:	50                   	push   %eax
 322:	e8 40 01 00 00       	call   467 <fstat>
  close(fd);
 327:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 32a:	89 c6                	mov    %eax,%esi
  close(fd);
 32c:	e8 06 01 00 00       	call   437 <close>
  return r;
 331:	83 c4 10             	add    $0x10,%esp
}
 334:	8d 65 f8             	lea    -0x8(%ebp),%esp
 337:	89 f0                	mov    %esi,%eax
 339:	5b                   	pop    %ebx
 33a:	5e                   	pop    %esi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret
 33d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 340:	be ff ff ff ff       	mov    $0xffffffff,%esi
 345:	eb ed                	jmp    334 <stat+0x34>
 347:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 34e:	00 
 34f:	90                   	nop

00000350 <atoi>:

int
atoi(const char *s)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	53                   	push   %ebx
 354:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 357:	0f be 02             	movsbl (%edx),%eax
 35a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 35d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 360:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 365:	77 1e                	ja     385 <atoi+0x35>
 367:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 36e:	00 
 36f:	90                   	nop
    n = n*10 + *s++ - '0';
 370:	83 c2 01             	add    $0x1,%edx
 373:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 376:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 37a:	0f be 02             	movsbl (%edx),%eax
 37d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 380:	80 fb 09             	cmp    $0x9,%bl
 383:	76 eb                	jbe    370 <atoi+0x20>
  return n;
}
 385:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 388:	89 c8                	mov    %ecx,%eax
 38a:	c9                   	leave
 38b:	c3                   	ret
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000390 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	8b 45 10             	mov    0x10(%ebp),%eax
 397:	8b 55 08             	mov    0x8(%ebp),%edx
 39a:	56                   	push   %esi
 39b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 39e:	85 c0                	test   %eax,%eax
 3a0:	7e 13                	jle    3b5 <memmove+0x25>
 3a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3a4:	89 d7                	mov    %edx,%edi
 3a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ad:	00 
 3ae:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 3b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3b1:	39 f8                	cmp    %edi,%eax
 3b3:	75 fb                	jne    3b0 <memmove+0x20>
  return vdst;
}
 3b5:	5e                   	pop    %esi
 3b6:	89 d0                	mov    %edx,%eax
 3b8:	5f                   	pop    %edi
 3b9:	5d                   	pop    %ebp
 3ba:	c3                   	ret
 3bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000003c0 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	53                   	push   %ebx
 3c4:	8b 55 10             	mov    0x10(%ebp),%edx
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(n > 0 && *p && *p == *q)
 3cd:	85 d2                	test   %edx,%edx
 3cf:	75 16                	jne    3e7 <strncmp+0x27>
 3d1:	eb 2d                	jmp    400 <strncmp+0x40>
 3d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 3d8:	3a 19                	cmp    (%ecx),%bl
 3da:	75 12                	jne    3ee <strncmp+0x2e>
    n--, p++, q++;
 3dc:	83 c0 01             	add    $0x1,%eax
 3df:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
 3e2:	83 ea 01             	sub    $0x1,%edx
 3e5:	74 19                	je     400 <strncmp+0x40>
 3e7:	0f b6 18             	movzbl (%eax),%ebx
 3ea:	84 db                	test   %bl,%bl
 3ec:	75 ea                	jne    3d8 <strncmp+0x18>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
 3ee:	0f b6 00             	movzbl (%eax),%eax
 3f1:	0f b6 11             	movzbl (%ecx),%edx
}
 3f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3f7:	c9                   	leave
  return (uchar)*p - (uchar)*q;
 3f8:	29 d0                	sub    %edx,%eax
}
 3fa:	c3                   	ret
 3fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 400:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 403:	31 c0                	xor    %eax,%eax
}
 405:	c9                   	leave
 406:	c3                   	ret

00000407 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 407:	b8 01 00 00 00       	mov    $0x1,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret

0000040f <exit>:
SYSCALL(exit)
 40f:	b8 02 00 00 00       	mov    $0x2,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret

00000417 <wait>:
SYSCALL(wait)
 417:	b8 03 00 00 00       	mov    $0x3,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret

0000041f <pipe>:
SYSCALL(pipe)
 41f:	b8 04 00 00 00       	mov    $0x4,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret

00000427 <read>:
SYSCALL(read)
 427:	b8 05 00 00 00       	mov    $0x5,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret

0000042f <write>:
SYSCALL(write)
 42f:	b8 10 00 00 00       	mov    $0x10,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret

00000437 <close>:
SYSCALL(close)
 437:	b8 15 00 00 00       	mov    $0x15,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret

0000043f <kill>:
SYSCALL(kill)
 43f:	b8 06 00 00 00       	mov    $0x6,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret

00000447 <exec>:
SYSCALL(exec)
 447:	b8 07 00 00 00       	mov    $0x7,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret

0000044f <open>:
SYSCALL(open)
 44f:	b8 0f 00 00 00       	mov    $0xf,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret

00000457 <mknod>:
SYSCALL(mknod)
 457:	b8 11 00 00 00       	mov    $0x11,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret

0000045f <unlink>:
SYSCALL(unlink)
 45f:	b8 12 00 00 00       	mov    $0x12,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret

00000467 <fstat>:
SYSCALL(fstat)
 467:	b8 08 00 00 00       	mov    $0x8,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret

0000046f <link>:
SYSCALL(link)
 46f:	b8 13 00 00 00       	mov    $0x13,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret

00000477 <mkdir>:
SYSCALL(mkdir)
 477:	b8 14 00 00 00       	mov    $0x14,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret

0000047f <chdir>:
SYSCALL(chdir)
 47f:	b8 09 00 00 00       	mov    $0x9,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret

00000487 <dup>:
SYSCALL(dup)
 487:	b8 0a 00 00 00       	mov    $0xa,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret

0000048f <getpid>:
SYSCALL(getpid)
 48f:	b8 0b 00 00 00       	mov    $0xb,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret

00000497 <sbrk>:
SYSCALL(sbrk)
 497:	b8 0c 00 00 00       	mov    $0xc,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret

0000049f <sleep>:
SYSCALL(sleep)
 49f:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret

000004a7 <uptime>:
SYSCALL(uptime)
 4a7:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret

000004af <getprocs>:
SYSCALL(getprocs)
 4af:	b8 16 00 00 00       	mov    $0x16,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret

000004b7 <clone>:
SYSCALL(clone)
 4b7:	b8 17 00 00 00       	mov    $0x17,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret

000004bf <join>:
SYSCALL(join)
 4bf:	b8 18 00 00 00       	mov    $0x18,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret
 4c7:	66 90                	xchg   %ax,%ax
 4c9:	66 90                	xchg   %ax,%ax
 4cb:	66 90                	xchg   %ax,%ax
 4cd:	66 90                	xchg   %ax,%ax
 4cf:	90                   	nop

000004d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4d8:	89 d1                	mov    %edx,%ecx
{
 4da:	83 ec 3c             	sub    $0x3c,%esp
 4dd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 4e0:	85 d2                	test   %edx,%edx
 4e2:	0f 89 80 00 00 00    	jns    568 <printint+0x98>
 4e8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4ec:	74 7a                	je     568 <printint+0x98>
    x = -xx;
 4ee:	f7 d9                	neg    %ecx
    neg = 1;
 4f0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 4f5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 4f8:	31 f6                	xor    %esi,%esi
 4fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 500:	89 c8                	mov    %ecx,%eax
 502:	31 d2                	xor    %edx,%edx
 504:	89 f7                	mov    %esi,%edi
 506:	f7 f3                	div    %ebx
 508:	8d 76 01             	lea    0x1(%esi),%esi
 50b:	0f b6 92 fc 09 00 00 	movzbl 0x9fc(%edx),%edx
 512:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 516:	89 ca                	mov    %ecx,%edx
 518:	89 c1                	mov    %eax,%ecx
 51a:	39 da                	cmp    %ebx,%edx
 51c:	73 e2                	jae    500 <printint+0x30>
  if(neg)
 51e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 521:	85 c0                	test   %eax,%eax
 523:	74 07                	je     52c <printint+0x5c>
    buf[i++] = '-';
 525:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 52a:	89 f7                	mov    %esi,%edi
 52c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 52f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 532:	01 df                	add    %ebx,%edi
 534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 538:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 53b:	83 ec 04             	sub    $0x4,%esp
 53e:	88 45 d7             	mov    %al,-0x29(%ebp)
 541:	8d 45 d7             	lea    -0x29(%ebp),%eax
 544:	6a 01                	push   $0x1
 546:	50                   	push   %eax
 547:	56                   	push   %esi
 548:	e8 e2 fe ff ff       	call   42f <write>
  while(--i >= 0)
 54d:	89 f8                	mov    %edi,%eax
 54f:	83 c4 10             	add    $0x10,%esp
 552:	83 ef 01             	sub    $0x1,%edi
 555:	39 c3                	cmp    %eax,%ebx
 557:	75 df                	jne    538 <printint+0x68>
}
 559:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55c:	5b                   	pop    %ebx
 55d:	5e                   	pop    %esi
 55e:	5f                   	pop    %edi
 55f:	5d                   	pop    %ebp
 560:	c3                   	ret
 561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 568:	31 c0                	xor    %eax,%eax
 56a:	eb 89                	jmp    4f5 <printint+0x25>
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000570 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 579:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 57c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 57f:	0f b6 1e             	movzbl (%esi),%ebx
 582:	83 c6 01             	add    $0x1,%esi
 585:	84 db                	test   %bl,%bl
 587:	74 67                	je     5f0 <printf+0x80>
 589:	8d 4d 10             	lea    0x10(%ebp),%ecx
 58c:	31 d2                	xor    %edx,%edx
 58e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 591:	eb 34                	jmp    5c7 <printf+0x57>
 593:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 598:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 59b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5a0:	83 f8 25             	cmp    $0x25,%eax
 5a3:	74 18                	je     5bd <printf+0x4d>
  write(fd, &c, 1);
 5a5:	83 ec 04             	sub    $0x4,%esp
 5a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5ab:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5ae:	6a 01                	push   $0x1
 5b0:	50                   	push   %eax
 5b1:	57                   	push   %edi
 5b2:	e8 78 fe ff ff       	call   42f <write>
 5b7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5ba:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5bd:	0f b6 1e             	movzbl (%esi),%ebx
 5c0:	83 c6 01             	add    $0x1,%esi
 5c3:	84 db                	test   %bl,%bl
 5c5:	74 29                	je     5f0 <printf+0x80>
    c = fmt[i] & 0xff;
 5c7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5ca:	85 d2                	test   %edx,%edx
 5cc:	74 ca                	je     598 <printf+0x28>
      }
    } else if(state == '%'){
 5ce:	83 fa 25             	cmp    $0x25,%edx
 5d1:	75 ea                	jne    5bd <printf+0x4d>
      if(c == 'd'){
 5d3:	83 f8 25             	cmp    $0x25,%eax
 5d6:	0f 84 04 01 00 00    	je     6e0 <printf+0x170>
 5dc:	83 e8 63             	sub    $0x63,%eax
 5df:	83 f8 15             	cmp    $0x15,%eax
 5e2:	77 1c                	ja     600 <printf+0x90>
 5e4:	ff 24 85 a4 09 00 00 	jmp    *0x9a4(,%eax,4)
 5eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5f3:	5b                   	pop    %ebx
 5f4:	5e                   	pop    %esi
 5f5:	5f                   	pop    %edi
 5f6:	5d                   	pop    %ebp
 5f7:	c3                   	ret
 5f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5ff:	00 
  write(fd, &c, 1);
 600:	83 ec 04             	sub    $0x4,%esp
 603:	8d 55 e7             	lea    -0x19(%ebp),%edx
 606:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 60a:	6a 01                	push   $0x1
 60c:	52                   	push   %edx
 60d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 610:	57                   	push   %edi
 611:	e8 19 fe ff ff       	call   42f <write>
 616:	83 c4 0c             	add    $0xc,%esp
 619:	88 5d e7             	mov    %bl,-0x19(%ebp)
 61c:	6a 01                	push   $0x1
 61e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 621:	52                   	push   %edx
 622:	57                   	push   %edi
 623:	e8 07 fe ff ff       	call   42f <write>
        putc(fd, c);
 628:	83 c4 10             	add    $0x10,%esp
      state = 0;
 62b:	31 d2                	xor    %edx,%edx
 62d:	eb 8e                	jmp    5bd <printf+0x4d>
 62f:	90                   	nop
        printint(fd, *ap, 16, 0);
 630:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 633:	83 ec 0c             	sub    $0xc,%esp
 636:	b9 10 00 00 00       	mov    $0x10,%ecx
 63b:	8b 13                	mov    (%ebx),%edx
 63d:	6a 00                	push   $0x0
 63f:	89 f8                	mov    %edi,%eax
        ap++;
 641:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 644:	e8 87 fe ff ff       	call   4d0 <printint>
        ap++;
 649:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 64c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 64f:	31 d2                	xor    %edx,%edx
 651:	e9 67 ff ff ff       	jmp    5bd <printf+0x4d>
        s = (char*)*ap;
 656:	8b 45 d0             	mov    -0x30(%ebp),%eax
 659:	8b 18                	mov    (%eax),%ebx
        ap++;
 65b:	83 c0 04             	add    $0x4,%eax
 65e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 661:	85 db                	test   %ebx,%ebx
 663:	0f 84 87 00 00 00    	je     6f0 <printf+0x180>
        while(*s != 0){
 669:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 66c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 66e:	84 c0                	test   %al,%al
 670:	0f 84 47 ff ff ff    	je     5bd <printf+0x4d>
 676:	8d 55 e7             	lea    -0x19(%ebp),%edx
 679:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 67c:	89 de                	mov    %ebx,%esi
 67e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 680:	83 ec 04             	sub    $0x4,%esp
 683:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 686:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 689:	6a 01                	push   $0x1
 68b:	53                   	push   %ebx
 68c:	57                   	push   %edi
 68d:	e8 9d fd ff ff       	call   42f <write>
        while(*s != 0){
 692:	0f b6 06             	movzbl (%esi),%eax
 695:	83 c4 10             	add    $0x10,%esp
 698:	84 c0                	test   %al,%al
 69a:	75 e4                	jne    680 <printf+0x110>
      state = 0;
 69c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 69f:	31 d2                	xor    %edx,%edx
 6a1:	e9 17 ff ff ff       	jmp    5bd <printf+0x4d>
        printint(fd, *ap, 10, 1);
 6a6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6a9:	83 ec 0c             	sub    $0xc,%esp
 6ac:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6b1:	8b 13                	mov    (%ebx),%edx
 6b3:	6a 01                	push   $0x1
 6b5:	eb 88                	jmp    63f <printf+0xcf>
        putc(fd, *ap);
 6b7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6ba:	83 ec 04             	sub    $0x4,%esp
 6bd:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 6c0:	8b 03                	mov    (%ebx),%eax
        ap++;
 6c2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 6c5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6c8:	6a 01                	push   $0x1
 6ca:	52                   	push   %edx
 6cb:	57                   	push   %edi
 6cc:	e8 5e fd ff ff       	call   42f <write>
        ap++;
 6d1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6d4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6d7:	31 d2                	xor    %edx,%edx
 6d9:	e9 df fe ff ff       	jmp    5bd <printf+0x4d>
 6de:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 6e0:	83 ec 04             	sub    $0x4,%esp
 6e3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6e6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6e9:	6a 01                	push   $0x1
 6eb:	e9 31 ff ff ff       	jmp    621 <printf+0xb1>
 6f0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 6f5:	bb 9b 09 00 00       	mov    $0x99b,%ebx
 6fa:	e9 77 ff ff ff       	jmp    676 <printf+0x106>
 6ff:	90                   	nop

00000700 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 700:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	a1 c0 0f 00 00       	mov    0xfc0,%eax
{
 706:	89 e5                	mov    %esp,%ebp
 708:	57                   	push   %edi
 709:	56                   	push   %esi
 70a:	53                   	push   %ebx
 70b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 70e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 718:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 71a:	39 c8                	cmp    %ecx,%eax
 71c:	73 32                	jae    750 <free+0x50>
 71e:	39 d1                	cmp    %edx,%ecx
 720:	72 04                	jb     726 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 722:	39 d0                	cmp    %edx,%eax
 724:	72 32                	jb     758 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 726:	8b 73 fc             	mov    -0x4(%ebx),%esi
 729:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 72c:	39 fa                	cmp    %edi,%edx
 72e:	74 30                	je     760 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 730:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 733:	8b 50 04             	mov    0x4(%eax),%edx
 736:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 739:	39 f1                	cmp    %esi,%ecx
 73b:	74 3a                	je     777 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 73d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 73f:	5b                   	pop    %ebx
  freep = p;
 740:	a3 c0 0f 00 00       	mov    %eax,0xfc0
}
 745:	5e                   	pop    %esi
 746:	5f                   	pop    %edi
 747:	5d                   	pop    %ebp
 748:	c3                   	ret
 749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 750:	39 d0                	cmp    %edx,%eax
 752:	72 04                	jb     758 <free+0x58>
 754:	39 d1                	cmp    %edx,%ecx
 756:	72 ce                	jb     726 <free+0x26>
{
 758:	89 d0                	mov    %edx,%eax
 75a:	eb bc                	jmp    718 <free+0x18>
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 760:	03 72 04             	add    0x4(%edx),%esi
 763:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 766:	8b 10                	mov    (%eax),%edx
 768:	8b 12                	mov    (%edx),%edx
 76a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 76d:	8b 50 04             	mov    0x4(%eax),%edx
 770:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 773:	39 f1                	cmp    %esi,%ecx
 775:	75 c6                	jne    73d <free+0x3d>
    p->s.size += bp->s.size;
 777:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 77a:	a3 c0 0f 00 00       	mov    %eax,0xfc0
    p->s.size += bp->s.size;
 77f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 782:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 785:	89 08                	mov    %ecx,(%eax)
}
 787:	5b                   	pop    %ebx
 788:	5e                   	pop    %esi
 789:	5f                   	pop    %edi
 78a:	5d                   	pop    %ebp
 78b:	c3                   	ret
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000790 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 799:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 79c:	8b 15 c0 0f 00 00    	mov    0xfc0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a2:	8d 78 07             	lea    0x7(%eax),%edi
 7a5:	c1 ef 03             	shr    $0x3,%edi
 7a8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7ab:	85 d2                	test   %edx,%edx
 7ad:	0f 84 8d 00 00 00    	je     840 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7b5:	8b 48 04             	mov    0x4(%eax),%ecx
 7b8:	39 f9                	cmp    %edi,%ecx
 7ba:	73 64                	jae    820 <malloc+0x90>
  if(nu < 4096)
 7bc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7c1:	39 df                	cmp    %ebx,%edi
 7c3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7c6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7cd:	eb 0a                	jmp    7d9 <malloc+0x49>
 7cf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7d2:	8b 48 04             	mov    0x4(%eax),%ecx
 7d5:	39 f9                	cmp    %edi,%ecx
 7d7:	73 47                	jae    820 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7d9:	89 c2                	mov    %eax,%edx
 7db:	3b 05 c0 0f 00 00    	cmp    0xfc0,%eax
 7e1:	75 ed                	jne    7d0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7e3:	83 ec 0c             	sub    $0xc,%esp
 7e6:	56                   	push   %esi
 7e7:	e8 ab fc ff ff       	call   497 <sbrk>
  if(p == (char*)-1)
 7ec:	83 c4 10             	add    $0x10,%esp
 7ef:	83 f8 ff             	cmp    $0xffffffff,%eax
 7f2:	74 1c                	je     810 <malloc+0x80>
  hp->s.size = nu;
 7f4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7f7:	83 ec 0c             	sub    $0xc,%esp
 7fa:	83 c0 08             	add    $0x8,%eax
 7fd:	50                   	push   %eax
 7fe:	e8 fd fe ff ff       	call   700 <free>
  return freep;
 803:	8b 15 c0 0f 00 00    	mov    0xfc0,%edx
      if((p = morecore(nunits)) == 0)
 809:	83 c4 10             	add    $0x10,%esp
 80c:	85 d2                	test   %edx,%edx
 80e:	75 c0                	jne    7d0 <malloc+0x40>
        return 0;
  }
}
 810:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 813:	31 c0                	xor    %eax,%eax
}
 815:	5b                   	pop    %ebx
 816:	5e                   	pop    %esi
 817:	5f                   	pop    %edi
 818:	5d                   	pop    %ebp
 819:	c3                   	ret
 81a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 820:	39 cf                	cmp    %ecx,%edi
 822:	74 4c                	je     870 <malloc+0xe0>
        p->s.size -= nunits;
 824:	29 f9                	sub    %edi,%ecx
 826:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 829:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 82c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 82f:	89 15 c0 0f 00 00    	mov    %edx,0xfc0
}
 835:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 838:	83 c0 08             	add    $0x8,%eax
}
 83b:	5b                   	pop    %ebx
 83c:	5e                   	pop    %esi
 83d:	5f                   	pop    %edi
 83e:	5d                   	pop    %ebp
 83f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 840:	c7 05 c0 0f 00 00 c4 	movl   $0xfc4,0xfc0
 847:	0f 00 00 
    base.s.size = 0;
 84a:	b8 c4 0f 00 00       	mov    $0xfc4,%eax
    base.s.ptr = freep = prevp = &base;
 84f:	c7 05 c4 0f 00 00 c4 	movl   $0xfc4,0xfc4
 856:	0f 00 00 
    base.s.size = 0;
 859:	c7 05 c8 0f 00 00 00 	movl   $0x0,0xfc8
 860:	00 00 00 
    if(p->s.size >= nunits){
 863:	e9 54 ff ff ff       	jmp    7bc <malloc+0x2c>
 868:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 86f:	00 
        prevp->s.ptr = p->s.ptr;
 870:	8b 08                	mov    (%eax),%ecx
 872:	89 0a                	mov    %ecx,(%edx)
 874:	eb b9                	jmp    82f <malloc+0x9f>
 876:	66 90                	xchg   %ax,%ax
 878:	66 90                	xchg   %ax,%ax
 87a:	66 90                	xchg   %ax,%ax
 87c:	66 90                	xchg   %ax,%ax
 87e:	66 90                	xchg   %ax,%ax

00000880 <thread_create>:
#include "user.h"
#include "uthread.h"

#define PGSIZE 4096

int thread_create(void (*start_routine)(void*,void*), void *arg1, void *arg2) {
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	53                   	push   %ebx
 884:	83 ec 10             	sub    $0x10,%esp
  // allocate a user stack for the new thread
  void *stack = malloc(PGSIZE);
 887:	68 00 10 00 00       	push   $0x1000
 88c:	e8 ff fe ff ff       	call   790 <malloc>
  if(stack == 0) return -1;
 891:	83 c4 10             	add    $0x10,%esp
 894:	85 c0                	test   %eax,%eax
 896:	74 3d                	je     8d5 <thread_create+0x55>
 898:	89 c3                	mov    %eax,%ebx

  // align to page boundary (defensive)
  if((uint)stack % PGSIZE) stack = (void*)(((uint)stack + PGSIZE) & ~(PGSIZE-1));
 89a:	8d 80 00 10 00 00    	lea    0x1000(%eax),%eax
 8a0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 8a5:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 8ab:	0f 45 d8             	cmovne %eax,%ebx

  int pid = clone(start_routine, arg1, arg2, stack);
 8ae:	53                   	push   %ebx
 8af:	ff 75 10             	push   0x10(%ebp)
 8b2:	ff 75 0c             	push   0xc(%ebp)
 8b5:	ff 75 08             	push   0x8(%ebp)
 8b8:	e8 fa fb ff ff       	call   4b7 <clone>
  if(pid < 0) {
 8bd:	83 c4 10             	add    $0x10,%esp
 8c0:	85 c0                	test   %eax,%eax
 8c2:	78 05                	js     8c9 <thread_create+0x49>
    free(stack);
    return -1;
  }
  return pid;
}
 8c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8c7:	c9                   	leave
 8c8:	c3                   	ret
    free(stack);
 8c9:	83 ec 0c             	sub    $0xc,%esp
 8cc:	53                   	push   %ebx
 8cd:	e8 2e fe ff ff       	call   700 <free>
    return -1;
 8d2:	83 c4 10             	add    $0x10,%esp
  if(stack == 0) return -1;
 8d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8da:	eb e8                	jmp    8c4 <thread_create+0x44>
 8dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008e0 <thread_join>:

int thread_join(void) {
 8e0:	55                   	push   %ebp
 8e1:	89 e5                	mov    %esp,%ebp
 8e3:	53                   	push   %ebx
  void *stack;
  int pid = join(&stack);
 8e4:	8d 45 f4             	lea    -0xc(%ebp),%eax
int thread_join(void) {
 8e7:	83 ec 20             	sub    $0x20,%esp
  int pid = join(&stack);
 8ea:	50                   	push   %eax
 8eb:	e8 cf fb ff ff       	call   4bf <join>
  if(pid >= 0 && stack) free(stack);
 8f0:	83 c4 10             	add    $0x10,%esp
  int pid = join(&stack);
 8f3:	89 c3                	mov    %eax,%ebx
  if(pid >= 0 && stack) free(stack);
 8f5:	85 c0                	test   %eax,%eax
 8f7:	78 13                	js     90c <thread_join+0x2c>
 8f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fc:	85 c0                	test   %eax,%eax
 8fe:	74 0c                	je     90c <thread_join+0x2c>
 900:	83 ec 0c             	sub    $0xc,%esp
 903:	50                   	push   %eax
 904:	e8 f7 fd ff ff       	call   700 <free>
 909:	83 c4 10             	add    $0x10,%esp
  return pid;
}
 90c:	89 d8                	mov    %ebx,%eax
 90e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 911:	c9                   	leave
 912:	c3                   	ret
 913:	66 90                	xchg   %ax,%ax
 915:	66 90                	xchg   %ax,%ax
 917:	66 90                	xchg   %ax,%ax
 919:	66 90                	xchg   %ax,%ax
 91b:	66 90                	xchg   %ax,%ax
 91d:	66 90                	xchg   %ax,%ax
 91f:	90                   	nop

00000920 <lock_init>:
#include "types.h"
#include "ulock.h"

// Simple user-space spinlock using GCC builtins.
// Works with your 32-bit toolchain and static linking.
void lock_init(lock_t *l) {
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
  l->locked = 0;
 923:	8b 45 08             	mov    0x8(%ebp),%eax
 926:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 92c:	5d                   	pop    %ebp
 92d:	c3                   	ret
 92e:	66 90                	xchg   %ax,%ax

00000930 <lock_acquire>:

void lock_acquire(lock_t *l) {
 930:	55                   	push   %ebp
  // spin until we acquire (returns previous value)
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
 931:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *l) {
 936:	89 e5                	mov    %esp,%ebp
 938:	8b 45 08             	mov    0x8(%ebp),%eax
 93b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
 940:	89 ca                	mov    %ecx,%edx
 942:	87 10                	xchg   %edx,(%eax)
 944:	85 d2                	test   %edx,%edx
 946:	75 f8                	jne    940 <lock_acquire+0x10>
  // full barrier after acquiring
  __sync_synchronize();
 948:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 94d:	5d                   	pop    %ebp
 94e:	c3                   	ret
 94f:	90                   	nop

00000950 <lock_release>:

void lock_release(lock_t *l) {
 950:	55                   	push   %ebp
  // full barrier before releasing
  __sync_synchronize();
 951:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
void lock_release(lock_t *l) {
 956:	89 e5                	mov    %esp,%ebp
  __sync_lock_release(&l->locked);   // atomic store 0 with release semantics
 958:	8b 45 08             	mov    0x8(%ebp),%eax
 95b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 961:	5d                   	pop    %ebp
 962:	c3                   	ret
