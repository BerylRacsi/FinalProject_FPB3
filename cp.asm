
_cp:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

void ls(char *path);
char* fmtname(char *path);

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	81 ec b8 01 00 00    	sub    $0x1b8,%esp

	if (argc !=3)
  17:	83 39 03             	cmpl   $0x3,(%ecx)

void ls(char *path);
char* fmtname(char *path);

int main(int argc, char *argv[])
{
  1a:	8b 59 04             	mov    0x4(%ecx),%ebx

	if (argc !=3)
  1d:	74 14                	je     33 <main+0x33>
	{
		printf(1, "please input the command as [cp src_file dest_file]\n");
  1f:	83 ec 08             	sub    $0x8,%esp
  22:	68 d0 0b 00 00       	push   $0xbd0
  27:	6a 01                	push   $0x1
  29:	e8 d2 07 00 00       	call   800 <printf>
		exit();
  2e:	e8 7f 06 00 00       	call   6b2 <exit>
	}
	

	int fd_src = open(argv[1], O_RDONLY);
  33:	50                   	push   %eax
  34:	50                   	push   %eax
  35:	6a 00                	push   $0x0
  37:	ff 73 04             	pushl  0x4(%ebx)
  3a:	e8 b3 06 00 00       	call   6f2 <open>
	if (fd_src == -1)
  3f:	83 c4 10             	add    $0x10,%esp
  42:	83 f8 ff             	cmp    $0xffffffff,%eax
		printf(1, "please input the command as [cp src_file dest_file]\n");
		exit();
	}
	

	int fd_src = open(argv[1], O_RDONLY);
  45:	89 c6                	mov    %eax,%esi
	if (fd_src == -1)
  47:	0f 84 1e 01 00 00    	je     16b <main+0x16b>
		exit();
	}
	
	
	struct stat st;
	fstat(fd_src, &st);
  4d:	8d 85 54 fe ff ff    	lea    -0x1ac(%ebp),%eax
  53:	57                   	push   %edi
  54:	57                   	push   %edi
  55:	50                   	push   %eax
  56:	56                   	push   %esi
  57:	e8 ae 06 00 00       	call   70a <fstat>
	if (st.type == T_DIR)
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	66 83 bd 54 fe ff ff 	cmpw   $0x1,-0x1ac(%ebp)
  66:	01 
  67:	0f 84 c6 00 00 00    	je     133 <main+0x133>
		printf(1, "So, I'm sorry that you have to copy them one by one.\n");
		exit();
	}


	char com[128] = {};
  6d:	8d bd 68 fe ff ff    	lea    -0x198(%ebp),%edi
  73:	31 c0                	xor    %eax,%eax
  75:	b9 20 00 00 00       	mov    $0x20,%ecx
  7a:	f3 ab                	rep stos %eax,%es:(%edi)
	strcpy(com, argv[2]);
  7c:	57                   	push   %edi
  7d:	57                   	push   %edi
  7e:	8d bd 68 fe ff ff    	lea    -0x198(%ebp),%edi
  84:	ff 73 08             	pushl  0x8(%ebx)
  87:	57                   	push   %edi
  88:	e8 e3 03 00 00       	call   470 <strcpy>
	int len1 = strlen(argv[1]);
  8d:	58                   	pop    %eax
  8e:	ff 73 04             	pushl  0x4(%ebx)
  91:	e8 5a 04 00 00       	call   4f0 <strlen>
  96:	89 85 44 fe ff ff    	mov    %eax,-0x1bc(%ebp)
	int len2 = strlen(argv[2]);
  9c:	58                   	pop    %eax
  9d:	ff 73 08             	pushl  0x8(%ebx)
  a0:	e8 4b 04 00 00       	call   4f0 <strlen>
	if (argv[2][len2-1] == '/')
  a5:	8b 53 08             	mov    0x8(%ebx),%edx
  a8:	83 c4 10             	add    $0x10,%esp
  ab:	80 7c 02 ff 2f       	cmpb   $0x2f,-0x1(%edx,%eax,1)
  b0:	0f 84 c8 00 00 00    	je     17e <main+0x17e>
		i++;
		strcpy(&com[len2], &argv[1][i]);
	}
	

	int fd_dest = open(com, O_WRONLY|O_CREATE);
  b6:	51                   	push   %ecx
  b7:	51                   	push   %ecx
  b8:	68 01 02 00 00       	push   $0x201
  bd:	57                   	push   %edi
  be:	e8 2f 06 00 00       	call   6f2 <open>
	if (fd_dest == -1)
  c3:	83 c4 10             	add    $0x10,%esp
		i++;
		strcpy(&com[len2], &argv[1][i]);
	}
	

	int fd_dest = open(com, O_WRONLY|O_CREATE);
  c6:	89 85 44 fe ff ff    	mov    %eax,-0x1bc(%ebp)
	if (fd_dest == -1)
  cc:	83 c0 01             	add    $0x1,%eax
  cf:	0f 84 db 00 00 00    	je     1b0 <main+0x1b0>
		printf(1, "create dest file failed\n");
		exit();
	}
	

	char buf[BUF_SIZE] = {};
  d5:	8d 9d e8 fe ff ff    	lea    -0x118(%ebp),%ebx
  db:	b9 40 00 00 00       	mov    $0x40,%ecx
  e0:	31 c0                	xor    %eax,%eax
  e2:	89 df                	mov    %ebx,%edi
  e4:	f3 ab                	rep stos %eax,%es:(%edi)
	int len = 0;
	while((len = read(fd_src, buf, BUF_SIZE)) > 0)
  e6:	eb 1b                	jmp    103 <main+0x103>
  e8:	90                   	nop
  e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		write(fd_dest, buf, len);
  f0:	83 ec 04             	sub    $0x4,%esp
  f3:	50                   	push   %eax
  f4:	53                   	push   %ebx
  f5:	ff b5 44 fe ff ff    	pushl  -0x1bc(%ebp)
  fb:	e8 d2 05 00 00       	call   6d2 <write>
 100:	83 c4 10             	add    $0x10,%esp
	}
	

	char buf[BUF_SIZE] = {};
	int len = 0;
	while((len = read(fd_src, buf, BUF_SIZE)) > 0)
 103:	83 ec 04             	sub    $0x4,%esp
 106:	68 00 01 00 00       	push   $0x100
 10b:	53                   	push   %ebx
 10c:	56                   	push   %esi
 10d:	e8 b8 05 00 00       	call   6ca <read>
 112:	83 c4 10             	add    $0x10,%esp
 115:	85 c0                	test   %eax,%eax
 117:	7f d7                	jg     f0 <main+0xf0>
		write(fd_dest, buf, len);
	
	
	close(fd_src);
 119:	83 ec 0c             	sub    $0xc,%esp
 11c:	56                   	push   %esi
 11d:	e8 b8 05 00 00       	call   6da <close>
	close(fd_dest);
 122:	58                   	pop    %eax
 123:	ff b5 44 fe ff ff    	pushl  -0x1bc(%ebp)
 129:	e8 ac 05 00 00       	call   6da <close>
	exit();
 12e:	e8 7f 05 00 00       	call   6b2 <exit>
	
	struct stat st;
	fstat(fd_src, &st);
	if (st.type == T_DIR)
	{
		printf(1, "source file is a directory, the files in that directory is:\n");
 133:	50                   	push   %eax
 134:	50                   	push   %eax
 135:	68 08 0c 00 00       	push   $0xc08
 13a:	6a 01                	push   $0x1
 13c:	e8 bf 06 00 00       	call   800 <printf>
		ls(argv[1]);
 141:	58                   	pop    %eax
 142:	ff 73 04             	pushl  0x4(%ebx)
 145:	e8 26 01 00 00       	call   270 <ls>
		printf(1, "the program can't open the file in that directory after list them.\n");
 14a:	58                   	pop    %eax
 14b:	5a                   	pop    %edx
 14c:	68 48 0c 00 00       	push   $0xc48
 151:	6a 01                	push   $0x1
 153:	e8 a8 06 00 00       	call   800 <printf>
		printf(1, "So, I'm sorry that you have to copy them one by one.\n");
 158:	59                   	pop    %ecx
 159:	5b                   	pop    %ebx
 15a:	68 8c 0c 00 00       	push   $0xc8c
 15f:	6a 01                	push   $0x1
 161:	e8 9a 06 00 00       	call   800 <printf>
		exit();
 166:	e8 47 05 00 00       	call   6b2 <exit>
	

	int fd_src = open(argv[1], O_RDONLY);
	if (fd_src == -1)
	{
		printf(1, "open source file failed\n");
 16b:	50                   	push   %eax
 16c:	50                   	push   %eax
 16d:	68 4f 0b 00 00       	push   $0xb4f
 172:	6a 01                	push   $0x1
 174:	e8 87 06 00 00       	call   800 <printf>
		exit();
 179:	e8 34 05 00 00       	call   6b2 <exit>
	int len1 = strlen(argv[1]);
	int len2 = strlen(argv[2]);
	if (argv[2][len2-1] == '/')
	{
	
		int i = len1 - 1;
 17e:	8b 95 44 fe ff ff    	mov    -0x1bc(%ebp),%edx
 184:	8b 5b 04             	mov    0x4(%ebx),%ebx
 187:	83 ea 01             	sub    $0x1,%edx
		for (; i >= 0; i--)
 18a:	eb 09                	jmp    195 <main+0x195>
			if (argv[1][i] == '/')
 18c:	80 3c 13 2f          	cmpb   $0x2f,(%ebx,%edx,1)
 190:	74 07                	je     199 <main+0x199>
	int len2 = strlen(argv[2]);
	if (argv[2][len2-1] == '/')
	{
	
		int i = len1 - 1;
		for (; i >= 0; i--)
 192:	83 ea 01             	sub    $0x1,%edx
 195:	85 d2                	test   %edx,%edx
 197:	79 f3                	jns    18c <main+0x18c>
			if (argv[1][i] == '/')
				break;
		i++;
		strcpy(&com[len2], &argv[1][i]);
 199:	8d 54 13 01          	lea    0x1(%ebx,%edx,1),%edx
 19d:	01 f8                	add    %edi,%eax
 19f:	51                   	push   %ecx
 1a0:	51                   	push   %ecx
 1a1:	52                   	push   %edx
 1a2:	50                   	push   %eax
 1a3:	e8 c8 02 00 00       	call   470 <strcpy>
 1a8:	83 c4 10             	add    $0x10,%esp
 1ab:	e9 06 ff ff ff       	jmp    b6 <main+0xb6>
	

	int fd_dest = open(com, O_WRONLY|O_CREATE);
	if (fd_dest == -1)
	{
		printf(1, "create dest file failed\n");
 1b0:	52                   	push   %edx
 1b1:	52                   	push   %edx
 1b2:	68 68 0b 00 00       	push   $0xb68
 1b7:	6a 01                	push   $0x1
 1b9:	e8 42 06 00 00       	call   800 <printf>
		exit();
 1be:	e8 ef 04 00 00       	call   6b2 <exit>
 1c3:	66 90                	xchg   %ax,%ax
 1c5:	66 90                	xchg   %ax,%ax
 1c7:	66 90                	xchg   %ax,%ax
 1c9:	66 90                	xchg   %ax,%ax
 1cb:	66 90                	xchg   %ax,%ax
 1cd:	66 90                	xchg   %ax,%ax
 1cf:	90                   	nop

000001d0 <fmtname>:
	close(fd_dest);
	exit();
}

char* fmtname(char *path)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
 1d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
	static char buf[DIRSIZ+1];
	char *p;
	
	// Find first character after last slash.
	for(p=path+strlen(path); p >= path && *p != '/'; p--)
 1d8:	83 ec 0c             	sub    $0xc,%esp
 1db:	53                   	push   %ebx
 1dc:	e8 0f 03 00 00       	call   4f0 <strlen>
 1e1:	83 c4 10             	add    $0x10,%esp
 1e4:	01 d8                	add    %ebx,%eax
 1e6:	73 0f                	jae    1f7 <fmtname+0x27>
 1e8:	eb 12                	jmp    1fc <fmtname+0x2c>
 1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1f0:	83 e8 01             	sub    $0x1,%eax
 1f3:	39 c3                	cmp    %eax,%ebx
 1f5:	77 05                	ja     1fc <fmtname+0x2c>
 1f7:	80 38 2f             	cmpb   $0x2f,(%eax)
 1fa:	75 f4                	jne    1f0 <fmtname+0x20>
		;
	p++;
 1fc:	8d 58 01             	lea    0x1(%eax),%ebx
	
	// Return blank-padded name.
	if(strlen(p) >= DIRSIZ)
 1ff:	83 ec 0c             	sub    $0xc,%esp
 202:	53                   	push   %ebx
 203:	e8 e8 02 00 00       	call   4f0 <strlen>
 208:	83 c4 10             	add    $0x10,%esp
 20b:	83 f8 0d             	cmp    $0xd,%eax
 20e:	77 4a                	ja     25a <fmtname+0x8a>
		return p;
	memmove(buf, p, strlen(p));
 210:	83 ec 0c             	sub    $0xc,%esp
 213:	53                   	push   %ebx
 214:	e8 d7 02 00 00       	call   4f0 <strlen>
 219:	83 c4 0c             	add    $0xc,%esp
 21c:	50                   	push   %eax
 21d:	53                   	push   %ebx
 21e:	68 d8 0f 00 00       	push   $0xfd8
 223:	e8 58 04 00 00       	call   680 <memmove>
	memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 228:	89 1c 24             	mov    %ebx,(%esp)
 22b:	e8 c0 02 00 00       	call   4f0 <strlen>
 230:	89 1c 24             	mov    %ebx,(%esp)
 233:	89 c6                	mov    %eax,%esi
	return buf;
 235:	bb d8 0f 00 00       	mov    $0xfd8,%ebx
	
	// Return blank-padded name.
	if(strlen(p) >= DIRSIZ)
		return p;
	memmove(buf, p, strlen(p));
	memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 23a:	e8 b1 02 00 00       	call   4f0 <strlen>
 23f:	ba 0e 00 00 00       	mov    $0xe,%edx
 244:	83 c4 0c             	add    $0xc,%esp
 247:	05 d8 0f 00 00       	add    $0xfd8,%eax
 24c:	29 f2                	sub    %esi,%edx
 24e:	52                   	push   %edx
 24f:	6a 20                	push   $0x20
 251:	50                   	push   %eax
 252:	e8 c9 02 00 00       	call   520 <memset>
	return buf;
 257:	83 c4 10             	add    $0x10,%esp
}
 25a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 25d:	89 d8                	mov    %ebx,%eax
 25f:	5b                   	pop    %ebx
 260:	5e                   	pop    %esi
 261:	5d                   	pop    %ebp
 262:	c3                   	ret    
 263:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <ls>:

void ls(char *path)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	53                   	push   %ebx
 276:	81 ec 54 02 00 00    	sub    $0x254,%esp
 27c:	8b 7d 08             	mov    0x8(%ebp),%edi
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;
	
	if((fd = open(path, 0)) < 0)
 27f:	6a 00                	push   $0x0
 281:	57                   	push   %edi
 282:	e8 6b 04 00 00       	call   6f2 <open>
 287:	83 c4 10             	add    $0x10,%esp
 28a:	85 c0                	test   %eax,%eax
 28c:	0f 88 66 01 00 00    	js     3f8 <ls+0x188>
	{
		printf(2, "cannot open %s\n", path);
		return;
	}
	
	if(fstat(fd, &st) < 0)
 292:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 298:	83 ec 08             	sub    $0x8,%esp
 29b:	89 c3                	mov    %eax,%ebx
 29d:	56                   	push   %esi
 29e:	50                   	push   %eax
 29f:	e8 66 04 00 00       	call   70a <fstat>
 2a4:	83 c4 10             	add    $0x10,%esp
 2a7:	85 c0                	test   %eax,%eax
 2a9:	0f 88 81 01 00 00    	js     430 <ls+0x1c0>
		printf(2, "cannot stat %s\n", path);
		close(fd);
		return;
	}
	
	switch(st.type)
 2af:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 2b6:	66 83 f8 01          	cmp    $0x1,%ax
 2ba:	74 44                	je     300 <ls+0x90>
 2bc:	66 83 f8 02          	cmp    $0x2,%ax
 2c0:	75 20                	jne    2e2 <ls+0x72>
	{
		case T_FILE:
		printf(1, "name = %s, type = file, size = %d\n", fmtname(path), st.size);
 2c2:	83 ec 0c             	sub    $0xc,%esp
 2c5:	8b b5 e4 fd ff ff    	mov    -0x21c(%ebp),%esi
 2cb:	57                   	push   %edi
 2cc:	e8 ff fe ff ff       	call   1d0 <fmtname>
 2d1:	56                   	push   %esi
 2d2:	50                   	push   %eax
 2d3:	68 84 0b 00 00       	push   $0xb84
 2d8:	6a 01                	push   $0x1
 2da:	e8 21 05 00 00       	call   800 <printf>
		break;
 2df:	83 c4 20             	add    $0x20,%esp
			}
			printf(1, "name = %s, type = directory, size = %d\n", fmtname(buf), st.size);
		}
		break;
	}
close(fd);
 2e2:	83 ec 0c             	sub    $0xc,%esp
 2e5:	53                   	push   %ebx
 2e6:	e8 ef 03 00 00       	call   6da <close>
 2eb:	83 c4 10             	add    $0x10,%esp
}
 2ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2f1:	5b                   	pop    %ebx
 2f2:	5e                   	pop    %esi
 2f3:	5f                   	pop    %edi
 2f4:	5d                   	pop    %ebp
 2f5:	c3                   	ret    
 2f6:	8d 76 00             	lea    0x0(%esi),%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		case T_FILE:
		printf(1, "name = %s, type = file, size = %d\n", fmtname(path), st.size);
		break;
		
		case T_DIR:
		if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf)
 300:	83 ec 0c             	sub    $0xc,%esp
 303:	57                   	push   %edi
 304:	e8 e7 01 00 00       	call   4f0 <strlen>
 309:	83 c0 10             	add    $0x10,%eax
 30c:	83 c4 10             	add    $0x10,%esp
 30f:	3d 00 02 00 00       	cmp    $0x200,%eax
 314:	0f 87 fe 00 00 00    	ja     418 <ls+0x1a8>
		{
			printf(1, "path too long\n");
			break;
		}
		strcpy(buf, path);
 31a:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 320:	83 ec 08             	sub    $0x8,%esp
 323:	57                   	push   %edi
 324:	8d bd c4 fd ff ff    	lea    -0x23c(%ebp),%edi
 32a:	50                   	push   %eax
 32b:	e8 40 01 00 00       	call   470 <strcpy>
		p = buf+strlen(buf);
 330:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 336:	89 04 24             	mov    %eax,(%esp)
 339:	e8 b2 01 00 00       	call   4f0 <strlen>
 33e:	8d 8d e8 fd ff ff    	lea    -0x218(%ebp),%ecx
		*p++ = '/';
		
		while(read(fd, &de, sizeof(de)) == sizeof(de))
 344:	83 c4 10             	add    $0x10,%esp
		{
			printf(1, "path too long\n");
			break;
		}
		strcpy(buf, path);
		p = buf+strlen(buf);
 347:	01 c1                	add    %eax,%ecx
		*p++ = '/';
 349:	8d 84 05 e9 fd ff ff 	lea    -0x217(%ebp,%eax,1),%eax
		{
			printf(1, "path too long\n");
			break;
		}
		strcpy(buf, path);
		p = buf+strlen(buf);
 350:	89 8d b0 fd ff ff    	mov    %ecx,-0x250(%ebp)
		*p++ = '/';
 356:	c6 01 2f             	movb   $0x2f,(%ecx)
 359:	89 85 ac fd ff ff    	mov    %eax,-0x254(%ebp)
 35f:	90                   	nop
		
		while(read(fd, &de, sizeof(de)) == sizeof(de))
 360:	83 ec 04             	sub    $0x4,%esp
 363:	6a 10                	push   $0x10
 365:	57                   	push   %edi
 366:	53                   	push   %ebx
 367:	e8 5e 03 00 00       	call   6ca <read>
 36c:	83 c4 10             	add    $0x10,%esp
 36f:	83 f8 10             	cmp    $0x10,%eax
 372:	0f 85 6a ff ff ff    	jne    2e2 <ls+0x72>
		{
			if(de.inum == 0)
 378:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 37f:	00 
 380:	74 de                	je     360 <ls+0xf0>
				continue;
			memmove(p, de.name, DIRSIZ);
 382:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 388:	83 ec 04             	sub    $0x4,%esp
 38b:	6a 0e                	push   $0xe
 38d:	50                   	push   %eax
 38e:	ff b5 ac fd ff ff    	pushl  -0x254(%ebp)
 394:	e8 e7 02 00 00       	call   680 <memmove>
			p[DIRSIZ] = 0;
 399:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
 39f:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
			if(stat(buf, &st) < 0)
 3a3:	58                   	pop    %eax
 3a4:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 3aa:	5a                   	pop    %edx
 3ab:	56                   	push   %esi
 3ac:	50                   	push   %eax
 3ad:	e8 3e 02 00 00       	call   5f0 <stat>
 3b2:	83 c4 10             	add    $0x10,%esp
 3b5:	85 c0                	test   %eax,%eax
 3b7:	0f 88 93 00 00 00    	js     450 <ls+0x1e0>
			{
				printf(1, "cannot stat %s\n", buf);
				continue;
			}
			printf(1, "name = %s, type = directory, size = %d\n", fmtname(buf), st.size);
 3bd:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 3c3:	83 ec 0c             	sub    $0xc,%esp
 3c6:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 3cc:	50                   	push   %eax
 3cd:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 3d3:	e8 f8 fd ff ff       	call   1d0 <fmtname>
 3d8:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 3de:	52                   	push   %edx
 3df:	50                   	push   %eax
 3e0:	68 a8 0b 00 00       	push   $0xba8
 3e5:	6a 01                	push   $0x1
 3e7:	e8 14 04 00 00       	call   800 <printf>
 3ec:	83 c4 20             	add    $0x20,%esp
 3ef:	e9 6c ff ff ff       	jmp    360 <ls+0xf0>
 3f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	struct dirent de;
	struct stat st;
	
	if((fd = open(path, 0)) < 0)
	{
		printf(2, "cannot open %s\n", path);
 3f8:	83 ec 04             	sub    $0x4,%esp
 3fb:	57                   	push   %edi
 3fc:	68 20 0b 00 00       	push   $0xb20
 401:	6a 02                	push   $0x2
 403:	e8 f8 03 00 00       	call   800 <printf>
		return;
 408:	83 c4 10             	add    $0x10,%esp
			printf(1, "name = %s, type = directory, size = %d\n", fmtname(buf), st.size);
		}
		break;
	}
close(fd);
}
 40b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40e:	5b                   	pop    %ebx
 40f:	5e                   	pop    %esi
 410:	5f                   	pop    %edi
 411:	5d                   	pop    %ebp
 412:	c3                   	ret    
 413:	90                   	nop
 414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		break;
		
		case T_DIR:
		if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf)
		{
			printf(1, "path too long\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 40 0b 00 00       	push   $0xb40
 420:	6a 01                	push   $0x1
 422:	e8 d9 03 00 00       	call   800 <printf>
			break;
 427:	83 c4 10             	add    $0x10,%esp
 42a:	e9 b3 fe ff ff       	jmp    2e2 <ls+0x72>
 42f:	90                   	nop
		return;
	}
	
	if(fstat(fd, &st) < 0)
	{
		printf(2, "cannot stat %s\n", path);
 430:	83 ec 04             	sub    $0x4,%esp
 433:	57                   	push   %edi
 434:	68 30 0b 00 00       	push   $0xb30
 439:	6a 02                	push   $0x2
 43b:	e8 c0 03 00 00       	call   800 <printf>
		close(fd);
 440:	89 1c 24             	mov    %ebx,(%esp)
 443:	e8 92 02 00 00       	call   6da <close>
		return;
 448:	83 c4 10             	add    $0x10,%esp
 44b:	e9 9e fe ff ff       	jmp    2ee <ls+0x7e>
				continue;
			memmove(p, de.name, DIRSIZ);
			p[DIRSIZ] = 0;
			if(stat(buf, &st) < 0)
			{
				printf(1, "cannot stat %s\n", buf);
 450:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 456:	83 ec 04             	sub    $0x4,%esp
 459:	50                   	push   %eax
 45a:	68 30 0b 00 00       	push   $0xb30
 45f:	6a 01                	push   $0x1
 461:	e8 9a 03 00 00       	call   800 <printf>
				continue;
 466:	83 c4 10             	add    $0x10,%esp
 469:	e9 f2 fe ff ff       	jmp    360 <ls+0xf0>
 46e:	66 90                	xchg   %ax,%ax

00000470 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	53                   	push   %ebx
 474:	8b 45 08             	mov    0x8(%ebp),%eax
 477:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 47a:	89 c2                	mov    %eax,%edx
 47c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 480:	83 c1 01             	add    $0x1,%ecx
 483:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 487:	83 c2 01             	add    $0x1,%edx
 48a:	84 db                	test   %bl,%bl
 48c:	88 5a ff             	mov    %bl,-0x1(%edx)
 48f:	75 ef                	jne    480 <strcpy+0x10>
    ;
  return os;
}
 491:	5b                   	pop    %ebx
 492:	5d                   	pop    %ebp
 493:	c3                   	ret    
 494:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 49a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000004a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	56                   	push   %esi
 4a4:	53                   	push   %ebx
 4a5:	8b 55 08             	mov    0x8(%ebp),%edx
 4a8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 4ab:	0f b6 02             	movzbl (%edx),%eax
 4ae:	0f b6 19             	movzbl (%ecx),%ebx
 4b1:	84 c0                	test   %al,%al
 4b3:	75 1e                	jne    4d3 <strcmp+0x33>
 4b5:	eb 29                	jmp    4e0 <strcmp+0x40>
 4b7:	89 f6                	mov    %esi,%esi
 4b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 4c0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 4c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 4c6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 4c9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 4cd:	84 c0                	test   %al,%al
 4cf:	74 0f                	je     4e0 <strcmp+0x40>
 4d1:	89 f1                	mov    %esi,%ecx
 4d3:	38 d8                	cmp    %bl,%al
 4d5:	74 e9                	je     4c0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 4d7:	29 d8                	sub    %ebx,%eax
}
 4d9:	5b                   	pop    %ebx
 4da:	5e                   	pop    %esi
 4db:	5d                   	pop    %ebp
 4dc:	c3                   	ret    
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 4e0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 4e2:	29 d8                	sub    %ebx,%eax
}
 4e4:	5b                   	pop    %ebx
 4e5:	5e                   	pop    %esi
 4e6:	5d                   	pop    %ebp
 4e7:	c3                   	ret    
 4e8:	90                   	nop
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004f0 <strlen>:

uint
strlen(char *s)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4f6:	80 39 00             	cmpb   $0x0,(%ecx)
 4f9:	74 12                	je     50d <strlen+0x1d>
 4fb:	31 d2                	xor    %edx,%edx
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
 500:	83 c2 01             	add    $0x1,%edx
 503:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 507:	89 d0                	mov    %edx,%eax
 509:	75 f5                	jne    500 <strlen+0x10>
    ;
  return n;
}
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 50d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 50f:	5d                   	pop    %ebp
 510:	c3                   	ret    
 511:	eb 0d                	jmp    520 <memset>
 513:	90                   	nop
 514:	90                   	nop
 515:	90                   	nop
 516:	90                   	nop
 517:	90                   	nop
 518:	90                   	nop
 519:	90                   	nop
 51a:	90                   	nop
 51b:	90                   	nop
 51c:	90                   	nop
 51d:	90                   	nop
 51e:	90                   	nop
 51f:	90                   	nop

00000520 <memset>:

void*
memset(void *dst, int c, uint n)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 527:	8b 4d 10             	mov    0x10(%ebp),%ecx
 52a:	8b 45 0c             	mov    0xc(%ebp),%eax
 52d:	89 d7                	mov    %edx,%edi
 52f:	fc                   	cld    
 530:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 532:	89 d0                	mov    %edx,%eax
 534:	5f                   	pop    %edi
 535:	5d                   	pop    %ebp
 536:	c3                   	ret    
 537:	89 f6                	mov    %esi,%esi
 539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000540 <strchr>:

char*
strchr(const char *s, char c)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	53                   	push   %ebx
 544:	8b 45 08             	mov    0x8(%ebp),%eax
 547:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 54a:	0f b6 10             	movzbl (%eax),%edx
 54d:	84 d2                	test   %dl,%dl
 54f:	74 1d                	je     56e <strchr+0x2e>
    if(*s == c)
 551:	38 d3                	cmp    %dl,%bl
 553:	89 d9                	mov    %ebx,%ecx
 555:	75 0d                	jne    564 <strchr+0x24>
 557:	eb 17                	jmp    570 <strchr+0x30>
 559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 560:	38 ca                	cmp    %cl,%dl
 562:	74 0c                	je     570 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 564:	83 c0 01             	add    $0x1,%eax
 567:	0f b6 10             	movzbl (%eax),%edx
 56a:	84 d2                	test   %dl,%dl
 56c:	75 f2                	jne    560 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 56e:	31 c0                	xor    %eax,%eax
}
 570:	5b                   	pop    %ebx
 571:	5d                   	pop    %ebp
 572:	c3                   	ret    
 573:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000580 <gets>:

char*
gets(char *buf, int max)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	56                   	push   %esi
 585:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 586:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 588:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 58b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 58e:	eb 29                	jmp    5b9 <gets+0x39>
    cc = read(0, &c, 1);
 590:	83 ec 04             	sub    $0x4,%esp
 593:	6a 01                	push   $0x1
 595:	57                   	push   %edi
 596:	6a 00                	push   $0x0
 598:	e8 2d 01 00 00       	call   6ca <read>
    if(cc < 1)
 59d:	83 c4 10             	add    $0x10,%esp
 5a0:	85 c0                	test   %eax,%eax
 5a2:	7e 1d                	jle    5c1 <gets+0x41>
      break;
    buf[i++] = c;
 5a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5a8:	8b 55 08             	mov    0x8(%ebp),%edx
 5ab:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 5ad:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 5af:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 5b3:	74 1b                	je     5d0 <gets+0x50>
 5b5:	3c 0d                	cmp    $0xd,%al
 5b7:	74 17                	je     5d0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5b9:	8d 5e 01             	lea    0x1(%esi),%ebx
 5bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5bf:	7c cf                	jl     590 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 5c1:	8b 45 08             	mov    0x8(%ebp),%eax
 5c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 5c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cb:	5b                   	pop    %ebx
 5cc:	5e                   	pop    %esi
 5cd:	5f                   	pop    %edi
 5ce:	5d                   	pop    %ebp
 5cf:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 5d0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5d3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 5d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 5d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5dc:	5b                   	pop    %ebx
 5dd:	5e                   	pop    %esi
 5de:	5f                   	pop    %edi
 5df:	5d                   	pop    %ebp
 5e0:	c3                   	ret    
 5e1:	eb 0d                	jmp    5f0 <stat>
 5e3:	90                   	nop
 5e4:	90                   	nop
 5e5:	90                   	nop
 5e6:	90                   	nop
 5e7:	90                   	nop
 5e8:	90                   	nop
 5e9:	90                   	nop
 5ea:	90                   	nop
 5eb:	90                   	nop
 5ec:	90                   	nop
 5ed:	90                   	nop
 5ee:	90                   	nop
 5ef:	90                   	nop

000005f0 <stat>:

int
stat(char *n, struct stat *st)
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
 5fa:	ff 75 08             	pushl  0x8(%ebp)
 5fd:	e8 f0 00 00 00       	call   6f2 <open>
  if(fd < 0)
 602:	83 c4 10             	add    $0x10,%esp
 605:	85 c0                	test   %eax,%eax
 607:	78 27                	js     630 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 609:	83 ec 08             	sub    $0x8,%esp
 60c:	ff 75 0c             	pushl  0xc(%ebp)
 60f:	89 c3                	mov    %eax,%ebx
 611:	50                   	push   %eax
 612:	e8 f3 00 00 00       	call   70a <fstat>
 617:	89 c6                	mov    %eax,%esi
  close(fd);
 619:	89 1c 24             	mov    %ebx,(%esp)
 61c:	e8 b9 00 00 00       	call   6da <close>
  return r;
 621:	83 c4 10             	add    $0x10,%esp
 624:	89 f0                	mov    %esi,%eax
}
 626:	8d 65 f8             	lea    -0x8(%ebp),%esp
 629:	5b                   	pop    %ebx
 62a:	5e                   	pop    %esi
 62b:	5d                   	pop    %ebp
 62c:	c3                   	ret    
 62d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 630:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 635:	eb ef                	jmp    626 <stat+0x36>
 637:	89 f6                	mov    %esi,%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000640 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	53                   	push   %ebx
 644:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 647:	0f be 11             	movsbl (%ecx),%edx
 64a:	8d 42 d0             	lea    -0x30(%edx),%eax
 64d:	3c 09                	cmp    $0x9,%al
 64f:	b8 00 00 00 00       	mov    $0x0,%eax
 654:	77 1f                	ja     675 <atoi+0x35>
 656:	8d 76 00             	lea    0x0(%esi),%esi
 659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 660:	8d 04 80             	lea    (%eax,%eax,4),%eax
 663:	83 c1 01             	add    $0x1,%ecx
 666:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 66a:	0f be 11             	movsbl (%ecx),%edx
 66d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 670:	80 fb 09             	cmp    $0x9,%bl
 673:	76 eb                	jbe    660 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 675:	5b                   	pop    %ebx
 676:	5d                   	pop    %ebp
 677:	c3                   	ret    
 678:	90                   	nop
 679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000680 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	56                   	push   %esi
 684:	53                   	push   %ebx
 685:	8b 5d 10             	mov    0x10(%ebp),%ebx
 688:	8b 45 08             	mov    0x8(%ebp),%eax
 68b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 68e:	85 db                	test   %ebx,%ebx
 690:	7e 14                	jle    6a6 <memmove+0x26>
 692:	31 d2                	xor    %edx,%edx
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 698:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 69c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 69f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 6a2:	39 da                	cmp    %ebx,%edx
 6a4:	75 f2                	jne    698 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 6a6:	5b                   	pop    %ebx
 6a7:	5e                   	pop    %esi
 6a8:	5d                   	pop    %ebp
 6a9:	c3                   	ret    

000006aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6aa:	b8 01 00 00 00       	mov    $0x1,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    

000006b2 <exit>:
SYSCALL(exit)
 6b2:	b8 02 00 00 00       	mov    $0x2,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <wait>:
SYSCALL(wait)
 6ba:	b8 03 00 00 00       	mov    $0x3,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <pipe>:
SYSCALL(pipe)
 6c2:	b8 04 00 00 00       	mov    $0x4,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <read>:
SYSCALL(read)
 6ca:	b8 05 00 00 00       	mov    $0x5,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <write>:
SYSCALL(write)
 6d2:	b8 10 00 00 00       	mov    $0x10,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <close>:
SYSCALL(close)
 6da:	b8 15 00 00 00       	mov    $0x15,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <kill>:
SYSCALL(kill)
 6e2:	b8 06 00 00 00       	mov    $0x6,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <exec>:
SYSCALL(exec)
 6ea:	b8 07 00 00 00       	mov    $0x7,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <open>:
SYSCALL(open)
 6f2:	b8 0f 00 00 00       	mov    $0xf,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <mknod>:
SYSCALL(mknod)
 6fa:	b8 11 00 00 00       	mov    $0x11,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <unlink>:
SYSCALL(unlink)
 702:	b8 12 00 00 00       	mov    $0x12,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <fstat>:
SYSCALL(fstat)
 70a:	b8 08 00 00 00       	mov    $0x8,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <link>:
SYSCALL(link)
 712:	b8 13 00 00 00       	mov    $0x13,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <mkdir>:
SYSCALL(mkdir)
 71a:	b8 14 00 00 00       	mov    $0x14,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <chdir>:
SYSCALL(chdir)
 722:	b8 09 00 00 00       	mov    $0x9,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    

0000072a <dup>:
SYSCALL(dup)
 72a:	b8 0a 00 00 00       	mov    $0xa,%eax
 72f:	cd 40                	int    $0x40
 731:	c3                   	ret    

00000732 <getpid>:
SYSCALL(getpid)
 732:	b8 0b 00 00 00       	mov    $0xb,%eax
 737:	cd 40                	int    $0x40
 739:	c3                   	ret    

0000073a <sbrk>:
SYSCALL(sbrk)
 73a:	b8 0c 00 00 00       	mov    $0xc,%eax
 73f:	cd 40                	int    $0x40
 741:	c3                   	ret    

00000742 <sleep>:
SYSCALL(sleep)
 742:	b8 0d 00 00 00       	mov    $0xd,%eax
 747:	cd 40                	int    $0x40
 749:	c3                   	ret    

0000074a <uptime>:
SYSCALL(uptime)
 74a:	b8 0e 00 00 00       	mov    $0xe,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    
 752:	66 90                	xchg   %ax,%ax
 754:	66 90                	xchg   %ax,%ax
 756:	66 90                	xchg   %ax,%ax
 758:	66 90                	xchg   %ax,%ax
 75a:	66 90                	xchg   %ax,%ax
 75c:	66 90                	xchg   %ax,%ax
 75e:	66 90                	xchg   %ax,%ax

00000760 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	89 c6                	mov    %eax,%esi
 768:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 76e:	85 db                	test   %ebx,%ebx
 770:	74 7e                	je     7f0 <printint+0x90>
 772:	89 d0                	mov    %edx,%eax
 774:	c1 e8 1f             	shr    $0x1f,%eax
 777:	84 c0                	test   %al,%al
 779:	74 75                	je     7f0 <printint+0x90>
    neg = 1;
    x = -xx;
 77b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 77d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 784:	f7 d8                	neg    %eax
 786:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 789:	31 ff                	xor    %edi,%edi
 78b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 78e:	89 ce                	mov    %ecx,%esi
 790:	eb 08                	jmp    79a <printint+0x3a>
 792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 798:	89 cf                	mov    %ecx,%edi
 79a:	31 d2                	xor    %edx,%edx
 79c:	8d 4f 01             	lea    0x1(%edi),%ecx
 79f:	f7 f6                	div    %esi
 7a1:	0f b6 92 cc 0c 00 00 	movzbl 0xccc(%edx),%edx
  }while((x /= base) != 0);
 7a8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 7aa:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 7ad:	75 e9                	jne    798 <printint+0x38>
  if(neg)
 7af:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 7b2:	8b 75 c0             	mov    -0x40(%ebp),%esi
 7b5:	85 c0                	test   %eax,%eax
 7b7:	74 08                	je     7c1 <printint+0x61>
    buf[i++] = '-';
 7b9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 7be:	8d 4f 02             	lea    0x2(%edi),%ecx
 7c1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 7c5:	8d 76 00             	lea    0x0(%esi),%esi
 7c8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7cb:	83 ec 04             	sub    $0x4,%esp
 7ce:	83 ef 01             	sub    $0x1,%edi
 7d1:	6a 01                	push   $0x1
 7d3:	53                   	push   %ebx
 7d4:	56                   	push   %esi
 7d5:	88 45 d7             	mov    %al,-0x29(%ebp)
 7d8:	e8 f5 fe ff ff       	call   6d2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7dd:	83 c4 10             	add    $0x10,%esp
 7e0:	39 df                	cmp    %ebx,%edi
 7e2:	75 e4                	jne    7c8 <printint+0x68>
    putc(fd, buf[i]);
}
 7e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7e7:	5b                   	pop    %ebx
 7e8:	5e                   	pop    %esi
 7e9:	5f                   	pop    %edi
 7ea:	5d                   	pop    %ebp
 7eb:	c3                   	ret    
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 7f0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 7f2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 7f9:	eb 8b                	jmp    786 <printint+0x26>
 7fb:	90                   	nop
 7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000800 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 806:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 809:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 80c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 80f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 812:	89 45 d0             	mov    %eax,-0x30(%ebp)
 815:	0f b6 1e             	movzbl (%esi),%ebx
 818:	83 c6 01             	add    $0x1,%esi
 81b:	84 db                	test   %bl,%bl
 81d:	0f 84 b0 00 00 00    	je     8d3 <printf+0xd3>
 823:	31 d2                	xor    %edx,%edx
 825:	eb 39                	jmp    860 <printf+0x60>
 827:	89 f6                	mov    %esi,%esi
 829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 830:	83 f8 25             	cmp    $0x25,%eax
 833:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 836:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 83b:	74 18                	je     855 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 83d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 840:	83 ec 04             	sub    $0x4,%esp
 843:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 846:	6a 01                	push   $0x1
 848:	50                   	push   %eax
 849:	57                   	push   %edi
 84a:	e8 83 fe ff ff       	call   6d2 <write>
 84f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 852:	83 c4 10             	add    $0x10,%esp
 855:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 858:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 85c:	84 db                	test   %bl,%bl
 85e:	74 73                	je     8d3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 860:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 862:	0f be cb             	movsbl %bl,%ecx
 865:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 868:	74 c6                	je     830 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 86a:	83 fa 25             	cmp    $0x25,%edx
 86d:	75 e6                	jne    855 <printf+0x55>
      if(c == 'd'){
 86f:	83 f8 64             	cmp    $0x64,%eax
 872:	0f 84 f8 00 00 00    	je     970 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 878:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 87e:	83 f9 70             	cmp    $0x70,%ecx
 881:	74 5d                	je     8e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 883:	83 f8 73             	cmp    $0x73,%eax
 886:	0f 84 84 00 00 00    	je     910 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 88c:	83 f8 63             	cmp    $0x63,%eax
 88f:	0f 84 ea 00 00 00    	je     97f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 895:	83 f8 25             	cmp    $0x25,%eax
 898:	0f 84 c2 00 00 00    	je     960 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 89e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 8a1:	83 ec 04             	sub    $0x4,%esp
 8a4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8a8:	6a 01                	push   $0x1
 8aa:	50                   	push   %eax
 8ab:	57                   	push   %edi
 8ac:	e8 21 fe ff ff       	call   6d2 <write>
 8b1:	83 c4 0c             	add    $0xc,%esp
 8b4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 8b7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 8ba:	6a 01                	push   $0x1
 8bc:	50                   	push   %eax
 8bd:	57                   	push   %edi
 8be:	83 c6 01             	add    $0x1,%esi
 8c1:	e8 0c fe ff ff       	call   6d2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8c6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8ca:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8cd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8cf:	84 db                	test   %bl,%bl
 8d1:	75 8d                	jne    860 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8d6:	5b                   	pop    %ebx
 8d7:	5e                   	pop    %esi
 8d8:	5f                   	pop    %edi
 8d9:	5d                   	pop    %ebp
 8da:	c3                   	ret    
 8db:	90                   	nop
 8dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 8e0:	83 ec 0c             	sub    $0xc,%esp
 8e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8e8:	6a 00                	push   $0x0
 8ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 8ed:	89 f8                	mov    %edi,%eax
 8ef:	8b 13                	mov    (%ebx),%edx
 8f1:	e8 6a fe ff ff       	call   760 <printint>
        ap++;
 8f6:	89 d8                	mov    %ebx,%eax
 8f8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8fb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 8fd:	83 c0 04             	add    $0x4,%eax
 900:	89 45 d0             	mov    %eax,-0x30(%ebp)
 903:	e9 4d ff ff ff       	jmp    855 <printf+0x55>
 908:	90                   	nop
 909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 910:	8b 45 d0             	mov    -0x30(%ebp),%eax
 913:	8b 18                	mov    (%eax),%ebx
        ap++;
 915:	83 c0 04             	add    $0x4,%eax
 918:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 91b:	b8 c4 0c 00 00       	mov    $0xcc4,%eax
 920:	85 db                	test   %ebx,%ebx
 922:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 925:	0f b6 03             	movzbl (%ebx),%eax
 928:	84 c0                	test   %al,%al
 92a:	74 23                	je     94f <printf+0x14f>
 92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 930:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 933:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 936:	83 ec 04             	sub    $0x4,%esp
 939:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 93b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 93e:	50                   	push   %eax
 93f:	57                   	push   %edi
 940:	e8 8d fd ff ff       	call   6d2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 945:	0f b6 03             	movzbl (%ebx),%eax
 948:	83 c4 10             	add    $0x10,%esp
 94b:	84 c0                	test   %al,%al
 94d:	75 e1                	jne    930 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 94f:	31 d2                	xor    %edx,%edx
 951:	e9 ff fe ff ff       	jmp    855 <printf+0x55>
 956:	8d 76 00             	lea    0x0(%esi),%esi
 959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 960:	83 ec 04             	sub    $0x4,%esp
 963:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 966:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 969:	6a 01                	push   $0x1
 96b:	e9 4c ff ff ff       	jmp    8bc <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 970:	83 ec 0c             	sub    $0xc,%esp
 973:	b9 0a 00 00 00       	mov    $0xa,%ecx
 978:	6a 01                	push   $0x1
 97a:	e9 6b ff ff ff       	jmp    8ea <printf+0xea>
 97f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 982:	83 ec 04             	sub    $0x4,%esp
 985:	8b 03                	mov    (%ebx),%eax
 987:	6a 01                	push   $0x1
 989:	88 45 e4             	mov    %al,-0x1c(%ebp)
 98c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 98f:	50                   	push   %eax
 990:	57                   	push   %edi
 991:	e8 3c fd ff ff       	call   6d2 <write>
 996:	e9 5b ff ff ff       	jmp    8f6 <printf+0xf6>
 99b:	66 90                	xchg   %ax,%ax
 99d:	66 90                	xchg   %ax,%ax
 99f:	90                   	nop

000009a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9a1:	a1 e8 0f 00 00       	mov    0xfe8,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 9a6:	89 e5                	mov    %esp,%ebp
 9a8:	57                   	push   %edi
 9a9:	56                   	push   %esi
 9aa:	53                   	push   %ebx
 9ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9ae:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9b0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9b3:	39 c8                	cmp    %ecx,%eax
 9b5:	73 19                	jae    9d0 <free+0x30>
 9b7:	89 f6                	mov    %esi,%esi
 9b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 9c0:	39 d1                	cmp    %edx,%ecx
 9c2:	72 1c                	jb     9e0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9c4:	39 d0                	cmp    %edx,%eax
 9c6:	73 18                	jae    9e0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 9c8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ca:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9cc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ce:	72 f0                	jb     9c0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9d0:	39 d0                	cmp    %edx,%eax
 9d2:	72 f4                	jb     9c8 <free+0x28>
 9d4:	39 d1                	cmp    %edx,%ecx
 9d6:	73 f0                	jae    9c8 <free+0x28>
 9d8:	90                   	nop
 9d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 9e0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9e3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9e6:	39 d7                	cmp    %edx,%edi
 9e8:	74 19                	je     a03 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9ed:	8b 50 04             	mov    0x4(%eax),%edx
 9f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9f3:	39 f1                	cmp    %esi,%ecx
 9f5:	74 23                	je     a1a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9f7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9f9:	a3 e8 0f 00 00       	mov    %eax,0xfe8
}
 9fe:	5b                   	pop    %ebx
 9ff:	5e                   	pop    %esi
 a00:	5f                   	pop    %edi
 a01:	5d                   	pop    %ebp
 a02:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 a03:	03 72 04             	add    0x4(%edx),%esi
 a06:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a09:	8b 10                	mov    (%eax),%edx
 a0b:	8b 12                	mov    (%edx),%edx
 a0d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 a10:	8b 50 04             	mov    0x4(%eax),%edx
 a13:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a16:	39 f1                	cmp    %esi,%ecx
 a18:	75 dd                	jne    9f7 <free+0x57>
    p->s.size += bp->s.size;
 a1a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a1d:	a3 e8 0f 00 00       	mov    %eax,0xfe8
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a22:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a25:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a28:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 a2a:	5b                   	pop    %ebx
 a2b:	5e                   	pop    %esi
 a2c:	5f                   	pop    %edi
 a2d:	5d                   	pop    %ebp
 a2e:	c3                   	ret    
 a2f:	90                   	nop

00000a30 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	57                   	push   %edi
 a34:	56                   	push   %esi
 a35:	53                   	push   %ebx
 a36:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a39:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a3c:	8b 15 e8 0f 00 00    	mov    0xfe8,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a42:	8d 78 07             	lea    0x7(%eax),%edi
 a45:	c1 ef 03             	shr    $0x3,%edi
 a48:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 a4b:	85 d2                	test   %edx,%edx
 a4d:	0f 84 a3 00 00 00    	je     af6 <malloc+0xc6>
 a53:	8b 02                	mov    (%edx),%eax
 a55:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a58:	39 cf                	cmp    %ecx,%edi
 a5a:	76 74                	jbe    ad0 <malloc+0xa0>
 a5c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 a62:	be 00 10 00 00       	mov    $0x1000,%esi
 a67:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 a6e:	0f 43 f7             	cmovae %edi,%esi
 a71:	ba 00 80 00 00       	mov    $0x8000,%edx
 a76:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 a7c:	0f 46 da             	cmovbe %edx,%ebx
 a7f:	eb 10                	jmp    a91 <malloc+0x61>
 a81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a88:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a8a:	8b 48 04             	mov    0x4(%eax),%ecx
 a8d:	39 cf                	cmp    %ecx,%edi
 a8f:	76 3f                	jbe    ad0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a91:	39 05 e8 0f 00 00    	cmp    %eax,0xfe8
 a97:	89 c2                	mov    %eax,%edx
 a99:	75 ed                	jne    a88 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 a9b:	83 ec 0c             	sub    $0xc,%esp
 a9e:	53                   	push   %ebx
 a9f:	e8 96 fc ff ff       	call   73a <sbrk>
  if(p == (char*)-1)
 aa4:	83 c4 10             	add    $0x10,%esp
 aa7:	83 f8 ff             	cmp    $0xffffffff,%eax
 aaa:	74 1c                	je     ac8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 aac:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 aaf:	83 ec 0c             	sub    $0xc,%esp
 ab2:	83 c0 08             	add    $0x8,%eax
 ab5:	50                   	push   %eax
 ab6:	e8 e5 fe ff ff       	call   9a0 <free>
  return freep;
 abb:	8b 15 e8 0f 00 00    	mov    0xfe8,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 ac1:	83 c4 10             	add    $0x10,%esp
 ac4:	85 d2                	test   %edx,%edx
 ac6:	75 c0                	jne    a88 <malloc+0x58>
        return 0;
 ac8:	31 c0                	xor    %eax,%eax
 aca:	eb 1c                	jmp    ae8 <malloc+0xb8>
 acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 ad0:	39 cf                	cmp    %ecx,%edi
 ad2:	74 1c                	je     af0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 ad4:	29 f9                	sub    %edi,%ecx
 ad6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 ad9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 adc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 adf:	89 15 e8 0f 00 00    	mov    %edx,0xfe8
      return (void*)(p + 1);
 ae5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 ae8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 aeb:	5b                   	pop    %ebx
 aec:	5e                   	pop    %esi
 aed:	5f                   	pop    %edi
 aee:	5d                   	pop    %ebp
 aef:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 af0:	8b 08                	mov    (%eax),%ecx
 af2:	89 0a                	mov    %ecx,(%edx)
 af4:	eb e9                	jmp    adf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 af6:	c7 05 e8 0f 00 00 ec 	movl   $0xfec,0xfe8
 afd:	0f 00 00 
 b00:	c7 05 ec 0f 00 00 ec 	movl   $0xfec,0xfec
 b07:	0f 00 00 
    base.s.size = 0;
 b0a:	b8 ec 0f 00 00       	mov    $0xfec,%eax
 b0f:	c7 05 f0 0f 00 00 00 	movl   $0x0,0xff0
 b16:	00 00 00 
 b19:	e9 3e ff ff ff       	jmp    a5c <malloc+0x2c>
