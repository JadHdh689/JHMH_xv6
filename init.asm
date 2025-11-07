
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 54             	sub    $0x54,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  13:	6a 02                	push   $0x2
  15:	68 74 09 00 00       	push   $0x974
  1a:	e8 40 04 00 00       	call   45f <open>
  1f:	83 c4 10             	add    $0x10,%esp
  22:	85 c0                	test   %eax,%eax
  24:	0f 88 3e 01 00 00    	js     168 <main+0x168>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  2a:	83 ec 0c             	sub    $0xc,%esp
  2d:	8d 5d a8             	lea    -0x58(%ebp),%ebx
  30:	8d 75 c8             	lea    -0x38(%ebp),%esi
  33:	6a 00                	push   $0x0
  35:	e8 5d 04 00 00       	call   497 <dup>
  dup(0);  // stderr
  3a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  41:	e8 51 04 00 00       	call   497 <dup>
  46:	83 c4 10             	add    $0x10,%esp
  49:	eb 17                	jmp    62 <main+0x62>
  4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

    if(strcmp(username, "user") == 0 && strcmp(password, "1234") == 0){
      printf(1, "Login successful!\n");
      break; // exit login loop
    } else {
      printf(1, "Login failed. Try again.\n");
  50:	83 ec 08             	sub    $0x8,%esp
  53:	68 af 09 00 00       	push   $0x9af
  58:	6a 01                	push   $0x1
  5a:	e8 21 05 00 00       	call   580 <printf>
    printf(1, "Username: ");
  5f:	83 c4 10             	add    $0x10,%esp
  62:	83 ec 08             	sub    $0x8,%esp
  65:	68 7c 09 00 00       	push   $0x97c
  6a:	6a 01                	push   $0x1
  6c:	e8 0f 05 00 00       	call   580 <printf>
    gets(username, sizeof(username));
  71:	58                   	pop    %eax
  72:	5a                   	pop    %edx
  73:	6a 20                	push   $0x20
  75:	53                   	push   %ebx
  76:	e8 35 02 00 00       	call   2b0 <gets>
    username[strlen(username)-1] = 0; // strip newline
  7b:	89 1c 24             	mov    %ebx,(%esp)
  7e:	e8 9d 01 00 00       	call   220 <strlen>
    printf(1, "Password: ");
  83:	59                   	pop    %ecx
    username[strlen(username)-1] = 0; // strip newline
  84:	c6 44 05 a7 00       	movb   $0x0,-0x59(%ebp,%eax,1)
    printf(1, "Password: ");
  89:	58                   	pop    %eax
  8a:	68 87 09 00 00       	push   $0x987
  8f:	6a 01                	push   $0x1
  91:	e8 ea 04 00 00       	call   580 <printf>
    gets(password, sizeof(password));
  96:	58                   	pop    %eax
  97:	5a                   	pop    %edx
  98:	6a 20                	push   $0x20
  9a:	56                   	push   %esi
  9b:	e8 10 02 00 00       	call   2b0 <gets>
    password[strlen(password)-1] = 0;
  a0:	89 34 24             	mov    %esi,(%esp)
  a3:	e8 78 01 00 00       	call   220 <strlen>
    if(strcmp(username, "user") == 0 && strcmp(password, "1234") == 0){
  a8:	59                   	pop    %ecx
    password[strlen(password)-1] = 0;
  a9:	c6 44 05 c7 00       	movb   $0x0,-0x39(%ebp,%eax,1)
    if(strcmp(username, "user") == 0 && strcmp(password, "1234") == 0){
  ae:	58                   	pop    %eax
  af:	68 92 09 00 00       	push   $0x992
  b4:	53                   	push   %ebx
  b5:	e8 06 01 00 00       	call   1c0 <strcmp>
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	85 c0                	test   %eax,%eax
  bf:	75 8f                	jne    50 <main+0x50>
  c1:	83 ec 08             	sub    $0x8,%esp
  c4:	68 97 09 00 00       	push   $0x997
  c9:	56                   	push   %esi
  ca:	e8 f1 00 00 00       	call   1c0 <strcmp>
  cf:	83 c4 10             	add    $0x10,%esp
  d2:	85 c0                	test   %eax,%eax
  d4:	0f 85 76 ff ff ff    	jne    50 <main+0x50>
      printf(1, "Login successful!\n");
  da:	83 ec 08             	sub    $0x8,%esp
  dd:	68 9c 09 00 00       	push   $0x99c
  e2:	6a 01                	push   $0x1
  e4:	e8 97 04 00 00       	call   580 <printf>
      break; // exit login loop
  e9:	83 c4 10             	add    $0x10,%esp
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  for(;;){
    printf(1, "init: starting sh\n");
  f0:	83 ec 08             	sub    $0x8,%esp
  f3:	68 c9 09 00 00       	push   $0x9c9
  f8:	6a 01                	push   $0x1
  fa:	e8 81 04 00 00       	call   580 <printf>
    pid = fork();
  ff:	e8 13 03 00 00       	call   417 <fork>
    if(pid < 0){
 104:	83 c4 10             	add    $0x10,%esp
    pid = fork();
 107:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
 109:	85 c0                	test   %eax,%eax
 10b:	78 24                	js     131 <main+0x131>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
 10d:	74 35                	je     144 <main+0x144>
 10f:	90                   	nop
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
 110:	e8 12 03 00 00       	call   427 <wait>
 115:	39 c3                	cmp    %eax,%ebx
 117:	74 d7                	je     f0 <main+0xf0>
 119:	85 c0                	test   %eax,%eax
 11b:	78 d3                	js     f0 <main+0xf0>
      printf(1, "zombie!\n");
 11d:	83 ec 08             	sub    $0x8,%esp
 120:	68 08 0a 00 00       	push   $0xa08
 125:	6a 01                	push   $0x1
 127:	e8 54 04 00 00       	call   580 <printf>
 12c:	83 c4 10             	add    $0x10,%esp
 12f:	eb df                	jmp    110 <main+0x110>
      printf(1, "init: fork failed\n");
 131:	53                   	push   %ebx
 132:	53                   	push   %ebx
 133:	68 dc 09 00 00       	push   $0x9dc
 138:	6a 01                	push   $0x1
 13a:	e8 41 04 00 00       	call   580 <printf>
      exit();
 13f:	e8 db 02 00 00       	call   41f <exit>
      exec("sh", argv);
 144:	50                   	push   %eax
 145:	50                   	push   %eax
 146:	68 ec 0d 00 00       	push   $0xdec
 14b:	68 ef 09 00 00       	push   $0x9ef
 150:	e8 02 03 00 00       	call   457 <exec>
      printf(1, "init: exec sh failed\n");
 155:	5a                   	pop    %edx
 156:	59                   	pop    %ecx
 157:	68 f2 09 00 00       	push   $0x9f2
 15c:	6a 01                	push   $0x1
 15e:	e8 1d 04 00 00       	call   580 <printf>
      exit();
 163:	e8 b7 02 00 00       	call   41f <exit>
    mknod("console", 1, 1);
 168:	50                   	push   %eax
 169:	6a 01                	push   $0x1
 16b:	6a 01                	push   $0x1
 16d:	68 74 09 00 00       	push   $0x974
 172:	e8 f0 02 00 00       	call   467 <mknod>
    open("console", O_RDWR);
 177:	58                   	pop    %eax
 178:	5a                   	pop    %edx
 179:	6a 02                	push   $0x2
 17b:	68 74 09 00 00       	push   $0x974
 180:	e8 da 02 00 00       	call   45f <open>
 185:	83 c4 10             	add    $0x10,%esp
 188:	e9 9d fe ff ff       	jmp    2a <main+0x2a>
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 190:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 191:	31 c0                	xor    %eax,%eax
{
 193:	89 e5                	mov    %esp,%ebp
 195:	53                   	push   %ebx
 196:	8b 4d 08             	mov    0x8(%ebp),%ecx
 199:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1a7:	83 c0 01             	add    $0x1,%eax
 1aa:	84 d2                	test   %dl,%dl
 1ac:	75 f2                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1b1:	89 c8                	mov    %ecx,%eax
 1b3:	c9                   	leave
 1b4:	c3                   	ret
 1b5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1bc:	00 
 1bd:	8d 76 00             	lea    0x0(%esi),%esi

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	53                   	push   %ebx
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
 1c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ca:	0f b6 02             	movzbl (%edx),%eax
 1cd:	84 c0                	test   %al,%al
 1cf:	75 17                	jne    1e8 <strcmp+0x28>
 1d1:	eb 3a                	jmp    20d <strcmp+0x4d>
 1d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1d8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1dc:	83 c2 01             	add    $0x1,%edx
 1df:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1e2:	84 c0                	test   %al,%al
 1e4:	74 1a                	je     200 <strcmp+0x40>
 1e6:	89 d9                	mov    %ebx,%ecx
 1e8:	0f b6 19             	movzbl (%ecx),%ebx
 1eb:	38 c3                	cmp    %al,%bl
 1ed:	74 e9                	je     1d8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1ef:	29 d8                	sub    %ebx,%eax
}
 1f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f4:	c9                   	leave
 1f5:	c3                   	ret
 1f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1fd:	00 
 1fe:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 200:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 204:	31 c0                	xor    %eax,%eax
 206:	29 d8                	sub    %ebx,%eax
}
 208:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 20b:	c9                   	leave
 20c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 20d:	0f b6 19             	movzbl (%ecx),%ebx
 210:	31 c0                	xor    %eax,%eax
 212:	eb db                	jmp    1ef <strcmp+0x2f>
 214:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 21b:	00 
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000220 <strlen>:

uint
strlen(const char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 226:	80 3a 00             	cmpb   $0x0,(%edx)
 229:	74 15                	je     240 <strlen+0x20>
 22b:	31 c0                	xor    %eax,%eax
 22d:	8d 76 00             	lea    0x0(%esi),%esi
 230:	83 c0 01             	add    $0x1,%eax
 233:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 237:	89 c1                	mov    %eax,%ecx
 239:	75 f5                	jne    230 <strlen+0x10>
    ;
  return n;
}
 23b:	89 c8                	mov    %ecx,%eax
 23d:	5d                   	pop    %ebp
 23e:	c3                   	ret
 23f:	90                   	nop
  for(n = 0; s[n]; n++)
 240:	31 c9                	xor    %ecx,%ecx
}
 242:	5d                   	pop    %ebp
 243:	89 c8                	mov    %ecx,%eax
 245:	c3                   	ret
 246:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 24d:	00 
 24e:	66 90                	xchg   %ax,%ax

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 257:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	89 d7                	mov    %edx,%edi
 25f:	fc                   	cld
 260:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 262:	8b 7d fc             	mov    -0x4(%ebp),%edi
 265:	89 d0                	mov    %edx,%eax
 267:	c9                   	leave
 268:	c3                   	ret
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27a:	0f b6 10             	movzbl (%eax),%edx
 27d:	84 d2                	test   %dl,%dl
 27f:	75 12                	jne    293 <strchr+0x23>
 281:	eb 1d                	jmp    2a0 <strchr+0x30>
 283:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 288:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 28c:	83 c0 01             	add    $0x1,%eax
 28f:	84 d2                	test   %dl,%dl
 291:	74 0d                	je     2a0 <strchr+0x30>
    if(*s == c)
 293:	38 d1                	cmp    %dl,%cl
 295:	75 f1                	jne    288 <strchr+0x18>
      return (char*)s;
  return 0;
}
 297:	5d                   	pop    %ebp
 298:	c3                   	ret
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2a0:	31 c0                	xor    %eax,%eax
}
 2a2:	5d                   	pop    %ebp
 2a3:	c3                   	ret
 2a4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ab:	00 
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <gets>:

char*
gets(char *buf, int max)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2b5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 2b8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2b9:	31 db                	xor    %ebx,%ebx
{
 2bb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2be:	eb 27                	jmp    2e7 <gets+0x37>
    cc = read(0, &c, 1);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	6a 01                	push   $0x1
 2c5:	56                   	push   %esi
 2c6:	6a 00                	push   $0x0
 2c8:	e8 6a 01 00 00       	call   437 <read>
    if(cc < 1)
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7e 1d                	jle    2f1 <gets+0x41>
      break;
    buf[i++] = c;
 2d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2d8:	8b 55 08             	mov    0x8(%ebp),%edx
 2db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2df:	3c 0a                	cmp    $0xa,%al
 2e1:	74 10                	je     2f3 <gets+0x43>
 2e3:	3c 0d                	cmp    $0xd,%al
 2e5:	74 0c                	je     2f3 <gets+0x43>
  for(i=0; i+1 < max; ){
 2e7:	89 df                	mov    %ebx,%edi
 2e9:	83 c3 01             	add    $0x1,%ebx
 2ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ef:	7c cf                	jl     2c0 <gets+0x10>
 2f1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 2fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fd:	5b                   	pop    %ebx
 2fe:	5e                   	pop    %esi
 2ff:	5f                   	pop    %edi
 300:	5d                   	pop    %ebp
 301:	c3                   	ret
 302:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 309:	00 
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 315:	83 ec 08             	sub    $0x8,%esp
 318:	6a 00                	push   $0x0
 31a:	ff 75 08             	push   0x8(%ebp)
 31d:	e8 3d 01 00 00       	call   45f <open>
  if(fd < 0)
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	78 27                	js     350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 329:	83 ec 08             	sub    $0x8,%esp
 32c:	ff 75 0c             	push   0xc(%ebp)
 32f:	89 c3                	mov    %eax,%ebx
 331:	50                   	push   %eax
 332:	e8 40 01 00 00       	call   477 <fstat>
  close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	e8 06 01 00 00       	call   447 <close>
  return r;
 341:	83 c4 10             	add    $0x10,%esp
}
 344:	8d 65 f8             	lea    -0x8(%ebp),%esp
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb ed                	jmp    344 <stat+0x34>
 357:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35e:	00 
 35f:	90                   	nop

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 367:	0f be 02             	movsbl (%edx),%eax
 36a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 36d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 370:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 375:	77 1e                	ja     395 <atoi+0x35>
 377:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 37e:	00 
 37f:	90                   	nop
    n = n*10 + *s++ - '0';
 380:	83 c2 01             	add    $0x1,%edx
 383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 38a:	0f be 02             	movsbl (%edx),%eax
 38d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 398:	89 c8                	mov    %ecx,%eax
 39a:	c9                   	leave
 39b:	c3                   	ret
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	8b 45 10             	mov    0x10(%ebp),%eax
 3a7:	8b 55 08             	mov    0x8(%ebp),%edx
 3aa:	56                   	push   %esi
 3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ae:	85 c0                	test   %eax,%eax
 3b0:	7e 13                	jle    3c5 <memmove+0x25>
 3b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3b4:	89 d7                	mov    %edx,%edi
 3b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3bd:	00 
 3be:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 3c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3c1:	39 f8                	cmp    %edi,%eax
 3c3:	75 fb                	jne    3c0 <memmove+0x20>
  return vdst;
}
 3c5:	5e                   	pop    %esi
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret
 3cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000003d0 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	8b 55 10             	mov    0x10(%ebp),%edx
 3d7:	8b 45 08             	mov    0x8(%ebp),%eax
 3da:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(n > 0 && *p && *p == *q)
 3dd:	85 d2                	test   %edx,%edx
 3df:	75 16                	jne    3f7 <strncmp+0x27>
 3e1:	eb 2d                	jmp    410 <strncmp+0x40>
 3e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 3e8:	3a 19                	cmp    (%ecx),%bl
 3ea:	75 12                	jne    3fe <strncmp+0x2e>
    n--, p++, q++;
 3ec:	83 c0 01             	add    $0x1,%eax
 3ef:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
 3f2:	83 ea 01             	sub    $0x1,%edx
 3f5:	74 19                	je     410 <strncmp+0x40>
 3f7:	0f b6 18             	movzbl (%eax),%ebx
 3fa:	84 db                	test   %bl,%bl
 3fc:	75 ea                	jne    3e8 <strncmp+0x18>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
 3fe:	0f b6 00             	movzbl (%eax),%eax
 401:	0f b6 11             	movzbl (%ecx),%edx
}
 404:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 407:	c9                   	leave
  return (uchar)*p - (uchar)*q;
 408:	29 d0                	sub    %edx,%eax
}
 40a:	c3                   	ret
 40b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 410:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 413:	31 c0                	xor    %eax,%eax
}
 415:	c9                   	leave
 416:	c3                   	ret

00000417 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 417:	b8 01 00 00 00       	mov    $0x1,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret

0000041f <exit>:
SYSCALL(exit)
 41f:	b8 02 00 00 00       	mov    $0x2,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret

00000427 <wait>:
SYSCALL(wait)
 427:	b8 03 00 00 00       	mov    $0x3,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret

0000042f <pipe>:
SYSCALL(pipe)
 42f:	b8 04 00 00 00       	mov    $0x4,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret

00000437 <read>:
SYSCALL(read)
 437:	b8 05 00 00 00       	mov    $0x5,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret

0000043f <write>:
SYSCALL(write)
 43f:	b8 10 00 00 00       	mov    $0x10,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret

00000447 <close>:
SYSCALL(close)
 447:	b8 15 00 00 00       	mov    $0x15,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret

0000044f <kill>:
SYSCALL(kill)
 44f:	b8 06 00 00 00       	mov    $0x6,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret

00000457 <exec>:
SYSCALL(exec)
 457:	b8 07 00 00 00       	mov    $0x7,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret

0000045f <open>:
SYSCALL(open)
 45f:	b8 0f 00 00 00       	mov    $0xf,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret

00000467 <mknod>:
SYSCALL(mknod)
 467:	b8 11 00 00 00       	mov    $0x11,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret

0000046f <unlink>:
SYSCALL(unlink)
 46f:	b8 12 00 00 00       	mov    $0x12,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret

00000477 <fstat>:
SYSCALL(fstat)
 477:	b8 08 00 00 00       	mov    $0x8,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret

0000047f <link>:
SYSCALL(link)
 47f:	b8 13 00 00 00       	mov    $0x13,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret

00000487 <mkdir>:
SYSCALL(mkdir)
 487:	b8 14 00 00 00       	mov    $0x14,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret

0000048f <chdir>:
SYSCALL(chdir)
 48f:	b8 09 00 00 00       	mov    $0x9,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret

00000497 <dup>:
SYSCALL(dup)
 497:	b8 0a 00 00 00       	mov    $0xa,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret

0000049f <getpid>:
SYSCALL(getpid)
 49f:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret

000004a7 <sbrk>:
SYSCALL(sbrk)
 4a7:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret

000004af <sleep>:
SYSCALL(sleep)
 4af:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret

000004b7 <uptime>:
SYSCALL(uptime)
 4b7:	b8 0e 00 00 00       	mov    $0xe,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret

000004bf <getprocs>:
SYSCALL(getprocs)
 4bf:	b8 16 00 00 00       	mov    $0x16,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret

000004c7 <clone>:
SYSCALL(clone)
 4c7:	b8 17 00 00 00       	mov    $0x17,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret

000004cf <join>:
SYSCALL(join)
 4cf:	b8 18 00 00 00       	mov    $0x18,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret
 4d7:	66 90                	xchg   %ax,%ax
 4d9:	66 90                	xchg   %ax,%ax
 4db:	66 90                	xchg   %ax,%ax
 4dd:	66 90                	xchg   %ax,%ax
 4df:	90                   	nop

000004e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4e8:	89 d1                	mov    %edx,%ecx
{
 4ea:	83 ec 3c             	sub    $0x3c,%esp
 4ed:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 4f0:	85 d2                	test   %edx,%edx
 4f2:	0f 89 80 00 00 00    	jns    578 <printint+0x98>
 4f8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4fc:	74 7a                	je     578 <printint+0x98>
    x = -xx;
 4fe:	f7 d9                	neg    %ecx
    neg = 1;
 500:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 505:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 508:	31 f6                	xor    %esi,%esi
 50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 510:	89 c8                	mov    %ecx,%eax
 512:	31 d2                	xor    %edx,%edx
 514:	89 f7                	mov    %esi,%edi
 516:	f7 f3                	div    %ebx
 518:	8d 76 01             	lea    0x1(%esi),%esi
 51b:	0f b6 92 70 0a 00 00 	movzbl 0xa70(%edx),%edx
 522:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 526:	89 ca                	mov    %ecx,%edx
 528:	89 c1                	mov    %eax,%ecx
 52a:	39 da                	cmp    %ebx,%edx
 52c:	73 e2                	jae    510 <printint+0x30>
  if(neg)
 52e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 531:	85 c0                	test   %eax,%eax
 533:	74 07                	je     53c <printint+0x5c>
    buf[i++] = '-';
 535:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 53a:	89 f7                	mov    %esi,%edi
 53c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 53f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 542:	01 df                	add    %ebx,%edi
 544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 548:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 54b:	83 ec 04             	sub    $0x4,%esp
 54e:	88 45 d7             	mov    %al,-0x29(%ebp)
 551:	8d 45 d7             	lea    -0x29(%ebp),%eax
 554:	6a 01                	push   $0x1
 556:	50                   	push   %eax
 557:	56                   	push   %esi
 558:	e8 e2 fe ff ff       	call   43f <write>
  while(--i >= 0)
 55d:	89 f8                	mov    %edi,%eax
 55f:	83 c4 10             	add    $0x10,%esp
 562:	83 ef 01             	sub    $0x1,%edi
 565:	39 c3                	cmp    %eax,%ebx
 567:	75 df                	jne    548 <printint+0x68>
}
 569:	8d 65 f4             	lea    -0xc(%ebp),%esp
 56c:	5b                   	pop    %ebx
 56d:	5e                   	pop    %esi
 56e:	5f                   	pop    %edi
 56f:	5d                   	pop    %ebp
 570:	c3                   	ret
 571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 578:	31 c0                	xor    %eax,%eax
 57a:	eb 89                	jmp    505 <printint+0x25>
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000580 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	56                   	push   %esi
 585:	53                   	push   %ebx
 586:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 589:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 58c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 58f:	0f b6 1e             	movzbl (%esi),%ebx
 592:	83 c6 01             	add    $0x1,%esi
 595:	84 db                	test   %bl,%bl
 597:	74 67                	je     600 <printf+0x80>
 599:	8d 4d 10             	lea    0x10(%ebp),%ecx
 59c:	31 d2                	xor    %edx,%edx
 59e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 5a1:	eb 34                	jmp    5d7 <printf+0x57>
 5a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 5a8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5ab:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5b0:	83 f8 25             	cmp    $0x25,%eax
 5b3:	74 18                	je     5cd <printf+0x4d>
  write(fd, &c, 1);
 5b5:	83 ec 04             	sub    $0x4,%esp
 5b8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5bb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5be:	6a 01                	push   $0x1
 5c0:	50                   	push   %eax
 5c1:	57                   	push   %edi
 5c2:	e8 78 fe ff ff       	call   43f <write>
 5c7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5ca:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5cd:	0f b6 1e             	movzbl (%esi),%ebx
 5d0:	83 c6 01             	add    $0x1,%esi
 5d3:	84 db                	test   %bl,%bl
 5d5:	74 29                	je     600 <printf+0x80>
    c = fmt[i] & 0xff;
 5d7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5da:	85 d2                	test   %edx,%edx
 5dc:	74 ca                	je     5a8 <printf+0x28>
      }
    } else if(state == '%'){
 5de:	83 fa 25             	cmp    $0x25,%edx
 5e1:	75 ea                	jne    5cd <printf+0x4d>
      if(c == 'd'){
 5e3:	83 f8 25             	cmp    $0x25,%eax
 5e6:	0f 84 04 01 00 00    	je     6f0 <printf+0x170>
 5ec:	83 e8 63             	sub    $0x63,%eax
 5ef:	83 f8 15             	cmp    $0x15,%eax
 5f2:	77 1c                	ja     610 <printf+0x90>
 5f4:	ff 24 85 18 0a 00 00 	jmp    *0xa18(,%eax,4)
 5fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 600:	8d 65 f4             	lea    -0xc(%ebp),%esp
 603:	5b                   	pop    %ebx
 604:	5e                   	pop    %esi
 605:	5f                   	pop    %edi
 606:	5d                   	pop    %ebp
 607:	c3                   	ret
 608:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 60f:	00 
  write(fd, &c, 1);
 610:	83 ec 04             	sub    $0x4,%esp
 613:	8d 55 e7             	lea    -0x19(%ebp),%edx
 616:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 61a:	6a 01                	push   $0x1
 61c:	52                   	push   %edx
 61d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 620:	57                   	push   %edi
 621:	e8 19 fe ff ff       	call   43f <write>
 626:	83 c4 0c             	add    $0xc,%esp
 629:	88 5d e7             	mov    %bl,-0x19(%ebp)
 62c:	6a 01                	push   $0x1
 62e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 631:	52                   	push   %edx
 632:	57                   	push   %edi
 633:	e8 07 fe ff ff       	call   43f <write>
        putc(fd, c);
 638:	83 c4 10             	add    $0x10,%esp
      state = 0;
 63b:	31 d2                	xor    %edx,%edx
 63d:	eb 8e                	jmp    5cd <printf+0x4d>
 63f:	90                   	nop
        printint(fd, *ap, 16, 0);
 640:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 643:	83 ec 0c             	sub    $0xc,%esp
 646:	b9 10 00 00 00       	mov    $0x10,%ecx
 64b:	8b 13                	mov    (%ebx),%edx
 64d:	6a 00                	push   $0x0
 64f:	89 f8                	mov    %edi,%eax
        ap++;
 651:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 654:	e8 87 fe ff ff       	call   4e0 <printint>
        ap++;
 659:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 65c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 65f:	31 d2                	xor    %edx,%edx
 661:	e9 67 ff ff ff       	jmp    5cd <printf+0x4d>
        s = (char*)*ap;
 666:	8b 45 d0             	mov    -0x30(%ebp),%eax
 669:	8b 18                	mov    (%eax),%ebx
        ap++;
 66b:	83 c0 04             	add    $0x4,%eax
 66e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 671:	85 db                	test   %ebx,%ebx
 673:	0f 84 87 00 00 00    	je     700 <printf+0x180>
        while(*s != 0){
 679:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 67c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 67e:	84 c0                	test   %al,%al
 680:	0f 84 47 ff ff ff    	je     5cd <printf+0x4d>
 686:	8d 55 e7             	lea    -0x19(%ebp),%edx
 689:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 68c:	89 de                	mov    %ebx,%esi
 68e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 690:	83 ec 04             	sub    $0x4,%esp
 693:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 696:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 699:	6a 01                	push   $0x1
 69b:	53                   	push   %ebx
 69c:	57                   	push   %edi
 69d:	e8 9d fd ff ff       	call   43f <write>
        while(*s != 0){
 6a2:	0f b6 06             	movzbl (%esi),%eax
 6a5:	83 c4 10             	add    $0x10,%esp
 6a8:	84 c0                	test   %al,%al
 6aa:	75 e4                	jne    690 <printf+0x110>
      state = 0;
 6ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 6af:	31 d2                	xor    %edx,%edx
 6b1:	e9 17 ff ff ff       	jmp    5cd <printf+0x4d>
        printint(fd, *ap, 10, 1);
 6b6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6b9:	83 ec 0c             	sub    $0xc,%esp
 6bc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6c1:	8b 13                	mov    (%ebx),%edx
 6c3:	6a 01                	push   $0x1
 6c5:	eb 88                	jmp    64f <printf+0xcf>
        putc(fd, *ap);
 6c7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6ca:	83 ec 04             	sub    $0x4,%esp
 6cd:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 6d0:	8b 03                	mov    (%ebx),%eax
        ap++;
 6d2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 6d5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6d8:	6a 01                	push   $0x1
 6da:	52                   	push   %edx
 6db:	57                   	push   %edi
 6dc:	e8 5e fd ff ff       	call   43f <write>
        ap++;
 6e1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6e4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6e7:	31 d2                	xor    %edx,%edx
 6e9:	e9 df fe ff ff       	jmp    5cd <printf+0x4d>
 6ee:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 6f0:	83 ec 04             	sub    $0x4,%esp
 6f3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6f6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6f9:	6a 01                	push   $0x1
 6fb:	e9 31 ff ff ff       	jmp    631 <printf+0xb1>
 700:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 705:	bb 11 0a 00 00       	mov    $0xa11,%ebx
 70a:	e9 77 ff ff ff       	jmp    686 <printf+0x106>
 70f:	90                   	nop

00000710 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 710:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	a1 f4 0d 00 00       	mov    0xdf4,%eax
{
 716:	89 e5                	mov    %esp,%ebp
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	53                   	push   %ebx
 71b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 71e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 728:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 72a:	39 c8                	cmp    %ecx,%eax
 72c:	73 32                	jae    760 <free+0x50>
 72e:	39 d1                	cmp    %edx,%ecx
 730:	72 04                	jb     736 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 732:	39 d0                	cmp    %edx,%eax
 734:	72 32                	jb     768 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 736:	8b 73 fc             	mov    -0x4(%ebx),%esi
 739:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73c:	39 fa                	cmp    %edi,%edx
 73e:	74 30                	je     770 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 740:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 743:	8b 50 04             	mov    0x4(%eax),%edx
 746:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 749:	39 f1                	cmp    %esi,%ecx
 74b:	74 3a                	je     787 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 74d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 74f:	5b                   	pop    %ebx
  freep = p;
 750:	a3 f4 0d 00 00       	mov    %eax,0xdf4
}
 755:	5e                   	pop    %esi
 756:	5f                   	pop    %edi
 757:	5d                   	pop    %ebp
 758:	c3                   	ret
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 760:	39 d0                	cmp    %edx,%eax
 762:	72 04                	jb     768 <free+0x58>
 764:	39 d1                	cmp    %edx,%ecx
 766:	72 ce                	jb     736 <free+0x26>
{
 768:	89 d0                	mov    %edx,%eax
 76a:	eb bc                	jmp    728 <free+0x18>
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 770:	03 72 04             	add    0x4(%edx),%esi
 773:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 776:	8b 10                	mov    (%eax),%edx
 778:	8b 12                	mov    (%edx),%edx
 77a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 77d:	8b 50 04             	mov    0x4(%eax),%edx
 780:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 783:	39 f1                	cmp    %esi,%ecx
 785:	75 c6                	jne    74d <free+0x3d>
    p->s.size += bp->s.size;
 787:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 78a:	a3 f4 0d 00 00       	mov    %eax,0xdf4
    p->s.size += bp->s.size;
 78f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 792:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 795:	89 08                	mov    %ecx,(%eax)
}
 797:	5b                   	pop    %ebx
 798:	5e                   	pop    %esi
 799:	5f                   	pop    %edi
 79a:	5d                   	pop    %ebp
 79b:	c3                   	ret
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ac:	8b 15 f4 0d 00 00    	mov    0xdf4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b2:	8d 78 07             	lea    0x7(%eax),%edi
 7b5:	c1 ef 03             	shr    $0x3,%edi
 7b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7bb:	85 d2                	test   %edx,%edx
 7bd:	0f 84 8d 00 00 00    	je     850 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7c5:	8b 48 04             	mov    0x4(%eax),%ecx
 7c8:	39 f9                	cmp    %edi,%ecx
 7ca:	73 64                	jae    830 <malloc+0x90>
  if(nu < 4096)
 7cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7d1:	39 df                	cmp    %ebx,%edi
 7d3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7d6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7dd:	eb 0a                	jmp    7e9 <malloc+0x49>
 7df:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7e2:	8b 48 04             	mov    0x4(%eax),%ecx
 7e5:	39 f9                	cmp    %edi,%ecx
 7e7:	73 47                	jae    830 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7e9:	89 c2                	mov    %eax,%edx
 7eb:	3b 05 f4 0d 00 00    	cmp    0xdf4,%eax
 7f1:	75 ed                	jne    7e0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7f3:	83 ec 0c             	sub    $0xc,%esp
 7f6:	56                   	push   %esi
 7f7:	e8 ab fc ff ff       	call   4a7 <sbrk>
  if(p == (char*)-1)
 7fc:	83 c4 10             	add    $0x10,%esp
 7ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 802:	74 1c                	je     820 <malloc+0x80>
  hp->s.size = nu;
 804:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 807:	83 ec 0c             	sub    $0xc,%esp
 80a:	83 c0 08             	add    $0x8,%eax
 80d:	50                   	push   %eax
 80e:	e8 fd fe ff ff       	call   710 <free>
  return freep;
 813:	8b 15 f4 0d 00 00    	mov    0xdf4,%edx
      if((p = morecore(nunits)) == 0)
 819:	83 c4 10             	add    $0x10,%esp
 81c:	85 d2                	test   %edx,%edx
 81e:	75 c0                	jne    7e0 <malloc+0x40>
        return 0;
  }
}
 820:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 823:	31 c0                	xor    %eax,%eax
}
 825:	5b                   	pop    %ebx
 826:	5e                   	pop    %esi
 827:	5f                   	pop    %edi
 828:	5d                   	pop    %ebp
 829:	c3                   	ret
 82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 830:	39 cf                	cmp    %ecx,%edi
 832:	74 4c                	je     880 <malloc+0xe0>
        p->s.size -= nunits;
 834:	29 f9                	sub    %edi,%ecx
 836:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 839:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 83c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 83f:	89 15 f4 0d 00 00    	mov    %edx,0xdf4
}
 845:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 848:	83 c0 08             	add    $0x8,%eax
}
 84b:	5b                   	pop    %ebx
 84c:	5e                   	pop    %esi
 84d:	5f                   	pop    %edi
 84e:	5d                   	pop    %ebp
 84f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 850:	c7 05 f4 0d 00 00 f8 	movl   $0xdf8,0xdf4
 857:	0d 00 00 
    base.s.size = 0;
 85a:	b8 f8 0d 00 00       	mov    $0xdf8,%eax
    base.s.ptr = freep = prevp = &base;
 85f:	c7 05 f8 0d 00 00 f8 	movl   $0xdf8,0xdf8
 866:	0d 00 00 
    base.s.size = 0;
 869:	c7 05 fc 0d 00 00 00 	movl   $0x0,0xdfc
 870:	00 00 00 
    if(p->s.size >= nunits){
 873:	e9 54 ff ff ff       	jmp    7cc <malloc+0x2c>
 878:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 87f:	00 
        prevp->s.ptr = p->s.ptr;
 880:	8b 08                	mov    (%eax),%ecx
 882:	89 0a                	mov    %ecx,(%edx)
 884:	eb b9                	jmp    83f <malloc+0x9f>
 886:	66 90                	xchg   %ax,%ax
 888:	66 90                	xchg   %ax,%ax
 88a:	66 90                	xchg   %ax,%ax
 88c:	66 90                	xchg   %ax,%ax
 88e:	66 90                	xchg   %ax,%ax

00000890 <thread_create>:
#include "user.h"
#include "uthread.h"

#define PGSIZE 4096

int thread_create(void (*start_routine)(void*,void*), void *arg1, void *arg2) {
 890:	55                   	push   %ebp
 891:	89 e5                	mov    %esp,%ebp
 893:	53                   	push   %ebx
 894:	83 ec 10             	sub    $0x10,%esp
  // allocate a user stack for the new thread
  void *stack = malloc(PGSIZE);
 897:	68 00 10 00 00       	push   $0x1000
 89c:	e8 ff fe ff ff       	call   7a0 <malloc>
  if(stack == 0) return -1;
 8a1:	83 c4 10             	add    $0x10,%esp
 8a4:	85 c0                	test   %eax,%eax
 8a6:	74 3d                	je     8e5 <thread_create+0x55>
 8a8:	89 c3                	mov    %eax,%ebx

  // align to page boundary (defensive)
  if((uint)stack % PGSIZE) stack = (void*)(((uint)stack + PGSIZE) & ~(PGSIZE-1));
 8aa:	8d 80 00 10 00 00    	lea    0x1000(%eax),%eax
 8b0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 8b5:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 8bb:	0f 45 d8             	cmovne %eax,%ebx

  int pid = clone(start_routine, arg1, arg2, stack);
 8be:	53                   	push   %ebx
 8bf:	ff 75 10             	push   0x10(%ebp)
 8c2:	ff 75 0c             	push   0xc(%ebp)
 8c5:	ff 75 08             	push   0x8(%ebp)
 8c8:	e8 fa fb ff ff       	call   4c7 <clone>
  if(pid < 0) {
 8cd:	83 c4 10             	add    $0x10,%esp
 8d0:	85 c0                	test   %eax,%eax
 8d2:	78 05                	js     8d9 <thread_create+0x49>
    free(stack);
    return -1;
  }
  return pid;
}
 8d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8d7:	c9                   	leave
 8d8:	c3                   	ret
    free(stack);
 8d9:	83 ec 0c             	sub    $0xc,%esp
 8dc:	53                   	push   %ebx
 8dd:	e8 2e fe ff ff       	call   710 <free>
    return -1;
 8e2:	83 c4 10             	add    $0x10,%esp
  if(stack == 0) return -1;
 8e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8ea:	eb e8                	jmp    8d4 <thread_create+0x44>
 8ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008f0 <thread_join>:

int thread_join(void) {
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
 8f3:	53                   	push   %ebx
  void *stack;
  int pid = join(&stack);
 8f4:	8d 45 f4             	lea    -0xc(%ebp),%eax
int thread_join(void) {
 8f7:	83 ec 20             	sub    $0x20,%esp
  int pid = join(&stack);
 8fa:	50                   	push   %eax
 8fb:	e8 cf fb ff ff       	call   4cf <join>
  if(pid >= 0 && stack) free(stack);
 900:	83 c4 10             	add    $0x10,%esp
  int pid = join(&stack);
 903:	89 c3                	mov    %eax,%ebx
  if(pid >= 0 && stack) free(stack);
 905:	85 c0                	test   %eax,%eax
 907:	78 13                	js     91c <thread_join+0x2c>
 909:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90c:	85 c0                	test   %eax,%eax
 90e:	74 0c                	je     91c <thread_join+0x2c>
 910:	83 ec 0c             	sub    $0xc,%esp
 913:	50                   	push   %eax
 914:	e8 f7 fd ff ff       	call   710 <free>
 919:	83 c4 10             	add    $0x10,%esp
  return pid;
}
 91c:	89 d8                	mov    %ebx,%eax
 91e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 921:	c9                   	leave
 922:	c3                   	ret
 923:	66 90                	xchg   %ax,%ax
 925:	66 90                	xchg   %ax,%ax
 927:	66 90                	xchg   %ax,%ax
 929:	66 90                	xchg   %ax,%ax
 92b:	66 90                	xchg   %ax,%ax
 92d:	66 90                	xchg   %ax,%ax
 92f:	90                   	nop

00000930 <lock_init>:
#include "types.h"
#include "ulock.h"

// Simple user-space spinlock using GCC builtins.
// Works with your 32-bit toolchain and static linking.
void lock_init(lock_t *l) {
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
  l->locked = 0;
 933:	8b 45 08             	mov    0x8(%ebp),%eax
 936:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 93c:	5d                   	pop    %ebp
 93d:	c3                   	ret
 93e:	66 90                	xchg   %ax,%ax

00000940 <lock_acquire>:

void lock_acquire(lock_t *l) {
 940:	55                   	push   %ebp
  // spin until we acquire (returns previous value)
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
 941:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *l) {
 946:	89 e5                	mov    %esp,%ebp
 948:	8b 45 08             	mov    0x8(%ebp),%eax
 94b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
 950:	89 ca                	mov    %ecx,%edx
 952:	87 10                	xchg   %edx,(%eax)
 954:	85 d2                	test   %edx,%edx
 956:	75 f8                	jne    950 <lock_acquire+0x10>
  // full barrier after acquiring
  __sync_synchronize();
 958:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 95d:	5d                   	pop    %ebp
 95e:	c3                   	ret
 95f:	90                   	nop

00000960 <lock_release>:

void lock_release(lock_t *l) {
 960:	55                   	push   %ebp
  // full barrier before releasing
  __sync_synchronize();
 961:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
void lock_release(lock_t *l) {
 966:	89 e5                	mov    %esp,%ebp
  __sync_lock_release(&l->locked);   // atomic store 0 with release semantics
 968:	8b 45 08             	mov    0x8(%ebp),%eax
 96b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 971:	5d                   	pop    %ebp
 972:	c3                   	ret
