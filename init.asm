
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
  15:	68 68 08 00 00       	push   $0x868
  1a:	e8 04 04 00 00       	call   423 <open>
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
  35:	e8 21 04 00 00       	call   45b <dup>
  dup(0);  // stderr
  3a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  41:	e8 15 04 00 00       	call   45b <dup>
  46:	83 c4 10             	add    $0x10,%esp
  49:	eb 17                	jmp    62 <main+0x62>
  4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  4f:	90                   	nop

    if(strcmp(username, "user") == 0 && strcmp(password, "1234") == 0){
      printf(1, "Login successful!\n");
      break; // exit login loop
    } else {
      printf(1, "Login failed. Try again.\n");
  50:	83 ec 08             	sub    $0x8,%esp
  53:	68 a3 08 00 00       	push   $0x8a3
  58:	6a 01                	push   $0x1
  5a:	e8 e1 04 00 00       	call   540 <printf>
    printf(1, "Username: ");
  5f:	83 c4 10             	add    $0x10,%esp
  62:	83 ec 08             	sub    $0x8,%esp
  65:	68 70 08 00 00       	push   $0x870
  6a:	6a 01                	push   $0x1
  6c:	e8 cf 04 00 00       	call   540 <printf>
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
  8a:	68 7b 08 00 00       	push   $0x87b
  8f:	6a 01                	push   $0x1
  91:	e8 aa 04 00 00       	call   540 <printf>
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
  af:	68 86 08 00 00       	push   $0x886
  b4:	53                   	push   %ebx
  b5:	e8 06 01 00 00       	call   1c0 <strcmp>
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	85 c0                	test   %eax,%eax
  bf:	75 8f                	jne    50 <main+0x50>
  c1:	83 ec 08             	sub    $0x8,%esp
  c4:	68 8b 08 00 00       	push   $0x88b
  c9:	56                   	push   %esi
  ca:	e8 f1 00 00 00       	call   1c0 <strcmp>
  cf:	83 c4 10             	add    $0x10,%esp
  d2:	85 c0                	test   %eax,%eax
  d4:	0f 85 76 ff ff ff    	jne    50 <main+0x50>
      printf(1, "Login successful!\n");
  da:	83 ec 08             	sub    $0x8,%esp
  dd:	68 90 08 00 00       	push   $0x890
  e2:	6a 01                	push   $0x1
  e4:	e8 57 04 00 00       	call   540 <printf>
      break; // exit login loop
  e9:	83 c4 10             	add    $0x10,%esp
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  for(;;){
    printf(1, "init: starting sh\n");
  f0:	83 ec 08             	sub    $0x8,%esp
  f3:	68 bd 08 00 00       	push   $0x8bd
  f8:	6a 01                	push   $0x1
  fa:	e8 41 04 00 00       	call   540 <printf>
    pid = fork();
  ff:	e8 d7 02 00 00       	call   3db <fork>
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
 110:	e8 d6 02 00 00       	call   3eb <wait>
 115:	85 c0                	test   %eax,%eax
 117:	78 d7                	js     f0 <main+0xf0>
 119:	39 c3                	cmp    %eax,%ebx
 11b:	74 d3                	je     f0 <main+0xf0>
      printf(1, "zombie!\n");
 11d:	83 ec 08             	sub    $0x8,%esp
 120:	68 fc 08 00 00       	push   $0x8fc
 125:	6a 01                	push   $0x1
 127:	e8 14 04 00 00       	call   540 <printf>
 12c:	83 c4 10             	add    $0x10,%esp
 12f:	eb df                	jmp    110 <main+0x110>
      printf(1, "init: fork failed\n");
 131:	53                   	push   %ebx
 132:	53                   	push   %ebx
 133:	68 d0 08 00 00       	push   $0x8d0
 138:	6a 01                	push   $0x1
 13a:	e8 01 04 00 00       	call   540 <printf>
      exit();
 13f:	e8 9f 02 00 00       	call   3e3 <exit>
      exec("sh", argv);
 144:	50                   	push   %eax
 145:	50                   	push   %eax
 146:	68 14 0c 00 00       	push   $0xc14
 14b:	68 e3 08 00 00       	push   $0x8e3
 150:	e8 c6 02 00 00       	call   41b <exec>
      printf(1, "init: exec sh failed\n");
 155:	5a                   	pop    %edx
 156:	59                   	pop    %ecx
 157:	68 e6 08 00 00       	push   $0x8e6
 15c:	6a 01                	push   $0x1
 15e:	e8 dd 03 00 00       	call   540 <printf>
      exit();
 163:	e8 7b 02 00 00       	call   3e3 <exit>
    mknod("console", 1, 1);
 168:	50                   	push   %eax
 169:	6a 01                	push   $0x1
 16b:	6a 01                	push   $0x1
 16d:	68 68 08 00 00       	push   $0x868
 172:	e8 b4 02 00 00       	call   42b <mknod>
    open("console", O_RDWR);
 177:	58                   	pop    %eax
 178:	5a                   	pop    %edx
 179:	6a 02                	push   $0x2
 17b:	68 68 08 00 00       	push   $0x868
 180:	e8 9e 02 00 00       	call   423 <open>
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
 1b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

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
 1d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d7:	90                   	nop
 1d8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1dc:	83 c2 01             	add    $0x1,%edx
 1df:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1e2:	84 c0                	test   %al,%al
 1e4:	74 1a                	je     200 <strcmp+0x40>
    p++, q++;
 1e6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 1e8:	0f b6 19             	movzbl (%ecx),%ebx
 1eb:	38 c3                	cmp    %al,%bl
 1ed:	74 e9                	je     1d8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1ef:	29 d8                	sub    %ebx,%eax
}
 1f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
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
 214:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 21f:	90                   	nop

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
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi

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
 283:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 287:	90                   	nop
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
 2a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2af:	90                   	nop

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
 2b5:	8d 7d e7             	lea    -0x19(%ebp),%edi
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
 2c5:	57                   	push   %edi
 2c6:	6a 00                	push   $0x0
 2c8:	e8 2e 01 00 00       	call   3fb <read>
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
 2e1:	74 1d                	je     300 <gets+0x50>
 2e3:	3c 0d                	cmp    $0xd,%al
 2e5:	74 19                	je     300 <gets+0x50>
  for(i=0; i+1 < max; ){
 2e7:	89 de                	mov    %ebx,%esi
 2e9:	83 c3 01             	add    $0x1,%ebx
 2ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ef:	7c cf                	jl     2c0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 2f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fb:	5b                   	pop    %ebx
 2fc:	5e                   	pop    %esi
 2fd:	5f                   	pop    %edi
 2fe:	5d                   	pop    %ebp
 2ff:	c3                   	ret    
  buf[i] = '\0';
 300:	8b 45 08             	mov    0x8(%ebp),%eax
 303:	89 de                	mov    %ebx,%esi
 305:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 309:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30c:	5b                   	pop    %ebx
 30d:	5e                   	pop    %esi
 30e:	5f                   	pop    %edi
 30f:	5d                   	pop    %ebp
 310:	c3                   	ret    
 311:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 318:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop

00000320 <stat>:

int
stat(const char *n, struct stat *st)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 325:	83 ec 08             	sub    $0x8,%esp
 328:	6a 00                	push   $0x0
 32a:	ff 75 08             	push   0x8(%ebp)
 32d:	e8 f1 00 00 00       	call   423 <open>
  if(fd < 0)
 332:	83 c4 10             	add    $0x10,%esp
 335:	85 c0                	test   %eax,%eax
 337:	78 27                	js     360 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 339:	83 ec 08             	sub    $0x8,%esp
 33c:	ff 75 0c             	push   0xc(%ebp)
 33f:	89 c3                	mov    %eax,%ebx
 341:	50                   	push   %eax
 342:	e8 f4 00 00 00       	call   43b <fstat>
  close(fd);
 347:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 34a:	89 c6                	mov    %eax,%esi
  close(fd);
 34c:	e8 ba 00 00 00       	call   40b <close>
  return r;
 351:	83 c4 10             	add    $0x10,%esp
}
 354:	8d 65 f8             	lea    -0x8(%ebp),%esp
 357:	89 f0                	mov    %esi,%eax
 359:	5b                   	pop    %ebx
 35a:	5e                   	pop    %esi
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    
 35d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 360:	be ff ff ff ff       	mov    $0xffffffff,%esi
 365:	eb ed                	jmp    354 <stat+0x34>
 367:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36e:	66 90                	xchg   %ax,%ax

00000370 <atoi>:

int
atoi(const char *s)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 377:	0f be 02             	movsbl (%edx),%eax
 37a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 37d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 380:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 385:	77 1e                	ja     3a5 <atoi+0x35>
 387:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 390:	83 c2 01             	add    $0x1,%edx
 393:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 396:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 39a:	0f be 02             	movsbl (%edx),%eax
 39d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3a0:	80 fb 09             	cmp    $0x9,%bl
 3a3:	76 eb                	jbe    390 <atoi+0x20>
  return n;
}
 3a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a8:	89 c8                	mov    %ecx,%eax
 3aa:	c9                   	leave  
 3ab:	c3                   	ret    
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	8b 45 10             	mov    0x10(%ebp),%eax
 3b7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ba:	56                   	push   %esi
 3bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3be:	85 c0                	test   %eax,%eax
 3c0:	7e 13                	jle    3d5 <memmove+0x25>
 3c2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3c4:	89 d7                	mov    %edx,%edi
 3c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3d1:	39 f8                	cmp    %edi,%eax
 3d3:	75 fb                	jne    3d0 <memmove+0x20>
  return vdst;
}
 3d5:	5e                   	pop    %esi
 3d6:	89 d0                	mov    %edx,%eax
 3d8:	5f                   	pop    %edi
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    

000003db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3db:	b8 01 00 00 00       	mov    $0x1,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <exit>:
SYSCALL(exit)
 3e3:	b8 02 00 00 00       	mov    $0x2,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <wait>:
SYSCALL(wait)
 3eb:	b8 03 00 00 00       	mov    $0x3,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <pipe>:
SYSCALL(pipe)
 3f3:	b8 04 00 00 00       	mov    $0x4,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <read>:
SYSCALL(read)
 3fb:	b8 05 00 00 00       	mov    $0x5,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <write>:
SYSCALL(write)
 403:	b8 10 00 00 00       	mov    $0x10,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <close>:
SYSCALL(close)
 40b:	b8 15 00 00 00       	mov    $0x15,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <kill>:
SYSCALL(kill)
 413:	b8 06 00 00 00       	mov    $0x6,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <exec>:
SYSCALL(exec)
 41b:	b8 07 00 00 00       	mov    $0x7,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <open>:
SYSCALL(open)
 423:	b8 0f 00 00 00       	mov    $0xf,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <mknod>:
SYSCALL(mknod)
 42b:	b8 11 00 00 00       	mov    $0x11,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <unlink>:
SYSCALL(unlink)
 433:	b8 12 00 00 00       	mov    $0x12,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <fstat>:
SYSCALL(fstat)
 43b:	b8 08 00 00 00       	mov    $0x8,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <link>:
SYSCALL(link)
 443:	b8 13 00 00 00       	mov    $0x13,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <mkdir>:
SYSCALL(mkdir)
 44b:	b8 14 00 00 00       	mov    $0x14,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <chdir>:
SYSCALL(chdir)
 453:	b8 09 00 00 00       	mov    $0x9,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <dup>:
SYSCALL(dup)
 45b:	b8 0a 00 00 00       	mov    $0xa,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <getpid>:
SYSCALL(getpid)
 463:	b8 0b 00 00 00       	mov    $0xb,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <sbrk>:
SYSCALL(sbrk)
 46b:	b8 0c 00 00 00       	mov    $0xc,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <sleep>:
SYSCALL(sleep)
 473:	b8 0d 00 00 00       	mov    $0xd,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <uptime>:
SYSCALL(uptime)
 47b:	b8 0e 00 00 00       	mov    $0xe,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <getprocs>:
SYSCALL(getprocs)
 483:	b8 16 00 00 00       	mov    $0x16,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    
 48b:	66 90                	xchg   %ax,%ax
 48d:	66 90                	xchg   %ax,%ax
 48f:	90                   	nop

00000490 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
 495:	53                   	push   %ebx
 496:	83 ec 3c             	sub    $0x3c,%esp
 499:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 49c:	89 d1                	mov    %edx,%ecx
{
 49e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4a1:	85 d2                	test   %edx,%edx
 4a3:	0f 89 7f 00 00 00    	jns    528 <printint+0x98>
 4a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4ad:	74 79                	je     528 <printint+0x98>
    neg = 1;
 4af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4b8:	31 db                	xor    %ebx,%ebx
 4ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4c0:	89 c8                	mov    %ecx,%eax
 4c2:	31 d2                	xor    %edx,%edx
 4c4:	89 cf                	mov    %ecx,%edi
 4c6:	f7 75 c4             	divl   -0x3c(%ebp)
 4c9:	0f b6 92 64 09 00 00 	movzbl 0x964(%edx),%edx
 4d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4d3:	89 d8                	mov    %ebx,%eax
 4d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4e1:	76 dd                	jbe    4c0 <printint+0x30>
  if(neg)
 4e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4e6:	85 c9                	test   %ecx,%ecx
 4e8:	74 0c                	je     4f6 <printint+0x66>
    buf[i++] = '-';
 4ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4fd:	eb 07                	jmp    506 <printint+0x76>
 4ff:	90                   	nop
    putc(fd, buf[i]);
 500:	0f b6 13             	movzbl (%ebx),%edx
 503:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 506:	83 ec 04             	sub    $0x4,%esp
 509:	88 55 d7             	mov    %dl,-0x29(%ebp)
 50c:	6a 01                	push   $0x1
 50e:	56                   	push   %esi
 50f:	57                   	push   %edi
 510:	e8 ee fe ff ff       	call   403 <write>
  while(--i >= 0)
 515:	83 c4 10             	add    $0x10,%esp
 518:	39 de                	cmp    %ebx,%esi
 51a:	75 e4                	jne    500 <printint+0x70>
}
 51c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51f:	5b                   	pop    %ebx
 520:	5e                   	pop    %esi
 521:	5f                   	pop    %edi
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 528:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 52f:	eb 87                	jmp    4b8 <printint+0x28>
 531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 538:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53f:	90                   	nop

00000540 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 549:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 54c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 54f:	0f b6 13             	movzbl (%ebx),%edx
 552:	84 d2                	test   %dl,%dl
 554:	74 6a                	je     5c0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 556:	8d 45 10             	lea    0x10(%ebp),%eax
 559:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 55c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 55f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 561:	89 45 d0             	mov    %eax,-0x30(%ebp)
 564:	eb 36                	jmp    59c <printf+0x5c>
 566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
 570:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 573:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 578:	83 f8 25             	cmp    $0x25,%eax
 57b:	74 15                	je     592 <printf+0x52>
  write(fd, &c, 1);
 57d:	83 ec 04             	sub    $0x4,%esp
 580:	88 55 e7             	mov    %dl,-0x19(%ebp)
 583:	6a 01                	push   $0x1
 585:	57                   	push   %edi
 586:	56                   	push   %esi
 587:	e8 77 fe ff ff       	call   403 <write>
 58c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 58f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 592:	0f b6 13             	movzbl (%ebx),%edx
 595:	83 c3 01             	add    $0x1,%ebx
 598:	84 d2                	test   %dl,%dl
 59a:	74 24                	je     5c0 <printf+0x80>
    c = fmt[i] & 0xff;
 59c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 59f:	85 c9                	test   %ecx,%ecx
 5a1:	74 cd                	je     570 <printf+0x30>
      }
    } else if(state == '%'){
 5a3:	83 f9 25             	cmp    $0x25,%ecx
 5a6:	75 ea                	jne    592 <printf+0x52>
      if(c == 'd'){
 5a8:	83 f8 25             	cmp    $0x25,%eax
 5ab:	0f 84 07 01 00 00    	je     6b8 <printf+0x178>
 5b1:	83 e8 63             	sub    $0x63,%eax
 5b4:	83 f8 15             	cmp    $0x15,%eax
 5b7:	77 17                	ja     5d0 <printf+0x90>
 5b9:	ff 24 85 0c 09 00 00 	jmp    *0x90c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c3:	5b                   	pop    %ebx
 5c4:	5e                   	pop    %esi
 5c5:	5f                   	pop    %edi
 5c6:	5d                   	pop    %ebp
 5c7:	c3                   	ret    
 5c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop
  write(fd, &c, 1);
 5d0:	83 ec 04             	sub    $0x4,%esp
 5d3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 5d6:	6a 01                	push   $0x1
 5d8:	57                   	push   %edi
 5d9:	56                   	push   %esi
 5da:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5de:	e8 20 fe ff ff       	call   403 <write>
        putc(fd, c);
 5e3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 5e7:	83 c4 0c             	add    $0xc,%esp
 5ea:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5ed:	6a 01                	push   $0x1
 5ef:	57                   	push   %edi
 5f0:	56                   	push   %esi
 5f1:	e8 0d fe ff ff       	call   403 <write>
        putc(fd, c);
 5f6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5f9:	31 c9                	xor    %ecx,%ecx
 5fb:	eb 95                	jmp    592 <printf+0x52>
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 600:	83 ec 0c             	sub    $0xc,%esp
 603:	b9 10 00 00 00       	mov    $0x10,%ecx
 608:	6a 00                	push   $0x0
 60a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 60d:	8b 10                	mov    (%eax),%edx
 60f:	89 f0                	mov    %esi,%eax
 611:	e8 7a fe ff ff       	call   490 <printint>
        ap++;
 616:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 61a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 61d:	31 c9                	xor    %ecx,%ecx
 61f:	e9 6e ff ff ff       	jmp    592 <printf+0x52>
 624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 628:	8b 45 d0             	mov    -0x30(%ebp),%eax
 62b:	8b 10                	mov    (%eax),%edx
        ap++;
 62d:	83 c0 04             	add    $0x4,%eax
 630:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 633:	85 d2                	test   %edx,%edx
 635:	0f 84 8d 00 00 00    	je     6c8 <printf+0x188>
        while(*s != 0){
 63b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 63e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 640:	84 c0                	test   %al,%al
 642:	0f 84 4a ff ff ff    	je     592 <printf+0x52>
 648:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 64b:	89 d3                	mov    %edx,%ebx
 64d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
          s++;
 653:	83 c3 01             	add    $0x1,%ebx
 656:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 659:	6a 01                	push   $0x1
 65b:	57                   	push   %edi
 65c:	56                   	push   %esi
 65d:	e8 a1 fd ff ff       	call   403 <write>
        while(*s != 0){
 662:	0f b6 03             	movzbl (%ebx),%eax
 665:	83 c4 10             	add    $0x10,%esp
 668:	84 c0                	test   %al,%al
 66a:	75 e4                	jne    650 <printf+0x110>
      state = 0;
 66c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 66f:	31 c9                	xor    %ecx,%ecx
 671:	e9 1c ff ff ff       	jmp    592 <printf+0x52>
 676:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	b9 0a 00 00 00       	mov    $0xa,%ecx
 688:	6a 01                	push   $0x1
 68a:	e9 7b ff ff ff       	jmp    60a <printf+0xca>
 68f:	90                   	nop
        putc(fd, *ap);
 690:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 693:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 696:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 698:	6a 01                	push   $0x1
 69a:	57                   	push   %edi
 69b:	56                   	push   %esi
        putc(fd, *ap);
 69c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 69f:	e8 5f fd ff ff       	call   403 <write>
        ap++;
 6a4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6a8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ab:	31 c9                	xor    %ecx,%ecx
 6ad:	e9 e0 fe ff ff       	jmp    592 <printf+0x52>
 6b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 6b8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6bb:	83 ec 04             	sub    $0x4,%esp
 6be:	e9 2a ff ff ff       	jmp    5ed <printf+0xad>
 6c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6c7:	90                   	nop
          s = "(null)";
 6c8:	ba 05 09 00 00       	mov    $0x905,%edx
        while(*s != 0){
 6cd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6d0:	b8 28 00 00 00       	mov    $0x28,%eax
 6d5:	89 d3                	mov    %edx,%ebx
 6d7:	e9 74 ff ff ff       	jmp    650 <printf+0x110>
 6dc:	66 90                	xchg   %ax,%ax
 6de:	66 90                	xchg   %ax,%ax

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	a1 1c 0c 00 00       	mov    0xc1c,%eax
{
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6f8:	89 c2                	mov    %eax,%edx
 6fa:	8b 00                	mov    (%eax),%eax
 6fc:	39 ca                	cmp    %ecx,%edx
 6fe:	73 30                	jae    730 <free+0x50>
 700:	39 c1                	cmp    %eax,%ecx
 702:	72 04                	jb     708 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 704:	39 c2                	cmp    %eax,%edx
 706:	72 f0                	jb     6f8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 708:	8b 73 fc             	mov    -0x4(%ebx),%esi
 70b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70e:	39 f8                	cmp    %edi,%eax
 710:	74 30                	je     742 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 712:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 715:	8b 42 04             	mov    0x4(%edx),%eax
 718:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 71b:	39 f1                	cmp    %esi,%ecx
 71d:	74 3a                	je     759 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 71f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 721:	5b                   	pop    %ebx
  freep = p;
 722:	89 15 1c 0c 00 00    	mov    %edx,0xc1c
}
 728:	5e                   	pop    %esi
 729:	5f                   	pop    %edi
 72a:	5d                   	pop    %ebp
 72b:	c3                   	ret    
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 730:	39 c2                	cmp    %eax,%edx
 732:	72 c4                	jb     6f8 <free+0x18>
 734:	39 c1                	cmp    %eax,%ecx
 736:	73 c0                	jae    6f8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 738:	8b 73 fc             	mov    -0x4(%ebx),%esi
 73b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73e:	39 f8                	cmp    %edi,%eax
 740:	75 d0                	jne    712 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 742:	03 70 04             	add    0x4(%eax),%esi
 745:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 748:	8b 02                	mov    (%edx),%eax
 74a:	8b 00                	mov    (%eax),%eax
 74c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 74f:	8b 42 04             	mov    0x4(%edx),%eax
 752:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 755:	39 f1                	cmp    %esi,%ecx
 757:	75 c6                	jne    71f <free+0x3f>
    p->s.size += bp->s.size;
 759:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 75c:	89 15 1c 0c 00 00    	mov    %edx,0xc1c
    p->s.size += bp->s.size;
 762:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 765:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 768:	89 0a                	mov    %ecx,(%edx)
}
 76a:	5b                   	pop    %ebx
 76b:	5e                   	pop    %esi
 76c:	5f                   	pop    %edi
 76d:	5d                   	pop    %ebp
 76e:	c3                   	ret    
 76f:	90                   	nop

00000770 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 779:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 77c:	8b 3d 1c 0c 00 00    	mov    0xc1c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 782:	8d 70 07             	lea    0x7(%eax),%esi
 785:	c1 ee 03             	shr    $0x3,%esi
 788:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 78b:	85 ff                	test   %edi,%edi
 78d:	0f 84 9d 00 00 00    	je     830 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 793:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 795:	8b 4a 04             	mov    0x4(%edx),%ecx
 798:	39 f1                	cmp    %esi,%ecx
 79a:	73 6a                	jae    806 <malloc+0x96>
 79c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7a1:	39 de                	cmp    %ebx,%esi
 7a3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 7a6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7b0:	eb 17                	jmp    7c9 <malloc+0x59>
 7b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7ba:	8b 48 04             	mov    0x4(%eax),%ecx
 7bd:	39 f1                	cmp    %esi,%ecx
 7bf:	73 4f                	jae    810 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c1:	8b 3d 1c 0c 00 00    	mov    0xc1c,%edi
 7c7:	89 c2                	mov    %eax,%edx
 7c9:	39 d7                	cmp    %edx,%edi
 7cb:	75 eb                	jne    7b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7cd:	83 ec 0c             	sub    $0xc,%esp
 7d0:	ff 75 e4             	push   -0x1c(%ebp)
 7d3:	e8 93 fc ff ff       	call   46b <sbrk>
  if(p == (char*)-1)
 7d8:	83 c4 10             	add    $0x10,%esp
 7db:	83 f8 ff             	cmp    $0xffffffff,%eax
 7de:	74 1c                	je     7fc <malloc+0x8c>
  hp->s.size = nu;
 7e0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e3:	83 ec 0c             	sub    $0xc,%esp
 7e6:	83 c0 08             	add    $0x8,%eax
 7e9:	50                   	push   %eax
 7ea:	e8 f1 fe ff ff       	call   6e0 <free>
  return freep;
 7ef:	8b 15 1c 0c 00 00    	mov    0xc1c,%edx
      if((p = morecore(nunits)) == 0)
 7f5:	83 c4 10             	add    $0x10,%esp
 7f8:	85 d2                	test   %edx,%edx
 7fa:	75 bc                	jne    7b8 <malloc+0x48>
        return 0;
  }
}
 7fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7ff:	31 c0                	xor    %eax,%eax
}
 801:	5b                   	pop    %ebx
 802:	5e                   	pop    %esi
 803:	5f                   	pop    %edi
 804:	5d                   	pop    %ebp
 805:	c3                   	ret    
    if(p->s.size >= nunits){
 806:	89 d0                	mov    %edx,%eax
 808:	89 fa                	mov    %edi,%edx
 80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 810:	39 ce                	cmp    %ecx,%esi
 812:	74 4c                	je     860 <malloc+0xf0>
        p->s.size -= nunits;
 814:	29 f1                	sub    %esi,%ecx
 816:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 81c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 81f:	89 15 1c 0c 00 00    	mov    %edx,0xc1c
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
 830:	c7 05 1c 0c 00 00 20 	movl   $0xc20,0xc1c
 837:	0c 00 00 
    base.s.size = 0;
 83a:	bf 20 0c 00 00       	mov    $0xc20,%edi
    base.s.ptr = freep = prevp = &base;
 83f:	c7 05 20 0c 00 00 20 	movl   $0xc20,0xc20
 846:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 849:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 84b:	c7 05 24 0c 00 00 00 	movl   $0x0,0xc24
 852:	00 00 00 
    if(p->s.size >= nunits){
 855:	e9 42 ff ff ff       	jmp    79c <malloc+0x2c>
 85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 860:	8b 08                	mov    (%eax),%ecx
 862:	89 0a                	mov    %ecx,(%edx)
 864:	eb b9                	jmp    81f <malloc+0xaf>
