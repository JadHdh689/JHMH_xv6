
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
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 28             	sub    $0x28,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  1e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  int i;

  if(argc < 2){
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 8e b4 00 00 00    	jle    de <main+0xde>
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
  54:	68 a0 0b 00 00       	push   $0xba0
  59:	e8 b5 06 00 00       	call   713 <open>
  5e:	83 c4 10             	add    $0x10,%esp
  61:	89 c6                	mov    %eax,%esi
  63:	85 c0                	test   %eax,%eax
  65:	0f 88 85 00 00 00    	js     f0 <main+0xf0>
  6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  6f:	90                   	nop
        printf(2, "ls: cannot open .\n");
        exit();
      }

      while(read(fd, &de, sizeof(de)) == sizeof(de)){
  70:	83 ec 04             	sub    $0x4,%esp
  73:	8d 45 d8             	lea    -0x28(%ebp),%eax
  76:	6a 10                	push   $0x10
  78:	50                   	push   %eax
  79:	56                   	push   %esi
  7a:	e8 6c 06 00 00       	call   6eb <read>
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
  c8:	e8 06 06 00 00       	call   6d3 <exit>
  cd:	8d 76 00             	lea    0x0(%esi),%esi
      close(fd);
  d0:	83 ec 0c             	sub    $0xc,%esp
  d3:	56                   	push   %esi
  d4:	e8 22 06 00 00       	call   6fb <close>
  d9:	83 c4 10             	add    $0x10,%esp
  dc:	eb de                	jmp    bc <main+0xbc>
    ls(".");
  de:	83 ec 0c             	sub    $0xc,%esp
  e1:	68 a0 0b 00 00       	push   $0xba0
  e6:	e8 55 01 00 00       	call   240 <ls>
    exit();
  eb:	e8 e3 05 00 00       	call   6d3 <exit>
        printf(2, "ls: cannot open .\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 a2 0b 00 00       	push   $0xba2
  f7:	6a 02                	push   $0x2
  f9:	e8 32 07 00 00       	call   830 <printf>
        exit();
  fe:	e8 d0 05 00 00       	call   6d3 <exit>
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
 1ac:	e8 5f 03 00 00       	call   510 <strlen>
 1b1:	83 c4 10             	add    $0x10,%esp
 1b4:	01 f0                	add    %esi,%eax
 1b6:	89 c3                	mov    %eax,%ebx
 1b8:	73 0f                	jae    1c9 <fmtname+0x29>
 1ba:	eb 12                	jmp    1ce <fmtname+0x2e>
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c0:	8d 43 ff             	lea    -0x1(%ebx),%eax
 1c3:	39 c6                	cmp    %eax,%esi
 1c5:	77 0a                	ja     1d1 <fmtname+0x31>
 1c7:	89 c3                	mov    %eax,%ebx
 1c9:	80 3b 2f             	cmpb   $0x2f,(%ebx)
 1cc:	75 f2                	jne    1c0 <fmtname+0x20>
  p++;
 1ce:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	53                   	push   %ebx
 1d5:	e8 36 03 00 00       	call   510 <strlen>
 1da:	83 c4 10             	add    $0x10,%esp
 1dd:	83 f8 0d             	cmp    $0xd,%eax
 1e0:	77 4a                	ja     22c <fmtname+0x8c>
  memmove(buf, p, strlen(p));
 1e2:	83 ec 0c             	sub    $0xc,%esp
 1e5:	53                   	push   %ebx
 1e6:	e8 25 03 00 00       	call   510 <strlen>
 1eb:	83 c4 0c             	add    $0xc,%esp
 1ee:	50                   	push   %eax
 1ef:	53                   	push   %ebx
 1f0:	68 94 0f 00 00       	push   $0xf94
 1f5:	e8 a6 04 00 00       	call   6a0 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 1fa:	89 1c 24             	mov    %ebx,(%esp)
 1fd:	e8 0e 03 00 00       	call   510 <strlen>
 202:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
 205:	bb 94 0f 00 00       	mov    $0xf94,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 20a:	89 c6                	mov    %eax,%esi
 20c:	e8 ff 02 00 00       	call   510 <strlen>
 211:	ba 0e 00 00 00       	mov    $0xe,%edx
 216:	83 c4 0c             	add    $0xc,%esp
 219:	29 f2                	sub    %esi,%edx
 21b:	05 94 0f 00 00       	add    $0xf94,%eax
 220:	52                   	push   %edx
 221:	6a 20                	push   $0x20
 223:	50                   	push   %eax
 224:	e8 17 03 00 00       	call   540 <memset>
  return buf;
 229:	83 c4 10             	add    $0x10,%esp
}
 22c:	8d 65 f8             	lea    -0x8(%ebp),%esp
 22f:	89 d8                	mov    %ebx,%eax
 231:	5b                   	pop    %ebx
 232:	5e                   	pop    %esi
 233:	5d                   	pop    %ebp
 234:	c3                   	ret    
 235:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

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
 252:	e8 bc 04 00 00       	call   713 <open>
 257:	83 c4 10             	add    $0x10,%esp
 25a:	85 c0                	test   %eax,%eax
 25c:	0f 88 9e 01 00 00    	js     400 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 262:	83 ec 08             	sub    $0x8,%esp
 265:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 26b:	89 c3                	mov    %eax,%ebx
 26d:	56                   	push   %esi
 26e:	50                   	push   %eax
 26f:	e8 b7 04 00 00       	call   72b <fstat>
 274:	83 c4 10             	add    $0x10,%esp
 277:	85 c0                	test   %eax,%eax
 279:	0f 88 c1 01 00 00    	js     440 <ls+0x200>
  switch(st.type){
 27f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 286:	66 83 f8 01          	cmp    $0x1,%ax
 28a:	74 64                	je     2f0 <ls+0xb0>
 28c:	66 83 f8 02          	cmp    $0x2,%ax
 290:	74 1e                	je     2b0 <ls+0x70>
  close(fd);
 292:	83 ec 0c             	sub    $0xc,%esp
 295:	53                   	push   %ebx
 296:	e8 60 04 00 00       	call   6fb <close>
 29b:	83 c4 10             	add    $0x10,%esp
}
 29e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a1:	5b                   	pop    %ebx
 2a2:	5e                   	pop    %esi
 2a3:	5f                   	pop    %edi
 2a4:	5d                   	pop    %ebp
 2a5:	c3                   	ret    
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 2b0:	83 ec 0c             	sub    $0xc,%esp
 2b3:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 2b9:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 2bf:	57                   	push   %edi
 2c0:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 2c6:	e8 d5 fe ff ff       	call   1a0 <fmtname>
 2cb:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 2d1:	59                   	pop    %ecx
 2d2:	5f                   	pop    %edi
 2d3:	52                   	push   %edx
 2d4:	56                   	push   %esi
 2d5:	6a 02                	push   $0x2
 2d7:	50                   	push   %eax
 2d8:	68 80 0b 00 00       	push   $0xb80
 2dd:	6a 01                	push   $0x1
 2df:	e8 4c 05 00 00       	call   830 <printf>
    break;
 2e4:	83 c4 20             	add    $0x20,%esp
 2e7:	eb a9                	jmp    292 <ls+0x52>
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 2f0:	83 ec 0c             	sub    $0xc,%esp
 2f3:	57                   	push   %edi
 2f4:	e8 17 02 00 00       	call   510 <strlen>
 2f9:	83 c4 10             	add    $0x10,%esp
 2fc:	83 c0 10             	add    $0x10,%eax
 2ff:	3d 00 02 00 00       	cmp    $0x200,%eax
 304:	0f 87 16 01 00 00    	ja     420 <ls+0x1e0>
    strcpy(buf, path);
 30a:	83 ec 08             	sub    $0x8,%esp
 30d:	57                   	push   %edi
 30e:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 314:	57                   	push   %edi
 315:	e8 66 01 00 00       	call   480 <strcpy>
    p = buf+strlen(buf);
 31a:	89 3c 24             	mov    %edi,(%esp)
 31d:	e8 ee 01 00 00       	call   510 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 322:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 325:	01 f8                	add    %edi,%eax
    *p++ = '/';
 327:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 32a:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 330:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 336:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 340:	83 ec 04             	sub    $0x4,%esp
 343:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 349:	6a 10                	push   $0x10
 34b:	50                   	push   %eax
 34c:	53                   	push   %ebx
 34d:	e8 99 03 00 00       	call   6eb <read>
 352:	83 c4 10             	add    $0x10,%esp
 355:	83 f8 10             	cmp    $0x10,%eax
 358:	0f 85 34 ff ff ff    	jne    292 <ls+0x52>
      if(de.inum == 0)
 35e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 365:	00 
 366:	74 d8                	je     340 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 368:	83 ec 04             	sub    $0x4,%esp
 36b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 371:	6a 0e                	push   $0xe
 373:	50                   	push   %eax
 374:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 37a:	e8 21 03 00 00       	call   6a0 <memmove>
      p[DIRSIZ] = 0;
 37f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 385:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 389:	58                   	pop    %eax
 38a:	5a                   	pop    %edx
 38b:	56                   	push   %esi
 38c:	57                   	push   %edi
 38d:	e8 7e 02 00 00       	call   610 <stat>
 392:	83 c4 10             	add    $0x10,%esp
 395:	85 c0                	test   %eax,%eax
 397:	0f 88 cb 00 00 00    	js     468 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 39d:	83 ec 0c             	sub    $0xc,%esp
 3a0:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 3a6:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 3ac:	57                   	push   %edi
 3ad:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 3b4:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 3ba:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 3c0:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 3c6:	e8 d5 fd ff ff       	call   1a0 <fmtname>
 3cb:	5a                   	pop    %edx
 3cc:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 3d2:	59                   	pop    %ecx
 3d3:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 3d9:	51                   	push   %ecx
 3da:	52                   	push   %edx
 3db:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 3e1:	50                   	push   %eax
 3e2:	68 80 0b 00 00       	push   $0xb80
 3e7:	6a 01                	push   $0x1
 3e9:	e8 42 04 00 00       	call   830 <printf>
 3ee:	83 c4 20             	add    $0x20,%esp
 3f1:	e9 4a ff ff ff       	jmp    340 <ls+0x100>
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 400:	83 ec 04             	sub    $0x4,%esp
 403:	57                   	push   %edi
 404:	68 58 0b 00 00       	push   $0xb58
 409:	6a 02                	push   $0x2
 40b:	e8 20 04 00 00       	call   830 <printf>
    return;
 410:	83 c4 10             	add    $0x10,%esp
}
 413:	8d 65 f4             	lea    -0xc(%ebp),%esp
 416:	5b                   	pop    %ebx
 417:	5e                   	pop    %esi
 418:	5f                   	pop    %edi
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret    
 41b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop
      printf(1, "ls: path too long\n");
 420:	83 ec 08             	sub    $0x8,%esp
 423:	68 8d 0b 00 00       	push   $0xb8d
 428:	6a 01                	push   $0x1
 42a:	e8 01 04 00 00       	call   830 <printf>
      break;
 42f:	83 c4 10             	add    $0x10,%esp
 432:	e9 5b fe ff ff       	jmp    292 <ls+0x52>
 437:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43e:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 440:	83 ec 04             	sub    $0x4,%esp
 443:	57                   	push   %edi
 444:	68 6c 0b 00 00       	push   $0xb6c
 449:	6a 02                	push   $0x2
 44b:	e8 e0 03 00 00       	call   830 <printf>
    close(fd);
 450:	89 1c 24             	mov    %ebx,(%esp)
 453:	e8 a3 02 00 00       	call   6fb <close>
    return;
 458:	83 c4 10             	add    $0x10,%esp
}
 45b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45e:	5b                   	pop    %ebx
 45f:	5e                   	pop    %esi
 460:	5f                   	pop    %edi
 461:	5d                   	pop    %ebp
 462:	c3                   	ret    
 463:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 467:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
 468:	83 ec 04             	sub    $0x4,%esp
 46b:	57                   	push   %edi
 46c:	68 6c 0b 00 00       	push   $0xb6c
 471:	6a 01                	push   $0x1
 473:	e8 b8 03 00 00       	call   830 <printf>
        continue;
 478:	83 c4 10             	add    $0x10,%esp
 47b:	e9 c0 fe ff ff       	jmp    340 <ls+0x100>

00000480 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 480:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 481:	31 c0                	xor    %eax,%eax
{
 483:	89 e5                	mov    %esp,%ebp
 485:	53                   	push   %ebx
 486:	8b 4d 08             	mov    0x8(%ebp),%ecx
 489:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 48c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 490:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 494:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 497:	83 c0 01             	add    $0x1,%eax
 49a:	84 d2                	test   %dl,%dl
 49c:	75 f2                	jne    490 <strcpy+0x10>
    ;
  return os;
}
 49e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a1:	89 c8                	mov    %ecx,%eax
 4a3:	c9                   	leave  
 4a4:	c3                   	ret    
 4a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	53                   	push   %ebx
 4b4:	8b 55 08             	mov    0x8(%ebp),%edx
 4b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 4ba:	0f b6 02             	movzbl (%edx),%eax
 4bd:	84 c0                	test   %al,%al
 4bf:	75 17                	jne    4d8 <strcmp+0x28>
 4c1:	eb 3a                	jmp    4fd <strcmp+0x4d>
 4c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c7:	90                   	nop
 4c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 4cc:	83 c2 01             	add    $0x1,%edx
 4cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 4d2:	84 c0                	test   %al,%al
 4d4:	74 1a                	je     4f0 <strcmp+0x40>
    p++, q++;
 4d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 4d8:	0f b6 19             	movzbl (%ecx),%ebx
 4db:	38 c3                	cmp    %al,%bl
 4dd:	74 e9                	je     4c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 4df:	29 d8                	sub    %ebx,%eax
}
 4e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4e4:	c9                   	leave  
 4e5:	c3                   	ret    
 4e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 4f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 4f4:	31 c0                	xor    %eax,%eax
 4f6:	29 d8                	sub    %ebx,%eax
}
 4f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4fb:	c9                   	leave  
 4fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 4fd:	0f b6 19             	movzbl (%ecx),%ebx
 500:	31 c0                	xor    %eax,%eax
 502:	eb db                	jmp    4df <strcmp+0x2f>
 504:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 50f:	90                   	nop

00000510 <strlen>:

uint
strlen(const char *s)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 516:	80 3a 00             	cmpb   $0x0,(%edx)
 519:	74 15                	je     530 <strlen+0x20>
 51b:	31 c0                	xor    %eax,%eax
 51d:	8d 76 00             	lea    0x0(%esi),%esi
 520:	83 c0 01             	add    $0x1,%eax
 523:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 527:	89 c1                	mov    %eax,%ecx
 529:	75 f5                	jne    520 <strlen+0x10>
    ;
  return n;
}
 52b:	89 c8                	mov    %ecx,%eax
 52d:	5d                   	pop    %ebp
 52e:	c3                   	ret    
 52f:	90                   	nop
  for(n = 0; s[n]; n++)
 530:	31 c9                	xor    %ecx,%ecx
}
 532:	5d                   	pop    %ebp
 533:	89 c8                	mov    %ecx,%eax
 535:	c3                   	ret    
 536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi

00000540 <memset>:

void*
memset(void *dst, int c, uint n)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 547:	8b 4d 10             	mov    0x10(%ebp),%ecx
 54a:	8b 45 0c             	mov    0xc(%ebp),%eax
 54d:	89 d7                	mov    %edx,%edi
 54f:	fc                   	cld    
 550:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 552:	8b 7d fc             	mov    -0x4(%ebp),%edi
 555:	89 d0                	mov    %edx,%eax
 557:	c9                   	leave  
 558:	c3                   	ret    
 559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000560 <strchr>:

char*
strchr(const char *s, char c)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	8b 45 08             	mov    0x8(%ebp),%eax
 566:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 56a:	0f b6 10             	movzbl (%eax),%edx
 56d:	84 d2                	test   %dl,%dl
 56f:	75 12                	jne    583 <strchr+0x23>
 571:	eb 1d                	jmp    590 <strchr+0x30>
 573:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 577:	90                   	nop
 578:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 57c:	83 c0 01             	add    $0x1,%eax
 57f:	84 d2                	test   %dl,%dl
 581:	74 0d                	je     590 <strchr+0x30>
    if(*s == c)
 583:	38 d1                	cmp    %dl,%cl
 585:	75 f1                	jne    578 <strchr+0x18>
      return (char*)s;
  return 0;
}
 587:	5d                   	pop    %ebp
 588:	c3                   	ret    
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 590:	31 c0                	xor    %eax,%eax
}
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    
 594:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <gets>:

char*
gets(char *buf, int max)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 5a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 5a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 5a9:	31 db                	xor    %ebx,%ebx
{
 5ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 5ae:	eb 27                	jmp    5d7 <gets+0x37>
    cc = read(0, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
 5b3:	6a 01                	push   $0x1
 5b5:	57                   	push   %edi
 5b6:	6a 00                	push   $0x0
 5b8:	e8 2e 01 00 00       	call   6eb <read>
    if(cc < 1)
 5bd:	83 c4 10             	add    $0x10,%esp
 5c0:	85 c0                	test   %eax,%eax
 5c2:	7e 1d                	jle    5e1 <gets+0x41>
      break;
    buf[i++] = c;
 5c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5c8:	8b 55 08             	mov    0x8(%ebp),%edx
 5cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 5cf:	3c 0a                	cmp    $0xa,%al
 5d1:	74 1d                	je     5f0 <gets+0x50>
 5d3:	3c 0d                	cmp    $0xd,%al
 5d5:	74 19                	je     5f0 <gets+0x50>
  for(i=0; i+1 < max; ){
 5d7:	89 de                	mov    %ebx,%esi
 5d9:	83 c3 01             	add    $0x1,%ebx
 5dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5df:	7c cf                	jl     5b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 5e1:	8b 45 08             	mov    0x8(%ebp),%eax
 5e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 5e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5eb:	5b                   	pop    %ebx
 5ec:	5e                   	pop    %esi
 5ed:	5f                   	pop    %edi
 5ee:	5d                   	pop    %ebp
 5ef:	c3                   	ret    
  buf[i] = '\0';
 5f0:	8b 45 08             	mov    0x8(%ebp),%eax
 5f3:	89 de                	mov    %ebx,%esi
 5f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 5f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5fc:	5b                   	pop    %ebx
 5fd:	5e                   	pop    %esi
 5fe:	5f                   	pop    %edi
 5ff:	5d                   	pop    %ebp
 600:	c3                   	ret    
 601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 608:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop

00000610 <stat>:

int
stat(const char *n, struct stat *st)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	56                   	push   %esi
 614:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 615:	83 ec 08             	sub    $0x8,%esp
 618:	6a 00                	push   $0x0
 61a:	ff 75 08             	push   0x8(%ebp)
 61d:	e8 f1 00 00 00       	call   713 <open>
  if(fd < 0)
 622:	83 c4 10             	add    $0x10,%esp
 625:	85 c0                	test   %eax,%eax
 627:	78 27                	js     650 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 629:	83 ec 08             	sub    $0x8,%esp
 62c:	ff 75 0c             	push   0xc(%ebp)
 62f:	89 c3                	mov    %eax,%ebx
 631:	50                   	push   %eax
 632:	e8 f4 00 00 00       	call   72b <fstat>
  close(fd);
 637:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 63a:	89 c6                	mov    %eax,%esi
  close(fd);
 63c:	e8 ba 00 00 00       	call   6fb <close>
  return r;
 641:	83 c4 10             	add    $0x10,%esp
}
 644:	8d 65 f8             	lea    -0x8(%ebp),%esp
 647:	89 f0                	mov    %esi,%eax
 649:	5b                   	pop    %ebx
 64a:	5e                   	pop    %esi
 64b:	5d                   	pop    %ebp
 64c:	c3                   	ret    
 64d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 650:	be ff ff ff ff       	mov    $0xffffffff,%esi
 655:	eb ed                	jmp    644 <stat+0x34>
 657:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65e:	66 90                	xchg   %ax,%ax

00000660 <atoi>:

int
atoi(const char *s)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	53                   	push   %ebx
 664:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 667:	0f be 02             	movsbl (%edx),%eax
 66a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 66d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 670:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 675:	77 1e                	ja     695 <atoi+0x35>
 677:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 680:	83 c2 01             	add    $0x1,%edx
 683:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 686:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 68a:	0f be 02             	movsbl (%edx),%eax
 68d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 690:	80 fb 09             	cmp    $0x9,%bl
 693:	76 eb                	jbe    680 <atoi+0x20>
  return n;
}
 695:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 698:	89 c8                	mov    %ecx,%eax
 69a:	c9                   	leave  
 69b:	c3                   	ret    
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	8b 45 10             	mov    0x10(%ebp),%eax
 6a7:	8b 55 08             	mov    0x8(%ebp),%edx
 6aa:	56                   	push   %esi
 6ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 6ae:	85 c0                	test   %eax,%eax
 6b0:	7e 13                	jle    6c5 <memmove+0x25>
 6b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 6b4:	89 d7                	mov    %edx,%edi
 6b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 6c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 6c1:	39 f8                	cmp    %edi,%eax
 6c3:	75 fb                	jne    6c0 <memmove+0x20>
  return vdst;
}
 6c5:	5e                   	pop    %esi
 6c6:	89 d0                	mov    %edx,%eax
 6c8:	5f                   	pop    %edi
 6c9:	5d                   	pop    %ebp
 6ca:	c3                   	ret    

000006cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6cb:	b8 01 00 00 00       	mov    $0x1,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <exit>:
SYSCALL(exit)
 6d3:	b8 02 00 00 00       	mov    $0x2,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <wait>:
SYSCALL(wait)
 6db:	b8 03 00 00 00       	mov    $0x3,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <pipe>:
SYSCALL(pipe)
 6e3:	b8 04 00 00 00       	mov    $0x4,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <read>:
SYSCALL(read)
 6eb:	b8 05 00 00 00       	mov    $0x5,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <write>:
SYSCALL(write)
 6f3:	b8 10 00 00 00       	mov    $0x10,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <close>:
SYSCALL(close)
 6fb:	b8 15 00 00 00       	mov    $0x15,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <kill>:
SYSCALL(kill)
 703:	b8 06 00 00 00       	mov    $0x6,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret    

0000070b <exec>:
SYSCALL(exec)
 70b:	b8 07 00 00 00       	mov    $0x7,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <open>:
SYSCALL(open)
 713:	b8 0f 00 00 00       	mov    $0xf,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <mknod>:
SYSCALL(mknod)
 71b:	b8 11 00 00 00       	mov    $0x11,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <unlink>:
SYSCALL(unlink)
 723:	b8 12 00 00 00       	mov    $0x12,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    

0000072b <fstat>:
SYSCALL(fstat)
 72b:	b8 08 00 00 00       	mov    $0x8,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret    

00000733 <link>:
SYSCALL(link)
 733:	b8 13 00 00 00       	mov    $0x13,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret    

0000073b <mkdir>:
SYSCALL(mkdir)
 73b:	b8 14 00 00 00       	mov    $0x14,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <chdir>:
SYSCALL(chdir)
 743:	b8 09 00 00 00       	mov    $0x9,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <dup>:
SYSCALL(dup)
 74b:	b8 0a 00 00 00       	mov    $0xa,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <getpid>:
SYSCALL(getpid)
 753:	b8 0b 00 00 00       	mov    $0xb,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <sbrk>:
SYSCALL(sbrk)
 75b:	b8 0c 00 00 00       	mov    $0xc,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    

00000763 <sleep>:
SYSCALL(sleep)
 763:	b8 0d 00 00 00       	mov    $0xd,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret    

0000076b <uptime>:
SYSCALL(uptime)
 76b:	b8 0e 00 00 00       	mov    $0xe,%eax
 770:	cd 40                	int    $0x40
 772:	c3                   	ret    

00000773 <getprocs>:
SYSCALL(getprocs)
 773:	b8 16 00 00 00       	mov    $0x16,%eax
 778:	cd 40                	int    $0x40
 77a:	c3                   	ret    
 77b:	66 90                	xchg   %ax,%ax
 77d:	66 90                	xchg   %ax,%ax
 77f:	90                   	nop

00000780 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 3c             	sub    $0x3c,%esp
 789:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 78c:	89 d1                	mov    %edx,%ecx
{
 78e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 791:	85 d2                	test   %edx,%edx
 793:	0f 89 7f 00 00 00    	jns    818 <printint+0x98>
 799:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 79d:	74 79                	je     818 <printint+0x98>
    neg = 1;
 79f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 7a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 7a8:	31 db                	xor    %ebx,%ebx
 7aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 7ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 7b0:	89 c8                	mov    %ecx,%eax
 7b2:	31 d2                	xor    %edx,%edx
 7b4:	89 cf                	mov    %ecx,%edi
 7b6:	f7 75 c4             	divl   -0x3c(%ebp)
 7b9:	0f b6 92 14 0c 00 00 	movzbl 0xc14(%edx),%edx
 7c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 7c3:	89 d8                	mov    %ebx,%eax
 7c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 7c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 7cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 7ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 7d1:	76 dd                	jbe    7b0 <printint+0x30>
  if(neg)
 7d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 7d6:	85 c9                	test   %ecx,%ecx
 7d8:	74 0c                	je     7e6 <printint+0x66>
    buf[i++] = '-';
 7da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 7df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 7e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 7e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 7e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 7ed:	eb 07                	jmp    7f6 <printint+0x76>
 7ef:	90                   	nop
    putc(fd, buf[i]);
 7f0:	0f b6 13             	movzbl (%ebx),%edx
 7f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 7f6:	83 ec 04             	sub    $0x4,%esp
 7f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 7fc:	6a 01                	push   $0x1
 7fe:	56                   	push   %esi
 7ff:	57                   	push   %edi
 800:	e8 ee fe ff ff       	call   6f3 <write>
  while(--i >= 0)
 805:	83 c4 10             	add    $0x10,%esp
 808:	39 de                	cmp    %ebx,%esi
 80a:	75 e4                	jne    7f0 <printint+0x70>
}
 80c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 80f:	5b                   	pop    %ebx
 810:	5e                   	pop    %esi
 811:	5f                   	pop    %edi
 812:	5d                   	pop    %ebp
 813:	c3                   	ret    
 814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 818:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 81f:	eb 87                	jmp    7a8 <printint+0x28>
 821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 828:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82f:	90                   	nop

00000830 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	57                   	push   %edi
 834:	56                   	push   %esi
 835:	53                   	push   %ebx
 836:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 839:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 83c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 83f:	0f b6 13             	movzbl (%ebx),%edx
 842:	84 d2                	test   %dl,%dl
 844:	74 6a                	je     8b0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 846:	8d 45 10             	lea    0x10(%ebp),%eax
 849:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 84c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 84f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 851:	89 45 d0             	mov    %eax,-0x30(%ebp)
 854:	eb 36                	jmp    88c <printf+0x5c>
 856:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85d:	8d 76 00             	lea    0x0(%esi),%esi
 860:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 863:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 868:	83 f8 25             	cmp    $0x25,%eax
 86b:	74 15                	je     882 <printf+0x52>
  write(fd, &c, 1);
 86d:	83 ec 04             	sub    $0x4,%esp
 870:	88 55 e7             	mov    %dl,-0x19(%ebp)
 873:	6a 01                	push   $0x1
 875:	57                   	push   %edi
 876:	56                   	push   %esi
 877:	e8 77 fe ff ff       	call   6f3 <write>
 87c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 87f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 882:	0f b6 13             	movzbl (%ebx),%edx
 885:	83 c3 01             	add    $0x1,%ebx
 888:	84 d2                	test   %dl,%dl
 88a:	74 24                	je     8b0 <printf+0x80>
    c = fmt[i] & 0xff;
 88c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 88f:	85 c9                	test   %ecx,%ecx
 891:	74 cd                	je     860 <printf+0x30>
      }
    } else if(state == '%'){
 893:	83 f9 25             	cmp    $0x25,%ecx
 896:	75 ea                	jne    882 <printf+0x52>
      if(c == 'd'){
 898:	83 f8 25             	cmp    $0x25,%eax
 89b:	0f 84 07 01 00 00    	je     9a8 <printf+0x178>
 8a1:	83 e8 63             	sub    $0x63,%eax
 8a4:	83 f8 15             	cmp    $0x15,%eax
 8a7:	77 17                	ja     8c0 <printf+0x90>
 8a9:	ff 24 85 bc 0b 00 00 	jmp    *0xbbc(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8b3:	5b                   	pop    %ebx
 8b4:	5e                   	pop    %esi
 8b5:	5f                   	pop    %edi
 8b6:	5d                   	pop    %ebp
 8b7:	c3                   	ret    
 8b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8bf:	90                   	nop
  write(fd, &c, 1);
 8c0:	83 ec 04             	sub    $0x4,%esp
 8c3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 8c6:	6a 01                	push   $0x1
 8c8:	57                   	push   %edi
 8c9:	56                   	push   %esi
 8ca:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8ce:	e8 20 fe ff ff       	call   6f3 <write>
        putc(fd, c);
 8d3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 8d7:	83 c4 0c             	add    $0xc,%esp
 8da:	88 55 e7             	mov    %dl,-0x19(%ebp)
 8dd:	6a 01                	push   $0x1
 8df:	57                   	push   %edi
 8e0:	56                   	push   %esi
 8e1:	e8 0d fe ff ff       	call   6f3 <write>
        putc(fd, c);
 8e6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8e9:	31 c9                	xor    %ecx,%ecx
 8eb:	eb 95                	jmp    882 <printf+0x52>
 8ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 8f0:	83 ec 0c             	sub    $0xc,%esp
 8f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8f8:	6a 00                	push   $0x0
 8fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8fd:	8b 10                	mov    (%eax),%edx
 8ff:	89 f0                	mov    %esi,%eax
 901:	e8 7a fe ff ff       	call   780 <printint>
        ap++;
 906:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 90a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 90d:	31 c9                	xor    %ecx,%ecx
 90f:	e9 6e ff ff ff       	jmp    882 <printf+0x52>
 914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 918:	8b 45 d0             	mov    -0x30(%ebp),%eax
 91b:	8b 10                	mov    (%eax),%edx
        ap++;
 91d:	83 c0 04             	add    $0x4,%eax
 920:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 923:	85 d2                	test   %edx,%edx
 925:	0f 84 8d 00 00 00    	je     9b8 <printf+0x188>
        while(*s != 0){
 92b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 92e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 930:	84 c0                	test   %al,%al
 932:	0f 84 4a ff ff ff    	je     882 <printf+0x52>
 938:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 93b:	89 d3                	mov    %edx,%ebx
 93d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 940:	83 ec 04             	sub    $0x4,%esp
          s++;
 943:	83 c3 01             	add    $0x1,%ebx
 946:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 949:	6a 01                	push   $0x1
 94b:	57                   	push   %edi
 94c:	56                   	push   %esi
 94d:	e8 a1 fd ff ff       	call   6f3 <write>
        while(*s != 0){
 952:	0f b6 03             	movzbl (%ebx),%eax
 955:	83 c4 10             	add    $0x10,%esp
 958:	84 c0                	test   %al,%al
 95a:	75 e4                	jne    940 <printf+0x110>
      state = 0;
 95c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 95f:	31 c9                	xor    %ecx,%ecx
 961:	e9 1c ff ff ff       	jmp    882 <printf+0x52>
 966:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 96d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 970:	83 ec 0c             	sub    $0xc,%esp
 973:	b9 0a 00 00 00       	mov    $0xa,%ecx
 978:	6a 01                	push   $0x1
 97a:	e9 7b ff ff ff       	jmp    8fa <printf+0xca>
 97f:	90                   	nop
        putc(fd, *ap);
 980:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 983:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 986:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 988:	6a 01                	push   $0x1
 98a:	57                   	push   %edi
 98b:	56                   	push   %esi
        putc(fd, *ap);
 98c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 98f:	e8 5f fd ff ff       	call   6f3 <write>
        ap++;
 994:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 998:	83 c4 10             	add    $0x10,%esp
      state = 0;
 99b:	31 c9                	xor    %ecx,%ecx
 99d:	e9 e0 fe ff ff       	jmp    882 <printf+0x52>
 9a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 9a8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 9ab:	83 ec 04             	sub    $0x4,%esp
 9ae:	e9 2a ff ff ff       	jmp    8dd <printf+0xad>
 9b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9b7:	90                   	nop
          s = "(null)";
 9b8:	ba b5 0b 00 00       	mov    $0xbb5,%edx
        while(*s != 0){
 9bd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 9c0:	b8 28 00 00 00       	mov    $0x28,%eax
 9c5:	89 d3                	mov    %edx,%ebx
 9c7:	e9 74 ff ff ff       	jmp    940 <printf+0x110>
 9cc:	66 90                	xchg   %ax,%ax
 9ce:	66 90                	xchg   %ax,%ax

000009d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d1:	a1 a4 0f 00 00       	mov    0xfa4,%eax
{
 9d6:	89 e5                	mov    %esp,%ebp
 9d8:	57                   	push   %edi
 9d9:	56                   	push   %esi
 9da:	53                   	push   %ebx
 9db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 9de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9e8:	89 c2                	mov    %eax,%edx
 9ea:	8b 00                	mov    (%eax),%eax
 9ec:	39 ca                	cmp    %ecx,%edx
 9ee:	73 30                	jae    a20 <free+0x50>
 9f0:	39 c1                	cmp    %eax,%ecx
 9f2:	72 04                	jb     9f8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9f4:	39 c2                	cmp    %eax,%edx
 9f6:	72 f0                	jb     9e8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9fe:	39 f8                	cmp    %edi,%eax
 a00:	74 30                	je     a32 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 a02:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 a05:	8b 42 04             	mov    0x4(%edx),%eax
 a08:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a0b:	39 f1                	cmp    %esi,%ecx
 a0d:	74 3a                	je     a49 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 a0f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 a11:	5b                   	pop    %ebx
  freep = p;
 a12:	89 15 a4 0f 00 00    	mov    %edx,0xfa4
}
 a18:	5e                   	pop    %esi
 a19:	5f                   	pop    %edi
 a1a:	5d                   	pop    %ebp
 a1b:	c3                   	ret    
 a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a20:	39 c2                	cmp    %eax,%edx
 a22:	72 c4                	jb     9e8 <free+0x18>
 a24:	39 c1                	cmp    %eax,%ecx
 a26:	73 c0                	jae    9e8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 a28:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a2b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a2e:	39 f8                	cmp    %edi,%eax
 a30:	75 d0                	jne    a02 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 a32:	03 70 04             	add    0x4(%eax),%esi
 a35:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a38:	8b 02                	mov    (%edx),%eax
 a3a:	8b 00                	mov    (%eax),%eax
 a3c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 a3f:	8b 42 04             	mov    0x4(%edx),%eax
 a42:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a45:	39 f1                	cmp    %esi,%ecx
 a47:	75 c6                	jne    a0f <free+0x3f>
    p->s.size += bp->s.size;
 a49:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 a4c:	89 15 a4 0f 00 00    	mov    %edx,0xfa4
    p->s.size += bp->s.size;
 a52:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 a55:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 a58:	89 0a                	mov    %ecx,(%edx)
}
 a5a:	5b                   	pop    %ebx
 a5b:	5e                   	pop    %esi
 a5c:	5f                   	pop    %edi
 a5d:	5d                   	pop    %ebp
 a5e:	c3                   	ret    
 a5f:	90                   	nop

00000a60 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
 a63:	57                   	push   %edi
 a64:	56                   	push   %esi
 a65:	53                   	push   %ebx
 a66:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a69:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a6c:	8b 3d a4 0f 00 00    	mov    0xfa4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a72:	8d 70 07             	lea    0x7(%eax),%esi
 a75:	c1 ee 03             	shr    $0x3,%esi
 a78:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a7b:	85 ff                	test   %edi,%edi
 a7d:	0f 84 9d 00 00 00    	je     b20 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a83:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 a85:	8b 4a 04             	mov    0x4(%edx),%ecx
 a88:	39 f1                	cmp    %esi,%ecx
 a8a:	73 6a                	jae    af6 <malloc+0x96>
 a8c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a91:	39 de                	cmp    %ebx,%esi
 a93:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a96:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a9d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 aa0:	eb 17                	jmp    ab9 <malloc+0x59>
 aa2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 aaa:	8b 48 04             	mov    0x4(%eax),%ecx
 aad:	39 f1                	cmp    %esi,%ecx
 aaf:	73 4f                	jae    b00 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ab1:	8b 3d a4 0f 00 00    	mov    0xfa4,%edi
 ab7:	89 c2                	mov    %eax,%edx
 ab9:	39 d7                	cmp    %edx,%edi
 abb:	75 eb                	jne    aa8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 abd:	83 ec 0c             	sub    $0xc,%esp
 ac0:	ff 75 e4             	push   -0x1c(%ebp)
 ac3:	e8 93 fc ff ff       	call   75b <sbrk>
  if(p == (char*)-1)
 ac8:	83 c4 10             	add    $0x10,%esp
 acb:	83 f8 ff             	cmp    $0xffffffff,%eax
 ace:	74 1c                	je     aec <malloc+0x8c>
  hp->s.size = nu;
 ad0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 ad3:	83 ec 0c             	sub    $0xc,%esp
 ad6:	83 c0 08             	add    $0x8,%eax
 ad9:	50                   	push   %eax
 ada:	e8 f1 fe ff ff       	call   9d0 <free>
  return freep;
 adf:	8b 15 a4 0f 00 00    	mov    0xfa4,%edx
      if((p = morecore(nunits)) == 0)
 ae5:	83 c4 10             	add    $0x10,%esp
 ae8:	85 d2                	test   %edx,%edx
 aea:	75 bc                	jne    aa8 <malloc+0x48>
        return 0;
  }
}
 aec:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 aef:	31 c0                	xor    %eax,%eax
}
 af1:	5b                   	pop    %ebx
 af2:	5e                   	pop    %esi
 af3:	5f                   	pop    %edi
 af4:	5d                   	pop    %ebp
 af5:	c3                   	ret    
    if(p->s.size >= nunits){
 af6:	89 d0                	mov    %edx,%eax
 af8:	89 fa                	mov    %edi,%edx
 afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 b00:	39 ce                	cmp    %ecx,%esi
 b02:	74 4c                	je     b50 <malloc+0xf0>
        p->s.size -= nunits;
 b04:	29 f1                	sub    %esi,%ecx
 b06:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 b09:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 b0c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 b0f:	89 15 a4 0f 00 00    	mov    %edx,0xfa4
}
 b15:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b18:	83 c0 08             	add    $0x8,%eax
}
 b1b:	5b                   	pop    %ebx
 b1c:	5e                   	pop    %esi
 b1d:	5f                   	pop    %edi
 b1e:	5d                   	pop    %ebp
 b1f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 b20:	c7 05 a4 0f 00 00 a8 	movl   $0xfa8,0xfa4
 b27:	0f 00 00 
    base.s.size = 0;
 b2a:	bf a8 0f 00 00       	mov    $0xfa8,%edi
    base.s.ptr = freep = prevp = &base;
 b2f:	c7 05 a8 0f 00 00 a8 	movl   $0xfa8,0xfa8
 b36:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b39:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 b3b:	c7 05 ac 0f 00 00 00 	movl   $0x0,0xfac
 b42:	00 00 00 
    if(p->s.size >= nunits){
 b45:	e9 42 ff ff ff       	jmp    a8c <malloc+0x2c>
 b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b50:	8b 08                	mov    (%eax),%ecx
 b52:	89 0a                	mov    %ecx,(%edx)
 b54:	eb b9                	jmp    b0f <malloc+0xaf>
