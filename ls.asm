
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 28             	sub    $0x28,%esp
  14:	8b 11                	mov    (%ecx),%edx
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  19:	83 fa 01             	cmp    $0x1,%edx
  1c:	0f 8e bc 00 00 00    	jle    de <main+0xde>
  22:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  25:	bb 01 00 00 00       	mov    $0x1,%ebx
  2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ls(".");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(has_wildcard(argv[i])){
  30:	8b 0c 9f             	mov    (%edi,%ebx,4),%ecx
  for (; *s; s++) if (*s == '*') return 1;
  33:	0f b6 01             	movzbl (%ecx),%eax
  36:	84 c0                	test   %al,%al
  38:	74 76                	je     b0 <main+0xb0>
  3a:	89 ca                	mov    %ecx,%edx
  3c:	eb 0d                	jmp    4b <main+0x4b>
  3e:	66 90                	xchg   %ax,%ax
  40:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  44:	83 c2 01             	add    $0x1,%edx
  47:	84 c0                	test   %al,%al
  49:	74 65                	je     b0 <main+0xb0>
  4b:	3c 2a                	cmp    $0x2a,%al
  4d:	75 f1                	jne    40 <main+0x40>

      int fd;
      struct dirent de;

      if((fd = open(".", 0)) < 0){
  4f:	83 ec 08             	sub    $0x8,%esp
  52:	6a 00                	push   $0x0
  54:	68 9c 0c 00 00       	push   $0xc9c
  59:	e8 e1 06 00 00       	call   73f <open>
  5e:	83 c4 10             	add    $0x10,%esp
  61:	89 c6                	mov    %eax,%esi
  63:	85 c0                	test   %eax,%eax
  65:	0f 88 85 00 00 00    	js     f0 <main+0xf0>
  6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(2, "ls: cannot open .\n");
        exit();
      }

      while(read(fd, &de, sizeof(de)) == sizeof(de)){
  70:	83 ec 04             	sub    $0x4,%esp
  73:	8d 45 d8             	lea    -0x28(%ebp),%eax
  76:	6a 10                	push   $0x10
  78:	50                   	push   %eax
  79:	56                   	push   %esi
  7a:	e8 98 06 00 00       	call   717 <read>
  7f:	83 c4 10             	add    $0x10,%esp
  82:	83 f8 10             	cmp    $0x10,%eax
  85:	75 49                	jne    d0 <main+0xd0>
        if(de.inum == 0) continue;
  87:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
  8c:	74 e2                	je     70 <main+0x70>
        if(wildmatch(argv[i], de.name)){
  8e:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
  91:	8d 55 da             	lea    -0x26(%ebp),%edx
  94:	e8 77 00 00 00       	call   110 <wildmatch>
  99:	85 c0                	test   %eax,%eax
  9b:	74 d3                	je     70 <main+0x70>
          ls(de.name);
  9d:	83 ec 0c             	sub    $0xc,%esp
  a0:	8d 45 da             	lea    -0x26(%ebp),%eax
  a3:	50                   	push   %eax
  a4:	e8 97 01 00 00       	call   240 <ls>
  a9:	83 c4 10             	add    $0x10,%esp
  ac:	eb c2                	jmp    70 <main+0x70>
  ae:	66 90                	xchg   %ax,%ax
        }
      }
      close(fd);
    } else {
      ls(argv[i]);
  b0:	83 ec 0c             	sub    $0xc,%esp
  b3:	51                   	push   %ecx
  b4:	e8 87 01 00 00       	call   240 <ls>
  b9:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++){
  bc:	83 c3 01             	add    $0x1,%ebx
  bf:	39 5d d4             	cmp    %ebx,-0x2c(%ebp)
  c2:	0f 85 68 ff ff ff    	jne    30 <main+0x30>
    }
  }
  exit();
  c8:	e8 32 06 00 00       	call   6ff <exit>
  cd:	8d 76 00             	lea    0x0(%esi),%esi
      close(fd);
  d0:	83 ec 0c             	sub    $0xc,%esp
  d3:	56                   	push   %esi
  d4:	e8 4e 06 00 00       	call   727 <close>
  d9:	83 c4 10             	add    $0x10,%esp
  dc:	eb de                	jmp    bc <main+0xbc>
    ls(".");
  de:	83 ec 0c             	sub    $0xc,%esp
  e1:	68 9c 0c 00 00       	push   $0xc9c
  e6:	e8 55 01 00 00       	call   240 <ls>
    exit();
  eb:	e8 0f 06 00 00       	call   6ff <exit>
        printf(2, "ls: cannot open .\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 9e 0c 00 00       	push   $0xc9e
  f7:	6a 02                	push   $0x2
  f9:	e8 62 07 00 00       	call   860 <printf>
        exit();
  fe:	e8 fc 05 00 00       	call   6ff <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <wildmatch>:
static int wildmatch(const char *pat, const char *str) {
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	56                   	push   %esi
 114:	89 d6                	mov    %edx,%esi
 116:	53                   	push   %ebx
 117:	89 c3                	mov    %eax,%ebx
  if (*pat == 0) return *str == 0;
 119:	0f b6 00             	movzbl (%eax),%eax
 11c:	84 c0                	test   %al,%al
 11e:	75 1a                	jne    13a <wildmatch+0x2a>
 120:	eb 5e                	jmp    180 <wildmatch+0x70>
 122:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (*pat == *str && *str != 0)
 128:	38 06                	cmp    %al,(%esi)
 12a:	75 4c                	jne    178 <wildmatch+0x68>
  if (*pat == 0) return *str == 0;
 12c:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    return wildmatch(pat + 1, str + 1);
 130:	83 c3 01             	add    $0x1,%ebx
 133:	83 c6 01             	add    $0x1,%esi
  if (*pat == 0) return *str == 0;
 136:	84 c0                	test   %al,%al
 138:	74 46                	je     180 <wildmatch+0x70>
  if (*pat == '*') {
 13a:	3c 2a                	cmp    $0x2a,%al
 13c:	75 ea                	jne    128 <wildmatch+0x18>
 13e:	eb 03                	jmp    143 <wildmatch+0x33>
    while (*pat == '*') pat++;
 140:	83 c3 01             	add    $0x1,%ebx
 143:	0f b6 13             	movzbl (%ebx),%edx
 146:	80 fa 2a             	cmp    $0x2a,%dl
 149:	74 f5                	je     140 <wildmatch+0x30>
    if (*pat == 0) return 1;
 14b:	b8 01 00 00 00       	mov    $0x1,%eax
 150:	84 d2                	test   %dl,%dl
 152:	74 1a                	je     16e <wildmatch+0x5e>
    for (; *str; str++) {
 154:	80 3e 00             	cmpb   $0x0,(%esi)
 157:	74 1f                	je     178 <wildmatch+0x68>
      if (wildmatch(pat, str)) return 1;
 159:	89 f2                	mov    %esi,%edx
 15b:	89 d8                	mov    %ebx,%eax
 15d:	e8 ae ff ff ff       	call   110 <wildmatch>
 162:	85 c0                	test   %eax,%eax
 164:	75 2a                	jne    190 <wildmatch+0x80>
    for (; *str; str++) {
 166:	83 c6 01             	add    $0x1,%esi
 169:	80 3e 00             	cmpb   $0x0,(%esi)
 16c:	75 eb                	jne    159 <wildmatch+0x49>
}
 16e:	5b                   	pop    %ebx
 16f:	5e                   	pop    %esi
 170:	5d                   	pop    %ebp
 171:	c3                   	ret
 172:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 178:	5b                   	pop    %ebx
    return 0;
 179:	31 c0                	xor    %eax,%eax
}
 17b:	5e                   	pop    %esi
 17c:	5d                   	pop    %ebp
 17d:	c3                   	ret
 17e:	66 90                	xchg   %ax,%ax
  if (*pat == 0) return *str == 0;
 180:	31 c0                	xor    %eax,%eax
 182:	80 3e 00             	cmpb   $0x0,(%esi)
}
 185:	5b                   	pop    %ebx
  if (*pat == 0) return *str == 0;
 186:	0f 94 c0             	sete   %al
}
 189:	5e                   	pop    %esi
 18a:	5d                   	pop    %ebp
 18b:	c3                   	ret
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 190:	5b                   	pop    %ebx
    if (*pat == 0) return 1;
 191:	b8 01 00 00 00       	mov    $0x1,%eax
}
 196:	5e                   	pop    %esi
 197:	5d                   	pop    %ebp
 198:	c3                   	ret
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <fmtname>:
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	56                   	push   %esi
 1a4:	53                   	push   %ebx
 1a5:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
 1a8:	83 ec 0c             	sub    $0xc,%esp
 1ab:	56                   	push   %esi
 1ac:	e8 4f 03 00 00       	call   500 <strlen>
 1b1:	83 c4 10             	add    $0x10,%esp
 1b4:	01 f0                	add    %esi,%eax
 1b6:	89 c3                	mov    %eax,%ebx
 1b8:	73 0f                	jae    1c9 <fmtname+0x29>
 1ba:	eb 12                	jmp    1ce <fmtname+0x2e>
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c0:	8d 43 ff             	lea    -0x1(%ebx),%eax
 1c3:	39 f0                	cmp    %esi,%eax
 1c5:	72 0a                	jb     1d1 <fmtname+0x31>
 1c7:	89 c3                	mov    %eax,%ebx
 1c9:	80 3b 2f             	cmpb   $0x2f,(%ebx)
 1cc:	75 f2                	jne    1c0 <fmtname+0x20>
  p++;
 1ce:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	53                   	push   %ebx
 1d5:	e8 26 03 00 00       	call   500 <strlen>
 1da:	83 c4 10             	add    $0x10,%esp
 1dd:	83 f8 0d             	cmp    $0xd,%eax
 1e0:	77 4a                	ja     22c <fmtname+0x8c>
  memmove(buf, p, strlen(p));
 1e2:	83 ec 0c             	sub    $0xc,%esp
 1e5:	53                   	push   %ebx
 1e6:	e8 15 03 00 00       	call   500 <strlen>
 1eb:	83 c4 0c             	add    $0xc,%esp
 1ee:	50                   	push   %eax
 1ef:	53                   	push   %ebx
 1f0:	68 58 11 00 00       	push   $0x1158
 1f5:	e8 86 04 00 00       	call   680 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 1fa:	89 1c 24             	mov    %ebx,(%esp)
 1fd:	e8 fe 02 00 00       	call   500 <strlen>
 202:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
 205:	bb 58 11 00 00       	mov    $0x1158,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 20a:	89 c6                	mov    %eax,%esi
 20c:	e8 ef 02 00 00       	call   500 <strlen>
 211:	ba 0e 00 00 00       	mov    $0xe,%edx
 216:	83 c4 0c             	add    $0xc,%esp
 219:	29 f2                	sub    %esi,%edx
 21b:	05 58 11 00 00       	add    $0x1158,%eax
 220:	52                   	push   %edx
 221:	6a 20                	push   $0x20
 223:	50                   	push   %eax
 224:	e8 07 03 00 00       	call   530 <memset>
  return buf;
 229:	83 c4 10             	add    $0x10,%esp
}
 22c:	8d 65 f8             	lea    -0x8(%ebp),%esp
 22f:	89 d8                	mov    %ebx,%eax
 231:	5b                   	pop    %ebx
 232:	5e                   	pop    %esi
 233:	5d                   	pop    %ebp
 234:	c3                   	ret
 235:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23c:	00 
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <ls>:
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
 245:	53                   	push   %ebx
 246:	81 ec 64 02 00 00    	sub    $0x264,%esp
 24c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 24f:	6a 00                	push   $0x0
 251:	57                   	push   %edi
 252:	e8 e8 04 00 00       	call   73f <open>
 257:	83 c4 10             	add    $0x10,%esp
 25a:	85 c0                	test   %eax,%eax
 25c:	0f 88 8e 01 00 00    	js     3f0 <ls+0x1b0>
  if(fstat(fd, &st) < 0){
 262:	83 ec 08             	sub    $0x8,%esp
 265:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 26b:	89 c3                	mov    %eax,%ebx
 26d:	56                   	push   %esi
 26e:	50                   	push   %eax
 26f:	e8 e3 04 00 00       	call   757 <fstat>
 274:	83 c4 10             	add    $0x10,%esp
 277:	85 c0                	test   %eax,%eax
 279:	0f 88 b1 01 00 00    	js     430 <ls+0x1f0>
  switch(st.type){
 27f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 286:	66 83 f8 01          	cmp    $0x1,%ax
 28a:	74 54                	je     2e0 <ls+0xa0>
 28c:	66 83 f8 02          	cmp    $0x2,%ax
 290:	75 37                	jne    2c9 <ls+0x89>
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 292:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 298:	83 ec 0c             	sub    $0xc,%esp
 29b:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 2a1:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 2a7:	57                   	push   %edi
 2a8:	e8 f3 fe ff ff       	call   1a0 <fmtname>
 2ad:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 2b3:	59                   	pop    %ecx
 2b4:	5f                   	pop    %edi
 2b5:	52                   	push   %edx
 2b6:	56                   	push   %esi
 2b7:	6a 02                	push   $0x2
 2b9:	50                   	push   %eax
 2ba:	68 7c 0c 00 00       	push   $0xc7c
 2bf:	6a 01                	push   $0x1
 2c1:	e8 9a 05 00 00       	call   860 <printf>
    break;
 2c6:	83 c4 20             	add    $0x20,%esp
  close(fd);
 2c9:	83 ec 0c             	sub    $0xc,%esp
 2cc:	53                   	push   %ebx
 2cd:	e8 55 04 00 00       	call   727 <close>
 2d2:	83 c4 10             	add    $0x10,%esp
}
 2d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d8:	5b                   	pop    %ebx
 2d9:	5e                   	pop    %esi
 2da:	5f                   	pop    %edi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 2e0:	83 ec 0c             	sub    $0xc,%esp
 2e3:	57                   	push   %edi
 2e4:	e8 17 02 00 00       	call   500 <strlen>
 2e9:	83 c4 10             	add    $0x10,%esp
 2ec:	83 c0 10             	add    $0x10,%eax
 2ef:	3d 00 02 00 00       	cmp    $0x200,%eax
 2f4:	0f 87 16 01 00 00    	ja     410 <ls+0x1d0>
    strcpy(buf, path);
 2fa:	83 ec 08             	sub    $0x8,%esp
 2fd:	57                   	push   %edi
 2fe:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 304:	57                   	push   %edi
 305:	e8 66 01 00 00       	call   470 <strcpy>
    p = buf+strlen(buf);
 30a:	89 3c 24             	mov    %edi,(%esp)
 30d:	e8 ee 01 00 00       	call   500 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 312:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 315:	01 f8                	add    %edi,%eax
    *p++ = '/';
 317:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 31a:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 320:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 326:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 330:	83 ec 04             	sub    $0x4,%esp
 333:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 339:	6a 10                	push   $0x10
 33b:	50                   	push   %eax
 33c:	53                   	push   %ebx
 33d:	e8 d5 03 00 00       	call   717 <read>
 342:	83 c4 10             	add    $0x10,%esp
 345:	83 f8 10             	cmp    $0x10,%eax
 348:	0f 85 7b ff ff ff    	jne    2c9 <ls+0x89>
      if(de.inum == 0)
 34e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 355:	00 
 356:	74 d8                	je     330 <ls+0xf0>
      memmove(p, de.name, DIRSIZ);
 358:	83 ec 04             	sub    $0x4,%esp
 35b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 361:	6a 0e                	push   $0xe
 363:	50                   	push   %eax
 364:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 36a:	e8 11 03 00 00       	call   680 <memmove>
      p[DIRSIZ] = 0;
 36f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 375:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 379:	58                   	pop    %eax
 37a:	5a                   	pop    %edx
 37b:	56                   	push   %esi
 37c:	57                   	push   %edi
 37d:	e8 6e 02 00 00       	call   5f0 <stat>
 382:	83 c4 10             	add    $0x10,%esp
 385:	85 c0                	test   %eax,%eax
 387:	0f 88 cb 00 00 00    	js     458 <ls+0x218>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 38d:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 393:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 399:	83 ec 0c             	sub    $0xc,%esp
 39c:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 3a3:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 3a9:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 3af:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 3b5:	57                   	push   %edi
 3b6:	e8 e5 fd ff ff       	call   1a0 <fmtname>
 3bb:	5a                   	pop    %edx
 3bc:	59                   	pop    %ecx
 3bd:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 3c3:	51                   	push   %ecx
 3c4:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 3ca:	52                   	push   %edx
 3cb:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 3d1:	50                   	push   %eax
 3d2:	68 7c 0c 00 00       	push   $0xc7c
 3d7:	6a 01                	push   $0x1
 3d9:	e8 82 04 00 00       	call   860 <printf>
 3de:	83 c4 20             	add    $0x20,%esp
 3e1:	e9 4a ff ff ff       	jmp    330 <ls+0xf0>
 3e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ed:	00 
 3ee:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot open %s\n", path);
 3f0:	83 ec 04             	sub    $0x4,%esp
 3f3:	57                   	push   %edi
 3f4:	68 54 0c 00 00       	push   $0xc54
 3f9:	6a 02                	push   $0x2
 3fb:	e8 60 04 00 00       	call   860 <printf>
    return;
 400:	83 c4 10             	add    $0x10,%esp
}
 403:	8d 65 f4             	lea    -0xc(%ebp),%esp
 406:	5b                   	pop    %ebx
 407:	5e                   	pop    %esi
 408:	5f                   	pop    %edi
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret
 40b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      printf(1, "ls: path too long\n");
 410:	83 ec 08             	sub    $0x8,%esp
 413:	68 89 0c 00 00       	push   $0xc89
 418:	6a 01                	push   $0x1
 41a:	e8 41 04 00 00       	call   860 <printf>
      break;
 41f:	83 c4 10             	add    $0x10,%esp
 422:	e9 a2 fe ff ff       	jmp    2c9 <ls+0x89>
 427:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 42e:	00 
 42f:	90                   	nop
    printf(2, "ls: cannot stat %s\n", path);
 430:	83 ec 04             	sub    $0x4,%esp
 433:	57                   	push   %edi
 434:	68 68 0c 00 00       	push   $0xc68
 439:	6a 02                	push   $0x2
 43b:	e8 20 04 00 00       	call   860 <printf>
    close(fd);
 440:	89 1c 24             	mov    %ebx,(%esp)
 443:	e8 df 02 00 00       	call   727 <close>
    return;
 448:	83 c4 10             	add    $0x10,%esp
}
 44b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 44e:	5b                   	pop    %ebx
 44f:	5e                   	pop    %esi
 450:	5f                   	pop    %edi
 451:	5d                   	pop    %ebp
 452:	c3                   	ret
 453:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(1, "ls: cannot stat %s\n", buf);
 458:	83 ec 04             	sub    $0x4,%esp
 45b:	57                   	push   %edi
 45c:	68 68 0c 00 00       	push   $0xc68
 461:	6a 01                	push   $0x1
 463:	e8 f8 03 00 00       	call   860 <printf>
        continue;
 468:	83 c4 10             	add    $0x10,%esp
 46b:	e9 c0 fe ff ff       	jmp    330 <ls+0xf0>

00000470 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 470:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 471:	31 c0                	xor    %eax,%eax
{
 473:	89 e5                	mov    %esp,%ebp
 475:	53                   	push   %ebx
 476:	8b 4d 08             	mov    0x8(%ebp),%ecx
 479:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 47c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 480:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 484:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 487:	83 c0 01             	add    $0x1,%eax
 48a:	84 d2                	test   %dl,%dl
 48c:	75 f2                	jne    480 <strcpy+0x10>
    ;
  return os;
}
 48e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 491:	89 c8                	mov    %ecx,%eax
 493:	c9                   	leave
 494:	c3                   	ret
 495:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 49c:	00 
 49d:	8d 76 00             	lea    0x0(%esi),%esi

000004a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	53                   	push   %ebx
 4a4:	8b 55 08             	mov    0x8(%ebp),%edx
 4a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 4aa:	0f b6 02             	movzbl (%edx),%eax
 4ad:	84 c0                	test   %al,%al
 4af:	75 17                	jne    4c8 <strcmp+0x28>
 4b1:	eb 3a                	jmp    4ed <strcmp+0x4d>
 4b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 4b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 4bc:	83 c2 01             	add    $0x1,%edx
 4bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 4c2:	84 c0                	test   %al,%al
 4c4:	74 1a                	je     4e0 <strcmp+0x40>
 4c6:	89 d9                	mov    %ebx,%ecx
 4c8:	0f b6 19             	movzbl (%ecx),%ebx
 4cb:	38 c3                	cmp    %al,%bl
 4cd:	74 e9                	je     4b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 4cf:	29 d8                	sub    %ebx,%eax
}
 4d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d4:	c9                   	leave
 4d5:	c3                   	ret
 4d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4dd:	00 
 4de:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 4e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 4e4:	31 c0                	xor    %eax,%eax
 4e6:	29 d8                	sub    %ebx,%eax
}
 4e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4eb:	c9                   	leave
 4ec:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 4ed:	0f b6 19             	movzbl (%ecx),%ebx
 4f0:	31 c0                	xor    %eax,%eax
 4f2:	eb db                	jmp    4cf <strcmp+0x2f>
 4f4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4fb:	00 
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000500 <strlen>:

uint
strlen(const char *s)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 506:	80 3a 00             	cmpb   $0x0,(%edx)
 509:	74 15                	je     520 <strlen+0x20>
 50b:	31 c0                	xor    %eax,%eax
 50d:	8d 76 00             	lea    0x0(%esi),%esi
 510:	83 c0 01             	add    $0x1,%eax
 513:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 517:	89 c1                	mov    %eax,%ecx
 519:	75 f5                	jne    510 <strlen+0x10>
    ;
  return n;
}
 51b:	89 c8                	mov    %ecx,%eax
 51d:	5d                   	pop    %ebp
 51e:	c3                   	ret
 51f:	90                   	nop
  for(n = 0; s[n]; n++)
 520:	31 c9                	xor    %ecx,%ecx
}
 522:	5d                   	pop    %ebp
 523:	89 c8                	mov    %ecx,%eax
 525:	c3                   	ret
 526:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 52d:	00 
 52e:	66 90                	xchg   %ax,%ax

00000530 <memset>:

void*
memset(void *dst, int c, uint n)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 537:	8b 4d 10             	mov    0x10(%ebp),%ecx
 53a:	8b 45 0c             	mov    0xc(%ebp),%eax
 53d:	89 d7                	mov    %edx,%edi
 53f:	fc                   	cld
 540:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 542:	8b 7d fc             	mov    -0x4(%ebp),%edi
 545:	89 d0                	mov    %edx,%eax
 547:	c9                   	leave
 548:	c3                   	ret
 549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000550 <strchr>:

char*
strchr(const char *s, char c)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 55a:	0f b6 10             	movzbl (%eax),%edx
 55d:	84 d2                	test   %dl,%dl
 55f:	75 12                	jne    573 <strchr+0x23>
 561:	eb 1d                	jmp    580 <strchr+0x30>
 563:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 568:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 56c:	83 c0 01             	add    $0x1,%eax
 56f:	84 d2                	test   %dl,%dl
 571:	74 0d                	je     580 <strchr+0x30>
    if(*s == c)
 573:	38 d1                	cmp    %dl,%cl
 575:	75 f1                	jne    568 <strchr+0x18>
      return (char*)s;
  return 0;
}
 577:	5d                   	pop    %ebp
 578:	c3                   	ret
 579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 580:	31 c0                	xor    %eax,%eax
}
 582:	5d                   	pop    %ebp
 583:	c3                   	ret
 584:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 58b:	00 
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000590 <gets>:

char*
gets(char *buf, int max)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 595:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 598:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 599:	31 db                	xor    %ebx,%ebx
{
 59b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 59e:	eb 27                	jmp    5c7 <gets+0x37>
    cc = read(0, &c, 1);
 5a0:	83 ec 04             	sub    $0x4,%esp
 5a3:	6a 01                	push   $0x1
 5a5:	56                   	push   %esi
 5a6:	6a 00                	push   $0x0
 5a8:	e8 6a 01 00 00       	call   717 <read>
    if(cc < 1)
 5ad:	83 c4 10             	add    $0x10,%esp
 5b0:	85 c0                	test   %eax,%eax
 5b2:	7e 1d                	jle    5d1 <gets+0x41>
      break;
    buf[i++] = c;
 5b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5b8:	8b 55 08             	mov    0x8(%ebp),%edx
 5bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 5bf:	3c 0a                	cmp    $0xa,%al
 5c1:	74 10                	je     5d3 <gets+0x43>
 5c3:	3c 0d                	cmp    $0xd,%al
 5c5:	74 0c                	je     5d3 <gets+0x43>
  for(i=0; i+1 < max; ){
 5c7:	89 df                	mov    %ebx,%edi
 5c9:	83 c3 01             	add    $0x1,%ebx
 5cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5cf:	7c cf                	jl     5a0 <gets+0x10>
 5d1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 5d3:	8b 45 08             	mov    0x8(%ebp),%eax
 5d6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 5da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5dd:	5b                   	pop    %ebx
 5de:	5e                   	pop    %esi
 5df:	5f                   	pop    %edi
 5e0:	5d                   	pop    %ebp
 5e1:	c3                   	ret
 5e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5e9:	00 
 5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	56                   	push   %esi
 5f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5f5:	83 ec 08             	sub    $0x8,%esp
 5f8:	6a 00                	push   $0x0
 5fa:	ff 75 08             	push   0x8(%ebp)
 5fd:	e8 3d 01 00 00       	call   73f <open>
  if(fd < 0)
 602:	83 c4 10             	add    $0x10,%esp
 605:	85 c0                	test   %eax,%eax
 607:	78 27                	js     630 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 609:	83 ec 08             	sub    $0x8,%esp
 60c:	ff 75 0c             	push   0xc(%ebp)
 60f:	89 c3                	mov    %eax,%ebx
 611:	50                   	push   %eax
 612:	e8 40 01 00 00       	call   757 <fstat>
  close(fd);
 617:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 61a:	89 c6                	mov    %eax,%esi
  close(fd);
 61c:	e8 06 01 00 00       	call   727 <close>
  return r;
 621:	83 c4 10             	add    $0x10,%esp
}
 624:	8d 65 f8             	lea    -0x8(%ebp),%esp
 627:	89 f0                	mov    %esi,%eax
 629:	5b                   	pop    %ebx
 62a:	5e                   	pop    %esi
 62b:	5d                   	pop    %ebp
 62c:	c3                   	ret
 62d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 630:	be ff ff ff ff       	mov    $0xffffffff,%esi
 635:	eb ed                	jmp    624 <stat+0x34>
 637:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 63e:	00 
 63f:	90                   	nop

00000640 <atoi>:

int
atoi(const char *s)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	53                   	push   %ebx
 644:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 647:	0f be 02             	movsbl (%edx),%eax
 64a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 64d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 650:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 655:	77 1e                	ja     675 <atoi+0x35>
 657:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 65e:	00 
 65f:	90                   	nop
    n = n*10 + *s++ - '0';
 660:	83 c2 01             	add    $0x1,%edx
 663:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 666:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 66a:	0f be 02             	movsbl (%edx),%eax
 66d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 670:	80 fb 09             	cmp    $0x9,%bl
 673:	76 eb                	jbe    660 <atoi+0x20>
  return n;
}
 675:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 678:	89 c8                	mov    %ecx,%eax
 67a:	c9                   	leave
 67b:	c3                   	ret
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000680 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	8b 45 10             	mov    0x10(%ebp),%eax
 687:	8b 55 08             	mov    0x8(%ebp),%edx
 68a:	56                   	push   %esi
 68b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 68e:	85 c0                	test   %eax,%eax
 690:	7e 13                	jle    6a5 <memmove+0x25>
 692:	01 d0                	add    %edx,%eax
  dst = vdst;
 694:	89 d7                	mov    %edx,%edi
 696:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 69d:	00 
 69e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 6a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 6a1:	39 f8                	cmp    %edi,%eax
 6a3:	75 fb                	jne    6a0 <memmove+0x20>
  return vdst;
}
 6a5:	5e                   	pop    %esi
 6a6:	89 d0                	mov    %edx,%eax
 6a8:	5f                   	pop    %edi
 6a9:	5d                   	pop    %ebp
 6aa:	c3                   	ret
 6ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000006b0 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	53                   	push   %ebx
 6b4:	8b 55 10             	mov    0x10(%ebp),%edx
 6b7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ba:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(n > 0 && *p && *p == *q)
 6bd:	85 d2                	test   %edx,%edx
 6bf:	75 16                	jne    6d7 <strncmp+0x27>
 6c1:	eb 2d                	jmp    6f0 <strncmp+0x40>
 6c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 6c8:	3a 19                	cmp    (%ecx),%bl
 6ca:	75 12                	jne    6de <strncmp+0x2e>
    n--, p++, q++;
 6cc:	83 c0 01             	add    $0x1,%eax
 6cf:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
 6d2:	83 ea 01             	sub    $0x1,%edx
 6d5:	74 19                	je     6f0 <strncmp+0x40>
 6d7:	0f b6 18             	movzbl (%eax),%ebx
 6da:	84 db                	test   %bl,%bl
 6dc:	75 ea                	jne    6c8 <strncmp+0x18>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
 6de:	0f b6 00             	movzbl (%eax),%eax
 6e1:	0f b6 11             	movzbl (%ecx),%edx
}
 6e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6e7:	c9                   	leave
  return (uchar)*p - (uchar)*q;
 6e8:	29 d0                	sub    %edx,%eax
}
 6ea:	c3                   	ret
 6eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 6f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 6f3:	31 c0                	xor    %eax,%eax
}
 6f5:	c9                   	leave
 6f6:	c3                   	ret

000006f7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6f7:	b8 01 00 00 00       	mov    $0x1,%eax
 6fc:	cd 40                	int    $0x40
 6fe:	c3                   	ret

000006ff <exit>:
SYSCALL(exit)
 6ff:	b8 02 00 00 00       	mov    $0x2,%eax
 704:	cd 40                	int    $0x40
 706:	c3                   	ret

00000707 <wait>:
SYSCALL(wait)
 707:	b8 03 00 00 00       	mov    $0x3,%eax
 70c:	cd 40                	int    $0x40
 70e:	c3                   	ret

0000070f <pipe>:
SYSCALL(pipe)
 70f:	b8 04 00 00 00       	mov    $0x4,%eax
 714:	cd 40                	int    $0x40
 716:	c3                   	ret

00000717 <read>:
SYSCALL(read)
 717:	b8 05 00 00 00       	mov    $0x5,%eax
 71c:	cd 40                	int    $0x40
 71e:	c3                   	ret

0000071f <write>:
SYSCALL(write)
 71f:	b8 10 00 00 00       	mov    $0x10,%eax
 724:	cd 40                	int    $0x40
 726:	c3                   	ret

00000727 <close>:
SYSCALL(close)
 727:	b8 15 00 00 00       	mov    $0x15,%eax
 72c:	cd 40                	int    $0x40
 72e:	c3                   	ret

0000072f <kill>:
SYSCALL(kill)
 72f:	b8 06 00 00 00       	mov    $0x6,%eax
 734:	cd 40                	int    $0x40
 736:	c3                   	ret

00000737 <exec>:
SYSCALL(exec)
 737:	b8 07 00 00 00       	mov    $0x7,%eax
 73c:	cd 40                	int    $0x40
 73e:	c3                   	ret

0000073f <open>:
SYSCALL(open)
 73f:	b8 0f 00 00 00       	mov    $0xf,%eax
 744:	cd 40                	int    $0x40
 746:	c3                   	ret

00000747 <mknod>:
SYSCALL(mknod)
 747:	b8 11 00 00 00       	mov    $0x11,%eax
 74c:	cd 40                	int    $0x40
 74e:	c3                   	ret

0000074f <unlink>:
SYSCALL(unlink)
 74f:	b8 12 00 00 00       	mov    $0x12,%eax
 754:	cd 40                	int    $0x40
 756:	c3                   	ret

00000757 <fstat>:
SYSCALL(fstat)
 757:	b8 08 00 00 00       	mov    $0x8,%eax
 75c:	cd 40                	int    $0x40
 75e:	c3                   	ret

0000075f <link>:
SYSCALL(link)
 75f:	b8 13 00 00 00       	mov    $0x13,%eax
 764:	cd 40                	int    $0x40
 766:	c3                   	ret

00000767 <mkdir>:
SYSCALL(mkdir)
 767:	b8 14 00 00 00       	mov    $0x14,%eax
 76c:	cd 40                	int    $0x40
 76e:	c3                   	ret

0000076f <chdir>:
SYSCALL(chdir)
 76f:	b8 09 00 00 00       	mov    $0x9,%eax
 774:	cd 40                	int    $0x40
 776:	c3                   	ret

00000777 <dup>:
SYSCALL(dup)
 777:	b8 0a 00 00 00       	mov    $0xa,%eax
 77c:	cd 40                	int    $0x40
 77e:	c3                   	ret

0000077f <getpid>:
SYSCALL(getpid)
 77f:	b8 0b 00 00 00       	mov    $0xb,%eax
 784:	cd 40                	int    $0x40
 786:	c3                   	ret

00000787 <sbrk>:
SYSCALL(sbrk)
 787:	b8 0c 00 00 00       	mov    $0xc,%eax
 78c:	cd 40                	int    $0x40
 78e:	c3                   	ret

0000078f <sleep>:
SYSCALL(sleep)
 78f:	b8 0d 00 00 00       	mov    $0xd,%eax
 794:	cd 40                	int    $0x40
 796:	c3                   	ret

00000797 <uptime>:
SYSCALL(uptime)
 797:	b8 0e 00 00 00       	mov    $0xe,%eax
 79c:	cd 40                	int    $0x40
 79e:	c3                   	ret

0000079f <getprocs>:
SYSCALL(getprocs)
 79f:	b8 16 00 00 00       	mov    $0x16,%eax
 7a4:	cd 40                	int    $0x40
 7a6:	c3                   	ret

000007a7 <clone>:
SYSCALL(clone)
 7a7:	b8 17 00 00 00       	mov    $0x17,%eax
 7ac:	cd 40                	int    $0x40
 7ae:	c3                   	ret

000007af <join>:
SYSCALL(join)
 7af:	b8 18 00 00 00       	mov    $0x18,%eax
 7b4:	cd 40                	int    $0x40
 7b6:	c3                   	ret
 7b7:	66 90                	xchg   %ax,%ax
 7b9:	66 90                	xchg   %ax,%ax
 7bb:	66 90                	xchg   %ax,%ax
 7bd:	66 90                	xchg   %ax,%ax
 7bf:	90                   	nop

000007c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 7c8:	89 d1                	mov    %edx,%ecx
{
 7ca:	83 ec 3c             	sub    $0x3c,%esp
 7cd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 7d0:	85 d2                	test   %edx,%edx
 7d2:	0f 89 80 00 00 00    	jns    858 <printint+0x98>
 7d8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 7dc:	74 7a                	je     858 <printint+0x98>
    x = -xx;
 7de:	f7 d9                	neg    %ecx
    neg = 1;
 7e0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 7e5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 7e8:	31 f6                	xor    %esi,%esi
 7ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 7f0:	89 c8                	mov    %ecx,%eax
 7f2:	31 d2                	xor    %edx,%edx
 7f4:	89 f7                	mov    %esi,%edi
 7f6:	f7 f3                	div    %ebx
 7f8:	8d 76 01             	lea    0x1(%esi),%esi
 7fb:	0f b6 92 10 0d 00 00 	movzbl 0xd10(%edx),%edx
 802:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 806:	89 ca                	mov    %ecx,%edx
 808:	89 c1                	mov    %eax,%ecx
 80a:	39 da                	cmp    %ebx,%edx
 80c:	73 e2                	jae    7f0 <printint+0x30>
  if(neg)
 80e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 811:	85 c0                	test   %eax,%eax
 813:	74 07                	je     81c <printint+0x5c>
    buf[i++] = '-';
 815:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 81a:	89 f7                	mov    %esi,%edi
 81c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 81f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 822:	01 df                	add    %ebx,%edi
 824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 828:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 82b:	83 ec 04             	sub    $0x4,%esp
 82e:	88 45 d7             	mov    %al,-0x29(%ebp)
 831:	8d 45 d7             	lea    -0x29(%ebp),%eax
 834:	6a 01                	push   $0x1
 836:	50                   	push   %eax
 837:	56                   	push   %esi
 838:	e8 e2 fe ff ff       	call   71f <write>
  while(--i >= 0)
 83d:	89 f8                	mov    %edi,%eax
 83f:	83 c4 10             	add    $0x10,%esp
 842:	83 ef 01             	sub    $0x1,%edi
 845:	39 c3                	cmp    %eax,%ebx
 847:	75 df                	jne    828 <printint+0x68>
}
 849:	8d 65 f4             	lea    -0xc(%ebp),%esp
 84c:	5b                   	pop    %ebx
 84d:	5e                   	pop    %esi
 84e:	5f                   	pop    %edi
 84f:	5d                   	pop    %ebp
 850:	c3                   	ret
 851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 858:	31 c0                	xor    %eax,%eax
 85a:	eb 89                	jmp    7e5 <printint+0x25>
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000860 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	57                   	push   %edi
 864:	56                   	push   %esi
 865:	53                   	push   %ebx
 866:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 869:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 86c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 86f:	0f b6 1e             	movzbl (%esi),%ebx
 872:	83 c6 01             	add    $0x1,%esi
 875:	84 db                	test   %bl,%bl
 877:	74 67                	je     8e0 <printf+0x80>
 879:	8d 4d 10             	lea    0x10(%ebp),%ecx
 87c:	31 d2                	xor    %edx,%edx
 87e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 881:	eb 34                	jmp    8b7 <printf+0x57>
 883:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 888:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 88b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 890:	83 f8 25             	cmp    $0x25,%eax
 893:	74 18                	je     8ad <printf+0x4d>
  write(fd, &c, 1);
 895:	83 ec 04             	sub    $0x4,%esp
 898:	8d 45 e7             	lea    -0x19(%ebp),%eax
 89b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 89e:	6a 01                	push   $0x1
 8a0:	50                   	push   %eax
 8a1:	57                   	push   %edi
 8a2:	e8 78 fe ff ff       	call   71f <write>
 8a7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 8aa:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 8ad:	0f b6 1e             	movzbl (%esi),%ebx
 8b0:	83 c6 01             	add    $0x1,%esi
 8b3:	84 db                	test   %bl,%bl
 8b5:	74 29                	je     8e0 <printf+0x80>
    c = fmt[i] & 0xff;
 8b7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 8ba:	85 d2                	test   %edx,%edx
 8bc:	74 ca                	je     888 <printf+0x28>
      }
    } else if(state == '%'){
 8be:	83 fa 25             	cmp    $0x25,%edx
 8c1:	75 ea                	jne    8ad <printf+0x4d>
      if(c == 'd'){
 8c3:	83 f8 25             	cmp    $0x25,%eax
 8c6:	0f 84 04 01 00 00    	je     9d0 <printf+0x170>
 8cc:	83 e8 63             	sub    $0x63,%eax
 8cf:	83 f8 15             	cmp    $0x15,%eax
 8d2:	77 1c                	ja     8f0 <printf+0x90>
 8d4:	ff 24 85 b8 0c 00 00 	jmp    *0xcb8(,%eax,4)
 8db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8e3:	5b                   	pop    %ebx
 8e4:	5e                   	pop    %esi
 8e5:	5f                   	pop    %edi
 8e6:	5d                   	pop    %ebp
 8e7:	c3                   	ret
 8e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8ef:	00 
  write(fd, &c, 1);
 8f0:	83 ec 04             	sub    $0x4,%esp
 8f3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 8f6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8fa:	6a 01                	push   $0x1
 8fc:	52                   	push   %edx
 8fd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 900:	57                   	push   %edi
 901:	e8 19 fe ff ff       	call   71f <write>
 906:	83 c4 0c             	add    $0xc,%esp
 909:	88 5d e7             	mov    %bl,-0x19(%ebp)
 90c:	6a 01                	push   $0x1
 90e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 911:	52                   	push   %edx
 912:	57                   	push   %edi
 913:	e8 07 fe ff ff       	call   71f <write>
        putc(fd, c);
 918:	83 c4 10             	add    $0x10,%esp
      state = 0;
 91b:	31 d2                	xor    %edx,%edx
 91d:	eb 8e                	jmp    8ad <printf+0x4d>
 91f:	90                   	nop
        printint(fd, *ap, 16, 0);
 920:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 923:	83 ec 0c             	sub    $0xc,%esp
 926:	b9 10 00 00 00       	mov    $0x10,%ecx
 92b:	8b 13                	mov    (%ebx),%edx
 92d:	6a 00                	push   $0x0
 92f:	89 f8                	mov    %edi,%eax
        ap++;
 931:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 934:	e8 87 fe ff ff       	call   7c0 <printint>
        ap++;
 939:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 93c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 93f:	31 d2                	xor    %edx,%edx
 941:	e9 67 ff ff ff       	jmp    8ad <printf+0x4d>
        s = (char*)*ap;
 946:	8b 45 d0             	mov    -0x30(%ebp),%eax
 949:	8b 18                	mov    (%eax),%ebx
        ap++;
 94b:	83 c0 04             	add    $0x4,%eax
 94e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 951:	85 db                	test   %ebx,%ebx
 953:	0f 84 87 00 00 00    	je     9e0 <printf+0x180>
        while(*s != 0){
 959:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 95c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 95e:	84 c0                	test   %al,%al
 960:	0f 84 47 ff ff ff    	je     8ad <printf+0x4d>
 966:	8d 55 e7             	lea    -0x19(%ebp),%edx
 969:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 96c:	89 de                	mov    %ebx,%esi
 96e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 970:	83 ec 04             	sub    $0x4,%esp
 973:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 976:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 979:	6a 01                	push   $0x1
 97b:	53                   	push   %ebx
 97c:	57                   	push   %edi
 97d:	e8 9d fd ff ff       	call   71f <write>
        while(*s != 0){
 982:	0f b6 06             	movzbl (%esi),%eax
 985:	83 c4 10             	add    $0x10,%esp
 988:	84 c0                	test   %al,%al
 98a:	75 e4                	jne    970 <printf+0x110>
      state = 0;
 98c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 98f:	31 d2                	xor    %edx,%edx
 991:	e9 17 ff ff ff       	jmp    8ad <printf+0x4d>
        printint(fd, *ap, 10, 1);
 996:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 999:	83 ec 0c             	sub    $0xc,%esp
 99c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9a1:	8b 13                	mov    (%ebx),%edx
 9a3:	6a 01                	push   $0x1
 9a5:	eb 88                	jmp    92f <printf+0xcf>
        putc(fd, *ap);
 9a7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 9aa:	83 ec 04             	sub    $0x4,%esp
 9ad:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 9b0:	8b 03                	mov    (%ebx),%eax
        ap++;
 9b2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 9b5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 9b8:	6a 01                	push   $0x1
 9ba:	52                   	push   %edx
 9bb:	57                   	push   %edi
 9bc:	e8 5e fd ff ff       	call   71f <write>
        ap++;
 9c1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 9c4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9c7:	31 d2                	xor    %edx,%edx
 9c9:	e9 df fe ff ff       	jmp    8ad <printf+0x4d>
 9ce:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 9d0:	83 ec 04             	sub    $0x4,%esp
 9d3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 9d6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 9d9:	6a 01                	push   $0x1
 9db:	e9 31 ff ff ff       	jmp    911 <printf+0xb1>
 9e0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 9e5:	bb b1 0c 00 00       	mov    $0xcb1,%ebx
 9ea:	e9 77 ff ff ff       	jmp    966 <printf+0x106>
 9ef:	90                   	nop

000009f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f1:	a1 68 11 00 00       	mov    0x1168,%eax
{
 9f6:	89 e5                	mov    %esp,%ebp
 9f8:	57                   	push   %edi
 9f9:	56                   	push   %esi
 9fa:	53                   	push   %ebx
 9fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 9fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a08:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a0a:	39 c8                	cmp    %ecx,%eax
 a0c:	73 32                	jae    a40 <free+0x50>
 a0e:	39 d1                	cmp    %edx,%ecx
 a10:	72 04                	jb     a16 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a12:	39 d0                	cmp    %edx,%eax
 a14:	72 32                	jb     a48 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a16:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a19:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a1c:	39 fa                	cmp    %edi,%edx
 a1e:	74 30                	je     a50 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 a20:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 a23:	8b 50 04             	mov    0x4(%eax),%edx
 a26:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a29:	39 f1                	cmp    %esi,%ecx
 a2b:	74 3a                	je     a67 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 a2d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 a2f:	5b                   	pop    %ebx
  freep = p;
 a30:	a3 68 11 00 00       	mov    %eax,0x1168
}
 a35:	5e                   	pop    %esi
 a36:	5f                   	pop    %edi
 a37:	5d                   	pop    %ebp
 a38:	c3                   	ret
 a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a40:	39 d0                	cmp    %edx,%eax
 a42:	72 04                	jb     a48 <free+0x58>
 a44:	39 d1                	cmp    %edx,%ecx
 a46:	72 ce                	jb     a16 <free+0x26>
{
 a48:	89 d0                	mov    %edx,%eax
 a4a:	eb bc                	jmp    a08 <free+0x18>
 a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 a50:	03 72 04             	add    0x4(%edx),%esi
 a53:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a56:	8b 10                	mov    (%eax),%edx
 a58:	8b 12                	mov    (%edx),%edx
 a5a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a5d:	8b 50 04             	mov    0x4(%eax),%edx
 a60:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a63:	39 f1                	cmp    %esi,%ecx
 a65:	75 c6                	jne    a2d <free+0x3d>
    p->s.size += bp->s.size;
 a67:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 a6a:	a3 68 11 00 00       	mov    %eax,0x1168
    p->s.size += bp->s.size;
 a6f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a72:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 a75:	89 08                	mov    %ecx,(%eax)
}
 a77:	5b                   	pop    %ebx
 a78:	5e                   	pop    %esi
 a79:	5f                   	pop    %edi
 a7a:	5d                   	pop    %ebp
 a7b:	c3                   	ret
 a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a80 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
 a83:	57                   	push   %edi
 a84:	56                   	push   %esi
 a85:	53                   	push   %ebx
 a86:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a89:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a8c:	8b 15 68 11 00 00    	mov    0x1168,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a92:	8d 78 07             	lea    0x7(%eax),%edi
 a95:	c1 ef 03             	shr    $0x3,%edi
 a98:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 a9b:	85 d2                	test   %edx,%edx
 a9d:	0f 84 8d 00 00 00    	je     b30 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 aa5:	8b 48 04             	mov    0x4(%eax),%ecx
 aa8:	39 f9                	cmp    %edi,%ecx
 aaa:	73 64                	jae    b10 <malloc+0x90>
  if(nu < 4096)
 aac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 ab1:	39 df                	cmp    %ebx,%edi
 ab3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 ab6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 abd:	eb 0a                	jmp    ac9 <malloc+0x49>
 abf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 ac2:	8b 48 04             	mov    0x4(%eax),%ecx
 ac5:	39 f9                	cmp    %edi,%ecx
 ac7:	73 47                	jae    b10 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ac9:	89 c2                	mov    %eax,%edx
 acb:	3b 05 68 11 00 00    	cmp    0x1168,%eax
 ad1:	75 ed                	jne    ac0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 ad3:	83 ec 0c             	sub    $0xc,%esp
 ad6:	56                   	push   %esi
 ad7:	e8 ab fc ff ff       	call   787 <sbrk>
  if(p == (char*)-1)
 adc:	83 c4 10             	add    $0x10,%esp
 adf:	83 f8 ff             	cmp    $0xffffffff,%eax
 ae2:	74 1c                	je     b00 <malloc+0x80>
  hp->s.size = nu;
 ae4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 ae7:	83 ec 0c             	sub    $0xc,%esp
 aea:	83 c0 08             	add    $0x8,%eax
 aed:	50                   	push   %eax
 aee:	e8 fd fe ff ff       	call   9f0 <free>
  return freep;
 af3:	8b 15 68 11 00 00    	mov    0x1168,%edx
      if((p = morecore(nunits)) == 0)
 af9:	83 c4 10             	add    $0x10,%esp
 afc:	85 d2                	test   %edx,%edx
 afe:	75 c0                	jne    ac0 <malloc+0x40>
        return 0;
  }
}
 b00:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 b03:	31 c0                	xor    %eax,%eax
}
 b05:	5b                   	pop    %ebx
 b06:	5e                   	pop    %esi
 b07:	5f                   	pop    %edi
 b08:	5d                   	pop    %ebp
 b09:	c3                   	ret
 b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 b10:	39 cf                	cmp    %ecx,%edi
 b12:	74 4c                	je     b60 <malloc+0xe0>
        p->s.size -= nunits;
 b14:	29 f9                	sub    %edi,%ecx
 b16:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 b19:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 b1c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 b1f:	89 15 68 11 00 00    	mov    %edx,0x1168
}
 b25:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b28:	83 c0 08             	add    $0x8,%eax
}
 b2b:	5b                   	pop    %ebx
 b2c:	5e                   	pop    %esi
 b2d:	5f                   	pop    %edi
 b2e:	5d                   	pop    %ebp
 b2f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 b30:	c7 05 68 11 00 00 6c 	movl   $0x116c,0x1168
 b37:	11 00 00 
    base.s.size = 0;
 b3a:	b8 6c 11 00 00       	mov    $0x116c,%eax
    base.s.ptr = freep = prevp = &base;
 b3f:	c7 05 6c 11 00 00 6c 	movl   $0x116c,0x116c
 b46:	11 00 00 
    base.s.size = 0;
 b49:	c7 05 70 11 00 00 00 	movl   $0x0,0x1170
 b50:	00 00 00 
    if(p->s.size >= nunits){
 b53:	e9 54 ff ff ff       	jmp    aac <malloc+0x2c>
 b58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 b5f:	00 
        prevp->s.ptr = p->s.ptr;
 b60:	8b 08                	mov    (%eax),%ecx
 b62:	89 0a                	mov    %ecx,(%edx)
 b64:	eb b9                	jmp    b1f <malloc+0x9f>
 b66:	66 90                	xchg   %ax,%ax
 b68:	66 90                	xchg   %ax,%ax
 b6a:	66 90                	xchg   %ax,%ax
 b6c:	66 90                	xchg   %ax,%ax
 b6e:	66 90                	xchg   %ax,%ax

00000b70 <thread_create>:
#include "user.h"
#include "uthread.h"

#define PGSIZE 4096

int thread_create(void (*start_routine)(void*,void*), void *arg1, void *arg2) {
 b70:	55                   	push   %ebp
 b71:	89 e5                	mov    %esp,%ebp
 b73:	53                   	push   %ebx
 b74:	83 ec 10             	sub    $0x10,%esp
  // allocate a user stack for the new thread
  void *stack = malloc(PGSIZE);
 b77:	68 00 10 00 00       	push   $0x1000
 b7c:	e8 ff fe ff ff       	call   a80 <malloc>
  if(stack == 0) return -1;
 b81:	83 c4 10             	add    $0x10,%esp
 b84:	85 c0                	test   %eax,%eax
 b86:	74 3d                	je     bc5 <thread_create+0x55>
 b88:	89 c3                	mov    %eax,%ebx

  // align to page boundary (defensive)
  if((uint)stack % PGSIZE) stack = (void*)(((uint)stack + PGSIZE) & ~(PGSIZE-1));
 b8a:	8d 80 00 10 00 00    	lea    0x1000(%eax),%eax
 b90:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 b95:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 b9b:	0f 45 d8             	cmovne %eax,%ebx

  int pid = clone(start_routine, arg1, arg2, stack);
 b9e:	53                   	push   %ebx
 b9f:	ff 75 10             	push   0x10(%ebp)
 ba2:	ff 75 0c             	push   0xc(%ebp)
 ba5:	ff 75 08             	push   0x8(%ebp)
 ba8:	e8 fa fb ff ff       	call   7a7 <clone>
  if(pid < 0) {
 bad:	83 c4 10             	add    $0x10,%esp
 bb0:	85 c0                	test   %eax,%eax
 bb2:	78 05                	js     bb9 <thread_create+0x49>
    free(stack);
    return -1;
  }
  return pid;
}
 bb4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 bb7:	c9                   	leave
 bb8:	c3                   	ret
    free(stack);
 bb9:	83 ec 0c             	sub    $0xc,%esp
 bbc:	53                   	push   %ebx
 bbd:	e8 2e fe ff ff       	call   9f0 <free>
    return -1;
 bc2:	83 c4 10             	add    $0x10,%esp
  if(stack == 0) return -1;
 bc5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 bca:	eb e8                	jmp    bb4 <thread_create+0x44>
 bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000bd0 <thread_join>:

int thread_join(void) {
 bd0:	55                   	push   %ebp
 bd1:	89 e5                	mov    %esp,%ebp
 bd3:	53                   	push   %ebx
  void *stack;
  int pid = join(&stack);
 bd4:	8d 45 f4             	lea    -0xc(%ebp),%eax
int thread_join(void) {
 bd7:	83 ec 20             	sub    $0x20,%esp
  int pid = join(&stack);
 bda:	50                   	push   %eax
 bdb:	e8 cf fb ff ff       	call   7af <join>
  if(pid >= 0 && stack) free(stack);
 be0:	83 c4 10             	add    $0x10,%esp
  int pid = join(&stack);
 be3:	89 c3                	mov    %eax,%ebx
  if(pid >= 0 && stack) free(stack);
 be5:	85 c0                	test   %eax,%eax
 be7:	78 13                	js     bfc <thread_join+0x2c>
 be9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bec:	85 c0                	test   %eax,%eax
 bee:	74 0c                	je     bfc <thread_join+0x2c>
 bf0:	83 ec 0c             	sub    $0xc,%esp
 bf3:	50                   	push   %eax
 bf4:	e8 f7 fd ff ff       	call   9f0 <free>
 bf9:	83 c4 10             	add    $0x10,%esp
  return pid;
}
 bfc:	89 d8                	mov    %ebx,%eax
 bfe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 c01:	c9                   	leave
 c02:	c3                   	ret
 c03:	66 90                	xchg   %ax,%ax
 c05:	66 90                	xchg   %ax,%ax
 c07:	66 90                	xchg   %ax,%ax
 c09:	66 90                	xchg   %ax,%ax
 c0b:	66 90                	xchg   %ax,%ax
 c0d:	66 90                	xchg   %ax,%ax
 c0f:	90                   	nop

00000c10 <lock_init>:
#include "types.h"
#include "ulock.h"

// Simple user-space spinlock using GCC builtins.
// Works with your 32-bit toolchain and static linking.
void lock_init(lock_t *l) {
 c10:	55                   	push   %ebp
 c11:	89 e5                	mov    %esp,%ebp
  l->locked = 0;
 c13:	8b 45 08             	mov    0x8(%ebp),%eax
 c16:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 c1c:	5d                   	pop    %ebp
 c1d:	c3                   	ret
 c1e:	66 90                	xchg   %ax,%ax

00000c20 <lock_acquire>:

void lock_acquire(lock_t *l) {
 c20:	55                   	push   %ebp
  // spin until we acquire (returns previous value)
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
 c21:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *l) {
 c26:	89 e5                	mov    %esp,%ebp
 c28:	8b 45 08             	mov    0x8(%ebp),%eax
 c2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
 c30:	89 ca                	mov    %ecx,%edx
 c32:	87 10                	xchg   %edx,(%eax)
 c34:	85 d2                	test   %edx,%edx
 c36:	75 f8                	jne    c30 <lock_acquire+0x10>
  // full barrier after acquiring
  __sync_synchronize();
 c38:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 c3d:	5d                   	pop    %ebp
 c3e:	c3                   	ret
 c3f:	90                   	nop

00000c40 <lock_release>:

void lock_release(lock_t *l) {
 c40:	55                   	push   %ebp
  // full barrier before releasing
  __sync_synchronize();
 c41:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
void lock_release(lock_t *l) {
 c46:	89 e5                	mov    %esp,%ebp
  __sync_lock_release(&l->locked);   // atomic store 0 with release semantics
 c48:	8b 45 08             	mov    0x8(%ebp),%eax
 c4b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 c51:	5d                   	pop    %ebp
 c52:	c3                   	ret
