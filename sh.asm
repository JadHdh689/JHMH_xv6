
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

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
      10:	83 ec 0c             	sub    $0xc,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      13:	eb 0c                	jmp    21 <main+0x21>
      15:	8d 76 00             	lea    0x0(%esi),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 56 01 00 00    	jg     177 <main+0x177>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 ab 15 00 00       	push   $0x15ab
      2b:	e8 bf 0f 00 00       	call   fef <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
      3e:	00 
      3f:	90                   	nop
  printf(2, "$ ");
      40:	83 ec 08             	sub    $0x8,%esp
      43:	68 0a 15 00 00       	push   $0x150a
      48:	6a 02                	push   $0x2
      4a:	e8 c1 10 00 00       	call   1110 <printf>
  memset(buf, 0, nbuf);
      4f:	83 c4 0c             	add    $0xc,%esp
      52:	6a 64                	push   $0x64
      54:	6a 00                	push   $0x0
      56:	68 80 25 00 00       	push   $0x2580
      5b:	e8 80 0d 00 00       	call   de0 <memset>
  gets(buf, nbuf);
      60:	58                   	pop    %eax
      61:	5a                   	pop    %edx
      62:	6a 64                	push   $0x64
      64:	68 80 25 00 00       	push   $0x2580
      69:	e8 d2 0d 00 00       	call   e40 <gets>
  if(buf[0] == 0) // EOF
      6e:	0f b6 05 80 25 00 00 	movzbl 0x2580,%eax
      75:	83 c4 10             	add    $0x10,%esp
      78:	84 c0                	test   %al,%al
      7a:	0f 84 f2 00 00 00    	je     172 <main+0x172>
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      80:	3c 63                	cmp    $0x63,%al
      82:	75 0d                	jne    91 <main+0x91>
      84:	80 3d 81 25 00 00 64 	cmpb   $0x64,0x2581
      8b:	0f 84 8f 00 00 00    	je     120 <main+0x120>
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }

    add_history(buf);
      91:	83 ec 0c             	sub    $0xc,%esp
      94:	68 80 25 00 00       	push   $0x2580
      99:	e8 12 01 00 00       	call   1b0 <add_history>
    if(strncmp(buf, "history", 7) == 0){
      9e:	83 c4 0c             	add    $0xc,%esp
      a1:	6a 07                	push   $0x7
      a3:	68 c1 15 00 00       	push   $0x15c1
      a8:	68 80 25 00 00       	push   $0x2580
      ad:	e8 ae 0e 00 00       	call   f60 <strncmp>
      b2:	83 c4 10             	add    $0x10,%esp
      b5:	89 c3                	mov    %eax,%ebx
      b7:	85 c0                	test   %eax,%eax
      b9:	74 25                	je     e0 <main+0xe0>
int
fork1(void)
{
  int pid;

  pid = fork();
      bb:	e8 e7 0e 00 00       	call   fa7 <fork>
  if(pid == -1)
      c0:	83 f8 ff             	cmp    $0xffffffff,%eax
      c3:	0f 84 d4 00 00 00    	je     19d <main+0x19d>
    if(fork1() == 0)
      c9:	85 c0                	test   %eax,%eax
      cb:	0f 84 b7 00 00 00    	je     188 <main+0x188>
    wait();
      d1:	e8 e1 0e 00 00       	call   fb7 <wait>
      d6:	e9 65 ff ff ff       	jmp    40 <main+0x40>
      db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  for(int i = 0; i < history_count; i++)
      e0:	8b 0d 80 1d 00 00    	mov    0x1d80,%ecx
      e6:	85 c9                	test   %ecx,%ecx
      e8:	0f 8e 52 ff ff ff    	jle    40 <main+0x40>
      ee:	be a0 1d 00 00       	mov    $0x1da0,%esi
      f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "%d %s", i+1, history[i]);  // prints each stored command
      f8:	83 c3 01             	add    $0x1,%ebx
      fb:	56                   	push   %esi
  for(int i = 0; i < history_count; i++)
      fc:	83 c6 64             	add    $0x64,%esi
    printf(1, "%d %s", i+1, history[i]);  // prints each stored command
      ff:	53                   	push   %ebx
     100:	68 04 15 00 00       	push   $0x1504
     105:	6a 01                	push   $0x1
     107:	e8 04 10 00 00       	call   1110 <printf>
  for(int i = 0; i < history_count; i++)
     10c:	83 c4 10             	add    $0x10,%esp
     10f:	3b 1d 80 1d 00 00    	cmp    0x1d80,%ebx
     115:	7c e1                	jl     f8 <main+0xf8>
     117:	e9 24 ff ff ff       	jmp    40 <main+0x40>
     11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     120:	80 3d 82 25 00 00 20 	cmpb   $0x20,0x2582
     127:	0f 85 64 ff ff ff    	jne    91 <main+0x91>
      buf[strlen(buf)-1] = 0;  // chop \n
     12d:	83 ec 0c             	sub    $0xc,%esp
     130:	68 80 25 00 00       	push   $0x2580
     135:	e8 76 0c 00 00       	call   db0 <strlen>
      if(chdir(buf+3) < 0)
     13a:	c7 04 24 83 25 00 00 	movl   $0x2583,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
     141:	c6 80 7f 25 00 00 00 	movb   $0x0,0x257f(%eax)
      if(chdir(buf+3) < 0)
     148:	e8 d2 0e 00 00       	call   101f <chdir>
     14d:	83 c4 10             	add    $0x10,%esp
     150:	85 c0                	test   %eax,%eax
     152:	0f 89 e8 fe ff ff    	jns    40 <main+0x40>
        printf(2, "cannot cd %s\n", buf+3);
     158:	53                   	push   %ebx
     159:	68 83 25 00 00       	push   $0x2583
     15e:	68 b3 15 00 00       	push   $0x15b3
     163:	6a 02                	push   $0x2
     165:	e8 a6 0f 00 00       	call   1110 <printf>
     16a:	83 c4 10             	add    $0x10,%esp
     16d:	e9 ce fe ff ff       	jmp    40 <main+0x40>
  exit();
     172:	e8 38 0e 00 00       	call   faf <exit>
      close(fd);
     177:	83 ec 0c             	sub    $0xc,%esp
     17a:	50                   	push   %eax
     17b:	e8 57 0e 00 00       	call   fd7 <close>
      break;
     180:	83 c4 10             	add    $0x10,%esp
     183:	e9 b8 fe ff ff       	jmp    40 <main+0x40>
      runcmd(parsecmd(buf));
     188:	83 ec 0c             	sub    $0xc,%esp
     18b:	68 80 25 00 00       	push   $0x2580
     190:	e8 1b 0b 00 00       	call   cb0 <parsecmd>
     195:	89 04 24             	mov    %eax,(%esp)
     198:	e8 63 01 00 00       	call   300 <runcmd>
    panic("fork");
     19d:	83 ec 0c             	sub    $0xc,%esp
     1a0:	68 0d 15 00 00       	push   $0x150d
     1a5:	e8 16 01 00 00       	call   2c0 <panic>
     1aa:	66 90                	xchg   %ax,%ax
     1ac:	66 90                	xchg   %ax,%ax
     1ae:	66 90                	xchg   %ax,%ax

000001b0 <add_history>:
void add_history(char *cmd) {
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	56                   	push   %esi
     1b4:	53                   	push   %ebx
     1b5:	8b 75 08             	mov    0x8(%ebp),%esi
  if(cmd[0] == 0) return;
     1b8:	80 3e 00             	cmpb   $0x0,(%esi)
     1bb:	74 3e                	je     1fb <add_history+0x4b>
  if(history_count < MAX_HISTORY) {
     1bd:	a1 80 1d 00 00       	mov    0x1d80,%eax
     1c2:	bb a0 1d 00 00       	mov    $0x1da0,%ebx
     1c7:	83 f8 13             	cmp    $0x13,%eax
     1ca:	7e 3c                	jle    208 <add_history+0x58>
     1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      strcpy(history[i-1], history[i]);
     1d0:	83 ec 08             	sub    $0x8,%esp
     1d3:	89 d8                	mov    %ebx,%eax
     1d5:	83 c3 64             	add    $0x64,%ebx
     1d8:	53                   	push   %ebx
     1d9:	50                   	push   %eax
     1da:	e8 41 0b 00 00       	call   d20 <strcpy>
    for(int i = 1; i < MAX_HISTORY; i++)
     1df:	83 c4 10             	add    $0x10,%esp
     1e2:	81 fb 0c 25 00 00    	cmp    $0x250c,%ebx
     1e8:	75 e6                	jne    1d0 <add_history+0x20>
    strcpy(history[MAX_HISTORY-1], cmd);
     1ea:	83 ec 08             	sub    $0x8,%esp
     1ed:	56                   	push   %esi
     1ee:	68 0c 25 00 00       	push   $0x250c
     1f3:	e8 28 0b 00 00       	call   d20 <strcpy>
     1f8:	83 c4 10             	add    $0x10,%esp
}
     1fb:	8d 65 f8             	lea    -0x8(%ebp),%esp
     1fe:	5b                   	pop    %ebx
     1ff:	5e                   	pop    %esi
     200:	5d                   	pop    %ebp
     201:	c3                   	ret
     202:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    strcpy(history[history_count], cmd);
     208:	6b c0 64             	imul   $0x64,%eax,%eax
     20b:	83 ec 08             	sub    $0x8,%esp
     20e:	56                   	push   %esi
     20f:	01 d8                	add    %ebx,%eax
     211:	50                   	push   %eax
     212:	e8 09 0b 00 00       	call   d20 <strcpy>
    history_count++;
     217:	83 05 80 1d 00 00 01 	addl   $0x1,0x1d80
     21e:	83 c4 10             	add    $0x10,%esp
}
     221:	8d 65 f8             	lea    -0x8(%ebp),%esp
     224:	5b                   	pop    %ebx
     225:	5e                   	pop    %esi
     226:	5d                   	pop    %ebp
     227:	c3                   	ret
     228:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     22f:	00 

00000230 <show_history>:
  for(int i = 0; i < history_count; i++)
     230:	a1 80 1d 00 00       	mov    0x1d80,%eax
     235:	85 c0                	test   %eax,%eax
     237:	7e 37                	jle    270 <show_history+0x40>
void show_history(void) {
     239:	55                   	push   %ebp
     23a:	89 e5                	mov    %esp,%ebp
     23c:	56                   	push   %esi
     23d:	be a0 1d 00 00       	mov    $0x1da0,%esi
     242:	53                   	push   %ebx
  for(int i = 0; i < history_count; i++)
     243:	31 db                	xor    %ebx,%ebx
     245:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%d %s", i+1, history[i]);  // prints each stored command
     248:	83 c3 01             	add    $0x1,%ebx
     24b:	56                   	push   %esi
  for(int i = 0; i < history_count; i++)
     24c:	83 c6 64             	add    $0x64,%esi
    printf(1, "%d %s", i+1, history[i]);  // prints each stored command
     24f:	53                   	push   %ebx
     250:	68 04 15 00 00       	push   $0x1504
     255:	6a 01                	push   $0x1
     257:	e8 b4 0e 00 00       	call   1110 <printf>
  for(int i = 0; i < history_count; i++)
     25c:	83 c4 10             	add    $0x10,%esp
     25f:	3b 1d 80 1d 00 00    	cmp    0x1d80,%ebx
     265:	7c e1                	jl     248 <show_history+0x18>
}
     267:	8d 65 f8             	lea    -0x8(%ebp),%esp
     26a:	5b                   	pop    %ebx
     26b:	5e                   	pop    %esi
     26c:	5d                   	pop    %ebp
     26d:	c3                   	ret
     26e:	66 90                	xchg   %ax,%ax
     270:	c3                   	ret
     271:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     278:	00 
     279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <getcmd>:
{
     280:	55                   	push   %ebp
     281:	89 e5                	mov    %esp,%ebp
     283:	56                   	push   %esi
     284:	53                   	push   %ebx
     285:	8b 5d 08             	mov    0x8(%ebp),%ebx
     288:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     28b:	83 ec 08             	sub    $0x8,%esp
     28e:	68 0a 15 00 00       	push   $0x150a
     293:	6a 02                	push   $0x2
     295:	e8 76 0e 00 00       	call   1110 <printf>
  memset(buf, 0, nbuf);
     29a:	83 c4 0c             	add    $0xc,%esp
     29d:	56                   	push   %esi
     29e:	6a 00                	push   $0x0
     2a0:	53                   	push   %ebx
     2a1:	e8 3a 0b 00 00       	call   de0 <memset>
  gets(buf, nbuf);
     2a6:	58                   	pop    %eax
     2a7:	5a                   	pop    %edx
     2a8:	56                   	push   %esi
     2a9:	53                   	push   %ebx
     2aa:	e8 91 0b 00 00       	call   e40 <gets>
  if(buf[0] == 0) // EOF
     2af:	83 c4 10             	add    $0x10,%esp
     2b2:	80 3b 01             	cmpb   $0x1,(%ebx)
     2b5:	19 c0                	sbb    %eax,%eax
}
     2b7:	8d 65 f8             	lea    -0x8(%ebp),%esp
     2ba:	5b                   	pop    %ebx
     2bb:	5e                   	pop    %esi
     2bc:	5d                   	pop    %ebp
     2bd:	c3                   	ret
     2be:	66 90                	xchg   %ax,%ax

000002c0 <panic>:
{
     2c0:	55                   	push   %ebp
     2c1:	89 e5                	mov    %esp,%ebp
     2c3:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     2c6:	ff 75 08             	push   0x8(%ebp)
     2c9:	68 a7 15 00 00       	push   $0x15a7
     2ce:	6a 02                	push   $0x2
     2d0:	e8 3b 0e 00 00       	call   1110 <printf>
  exit();
     2d5:	e8 d5 0c 00 00       	call   faf <exit>
     2da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002e0 <fork1>:
{
     2e0:	55                   	push   %ebp
     2e1:	89 e5                	mov    %esp,%ebp
     2e3:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     2e6:	e8 bc 0c 00 00       	call   fa7 <fork>
  if(pid == -1)
     2eb:	83 f8 ff             	cmp    $0xffffffff,%eax
     2ee:	74 02                	je     2f2 <fork1+0x12>
  return pid;
}
     2f0:	c9                   	leave
     2f1:	c3                   	ret
    panic("fork");
     2f2:	83 ec 0c             	sub    $0xc,%esp
     2f5:	68 0d 15 00 00       	push   $0x150d
     2fa:	e8 c1 ff ff ff       	call   2c0 <panic>
     2ff:	90                   	nop

00000300 <runcmd>:
{
     300:	55                   	push   %ebp
     301:	89 e5                	mov    %esp,%ebp
     303:	53                   	push   %ebx
     304:	83 ec 14             	sub    $0x14,%esp
     307:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     30a:	85 db                	test   %ebx,%ebx
     30c:	74 42                	je     350 <runcmd+0x50>
  switch(cmd->type){
     30e:	83 3b 05             	cmpl   $0x5,(%ebx)
     311:	0f 87 e3 00 00 00    	ja     3fa <runcmd+0xfa>
     317:	8b 03                	mov    (%ebx),%eax
     319:	ff 24 85 d0 15 00 00 	jmp    *0x15d0(,%eax,4)
    if(ecmd->argv[0] == 0)
     320:	8b 43 04             	mov    0x4(%ebx),%eax
     323:	85 c0                	test   %eax,%eax
     325:	74 29                	je     350 <runcmd+0x50>
    exec(ecmd->argv[0], ecmd->argv);
     327:	8d 53 04             	lea    0x4(%ebx),%edx
     32a:	51                   	push   %ecx
     32b:	51                   	push   %ecx
     32c:	52                   	push   %edx
     32d:	50                   	push   %eax
     32e:	e8 b4 0c 00 00       	call   fe7 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     333:	83 c4 0c             	add    $0xc,%esp
     336:	ff 73 04             	push   0x4(%ebx)
     339:	68 19 15 00 00       	push   $0x1519
     33e:	6a 02                	push   $0x2
     340:	e8 cb 0d 00 00       	call   1110 <printf>
    break;
     345:	83 c4 10             	add    $0x10,%esp
     348:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     34f:	00 
    exit();
     350:	e8 5a 0c 00 00       	call   faf <exit>
    if(fork1() == 0)
     355:	e8 86 ff ff ff       	call   2e0 <fork1>
     35a:	85 c0                	test   %eax,%eax
     35c:	75 f2                	jne    350 <runcmd+0x50>
     35e:	e9 8c 00 00 00       	jmp    3ef <runcmd+0xef>
    if(pipe(p) < 0)
     363:	83 ec 0c             	sub    $0xc,%esp
     366:	8d 45 f0             	lea    -0x10(%ebp),%eax
     369:	50                   	push   %eax
     36a:	e8 50 0c 00 00       	call   fbf <pipe>
     36f:	83 c4 10             	add    $0x10,%esp
     372:	85 c0                	test   %eax,%eax
     374:	0f 88 a2 00 00 00    	js     41c <runcmd+0x11c>
    if(fork1() == 0){
     37a:	e8 61 ff ff ff       	call   2e0 <fork1>
     37f:	85 c0                	test   %eax,%eax
     381:	0f 84 a2 00 00 00    	je     429 <runcmd+0x129>
    if(fork1() == 0){
     387:	e8 54 ff ff ff       	call   2e0 <fork1>
     38c:	85 c0                	test   %eax,%eax
     38e:	0f 84 c3 00 00 00    	je     457 <runcmd+0x157>
    close(p[0]);
     394:	83 ec 0c             	sub    $0xc,%esp
     397:	ff 75 f0             	push   -0x10(%ebp)
     39a:	e8 38 0c 00 00       	call   fd7 <close>
    close(p[1]);
     39f:	58                   	pop    %eax
     3a0:	ff 75 f4             	push   -0xc(%ebp)
     3a3:	e8 2f 0c 00 00       	call   fd7 <close>
    wait();
     3a8:	e8 0a 0c 00 00       	call   fb7 <wait>
    wait();
     3ad:	e8 05 0c 00 00       	call   fb7 <wait>
    break;
     3b2:	83 c4 10             	add    $0x10,%esp
     3b5:	eb 99                	jmp    350 <runcmd+0x50>
    if(fork1() == 0)
     3b7:	e8 24 ff ff ff       	call   2e0 <fork1>
     3bc:	85 c0                	test   %eax,%eax
     3be:	74 2f                	je     3ef <runcmd+0xef>
    wait();
     3c0:	e8 f2 0b 00 00       	call   fb7 <wait>
    runcmd(lcmd->right);
     3c5:	83 ec 0c             	sub    $0xc,%esp
     3c8:	ff 73 08             	push   0x8(%ebx)
     3cb:	e8 30 ff ff ff       	call   300 <runcmd>
    close(rcmd->fd);
     3d0:	83 ec 0c             	sub    $0xc,%esp
     3d3:	ff 73 14             	push   0x14(%ebx)
     3d6:	e8 fc 0b 00 00       	call   fd7 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     3db:	58                   	pop    %eax
     3dc:	5a                   	pop    %edx
     3dd:	ff 73 10             	push   0x10(%ebx)
     3e0:	ff 73 08             	push   0x8(%ebx)
     3e3:	e8 07 0c 00 00       	call   fef <open>
     3e8:	83 c4 10             	add    $0x10,%esp
     3eb:	85 c0                	test   %eax,%eax
     3ed:	78 18                	js     407 <runcmd+0x107>
      runcmd(bcmd->cmd);
     3ef:	83 ec 0c             	sub    $0xc,%esp
     3f2:	ff 73 04             	push   0x4(%ebx)
     3f5:	e8 06 ff ff ff       	call   300 <runcmd>
    panic("runcmd");
     3fa:	83 ec 0c             	sub    $0xc,%esp
     3fd:	68 12 15 00 00       	push   $0x1512
     402:	e8 b9 fe ff ff       	call   2c0 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     407:	51                   	push   %ecx
     408:	ff 73 08             	push   0x8(%ebx)
     40b:	68 29 15 00 00       	push   $0x1529
     410:	6a 02                	push   $0x2
     412:	e8 f9 0c 00 00       	call   1110 <printf>
      exit();
     417:	e8 93 0b 00 00       	call   faf <exit>
      panic("pipe");
     41c:	83 ec 0c             	sub    $0xc,%esp
     41f:	68 39 15 00 00       	push   $0x1539
     424:	e8 97 fe ff ff       	call   2c0 <panic>
      close(1);
     429:	83 ec 0c             	sub    $0xc,%esp
     42c:	6a 01                	push   $0x1
     42e:	e8 a4 0b 00 00       	call   fd7 <close>
      dup(p[1]);
     433:	58                   	pop    %eax
     434:	ff 75 f4             	push   -0xc(%ebp)
     437:	e8 eb 0b 00 00       	call   1027 <dup>
      close(p[0]);
     43c:	58                   	pop    %eax
     43d:	ff 75 f0             	push   -0x10(%ebp)
     440:	e8 92 0b 00 00       	call   fd7 <close>
      close(p[1]);
     445:	58                   	pop    %eax
     446:	ff 75 f4             	push   -0xc(%ebp)
     449:	e8 89 0b 00 00       	call   fd7 <close>
      runcmd(pcmd->left);
     44e:	5a                   	pop    %edx
     44f:	ff 73 04             	push   0x4(%ebx)
     452:	e8 a9 fe ff ff       	call   300 <runcmd>
      close(0);
     457:	83 ec 0c             	sub    $0xc,%esp
     45a:	6a 00                	push   $0x0
     45c:	e8 76 0b 00 00       	call   fd7 <close>
      dup(p[0]);
     461:	5a                   	pop    %edx
     462:	ff 75 f0             	push   -0x10(%ebp)
     465:	e8 bd 0b 00 00       	call   1027 <dup>
      close(p[0]);
     46a:	59                   	pop    %ecx
     46b:	ff 75 f0             	push   -0x10(%ebp)
     46e:	e8 64 0b 00 00       	call   fd7 <close>
      close(p[1]);
     473:	58                   	pop    %eax
     474:	ff 75 f4             	push   -0xc(%ebp)
     477:	e8 5b 0b 00 00       	call   fd7 <close>
      runcmd(pcmd->right);
     47c:	58                   	pop    %eax
     47d:	ff 73 08             	push   0x8(%ebx)
     480:	e8 7b fe ff ff       	call   300 <runcmd>
     485:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     48c:	00 
     48d:	8d 76 00             	lea    0x0(%esi),%esi

00000490 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     490:	55                   	push   %ebp
     491:	89 e5                	mov    %esp,%ebp
     493:	53                   	push   %ebx
     494:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     497:	6a 54                	push   $0x54
     499:	e8 92 0e 00 00       	call   1330 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     49e:	83 c4 0c             	add    $0xc,%esp
     4a1:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     4a3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     4a5:	6a 00                	push   $0x0
     4a7:	50                   	push   %eax
     4a8:	e8 33 09 00 00       	call   de0 <memset>
  cmd->type = EXEC;
     4ad:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     4b3:	89 d8                	mov    %ebx,%eax
     4b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4b8:	c9                   	leave
     4b9:	c3                   	ret
     4ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004c0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     4c0:	55                   	push   %ebp
     4c1:	89 e5                	mov    %esp,%ebp
     4c3:	53                   	push   %ebx
     4c4:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4c7:	6a 18                	push   $0x18
     4c9:	e8 62 0e 00 00       	call   1330 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     4ce:	83 c4 0c             	add    $0xc,%esp
     4d1:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     4d3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     4d5:	6a 00                	push   $0x0
     4d7:	50                   	push   %eax
     4d8:	e8 03 09 00 00       	call   de0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     4dd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     4e0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     4e6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     4e9:	8b 45 0c             	mov    0xc(%ebp),%eax
     4ec:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     4ef:	8b 45 10             	mov    0x10(%ebp),%eax
     4f2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     4f5:	8b 45 14             	mov    0x14(%ebp),%eax
     4f8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     4fb:	8b 45 18             	mov    0x18(%ebp),%eax
     4fe:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     501:	89 d8                	mov    %ebx,%eax
     503:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     506:	c9                   	leave
     507:	c3                   	ret
     508:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     50f:	00 

00000510 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     510:	55                   	push   %ebp
     511:	89 e5                	mov    %esp,%ebp
     513:	53                   	push   %ebx
     514:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     517:	6a 0c                	push   $0xc
     519:	e8 12 0e 00 00       	call   1330 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     51e:	83 c4 0c             	add    $0xc,%esp
     521:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     523:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     525:	6a 00                	push   $0x0
     527:	50                   	push   %eax
     528:	e8 b3 08 00 00       	call   de0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     52d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     530:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     536:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     539:	8b 45 0c             	mov    0xc(%ebp),%eax
     53c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     53f:	89 d8                	mov    %ebx,%eax
     541:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     544:	c9                   	leave
     545:	c3                   	ret
     546:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     54d:	00 
     54e:	66 90                	xchg   %ax,%ax

00000550 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     550:	55                   	push   %ebp
     551:	89 e5                	mov    %esp,%ebp
     553:	53                   	push   %ebx
     554:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     557:	6a 0c                	push   $0xc
     559:	e8 d2 0d 00 00       	call   1330 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     55e:	83 c4 0c             	add    $0xc,%esp
     561:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     563:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     565:	6a 00                	push   $0x0
     567:	50                   	push   %eax
     568:	e8 73 08 00 00       	call   de0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     56d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     570:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     576:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     579:	8b 45 0c             	mov    0xc(%ebp),%eax
     57c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     57f:	89 d8                	mov    %ebx,%eax
     581:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     584:	c9                   	leave
     585:	c3                   	ret
     586:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     58d:	00 
     58e:	66 90                	xchg   %ax,%ax

00000590 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     590:	55                   	push   %ebp
     591:	89 e5                	mov    %esp,%ebp
     593:	53                   	push   %ebx
     594:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     597:	6a 08                	push   $0x8
     599:	e8 92 0d 00 00       	call   1330 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     59e:	83 c4 0c             	add    $0xc,%esp
     5a1:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     5a3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     5a5:	6a 00                	push   $0x0
     5a7:	50                   	push   %eax
     5a8:	e8 33 08 00 00       	call   de0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     5ad:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     5b0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     5b6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     5b9:	89 d8                	mov    %ebx,%eax
     5bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     5be:	c9                   	leave
     5bf:	c3                   	ret

000005c0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     5c0:	55                   	push   %ebp
     5c1:	89 e5                	mov    %esp,%ebp
     5c3:	57                   	push   %edi
     5c4:	56                   	push   %esi
     5c5:	53                   	push   %ebx
     5c6:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     5c9:	8b 45 08             	mov    0x8(%ebp),%eax
{
     5cc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     5cf:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     5d2:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     5d4:	39 df                	cmp    %ebx,%edi
     5d6:	72 0f                	jb     5e7 <gettoken+0x27>
     5d8:	eb 25                	jmp    5ff <gettoken+0x3f>
     5da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     5e0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     5e3:	39 fb                	cmp    %edi,%ebx
     5e5:	74 18                	je     5ff <gettoken+0x3f>
     5e7:	0f be 07             	movsbl (%edi),%eax
     5ea:	83 ec 08             	sub    $0x8,%esp
     5ed:	50                   	push   %eax
     5ee:	68 64 1d 00 00       	push   $0x1d64
     5f3:	e8 08 08 00 00       	call   e00 <strchr>
     5f8:	83 c4 10             	add    $0x10,%esp
     5fb:	85 c0                	test   %eax,%eax
     5fd:	75 e1                	jne    5e0 <gettoken+0x20>
  if(q)
     5ff:	85 f6                	test   %esi,%esi
     601:	74 02                	je     605 <gettoken+0x45>
    *q = s;
     603:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     605:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     608:	3c 3c                	cmp    $0x3c,%al
     60a:	0f 8f c8 00 00 00    	jg     6d8 <gettoken+0x118>
     610:	3c 3a                	cmp    $0x3a,%al
     612:	7f 5a                	jg     66e <gettoken+0xae>
     614:	84 c0                	test   %al,%al
     616:	75 48                	jne    660 <gettoken+0xa0>
     618:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     61a:	8b 4d 14             	mov    0x14(%ebp),%ecx
     61d:	85 c9                	test   %ecx,%ecx
     61f:	74 05                	je     626 <gettoken+0x66>
    *eq = s;
     621:	8b 45 14             	mov    0x14(%ebp),%eax
     624:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     626:	39 df                	cmp    %ebx,%edi
     628:	72 0d                	jb     637 <gettoken+0x77>
     62a:	eb 23                	jmp    64f <gettoken+0x8f>
     62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     630:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     633:	39 fb                	cmp    %edi,%ebx
     635:	74 18                	je     64f <gettoken+0x8f>
     637:	0f be 07             	movsbl (%edi),%eax
     63a:	83 ec 08             	sub    $0x8,%esp
     63d:	50                   	push   %eax
     63e:	68 64 1d 00 00       	push   $0x1d64
     643:	e8 b8 07 00 00       	call   e00 <strchr>
     648:	83 c4 10             	add    $0x10,%esp
     64b:	85 c0                	test   %eax,%eax
     64d:	75 e1                	jne    630 <gettoken+0x70>
  *ps = s;
     64f:	8b 45 08             	mov    0x8(%ebp),%eax
     652:	89 38                	mov    %edi,(%eax)
  return ret;
}
     654:	8d 65 f4             	lea    -0xc(%ebp),%esp
     657:	89 f0                	mov    %esi,%eax
     659:	5b                   	pop    %ebx
     65a:	5e                   	pop    %esi
     65b:	5f                   	pop    %edi
     65c:	5d                   	pop    %ebp
     65d:	c3                   	ret
     65e:	66 90                	xchg   %ax,%ax
  switch(*s){
     660:	78 22                	js     684 <gettoken+0xc4>
     662:	3c 26                	cmp    $0x26,%al
     664:	74 08                	je     66e <gettoken+0xae>
     666:	8d 48 d8             	lea    -0x28(%eax),%ecx
     669:	80 f9 01             	cmp    $0x1,%cl
     66c:	77 16                	ja     684 <gettoken+0xc4>
  ret = *s;
     66e:	0f be f0             	movsbl %al,%esi
    s++;
     671:	83 c7 01             	add    $0x1,%edi
    break;
     674:	eb a4                	jmp    61a <gettoken+0x5a>
     676:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     67d:	00 
     67e:	66 90                	xchg   %ax,%ax
  switch(*s){
     680:	3c 7c                	cmp    $0x7c,%al
     682:	74 ea                	je     66e <gettoken+0xae>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     684:	39 df                	cmp    %ebx,%edi
     686:	72 27                	jb     6af <gettoken+0xef>
     688:	e9 87 00 00 00       	jmp    714 <gettoken+0x154>
     68d:	8d 76 00             	lea    0x0(%esi),%esi
     690:	0f be 07             	movsbl (%edi),%eax
     693:	83 ec 08             	sub    $0x8,%esp
     696:	50                   	push   %eax
     697:	68 5c 1d 00 00       	push   $0x1d5c
     69c:	e8 5f 07 00 00       	call   e00 <strchr>
     6a1:	83 c4 10             	add    $0x10,%esp
     6a4:	85 c0                	test   %eax,%eax
     6a6:	75 1f                	jne    6c7 <gettoken+0x107>
      s++;
     6a8:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     6ab:	39 fb                	cmp    %edi,%ebx
     6ad:	74 4d                	je     6fc <gettoken+0x13c>
     6af:	0f be 07             	movsbl (%edi),%eax
     6b2:	83 ec 08             	sub    $0x8,%esp
     6b5:	50                   	push   %eax
     6b6:	68 64 1d 00 00       	push   $0x1d64
     6bb:	e8 40 07 00 00       	call   e00 <strchr>
     6c0:	83 c4 10             	add    $0x10,%esp
     6c3:	85 c0                	test   %eax,%eax
     6c5:	74 c9                	je     690 <gettoken+0xd0>
    ret = 'a';
     6c7:	be 61 00 00 00       	mov    $0x61,%esi
     6cc:	e9 49 ff ff ff       	jmp    61a <gettoken+0x5a>
     6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     6d8:	3c 3e                	cmp    $0x3e,%al
     6da:	75 a4                	jne    680 <gettoken+0xc0>
    if(*s == '>'){
     6dc:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     6e0:	74 0d                	je     6ef <gettoken+0x12f>
    s++;
     6e2:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     6e5:	be 3e 00 00 00       	mov    $0x3e,%esi
     6ea:	e9 2b ff ff ff       	jmp    61a <gettoken+0x5a>
      s++;
     6ef:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     6f2:	be 2b 00 00 00       	mov    $0x2b,%esi
     6f7:	e9 1e ff ff ff       	jmp    61a <gettoken+0x5a>
  if(eq)
     6fc:	8b 45 14             	mov    0x14(%ebp),%eax
     6ff:	85 c0                	test   %eax,%eax
     701:	74 05                	je     708 <gettoken+0x148>
    *eq = s;
     703:	8b 45 14             	mov    0x14(%ebp),%eax
     706:	89 18                	mov    %ebx,(%eax)
  while(s < es && strchr(whitespace, *s))
     708:	89 df                	mov    %ebx,%edi
    ret = 'a';
     70a:	be 61 00 00 00       	mov    $0x61,%esi
     70f:	e9 3b ff ff ff       	jmp    64f <gettoken+0x8f>
  if(eq)
     714:	8b 55 14             	mov    0x14(%ebp),%edx
     717:	85 d2                	test   %edx,%edx
     719:	74 ef                	je     70a <gettoken+0x14a>
    *eq = s;
     71b:	8b 45 14             	mov    0x14(%ebp),%eax
     71e:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     720:	eb e8                	jmp    70a <gettoken+0x14a>
     722:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     729:	00 
     72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000730 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     730:	55                   	push   %ebp
     731:	89 e5                	mov    %esp,%ebp
     733:	57                   	push   %edi
     734:	56                   	push   %esi
     735:	53                   	push   %ebx
     736:	83 ec 0c             	sub    $0xc,%esp
     739:	8b 7d 08             	mov    0x8(%ebp),%edi
     73c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     73f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     741:	39 f3                	cmp    %esi,%ebx
     743:	72 12                	jb     757 <peek+0x27>
     745:	eb 28                	jmp    76f <peek+0x3f>
     747:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     74e:	00 
     74f:	90                   	nop
    s++;
     750:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     753:	39 de                	cmp    %ebx,%esi
     755:	74 18                	je     76f <peek+0x3f>
     757:	0f be 03             	movsbl (%ebx),%eax
     75a:	83 ec 08             	sub    $0x8,%esp
     75d:	50                   	push   %eax
     75e:	68 64 1d 00 00       	push   $0x1d64
     763:	e8 98 06 00 00       	call   e00 <strchr>
     768:	83 c4 10             	add    $0x10,%esp
     76b:	85 c0                	test   %eax,%eax
     76d:	75 e1                	jne    750 <peek+0x20>
  *ps = s;
     76f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     771:	0f be 03             	movsbl (%ebx),%eax
     774:	31 d2                	xor    %edx,%edx
     776:	84 c0                	test   %al,%al
     778:	75 0e                	jne    788 <peek+0x58>
}
     77a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     77d:	89 d0                	mov    %edx,%eax
     77f:	5b                   	pop    %ebx
     780:	5e                   	pop    %esi
     781:	5f                   	pop    %edi
     782:	5d                   	pop    %ebp
     783:	c3                   	ret
     784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     788:	83 ec 08             	sub    $0x8,%esp
     78b:	50                   	push   %eax
     78c:	ff 75 10             	push   0x10(%ebp)
     78f:	e8 6c 06 00 00       	call   e00 <strchr>
     794:	83 c4 10             	add    $0x10,%esp
     797:	31 d2                	xor    %edx,%edx
     799:	85 c0                	test   %eax,%eax
     79b:	0f 95 c2             	setne  %dl
}
     79e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7a1:	5b                   	pop    %ebx
     7a2:	89 d0                	mov    %edx,%eax
     7a4:	5e                   	pop    %esi
     7a5:	5f                   	pop    %edi
     7a6:	5d                   	pop    %ebp
     7a7:	c3                   	ret
     7a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     7af:	00 

000007b0 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     7b0:	55                   	push   %ebp
     7b1:	89 e5                	mov    %esp,%ebp
     7b3:	57                   	push   %edi
     7b4:	56                   	push   %esi
     7b5:	53                   	push   %ebx
     7b6:	83 ec 2c             	sub    $0x2c,%esp
     7b9:	8b 75 0c             	mov    0xc(%ebp),%esi
     7bc:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     7bf:	90                   	nop
     7c0:	83 ec 04             	sub    $0x4,%esp
     7c3:	68 5b 15 00 00       	push   $0x155b
     7c8:	53                   	push   %ebx
     7c9:	56                   	push   %esi
     7ca:	e8 61 ff ff ff       	call   730 <peek>
     7cf:	83 c4 10             	add    $0x10,%esp
     7d2:	85 c0                	test   %eax,%eax
     7d4:	0f 84 f6 00 00 00    	je     8d0 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     7da:	6a 00                	push   $0x0
     7dc:	6a 00                	push   $0x0
     7de:	53                   	push   %ebx
     7df:	56                   	push   %esi
     7e0:	e8 db fd ff ff       	call   5c0 <gettoken>
     7e5:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     7e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7ea:	50                   	push   %eax
     7eb:	8d 45 e0             	lea    -0x20(%ebp),%eax
     7ee:	50                   	push   %eax
     7ef:	53                   	push   %ebx
     7f0:	56                   	push   %esi
     7f1:	e8 ca fd ff ff       	call   5c0 <gettoken>
     7f6:	83 c4 20             	add    $0x20,%esp
     7f9:	83 f8 61             	cmp    $0x61,%eax
     7fc:	0f 85 d9 00 00 00    	jne    8db <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     802:	83 ff 3c             	cmp    $0x3c,%edi
     805:	74 69                	je     870 <parseredirs+0xc0>
     807:	83 ff 3e             	cmp    $0x3e,%edi
     80a:	74 05                	je     811 <parseredirs+0x61>
     80c:	83 ff 2b             	cmp    $0x2b,%edi
     80f:	75 af                	jne    7c0 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     811:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     814:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     817:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     81a:	89 55 d0             	mov    %edx,-0x30(%ebp)
     81d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     820:	6a 18                	push   $0x18
     822:	e8 09 0b 00 00       	call   1330 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     827:	83 c4 0c             	add    $0xc,%esp
     82a:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     82c:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     82e:	6a 00                	push   $0x0
     830:	50                   	push   %eax
     831:	e8 aa 05 00 00       	call   de0 <memset>
  cmd->type = REDIR;
     836:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     83c:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     83f:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     842:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     845:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     848:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     84b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     84e:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     855:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     858:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     85f:	89 7d 08             	mov    %edi,0x8(%ebp)
      break;
     862:	e9 59 ff ff ff       	jmp    7c0 <parseredirs+0x10>
     867:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     86e:	00 
     86f:	90                   	nop
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     870:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     873:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     876:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     879:	89 55 d0             	mov    %edx,-0x30(%ebp)
     87c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     87f:	6a 18                	push   $0x18
     881:	e8 aa 0a 00 00       	call   1330 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     886:	83 c4 0c             	add    $0xc,%esp
     889:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     88b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     88d:	6a 00                	push   $0x0
     88f:	50                   	push   %eax
     890:	e8 4b 05 00 00       	call   de0 <memset>
  cmd->cmd = subcmd;
     895:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     898:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     89b:	83 c4 10             	add    $0x10,%esp
  cmd->efile = efile;
     89e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     8a1:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     8a7:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     8aa:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     8ad:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     8b0:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     8b7:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     8be:	89 7d 08             	mov    %edi,0x8(%ebp)
      break;
     8c1:	e9 fa fe ff ff       	jmp    7c0 <parseredirs+0x10>
     8c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     8cd:	00 
     8ce:	66 90                	xchg   %ax,%ax
    }
  }
  return cmd;
}
     8d0:	8b 45 08             	mov    0x8(%ebp),%eax
     8d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8d6:	5b                   	pop    %ebx
     8d7:	5e                   	pop    %esi
     8d8:	5f                   	pop    %edi
     8d9:	5d                   	pop    %ebp
     8da:	c3                   	ret
      panic("missing file for redirection");
     8db:	83 ec 0c             	sub    $0xc,%esp
     8de:	68 3e 15 00 00       	push   $0x153e
     8e3:	e8 d8 f9 ff ff       	call   2c0 <panic>
     8e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     8ef:	00 

000008f0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     8f0:	55                   	push   %ebp
     8f1:	89 e5                	mov    %esp,%ebp
     8f3:	57                   	push   %edi
     8f4:	56                   	push   %esi
     8f5:	53                   	push   %ebx
     8f6:	83 ec 30             	sub    $0x30,%esp
     8f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     8fc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     8ff:	68 5e 15 00 00       	push   $0x155e
     904:	56                   	push   %esi
     905:	53                   	push   %ebx
     906:	e8 25 fe ff ff       	call   730 <peek>
     90b:	83 c4 10             	add    $0x10,%esp
     90e:	85 c0                	test   %eax,%eax
     910:	0f 85 aa 00 00 00    	jne    9c0 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     916:	83 ec 0c             	sub    $0xc,%esp
     919:	89 c7                	mov    %eax,%edi
     91b:	6a 54                	push   $0x54
     91d:	e8 0e 0a 00 00       	call   1330 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     922:	83 c4 0c             	add    $0xc,%esp
     925:	6a 54                	push   $0x54
     927:	6a 00                	push   $0x0
     929:	89 45 d0             	mov    %eax,-0x30(%ebp)
     92c:	50                   	push   %eax
     92d:	e8 ae 04 00 00       	call   de0 <memset>
  cmd->type = EXEC;
     932:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     935:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     938:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     93e:	56                   	push   %esi
     93f:	53                   	push   %ebx
     940:	50                   	push   %eax
     941:	e8 6a fe ff ff       	call   7b0 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     946:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     949:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     94c:	eb 15                	jmp    963 <parseexec+0x73>
     94e:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     950:	83 ec 04             	sub    $0x4,%esp
     953:	56                   	push   %esi
     954:	53                   	push   %ebx
     955:	ff 75 d4             	push   -0x2c(%ebp)
     958:	e8 53 fe ff ff       	call   7b0 <parseredirs>
     95d:	83 c4 10             	add    $0x10,%esp
     960:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     963:	83 ec 04             	sub    $0x4,%esp
     966:	68 75 15 00 00       	push   $0x1575
     96b:	56                   	push   %esi
     96c:	53                   	push   %ebx
     96d:	e8 be fd ff ff       	call   730 <peek>
     972:	83 c4 10             	add    $0x10,%esp
     975:	85 c0                	test   %eax,%eax
     977:	75 5f                	jne    9d8 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     979:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     97c:	50                   	push   %eax
     97d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     980:	50                   	push   %eax
     981:	56                   	push   %esi
     982:	53                   	push   %ebx
     983:	e8 38 fc ff ff       	call   5c0 <gettoken>
     988:	83 c4 10             	add    $0x10,%esp
     98b:	85 c0                	test   %eax,%eax
     98d:	74 49                	je     9d8 <parseexec+0xe8>
    if(tok != 'a')
     98f:	83 f8 61             	cmp    $0x61,%eax
     992:	75 62                	jne    9f6 <parseexec+0x106>
    cmd->argv[argc] = q;
     994:	8b 45 e0             	mov    -0x20(%ebp),%eax
     997:	8b 55 d0             	mov    -0x30(%ebp),%edx
     99a:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     99e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9a1:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     9a5:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     9a8:	83 ff 0a             	cmp    $0xa,%edi
     9ab:	75 a3                	jne    950 <parseexec+0x60>
      panic("too many args");
     9ad:	83 ec 0c             	sub    $0xc,%esp
     9b0:	68 67 15 00 00       	push   $0x1567
     9b5:	e8 06 f9 ff ff       	call   2c0 <panic>
     9ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     9c0:	89 75 0c             	mov    %esi,0xc(%ebp)
     9c3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     9c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c9:	5b                   	pop    %ebx
     9ca:	5e                   	pop    %esi
     9cb:	5f                   	pop    %edi
     9cc:	5d                   	pop    %ebp
    return parseblock(ps, es);
     9cd:	e9 ae 01 00 00       	jmp    b80 <parseblock>
     9d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     9d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     9db:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     9e2:	00 
  cmd->eargv[argc] = 0;
     9e3:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     9ea:	00 
}
     9eb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     9ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9f1:	5b                   	pop    %ebx
     9f2:	5e                   	pop    %esi
     9f3:	5f                   	pop    %edi
     9f4:	5d                   	pop    %ebp
     9f5:	c3                   	ret
      panic("syntax");
     9f6:	83 ec 0c             	sub    $0xc,%esp
     9f9:	68 60 15 00 00       	push   $0x1560
     9fe:	e8 bd f8 ff ff       	call   2c0 <panic>
     a03:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     a0a:	00 
     a0b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000a10 <parsepipe>:
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
     a16:	83 ec 14             	sub    $0x14,%esp
     a19:	8b 75 08             	mov    0x8(%ebp),%esi
     a1c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     a1f:	57                   	push   %edi
     a20:	56                   	push   %esi
     a21:	e8 ca fe ff ff       	call   8f0 <parseexec>
  if(peek(ps, es, "|")){
     a26:	83 c4 0c             	add    $0xc,%esp
     a29:	68 7a 15 00 00       	push   $0x157a
  cmd = parseexec(ps, es);
     a2e:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     a30:	57                   	push   %edi
     a31:	56                   	push   %esi
     a32:	e8 f9 fc ff ff       	call   730 <peek>
     a37:	83 c4 10             	add    $0x10,%esp
     a3a:	85 c0                	test   %eax,%eax
     a3c:	75 12                	jne    a50 <parsepipe+0x40>
}
     a3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a41:	89 d8                	mov    %ebx,%eax
     a43:	5b                   	pop    %ebx
     a44:	5e                   	pop    %esi
     a45:	5f                   	pop    %edi
     a46:	5d                   	pop    %ebp
     a47:	c3                   	ret
     a48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     a4f:	00 
    gettoken(ps, es, 0, 0);
     a50:	6a 00                	push   $0x0
     a52:	6a 00                	push   $0x0
     a54:	57                   	push   %edi
     a55:	56                   	push   %esi
     a56:	e8 65 fb ff ff       	call   5c0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a5b:	58                   	pop    %eax
     a5c:	5a                   	pop    %edx
     a5d:	57                   	push   %edi
     a5e:	56                   	push   %esi
     a5f:	e8 ac ff ff ff       	call   a10 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     a64:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a6b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     a6d:	e8 be 08 00 00       	call   1330 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     a72:	83 c4 0c             	add    $0xc,%esp
     a75:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     a77:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     a79:	6a 00                	push   $0x0
     a7b:	50                   	push   %eax
     a7c:	e8 5f 03 00 00       	call   de0 <memset>
  cmd->left = left;
     a81:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     a84:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a87:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     a89:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     a8f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     a91:	89 7e 08             	mov    %edi,0x8(%esi)
}
     a94:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a97:	5b                   	pop    %ebx
     a98:	5e                   	pop    %esi
     a99:	5f                   	pop    %edi
     a9a:	5d                   	pop    %ebp
     a9b:	c3                   	ret
     a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000aa0 <parseline>:
{
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	57                   	push   %edi
     aa4:	56                   	push   %esi
     aa5:	53                   	push   %ebx
     aa6:	83 ec 24             	sub    $0x24,%esp
     aa9:	8b 75 08             	mov    0x8(%ebp),%esi
     aac:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     aaf:	57                   	push   %edi
     ab0:	56                   	push   %esi
     ab1:	e8 5a ff ff ff       	call   a10 <parsepipe>
  while(peek(ps, es, "&")){
     ab6:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     ab9:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     abb:	eb 3b                	jmp    af8 <parseline+0x58>
     abd:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     ac0:	6a 00                	push   $0x0
     ac2:	6a 00                	push   $0x0
     ac4:	57                   	push   %edi
     ac5:	56                   	push   %esi
     ac6:	e8 f5 fa ff ff       	call   5c0 <gettoken>
  cmd = malloc(sizeof(*cmd));
     acb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     ad2:	e8 59 08 00 00       	call   1330 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     ad7:	83 c4 0c             	add    $0xc,%esp
     ada:	6a 08                	push   $0x8
     adc:	6a 00                	push   $0x0
     ade:	50                   	push   %eax
     adf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     ae2:	e8 f9 02 00 00       	call   de0 <memset>
  cmd->type = BACK;
     ae7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     aea:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     aed:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     af3:	89 5a 04             	mov    %ebx,0x4(%edx)
    cmd = backcmd(cmd);
     af6:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     af8:	83 ec 04             	sub    $0x4,%esp
     afb:	68 7c 15 00 00       	push   $0x157c
     b00:	57                   	push   %edi
     b01:	56                   	push   %esi
     b02:	e8 29 fc ff ff       	call   730 <peek>
     b07:	83 c4 10             	add    $0x10,%esp
     b0a:	85 c0                	test   %eax,%eax
     b0c:	75 b2                	jne    ac0 <parseline+0x20>
  if(peek(ps, es, ";")){
     b0e:	83 ec 04             	sub    $0x4,%esp
     b11:	68 78 15 00 00       	push   $0x1578
     b16:	57                   	push   %edi
     b17:	56                   	push   %esi
     b18:	e8 13 fc ff ff       	call   730 <peek>
     b1d:	83 c4 10             	add    $0x10,%esp
     b20:	85 c0                	test   %eax,%eax
     b22:	75 0c                	jne    b30 <parseline+0x90>
}
     b24:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b27:	89 d8                	mov    %ebx,%eax
     b29:	5b                   	pop    %ebx
     b2a:	5e                   	pop    %esi
     b2b:	5f                   	pop    %edi
     b2c:	5d                   	pop    %ebp
     b2d:	c3                   	ret
     b2e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     b30:	6a 00                	push   $0x0
     b32:	6a 00                	push   $0x0
     b34:	57                   	push   %edi
     b35:	56                   	push   %esi
     b36:	e8 85 fa ff ff       	call   5c0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     b3b:	58                   	pop    %eax
     b3c:	5a                   	pop    %edx
     b3d:	57                   	push   %edi
     b3e:	56                   	push   %esi
     b3f:	e8 5c ff ff ff       	call   aa0 <parseline>
  cmd = malloc(sizeof(*cmd));
     b44:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     b4b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     b4d:	e8 de 07 00 00       	call   1330 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     b52:	83 c4 0c             	add    $0xc,%esp
     b55:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     b57:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     b59:	6a 00                	push   $0x0
     b5b:	50                   	push   %eax
     b5c:	e8 7f 02 00 00       	call   de0 <memset>
  cmd->left = left;
     b61:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     b64:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
     b67:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     b69:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     b6f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     b71:	89 7e 08             	mov    %edi,0x8(%esi)
}
     b74:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b77:	5b                   	pop    %ebx
     b78:	5e                   	pop    %esi
     b79:	5f                   	pop    %edi
     b7a:	5d                   	pop    %ebp
     b7b:	c3                   	ret
     b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b80 <parseblock>:
{
     b80:	55                   	push   %ebp
     b81:	89 e5                	mov    %esp,%ebp
     b83:	57                   	push   %edi
     b84:	56                   	push   %esi
     b85:	53                   	push   %ebx
     b86:	83 ec 10             	sub    $0x10,%esp
     b89:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b8c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     b8f:	68 5e 15 00 00       	push   $0x155e
     b94:	56                   	push   %esi
     b95:	53                   	push   %ebx
     b96:	e8 95 fb ff ff       	call   730 <peek>
     b9b:	83 c4 10             	add    $0x10,%esp
     b9e:	85 c0                	test   %eax,%eax
     ba0:	74 4a                	je     bec <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     ba2:	6a 00                	push   $0x0
     ba4:	6a 00                	push   $0x0
     ba6:	56                   	push   %esi
     ba7:	53                   	push   %ebx
     ba8:	e8 13 fa ff ff       	call   5c0 <gettoken>
  cmd = parseline(ps, es);
     bad:	58                   	pop    %eax
     bae:	5a                   	pop    %edx
     baf:	56                   	push   %esi
     bb0:	53                   	push   %ebx
     bb1:	e8 ea fe ff ff       	call   aa0 <parseline>
  if(!peek(ps, es, ")"))
     bb6:	83 c4 0c             	add    $0xc,%esp
     bb9:	68 9a 15 00 00       	push   $0x159a
  cmd = parseline(ps, es);
     bbe:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     bc0:	56                   	push   %esi
     bc1:	53                   	push   %ebx
     bc2:	e8 69 fb ff ff       	call   730 <peek>
     bc7:	83 c4 10             	add    $0x10,%esp
     bca:	85 c0                	test   %eax,%eax
     bcc:	74 2b                	je     bf9 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     bce:	6a 00                	push   $0x0
     bd0:	6a 00                	push   $0x0
     bd2:	56                   	push   %esi
     bd3:	53                   	push   %ebx
     bd4:	e8 e7 f9 ff ff       	call   5c0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     bd9:	83 c4 0c             	add    $0xc,%esp
     bdc:	56                   	push   %esi
     bdd:	53                   	push   %ebx
     bde:	57                   	push   %edi
     bdf:	e8 cc fb ff ff       	call   7b0 <parseredirs>
}
     be4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     be7:	5b                   	pop    %ebx
     be8:	5e                   	pop    %esi
     be9:	5f                   	pop    %edi
     bea:	5d                   	pop    %ebp
     beb:	c3                   	ret
    panic("parseblock");
     bec:	83 ec 0c             	sub    $0xc,%esp
     bef:	68 7e 15 00 00       	push   $0x157e
     bf4:	e8 c7 f6 ff ff       	call   2c0 <panic>
    panic("syntax - missing )");
     bf9:	83 ec 0c             	sub    $0xc,%esp
     bfc:	68 89 15 00 00       	push   $0x1589
     c01:	e8 ba f6 ff ff       	call   2c0 <panic>
     c06:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c0d:	00 
     c0e:	66 90                	xchg   %ax,%ax

00000c10 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     c10:	55                   	push   %ebp
     c11:	89 e5                	mov    %esp,%ebp
     c13:	53                   	push   %ebx
     c14:	83 ec 04             	sub    $0x4,%esp
     c17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     c1a:	85 db                	test   %ebx,%ebx
     c1c:	74 29                	je     c47 <nulterminate+0x37>
    return 0;

  switch(cmd->type){
     c1e:	83 3b 05             	cmpl   $0x5,(%ebx)
     c21:	77 24                	ja     c47 <nulterminate+0x37>
     c23:	8b 03                	mov    (%ebx),%eax
     c25:	ff 24 85 e8 15 00 00 	jmp    *0x15e8(,%eax,4)
     c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     c30:	83 ec 0c             	sub    $0xc,%esp
     c33:	ff 73 04             	push   0x4(%ebx)
     c36:	e8 d5 ff ff ff       	call   c10 <nulterminate>
    nulterminate(lcmd->right);
     c3b:	58                   	pop    %eax
     c3c:	ff 73 08             	push   0x8(%ebx)
     c3f:	e8 cc ff ff ff       	call   c10 <nulterminate>
    break;
     c44:	83 c4 10             	add    $0x10,%esp
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     c47:	89 d8                	mov    %ebx,%eax
     c49:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c4c:	c9                   	leave
     c4d:	c3                   	ret
     c4e:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     c50:	83 ec 0c             	sub    $0xc,%esp
     c53:	ff 73 04             	push   0x4(%ebx)
     c56:	e8 b5 ff ff ff       	call   c10 <nulterminate>
}
     c5b:	89 d8                	mov    %ebx,%eax
    break;
     c5d:	83 c4 10             	add    $0x10,%esp
}
     c60:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c63:	c9                   	leave
     c64:	c3                   	ret
     c65:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     c68:	8b 4b 04             	mov    0x4(%ebx),%ecx
     c6b:	85 c9                	test   %ecx,%ecx
     c6d:	74 d8                	je     c47 <nulterminate+0x37>
     c6f:	8d 43 08             	lea    0x8(%ebx),%eax
     c72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     c78:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     c7b:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     c7e:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     c81:	8b 50 fc             	mov    -0x4(%eax),%edx
     c84:	85 d2                	test   %edx,%edx
     c86:	75 f0                	jne    c78 <nulterminate+0x68>
}
     c88:	89 d8                	mov    %ebx,%eax
     c8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c8d:	c9                   	leave
     c8e:	c3                   	ret
     c8f:	90                   	nop
    nulterminate(rcmd->cmd);
     c90:	83 ec 0c             	sub    $0xc,%esp
     c93:	ff 73 04             	push   0x4(%ebx)
     c96:	e8 75 ff ff ff       	call   c10 <nulterminate>
    *rcmd->efile = 0;
     c9b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     c9e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     ca1:	c6 00 00             	movb   $0x0,(%eax)
}
     ca4:	89 d8                	mov    %ebx,%eax
     ca6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ca9:	c9                   	leave
     caa:	c3                   	ret
     cab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000cb0 <parsecmd>:
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	57                   	push   %edi
     cb4:	56                   	push   %esi
  cmd = parseline(&s, es);
     cb5:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     cb8:	53                   	push   %ebx
     cb9:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     cbc:	8b 5d 08             	mov    0x8(%ebp),%ebx
     cbf:	53                   	push   %ebx
     cc0:	e8 eb 00 00 00       	call   db0 <strlen>
  cmd = parseline(&s, es);
     cc5:	59                   	pop    %ecx
     cc6:	5e                   	pop    %esi
  es = s + strlen(s);
     cc7:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     cc9:	53                   	push   %ebx
     cca:	57                   	push   %edi
     ccb:	e8 d0 fd ff ff       	call   aa0 <parseline>
  peek(&s, es, "");
     cd0:	83 c4 0c             	add    $0xc,%esp
     cd3:	68 28 15 00 00       	push   $0x1528
  cmd = parseline(&s, es);
     cd8:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     cda:	53                   	push   %ebx
     cdb:	57                   	push   %edi
     cdc:	e8 4f fa ff ff       	call   730 <peek>
  if(s != es){
     ce1:	8b 45 08             	mov    0x8(%ebp),%eax
     ce4:	83 c4 10             	add    $0x10,%esp
     ce7:	39 d8                	cmp    %ebx,%eax
     ce9:	75 13                	jne    cfe <parsecmd+0x4e>
  nulterminate(cmd);
     ceb:	83 ec 0c             	sub    $0xc,%esp
     cee:	56                   	push   %esi
     cef:	e8 1c ff ff ff       	call   c10 <nulterminate>
}
     cf4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cf7:	89 f0                	mov    %esi,%eax
     cf9:	5b                   	pop    %ebx
     cfa:	5e                   	pop    %esi
     cfb:	5f                   	pop    %edi
     cfc:	5d                   	pop    %ebp
     cfd:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     cfe:	52                   	push   %edx
     cff:	50                   	push   %eax
     d00:	68 9c 15 00 00       	push   $0x159c
     d05:	6a 02                	push   $0x2
     d07:	e8 04 04 00 00       	call   1110 <printf>
    panic("syntax");
     d0c:	c7 04 24 60 15 00 00 	movl   $0x1560,(%esp)
     d13:	e8 a8 f5 ff ff       	call   2c0 <panic>
     d18:	66 90                	xchg   %ax,%ax
     d1a:	66 90                	xchg   %ax,%ax
     d1c:	66 90                	xchg   %ax,%ax
     d1e:	66 90                	xchg   %ax,%ax

00000d20 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     d20:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     d21:	31 c0                	xor    %eax,%eax
{
     d23:	89 e5                	mov    %esp,%ebp
     d25:	53                   	push   %ebx
     d26:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d29:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     d30:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     d34:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     d37:	83 c0 01             	add    $0x1,%eax
     d3a:	84 d2                	test   %dl,%dl
     d3c:	75 f2                	jne    d30 <strcpy+0x10>
    ;
  return os;
}
     d3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d41:	89 c8                	mov    %ecx,%eax
     d43:	c9                   	leave
     d44:	c3                   	ret
     d45:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     d4c:	00 
     d4d:	8d 76 00             	lea    0x0(%esi),%esi

00000d50 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     d50:	55                   	push   %ebp
     d51:	89 e5                	mov    %esp,%ebp
     d53:	53                   	push   %ebx
     d54:	8b 55 08             	mov    0x8(%ebp),%edx
     d57:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     d5a:	0f b6 02             	movzbl (%edx),%eax
     d5d:	84 c0                	test   %al,%al
     d5f:	75 17                	jne    d78 <strcmp+0x28>
     d61:	eb 3a                	jmp    d9d <strcmp+0x4d>
     d63:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     d68:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     d6c:	83 c2 01             	add    $0x1,%edx
     d6f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     d72:	84 c0                	test   %al,%al
     d74:	74 1a                	je     d90 <strcmp+0x40>
     d76:	89 d9                	mov    %ebx,%ecx
     d78:	0f b6 19             	movzbl (%ecx),%ebx
     d7b:	38 c3                	cmp    %al,%bl
     d7d:	74 e9                	je     d68 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     d7f:	29 d8                	sub    %ebx,%eax
}
     d81:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d84:	c9                   	leave
     d85:	c3                   	ret
     d86:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     d8d:	00 
     d8e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
     d90:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     d94:	31 c0                	xor    %eax,%eax
     d96:	29 d8                	sub    %ebx,%eax
}
     d98:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d9b:	c9                   	leave
     d9c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     d9d:	0f b6 19             	movzbl (%ecx),%ebx
     da0:	31 c0                	xor    %eax,%eax
     da2:	eb db                	jmp    d7f <strcmp+0x2f>
     da4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     dab:	00 
     dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000db0 <strlen>:

uint
strlen(const char *s)
{
     db0:	55                   	push   %ebp
     db1:	89 e5                	mov    %esp,%ebp
     db3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     db6:	80 3a 00             	cmpb   $0x0,(%edx)
     db9:	74 15                	je     dd0 <strlen+0x20>
     dbb:	31 c0                	xor    %eax,%eax
     dbd:	8d 76 00             	lea    0x0(%esi),%esi
     dc0:	83 c0 01             	add    $0x1,%eax
     dc3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     dc7:	89 c1                	mov    %eax,%ecx
     dc9:	75 f5                	jne    dc0 <strlen+0x10>
    ;
  return n;
}
     dcb:	89 c8                	mov    %ecx,%eax
     dcd:	5d                   	pop    %ebp
     dce:	c3                   	ret
     dcf:	90                   	nop
  for(n = 0; s[n]; n++)
     dd0:	31 c9                	xor    %ecx,%ecx
}
     dd2:	5d                   	pop    %ebp
     dd3:	89 c8                	mov    %ecx,%eax
     dd5:	c3                   	ret
     dd6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     ddd:	00 
     dde:	66 90                	xchg   %ax,%ax

00000de0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     de0:	55                   	push   %ebp
     de1:	89 e5                	mov    %esp,%ebp
     de3:	57                   	push   %edi
     de4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     de7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     dea:	8b 45 0c             	mov    0xc(%ebp),%eax
     ded:	89 d7                	mov    %edx,%edi
     def:	fc                   	cld
     df0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     df2:	8b 7d fc             	mov    -0x4(%ebp),%edi
     df5:	89 d0                	mov    %edx,%eax
     df7:	c9                   	leave
     df8:	c3                   	ret
     df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000e00 <strchr>:

char*
strchr(const char *s, char c)
{
     e00:	55                   	push   %ebp
     e01:	89 e5                	mov    %esp,%ebp
     e03:	8b 45 08             	mov    0x8(%ebp),%eax
     e06:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     e0a:	0f b6 10             	movzbl (%eax),%edx
     e0d:	84 d2                	test   %dl,%dl
     e0f:	75 12                	jne    e23 <strchr+0x23>
     e11:	eb 1d                	jmp    e30 <strchr+0x30>
     e13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     e18:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     e1c:	83 c0 01             	add    $0x1,%eax
     e1f:	84 d2                	test   %dl,%dl
     e21:	74 0d                	je     e30 <strchr+0x30>
    if(*s == c)
     e23:	38 d1                	cmp    %dl,%cl
     e25:	75 f1                	jne    e18 <strchr+0x18>
      return (char*)s;
  return 0;
}
     e27:	5d                   	pop    %ebp
     e28:	c3                   	ret
     e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     e30:	31 c0                	xor    %eax,%eax
}
     e32:	5d                   	pop    %ebp
     e33:	c3                   	ret
     e34:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e3b:	00 
     e3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e40 <gets>:

char*
gets(char *buf, int max)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     e45:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
     e48:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     e49:	31 db                	xor    %ebx,%ebx
{
     e4b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     e4e:	eb 27                	jmp    e77 <gets+0x37>
    cc = read(0, &c, 1);
     e50:	83 ec 04             	sub    $0x4,%esp
     e53:	6a 01                	push   $0x1
     e55:	56                   	push   %esi
     e56:	6a 00                	push   $0x0
     e58:	e8 6a 01 00 00       	call   fc7 <read>
    if(cc < 1)
     e5d:	83 c4 10             	add    $0x10,%esp
     e60:	85 c0                	test   %eax,%eax
     e62:	7e 1d                	jle    e81 <gets+0x41>
      break;
    buf[i++] = c;
     e64:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     e68:	8b 55 08             	mov    0x8(%ebp),%edx
     e6b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     e6f:	3c 0a                	cmp    $0xa,%al
     e71:	74 10                	je     e83 <gets+0x43>
     e73:	3c 0d                	cmp    $0xd,%al
     e75:	74 0c                	je     e83 <gets+0x43>
  for(i=0; i+1 < max; ){
     e77:	89 df                	mov    %ebx,%edi
     e79:	83 c3 01             	add    $0x1,%ebx
     e7c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     e7f:	7c cf                	jl     e50 <gets+0x10>
     e81:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
     e83:	8b 45 08             	mov    0x8(%ebp),%eax
     e86:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     e8a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e8d:	5b                   	pop    %ebx
     e8e:	5e                   	pop    %esi
     e8f:	5f                   	pop    %edi
     e90:	5d                   	pop    %ebp
     e91:	c3                   	ret
     e92:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e99:	00 
     e9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ea0 <stat>:

int
stat(const char *n, struct stat *st)
{
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
     ea3:	56                   	push   %esi
     ea4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     ea5:	83 ec 08             	sub    $0x8,%esp
     ea8:	6a 00                	push   $0x0
     eaa:	ff 75 08             	push   0x8(%ebp)
     ead:	e8 3d 01 00 00       	call   fef <open>
  if(fd < 0)
     eb2:	83 c4 10             	add    $0x10,%esp
     eb5:	85 c0                	test   %eax,%eax
     eb7:	78 27                	js     ee0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     eb9:	83 ec 08             	sub    $0x8,%esp
     ebc:	ff 75 0c             	push   0xc(%ebp)
     ebf:	89 c3                	mov    %eax,%ebx
     ec1:	50                   	push   %eax
     ec2:	e8 40 01 00 00       	call   1007 <fstat>
  close(fd);
     ec7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     eca:	89 c6                	mov    %eax,%esi
  close(fd);
     ecc:	e8 06 01 00 00       	call   fd7 <close>
  return r;
     ed1:	83 c4 10             	add    $0x10,%esp
}
     ed4:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ed7:	89 f0                	mov    %esi,%eax
     ed9:	5b                   	pop    %ebx
     eda:	5e                   	pop    %esi
     edb:	5d                   	pop    %ebp
     edc:	c3                   	ret
     edd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     ee0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     ee5:	eb ed                	jmp    ed4 <stat+0x34>
     ee7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     eee:	00 
     eef:	90                   	nop

00000ef0 <atoi>:

int
atoi(const char *s)
{
     ef0:	55                   	push   %ebp
     ef1:	89 e5                	mov    %esp,%ebp
     ef3:	53                   	push   %ebx
     ef4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     ef7:	0f be 02             	movsbl (%edx),%eax
     efa:	8d 48 d0             	lea    -0x30(%eax),%ecx
     efd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     f00:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     f05:	77 1e                	ja     f25 <atoi+0x35>
     f07:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f0e:	00 
     f0f:	90                   	nop
    n = n*10 + *s++ - '0';
     f10:	83 c2 01             	add    $0x1,%edx
     f13:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     f16:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     f1a:	0f be 02             	movsbl (%edx),%eax
     f1d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     f20:	80 fb 09             	cmp    $0x9,%bl
     f23:	76 eb                	jbe    f10 <atoi+0x20>
  return n;
}
     f25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f28:	89 c8                	mov    %ecx,%eax
     f2a:	c9                   	leave
     f2b:	c3                   	ret
     f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000f30 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     f30:	55                   	push   %ebp
     f31:	89 e5                	mov    %esp,%ebp
     f33:	57                   	push   %edi
     f34:	8b 45 10             	mov    0x10(%ebp),%eax
     f37:	8b 55 08             	mov    0x8(%ebp),%edx
     f3a:	56                   	push   %esi
     f3b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     f3e:	85 c0                	test   %eax,%eax
     f40:	7e 13                	jle    f55 <memmove+0x25>
     f42:	01 d0                	add    %edx,%eax
  dst = vdst;
     f44:	89 d7                	mov    %edx,%edi
     f46:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f4d:	00 
     f4e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
     f50:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     f51:	39 f8                	cmp    %edi,%eax
     f53:	75 fb                	jne    f50 <memmove+0x20>
  return vdst;
}
     f55:	5e                   	pop    %esi
     f56:	89 d0                	mov    %edx,%eax
     f58:	5f                   	pop    %edi
     f59:	5d                   	pop    %ebp
     f5a:	c3                   	ret
     f5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000f60 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
     f60:	55                   	push   %ebp
     f61:	89 e5                	mov    %esp,%ebp
     f63:	53                   	push   %ebx
     f64:	8b 55 10             	mov    0x10(%ebp),%edx
     f67:	8b 45 08             	mov    0x8(%ebp),%eax
     f6a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(n > 0 && *p && *p == *q)
     f6d:	85 d2                	test   %edx,%edx
     f6f:	75 16                	jne    f87 <strncmp+0x27>
     f71:	eb 2d                	jmp    fa0 <strncmp+0x40>
     f73:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     f78:	3a 19                	cmp    (%ecx),%bl
     f7a:	75 12                	jne    f8e <strncmp+0x2e>
    n--, p++, q++;
     f7c:	83 c0 01             	add    $0x1,%eax
     f7f:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
     f82:	83 ea 01             	sub    $0x1,%edx
     f85:	74 19                	je     fa0 <strncmp+0x40>
     f87:	0f b6 18             	movzbl (%eax),%ebx
     f8a:	84 db                	test   %bl,%bl
     f8c:	75 ea                	jne    f78 <strncmp+0x18>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
     f8e:	0f b6 00             	movzbl (%eax),%eax
     f91:	0f b6 11             	movzbl (%ecx),%edx
}
     f94:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f97:	c9                   	leave
  return (uchar)*p - (uchar)*q;
     f98:	29 d0                	sub    %edx,%eax
}
     f9a:	c3                   	ret
     f9b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     fa0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
     fa3:	31 c0                	xor    %eax,%eax
}
     fa5:	c9                   	leave
     fa6:	c3                   	ret

00000fa7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     fa7:	b8 01 00 00 00       	mov    $0x1,%eax
     fac:	cd 40                	int    $0x40
     fae:	c3                   	ret

00000faf <exit>:
SYSCALL(exit)
     faf:	b8 02 00 00 00       	mov    $0x2,%eax
     fb4:	cd 40                	int    $0x40
     fb6:	c3                   	ret

00000fb7 <wait>:
SYSCALL(wait)
     fb7:	b8 03 00 00 00       	mov    $0x3,%eax
     fbc:	cd 40                	int    $0x40
     fbe:	c3                   	ret

00000fbf <pipe>:
SYSCALL(pipe)
     fbf:	b8 04 00 00 00       	mov    $0x4,%eax
     fc4:	cd 40                	int    $0x40
     fc6:	c3                   	ret

00000fc7 <read>:
SYSCALL(read)
     fc7:	b8 05 00 00 00       	mov    $0x5,%eax
     fcc:	cd 40                	int    $0x40
     fce:	c3                   	ret

00000fcf <write>:
SYSCALL(write)
     fcf:	b8 10 00 00 00       	mov    $0x10,%eax
     fd4:	cd 40                	int    $0x40
     fd6:	c3                   	ret

00000fd7 <close>:
SYSCALL(close)
     fd7:	b8 15 00 00 00       	mov    $0x15,%eax
     fdc:	cd 40                	int    $0x40
     fde:	c3                   	ret

00000fdf <kill>:
SYSCALL(kill)
     fdf:	b8 06 00 00 00       	mov    $0x6,%eax
     fe4:	cd 40                	int    $0x40
     fe6:	c3                   	ret

00000fe7 <exec>:
SYSCALL(exec)
     fe7:	b8 07 00 00 00       	mov    $0x7,%eax
     fec:	cd 40                	int    $0x40
     fee:	c3                   	ret

00000fef <open>:
SYSCALL(open)
     fef:	b8 0f 00 00 00       	mov    $0xf,%eax
     ff4:	cd 40                	int    $0x40
     ff6:	c3                   	ret

00000ff7 <mknod>:
SYSCALL(mknod)
     ff7:	b8 11 00 00 00       	mov    $0x11,%eax
     ffc:	cd 40                	int    $0x40
     ffe:	c3                   	ret

00000fff <unlink>:
SYSCALL(unlink)
     fff:	b8 12 00 00 00       	mov    $0x12,%eax
    1004:	cd 40                	int    $0x40
    1006:	c3                   	ret

00001007 <fstat>:
SYSCALL(fstat)
    1007:	b8 08 00 00 00       	mov    $0x8,%eax
    100c:	cd 40                	int    $0x40
    100e:	c3                   	ret

0000100f <link>:
SYSCALL(link)
    100f:	b8 13 00 00 00       	mov    $0x13,%eax
    1014:	cd 40                	int    $0x40
    1016:	c3                   	ret

00001017 <mkdir>:
SYSCALL(mkdir)
    1017:	b8 14 00 00 00       	mov    $0x14,%eax
    101c:	cd 40                	int    $0x40
    101e:	c3                   	ret

0000101f <chdir>:
SYSCALL(chdir)
    101f:	b8 09 00 00 00       	mov    $0x9,%eax
    1024:	cd 40                	int    $0x40
    1026:	c3                   	ret

00001027 <dup>:
SYSCALL(dup)
    1027:	b8 0a 00 00 00       	mov    $0xa,%eax
    102c:	cd 40                	int    $0x40
    102e:	c3                   	ret

0000102f <getpid>:
SYSCALL(getpid)
    102f:	b8 0b 00 00 00       	mov    $0xb,%eax
    1034:	cd 40                	int    $0x40
    1036:	c3                   	ret

00001037 <sbrk>:
SYSCALL(sbrk)
    1037:	b8 0c 00 00 00       	mov    $0xc,%eax
    103c:	cd 40                	int    $0x40
    103e:	c3                   	ret

0000103f <sleep>:
SYSCALL(sleep)
    103f:	b8 0d 00 00 00       	mov    $0xd,%eax
    1044:	cd 40                	int    $0x40
    1046:	c3                   	ret

00001047 <uptime>:
SYSCALL(uptime)
    1047:	b8 0e 00 00 00       	mov    $0xe,%eax
    104c:	cd 40                	int    $0x40
    104e:	c3                   	ret

0000104f <getprocs>:
SYSCALL(getprocs)
    104f:	b8 16 00 00 00       	mov    $0x16,%eax
    1054:	cd 40                	int    $0x40
    1056:	c3                   	ret

00001057 <clone>:
SYSCALL(clone)
    1057:	b8 17 00 00 00       	mov    $0x17,%eax
    105c:	cd 40                	int    $0x40
    105e:	c3                   	ret

0000105f <join>:
SYSCALL(join)
    105f:	b8 18 00 00 00       	mov    $0x18,%eax
    1064:	cd 40                	int    $0x40
    1066:	c3                   	ret
    1067:	66 90                	xchg   %ax,%ax
    1069:	66 90                	xchg   %ax,%ax
    106b:	66 90                	xchg   %ax,%ax
    106d:	66 90                	xchg   %ax,%ax
    106f:	90                   	nop

00001070 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1070:	55                   	push   %ebp
    1071:	89 e5                	mov    %esp,%ebp
    1073:	57                   	push   %edi
    1074:	56                   	push   %esi
    1075:	53                   	push   %ebx
    1076:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    1078:	89 d1                	mov    %edx,%ecx
{
    107a:	83 ec 3c             	sub    $0x3c,%esp
    107d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
    1080:	85 d2                	test   %edx,%edx
    1082:	0f 89 80 00 00 00    	jns    1108 <printint+0x98>
    1088:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    108c:	74 7a                	je     1108 <printint+0x98>
    x = -xx;
    108e:	f7 d9                	neg    %ecx
    neg = 1;
    1090:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
    1095:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    1098:	31 f6                	xor    %esi,%esi
    109a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    10a0:	89 c8                	mov    %ecx,%eax
    10a2:	31 d2                	xor    %edx,%edx
    10a4:	89 f7                	mov    %esi,%edi
    10a6:	f7 f3                	div    %ebx
    10a8:	8d 76 01             	lea    0x1(%esi),%esi
    10ab:	0f b6 92 58 16 00 00 	movzbl 0x1658(%edx),%edx
    10b2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
    10b6:	89 ca                	mov    %ecx,%edx
    10b8:	89 c1                	mov    %eax,%ecx
    10ba:	39 da                	cmp    %ebx,%edx
    10bc:	73 e2                	jae    10a0 <printint+0x30>
  if(neg)
    10be:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    10c1:	85 c0                	test   %eax,%eax
    10c3:	74 07                	je     10cc <printint+0x5c>
    buf[i++] = '-';
    10c5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
    10ca:	89 f7                	mov    %esi,%edi
    10cc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    10cf:	8b 75 c0             	mov    -0x40(%ebp),%esi
    10d2:	01 df                	add    %ebx,%edi
    10d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
    10d8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
    10db:	83 ec 04             	sub    $0x4,%esp
    10de:	88 45 d7             	mov    %al,-0x29(%ebp)
    10e1:	8d 45 d7             	lea    -0x29(%ebp),%eax
    10e4:	6a 01                	push   $0x1
    10e6:	50                   	push   %eax
    10e7:	56                   	push   %esi
    10e8:	e8 e2 fe ff ff       	call   fcf <write>
  while(--i >= 0)
    10ed:	89 f8                	mov    %edi,%eax
    10ef:	83 c4 10             	add    $0x10,%esp
    10f2:	83 ef 01             	sub    $0x1,%edi
    10f5:	39 c3                	cmp    %eax,%ebx
    10f7:	75 df                	jne    10d8 <printint+0x68>
}
    10f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10fc:	5b                   	pop    %ebx
    10fd:	5e                   	pop    %esi
    10fe:	5f                   	pop    %edi
    10ff:	5d                   	pop    %ebp
    1100:	c3                   	ret
    1101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1108:	31 c0                	xor    %eax,%eax
    110a:	eb 89                	jmp    1095 <printint+0x25>
    110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001110 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	57                   	push   %edi
    1114:	56                   	push   %esi
    1115:	53                   	push   %ebx
    1116:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1119:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    111c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    111f:	0f b6 1e             	movzbl (%esi),%ebx
    1122:	83 c6 01             	add    $0x1,%esi
    1125:	84 db                	test   %bl,%bl
    1127:	74 67                	je     1190 <printf+0x80>
    1129:	8d 4d 10             	lea    0x10(%ebp),%ecx
    112c:	31 d2                	xor    %edx,%edx
    112e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    1131:	eb 34                	jmp    1167 <printf+0x57>
    1133:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    1138:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    113b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1140:	83 f8 25             	cmp    $0x25,%eax
    1143:	74 18                	je     115d <printf+0x4d>
  write(fd, &c, 1);
    1145:	83 ec 04             	sub    $0x4,%esp
    1148:	8d 45 e7             	lea    -0x19(%ebp),%eax
    114b:	88 5d e7             	mov    %bl,-0x19(%ebp)
    114e:	6a 01                	push   $0x1
    1150:	50                   	push   %eax
    1151:	57                   	push   %edi
    1152:	e8 78 fe ff ff       	call   fcf <write>
    1157:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    115a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    115d:	0f b6 1e             	movzbl (%esi),%ebx
    1160:	83 c6 01             	add    $0x1,%esi
    1163:	84 db                	test   %bl,%bl
    1165:	74 29                	je     1190 <printf+0x80>
    c = fmt[i] & 0xff;
    1167:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    116a:	85 d2                	test   %edx,%edx
    116c:	74 ca                	je     1138 <printf+0x28>
      }
    } else if(state == '%'){
    116e:	83 fa 25             	cmp    $0x25,%edx
    1171:	75 ea                	jne    115d <printf+0x4d>
      if(c == 'd'){
    1173:	83 f8 25             	cmp    $0x25,%eax
    1176:	0f 84 04 01 00 00    	je     1280 <printf+0x170>
    117c:	83 e8 63             	sub    $0x63,%eax
    117f:	83 f8 15             	cmp    $0x15,%eax
    1182:	77 1c                	ja     11a0 <printf+0x90>
    1184:	ff 24 85 00 16 00 00 	jmp    *0x1600(,%eax,4)
    118b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1190:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1193:	5b                   	pop    %ebx
    1194:	5e                   	pop    %esi
    1195:	5f                   	pop    %edi
    1196:	5d                   	pop    %ebp
    1197:	c3                   	ret
    1198:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    119f:	00 
  write(fd, &c, 1);
    11a0:	83 ec 04             	sub    $0x4,%esp
    11a3:	8d 55 e7             	lea    -0x19(%ebp),%edx
    11a6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    11aa:	6a 01                	push   $0x1
    11ac:	52                   	push   %edx
    11ad:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    11b0:	57                   	push   %edi
    11b1:	e8 19 fe ff ff       	call   fcf <write>
    11b6:	83 c4 0c             	add    $0xc,%esp
    11b9:	88 5d e7             	mov    %bl,-0x19(%ebp)
    11bc:	6a 01                	push   $0x1
    11be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    11c1:	52                   	push   %edx
    11c2:	57                   	push   %edi
    11c3:	e8 07 fe ff ff       	call   fcf <write>
        putc(fd, c);
    11c8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    11cb:	31 d2                	xor    %edx,%edx
    11cd:	eb 8e                	jmp    115d <printf+0x4d>
    11cf:	90                   	nop
        printint(fd, *ap, 16, 0);
    11d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    11d3:	83 ec 0c             	sub    $0xc,%esp
    11d6:	b9 10 00 00 00       	mov    $0x10,%ecx
    11db:	8b 13                	mov    (%ebx),%edx
    11dd:	6a 00                	push   $0x0
    11df:	89 f8                	mov    %edi,%eax
        ap++;
    11e1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
    11e4:	e8 87 fe ff ff       	call   1070 <printint>
        ap++;
    11e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    11ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
    11ef:	31 d2                	xor    %edx,%edx
    11f1:	e9 67 ff ff ff       	jmp    115d <printf+0x4d>
        s = (char*)*ap;
    11f6:	8b 45 d0             	mov    -0x30(%ebp),%eax
    11f9:	8b 18                	mov    (%eax),%ebx
        ap++;
    11fb:	83 c0 04             	add    $0x4,%eax
    11fe:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1201:	85 db                	test   %ebx,%ebx
    1203:	0f 84 87 00 00 00    	je     1290 <printf+0x180>
        while(*s != 0){
    1209:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    120c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    120e:	84 c0                	test   %al,%al
    1210:	0f 84 47 ff ff ff    	je     115d <printf+0x4d>
    1216:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1219:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    121c:	89 de                	mov    %ebx,%esi
    121e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
    1220:	83 ec 04             	sub    $0x4,%esp
    1223:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    1226:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1229:	6a 01                	push   $0x1
    122b:	53                   	push   %ebx
    122c:	57                   	push   %edi
    122d:	e8 9d fd ff ff       	call   fcf <write>
        while(*s != 0){
    1232:	0f b6 06             	movzbl (%esi),%eax
    1235:	83 c4 10             	add    $0x10,%esp
    1238:	84 c0                	test   %al,%al
    123a:	75 e4                	jne    1220 <printf+0x110>
      state = 0;
    123c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    123f:	31 d2                	xor    %edx,%edx
    1241:	e9 17 ff ff ff       	jmp    115d <printf+0x4d>
        printint(fd, *ap, 10, 1);
    1246:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1249:	83 ec 0c             	sub    $0xc,%esp
    124c:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1251:	8b 13                	mov    (%ebx),%edx
    1253:	6a 01                	push   $0x1
    1255:	eb 88                	jmp    11df <printf+0xcf>
        putc(fd, *ap);
    1257:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    125a:	83 ec 04             	sub    $0x4,%esp
    125d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    1260:	8b 03                	mov    (%ebx),%eax
        ap++;
    1262:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    1265:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1268:	6a 01                	push   $0x1
    126a:	52                   	push   %edx
    126b:	57                   	push   %edi
    126c:	e8 5e fd ff ff       	call   fcf <write>
        ap++;
    1271:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1274:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1277:	31 d2                	xor    %edx,%edx
    1279:	e9 df fe ff ff       	jmp    115d <printf+0x4d>
    127e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
    1280:	83 ec 04             	sub    $0x4,%esp
    1283:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1286:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1289:	6a 01                	push   $0x1
    128b:	e9 31 ff ff ff       	jmp    11c1 <printf+0xb1>
    1290:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    1295:	bb c9 15 00 00       	mov    $0x15c9,%ebx
    129a:	e9 77 ff ff ff       	jmp    1216 <printf+0x106>
    129f:	90                   	nop

000012a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12a1:	a1 e4 25 00 00       	mov    0x25e4,%eax
{
    12a6:	89 e5                	mov    %esp,%ebp
    12a8:	57                   	push   %edi
    12a9:	56                   	push   %esi
    12aa:	53                   	push   %ebx
    12ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    12ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12b8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12ba:	39 c8                	cmp    %ecx,%eax
    12bc:	73 32                	jae    12f0 <free+0x50>
    12be:	39 d1                	cmp    %edx,%ecx
    12c0:	72 04                	jb     12c6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12c2:	39 d0                	cmp    %edx,%eax
    12c4:	72 32                	jb     12f8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    12c6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12c9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12cc:	39 fa                	cmp    %edi,%edx
    12ce:	74 30                	je     1300 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    12d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    12d3:	8b 50 04             	mov    0x4(%eax),%edx
    12d6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    12d9:	39 f1                	cmp    %esi,%ecx
    12db:	74 3a                	je     1317 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    12dd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    12df:	5b                   	pop    %ebx
  freep = p;
    12e0:	a3 e4 25 00 00       	mov    %eax,0x25e4
}
    12e5:	5e                   	pop    %esi
    12e6:	5f                   	pop    %edi
    12e7:	5d                   	pop    %ebp
    12e8:	c3                   	ret
    12e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12f0:	39 d0                	cmp    %edx,%eax
    12f2:	72 04                	jb     12f8 <free+0x58>
    12f4:	39 d1                	cmp    %edx,%ecx
    12f6:	72 ce                	jb     12c6 <free+0x26>
{
    12f8:	89 d0                	mov    %edx,%eax
    12fa:	eb bc                	jmp    12b8 <free+0x18>
    12fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1300:	03 72 04             	add    0x4(%edx),%esi
    1303:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1306:	8b 10                	mov    (%eax),%edx
    1308:	8b 12                	mov    (%edx),%edx
    130a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    130d:	8b 50 04             	mov    0x4(%eax),%edx
    1310:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1313:	39 f1                	cmp    %esi,%ecx
    1315:	75 c6                	jne    12dd <free+0x3d>
    p->s.size += bp->s.size;
    1317:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    131a:	a3 e4 25 00 00       	mov    %eax,0x25e4
    p->s.size += bp->s.size;
    131f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1322:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1325:	89 08                	mov    %ecx,(%eax)
}
    1327:	5b                   	pop    %ebx
    1328:	5e                   	pop    %esi
    1329:	5f                   	pop    %edi
    132a:	5d                   	pop    %ebp
    132b:	c3                   	ret
    132c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001330 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	57                   	push   %edi
    1334:	56                   	push   %esi
    1335:	53                   	push   %ebx
    1336:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1339:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    133c:	8b 15 e4 25 00 00    	mov    0x25e4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1342:	8d 78 07             	lea    0x7(%eax),%edi
    1345:	c1 ef 03             	shr    $0x3,%edi
    1348:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    134b:	85 d2                	test   %edx,%edx
    134d:	0f 84 8d 00 00 00    	je     13e0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1353:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1355:	8b 48 04             	mov    0x4(%eax),%ecx
    1358:	39 f9                	cmp    %edi,%ecx
    135a:	73 64                	jae    13c0 <malloc+0x90>
  if(nu < 4096)
    135c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1361:	39 df                	cmp    %ebx,%edi
    1363:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1366:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    136d:	eb 0a                	jmp    1379 <malloc+0x49>
    136f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1370:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1372:	8b 48 04             	mov    0x4(%eax),%ecx
    1375:	39 f9                	cmp    %edi,%ecx
    1377:	73 47                	jae    13c0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1379:	89 c2                	mov    %eax,%edx
    137b:	3b 05 e4 25 00 00    	cmp    0x25e4,%eax
    1381:	75 ed                	jne    1370 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    1383:	83 ec 0c             	sub    $0xc,%esp
    1386:	56                   	push   %esi
    1387:	e8 ab fc ff ff       	call   1037 <sbrk>
  if(p == (char*)-1)
    138c:	83 c4 10             	add    $0x10,%esp
    138f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1392:	74 1c                	je     13b0 <malloc+0x80>
  hp->s.size = nu;
    1394:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1397:	83 ec 0c             	sub    $0xc,%esp
    139a:	83 c0 08             	add    $0x8,%eax
    139d:	50                   	push   %eax
    139e:	e8 fd fe ff ff       	call   12a0 <free>
  return freep;
    13a3:	8b 15 e4 25 00 00    	mov    0x25e4,%edx
      if((p = morecore(nunits)) == 0)
    13a9:	83 c4 10             	add    $0x10,%esp
    13ac:	85 d2                	test   %edx,%edx
    13ae:	75 c0                	jne    1370 <malloc+0x40>
        return 0;
  }
}
    13b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    13b3:	31 c0                	xor    %eax,%eax
}
    13b5:	5b                   	pop    %ebx
    13b6:	5e                   	pop    %esi
    13b7:	5f                   	pop    %edi
    13b8:	5d                   	pop    %ebp
    13b9:	c3                   	ret
    13ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    13c0:	39 cf                	cmp    %ecx,%edi
    13c2:	74 4c                	je     1410 <malloc+0xe0>
        p->s.size -= nunits;
    13c4:	29 f9                	sub    %edi,%ecx
    13c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    13c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    13cc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    13cf:	89 15 e4 25 00 00    	mov    %edx,0x25e4
}
    13d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    13d8:	83 c0 08             	add    $0x8,%eax
}
    13db:	5b                   	pop    %ebx
    13dc:	5e                   	pop    %esi
    13dd:	5f                   	pop    %edi
    13de:	5d                   	pop    %ebp
    13df:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    13e0:	c7 05 e4 25 00 00 e8 	movl   $0x25e8,0x25e4
    13e7:	25 00 00 
    base.s.size = 0;
    13ea:	b8 e8 25 00 00       	mov    $0x25e8,%eax
    base.s.ptr = freep = prevp = &base;
    13ef:	c7 05 e8 25 00 00 e8 	movl   $0x25e8,0x25e8
    13f6:	25 00 00 
    base.s.size = 0;
    13f9:	c7 05 ec 25 00 00 00 	movl   $0x0,0x25ec
    1400:	00 00 00 
    if(p->s.size >= nunits){
    1403:	e9 54 ff ff ff       	jmp    135c <malloc+0x2c>
    1408:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    140f:	00 
        prevp->s.ptr = p->s.ptr;
    1410:	8b 08                	mov    (%eax),%ecx
    1412:	89 0a                	mov    %ecx,(%edx)
    1414:	eb b9                	jmp    13cf <malloc+0x9f>
    1416:	66 90                	xchg   %ax,%ax
    1418:	66 90                	xchg   %ax,%ax
    141a:	66 90                	xchg   %ax,%ax
    141c:	66 90                	xchg   %ax,%ax
    141e:	66 90                	xchg   %ax,%ax

00001420 <thread_create>:
#include "user.h"
#include "uthread.h"

#define PGSIZE 4096

int thread_create(void (*start_routine)(void*,void*), void *arg1, void *arg2) {
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	53                   	push   %ebx
    1424:	83 ec 10             	sub    $0x10,%esp
  // allocate a user stack for the new thread
  void *stack = malloc(PGSIZE);
    1427:	68 00 10 00 00       	push   $0x1000
    142c:	e8 ff fe ff ff       	call   1330 <malloc>
  if(stack == 0) return -1;
    1431:	83 c4 10             	add    $0x10,%esp
    1434:	85 c0                	test   %eax,%eax
    1436:	74 3d                	je     1475 <thread_create+0x55>
    1438:	89 c3                	mov    %eax,%ebx

  // align to page boundary (defensive)
  if((uint)stack % PGSIZE) stack = (void*)(((uint)stack + PGSIZE) & ~(PGSIZE-1));
    143a:	8d 80 00 10 00 00    	lea    0x1000(%eax),%eax
    1440:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    1445:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
    144b:	0f 45 d8             	cmovne %eax,%ebx

  int pid = clone(start_routine, arg1, arg2, stack);
    144e:	53                   	push   %ebx
    144f:	ff 75 10             	push   0x10(%ebp)
    1452:	ff 75 0c             	push   0xc(%ebp)
    1455:	ff 75 08             	push   0x8(%ebp)
    1458:	e8 fa fb ff ff       	call   1057 <clone>
  if(pid < 0) {
    145d:	83 c4 10             	add    $0x10,%esp
    1460:	85 c0                	test   %eax,%eax
    1462:	78 05                	js     1469 <thread_create+0x49>
    free(stack);
    return -1;
  }
  return pid;
}
    1464:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1467:	c9                   	leave
    1468:	c3                   	ret
    free(stack);
    1469:	83 ec 0c             	sub    $0xc,%esp
    146c:	53                   	push   %ebx
    146d:	e8 2e fe ff ff       	call   12a0 <free>
    return -1;
    1472:	83 c4 10             	add    $0x10,%esp
  if(stack == 0) return -1;
    1475:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    147a:	eb e8                	jmp    1464 <thread_create+0x44>
    147c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001480 <thread_join>:

int thread_join(void) {
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	53                   	push   %ebx
  void *stack;
  int pid = join(&stack);
    1484:	8d 45 f4             	lea    -0xc(%ebp),%eax
int thread_join(void) {
    1487:	83 ec 20             	sub    $0x20,%esp
  int pid = join(&stack);
    148a:	50                   	push   %eax
    148b:	e8 cf fb ff ff       	call   105f <join>
  if(pid >= 0 && stack) free(stack);
    1490:	83 c4 10             	add    $0x10,%esp
  int pid = join(&stack);
    1493:	89 c3                	mov    %eax,%ebx
  if(pid >= 0 && stack) free(stack);
    1495:	85 c0                	test   %eax,%eax
    1497:	78 13                	js     14ac <thread_join+0x2c>
    1499:	8b 45 f4             	mov    -0xc(%ebp),%eax
    149c:	85 c0                	test   %eax,%eax
    149e:	74 0c                	je     14ac <thread_join+0x2c>
    14a0:	83 ec 0c             	sub    $0xc,%esp
    14a3:	50                   	push   %eax
    14a4:	e8 f7 fd ff ff       	call   12a0 <free>
    14a9:	83 c4 10             	add    $0x10,%esp
  return pid;
}
    14ac:	89 d8                	mov    %ebx,%eax
    14ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    14b1:	c9                   	leave
    14b2:	c3                   	ret
    14b3:	66 90                	xchg   %ax,%ax
    14b5:	66 90                	xchg   %ax,%ax
    14b7:	66 90                	xchg   %ax,%ax
    14b9:	66 90                	xchg   %ax,%ax
    14bb:	66 90                	xchg   %ax,%ax
    14bd:	66 90                	xchg   %ax,%ax
    14bf:	90                   	nop

000014c0 <lock_init>:
#include "types.h"
#include "ulock.h"

// Simple user-space spinlock using GCC builtins.
// Works with your 32-bit toolchain and static linking.
void lock_init(lock_t *l) {
    14c0:	55                   	push   %ebp
    14c1:	89 e5                	mov    %esp,%ebp
  l->locked = 0;
    14c3:	8b 45 08             	mov    0x8(%ebp),%eax
    14c6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    14cc:	5d                   	pop    %ebp
    14cd:	c3                   	ret
    14ce:	66 90                	xchg   %ax,%ax

000014d0 <lock_acquire>:

void lock_acquire(lock_t *l) {
    14d0:	55                   	push   %ebp
  // spin until we acquire (returns previous value)
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
    14d1:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *l) {
    14d6:	89 e5                	mov    %esp,%ebp
    14d8:	8b 45 08             	mov    0x8(%ebp),%eax
    14db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
    14e0:	89 ca                	mov    %ecx,%edx
    14e2:	87 10                	xchg   %edx,(%eax)
    14e4:	85 d2                	test   %edx,%edx
    14e6:	75 f8                	jne    14e0 <lock_acquire+0x10>
  // full barrier after acquiring
  __sync_synchronize();
    14e8:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    14ed:	5d                   	pop    %ebp
    14ee:	c3                   	ret
    14ef:	90                   	nop

000014f0 <lock_release>:

void lock_release(lock_t *l) {
    14f0:	55                   	push   %ebp
  // full barrier before releasing
  __sync_synchronize();
    14f1:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
void lock_release(lock_t *l) {
    14f6:	89 e5                	mov    %esp,%ebp
  __sync_lock_release(&l->locked);   // atomic store 0 with release semantics
    14f8:	8b 45 08             	mov    0x8(%ebp),%eax
    14fb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1501:	5d                   	pop    %ebp
    1502:	c3                   	ret
