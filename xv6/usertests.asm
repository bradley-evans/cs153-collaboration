
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 ee 51 00 00       	push   $0x51ee
      16:	6a 01                	push   $0x1
      18:	e8 c3 3e 00 00       	call   3ee0 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	5a                   	pop    %edx
      1e:	59                   	pop    %ecx
      1f:	6a 00                	push   $0x0
      21:	68 02 52 00 00       	push   $0x5202
      26:	e8 a7 3d 00 00       	call   3dd2 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 1b                	js     4d <main+0x4d>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	83 ec 08             	sub    $0x8,%esp
      35:	68 6c 59 00 00       	push   $0x596c
      3a:	6a 01                	push   $0x1
      3c:	e8 9f 3e 00 00       	call   3ee0 <printf>
    exit(0);
      41:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      48:	e8 45 3d 00 00       	call   3d92 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      4d:	50                   	push   %eax
      4e:	50                   	push   %eax
      4f:	68 00 02 00 00       	push   $0x200
      54:	68 02 52 00 00       	push   $0x5202
      59:	e8 74 3d 00 00       	call   3dd2 <open>
      5e:	89 04 24             	mov    %eax,(%esp)
      61:	e8 54 3d 00 00       	call   3dba <close>

  argptest();
      66:	e8 55 3a 00 00       	call   3ac0 <argptest>
  createdelete();
      6b:	e8 00 13 00 00       	call   1370 <createdelete>
  linkunlink();
      70:	e8 7b 1c 00 00       	call   1cf0 <linkunlink>
  concreate();
      75:	e8 36 19 00 00       	call   19b0 <concreate>
  fourfiles();
      7a:	e8 d1 10 00 00       	call   1150 <fourfiles>
  sharedfd();
      7f:	e8 0c 0f 00 00       	call   f90 <sharedfd>

  bigargtest();
      84:	e8 b7 36 00 00       	call   3740 <bigargtest>
  bigwrite();
      89:	e8 a2 26 00 00       	call   2730 <bigwrite>
  bigargtest();
      8e:	e8 ad 36 00 00       	call   3740 <bigargtest>
  bsstest();
      93:	e8 28 36 00 00       	call   36c0 <bsstest>
  sbrktest();
      98:	e8 d3 30 00 00       	call   3170 <sbrktest>
  validatetest();
      9d:	e8 5e 35 00 00       	call   3600 <validatetest>

  opentest();
      a2:	e8 c9 03 00 00       	call   470 <opentest>
  writetest();
      a7:	e8 64 04 00 00       	call   510 <writetest>
  writetest1();
      ac:	e8 6f 06 00 00       	call   720 <writetest1>
  createtest();
      b1:	e8 6a 08 00 00       	call   920 <createtest>

  openiputtest();
      b6:	e8 95 02 00 00       	call   350 <openiputtest>
  exitiputtest();
      bb:	e8 70 01 00 00       	call   230 <exitiputtest>
  iputtest();
      c0:	e8 6b 00 00 00       	call   130 <iputtest>

  mem();
      c5:	e8 e6 0d 00 00       	call   eb0 <mem>
  pipe1();
      ca:	e8 51 0a 00 00       	call   b20 <pipe1>
  preempt();
      cf:	e8 0c 0c 00 00       	call   ce0 <preempt>
  exitwait();
      d4:	e8 47 0d 00 00       	call   e20 <exitwait>

  rmdot();
      d9:	e8 a2 2a 00 00       	call   2b80 <rmdot>
  fourteen();
      de:	e8 3d 29 00 00       	call   2a20 <fourteen>
  bigfile();
      e3:	e8 38 27 00 00       	call   2820 <bigfile>
  subdir();
      e8:	e8 63 1e 00 00       	call   1f50 <subdir>
  linktest();
      ed:	e8 6e 16 00 00       	call   1760 <linktest>
  unlinkread();
      f2:	e8 a9 14 00 00       	call   15a0 <unlinkread>
  dirfile();
      f7:	e8 34 2c 00 00       	call   2d30 <dirfile>
  iref();
      fc:	e8 6f 2e 00 00       	call   2f70 <iref>
  forktest();
     101:	e8 9a 2f 00 00       	call   30a0 <forktest>
  bigdir(); // slow
     106:	e8 f5 1c 00 00       	call   1e00 <bigdir>

  uio();
     10b:	e8 30 39 00 00       	call   3a40 <uio>

  exectest();
     110:	e8 bb 09 00 00       	call   ad0 <exectest>

  exit(0);
     115:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     11c:	e8 71 3c 00 00       	call   3d92 <exit>
     121:	66 90                	xchg   %ax,%ax
     123:	66 90                	xchg   %ax,%ax
     125:	66 90                	xchg   %ax,%ax
     127:	66 90                	xchg   %ax,%ax
     129:	66 90                	xchg   %ax,%ax
     12b:	66 90                	xchg   %ax,%ax
     12d:	66 90                	xchg   %ax,%ax
     12f:	90                   	nop

00000130 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     136:	68 94 42 00 00       	push   $0x4294
     13b:	ff 35 94 62 00 00    	pushl  0x6294
     141:	e8 9a 3d 00 00       	call   3ee0 <printf>

  if(mkdir("iputdir") < 0){
     146:	c7 04 24 27 42 00 00 	movl   $0x4227,(%esp)
     14d:	e8 a8 3c 00 00       	call   3dfa <mkdir>
     152:	83 c4 10             	add    $0x10,%esp
     155:	85 c0                	test   %eax,%eax
     157:	78 58                	js     1b1 <iputtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit(0);
  }
  if(chdir("iputdir") < 0){
     159:	83 ec 0c             	sub    $0xc,%esp
     15c:	68 27 42 00 00       	push   $0x4227
     161:	e8 9c 3c 00 00       	call   3e02 <chdir>
     166:	83 c4 10             	add    $0x10,%esp
     169:	85 c0                	test   %eax,%eax
     16b:	0f 88 9a 00 00 00    	js     20b <iputtest+0xdb>
    printf(stdout, "chdir iputdir failed\n");
    exit(0);
  }
  if(unlink("../iputdir") < 0){
     171:	83 ec 0c             	sub    $0xc,%esp
     174:	68 24 42 00 00       	push   $0x4224
     179:	e8 64 3c 00 00       	call   3de2 <unlink>
     17e:	83 c4 10             	add    $0x10,%esp
     181:	85 c0                	test   %eax,%eax
     183:	78 68                	js     1ed <iputtest+0xbd>
    printf(stdout, "unlink ../iputdir failed\n");
    exit(0);
  }
  if(chdir("/") < 0){
     185:	83 ec 0c             	sub    $0xc,%esp
     188:	68 49 42 00 00       	push   $0x4249
     18d:	e8 70 3c 00 00       	call   3e02 <chdir>
     192:	83 c4 10             	add    $0x10,%esp
     195:	85 c0                	test   %eax,%eax
     197:	78 36                	js     1cf <iputtest+0x9f>
    printf(stdout, "chdir / failed\n");
    exit(0);
  }
  printf(stdout, "iput test ok\n");
     199:	83 ec 08             	sub    $0x8,%esp
     19c:	68 cc 42 00 00       	push   $0x42cc
     1a1:	ff 35 94 62 00 00    	pushl  0x6294
     1a7:	e8 34 3d 00 00       	call   3ee0 <printf>
}
     1ac:	83 c4 10             	add    $0x10,%esp
     1af:	c9                   	leave  
     1b0:	c3                   	ret    
iputtest(void)
{
  printf(stdout, "iput test\n");

  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
     1b1:	50                   	push   %eax
     1b2:	50                   	push   %eax
     1b3:	68 00 42 00 00       	push   $0x4200
     1b8:	ff 35 94 62 00 00    	pushl  0x6294
     1be:	e8 1d 3d 00 00       	call   3ee0 <printf>
    exit(0);
     1c3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1ca:	e8 c3 3b 00 00       	call   3d92 <exit>
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
    exit(0);
  }
  if(chdir("/") < 0){
    printf(stdout, "chdir / failed\n");
     1cf:	50                   	push   %eax
     1d0:	50                   	push   %eax
     1d1:	68 4b 42 00 00       	push   $0x424b
     1d6:	ff 35 94 62 00 00    	pushl  0x6294
     1dc:	e8 ff 3c 00 00       	call   3ee0 <printf>
    exit(0);
     1e1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1e8:	e8 a5 3b 00 00       	call   3d92 <exit>
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
    exit(0);
  }
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
     1ed:	52                   	push   %edx
     1ee:	52                   	push   %edx
     1ef:	68 2f 42 00 00       	push   $0x422f
     1f4:	ff 35 94 62 00 00    	pushl  0x6294
     1fa:	e8 e1 3c 00 00       	call   3ee0 <printf>
    exit(0);
     1ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     206:	e8 87 3b 00 00       	call   3d92 <exit>
  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
    exit(0);
  }
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
     20b:	51                   	push   %ecx
     20c:	51                   	push   %ecx
     20d:	68 0e 42 00 00       	push   $0x420e
     212:	ff 35 94 62 00 00    	pushl  0x6294
     218:	e8 c3 3c 00 00       	call   3ee0 <printf>
    exit(0);
     21d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     224:	e8 69 3b 00 00       	call   3d92 <exit>
     229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000230 <exitiputtest>:
}

// does exit(0) call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
     230:	55                   	push   %ebp
     231:	89 e5                	mov    %esp,%ebp
     233:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
     236:	68 5b 42 00 00       	push   $0x425b
     23b:	ff 35 94 62 00 00    	pushl  0x6294
     241:	e8 9a 3c 00 00       	call   3ee0 <printf>

  pid = fork();
     246:	e8 3f 3b 00 00       	call   3d8a <fork>
  if(pid < 0){
     24b:	83 c4 10             	add    $0x10,%esp
     24e:	85 c0                	test   %eax,%eax
     250:	0f 88 99 00 00 00    	js     2ef <exitiputtest+0xbf>
    printf(stdout, "fork failed\n");
    exit(0);
  }
  if(pid == 0){
     256:	75 58                	jne    2b0 <exitiputtest+0x80>
    if(mkdir("iputdir") < 0){
     258:	83 ec 0c             	sub    $0xc,%esp
     25b:	68 27 42 00 00       	push   $0x4227
     260:	e8 95 3b 00 00       	call   3dfa <mkdir>
     265:	83 c4 10             	add    $0x10,%esp
     268:	85 c0                	test   %eax,%eax
     26a:	0f 88 bb 00 00 00    	js     32b <exitiputtest+0xfb>
      printf(stdout, "mkdir failed\n");
      exit(0);
    }
    if(chdir("iputdir") < 0){
     270:	83 ec 0c             	sub    $0xc,%esp
     273:	68 27 42 00 00       	push   $0x4227
     278:	e8 85 3b 00 00       	call   3e02 <chdir>
     27d:	83 c4 10             	add    $0x10,%esp
     280:	85 c0                	test   %eax,%eax
     282:	0f 88 85 00 00 00    	js     30d <exitiputtest+0xdd>
      printf(stdout, "child chdir failed\n");
      exit(0);
    }
    if(unlink("../iputdir") < 0){
     288:	83 ec 0c             	sub    $0xc,%esp
     28b:	68 24 42 00 00       	push   $0x4224
     290:	e8 4d 3b 00 00       	call   3de2 <unlink>
     295:	83 c4 10             	add    $0x10,%esp
     298:	85 c0                	test   %eax,%eax
     29a:	78 34                	js     2d0 <exitiputtest+0xa0>
      printf(stdout, "unlink ../iputdir failed\n");
      exit(0);
    }
    exit(0);
     29c:	83 ec 0c             	sub    $0xc,%esp
     29f:	6a 00                	push   $0x0
     2a1:	e8 ec 3a 00 00       	call   3d92 <exit>
     2a6:	8d 76 00             	lea    0x0(%esi),%esi
     2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }
  wait();
     2b0:	e8 e5 3a 00 00       	call   3d9a <wait>
  printf(stdout, "exitiput test ok\n");
     2b5:	83 ec 08             	sub    $0x8,%esp
     2b8:	68 7e 42 00 00       	push   $0x427e
     2bd:	ff 35 94 62 00 00    	pushl  0x6294
     2c3:	e8 18 3c 00 00       	call   3ee0 <printf>
}
     2c8:	83 c4 10             	add    $0x10,%esp
     2cb:	c9                   	leave  
     2cc:	c3                   	ret    
     2cd:	8d 76 00             	lea    0x0(%esi),%esi
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
      exit(0);
    }
    if(unlink("../iputdir") < 0){
      printf(stdout, "unlink ../iputdir failed\n");
     2d0:	83 ec 08             	sub    $0x8,%esp
     2d3:	68 2f 42 00 00       	push   $0x422f
     2d8:	ff 35 94 62 00 00    	pushl  0x6294
     2de:	e8 fd 3b 00 00       	call   3ee0 <printf>
      exit(0);
     2e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     2ea:	e8 a3 3a 00 00       	call   3d92 <exit>

  printf(stdout, "exitiput test\n");

  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     2ef:	51                   	push   %ecx
     2f0:	51                   	push   %ecx
     2f1:	68 41 51 00 00       	push   $0x5141
     2f6:	ff 35 94 62 00 00    	pushl  0x6294
     2fc:	e8 df 3b 00 00       	call   3ee0 <printf>
    exit(0);
     301:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     308:	e8 85 3a 00 00       	call   3d92 <exit>
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
      exit(0);
    }
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
     30d:	50                   	push   %eax
     30e:	50                   	push   %eax
     30f:	68 6a 42 00 00       	push   $0x426a
     314:	ff 35 94 62 00 00    	pushl  0x6294
     31a:	e8 c1 3b 00 00       	call   3ee0 <printf>
      exit(0);
     31f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     326:	e8 67 3a 00 00       	call   3d92 <exit>
    printf(stdout, "fork failed\n");
    exit(0);
  }
  if(pid == 0){
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
     32b:	52                   	push   %edx
     32c:	52                   	push   %edx
     32d:	68 00 42 00 00       	push   $0x4200
     332:	ff 35 94 62 00 00    	pushl  0x6294
     338:	e8 a3 3b 00 00       	call   3ee0 <printf>
      exit(0);
     33d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     344:	e8 49 3a 00 00       	call   3d92 <exit>
     349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000350 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
     356:	68 90 42 00 00       	push   $0x4290
     35b:	ff 35 94 62 00 00    	pushl  0x6294
     361:	e8 7a 3b 00 00       	call   3ee0 <printf>
  if(mkdir("oidir") < 0){
     366:	c7 04 24 9f 42 00 00 	movl   $0x429f,(%esp)
     36d:	e8 88 3a 00 00       	call   3dfa <mkdir>
     372:	83 c4 10             	add    $0x10,%esp
     375:	85 c0                	test   %eax,%eax
     377:	0f 88 95 00 00 00    	js     412 <openiputtest+0xc2>
    printf(stdout, "mkdir oidir failed\n");
    exit(0);
  }
  pid = fork();
     37d:	e8 08 3a 00 00       	call   3d8a <fork>
  if(pid < 0){
     382:	85 c0                	test   %eax,%eax
     384:	0f 88 a6 00 00 00    	js     430 <openiputtest+0xe0>
    printf(stdout, "fork failed\n");
    exit(0);
  }
  if(pid == 0){
     38a:	75 3c                	jne    3c8 <openiputtest+0x78>
    int fd = open("oidir", O_RDWR);
     38c:	83 ec 08             	sub    $0x8,%esp
     38f:	6a 02                	push   $0x2
     391:	68 9f 42 00 00       	push   $0x429f
     396:	e8 37 3a 00 00       	call   3dd2 <open>
    if(fd >= 0){
     39b:	83 c4 10             	add    $0x10,%esp
     39e:	85 c0                	test   %eax,%eax
     3a0:	78 66                	js     408 <openiputtest+0xb8>
      printf(stdout, "open directory for write succeeded\n");
     3a2:	83 ec 08             	sub    $0x8,%esp
     3a5:	68 24 52 00 00       	push   $0x5224
     3aa:	ff 35 94 62 00 00    	pushl  0x6294
     3b0:	e8 2b 3b 00 00       	call   3ee0 <printf>
      exit(0);
     3b5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     3bc:	e8 d1 39 00 00       	call   3d92 <exit>
     3c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
    exit(0);
  }
  sleep(1);
     3c8:	83 ec 0c             	sub    $0xc,%esp
     3cb:	6a 01                	push   $0x1
     3cd:	e8 50 3a 00 00       	call   3e22 <sleep>
  if(unlink("oidir") != 0){
     3d2:	c7 04 24 9f 42 00 00 	movl   $0x429f,(%esp)
     3d9:	e8 04 3a 00 00       	call   3de2 <unlink>
     3de:	83 c4 10             	add    $0x10,%esp
     3e1:	85 c0                	test   %eax,%eax
     3e3:	75 69                	jne    44e <openiputtest+0xfe>
    printf(stdout, "unlink failed\n");
    exit(0);
  }
  wait();
     3e5:	e8 b0 39 00 00       	call   3d9a <wait>
  printf(stdout, "openiput test ok\n");
     3ea:	83 ec 08             	sub    $0x8,%esp
     3ed:	68 c8 42 00 00       	push   $0x42c8
     3f2:	ff 35 94 62 00 00    	pushl  0x6294
     3f8:	e8 e3 3a 00 00       	call   3ee0 <printf>
}
     3fd:	83 c4 10             	add    $0x10,%esp
     400:	c9                   	leave  
     401:	c3                   	ret    
     402:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int fd = open("oidir", O_RDWR);
    if(fd >= 0){
      printf(stdout, "open directory for write succeeded\n");
      exit(0);
    }
    exit(0);
     408:	83 ec 0c             	sub    $0xc,%esp
     40b:	6a 00                	push   $0x0
     40d:	e8 80 39 00 00       	call   3d92 <exit>
{
  int pid;

  printf(stdout, "openiput test\n");
  if(mkdir("oidir") < 0){
    printf(stdout, "mkdir oidir failed\n");
     412:	51                   	push   %ecx
     413:	51                   	push   %ecx
     414:	68 a5 42 00 00       	push   $0x42a5
     419:	ff 35 94 62 00 00    	pushl  0x6294
     41f:	e8 bc 3a 00 00       	call   3ee0 <printf>
    exit(0);
     424:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     42b:	e8 62 39 00 00       	call   3d92 <exit>
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     430:	52                   	push   %edx
     431:	52                   	push   %edx
     432:	68 41 51 00 00       	push   $0x5141
     437:	ff 35 94 62 00 00    	pushl  0x6294
     43d:	e8 9e 3a 00 00       	call   3ee0 <printf>
    exit(0);
     442:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     449:	e8 44 39 00 00       	call   3d92 <exit>
    }
    exit(0);
  }
  sleep(1);
  if(unlink("oidir") != 0){
    printf(stdout, "unlink failed\n");
     44e:	50                   	push   %eax
     44f:	50                   	push   %eax
     450:	68 b9 42 00 00       	push   $0x42b9
     455:	ff 35 94 62 00 00    	pushl  0x6294
     45b:	e8 80 3a 00 00       	call   3ee0 <printf>
    exit(0);
     460:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     467:	e8 26 39 00 00       	call   3d92 <exit>
     46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000470 <opentest>:

// simple file system tests

void
opentest(void)
{
     470:	55                   	push   %ebp
     471:	89 e5                	mov    %esp,%ebp
     473:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
     476:	68 da 42 00 00       	push   $0x42da
     47b:	ff 35 94 62 00 00    	pushl  0x6294
     481:	e8 5a 3a 00 00       	call   3ee0 <printf>
  fd = open("echo", 0);
     486:	58                   	pop    %eax
     487:	5a                   	pop    %edx
     488:	6a 00                	push   $0x0
     48a:	68 e5 42 00 00       	push   $0x42e5
     48f:	e8 3e 39 00 00       	call   3dd2 <open>
  if(fd < 0){
     494:	83 c4 10             	add    $0x10,%esp
     497:	85 c0                	test   %eax,%eax
     499:	78 36                	js     4d1 <opentest+0x61>
    printf(stdout, "open echo failed!\n");
    exit(0);
  }
  close(fd);
     49b:	83 ec 0c             	sub    $0xc,%esp
     49e:	50                   	push   %eax
     49f:	e8 16 39 00 00       	call   3dba <close>
  fd = open("doesnotexist", 0);
     4a4:	5a                   	pop    %edx
     4a5:	59                   	pop    %ecx
     4a6:	6a 00                	push   $0x0
     4a8:	68 fd 42 00 00       	push   $0x42fd
     4ad:	e8 20 39 00 00       	call   3dd2 <open>
  if(fd >= 0){
     4b2:	83 c4 10             	add    $0x10,%esp
     4b5:	85 c0                	test   %eax,%eax
     4b7:	79 36                	jns    4ef <opentest+0x7f>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit(0);
  }
  printf(stdout, "open test ok\n");
     4b9:	83 ec 08             	sub    $0x8,%esp
     4bc:	68 28 43 00 00       	push   $0x4328
     4c1:	ff 35 94 62 00 00    	pushl  0x6294
     4c7:	e8 14 3a 00 00       	call   3ee0 <printf>
}
     4cc:	83 c4 10             	add    $0x10,%esp
     4cf:	c9                   	leave  
     4d0:	c3                   	ret    
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
     4d1:	50                   	push   %eax
     4d2:	50                   	push   %eax
     4d3:	68 ea 42 00 00       	push   $0x42ea
     4d8:	ff 35 94 62 00 00    	pushl  0x6294
     4de:	e8 fd 39 00 00       	call   3ee0 <printf>
    exit(0);
     4e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     4ea:	e8 a3 38 00 00       	call   3d92 <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
     4ef:	50                   	push   %eax
     4f0:	50                   	push   %eax
     4f1:	68 0a 43 00 00       	push   $0x430a
     4f6:	ff 35 94 62 00 00    	pushl  0x6294
     4fc:	e8 df 39 00 00       	call   3ee0 <printf>
    exit(0);
     501:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     508:	e8 85 38 00 00       	call   3d92 <exit>
     50d:	8d 76 00             	lea    0x0(%esi),%esi

00000510 <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     510:	55                   	push   %ebp
     511:	89 e5                	mov    %esp,%ebp
     513:	56                   	push   %esi
     514:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
     515:	83 ec 08             	sub    $0x8,%esp
     518:	68 36 43 00 00       	push   $0x4336
     51d:	ff 35 94 62 00 00    	pushl  0x6294
     523:	e8 b8 39 00 00       	call   3ee0 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     528:	59                   	pop    %ecx
     529:	5b                   	pop    %ebx
     52a:	68 02 02 00 00       	push   $0x202
     52f:	68 47 43 00 00       	push   $0x4347
     534:	e8 99 38 00 00       	call   3dd2 <open>
  if(fd >= 0){
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
     53e:	0f 88 b2 01 00 00    	js     6f6 <writetest+0x1e6>
    printf(stdout, "creat small succeeded; ok\n");
     544:	83 ec 08             	sub    $0x8,%esp
     547:	89 c6                	mov    %eax,%esi
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit(0);
  }
  for(i = 0; i < 100; i++){
     549:	31 db                	xor    %ebx,%ebx
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
     54b:	68 4d 43 00 00       	push   $0x434d
     550:	ff 35 94 62 00 00    	pushl  0x6294
     556:	e8 85 39 00 00       	call   3ee0 <printf>
     55b:	83 c4 10             	add    $0x10,%esp
     55e:	66 90                	xchg   %ax,%ax
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit(0);
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     560:	83 ec 04             	sub    $0x4,%esp
     563:	6a 0a                	push   $0xa
     565:	68 84 43 00 00       	push   $0x4384
     56a:	56                   	push   %esi
     56b:	e8 42 38 00 00       	call   3db2 <write>
     570:	83 c4 10             	add    $0x10,%esp
     573:	83 f8 0a             	cmp    $0xa,%eax
     576:	0f 85 dd 00 00 00    	jne    659 <writetest+0x149>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit(0);
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     57c:	83 ec 04             	sub    $0x4,%esp
     57f:	6a 0a                	push   $0xa
     581:	68 8f 43 00 00       	push   $0x438f
     586:	56                   	push   %esi
     587:	e8 26 38 00 00       	call   3db2 <write>
     58c:	83 c4 10             	add    $0x10,%esp
     58f:	83 f8 0a             	cmp    $0xa,%eax
     592:	0f 85 e1 00 00 00    	jne    679 <writetest+0x169>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit(0);
  }
  for(i = 0; i < 100; i++){
     598:	83 c3 01             	add    $0x1,%ebx
     59b:	83 fb 64             	cmp    $0x64,%ebx
     59e:	75 c0                	jne    560 <writetest+0x50>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit(0);
    }
  }
  printf(stdout, "writes ok\n");
     5a0:	83 ec 08             	sub    $0x8,%esp
     5a3:	68 9a 43 00 00       	push   $0x439a
     5a8:	ff 35 94 62 00 00    	pushl  0x6294
     5ae:	e8 2d 39 00 00       	call   3ee0 <printf>
  close(fd);
     5b3:	89 34 24             	mov    %esi,(%esp)
     5b6:	e8 ff 37 00 00       	call   3dba <close>
  fd = open("small", O_RDONLY);
     5bb:	58                   	pop    %eax
     5bc:	5a                   	pop    %edx
     5bd:	6a 00                	push   $0x0
     5bf:	68 47 43 00 00       	push   $0x4347
     5c4:	e8 09 38 00 00       	call   3dd2 <open>
  if(fd >= 0){
     5c9:	83 c4 10             	add    $0x10,%esp
     5cc:	85 c0                	test   %eax,%eax
      exit(0);
    }
  }
  printf(stdout, "writes ok\n");
  close(fd);
  fd = open("small", O_RDONLY);
     5ce:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     5d0:	0f 88 c3 00 00 00    	js     699 <writetest+0x189>
    printf(stdout, "open small succeeded ok\n");
     5d6:	83 ec 08             	sub    $0x8,%esp
     5d9:	68 a5 43 00 00       	push   $0x43a5
     5de:	ff 35 94 62 00 00    	pushl  0x6294
     5e4:	e8 f7 38 00 00       	call   3ee0 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit(0);
  }
  i = read(fd, buf, 2000);
     5e9:	83 c4 0c             	add    $0xc,%esp
     5ec:	68 d0 07 00 00       	push   $0x7d0
     5f1:	68 80 8a 00 00       	push   $0x8a80
     5f6:	53                   	push   %ebx
     5f7:	e8 ae 37 00 00       	call   3daa <read>
  if(i == 2000){
     5fc:	83 c4 10             	add    $0x10,%esp
     5ff:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     604:	0f 85 ae 00 00 00    	jne    6b8 <writetest+0x1a8>
    printf(stdout, "read succeeded ok\n");
     60a:	83 ec 08             	sub    $0x8,%esp
     60d:	68 d9 43 00 00       	push   $0x43d9
     612:	ff 35 94 62 00 00    	pushl  0x6294
     618:	e8 c3 38 00 00       	call   3ee0 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit(0);
  }
  close(fd);
     61d:	89 1c 24             	mov    %ebx,(%esp)
     620:	e8 95 37 00 00       	call   3dba <close>

  if(unlink("small") < 0){
     625:	c7 04 24 47 43 00 00 	movl   $0x4347,(%esp)
     62c:	e8 b1 37 00 00       	call   3de2 <unlink>
     631:	83 c4 10             	add    $0x10,%esp
     634:	85 c0                	test   %eax,%eax
     636:	0f 88 9b 00 00 00    	js     6d7 <writetest+0x1c7>
    printf(stdout, "unlink small failed\n");
    exit(0);
  }
  printf(stdout, "small file test ok\n");
     63c:	83 ec 08             	sub    $0x8,%esp
     63f:	68 01 44 00 00       	push   $0x4401
     644:	ff 35 94 62 00 00    	pushl  0x6294
     64a:	e8 91 38 00 00       	call   3ee0 <printf>
}
     64f:	83 c4 10             	add    $0x10,%esp
     652:	8d 65 f8             	lea    -0x8(%ebp),%esp
     655:	5b                   	pop    %ebx
     656:	5e                   	pop    %esi
     657:	5d                   	pop    %ebp
     658:	c3                   	ret    
    printf(stdout, "error: creat small failed!\n");
    exit(0);
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
     659:	83 ec 04             	sub    $0x4,%esp
     65c:	53                   	push   %ebx
     65d:	68 48 52 00 00       	push   $0x5248
     662:	ff 35 94 62 00 00    	pushl  0x6294
     668:	e8 73 38 00 00       	call   3ee0 <printf>
      exit(0);
     66d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     674:	e8 19 37 00 00       	call   3d92 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
     679:	83 ec 04             	sub    $0x4,%esp
     67c:	53                   	push   %ebx
     67d:	68 6c 52 00 00       	push   $0x526c
     682:	ff 35 94 62 00 00    	pushl  0x6294
     688:	e8 53 38 00 00       	call   3ee0 <printf>
      exit(0);
     68d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     694:	e8 f9 36 00 00       	call   3d92 <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     699:	83 ec 08             	sub    $0x8,%esp
     69c:	68 be 43 00 00       	push   $0x43be
     6a1:	ff 35 94 62 00 00    	pushl  0x6294
     6a7:	e8 34 38 00 00       	call   3ee0 <printf>
    exit(0);
     6ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     6b3:	e8 da 36 00 00       	call   3d92 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     6b8:	83 ec 08             	sub    $0x8,%esp
     6bb:	68 05 47 00 00       	push   $0x4705
     6c0:	ff 35 94 62 00 00    	pushl  0x6294
     6c6:	e8 15 38 00 00       	call   3ee0 <printf>
    exit(0);
     6cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     6d2:	e8 bb 36 00 00       	call   3d92 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     6d7:	83 ec 08             	sub    $0x8,%esp
     6da:	68 ec 43 00 00       	push   $0x43ec
     6df:	ff 35 94 62 00 00    	pushl  0x6294
     6e5:	e8 f6 37 00 00       	call   3ee0 <printf>
    exit(0);
     6ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     6f1:	e8 9c 36 00 00       	call   3d92 <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     6f6:	83 ec 08             	sub    $0x8,%esp
     6f9:	68 68 43 00 00       	push   $0x4368
     6fe:	ff 35 94 62 00 00    	pushl  0x6294
     704:	e8 d7 37 00 00       	call   3ee0 <printf>
    exit(0);
     709:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     710:	e8 7d 36 00 00       	call   3d92 <exit>
     715:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000720 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     720:	55                   	push   %ebp
     721:	89 e5                	mov    %esp,%ebp
     723:	56                   	push   %esi
     724:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
     725:	83 ec 08             	sub    $0x8,%esp
     728:	68 15 44 00 00       	push   $0x4415
     72d:	ff 35 94 62 00 00    	pushl  0x6294
     733:	e8 a8 37 00 00       	call   3ee0 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     738:	59                   	pop    %ecx
     739:	5b                   	pop    %ebx
     73a:	68 02 02 00 00       	push   $0x202
     73f:	68 8f 44 00 00       	push   $0x448f
     744:	e8 89 36 00 00       	call   3dd2 <open>
  if(fd < 0){
     749:	83 c4 10             	add    $0x10,%esp
     74c:	85 c0                	test   %eax,%eax
     74e:	0f 88 8b 01 00 00    	js     8df <writetest1+0x1bf>
     754:	89 c6                	mov    %eax,%esi
     756:	31 db                	xor    %ebx,%ebx
     758:	90                   	nop
     759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit(0);
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
     760:	83 ec 04             	sub    $0x4,%esp
    printf(stdout, "error: creat big failed!\n");
    exit(0);
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
     763:	89 1d 80 8a 00 00    	mov    %ebx,0x8a80
    if(write(fd, buf, 512) != 512){
     769:	68 00 02 00 00       	push   $0x200
     76e:	68 80 8a 00 00       	push   $0x8a80
     773:	56                   	push   %esi
     774:	e8 39 36 00 00       	call   3db2 <write>
     779:	83 c4 10             	add    $0x10,%esp
     77c:	3d 00 02 00 00       	cmp    $0x200,%eax
     781:	0f 85 b7 00 00 00    	jne    83e <writetest1+0x11e>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit(0);
  }

  for(i = 0; i < MAXFILE; i++){
     787:	83 c3 01             	add    $0x1,%ebx
     78a:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     790:	75 ce                	jne    760 <writetest1+0x40>
      printf(stdout, "error: write big file failed\n", i);
      exit(0);
    }
  }

  close(fd);
     792:	83 ec 0c             	sub    $0xc,%esp
     795:	56                   	push   %esi
     796:	e8 1f 36 00 00       	call   3dba <close>

  fd = open("big", O_RDONLY);
     79b:	58                   	pop    %eax
     79c:	5a                   	pop    %edx
     79d:	6a 00                	push   $0x0
     79f:	68 8f 44 00 00       	push   $0x448f
     7a4:	e8 29 36 00 00       	call   3dd2 <open>
  if(fd < 0){
     7a9:	83 c4 10             	add    $0x10,%esp
     7ac:	85 c0                	test   %eax,%eax
    }
  }

  close(fd);

  fd = open("big", O_RDONLY);
     7ae:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     7b0:	0f 88 0a 01 00 00    	js     8c0 <writetest1+0x1a0>
     7b6:	31 db                	xor    %ebx,%ebx
     7b8:	eb 21                	jmp    7db <writetest1+0xbb>
     7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit(0);
      }
      break;
    } else if(i != 512){
     7c0:	3d 00 02 00 00       	cmp    $0x200,%eax
     7c5:	0f 85 b1 00 00 00    	jne    87c <writetest1+0x15c>
      printf(stdout, "read failed %d\n", i);
      exit(0);
    }
    if(((int*)buf)[0] != n){
     7cb:	a1 80 8a 00 00       	mov    0x8a80,%eax
     7d0:	39 c3                	cmp    %eax,%ebx
     7d2:	0f 85 86 00 00 00    	jne    85e <writetest1+0x13e>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit(0);
    }
    n++;
     7d8:	83 c3 01             	add    $0x1,%ebx
    exit(0);
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     7db:	83 ec 04             	sub    $0x4,%esp
     7de:	68 00 02 00 00       	push   $0x200
     7e3:	68 80 8a 00 00       	push   $0x8a80
     7e8:	56                   	push   %esi
     7e9:	e8 bc 35 00 00       	call   3daa <read>
    if(i == 0){
     7ee:	83 c4 10             	add    $0x10,%esp
     7f1:	85 c0                	test   %eax,%eax
     7f3:	75 cb                	jne    7c0 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     7f5:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     7fb:	0f 84 9b 00 00 00    	je     89c <writetest1+0x17c>
             n, ((int*)buf)[0]);
      exit(0);
    }
    n++;
  }
  close(fd);
     801:	83 ec 0c             	sub    $0xc,%esp
     804:	56                   	push   %esi
     805:	e8 b0 35 00 00       	call   3dba <close>
  if(unlink("big") < 0){
     80a:	c7 04 24 8f 44 00 00 	movl   $0x448f,(%esp)
     811:	e8 cc 35 00 00       	call   3de2 <unlink>
     816:	83 c4 10             	add    $0x10,%esp
     819:	85 c0                	test   %eax,%eax
     81b:	0f 88 dd 00 00 00    	js     8fe <writetest1+0x1de>
    printf(stdout, "unlink big failed\n");
    exit(0);
  }
  printf(stdout, "big files ok\n");
     821:	83 ec 08             	sub    $0x8,%esp
     824:	68 b6 44 00 00       	push   $0x44b6
     829:	ff 35 94 62 00 00    	pushl  0x6294
     82f:	e8 ac 36 00 00       	call   3ee0 <printf>
}
     834:	83 c4 10             	add    $0x10,%esp
     837:	8d 65 f8             	lea    -0x8(%ebp),%esp
     83a:	5b                   	pop    %ebx
     83b:	5e                   	pop    %esi
     83c:	5d                   	pop    %ebp
     83d:	c3                   	ret    
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
     83e:	83 ec 04             	sub    $0x4,%esp
     841:	53                   	push   %ebx
     842:	68 3f 44 00 00       	push   $0x443f
     847:	ff 35 94 62 00 00    	pushl  0x6294
     84d:	e8 8e 36 00 00       	call   3ee0 <printf>
      exit(0);
     852:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     859:	e8 34 35 00 00       	call   3d92 <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit(0);
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     85e:	50                   	push   %eax
     85f:	53                   	push   %ebx
     860:	68 90 52 00 00       	push   $0x5290
     865:	ff 35 94 62 00 00    	pushl  0x6294
     86b:	e8 70 36 00 00       	call   3ee0 <printf>
             n, ((int*)buf)[0]);
      exit(0);
     870:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     877:	e8 16 35 00 00       	call   3d92 <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit(0);
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
     87c:	83 ec 04             	sub    $0x4,%esp
     87f:	50                   	push   %eax
     880:	68 93 44 00 00       	push   $0x4493
     885:	ff 35 94 62 00 00    	pushl  0x6294
     88b:	e8 50 36 00 00       	call   3ee0 <printf>
      exit(0);
     890:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     897:	e8 f6 34 00 00       	call   3d92 <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
     89c:	83 ec 04             	sub    $0x4,%esp
     89f:	68 8b 00 00 00       	push   $0x8b
     8a4:	68 76 44 00 00       	push   $0x4476
     8a9:	ff 35 94 62 00 00    	pushl  0x6294
     8af:	e8 2c 36 00 00       	call   3ee0 <printf>
        exit(0);
     8b4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     8bb:	e8 d2 34 00 00       	call   3d92 <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
     8c0:	83 ec 08             	sub    $0x8,%esp
     8c3:	68 5d 44 00 00       	push   $0x445d
     8c8:	ff 35 94 62 00 00    	pushl  0x6294
     8ce:	e8 0d 36 00 00       	call   3ee0 <printf>
    exit(0);
     8d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     8da:	e8 b3 34 00 00       	call   3d92 <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
     8df:	83 ec 08             	sub    $0x8,%esp
     8e2:	68 25 44 00 00       	push   $0x4425
     8e7:	ff 35 94 62 00 00    	pushl  0x6294
     8ed:	e8 ee 35 00 00       	call   3ee0 <printf>
    exit(0);
     8f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     8f9:	e8 94 34 00 00       	call   3d92 <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     8fe:	83 ec 08             	sub    $0x8,%esp
     901:	68 a3 44 00 00       	push   $0x44a3
     906:	ff 35 94 62 00 00    	pushl  0x6294
     90c:	e8 cf 35 00 00       	call   3ee0 <printf>
    exit(0);
     911:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     918:	e8 75 34 00 00       	call   3d92 <exit>
     91d:	8d 76 00             	lea    0x0(%esi),%esi

00000920 <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     920:	55                   	push   %ebp
     921:	89 e5                	mov    %esp,%ebp
     923:	53                   	push   %ebx
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
     924:	bb 30 00 00 00       	mov    $0x30,%ebx
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     929:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     92c:	68 b0 52 00 00       	push   $0x52b0
     931:	ff 35 94 62 00 00    	pushl  0x6294
     937:	e8 a4 35 00 00       	call   3ee0 <printf>

  name[0] = 'a';
     93c:	c6 05 80 aa 00 00 61 	movb   $0x61,0xaa80
  name[2] = '\0';
     943:	c6 05 82 aa 00 00 00 	movb   $0x0,0xaa82
     94a:	83 c4 10             	add    $0x10,%esp
     94d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
     950:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     953:	88 1d 81 aa 00 00    	mov    %bl,0xaa81
     959:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     95c:	68 02 02 00 00       	push   $0x202
     961:	68 80 aa 00 00       	push   $0xaa80
     966:	e8 67 34 00 00       	call   3dd2 <open>
    close(fd);
     96b:	89 04 24             	mov    %eax,(%esp)
     96e:	e8 47 34 00 00       	call   3dba <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     973:	83 c4 10             	add    $0x10,%esp
     976:	80 fb 64             	cmp    $0x64,%bl
     979:	75 d5                	jne    950 <createtest+0x30>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     97b:	c6 05 80 aa 00 00 61 	movb   $0x61,0xaa80
  name[2] = '\0';
     982:	c6 05 82 aa 00 00 00 	movb   $0x0,0xaa82
     989:	bb 30 00 00 00       	mov    $0x30,%ebx
     98e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    unlink(name);
     990:	83 ec 0c             	sub    $0xc,%esp
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     993:	88 1d 81 aa 00 00    	mov    %bl,0xaa81
     999:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     99c:	68 80 aa 00 00       	push   $0xaa80
     9a1:	e8 3c 34 00 00       	call   3de2 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     9a6:	83 c4 10             	add    $0x10,%esp
     9a9:	80 fb 64             	cmp    $0x64,%bl
     9ac:	75 e2                	jne    990 <createtest+0x70>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     9ae:	83 ec 08             	sub    $0x8,%esp
     9b1:	68 d8 52 00 00       	push   $0x52d8
     9b6:	ff 35 94 62 00 00    	pushl  0x6294
     9bc:	e8 1f 35 00 00       	call   3ee0 <printf>
}
     9c1:	83 c4 10             	add    $0x10,%esp
     9c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9c7:	c9                   	leave  
     9c8:	c3                   	ret    
     9c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009d0 <dirtest>:

void dirtest(void)
{
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     9d6:	68 c4 44 00 00       	push   $0x44c4
     9db:	ff 35 94 62 00 00    	pushl  0x6294
     9e1:	e8 fa 34 00 00       	call   3ee0 <printf>

  if(mkdir("dir0") < 0){
     9e6:	c7 04 24 d0 44 00 00 	movl   $0x44d0,(%esp)
     9ed:	e8 08 34 00 00       	call   3dfa <mkdir>
     9f2:	83 c4 10             	add    $0x10,%esp
     9f5:	85 c0                	test   %eax,%eax
     9f7:	78 58                	js     a51 <dirtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit(0);
  }

  if(chdir("dir0") < 0){
     9f9:	83 ec 0c             	sub    $0xc,%esp
     9fc:	68 d0 44 00 00       	push   $0x44d0
     a01:	e8 fc 33 00 00       	call   3e02 <chdir>
     a06:	83 c4 10             	add    $0x10,%esp
     a09:	85 c0                	test   %eax,%eax
     a0b:	0f 88 9a 00 00 00    	js     aab <dirtest+0xdb>
    printf(stdout, "chdir dir0 failed\n");
    exit(0);
  }

  if(chdir("..") < 0){
     a11:	83 ec 0c             	sub    $0xc,%esp
     a14:	68 75 4a 00 00       	push   $0x4a75
     a19:	e8 e4 33 00 00       	call   3e02 <chdir>
     a1e:	83 c4 10             	add    $0x10,%esp
     a21:	85 c0                	test   %eax,%eax
     a23:	78 68                	js     a8d <dirtest+0xbd>
    printf(stdout, "chdir .. failed\n");
    exit(0);
  }

  if(unlink("dir0") < 0){
     a25:	83 ec 0c             	sub    $0xc,%esp
     a28:	68 d0 44 00 00       	push   $0x44d0
     a2d:	e8 b0 33 00 00       	call   3de2 <unlink>
     a32:	83 c4 10             	add    $0x10,%esp
     a35:	85 c0                	test   %eax,%eax
     a37:	78 36                	js     a6f <dirtest+0x9f>
    printf(stdout, "unlink dir0 failed\n");
    exit(0);
  }
  printf(stdout, "mkdir test ok\n");
     a39:	83 ec 08             	sub    $0x8,%esp
     a3c:	68 0d 45 00 00       	push   $0x450d
     a41:	ff 35 94 62 00 00    	pushl  0x6294
     a47:	e8 94 34 00 00       	call   3ee0 <printf>
}
     a4c:	83 c4 10             	add    $0x10,%esp
     a4f:	c9                   	leave  
     a50:	c3                   	ret    
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
     a51:	50                   	push   %eax
     a52:	50                   	push   %eax
     a53:	68 00 42 00 00       	push   $0x4200
     a58:	ff 35 94 62 00 00    	pushl  0x6294
     a5e:	e8 7d 34 00 00       	call   3ee0 <printf>
    exit(0);
     a63:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     a6a:	e8 23 33 00 00       	call   3d92 <exit>
    printf(stdout, "chdir .. failed\n");
    exit(0);
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
     a6f:	50                   	push   %eax
     a70:	50                   	push   %eax
     a71:	68 f9 44 00 00       	push   $0x44f9
     a76:	ff 35 94 62 00 00    	pushl  0x6294
     a7c:	e8 5f 34 00 00       	call   3ee0 <printf>
    exit(0);
     a81:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     a88:	e8 05 33 00 00       	call   3d92 <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit(0);
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
     a8d:	52                   	push   %edx
     a8e:	52                   	push   %edx
     a8f:	68 e8 44 00 00       	push   $0x44e8
     a94:	ff 35 94 62 00 00    	pushl  0x6294
     a9a:	e8 41 34 00 00       	call   3ee0 <printf>
    exit(0);
     a9f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     aa6:	e8 e7 32 00 00       	call   3d92 <exit>
    printf(stdout, "mkdir failed\n");
    exit(0);
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
     aab:	51                   	push   %ecx
     aac:	51                   	push   %ecx
     aad:	68 d5 44 00 00       	push   $0x44d5
     ab2:	ff 35 94 62 00 00    	pushl  0x6294
     ab8:	e8 23 34 00 00       	call   3ee0 <printf>
    exit(0);
     abd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     ac4:	e8 c9 32 00 00       	call   3d92 <exit>
     ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ad0 <exectest>:
  printf(stdout, "mkdir test ok\n");
}

void
exectest(void)
{
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     ad6:	68 1c 45 00 00       	push   $0x451c
     adb:	ff 35 94 62 00 00    	pushl  0x6294
     ae1:	e8 fa 33 00 00       	call   3ee0 <printf>
  if(exec("echo", echoargv) < 0){
     ae6:	5a                   	pop    %edx
     ae7:	59                   	pop    %ecx
     ae8:	68 98 62 00 00       	push   $0x6298
     aed:	68 e5 42 00 00       	push   $0x42e5
     af2:	e8 d3 32 00 00       	call   3dca <exec>
     af7:	83 c4 10             	add    $0x10,%esp
     afa:	85 c0                	test   %eax,%eax
     afc:	78 02                	js     b00 <exectest+0x30>
    printf(stdout, "exec echo failed\n");
    exit(0);
  }
}
     afe:	c9                   	leave  
     aff:	c3                   	ret    
void
exectest(void)
{
  printf(stdout, "exec test\n");
  if(exec("echo", echoargv) < 0){
    printf(stdout, "exec echo failed\n");
     b00:	50                   	push   %eax
     b01:	50                   	push   %eax
     b02:	68 27 45 00 00       	push   $0x4527
     b07:	ff 35 94 62 00 00    	pushl  0x6294
     b0d:	e8 ce 33 00 00       	call   3ee0 <printf>
    exit(0);
     b12:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b19:	e8 74 32 00 00       	call   3d92 <exit>
     b1e:	66 90                	xchg   %ax,%ax

00000b20 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     b20:	55                   	push   %ebp
     b21:	89 e5                	mov    %esp,%ebp
     b23:	57                   	push   %edi
     b24:	56                   	push   %esi
     b25:	53                   	push   %ebx
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     b26:	8d 45 e0             	lea    -0x20(%ebp),%eax

// simple fork and pipe read/write

void
pipe1(void)
{
     b29:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     b2c:	50                   	push   %eax
     b2d:	e8 70 32 00 00       	call   3da2 <pipe>
     b32:	83 c4 10             	add    $0x10,%esp
     b35:	85 c0                	test   %eax,%eax
     b37:	0f 85 45 01 00 00    	jne    c82 <pipe1+0x162>
    printf(1, "pipe() failed\n");
    exit(0);
  }
  pid = fork();
     b3d:	e8 48 32 00 00       	call   3d8a <fork>
  seq = 0;
  if(pid == 0){
     b42:	83 f8 00             	cmp    $0x0,%eax
     b45:	0f 84 86 00 00 00    	je     bd1 <pipe1+0xb1>
        printf(1, "pipe1 oops 1\n");
        exit(0);
      }
    }
    exit(0);
  } else if(pid > 0){
     b4b:	0f 8e 4c 01 00 00    	jle    c9d <pipe1+0x17d>
    close(fds[1]);
     b51:	83 ec 0c             	sub    $0xc,%esp
     b54:	ff 75 e4             	pushl  -0x1c(%ebp)
    total = 0;
    cc = 1;
     b57:	bf 01 00 00 00       	mov    $0x1,%edi
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit(0);
  }
  pid = fork();
  seq = 0;
     b5c:	31 db                	xor    %ebx,%ebx
        exit(0);
      }
    }
    exit(0);
  } else if(pid > 0){
    close(fds[1]);
     b5e:	e8 57 32 00 00       	call   3dba <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     b63:	83 c4 10             	add    $0x10,%esp
      }
    }
    exit(0);
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
     b66:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     b6d:	83 ec 04             	sub    $0x4,%esp
     b70:	57                   	push   %edi
     b71:	68 80 8a 00 00       	push   $0x8a80
     b76:	ff 75 e0             	pushl  -0x20(%ebp)
     b79:	e8 2c 32 00 00       	call   3daa <read>
     b7e:	83 c4 10             	add    $0x10,%esp
     b81:	85 c0                	test   %eax,%eax
     b83:	0f 8e ac 00 00 00    	jle    c35 <pipe1+0x115>
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     b89:	89 d9                	mov    %ebx,%ecx
     b8b:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     b8e:	f7 d9                	neg    %ecx
     b90:	38 9c 0b 80 8a 00 00 	cmp    %bl,0x8a80(%ebx,%ecx,1)
     b97:	8d 53 01             	lea    0x1(%ebx),%edx
     b9a:	75 1b                	jne    bb7 <pipe1+0x97>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     b9c:	39 f2                	cmp    %esi,%edx
     b9e:	89 d3                	mov    %edx,%ebx
     ba0:	75 ee                	jne    b90 <pipe1+0x70>
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
      cc = cc * 2;
     ba2:	01 ff                	add    %edi,%edi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     ba4:	01 45 d4             	add    %eax,-0x2c(%ebp)
     ba7:	b8 00 20 00 00       	mov    $0x2000,%eax
     bac:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     bb2:	0f 4f f8             	cmovg  %eax,%edi
     bb5:	eb b6                	jmp    b6d <pipe1+0x4d>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
     bb7:	83 ec 08             	sub    $0x8,%esp
     bba:	68 56 45 00 00       	push   $0x4556
     bbf:	6a 01                	push   $0x1
     bc1:	e8 1a 33 00 00       	call   3ee0 <printf>
          return;
     bc6:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit(0);
  }
  printf(1, "pipe1 ok\n");
}
     bc9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bcc:	5b                   	pop    %ebx
     bcd:	5e                   	pop    %esi
     bce:	5f                   	pop    %edi
     bcf:	5d                   	pop    %ebp
     bd0:	c3                   	ret    
    exit(0);
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     bd1:	83 ec 0c             	sub    $0xc,%esp
     bd4:	ff 75 e0             	pushl  -0x20(%ebp)
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit(0);
  }
  pid = fork();
  seq = 0;
     bd7:	31 f6                	xor    %esi,%esi
  if(pid == 0){
    close(fds[0]);
     bd9:	e8 dc 31 00 00       	call   3dba <close>
     bde:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     be1:	89 f0                	mov    %esi,%eax
     be3:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx

// simple fork and pipe read/write

void
pipe1(void)
{
     be9:	89 f3                	mov    %esi,%ebx
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     beb:	f7 d8                	neg    %eax
     bed:	8d 76 00             	lea    0x0(%esi),%esi
     bf0:	88 9c 18 80 8a 00 00 	mov    %bl,0x8a80(%eax,%ebx,1)
     bf7:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     bfa:	39 d3                	cmp    %edx,%ebx
     bfc:	75 f2                	jne    bf0 <pipe1+0xd0>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     bfe:	83 ec 04             	sub    $0x4,%esp
     c01:	89 de                	mov    %ebx,%esi
     c03:	68 09 04 00 00       	push   $0x409
     c08:	68 80 8a 00 00       	push   $0x8a80
     c0d:	ff 75 e4             	pushl  -0x1c(%ebp)
     c10:	e8 9d 31 00 00       	call   3db2 <write>
     c15:	83 c4 10             	add    $0x10,%esp
     c18:	3d 09 04 00 00       	cmp    $0x409,%eax
     c1d:	0f 85 95 00 00 00    	jne    cb8 <pipe1+0x198>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     c23:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     c29:	75 b6                	jne    be1 <pipe1+0xc1>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit(0);
      }
    }
    exit(0);
     c2b:	83 ec 0c             	sub    $0xc,%esp
     c2e:	6a 00                	push   $0x0
     c30:	e8 5d 31 00 00       	call   3d92 <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     c35:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     c3c:	75 26                	jne    c64 <pipe1+0x144>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit(0);
    }
    close(fds[0]);
     c3e:	83 ec 0c             	sub    $0xc,%esp
     c41:	ff 75 e0             	pushl  -0x20(%ebp)
     c44:	e8 71 31 00 00       	call   3dba <close>
    wait();
     c49:	e8 4c 31 00 00       	call   3d9a <wait>
  } else {
    printf(1, "fork() failed\n");
    exit(0);
  }
  printf(1, "pipe1 ok\n");
     c4e:	58                   	pop    %eax
     c4f:	5a                   	pop    %edx
     c50:	68 7b 45 00 00       	push   $0x457b
     c55:	6a 01                	push   $0x1
     c57:	e8 84 32 00 00       	call   3ee0 <printf>
     c5c:	83 c4 10             	add    $0x10,%esp
     c5f:	e9 65 ff ff ff       	jmp    bc9 <pipe1+0xa9>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
     c64:	83 ec 04             	sub    $0x4,%esp
     c67:	ff 75 d4             	pushl  -0x2c(%ebp)
     c6a:	68 64 45 00 00       	push   $0x4564
     c6f:	6a 01                	push   $0x1
     c71:	e8 6a 32 00 00       	call   3ee0 <printf>
      exit(0);
     c76:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c7d:	e8 10 31 00 00       	call   3d92 <exit>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
     c82:	83 ec 08             	sub    $0x8,%esp
     c85:	68 39 45 00 00       	push   $0x4539
     c8a:	6a 01                	push   $0x1
     c8c:	e8 4f 32 00 00       	call   3ee0 <printf>
    exit(0);
     c91:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c98:	e8 f5 30 00 00       	call   3d92 <exit>
      exit(0);
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     c9d:	83 ec 08             	sub    $0x8,%esp
     ca0:	68 85 45 00 00       	push   $0x4585
     ca5:	6a 01                	push   $0x1
     ca7:	e8 34 32 00 00       	call   3ee0 <printf>
    exit(0);
     cac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     cb3:	e8 da 30 00 00       	call   3d92 <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
     cb8:	83 ec 08             	sub    $0x8,%esp
     cbb:	68 48 45 00 00       	push   $0x4548
     cc0:	6a 01                	push   $0x1
     cc2:	e8 19 32 00 00       	call   3ee0 <printf>
        exit(0);
     cc7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     cce:	e8 bf 30 00 00       	call   3d92 <exit>
     cd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ce0 <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	57                   	push   %edi
     ce4:	56                   	push   %esi
     ce5:	53                   	push   %ebx
     ce6:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     ce9:	68 94 45 00 00       	push   $0x4594
     cee:	6a 01                	push   $0x1
     cf0:	e8 eb 31 00 00       	call   3ee0 <printf>
  pid1 = fork();
     cf5:	e8 90 30 00 00       	call   3d8a <fork>
  if(pid1 == 0)
     cfa:	83 c4 10             	add    $0x10,%esp
     cfd:	85 c0                	test   %eax,%eax
     cff:	75 02                	jne    d03 <preempt+0x23>
     d01:	eb fe                	jmp    d01 <preempt+0x21>
     d03:	89 c7                	mov    %eax,%edi
    for(;;)
      ;

  pid2 = fork();
     d05:	e8 80 30 00 00       	call   3d8a <fork>
  if(pid2 == 0)
     d0a:	85 c0                	test   %eax,%eax
  pid1 = fork();
  if(pid1 == 0)
    for(;;)
      ;

  pid2 = fork();
     d0c:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     d0e:	75 02                	jne    d12 <preempt+0x32>
     d10:	eb fe                	jmp    d10 <preempt+0x30>
    for(;;)
      ;

  pipe(pfds);
     d12:	8d 45 e0             	lea    -0x20(%ebp),%eax
     d15:	83 ec 0c             	sub    $0xc,%esp
     d18:	50                   	push   %eax
     d19:	e8 84 30 00 00       	call   3da2 <pipe>
  pid3 = fork();
     d1e:	e8 67 30 00 00       	call   3d8a <fork>
  if(pid3 == 0){
     d23:	83 c4 10             	add    $0x10,%esp
     d26:	85 c0                	test   %eax,%eax
  if(pid2 == 0)
    for(;;)
      ;

  pipe(pfds);
  pid3 = fork();
     d28:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     d2a:	75 47                	jne    d73 <preempt+0x93>
    close(pfds[0]);
     d2c:	83 ec 0c             	sub    $0xc,%esp
     d2f:	ff 75 e0             	pushl  -0x20(%ebp)
     d32:	e8 83 30 00 00       	call   3dba <close>
    if(write(pfds[1], "x", 1) != 1)
     d37:	83 c4 0c             	add    $0xc,%esp
     d3a:	6a 01                	push   $0x1
     d3c:	68 59 4b 00 00       	push   $0x4b59
     d41:	ff 75 e4             	pushl  -0x1c(%ebp)
     d44:	e8 69 30 00 00       	call   3db2 <write>
     d49:	83 c4 10             	add    $0x10,%esp
     d4c:	83 f8 01             	cmp    $0x1,%eax
     d4f:	74 12                	je     d63 <preempt+0x83>
      printf(1, "preempt write error");
     d51:	83 ec 08             	sub    $0x8,%esp
     d54:	68 9e 45 00 00       	push   $0x459e
     d59:	6a 01                	push   $0x1
     d5b:	e8 80 31 00 00       	call   3ee0 <printf>
     d60:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     d63:	83 ec 0c             	sub    $0xc,%esp
     d66:	ff 75 e4             	pushl  -0x1c(%ebp)
     d69:	e8 4c 30 00 00       	call   3dba <close>
     d6e:	83 c4 10             	add    $0x10,%esp
     d71:	eb fe                	jmp    d71 <preempt+0x91>
    for(;;)
      ;
  }

  close(pfds[1]);
     d73:	83 ec 0c             	sub    $0xc,%esp
     d76:	ff 75 e4             	pushl  -0x1c(%ebp)
     d79:	e8 3c 30 00 00       	call   3dba <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     d7e:	83 c4 0c             	add    $0xc,%esp
     d81:	68 00 20 00 00       	push   $0x2000
     d86:	68 80 8a 00 00       	push   $0x8a80
     d8b:	ff 75 e0             	pushl  -0x20(%ebp)
     d8e:	e8 17 30 00 00       	call   3daa <read>
     d93:	83 c4 10             	add    $0x10,%esp
     d96:	83 f8 01             	cmp    $0x1,%eax
     d99:	74 1a                	je     db5 <preempt+0xd5>
    printf(1, "preempt read error");
     d9b:	83 ec 08             	sub    $0x8,%esp
     d9e:	68 b2 45 00 00       	push   $0x45b2
     da3:	6a 01                	push   $0x1
     da5:	e8 36 31 00 00       	call   3ee0 <printf>
    return;
     daa:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     dad:	8d 65 f4             	lea    -0xc(%ebp),%esp
     db0:	5b                   	pop    %ebx
     db1:	5e                   	pop    %esi
     db2:	5f                   	pop    %edi
     db3:	5d                   	pop    %ebp
     db4:	c3                   	ret    
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
     db5:	83 ec 0c             	sub    $0xc,%esp
     db8:	ff 75 e0             	pushl  -0x20(%ebp)
     dbb:	e8 fa 2f 00 00       	call   3dba <close>
  printf(1, "kill... ");
     dc0:	58                   	pop    %eax
     dc1:	5a                   	pop    %edx
     dc2:	68 c5 45 00 00       	push   $0x45c5
     dc7:	6a 01                	push   $0x1
     dc9:	e8 12 31 00 00       	call   3ee0 <printf>
  kill(pid1);
     dce:	89 3c 24             	mov    %edi,(%esp)
     dd1:	e8 ec 2f 00 00       	call   3dc2 <kill>
  kill(pid2);
     dd6:	89 34 24             	mov    %esi,(%esp)
     dd9:	e8 e4 2f 00 00       	call   3dc2 <kill>
  kill(pid3);
     dde:	89 1c 24             	mov    %ebx,(%esp)
     de1:	e8 dc 2f 00 00       	call   3dc2 <kill>
  printf(1, "wait... ");
     de6:	59                   	pop    %ecx
     de7:	5b                   	pop    %ebx
     de8:	68 ce 45 00 00       	push   $0x45ce
     ded:	6a 01                	push   $0x1
     def:	e8 ec 30 00 00       	call   3ee0 <printf>
  wait();
     df4:	e8 a1 2f 00 00       	call   3d9a <wait>
  wait();
     df9:	e8 9c 2f 00 00       	call   3d9a <wait>
  wait();
     dfe:	e8 97 2f 00 00       	call   3d9a <wait>
  printf(1, "preempt ok\n");
     e03:	5e                   	pop    %esi
     e04:	5f                   	pop    %edi
     e05:	68 d7 45 00 00       	push   $0x45d7
     e0a:	6a 01                	push   $0x1
     e0c:	e8 cf 30 00 00       	call   3ee0 <printf>
     e11:	83 c4 10             	add    $0x10,%esp
     e14:	eb 97                	jmp    dad <preempt+0xcd>
     e16:	8d 76 00             	lea    0x0(%esi),%esi
     e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e20 <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
     e20:	55                   	push   %ebp
     e21:	89 e5                	mov    %esp,%ebp
     e23:	56                   	push   %esi
     e24:	be 64 00 00 00       	mov    $0x64,%esi
     e29:	53                   	push   %ebx
     e2a:	eb 14                	jmp    e40 <exitwait+0x20>
     e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     e30:	74 6f                	je     ea1 <exitwait+0x81>
      if(wait() != pid){
     e32:	e8 63 2f 00 00       	call   3d9a <wait>
     e37:	39 c3                	cmp    %eax,%ebx
     e39:	75 2d                	jne    e68 <exitwait+0x48>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     e3b:	83 ee 01             	sub    $0x1,%esi
     e3e:	74 48                	je     e88 <exitwait+0x68>
    pid = fork();
     e40:	e8 45 2f 00 00       	call   3d8a <fork>
    if(pid < 0){
     e45:	85 c0                	test   %eax,%eax
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    pid = fork();
     e47:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     e49:	79 e5                	jns    e30 <exitwait+0x10>
      printf(1, "fork failed\n");
     e4b:	83 ec 08             	sub    $0x8,%esp
     e4e:	68 41 51 00 00       	push   $0x5141
     e53:	6a 01                	push   $0x1
     e55:	e8 86 30 00 00       	call   3ee0 <printf>
      return;
     e5a:	83 c4 10             	add    $0x10,%esp
    } else {
      exit(0);
    }
  }
  printf(1, "exitwait ok\n");
}
     e5d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e60:	5b                   	pop    %ebx
     e61:	5e                   	pop    %esi
     e62:	5d                   	pop    %ebp
     e63:	c3                   	ret    
     e64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
     e68:	83 ec 08             	sub    $0x8,%esp
     e6b:	68 e3 45 00 00       	push   $0x45e3
     e70:	6a 01                	push   $0x1
     e72:	e8 69 30 00 00       	call   3ee0 <printf>
        return;
     e77:	83 c4 10             	add    $0x10,%esp
    } else {
      exit(0);
    }
  }
  printf(1, "exitwait ok\n");
}
     e7a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e7d:	5b                   	pop    %ebx
     e7e:	5e                   	pop    %esi
     e7f:	5d                   	pop    %ebp
     e80:	c3                   	ret    
     e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      }
    } else {
      exit(0);
    }
  }
  printf(1, "exitwait ok\n");
     e88:	83 ec 08             	sub    $0x8,%esp
     e8b:	68 f3 45 00 00       	push   $0x45f3
     e90:	6a 01                	push   $0x1
     e92:	e8 49 30 00 00       	call   3ee0 <printf>
     e97:	83 c4 10             	add    $0x10,%esp
}
     e9a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e9d:	5b                   	pop    %ebx
     e9e:	5e                   	pop    %esi
     e9f:	5d                   	pop    %ebp
     ea0:	c3                   	ret    
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit(0);
     ea1:	83 ec 0c             	sub    $0xc,%esp
     ea4:	6a 00                	push   $0x0
     ea6:	e8 e7 2e 00 00       	call   3d92 <exit>
     eab:	90                   	nop
     eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000eb0 <mem>:
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	57                   	push   %edi
     eb4:	56                   	push   %esi
     eb5:	53                   	push   %ebx
     eb6:	83 ec 14             	sub    $0x14,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     eb9:	68 00 46 00 00       	push   $0x4600
     ebe:	6a 01                	push   $0x1
     ec0:	e8 1b 30 00 00       	call   3ee0 <printf>
  ppid = getpid();
     ec5:	e8 48 2f 00 00       	call   3e12 <getpid>
     eca:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     ecc:	e8 b9 2e 00 00       	call   3d8a <fork>
     ed1:	83 c4 10             	add    $0x10,%esp
     ed4:	85 c0                	test   %eax,%eax
     ed6:	75 78                	jne    f50 <mem+0xa0>
     ed8:	31 db                	xor    %ebx,%ebx
     eda:	eb 08                	jmp    ee4 <mem+0x34>
     edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     ee0:	89 18                	mov    %ebx,(%eax)
     ee2:	89 c3                	mov    %eax,%ebx

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     ee4:	83 ec 0c             	sub    $0xc,%esp
     ee7:	68 11 27 00 00       	push   $0x2711
     eec:	e8 1f 32 00 00       	call   4110 <malloc>
     ef1:	83 c4 10             	add    $0x10,%esp
     ef4:	85 c0                	test   %eax,%eax
     ef6:	75 e8                	jne    ee0 <mem+0x30>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     ef8:	85 db                	test   %ebx,%ebx
     efa:	74 18                	je     f14 <mem+0x64>
     efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     f00:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     f02:	83 ec 0c             	sub    $0xc,%esp
     f05:	53                   	push   %ebx
     f06:	89 fb                	mov    %edi,%ebx
     f08:	e8 73 31 00 00       	call   4080 <free>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     f0d:	83 c4 10             	add    $0x10,%esp
     f10:	85 db                	test   %ebx,%ebx
     f12:	75 ec                	jne    f00 <mem+0x50>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     f14:	83 ec 0c             	sub    $0xc,%esp
     f17:	68 00 50 00 00       	push   $0x5000
     f1c:	e8 ef 31 00 00       	call   4110 <malloc>
    if(m1 == 0){
     f21:	83 c4 10             	add    $0x10,%esp
     f24:	85 c0                	test   %eax,%eax
     f26:	74 38                	je     f60 <mem+0xb0>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit(0);
    }
    free(m1);
     f28:	83 ec 0c             	sub    $0xc,%esp
     f2b:	50                   	push   %eax
     f2c:	e8 4f 31 00 00       	call   4080 <free>
    printf(1, "mem ok\n");
     f31:	58                   	pop    %eax
     f32:	5a                   	pop    %edx
     f33:	68 24 46 00 00       	push   $0x4624
     f38:	6a 01                	push   $0x1
     f3a:	e8 a1 2f 00 00       	call   3ee0 <printf>
    exit(0);
     f3f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     f46:	e8 47 2e 00 00       	call   3d92 <exit>
     f4b:	90                   	nop
     f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    wait();
  }
}
     f50:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f53:	5b                   	pop    %ebx
     f54:	5e                   	pop    %esi
     f55:	5f                   	pop    %edi
     f56:	5d                   	pop    %ebp
    }
    free(m1);
    printf(1, "mem ok\n");
    exit(0);
  } else {
    wait();
     f57:	e9 3e 2e 00 00       	jmp    3d9a <wait>
     f5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
     f60:	83 ec 08             	sub    $0x8,%esp
     f63:	68 0a 46 00 00       	push   $0x460a
     f68:	6a 01                	push   $0x1
     f6a:	e8 71 2f 00 00       	call   3ee0 <printf>
      kill(ppid);
     f6f:	89 34 24             	mov    %esi,(%esp)
     f72:	e8 4b 2e 00 00       	call   3dc2 <kill>
      exit(0);
     f77:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     f7e:	e8 0f 2e 00 00       	call   3d92 <exit>
     f83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000f90 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     f90:	55                   	push   %ebp
     f91:	89 e5                	mov    %esp,%ebp
     f93:	57                   	push   %edi
     f94:	56                   	push   %esi
     f95:	53                   	push   %ebx
     f96:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     f99:	68 2c 46 00 00       	push   $0x462c
     f9e:	6a 01                	push   $0x1
     fa0:	e8 3b 2f 00 00       	call   3ee0 <printf>

  unlink("sharedfd");
     fa5:	c7 04 24 3b 46 00 00 	movl   $0x463b,(%esp)
     fac:	e8 31 2e 00 00       	call   3de2 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     fb1:	5b                   	pop    %ebx
     fb2:	5e                   	pop    %esi
     fb3:	68 02 02 00 00       	push   $0x202
     fb8:	68 3b 46 00 00       	push   $0x463b
     fbd:	e8 10 2e 00 00       	call   3dd2 <open>
  if(fd < 0){
     fc2:	83 c4 10             	add    $0x10,%esp
     fc5:	85 c0                	test   %eax,%eax
     fc7:	0f 88 29 01 00 00    	js     10f6 <sharedfd+0x166>
     fcd:	89 c7                	mov    %eax,%edi
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
     fcf:	8d 75 de             	lea    -0x22(%ebp),%esi
     fd2:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     fd7:	e8 ae 2d 00 00       	call   3d8a <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     fdc:	83 f8 01             	cmp    $0x1,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     fdf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     fe2:	19 c0                	sbb    %eax,%eax
     fe4:	83 ec 04             	sub    $0x4,%esp
     fe7:	83 e0 f3             	and    $0xfffffff3,%eax
     fea:	6a 0a                	push   $0xa
     fec:	83 c0 70             	add    $0x70,%eax
     fef:	50                   	push   %eax
     ff0:	56                   	push   %esi
     ff1:	e8 0a 2c 00 00       	call   3c00 <memset>
     ff6:	83 c4 10             	add    $0x10,%esp
     ff9:	eb 0a                	jmp    1005 <sharedfd+0x75>
     ffb:	90                   	nop
     ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
    1000:	83 eb 01             	sub    $0x1,%ebx
    1003:	74 26                	je     102b <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    1005:	83 ec 04             	sub    $0x4,%esp
    1008:	6a 0a                	push   $0xa
    100a:	56                   	push   %esi
    100b:	57                   	push   %edi
    100c:	e8 a1 2d 00 00       	call   3db2 <write>
    1011:	83 c4 10             	add    $0x10,%esp
    1014:	83 f8 0a             	cmp    $0xa,%eax
    1017:	74 e7                	je     1000 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
    1019:	83 ec 08             	sub    $0x8,%esp
    101c:	68 2c 53 00 00       	push   $0x532c
    1021:	6a 01                	push   $0x1
    1023:	e8 b8 2e 00 00       	call   3ee0 <printf>
      break;
    1028:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
    102b:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    102e:	85 c9                	test   %ecx,%ecx
    1030:	0f 84 f4 00 00 00    	je     112a <sharedfd+0x19a>
    exit(0);
  else
    wait();
    1036:	e8 5f 2d 00 00       	call   3d9a <wait>
  close(fd);
    103b:	83 ec 0c             	sub    $0xc,%esp
    103e:	31 db                	xor    %ebx,%ebx
    1040:	57                   	push   %edi
    1041:	8d 7d e8             	lea    -0x18(%ebp),%edi
    1044:	e8 71 2d 00 00       	call   3dba <close>
  fd = open("sharedfd", 0);
    1049:	58                   	pop    %eax
    104a:	5a                   	pop    %edx
    104b:	6a 00                	push   $0x0
    104d:	68 3b 46 00 00       	push   $0x463b
    1052:	e8 7b 2d 00 00       	call   3dd2 <open>
  if(fd < 0){
    1057:	83 c4 10             	add    $0x10,%esp
    105a:	31 d2                	xor    %edx,%edx
    105c:	85 c0                	test   %eax,%eax
  if(pid == 0)
    exit(0);
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
    105e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
    1061:	0f 88 a9 00 00 00    	js     1110 <sharedfd+0x180>
    1067:	89 f6                	mov    %esi,%esi
    1069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    1070:	83 ec 04             	sub    $0x4,%esp
    1073:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    1076:	6a 0a                	push   $0xa
    1078:	56                   	push   %esi
    1079:	ff 75 d0             	pushl  -0x30(%ebp)
    107c:	e8 29 2d 00 00       	call   3daa <read>
    1081:	83 c4 10             	add    $0x10,%esp
    1084:	85 c0                	test   %eax,%eax
    1086:	7e 27                	jle    10af <sharedfd+0x11f>
    1088:	89 f0                	mov    %esi,%eax
    108a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    108d:	eb 13                	jmp    10a2 <sharedfd+0x112>
    108f:	90                   	nop
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
        np++;
    1090:	80 f9 70             	cmp    $0x70,%cl
    1093:	0f 94 c1             	sete   %cl
    1096:	0f b6 c9             	movzbl %cl,%ecx
    1099:	01 cb                	add    %ecx,%ebx
    109b:	83 c0 01             	add    $0x1,%eax
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
    109e:	39 c7                	cmp    %eax,%edi
    10a0:	74 ce                	je     1070 <sharedfd+0xe0>
      if(buf[i] == 'c')
    10a2:	0f b6 08             	movzbl (%eax),%ecx
    10a5:	80 f9 63             	cmp    $0x63,%cl
    10a8:	75 e6                	jne    1090 <sharedfd+0x100>
        nc++;
    10aa:	83 c2 01             	add    $0x1,%edx
    10ad:	eb ec                	jmp    109b <sharedfd+0x10b>
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
    10af:	83 ec 0c             	sub    $0xc,%esp
    10b2:	ff 75 d0             	pushl  -0x30(%ebp)
    10b5:	e8 00 2d 00 00       	call   3dba <close>
  unlink("sharedfd");
    10ba:	c7 04 24 3b 46 00 00 	movl   $0x463b,(%esp)
    10c1:	e8 1c 2d 00 00       	call   3de2 <unlink>
  if(nc == 10000 && np == 10000){
    10c6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    10c9:	83 c4 10             	add    $0x10,%esp
    10cc:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
    10d2:	75 60                	jne    1134 <sharedfd+0x1a4>
    10d4:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    10da:	75 58                	jne    1134 <sharedfd+0x1a4>
    printf(1, "sharedfd ok\n");
    10dc:	83 ec 08             	sub    $0x8,%esp
    10df:	68 44 46 00 00       	push   $0x4644
    10e4:	6a 01                	push   $0x1
    10e6:	e8 f5 2d 00 00       	call   3ee0 <printf>
    10eb:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit(0);
  }
}
    10ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10f1:	5b                   	pop    %ebx
    10f2:	5e                   	pop    %esi
    10f3:	5f                   	pop    %edi
    10f4:	5d                   	pop    %ebp
    10f5:	c3                   	ret    
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    10f6:	83 ec 08             	sub    $0x8,%esp
    10f9:	68 00 53 00 00       	push   $0x5300
    10fe:	6a 01                	push   $0x1
    1100:	e8 db 2d 00 00       	call   3ee0 <printf>
    return;
    1105:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit(0);
  }
}
    1108:	8d 65 f4             	lea    -0xc(%ebp),%esp
    110b:	5b                   	pop    %ebx
    110c:	5e                   	pop    %esi
    110d:	5f                   	pop    %edi
    110e:	5d                   	pop    %ebp
    110f:	c3                   	ret    
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    1110:	83 ec 08             	sub    $0x8,%esp
    1113:	68 4c 53 00 00       	push   $0x534c
    1118:	6a 01                	push   $0x1
    111a:	e8 c1 2d 00 00       	call   3ee0 <printf>
    return;
    111f:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit(0);
  }
}
    1122:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1125:	5b                   	pop    %ebx
    1126:	5e                   	pop    %esi
    1127:	5f                   	pop    %edi
    1128:	5d                   	pop    %ebp
    1129:	c3                   	ret    
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
    exit(0);
    112a:	83 ec 0c             	sub    $0xc,%esp
    112d:	6a 00                	push   $0x0
    112f:	e8 5e 2c 00 00       	call   3d92 <exit>
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    1134:	53                   	push   %ebx
    1135:	52                   	push   %edx
    1136:	68 51 46 00 00       	push   $0x4651
    113b:	6a 01                	push   $0x1
    113d:	e8 9e 2d 00 00       	call   3ee0 <printf>
    exit(0);
    1142:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1149:	e8 44 2c 00 00       	call   3d92 <exit>
    114e:	66 90                	xchg   %ax,%ax

00001150 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	57                   	push   %edi
    1154:	56                   	push   %esi
    1155:	53                   	push   %ebx
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");
    1156:	be 66 46 00 00       	mov    $0x4666,%esi

  for(pi = 0; pi < 4; pi++){
    115b:	31 db                	xor    %ebx,%ebx

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    115d:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1160:	c7 45 d8 66 46 00 00 	movl   $0x4666,-0x28(%ebp)
    1167:	c7 45 dc af 47 00 00 	movl   $0x47af,-0x24(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    116e:	68 6c 46 00 00       	push   $0x466c
    1173:	6a 01                	push   $0x1
// time, to test block allocation.
void
fourfiles(void)
{
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1175:	c7 45 e0 b3 47 00 00 	movl   $0x47b3,-0x20(%ebp)
    117c:	c7 45 e4 69 46 00 00 	movl   $0x4669,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    1183:	e8 58 2d 00 00       	call   3ee0 <printf>
    1188:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    fname = names[pi];
    unlink(fname);
    118b:	83 ec 0c             	sub    $0xc,%esp
    118e:	56                   	push   %esi
    118f:	e8 4e 2c 00 00       	call   3de2 <unlink>

    pid = fork();
    1194:	e8 f1 2b 00 00       	call   3d8a <fork>
    if(pid < 0){
    1199:	83 c4 10             	add    $0x10,%esp
    119c:	85 c0                	test   %eax,%eax
    119e:	0f 88 a4 01 00 00    	js     1348 <fourfiles+0x1f8>
      printf(1, "fork failed\n");
      exit(0);
    }

    if(pid == 0){
    11a4:	0f 84 ea 00 00 00    	je     1294 <fourfiles+0x144>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    11aa:	83 c3 01             	add    $0x1,%ebx
    11ad:	83 fb 04             	cmp    $0x4,%ebx
    11b0:	74 06                	je     11b8 <fourfiles+0x68>
    11b2:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    11b6:	eb d3                	jmp    118b <fourfiles+0x3b>
      exit(0);
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    11b8:	e8 dd 2b 00 00       	call   3d9a <wait>
    11bd:	bf 30 00 00 00       	mov    $0x30,%edi
    11c2:	e8 d3 2b 00 00       	call   3d9a <wait>
    11c7:	e8 ce 2b 00 00       	call   3d9a <wait>
    11cc:	e8 c9 2b 00 00       	call   3d9a <wait>
    11d1:	c7 45 d4 66 46 00 00 	movl   $0x4666,-0x2c(%ebp)
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    11d8:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    11db:	31 db                	xor    %ebx,%ebx
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    11dd:	6a 00                	push   $0x0
    11df:	ff 75 d4             	pushl  -0x2c(%ebp)
    11e2:	e8 eb 2b 00 00       	call   3dd2 <open>
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    11e7:	83 c4 10             	add    $0x10,%esp
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    11ea:	89 c6                	mov    %eax,%esi
    11ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    11f0:	83 ec 04             	sub    $0x4,%esp
    11f3:	68 00 20 00 00       	push   $0x2000
    11f8:	68 80 8a 00 00       	push   $0x8a80
    11fd:	56                   	push   %esi
    11fe:	e8 a7 2b 00 00       	call   3daa <read>
    1203:	83 c4 10             	add    $0x10,%esp
    1206:	85 c0                	test   %eax,%eax
    1208:	7e 1c                	jle    1226 <fourfiles+0xd6>
    120a:	31 d2                	xor    %edx,%edx
    120c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
    1210:	0f be 8a 80 8a 00 00 	movsbl 0x8a80(%edx),%ecx
    1217:	39 cf                	cmp    %ecx,%edi
    1219:	75 5e                	jne    1279 <fourfiles+0x129>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    121b:	83 c2 01             	add    $0x1,%edx
    121e:	39 d0                	cmp    %edx,%eax
    1220:	75 ee                	jne    1210 <fourfiles+0xc0>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit(0);
        }
      }
      total += n;
    1222:	01 c3                	add    %eax,%ebx
    1224:	eb ca                	jmp    11f0 <fourfiles+0xa0>
    }
    close(fd);
    1226:	83 ec 0c             	sub    $0xc,%esp
    1229:	56                   	push   %esi
    122a:	e8 8b 2b 00 00       	call   3dba <close>
    if(total != 12*500){
    122f:	83 c4 10             	add    $0x10,%esp
    1232:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1238:	0f 85 ee 00 00 00    	jne    132c <fourfiles+0x1dc>
      printf(1, "wrong length %d\n", total);
      exit(0);
    }
    unlink(fname);
    123e:	83 ec 0c             	sub    $0xc,%esp
    1241:	ff 75 d4             	pushl  -0x2c(%ebp)
    1244:	83 c7 01             	add    $0x1,%edi
    1247:	e8 96 2b 00 00       	call   3de2 <unlink>

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    124c:	83 c4 10             	add    $0x10,%esp
    124f:	83 ff 32             	cmp    $0x32,%edi
    1252:	75 1a                	jne    126e <fourfiles+0x11e>
      exit(0);
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    1254:	83 ec 08             	sub    $0x8,%esp
    1257:	68 aa 46 00 00       	push   $0x46aa
    125c:	6a 01                	push   $0x1
    125e:	e8 7d 2c 00 00       	call   3ee0 <printf>
}
    1263:	83 c4 10             	add    $0x10,%esp
    1266:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1269:	5b                   	pop    %ebx
    126a:	5e                   	pop    %esi
    126b:	5f                   	pop    %edi
    126c:	5d                   	pop    %ebp
    126d:	c3                   	ret    
    126e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1271:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1274:	e9 5f ff ff ff       	jmp    11d8 <fourfiles+0x88>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
    1279:	83 ec 08             	sub    $0x8,%esp
    127c:	68 8d 46 00 00       	push   $0x468d
    1281:	6a 01                	push   $0x1
    1283:	e8 58 2c 00 00       	call   3ee0 <printf>
          exit(0);
    1288:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    128f:	e8 fe 2a 00 00       	call   3d92 <exit>
      printf(1, "fork failed\n");
      exit(0);
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    1294:	83 ec 08             	sub    $0x8,%esp
    1297:	68 02 02 00 00       	push   $0x202
    129c:	56                   	push   %esi
    129d:	e8 30 2b 00 00       	call   3dd2 <open>
      if(fd < 0){
    12a2:	83 c4 10             	add    $0x10,%esp
    12a5:	85 c0                	test   %eax,%eax
      printf(1, "fork failed\n");
      exit(0);
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    12a7:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    12a9:	78 66                	js     1311 <fourfiles+0x1c1>
        printf(1, "create failed\n");
        exit(0);
      }

      memset(buf, '0'+pi, 512);
    12ab:	83 ec 04             	sub    $0x4,%esp
    12ae:	83 c3 30             	add    $0x30,%ebx
    12b1:	68 00 02 00 00       	push   $0x200
    12b6:	53                   	push   %ebx
    12b7:	bb 0c 00 00 00       	mov    $0xc,%ebx
    12bc:	68 80 8a 00 00       	push   $0x8a80
    12c1:	e8 3a 29 00 00       	call   3c00 <memset>
    12c6:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
    12c9:	83 ec 04             	sub    $0x4,%esp
    12cc:	68 f4 01 00 00       	push   $0x1f4
    12d1:	68 80 8a 00 00       	push   $0x8a80
    12d6:	56                   	push   %esi
    12d7:	e8 d6 2a 00 00       	call   3db2 <write>
    12dc:	83 c4 10             	add    $0x10,%esp
    12df:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    12e4:	75 0f                	jne    12f5 <fourfiles+0x1a5>
        printf(1, "create failed\n");
        exit(0);
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    12e6:	83 eb 01             	sub    $0x1,%ebx
    12e9:	75 de                	jne    12c9 <fourfiles+0x179>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit(0);
        }
      }
      exit(0);
    12eb:	83 ec 0c             	sub    $0xc,%esp
    12ee:	6a 00                	push   $0x0
    12f0:	e8 9d 2a 00 00       	call   3d92 <exit>
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
    12f5:	83 ec 04             	sub    $0x4,%esp
    12f8:	50                   	push   %eax
    12f9:	68 7c 46 00 00       	push   $0x467c
    12fe:	6a 01                	push   $0x1
    1300:	e8 db 2b 00 00       	call   3ee0 <printf>
          exit(0);
    1305:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    130c:	e8 81 2a 00 00       	call   3d92 <exit>
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
    1311:	83 ec 08             	sub    $0x8,%esp
    1314:	68 07 49 00 00       	push   $0x4907
    1319:	6a 01                	push   $0x1
    131b:	e8 c0 2b 00 00       	call   3ee0 <printf>
        exit(0);
    1320:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1327:	e8 66 2a 00 00       	call   3d92 <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
    132c:	83 ec 04             	sub    $0x4,%esp
    132f:	53                   	push   %ebx
    1330:	68 99 46 00 00       	push   $0x4699
    1335:	6a 01                	push   $0x1
    1337:	e8 a4 2b 00 00       	call   3ee0 <printf>
      exit(0);
    133c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1343:	e8 4a 2a 00 00       	call   3d92 <exit>
    fname = names[pi];
    unlink(fname);

    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1348:	83 ec 08             	sub    $0x8,%esp
    134b:	68 41 51 00 00       	push   $0x5141
    1350:	6a 01                	push   $0x1
    1352:	e8 89 2b 00 00       	call   3ee0 <printf>
      exit(0);
    1357:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    135e:	e8 2f 2a 00 00       	call   3d92 <exit>
    1363:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001370 <createdelete>:
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	57                   	push   %edi
    1374:	56                   	push   %esi
    1375:	53                   	push   %ebx
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    1376:	31 db                	xor    %ebx,%ebx
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1378:	83 ec 44             	sub    $0x44,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    137b:	68 b8 46 00 00       	push   $0x46b8
    1380:	6a 01                	push   $0x1
    1382:	e8 59 2b 00 00       	call   3ee0 <printf>
    1387:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    138a:	e8 fb 29 00 00       	call   3d8a <fork>
    if(pid < 0){
    138f:	85 c0                	test   %eax,%eax
    1391:	0f 88 ca 01 00 00    	js     1561 <createdelete+0x1f1>
      printf(1, "fork failed\n");
      exit(0);
    }

    if(pid == 0){
    1397:	0f 84 f6 00 00 00    	je     1493 <createdelete+0x123>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    139d:	83 c3 01             	add    $0x1,%ebx
    13a0:	83 fb 04             	cmp    $0x4,%ebx
    13a3:	75 e5                	jne    138a <createdelete+0x1a>
    13a5:	8d 7d c8             	lea    -0x38(%ebp),%edi
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    13a8:	31 f6                	xor    %esi,%esi
      exit(0);
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    13aa:	e8 eb 29 00 00       	call   3d9a <wait>
    13af:	e8 e6 29 00 00       	call   3d9a <wait>
    13b4:	e8 e1 29 00 00       	call   3d9a <wait>
    13b9:	e8 dc 29 00 00       	call   3d9a <wait>
  }

  name[0] = name[1] = name[2] = 0;
    13be:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    13c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    13c8:	8d 46 30             	lea    0x30(%esi),%eax
    13cb:	83 fe 09             	cmp    $0x9,%esi
      exit(0);
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
    13ce:	bb 70 00 00 00       	mov    $0x70,%ebx
    13d3:	0f 9f c2             	setg   %dl
    13d6:	85 f6                	test   %esi,%esi
    13d8:	88 45 c7             	mov    %al,-0x39(%ebp)
    13db:	0f 94 c0             	sete   %al
    13de:	09 c2                	or     %eax,%edx
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit(0);
      } else if((i >= 1 && i < N/2) && fd >= 0){
    13e0:	8d 46 ff             	lea    -0x1(%esi),%eax
    13e3:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    13e6:	89 45 c0             	mov    %eax,-0x40(%ebp)

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    13e9:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    13ed:	83 ec 08             	sub    $0x8,%esp
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
    13f0:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
      fd = open(name, 0);
    13f3:	6a 00                	push   $0x0
    13f5:	57                   	push   %edi

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    13f6:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    13f9:	e8 d4 29 00 00       	call   3dd2 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    13fe:	89 c1                	mov    %eax,%ecx
    1400:	83 c4 10             	add    $0x10,%esp
    1403:	c1 e9 1f             	shr    $0x1f,%ecx
    1406:	84 c9                	test   %cl,%cl
    1408:	74 0a                	je     1414 <createdelete+0xa4>
    140a:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    140e:	0f 85 16 01 00 00    	jne    152a <createdelete+0x1ba>
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit(0);
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1414:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    1418:	0f 86 5e 01 00 00    	jbe    157c <createdelete+0x20c>
        printf(1, "oops createdelete %s did exist\n", name);
        exit(0);
      }
      if(fd >= 0)
    141e:	85 c0                	test   %eax,%eax
    1420:	78 0c                	js     142e <createdelete+0xbe>
        close(fd);
    1422:	83 ec 0c             	sub    $0xc,%esp
    1425:	50                   	push   %eax
    1426:	e8 8f 29 00 00       	call   3dba <close>
    142b:	83 c4 10             	add    $0x10,%esp
    142e:	83 c3 01             	add    $0x1,%ebx
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    1431:	80 fb 74             	cmp    $0x74,%bl
    1434:	75 b3                	jne    13e9 <createdelete+0x79>
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    1436:	83 c6 01             	add    $0x1,%esi
    1439:	83 fe 14             	cmp    $0x14,%esi
    143c:	75 8a                	jne    13c8 <createdelete+0x58>
    143e:	be 70 00 00 00       	mov    $0x70,%esi
    1443:	90                   	nop
    1444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1448:	8d 46 c0             	lea    -0x40(%esi),%eax
    144b:	bb 04 00 00 00       	mov    $0x4,%ebx
    1450:	88 45 c7             	mov    %al,-0x39(%ebp)
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    1453:	89 f0                	mov    %esi,%eax
      name[1] = '0' + i;
      unlink(name);
    1455:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    1458:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    145b:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    145f:	57                   	push   %edi
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
      name[1] = '0' + i;
    1460:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    1463:	e8 7a 29 00 00       	call   3de2 <unlink>
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    1468:	83 c4 10             	add    $0x10,%esp
    146b:	83 eb 01             	sub    $0x1,%ebx
    146e:	75 e3                	jne    1453 <createdelete+0xe3>
    1470:	83 c6 01             	add    $0x1,%esi
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    1473:	89 f0                	mov    %esi,%eax
    1475:	3c 84                	cmp    $0x84,%al
    1477:	75 cf                	jne    1448 <createdelete+0xd8>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    1479:	83 ec 08             	sub    $0x8,%esp
    147c:	68 cb 46 00 00       	push   $0x46cb
    1481:	6a 01                	push   $0x1
    1483:	e8 58 2a 00 00       	call   3ee0 <printf>
}
    1488:	83 c4 10             	add    $0x10,%esp
    148b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    148e:	5b                   	pop    %ebx
    148f:	5e                   	pop    %esi
    1490:	5f                   	pop    %edi
    1491:	5d                   	pop    %ebp
    1492:	c3                   	ret    
      printf(1, "fork failed\n");
      exit(0);
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    1493:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    1496:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    149a:	be 01 00 00 00       	mov    $0x1,%esi
      printf(1, "fork failed\n");
      exit(0);
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    149f:	88 5d c8             	mov    %bl,-0x38(%ebp)
    14a2:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    14a5:	31 db                	xor    %ebx,%ebx
    14a7:	eb 12                	jmp    14bb <createdelete+0x14b>
    14a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    14b0:	83 fe 14             	cmp    $0x14,%esi
    14b3:	74 6b                	je     1520 <createdelete+0x1b0>
    14b5:	83 c3 01             	add    $0x1,%ebx
    14b8:	83 c6 01             	add    $0x1,%esi
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
    14bb:	83 ec 08             	sub    $0x8,%esp

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    14be:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    14c1:	68 02 02 00 00       	push   $0x202
    14c6:	57                   	push   %edi

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    14c7:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    14ca:	e8 03 29 00 00       	call   3dd2 <open>
        if(fd < 0){
    14cf:	83 c4 10             	add    $0x10,%esp
    14d2:	85 c0                	test   %eax,%eax
    14d4:	78 70                	js     1546 <createdelete+0x1d6>
          printf(1, "create failed\n");
          exit(0);
        }
        close(fd);
    14d6:	83 ec 0c             	sub    $0xc,%esp
    14d9:	50                   	push   %eax
    14da:	e8 db 28 00 00       	call   3dba <close>
        if(i > 0 && (i % 2 ) == 0){
    14df:	83 c4 10             	add    $0x10,%esp
    14e2:	85 db                	test   %ebx,%ebx
    14e4:	74 cf                	je     14b5 <createdelete+0x145>
    14e6:	f6 c3 01             	test   $0x1,%bl
    14e9:	75 c5                	jne    14b0 <createdelete+0x140>
          name[1] = '0' + (i / 2);
          if(unlink(name) < 0){
    14eb:	83 ec 0c             	sub    $0xc,%esp
          printf(1, "create failed\n");
          exit(0);
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    14ee:	89 d8                	mov    %ebx,%eax
    14f0:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    14f2:	57                   	push   %edi
          printf(1, "create failed\n");
          exit(0);
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    14f3:	83 c0 30             	add    $0x30,%eax
    14f6:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    14f9:	e8 e4 28 00 00       	call   3de2 <unlink>
    14fe:	83 c4 10             	add    $0x10,%esp
    1501:	85 c0                	test   %eax,%eax
    1503:	79 ab                	jns    14b0 <createdelete+0x140>
            printf(1, "unlink failed\n");
    1505:	83 ec 08             	sub    $0x8,%esp
    1508:	68 b9 42 00 00       	push   $0x42b9
    150d:	6a 01                	push   $0x1
    150f:	e8 cc 29 00 00       	call   3ee0 <printf>
            exit(0);
    1514:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    151b:	e8 72 28 00 00       	call   3d92 <exit>
          }
        }
      }
      exit(0);
    1520:	83 ec 0c             	sub    $0xc,%esp
    1523:	6a 00                	push   $0x0
    1525:	e8 68 28 00 00       	call   3d92 <exit>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
    152a:	83 ec 04             	sub    $0x4,%esp
    152d:	57                   	push   %edi
    152e:	68 78 53 00 00       	push   $0x5378
    1533:	6a 01                	push   $0x1
    1535:	e8 a6 29 00 00       	call   3ee0 <printf>
        exit(0);
    153a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1541:	e8 4c 28 00 00       	call   3d92 <exit>
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    1546:	83 ec 08             	sub    $0x8,%esp
    1549:	68 07 49 00 00       	push   $0x4907
    154e:	6a 01                	push   $0x1
    1550:	e8 8b 29 00 00       	call   3ee0 <printf>
          exit(0);
    1555:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    155c:	e8 31 28 00 00       	call   3d92 <exit>
  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1561:	83 ec 08             	sub    $0x8,%esp
    1564:	68 41 51 00 00       	push   $0x5141
    1569:	6a 01                	push   $0x1
    156b:	e8 70 29 00 00       	call   3ee0 <printf>
      exit(0);
    1570:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1577:	e8 16 28 00 00       	call   3d92 <exit>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit(0);
      } else if((i >= 1 && i < N/2) && fd >= 0){
    157c:	85 c0                	test   %eax,%eax
    157e:	0f 88 aa fe ff ff    	js     142e <createdelete+0xbe>
        printf(1, "oops createdelete %s did exist\n", name);
    1584:	83 ec 04             	sub    $0x4,%esp
    1587:	57                   	push   %edi
    1588:	68 9c 53 00 00       	push   $0x539c
    158d:	6a 01                	push   $0x1
    158f:	e8 4c 29 00 00       	call   3ee0 <printf>
        exit(0);
    1594:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    159b:	e8 f2 27 00 00       	call   3d92 <exit>

000015a0 <unlinkread>:
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    15a0:	55                   	push   %ebp
    15a1:	89 e5                	mov    %esp,%ebp
    15a3:	56                   	push   %esi
    15a4:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    15a5:	83 ec 08             	sub    $0x8,%esp
    15a8:	68 dc 46 00 00       	push   $0x46dc
    15ad:	6a 01                	push   $0x1
    15af:	e8 2c 29 00 00       	call   3ee0 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    15b4:	5b                   	pop    %ebx
    15b5:	5e                   	pop    %esi
    15b6:	68 02 02 00 00       	push   $0x202
    15bb:	68 ed 46 00 00       	push   $0x46ed
    15c0:	e8 0d 28 00 00       	call   3dd2 <open>
  if(fd < 0){
    15c5:	83 c4 10             	add    $0x10,%esp
    15c8:	85 c0                	test   %eax,%eax
    15ca:	0f 88 e6 00 00 00    	js     16b6 <unlinkread+0x116>
    printf(1, "create unlinkread failed\n");
    exit(0);
  }
  write(fd, "hello", 5);
    15d0:	83 ec 04             	sub    $0x4,%esp
    15d3:	89 c3                	mov    %eax,%ebx
    15d5:	6a 05                	push   $0x5
    15d7:	68 12 47 00 00       	push   $0x4712
    15dc:	50                   	push   %eax
    15dd:	e8 d0 27 00 00       	call   3db2 <write>
  close(fd);
    15e2:	89 1c 24             	mov    %ebx,(%esp)
    15e5:	e8 d0 27 00 00       	call   3dba <close>

  fd = open("unlinkread", O_RDWR);
    15ea:	58                   	pop    %eax
    15eb:	5a                   	pop    %edx
    15ec:	6a 02                	push   $0x2
    15ee:	68 ed 46 00 00       	push   $0x46ed
    15f3:	e8 da 27 00 00       	call   3dd2 <open>
  if(fd < 0){
    15f8:	83 c4 10             	add    $0x10,%esp
    15fb:	85 c0                	test   %eax,%eax
    exit(0);
  }
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
    15fd:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    15ff:	0f 88 33 01 00 00    	js     1738 <unlinkread+0x198>
    printf(1, "open unlinkread failed\n");
    exit(0);
  }
  if(unlink("unlinkread") != 0){
    1605:	83 ec 0c             	sub    $0xc,%esp
    1608:	68 ed 46 00 00       	push   $0x46ed
    160d:	e8 d0 27 00 00       	call   3de2 <unlink>
    1612:	83 c4 10             	add    $0x10,%esp
    1615:	85 c0                	test   %eax,%eax
    1617:	0f 85 01 01 00 00    	jne    171e <unlinkread+0x17e>
    printf(1, "unlink unlinkread failed\n");
    exit(0);
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    161d:	83 ec 08             	sub    $0x8,%esp
    1620:	68 02 02 00 00       	push   $0x202
    1625:	68 ed 46 00 00       	push   $0x46ed
    162a:	e8 a3 27 00 00       	call   3dd2 <open>
  write(fd1, "yyy", 3);
    162f:	83 c4 0c             	add    $0xc,%esp
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit(0);
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1632:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    1634:	6a 03                	push   $0x3
    1636:	68 4a 47 00 00       	push   $0x474a
    163b:	50                   	push   %eax
    163c:	e8 71 27 00 00       	call   3db2 <write>
  close(fd1);
    1641:	89 34 24             	mov    %esi,(%esp)
    1644:	e8 71 27 00 00       	call   3dba <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    1649:	83 c4 0c             	add    $0xc,%esp
    164c:	68 00 20 00 00       	push   $0x2000
    1651:	68 80 8a 00 00       	push   $0x8a80
    1656:	53                   	push   %ebx
    1657:	e8 4e 27 00 00       	call   3daa <read>
    165c:	83 c4 10             	add    $0x10,%esp
    165f:	83 f8 05             	cmp    $0x5,%eax
    1662:	0f 85 9c 00 00 00    	jne    1704 <unlinkread+0x164>
    printf(1, "unlinkread read failed");
    exit(0);
  }
  if(buf[0] != 'h'){
    1668:	80 3d 80 8a 00 00 68 	cmpb   $0x68,0x8a80
    166f:	75 79                	jne    16ea <unlinkread+0x14a>
    printf(1, "unlinkread wrong data\n");
    exit(0);
  }
  if(write(fd, buf, 10) != 10){
    1671:	83 ec 04             	sub    $0x4,%esp
    1674:	6a 0a                	push   $0xa
    1676:	68 80 8a 00 00       	push   $0x8a80
    167b:	53                   	push   %ebx
    167c:	e8 31 27 00 00       	call   3db2 <write>
    1681:	83 c4 10             	add    $0x10,%esp
    1684:	83 f8 0a             	cmp    $0xa,%eax
    1687:	75 47                	jne    16d0 <unlinkread+0x130>
    printf(1, "unlinkread write failed\n");
    exit(0);
  }
  close(fd);
    1689:	83 ec 0c             	sub    $0xc,%esp
    168c:	53                   	push   %ebx
    168d:	e8 28 27 00 00       	call   3dba <close>
  unlink("unlinkread");
    1692:	c7 04 24 ed 46 00 00 	movl   $0x46ed,(%esp)
    1699:	e8 44 27 00 00       	call   3de2 <unlink>
  printf(1, "unlinkread ok\n");
    169e:	58                   	pop    %eax
    169f:	5a                   	pop    %edx
    16a0:	68 95 47 00 00       	push   $0x4795
    16a5:	6a 01                	push   $0x1
    16a7:	e8 34 28 00 00       	call   3ee0 <printf>
}
    16ac:	83 c4 10             	add    $0x10,%esp
    16af:	8d 65 f8             	lea    -0x8(%ebp),%esp
    16b2:	5b                   	pop    %ebx
    16b3:	5e                   	pop    %esi
    16b4:	5d                   	pop    %ebp
    16b5:	c3                   	ret    
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    16b6:	51                   	push   %ecx
    16b7:	51                   	push   %ecx
    16b8:	68 f8 46 00 00       	push   $0x46f8
    16bd:	6a 01                	push   $0x1
    16bf:	e8 1c 28 00 00       	call   3ee0 <printf>
    exit(0);
    16c4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    16cb:	e8 c2 26 00 00       	call   3d92 <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit(0);
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    16d0:	51                   	push   %ecx
    16d1:	51                   	push   %ecx
    16d2:	68 7c 47 00 00       	push   $0x477c
    16d7:	6a 01                	push   $0x1
    16d9:	e8 02 28 00 00       	call   3ee0 <printf>
    exit(0);
    16de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    16e5:	e8 a8 26 00 00       	call   3d92 <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit(0);
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    16ea:	53                   	push   %ebx
    16eb:	53                   	push   %ebx
    16ec:	68 65 47 00 00       	push   $0x4765
    16f1:	6a 01                	push   $0x1
    16f3:	e8 e8 27 00 00       	call   3ee0 <printf>
    exit(0);
    16f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    16ff:	e8 8e 26 00 00       	call   3d92 <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    1704:	56                   	push   %esi
    1705:	56                   	push   %esi
    1706:	68 4e 47 00 00       	push   $0x474e
    170b:	6a 01                	push   $0x1
    170d:	e8 ce 27 00 00       	call   3ee0 <printf>
    exit(0);
    1712:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1719:	e8 74 26 00 00       	call   3d92 <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit(0);
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    171e:	50                   	push   %eax
    171f:	50                   	push   %eax
    1720:	68 30 47 00 00       	push   $0x4730
    1725:	6a 01                	push   $0x1
    1727:	e8 b4 27 00 00       	call   3ee0 <printf>
    exit(0);
    172c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1733:	e8 5a 26 00 00       	call   3d92 <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    1738:	50                   	push   %eax
    1739:	50                   	push   %eax
    173a:	68 18 47 00 00       	push   $0x4718
    173f:	6a 01                	push   $0x1
    1741:	e8 9a 27 00 00       	call   3ee0 <printf>
    exit(0);
    1746:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    174d:	e8 40 26 00 00       	call   3d92 <exit>
    1752:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001760 <linktest>:
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    1760:	55                   	push   %ebp
    1761:	89 e5                	mov    %esp,%ebp
    1763:	53                   	push   %ebx
    1764:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
    1767:	68 a4 47 00 00       	push   $0x47a4
    176c:	6a 01                	push   $0x1
    176e:	e8 6d 27 00 00       	call   3ee0 <printf>

  unlink("lf1");
    1773:	c7 04 24 ae 47 00 00 	movl   $0x47ae,(%esp)
    177a:	e8 63 26 00 00       	call   3de2 <unlink>
  unlink("lf2");
    177f:	c7 04 24 b2 47 00 00 	movl   $0x47b2,(%esp)
    1786:	e8 57 26 00 00       	call   3de2 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    178b:	58                   	pop    %eax
    178c:	5a                   	pop    %edx
    178d:	68 02 02 00 00       	push   $0x202
    1792:	68 ae 47 00 00       	push   $0x47ae
    1797:	e8 36 26 00 00       	call   3dd2 <open>
  if(fd < 0){
    179c:	83 c4 10             	add    $0x10,%esp
    179f:	85 c0                	test   %eax,%eax
    17a1:	0f 88 1e 01 00 00    	js     18c5 <linktest+0x165>
    printf(1, "create lf1 failed\n");
    exit(0);
  }
  if(write(fd, "hello", 5) != 5){
    17a7:	83 ec 04             	sub    $0x4,%esp
    17aa:	89 c3                	mov    %eax,%ebx
    17ac:	6a 05                	push   $0x5
    17ae:	68 12 47 00 00       	push   $0x4712
    17b3:	50                   	push   %eax
    17b4:	e8 f9 25 00 00       	call   3db2 <write>
    17b9:	83 c4 10             	add    $0x10,%esp
    17bc:	83 f8 05             	cmp    $0x5,%eax
    17bf:	0f 85 d0 01 00 00    	jne    1995 <linktest+0x235>
    printf(1, "write lf1 failed\n");
    exit(0);
  }
  close(fd);
    17c5:	83 ec 0c             	sub    $0xc,%esp
    17c8:	53                   	push   %ebx
    17c9:	e8 ec 25 00 00       	call   3dba <close>

  if(link("lf1", "lf2") < 0){
    17ce:	5b                   	pop    %ebx
    17cf:	58                   	pop    %eax
    17d0:	68 b2 47 00 00       	push   $0x47b2
    17d5:	68 ae 47 00 00       	push   $0x47ae
    17da:	e8 13 26 00 00       	call   3df2 <link>
    17df:	83 c4 10             	add    $0x10,%esp
    17e2:	85 c0                	test   %eax,%eax
    17e4:	0f 88 91 01 00 00    	js     197b <linktest+0x21b>
    printf(1, "link lf1 lf2 failed\n");
    exit(0);
  }
  unlink("lf1");
    17ea:	83 ec 0c             	sub    $0xc,%esp
    17ed:	68 ae 47 00 00       	push   $0x47ae
    17f2:	e8 eb 25 00 00       	call   3de2 <unlink>

  if(open("lf1", 0) >= 0){
    17f7:	58                   	pop    %eax
    17f8:	5a                   	pop    %edx
    17f9:	6a 00                	push   $0x0
    17fb:	68 ae 47 00 00       	push   $0x47ae
    1800:	e8 cd 25 00 00       	call   3dd2 <open>
    1805:	83 c4 10             	add    $0x10,%esp
    1808:	85 c0                	test   %eax,%eax
    180a:	0f 89 51 01 00 00    	jns    1961 <linktest+0x201>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit(0);
  }

  fd = open("lf2", 0);
    1810:	83 ec 08             	sub    $0x8,%esp
    1813:	6a 00                	push   $0x0
    1815:	68 b2 47 00 00       	push   $0x47b2
    181a:	e8 b3 25 00 00       	call   3dd2 <open>
  if(fd < 0){
    181f:	83 c4 10             	add    $0x10,%esp
    1822:	85 c0                	test   %eax,%eax
  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    exit(0);
  }

  fd = open("lf2", 0);
    1824:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1826:	0f 88 1b 01 00 00    	js     1947 <linktest+0x1e7>
    printf(1, "open lf2 failed\n");
    exit(0);
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    182c:	83 ec 04             	sub    $0x4,%esp
    182f:	68 00 20 00 00       	push   $0x2000
    1834:	68 80 8a 00 00       	push   $0x8a80
    1839:	50                   	push   %eax
    183a:	e8 6b 25 00 00       	call   3daa <read>
    183f:	83 c4 10             	add    $0x10,%esp
    1842:	83 f8 05             	cmp    $0x5,%eax
    1845:	0f 85 e2 00 00 00    	jne    192d <linktest+0x1cd>
    printf(1, "read lf2 failed\n");
    exit(0);
  }
  close(fd);
    184b:	83 ec 0c             	sub    $0xc,%esp
    184e:	53                   	push   %ebx
    184f:	e8 66 25 00 00       	call   3dba <close>

  if(link("lf2", "lf2") >= 0){
    1854:	58                   	pop    %eax
    1855:	5a                   	pop    %edx
    1856:	68 b2 47 00 00       	push   $0x47b2
    185b:	68 b2 47 00 00       	push   $0x47b2
    1860:	e8 8d 25 00 00       	call   3df2 <link>
    1865:	83 c4 10             	add    $0x10,%esp
    1868:	85 c0                	test   %eax,%eax
    186a:	0f 89 a3 00 00 00    	jns    1913 <linktest+0x1b3>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit(0);
  }

  unlink("lf2");
    1870:	83 ec 0c             	sub    $0xc,%esp
    1873:	68 b2 47 00 00       	push   $0x47b2
    1878:	e8 65 25 00 00       	call   3de2 <unlink>
  if(link("lf2", "lf1") >= 0){
    187d:	59                   	pop    %ecx
    187e:	5b                   	pop    %ebx
    187f:	68 ae 47 00 00       	push   $0x47ae
    1884:	68 b2 47 00 00       	push   $0x47b2
    1889:	e8 64 25 00 00       	call   3df2 <link>
    188e:	83 c4 10             	add    $0x10,%esp
    1891:	85 c0                	test   %eax,%eax
    1893:	79 64                	jns    18f9 <linktest+0x199>
    printf(1, "link non-existant succeeded! oops\n");
    exit(0);
  }

  if(link(".", "lf1") >= 0){
    1895:	83 ec 08             	sub    $0x8,%esp
    1898:	68 ae 47 00 00       	push   $0x47ae
    189d:	68 76 4a 00 00       	push   $0x4a76
    18a2:	e8 4b 25 00 00       	call   3df2 <link>
    18a7:	83 c4 10             	add    $0x10,%esp
    18aa:	85 c0                	test   %eax,%eax
    18ac:	79 31                	jns    18df <linktest+0x17f>
    printf(1, "link . lf1 succeeded! oops\n");
    exit(0);
  }

  printf(1, "linktest ok\n");
    18ae:	83 ec 08             	sub    $0x8,%esp
    18b1:	68 4c 48 00 00       	push   $0x484c
    18b6:	6a 01                	push   $0x1
    18b8:	e8 23 26 00 00       	call   3ee0 <printf>
}
    18bd:	83 c4 10             	add    $0x10,%esp
    18c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    18c3:	c9                   	leave  
    18c4:	c3                   	ret    
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    18c5:	50                   	push   %eax
    18c6:	50                   	push   %eax
    18c7:	68 b6 47 00 00       	push   $0x47b6
    18cc:	6a 01                	push   $0x1
    18ce:	e8 0d 26 00 00       	call   3ee0 <printf>
    exit(0);
    18d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18da:	e8 b3 24 00 00       	call   3d92 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit(0);
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    18df:	50                   	push   %eax
    18e0:	50                   	push   %eax
    18e1:	68 30 48 00 00       	push   $0x4830
    18e6:	6a 01                	push   $0x1
    18e8:	e8 f3 25 00 00       	call   3ee0 <printf>
    exit(0);
    18ed:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18f4:	e8 99 24 00 00       	call   3d92 <exit>
    exit(0);
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    18f9:	52                   	push   %edx
    18fa:	52                   	push   %edx
    18fb:	68 e4 53 00 00       	push   $0x53e4
    1900:	6a 01                	push   $0x1
    1902:	e8 d9 25 00 00       	call   3ee0 <printf>
    exit(0);
    1907:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    190e:	e8 7f 24 00 00       	call   3d92 <exit>
    exit(0);
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    1913:	50                   	push   %eax
    1914:	50                   	push   %eax
    1915:	68 12 48 00 00       	push   $0x4812
    191a:	6a 01                	push   $0x1
    191c:	e8 bf 25 00 00       	call   3ee0 <printf>
    exit(0);
    1921:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1928:	e8 65 24 00 00       	call   3d92 <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit(0);
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    192d:	51                   	push   %ecx
    192e:	51                   	push   %ecx
    192f:	68 01 48 00 00       	push   $0x4801
    1934:	6a 01                	push   $0x1
    1936:	e8 a5 25 00 00       	call   3ee0 <printf>
    exit(0);
    193b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1942:	e8 4b 24 00 00       	call   3d92 <exit>
    exit(0);
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    1947:	53                   	push   %ebx
    1948:	53                   	push   %ebx
    1949:	68 f0 47 00 00       	push   $0x47f0
    194e:	6a 01                	push   $0x1
    1950:	e8 8b 25 00 00       	call   3ee0 <printf>
    exit(0);
    1955:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    195c:	e8 31 24 00 00       	call   3d92 <exit>
    exit(0);
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    1961:	50                   	push   %eax
    1962:	50                   	push   %eax
    1963:	68 bc 53 00 00       	push   $0x53bc
    1968:	6a 01                	push   $0x1
    196a:	e8 71 25 00 00       	call   3ee0 <printf>
    exit(0);
    196f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1976:	e8 17 24 00 00       	call   3d92 <exit>
    exit(0);
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    197b:	51                   	push   %ecx
    197c:	51                   	push   %ecx
    197d:	68 db 47 00 00       	push   $0x47db
    1982:	6a 01                	push   $0x1
    1984:	e8 57 25 00 00       	call   3ee0 <printf>
    exit(0);
    1989:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1990:	e8 fd 23 00 00       	call   3d92 <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit(0);
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    1995:	50                   	push   %eax
    1996:	50                   	push   %eax
    1997:	68 c9 47 00 00       	push   $0x47c9
    199c:	6a 01                	push   $0x1
    199e:	e8 3d 25 00 00       	call   3ee0 <printf>
    exit(0);
    19a3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19aa:	e8 e3 23 00 00       	call   3d92 <exit>
    19af:	90                   	nop

000019b0 <concreate>:
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    19b0:	55                   	push   %ebp
    19b1:	89 e5                	mov    %esp,%ebp
    19b3:	57                   	push   %edi
    19b4:	56                   	push   %esi
    19b5:	53                   	push   %ebx
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    19b6:	31 f6                	xor    %esi,%esi
    19b8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    19bb:	bf 56 55 55 55       	mov    $0x55555556,%edi
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    19c0:	83 ec 64             	sub    $0x64,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    19c3:	68 59 48 00 00       	push   $0x4859
    19c8:	6a 01                	push   $0x1
    19ca:	e8 11 25 00 00       	call   3ee0 <printf>
  file[0] = 'C';
    19cf:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    19d3:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    19d7:	83 c4 10             	add    $0x10,%esp
    19da:	eb 51                	jmp    1a2d <concreate+0x7d>
    19dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    19e0:	89 f0                	mov    %esi,%eax
    19e2:	89 f1                	mov    %esi,%ecx
    19e4:	f7 ef                	imul   %edi
    19e6:	89 f0                	mov    %esi,%eax
    19e8:	c1 f8 1f             	sar    $0x1f,%eax
    19eb:	29 c2                	sub    %eax,%edx
    19ed:	8d 04 52             	lea    (%edx,%edx,2),%eax
    19f0:	29 c1                	sub    %eax,%ecx
    19f2:	83 f9 01             	cmp    $0x1,%ecx
    19f5:	0f 84 c5 00 00 00    	je     1ac0 <concreate+0x110>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    19fb:	83 ec 08             	sub    $0x8,%esp
    19fe:	68 02 02 00 00       	push   $0x202
    1a03:	53                   	push   %ebx
    1a04:	e8 c9 23 00 00       	call   3dd2 <open>
      if(fd < 0){
    1a09:	83 c4 10             	add    $0x10,%esp
    1a0c:	85 c0                	test   %eax,%eax
    1a0e:	78 6d                	js     1a7d <concreate+0xcd>
        printf(1, "concreate create %s failed\n", file);
        exit(0);
      }
      close(fd);
    1a10:	83 ec 0c             	sub    $0xc,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1a13:	83 c6 01             	add    $0x1,%esi
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit(0);
      }
      close(fd);
    1a16:	50                   	push   %eax
    1a17:	e8 9e 23 00 00       	call   3dba <close>
    1a1c:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
      exit(0);
    else
      wait();
    1a1f:	e8 76 23 00 00       	call   3d9a <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1a24:	83 fe 28             	cmp    $0x28,%esi
    1a27:	0f 84 bb 00 00 00    	je     1ae8 <concreate+0x138>
    file[1] = '0' + i;
    unlink(file);
    1a2d:	83 ec 0c             	sub    $0xc,%esp

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1a30:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    1a33:	53                   	push   %ebx

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1a34:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1a37:	e8 a6 23 00 00       	call   3de2 <unlink>
    pid = fork();
    1a3c:	e8 49 23 00 00       	call   3d8a <fork>
    if(pid && (i % 3) == 1){
    1a41:	83 c4 10             	add    $0x10,%esp
    1a44:	85 c0                	test   %eax,%eax
    1a46:	75 98                	jne    19e0 <concreate+0x30>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    1a48:	89 f0                	mov    %esi,%eax
    1a4a:	ba 67 66 66 66       	mov    $0x66666667,%edx
    1a4f:	f7 ea                	imul   %edx
    1a51:	89 f0                	mov    %esi,%eax
    1a53:	c1 f8 1f             	sar    $0x1f,%eax
    1a56:	d1 fa                	sar    %edx
    1a58:	29 c2                	sub    %eax,%edx
    1a5a:	8d 04 92             	lea    (%edx,%edx,4),%eax
    1a5d:	29 c6                	sub    %eax,%esi
    1a5f:	83 fe 01             	cmp    $0x1,%esi
    1a62:	74 3c                	je     1aa0 <concreate+0xf0>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1a64:	83 ec 08             	sub    $0x8,%esp
    1a67:	68 02 02 00 00       	push   $0x202
    1a6c:	53                   	push   %ebx
    1a6d:	e8 60 23 00 00       	call   3dd2 <open>
      if(fd < 0){
    1a72:	83 c4 10             	add    $0x10,%esp
    1a75:	85 c0                	test   %eax,%eax
    1a77:	0f 89 5e 02 00 00    	jns    1cdb <concreate+0x32b>
        printf(1, "concreate create %s failed\n", file);
    1a7d:	83 ec 04             	sub    $0x4,%esp
    1a80:	53                   	push   %ebx
    1a81:	68 6c 48 00 00       	push   $0x486c
    1a86:	6a 01                	push   $0x1
    1a88:	e8 53 24 00 00       	call   3ee0 <printf>
        exit(0);
    1a8d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a94:	e8 f9 22 00 00       	call   3d92 <exit>
    1a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    1aa0:	83 ec 08             	sub    $0x8,%esp
    1aa3:	53                   	push   %ebx
    1aa4:	68 69 48 00 00       	push   $0x4869
    1aa9:	e8 44 23 00 00       	call   3df2 <link>
    1aae:	83 c4 10             	add    $0x10,%esp
        exit(0);
      }
      close(fd);
    }
    if(pid == 0)
      exit(0);
    1ab1:	83 ec 0c             	sub    $0xc,%esp
    1ab4:	6a 00                	push   $0x0
    1ab6:	e8 d7 22 00 00       	call   3d92 <exit>
    1abb:	90                   	nop
    1abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    1ac0:	83 ec 08             	sub    $0x8,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1ac3:	83 c6 01             	add    $0x1,%esi
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    1ac6:	53                   	push   %ebx
    1ac7:	68 69 48 00 00       	push   $0x4869
    1acc:	e8 21 23 00 00       	call   3df2 <link>
    1ad1:	83 c4 10             	add    $0x10,%esp
      close(fd);
    }
    if(pid == 0)
      exit(0);
    else
      wait();
    1ad4:	e8 c1 22 00 00       	call   3d9a <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1ad9:	83 fe 28             	cmp    $0x28,%esi
    1adc:	0f 85 4b ff ff ff    	jne    1a2d <concreate+0x7d>
    1ae2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit(0);
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    1ae8:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1aeb:	83 ec 04             	sub    $0x4,%esp
    1aee:	8d 7d b0             	lea    -0x50(%ebp),%edi
    1af1:	6a 28                	push   $0x28
    1af3:	6a 00                	push   $0x0
    1af5:	50                   	push   %eax
    1af6:	e8 05 21 00 00       	call   3c00 <memset>
  fd = open(".", 0);
    1afb:	59                   	pop    %ecx
    1afc:	5e                   	pop    %esi
    1afd:	6a 00                	push   $0x0
    1aff:	68 76 4a 00 00       	push   $0x4a76
    1b04:	e8 c9 22 00 00       	call   3dd2 <open>
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1b09:	83 c4 10             	add    $0x10,%esp
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    1b0c:	89 c6                	mov    %eax,%esi
  n = 0;
    1b0e:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    1b15:	8d 76 00             	lea    0x0(%esi),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    1b18:	83 ec 04             	sub    $0x4,%esp
    1b1b:	6a 10                	push   $0x10
    1b1d:	57                   	push   %edi
    1b1e:	56                   	push   %esi
    1b1f:	e8 86 22 00 00       	call   3daa <read>
    1b24:	83 c4 10             	add    $0x10,%esp
    1b27:	85 c0                	test   %eax,%eax
    1b29:	7e 3d                	jle    1b68 <concreate+0x1b8>
    if(de.inum == 0)
    1b2b:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1b30:	74 e6                	je     1b18 <concreate+0x168>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1b32:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1b36:	75 e0                	jne    1b18 <concreate+0x168>
    1b38:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1b3c:	75 da                	jne    1b18 <concreate+0x168>
      i = de.name[1] - '0';
    1b3e:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1b42:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1b45:	83 f8 27             	cmp    $0x27,%eax
    1b48:	0f 87 6e 01 00 00    	ja     1cbc <concreate+0x30c>
        printf(1, "concreate weird file %s\n", de.name);
        exit(0);
      }
      if(fa[i]){
    1b4e:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1b53:	0f 85 44 01 00 00    	jne    1c9d <concreate+0x2ed>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit(0);
      }
      fa[i] = 1;
    1b59:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    1b5e:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    1b62:	eb b4                	jmp    1b18 <concreate+0x168>
    1b64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  close(fd);
    1b68:	83 ec 0c             	sub    $0xc,%esp
    1b6b:	56                   	push   %esi
    1b6c:	e8 49 22 00 00       	call   3dba <close>

  if(n != 40){
    1b71:	83 c4 10             	add    $0x10,%esp
    1b74:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1b78:	0f 85 04 01 00 00    	jne    1c82 <concreate+0x2d2>
    1b7e:	31 f6                	xor    %esi,%esi
    1b80:	eb 70                	jmp    1bf2 <concreate+0x242>
    1b82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid < 0){
      printf(1, "fork failed\n");
      exit(0);
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
    1b88:	83 fa 01             	cmp    $0x1,%edx
    1b8b:	0f 85 99 00 00 00    	jne    1c2a <concreate+0x27a>
      close(open(file, 0));
    1b91:	83 ec 08             	sub    $0x8,%esp
    1b94:	6a 00                	push   $0x0
    1b96:	53                   	push   %ebx
    1b97:	e8 36 22 00 00       	call   3dd2 <open>
    1b9c:	89 04 24             	mov    %eax,(%esp)
    1b9f:	e8 16 22 00 00       	call   3dba <close>
      close(open(file, 0));
    1ba4:	58                   	pop    %eax
    1ba5:	5a                   	pop    %edx
    1ba6:	6a 00                	push   $0x0
    1ba8:	53                   	push   %ebx
    1ba9:	e8 24 22 00 00       	call   3dd2 <open>
    1bae:	89 04 24             	mov    %eax,(%esp)
    1bb1:	e8 04 22 00 00       	call   3dba <close>
      close(open(file, 0));
    1bb6:	59                   	pop    %ecx
    1bb7:	58                   	pop    %eax
    1bb8:	6a 00                	push   $0x0
    1bba:	53                   	push   %ebx
    1bbb:	e8 12 22 00 00       	call   3dd2 <open>
    1bc0:	89 04 24             	mov    %eax,(%esp)
    1bc3:	e8 f2 21 00 00       	call   3dba <close>
      close(open(file, 0));
    1bc8:	58                   	pop    %eax
    1bc9:	5a                   	pop    %edx
    1bca:	6a 00                	push   $0x0
    1bcc:	53                   	push   %ebx
    1bcd:	e8 00 22 00 00       	call   3dd2 <open>
    1bd2:	89 04 24             	mov    %eax,(%esp)
    1bd5:	e8 e0 21 00 00       	call   3dba <close>
    1bda:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    1bdd:	85 ff                	test   %edi,%edi
    1bdf:	0f 84 cc fe ff ff    	je     1ab1 <concreate+0x101>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit(0);
  }

  for(i = 0; i < 40; i++){
    1be5:	83 c6 01             	add    $0x1,%esi
      unlink(file);
    }
    if(pid == 0)
      exit(0);
    else
      wait();
    1be8:	e8 ad 21 00 00       	call   3d9a <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit(0);
  }

  for(i = 0; i < 40; i++){
    1bed:	83 fe 28             	cmp    $0x28,%esi
    1bf0:	74 5e                	je     1c50 <concreate+0x2a0>
    file[1] = '0' + i;
    1bf2:	8d 46 30             	lea    0x30(%esi),%eax
    1bf5:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    1bf8:	e8 8d 21 00 00       	call   3d8a <fork>
    if(pid < 0){
    1bfd:	85 c0                	test   %eax,%eax
    exit(0);
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    1bff:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1c01:	78 64                	js     1c67 <concreate+0x2b7>
      printf(1, "fork failed\n");
      exit(0);
    }
    if(((i % 3) == 0 && pid == 0) ||
    1c03:	b8 56 55 55 55       	mov    $0x55555556,%eax
    1c08:	f7 ee                	imul   %esi
    1c0a:	89 f0                	mov    %esi,%eax
    1c0c:	c1 f8 1f             	sar    $0x1f,%eax
    1c0f:	29 c2                	sub    %eax,%edx
    1c11:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1c14:	89 f2                	mov    %esi,%edx
    1c16:	29 c2                	sub    %eax,%edx
    1c18:	89 f8                	mov    %edi,%eax
    1c1a:	09 d0                	or     %edx,%eax
    1c1c:	0f 84 6f ff ff ff    	je     1b91 <concreate+0x1e1>
       ((i % 3) == 1 && pid != 0)){
    1c22:	85 ff                	test   %edi,%edi
    1c24:	0f 85 5e ff ff ff    	jne    1b88 <concreate+0x1d8>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    1c2a:	83 ec 0c             	sub    $0xc,%esp
    1c2d:	53                   	push   %ebx
    1c2e:	e8 af 21 00 00       	call   3de2 <unlink>
      unlink(file);
    1c33:	89 1c 24             	mov    %ebx,(%esp)
    1c36:	e8 a7 21 00 00       	call   3de2 <unlink>
      unlink(file);
    1c3b:	89 1c 24             	mov    %ebx,(%esp)
    1c3e:	e8 9f 21 00 00       	call   3de2 <unlink>
      unlink(file);
    1c43:	89 1c 24             	mov    %ebx,(%esp)
    1c46:	e8 97 21 00 00       	call   3de2 <unlink>
    1c4b:	83 c4 10             	add    $0x10,%esp
    1c4e:	eb 8d                	jmp    1bdd <concreate+0x22d>
      exit(0);
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1c50:	83 ec 08             	sub    $0x8,%esp
    1c53:	68 be 48 00 00       	push   $0x48be
    1c58:	6a 01                	push   $0x1
    1c5a:	e8 81 22 00 00       	call   3ee0 <printf>
}
    1c5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c62:	5b                   	pop    %ebx
    1c63:	5e                   	pop    %esi
    1c64:	5f                   	pop    %edi
    1c65:	5d                   	pop    %ebp
    1c66:	c3                   	ret    

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1c67:	83 ec 08             	sub    $0x8,%esp
    1c6a:	68 41 51 00 00       	push   $0x5141
    1c6f:	6a 01                	push   $0x1
    1c71:	e8 6a 22 00 00       	call   3ee0 <printf>
      exit(0);
    1c76:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c7d:	e8 10 21 00 00       	call   3d92 <exit>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    1c82:	83 ec 08             	sub    $0x8,%esp
    1c85:	68 08 54 00 00       	push   $0x5408
    1c8a:	6a 01                	push   $0x1
    1c8c:	e8 4f 22 00 00       	call   3ee0 <printf>
    exit(0);
    1c91:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c98:	e8 f5 20 00 00       	call   3d92 <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit(0);
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    1c9d:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1ca0:	83 ec 04             	sub    $0x4,%esp
    1ca3:	50                   	push   %eax
    1ca4:	68 a1 48 00 00       	push   $0x48a1
    1ca9:	6a 01                	push   $0x1
    1cab:	e8 30 22 00 00       	call   3ee0 <printf>
        exit(0);
    1cb0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cb7:	e8 d6 20 00 00       	call   3d92 <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    1cbc:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1cbf:	83 ec 04             	sub    $0x4,%esp
    1cc2:	50                   	push   %eax
    1cc3:	68 88 48 00 00       	push   $0x4888
    1cc8:	6a 01                	push   $0x1
    1cca:	e8 11 22 00 00       	call   3ee0 <printf>
        exit(0);
    1ccf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cd6:	e8 b7 20 00 00       	call   3d92 <exit>
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit(0);
      }
      close(fd);
    1cdb:	83 ec 0c             	sub    $0xc,%esp
    1cde:	50                   	push   %eax
    1cdf:	e8 d6 20 00 00       	call   3dba <close>
    1ce4:	83 c4 10             	add    $0x10,%esp
    1ce7:	e9 c5 fd ff ff       	jmp    1ab1 <concreate+0x101>
    1cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001cf0 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1cf0:	55                   	push   %ebp
    1cf1:	89 e5                	mov    %esp,%ebp
    1cf3:	57                   	push   %edi
    1cf4:	56                   	push   %esi
    1cf5:	53                   	push   %ebx
    1cf6:	83 ec 24             	sub    $0x24,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1cf9:	68 cc 48 00 00       	push   $0x48cc
    1cfe:	6a 01                	push   $0x1
    1d00:	e8 db 21 00 00       	call   3ee0 <printf>

  unlink("x");
    1d05:	c7 04 24 59 4b 00 00 	movl   $0x4b59,(%esp)
    1d0c:	e8 d1 20 00 00       	call   3de2 <unlink>
  pid = fork();
    1d11:	e8 74 20 00 00       	call   3d8a <fork>
  if(pid < 0){
    1d16:	83 c4 10             	add    $0x10,%esp
    1d19:	85 c0                	test   %eax,%eax
  int pid, i;

  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
    1d1b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1d1e:	0f 88 b6 00 00 00    	js     1dda <linkunlink+0xea>
    printf(1, "fork failed\n");
    exit(0);
  }

  unsigned int x = (pid ? 1 : 97);
    1d24:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1d28:	bb 64 00 00 00       	mov    $0x64,%ebx
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
    1d2d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  if(pid < 0){
    printf(1, "fork failed\n");
    exit(0);
  }

  unsigned int x = (pid ? 1 : 97);
    1d32:	19 ff                	sbb    %edi,%edi
    1d34:	83 e7 60             	and    $0x60,%edi
    1d37:	83 c7 01             	add    $0x1,%edi
    1d3a:	eb 1e                	jmp    1d5a <linkunlink+0x6a>
    1d3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    1d40:	83 fa 01             	cmp    $0x1,%edx
    1d43:	74 7b                	je     1dc0 <linkunlink+0xd0>
      link("cat", "x");
    } else {
      unlink("x");
    1d45:	83 ec 0c             	sub    $0xc,%esp
    1d48:	68 59 4b 00 00       	push   $0x4b59
    1d4d:	e8 90 20 00 00       	call   3de2 <unlink>
    1d52:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit(0);
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1d55:	83 eb 01             	sub    $0x1,%ebx
    1d58:	74 3d                	je     1d97 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1d5a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1d60:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1d66:	89 f8                	mov    %edi,%eax
    1d68:	f7 e6                	mul    %esi
    1d6a:	d1 ea                	shr    %edx
    1d6c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1d6f:	89 fa                	mov    %edi,%edx
    1d71:	29 c2                	sub    %eax,%edx
    1d73:	75 cb                	jne    1d40 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1d75:	83 ec 08             	sub    $0x8,%esp
    1d78:	68 02 02 00 00       	push   $0x202
    1d7d:	68 59 4b 00 00       	push   $0x4b59
    1d82:	e8 4b 20 00 00       	call   3dd2 <open>
    1d87:	89 04 24             	mov    %eax,(%esp)
    1d8a:	e8 2b 20 00 00       	call   3dba <close>
    1d8f:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit(0);
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1d92:	83 eb 01             	sub    $0x1,%ebx
    1d95:	75 c3                	jne    1d5a <linkunlink+0x6a>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1d97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1d9a:	85 c0                	test   %eax,%eax
    1d9c:	74 57                	je     1df5 <linkunlink+0x105>
    wait();
    1d9e:	e8 f7 1f 00 00       	call   3d9a <wait>
  else
    exit(0);

  printf(1, "linkunlink ok\n");
    1da3:	83 ec 08             	sub    $0x8,%esp
    1da6:	68 e1 48 00 00       	push   $0x48e1
    1dab:	6a 01                	push   $0x1
    1dad:	e8 2e 21 00 00       	call   3ee0 <printf>
}
    1db2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1db5:	5b                   	pop    %ebx
    1db6:	5e                   	pop    %esi
    1db7:	5f                   	pop    %edi
    1db8:	5d                   	pop    %ebp
    1db9:	c3                   	ret    
    1dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    1dc0:	83 ec 08             	sub    $0x8,%esp
    1dc3:	68 59 4b 00 00       	push   $0x4b59
    1dc8:	68 dd 48 00 00       	push   $0x48dd
    1dcd:	e8 20 20 00 00       	call   3df2 <link>
    1dd2:	83 c4 10             	add    $0x10,%esp
    1dd5:	e9 7b ff ff ff       	jmp    1d55 <linkunlink+0x65>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
    1dda:	83 ec 08             	sub    $0x8,%esp
    1ddd:	68 41 51 00 00       	push   $0x5141
    1de2:	6a 01                	push   $0x1
    1de4:	e8 f7 20 00 00       	call   3ee0 <printf>
    exit(0);
    1de9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1df0:	e8 9d 1f 00 00       	call   3d92 <exit>
  }

  if(pid)
    wait();
  else
    exit(0);
    1df5:	83 ec 0c             	sub    $0xc,%esp
    1df8:	6a 00                	push   $0x0
    1dfa:	e8 93 1f 00 00       	call   3d92 <exit>
    1dff:	90                   	nop

00001e00 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1e00:	55                   	push   %ebp
    1e01:	89 e5                	mov    %esp,%ebp
    1e03:	56                   	push   %esi
    1e04:	53                   	push   %ebx
    1e05:	83 ec 18             	sub    $0x18,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1e08:	68 f0 48 00 00       	push   $0x48f0
    1e0d:	6a 01                	push   $0x1
    1e0f:	e8 cc 20 00 00       	call   3ee0 <printf>
  unlink("bd");
    1e14:	c7 04 24 fd 48 00 00 	movl   $0x48fd,(%esp)
    1e1b:	e8 c2 1f 00 00       	call   3de2 <unlink>

  fd = open("bd", O_CREATE);
    1e20:	58                   	pop    %eax
    1e21:	5a                   	pop    %edx
    1e22:	68 00 02 00 00       	push   $0x200
    1e27:	68 fd 48 00 00       	push   $0x48fd
    1e2c:	e8 a1 1f 00 00       	call   3dd2 <open>
  if(fd < 0){
    1e31:	83 c4 10             	add    $0x10,%esp
    1e34:	85 c0                	test   %eax,%eax
    1e36:	0f 88 ec 00 00 00    	js     1f28 <bigdir+0x128>
    printf(1, "bigdir create failed\n");
    exit(0);
  }
  close(fd);
    1e3c:	83 ec 0c             	sub    $0xc,%esp
    1e3f:	8d 75 ee             	lea    -0x12(%ebp),%esi

  for(i = 0; i < 500; i++){
    1e42:	31 db                	xor    %ebx,%ebx
  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    exit(0);
  }
  close(fd);
    1e44:	50                   	push   %eax
    1e45:	e8 70 1f 00 00       	call   3dba <close>
    1e4a:	83 c4 10             	add    $0x10,%esp
    1e4d:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1e50:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1e52:	83 ec 08             	sub    $0x8,%esp
    exit(0);
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1e55:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1e59:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1e5c:	56                   	push   %esi
    1e5d:	68 fd 48 00 00       	push   $0x48fd
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1e62:	83 c0 30             	add    $0x30,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1e65:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1e69:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1e6c:	89 d8                	mov    %ebx,%eax
    1e6e:	83 e0 3f             	and    $0x3f,%eax
    1e71:	83 c0 30             	add    $0x30,%eax
    1e74:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(link("bd", name) != 0){
    1e77:	e8 76 1f 00 00       	call   3df2 <link>
    1e7c:	83 c4 10             	add    $0x10,%esp
    1e7f:	85 c0                	test   %eax,%eax
    1e81:	75 6f                	jne    1ef2 <bigdir+0xf2>
    printf(1, "bigdir create failed\n");
    exit(0);
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1e83:	83 c3 01             	add    $0x1,%ebx
    1e86:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1e8c:	75 c2                	jne    1e50 <bigdir+0x50>
      printf(1, "bigdir link failed\n");
      exit(0);
    }
  }

  unlink("bd");
    1e8e:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    1e91:	31 db                	xor    %ebx,%ebx
      printf(1, "bigdir link failed\n");
      exit(0);
    }
  }

  unlink("bd");
    1e93:	68 fd 48 00 00       	push   $0x48fd
    1e98:	e8 45 1f 00 00       	call   3de2 <unlink>
    1e9d:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1ea0:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1ea2:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1ea5:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1ea9:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1eac:	56                   	push   %esi
  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1ead:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1eb1:	83 c0 30             	add    $0x30,%eax
    1eb4:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1eb7:	89 d8                	mov    %ebx,%eax
    1eb9:	83 e0 3f             	and    $0x3f,%eax
    1ebc:	83 c0 30             	add    $0x30,%eax
    1ebf:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(unlink(name) != 0){
    1ec2:	e8 1b 1f 00 00       	call   3de2 <unlink>
    1ec7:	83 c4 10             	add    $0x10,%esp
    1eca:	85 c0                	test   %eax,%eax
    1ecc:	75 3f                	jne    1f0d <bigdir+0x10d>
      exit(0);
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1ece:	83 c3 01             	add    $0x1,%ebx
    1ed1:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1ed7:	75 c7                	jne    1ea0 <bigdir+0xa0>
      printf(1, "bigdir unlink failed");
      exit(0);
    }
  }

  printf(1, "bigdir ok\n");
    1ed9:	83 ec 08             	sub    $0x8,%esp
    1edc:	68 3f 49 00 00       	push   $0x493f
    1ee1:	6a 01                	push   $0x1
    1ee3:	e8 f8 1f 00 00       	call   3ee0 <printf>
}
    1ee8:	83 c4 10             	add    $0x10,%esp
    1eeb:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1eee:	5b                   	pop    %ebx
    1eef:	5e                   	pop    %esi
    1ef0:	5d                   	pop    %ebp
    1ef1:	c3                   	ret    
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    1ef2:	83 ec 08             	sub    $0x8,%esp
    1ef5:	68 16 49 00 00       	push   $0x4916
    1efa:	6a 01                	push   $0x1
    1efc:	e8 df 1f 00 00       	call   3ee0 <printf>
      exit(0);
    1f01:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f08:	e8 85 1e 00 00       	call   3d92 <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    1f0d:	83 ec 08             	sub    $0x8,%esp
    1f10:	68 2a 49 00 00       	push   $0x492a
    1f15:	6a 01                	push   $0x1
    1f17:	e8 c4 1f 00 00       	call   3ee0 <printf>
      exit(0);
    1f1c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f23:	e8 6a 1e 00 00       	call   3d92 <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    1f28:	83 ec 08             	sub    $0x8,%esp
    1f2b:	68 00 49 00 00       	push   $0x4900
    1f30:	6a 01                	push   $0x1
    1f32:	e8 a9 1f 00 00       	call   3ee0 <printf>
    exit(0);
    1f37:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f3e:	e8 4f 1e 00 00       	call   3d92 <exit>
    1f43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001f50 <subdir>:
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    1f50:	55                   	push   %ebp
    1f51:	89 e5                	mov    %esp,%ebp
    1f53:	53                   	push   %ebx
    1f54:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1f57:	68 4a 49 00 00       	push   $0x494a
    1f5c:	6a 01                	push   $0x1
    1f5e:	e8 7d 1f 00 00       	call   3ee0 <printf>

  unlink("ff");
    1f63:	c7 04 24 d3 49 00 00 	movl   $0x49d3,(%esp)
    1f6a:	e8 73 1e 00 00       	call   3de2 <unlink>
  if(mkdir("dd") != 0){
    1f6f:	c7 04 24 70 4a 00 00 	movl   $0x4a70,(%esp)
    1f76:	e8 7f 1e 00 00       	call   3dfa <mkdir>
    1f7b:	83 c4 10             	add    $0x10,%esp
    1f7e:	85 c0                	test   %eax,%eax
    1f80:	0f 85 4d 06 00 00    	jne    25d3 <subdir+0x683>
    printf(1, "subdir mkdir dd failed\n");
    exit(0);
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1f86:	83 ec 08             	sub    $0x8,%esp
    1f89:	68 02 02 00 00       	push   $0x202
    1f8e:	68 a9 49 00 00       	push   $0x49a9
    1f93:	e8 3a 1e 00 00       	call   3dd2 <open>
  if(fd < 0){
    1f98:	83 c4 10             	add    $0x10,%esp
    1f9b:	85 c0                	test   %eax,%eax
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    exit(0);
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1f9d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1f9f:	0f 88 14 06 00 00    	js     25b9 <subdir+0x669>
    printf(1, "create dd/ff failed\n");
    exit(0);
  }
  write(fd, "ff", 2);
    1fa5:	83 ec 04             	sub    $0x4,%esp
    1fa8:	6a 02                	push   $0x2
    1faa:	68 d3 49 00 00       	push   $0x49d3
    1faf:	50                   	push   %eax
    1fb0:	e8 fd 1d 00 00       	call   3db2 <write>
  close(fd);
    1fb5:	89 1c 24             	mov    %ebx,(%esp)
    1fb8:	e8 fd 1d 00 00       	call   3dba <close>

  if(unlink("dd") >= 0){
    1fbd:	c7 04 24 70 4a 00 00 	movl   $0x4a70,(%esp)
    1fc4:	e8 19 1e 00 00       	call   3de2 <unlink>
    1fc9:	83 c4 10             	add    $0x10,%esp
    1fcc:	85 c0                	test   %eax,%eax
    1fce:	0f 89 cb 05 00 00    	jns    259f <subdir+0x64f>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit(0);
  }

  if(mkdir("/dd/dd") != 0){
    1fd4:	83 ec 0c             	sub    $0xc,%esp
    1fd7:	68 84 49 00 00       	push   $0x4984
    1fdc:	e8 19 1e 00 00       	call   3dfa <mkdir>
    1fe1:	83 c4 10             	add    $0x10,%esp
    1fe4:	85 c0                	test   %eax,%eax
    1fe6:	0f 85 99 05 00 00    	jne    2585 <subdir+0x635>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit(0);
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1fec:	83 ec 08             	sub    $0x8,%esp
    1fef:	68 02 02 00 00       	push   $0x202
    1ff4:	68 a6 49 00 00       	push   $0x49a6
    1ff9:	e8 d4 1d 00 00       	call   3dd2 <open>
  if(fd < 0){
    1ffe:	83 c4 10             	add    $0x10,%esp
    2001:	85 c0                	test   %eax,%eax
  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    exit(0);
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2003:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2005:	0f 88 5c 04 00 00    	js     2467 <subdir+0x517>
    printf(1, "create dd/dd/ff failed\n");
    exit(0);
  }
  write(fd, "FF", 2);
    200b:	83 ec 04             	sub    $0x4,%esp
    200e:	6a 02                	push   $0x2
    2010:	68 c7 49 00 00       	push   $0x49c7
    2015:	50                   	push   %eax
    2016:	e8 97 1d 00 00       	call   3db2 <write>
  close(fd);
    201b:	89 1c 24             	mov    %ebx,(%esp)
    201e:	e8 97 1d 00 00       	call   3dba <close>

  fd = open("dd/dd/../ff", 0);
    2023:	58                   	pop    %eax
    2024:	5a                   	pop    %edx
    2025:	6a 00                	push   $0x0
    2027:	68 ca 49 00 00       	push   $0x49ca
    202c:	e8 a1 1d 00 00       	call   3dd2 <open>
  if(fd < 0){
    2031:	83 c4 10             	add    $0x10,%esp
    2034:	85 c0                	test   %eax,%eax
    exit(0);
  }
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
    2036:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2038:	0f 88 0f 04 00 00    	js     244d <subdir+0x4fd>
    printf(1, "open dd/dd/../ff failed\n");
    exit(0);
  }
  cc = read(fd, buf, sizeof(buf));
    203e:	83 ec 04             	sub    $0x4,%esp
    2041:	68 00 20 00 00       	push   $0x2000
    2046:	68 80 8a 00 00       	push   $0x8a80
    204b:	50                   	push   %eax
    204c:	e8 59 1d 00 00       	call   3daa <read>
  if(cc != 2 || buf[0] != 'f'){
    2051:	83 c4 10             	add    $0x10,%esp
    2054:	83 f8 02             	cmp    $0x2,%eax
    2057:	0f 85 3a 03 00 00    	jne    2397 <subdir+0x447>
    205d:	80 3d 80 8a 00 00 66 	cmpb   $0x66,0x8a80
    2064:	0f 85 2d 03 00 00    	jne    2397 <subdir+0x447>
    printf(1, "dd/dd/../ff wrong content\n");
    exit(0);
  }
  close(fd);
    206a:	83 ec 0c             	sub    $0xc,%esp
    206d:	53                   	push   %ebx
    206e:	e8 47 1d 00 00       	call   3dba <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    2073:	5b                   	pop    %ebx
    2074:	58                   	pop    %eax
    2075:	68 0a 4a 00 00       	push   $0x4a0a
    207a:	68 a6 49 00 00       	push   $0x49a6
    207f:	e8 6e 1d 00 00       	call   3df2 <link>
    2084:	83 c4 10             	add    $0x10,%esp
    2087:	85 c0                	test   %eax,%eax
    2089:	0f 85 0c 04 00 00    	jne    249b <subdir+0x54b>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit(0);
  }

  if(unlink("dd/dd/ff") != 0){
    208f:	83 ec 0c             	sub    $0xc,%esp
    2092:	68 a6 49 00 00       	push   $0x49a6
    2097:	e8 46 1d 00 00       	call   3de2 <unlink>
    209c:	83 c4 10             	add    $0x10,%esp
    209f:	85 c0                	test   %eax,%eax
    20a1:	0f 85 24 03 00 00    	jne    23cb <subdir+0x47b>
    printf(1, "unlink dd/dd/ff failed\n");
    exit(0);
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    20a7:	83 ec 08             	sub    $0x8,%esp
    20aa:	6a 00                	push   $0x0
    20ac:	68 a6 49 00 00       	push   $0x49a6
    20b1:	e8 1c 1d 00 00       	call   3dd2 <open>
    20b6:	83 c4 10             	add    $0x10,%esp
    20b9:	85 c0                	test   %eax,%eax
    20bb:	0f 89 aa 04 00 00    	jns    256b <subdir+0x61b>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit(0);
  }

  if(chdir("dd") != 0){
    20c1:	83 ec 0c             	sub    $0xc,%esp
    20c4:	68 70 4a 00 00       	push   $0x4a70
    20c9:	e8 34 1d 00 00       	call   3e02 <chdir>
    20ce:	83 c4 10             	add    $0x10,%esp
    20d1:	85 c0                	test   %eax,%eax
    20d3:	0f 85 78 04 00 00    	jne    2551 <subdir+0x601>
    printf(1, "chdir dd failed\n");
    exit(0);
  }
  if(chdir("dd/../../dd") != 0){
    20d9:	83 ec 0c             	sub    $0xc,%esp
    20dc:	68 3e 4a 00 00       	push   $0x4a3e
    20e1:	e8 1c 1d 00 00       	call   3e02 <chdir>
    20e6:	83 c4 10             	add    $0x10,%esp
    20e9:	85 c0                	test   %eax,%eax
    20eb:	0f 85 c0 02 00 00    	jne    23b1 <subdir+0x461>
    printf(1, "chdir dd/../../dd failed\n");
    exit(0);
  }
  if(chdir("dd/../../../dd") != 0){
    20f1:	83 ec 0c             	sub    $0xc,%esp
    20f4:	68 64 4a 00 00       	push   $0x4a64
    20f9:	e8 04 1d 00 00       	call   3e02 <chdir>
    20fe:	83 c4 10             	add    $0x10,%esp
    2101:	85 c0                	test   %eax,%eax
    2103:	0f 85 a8 02 00 00    	jne    23b1 <subdir+0x461>
    printf(1, "chdir dd/../../dd failed\n");
    exit(0);
  }
  if(chdir("./..") != 0){
    2109:	83 ec 0c             	sub    $0xc,%esp
    210c:	68 73 4a 00 00       	push   $0x4a73
    2111:	e8 ec 1c 00 00       	call   3e02 <chdir>
    2116:	83 c4 10             	add    $0x10,%esp
    2119:	85 c0                	test   %eax,%eax
    211b:	0f 85 60 03 00 00    	jne    2481 <subdir+0x531>
    printf(1, "chdir ./.. failed\n");
    exit(0);
  }

  fd = open("dd/dd/ffff", 0);
    2121:	83 ec 08             	sub    $0x8,%esp
    2124:	6a 00                	push   $0x0
    2126:	68 0a 4a 00 00       	push   $0x4a0a
    212b:	e8 a2 1c 00 00       	call   3dd2 <open>
  if(fd < 0){
    2130:	83 c4 10             	add    $0x10,%esp
    2133:	85 c0                	test   %eax,%eax
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    exit(0);
  }

  fd = open("dd/dd/ffff", 0);
    2135:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2137:	0f 88 ce 05 00 00    	js     270b <subdir+0x7bb>
    printf(1, "open dd/dd/ffff failed\n");
    exit(0);
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    213d:	83 ec 04             	sub    $0x4,%esp
    2140:	68 00 20 00 00       	push   $0x2000
    2145:	68 80 8a 00 00       	push   $0x8a80
    214a:	50                   	push   %eax
    214b:	e8 5a 1c 00 00       	call   3daa <read>
    2150:	83 c4 10             	add    $0x10,%esp
    2153:	83 f8 02             	cmp    $0x2,%eax
    2156:	0f 85 95 05 00 00    	jne    26f1 <subdir+0x7a1>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit(0);
  }
  close(fd);
    215c:	83 ec 0c             	sub    $0xc,%esp
    215f:	53                   	push   %ebx
    2160:	e8 55 1c 00 00       	call   3dba <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2165:	59                   	pop    %ecx
    2166:	5b                   	pop    %ebx
    2167:	6a 00                	push   $0x0
    2169:	68 a6 49 00 00       	push   $0x49a6
    216e:	e8 5f 1c 00 00       	call   3dd2 <open>
    2173:	83 c4 10             	add    $0x10,%esp
    2176:	85 c0                	test   %eax,%eax
    2178:	0f 89 81 02 00 00    	jns    23ff <subdir+0x4af>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit(0);
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    217e:	83 ec 08             	sub    $0x8,%esp
    2181:	68 02 02 00 00       	push   $0x202
    2186:	68 be 4a 00 00       	push   $0x4abe
    218b:	e8 42 1c 00 00       	call   3dd2 <open>
    2190:	83 c4 10             	add    $0x10,%esp
    2193:	85 c0                	test   %eax,%eax
    2195:	0f 89 4a 02 00 00    	jns    23e5 <subdir+0x495>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit(0);
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    219b:	83 ec 08             	sub    $0x8,%esp
    219e:	68 02 02 00 00       	push   $0x202
    21a3:	68 e3 4a 00 00       	push   $0x4ae3
    21a8:	e8 25 1c 00 00       	call   3dd2 <open>
    21ad:	83 c4 10             	add    $0x10,%esp
    21b0:	85 c0                	test   %eax,%eax
    21b2:	0f 89 7f 03 00 00    	jns    2537 <subdir+0x5e7>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit(0);
  }
  if(open("dd", O_CREATE) >= 0){
    21b8:	83 ec 08             	sub    $0x8,%esp
    21bb:	68 00 02 00 00       	push   $0x200
    21c0:	68 70 4a 00 00       	push   $0x4a70
    21c5:	e8 08 1c 00 00       	call   3dd2 <open>
    21ca:	83 c4 10             	add    $0x10,%esp
    21cd:	85 c0                	test   %eax,%eax
    21cf:	0f 89 48 03 00 00    	jns    251d <subdir+0x5cd>
    printf(1, "create dd succeeded!\n");
    exit(0);
  }
  if(open("dd", O_RDWR) >= 0){
    21d5:	83 ec 08             	sub    $0x8,%esp
    21d8:	6a 02                	push   $0x2
    21da:	68 70 4a 00 00       	push   $0x4a70
    21df:	e8 ee 1b 00 00       	call   3dd2 <open>
    21e4:	83 c4 10             	add    $0x10,%esp
    21e7:	85 c0                	test   %eax,%eax
    21e9:	0f 89 14 03 00 00    	jns    2503 <subdir+0x5b3>
    printf(1, "open dd rdwr succeeded!\n");
    exit(0);
  }
  if(open("dd", O_WRONLY) >= 0){
    21ef:	83 ec 08             	sub    $0x8,%esp
    21f2:	6a 01                	push   $0x1
    21f4:	68 70 4a 00 00       	push   $0x4a70
    21f9:	e8 d4 1b 00 00       	call   3dd2 <open>
    21fe:	83 c4 10             	add    $0x10,%esp
    2201:	85 c0                	test   %eax,%eax
    2203:	0f 89 e0 02 00 00    	jns    24e9 <subdir+0x599>
    printf(1, "open dd wronly succeeded!\n");
    exit(0);
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2209:	83 ec 08             	sub    $0x8,%esp
    220c:	68 52 4b 00 00       	push   $0x4b52
    2211:	68 be 4a 00 00       	push   $0x4abe
    2216:	e8 d7 1b 00 00       	call   3df2 <link>
    221b:	83 c4 10             	add    $0x10,%esp
    221e:	85 c0                	test   %eax,%eax
    2220:	0f 84 a9 02 00 00    	je     24cf <subdir+0x57f>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit(0);
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    2226:	83 ec 08             	sub    $0x8,%esp
    2229:	68 52 4b 00 00       	push   $0x4b52
    222e:	68 e3 4a 00 00       	push   $0x4ae3
    2233:	e8 ba 1b 00 00       	call   3df2 <link>
    2238:	83 c4 10             	add    $0x10,%esp
    223b:	85 c0                	test   %eax,%eax
    223d:	0f 84 72 02 00 00    	je     24b5 <subdir+0x565>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit(0);
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2243:	83 ec 08             	sub    $0x8,%esp
    2246:	68 0a 4a 00 00       	push   $0x4a0a
    224b:	68 a9 49 00 00       	push   $0x49a9
    2250:	e8 9d 1b 00 00       	call   3df2 <link>
    2255:	83 c4 10             	add    $0x10,%esp
    2258:	85 c0                	test   %eax,%eax
    225a:	0f 84 d3 01 00 00    	je     2433 <subdir+0x4e3>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit(0);
  }
  if(mkdir("dd/ff/ff") == 0){
    2260:	83 ec 0c             	sub    $0xc,%esp
    2263:	68 be 4a 00 00       	push   $0x4abe
    2268:	e8 8d 1b 00 00       	call   3dfa <mkdir>
    226d:	83 c4 10             	add    $0x10,%esp
    2270:	85 c0                	test   %eax,%eax
    2272:	0f 84 a1 01 00 00    	je     2419 <subdir+0x4c9>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit(0);
  }
  if(mkdir("dd/xx/ff") == 0){
    2278:	83 ec 0c             	sub    $0xc,%esp
    227b:	68 e3 4a 00 00       	push   $0x4ae3
    2280:	e8 75 1b 00 00       	call   3dfa <mkdir>
    2285:	83 c4 10             	add    $0x10,%esp
    2288:	85 c0                	test   %eax,%eax
    228a:	0f 84 47 04 00 00    	je     26d7 <subdir+0x787>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit(0);
  }
  if(mkdir("dd/dd/ffff") == 0){
    2290:	83 ec 0c             	sub    $0xc,%esp
    2293:	68 0a 4a 00 00       	push   $0x4a0a
    2298:	e8 5d 1b 00 00       	call   3dfa <mkdir>
    229d:	83 c4 10             	add    $0x10,%esp
    22a0:	85 c0                	test   %eax,%eax
    22a2:	0f 84 15 04 00 00    	je     26bd <subdir+0x76d>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit(0);
  }
  if(unlink("dd/xx/ff") == 0){
    22a8:	83 ec 0c             	sub    $0xc,%esp
    22ab:	68 e3 4a 00 00       	push   $0x4ae3
    22b0:	e8 2d 1b 00 00       	call   3de2 <unlink>
    22b5:	83 c4 10             	add    $0x10,%esp
    22b8:	85 c0                	test   %eax,%eax
    22ba:	0f 84 e3 03 00 00    	je     26a3 <subdir+0x753>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit(0);
  }
  if(unlink("dd/ff/ff") == 0){
    22c0:	83 ec 0c             	sub    $0xc,%esp
    22c3:	68 be 4a 00 00       	push   $0x4abe
    22c8:	e8 15 1b 00 00       	call   3de2 <unlink>
    22cd:	83 c4 10             	add    $0x10,%esp
    22d0:	85 c0                	test   %eax,%eax
    22d2:	0f 84 b1 03 00 00    	je     2689 <subdir+0x739>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit(0);
  }
  if(chdir("dd/ff") == 0){
    22d8:	83 ec 0c             	sub    $0xc,%esp
    22db:	68 a9 49 00 00       	push   $0x49a9
    22e0:	e8 1d 1b 00 00       	call   3e02 <chdir>
    22e5:	83 c4 10             	add    $0x10,%esp
    22e8:	85 c0                	test   %eax,%eax
    22ea:	0f 84 7f 03 00 00    	je     266f <subdir+0x71f>
    printf(1, "chdir dd/ff succeeded!\n");
    exit(0);
  }
  if(chdir("dd/xx") == 0){
    22f0:	83 ec 0c             	sub    $0xc,%esp
    22f3:	68 55 4b 00 00       	push   $0x4b55
    22f8:	e8 05 1b 00 00       	call   3e02 <chdir>
    22fd:	83 c4 10             	add    $0x10,%esp
    2300:	85 c0                	test   %eax,%eax
    2302:	0f 84 4d 03 00 00    	je     2655 <subdir+0x705>
    printf(1, "chdir dd/xx succeeded!\n");
    exit(0);
  }

  if(unlink("dd/dd/ffff") != 0){
    2308:	83 ec 0c             	sub    $0xc,%esp
    230b:	68 0a 4a 00 00       	push   $0x4a0a
    2310:	e8 cd 1a 00 00       	call   3de2 <unlink>
    2315:	83 c4 10             	add    $0x10,%esp
    2318:	85 c0                	test   %eax,%eax
    231a:	0f 85 ab 00 00 00    	jne    23cb <subdir+0x47b>
    printf(1, "unlink dd/dd/ff failed\n");
    exit(0);
  }
  if(unlink("dd/ff") != 0){
    2320:	83 ec 0c             	sub    $0xc,%esp
    2323:	68 a9 49 00 00       	push   $0x49a9
    2328:	e8 b5 1a 00 00       	call   3de2 <unlink>
    232d:	83 c4 10             	add    $0x10,%esp
    2330:	85 c0                	test   %eax,%eax
    2332:	0f 85 03 03 00 00    	jne    263b <subdir+0x6eb>
    printf(1, "unlink dd/ff failed\n");
    exit(0);
  }
  if(unlink("dd") == 0){
    2338:	83 ec 0c             	sub    $0xc,%esp
    233b:	68 70 4a 00 00       	push   $0x4a70
    2340:	e8 9d 1a 00 00       	call   3de2 <unlink>
    2345:	83 c4 10             	add    $0x10,%esp
    2348:	85 c0                	test   %eax,%eax
    234a:	0f 84 d1 02 00 00    	je     2621 <subdir+0x6d1>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit(0);
  }
  if(unlink("dd/dd") < 0){
    2350:	83 ec 0c             	sub    $0xc,%esp
    2353:	68 85 49 00 00       	push   $0x4985
    2358:	e8 85 1a 00 00       	call   3de2 <unlink>
    235d:	83 c4 10             	add    $0x10,%esp
    2360:	85 c0                	test   %eax,%eax
    2362:	0f 88 9f 02 00 00    	js     2607 <subdir+0x6b7>
    printf(1, "unlink dd/dd failed\n");
    exit(0);
  }
  if(unlink("dd") < 0){
    2368:	83 ec 0c             	sub    $0xc,%esp
    236b:	68 70 4a 00 00       	push   $0x4a70
    2370:	e8 6d 1a 00 00       	call   3de2 <unlink>
    2375:	83 c4 10             	add    $0x10,%esp
    2378:	85 c0                	test   %eax,%eax
    237a:	0f 88 6d 02 00 00    	js     25ed <subdir+0x69d>
    printf(1, "unlink dd failed\n");
    exit(0);
  }

  printf(1, "subdir ok\n");
    2380:	83 ec 08             	sub    $0x8,%esp
    2383:	68 52 4c 00 00       	push   $0x4c52
    2388:	6a 01                	push   $0x1
    238a:	e8 51 1b 00 00       	call   3ee0 <printf>
}
    238f:	83 c4 10             	add    $0x10,%esp
    2392:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2395:	c9                   	leave  
    2396:	c3                   	ret    
    printf(1, "open dd/dd/../ff failed\n");
    exit(0);
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    2397:	50                   	push   %eax
    2398:	50                   	push   %eax
    2399:	68 ef 49 00 00       	push   $0x49ef
    239e:	6a 01                	push   $0x1
    23a0:	e8 3b 1b 00 00       	call   3ee0 <printf>
    exit(0);
    23a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23ac:	e8 e1 19 00 00       	call   3d92 <exit>
  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    exit(0);
  }
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    23b1:	50                   	push   %eax
    23b2:	50                   	push   %eax
    23b3:	68 4a 4a 00 00       	push   $0x4a4a
    23b8:	6a 01                	push   $0x1
    23ba:	e8 21 1b 00 00       	call   3ee0 <printf>
    exit(0);
    23bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23c6:	e8 c7 19 00 00       	call   3d92 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit(0);
  }

  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    23cb:	52                   	push   %edx
    23cc:	52                   	push   %edx
    23cd:	68 15 4a 00 00       	push   $0x4a15
    23d2:	6a 01                	push   $0x1
    23d4:	e8 07 1b 00 00       	call   3ee0 <printf>
    exit(0);
    23d9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23e0:	e8 ad 19 00 00       	call   3d92 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit(0);
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    23e5:	50                   	push   %eax
    23e6:	50                   	push   %eax
    23e7:	68 c7 4a 00 00       	push   $0x4ac7
    23ec:	6a 01                	push   $0x1
    23ee:	e8 ed 1a 00 00       	call   3ee0 <printf>
    exit(0);
    23f3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23fa:	e8 93 19 00 00       	call   3d92 <exit>
    exit(0);
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    23ff:	52                   	push   %edx
    2400:	52                   	push   %edx
    2401:	68 ac 54 00 00       	push   $0x54ac
    2406:	6a 01                	push   $0x1
    2408:	e8 d3 1a 00 00       	call   3ee0 <printf>
    exit(0);
    240d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2414:	e8 79 19 00 00       	call   3d92 <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit(0);
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2419:	52                   	push   %edx
    241a:	52                   	push   %edx
    241b:	68 5b 4b 00 00       	push   $0x4b5b
    2420:	6a 01                	push   $0x1
    2422:	e8 b9 1a 00 00       	call   3ee0 <printf>
    exit(0);
    2427:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    242e:	e8 5f 19 00 00       	call   3d92 <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit(0);
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2433:	51                   	push   %ecx
    2434:	51                   	push   %ecx
    2435:	68 1c 55 00 00       	push   $0x551c
    243a:	6a 01                	push   $0x1
    243c:	e8 9f 1a 00 00       	call   3ee0 <printf>
    exit(0);
    2441:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2448:	e8 45 19 00 00       	call   3d92 <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    244d:	50                   	push   %eax
    244e:	50                   	push   %eax
    244f:	68 d6 49 00 00       	push   $0x49d6
    2454:	6a 01                	push   $0x1
    2456:	e8 85 1a 00 00       	call   3ee0 <printf>
    exit(0);
    245b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2462:	e8 2b 19 00 00       	call   3d92 <exit>
    exit(0);
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    2467:	51                   	push   %ecx
    2468:	51                   	push   %ecx
    2469:	68 af 49 00 00       	push   $0x49af
    246e:	6a 01                	push   $0x1
    2470:	e8 6b 1a 00 00       	call   3ee0 <printf>
    exit(0);
    2475:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    247c:	e8 11 19 00 00       	call   3d92 <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit(0);
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    2481:	50                   	push   %eax
    2482:	50                   	push   %eax
    2483:	68 78 4a 00 00       	push   $0x4a78
    2488:	6a 01                	push   $0x1
    248a:	e8 51 1a 00 00       	call   3ee0 <printf>
    exit(0);
    248f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2496:	e8 f7 18 00 00       	call   3d92 <exit>
    exit(0);
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    249b:	51                   	push   %ecx
    249c:	51                   	push   %ecx
    249d:	68 64 54 00 00       	push   $0x5464
    24a2:	6a 01                	push   $0x1
    24a4:	e8 37 1a 00 00       	call   3ee0 <printf>
    exit(0);
    24a9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24b0:	e8 dd 18 00 00       	call   3d92 <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit(0);
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    24b5:	53                   	push   %ebx
    24b6:	53                   	push   %ebx
    24b7:	68 f8 54 00 00       	push   $0x54f8
    24bc:	6a 01                	push   $0x1
    24be:	e8 1d 1a 00 00       	call   3ee0 <printf>
    exit(0);
    24c3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24ca:	e8 c3 18 00 00       	call   3d92 <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit(0);
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    24cf:	50                   	push   %eax
    24d0:	50                   	push   %eax
    24d1:	68 d4 54 00 00       	push   $0x54d4
    24d6:	6a 01                	push   $0x1
    24d8:	e8 03 1a 00 00       	call   3ee0 <printf>
    exit(0);
    24dd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24e4:	e8 a9 18 00 00       	call   3d92 <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit(0);
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    24e9:	50                   	push   %eax
    24ea:	50                   	push   %eax
    24eb:	68 37 4b 00 00       	push   $0x4b37
    24f0:	6a 01                	push   $0x1
    24f2:	e8 e9 19 00 00       	call   3ee0 <printf>
    exit(0);
    24f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24fe:	e8 8f 18 00 00       	call   3d92 <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit(0);
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    2503:	50                   	push   %eax
    2504:	50                   	push   %eax
    2505:	68 1e 4b 00 00       	push   $0x4b1e
    250a:	6a 01                	push   $0x1
    250c:	e8 cf 19 00 00       	call   3ee0 <printf>
    exit(0);
    2511:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2518:	e8 75 18 00 00       	call   3d92 <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit(0);
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    251d:	50                   	push   %eax
    251e:	50                   	push   %eax
    251f:	68 08 4b 00 00       	push   $0x4b08
    2524:	6a 01                	push   $0x1
    2526:	e8 b5 19 00 00       	call   3ee0 <printf>
    exit(0);
    252b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2532:	e8 5b 18 00 00       	call   3d92 <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit(0);
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    2537:	50                   	push   %eax
    2538:	50                   	push   %eax
    2539:	68 ec 4a 00 00       	push   $0x4aec
    253e:	6a 01                	push   $0x1
    2540:	e8 9b 19 00 00       	call   3ee0 <printf>
    exit(0);
    2545:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    254c:	e8 41 18 00 00       	call   3d92 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit(0);
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    2551:	50                   	push   %eax
    2552:	50                   	push   %eax
    2553:	68 2d 4a 00 00       	push   $0x4a2d
    2558:	6a 01                	push   $0x1
    255a:	e8 81 19 00 00       	call   3ee0 <printf>
    exit(0);
    255f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2566:	e8 27 18 00 00       	call   3d92 <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit(0);
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    256b:	50                   	push   %eax
    256c:	50                   	push   %eax
    256d:	68 88 54 00 00       	push   $0x5488
    2572:	6a 01                	push   $0x1
    2574:	e8 67 19 00 00       	call   3ee0 <printf>
    exit(0);
    2579:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2580:	e8 0d 18 00 00       	call   3d92 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit(0);
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    2585:	53                   	push   %ebx
    2586:	53                   	push   %ebx
    2587:	68 8b 49 00 00       	push   $0x498b
    258c:	6a 01                	push   $0x1
    258e:	e8 4d 19 00 00       	call   3ee0 <printf>
    exit(0);
    2593:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    259a:	e8 f3 17 00 00       	call   3d92 <exit>
  }
  write(fd, "ff", 2);
  close(fd);

  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    259f:	50                   	push   %eax
    25a0:	50                   	push   %eax
    25a1:	68 3c 54 00 00       	push   $0x543c
    25a6:	6a 01                	push   $0x1
    25a8:	e8 33 19 00 00       	call   3ee0 <printf>
    exit(0);
    25ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25b4:	e8 d9 17 00 00       	call   3d92 <exit>
    exit(0);
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    25b9:	50                   	push   %eax
    25ba:	50                   	push   %eax
    25bb:	68 6f 49 00 00       	push   $0x496f
    25c0:	6a 01                	push   $0x1
    25c2:	e8 19 19 00 00       	call   3ee0 <printf>
    exit(0);
    25c7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25ce:	e8 bf 17 00 00       	call   3d92 <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    25d3:	50                   	push   %eax
    25d4:	50                   	push   %eax
    25d5:	68 57 49 00 00       	push   $0x4957
    25da:	6a 01                	push   $0x1
    25dc:	e8 ff 18 00 00       	call   3ee0 <printf>
    exit(0);
    25e1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25e8:	e8 a5 17 00 00       	call   3d92 <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit(0);
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    25ed:	50                   	push   %eax
    25ee:	50                   	push   %eax
    25ef:	68 40 4c 00 00       	push   $0x4c40
    25f4:	6a 01                	push   $0x1
    25f6:	e8 e5 18 00 00       	call   3ee0 <printf>
    exit(0);
    25fb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2602:	e8 8b 17 00 00       	call   3d92 <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit(0);
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    2607:	52                   	push   %edx
    2608:	52                   	push   %edx
    2609:	68 2b 4c 00 00       	push   $0x4c2b
    260e:	6a 01                	push   $0x1
    2610:	e8 cb 18 00 00       	call   3ee0 <printf>
    exit(0);
    2615:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    261c:	e8 71 17 00 00       	call   3d92 <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit(0);
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    2621:	51                   	push   %ecx
    2622:	51                   	push   %ecx
    2623:	68 40 55 00 00       	push   $0x5540
    2628:	6a 01                	push   $0x1
    262a:	e8 b1 18 00 00       	call   3ee0 <printf>
    exit(0);
    262f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2636:	e8 57 17 00 00       	call   3d92 <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit(0);
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    263b:	53                   	push   %ebx
    263c:	53                   	push   %ebx
    263d:	68 16 4c 00 00       	push   $0x4c16
    2642:	6a 01                	push   $0x1
    2644:	e8 97 18 00 00       	call   3ee0 <printf>
    exit(0);
    2649:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2650:	e8 3d 17 00 00       	call   3d92 <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit(0);
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    2655:	50                   	push   %eax
    2656:	50                   	push   %eax
    2657:	68 fe 4b 00 00       	push   $0x4bfe
    265c:	6a 01                	push   $0x1
    265e:	e8 7d 18 00 00       	call   3ee0 <printf>
    exit(0);
    2663:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    266a:	e8 23 17 00 00       	call   3d92 <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit(0);
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    266f:	50                   	push   %eax
    2670:	50                   	push   %eax
    2671:	68 e6 4b 00 00       	push   $0x4be6
    2676:	6a 01                	push   $0x1
    2678:	e8 63 18 00 00       	call   3ee0 <printf>
    exit(0);
    267d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2684:	e8 09 17 00 00       	call   3d92 <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit(0);
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    2689:	50                   	push   %eax
    268a:	50                   	push   %eax
    268b:	68 ca 4b 00 00       	push   $0x4bca
    2690:	6a 01                	push   $0x1
    2692:	e8 49 18 00 00       	call   3ee0 <printf>
    exit(0);
    2697:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    269e:	e8 ef 16 00 00       	call   3d92 <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit(0);
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    26a3:	50                   	push   %eax
    26a4:	50                   	push   %eax
    26a5:	68 ae 4b 00 00       	push   $0x4bae
    26aa:	6a 01                	push   $0x1
    26ac:	e8 2f 18 00 00       	call   3ee0 <printf>
    exit(0);
    26b1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26b8:	e8 d5 16 00 00       	call   3d92 <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit(0);
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    26bd:	50                   	push   %eax
    26be:	50                   	push   %eax
    26bf:	68 91 4b 00 00       	push   $0x4b91
    26c4:	6a 01                	push   $0x1
    26c6:	e8 15 18 00 00       	call   3ee0 <printf>
    exit(0);
    26cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26d2:	e8 bb 16 00 00       	call   3d92 <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit(0);
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    26d7:	50                   	push   %eax
    26d8:	50                   	push   %eax
    26d9:	68 76 4b 00 00       	push   $0x4b76
    26de:	6a 01                	push   $0x1
    26e0:	e8 fb 17 00 00       	call   3ee0 <printf>
    exit(0);
    26e5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26ec:	e8 a1 16 00 00       	call   3d92 <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit(0);
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    26f1:	50                   	push   %eax
    26f2:	50                   	push   %eax
    26f3:	68 a3 4a 00 00       	push   $0x4aa3
    26f8:	6a 01                	push   $0x1
    26fa:	e8 e1 17 00 00       	call   3ee0 <printf>
    exit(0);
    26ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2706:	e8 87 16 00 00       	call   3d92 <exit>
    exit(0);
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    270b:	50                   	push   %eax
    270c:	50                   	push   %eax
    270d:	68 8b 4a 00 00       	push   $0x4a8b
    2712:	6a 01                	push   $0x1
    2714:	e8 c7 17 00 00       	call   3ee0 <printf>
    exit(0);
    2719:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2720:	e8 6d 16 00 00       	call   3d92 <exit>
    2725:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002730 <bigwrite>:
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    2730:	55                   	push   %ebp
    2731:	89 e5                	mov    %esp,%ebp
    2733:	56                   	push   %esi
    2734:	53                   	push   %ebx
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2735:	bb f3 01 00 00       	mov    $0x1f3,%ebx
void
bigwrite(void)
{
  int fd, sz;

  printf(1, "bigwrite test\n");
    273a:	83 ec 08             	sub    $0x8,%esp
    273d:	68 5d 4c 00 00       	push   $0x4c5d
    2742:	6a 01                	push   $0x1
    2744:	e8 97 17 00 00       	call   3ee0 <printf>

  unlink("bigwrite");
    2749:	c7 04 24 6c 4c 00 00 	movl   $0x4c6c,(%esp)
    2750:	e8 8d 16 00 00       	call   3de2 <unlink>
    2755:	83 c4 10             	add    $0x10,%esp
    2758:	90                   	nop
    2759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2760:	83 ec 08             	sub    $0x8,%esp
    2763:	68 02 02 00 00       	push   $0x202
    2768:	68 6c 4c 00 00       	push   $0x4c6c
    276d:	e8 60 16 00 00       	call   3dd2 <open>
    if(fd < 0){
    2772:	83 c4 10             	add    $0x10,%esp
    2775:	85 c0                	test   %eax,%eax

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2777:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2779:	0f 88 85 00 00 00    	js     2804 <bigwrite+0xd4>
      printf(1, "cannot create bigwrite\n");
      exit(0);
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    277f:	83 ec 04             	sub    $0x4,%esp
    2782:	53                   	push   %ebx
    2783:	68 80 8a 00 00       	push   $0x8a80
    2788:	50                   	push   %eax
    2789:	e8 24 16 00 00       	call   3db2 <write>
      if(cc != sz){
    278e:	83 c4 10             	add    $0x10,%esp
    2791:	39 c3                	cmp    %eax,%ebx
    2793:	75 55                	jne    27ea <bigwrite+0xba>
      printf(1, "cannot create bigwrite\n");
      exit(0);
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    2795:	83 ec 04             	sub    $0x4,%esp
    2798:	53                   	push   %ebx
    2799:	68 80 8a 00 00       	push   $0x8a80
    279e:	56                   	push   %esi
    279f:	e8 0e 16 00 00       	call   3db2 <write>
      if(cc != sz){
    27a4:	83 c4 10             	add    $0x10,%esp
    27a7:	39 c3                	cmp    %eax,%ebx
    27a9:	75 3f                	jne    27ea <bigwrite+0xba>
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit(0);
      }
    }
    close(fd);
    27ab:	83 ec 0c             	sub    $0xc,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    27ae:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit(0);
      }
    }
    close(fd);
    27b4:	56                   	push   %esi
    27b5:	e8 00 16 00 00       	call   3dba <close>
    unlink("bigwrite");
    27ba:	c7 04 24 6c 4c 00 00 	movl   $0x4c6c,(%esp)
    27c1:	e8 1c 16 00 00       	call   3de2 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    27c6:	83 c4 10             	add    $0x10,%esp
    27c9:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    27cf:	75 8f                	jne    2760 <bigwrite+0x30>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    27d1:	83 ec 08             	sub    $0x8,%esp
    27d4:	68 9f 4c 00 00       	push   $0x4c9f
    27d9:	6a 01                	push   $0x1
    27db:	e8 00 17 00 00       	call   3ee0 <printf>
}
    27e0:	83 c4 10             	add    $0x10,%esp
    27e3:	8d 65 f8             	lea    -0x8(%ebp),%esp
    27e6:	5b                   	pop    %ebx
    27e7:	5e                   	pop    %esi
    27e8:	5d                   	pop    %ebp
    27e9:	c3                   	ret    
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    27ea:	50                   	push   %eax
    27eb:	53                   	push   %ebx
    27ec:	68 8d 4c 00 00       	push   $0x4c8d
    27f1:	6a 01                	push   $0x1
    27f3:	e8 e8 16 00 00       	call   3ee0 <printf>
        exit(0);
    27f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    27ff:	e8 8e 15 00 00       	call   3d92 <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    2804:	83 ec 08             	sub    $0x8,%esp
    2807:	68 75 4c 00 00       	push   $0x4c75
    280c:	6a 01                	push   $0x1
    280e:	e8 cd 16 00 00       	call   3ee0 <printf>
      exit(0);
    2813:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    281a:	e8 73 15 00 00       	call   3d92 <exit>
    281f:	90                   	nop

00002820 <bigfile>:
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    2820:	55                   	push   %ebp
    2821:	89 e5                	mov    %esp,%ebp
    2823:	57                   	push   %edi
    2824:	56                   	push   %esi
    2825:	53                   	push   %ebx
    2826:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2829:	68 ac 4c 00 00       	push   $0x4cac
    282e:	6a 01                	push   $0x1
    2830:	e8 ab 16 00 00       	call   3ee0 <printf>

  unlink("bigfile");
    2835:	c7 04 24 c8 4c 00 00 	movl   $0x4cc8,(%esp)
    283c:	e8 a1 15 00 00       	call   3de2 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2841:	5e                   	pop    %esi
    2842:	5f                   	pop    %edi
    2843:	68 02 02 00 00       	push   $0x202
    2848:	68 c8 4c 00 00       	push   $0x4cc8
    284d:	e8 80 15 00 00       	call   3dd2 <open>
  if(fd < 0){
    2852:	83 c4 10             	add    $0x10,%esp
    2855:	85 c0                	test   %eax,%eax
    2857:	0f 88 82 01 00 00    	js     29df <bigfile+0x1bf>
    285d:	89 c6                	mov    %eax,%esi
    285f:	31 db                	xor    %ebx,%ebx
    2861:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "cannot create bigfile");
    exit(0);
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    2868:	83 ec 04             	sub    $0x4,%esp
    286b:	68 58 02 00 00       	push   $0x258
    2870:	53                   	push   %ebx
    2871:	68 80 8a 00 00       	push   $0x8a80
    2876:	e8 85 13 00 00       	call   3c00 <memset>
    if(write(fd, buf, 600) != 600){
    287b:	83 c4 0c             	add    $0xc,%esp
    287e:	68 58 02 00 00       	push   $0x258
    2883:	68 80 8a 00 00       	push   $0x8a80
    2888:	56                   	push   %esi
    2889:	e8 24 15 00 00       	call   3db2 <write>
    288e:	83 c4 10             	add    $0x10,%esp
    2891:	3d 58 02 00 00       	cmp    $0x258,%eax
    2896:	0f 85 0d 01 00 00    	jne    29a9 <bigfile+0x189>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit(0);
  }
  for(i = 0; i < 20; i++){
    289c:	83 c3 01             	add    $0x1,%ebx
    289f:	83 fb 14             	cmp    $0x14,%ebx
    28a2:	75 c4                	jne    2868 <bigfile+0x48>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit(0);
    }
  }
  close(fd);
    28a4:	83 ec 0c             	sub    $0xc,%esp
    28a7:	56                   	push   %esi
    28a8:	e8 0d 15 00 00       	call   3dba <close>

  fd = open("bigfile", 0);
    28ad:	59                   	pop    %ecx
    28ae:	5b                   	pop    %ebx
    28af:	6a 00                	push   $0x0
    28b1:	68 c8 4c 00 00       	push   $0x4cc8
    28b6:	e8 17 15 00 00       	call   3dd2 <open>
  if(fd < 0){
    28bb:	83 c4 10             	add    $0x10,%esp
    28be:	85 c0                	test   %eax,%eax
      exit(0);
    }
  }
  close(fd);

  fd = open("bigfile", 0);
    28c0:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    28c2:	0f 88 fc 00 00 00    	js     29c4 <bigfile+0x1a4>
    28c8:	31 db                	xor    %ebx,%ebx
    28ca:	31 ff                	xor    %edi,%edi
    28cc:	eb 30                	jmp    28fe <bigfile+0xde>
    28ce:	66 90                	xchg   %ax,%ax
      printf(1, "read bigfile failed\n");
      exit(0);
    }
    if(cc == 0)
      break;
    if(cc != 300){
    28d0:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    28d5:	0f 85 98 00 00 00    	jne    2973 <bigfile+0x153>
      printf(1, "short read bigfile\n");
      exit(0);
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    28db:	0f be 05 80 8a 00 00 	movsbl 0x8a80,%eax
    28e2:	89 fa                	mov    %edi,%edx
    28e4:	d1 fa                	sar    %edx
    28e6:	39 d0                	cmp    %edx,%eax
    28e8:	75 6e                	jne    2958 <bigfile+0x138>
    28ea:	0f be 15 ab 8b 00 00 	movsbl 0x8bab,%edx
    28f1:	39 d0                	cmp    %edx,%eax
    28f3:	75 63                	jne    2958 <bigfile+0x138>
      printf(1, "read bigfile wrong data\n");
      exit(0);
    }
    total += cc;
    28f5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit(0);
  }
  total = 0;
  for(i = 0; ; i++){
    28fb:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    28fe:	83 ec 04             	sub    $0x4,%esp
    2901:	68 2c 01 00 00       	push   $0x12c
    2906:	68 80 8a 00 00       	push   $0x8a80
    290b:	56                   	push   %esi
    290c:	e8 99 14 00 00       	call   3daa <read>
    if(cc < 0){
    2911:	83 c4 10             	add    $0x10,%esp
    2914:	85 c0                	test   %eax,%eax
    2916:	78 76                	js     298e <bigfile+0x16e>
      printf(1, "read bigfile failed\n");
      exit(0);
    }
    if(cc == 0)
    2918:	75 b6                	jne    28d0 <bigfile+0xb0>
      printf(1, "read bigfile wrong data\n");
      exit(0);
    }
    total += cc;
  }
  close(fd);
    291a:	83 ec 0c             	sub    $0xc,%esp
    291d:	56                   	push   %esi
    291e:	e8 97 14 00 00       	call   3dba <close>
  if(total != 20*600){
    2923:	83 c4 10             	add    $0x10,%esp
    2926:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    292c:	0f 85 c8 00 00 00    	jne    29fa <bigfile+0x1da>
    printf(1, "read bigfile wrong total\n");
    exit(0);
  }
  unlink("bigfile");
    2932:	83 ec 0c             	sub    $0xc,%esp
    2935:	68 c8 4c 00 00       	push   $0x4cc8
    293a:	e8 a3 14 00 00       	call   3de2 <unlink>

  printf(1, "bigfile test ok\n");
    293f:	58                   	pop    %eax
    2940:	5a                   	pop    %edx
    2941:	68 57 4d 00 00       	push   $0x4d57
    2946:	6a 01                	push   $0x1
    2948:	e8 93 15 00 00       	call   3ee0 <printf>
}
    294d:	83 c4 10             	add    $0x10,%esp
    2950:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2953:	5b                   	pop    %ebx
    2954:	5e                   	pop    %esi
    2955:	5f                   	pop    %edi
    2956:	5d                   	pop    %ebp
    2957:	c3                   	ret    
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit(0);
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    2958:	83 ec 08             	sub    $0x8,%esp
    295b:	68 24 4d 00 00       	push   $0x4d24
    2960:	6a 01                	push   $0x1
    2962:	e8 79 15 00 00       	call   3ee0 <printf>
      exit(0);
    2967:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    296e:	e8 1f 14 00 00       	call   3d92 <exit>
      exit(0);
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    2973:	83 ec 08             	sub    $0x8,%esp
    2976:	68 10 4d 00 00       	push   $0x4d10
    297b:	6a 01                	push   $0x1
    297d:	e8 5e 15 00 00       	call   3ee0 <printf>
      exit(0);
    2982:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2989:	e8 04 14 00 00       	call   3d92 <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    298e:	83 ec 08             	sub    $0x8,%esp
    2991:	68 fb 4c 00 00       	push   $0x4cfb
    2996:	6a 01                	push   $0x1
    2998:	e8 43 15 00 00       	call   3ee0 <printf>
      exit(0);
    299d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29a4:	e8 e9 13 00 00       	call   3d92 <exit>
    exit(0);
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    29a9:	83 ec 08             	sub    $0x8,%esp
    29ac:	68 d0 4c 00 00       	push   $0x4cd0
    29b1:	6a 01                	push   $0x1
    29b3:	e8 28 15 00 00       	call   3ee0 <printf>
      exit(0);
    29b8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29bf:	e8 ce 13 00 00       	call   3d92 <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    29c4:	83 ec 08             	sub    $0x8,%esp
    29c7:	68 e6 4c 00 00       	push   $0x4ce6
    29cc:	6a 01                	push   $0x1
    29ce:	e8 0d 15 00 00       	call   3ee0 <printf>
    exit(0);
    29d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29da:	e8 b3 13 00 00       	call   3d92 <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    29df:	83 ec 08             	sub    $0x8,%esp
    29e2:	68 ba 4c 00 00       	push   $0x4cba
    29e7:	6a 01                	push   $0x1
    29e9:	e8 f2 14 00 00       	call   3ee0 <printf>
    exit(0);
    29ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29f5:	e8 98 13 00 00       	call   3d92 <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    29fa:	83 ec 08             	sub    $0x8,%esp
    29fd:	68 3d 4d 00 00       	push   $0x4d3d
    2a02:	6a 01                	push   $0x1
    2a04:	e8 d7 14 00 00       	call   3ee0 <printf>
    exit(0);
    2a09:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a10:	e8 7d 13 00 00       	call   3d92 <exit>
    2a15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002a20 <fourteen>:
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    2a20:	55                   	push   %ebp
    2a21:	89 e5                	mov    %esp,%ebp
    2a23:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2a26:	68 68 4d 00 00       	push   $0x4d68
    2a2b:	6a 01                	push   $0x1
    2a2d:	e8 ae 14 00 00       	call   3ee0 <printf>

  if(mkdir("12345678901234") != 0){
    2a32:	c7 04 24 a3 4d 00 00 	movl   $0x4da3,(%esp)
    2a39:	e8 bc 13 00 00       	call   3dfa <mkdir>
    2a3e:	83 c4 10             	add    $0x10,%esp
    2a41:	85 c0                	test   %eax,%eax
    2a43:	0f 85 9b 00 00 00    	jne    2ae4 <fourteen+0xc4>
    printf(1, "mkdir 12345678901234 failed\n");
    exit(0);
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2a49:	83 ec 0c             	sub    $0xc,%esp
    2a4c:	68 60 55 00 00       	push   $0x5560
    2a51:	e8 a4 13 00 00       	call   3dfa <mkdir>
    2a56:	83 c4 10             	add    $0x10,%esp
    2a59:	85 c0                	test   %eax,%eax
    2a5b:	0f 85 05 01 00 00    	jne    2b66 <fourteen+0x146>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit(0);
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2a61:	83 ec 08             	sub    $0x8,%esp
    2a64:	68 00 02 00 00       	push   $0x200
    2a69:	68 b0 55 00 00       	push   $0x55b0
    2a6e:	e8 5f 13 00 00       	call   3dd2 <open>
  if(fd < 0){
    2a73:	83 c4 10             	add    $0x10,%esp
    2a76:	85 c0                	test   %eax,%eax
    2a78:	0f 88 ce 00 00 00    	js     2b4c <fourteen+0x12c>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit(0);
  }
  close(fd);
    2a7e:	83 ec 0c             	sub    $0xc,%esp
    2a81:	50                   	push   %eax
    2a82:	e8 33 13 00 00       	call   3dba <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2a87:	58                   	pop    %eax
    2a88:	5a                   	pop    %edx
    2a89:	6a 00                	push   $0x0
    2a8b:	68 20 56 00 00       	push   $0x5620
    2a90:	e8 3d 13 00 00       	call   3dd2 <open>
  if(fd < 0){
    2a95:	83 c4 10             	add    $0x10,%esp
    2a98:	85 c0                	test   %eax,%eax
    2a9a:	0f 88 92 00 00 00    	js     2b32 <fourteen+0x112>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit(0);
  }
  close(fd);
    2aa0:	83 ec 0c             	sub    $0xc,%esp
    2aa3:	50                   	push   %eax
    2aa4:	e8 11 13 00 00       	call   3dba <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2aa9:	c7 04 24 94 4d 00 00 	movl   $0x4d94,(%esp)
    2ab0:	e8 45 13 00 00       	call   3dfa <mkdir>
    2ab5:	83 c4 10             	add    $0x10,%esp
    2ab8:	85 c0                	test   %eax,%eax
    2aba:	74 5c                	je     2b18 <fourteen+0xf8>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit(0);
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2abc:	83 ec 0c             	sub    $0xc,%esp
    2abf:	68 bc 56 00 00       	push   $0x56bc
    2ac4:	e8 31 13 00 00       	call   3dfa <mkdir>
    2ac9:	83 c4 10             	add    $0x10,%esp
    2acc:	85 c0                	test   %eax,%eax
    2ace:	74 2e                	je     2afe <fourteen+0xde>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit(0);
  }

  printf(1, "fourteen ok\n");
    2ad0:	83 ec 08             	sub    $0x8,%esp
    2ad3:	68 b2 4d 00 00       	push   $0x4db2
    2ad8:	6a 01                	push   $0x1
    2ada:	e8 01 14 00 00       	call   3ee0 <printf>
}
    2adf:	83 c4 10             	add    $0x10,%esp
    2ae2:	c9                   	leave  
    2ae3:	c3                   	ret    

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    2ae4:	50                   	push   %eax
    2ae5:	50                   	push   %eax
    2ae6:	68 77 4d 00 00       	push   $0x4d77
    2aeb:	6a 01                	push   $0x1
    2aed:	e8 ee 13 00 00       	call   3ee0 <printf>
    exit(0);
    2af2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2af9:	e8 94 12 00 00       	call   3d92 <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit(0);
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2afe:	50                   	push   %eax
    2aff:	50                   	push   %eax
    2b00:	68 dc 56 00 00       	push   $0x56dc
    2b05:	6a 01                	push   $0x1
    2b07:	e8 d4 13 00 00       	call   3ee0 <printf>
    exit(0);
    2b0c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b13:	e8 7a 12 00 00       	call   3d92 <exit>
    exit(0);
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2b18:	52                   	push   %edx
    2b19:	52                   	push   %edx
    2b1a:	68 8c 56 00 00       	push   $0x568c
    2b1f:	6a 01                	push   $0x1
    2b21:	e8 ba 13 00 00       	call   3ee0 <printf>
    exit(0);
    2b26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b2d:	e8 60 12 00 00       	call   3d92 <exit>
    exit(0);
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2b32:	51                   	push   %ecx
    2b33:	51                   	push   %ecx
    2b34:	68 50 56 00 00       	push   $0x5650
    2b39:	6a 01                	push   $0x1
    2b3b:	e8 a0 13 00 00       	call   3ee0 <printf>
    exit(0);
    2b40:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b47:	e8 46 12 00 00       	call   3d92 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit(0);
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2b4c:	51                   	push   %ecx
    2b4d:	51                   	push   %ecx
    2b4e:	68 e0 55 00 00       	push   $0x55e0
    2b53:	6a 01                	push   $0x1
    2b55:	e8 86 13 00 00       	call   3ee0 <printf>
    exit(0);
    2b5a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b61:	e8 2c 12 00 00       	call   3d92 <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit(0);
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2b66:	50                   	push   %eax
    2b67:	50                   	push   %eax
    2b68:	68 80 55 00 00       	push   $0x5580
    2b6d:	6a 01                	push   $0x1
    2b6f:	e8 6c 13 00 00       	call   3ee0 <printf>
    exit(0);
    2b74:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b7b:	e8 12 12 00 00       	call   3d92 <exit>

00002b80 <rmdot>:
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    2b80:	55                   	push   %ebp
    2b81:	89 e5                	mov    %esp,%ebp
    2b83:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    2b86:	68 bf 4d 00 00       	push   $0x4dbf
    2b8b:	6a 01                	push   $0x1
    2b8d:	e8 4e 13 00 00       	call   3ee0 <printf>
  if(mkdir("dots") != 0){
    2b92:	c7 04 24 cb 4d 00 00 	movl   $0x4dcb,(%esp)
    2b99:	e8 5c 12 00 00       	call   3dfa <mkdir>
    2b9e:	83 c4 10             	add    $0x10,%esp
    2ba1:	85 c0                	test   %eax,%eax
    2ba3:	0f 85 b4 00 00 00    	jne    2c5d <rmdot+0xdd>
    printf(1, "mkdir dots failed\n");
    exit(0);
  }
  if(chdir("dots") != 0){
    2ba9:	83 ec 0c             	sub    $0xc,%esp
    2bac:	68 cb 4d 00 00       	push   $0x4dcb
    2bb1:	e8 4c 12 00 00       	call   3e02 <chdir>
    2bb6:	83 c4 10             	add    $0x10,%esp
    2bb9:	85 c0                	test   %eax,%eax
    2bbb:	0f 85 52 01 00 00    	jne    2d13 <rmdot+0x193>
    printf(1, "chdir dots failed\n");
    exit(0);
  }
  if(unlink(".") == 0){
    2bc1:	83 ec 0c             	sub    $0xc,%esp
    2bc4:	68 76 4a 00 00       	push   $0x4a76
    2bc9:	e8 14 12 00 00       	call   3de2 <unlink>
    2bce:	83 c4 10             	add    $0x10,%esp
    2bd1:	85 c0                	test   %eax,%eax
    2bd3:	0f 84 20 01 00 00    	je     2cf9 <rmdot+0x179>
    printf(1, "rm . worked!\n");
    exit(0);
  }
  if(unlink("..") == 0){
    2bd9:	83 ec 0c             	sub    $0xc,%esp
    2bdc:	68 75 4a 00 00       	push   $0x4a75
    2be1:	e8 fc 11 00 00       	call   3de2 <unlink>
    2be6:	83 c4 10             	add    $0x10,%esp
    2be9:	85 c0                	test   %eax,%eax
    2beb:	0f 84 ee 00 00 00    	je     2cdf <rmdot+0x15f>
    printf(1, "rm .. worked!\n");
    exit(0);
  }
  if(chdir("/") != 0){
    2bf1:	83 ec 0c             	sub    $0xc,%esp
    2bf4:	68 49 42 00 00       	push   $0x4249
    2bf9:	e8 04 12 00 00       	call   3e02 <chdir>
    2bfe:	83 c4 10             	add    $0x10,%esp
    2c01:	85 c0                	test   %eax,%eax
    2c03:	0f 85 bc 00 00 00    	jne    2cc5 <rmdot+0x145>
    printf(1, "chdir / failed\n");
    exit(0);
  }
  if(unlink("dots/.") == 0){
    2c09:	83 ec 0c             	sub    $0xc,%esp
    2c0c:	68 13 4e 00 00       	push   $0x4e13
    2c11:	e8 cc 11 00 00       	call   3de2 <unlink>
    2c16:	83 c4 10             	add    $0x10,%esp
    2c19:	85 c0                	test   %eax,%eax
    2c1b:	0f 84 8a 00 00 00    	je     2cab <rmdot+0x12b>
    printf(1, "unlink dots/. worked!\n");
    exit(0);
  }
  if(unlink("dots/..") == 0){
    2c21:	83 ec 0c             	sub    $0xc,%esp
    2c24:	68 31 4e 00 00       	push   $0x4e31
    2c29:	e8 b4 11 00 00       	call   3de2 <unlink>
    2c2e:	83 c4 10             	add    $0x10,%esp
    2c31:	85 c0                	test   %eax,%eax
    2c33:	74 5c                	je     2c91 <rmdot+0x111>
    printf(1, "unlink dots/.. worked!\n");
    exit(0);
  }
  if(unlink("dots") != 0){
    2c35:	83 ec 0c             	sub    $0xc,%esp
    2c38:	68 cb 4d 00 00       	push   $0x4dcb
    2c3d:	e8 a0 11 00 00       	call   3de2 <unlink>
    2c42:	83 c4 10             	add    $0x10,%esp
    2c45:	85 c0                	test   %eax,%eax
    2c47:	75 2e                	jne    2c77 <rmdot+0xf7>
    printf(1, "unlink dots failed!\n");
    exit(0);
  }
  printf(1, "rmdot ok\n");
    2c49:	83 ec 08             	sub    $0x8,%esp
    2c4c:	68 66 4e 00 00       	push   $0x4e66
    2c51:	6a 01                	push   $0x1
    2c53:	e8 88 12 00 00       	call   3ee0 <printf>
}
    2c58:	83 c4 10             	add    $0x10,%esp
    2c5b:	c9                   	leave  
    2c5c:	c3                   	ret    
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    2c5d:	50                   	push   %eax
    2c5e:	50                   	push   %eax
    2c5f:	68 d0 4d 00 00       	push   $0x4dd0
    2c64:	6a 01                	push   $0x1
    2c66:	e8 75 12 00 00       	call   3ee0 <printf>
    exit(0);
    2c6b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c72:	e8 1b 11 00 00       	call   3d92 <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit(0);
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    2c77:	50                   	push   %eax
    2c78:	50                   	push   %eax
    2c79:	68 51 4e 00 00       	push   $0x4e51
    2c7e:	6a 01                	push   $0x1
    2c80:	e8 5b 12 00 00       	call   3ee0 <printf>
    exit(0);
    2c85:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c8c:	e8 01 11 00 00       	call   3d92 <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit(0);
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    2c91:	52                   	push   %edx
    2c92:	52                   	push   %edx
    2c93:	68 39 4e 00 00       	push   $0x4e39
    2c98:	6a 01                	push   $0x1
    2c9a:	e8 41 12 00 00       	call   3ee0 <printf>
    exit(0);
    2c9f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ca6:	e8 e7 10 00 00       	call   3d92 <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit(0);
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    2cab:	51                   	push   %ecx
    2cac:	51                   	push   %ecx
    2cad:	68 1a 4e 00 00       	push   $0x4e1a
    2cb2:	6a 01                	push   $0x1
    2cb4:	e8 27 12 00 00       	call   3ee0 <printf>
    exit(0);
    2cb9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2cc0:	e8 cd 10 00 00       	call   3d92 <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit(0);
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    2cc5:	50                   	push   %eax
    2cc6:	50                   	push   %eax
    2cc7:	68 4b 42 00 00       	push   $0x424b
    2ccc:	6a 01                	push   $0x1
    2cce:	e8 0d 12 00 00       	call   3ee0 <printf>
    exit(0);
    2cd3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2cda:	e8 b3 10 00 00       	call   3d92 <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit(0);
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    2cdf:	50                   	push   %eax
    2ce0:	50                   	push   %eax
    2ce1:	68 04 4e 00 00       	push   $0x4e04
    2ce6:	6a 01                	push   $0x1
    2ce8:	e8 f3 11 00 00       	call   3ee0 <printf>
    exit(0);
    2ced:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2cf4:	e8 99 10 00 00       	call   3d92 <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit(0);
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    2cf9:	50                   	push   %eax
    2cfa:	50                   	push   %eax
    2cfb:	68 f6 4d 00 00       	push   $0x4df6
    2d00:	6a 01                	push   $0x1
    2d02:	e8 d9 11 00 00       	call   3ee0 <printf>
    exit(0);
    2d07:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d0e:	e8 7f 10 00 00       	call   3d92 <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit(0);
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    2d13:	50                   	push   %eax
    2d14:	50                   	push   %eax
    2d15:	68 e3 4d 00 00       	push   $0x4de3
    2d1a:	6a 01                	push   $0x1
    2d1c:	e8 bf 11 00 00       	call   3ee0 <printf>
    exit(0);
    2d21:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d28:	e8 65 10 00 00       	call   3d92 <exit>
    2d2d:	8d 76 00             	lea    0x0(%esi),%esi

00002d30 <dirfile>:
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    2d30:	55                   	push   %ebp
    2d31:	89 e5                	mov    %esp,%ebp
    2d33:	53                   	push   %ebx
    2d34:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
    2d37:	68 70 4e 00 00       	push   $0x4e70
    2d3c:	6a 01                	push   $0x1
    2d3e:	e8 9d 11 00 00       	call   3ee0 <printf>

  fd = open("dirfile", O_CREATE);
    2d43:	59                   	pop    %ecx
    2d44:	5b                   	pop    %ebx
    2d45:	68 00 02 00 00       	push   $0x200
    2d4a:	68 7d 4e 00 00       	push   $0x4e7d
    2d4f:	e8 7e 10 00 00       	call   3dd2 <open>
  if(fd < 0){
    2d54:	83 c4 10             	add    $0x10,%esp
    2d57:	85 c0                	test   %eax,%eax
    2d59:	0f 88 51 01 00 00    	js     2eb0 <dirfile+0x180>
    printf(1, "create dirfile failed\n");
    exit(0);
  }
  close(fd);
    2d5f:	83 ec 0c             	sub    $0xc,%esp
    2d62:	50                   	push   %eax
    2d63:	e8 52 10 00 00       	call   3dba <close>
  if(chdir("dirfile") == 0){
    2d68:	c7 04 24 7d 4e 00 00 	movl   $0x4e7d,(%esp)
    2d6f:	e8 8e 10 00 00       	call   3e02 <chdir>
    2d74:	83 c4 10             	add    $0x10,%esp
    2d77:	85 c0                	test   %eax,%eax
    2d79:	0f 84 17 01 00 00    	je     2e96 <dirfile+0x166>
    printf(1, "chdir dirfile succeeded!\n");
    exit(0);
  }
  fd = open("dirfile/xx", 0);
    2d7f:	83 ec 08             	sub    $0x8,%esp
    2d82:	6a 00                	push   $0x0
    2d84:	68 b6 4e 00 00       	push   $0x4eb6
    2d89:	e8 44 10 00 00       	call   3dd2 <open>
  if(fd >= 0){
    2d8e:	83 c4 10             	add    $0x10,%esp
    2d91:	85 c0                	test   %eax,%eax
    2d93:	0f 89 e3 00 00 00    	jns    2e7c <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit(0);
  }
  fd = open("dirfile/xx", O_CREATE);
    2d99:	83 ec 08             	sub    $0x8,%esp
    2d9c:	68 00 02 00 00       	push   $0x200
    2da1:	68 b6 4e 00 00       	push   $0x4eb6
    2da6:	e8 27 10 00 00       	call   3dd2 <open>
  if(fd >= 0){
    2dab:	83 c4 10             	add    $0x10,%esp
    2dae:	85 c0                	test   %eax,%eax
    2db0:	0f 89 c6 00 00 00    	jns    2e7c <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit(0);
  }
  if(mkdir("dirfile/xx") == 0){
    2db6:	83 ec 0c             	sub    $0xc,%esp
    2db9:	68 b6 4e 00 00       	push   $0x4eb6
    2dbe:	e8 37 10 00 00       	call   3dfa <mkdir>
    2dc3:	83 c4 10             	add    $0x10,%esp
    2dc6:	85 c0                	test   %eax,%eax
    2dc8:	0f 84 7e 01 00 00    	je     2f4c <dirfile+0x21c>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit(0);
  }
  if(unlink("dirfile/xx") == 0){
    2dce:	83 ec 0c             	sub    $0xc,%esp
    2dd1:	68 b6 4e 00 00       	push   $0x4eb6
    2dd6:	e8 07 10 00 00       	call   3de2 <unlink>
    2ddb:	83 c4 10             	add    $0x10,%esp
    2dde:	85 c0                	test   %eax,%eax
    2de0:	0f 84 4c 01 00 00    	je     2f32 <dirfile+0x202>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit(0);
  }
  if(link("README", "dirfile/xx") == 0){
    2de6:	83 ec 08             	sub    $0x8,%esp
    2de9:	68 b6 4e 00 00       	push   $0x4eb6
    2dee:	68 1a 4f 00 00       	push   $0x4f1a
    2df3:	e8 fa 0f 00 00       	call   3df2 <link>
    2df8:	83 c4 10             	add    $0x10,%esp
    2dfb:	85 c0                	test   %eax,%eax
    2dfd:	0f 84 15 01 00 00    	je     2f18 <dirfile+0x1e8>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit(0);
  }
  if(unlink("dirfile") != 0){
    2e03:	83 ec 0c             	sub    $0xc,%esp
    2e06:	68 7d 4e 00 00       	push   $0x4e7d
    2e0b:	e8 d2 0f 00 00       	call   3de2 <unlink>
    2e10:	83 c4 10             	add    $0x10,%esp
    2e13:	85 c0                	test   %eax,%eax
    2e15:	0f 85 e3 00 00 00    	jne    2efe <dirfile+0x1ce>
    printf(1, "unlink dirfile failed!\n");
    exit(0);
  }

  fd = open(".", O_RDWR);
    2e1b:	83 ec 08             	sub    $0x8,%esp
    2e1e:	6a 02                	push   $0x2
    2e20:	68 76 4a 00 00       	push   $0x4a76
    2e25:	e8 a8 0f 00 00       	call   3dd2 <open>
  if(fd >= 0){
    2e2a:	83 c4 10             	add    $0x10,%esp
    2e2d:	85 c0                	test   %eax,%eax
    2e2f:	0f 89 af 00 00 00    	jns    2ee4 <dirfile+0x1b4>
    printf(1, "open . for writing succeeded!\n");
    exit(0);
  }
  fd = open(".", 0);
    2e35:	83 ec 08             	sub    $0x8,%esp
    2e38:	6a 00                	push   $0x0
    2e3a:	68 76 4a 00 00       	push   $0x4a76
    2e3f:	e8 8e 0f 00 00       	call   3dd2 <open>
  if(write(fd, "x", 1) > 0){
    2e44:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit(0);
  }
  fd = open(".", 0);
    2e47:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2e49:	6a 01                	push   $0x1
    2e4b:	68 59 4b 00 00       	push   $0x4b59
    2e50:	50                   	push   %eax
    2e51:	e8 5c 0f 00 00       	call   3db2 <write>
    2e56:	83 c4 10             	add    $0x10,%esp
    2e59:	85 c0                	test   %eax,%eax
    2e5b:	7f 6d                	jg     2eca <dirfile+0x19a>
    printf(1, "write . succeeded!\n");
    exit(0);
  }
  close(fd);
    2e5d:	83 ec 0c             	sub    $0xc,%esp
    2e60:	53                   	push   %ebx
    2e61:	e8 54 0f 00 00       	call   3dba <close>

  printf(1, "dir vs file OK\n");
    2e66:	58                   	pop    %eax
    2e67:	5a                   	pop    %edx
    2e68:	68 4d 4f 00 00       	push   $0x4f4d
    2e6d:	6a 01                	push   $0x1
    2e6f:	e8 6c 10 00 00       	call   3ee0 <printf>
}
    2e74:	83 c4 10             	add    $0x10,%esp
    2e77:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2e7a:	c9                   	leave  
    2e7b:	c3                   	ret    
    printf(1, "chdir dirfile succeeded!\n");
    exit(0);
  }
  fd = open("dirfile/xx", 0);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    2e7c:	50                   	push   %eax
    2e7d:	50                   	push   %eax
    2e7e:	68 c1 4e 00 00       	push   $0x4ec1
    2e83:	6a 01                	push   $0x1
    2e85:	e8 56 10 00 00       	call   3ee0 <printf>
    exit(0);
    2e8a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e91:	e8 fc 0e 00 00       	call   3d92 <exit>
    printf(1, "create dirfile failed\n");
    exit(0);
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    2e96:	50                   	push   %eax
    2e97:	50                   	push   %eax
    2e98:	68 9c 4e 00 00       	push   $0x4e9c
    2e9d:	6a 01                	push   $0x1
    2e9f:	e8 3c 10 00 00       	call   3ee0 <printf>
    exit(0);
    2ea4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2eab:	e8 e2 0e 00 00       	call   3d92 <exit>

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    2eb0:	52                   	push   %edx
    2eb1:	52                   	push   %edx
    2eb2:	68 85 4e 00 00       	push   $0x4e85
    2eb7:	6a 01                	push   $0x1
    2eb9:	e8 22 10 00 00       	call   3ee0 <printf>
    exit(0);
    2ebe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ec5:	e8 c8 0e 00 00       	call   3d92 <exit>
    printf(1, "open . for writing succeeded!\n");
    exit(0);
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    2eca:	51                   	push   %ecx
    2ecb:	51                   	push   %ecx
    2ecc:	68 39 4f 00 00       	push   $0x4f39
    2ed1:	6a 01                	push   $0x1
    2ed3:	e8 08 10 00 00       	call   3ee0 <printf>
    exit(0);
    2ed8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2edf:	e8 ae 0e 00 00       	call   3d92 <exit>
    exit(0);
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    2ee4:	53                   	push   %ebx
    2ee5:	53                   	push   %ebx
    2ee6:	68 30 57 00 00       	push   $0x5730
    2eeb:	6a 01                	push   $0x1
    2eed:	e8 ee 0f 00 00       	call   3ee0 <printf>
    exit(0);
    2ef2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ef9:	e8 94 0e 00 00       	call   3d92 <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit(0);
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    2efe:	50                   	push   %eax
    2eff:	50                   	push   %eax
    2f00:	68 21 4f 00 00       	push   $0x4f21
    2f05:	6a 01                	push   $0x1
    2f07:	e8 d4 0f 00 00       	call   3ee0 <printf>
    exit(0);
    2f0c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f13:	e8 7a 0e 00 00       	call   3d92 <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit(0);
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    2f18:	50                   	push   %eax
    2f19:	50                   	push   %eax
    2f1a:	68 10 57 00 00       	push   $0x5710
    2f1f:	6a 01                	push   $0x1
    2f21:	e8 ba 0f 00 00       	call   3ee0 <printf>
    exit(0);
    2f26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f2d:	e8 60 0e 00 00       	call   3d92 <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit(0);
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    2f32:	50                   	push   %eax
    2f33:	50                   	push   %eax
    2f34:	68 fc 4e 00 00       	push   $0x4efc
    2f39:	6a 01                	push   $0x1
    2f3b:	e8 a0 0f 00 00       	call   3ee0 <printf>
    exit(0);
    2f40:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f47:	e8 46 0e 00 00       	call   3d92 <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit(0);
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2f4c:	50                   	push   %eax
    2f4d:	50                   	push   %eax
    2f4e:	68 df 4e 00 00       	push   $0x4edf
    2f53:	6a 01                	push   $0x1
    2f55:	e8 86 0f 00 00       	call   3ee0 <printf>
    exit(0);
    2f5a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f61:	e8 2c 0e 00 00       	call   3d92 <exit>
    2f66:	8d 76 00             	lea    0x0(%esi),%esi
    2f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002f70 <iref>:
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2f70:	55                   	push   %ebp
    2f71:	89 e5                	mov    %esp,%ebp
    2f73:	53                   	push   %ebx
  int i, fd;

  printf(1, "empty file name\n");
    2f74:	bb 33 00 00 00       	mov    $0x33,%ebx
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2f79:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2f7c:	68 5d 4f 00 00       	push   $0x4f5d
    2f81:	6a 01                	push   $0x1
    2f83:	e8 58 0f 00 00       	call   3ee0 <printf>
    2f88:	83 c4 10             	add    $0x10,%esp
    2f8b:	90                   	nop
    2f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    2f90:	83 ec 0c             	sub    $0xc,%esp
    2f93:	68 6e 4f 00 00       	push   $0x4f6e
    2f98:	e8 5d 0e 00 00       	call   3dfa <mkdir>
    2f9d:	83 c4 10             	add    $0x10,%esp
    2fa0:	85 c0                	test   %eax,%eax
    2fa2:	0f 85 bb 00 00 00    	jne    3063 <iref+0xf3>
      printf(1, "mkdir irefd failed\n");
      exit(0);
    }
    if(chdir("irefd") != 0){
    2fa8:	83 ec 0c             	sub    $0xc,%esp
    2fab:	68 6e 4f 00 00       	push   $0x4f6e
    2fb0:	e8 4d 0e 00 00       	call   3e02 <chdir>
    2fb5:	83 c4 10             	add    $0x10,%esp
    2fb8:	85 c0                	test   %eax,%eax
    2fba:	0f 85 be 00 00 00    	jne    307e <iref+0x10e>
      printf(1, "chdir irefd failed\n");
      exit(0);
    }

    mkdir("");
    2fc0:	83 ec 0c             	sub    $0xc,%esp
    2fc3:	68 23 46 00 00       	push   $0x4623
    2fc8:	e8 2d 0e 00 00       	call   3dfa <mkdir>
    link("README", "");
    2fcd:	59                   	pop    %ecx
    2fce:	58                   	pop    %eax
    2fcf:	68 23 46 00 00       	push   $0x4623
    2fd4:	68 1a 4f 00 00       	push   $0x4f1a
    2fd9:	e8 14 0e 00 00       	call   3df2 <link>
    fd = open("", O_CREATE);
    2fde:	58                   	pop    %eax
    2fdf:	5a                   	pop    %edx
    2fe0:	68 00 02 00 00       	push   $0x200
    2fe5:	68 23 46 00 00       	push   $0x4623
    2fea:	e8 e3 0d 00 00       	call   3dd2 <open>
    if(fd >= 0)
    2fef:	83 c4 10             	add    $0x10,%esp
    2ff2:	85 c0                	test   %eax,%eax
    2ff4:	78 0c                	js     3002 <iref+0x92>
      close(fd);
    2ff6:	83 ec 0c             	sub    $0xc,%esp
    2ff9:	50                   	push   %eax
    2ffa:	e8 bb 0d 00 00       	call   3dba <close>
    2fff:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    3002:	83 ec 08             	sub    $0x8,%esp
    3005:	68 00 02 00 00       	push   $0x200
    300a:	68 58 4b 00 00       	push   $0x4b58
    300f:	e8 be 0d 00 00       	call   3dd2 <open>
    if(fd >= 0)
    3014:	83 c4 10             	add    $0x10,%esp
    3017:	85 c0                	test   %eax,%eax
    3019:	78 0c                	js     3027 <iref+0xb7>
      close(fd);
    301b:	83 ec 0c             	sub    $0xc,%esp
    301e:	50                   	push   %eax
    301f:	e8 96 0d 00 00       	call   3dba <close>
    3024:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    3027:	83 ec 0c             	sub    $0xc,%esp
    302a:	68 58 4b 00 00       	push   $0x4b58
    302f:	e8 ae 0d 00 00       	call   3de2 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    3034:	83 c4 10             	add    $0x10,%esp
    3037:	83 eb 01             	sub    $0x1,%ebx
    303a:	0f 85 50 ff ff ff    	jne    2f90 <iref+0x20>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    3040:	83 ec 0c             	sub    $0xc,%esp
    3043:	68 49 42 00 00       	push   $0x4249
    3048:	e8 b5 0d 00 00       	call   3e02 <chdir>
  printf(1, "empty file name OK\n");
    304d:	58                   	pop    %eax
    304e:	5a                   	pop    %edx
    304f:	68 9c 4f 00 00       	push   $0x4f9c
    3054:	6a 01                	push   $0x1
    3056:	e8 85 0e 00 00       	call   3ee0 <printf>
}
    305b:	83 c4 10             	add    $0x10,%esp
    305e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3061:	c9                   	leave  
    3062:	c3                   	ret    
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    3063:	83 ec 08             	sub    $0x8,%esp
    3066:	68 74 4f 00 00       	push   $0x4f74
    306b:	6a 01                	push   $0x1
    306d:	e8 6e 0e 00 00       	call   3ee0 <printf>
      exit(0);
    3072:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3079:	e8 14 0d 00 00       	call   3d92 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    307e:	83 ec 08             	sub    $0x8,%esp
    3081:	68 88 4f 00 00       	push   $0x4f88
    3086:	6a 01                	push   $0x1
    3088:	e8 53 0e 00 00       	call   3ee0 <printf>
      exit(0);
    308d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3094:	e8 f9 0c 00 00       	call   3d92 <exit>
    3099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000030a0 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    30a0:	55                   	push   %ebp
    30a1:	89 e5                	mov    %esp,%ebp
    30a3:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    30a4:	31 db                	xor    %ebx,%ebx
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    30a6:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
    30a9:	68 b0 4f 00 00       	push   $0x4fb0
    30ae:	6a 01                	push   $0x1
    30b0:	e8 2b 0e 00 00       	call   3ee0 <printf>
    30b5:	83 c4 10             	add    $0x10,%esp
    30b8:	eb 13                	jmp    30cd <forktest+0x2d>
    30ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
    30c0:	74 69                	je     312b <forktest+0x8b>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    30c2:	83 c3 01             	add    $0x1,%ebx
    30c5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    30cb:	74 43                	je     3110 <forktest+0x70>
    pid = fork();
    30cd:	e8 b8 0c 00 00       	call   3d8a <fork>
    if(pid < 0)
    30d2:	85 c0                	test   %eax,%eax
    30d4:	79 ea                	jns    30c0 <forktest+0x20>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit(0);
  }

  for(; n > 0; n--){
    30d6:	85 db                	test   %ebx,%ebx
    30d8:	74 14                	je     30ee <forktest+0x4e>
    30da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    30e0:	e8 b5 0c 00 00       	call   3d9a <wait>
    30e5:	85 c0                	test   %eax,%eax
    30e7:	78 4c                	js     3135 <forktest+0x95>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit(0);
  }

  for(; n > 0; n--){
    30e9:	83 eb 01             	sub    $0x1,%ebx
    30ec:	75 f2                	jne    30e0 <forktest+0x40>
      printf(1, "wait stopped early\n");
      exit(0);
    }
  }

  if(wait() != -1){
    30ee:	e8 a7 0c 00 00       	call   3d9a <wait>
    30f3:	83 f8 ff             	cmp    $0xffffffff,%eax
    30f6:	75 58                	jne    3150 <forktest+0xb0>
    printf(1, "wait got too many\n");
    exit(0);
  }

  printf(1, "fork test OK\n");
    30f8:	83 ec 08             	sub    $0x8,%esp
    30fb:	68 e2 4f 00 00       	push   $0x4fe2
    3100:	6a 01                	push   $0x1
    3102:	e8 d9 0d 00 00       	call   3ee0 <printf>
}
    3107:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    310a:	c9                   	leave  
    310b:	c3                   	ret    
    310c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
      exit(0);
  }

  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    3110:	83 ec 08             	sub    $0x8,%esp
    3113:	68 50 57 00 00       	push   $0x5750
    3118:	6a 01                	push   $0x1
    311a:	e8 c1 0d 00 00       	call   3ee0 <printf>
    exit(0);
    311f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3126:	e8 67 0c 00 00       	call   3d92 <exit>
  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
      exit(0);
    312b:	83 ec 0c             	sub    $0xc,%esp
    312e:	6a 00                	push   $0x0
    3130:	e8 5d 0c 00 00       	call   3d92 <exit>
    exit(0);
  }

  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
    3135:	83 ec 08             	sub    $0x8,%esp
    3138:	68 bb 4f 00 00       	push   $0x4fbb
    313d:	6a 01                	push   $0x1
    313f:	e8 9c 0d 00 00       	call   3ee0 <printf>
      exit(0);
    3144:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    314b:	e8 42 0c 00 00       	call   3d92 <exit>
    }
  }

  if(wait() != -1){
    printf(1, "wait got too many\n");
    3150:	83 ec 08             	sub    $0x8,%esp
    3153:	68 cf 4f 00 00       	push   $0x4fcf
    3158:	6a 01                	push   $0x1
    315a:	e8 81 0d 00 00       	call   3ee0 <printf>
    exit(0);
    315f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3166:	e8 27 0c 00 00       	call   3d92 <exit>
    316b:	90                   	nop
    316c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003170 <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    3170:	55                   	push   %ebp
    3171:	89 e5                	mov    %esp,%ebp
    3173:	57                   	push   %edi
    3174:	56                   	push   %esi
    3175:	53                   	push   %ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    3176:	31 ff                	xor    %edi,%edi
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    3178:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    317b:	68 f0 4f 00 00       	push   $0x4ff0
    3180:	ff 35 94 62 00 00    	pushl  0x6294
    3186:	e8 55 0d 00 00       	call   3ee0 <printf>
  oldbrk = sbrk(0);
    318b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3192:	e8 83 0c 00 00       	call   3e1a <sbrk>

  // can one sbrk() less than a page?
  a = sbrk(0);
    3197:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    319e:	89 45 a4             	mov    %eax,-0x5c(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    31a1:	e8 74 0c 00 00       	call   3e1a <sbrk>
    31a6:	83 c4 10             	add    $0x10,%esp
    31a9:	89 c3                	mov    %eax,%ebx
    31ab:	90                   	nop
    31ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    31b0:	83 ec 0c             	sub    $0xc,%esp
    31b3:	6a 01                	push   $0x1
    31b5:	e8 60 0c 00 00       	call   3e1a <sbrk>
    if(b != a){
    31ba:	83 c4 10             	add    $0x10,%esp
    31bd:	39 d8                	cmp    %ebx,%eax
    31bf:	0f 85 85 02 00 00    	jne    344a <sbrktest+0x2da>
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    31c5:	83 c7 01             	add    $0x1,%edi
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit(0);
    }
    *b = 1;
    31c8:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    31cb:	83 c3 01             	add    $0x1,%ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    31ce:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    31d4:	75 da                	jne    31b0 <sbrktest+0x40>
      exit(0);
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    31d6:	e8 af 0b 00 00       	call   3d8a <fork>
  if(pid < 0){
    31db:	85 c0                	test   %eax,%eax
      exit(0);
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    31dd:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    31df:	0f 88 e7 03 00 00    	js     35cc <sbrktest+0x45c>
    printf(stdout, "sbrk test fork failed\n");
    exit(0);
  }
  c = sbrk(1);
    31e5:	83 ec 0c             	sub    $0xc,%esp
  c = sbrk(1);
  if(c != a + 1){
    31e8:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    exit(0);
  }
  c = sbrk(1);
    31eb:	6a 01                	push   $0x1
    31ed:	e8 28 0c 00 00       	call   3e1a <sbrk>
  c = sbrk(1);
    31f2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    31f9:	e8 1c 0c 00 00       	call   3e1a <sbrk>
  if(c != a + 1){
    31fe:	83 c4 10             	add    $0x10,%esp
    3201:	39 d8                	cmp    %ebx,%eax
    3203:	0f 85 a4 03 00 00    	jne    35ad <sbrktest+0x43d>
    printf(stdout, "sbrk test failed post-fork\n");
    exit(0);
  }
  if(pid == 0)
    3209:	85 ff                	test   %edi,%edi
    320b:	0f 84 92 03 00 00    	je     35a3 <sbrktest+0x433>
    exit(0);
  wait();
    3211:	e8 84 0b 00 00       	call   3d9a <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    3216:	83 ec 0c             	sub    $0xc,%esp
    3219:	6a 00                	push   $0x0
    321b:	e8 fa 0b 00 00       	call   3e1a <sbrk>
    3220:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
    3222:	b8 00 00 40 06       	mov    $0x6400000,%eax
    3227:	29 d8                	sub    %ebx,%eax
    3229:	89 04 24             	mov    %eax,(%esp)
    322c:	e8 e9 0b 00 00       	call   3e1a <sbrk>
  if (p != a) {
    3231:	83 c4 10             	add    $0x10,%esp
    3234:	39 c3                	cmp    %eax,%ebx
    3236:	0f 85 48 03 00 00    	jne    3584 <sbrktest+0x414>
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    323c:	83 ec 0c             	sub    $0xc,%esp
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit(0);
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    323f:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff

  // can one de-allocate?
  a = sbrk(0);
    3246:	6a 00                	push   $0x0
    3248:	e8 cd 0b 00 00       	call   3e1a <sbrk>
  c = sbrk(-4096);
    324d:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    3254:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    3256:	e8 bf 0b 00 00       	call   3e1a <sbrk>
  if(c == (char*)0xffffffff){
    325b:	83 c4 10             	add    $0x10,%esp
    325e:	83 f8 ff             	cmp    $0xffffffff,%eax
    3261:	0f 84 fe 02 00 00    	je     3565 <sbrktest+0x3f5>
    printf(stdout, "sbrk could not deallocate\n");
    exit(0);
  }
  c = sbrk(0);
    3267:	83 ec 0c             	sub    $0xc,%esp
    326a:	6a 00                	push   $0x0
    326c:	e8 a9 0b 00 00       	call   3e1a <sbrk>
  if(c != a - 4096){
    3271:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    3277:	83 c4 10             	add    $0x10,%esp
    327a:	39 d0                	cmp    %edx,%eax
    327c:	0f 85 c5 02 00 00    	jne    3547 <sbrktest+0x3d7>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit(0);
  }

  // can one re-allocate that page?
  a = sbrk(0);
    3282:	83 ec 0c             	sub    $0xc,%esp
    3285:	6a 00                	push   $0x0
    3287:	e8 8e 0b 00 00       	call   3e1a <sbrk>
    328c:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    328e:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    3295:	e8 80 0b 00 00       	call   3e1a <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    329a:	83 c4 10             	add    $0x10,%esp
    329d:	39 c3                	cmp    %eax,%ebx
    exit(0);
  }

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    329f:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    32a1:	0f 85 82 02 00 00    	jne    3529 <sbrktest+0x3b9>
    32a7:	83 ec 0c             	sub    $0xc,%esp
    32aa:	6a 00                	push   $0x0
    32ac:	e8 69 0b 00 00       	call   3e1a <sbrk>
    32b1:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    32b7:	83 c4 10             	add    $0x10,%esp
    32ba:	39 d0                	cmp    %edx,%eax
    32bc:	0f 85 67 02 00 00    	jne    3529 <sbrktest+0x3b9>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit(0);
  }
  if(*lastaddr == 99){
    32c2:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    32c9:	0f 84 3b 02 00 00    	je     350a <sbrktest+0x39a>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit(0);
  }

  a = sbrk(0);
    32cf:	83 ec 0c             	sub    $0xc,%esp
    32d2:	6a 00                	push   $0x0
    32d4:	e8 41 0b 00 00       	call   3e1a <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    32d9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit(0);
  }

  a = sbrk(0);
    32e0:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    32e2:	e8 33 0b 00 00       	call   3e1a <sbrk>
    32e7:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    32ea:	29 c1                	sub    %eax,%ecx
    32ec:	89 0c 24             	mov    %ecx,(%esp)
    32ef:	e8 26 0b 00 00       	call   3e1a <sbrk>
  if(c != a){
    32f4:	83 c4 10             	add    $0x10,%esp
    32f7:	39 c3                	cmp    %eax,%ebx
    32f9:	0f 85 ed 01 00 00    	jne    34ec <sbrktest+0x37c>
    32ff:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    3304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit(0);
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    3308:	e8 05 0b 00 00       	call   3e12 <getpid>
    330d:	89 c7                	mov    %eax,%edi
    pid = fork();
    330f:	e8 76 0a 00 00       	call   3d8a <fork>
    if(pid < 0){
    3314:	85 c0                	test   %eax,%eax
    3316:	0f 88 b1 01 00 00    	js     34cd <sbrktest+0x35d>
      printf(stdout, "fork failed\n");
      exit(0);
    }
    if(pid == 0){
    331c:	0f 84 82 01 00 00    	je     34a4 <sbrktest+0x334>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit(0);
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3322:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit(0);
    }
    wait();
    3328:	e8 6d 0a 00 00       	call   3d9a <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit(0);
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    332d:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    3333:	75 d3                	jne    3308 <sbrktest+0x198>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    3335:	8d 45 b8             	lea    -0x48(%ebp),%eax
    3338:	83 ec 0c             	sub    $0xc,%esp
    333b:	50                   	push   %eax
    333c:	e8 61 0a 00 00       	call   3da2 <pipe>
    3341:	83 c4 10             	add    $0x10,%esp
    3344:	85 c0                	test   %eax,%eax
    3346:	0f 85 3d 01 00 00    	jne    3489 <sbrktest+0x319>
    334c:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    334f:	8d 7d e8             	lea    -0x18(%ebp),%edi
    3352:	89 de                	mov    %ebx,%esi
    printf(1, "pipe() failed\n");
    exit(0);
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
    3354:	e8 31 0a 00 00       	call   3d8a <fork>
    3359:	85 c0                	test   %eax,%eax
    335b:	89 06                	mov    %eax,(%esi)
    335d:	0f 84 a1 00 00 00    	je     3404 <sbrktest+0x294>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    3363:	83 f8 ff             	cmp    $0xffffffff,%eax
    3366:	74 14                	je     337c <sbrktest+0x20c>
      read(fds[0], &scratch, 1);
    3368:	8d 45 b7             	lea    -0x49(%ebp),%eax
    336b:	83 ec 04             	sub    $0x4,%esp
    336e:	6a 01                	push   $0x1
    3370:	50                   	push   %eax
    3371:	ff 75 b8             	pushl  -0x48(%ebp)
    3374:	e8 31 0a 00 00       	call   3daa <read>
    3379:	83 c4 10             	add    $0x10,%esp
    337c:	83 c6 04             	add    $0x4,%esi
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit(0);
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    337f:	39 f7                	cmp    %esi,%edi
    3381:	75 d1                	jne    3354 <sbrktest+0x1e4>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    3383:	83 ec 0c             	sub    $0xc,%esp
    3386:	68 00 10 00 00       	push   $0x1000
    338b:	e8 8a 0a 00 00       	call   3e1a <sbrk>
    3390:	83 c4 10             	add    $0x10,%esp
    3393:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    3395:	8b 03                	mov    (%ebx),%eax
    3397:	83 f8 ff             	cmp    $0xffffffff,%eax
    339a:	74 11                	je     33ad <sbrktest+0x23d>
      continue;
    kill(pids[i]);
    339c:	83 ec 0c             	sub    $0xc,%esp
    339f:	50                   	push   %eax
    33a0:	e8 1d 0a 00 00       	call   3dc2 <kill>
    wait();
    33a5:	e8 f0 09 00 00       	call   3d9a <wait>
    33aa:	83 c4 10             	add    $0x10,%esp
    33ad:	83 c3 04             	add    $0x4,%ebx
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    33b0:	39 fb                	cmp    %edi,%ebx
    33b2:	75 e1                	jne    3395 <sbrktest+0x225>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    33b4:	83 fe ff             	cmp    $0xffffffff,%esi
    33b7:	0f 84 ad 00 00 00    	je     346a <sbrktest+0x2fa>
    printf(stdout, "failed sbrk leaked memory\n");
    exit(0);
  }

  if(sbrk(0) > oldbrk)
    33bd:	83 ec 0c             	sub    $0xc,%esp
    33c0:	6a 00                	push   $0x0
    33c2:	e8 53 0a 00 00       	call   3e1a <sbrk>
    33c7:	83 c4 10             	add    $0x10,%esp
    33ca:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    33cd:	73 1a                	jae    33e9 <sbrktest+0x279>
    sbrk(-(sbrk(0) - oldbrk));
    33cf:	83 ec 0c             	sub    $0xc,%esp
    33d2:	6a 00                	push   $0x0
    33d4:	e8 41 0a 00 00       	call   3e1a <sbrk>
    33d9:	8b 75 a4             	mov    -0x5c(%ebp),%esi
    33dc:	29 c6                	sub    %eax,%esi
    33de:	89 34 24             	mov    %esi,(%esp)
    33e1:	e8 34 0a 00 00       	call   3e1a <sbrk>
    33e6:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    33e9:	83 ec 08             	sub    $0x8,%esp
    33ec:	68 98 50 00 00       	push   $0x5098
    33f1:	ff 35 94 62 00 00    	pushl  0x6294
    33f7:	e8 e4 0a 00 00       	call   3ee0 <printf>
}
    33fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    33ff:	5b                   	pop    %ebx
    3400:	5e                   	pop    %esi
    3401:	5f                   	pop    %edi
    3402:	5d                   	pop    %ebp
    3403:	c3                   	ret    
    exit(0);
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    3404:	83 ec 0c             	sub    $0xc,%esp
    3407:	6a 00                	push   $0x0
    3409:	e8 0c 0a 00 00       	call   3e1a <sbrk>
    340e:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3413:	29 c2                	sub    %eax,%edx
    3415:	89 14 24             	mov    %edx,(%esp)
    3418:	e8 fd 09 00 00       	call   3e1a <sbrk>
      write(fds[1], "x", 1);
    341d:	83 c4 0c             	add    $0xc,%esp
    3420:	6a 01                	push   $0x1
    3422:	68 59 4b 00 00       	push   $0x4b59
    3427:	ff 75 bc             	pushl  -0x44(%ebp)
    342a:	e8 83 09 00 00       	call   3db2 <write>
    342f:	83 c4 10             	add    $0x10,%esp
    3432:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      // sit around until killed
      for(;;) sleep(1000);
    3438:	83 ec 0c             	sub    $0xc,%esp
    343b:	68 e8 03 00 00       	push   $0x3e8
    3440:	e8 dd 09 00 00       	call   3e22 <sleep>
    3445:	83 c4 10             	add    $0x10,%esp
    3448:	eb ee                	jmp    3438 <sbrktest+0x2c8>
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    344a:	83 ec 0c             	sub    $0xc,%esp
    344d:	50                   	push   %eax
    344e:	53                   	push   %ebx
    344f:	57                   	push   %edi
    3450:	68 fb 4f 00 00       	push   $0x4ffb
    3455:	ff 35 94 62 00 00    	pushl  0x6294
    345b:	e8 80 0a 00 00       	call   3ee0 <printf>
      exit(0);
    3460:	83 c4 14             	add    $0x14,%esp
    3463:	6a 00                	push   $0x0
    3465:	e8 28 09 00 00       	call   3d92 <exit>
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    346a:	83 ec 08             	sub    $0x8,%esp
    346d:	68 7d 50 00 00       	push   $0x507d
    3472:	ff 35 94 62 00 00    	pushl  0x6294
    3478:	e8 63 0a 00 00       	call   3ee0 <printf>
    exit(0);
    347d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3484:	e8 09 09 00 00       	call   3d92 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    3489:	83 ec 08             	sub    $0x8,%esp
    348c:	68 39 45 00 00       	push   $0x4539
    3491:	6a 01                	push   $0x1
    3493:	e8 48 0a 00 00       	call   3ee0 <printf>
    exit(0);
    3498:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    349f:	e8 ee 08 00 00       	call   3d92 <exit>
    if(pid < 0){
      printf(stdout, "fork failed\n");
      exit(0);
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    34a4:	0f be 03             	movsbl (%ebx),%eax
    34a7:	50                   	push   %eax
    34a8:	53                   	push   %ebx
    34a9:	68 64 50 00 00       	push   $0x5064
    34ae:	ff 35 94 62 00 00    	pushl  0x6294
    34b4:	e8 27 0a 00 00       	call   3ee0 <printf>
      kill(ppid);
    34b9:	89 3c 24             	mov    %edi,(%esp)
    34bc:	e8 01 09 00 00       	call   3dc2 <kill>
      exit(0);
    34c1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34c8:	e8 c5 08 00 00       	call   3d92 <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork();
    if(pid < 0){
      printf(stdout, "fork failed\n");
    34cd:	83 ec 08             	sub    $0x8,%esp
    34d0:	68 41 51 00 00       	push   $0x5141
    34d5:	ff 35 94 62 00 00    	pushl  0x6294
    34db:	e8 00 0a 00 00       	call   3ee0 <printf>
      exit(0);
    34e0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34e7:	e8 a6 08 00 00       	call   3d92 <exit>
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    34ec:	50                   	push   %eax
    34ed:	53                   	push   %ebx
    34ee:	68 44 58 00 00       	push   $0x5844
    34f3:	ff 35 94 62 00 00    	pushl  0x6294
    34f9:	e8 e2 09 00 00       	call   3ee0 <printf>
    exit(0);
    34fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3505:	e8 88 08 00 00       	call   3d92 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit(0);
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    350a:	83 ec 08             	sub    $0x8,%esp
    350d:	68 14 58 00 00       	push   $0x5814
    3512:	ff 35 94 62 00 00    	pushl  0x6294
    3518:	e8 c3 09 00 00       	call   3ee0 <printf>
    exit(0);
    351d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3524:	e8 69 08 00 00       	call   3d92 <exit>

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    3529:	57                   	push   %edi
    352a:	53                   	push   %ebx
    352b:	68 ec 57 00 00       	push   $0x57ec
    3530:	ff 35 94 62 00 00    	pushl  0x6294
    3536:	e8 a5 09 00 00       	call   3ee0 <printf>
    exit(0);
    353b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3542:	e8 4b 08 00 00       	call   3d92 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    exit(0);
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    3547:	50                   	push   %eax
    3548:	53                   	push   %ebx
    3549:	68 b4 57 00 00       	push   $0x57b4
    354e:	ff 35 94 62 00 00    	pushl  0x6294
    3554:	e8 87 09 00 00       	call   3ee0 <printf>
    exit(0);
    3559:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3560:	e8 2d 08 00 00       	call   3d92 <exit>

  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    3565:	83 ec 08             	sub    $0x8,%esp
    3568:	68 49 50 00 00       	push   $0x5049
    356d:	ff 35 94 62 00 00    	pushl  0x6294
    3573:	e8 68 09 00 00       	call   3ee0 <printf>
    exit(0);
    3578:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    357f:	e8 0e 08 00 00       	call   3d92 <exit>
#define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3584:	83 ec 08             	sub    $0x8,%esp
    3587:	68 74 57 00 00       	push   $0x5774
    358c:	ff 35 94 62 00 00    	pushl  0x6294
    3592:	e8 49 09 00 00       	call   3ee0 <printf>
    exit(0);
    3597:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    359e:	e8 ef 07 00 00       	call   3d92 <exit>
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    exit(0);
  }
  if(pid == 0)
    exit(0);
    35a3:	83 ec 0c             	sub    $0xc,%esp
    35a6:	6a 00                	push   $0x0
    35a8:	e8 e5 07 00 00       	call   3d92 <exit>
    exit(0);
  }
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    35ad:	83 ec 08             	sub    $0x8,%esp
    35b0:	68 2d 50 00 00       	push   $0x502d
    35b5:	ff 35 94 62 00 00    	pushl  0x6294
    35bb:	e8 20 09 00 00       	call   3ee0 <printf>
    exit(0);
    35c0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35c7:	e8 c6 07 00 00       	call   3d92 <exit>
    *b = 1;
    a = b + 1;
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    35cc:	83 ec 08             	sub    $0x8,%esp
    35cf:	68 16 50 00 00       	push   $0x5016
    35d4:	ff 35 94 62 00 00    	pushl  0x6294
    35da:	e8 01 09 00 00       	call   3ee0 <printf>
    exit(0);
    35df:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35e6:	e8 a7 07 00 00       	call   3d92 <exit>
    35eb:	90                   	nop
    35ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000035f0 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    35f0:	55                   	push   %ebp
    35f1:	89 e5                	mov    %esp,%ebp
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    35f3:	5d                   	pop    %ebp
    35f4:	c3                   	ret    
    35f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    35f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003600 <validatetest>:

void
validatetest(void)
{
    3600:	55                   	push   %ebp
    3601:	89 e5                	mov    %esp,%ebp
    3603:	56                   	push   %esi
    3604:	53                   	push   %ebx
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3605:	31 db                	xor    %ebx,%ebx
validatetest(void)
{
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3607:	83 ec 08             	sub    $0x8,%esp
    360a:	68 a6 50 00 00       	push   $0x50a6
    360f:	ff 35 94 62 00 00    	pushl  0x6294
    3615:	e8 c6 08 00 00       	call   3ee0 <printf>
    361a:	83 c4 10             	add    $0x10,%esp
    361d:	8d 76 00             	lea    0x0(%esi),%esi
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
    3620:	e8 65 07 00 00       	call   3d8a <fork>
    3625:	85 c0                	test   %eax,%eax
    3627:	89 c6                	mov    %eax,%esi
    3629:	74 63                	je     368e <validatetest+0x8e>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit(0);
    }
    sleep(0);
    362b:	83 ec 0c             	sub    $0xc,%esp
    362e:	6a 00                	push   $0x0
    3630:	e8 ed 07 00 00       	call   3e22 <sleep>
    sleep(0);
    3635:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    363c:	e8 e1 07 00 00       	call   3e22 <sleep>
    kill(pid);
    3641:	89 34 24             	mov    %esi,(%esp)
    3644:	e8 79 07 00 00       	call   3dc2 <kill>
    wait();
    3649:	e8 4c 07 00 00       	call   3d9a <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    364e:	58                   	pop    %eax
    364f:	5a                   	pop    %edx
    3650:	53                   	push   %ebx
    3651:	68 b5 50 00 00       	push   $0x50b5
    3656:	e8 97 07 00 00       	call   3df2 <link>
    365b:	83 c4 10             	add    $0x10,%esp
    365e:	83 f8 ff             	cmp    $0xffffffff,%eax
    3661:	75 35                	jne    3698 <validatetest+0x98>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3663:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    3669:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    366f:	75 af                	jne    3620 <validatetest+0x20>
      printf(stdout, "link should not succeed\n");
      exit(0);
    }
  }

  printf(stdout, "validate ok\n");
    3671:	83 ec 08             	sub    $0x8,%esp
    3674:	68 d9 50 00 00       	push   $0x50d9
    3679:	ff 35 94 62 00 00    	pushl  0x6294
    367f:	e8 5c 08 00 00       	call   3ee0 <printf>
}
    3684:	83 c4 10             	add    $0x10,%esp
    3687:	8d 65 f8             	lea    -0x8(%ebp),%esp
    368a:	5b                   	pop    %ebx
    368b:	5e                   	pop    %esi
    368c:	5d                   	pop    %ebp
    368d:	c3                   	ret    

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit(0);
    368e:	83 ec 0c             	sub    $0xc,%esp
    3691:	6a 00                	push   $0x0
    3693:	e8 fa 06 00 00       	call   3d92 <exit>
    kill(pid);
    wait();

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    3698:	83 ec 08             	sub    $0x8,%esp
    369b:	68 c0 50 00 00       	push   $0x50c0
    36a0:	ff 35 94 62 00 00    	pushl  0x6294
    36a6:	e8 35 08 00 00       	call   3ee0 <printf>
      exit(0);
    36ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36b2:	e8 db 06 00 00       	call   3d92 <exit>
    36b7:	89 f6                	mov    %esi,%esi
    36b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036c0 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    36c0:	55                   	push   %ebp
    36c1:	89 e5                	mov    %esp,%ebp
    36c3:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
    36c6:	68 e6 50 00 00       	push   $0x50e6
    36cb:	ff 35 94 62 00 00    	pushl  0x6294
    36d1:	e8 0a 08 00 00       	call   3ee0 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    36d6:	83 c4 10             	add    $0x10,%esp
    36d9:	80 3d 60 63 00 00 00 	cmpb   $0x0,0x6360
    36e0:	75 35                	jne    3717 <bsstest+0x57>
    36e2:	b8 61 63 00 00       	mov    $0x6361,%eax
    36e7:	89 f6                	mov    %esi,%esi
    36e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    36f0:	80 38 00             	cmpb   $0x0,(%eax)
    36f3:	75 22                	jne    3717 <bsstest+0x57>
    36f5:	83 c0 01             	add    $0x1,%eax
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    36f8:	3d 70 8a 00 00       	cmp    $0x8a70,%eax
    36fd:	75 f1                	jne    36f0 <bsstest+0x30>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit(0);
    }
  }
  printf(stdout, "bss test ok\n");
    36ff:	83 ec 08             	sub    $0x8,%esp
    3702:	68 01 51 00 00       	push   $0x5101
    3707:	ff 35 94 62 00 00    	pushl  0x6294
    370d:	e8 ce 07 00 00       	call   3ee0 <printf>
}
    3712:	83 c4 10             	add    $0x10,%esp
    3715:	c9                   	leave  
    3716:	c3                   	ret    
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    3717:	83 ec 08             	sub    $0x8,%esp
    371a:	68 f0 50 00 00       	push   $0x50f0
    371f:	ff 35 94 62 00 00    	pushl  0x6294
    3725:	e8 b6 07 00 00       	call   3ee0 <printf>
      exit(0);
    372a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3731:	e8 5c 06 00 00       	call   3d92 <exit>
    3736:	8d 76 00             	lea    0x0(%esi),%esi
    3739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003740 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    3740:	55                   	push   %ebp
    3741:	89 e5                	mov    %esp,%ebp
    3743:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
    3746:	68 0e 51 00 00       	push   $0x510e
    374b:	e8 92 06 00 00       	call   3de2 <unlink>
  pid = fork();
    3750:	e8 35 06 00 00       	call   3d8a <fork>
  if(pid == 0){
    3755:	83 c4 10             	add    $0x10,%esp
    3758:	85 c0                	test   %eax,%eax
    375a:	74 3f                	je     379b <bigargtest+0x5b>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit(0);
  } else if(pid < 0){
    375c:	0f 88 d0 00 00 00    	js     3832 <bigargtest+0xf2>
    printf(stdout, "bigargtest: fork failed\n");
    exit(0);
  }
  wait();
    3762:	e8 33 06 00 00       	call   3d9a <wait>
  fd = open("bigarg-ok", 0);
    3767:	83 ec 08             	sub    $0x8,%esp
    376a:	6a 00                	push   $0x0
    376c:	68 0e 51 00 00       	push   $0x510e
    3771:	e8 5c 06 00 00       	call   3dd2 <open>
  if(fd < 0){
    3776:	83 c4 10             	add    $0x10,%esp
    3779:	85 c0                	test   %eax,%eax
    377b:	0f 88 93 00 00 00    	js     3814 <bigargtest+0xd4>
    printf(stdout, "bigarg test failed!\n");
    exit(0);
  }
  close(fd);
    3781:	83 ec 0c             	sub    $0xc,%esp
    3784:	50                   	push   %eax
    3785:	e8 30 06 00 00       	call   3dba <close>
  unlink("bigarg-ok");
    378a:	c7 04 24 0e 51 00 00 	movl   $0x510e,(%esp)
    3791:	e8 4c 06 00 00       	call   3de2 <unlink>
}
    3796:	83 c4 10             	add    $0x10,%esp
    3799:	c9                   	leave  
    379a:	c3                   	ret    
    379b:	b8 c0 62 00 00       	mov    $0x62c0,%eax
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    37a0:	c7 00 68 58 00 00    	movl   $0x5868,(%eax)
    37a6:	83 c0 04             	add    $0x4,%eax
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    37a9:	3d 3c 63 00 00       	cmp    $0x633c,%eax
    37ae:	75 f0                	jne    37a0 <bigargtest+0x60>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    37b0:	51                   	push   %ecx
    37b1:	51                   	push   %ecx
    37b2:	68 18 51 00 00       	push   $0x5118
    37b7:	ff 35 94 62 00 00    	pushl  0x6294
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    37bd:	c7 05 3c 63 00 00 00 	movl   $0x0,0x633c
    37c4:	00 00 00 
    printf(stdout, "bigarg test\n");
    37c7:	e8 14 07 00 00       	call   3ee0 <printf>
    exec("echo", args);
    37cc:	58                   	pop    %eax
    37cd:	5a                   	pop    %edx
    37ce:	68 c0 62 00 00       	push   $0x62c0
    37d3:	68 e5 42 00 00       	push   $0x42e5
    37d8:	e8 ed 05 00 00       	call   3dca <exec>
    printf(stdout, "bigarg test ok\n");
    37dd:	59                   	pop    %ecx
    37de:	58                   	pop    %eax
    37df:	68 25 51 00 00       	push   $0x5125
    37e4:	ff 35 94 62 00 00    	pushl  0x6294
    37ea:	e8 f1 06 00 00       	call   3ee0 <printf>
    fd = open("bigarg-ok", O_CREATE);
    37ef:	58                   	pop    %eax
    37f0:	5a                   	pop    %edx
    37f1:	68 00 02 00 00       	push   $0x200
    37f6:	68 0e 51 00 00       	push   $0x510e
    37fb:	e8 d2 05 00 00       	call   3dd2 <open>
    close(fd);
    3800:	89 04 24             	mov    %eax,(%esp)
    3803:	e8 b2 05 00 00       	call   3dba <close>
    exit(0);
    3808:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    380f:	e8 7e 05 00 00       	call   3d92 <exit>
    exit(0);
  }
  wait();
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    3814:	50                   	push   %eax
    3815:	50                   	push   %eax
    3816:	68 4e 51 00 00       	push   $0x514e
    381b:	ff 35 94 62 00 00    	pushl  0x6294
    3821:	e8 ba 06 00 00       	call   3ee0 <printf>
    exit(0);
    3826:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    382d:	e8 60 05 00 00       	call   3d92 <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit(0);
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    3832:	52                   	push   %edx
    3833:	52                   	push   %edx
    3834:	68 35 51 00 00       	push   $0x5135
    3839:	ff 35 94 62 00 00    	pushl  0x6294
    383f:	e8 9c 06 00 00       	call   3ee0 <printf>
    exit(0);
    3844:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    384b:	e8 42 05 00 00       	call   3d92 <exit>

00003850 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3850:	55                   	push   %ebp
    3851:	89 e5                	mov    %esp,%ebp
    3853:	57                   	push   %edi
    3854:	56                   	push   %esi
    3855:	53                   	push   %ebx
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3856:	31 db                	xor    %ebx,%ebx

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3858:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    385b:	68 63 51 00 00       	push   $0x5163
    3860:	6a 01                	push   $0x1
    3862:	e8 79 06 00 00       	call   3ee0 <printf>
    3867:	83 c4 10             	add    $0x10,%esp
    386a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3870:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3875:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    3877:	89 d9                	mov    %ebx,%ecx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3879:	f7 eb                	imul   %ebx
    387b:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    387e:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3880:	83 ec 04             	sub    $0x4,%esp

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    3883:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    3887:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    388b:	c1 fa 06             	sar    $0x6,%edx
    388e:	29 f2                	sub    %esi,%edx
    3890:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3893:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3899:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    389c:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    38a1:	29 d1                	sub    %edx,%ecx
    38a3:	f7 e9                	imul   %ecx
    38a5:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    38a8:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    38ad:	c1 fa 05             	sar    $0x5,%edx
    38b0:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    38b2:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    38b7:	83 c2 30             	add    $0x30,%edx
    38ba:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    38bd:	f7 eb                	imul   %ebx
    38bf:	c1 fa 05             	sar    $0x5,%edx
    38c2:	29 f2                	sub    %esi,%edx
    38c4:	6b d2 64             	imul   $0x64,%edx,%edx
    38c7:	29 d7                	sub    %edx,%edi
    38c9:	89 f8                	mov    %edi,%eax
    38cb:	c1 ff 1f             	sar    $0x1f,%edi
    38ce:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    38d0:	89 d8                	mov    %ebx,%eax
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    38d2:	c1 fa 02             	sar    $0x2,%edx
    38d5:	29 fa                	sub    %edi,%edx
    38d7:	83 c2 30             	add    $0x30,%edx
    38da:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    38dd:	f7 e9                	imul   %ecx
    38df:	89 d9                	mov    %ebx,%ecx
    38e1:	c1 fa 02             	sar    $0x2,%edx
    38e4:	29 f2                	sub    %esi,%edx
    38e6:	8d 04 92             	lea    (%edx,%edx,4),%eax
    38e9:	01 c0                	add    %eax,%eax
    38eb:	29 c1                	sub    %eax,%ecx
    38ed:	89 c8                	mov    %ecx,%eax
    38ef:	83 c0 30             	add    $0x30,%eax
    38f2:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    38f5:	8d 45 a8             	lea    -0x58(%ebp),%eax
    38f8:	50                   	push   %eax
    38f9:	68 70 51 00 00       	push   $0x5170
    38fe:	6a 01                	push   $0x1
    3900:	e8 db 05 00 00       	call   3ee0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3905:	58                   	pop    %eax
    3906:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3909:	5a                   	pop    %edx
    390a:	68 02 02 00 00       	push   $0x202
    390f:	50                   	push   %eax
    3910:	e8 bd 04 00 00       	call   3dd2 <open>
    if(fd < 0){
    3915:	83 c4 10             	add    $0x10,%esp
    3918:	85 c0                	test   %eax,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    391a:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    391c:	78 50                	js     396e <fsfull+0x11e>
    391e:	31 f6                	xor    %esi,%esi
    3920:	eb 08                	jmp    392a <fsfull+0xda>
    3922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    3928:	01 c6                	add    %eax,%esi
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    392a:	83 ec 04             	sub    $0x4,%esp
    392d:	68 00 02 00 00       	push   $0x200
    3932:	68 80 8a 00 00       	push   $0x8a80
    3937:	57                   	push   %edi
    3938:	e8 75 04 00 00       	call   3db2 <write>
      if(cc < 512)
    393d:	83 c4 10             	add    $0x10,%esp
    3940:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3945:	7f e1                	jg     3928 <fsfull+0xd8>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3947:	83 ec 04             	sub    $0x4,%esp
    394a:	56                   	push   %esi
    394b:	68 8c 51 00 00       	push   $0x518c
    3950:	6a 01                	push   $0x1
    3952:	e8 89 05 00 00       	call   3ee0 <printf>
    close(fd);
    3957:	89 3c 24             	mov    %edi,(%esp)
    395a:	e8 5b 04 00 00       	call   3dba <close>
    if(total == 0)
    395f:	83 c4 10             	add    $0x10,%esp
    3962:	85 f6                	test   %esi,%esi
    3964:	74 22                	je     3988 <fsfull+0x138>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3966:	83 c3 01             	add    $0x1,%ebx
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3969:	e9 02 ff ff ff       	jmp    3870 <fsfull+0x20>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    396e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3971:	83 ec 04             	sub    $0x4,%esp
    3974:	50                   	push   %eax
    3975:	68 7c 51 00 00       	push   $0x517c
    397a:	6a 01                	push   $0x1
    397c:	e8 5f 05 00 00       	call   3ee0 <printf>
      break;
    3981:	83 c4 10             	add    $0x10,%esp
    3984:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3988:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    398d:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    398f:	89 d9                	mov    %ebx,%ecx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3991:	f7 eb                	imul   %ebx
    3993:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    3996:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    3998:	83 ec 0c             	sub    $0xc,%esp
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    399b:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    399f:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    39a3:	c1 fa 06             	sar    $0x6,%edx
    39a6:	29 f2                	sub    %esi,%edx
    39a8:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    39ab:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    39b1:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    39b4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    39b9:	29 d1                	sub    %edx,%ecx
    39bb:	f7 e9                	imul   %ecx
    39bd:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    39c0:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    39c5:	c1 fa 05             	sar    $0x5,%edx
    39c8:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    39ca:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    39cf:	83 c2 30             	add    $0x30,%edx
    39d2:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    39d5:	f7 eb                	imul   %ebx
    39d7:	c1 fa 05             	sar    $0x5,%edx
    39da:	29 f2                	sub    %esi,%edx
    39dc:	6b d2 64             	imul   $0x64,%edx,%edx
    39df:	29 d7                	sub    %edx,%edi
    39e1:	89 f8                	mov    %edi,%eax
    39e3:	c1 ff 1f             	sar    $0x1f,%edi
    39e6:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    39e8:	89 d8                	mov    %ebx,%eax
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    39ea:	c1 fa 02             	sar    $0x2,%edx
    39ed:	29 fa                	sub    %edi,%edx
    39ef:	83 c2 30             	add    $0x30,%edx
    39f2:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    39f5:	f7 e9                	imul   %ecx
    39f7:	89 d9                	mov    %ebx,%ecx
    name[5] = '\0';
    unlink(name);
    nfiles--;
    39f9:	83 eb 01             	sub    $0x1,%ebx
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    39fc:	c1 fa 02             	sar    $0x2,%edx
    39ff:	29 f2                	sub    %esi,%edx
    3a01:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3a04:	01 c0                	add    %eax,%eax
    3a06:	29 c1                	sub    %eax,%ecx
    3a08:	89 c8                	mov    %ecx,%eax
    3a0a:	83 c0 30             	add    $0x30,%eax
    3a0d:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    unlink(name);
    3a10:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3a13:	50                   	push   %eax
    3a14:	e8 c9 03 00 00       	call   3de2 <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3a19:	83 c4 10             	add    $0x10,%esp
    3a1c:	83 fb ff             	cmp    $0xffffffff,%ebx
    3a1f:	0f 85 63 ff ff ff    	jne    3988 <fsfull+0x138>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3a25:	83 ec 08             	sub    $0x8,%esp
    3a28:	68 9c 51 00 00       	push   $0x519c
    3a2d:	6a 01                	push   $0x1
    3a2f:	e8 ac 04 00 00       	call   3ee0 <printf>
}
    3a34:	83 c4 10             	add    $0x10,%esp
    3a37:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3a3a:	5b                   	pop    %ebx
    3a3b:	5e                   	pop    %esi
    3a3c:	5f                   	pop    %edi
    3a3d:	5d                   	pop    %ebp
    3a3e:	c3                   	ret    
    3a3f:	90                   	nop

00003a40 <uio>:

void
uio()
{
    3a40:	55                   	push   %ebp
    3a41:	89 e5                	mov    %esp,%ebp
    3a43:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    3a46:	68 b2 51 00 00       	push   $0x51b2
    3a4b:	6a 01                	push   $0x1
    3a4d:	e8 8e 04 00 00       	call   3ee0 <printf>
  pid = fork();
    3a52:	e8 33 03 00 00       	call   3d8a <fork>
  if(pid == 0){
    3a57:	83 c4 10             	add    $0x10,%esp
    3a5a:	85 c0                	test   %eax,%eax
    3a5c:	74 1b                	je     3a79 <uio+0x39>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit(0);
  } else if(pid < 0){
    3a5e:	78 44                	js     3aa4 <uio+0x64>
    printf (1, "fork failed\n");
    exit(0);
  }
  wait();
    3a60:	e8 35 03 00 00       	call   3d9a <wait>
  printf(1, "uio test done\n");
    3a65:	83 ec 08             	sub    $0x8,%esp
    3a68:	68 bc 51 00 00       	push   $0x51bc
    3a6d:	6a 01                	push   $0x1
    3a6f:	e8 6c 04 00 00       	call   3ee0 <printf>
}
    3a74:	83 c4 10             	add    $0x10,%esp
    3a77:	c9                   	leave  
    3a78:	c3                   	ret    
  pid = fork();
  if(pid == 0){
    port = RTC_ADDR;
    val = 0x09;  /* year */
    /* http://wiki.osdev.org/Inline_Assembly/Examples */
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    3a79:	ba 70 00 00 00       	mov    $0x70,%edx
    3a7e:	b8 09 00 00 00       	mov    $0x9,%eax
    3a83:	ee                   	out    %al,(%dx)
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    3a84:	ba 71 00 00 00       	mov    $0x71,%edx
    3a89:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    3a8a:	52                   	push   %edx
    3a8b:	52                   	push   %edx
    3a8c:	68 48 59 00 00       	push   $0x5948
    3a91:	6a 01                	push   $0x1
    3a93:	e8 48 04 00 00       	call   3ee0 <printf>
    exit(0);
    3a98:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a9f:	e8 ee 02 00 00       	call   3d92 <exit>
  } else if(pid < 0){
    printf (1, "fork failed\n");
    3aa4:	50                   	push   %eax
    3aa5:	50                   	push   %eax
    3aa6:	68 41 51 00 00       	push   $0x5141
    3aab:	6a 01                	push   $0x1
    3aad:	e8 2e 04 00 00       	call   3ee0 <printf>
    exit(0);
    3ab2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ab9:	e8 d4 02 00 00       	call   3d92 <exit>
    3abe:	66 90                	xchg   %ax,%ax

00003ac0 <argptest>:
  wait();
  printf(1, "uio test done\n");
}

void argptest()
{
    3ac0:	55                   	push   %ebp
    3ac1:	89 e5                	mov    %esp,%ebp
    3ac3:	53                   	push   %ebx
    3ac4:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  fd = open("init", O_RDONLY);
    3ac7:	6a 00                	push   $0x0
    3ac9:	68 cb 51 00 00       	push   $0x51cb
    3ace:	e8 ff 02 00 00       	call   3dd2 <open>
  if (fd < 0) {
    3ad3:	83 c4 10             	add    $0x10,%esp
    3ad6:	85 c0                	test   %eax,%eax
    3ad8:	78 39                	js     3b13 <argptest+0x53>
    printf(2, "open failed\n");
    exit(0);
  }
  read(fd, sbrk(0) - 1, -1);
    3ada:	83 ec 0c             	sub    $0xc,%esp
    3add:	89 c3                	mov    %eax,%ebx
    3adf:	6a 00                	push   $0x0
    3ae1:	e8 34 03 00 00       	call   3e1a <sbrk>
    3ae6:	83 c4 0c             	add    $0xc,%esp
    3ae9:	83 e8 01             	sub    $0x1,%eax
    3aec:	6a ff                	push   $0xffffffff
    3aee:	50                   	push   %eax
    3aef:	53                   	push   %ebx
    3af0:	e8 b5 02 00 00       	call   3daa <read>
  close(fd);
    3af5:	89 1c 24             	mov    %ebx,(%esp)
    3af8:	e8 bd 02 00 00       	call   3dba <close>
  printf(1, "arg test passed\n");
    3afd:	58                   	pop    %eax
    3afe:	5a                   	pop    %edx
    3aff:	68 dd 51 00 00       	push   $0x51dd
    3b04:	6a 01                	push   $0x1
    3b06:	e8 d5 03 00 00       	call   3ee0 <printf>
}
    3b0b:	83 c4 10             	add    $0x10,%esp
    3b0e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3b11:	c9                   	leave  
    3b12:	c3                   	ret    
void argptest()
{
  int fd;
  fd = open("init", O_RDONLY);
  if (fd < 0) {
    printf(2, "open failed\n");
    3b13:	51                   	push   %ecx
    3b14:	51                   	push   %ecx
    3b15:	68 d0 51 00 00       	push   $0x51d0
    3b1a:	6a 02                	push   $0x2
    3b1c:	e8 bf 03 00 00       	call   3ee0 <printf>
    exit(0);
    3b21:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b28:	e8 65 02 00 00       	call   3d92 <exit>
    3b2d:	8d 76 00             	lea    0x0(%esi),%esi

00003b30 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3b30:	69 05 90 62 00 00 0d 	imul   $0x19660d,0x6290,%eax
    3b37:	66 19 00 
}

unsigned long randstate = 1;
unsigned int
rand()
{
    3b3a:	55                   	push   %ebp
    3b3b:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
    3b3d:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3b3e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3b43:	a3 90 62 00 00       	mov    %eax,0x6290
  return randstate;
}
    3b48:	c3                   	ret    
    3b49:	66 90                	xchg   %ax,%ax
    3b4b:	66 90                	xchg   %ax,%ax
    3b4d:	66 90                	xchg   %ax,%ax
    3b4f:	90                   	nop

00003b50 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3b50:	55                   	push   %ebp
    3b51:	89 e5                	mov    %esp,%ebp
    3b53:	53                   	push   %ebx
    3b54:	8b 45 08             	mov    0x8(%ebp),%eax
    3b57:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    3b5a:	89 c2                	mov    %eax,%edx
    3b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3b60:	83 c1 01             	add    $0x1,%ecx
    3b63:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    3b67:	83 c2 01             	add    $0x1,%edx
    3b6a:	84 db                	test   %bl,%bl
    3b6c:	88 5a ff             	mov    %bl,-0x1(%edx)
    3b6f:	75 ef                	jne    3b60 <strcpy+0x10>
    ;
  return os;
}
    3b71:	5b                   	pop    %ebx
    3b72:	5d                   	pop    %ebp
    3b73:	c3                   	ret    
    3b74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3b7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003b80 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3b80:	55                   	push   %ebp
    3b81:	89 e5                	mov    %esp,%ebp
    3b83:	56                   	push   %esi
    3b84:	53                   	push   %ebx
    3b85:	8b 55 08             	mov    0x8(%ebp),%edx
    3b88:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    3b8b:	0f b6 02             	movzbl (%edx),%eax
    3b8e:	0f b6 19             	movzbl (%ecx),%ebx
    3b91:	84 c0                	test   %al,%al
    3b93:	75 1e                	jne    3bb3 <strcmp+0x33>
    3b95:	eb 29                	jmp    3bc0 <strcmp+0x40>
    3b97:	89 f6                	mov    %esi,%esi
    3b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    3ba0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3ba3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    3ba6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3ba9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    3bad:	84 c0                	test   %al,%al
    3baf:	74 0f                	je     3bc0 <strcmp+0x40>
    3bb1:	89 f1                	mov    %esi,%ecx
    3bb3:	38 d8                	cmp    %bl,%al
    3bb5:	74 e9                	je     3ba0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3bb7:	29 d8                	sub    %ebx,%eax
}
    3bb9:	5b                   	pop    %ebx
    3bba:	5e                   	pop    %esi
    3bbb:	5d                   	pop    %ebp
    3bbc:	c3                   	ret    
    3bbd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3bc0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3bc2:	29 d8                	sub    %ebx,%eax
}
    3bc4:	5b                   	pop    %ebx
    3bc5:	5e                   	pop    %esi
    3bc6:	5d                   	pop    %ebp
    3bc7:	c3                   	ret    
    3bc8:	90                   	nop
    3bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003bd0 <strlen>:

uint
strlen(char *s)
{
    3bd0:	55                   	push   %ebp
    3bd1:	89 e5                	mov    %esp,%ebp
    3bd3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    3bd6:	80 39 00             	cmpb   $0x0,(%ecx)
    3bd9:	74 12                	je     3bed <strlen+0x1d>
    3bdb:	31 d2                	xor    %edx,%edx
    3bdd:	8d 76 00             	lea    0x0(%esi),%esi
    3be0:	83 c2 01             	add    $0x1,%edx
    3be3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    3be7:	89 d0                	mov    %edx,%eax
    3be9:	75 f5                	jne    3be0 <strlen+0x10>
    ;
  return n;
}
    3beb:	5d                   	pop    %ebp
    3bec:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    3bed:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    3bef:	5d                   	pop    %ebp
    3bf0:	c3                   	ret    
    3bf1:	eb 0d                	jmp    3c00 <memset>
    3bf3:	90                   	nop
    3bf4:	90                   	nop
    3bf5:	90                   	nop
    3bf6:	90                   	nop
    3bf7:	90                   	nop
    3bf8:	90                   	nop
    3bf9:	90                   	nop
    3bfa:	90                   	nop
    3bfb:	90                   	nop
    3bfc:	90                   	nop
    3bfd:	90                   	nop
    3bfe:	90                   	nop
    3bff:	90                   	nop

00003c00 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3c00:	55                   	push   %ebp
    3c01:	89 e5                	mov    %esp,%ebp
    3c03:	57                   	push   %edi
    3c04:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3c07:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3c0a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c0d:	89 d7                	mov    %edx,%edi
    3c0f:	fc                   	cld    
    3c10:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3c12:	89 d0                	mov    %edx,%eax
    3c14:	5f                   	pop    %edi
    3c15:	5d                   	pop    %ebp
    3c16:	c3                   	ret    
    3c17:	89 f6                	mov    %esi,%esi
    3c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003c20 <strchr>:

char*
strchr(const char *s, char c)
{
    3c20:	55                   	push   %ebp
    3c21:	89 e5                	mov    %esp,%ebp
    3c23:	53                   	push   %ebx
    3c24:	8b 45 08             	mov    0x8(%ebp),%eax
    3c27:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    3c2a:	0f b6 10             	movzbl (%eax),%edx
    3c2d:	84 d2                	test   %dl,%dl
    3c2f:	74 1d                	je     3c4e <strchr+0x2e>
    if(*s == c)
    3c31:	38 d3                	cmp    %dl,%bl
    3c33:	89 d9                	mov    %ebx,%ecx
    3c35:	75 0d                	jne    3c44 <strchr+0x24>
    3c37:	eb 17                	jmp    3c50 <strchr+0x30>
    3c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3c40:	38 ca                	cmp    %cl,%dl
    3c42:	74 0c                	je     3c50 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3c44:	83 c0 01             	add    $0x1,%eax
    3c47:	0f b6 10             	movzbl (%eax),%edx
    3c4a:	84 d2                	test   %dl,%dl
    3c4c:	75 f2                	jne    3c40 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    3c4e:	31 c0                	xor    %eax,%eax
}
    3c50:	5b                   	pop    %ebx
    3c51:	5d                   	pop    %ebp
    3c52:	c3                   	ret    
    3c53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003c60 <gets>:

char*
gets(char *buf, int max)
{
    3c60:	55                   	push   %ebp
    3c61:	89 e5                	mov    %esp,%ebp
    3c63:	57                   	push   %edi
    3c64:	56                   	push   %esi
    3c65:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3c66:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    3c68:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    3c6b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3c6e:	eb 29                	jmp    3c99 <gets+0x39>
    cc = read(0, &c, 1);
    3c70:	83 ec 04             	sub    $0x4,%esp
    3c73:	6a 01                	push   $0x1
    3c75:	57                   	push   %edi
    3c76:	6a 00                	push   $0x0
    3c78:	e8 2d 01 00 00       	call   3daa <read>
    if(cc < 1)
    3c7d:	83 c4 10             	add    $0x10,%esp
    3c80:	85 c0                	test   %eax,%eax
    3c82:	7e 1d                	jle    3ca1 <gets+0x41>
      break;
    buf[i++] = c;
    3c84:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3c88:	8b 55 08             	mov    0x8(%ebp),%edx
    3c8b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    3c8d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    3c8f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    3c93:	74 1b                	je     3cb0 <gets+0x50>
    3c95:	3c 0d                	cmp    $0xd,%al
    3c97:	74 17                	je     3cb0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3c99:	8d 5e 01             	lea    0x1(%esi),%ebx
    3c9c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    3c9f:	7c cf                	jl     3c70 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3ca1:	8b 45 08             	mov    0x8(%ebp),%eax
    3ca4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3ca8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3cab:	5b                   	pop    %ebx
    3cac:	5e                   	pop    %esi
    3cad:	5f                   	pop    %edi
    3cae:	5d                   	pop    %ebp
    3caf:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3cb0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3cb3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3cb5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3cb9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3cbc:	5b                   	pop    %ebx
    3cbd:	5e                   	pop    %esi
    3cbe:	5f                   	pop    %edi
    3cbf:	5d                   	pop    %ebp
    3cc0:	c3                   	ret    
    3cc1:	eb 0d                	jmp    3cd0 <stat>
    3cc3:	90                   	nop
    3cc4:	90                   	nop
    3cc5:	90                   	nop
    3cc6:	90                   	nop
    3cc7:	90                   	nop
    3cc8:	90                   	nop
    3cc9:	90                   	nop
    3cca:	90                   	nop
    3ccb:	90                   	nop
    3ccc:	90                   	nop
    3ccd:	90                   	nop
    3cce:	90                   	nop
    3ccf:	90                   	nop

00003cd0 <stat>:

int
stat(char *n, struct stat *st)
{
    3cd0:	55                   	push   %ebp
    3cd1:	89 e5                	mov    %esp,%ebp
    3cd3:	56                   	push   %esi
    3cd4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3cd5:	83 ec 08             	sub    $0x8,%esp
    3cd8:	6a 00                	push   $0x0
    3cda:	ff 75 08             	pushl  0x8(%ebp)
    3cdd:	e8 f0 00 00 00       	call   3dd2 <open>
  if(fd < 0)
    3ce2:	83 c4 10             	add    $0x10,%esp
    3ce5:	85 c0                	test   %eax,%eax
    3ce7:	78 27                	js     3d10 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    3ce9:	83 ec 08             	sub    $0x8,%esp
    3cec:	ff 75 0c             	pushl  0xc(%ebp)
    3cef:	89 c3                	mov    %eax,%ebx
    3cf1:	50                   	push   %eax
    3cf2:	e8 f3 00 00 00       	call   3dea <fstat>
    3cf7:	89 c6                	mov    %eax,%esi
  close(fd);
    3cf9:	89 1c 24             	mov    %ebx,(%esp)
    3cfc:	e8 b9 00 00 00       	call   3dba <close>
  return r;
    3d01:	83 c4 10             	add    $0x10,%esp
    3d04:	89 f0                	mov    %esi,%eax
}
    3d06:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3d09:	5b                   	pop    %ebx
    3d0a:	5e                   	pop    %esi
    3d0b:	5d                   	pop    %ebp
    3d0c:	c3                   	ret    
    3d0d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    3d10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3d15:	eb ef                	jmp    3d06 <stat+0x36>
    3d17:	89 f6                	mov    %esi,%esi
    3d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003d20 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    3d20:	55                   	push   %ebp
    3d21:	89 e5                	mov    %esp,%ebp
    3d23:	53                   	push   %ebx
    3d24:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3d27:	0f be 11             	movsbl (%ecx),%edx
    3d2a:	8d 42 d0             	lea    -0x30(%edx),%eax
    3d2d:	3c 09                	cmp    $0x9,%al
    3d2f:	b8 00 00 00 00       	mov    $0x0,%eax
    3d34:	77 1f                	ja     3d55 <atoi+0x35>
    3d36:	8d 76 00             	lea    0x0(%esi),%esi
    3d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    3d40:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3d43:	83 c1 01             	add    $0x1,%ecx
    3d46:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3d4a:	0f be 11             	movsbl (%ecx),%edx
    3d4d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3d50:	80 fb 09             	cmp    $0x9,%bl
    3d53:	76 eb                	jbe    3d40 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    3d55:	5b                   	pop    %ebx
    3d56:	5d                   	pop    %ebp
    3d57:	c3                   	ret    
    3d58:	90                   	nop
    3d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003d60 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3d60:	55                   	push   %ebp
    3d61:	89 e5                	mov    %esp,%ebp
    3d63:	56                   	push   %esi
    3d64:	53                   	push   %ebx
    3d65:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3d68:	8b 45 08             	mov    0x8(%ebp),%eax
    3d6b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3d6e:	85 db                	test   %ebx,%ebx
    3d70:	7e 14                	jle    3d86 <memmove+0x26>
    3d72:	31 d2                	xor    %edx,%edx
    3d74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    3d78:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    3d7c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    3d7f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3d82:	39 da                	cmp    %ebx,%edx
    3d84:	75 f2                	jne    3d78 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    3d86:	5b                   	pop    %ebx
    3d87:	5e                   	pop    %esi
    3d88:	5d                   	pop    %ebp
    3d89:	c3                   	ret    

00003d8a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3d8a:	b8 01 00 00 00       	mov    $0x1,%eax
    3d8f:	cd 40                	int    $0x40
    3d91:	c3                   	ret    

00003d92 <exit>:
SYSCALL(exit)
    3d92:	b8 02 00 00 00       	mov    $0x2,%eax
    3d97:	cd 40                	int    $0x40
    3d99:	c3                   	ret    

00003d9a <wait>:
SYSCALL(wait)
    3d9a:	b8 03 00 00 00       	mov    $0x3,%eax
    3d9f:	cd 40                	int    $0x40
    3da1:	c3                   	ret    

00003da2 <pipe>:
SYSCALL(pipe)
    3da2:	b8 04 00 00 00       	mov    $0x4,%eax
    3da7:	cd 40                	int    $0x40
    3da9:	c3                   	ret    

00003daa <read>:
SYSCALL(read)
    3daa:	b8 05 00 00 00       	mov    $0x5,%eax
    3daf:	cd 40                	int    $0x40
    3db1:	c3                   	ret    

00003db2 <write>:
SYSCALL(write)
    3db2:	b8 10 00 00 00       	mov    $0x10,%eax
    3db7:	cd 40                	int    $0x40
    3db9:	c3                   	ret    

00003dba <close>:
SYSCALL(close)
    3dba:	b8 15 00 00 00       	mov    $0x15,%eax
    3dbf:	cd 40                	int    $0x40
    3dc1:	c3                   	ret    

00003dc2 <kill>:
SYSCALL(kill)
    3dc2:	b8 06 00 00 00       	mov    $0x6,%eax
    3dc7:	cd 40                	int    $0x40
    3dc9:	c3                   	ret    

00003dca <exec>:
SYSCALL(exec)
    3dca:	b8 07 00 00 00       	mov    $0x7,%eax
    3dcf:	cd 40                	int    $0x40
    3dd1:	c3                   	ret    

00003dd2 <open>:
SYSCALL(open)
    3dd2:	b8 0f 00 00 00       	mov    $0xf,%eax
    3dd7:	cd 40                	int    $0x40
    3dd9:	c3                   	ret    

00003dda <mknod>:
SYSCALL(mknod)
    3dda:	b8 11 00 00 00       	mov    $0x11,%eax
    3ddf:	cd 40                	int    $0x40
    3de1:	c3                   	ret    

00003de2 <unlink>:
SYSCALL(unlink)
    3de2:	b8 12 00 00 00       	mov    $0x12,%eax
    3de7:	cd 40                	int    $0x40
    3de9:	c3                   	ret    

00003dea <fstat>:
SYSCALL(fstat)
    3dea:	b8 08 00 00 00       	mov    $0x8,%eax
    3def:	cd 40                	int    $0x40
    3df1:	c3                   	ret    

00003df2 <link>:
SYSCALL(link)
    3df2:	b8 13 00 00 00       	mov    $0x13,%eax
    3df7:	cd 40                	int    $0x40
    3df9:	c3                   	ret    

00003dfa <mkdir>:
SYSCALL(mkdir)
    3dfa:	b8 14 00 00 00       	mov    $0x14,%eax
    3dff:	cd 40                	int    $0x40
    3e01:	c3                   	ret    

00003e02 <chdir>:
SYSCALL(chdir)
    3e02:	b8 09 00 00 00       	mov    $0x9,%eax
    3e07:	cd 40                	int    $0x40
    3e09:	c3                   	ret    

00003e0a <dup>:
SYSCALL(dup)
    3e0a:	b8 0a 00 00 00       	mov    $0xa,%eax
    3e0f:	cd 40                	int    $0x40
    3e11:	c3                   	ret    

00003e12 <getpid>:
SYSCALL(getpid)
    3e12:	b8 0b 00 00 00       	mov    $0xb,%eax
    3e17:	cd 40                	int    $0x40
    3e19:	c3                   	ret    

00003e1a <sbrk>:
SYSCALL(sbrk)
    3e1a:	b8 0c 00 00 00       	mov    $0xc,%eax
    3e1f:	cd 40                	int    $0x40
    3e21:	c3                   	ret    

00003e22 <sleep>:
SYSCALL(sleep)
    3e22:	b8 0d 00 00 00       	mov    $0xd,%eax
    3e27:	cd 40                	int    $0x40
    3e29:	c3                   	ret    

00003e2a <uptime>:
SYSCALL(uptime)
    3e2a:	b8 0e 00 00 00       	mov    $0xe,%eax
    3e2f:	cd 40                	int    $0x40
    3e31:	c3                   	ret    
    3e32:	66 90                	xchg   %ax,%ax
    3e34:	66 90                	xchg   %ax,%ax
    3e36:	66 90                	xchg   %ax,%ax
    3e38:	66 90                	xchg   %ax,%ax
    3e3a:	66 90                	xchg   %ax,%ax
    3e3c:	66 90                	xchg   %ax,%ax
    3e3e:	66 90                	xchg   %ax,%ax

00003e40 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3e40:	55                   	push   %ebp
    3e41:	89 e5                	mov    %esp,%ebp
    3e43:	57                   	push   %edi
    3e44:	56                   	push   %esi
    3e45:	53                   	push   %ebx
    3e46:	89 c6                	mov    %eax,%esi
    3e48:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    3e4b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3e4e:	85 db                	test   %ebx,%ebx
    3e50:	74 7e                	je     3ed0 <printint+0x90>
    3e52:	89 d0                	mov    %edx,%eax
    3e54:	c1 e8 1f             	shr    $0x1f,%eax
    3e57:	84 c0                	test   %al,%al
    3e59:	74 75                	je     3ed0 <printint+0x90>
    neg = 1;
    x = -xx;
    3e5b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    3e5d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    3e64:	f7 d8                	neg    %eax
    3e66:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    3e69:	31 ff                	xor    %edi,%edi
    3e6b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    3e6e:	89 ce                	mov    %ecx,%esi
    3e70:	eb 08                	jmp    3e7a <printint+0x3a>
    3e72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    3e78:	89 cf                	mov    %ecx,%edi
    3e7a:	31 d2                	xor    %edx,%edx
    3e7c:	8d 4f 01             	lea    0x1(%edi),%ecx
    3e7f:	f7 f6                	div    %esi
    3e81:	0f b6 92 a0 59 00 00 	movzbl 0x59a0(%edx),%edx
  }while((x /= base) != 0);
    3e88:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    3e8a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    3e8d:	75 e9                	jne    3e78 <printint+0x38>
  if(neg)
    3e8f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3e92:	8b 75 c0             	mov    -0x40(%ebp),%esi
    3e95:	85 c0                	test   %eax,%eax
    3e97:	74 08                	je     3ea1 <printint+0x61>
    buf[i++] = '-';
    3e99:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    3e9e:	8d 4f 02             	lea    0x2(%edi),%ecx
    3ea1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    3ea5:	8d 76 00             	lea    0x0(%esi),%esi
    3ea8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3eab:	83 ec 04             	sub    $0x4,%esp
    3eae:	83 ef 01             	sub    $0x1,%edi
    3eb1:	6a 01                	push   $0x1
    3eb3:	53                   	push   %ebx
    3eb4:	56                   	push   %esi
    3eb5:	88 45 d7             	mov    %al,-0x29(%ebp)
    3eb8:	e8 f5 fe ff ff       	call   3db2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3ebd:	83 c4 10             	add    $0x10,%esp
    3ec0:	39 df                	cmp    %ebx,%edi
    3ec2:	75 e4                	jne    3ea8 <printint+0x68>
    putc(fd, buf[i]);
}
    3ec4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3ec7:	5b                   	pop    %ebx
    3ec8:	5e                   	pop    %esi
    3ec9:	5f                   	pop    %edi
    3eca:	5d                   	pop    %ebp
    3ecb:	c3                   	ret    
    3ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    3ed0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3ed2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3ed9:	eb 8b                	jmp    3e66 <printint+0x26>
    3edb:	90                   	nop
    3edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003ee0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3ee0:	55                   	push   %ebp
    3ee1:	89 e5                	mov    %esp,%ebp
    3ee3:	57                   	push   %edi
    3ee4:	56                   	push   %esi
    3ee5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ee6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3ee9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3eec:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3eef:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ef2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3ef5:	0f b6 1e             	movzbl (%esi),%ebx
    3ef8:	83 c6 01             	add    $0x1,%esi
    3efb:	84 db                	test   %bl,%bl
    3efd:	0f 84 b0 00 00 00    	je     3fb3 <printf+0xd3>
    3f03:	31 d2                	xor    %edx,%edx
    3f05:	eb 39                	jmp    3f40 <printf+0x60>
    3f07:	89 f6                	mov    %esi,%esi
    3f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3f10:	83 f8 25             	cmp    $0x25,%eax
    3f13:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    3f16:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3f1b:	74 18                	je     3f35 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3f1d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    3f20:	83 ec 04             	sub    $0x4,%esp
    3f23:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    3f26:	6a 01                	push   $0x1
    3f28:	50                   	push   %eax
    3f29:	57                   	push   %edi
    3f2a:	e8 83 fe ff ff       	call   3db2 <write>
    3f2f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3f32:	83 c4 10             	add    $0x10,%esp
    3f35:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3f38:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    3f3c:	84 db                	test   %bl,%bl
    3f3e:	74 73                	je     3fb3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    3f40:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    3f42:	0f be cb             	movsbl %bl,%ecx
    3f45:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    3f48:	74 c6                	je     3f10 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3f4a:	83 fa 25             	cmp    $0x25,%edx
    3f4d:	75 e6                	jne    3f35 <printf+0x55>
      if(c == 'd'){
    3f4f:	83 f8 64             	cmp    $0x64,%eax
    3f52:	0f 84 f8 00 00 00    	je     4050 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3f58:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    3f5e:	83 f9 70             	cmp    $0x70,%ecx
    3f61:	74 5d                	je     3fc0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3f63:	83 f8 73             	cmp    $0x73,%eax
    3f66:	0f 84 84 00 00 00    	je     3ff0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3f6c:	83 f8 63             	cmp    $0x63,%eax
    3f6f:	0f 84 ea 00 00 00    	je     405f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3f75:	83 f8 25             	cmp    $0x25,%eax
    3f78:	0f 84 c2 00 00 00    	je     4040 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3f7e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3f81:	83 ec 04             	sub    $0x4,%esp
    3f84:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3f88:	6a 01                	push   $0x1
    3f8a:	50                   	push   %eax
    3f8b:	57                   	push   %edi
    3f8c:	e8 21 fe ff ff       	call   3db2 <write>
    3f91:	83 c4 0c             	add    $0xc,%esp
    3f94:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3f97:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    3f9a:	6a 01                	push   $0x1
    3f9c:	50                   	push   %eax
    3f9d:	57                   	push   %edi
    3f9e:	83 c6 01             	add    $0x1,%esi
    3fa1:	e8 0c fe ff ff       	call   3db2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3fa6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3faa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3fad:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3faf:	84 db                	test   %bl,%bl
    3fb1:	75 8d                	jne    3f40 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3fb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3fb6:	5b                   	pop    %ebx
    3fb7:	5e                   	pop    %esi
    3fb8:	5f                   	pop    %edi
    3fb9:	5d                   	pop    %ebp
    3fba:	c3                   	ret    
    3fbb:	90                   	nop
    3fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3fc0:	83 ec 0c             	sub    $0xc,%esp
    3fc3:	b9 10 00 00 00       	mov    $0x10,%ecx
    3fc8:	6a 00                	push   $0x0
    3fca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    3fcd:	89 f8                	mov    %edi,%eax
    3fcf:	8b 13                	mov    (%ebx),%edx
    3fd1:	e8 6a fe ff ff       	call   3e40 <printint>
        ap++;
    3fd6:	89 d8                	mov    %ebx,%eax
    3fd8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3fdb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    3fdd:	83 c0 04             	add    $0x4,%eax
    3fe0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3fe3:	e9 4d ff ff ff       	jmp    3f35 <printf+0x55>
    3fe8:	90                   	nop
    3fe9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    3ff0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3ff3:	8b 18                	mov    (%eax),%ebx
        ap++;
    3ff5:	83 c0 04             	add    $0x4,%eax
    3ff8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    3ffb:	b8 98 59 00 00       	mov    $0x5998,%eax
    4000:	85 db                	test   %ebx,%ebx
    4002:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    4005:	0f b6 03             	movzbl (%ebx),%eax
    4008:	84 c0                	test   %al,%al
    400a:	74 23                	je     402f <printf+0x14f>
    400c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4010:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4013:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    4016:	83 ec 04             	sub    $0x4,%esp
    4019:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    401b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    401e:	50                   	push   %eax
    401f:	57                   	push   %edi
    4020:	e8 8d fd ff ff       	call   3db2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    4025:	0f b6 03             	movzbl (%ebx),%eax
    4028:	83 c4 10             	add    $0x10,%esp
    402b:	84 c0                	test   %al,%al
    402d:	75 e1                	jne    4010 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    402f:	31 d2                	xor    %edx,%edx
    4031:	e9 ff fe ff ff       	jmp    3f35 <printf+0x55>
    4036:	8d 76 00             	lea    0x0(%esi),%esi
    4039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4040:	83 ec 04             	sub    $0x4,%esp
    4043:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    4046:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    4049:	6a 01                	push   $0x1
    404b:	e9 4c ff ff ff       	jmp    3f9c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    4050:	83 ec 0c             	sub    $0xc,%esp
    4053:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4058:	6a 01                	push   $0x1
    405a:	e9 6b ff ff ff       	jmp    3fca <printf+0xea>
    405f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4062:	83 ec 04             	sub    $0x4,%esp
    4065:	8b 03                	mov    (%ebx),%eax
    4067:	6a 01                	push   $0x1
    4069:	88 45 e4             	mov    %al,-0x1c(%ebp)
    406c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    406f:	50                   	push   %eax
    4070:	57                   	push   %edi
    4071:	e8 3c fd ff ff       	call   3db2 <write>
    4076:	e9 5b ff ff ff       	jmp    3fd6 <printf+0xf6>
    407b:	66 90                	xchg   %ax,%ax
    407d:	66 90                	xchg   %ax,%ax
    407f:	90                   	nop

00004080 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4080:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4081:	a1 40 63 00 00       	mov    0x6340,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    4086:	89 e5                	mov    %esp,%ebp
    4088:	57                   	push   %edi
    4089:	56                   	push   %esi
    408a:	53                   	push   %ebx
    408b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    408e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4090:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4093:	39 c8                	cmp    %ecx,%eax
    4095:	73 19                	jae    40b0 <free+0x30>
    4097:	89 f6                	mov    %esi,%esi
    4099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    40a0:	39 d1                	cmp    %edx,%ecx
    40a2:	72 1c                	jb     40c0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    40a4:	39 d0                	cmp    %edx,%eax
    40a6:	73 18                	jae    40c0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    40a8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    40aa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    40ac:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    40ae:	72 f0                	jb     40a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    40b0:	39 d0                	cmp    %edx,%eax
    40b2:	72 f4                	jb     40a8 <free+0x28>
    40b4:	39 d1                	cmp    %edx,%ecx
    40b6:	73 f0                	jae    40a8 <free+0x28>
    40b8:	90                   	nop
    40b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    40c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    40c3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    40c6:	39 d7                	cmp    %edx,%edi
    40c8:	74 19                	je     40e3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    40ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    40cd:	8b 50 04             	mov    0x4(%eax),%edx
    40d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    40d3:	39 f1                	cmp    %esi,%ecx
    40d5:	74 23                	je     40fa <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    40d7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    40d9:	a3 40 63 00 00       	mov    %eax,0x6340
}
    40de:	5b                   	pop    %ebx
    40df:	5e                   	pop    %esi
    40e0:	5f                   	pop    %edi
    40e1:	5d                   	pop    %ebp
    40e2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    40e3:	03 72 04             	add    0x4(%edx),%esi
    40e6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    40e9:	8b 10                	mov    (%eax),%edx
    40eb:	8b 12                	mov    (%edx),%edx
    40ed:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    40f0:	8b 50 04             	mov    0x4(%eax),%edx
    40f3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    40f6:	39 f1                	cmp    %esi,%ecx
    40f8:	75 dd                	jne    40d7 <free+0x57>
    p->s.size += bp->s.size;
    40fa:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    40fd:	a3 40 63 00 00       	mov    %eax,0x6340
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    4102:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4105:	8b 53 f8             	mov    -0x8(%ebx),%edx
    4108:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    410a:	5b                   	pop    %ebx
    410b:	5e                   	pop    %esi
    410c:	5f                   	pop    %edi
    410d:	5d                   	pop    %ebp
    410e:	c3                   	ret    
    410f:	90                   	nop

00004110 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    4110:	55                   	push   %ebp
    4111:	89 e5                	mov    %esp,%ebp
    4113:	57                   	push   %edi
    4114:	56                   	push   %esi
    4115:	53                   	push   %ebx
    4116:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4119:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    411c:	8b 15 40 63 00 00    	mov    0x6340,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4122:	8d 78 07             	lea    0x7(%eax),%edi
    4125:	c1 ef 03             	shr    $0x3,%edi
    4128:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    412b:	85 d2                	test   %edx,%edx
    412d:	0f 84 a3 00 00 00    	je     41d6 <malloc+0xc6>
    4133:	8b 02                	mov    (%edx),%eax
    4135:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    4138:	39 cf                	cmp    %ecx,%edi
    413a:	76 74                	jbe    41b0 <malloc+0xa0>
    413c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    4142:	be 00 10 00 00       	mov    $0x1000,%esi
    4147:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    414e:	0f 43 f7             	cmovae %edi,%esi
    4151:	ba 00 80 00 00       	mov    $0x8000,%edx
    4156:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    415c:	0f 46 da             	cmovbe %edx,%ebx
    415f:	eb 10                	jmp    4171 <malloc+0x61>
    4161:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4168:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    416a:	8b 48 04             	mov    0x4(%eax),%ecx
    416d:	39 cf                	cmp    %ecx,%edi
    416f:	76 3f                	jbe    41b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    4171:	39 05 40 63 00 00    	cmp    %eax,0x6340
    4177:	89 c2                	mov    %eax,%edx
    4179:	75 ed                	jne    4168 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    417b:	83 ec 0c             	sub    $0xc,%esp
    417e:	53                   	push   %ebx
    417f:	e8 96 fc ff ff       	call   3e1a <sbrk>
  if(p == (char*)-1)
    4184:	83 c4 10             	add    $0x10,%esp
    4187:	83 f8 ff             	cmp    $0xffffffff,%eax
    418a:	74 1c                	je     41a8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    418c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    418f:	83 ec 0c             	sub    $0xc,%esp
    4192:	83 c0 08             	add    $0x8,%eax
    4195:	50                   	push   %eax
    4196:	e8 e5 fe ff ff       	call   4080 <free>
  return freep;
    419b:	8b 15 40 63 00 00    	mov    0x6340,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    41a1:	83 c4 10             	add    $0x10,%esp
    41a4:	85 d2                	test   %edx,%edx
    41a6:	75 c0                	jne    4168 <malloc+0x58>
        return 0;
    41a8:	31 c0                	xor    %eax,%eax
    41aa:	eb 1c                	jmp    41c8 <malloc+0xb8>
    41ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    41b0:	39 cf                	cmp    %ecx,%edi
    41b2:	74 1c                	je     41d0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    41b4:	29 f9                	sub    %edi,%ecx
    41b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    41b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    41bc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    41bf:	89 15 40 63 00 00    	mov    %edx,0x6340
      return (void*)(p + 1);
    41c5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    41c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    41cb:	5b                   	pop    %ebx
    41cc:	5e                   	pop    %esi
    41cd:	5f                   	pop    %edi
    41ce:	5d                   	pop    %ebp
    41cf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    41d0:	8b 08                	mov    (%eax),%ecx
    41d2:	89 0a                	mov    %ecx,(%edx)
    41d4:	eb e9                	jmp    41bf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    41d6:	c7 05 40 63 00 00 44 	movl   $0x6344,0x6340
    41dd:	63 00 00 
    41e0:	c7 05 44 63 00 00 44 	movl   $0x6344,0x6344
    41e7:	63 00 00 
    base.s.size = 0;
    41ea:	b8 44 63 00 00       	mov    $0x6344,%eax
    41ef:	c7 05 48 63 00 00 00 	movl   $0x0,0x6348
    41f6:	00 00 00 
    41f9:	e9 3e ff ff ff       	jmp    413c <malloc+0x2c>
