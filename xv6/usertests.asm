
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
      11:	68 1e 52 00 00       	push   $0x521e
      16:	6a 01                	push   $0x1
      18:	e8 a3 3e 00 00       	call   3ec0 <printf>
      1d:	5a                   	pop    %edx
      1e:	59                   	pop    %ecx
      1f:	6a 00                	push   $0x0
      21:	68 32 52 00 00       	push   $0x5232
      26:	e8 87 3d 00 00       	call   3db2 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 1b                	js     4d <main+0x4d>
      32:	83 ec 08             	sub    $0x8,%esp
      35:	68 9c 59 00 00       	push   $0x599c
      3a:	6a 01                	push   $0x1
      3c:	e8 7f 3e 00 00       	call   3ec0 <printf>
      41:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      48:	e8 25 3d 00 00       	call   3d72 <exit>
      4d:	50                   	push   %eax
      4e:	50                   	push   %eax
      4f:	68 00 02 00 00       	push   $0x200
      54:	68 32 52 00 00       	push   $0x5232
      59:	e8 54 3d 00 00       	call   3db2 <open>
      5e:	89 04 24             	mov    %eax,(%esp)
      61:	e8 34 3d 00 00       	call   3d9a <close>
      66:	e8 55 3a 00 00       	call   3ac0 <argptest>
      6b:	e8 00 13 00 00       	call   1370 <createdelete>
      70:	e8 7b 1c 00 00       	call   1cf0 <linkunlink>
      75:	e8 36 19 00 00       	call   19b0 <concreate>
      7a:	e8 d1 10 00 00       	call   1150 <fourfiles>
      7f:	e8 0c 0f 00 00       	call   f90 <sharedfd>
      84:	e8 b7 36 00 00       	call   3740 <bigargtest>
      89:	e8 a2 26 00 00       	call   2730 <bigwrite>
      8e:	e8 ad 36 00 00       	call   3740 <bigargtest>
      93:	e8 28 36 00 00       	call   36c0 <bsstest>
      98:	e8 d3 30 00 00       	call   3170 <sbrktest>
      9d:	e8 5e 35 00 00       	call   3600 <validatetest>
      a2:	e8 c9 03 00 00       	call   470 <opentest>
      a7:	e8 64 04 00 00       	call   510 <writetest>
      ac:	e8 6f 06 00 00       	call   720 <writetest1>
      b1:	e8 6a 08 00 00       	call   920 <createtest>
      b6:	e8 95 02 00 00       	call   350 <openiputtest>
      bb:	e8 70 01 00 00       	call   230 <exitiputtest>
      c0:	e8 6b 00 00 00       	call   130 <iputtest>
      c5:	e8 e6 0d 00 00       	call   eb0 <mem>
      ca:	e8 51 0a 00 00       	call   b20 <pipe1>
      cf:	e8 0c 0c 00 00       	call   ce0 <preempt>
      d4:	e8 47 0d 00 00       	call   e20 <exitwait>
      d9:	e8 a2 2a 00 00       	call   2b80 <rmdot>
      de:	e8 3d 29 00 00       	call   2a20 <fourteen>
      e3:	e8 38 27 00 00       	call   2820 <bigfile>
      e8:	e8 63 1e 00 00       	call   1f50 <subdir>
      ed:	e8 6e 16 00 00       	call   1760 <linktest>
      f2:	e8 a9 14 00 00       	call   15a0 <unlinkread>
      f7:	e8 34 2c 00 00       	call   2d30 <dirfile>
      fc:	e8 6f 2e 00 00       	call   2f70 <iref>
     101:	e8 9a 2f 00 00       	call   30a0 <forktest>
     106:	e8 f5 1c 00 00       	call   1e00 <bigdir>
     10b:	e8 30 39 00 00       	call   3a40 <uio>
     110:	e8 bb 09 00 00       	call   ad0 <exectest>
     115:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     11c:	e8 51 3c 00 00       	call   3d72 <exit>
     121:	66 90                	xchg   %ax,%ax
     123:	66 90                	xchg   %ax,%ax
     125:	66 90                	xchg   %ax,%ax
     127:	66 90                	xchg   %ax,%ax
     129:	66 90                	xchg   %ax,%ax
     12b:	66 90                	xchg   %ax,%ax
     12d:	66 90                	xchg   %ax,%ax
     12f:	90                   	nop

00000130 <iputtest>:
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	83 ec 10             	sub    $0x10,%esp
     136:	68 c4 42 00 00       	push   $0x42c4
     13b:	ff 35 a8 62 00 00    	pushl  0x62a8
     141:	e8 7a 3d 00 00       	call   3ec0 <printf>
     146:	c7 04 24 57 42 00 00 	movl   $0x4257,(%esp)
     14d:	e8 88 3c 00 00       	call   3dda <mkdir>
     152:	83 c4 10             	add    $0x10,%esp
     155:	85 c0                	test   %eax,%eax
     157:	78 58                	js     1b1 <iputtest+0x81>
     159:	83 ec 0c             	sub    $0xc,%esp
     15c:	68 57 42 00 00       	push   $0x4257
     161:	e8 7c 3c 00 00       	call   3de2 <chdir>
     166:	83 c4 10             	add    $0x10,%esp
     169:	85 c0                	test   %eax,%eax
     16b:	0f 88 9a 00 00 00    	js     20b <iputtest+0xdb>
     171:	83 ec 0c             	sub    $0xc,%esp
     174:	68 54 42 00 00       	push   $0x4254
     179:	e8 44 3c 00 00       	call   3dc2 <unlink>
     17e:	83 c4 10             	add    $0x10,%esp
     181:	85 c0                	test   %eax,%eax
     183:	78 68                	js     1ed <iputtest+0xbd>
     185:	83 ec 0c             	sub    $0xc,%esp
     188:	68 79 42 00 00       	push   $0x4279
     18d:	e8 50 3c 00 00       	call   3de2 <chdir>
     192:	83 c4 10             	add    $0x10,%esp
     195:	85 c0                	test   %eax,%eax
     197:	78 36                	js     1cf <iputtest+0x9f>
     199:	83 ec 08             	sub    $0x8,%esp
     19c:	68 fc 42 00 00       	push   $0x42fc
     1a1:	ff 35 a8 62 00 00    	pushl  0x62a8
     1a7:	e8 14 3d 00 00       	call   3ec0 <printf>
     1ac:	83 c4 10             	add    $0x10,%esp
     1af:	c9                   	leave  
     1b0:	c3                   	ret    
     1b1:	50                   	push   %eax
     1b2:	50                   	push   %eax
     1b3:	68 30 42 00 00       	push   $0x4230
     1b8:	ff 35 a8 62 00 00    	pushl  0x62a8
     1be:	e8 fd 3c 00 00       	call   3ec0 <printf>
     1c3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1ca:	e8 a3 3b 00 00       	call   3d72 <exit>
     1cf:	50                   	push   %eax
     1d0:	50                   	push   %eax
     1d1:	68 7b 42 00 00       	push   $0x427b
     1d6:	ff 35 a8 62 00 00    	pushl  0x62a8
     1dc:	e8 df 3c 00 00       	call   3ec0 <printf>
     1e1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1e8:	e8 85 3b 00 00       	call   3d72 <exit>
     1ed:	52                   	push   %edx
     1ee:	52                   	push   %edx
     1ef:	68 5f 42 00 00       	push   $0x425f
     1f4:	ff 35 a8 62 00 00    	pushl  0x62a8
     1fa:	e8 c1 3c 00 00       	call   3ec0 <printf>
     1ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     206:	e8 67 3b 00 00       	call   3d72 <exit>
     20b:	51                   	push   %ecx
     20c:	51                   	push   %ecx
     20d:	68 3e 42 00 00       	push   $0x423e
     212:	ff 35 a8 62 00 00    	pushl  0x62a8
     218:	e8 a3 3c 00 00       	call   3ec0 <printf>
     21d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     224:	e8 49 3b 00 00       	call   3d72 <exit>
     229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000230 <exitiputtest>:
     230:	55                   	push   %ebp
     231:	89 e5                	mov    %esp,%ebp
     233:	83 ec 10             	sub    $0x10,%esp
     236:	68 8b 42 00 00       	push   $0x428b
     23b:	ff 35 a8 62 00 00    	pushl  0x62a8
     241:	e8 7a 3c 00 00       	call   3ec0 <printf>
     246:	e8 1f 3b 00 00       	call   3d6a <fork>
     24b:	83 c4 10             	add    $0x10,%esp
     24e:	85 c0                	test   %eax,%eax
     250:	0f 88 99 00 00 00    	js     2ef <exitiputtest+0xbf>
     256:	75 58                	jne    2b0 <exitiputtest+0x80>
     258:	83 ec 0c             	sub    $0xc,%esp
     25b:	68 57 42 00 00       	push   $0x4257
     260:	e8 75 3b 00 00       	call   3dda <mkdir>
     265:	83 c4 10             	add    $0x10,%esp
     268:	85 c0                	test   %eax,%eax
     26a:	0f 88 bb 00 00 00    	js     32b <exitiputtest+0xfb>
     270:	83 ec 0c             	sub    $0xc,%esp
     273:	68 57 42 00 00       	push   $0x4257
     278:	e8 65 3b 00 00       	call   3de2 <chdir>
     27d:	83 c4 10             	add    $0x10,%esp
     280:	85 c0                	test   %eax,%eax
     282:	0f 88 85 00 00 00    	js     30d <exitiputtest+0xdd>
     288:	83 ec 0c             	sub    $0xc,%esp
     28b:	68 54 42 00 00       	push   $0x4254
     290:	e8 2d 3b 00 00       	call   3dc2 <unlink>
     295:	83 c4 10             	add    $0x10,%esp
     298:	85 c0                	test   %eax,%eax
     29a:	78 34                	js     2d0 <exitiputtest+0xa0>
     29c:	83 ec 0c             	sub    $0xc,%esp
     29f:	6a 00                	push   $0x0
     2a1:	e8 cc 3a 00 00       	call   3d72 <exit>
     2a6:	8d 76 00             	lea    0x0(%esi),%esi
     2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     2b0:	e8 c5 3a 00 00       	call   3d7a <wait>
     2b5:	83 ec 08             	sub    $0x8,%esp
     2b8:	68 ae 42 00 00       	push   $0x42ae
     2bd:	ff 35 a8 62 00 00    	pushl  0x62a8
     2c3:	e8 f8 3b 00 00       	call   3ec0 <printf>
     2c8:	83 c4 10             	add    $0x10,%esp
     2cb:	c9                   	leave  
     2cc:	c3                   	ret    
     2cd:	8d 76 00             	lea    0x0(%esi),%esi
     2d0:	83 ec 08             	sub    $0x8,%esp
     2d3:	68 5f 42 00 00       	push   $0x425f
     2d8:	ff 35 a8 62 00 00    	pushl  0x62a8
     2de:	e8 dd 3b 00 00       	call   3ec0 <printf>
     2e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     2ea:	e8 83 3a 00 00       	call   3d72 <exit>
     2ef:	51                   	push   %ecx
     2f0:	51                   	push   %ecx
     2f1:	68 71 51 00 00       	push   $0x5171
     2f6:	ff 35 a8 62 00 00    	pushl  0x62a8
     2fc:	e8 bf 3b 00 00       	call   3ec0 <printf>
     301:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     308:	e8 65 3a 00 00       	call   3d72 <exit>
     30d:	50                   	push   %eax
     30e:	50                   	push   %eax
     30f:	68 9a 42 00 00       	push   $0x429a
     314:	ff 35 a8 62 00 00    	pushl  0x62a8
     31a:	e8 a1 3b 00 00       	call   3ec0 <printf>
     31f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     326:	e8 47 3a 00 00       	call   3d72 <exit>
     32b:	52                   	push   %edx
     32c:	52                   	push   %edx
     32d:	68 30 42 00 00       	push   $0x4230
     332:	ff 35 a8 62 00 00    	pushl  0x62a8
     338:	e8 83 3b 00 00       	call   3ec0 <printf>
     33d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     344:	e8 29 3a 00 00       	call   3d72 <exit>
     349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000350 <openiputtest>:
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	83 ec 10             	sub    $0x10,%esp
     356:	68 c0 42 00 00       	push   $0x42c0
     35b:	ff 35 a8 62 00 00    	pushl  0x62a8
     361:	e8 5a 3b 00 00       	call   3ec0 <printf>
     366:	c7 04 24 cf 42 00 00 	movl   $0x42cf,(%esp)
     36d:	e8 68 3a 00 00       	call   3dda <mkdir>
     372:	83 c4 10             	add    $0x10,%esp
     375:	85 c0                	test   %eax,%eax
     377:	0f 88 95 00 00 00    	js     412 <openiputtest+0xc2>
     37d:	e8 e8 39 00 00       	call   3d6a <fork>
     382:	85 c0                	test   %eax,%eax
     384:	0f 88 a6 00 00 00    	js     430 <openiputtest+0xe0>
     38a:	75 3c                	jne    3c8 <openiputtest+0x78>
     38c:	83 ec 08             	sub    $0x8,%esp
     38f:	6a 02                	push   $0x2
     391:	68 cf 42 00 00       	push   $0x42cf
     396:	e8 17 3a 00 00       	call   3db2 <open>
     39b:	83 c4 10             	add    $0x10,%esp
     39e:	85 c0                	test   %eax,%eax
     3a0:	78 66                	js     408 <openiputtest+0xb8>
     3a2:	83 ec 08             	sub    $0x8,%esp
     3a5:	68 54 52 00 00       	push   $0x5254
     3aa:	ff 35 a8 62 00 00    	pushl  0x62a8
     3b0:	e8 0b 3b 00 00       	call   3ec0 <printf>
     3b5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     3bc:	e8 b1 39 00 00       	call   3d72 <exit>
     3c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3c8:	83 ec 0c             	sub    $0xc,%esp
     3cb:	6a 01                	push   $0x1
     3cd:	e8 30 3a 00 00       	call   3e02 <sleep>
     3d2:	c7 04 24 cf 42 00 00 	movl   $0x42cf,(%esp)
     3d9:	e8 e4 39 00 00       	call   3dc2 <unlink>
     3de:	83 c4 10             	add    $0x10,%esp
     3e1:	85 c0                	test   %eax,%eax
     3e3:	75 69                	jne    44e <openiputtest+0xfe>
     3e5:	e8 90 39 00 00       	call   3d7a <wait>
     3ea:	83 ec 08             	sub    $0x8,%esp
     3ed:	68 f8 42 00 00       	push   $0x42f8
     3f2:	ff 35 a8 62 00 00    	pushl  0x62a8
     3f8:	e8 c3 3a 00 00       	call   3ec0 <printf>
     3fd:	83 c4 10             	add    $0x10,%esp
     400:	c9                   	leave  
     401:	c3                   	ret    
     402:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     408:	83 ec 0c             	sub    $0xc,%esp
     40b:	6a 00                	push   $0x0
     40d:	e8 60 39 00 00       	call   3d72 <exit>
     412:	51                   	push   %ecx
     413:	51                   	push   %ecx
     414:	68 d5 42 00 00       	push   $0x42d5
     419:	ff 35 a8 62 00 00    	pushl  0x62a8
     41f:	e8 9c 3a 00 00       	call   3ec0 <printf>
     424:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     42b:	e8 42 39 00 00       	call   3d72 <exit>
     430:	52                   	push   %edx
     431:	52                   	push   %edx
     432:	68 71 51 00 00       	push   $0x5171
     437:	ff 35 a8 62 00 00    	pushl  0x62a8
     43d:	e8 7e 3a 00 00       	call   3ec0 <printf>
     442:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     449:	e8 24 39 00 00       	call   3d72 <exit>
     44e:	50                   	push   %eax
     44f:	50                   	push   %eax
     450:	68 e9 42 00 00       	push   $0x42e9
     455:	ff 35 a8 62 00 00    	pushl  0x62a8
     45b:	e8 60 3a 00 00       	call   3ec0 <printf>
     460:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     467:	e8 06 39 00 00       	call   3d72 <exit>
     46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000470 <opentest>:
     470:	55                   	push   %ebp
     471:	89 e5                	mov    %esp,%ebp
     473:	83 ec 10             	sub    $0x10,%esp
     476:	68 0a 43 00 00       	push   $0x430a
     47b:	ff 35 a8 62 00 00    	pushl  0x62a8
     481:	e8 3a 3a 00 00       	call   3ec0 <printf>
     486:	58                   	pop    %eax
     487:	5a                   	pop    %edx
     488:	6a 00                	push   $0x0
     48a:	68 15 43 00 00       	push   $0x4315
     48f:	e8 1e 39 00 00       	call   3db2 <open>
     494:	83 c4 10             	add    $0x10,%esp
     497:	85 c0                	test   %eax,%eax
     499:	78 36                	js     4d1 <opentest+0x61>
     49b:	83 ec 0c             	sub    $0xc,%esp
     49e:	50                   	push   %eax
     49f:	e8 f6 38 00 00       	call   3d9a <close>
     4a4:	5a                   	pop    %edx
     4a5:	59                   	pop    %ecx
     4a6:	6a 00                	push   $0x0
     4a8:	68 2d 43 00 00       	push   $0x432d
     4ad:	e8 00 39 00 00       	call   3db2 <open>
     4b2:	83 c4 10             	add    $0x10,%esp
     4b5:	85 c0                	test   %eax,%eax
     4b7:	79 36                	jns    4ef <opentest+0x7f>
     4b9:	83 ec 08             	sub    $0x8,%esp
     4bc:	68 58 43 00 00       	push   $0x4358
     4c1:	ff 35 a8 62 00 00    	pushl  0x62a8
     4c7:	e8 f4 39 00 00       	call   3ec0 <printf>
     4cc:	83 c4 10             	add    $0x10,%esp
     4cf:	c9                   	leave  
     4d0:	c3                   	ret    
     4d1:	50                   	push   %eax
     4d2:	50                   	push   %eax
     4d3:	68 1a 43 00 00       	push   $0x431a
     4d8:	ff 35 a8 62 00 00    	pushl  0x62a8
     4de:	e8 dd 39 00 00       	call   3ec0 <printf>
     4e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     4ea:	e8 83 38 00 00       	call   3d72 <exit>
     4ef:	50                   	push   %eax
     4f0:	50                   	push   %eax
     4f1:	68 3a 43 00 00       	push   $0x433a
     4f6:	ff 35 a8 62 00 00    	pushl  0x62a8
     4fc:	e8 bf 39 00 00       	call   3ec0 <printf>
     501:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     508:	e8 65 38 00 00       	call   3d72 <exit>
     50d:	8d 76 00             	lea    0x0(%esi),%esi

00000510 <writetest>:
     510:	55                   	push   %ebp
     511:	89 e5                	mov    %esp,%ebp
     513:	56                   	push   %esi
     514:	53                   	push   %ebx
     515:	83 ec 08             	sub    $0x8,%esp
     518:	68 66 43 00 00       	push   $0x4366
     51d:	ff 35 a8 62 00 00    	pushl  0x62a8
     523:	e8 98 39 00 00       	call   3ec0 <printf>
     528:	59                   	pop    %ecx
     529:	5b                   	pop    %ebx
     52a:	68 02 02 00 00       	push   $0x202
     52f:	68 77 43 00 00       	push   $0x4377
     534:	e8 79 38 00 00       	call   3db2 <open>
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
     53e:	0f 88 b2 01 00 00    	js     6f6 <writetest+0x1e6>
     544:	83 ec 08             	sub    $0x8,%esp
     547:	89 c6                	mov    %eax,%esi
     549:	31 db                	xor    %ebx,%ebx
     54b:	68 7d 43 00 00       	push   $0x437d
     550:	ff 35 a8 62 00 00    	pushl  0x62a8
     556:	e8 65 39 00 00       	call   3ec0 <printf>
     55b:	83 c4 10             	add    $0x10,%esp
     55e:	66 90                	xchg   %ax,%ax
     560:	83 ec 04             	sub    $0x4,%esp
     563:	6a 0a                	push   $0xa
     565:	68 b4 43 00 00       	push   $0x43b4
     56a:	56                   	push   %esi
     56b:	e8 22 38 00 00       	call   3d92 <write>
     570:	83 c4 10             	add    $0x10,%esp
     573:	83 f8 0a             	cmp    $0xa,%eax
     576:	0f 85 dd 00 00 00    	jne    659 <writetest+0x149>
     57c:	83 ec 04             	sub    $0x4,%esp
     57f:	6a 0a                	push   $0xa
     581:	68 bf 43 00 00       	push   $0x43bf
     586:	56                   	push   %esi
     587:	e8 06 38 00 00       	call   3d92 <write>
     58c:	83 c4 10             	add    $0x10,%esp
     58f:	83 f8 0a             	cmp    $0xa,%eax
     592:	0f 85 e1 00 00 00    	jne    679 <writetest+0x169>
     598:	83 c3 01             	add    $0x1,%ebx
     59b:	83 fb 64             	cmp    $0x64,%ebx
     59e:	75 c0                	jne    560 <writetest+0x50>
     5a0:	83 ec 08             	sub    $0x8,%esp
     5a3:	68 ca 43 00 00       	push   $0x43ca
     5a8:	ff 35 a8 62 00 00    	pushl  0x62a8
     5ae:	e8 0d 39 00 00       	call   3ec0 <printf>
     5b3:	89 34 24             	mov    %esi,(%esp)
     5b6:	e8 df 37 00 00       	call   3d9a <close>
     5bb:	58                   	pop    %eax
     5bc:	5a                   	pop    %edx
     5bd:	6a 00                	push   $0x0
     5bf:	68 77 43 00 00       	push   $0x4377
     5c4:	e8 e9 37 00 00       	call   3db2 <open>
     5c9:	83 c4 10             	add    $0x10,%esp
     5cc:	85 c0                	test   %eax,%eax
     5ce:	89 c3                	mov    %eax,%ebx
     5d0:	0f 88 c3 00 00 00    	js     699 <writetest+0x189>
     5d6:	83 ec 08             	sub    $0x8,%esp
     5d9:	68 d5 43 00 00       	push   $0x43d5
     5de:	ff 35 a8 62 00 00    	pushl  0x62a8
     5e4:	e8 d7 38 00 00       	call   3ec0 <printf>
     5e9:	83 c4 0c             	add    $0xc,%esp
     5ec:	68 d0 07 00 00       	push   $0x7d0
     5f1:	68 80 8a 00 00       	push   $0x8a80
     5f6:	53                   	push   %ebx
     5f7:	e8 8e 37 00 00       	call   3d8a <read>
     5fc:	83 c4 10             	add    $0x10,%esp
     5ff:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     604:	0f 85 ae 00 00 00    	jne    6b8 <writetest+0x1a8>
     60a:	83 ec 08             	sub    $0x8,%esp
     60d:	68 09 44 00 00       	push   $0x4409
     612:	ff 35 a8 62 00 00    	pushl  0x62a8
     618:	e8 a3 38 00 00       	call   3ec0 <printf>
     61d:	89 1c 24             	mov    %ebx,(%esp)
     620:	e8 75 37 00 00       	call   3d9a <close>
     625:	c7 04 24 77 43 00 00 	movl   $0x4377,(%esp)
     62c:	e8 91 37 00 00       	call   3dc2 <unlink>
     631:	83 c4 10             	add    $0x10,%esp
     634:	85 c0                	test   %eax,%eax
     636:	0f 88 9b 00 00 00    	js     6d7 <writetest+0x1c7>
     63c:	83 ec 08             	sub    $0x8,%esp
     63f:	68 31 44 00 00       	push   $0x4431
     644:	ff 35 a8 62 00 00    	pushl  0x62a8
     64a:	e8 71 38 00 00       	call   3ec0 <printf>
     64f:	83 c4 10             	add    $0x10,%esp
     652:	8d 65 f8             	lea    -0x8(%ebp),%esp
     655:	5b                   	pop    %ebx
     656:	5e                   	pop    %esi
     657:	5d                   	pop    %ebp
     658:	c3                   	ret    
     659:	83 ec 04             	sub    $0x4,%esp
     65c:	53                   	push   %ebx
     65d:	68 78 52 00 00       	push   $0x5278
     662:	ff 35 a8 62 00 00    	pushl  0x62a8
     668:	e8 53 38 00 00       	call   3ec0 <printf>
     66d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     674:	e8 f9 36 00 00       	call   3d72 <exit>
     679:	83 ec 04             	sub    $0x4,%esp
     67c:	53                   	push   %ebx
     67d:	68 9c 52 00 00       	push   $0x529c
     682:	ff 35 a8 62 00 00    	pushl  0x62a8
     688:	e8 33 38 00 00       	call   3ec0 <printf>
     68d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     694:	e8 d9 36 00 00       	call   3d72 <exit>
     699:	83 ec 08             	sub    $0x8,%esp
     69c:	68 ee 43 00 00       	push   $0x43ee
     6a1:	ff 35 a8 62 00 00    	pushl  0x62a8
     6a7:	e8 14 38 00 00       	call   3ec0 <printf>
     6ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     6b3:	e8 ba 36 00 00       	call   3d72 <exit>
     6b8:	83 ec 08             	sub    $0x8,%esp
     6bb:	68 35 47 00 00       	push   $0x4735
     6c0:	ff 35 a8 62 00 00    	pushl  0x62a8
     6c6:	e8 f5 37 00 00       	call   3ec0 <printf>
     6cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     6d2:	e8 9b 36 00 00       	call   3d72 <exit>
     6d7:	83 ec 08             	sub    $0x8,%esp
     6da:	68 1c 44 00 00       	push   $0x441c
     6df:	ff 35 a8 62 00 00    	pushl  0x62a8
     6e5:	e8 d6 37 00 00       	call   3ec0 <printf>
     6ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     6f1:	e8 7c 36 00 00       	call   3d72 <exit>
     6f6:	83 ec 08             	sub    $0x8,%esp
     6f9:	68 98 43 00 00       	push   $0x4398
     6fe:	ff 35 a8 62 00 00    	pushl  0x62a8
     704:	e8 b7 37 00 00       	call   3ec0 <printf>
     709:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     710:	e8 5d 36 00 00       	call   3d72 <exit>
     715:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000720 <writetest1>:
     720:	55                   	push   %ebp
     721:	89 e5                	mov    %esp,%ebp
     723:	56                   	push   %esi
     724:	53                   	push   %ebx
     725:	83 ec 08             	sub    $0x8,%esp
     728:	68 45 44 00 00       	push   $0x4445
     72d:	ff 35 a8 62 00 00    	pushl  0x62a8
     733:	e8 88 37 00 00       	call   3ec0 <printf>
     738:	59                   	pop    %ecx
     739:	5b                   	pop    %ebx
     73a:	68 02 02 00 00       	push   $0x202
     73f:	68 bf 44 00 00       	push   $0x44bf
     744:	e8 69 36 00 00       	call   3db2 <open>
     749:	83 c4 10             	add    $0x10,%esp
     74c:	85 c0                	test   %eax,%eax
     74e:	0f 88 8b 01 00 00    	js     8df <writetest1+0x1bf>
     754:	89 c6                	mov    %eax,%esi
     756:	31 db                	xor    %ebx,%ebx
     758:	90                   	nop
     759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     760:	83 ec 04             	sub    $0x4,%esp
     763:	89 1d 80 8a 00 00    	mov    %ebx,0x8a80
     769:	68 00 02 00 00       	push   $0x200
     76e:	68 80 8a 00 00       	push   $0x8a80
     773:	56                   	push   %esi
     774:	e8 19 36 00 00       	call   3d92 <write>
     779:	83 c4 10             	add    $0x10,%esp
     77c:	3d 00 02 00 00       	cmp    $0x200,%eax
     781:	0f 85 b7 00 00 00    	jne    83e <writetest1+0x11e>
     787:	83 c3 01             	add    $0x1,%ebx
     78a:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     790:	75 ce                	jne    760 <writetest1+0x40>
     792:	83 ec 0c             	sub    $0xc,%esp
     795:	56                   	push   %esi
     796:	e8 ff 35 00 00       	call   3d9a <close>
     79b:	58                   	pop    %eax
     79c:	5a                   	pop    %edx
     79d:	6a 00                	push   $0x0
     79f:	68 bf 44 00 00       	push   $0x44bf
     7a4:	e8 09 36 00 00       	call   3db2 <open>
     7a9:	83 c4 10             	add    $0x10,%esp
     7ac:	85 c0                	test   %eax,%eax
     7ae:	89 c6                	mov    %eax,%esi
     7b0:	0f 88 0a 01 00 00    	js     8c0 <writetest1+0x1a0>
     7b6:	31 db                	xor    %ebx,%ebx
     7b8:	eb 21                	jmp    7db <writetest1+0xbb>
     7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     7c0:	3d 00 02 00 00       	cmp    $0x200,%eax
     7c5:	0f 85 b1 00 00 00    	jne    87c <writetest1+0x15c>
     7cb:	a1 80 8a 00 00       	mov    0x8a80,%eax
     7d0:	39 c3                	cmp    %eax,%ebx
     7d2:	0f 85 86 00 00 00    	jne    85e <writetest1+0x13e>
     7d8:	83 c3 01             	add    $0x1,%ebx
     7db:	83 ec 04             	sub    $0x4,%esp
     7de:	68 00 02 00 00       	push   $0x200
     7e3:	68 80 8a 00 00       	push   $0x8a80
     7e8:	56                   	push   %esi
     7e9:	e8 9c 35 00 00       	call   3d8a <read>
     7ee:	83 c4 10             	add    $0x10,%esp
     7f1:	85 c0                	test   %eax,%eax
     7f3:	75 cb                	jne    7c0 <writetest1+0xa0>
     7f5:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     7fb:	0f 84 9b 00 00 00    	je     89c <writetest1+0x17c>
     801:	83 ec 0c             	sub    $0xc,%esp
     804:	56                   	push   %esi
     805:	e8 90 35 00 00       	call   3d9a <close>
     80a:	c7 04 24 bf 44 00 00 	movl   $0x44bf,(%esp)
     811:	e8 ac 35 00 00       	call   3dc2 <unlink>
     816:	83 c4 10             	add    $0x10,%esp
     819:	85 c0                	test   %eax,%eax
     81b:	0f 88 dd 00 00 00    	js     8fe <writetest1+0x1de>
     821:	83 ec 08             	sub    $0x8,%esp
     824:	68 e6 44 00 00       	push   $0x44e6
     829:	ff 35 a8 62 00 00    	pushl  0x62a8
     82f:	e8 8c 36 00 00       	call   3ec0 <printf>
     834:	83 c4 10             	add    $0x10,%esp
     837:	8d 65 f8             	lea    -0x8(%ebp),%esp
     83a:	5b                   	pop    %ebx
     83b:	5e                   	pop    %esi
     83c:	5d                   	pop    %ebp
     83d:	c3                   	ret    
     83e:	83 ec 04             	sub    $0x4,%esp
     841:	53                   	push   %ebx
     842:	68 6f 44 00 00       	push   $0x446f
     847:	ff 35 a8 62 00 00    	pushl  0x62a8
     84d:	e8 6e 36 00 00       	call   3ec0 <printf>
     852:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     859:	e8 14 35 00 00       	call   3d72 <exit>
     85e:	50                   	push   %eax
     85f:	53                   	push   %ebx
     860:	68 c0 52 00 00       	push   $0x52c0
     865:	ff 35 a8 62 00 00    	pushl  0x62a8
     86b:	e8 50 36 00 00       	call   3ec0 <printf>
     870:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     877:	e8 f6 34 00 00       	call   3d72 <exit>
     87c:	83 ec 04             	sub    $0x4,%esp
     87f:	50                   	push   %eax
     880:	68 c3 44 00 00       	push   $0x44c3
     885:	ff 35 a8 62 00 00    	pushl  0x62a8
     88b:	e8 30 36 00 00       	call   3ec0 <printf>
     890:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     897:	e8 d6 34 00 00       	call   3d72 <exit>
     89c:	83 ec 04             	sub    $0x4,%esp
     89f:	68 8b 00 00 00       	push   $0x8b
     8a4:	68 a6 44 00 00       	push   $0x44a6
     8a9:	ff 35 a8 62 00 00    	pushl  0x62a8
     8af:	e8 0c 36 00 00       	call   3ec0 <printf>
     8b4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     8bb:	e8 b2 34 00 00       	call   3d72 <exit>
     8c0:	83 ec 08             	sub    $0x8,%esp
     8c3:	68 8d 44 00 00       	push   $0x448d
     8c8:	ff 35 a8 62 00 00    	pushl  0x62a8
     8ce:	e8 ed 35 00 00       	call   3ec0 <printf>
     8d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     8da:	e8 93 34 00 00       	call   3d72 <exit>
     8df:	83 ec 08             	sub    $0x8,%esp
     8e2:	68 55 44 00 00       	push   $0x4455
     8e7:	ff 35 a8 62 00 00    	pushl  0x62a8
     8ed:	e8 ce 35 00 00       	call   3ec0 <printf>
     8f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     8f9:	e8 74 34 00 00       	call   3d72 <exit>
     8fe:	83 ec 08             	sub    $0x8,%esp
     901:	68 d3 44 00 00       	push   $0x44d3
     906:	ff 35 a8 62 00 00    	pushl  0x62a8
     90c:	e8 af 35 00 00       	call   3ec0 <printf>
     911:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     918:	e8 55 34 00 00       	call   3d72 <exit>
     91d:	8d 76 00             	lea    0x0(%esi),%esi

00000920 <createtest>:
     920:	55                   	push   %ebp
     921:	89 e5                	mov    %esp,%ebp
     923:	53                   	push   %ebx
     924:	bb 30 00 00 00       	mov    $0x30,%ebx
     929:	83 ec 0c             	sub    $0xc,%esp
     92c:	68 e0 52 00 00       	push   $0x52e0
     931:	ff 35 a8 62 00 00    	pushl  0x62a8
     937:	e8 84 35 00 00       	call   3ec0 <printf>
     93c:	c6 05 80 aa 00 00 61 	movb   $0x61,0xaa80
     943:	c6 05 82 aa 00 00 00 	movb   $0x0,0xaa82
     94a:	83 c4 10             	add    $0x10,%esp
     94d:	8d 76 00             	lea    0x0(%esi),%esi
     950:	83 ec 08             	sub    $0x8,%esp
     953:	88 1d 81 aa 00 00    	mov    %bl,0xaa81
     959:	83 c3 01             	add    $0x1,%ebx
     95c:	68 02 02 00 00       	push   $0x202
     961:	68 80 aa 00 00       	push   $0xaa80
     966:	e8 47 34 00 00       	call   3db2 <open>
     96b:	89 04 24             	mov    %eax,(%esp)
     96e:	e8 27 34 00 00       	call   3d9a <close>
     973:	83 c4 10             	add    $0x10,%esp
     976:	80 fb 64             	cmp    $0x64,%bl
     979:	75 d5                	jne    950 <createtest+0x30>
     97b:	c6 05 80 aa 00 00 61 	movb   $0x61,0xaa80
     982:	c6 05 82 aa 00 00 00 	movb   $0x0,0xaa82
     989:	bb 30 00 00 00       	mov    $0x30,%ebx
     98e:	66 90                	xchg   %ax,%ax
     990:	83 ec 0c             	sub    $0xc,%esp
     993:	88 1d 81 aa 00 00    	mov    %bl,0xaa81
     999:	83 c3 01             	add    $0x1,%ebx
     99c:	68 80 aa 00 00       	push   $0xaa80
     9a1:	e8 1c 34 00 00       	call   3dc2 <unlink>
     9a6:	83 c4 10             	add    $0x10,%esp
     9a9:	80 fb 64             	cmp    $0x64,%bl
     9ac:	75 e2                	jne    990 <createtest+0x70>
     9ae:	83 ec 08             	sub    $0x8,%esp
     9b1:	68 08 53 00 00       	push   $0x5308
     9b6:	ff 35 a8 62 00 00    	pushl  0x62a8
     9bc:	e8 ff 34 00 00       	call   3ec0 <printf>
     9c1:	83 c4 10             	add    $0x10,%esp
     9c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9c7:	c9                   	leave  
     9c8:	c3                   	ret    
     9c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009d0 <dirtest>:
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	83 ec 10             	sub    $0x10,%esp
     9d6:	68 f4 44 00 00       	push   $0x44f4
     9db:	ff 35 a8 62 00 00    	pushl  0x62a8
     9e1:	e8 da 34 00 00       	call   3ec0 <printf>
     9e6:	c7 04 24 00 45 00 00 	movl   $0x4500,(%esp)
     9ed:	e8 e8 33 00 00       	call   3dda <mkdir>
     9f2:	83 c4 10             	add    $0x10,%esp
     9f5:	85 c0                	test   %eax,%eax
     9f7:	78 58                	js     a51 <dirtest+0x81>
     9f9:	83 ec 0c             	sub    $0xc,%esp
     9fc:	68 00 45 00 00       	push   $0x4500
     a01:	e8 dc 33 00 00       	call   3de2 <chdir>
     a06:	83 c4 10             	add    $0x10,%esp
     a09:	85 c0                	test   %eax,%eax
     a0b:	0f 88 9a 00 00 00    	js     aab <dirtest+0xdb>
     a11:	83 ec 0c             	sub    $0xc,%esp
     a14:	68 a5 4a 00 00       	push   $0x4aa5
     a19:	e8 c4 33 00 00       	call   3de2 <chdir>
     a1e:	83 c4 10             	add    $0x10,%esp
     a21:	85 c0                	test   %eax,%eax
     a23:	78 68                	js     a8d <dirtest+0xbd>
     a25:	83 ec 0c             	sub    $0xc,%esp
     a28:	68 00 45 00 00       	push   $0x4500
     a2d:	e8 90 33 00 00       	call   3dc2 <unlink>
     a32:	83 c4 10             	add    $0x10,%esp
     a35:	85 c0                	test   %eax,%eax
     a37:	78 36                	js     a6f <dirtest+0x9f>
     a39:	83 ec 08             	sub    $0x8,%esp
     a3c:	68 3d 45 00 00       	push   $0x453d
     a41:	ff 35 a8 62 00 00    	pushl  0x62a8
     a47:	e8 74 34 00 00       	call   3ec0 <printf>
     a4c:	83 c4 10             	add    $0x10,%esp
     a4f:	c9                   	leave  
     a50:	c3                   	ret    
     a51:	50                   	push   %eax
     a52:	50                   	push   %eax
     a53:	68 30 42 00 00       	push   $0x4230
     a58:	ff 35 a8 62 00 00    	pushl  0x62a8
     a5e:	e8 5d 34 00 00       	call   3ec0 <printf>
     a63:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     a6a:	e8 03 33 00 00       	call   3d72 <exit>
     a6f:	50                   	push   %eax
     a70:	50                   	push   %eax
     a71:	68 29 45 00 00       	push   $0x4529
     a76:	ff 35 a8 62 00 00    	pushl  0x62a8
     a7c:	e8 3f 34 00 00       	call   3ec0 <printf>
     a81:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     a88:	e8 e5 32 00 00       	call   3d72 <exit>
     a8d:	52                   	push   %edx
     a8e:	52                   	push   %edx
     a8f:	68 18 45 00 00       	push   $0x4518
     a94:	ff 35 a8 62 00 00    	pushl  0x62a8
     a9a:	e8 21 34 00 00       	call   3ec0 <printf>
     a9f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     aa6:	e8 c7 32 00 00       	call   3d72 <exit>
     aab:	51                   	push   %ecx
     aac:	51                   	push   %ecx
     aad:	68 05 45 00 00       	push   $0x4505
     ab2:	ff 35 a8 62 00 00    	pushl  0x62a8
     ab8:	e8 03 34 00 00       	call   3ec0 <printf>
     abd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     ac4:	e8 a9 32 00 00       	call   3d72 <exit>
     ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ad0 <exectest>:
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	83 ec 10             	sub    $0x10,%esp
     ad6:	68 4c 45 00 00       	push   $0x454c
     adb:	ff 35 a8 62 00 00    	pushl  0x62a8
     ae1:	e8 da 33 00 00       	call   3ec0 <printf>
     ae6:	5a                   	pop    %edx
     ae7:	59                   	pop    %ecx
     ae8:	68 ac 62 00 00       	push   $0x62ac
     aed:	68 15 43 00 00       	push   $0x4315
     af2:	e8 b3 32 00 00       	call   3daa <exec>
     af7:	83 c4 10             	add    $0x10,%esp
     afa:	85 c0                	test   %eax,%eax
     afc:	78 02                	js     b00 <exectest+0x30>
     afe:	c9                   	leave  
     aff:	c3                   	ret    
     b00:	50                   	push   %eax
     b01:	50                   	push   %eax
     b02:	68 57 45 00 00       	push   $0x4557
     b07:	ff 35 a8 62 00 00    	pushl  0x62a8
     b0d:	e8 ae 33 00 00       	call   3ec0 <printf>
     b12:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b19:	e8 54 32 00 00       	call   3d72 <exit>
     b1e:	66 90                	xchg   %ax,%ax

00000b20 <pipe1>:
     b20:	55                   	push   %ebp
     b21:	89 e5                	mov    %esp,%ebp
     b23:	57                   	push   %edi
     b24:	56                   	push   %esi
     b25:	53                   	push   %ebx
     b26:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b29:	83 ec 38             	sub    $0x38,%esp
     b2c:	50                   	push   %eax
     b2d:	e8 50 32 00 00       	call   3d82 <pipe>
     b32:	83 c4 10             	add    $0x10,%esp
     b35:	85 c0                	test   %eax,%eax
     b37:	0f 85 45 01 00 00    	jne    c82 <pipe1+0x162>
     b3d:	e8 28 32 00 00       	call   3d6a <fork>
     b42:	83 f8 00             	cmp    $0x0,%eax
     b45:	0f 84 86 00 00 00    	je     bd1 <pipe1+0xb1>
     b4b:	0f 8e 4c 01 00 00    	jle    c9d <pipe1+0x17d>
     b51:	83 ec 0c             	sub    $0xc,%esp
     b54:	ff 75 e4             	pushl  -0x1c(%ebp)
     b57:	bf 01 00 00 00       	mov    $0x1,%edi
     b5c:	31 db                	xor    %ebx,%ebx
     b5e:	e8 37 32 00 00       	call   3d9a <close>
     b63:	83 c4 10             	add    $0x10,%esp
     b66:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     b6d:	83 ec 04             	sub    $0x4,%esp
     b70:	57                   	push   %edi
     b71:	68 80 8a 00 00       	push   $0x8a80
     b76:	ff 75 e0             	pushl  -0x20(%ebp)
     b79:	e8 0c 32 00 00       	call   3d8a <read>
     b7e:	83 c4 10             	add    $0x10,%esp
     b81:	85 c0                	test   %eax,%eax
     b83:	0f 8e ac 00 00 00    	jle    c35 <pipe1+0x115>
     b89:	89 d9                	mov    %ebx,%ecx
     b8b:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     b8e:	f7 d9                	neg    %ecx
     b90:	38 9c 0b 80 8a 00 00 	cmp    %bl,0x8a80(%ebx,%ecx,1)
     b97:	8d 53 01             	lea    0x1(%ebx),%edx
     b9a:	75 1b                	jne    bb7 <pipe1+0x97>
     b9c:	39 f2                	cmp    %esi,%edx
     b9e:	89 d3                	mov    %edx,%ebx
     ba0:	75 ee                	jne    b90 <pipe1+0x70>
     ba2:	01 ff                	add    %edi,%edi
     ba4:	01 45 d4             	add    %eax,-0x2c(%ebp)
     ba7:	b8 00 20 00 00       	mov    $0x2000,%eax
     bac:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     bb2:	0f 4f f8             	cmovg  %eax,%edi
     bb5:	eb b6                	jmp    b6d <pipe1+0x4d>
     bb7:	83 ec 08             	sub    $0x8,%esp
     bba:	68 86 45 00 00       	push   $0x4586
     bbf:	6a 01                	push   $0x1
     bc1:	e8 fa 32 00 00       	call   3ec0 <printf>
     bc6:	83 c4 10             	add    $0x10,%esp
     bc9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bcc:	5b                   	pop    %ebx
     bcd:	5e                   	pop    %esi
     bce:	5f                   	pop    %edi
     bcf:	5d                   	pop    %ebp
     bd0:	c3                   	ret    
     bd1:	83 ec 0c             	sub    $0xc,%esp
     bd4:	ff 75 e0             	pushl  -0x20(%ebp)
     bd7:	31 f6                	xor    %esi,%esi
     bd9:	e8 bc 31 00 00       	call   3d9a <close>
     bde:	83 c4 10             	add    $0x10,%esp
     be1:	89 f0                	mov    %esi,%eax
     be3:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx
     be9:	89 f3                	mov    %esi,%ebx
     beb:	f7 d8                	neg    %eax
     bed:	8d 76 00             	lea    0x0(%esi),%esi
     bf0:	88 9c 18 80 8a 00 00 	mov    %bl,0x8a80(%eax,%ebx,1)
     bf7:	83 c3 01             	add    $0x1,%ebx
     bfa:	39 d3                	cmp    %edx,%ebx
     bfc:	75 f2                	jne    bf0 <pipe1+0xd0>
     bfe:	83 ec 04             	sub    $0x4,%esp
     c01:	89 de                	mov    %ebx,%esi
     c03:	68 09 04 00 00       	push   $0x409
     c08:	68 80 8a 00 00       	push   $0x8a80
     c0d:	ff 75 e4             	pushl  -0x1c(%ebp)
     c10:	e8 7d 31 00 00       	call   3d92 <write>
     c15:	83 c4 10             	add    $0x10,%esp
     c18:	3d 09 04 00 00       	cmp    $0x409,%eax
     c1d:	0f 85 95 00 00 00    	jne    cb8 <pipe1+0x198>
     c23:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     c29:	75 b6                	jne    be1 <pipe1+0xc1>
     c2b:	83 ec 0c             	sub    $0xc,%esp
     c2e:	6a 00                	push   $0x0
     c30:	e8 3d 31 00 00       	call   3d72 <exit>
     c35:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     c3c:	75 26                	jne    c64 <pipe1+0x144>
     c3e:	83 ec 0c             	sub    $0xc,%esp
     c41:	ff 75 e0             	pushl  -0x20(%ebp)
     c44:	e8 51 31 00 00       	call   3d9a <close>
     c49:	e8 2c 31 00 00       	call   3d7a <wait>
     c4e:	58                   	pop    %eax
     c4f:	5a                   	pop    %edx
     c50:	68 ab 45 00 00       	push   $0x45ab
     c55:	6a 01                	push   $0x1
     c57:	e8 64 32 00 00       	call   3ec0 <printf>
     c5c:	83 c4 10             	add    $0x10,%esp
     c5f:	e9 65 ff ff ff       	jmp    bc9 <pipe1+0xa9>
     c64:	83 ec 04             	sub    $0x4,%esp
     c67:	ff 75 d4             	pushl  -0x2c(%ebp)
     c6a:	68 94 45 00 00       	push   $0x4594
     c6f:	6a 01                	push   $0x1
     c71:	e8 4a 32 00 00       	call   3ec0 <printf>
     c76:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c7d:	e8 f0 30 00 00       	call   3d72 <exit>
     c82:	83 ec 08             	sub    $0x8,%esp
     c85:	68 69 45 00 00       	push   $0x4569
     c8a:	6a 01                	push   $0x1
     c8c:	e8 2f 32 00 00       	call   3ec0 <printf>
     c91:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c98:	e8 d5 30 00 00       	call   3d72 <exit>
     c9d:	83 ec 08             	sub    $0x8,%esp
     ca0:	68 b5 45 00 00       	push   $0x45b5
     ca5:	6a 01                	push   $0x1
     ca7:	e8 14 32 00 00       	call   3ec0 <printf>
     cac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     cb3:	e8 ba 30 00 00       	call   3d72 <exit>
     cb8:	83 ec 08             	sub    $0x8,%esp
     cbb:	68 78 45 00 00       	push   $0x4578
     cc0:	6a 01                	push   $0x1
     cc2:	e8 f9 31 00 00       	call   3ec0 <printf>
     cc7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     cce:	e8 9f 30 00 00       	call   3d72 <exit>
     cd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ce0 <preempt>:
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	57                   	push   %edi
     ce4:	56                   	push   %esi
     ce5:	53                   	push   %ebx
     ce6:	83 ec 24             	sub    $0x24,%esp
     ce9:	68 c4 45 00 00       	push   $0x45c4
     cee:	6a 01                	push   $0x1
     cf0:	e8 cb 31 00 00       	call   3ec0 <printf>
     cf5:	e8 70 30 00 00       	call   3d6a <fork>
     cfa:	83 c4 10             	add    $0x10,%esp
     cfd:	85 c0                	test   %eax,%eax
     cff:	75 02                	jne    d03 <preempt+0x23>
     d01:	eb fe                	jmp    d01 <preempt+0x21>
     d03:	89 c7                	mov    %eax,%edi
     d05:	e8 60 30 00 00       	call   3d6a <fork>
     d0a:	85 c0                	test   %eax,%eax
     d0c:	89 c6                	mov    %eax,%esi
     d0e:	75 02                	jne    d12 <preempt+0x32>
     d10:	eb fe                	jmp    d10 <preempt+0x30>
     d12:	8d 45 e0             	lea    -0x20(%ebp),%eax
     d15:	83 ec 0c             	sub    $0xc,%esp
     d18:	50                   	push   %eax
     d19:	e8 64 30 00 00       	call   3d82 <pipe>
     d1e:	e8 47 30 00 00       	call   3d6a <fork>
     d23:	83 c4 10             	add    $0x10,%esp
     d26:	85 c0                	test   %eax,%eax
     d28:	89 c3                	mov    %eax,%ebx
     d2a:	75 47                	jne    d73 <preempt+0x93>
     d2c:	83 ec 0c             	sub    $0xc,%esp
     d2f:	ff 75 e0             	pushl  -0x20(%ebp)
     d32:	e8 63 30 00 00       	call   3d9a <close>
     d37:	83 c4 0c             	add    $0xc,%esp
     d3a:	6a 01                	push   $0x1
     d3c:	68 89 4b 00 00       	push   $0x4b89
     d41:	ff 75 e4             	pushl  -0x1c(%ebp)
     d44:	e8 49 30 00 00       	call   3d92 <write>
     d49:	83 c4 10             	add    $0x10,%esp
     d4c:	83 f8 01             	cmp    $0x1,%eax
     d4f:	74 12                	je     d63 <preempt+0x83>
     d51:	83 ec 08             	sub    $0x8,%esp
     d54:	68 ce 45 00 00       	push   $0x45ce
     d59:	6a 01                	push   $0x1
     d5b:	e8 60 31 00 00       	call   3ec0 <printf>
     d60:	83 c4 10             	add    $0x10,%esp
     d63:	83 ec 0c             	sub    $0xc,%esp
     d66:	ff 75 e4             	pushl  -0x1c(%ebp)
     d69:	e8 2c 30 00 00       	call   3d9a <close>
     d6e:	83 c4 10             	add    $0x10,%esp
     d71:	eb fe                	jmp    d71 <preempt+0x91>
     d73:	83 ec 0c             	sub    $0xc,%esp
     d76:	ff 75 e4             	pushl  -0x1c(%ebp)
     d79:	e8 1c 30 00 00       	call   3d9a <close>
     d7e:	83 c4 0c             	add    $0xc,%esp
     d81:	68 00 20 00 00       	push   $0x2000
     d86:	68 80 8a 00 00       	push   $0x8a80
     d8b:	ff 75 e0             	pushl  -0x20(%ebp)
     d8e:	e8 f7 2f 00 00       	call   3d8a <read>
     d93:	83 c4 10             	add    $0x10,%esp
     d96:	83 f8 01             	cmp    $0x1,%eax
     d99:	74 1a                	je     db5 <preempt+0xd5>
     d9b:	83 ec 08             	sub    $0x8,%esp
     d9e:	68 e2 45 00 00       	push   $0x45e2
     da3:	6a 01                	push   $0x1
     da5:	e8 16 31 00 00       	call   3ec0 <printf>
     daa:	83 c4 10             	add    $0x10,%esp
     dad:	8d 65 f4             	lea    -0xc(%ebp),%esp
     db0:	5b                   	pop    %ebx
     db1:	5e                   	pop    %esi
     db2:	5f                   	pop    %edi
     db3:	5d                   	pop    %ebp
     db4:	c3                   	ret    
     db5:	83 ec 0c             	sub    $0xc,%esp
     db8:	ff 75 e0             	pushl  -0x20(%ebp)
     dbb:	e8 da 2f 00 00       	call   3d9a <close>
     dc0:	58                   	pop    %eax
     dc1:	5a                   	pop    %edx
     dc2:	68 f5 45 00 00       	push   $0x45f5
     dc7:	6a 01                	push   $0x1
     dc9:	e8 f2 30 00 00       	call   3ec0 <printf>
     dce:	89 3c 24             	mov    %edi,(%esp)
     dd1:	e8 cc 2f 00 00       	call   3da2 <kill>
     dd6:	89 34 24             	mov    %esi,(%esp)
     dd9:	e8 c4 2f 00 00       	call   3da2 <kill>
     dde:	89 1c 24             	mov    %ebx,(%esp)
     de1:	e8 bc 2f 00 00       	call   3da2 <kill>
     de6:	59                   	pop    %ecx
     de7:	5b                   	pop    %ebx
     de8:	68 fe 45 00 00       	push   $0x45fe
     ded:	6a 01                	push   $0x1
     def:	e8 cc 30 00 00       	call   3ec0 <printf>
     df4:	e8 81 2f 00 00       	call   3d7a <wait>
     df9:	e8 7c 2f 00 00       	call   3d7a <wait>
     dfe:	e8 77 2f 00 00       	call   3d7a <wait>
     e03:	5e                   	pop    %esi
     e04:	5f                   	pop    %edi
     e05:	68 07 46 00 00       	push   $0x4607
     e0a:	6a 01                	push   $0x1
     e0c:	e8 af 30 00 00       	call   3ec0 <printf>
     e11:	83 c4 10             	add    $0x10,%esp
     e14:	eb 97                	jmp    dad <preempt+0xcd>
     e16:	8d 76 00             	lea    0x0(%esi),%esi
     e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e20 <exitwait>:
     e20:	55                   	push   %ebp
     e21:	89 e5                	mov    %esp,%ebp
     e23:	56                   	push   %esi
     e24:	be 64 00 00 00       	mov    $0x64,%esi
     e29:	53                   	push   %ebx
     e2a:	eb 14                	jmp    e40 <exitwait+0x20>
     e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e30:	74 6f                	je     ea1 <exitwait+0x81>
     e32:	e8 43 2f 00 00       	call   3d7a <wait>
     e37:	39 c3                	cmp    %eax,%ebx
     e39:	75 2d                	jne    e68 <exitwait+0x48>
     e3b:	83 ee 01             	sub    $0x1,%esi
     e3e:	74 48                	je     e88 <exitwait+0x68>
     e40:	e8 25 2f 00 00       	call   3d6a <fork>
     e45:	85 c0                	test   %eax,%eax
     e47:	89 c3                	mov    %eax,%ebx
     e49:	79 e5                	jns    e30 <exitwait+0x10>
     e4b:	83 ec 08             	sub    $0x8,%esp
     e4e:	68 71 51 00 00       	push   $0x5171
     e53:	6a 01                	push   $0x1
     e55:	e8 66 30 00 00       	call   3ec0 <printf>
     e5a:	83 c4 10             	add    $0x10,%esp
     e5d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e60:	5b                   	pop    %ebx
     e61:	5e                   	pop    %esi
     e62:	5d                   	pop    %ebp
     e63:	c3                   	ret    
     e64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e68:	83 ec 08             	sub    $0x8,%esp
     e6b:	68 13 46 00 00       	push   $0x4613
     e70:	6a 01                	push   $0x1
     e72:	e8 49 30 00 00       	call   3ec0 <printf>
     e77:	83 c4 10             	add    $0x10,%esp
     e7a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e7d:	5b                   	pop    %ebx
     e7e:	5e                   	pop    %esi
     e7f:	5d                   	pop    %ebp
     e80:	c3                   	ret    
     e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e88:	83 ec 08             	sub    $0x8,%esp
     e8b:	68 23 46 00 00       	push   $0x4623
     e90:	6a 01                	push   $0x1
     e92:	e8 29 30 00 00       	call   3ec0 <printf>
     e97:	83 c4 10             	add    $0x10,%esp
     e9a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e9d:	5b                   	pop    %ebx
     e9e:	5e                   	pop    %esi
     e9f:	5d                   	pop    %ebp
     ea0:	c3                   	ret    
     ea1:	83 ec 0c             	sub    $0xc,%esp
     ea4:	6a 00                	push   $0x0
     ea6:	e8 c7 2e 00 00       	call   3d72 <exit>
     eab:	90                   	nop
     eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000eb0 <mem>:
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	57                   	push   %edi
     eb4:	56                   	push   %esi
     eb5:	53                   	push   %ebx
     eb6:	83 ec 14             	sub    $0x14,%esp
     eb9:	68 30 46 00 00       	push   $0x4630
     ebe:	6a 01                	push   $0x1
     ec0:	e8 fb 2f 00 00       	call   3ec0 <printf>
     ec5:	e8 28 2f 00 00       	call   3df2 <getpid>
     eca:	89 c6                	mov    %eax,%esi
     ecc:	e8 99 2e 00 00       	call   3d6a <fork>
     ed1:	83 c4 10             	add    $0x10,%esp
     ed4:	85 c0                	test   %eax,%eax
     ed6:	75 78                	jne    f50 <mem+0xa0>
     ed8:	31 db                	xor    %ebx,%ebx
     eda:	eb 08                	jmp    ee4 <mem+0x34>
     edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ee0:	89 18                	mov    %ebx,(%eax)
     ee2:	89 c3                	mov    %eax,%ebx
     ee4:	83 ec 0c             	sub    $0xc,%esp
     ee7:	68 11 27 00 00       	push   $0x2711
     eec:	e8 4f 32 00 00       	call   4140 <malloc>
     ef1:	83 c4 10             	add    $0x10,%esp
     ef4:	85 c0                	test   %eax,%eax
     ef6:	75 e8                	jne    ee0 <mem+0x30>
     ef8:	85 db                	test   %ebx,%ebx
     efa:	74 18                	je     f14 <mem+0x64>
     efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f00:	8b 3b                	mov    (%ebx),%edi
     f02:	83 ec 0c             	sub    $0xc,%esp
     f05:	53                   	push   %ebx
     f06:	89 fb                	mov    %edi,%ebx
     f08:	e8 a3 31 00 00       	call   40b0 <free>
     f0d:	83 c4 10             	add    $0x10,%esp
     f10:	85 db                	test   %ebx,%ebx
     f12:	75 ec                	jne    f00 <mem+0x50>
     f14:	83 ec 0c             	sub    $0xc,%esp
     f17:	68 00 50 00 00       	push   $0x5000
     f1c:	e8 1f 32 00 00       	call   4140 <malloc>
     f21:	83 c4 10             	add    $0x10,%esp
     f24:	85 c0                	test   %eax,%eax
     f26:	74 38                	je     f60 <mem+0xb0>
     f28:	83 ec 0c             	sub    $0xc,%esp
     f2b:	50                   	push   %eax
     f2c:	e8 7f 31 00 00       	call   40b0 <free>
     f31:	58                   	pop    %eax
     f32:	5a                   	pop    %edx
     f33:	68 54 46 00 00       	push   $0x4654
     f38:	6a 01                	push   $0x1
     f3a:	e8 81 2f 00 00       	call   3ec0 <printf>
     f3f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     f46:	e8 27 2e 00 00       	call   3d72 <exit>
     f4b:	90                   	nop
     f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f50:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f53:	5b                   	pop    %ebx
     f54:	5e                   	pop    %esi
     f55:	5f                   	pop    %edi
     f56:	5d                   	pop    %ebp
     f57:	e9 1e 2e 00 00       	jmp    3d7a <wait>
     f5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f60:	83 ec 08             	sub    $0x8,%esp
     f63:	68 3a 46 00 00       	push   $0x463a
     f68:	6a 01                	push   $0x1
     f6a:	e8 51 2f 00 00       	call   3ec0 <printf>
     f6f:	89 34 24             	mov    %esi,(%esp)
     f72:	e8 2b 2e 00 00       	call   3da2 <kill>
     f77:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     f7e:	e8 ef 2d 00 00       	call   3d72 <exit>
     f83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000f90 <sharedfd>:
     f90:	55                   	push   %ebp
     f91:	89 e5                	mov    %esp,%ebp
     f93:	57                   	push   %edi
     f94:	56                   	push   %esi
     f95:	53                   	push   %ebx
     f96:	83 ec 34             	sub    $0x34,%esp
     f99:	68 5c 46 00 00       	push   $0x465c
     f9e:	6a 01                	push   $0x1
     fa0:	e8 1b 2f 00 00       	call   3ec0 <printf>
     fa5:	c7 04 24 6b 46 00 00 	movl   $0x466b,(%esp)
     fac:	e8 11 2e 00 00       	call   3dc2 <unlink>
     fb1:	5b                   	pop    %ebx
     fb2:	5e                   	pop    %esi
     fb3:	68 02 02 00 00       	push   $0x202
     fb8:	68 6b 46 00 00       	push   $0x466b
     fbd:	e8 f0 2d 00 00       	call   3db2 <open>
     fc2:	83 c4 10             	add    $0x10,%esp
     fc5:	85 c0                	test   %eax,%eax
     fc7:	0f 88 29 01 00 00    	js     10f6 <sharedfd+0x166>
     fcd:	89 c7                	mov    %eax,%edi
     fcf:	8d 75 de             	lea    -0x22(%ebp),%esi
     fd2:	bb e8 03 00 00       	mov    $0x3e8,%ebx
     fd7:	e8 8e 2d 00 00       	call   3d6a <fork>
     fdc:	83 f8 01             	cmp    $0x1,%eax
     fdf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
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
    1000:	83 eb 01             	sub    $0x1,%ebx
    1003:	74 26                	je     102b <sharedfd+0x9b>
    1005:	83 ec 04             	sub    $0x4,%esp
    1008:	6a 0a                	push   $0xa
    100a:	56                   	push   %esi
    100b:	57                   	push   %edi
    100c:	e8 81 2d 00 00       	call   3d92 <write>
    1011:	83 c4 10             	add    $0x10,%esp
    1014:	83 f8 0a             	cmp    $0xa,%eax
    1017:	74 e7                	je     1000 <sharedfd+0x70>
    1019:	83 ec 08             	sub    $0x8,%esp
    101c:	68 5c 53 00 00       	push   $0x535c
    1021:	6a 01                	push   $0x1
    1023:	e8 98 2e 00 00       	call   3ec0 <printf>
    1028:	83 c4 10             	add    $0x10,%esp
    102b:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    102e:	85 c9                	test   %ecx,%ecx
    1030:	0f 84 f4 00 00 00    	je     112a <sharedfd+0x19a>
    1036:	e8 3f 2d 00 00       	call   3d7a <wait>
    103b:	83 ec 0c             	sub    $0xc,%esp
    103e:	31 db                	xor    %ebx,%ebx
    1040:	57                   	push   %edi
    1041:	8d 7d e8             	lea    -0x18(%ebp),%edi
    1044:	e8 51 2d 00 00       	call   3d9a <close>
    1049:	58                   	pop    %eax
    104a:	5a                   	pop    %edx
    104b:	6a 00                	push   $0x0
    104d:	68 6b 46 00 00       	push   $0x466b
    1052:	e8 5b 2d 00 00       	call   3db2 <open>
    1057:	83 c4 10             	add    $0x10,%esp
    105a:	31 d2                	xor    %edx,%edx
    105c:	85 c0                	test   %eax,%eax
    105e:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1061:	0f 88 a9 00 00 00    	js     1110 <sharedfd+0x180>
    1067:	89 f6                	mov    %esi,%esi
    1069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1070:	83 ec 04             	sub    $0x4,%esp
    1073:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    1076:	6a 0a                	push   $0xa
    1078:	56                   	push   %esi
    1079:	ff 75 d0             	pushl  -0x30(%ebp)
    107c:	e8 09 2d 00 00       	call   3d8a <read>
    1081:	83 c4 10             	add    $0x10,%esp
    1084:	85 c0                	test   %eax,%eax
    1086:	7e 27                	jle    10af <sharedfd+0x11f>
    1088:	89 f0                	mov    %esi,%eax
    108a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    108d:	eb 13                	jmp    10a2 <sharedfd+0x112>
    108f:	90                   	nop
    1090:	80 f9 70             	cmp    $0x70,%cl
    1093:	0f 94 c1             	sete   %cl
    1096:	0f b6 c9             	movzbl %cl,%ecx
    1099:	01 cb                	add    %ecx,%ebx
    109b:	83 c0 01             	add    $0x1,%eax
    109e:	39 c7                	cmp    %eax,%edi
    10a0:	74 ce                	je     1070 <sharedfd+0xe0>
    10a2:	0f b6 08             	movzbl (%eax),%ecx
    10a5:	80 f9 63             	cmp    $0x63,%cl
    10a8:	75 e6                	jne    1090 <sharedfd+0x100>
    10aa:	83 c2 01             	add    $0x1,%edx
    10ad:	eb ec                	jmp    109b <sharedfd+0x10b>
    10af:	83 ec 0c             	sub    $0xc,%esp
    10b2:	ff 75 d0             	pushl  -0x30(%ebp)
    10b5:	e8 e0 2c 00 00       	call   3d9a <close>
    10ba:	c7 04 24 6b 46 00 00 	movl   $0x466b,(%esp)
    10c1:	e8 fc 2c 00 00       	call   3dc2 <unlink>
    10c6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    10c9:	83 c4 10             	add    $0x10,%esp
    10cc:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
    10d2:	75 60                	jne    1134 <sharedfd+0x1a4>
    10d4:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    10da:	75 58                	jne    1134 <sharedfd+0x1a4>
    10dc:	83 ec 08             	sub    $0x8,%esp
    10df:	68 74 46 00 00       	push   $0x4674
    10e4:	6a 01                	push   $0x1
    10e6:	e8 d5 2d 00 00       	call   3ec0 <printf>
    10eb:	83 c4 10             	add    $0x10,%esp
    10ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10f1:	5b                   	pop    %ebx
    10f2:	5e                   	pop    %esi
    10f3:	5f                   	pop    %edi
    10f4:	5d                   	pop    %ebp
    10f5:	c3                   	ret    
    10f6:	83 ec 08             	sub    $0x8,%esp
    10f9:	68 30 53 00 00       	push   $0x5330
    10fe:	6a 01                	push   $0x1
    1100:	e8 bb 2d 00 00       	call   3ec0 <printf>
    1105:	83 c4 10             	add    $0x10,%esp
    1108:	8d 65 f4             	lea    -0xc(%ebp),%esp
    110b:	5b                   	pop    %ebx
    110c:	5e                   	pop    %esi
    110d:	5f                   	pop    %edi
    110e:	5d                   	pop    %ebp
    110f:	c3                   	ret    
    1110:	83 ec 08             	sub    $0x8,%esp
    1113:	68 7c 53 00 00       	push   $0x537c
    1118:	6a 01                	push   $0x1
    111a:	e8 a1 2d 00 00       	call   3ec0 <printf>
    111f:	83 c4 10             	add    $0x10,%esp
    1122:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1125:	5b                   	pop    %ebx
    1126:	5e                   	pop    %esi
    1127:	5f                   	pop    %edi
    1128:	5d                   	pop    %ebp
    1129:	c3                   	ret    
    112a:	83 ec 0c             	sub    $0xc,%esp
    112d:	6a 00                	push   $0x0
    112f:	e8 3e 2c 00 00       	call   3d72 <exit>
    1134:	53                   	push   %ebx
    1135:	52                   	push   %edx
    1136:	68 81 46 00 00       	push   $0x4681
    113b:	6a 01                	push   $0x1
    113d:	e8 7e 2d 00 00       	call   3ec0 <printf>
    1142:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1149:	e8 24 2c 00 00       	call   3d72 <exit>
    114e:	66 90                	xchg   %ax,%ax

00001150 <fourfiles>:
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	57                   	push   %edi
    1154:	56                   	push   %esi
    1155:	53                   	push   %ebx
    1156:	be 96 46 00 00       	mov    $0x4696,%esi
    115b:	31 db                	xor    %ebx,%ebx
    115d:	83 ec 34             	sub    $0x34,%esp
    1160:	c7 45 d8 96 46 00 00 	movl   $0x4696,-0x28(%ebp)
    1167:	c7 45 dc df 47 00 00 	movl   $0x47df,-0x24(%ebp)
    116e:	68 9c 46 00 00       	push   $0x469c
    1173:	6a 01                	push   $0x1
    1175:	c7 45 e0 e3 47 00 00 	movl   $0x47e3,-0x20(%ebp)
    117c:	c7 45 e4 99 46 00 00 	movl   $0x4699,-0x1c(%ebp)
    1183:	e8 38 2d 00 00       	call   3ec0 <printf>
    1188:	83 c4 10             	add    $0x10,%esp
    118b:	83 ec 0c             	sub    $0xc,%esp
    118e:	56                   	push   %esi
    118f:	e8 2e 2c 00 00       	call   3dc2 <unlink>
    1194:	e8 d1 2b 00 00       	call   3d6a <fork>
    1199:	83 c4 10             	add    $0x10,%esp
    119c:	85 c0                	test   %eax,%eax
    119e:	0f 88 a4 01 00 00    	js     1348 <fourfiles+0x1f8>
    11a4:	0f 84 ea 00 00 00    	je     1294 <fourfiles+0x144>
    11aa:	83 c3 01             	add    $0x1,%ebx
    11ad:	83 fb 04             	cmp    $0x4,%ebx
    11b0:	74 06                	je     11b8 <fourfiles+0x68>
    11b2:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    11b6:	eb d3                	jmp    118b <fourfiles+0x3b>
    11b8:	e8 bd 2b 00 00       	call   3d7a <wait>
    11bd:	bf 30 00 00 00       	mov    $0x30,%edi
    11c2:	e8 b3 2b 00 00       	call   3d7a <wait>
    11c7:	e8 ae 2b 00 00       	call   3d7a <wait>
    11cc:	e8 a9 2b 00 00       	call   3d7a <wait>
    11d1:	c7 45 d4 96 46 00 00 	movl   $0x4696,-0x2c(%ebp)
    11d8:	83 ec 08             	sub    $0x8,%esp
    11db:	31 db                	xor    %ebx,%ebx
    11dd:	6a 00                	push   $0x0
    11df:	ff 75 d4             	pushl  -0x2c(%ebp)
    11e2:	e8 cb 2b 00 00       	call   3db2 <open>
    11e7:	83 c4 10             	add    $0x10,%esp
    11ea:	89 c6                	mov    %eax,%esi
    11ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11f0:	83 ec 04             	sub    $0x4,%esp
    11f3:	68 00 20 00 00       	push   $0x2000
    11f8:	68 80 8a 00 00       	push   $0x8a80
    11fd:	56                   	push   %esi
    11fe:	e8 87 2b 00 00       	call   3d8a <read>
    1203:	83 c4 10             	add    $0x10,%esp
    1206:	85 c0                	test   %eax,%eax
    1208:	7e 1c                	jle    1226 <fourfiles+0xd6>
    120a:	31 d2                	xor    %edx,%edx
    120c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1210:	0f be 8a 80 8a 00 00 	movsbl 0x8a80(%edx),%ecx
    1217:	39 cf                	cmp    %ecx,%edi
    1219:	75 5e                	jne    1279 <fourfiles+0x129>
    121b:	83 c2 01             	add    $0x1,%edx
    121e:	39 d0                	cmp    %edx,%eax
    1220:	75 ee                	jne    1210 <fourfiles+0xc0>
    1222:	01 c3                	add    %eax,%ebx
    1224:	eb ca                	jmp    11f0 <fourfiles+0xa0>
    1226:	83 ec 0c             	sub    $0xc,%esp
    1229:	56                   	push   %esi
    122a:	e8 6b 2b 00 00       	call   3d9a <close>
    122f:	83 c4 10             	add    $0x10,%esp
    1232:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1238:	0f 85 ee 00 00 00    	jne    132c <fourfiles+0x1dc>
    123e:	83 ec 0c             	sub    $0xc,%esp
    1241:	ff 75 d4             	pushl  -0x2c(%ebp)
    1244:	83 c7 01             	add    $0x1,%edi
    1247:	e8 76 2b 00 00       	call   3dc2 <unlink>
    124c:	83 c4 10             	add    $0x10,%esp
    124f:	83 ff 32             	cmp    $0x32,%edi
    1252:	75 1a                	jne    126e <fourfiles+0x11e>
    1254:	83 ec 08             	sub    $0x8,%esp
    1257:	68 da 46 00 00       	push   $0x46da
    125c:	6a 01                	push   $0x1
    125e:	e8 5d 2c 00 00       	call   3ec0 <printf>
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
    1279:	83 ec 08             	sub    $0x8,%esp
    127c:	68 bd 46 00 00       	push   $0x46bd
    1281:	6a 01                	push   $0x1
    1283:	e8 38 2c 00 00       	call   3ec0 <printf>
    1288:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    128f:	e8 de 2a 00 00       	call   3d72 <exit>
    1294:	83 ec 08             	sub    $0x8,%esp
    1297:	68 02 02 00 00       	push   $0x202
    129c:	56                   	push   %esi
    129d:	e8 10 2b 00 00       	call   3db2 <open>
    12a2:	83 c4 10             	add    $0x10,%esp
    12a5:	85 c0                	test   %eax,%eax
    12a7:	89 c6                	mov    %eax,%esi
    12a9:	78 66                	js     1311 <fourfiles+0x1c1>
    12ab:	83 ec 04             	sub    $0x4,%esp
    12ae:	83 c3 30             	add    $0x30,%ebx
    12b1:	68 00 02 00 00       	push   $0x200
    12b6:	53                   	push   %ebx
    12b7:	bb 0c 00 00 00       	mov    $0xc,%ebx
    12bc:	68 80 8a 00 00       	push   $0x8a80
    12c1:	e8 3a 29 00 00       	call   3c00 <memset>
    12c6:	83 c4 10             	add    $0x10,%esp
    12c9:	83 ec 04             	sub    $0x4,%esp
    12cc:	68 f4 01 00 00       	push   $0x1f4
    12d1:	68 80 8a 00 00       	push   $0x8a80
    12d6:	56                   	push   %esi
    12d7:	e8 b6 2a 00 00       	call   3d92 <write>
    12dc:	83 c4 10             	add    $0x10,%esp
    12df:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    12e4:	75 0f                	jne    12f5 <fourfiles+0x1a5>
    12e6:	83 eb 01             	sub    $0x1,%ebx
    12e9:	75 de                	jne    12c9 <fourfiles+0x179>
    12eb:	83 ec 0c             	sub    $0xc,%esp
    12ee:	6a 00                	push   $0x0
    12f0:	e8 7d 2a 00 00       	call   3d72 <exit>
    12f5:	83 ec 04             	sub    $0x4,%esp
    12f8:	50                   	push   %eax
    12f9:	68 ac 46 00 00       	push   $0x46ac
    12fe:	6a 01                	push   $0x1
    1300:	e8 bb 2b 00 00       	call   3ec0 <printf>
    1305:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    130c:	e8 61 2a 00 00       	call   3d72 <exit>
    1311:	83 ec 08             	sub    $0x8,%esp
    1314:	68 37 49 00 00       	push   $0x4937
    1319:	6a 01                	push   $0x1
    131b:	e8 a0 2b 00 00       	call   3ec0 <printf>
    1320:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1327:	e8 46 2a 00 00       	call   3d72 <exit>
    132c:	83 ec 04             	sub    $0x4,%esp
    132f:	53                   	push   %ebx
    1330:	68 c9 46 00 00       	push   $0x46c9
    1335:	6a 01                	push   $0x1
    1337:	e8 84 2b 00 00       	call   3ec0 <printf>
    133c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1343:	e8 2a 2a 00 00       	call   3d72 <exit>
    1348:	83 ec 08             	sub    $0x8,%esp
    134b:	68 71 51 00 00       	push   $0x5171
    1350:	6a 01                	push   $0x1
    1352:	e8 69 2b 00 00       	call   3ec0 <printf>
    1357:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    135e:	e8 0f 2a 00 00       	call   3d72 <exit>
    1363:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001370 <createdelete>:
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	57                   	push   %edi
    1374:	56                   	push   %esi
    1375:	53                   	push   %ebx
    1376:	31 db                	xor    %ebx,%ebx
    1378:	83 ec 44             	sub    $0x44,%esp
    137b:	68 e8 46 00 00       	push   $0x46e8
    1380:	6a 01                	push   $0x1
    1382:	e8 39 2b 00 00       	call   3ec0 <printf>
    1387:	83 c4 10             	add    $0x10,%esp
    138a:	e8 db 29 00 00       	call   3d6a <fork>
    138f:	85 c0                	test   %eax,%eax
    1391:	0f 88 ca 01 00 00    	js     1561 <createdelete+0x1f1>
    1397:	0f 84 f6 00 00 00    	je     1493 <createdelete+0x123>
    139d:	83 c3 01             	add    $0x1,%ebx
    13a0:	83 fb 04             	cmp    $0x4,%ebx
    13a3:	75 e5                	jne    138a <createdelete+0x1a>
    13a5:	8d 7d c8             	lea    -0x38(%ebp),%edi
    13a8:	31 f6                	xor    %esi,%esi
    13aa:	e8 cb 29 00 00       	call   3d7a <wait>
    13af:	e8 c6 29 00 00       	call   3d7a <wait>
    13b4:	e8 c1 29 00 00       	call   3d7a <wait>
    13b9:	e8 bc 29 00 00       	call   3d7a <wait>
    13be:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    13c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    13c8:	8d 46 30             	lea    0x30(%esi),%eax
    13cb:	83 fe 09             	cmp    $0x9,%esi
    13ce:	bb 70 00 00 00       	mov    $0x70,%ebx
    13d3:	0f 9f c2             	setg   %dl
    13d6:	85 f6                	test   %esi,%esi
    13d8:	88 45 c7             	mov    %al,-0x39(%ebp)
    13db:	0f 94 c0             	sete   %al
    13de:	09 c2                	or     %eax,%edx
    13e0:	8d 46 ff             	lea    -0x1(%esi),%eax
    13e3:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    13e6:	89 45 c0             	mov    %eax,-0x40(%ebp)
    13e9:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
    13ed:	83 ec 08             	sub    $0x8,%esp
    13f0:	88 5d c8             	mov    %bl,-0x38(%ebp)
    13f3:	6a 00                	push   $0x0
    13f5:	57                   	push   %edi
    13f6:	88 45 c9             	mov    %al,-0x37(%ebp)
    13f9:	e8 b4 29 00 00       	call   3db2 <open>
    13fe:	89 c1                	mov    %eax,%ecx
    1400:	83 c4 10             	add    $0x10,%esp
    1403:	c1 e9 1f             	shr    $0x1f,%ecx
    1406:	84 c9                	test   %cl,%cl
    1408:	74 0a                	je     1414 <createdelete+0xa4>
    140a:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    140e:	0f 85 16 01 00 00    	jne    152a <createdelete+0x1ba>
    1414:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    1418:	0f 86 5e 01 00 00    	jbe    157c <createdelete+0x20c>
    141e:	85 c0                	test   %eax,%eax
    1420:	78 0c                	js     142e <createdelete+0xbe>
    1422:	83 ec 0c             	sub    $0xc,%esp
    1425:	50                   	push   %eax
    1426:	e8 6f 29 00 00       	call   3d9a <close>
    142b:	83 c4 10             	add    $0x10,%esp
    142e:	83 c3 01             	add    $0x1,%ebx
    1431:	80 fb 74             	cmp    $0x74,%bl
    1434:	75 b3                	jne    13e9 <createdelete+0x79>
    1436:	83 c6 01             	add    $0x1,%esi
    1439:	83 fe 14             	cmp    $0x14,%esi
    143c:	75 8a                	jne    13c8 <createdelete+0x58>
    143e:	be 70 00 00 00       	mov    $0x70,%esi
    1443:	90                   	nop
    1444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1448:	8d 46 c0             	lea    -0x40(%esi),%eax
    144b:	bb 04 00 00 00       	mov    $0x4,%ebx
    1450:	88 45 c7             	mov    %al,-0x39(%ebp)
    1453:	89 f0                	mov    %esi,%eax
    1455:	83 ec 0c             	sub    $0xc,%esp
    1458:	88 45 c8             	mov    %al,-0x38(%ebp)
    145b:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
    145f:	57                   	push   %edi
    1460:	88 45 c9             	mov    %al,-0x37(%ebp)
    1463:	e8 5a 29 00 00       	call   3dc2 <unlink>
    1468:	83 c4 10             	add    $0x10,%esp
    146b:	83 eb 01             	sub    $0x1,%ebx
    146e:	75 e3                	jne    1453 <createdelete+0xe3>
    1470:	83 c6 01             	add    $0x1,%esi
    1473:	89 f0                	mov    %esi,%eax
    1475:	3c 84                	cmp    $0x84,%al
    1477:	75 cf                	jne    1448 <createdelete+0xd8>
    1479:	83 ec 08             	sub    $0x8,%esp
    147c:	68 fb 46 00 00       	push   $0x46fb
    1481:	6a 01                	push   $0x1
    1483:	e8 38 2a 00 00       	call   3ec0 <printf>
    1488:	83 c4 10             	add    $0x10,%esp
    148b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    148e:	5b                   	pop    %ebx
    148f:	5e                   	pop    %esi
    1490:	5f                   	pop    %edi
    1491:	5d                   	pop    %ebp
    1492:	c3                   	ret    
    1493:	83 c3 70             	add    $0x70,%ebx
    1496:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    149a:	be 01 00 00 00       	mov    $0x1,%esi
    149f:	88 5d c8             	mov    %bl,-0x38(%ebp)
    14a2:	8d 7d c8             	lea    -0x38(%ebp),%edi
    14a5:	31 db                	xor    %ebx,%ebx
    14a7:	eb 12                	jmp    14bb <createdelete+0x14b>
    14a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14b0:	83 fe 14             	cmp    $0x14,%esi
    14b3:	74 6b                	je     1520 <createdelete+0x1b0>
    14b5:	83 c3 01             	add    $0x1,%ebx
    14b8:	83 c6 01             	add    $0x1,%esi
    14bb:	83 ec 08             	sub    $0x8,%esp
    14be:	8d 43 30             	lea    0x30(%ebx),%eax
    14c1:	68 02 02 00 00       	push   $0x202
    14c6:	57                   	push   %edi
    14c7:	88 45 c9             	mov    %al,-0x37(%ebp)
    14ca:	e8 e3 28 00 00       	call   3db2 <open>
    14cf:	83 c4 10             	add    $0x10,%esp
    14d2:	85 c0                	test   %eax,%eax
    14d4:	78 70                	js     1546 <createdelete+0x1d6>
    14d6:	83 ec 0c             	sub    $0xc,%esp
    14d9:	50                   	push   %eax
    14da:	e8 bb 28 00 00       	call   3d9a <close>
    14df:	83 c4 10             	add    $0x10,%esp
    14e2:	85 db                	test   %ebx,%ebx
    14e4:	74 cf                	je     14b5 <createdelete+0x145>
    14e6:	f6 c3 01             	test   $0x1,%bl
    14e9:	75 c5                	jne    14b0 <createdelete+0x140>
    14eb:	83 ec 0c             	sub    $0xc,%esp
    14ee:	89 d8                	mov    %ebx,%eax
    14f0:	d1 f8                	sar    %eax
    14f2:	57                   	push   %edi
    14f3:	83 c0 30             	add    $0x30,%eax
    14f6:	88 45 c9             	mov    %al,-0x37(%ebp)
    14f9:	e8 c4 28 00 00       	call   3dc2 <unlink>
    14fe:	83 c4 10             	add    $0x10,%esp
    1501:	85 c0                	test   %eax,%eax
    1503:	79 ab                	jns    14b0 <createdelete+0x140>
    1505:	83 ec 08             	sub    $0x8,%esp
    1508:	68 e9 42 00 00       	push   $0x42e9
    150d:	6a 01                	push   $0x1
    150f:	e8 ac 29 00 00       	call   3ec0 <printf>
    1514:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    151b:	e8 52 28 00 00       	call   3d72 <exit>
    1520:	83 ec 0c             	sub    $0xc,%esp
    1523:	6a 00                	push   $0x0
    1525:	e8 48 28 00 00       	call   3d72 <exit>
    152a:	83 ec 04             	sub    $0x4,%esp
    152d:	57                   	push   %edi
    152e:	68 a8 53 00 00       	push   $0x53a8
    1533:	6a 01                	push   $0x1
    1535:	e8 86 29 00 00       	call   3ec0 <printf>
    153a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1541:	e8 2c 28 00 00       	call   3d72 <exit>
    1546:	83 ec 08             	sub    $0x8,%esp
    1549:	68 37 49 00 00       	push   $0x4937
    154e:	6a 01                	push   $0x1
    1550:	e8 6b 29 00 00       	call   3ec0 <printf>
    1555:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    155c:	e8 11 28 00 00       	call   3d72 <exit>
    1561:	83 ec 08             	sub    $0x8,%esp
    1564:	68 71 51 00 00       	push   $0x5171
    1569:	6a 01                	push   $0x1
    156b:	e8 50 29 00 00       	call   3ec0 <printf>
    1570:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1577:	e8 f6 27 00 00       	call   3d72 <exit>
    157c:	85 c0                	test   %eax,%eax
    157e:	0f 88 aa fe ff ff    	js     142e <createdelete+0xbe>
    1584:	83 ec 04             	sub    $0x4,%esp
    1587:	57                   	push   %edi
    1588:	68 cc 53 00 00       	push   $0x53cc
    158d:	6a 01                	push   $0x1
    158f:	e8 2c 29 00 00       	call   3ec0 <printf>
    1594:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    159b:	e8 d2 27 00 00       	call   3d72 <exit>

000015a0 <unlinkread>:
    15a0:	55                   	push   %ebp
    15a1:	89 e5                	mov    %esp,%ebp
    15a3:	56                   	push   %esi
    15a4:	53                   	push   %ebx
    15a5:	83 ec 08             	sub    $0x8,%esp
    15a8:	68 0c 47 00 00       	push   $0x470c
    15ad:	6a 01                	push   $0x1
    15af:	e8 0c 29 00 00       	call   3ec0 <printf>
    15b4:	5b                   	pop    %ebx
    15b5:	5e                   	pop    %esi
    15b6:	68 02 02 00 00       	push   $0x202
    15bb:	68 1d 47 00 00       	push   $0x471d
    15c0:	e8 ed 27 00 00       	call   3db2 <open>
    15c5:	83 c4 10             	add    $0x10,%esp
    15c8:	85 c0                	test   %eax,%eax
    15ca:	0f 88 e6 00 00 00    	js     16b6 <unlinkread+0x116>
    15d0:	83 ec 04             	sub    $0x4,%esp
    15d3:	89 c3                	mov    %eax,%ebx
    15d5:	6a 05                	push   $0x5
    15d7:	68 42 47 00 00       	push   $0x4742
    15dc:	50                   	push   %eax
    15dd:	e8 b0 27 00 00       	call   3d92 <write>
    15e2:	89 1c 24             	mov    %ebx,(%esp)
    15e5:	e8 b0 27 00 00       	call   3d9a <close>
    15ea:	58                   	pop    %eax
    15eb:	5a                   	pop    %edx
    15ec:	6a 02                	push   $0x2
    15ee:	68 1d 47 00 00       	push   $0x471d
    15f3:	e8 ba 27 00 00       	call   3db2 <open>
    15f8:	83 c4 10             	add    $0x10,%esp
    15fb:	85 c0                	test   %eax,%eax
    15fd:	89 c3                	mov    %eax,%ebx
    15ff:	0f 88 33 01 00 00    	js     1738 <unlinkread+0x198>
    1605:	83 ec 0c             	sub    $0xc,%esp
    1608:	68 1d 47 00 00       	push   $0x471d
    160d:	e8 b0 27 00 00       	call   3dc2 <unlink>
    1612:	83 c4 10             	add    $0x10,%esp
    1615:	85 c0                	test   %eax,%eax
    1617:	0f 85 01 01 00 00    	jne    171e <unlinkread+0x17e>
    161d:	83 ec 08             	sub    $0x8,%esp
    1620:	68 02 02 00 00       	push   $0x202
    1625:	68 1d 47 00 00       	push   $0x471d
    162a:	e8 83 27 00 00       	call   3db2 <open>
    162f:	83 c4 0c             	add    $0xc,%esp
    1632:	89 c6                	mov    %eax,%esi
    1634:	6a 03                	push   $0x3
    1636:	68 7a 47 00 00       	push   $0x477a
    163b:	50                   	push   %eax
    163c:	e8 51 27 00 00       	call   3d92 <write>
    1641:	89 34 24             	mov    %esi,(%esp)
    1644:	e8 51 27 00 00       	call   3d9a <close>
    1649:	83 c4 0c             	add    $0xc,%esp
    164c:	68 00 20 00 00       	push   $0x2000
    1651:	68 80 8a 00 00       	push   $0x8a80
    1656:	53                   	push   %ebx
    1657:	e8 2e 27 00 00       	call   3d8a <read>
    165c:	83 c4 10             	add    $0x10,%esp
    165f:	83 f8 05             	cmp    $0x5,%eax
    1662:	0f 85 9c 00 00 00    	jne    1704 <unlinkread+0x164>
    1668:	80 3d 80 8a 00 00 68 	cmpb   $0x68,0x8a80
    166f:	75 79                	jne    16ea <unlinkread+0x14a>
    1671:	83 ec 04             	sub    $0x4,%esp
    1674:	6a 0a                	push   $0xa
    1676:	68 80 8a 00 00       	push   $0x8a80
    167b:	53                   	push   %ebx
    167c:	e8 11 27 00 00       	call   3d92 <write>
    1681:	83 c4 10             	add    $0x10,%esp
    1684:	83 f8 0a             	cmp    $0xa,%eax
    1687:	75 47                	jne    16d0 <unlinkread+0x130>
    1689:	83 ec 0c             	sub    $0xc,%esp
    168c:	53                   	push   %ebx
    168d:	e8 08 27 00 00       	call   3d9a <close>
    1692:	c7 04 24 1d 47 00 00 	movl   $0x471d,(%esp)
    1699:	e8 24 27 00 00       	call   3dc2 <unlink>
    169e:	58                   	pop    %eax
    169f:	5a                   	pop    %edx
    16a0:	68 c5 47 00 00       	push   $0x47c5
    16a5:	6a 01                	push   $0x1
    16a7:	e8 14 28 00 00       	call   3ec0 <printf>
    16ac:	83 c4 10             	add    $0x10,%esp
    16af:	8d 65 f8             	lea    -0x8(%ebp),%esp
    16b2:	5b                   	pop    %ebx
    16b3:	5e                   	pop    %esi
    16b4:	5d                   	pop    %ebp
    16b5:	c3                   	ret    
    16b6:	51                   	push   %ecx
    16b7:	51                   	push   %ecx
    16b8:	68 28 47 00 00       	push   $0x4728
    16bd:	6a 01                	push   $0x1
    16bf:	e8 fc 27 00 00       	call   3ec0 <printf>
    16c4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    16cb:	e8 a2 26 00 00       	call   3d72 <exit>
    16d0:	51                   	push   %ecx
    16d1:	51                   	push   %ecx
    16d2:	68 ac 47 00 00       	push   $0x47ac
    16d7:	6a 01                	push   $0x1
    16d9:	e8 e2 27 00 00       	call   3ec0 <printf>
    16de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    16e5:	e8 88 26 00 00       	call   3d72 <exit>
    16ea:	53                   	push   %ebx
    16eb:	53                   	push   %ebx
    16ec:	68 95 47 00 00       	push   $0x4795
    16f1:	6a 01                	push   $0x1
    16f3:	e8 c8 27 00 00       	call   3ec0 <printf>
    16f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    16ff:	e8 6e 26 00 00       	call   3d72 <exit>
    1704:	56                   	push   %esi
    1705:	56                   	push   %esi
    1706:	68 7e 47 00 00       	push   $0x477e
    170b:	6a 01                	push   $0x1
    170d:	e8 ae 27 00 00       	call   3ec0 <printf>
    1712:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1719:	e8 54 26 00 00       	call   3d72 <exit>
    171e:	50                   	push   %eax
    171f:	50                   	push   %eax
    1720:	68 60 47 00 00       	push   $0x4760
    1725:	6a 01                	push   $0x1
    1727:	e8 94 27 00 00       	call   3ec0 <printf>
    172c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1733:	e8 3a 26 00 00       	call   3d72 <exit>
    1738:	50                   	push   %eax
    1739:	50                   	push   %eax
    173a:	68 48 47 00 00       	push   $0x4748
    173f:	6a 01                	push   $0x1
    1741:	e8 7a 27 00 00       	call   3ec0 <printf>
    1746:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    174d:	e8 20 26 00 00       	call   3d72 <exit>
    1752:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001760 <linktest>:
    1760:	55                   	push   %ebp
    1761:	89 e5                	mov    %esp,%ebp
    1763:	53                   	push   %ebx
    1764:	83 ec 0c             	sub    $0xc,%esp
    1767:	68 d4 47 00 00       	push   $0x47d4
    176c:	6a 01                	push   $0x1
    176e:	e8 4d 27 00 00       	call   3ec0 <printf>
    1773:	c7 04 24 de 47 00 00 	movl   $0x47de,(%esp)
    177a:	e8 43 26 00 00       	call   3dc2 <unlink>
    177f:	c7 04 24 e2 47 00 00 	movl   $0x47e2,(%esp)
    1786:	e8 37 26 00 00       	call   3dc2 <unlink>
    178b:	58                   	pop    %eax
    178c:	5a                   	pop    %edx
    178d:	68 02 02 00 00       	push   $0x202
    1792:	68 de 47 00 00       	push   $0x47de
    1797:	e8 16 26 00 00       	call   3db2 <open>
    179c:	83 c4 10             	add    $0x10,%esp
    179f:	85 c0                	test   %eax,%eax
    17a1:	0f 88 1e 01 00 00    	js     18c5 <linktest+0x165>
    17a7:	83 ec 04             	sub    $0x4,%esp
    17aa:	89 c3                	mov    %eax,%ebx
    17ac:	6a 05                	push   $0x5
    17ae:	68 42 47 00 00       	push   $0x4742
    17b3:	50                   	push   %eax
    17b4:	e8 d9 25 00 00       	call   3d92 <write>
    17b9:	83 c4 10             	add    $0x10,%esp
    17bc:	83 f8 05             	cmp    $0x5,%eax
    17bf:	0f 85 d0 01 00 00    	jne    1995 <linktest+0x235>
    17c5:	83 ec 0c             	sub    $0xc,%esp
    17c8:	53                   	push   %ebx
    17c9:	e8 cc 25 00 00       	call   3d9a <close>
    17ce:	5b                   	pop    %ebx
    17cf:	58                   	pop    %eax
    17d0:	68 e2 47 00 00       	push   $0x47e2
    17d5:	68 de 47 00 00       	push   $0x47de
    17da:	e8 f3 25 00 00       	call   3dd2 <link>
    17df:	83 c4 10             	add    $0x10,%esp
    17e2:	85 c0                	test   %eax,%eax
    17e4:	0f 88 91 01 00 00    	js     197b <linktest+0x21b>
    17ea:	83 ec 0c             	sub    $0xc,%esp
    17ed:	68 de 47 00 00       	push   $0x47de
    17f2:	e8 cb 25 00 00       	call   3dc2 <unlink>
    17f7:	58                   	pop    %eax
    17f8:	5a                   	pop    %edx
    17f9:	6a 00                	push   $0x0
    17fb:	68 de 47 00 00       	push   $0x47de
    1800:	e8 ad 25 00 00       	call   3db2 <open>
    1805:	83 c4 10             	add    $0x10,%esp
    1808:	85 c0                	test   %eax,%eax
    180a:	0f 89 51 01 00 00    	jns    1961 <linktest+0x201>
    1810:	83 ec 08             	sub    $0x8,%esp
    1813:	6a 00                	push   $0x0
    1815:	68 e2 47 00 00       	push   $0x47e2
    181a:	e8 93 25 00 00       	call   3db2 <open>
    181f:	83 c4 10             	add    $0x10,%esp
    1822:	85 c0                	test   %eax,%eax
    1824:	89 c3                	mov    %eax,%ebx
    1826:	0f 88 1b 01 00 00    	js     1947 <linktest+0x1e7>
    182c:	83 ec 04             	sub    $0x4,%esp
    182f:	68 00 20 00 00       	push   $0x2000
    1834:	68 80 8a 00 00       	push   $0x8a80
    1839:	50                   	push   %eax
    183a:	e8 4b 25 00 00       	call   3d8a <read>
    183f:	83 c4 10             	add    $0x10,%esp
    1842:	83 f8 05             	cmp    $0x5,%eax
    1845:	0f 85 e2 00 00 00    	jne    192d <linktest+0x1cd>
    184b:	83 ec 0c             	sub    $0xc,%esp
    184e:	53                   	push   %ebx
    184f:	e8 46 25 00 00       	call   3d9a <close>
    1854:	58                   	pop    %eax
    1855:	5a                   	pop    %edx
    1856:	68 e2 47 00 00       	push   $0x47e2
    185b:	68 e2 47 00 00       	push   $0x47e2
    1860:	e8 6d 25 00 00       	call   3dd2 <link>
    1865:	83 c4 10             	add    $0x10,%esp
    1868:	85 c0                	test   %eax,%eax
    186a:	0f 89 a3 00 00 00    	jns    1913 <linktest+0x1b3>
    1870:	83 ec 0c             	sub    $0xc,%esp
    1873:	68 e2 47 00 00       	push   $0x47e2
    1878:	e8 45 25 00 00       	call   3dc2 <unlink>
    187d:	59                   	pop    %ecx
    187e:	5b                   	pop    %ebx
    187f:	68 de 47 00 00       	push   $0x47de
    1884:	68 e2 47 00 00       	push   $0x47e2
    1889:	e8 44 25 00 00       	call   3dd2 <link>
    188e:	83 c4 10             	add    $0x10,%esp
    1891:	85 c0                	test   %eax,%eax
    1893:	79 64                	jns    18f9 <linktest+0x199>
    1895:	83 ec 08             	sub    $0x8,%esp
    1898:	68 de 47 00 00       	push   $0x47de
    189d:	68 a6 4a 00 00       	push   $0x4aa6
    18a2:	e8 2b 25 00 00       	call   3dd2 <link>
    18a7:	83 c4 10             	add    $0x10,%esp
    18aa:	85 c0                	test   %eax,%eax
    18ac:	79 31                	jns    18df <linktest+0x17f>
    18ae:	83 ec 08             	sub    $0x8,%esp
    18b1:	68 7c 48 00 00       	push   $0x487c
    18b6:	6a 01                	push   $0x1
    18b8:	e8 03 26 00 00       	call   3ec0 <printf>
    18bd:	83 c4 10             	add    $0x10,%esp
    18c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    18c3:	c9                   	leave  
    18c4:	c3                   	ret    
    18c5:	50                   	push   %eax
    18c6:	50                   	push   %eax
    18c7:	68 e6 47 00 00       	push   $0x47e6
    18cc:	6a 01                	push   $0x1
    18ce:	e8 ed 25 00 00       	call   3ec0 <printf>
    18d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18da:	e8 93 24 00 00       	call   3d72 <exit>
    18df:	50                   	push   %eax
    18e0:	50                   	push   %eax
    18e1:	68 60 48 00 00       	push   $0x4860
    18e6:	6a 01                	push   $0x1
    18e8:	e8 d3 25 00 00       	call   3ec0 <printf>
    18ed:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18f4:	e8 79 24 00 00       	call   3d72 <exit>
    18f9:	52                   	push   %edx
    18fa:	52                   	push   %edx
    18fb:	68 14 54 00 00       	push   $0x5414
    1900:	6a 01                	push   $0x1
    1902:	e8 b9 25 00 00       	call   3ec0 <printf>
    1907:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    190e:	e8 5f 24 00 00       	call   3d72 <exit>
    1913:	50                   	push   %eax
    1914:	50                   	push   %eax
    1915:	68 42 48 00 00       	push   $0x4842
    191a:	6a 01                	push   $0x1
    191c:	e8 9f 25 00 00       	call   3ec0 <printf>
    1921:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1928:	e8 45 24 00 00       	call   3d72 <exit>
    192d:	51                   	push   %ecx
    192e:	51                   	push   %ecx
    192f:	68 31 48 00 00       	push   $0x4831
    1934:	6a 01                	push   $0x1
    1936:	e8 85 25 00 00       	call   3ec0 <printf>
    193b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1942:	e8 2b 24 00 00       	call   3d72 <exit>
    1947:	53                   	push   %ebx
    1948:	53                   	push   %ebx
    1949:	68 20 48 00 00       	push   $0x4820
    194e:	6a 01                	push   $0x1
    1950:	e8 6b 25 00 00       	call   3ec0 <printf>
    1955:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    195c:	e8 11 24 00 00       	call   3d72 <exit>
    1961:	50                   	push   %eax
    1962:	50                   	push   %eax
    1963:	68 ec 53 00 00       	push   $0x53ec
    1968:	6a 01                	push   $0x1
    196a:	e8 51 25 00 00       	call   3ec0 <printf>
    196f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1976:	e8 f7 23 00 00       	call   3d72 <exit>
    197b:	51                   	push   %ecx
    197c:	51                   	push   %ecx
    197d:	68 0b 48 00 00       	push   $0x480b
    1982:	6a 01                	push   $0x1
    1984:	e8 37 25 00 00       	call   3ec0 <printf>
    1989:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1990:	e8 dd 23 00 00       	call   3d72 <exit>
    1995:	50                   	push   %eax
    1996:	50                   	push   %eax
    1997:	68 f9 47 00 00       	push   $0x47f9
    199c:	6a 01                	push   $0x1
    199e:	e8 1d 25 00 00       	call   3ec0 <printf>
    19a3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19aa:	e8 c3 23 00 00       	call   3d72 <exit>
    19af:	90                   	nop

000019b0 <concreate>:
    19b0:	55                   	push   %ebp
    19b1:	89 e5                	mov    %esp,%ebp
    19b3:	57                   	push   %edi
    19b4:	56                   	push   %esi
    19b5:	53                   	push   %ebx
    19b6:	31 f6                	xor    %esi,%esi
    19b8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    19bb:	bf 56 55 55 55       	mov    $0x55555556,%edi
    19c0:	83 ec 64             	sub    $0x64,%esp
    19c3:	68 89 48 00 00       	push   $0x4889
    19c8:	6a 01                	push   $0x1
    19ca:	e8 f1 24 00 00       	call   3ec0 <printf>
    19cf:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
    19d3:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    19d7:	83 c4 10             	add    $0x10,%esp
    19da:	eb 51                	jmp    1a2d <concreate+0x7d>
    19dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
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
    19fb:	83 ec 08             	sub    $0x8,%esp
    19fe:	68 02 02 00 00       	push   $0x202
    1a03:	53                   	push   %ebx
    1a04:	e8 a9 23 00 00       	call   3db2 <open>
    1a09:	83 c4 10             	add    $0x10,%esp
    1a0c:	85 c0                	test   %eax,%eax
    1a0e:	78 6d                	js     1a7d <concreate+0xcd>
    1a10:	83 ec 0c             	sub    $0xc,%esp
    1a13:	83 c6 01             	add    $0x1,%esi
    1a16:	50                   	push   %eax
    1a17:	e8 7e 23 00 00       	call   3d9a <close>
    1a1c:	83 c4 10             	add    $0x10,%esp
    1a1f:	e8 56 23 00 00       	call   3d7a <wait>
    1a24:	83 fe 28             	cmp    $0x28,%esi
    1a27:	0f 84 bb 00 00 00    	je     1ae8 <concreate+0x138>
    1a2d:	83 ec 0c             	sub    $0xc,%esp
    1a30:	8d 46 30             	lea    0x30(%esi),%eax
    1a33:	53                   	push   %ebx
    1a34:	88 45 ae             	mov    %al,-0x52(%ebp)
    1a37:	e8 86 23 00 00       	call   3dc2 <unlink>
    1a3c:	e8 29 23 00 00       	call   3d6a <fork>
    1a41:	83 c4 10             	add    $0x10,%esp
    1a44:	85 c0                	test   %eax,%eax
    1a46:	75 98                	jne    19e0 <concreate+0x30>
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
    1a64:	83 ec 08             	sub    $0x8,%esp
    1a67:	68 02 02 00 00       	push   $0x202
    1a6c:	53                   	push   %ebx
    1a6d:	e8 40 23 00 00       	call   3db2 <open>
    1a72:	83 c4 10             	add    $0x10,%esp
    1a75:	85 c0                	test   %eax,%eax
    1a77:	0f 89 5e 02 00 00    	jns    1cdb <concreate+0x32b>
    1a7d:	83 ec 04             	sub    $0x4,%esp
    1a80:	53                   	push   %ebx
    1a81:	68 9c 48 00 00       	push   $0x489c
    1a86:	6a 01                	push   $0x1
    1a88:	e8 33 24 00 00       	call   3ec0 <printf>
    1a8d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a94:	e8 d9 22 00 00       	call   3d72 <exit>
    1a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1aa0:	83 ec 08             	sub    $0x8,%esp
    1aa3:	53                   	push   %ebx
    1aa4:	68 99 48 00 00       	push   $0x4899
    1aa9:	e8 24 23 00 00       	call   3dd2 <link>
    1aae:	83 c4 10             	add    $0x10,%esp
    1ab1:	83 ec 0c             	sub    $0xc,%esp
    1ab4:	6a 00                	push   $0x0
    1ab6:	e8 b7 22 00 00       	call   3d72 <exit>
    1abb:	90                   	nop
    1abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1ac0:	83 ec 08             	sub    $0x8,%esp
    1ac3:	83 c6 01             	add    $0x1,%esi
    1ac6:	53                   	push   %ebx
    1ac7:	68 99 48 00 00       	push   $0x4899
    1acc:	e8 01 23 00 00       	call   3dd2 <link>
    1ad1:	83 c4 10             	add    $0x10,%esp
    1ad4:	e8 a1 22 00 00       	call   3d7a <wait>
    1ad9:	83 fe 28             	cmp    $0x28,%esi
    1adc:	0f 85 4b ff ff ff    	jne    1a2d <concreate+0x7d>
    1ae2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1ae8:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1aeb:	83 ec 04             	sub    $0x4,%esp
    1aee:	8d 7d b0             	lea    -0x50(%ebp),%edi
    1af1:	6a 28                	push   $0x28
    1af3:	6a 00                	push   $0x0
    1af5:	50                   	push   %eax
    1af6:	e8 05 21 00 00       	call   3c00 <memset>
    1afb:	59                   	pop    %ecx
    1afc:	5e                   	pop    %esi
    1afd:	6a 00                	push   $0x0
    1aff:	68 a6 4a 00 00       	push   $0x4aa6
    1b04:	e8 a9 22 00 00       	call   3db2 <open>
    1b09:	83 c4 10             	add    $0x10,%esp
    1b0c:	89 c6                	mov    %eax,%esi
    1b0e:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    1b15:	8d 76 00             	lea    0x0(%esi),%esi
    1b18:	83 ec 04             	sub    $0x4,%esp
    1b1b:	6a 10                	push   $0x10
    1b1d:	57                   	push   %edi
    1b1e:	56                   	push   %esi
    1b1f:	e8 66 22 00 00       	call   3d8a <read>
    1b24:	83 c4 10             	add    $0x10,%esp
    1b27:	85 c0                	test   %eax,%eax
    1b29:	7e 3d                	jle    1b68 <concreate+0x1b8>
    1b2b:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1b30:	74 e6                	je     1b18 <concreate+0x168>
    1b32:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1b36:	75 e0                	jne    1b18 <concreate+0x168>
    1b38:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1b3c:	75 da                	jne    1b18 <concreate+0x168>
    1b3e:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1b42:	83 e8 30             	sub    $0x30,%eax
    1b45:	83 f8 27             	cmp    $0x27,%eax
    1b48:	0f 87 6e 01 00 00    	ja     1cbc <concreate+0x30c>
    1b4e:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1b53:	0f 85 44 01 00 00    	jne    1c9d <concreate+0x2ed>
    1b59:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
    1b5e:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    1b62:	eb b4                	jmp    1b18 <concreate+0x168>
    1b64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1b68:	83 ec 0c             	sub    $0xc,%esp
    1b6b:	56                   	push   %esi
    1b6c:	e8 29 22 00 00       	call   3d9a <close>
    1b71:	83 c4 10             	add    $0x10,%esp
    1b74:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1b78:	0f 85 04 01 00 00    	jne    1c82 <concreate+0x2d2>
    1b7e:	31 f6                	xor    %esi,%esi
    1b80:	eb 70                	jmp    1bf2 <concreate+0x242>
    1b82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1b88:	83 fa 01             	cmp    $0x1,%edx
    1b8b:	0f 85 99 00 00 00    	jne    1c2a <concreate+0x27a>
    1b91:	83 ec 08             	sub    $0x8,%esp
    1b94:	6a 00                	push   $0x0
    1b96:	53                   	push   %ebx
    1b97:	e8 16 22 00 00       	call   3db2 <open>
    1b9c:	89 04 24             	mov    %eax,(%esp)
    1b9f:	e8 f6 21 00 00       	call   3d9a <close>
    1ba4:	58                   	pop    %eax
    1ba5:	5a                   	pop    %edx
    1ba6:	6a 00                	push   $0x0
    1ba8:	53                   	push   %ebx
    1ba9:	e8 04 22 00 00       	call   3db2 <open>
    1bae:	89 04 24             	mov    %eax,(%esp)
    1bb1:	e8 e4 21 00 00       	call   3d9a <close>
    1bb6:	59                   	pop    %ecx
    1bb7:	58                   	pop    %eax
    1bb8:	6a 00                	push   $0x0
    1bba:	53                   	push   %ebx
    1bbb:	e8 f2 21 00 00       	call   3db2 <open>
    1bc0:	89 04 24             	mov    %eax,(%esp)
    1bc3:	e8 d2 21 00 00       	call   3d9a <close>
    1bc8:	58                   	pop    %eax
    1bc9:	5a                   	pop    %edx
    1bca:	6a 00                	push   $0x0
    1bcc:	53                   	push   %ebx
    1bcd:	e8 e0 21 00 00       	call   3db2 <open>
    1bd2:	89 04 24             	mov    %eax,(%esp)
    1bd5:	e8 c0 21 00 00       	call   3d9a <close>
    1bda:	83 c4 10             	add    $0x10,%esp
    1bdd:	85 ff                	test   %edi,%edi
    1bdf:	0f 84 cc fe ff ff    	je     1ab1 <concreate+0x101>
    1be5:	83 c6 01             	add    $0x1,%esi
    1be8:	e8 8d 21 00 00       	call   3d7a <wait>
    1bed:	83 fe 28             	cmp    $0x28,%esi
    1bf0:	74 5e                	je     1c50 <concreate+0x2a0>
    1bf2:	8d 46 30             	lea    0x30(%esi),%eax
    1bf5:	88 45 ae             	mov    %al,-0x52(%ebp)
    1bf8:	e8 6d 21 00 00       	call   3d6a <fork>
    1bfd:	85 c0                	test   %eax,%eax
    1bff:	89 c7                	mov    %eax,%edi
    1c01:	78 64                	js     1c67 <concreate+0x2b7>
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
    1c22:	85 ff                	test   %edi,%edi
    1c24:	0f 85 5e ff ff ff    	jne    1b88 <concreate+0x1d8>
    1c2a:	83 ec 0c             	sub    $0xc,%esp
    1c2d:	53                   	push   %ebx
    1c2e:	e8 8f 21 00 00       	call   3dc2 <unlink>
    1c33:	89 1c 24             	mov    %ebx,(%esp)
    1c36:	e8 87 21 00 00       	call   3dc2 <unlink>
    1c3b:	89 1c 24             	mov    %ebx,(%esp)
    1c3e:	e8 7f 21 00 00       	call   3dc2 <unlink>
    1c43:	89 1c 24             	mov    %ebx,(%esp)
    1c46:	e8 77 21 00 00       	call   3dc2 <unlink>
    1c4b:	83 c4 10             	add    $0x10,%esp
    1c4e:	eb 8d                	jmp    1bdd <concreate+0x22d>
    1c50:	83 ec 08             	sub    $0x8,%esp
    1c53:	68 ee 48 00 00       	push   $0x48ee
    1c58:	6a 01                	push   $0x1
    1c5a:	e8 61 22 00 00       	call   3ec0 <printf>
    1c5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c62:	5b                   	pop    %ebx
    1c63:	5e                   	pop    %esi
    1c64:	5f                   	pop    %edi
    1c65:	5d                   	pop    %ebp
    1c66:	c3                   	ret    
    1c67:	83 ec 08             	sub    $0x8,%esp
    1c6a:	68 71 51 00 00       	push   $0x5171
    1c6f:	6a 01                	push   $0x1
    1c71:	e8 4a 22 00 00       	call   3ec0 <printf>
    1c76:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c7d:	e8 f0 20 00 00       	call   3d72 <exit>
    1c82:	83 ec 08             	sub    $0x8,%esp
    1c85:	68 38 54 00 00       	push   $0x5438
    1c8a:	6a 01                	push   $0x1
    1c8c:	e8 2f 22 00 00       	call   3ec0 <printf>
    1c91:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c98:	e8 d5 20 00 00       	call   3d72 <exit>
    1c9d:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1ca0:	83 ec 04             	sub    $0x4,%esp
    1ca3:	50                   	push   %eax
    1ca4:	68 d1 48 00 00       	push   $0x48d1
    1ca9:	6a 01                	push   $0x1
    1cab:	e8 10 22 00 00       	call   3ec0 <printf>
    1cb0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cb7:	e8 b6 20 00 00       	call   3d72 <exit>
    1cbc:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1cbf:	83 ec 04             	sub    $0x4,%esp
    1cc2:	50                   	push   %eax
    1cc3:	68 b8 48 00 00       	push   $0x48b8
    1cc8:	6a 01                	push   $0x1
    1cca:	e8 f1 21 00 00       	call   3ec0 <printf>
    1ccf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cd6:	e8 97 20 00 00       	call   3d72 <exit>
    1cdb:	83 ec 0c             	sub    $0xc,%esp
    1cde:	50                   	push   %eax
    1cdf:	e8 b6 20 00 00       	call   3d9a <close>
    1ce4:	83 c4 10             	add    $0x10,%esp
    1ce7:	e9 c5 fd ff ff       	jmp    1ab1 <concreate+0x101>
    1cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001cf0 <linkunlink>:
    1cf0:	55                   	push   %ebp
    1cf1:	89 e5                	mov    %esp,%ebp
    1cf3:	57                   	push   %edi
    1cf4:	56                   	push   %esi
    1cf5:	53                   	push   %ebx
    1cf6:	83 ec 24             	sub    $0x24,%esp
    1cf9:	68 fc 48 00 00       	push   $0x48fc
    1cfe:	6a 01                	push   $0x1
    1d00:	e8 bb 21 00 00       	call   3ec0 <printf>
    1d05:	c7 04 24 89 4b 00 00 	movl   $0x4b89,(%esp)
    1d0c:	e8 b1 20 00 00       	call   3dc2 <unlink>
    1d11:	e8 54 20 00 00       	call   3d6a <fork>
    1d16:	83 c4 10             	add    $0x10,%esp
    1d19:	85 c0                	test   %eax,%eax
    1d1b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1d1e:	0f 88 b6 00 00 00    	js     1dda <linkunlink+0xea>
    1d24:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1d28:	bb 64 00 00 00       	mov    $0x64,%ebx
    1d2d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
    1d32:	19 ff                	sbb    %edi,%edi
    1d34:	83 e7 60             	and    $0x60,%edi
    1d37:	83 c7 01             	add    $0x1,%edi
    1d3a:	eb 1e                	jmp    1d5a <linkunlink+0x6a>
    1d3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1d40:	83 fa 01             	cmp    $0x1,%edx
    1d43:	74 7b                	je     1dc0 <linkunlink+0xd0>
    1d45:	83 ec 0c             	sub    $0xc,%esp
    1d48:	68 89 4b 00 00       	push   $0x4b89
    1d4d:	e8 70 20 00 00       	call   3dc2 <unlink>
    1d52:	83 c4 10             	add    $0x10,%esp
    1d55:	83 eb 01             	sub    $0x1,%ebx
    1d58:	74 3d                	je     1d97 <linkunlink+0xa7>
    1d5a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1d60:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    1d66:	89 f8                	mov    %edi,%eax
    1d68:	f7 e6                	mul    %esi
    1d6a:	d1 ea                	shr    %edx
    1d6c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1d6f:	89 fa                	mov    %edi,%edx
    1d71:	29 c2                	sub    %eax,%edx
    1d73:	75 cb                	jne    1d40 <linkunlink+0x50>
    1d75:	83 ec 08             	sub    $0x8,%esp
    1d78:	68 02 02 00 00       	push   $0x202
    1d7d:	68 89 4b 00 00       	push   $0x4b89
    1d82:	e8 2b 20 00 00       	call   3db2 <open>
    1d87:	89 04 24             	mov    %eax,(%esp)
    1d8a:	e8 0b 20 00 00       	call   3d9a <close>
    1d8f:	83 c4 10             	add    $0x10,%esp
    1d92:	83 eb 01             	sub    $0x1,%ebx
    1d95:	75 c3                	jne    1d5a <linkunlink+0x6a>
    1d97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1d9a:	85 c0                	test   %eax,%eax
    1d9c:	74 57                	je     1df5 <linkunlink+0x105>
    1d9e:	e8 d7 1f 00 00       	call   3d7a <wait>
    1da3:	83 ec 08             	sub    $0x8,%esp
    1da6:	68 11 49 00 00       	push   $0x4911
    1dab:	6a 01                	push   $0x1
    1dad:	e8 0e 21 00 00       	call   3ec0 <printf>
    1db2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1db5:	5b                   	pop    %ebx
    1db6:	5e                   	pop    %esi
    1db7:	5f                   	pop    %edi
    1db8:	5d                   	pop    %ebp
    1db9:	c3                   	ret    
    1dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1dc0:	83 ec 08             	sub    $0x8,%esp
    1dc3:	68 89 4b 00 00       	push   $0x4b89
    1dc8:	68 0d 49 00 00       	push   $0x490d
    1dcd:	e8 00 20 00 00       	call   3dd2 <link>
    1dd2:	83 c4 10             	add    $0x10,%esp
    1dd5:	e9 7b ff ff ff       	jmp    1d55 <linkunlink+0x65>
    1dda:	83 ec 08             	sub    $0x8,%esp
    1ddd:	68 71 51 00 00       	push   $0x5171
    1de2:	6a 01                	push   $0x1
    1de4:	e8 d7 20 00 00       	call   3ec0 <printf>
    1de9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1df0:	e8 7d 1f 00 00       	call   3d72 <exit>
    1df5:	83 ec 0c             	sub    $0xc,%esp
    1df8:	6a 00                	push   $0x0
    1dfa:	e8 73 1f 00 00       	call   3d72 <exit>
    1dff:	90                   	nop

00001e00 <bigdir>:
    1e00:	55                   	push   %ebp
    1e01:	89 e5                	mov    %esp,%ebp
    1e03:	56                   	push   %esi
    1e04:	53                   	push   %ebx
    1e05:	83 ec 18             	sub    $0x18,%esp
    1e08:	68 20 49 00 00       	push   $0x4920
    1e0d:	6a 01                	push   $0x1
    1e0f:	e8 ac 20 00 00       	call   3ec0 <printf>
    1e14:	c7 04 24 2d 49 00 00 	movl   $0x492d,(%esp)
    1e1b:	e8 a2 1f 00 00       	call   3dc2 <unlink>
    1e20:	58                   	pop    %eax
    1e21:	5a                   	pop    %edx
    1e22:	68 00 02 00 00       	push   $0x200
    1e27:	68 2d 49 00 00       	push   $0x492d
    1e2c:	e8 81 1f 00 00       	call   3db2 <open>
    1e31:	83 c4 10             	add    $0x10,%esp
    1e34:	85 c0                	test   %eax,%eax
    1e36:	0f 88 ec 00 00 00    	js     1f28 <bigdir+0x128>
    1e3c:	83 ec 0c             	sub    $0xc,%esp
    1e3f:	8d 75 ee             	lea    -0x12(%ebp),%esi
    1e42:	31 db                	xor    %ebx,%ebx
    1e44:	50                   	push   %eax
    1e45:	e8 50 1f 00 00       	call   3d9a <close>
    1e4a:	83 c4 10             	add    $0x10,%esp
    1e4d:	8d 76 00             	lea    0x0(%esi),%esi
    1e50:	89 d8                	mov    %ebx,%eax
    1e52:	83 ec 08             	sub    $0x8,%esp
    1e55:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    1e59:	c1 f8 06             	sar    $0x6,%eax
    1e5c:	56                   	push   %esi
    1e5d:	68 2d 49 00 00       	push   $0x492d
    1e62:	83 c0 30             	add    $0x30,%eax
    1e65:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    1e69:	88 45 ef             	mov    %al,-0x11(%ebp)
    1e6c:	89 d8                	mov    %ebx,%eax
    1e6e:	83 e0 3f             	and    $0x3f,%eax
    1e71:	83 c0 30             	add    $0x30,%eax
    1e74:	88 45 f0             	mov    %al,-0x10(%ebp)
    1e77:	e8 56 1f 00 00       	call   3dd2 <link>
    1e7c:	83 c4 10             	add    $0x10,%esp
    1e7f:	85 c0                	test   %eax,%eax
    1e81:	75 6f                	jne    1ef2 <bigdir+0xf2>
    1e83:	83 c3 01             	add    $0x1,%ebx
    1e86:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1e8c:	75 c2                	jne    1e50 <bigdir+0x50>
    1e8e:	83 ec 0c             	sub    $0xc,%esp
    1e91:	31 db                	xor    %ebx,%ebx
    1e93:	68 2d 49 00 00       	push   $0x492d
    1e98:	e8 25 1f 00 00       	call   3dc2 <unlink>
    1e9d:	83 c4 10             	add    $0x10,%esp
    1ea0:	89 d8                	mov    %ebx,%eax
    1ea2:	83 ec 0c             	sub    $0xc,%esp
    1ea5:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    1ea9:	c1 f8 06             	sar    $0x6,%eax
    1eac:	56                   	push   %esi
    1ead:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    1eb1:	83 c0 30             	add    $0x30,%eax
    1eb4:	88 45 ef             	mov    %al,-0x11(%ebp)
    1eb7:	89 d8                	mov    %ebx,%eax
    1eb9:	83 e0 3f             	and    $0x3f,%eax
    1ebc:	83 c0 30             	add    $0x30,%eax
    1ebf:	88 45 f0             	mov    %al,-0x10(%ebp)
    1ec2:	e8 fb 1e 00 00       	call   3dc2 <unlink>
    1ec7:	83 c4 10             	add    $0x10,%esp
    1eca:	85 c0                	test   %eax,%eax
    1ecc:	75 3f                	jne    1f0d <bigdir+0x10d>
    1ece:	83 c3 01             	add    $0x1,%ebx
    1ed1:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1ed7:	75 c7                	jne    1ea0 <bigdir+0xa0>
    1ed9:	83 ec 08             	sub    $0x8,%esp
    1edc:	68 6f 49 00 00       	push   $0x496f
    1ee1:	6a 01                	push   $0x1
    1ee3:	e8 d8 1f 00 00       	call   3ec0 <printf>
    1ee8:	83 c4 10             	add    $0x10,%esp
    1eeb:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1eee:	5b                   	pop    %ebx
    1eef:	5e                   	pop    %esi
    1ef0:	5d                   	pop    %ebp
    1ef1:	c3                   	ret    
    1ef2:	83 ec 08             	sub    $0x8,%esp
    1ef5:	68 46 49 00 00       	push   $0x4946
    1efa:	6a 01                	push   $0x1
    1efc:	e8 bf 1f 00 00       	call   3ec0 <printf>
    1f01:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f08:	e8 65 1e 00 00       	call   3d72 <exit>
    1f0d:	83 ec 08             	sub    $0x8,%esp
    1f10:	68 5a 49 00 00       	push   $0x495a
    1f15:	6a 01                	push   $0x1
    1f17:	e8 a4 1f 00 00       	call   3ec0 <printf>
    1f1c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f23:	e8 4a 1e 00 00       	call   3d72 <exit>
    1f28:	83 ec 08             	sub    $0x8,%esp
    1f2b:	68 30 49 00 00       	push   $0x4930
    1f30:	6a 01                	push   $0x1
    1f32:	e8 89 1f 00 00       	call   3ec0 <printf>
    1f37:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f3e:	e8 2f 1e 00 00       	call   3d72 <exit>
    1f43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001f50 <subdir>:
    1f50:	55                   	push   %ebp
    1f51:	89 e5                	mov    %esp,%ebp
    1f53:	53                   	push   %ebx
    1f54:	83 ec 0c             	sub    $0xc,%esp
    1f57:	68 7a 49 00 00       	push   $0x497a
    1f5c:	6a 01                	push   $0x1
    1f5e:	e8 5d 1f 00 00       	call   3ec0 <printf>
    1f63:	c7 04 24 03 4a 00 00 	movl   $0x4a03,(%esp)
    1f6a:	e8 53 1e 00 00       	call   3dc2 <unlink>
    1f6f:	c7 04 24 a0 4a 00 00 	movl   $0x4aa0,(%esp)
    1f76:	e8 5f 1e 00 00       	call   3dda <mkdir>
    1f7b:	83 c4 10             	add    $0x10,%esp
    1f7e:	85 c0                	test   %eax,%eax
    1f80:	0f 85 4d 06 00 00    	jne    25d3 <subdir+0x683>
    1f86:	83 ec 08             	sub    $0x8,%esp
    1f89:	68 02 02 00 00       	push   $0x202
    1f8e:	68 d9 49 00 00       	push   $0x49d9
    1f93:	e8 1a 1e 00 00       	call   3db2 <open>
    1f98:	83 c4 10             	add    $0x10,%esp
    1f9b:	85 c0                	test   %eax,%eax
    1f9d:	89 c3                	mov    %eax,%ebx
    1f9f:	0f 88 14 06 00 00    	js     25b9 <subdir+0x669>
    1fa5:	83 ec 04             	sub    $0x4,%esp
    1fa8:	6a 02                	push   $0x2
    1faa:	68 03 4a 00 00       	push   $0x4a03
    1faf:	50                   	push   %eax
    1fb0:	e8 dd 1d 00 00       	call   3d92 <write>
    1fb5:	89 1c 24             	mov    %ebx,(%esp)
    1fb8:	e8 dd 1d 00 00       	call   3d9a <close>
    1fbd:	c7 04 24 a0 4a 00 00 	movl   $0x4aa0,(%esp)
    1fc4:	e8 f9 1d 00 00       	call   3dc2 <unlink>
    1fc9:	83 c4 10             	add    $0x10,%esp
    1fcc:	85 c0                	test   %eax,%eax
    1fce:	0f 89 cb 05 00 00    	jns    259f <subdir+0x64f>
    1fd4:	83 ec 0c             	sub    $0xc,%esp
    1fd7:	68 b4 49 00 00       	push   $0x49b4
    1fdc:	e8 f9 1d 00 00       	call   3dda <mkdir>
    1fe1:	83 c4 10             	add    $0x10,%esp
    1fe4:	85 c0                	test   %eax,%eax
    1fe6:	0f 85 99 05 00 00    	jne    2585 <subdir+0x635>
    1fec:	83 ec 08             	sub    $0x8,%esp
    1fef:	68 02 02 00 00       	push   $0x202
    1ff4:	68 d6 49 00 00       	push   $0x49d6
    1ff9:	e8 b4 1d 00 00       	call   3db2 <open>
    1ffe:	83 c4 10             	add    $0x10,%esp
    2001:	85 c0                	test   %eax,%eax
    2003:	89 c3                	mov    %eax,%ebx
    2005:	0f 88 5c 04 00 00    	js     2467 <subdir+0x517>
    200b:	83 ec 04             	sub    $0x4,%esp
    200e:	6a 02                	push   $0x2
    2010:	68 f7 49 00 00       	push   $0x49f7
    2015:	50                   	push   %eax
    2016:	e8 77 1d 00 00       	call   3d92 <write>
    201b:	89 1c 24             	mov    %ebx,(%esp)
    201e:	e8 77 1d 00 00       	call   3d9a <close>
    2023:	58                   	pop    %eax
    2024:	5a                   	pop    %edx
    2025:	6a 00                	push   $0x0
    2027:	68 fa 49 00 00       	push   $0x49fa
    202c:	e8 81 1d 00 00       	call   3db2 <open>
    2031:	83 c4 10             	add    $0x10,%esp
    2034:	85 c0                	test   %eax,%eax
    2036:	89 c3                	mov    %eax,%ebx
    2038:	0f 88 0f 04 00 00    	js     244d <subdir+0x4fd>
    203e:	83 ec 04             	sub    $0x4,%esp
    2041:	68 00 20 00 00       	push   $0x2000
    2046:	68 80 8a 00 00       	push   $0x8a80
    204b:	50                   	push   %eax
    204c:	e8 39 1d 00 00       	call   3d8a <read>
    2051:	83 c4 10             	add    $0x10,%esp
    2054:	83 f8 02             	cmp    $0x2,%eax
    2057:	0f 85 3a 03 00 00    	jne    2397 <subdir+0x447>
    205d:	80 3d 80 8a 00 00 66 	cmpb   $0x66,0x8a80
    2064:	0f 85 2d 03 00 00    	jne    2397 <subdir+0x447>
    206a:	83 ec 0c             	sub    $0xc,%esp
    206d:	53                   	push   %ebx
    206e:	e8 27 1d 00 00       	call   3d9a <close>
    2073:	5b                   	pop    %ebx
    2074:	58                   	pop    %eax
    2075:	68 3a 4a 00 00       	push   $0x4a3a
    207a:	68 d6 49 00 00       	push   $0x49d6
    207f:	e8 4e 1d 00 00       	call   3dd2 <link>
    2084:	83 c4 10             	add    $0x10,%esp
    2087:	85 c0                	test   %eax,%eax
    2089:	0f 85 0c 04 00 00    	jne    249b <subdir+0x54b>
    208f:	83 ec 0c             	sub    $0xc,%esp
    2092:	68 d6 49 00 00       	push   $0x49d6
    2097:	e8 26 1d 00 00       	call   3dc2 <unlink>
    209c:	83 c4 10             	add    $0x10,%esp
    209f:	85 c0                	test   %eax,%eax
    20a1:	0f 85 24 03 00 00    	jne    23cb <subdir+0x47b>
    20a7:	83 ec 08             	sub    $0x8,%esp
    20aa:	6a 00                	push   $0x0
    20ac:	68 d6 49 00 00       	push   $0x49d6
    20b1:	e8 fc 1c 00 00       	call   3db2 <open>
    20b6:	83 c4 10             	add    $0x10,%esp
    20b9:	85 c0                	test   %eax,%eax
    20bb:	0f 89 aa 04 00 00    	jns    256b <subdir+0x61b>
    20c1:	83 ec 0c             	sub    $0xc,%esp
    20c4:	68 a0 4a 00 00       	push   $0x4aa0
    20c9:	e8 14 1d 00 00       	call   3de2 <chdir>
    20ce:	83 c4 10             	add    $0x10,%esp
    20d1:	85 c0                	test   %eax,%eax
    20d3:	0f 85 78 04 00 00    	jne    2551 <subdir+0x601>
    20d9:	83 ec 0c             	sub    $0xc,%esp
    20dc:	68 6e 4a 00 00       	push   $0x4a6e
    20e1:	e8 fc 1c 00 00       	call   3de2 <chdir>
    20e6:	83 c4 10             	add    $0x10,%esp
    20e9:	85 c0                	test   %eax,%eax
    20eb:	0f 85 c0 02 00 00    	jne    23b1 <subdir+0x461>
    20f1:	83 ec 0c             	sub    $0xc,%esp
    20f4:	68 94 4a 00 00       	push   $0x4a94
    20f9:	e8 e4 1c 00 00       	call   3de2 <chdir>
    20fe:	83 c4 10             	add    $0x10,%esp
    2101:	85 c0                	test   %eax,%eax
    2103:	0f 85 a8 02 00 00    	jne    23b1 <subdir+0x461>
    2109:	83 ec 0c             	sub    $0xc,%esp
    210c:	68 a3 4a 00 00       	push   $0x4aa3
    2111:	e8 cc 1c 00 00       	call   3de2 <chdir>
    2116:	83 c4 10             	add    $0x10,%esp
    2119:	85 c0                	test   %eax,%eax
    211b:	0f 85 60 03 00 00    	jne    2481 <subdir+0x531>
    2121:	83 ec 08             	sub    $0x8,%esp
    2124:	6a 00                	push   $0x0
    2126:	68 3a 4a 00 00       	push   $0x4a3a
    212b:	e8 82 1c 00 00       	call   3db2 <open>
    2130:	83 c4 10             	add    $0x10,%esp
    2133:	85 c0                	test   %eax,%eax
    2135:	89 c3                	mov    %eax,%ebx
    2137:	0f 88 ce 05 00 00    	js     270b <subdir+0x7bb>
    213d:	83 ec 04             	sub    $0x4,%esp
    2140:	68 00 20 00 00       	push   $0x2000
    2145:	68 80 8a 00 00       	push   $0x8a80
    214a:	50                   	push   %eax
    214b:	e8 3a 1c 00 00       	call   3d8a <read>
    2150:	83 c4 10             	add    $0x10,%esp
    2153:	83 f8 02             	cmp    $0x2,%eax
    2156:	0f 85 95 05 00 00    	jne    26f1 <subdir+0x7a1>
    215c:	83 ec 0c             	sub    $0xc,%esp
    215f:	53                   	push   %ebx
    2160:	e8 35 1c 00 00       	call   3d9a <close>
    2165:	59                   	pop    %ecx
    2166:	5b                   	pop    %ebx
    2167:	6a 00                	push   $0x0
    2169:	68 d6 49 00 00       	push   $0x49d6
    216e:	e8 3f 1c 00 00       	call   3db2 <open>
    2173:	83 c4 10             	add    $0x10,%esp
    2176:	85 c0                	test   %eax,%eax
    2178:	0f 89 81 02 00 00    	jns    23ff <subdir+0x4af>
    217e:	83 ec 08             	sub    $0x8,%esp
    2181:	68 02 02 00 00       	push   $0x202
    2186:	68 ee 4a 00 00       	push   $0x4aee
    218b:	e8 22 1c 00 00       	call   3db2 <open>
    2190:	83 c4 10             	add    $0x10,%esp
    2193:	85 c0                	test   %eax,%eax
    2195:	0f 89 4a 02 00 00    	jns    23e5 <subdir+0x495>
    219b:	83 ec 08             	sub    $0x8,%esp
    219e:	68 02 02 00 00       	push   $0x202
    21a3:	68 13 4b 00 00       	push   $0x4b13
    21a8:	e8 05 1c 00 00       	call   3db2 <open>
    21ad:	83 c4 10             	add    $0x10,%esp
    21b0:	85 c0                	test   %eax,%eax
    21b2:	0f 89 7f 03 00 00    	jns    2537 <subdir+0x5e7>
    21b8:	83 ec 08             	sub    $0x8,%esp
    21bb:	68 00 02 00 00       	push   $0x200
    21c0:	68 a0 4a 00 00       	push   $0x4aa0
    21c5:	e8 e8 1b 00 00       	call   3db2 <open>
    21ca:	83 c4 10             	add    $0x10,%esp
    21cd:	85 c0                	test   %eax,%eax
    21cf:	0f 89 48 03 00 00    	jns    251d <subdir+0x5cd>
    21d5:	83 ec 08             	sub    $0x8,%esp
    21d8:	6a 02                	push   $0x2
    21da:	68 a0 4a 00 00       	push   $0x4aa0
    21df:	e8 ce 1b 00 00       	call   3db2 <open>
    21e4:	83 c4 10             	add    $0x10,%esp
    21e7:	85 c0                	test   %eax,%eax
    21e9:	0f 89 14 03 00 00    	jns    2503 <subdir+0x5b3>
    21ef:	83 ec 08             	sub    $0x8,%esp
    21f2:	6a 01                	push   $0x1
    21f4:	68 a0 4a 00 00       	push   $0x4aa0
    21f9:	e8 b4 1b 00 00       	call   3db2 <open>
    21fe:	83 c4 10             	add    $0x10,%esp
    2201:	85 c0                	test   %eax,%eax
    2203:	0f 89 e0 02 00 00    	jns    24e9 <subdir+0x599>
    2209:	83 ec 08             	sub    $0x8,%esp
    220c:	68 82 4b 00 00       	push   $0x4b82
    2211:	68 ee 4a 00 00       	push   $0x4aee
    2216:	e8 b7 1b 00 00       	call   3dd2 <link>
    221b:	83 c4 10             	add    $0x10,%esp
    221e:	85 c0                	test   %eax,%eax
    2220:	0f 84 a9 02 00 00    	je     24cf <subdir+0x57f>
    2226:	83 ec 08             	sub    $0x8,%esp
    2229:	68 82 4b 00 00       	push   $0x4b82
    222e:	68 13 4b 00 00       	push   $0x4b13
    2233:	e8 9a 1b 00 00       	call   3dd2 <link>
    2238:	83 c4 10             	add    $0x10,%esp
    223b:	85 c0                	test   %eax,%eax
    223d:	0f 84 72 02 00 00    	je     24b5 <subdir+0x565>
    2243:	83 ec 08             	sub    $0x8,%esp
    2246:	68 3a 4a 00 00       	push   $0x4a3a
    224b:	68 d9 49 00 00       	push   $0x49d9
    2250:	e8 7d 1b 00 00       	call   3dd2 <link>
    2255:	83 c4 10             	add    $0x10,%esp
    2258:	85 c0                	test   %eax,%eax
    225a:	0f 84 d3 01 00 00    	je     2433 <subdir+0x4e3>
    2260:	83 ec 0c             	sub    $0xc,%esp
    2263:	68 ee 4a 00 00       	push   $0x4aee
    2268:	e8 6d 1b 00 00       	call   3dda <mkdir>
    226d:	83 c4 10             	add    $0x10,%esp
    2270:	85 c0                	test   %eax,%eax
    2272:	0f 84 a1 01 00 00    	je     2419 <subdir+0x4c9>
    2278:	83 ec 0c             	sub    $0xc,%esp
    227b:	68 13 4b 00 00       	push   $0x4b13
    2280:	e8 55 1b 00 00       	call   3dda <mkdir>
    2285:	83 c4 10             	add    $0x10,%esp
    2288:	85 c0                	test   %eax,%eax
    228a:	0f 84 47 04 00 00    	je     26d7 <subdir+0x787>
    2290:	83 ec 0c             	sub    $0xc,%esp
    2293:	68 3a 4a 00 00       	push   $0x4a3a
    2298:	e8 3d 1b 00 00       	call   3dda <mkdir>
    229d:	83 c4 10             	add    $0x10,%esp
    22a0:	85 c0                	test   %eax,%eax
    22a2:	0f 84 15 04 00 00    	je     26bd <subdir+0x76d>
    22a8:	83 ec 0c             	sub    $0xc,%esp
    22ab:	68 13 4b 00 00       	push   $0x4b13
    22b0:	e8 0d 1b 00 00       	call   3dc2 <unlink>
    22b5:	83 c4 10             	add    $0x10,%esp
    22b8:	85 c0                	test   %eax,%eax
    22ba:	0f 84 e3 03 00 00    	je     26a3 <subdir+0x753>
    22c0:	83 ec 0c             	sub    $0xc,%esp
    22c3:	68 ee 4a 00 00       	push   $0x4aee
    22c8:	e8 f5 1a 00 00       	call   3dc2 <unlink>
    22cd:	83 c4 10             	add    $0x10,%esp
    22d0:	85 c0                	test   %eax,%eax
    22d2:	0f 84 b1 03 00 00    	je     2689 <subdir+0x739>
    22d8:	83 ec 0c             	sub    $0xc,%esp
    22db:	68 d9 49 00 00       	push   $0x49d9
    22e0:	e8 fd 1a 00 00       	call   3de2 <chdir>
    22e5:	83 c4 10             	add    $0x10,%esp
    22e8:	85 c0                	test   %eax,%eax
    22ea:	0f 84 7f 03 00 00    	je     266f <subdir+0x71f>
    22f0:	83 ec 0c             	sub    $0xc,%esp
    22f3:	68 85 4b 00 00       	push   $0x4b85
    22f8:	e8 e5 1a 00 00       	call   3de2 <chdir>
    22fd:	83 c4 10             	add    $0x10,%esp
    2300:	85 c0                	test   %eax,%eax
    2302:	0f 84 4d 03 00 00    	je     2655 <subdir+0x705>
    2308:	83 ec 0c             	sub    $0xc,%esp
    230b:	68 3a 4a 00 00       	push   $0x4a3a
    2310:	e8 ad 1a 00 00       	call   3dc2 <unlink>
    2315:	83 c4 10             	add    $0x10,%esp
    2318:	85 c0                	test   %eax,%eax
    231a:	0f 85 ab 00 00 00    	jne    23cb <subdir+0x47b>
    2320:	83 ec 0c             	sub    $0xc,%esp
    2323:	68 d9 49 00 00       	push   $0x49d9
    2328:	e8 95 1a 00 00       	call   3dc2 <unlink>
    232d:	83 c4 10             	add    $0x10,%esp
    2330:	85 c0                	test   %eax,%eax
    2332:	0f 85 03 03 00 00    	jne    263b <subdir+0x6eb>
    2338:	83 ec 0c             	sub    $0xc,%esp
    233b:	68 a0 4a 00 00       	push   $0x4aa0
    2340:	e8 7d 1a 00 00       	call   3dc2 <unlink>
    2345:	83 c4 10             	add    $0x10,%esp
    2348:	85 c0                	test   %eax,%eax
    234a:	0f 84 d1 02 00 00    	je     2621 <subdir+0x6d1>
    2350:	83 ec 0c             	sub    $0xc,%esp
    2353:	68 b5 49 00 00       	push   $0x49b5
    2358:	e8 65 1a 00 00       	call   3dc2 <unlink>
    235d:	83 c4 10             	add    $0x10,%esp
    2360:	85 c0                	test   %eax,%eax
    2362:	0f 88 9f 02 00 00    	js     2607 <subdir+0x6b7>
    2368:	83 ec 0c             	sub    $0xc,%esp
    236b:	68 a0 4a 00 00       	push   $0x4aa0
    2370:	e8 4d 1a 00 00       	call   3dc2 <unlink>
    2375:	83 c4 10             	add    $0x10,%esp
    2378:	85 c0                	test   %eax,%eax
    237a:	0f 88 6d 02 00 00    	js     25ed <subdir+0x69d>
    2380:	83 ec 08             	sub    $0x8,%esp
    2383:	68 82 4c 00 00       	push   $0x4c82
    2388:	6a 01                	push   $0x1
    238a:	e8 31 1b 00 00       	call   3ec0 <printf>
    238f:	83 c4 10             	add    $0x10,%esp
    2392:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2395:	c9                   	leave  
    2396:	c3                   	ret    
    2397:	50                   	push   %eax
    2398:	50                   	push   %eax
    2399:	68 1f 4a 00 00       	push   $0x4a1f
    239e:	6a 01                	push   $0x1
    23a0:	e8 1b 1b 00 00       	call   3ec0 <printf>
    23a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23ac:	e8 c1 19 00 00       	call   3d72 <exit>
    23b1:	50                   	push   %eax
    23b2:	50                   	push   %eax
    23b3:	68 7a 4a 00 00       	push   $0x4a7a
    23b8:	6a 01                	push   $0x1
    23ba:	e8 01 1b 00 00       	call   3ec0 <printf>
    23bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23c6:	e8 a7 19 00 00       	call   3d72 <exit>
    23cb:	52                   	push   %edx
    23cc:	52                   	push   %edx
    23cd:	68 45 4a 00 00       	push   $0x4a45
    23d2:	6a 01                	push   $0x1
    23d4:	e8 e7 1a 00 00       	call   3ec0 <printf>
    23d9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23e0:	e8 8d 19 00 00       	call   3d72 <exit>
    23e5:	50                   	push   %eax
    23e6:	50                   	push   %eax
    23e7:	68 f7 4a 00 00       	push   $0x4af7
    23ec:	6a 01                	push   $0x1
    23ee:	e8 cd 1a 00 00       	call   3ec0 <printf>
    23f3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23fa:	e8 73 19 00 00       	call   3d72 <exit>
    23ff:	52                   	push   %edx
    2400:	52                   	push   %edx
    2401:	68 dc 54 00 00       	push   $0x54dc
    2406:	6a 01                	push   $0x1
    2408:	e8 b3 1a 00 00       	call   3ec0 <printf>
    240d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2414:	e8 59 19 00 00       	call   3d72 <exit>
    2419:	52                   	push   %edx
    241a:	52                   	push   %edx
    241b:	68 8b 4b 00 00       	push   $0x4b8b
    2420:	6a 01                	push   $0x1
    2422:	e8 99 1a 00 00       	call   3ec0 <printf>
    2427:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    242e:	e8 3f 19 00 00       	call   3d72 <exit>
    2433:	51                   	push   %ecx
    2434:	51                   	push   %ecx
    2435:	68 4c 55 00 00       	push   $0x554c
    243a:	6a 01                	push   $0x1
    243c:	e8 7f 1a 00 00       	call   3ec0 <printf>
    2441:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2448:	e8 25 19 00 00       	call   3d72 <exit>
    244d:	50                   	push   %eax
    244e:	50                   	push   %eax
    244f:	68 06 4a 00 00       	push   $0x4a06
    2454:	6a 01                	push   $0x1
    2456:	e8 65 1a 00 00       	call   3ec0 <printf>
    245b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2462:	e8 0b 19 00 00       	call   3d72 <exit>
    2467:	51                   	push   %ecx
    2468:	51                   	push   %ecx
    2469:	68 df 49 00 00       	push   $0x49df
    246e:	6a 01                	push   $0x1
    2470:	e8 4b 1a 00 00       	call   3ec0 <printf>
    2475:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    247c:	e8 f1 18 00 00       	call   3d72 <exit>
    2481:	50                   	push   %eax
    2482:	50                   	push   %eax
    2483:	68 a8 4a 00 00       	push   $0x4aa8
    2488:	6a 01                	push   $0x1
    248a:	e8 31 1a 00 00       	call   3ec0 <printf>
    248f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2496:	e8 d7 18 00 00       	call   3d72 <exit>
    249b:	51                   	push   %ecx
    249c:	51                   	push   %ecx
    249d:	68 94 54 00 00       	push   $0x5494
    24a2:	6a 01                	push   $0x1
    24a4:	e8 17 1a 00 00       	call   3ec0 <printf>
    24a9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24b0:	e8 bd 18 00 00       	call   3d72 <exit>
    24b5:	53                   	push   %ebx
    24b6:	53                   	push   %ebx
    24b7:	68 28 55 00 00       	push   $0x5528
    24bc:	6a 01                	push   $0x1
    24be:	e8 fd 19 00 00       	call   3ec0 <printf>
    24c3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24ca:	e8 a3 18 00 00       	call   3d72 <exit>
    24cf:	50                   	push   %eax
    24d0:	50                   	push   %eax
    24d1:	68 04 55 00 00       	push   $0x5504
    24d6:	6a 01                	push   $0x1
    24d8:	e8 e3 19 00 00       	call   3ec0 <printf>
    24dd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24e4:	e8 89 18 00 00       	call   3d72 <exit>
    24e9:	50                   	push   %eax
    24ea:	50                   	push   %eax
    24eb:	68 67 4b 00 00       	push   $0x4b67
    24f0:	6a 01                	push   $0x1
    24f2:	e8 c9 19 00 00       	call   3ec0 <printf>
    24f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24fe:	e8 6f 18 00 00       	call   3d72 <exit>
    2503:	50                   	push   %eax
    2504:	50                   	push   %eax
    2505:	68 4e 4b 00 00       	push   $0x4b4e
    250a:	6a 01                	push   $0x1
    250c:	e8 af 19 00 00       	call   3ec0 <printf>
    2511:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2518:	e8 55 18 00 00       	call   3d72 <exit>
    251d:	50                   	push   %eax
    251e:	50                   	push   %eax
    251f:	68 38 4b 00 00       	push   $0x4b38
    2524:	6a 01                	push   $0x1
    2526:	e8 95 19 00 00       	call   3ec0 <printf>
    252b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2532:	e8 3b 18 00 00       	call   3d72 <exit>
    2537:	50                   	push   %eax
    2538:	50                   	push   %eax
    2539:	68 1c 4b 00 00       	push   $0x4b1c
    253e:	6a 01                	push   $0x1
    2540:	e8 7b 19 00 00       	call   3ec0 <printf>
    2545:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    254c:	e8 21 18 00 00       	call   3d72 <exit>
    2551:	50                   	push   %eax
    2552:	50                   	push   %eax
    2553:	68 5d 4a 00 00       	push   $0x4a5d
    2558:	6a 01                	push   $0x1
    255a:	e8 61 19 00 00       	call   3ec0 <printf>
    255f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2566:	e8 07 18 00 00       	call   3d72 <exit>
    256b:	50                   	push   %eax
    256c:	50                   	push   %eax
    256d:	68 b8 54 00 00       	push   $0x54b8
    2572:	6a 01                	push   $0x1
    2574:	e8 47 19 00 00       	call   3ec0 <printf>
    2579:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2580:	e8 ed 17 00 00       	call   3d72 <exit>
    2585:	53                   	push   %ebx
    2586:	53                   	push   %ebx
    2587:	68 bb 49 00 00       	push   $0x49bb
    258c:	6a 01                	push   $0x1
    258e:	e8 2d 19 00 00       	call   3ec0 <printf>
    2593:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    259a:	e8 d3 17 00 00       	call   3d72 <exit>
    259f:	50                   	push   %eax
    25a0:	50                   	push   %eax
    25a1:	68 6c 54 00 00       	push   $0x546c
    25a6:	6a 01                	push   $0x1
    25a8:	e8 13 19 00 00       	call   3ec0 <printf>
    25ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25b4:	e8 b9 17 00 00       	call   3d72 <exit>
    25b9:	50                   	push   %eax
    25ba:	50                   	push   %eax
    25bb:	68 9f 49 00 00       	push   $0x499f
    25c0:	6a 01                	push   $0x1
    25c2:	e8 f9 18 00 00       	call   3ec0 <printf>
    25c7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25ce:	e8 9f 17 00 00       	call   3d72 <exit>
    25d3:	50                   	push   %eax
    25d4:	50                   	push   %eax
    25d5:	68 87 49 00 00       	push   $0x4987
    25da:	6a 01                	push   $0x1
    25dc:	e8 df 18 00 00       	call   3ec0 <printf>
    25e1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25e8:	e8 85 17 00 00       	call   3d72 <exit>
    25ed:	50                   	push   %eax
    25ee:	50                   	push   %eax
    25ef:	68 70 4c 00 00       	push   $0x4c70
    25f4:	6a 01                	push   $0x1
    25f6:	e8 c5 18 00 00       	call   3ec0 <printf>
    25fb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2602:	e8 6b 17 00 00       	call   3d72 <exit>
    2607:	52                   	push   %edx
    2608:	52                   	push   %edx
    2609:	68 5b 4c 00 00       	push   $0x4c5b
    260e:	6a 01                	push   $0x1
    2610:	e8 ab 18 00 00       	call   3ec0 <printf>
    2615:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    261c:	e8 51 17 00 00       	call   3d72 <exit>
    2621:	51                   	push   %ecx
    2622:	51                   	push   %ecx
    2623:	68 70 55 00 00       	push   $0x5570
    2628:	6a 01                	push   $0x1
    262a:	e8 91 18 00 00       	call   3ec0 <printf>
    262f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2636:	e8 37 17 00 00       	call   3d72 <exit>
    263b:	53                   	push   %ebx
    263c:	53                   	push   %ebx
    263d:	68 46 4c 00 00       	push   $0x4c46
    2642:	6a 01                	push   $0x1
    2644:	e8 77 18 00 00       	call   3ec0 <printf>
    2649:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2650:	e8 1d 17 00 00       	call   3d72 <exit>
    2655:	50                   	push   %eax
    2656:	50                   	push   %eax
    2657:	68 2e 4c 00 00       	push   $0x4c2e
    265c:	6a 01                	push   $0x1
    265e:	e8 5d 18 00 00       	call   3ec0 <printf>
    2663:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    266a:	e8 03 17 00 00       	call   3d72 <exit>
    266f:	50                   	push   %eax
    2670:	50                   	push   %eax
    2671:	68 16 4c 00 00       	push   $0x4c16
    2676:	6a 01                	push   $0x1
    2678:	e8 43 18 00 00       	call   3ec0 <printf>
    267d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2684:	e8 e9 16 00 00       	call   3d72 <exit>
    2689:	50                   	push   %eax
    268a:	50                   	push   %eax
    268b:	68 fa 4b 00 00       	push   $0x4bfa
    2690:	6a 01                	push   $0x1
    2692:	e8 29 18 00 00       	call   3ec0 <printf>
    2697:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    269e:	e8 cf 16 00 00       	call   3d72 <exit>
    26a3:	50                   	push   %eax
    26a4:	50                   	push   %eax
    26a5:	68 de 4b 00 00       	push   $0x4bde
    26aa:	6a 01                	push   $0x1
    26ac:	e8 0f 18 00 00       	call   3ec0 <printf>
    26b1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26b8:	e8 b5 16 00 00       	call   3d72 <exit>
    26bd:	50                   	push   %eax
    26be:	50                   	push   %eax
    26bf:	68 c1 4b 00 00       	push   $0x4bc1
    26c4:	6a 01                	push   $0x1
    26c6:	e8 f5 17 00 00       	call   3ec0 <printf>
    26cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26d2:	e8 9b 16 00 00       	call   3d72 <exit>
    26d7:	50                   	push   %eax
    26d8:	50                   	push   %eax
    26d9:	68 a6 4b 00 00       	push   $0x4ba6
    26de:	6a 01                	push   $0x1
    26e0:	e8 db 17 00 00       	call   3ec0 <printf>
    26e5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26ec:	e8 81 16 00 00       	call   3d72 <exit>
    26f1:	50                   	push   %eax
    26f2:	50                   	push   %eax
    26f3:	68 d3 4a 00 00       	push   $0x4ad3
    26f8:	6a 01                	push   $0x1
    26fa:	e8 c1 17 00 00       	call   3ec0 <printf>
    26ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2706:	e8 67 16 00 00       	call   3d72 <exit>
    270b:	50                   	push   %eax
    270c:	50                   	push   %eax
    270d:	68 bb 4a 00 00       	push   $0x4abb
    2712:	6a 01                	push   $0x1
    2714:	e8 a7 17 00 00       	call   3ec0 <printf>
    2719:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2720:	e8 4d 16 00 00       	call   3d72 <exit>
    2725:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002730 <bigwrite>:
    2730:	55                   	push   %ebp
    2731:	89 e5                	mov    %esp,%ebp
    2733:	56                   	push   %esi
    2734:	53                   	push   %ebx
    2735:	bb f3 01 00 00       	mov    $0x1f3,%ebx
    273a:	83 ec 08             	sub    $0x8,%esp
    273d:	68 8d 4c 00 00       	push   $0x4c8d
    2742:	6a 01                	push   $0x1
    2744:	e8 77 17 00 00       	call   3ec0 <printf>
    2749:	c7 04 24 9c 4c 00 00 	movl   $0x4c9c,(%esp)
    2750:	e8 6d 16 00 00       	call   3dc2 <unlink>
    2755:	83 c4 10             	add    $0x10,%esp
    2758:	90                   	nop
    2759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2760:	83 ec 08             	sub    $0x8,%esp
    2763:	68 02 02 00 00       	push   $0x202
    2768:	68 9c 4c 00 00       	push   $0x4c9c
    276d:	e8 40 16 00 00       	call   3db2 <open>
    2772:	83 c4 10             	add    $0x10,%esp
    2775:	85 c0                	test   %eax,%eax
    2777:	89 c6                	mov    %eax,%esi
    2779:	0f 88 85 00 00 00    	js     2804 <bigwrite+0xd4>
    277f:	83 ec 04             	sub    $0x4,%esp
    2782:	53                   	push   %ebx
    2783:	68 80 8a 00 00       	push   $0x8a80
    2788:	50                   	push   %eax
    2789:	e8 04 16 00 00       	call   3d92 <write>
    278e:	83 c4 10             	add    $0x10,%esp
    2791:	39 c3                	cmp    %eax,%ebx
    2793:	75 55                	jne    27ea <bigwrite+0xba>
    2795:	83 ec 04             	sub    $0x4,%esp
    2798:	53                   	push   %ebx
    2799:	68 80 8a 00 00       	push   $0x8a80
    279e:	56                   	push   %esi
    279f:	e8 ee 15 00 00       	call   3d92 <write>
    27a4:	83 c4 10             	add    $0x10,%esp
    27a7:	39 c3                	cmp    %eax,%ebx
    27a9:	75 3f                	jne    27ea <bigwrite+0xba>
    27ab:	83 ec 0c             	sub    $0xc,%esp
    27ae:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    27b4:	56                   	push   %esi
    27b5:	e8 e0 15 00 00       	call   3d9a <close>
    27ba:	c7 04 24 9c 4c 00 00 	movl   $0x4c9c,(%esp)
    27c1:	e8 fc 15 00 00       	call   3dc2 <unlink>
    27c6:	83 c4 10             	add    $0x10,%esp
    27c9:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    27cf:	75 8f                	jne    2760 <bigwrite+0x30>
    27d1:	83 ec 08             	sub    $0x8,%esp
    27d4:	68 cf 4c 00 00       	push   $0x4ccf
    27d9:	6a 01                	push   $0x1
    27db:	e8 e0 16 00 00       	call   3ec0 <printf>
    27e0:	83 c4 10             	add    $0x10,%esp
    27e3:	8d 65 f8             	lea    -0x8(%ebp),%esp
    27e6:	5b                   	pop    %ebx
    27e7:	5e                   	pop    %esi
    27e8:	5d                   	pop    %ebp
    27e9:	c3                   	ret    
    27ea:	50                   	push   %eax
    27eb:	53                   	push   %ebx
    27ec:	68 bd 4c 00 00       	push   $0x4cbd
    27f1:	6a 01                	push   $0x1
    27f3:	e8 c8 16 00 00       	call   3ec0 <printf>
    27f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    27ff:	e8 6e 15 00 00       	call   3d72 <exit>
    2804:	83 ec 08             	sub    $0x8,%esp
    2807:	68 a5 4c 00 00       	push   $0x4ca5
    280c:	6a 01                	push   $0x1
    280e:	e8 ad 16 00 00       	call   3ec0 <printf>
    2813:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    281a:	e8 53 15 00 00       	call   3d72 <exit>
    281f:	90                   	nop

00002820 <bigfile>:
    2820:	55                   	push   %ebp
    2821:	89 e5                	mov    %esp,%ebp
    2823:	57                   	push   %edi
    2824:	56                   	push   %esi
    2825:	53                   	push   %ebx
    2826:	83 ec 14             	sub    $0x14,%esp
    2829:	68 dc 4c 00 00       	push   $0x4cdc
    282e:	6a 01                	push   $0x1
    2830:	e8 8b 16 00 00       	call   3ec0 <printf>
    2835:	c7 04 24 f8 4c 00 00 	movl   $0x4cf8,(%esp)
    283c:	e8 81 15 00 00       	call   3dc2 <unlink>
    2841:	5e                   	pop    %esi
    2842:	5f                   	pop    %edi
    2843:	68 02 02 00 00       	push   $0x202
    2848:	68 f8 4c 00 00       	push   $0x4cf8
    284d:	e8 60 15 00 00       	call   3db2 <open>
    2852:	83 c4 10             	add    $0x10,%esp
    2855:	85 c0                	test   %eax,%eax
    2857:	0f 88 82 01 00 00    	js     29df <bigfile+0x1bf>
    285d:	89 c6                	mov    %eax,%esi
    285f:	31 db                	xor    %ebx,%ebx
    2861:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2868:	83 ec 04             	sub    $0x4,%esp
    286b:	68 58 02 00 00       	push   $0x258
    2870:	53                   	push   %ebx
    2871:	68 80 8a 00 00       	push   $0x8a80
    2876:	e8 85 13 00 00       	call   3c00 <memset>
    287b:	83 c4 0c             	add    $0xc,%esp
    287e:	68 58 02 00 00       	push   $0x258
    2883:	68 80 8a 00 00       	push   $0x8a80
    2888:	56                   	push   %esi
    2889:	e8 04 15 00 00       	call   3d92 <write>
    288e:	83 c4 10             	add    $0x10,%esp
    2891:	3d 58 02 00 00       	cmp    $0x258,%eax
    2896:	0f 85 0d 01 00 00    	jne    29a9 <bigfile+0x189>
    289c:	83 c3 01             	add    $0x1,%ebx
    289f:	83 fb 14             	cmp    $0x14,%ebx
    28a2:	75 c4                	jne    2868 <bigfile+0x48>
    28a4:	83 ec 0c             	sub    $0xc,%esp
    28a7:	56                   	push   %esi
    28a8:	e8 ed 14 00 00       	call   3d9a <close>
    28ad:	59                   	pop    %ecx
    28ae:	5b                   	pop    %ebx
    28af:	6a 00                	push   $0x0
    28b1:	68 f8 4c 00 00       	push   $0x4cf8
    28b6:	e8 f7 14 00 00       	call   3db2 <open>
    28bb:	83 c4 10             	add    $0x10,%esp
    28be:	85 c0                	test   %eax,%eax
    28c0:	89 c6                	mov    %eax,%esi
    28c2:	0f 88 fc 00 00 00    	js     29c4 <bigfile+0x1a4>
    28c8:	31 db                	xor    %ebx,%ebx
    28ca:	31 ff                	xor    %edi,%edi
    28cc:	eb 30                	jmp    28fe <bigfile+0xde>
    28ce:	66 90                	xchg   %ax,%ax
    28d0:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    28d5:	0f 85 98 00 00 00    	jne    2973 <bigfile+0x153>
    28db:	0f be 05 80 8a 00 00 	movsbl 0x8a80,%eax
    28e2:	89 fa                	mov    %edi,%edx
    28e4:	d1 fa                	sar    %edx
    28e6:	39 d0                	cmp    %edx,%eax
    28e8:	75 6e                	jne    2958 <bigfile+0x138>
    28ea:	0f be 15 ab 8b 00 00 	movsbl 0x8bab,%edx
    28f1:	39 d0                	cmp    %edx,%eax
    28f3:	75 63                	jne    2958 <bigfile+0x138>
    28f5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
    28fb:	83 c7 01             	add    $0x1,%edi
    28fe:	83 ec 04             	sub    $0x4,%esp
    2901:	68 2c 01 00 00       	push   $0x12c
    2906:	68 80 8a 00 00       	push   $0x8a80
    290b:	56                   	push   %esi
    290c:	e8 79 14 00 00       	call   3d8a <read>
    2911:	83 c4 10             	add    $0x10,%esp
    2914:	85 c0                	test   %eax,%eax
    2916:	78 76                	js     298e <bigfile+0x16e>
    2918:	75 b6                	jne    28d0 <bigfile+0xb0>
    291a:	83 ec 0c             	sub    $0xc,%esp
    291d:	56                   	push   %esi
    291e:	e8 77 14 00 00       	call   3d9a <close>
    2923:	83 c4 10             	add    $0x10,%esp
    2926:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    292c:	0f 85 c8 00 00 00    	jne    29fa <bigfile+0x1da>
    2932:	83 ec 0c             	sub    $0xc,%esp
    2935:	68 f8 4c 00 00       	push   $0x4cf8
    293a:	e8 83 14 00 00       	call   3dc2 <unlink>
    293f:	58                   	pop    %eax
    2940:	5a                   	pop    %edx
    2941:	68 87 4d 00 00       	push   $0x4d87
    2946:	6a 01                	push   $0x1
    2948:	e8 73 15 00 00       	call   3ec0 <printf>
    294d:	83 c4 10             	add    $0x10,%esp
    2950:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2953:	5b                   	pop    %ebx
    2954:	5e                   	pop    %esi
    2955:	5f                   	pop    %edi
    2956:	5d                   	pop    %ebp
    2957:	c3                   	ret    
    2958:	83 ec 08             	sub    $0x8,%esp
    295b:	68 54 4d 00 00       	push   $0x4d54
    2960:	6a 01                	push   $0x1
    2962:	e8 59 15 00 00       	call   3ec0 <printf>
    2967:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    296e:	e8 ff 13 00 00       	call   3d72 <exit>
    2973:	83 ec 08             	sub    $0x8,%esp
    2976:	68 40 4d 00 00       	push   $0x4d40
    297b:	6a 01                	push   $0x1
    297d:	e8 3e 15 00 00       	call   3ec0 <printf>
    2982:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2989:	e8 e4 13 00 00       	call   3d72 <exit>
    298e:	83 ec 08             	sub    $0x8,%esp
    2991:	68 2b 4d 00 00       	push   $0x4d2b
    2996:	6a 01                	push   $0x1
    2998:	e8 23 15 00 00       	call   3ec0 <printf>
    299d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29a4:	e8 c9 13 00 00       	call   3d72 <exit>
    29a9:	83 ec 08             	sub    $0x8,%esp
    29ac:	68 00 4d 00 00       	push   $0x4d00
    29b1:	6a 01                	push   $0x1
    29b3:	e8 08 15 00 00       	call   3ec0 <printf>
    29b8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29bf:	e8 ae 13 00 00       	call   3d72 <exit>
    29c4:	83 ec 08             	sub    $0x8,%esp
    29c7:	68 16 4d 00 00       	push   $0x4d16
    29cc:	6a 01                	push   $0x1
    29ce:	e8 ed 14 00 00       	call   3ec0 <printf>
    29d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29da:	e8 93 13 00 00       	call   3d72 <exit>
    29df:	83 ec 08             	sub    $0x8,%esp
    29e2:	68 ea 4c 00 00       	push   $0x4cea
    29e7:	6a 01                	push   $0x1
    29e9:	e8 d2 14 00 00       	call   3ec0 <printf>
    29ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29f5:	e8 78 13 00 00       	call   3d72 <exit>
    29fa:	83 ec 08             	sub    $0x8,%esp
    29fd:	68 6d 4d 00 00       	push   $0x4d6d
    2a02:	6a 01                	push   $0x1
    2a04:	e8 b7 14 00 00       	call   3ec0 <printf>
    2a09:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a10:	e8 5d 13 00 00       	call   3d72 <exit>
    2a15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002a20 <fourteen>:
    2a20:	55                   	push   %ebp
    2a21:	89 e5                	mov    %esp,%ebp
    2a23:	83 ec 10             	sub    $0x10,%esp
    2a26:	68 98 4d 00 00       	push   $0x4d98
    2a2b:	6a 01                	push   $0x1
    2a2d:	e8 8e 14 00 00       	call   3ec0 <printf>
    2a32:	c7 04 24 d3 4d 00 00 	movl   $0x4dd3,(%esp)
    2a39:	e8 9c 13 00 00       	call   3dda <mkdir>
    2a3e:	83 c4 10             	add    $0x10,%esp
    2a41:	85 c0                	test   %eax,%eax
    2a43:	0f 85 9b 00 00 00    	jne    2ae4 <fourteen+0xc4>
    2a49:	83 ec 0c             	sub    $0xc,%esp
    2a4c:	68 90 55 00 00       	push   $0x5590
    2a51:	e8 84 13 00 00       	call   3dda <mkdir>
    2a56:	83 c4 10             	add    $0x10,%esp
    2a59:	85 c0                	test   %eax,%eax
    2a5b:	0f 85 05 01 00 00    	jne    2b66 <fourteen+0x146>
    2a61:	83 ec 08             	sub    $0x8,%esp
    2a64:	68 00 02 00 00       	push   $0x200
    2a69:	68 e0 55 00 00       	push   $0x55e0
    2a6e:	e8 3f 13 00 00       	call   3db2 <open>
    2a73:	83 c4 10             	add    $0x10,%esp
    2a76:	85 c0                	test   %eax,%eax
    2a78:	0f 88 ce 00 00 00    	js     2b4c <fourteen+0x12c>
    2a7e:	83 ec 0c             	sub    $0xc,%esp
    2a81:	50                   	push   %eax
    2a82:	e8 13 13 00 00       	call   3d9a <close>
    2a87:	58                   	pop    %eax
    2a88:	5a                   	pop    %edx
    2a89:	6a 00                	push   $0x0
    2a8b:	68 50 56 00 00       	push   $0x5650
    2a90:	e8 1d 13 00 00       	call   3db2 <open>
    2a95:	83 c4 10             	add    $0x10,%esp
    2a98:	85 c0                	test   %eax,%eax
    2a9a:	0f 88 92 00 00 00    	js     2b32 <fourteen+0x112>
    2aa0:	83 ec 0c             	sub    $0xc,%esp
    2aa3:	50                   	push   %eax
    2aa4:	e8 f1 12 00 00       	call   3d9a <close>
    2aa9:	c7 04 24 c4 4d 00 00 	movl   $0x4dc4,(%esp)
    2ab0:	e8 25 13 00 00       	call   3dda <mkdir>
    2ab5:	83 c4 10             	add    $0x10,%esp
    2ab8:	85 c0                	test   %eax,%eax
    2aba:	74 5c                	je     2b18 <fourteen+0xf8>
    2abc:	83 ec 0c             	sub    $0xc,%esp
    2abf:	68 ec 56 00 00       	push   $0x56ec
    2ac4:	e8 11 13 00 00       	call   3dda <mkdir>
    2ac9:	83 c4 10             	add    $0x10,%esp
    2acc:	85 c0                	test   %eax,%eax
    2ace:	74 2e                	je     2afe <fourteen+0xde>
    2ad0:	83 ec 08             	sub    $0x8,%esp
    2ad3:	68 e2 4d 00 00       	push   $0x4de2
    2ad8:	6a 01                	push   $0x1
    2ada:	e8 e1 13 00 00       	call   3ec0 <printf>
    2adf:	83 c4 10             	add    $0x10,%esp
    2ae2:	c9                   	leave  
    2ae3:	c3                   	ret    
    2ae4:	50                   	push   %eax
    2ae5:	50                   	push   %eax
    2ae6:	68 a7 4d 00 00       	push   $0x4da7
    2aeb:	6a 01                	push   $0x1
    2aed:	e8 ce 13 00 00       	call   3ec0 <printf>
    2af2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2af9:	e8 74 12 00 00       	call   3d72 <exit>
    2afe:	50                   	push   %eax
    2aff:	50                   	push   %eax
    2b00:	68 0c 57 00 00       	push   $0x570c
    2b05:	6a 01                	push   $0x1
    2b07:	e8 b4 13 00 00       	call   3ec0 <printf>
    2b0c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b13:	e8 5a 12 00 00       	call   3d72 <exit>
    2b18:	52                   	push   %edx
    2b19:	52                   	push   %edx
    2b1a:	68 bc 56 00 00       	push   $0x56bc
    2b1f:	6a 01                	push   $0x1
    2b21:	e8 9a 13 00 00       	call   3ec0 <printf>
    2b26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b2d:	e8 40 12 00 00       	call   3d72 <exit>
    2b32:	51                   	push   %ecx
    2b33:	51                   	push   %ecx
    2b34:	68 80 56 00 00       	push   $0x5680
    2b39:	6a 01                	push   $0x1
    2b3b:	e8 80 13 00 00       	call   3ec0 <printf>
    2b40:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b47:	e8 26 12 00 00       	call   3d72 <exit>
    2b4c:	51                   	push   %ecx
    2b4d:	51                   	push   %ecx
    2b4e:	68 10 56 00 00       	push   $0x5610
    2b53:	6a 01                	push   $0x1
    2b55:	e8 66 13 00 00       	call   3ec0 <printf>
    2b5a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b61:	e8 0c 12 00 00       	call   3d72 <exit>
    2b66:	50                   	push   %eax
    2b67:	50                   	push   %eax
    2b68:	68 b0 55 00 00       	push   $0x55b0
    2b6d:	6a 01                	push   $0x1
    2b6f:	e8 4c 13 00 00       	call   3ec0 <printf>
    2b74:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b7b:	e8 f2 11 00 00       	call   3d72 <exit>

00002b80 <rmdot>:
    2b80:	55                   	push   %ebp
    2b81:	89 e5                	mov    %esp,%ebp
    2b83:	83 ec 10             	sub    $0x10,%esp
    2b86:	68 ef 4d 00 00       	push   $0x4def
    2b8b:	6a 01                	push   $0x1
    2b8d:	e8 2e 13 00 00       	call   3ec0 <printf>
    2b92:	c7 04 24 fb 4d 00 00 	movl   $0x4dfb,(%esp)
    2b99:	e8 3c 12 00 00       	call   3dda <mkdir>
    2b9e:	83 c4 10             	add    $0x10,%esp
    2ba1:	85 c0                	test   %eax,%eax
    2ba3:	0f 85 b4 00 00 00    	jne    2c5d <rmdot+0xdd>
    2ba9:	83 ec 0c             	sub    $0xc,%esp
    2bac:	68 fb 4d 00 00       	push   $0x4dfb
    2bb1:	e8 2c 12 00 00       	call   3de2 <chdir>
    2bb6:	83 c4 10             	add    $0x10,%esp
    2bb9:	85 c0                	test   %eax,%eax
    2bbb:	0f 85 52 01 00 00    	jne    2d13 <rmdot+0x193>
    2bc1:	83 ec 0c             	sub    $0xc,%esp
    2bc4:	68 a6 4a 00 00       	push   $0x4aa6
    2bc9:	e8 f4 11 00 00       	call   3dc2 <unlink>
    2bce:	83 c4 10             	add    $0x10,%esp
    2bd1:	85 c0                	test   %eax,%eax
    2bd3:	0f 84 20 01 00 00    	je     2cf9 <rmdot+0x179>
    2bd9:	83 ec 0c             	sub    $0xc,%esp
    2bdc:	68 a5 4a 00 00       	push   $0x4aa5
    2be1:	e8 dc 11 00 00       	call   3dc2 <unlink>
    2be6:	83 c4 10             	add    $0x10,%esp
    2be9:	85 c0                	test   %eax,%eax
    2beb:	0f 84 ee 00 00 00    	je     2cdf <rmdot+0x15f>
    2bf1:	83 ec 0c             	sub    $0xc,%esp
    2bf4:	68 79 42 00 00       	push   $0x4279
    2bf9:	e8 e4 11 00 00       	call   3de2 <chdir>
    2bfe:	83 c4 10             	add    $0x10,%esp
    2c01:	85 c0                	test   %eax,%eax
    2c03:	0f 85 bc 00 00 00    	jne    2cc5 <rmdot+0x145>
    2c09:	83 ec 0c             	sub    $0xc,%esp
    2c0c:	68 43 4e 00 00       	push   $0x4e43
    2c11:	e8 ac 11 00 00       	call   3dc2 <unlink>
    2c16:	83 c4 10             	add    $0x10,%esp
    2c19:	85 c0                	test   %eax,%eax
    2c1b:	0f 84 8a 00 00 00    	je     2cab <rmdot+0x12b>
    2c21:	83 ec 0c             	sub    $0xc,%esp
    2c24:	68 61 4e 00 00       	push   $0x4e61
    2c29:	e8 94 11 00 00       	call   3dc2 <unlink>
    2c2e:	83 c4 10             	add    $0x10,%esp
    2c31:	85 c0                	test   %eax,%eax
    2c33:	74 5c                	je     2c91 <rmdot+0x111>
    2c35:	83 ec 0c             	sub    $0xc,%esp
    2c38:	68 fb 4d 00 00       	push   $0x4dfb
    2c3d:	e8 80 11 00 00       	call   3dc2 <unlink>
    2c42:	83 c4 10             	add    $0x10,%esp
    2c45:	85 c0                	test   %eax,%eax
    2c47:	75 2e                	jne    2c77 <rmdot+0xf7>
    2c49:	83 ec 08             	sub    $0x8,%esp
    2c4c:	68 96 4e 00 00       	push   $0x4e96
    2c51:	6a 01                	push   $0x1
    2c53:	e8 68 12 00 00       	call   3ec0 <printf>
    2c58:	83 c4 10             	add    $0x10,%esp
    2c5b:	c9                   	leave  
    2c5c:	c3                   	ret    
    2c5d:	50                   	push   %eax
    2c5e:	50                   	push   %eax
    2c5f:	68 00 4e 00 00       	push   $0x4e00
    2c64:	6a 01                	push   $0x1
    2c66:	e8 55 12 00 00       	call   3ec0 <printf>
    2c6b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c72:	e8 fb 10 00 00       	call   3d72 <exit>
    2c77:	50                   	push   %eax
    2c78:	50                   	push   %eax
    2c79:	68 81 4e 00 00       	push   $0x4e81
    2c7e:	6a 01                	push   $0x1
    2c80:	e8 3b 12 00 00       	call   3ec0 <printf>
    2c85:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c8c:	e8 e1 10 00 00       	call   3d72 <exit>
    2c91:	52                   	push   %edx
    2c92:	52                   	push   %edx
    2c93:	68 69 4e 00 00       	push   $0x4e69
    2c98:	6a 01                	push   $0x1
    2c9a:	e8 21 12 00 00       	call   3ec0 <printf>
    2c9f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ca6:	e8 c7 10 00 00       	call   3d72 <exit>
    2cab:	51                   	push   %ecx
    2cac:	51                   	push   %ecx
    2cad:	68 4a 4e 00 00       	push   $0x4e4a
    2cb2:	6a 01                	push   $0x1
    2cb4:	e8 07 12 00 00       	call   3ec0 <printf>
    2cb9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2cc0:	e8 ad 10 00 00       	call   3d72 <exit>
    2cc5:	50                   	push   %eax
    2cc6:	50                   	push   %eax
    2cc7:	68 7b 42 00 00       	push   $0x427b
    2ccc:	6a 01                	push   $0x1
    2cce:	e8 ed 11 00 00       	call   3ec0 <printf>
    2cd3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2cda:	e8 93 10 00 00       	call   3d72 <exit>
    2cdf:	50                   	push   %eax
    2ce0:	50                   	push   %eax
    2ce1:	68 34 4e 00 00       	push   $0x4e34
    2ce6:	6a 01                	push   $0x1
    2ce8:	e8 d3 11 00 00       	call   3ec0 <printf>
    2ced:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2cf4:	e8 79 10 00 00       	call   3d72 <exit>
    2cf9:	50                   	push   %eax
    2cfa:	50                   	push   %eax
    2cfb:	68 26 4e 00 00       	push   $0x4e26
    2d00:	6a 01                	push   $0x1
    2d02:	e8 b9 11 00 00       	call   3ec0 <printf>
    2d07:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d0e:	e8 5f 10 00 00       	call   3d72 <exit>
    2d13:	50                   	push   %eax
    2d14:	50                   	push   %eax
    2d15:	68 13 4e 00 00       	push   $0x4e13
    2d1a:	6a 01                	push   $0x1
    2d1c:	e8 9f 11 00 00       	call   3ec0 <printf>
    2d21:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d28:	e8 45 10 00 00       	call   3d72 <exit>
    2d2d:	8d 76 00             	lea    0x0(%esi),%esi

00002d30 <dirfile>:
    2d30:	55                   	push   %ebp
    2d31:	89 e5                	mov    %esp,%ebp
    2d33:	53                   	push   %ebx
    2d34:	83 ec 0c             	sub    $0xc,%esp
    2d37:	68 a0 4e 00 00       	push   $0x4ea0
    2d3c:	6a 01                	push   $0x1
    2d3e:	e8 7d 11 00 00       	call   3ec0 <printf>
    2d43:	59                   	pop    %ecx
    2d44:	5b                   	pop    %ebx
    2d45:	68 00 02 00 00       	push   $0x200
    2d4a:	68 ad 4e 00 00       	push   $0x4ead
    2d4f:	e8 5e 10 00 00       	call   3db2 <open>
    2d54:	83 c4 10             	add    $0x10,%esp
    2d57:	85 c0                	test   %eax,%eax
    2d59:	0f 88 51 01 00 00    	js     2eb0 <dirfile+0x180>
    2d5f:	83 ec 0c             	sub    $0xc,%esp
    2d62:	50                   	push   %eax
    2d63:	e8 32 10 00 00       	call   3d9a <close>
    2d68:	c7 04 24 ad 4e 00 00 	movl   $0x4ead,(%esp)
    2d6f:	e8 6e 10 00 00       	call   3de2 <chdir>
    2d74:	83 c4 10             	add    $0x10,%esp
    2d77:	85 c0                	test   %eax,%eax
    2d79:	0f 84 17 01 00 00    	je     2e96 <dirfile+0x166>
    2d7f:	83 ec 08             	sub    $0x8,%esp
    2d82:	6a 00                	push   $0x0
    2d84:	68 e6 4e 00 00       	push   $0x4ee6
    2d89:	e8 24 10 00 00       	call   3db2 <open>
    2d8e:	83 c4 10             	add    $0x10,%esp
    2d91:	85 c0                	test   %eax,%eax
    2d93:	0f 89 e3 00 00 00    	jns    2e7c <dirfile+0x14c>
    2d99:	83 ec 08             	sub    $0x8,%esp
    2d9c:	68 00 02 00 00       	push   $0x200
    2da1:	68 e6 4e 00 00       	push   $0x4ee6
    2da6:	e8 07 10 00 00       	call   3db2 <open>
    2dab:	83 c4 10             	add    $0x10,%esp
    2dae:	85 c0                	test   %eax,%eax
    2db0:	0f 89 c6 00 00 00    	jns    2e7c <dirfile+0x14c>
    2db6:	83 ec 0c             	sub    $0xc,%esp
    2db9:	68 e6 4e 00 00       	push   $0x4ee6
    2dbe:	e8 17 10 00 00       	call   3dda <mkdir>
    2dc3:	83 c4 10             	add    $0x10,%esp
    2dc6:	85 c0                	test   %eax,%eax
    2dc8:	0f 84 7e 01 00 00    	je     2f4c <dirfile+0x21c>
    2dce:	83 ec 0c             	sub    $0xc,%esp
    2dd1:	68 e6 4e 00 00       	push   $0x4ee6
    2dd6:	e8 e7 0f 00 00       	call   3dc2 <unlink>
    2ddb:	83 c4 10             	add    $0x10,%esp
    2dde:	85 c0                	test   %eax,%eax
    2de0:	0f 84 4c 01 00 00    	je     2f32 <dirfile+0x202>
    2de6:	83 ec 08             	sub    $0x8,%esp
    2de9:	68 e6 4e 00 00       	push   $0x4ee6
    2dee:	68 4a 4f 00 00       	push   $0x4f4a
    2df3:	e8 da 0f 00 00       	call   3dd2 <link>
    2df8:	83 c4 10             	add    $0x10,%esp
    2dfb:	85 c0                	test   %eax,%eax
    2dfd:	0f 84 15 01 00 00    	je     2f18 <dirfile+0x1e8>
    2e03:	83 ec 0c             	sub    $0xc,%esp
    2e06:	68 ad 4e 00 00       	push   $0x4ead
    2e0b:	e8 b2 0f 00 00       	call   3dc2 <unlink>
    2e10:	83 c4 10             	add    $0x10,%esp
    2e13:	85 c0                	test   %eax,%eax
    2e15:	0f 85 e3 00 00 00    	jne    2efe <dirfile+0x1ce>
    2e1b:	83 ec 08             	sub    $0x8,%esp
    2e1e:	6a 02                	push   $0x2
    2e20:	68 a6 4a 00 00       	push   $0x4aa6
    2e25:	e8 88 0f 00 00       	call   3db2 <open>
    2e2a:	83 c4 10             	add    $0x10,%esp
    2e2d:	85 c0                	test   %eax,%eax
    2e2f:	0f 89 af 00 00 00    	jns    2ee4 <dirfile+0x1b4>
    2e35:	83 ec 08             	sub    $0x8,%esp
    2e38:	6a 00                	push   $0x0
    2e3a:	68 a6 4a 00 00       	push   $0x4aa6
    2e3f:	e8 6e 0f 00 00       	call   3db2 <open>
    2e44:	83 c4 0c             	add    $0xc,%esp
    2e47:	89 c3                	mov    %eax,%ebx
    2e49:	6a 01                	push   $0x1
    2e4b:	68 89 4b 00 00       	push   $0x4b89
    2e50:	50                   	push   %eax
    2e51:	e8 3c 0f 00 00       	call   3d92 <write>
    2e56:	83 c4 10             	add    $0x10,%esp
    2e59:	85 c0                	test   %eax,%eax
    2e5b:	7f 6d                	jg     2eca <dirfile+0x19a>
    2e5d:	83 ec 0c             	sub    $0xc,%esp
    2e60:	53                   	push   %ebx
    2e61:	e8 34 0f 00 00       	call   3d9a <close>
    2e66:	58                   	pop    %eax
    2e67:	5a                   	pop    %edx
    2e68:	68 7d 4f 00 00       	push   $0x4f7d
    2e6d:	6a 01                	push   $0x1
    2e6f:	e8 4c 10 00 00       	call   3ec0 <printf>
    2e74:	83 c4 10             	add    $0x10,%esp
    2e77:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2e7a:	c9                   	leave  
    2e7b:	c3                   	ret    
    2e7c:	50                   	push   %eax
    2e7d:	50                   	push   %eax
    2e7e:	68 f1 4e 00 00       	push   $0x4ef1
    2e83:	6a 01                	push   $0x1
    2e85:	e8 36 10 00 00       	call   3ec0 <printf>
    2e8a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e91:	e8 dc 0e 00 00       	call   3d72 <exit>
    2e96:	50                   	push   %eax
    2e97:	50                   	push   %eax
    2e98:	68 cc 4e 00 00       	push   $0x4ecc
    2e9d:	6a 01                	push   $0x1
    2e9f:	e8 1c 10 00 00       	call   3ec0 <printf>
    2ea4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2eab:	e8 c2 0e 00 00       	call   3d72 <exit>
    2eb0:	52                   	push   %edx
    2eb1:	52                   	push   %edx
    2eb2:	68 b5 4e 00 00       	push   $0x4eb5
    2eb7:	6a 01                	push   $0x1
    2eb9:	e8 02 10 00 00       	call   3ec0 <printf>
    2ebe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ec5:	e8 a8 0e 00 00       	call   3d72 <exit>
    2eca:	51                   	push   %ecx
    2ecb:	51                   	push   %ecx
    2ecc:	68 69 4f 00 00       	push   $0x4f69
    2ed1:	6a 01                	push   $0x1
    2ed3:	e8 e8 0f 00 00       	call   3ec0 <printf>
    2ed8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2edf:	e8 8e 0e 00 00       	call   3d72 <exit>
    2ee4:	53                   	push   %ebx
    2ee5:	53                   	push   %ebx
    2ee6:	68 60 57 00 00       	push   $0x5760
    2eeb:	6a 01                	push   $0x1
    2eed:	e8 ce 0f 00 00       	call   3ec0 <printf>
    2ef2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ef9:	e8 74 0e 00 00       	call   3d72 <exit>
    2efe:	50                   	push   %eax
    2eff:	50                   	push   %eax
    2f00:	68 51 4f 00 00       	push   $0x4f51
    2f05:	6a 01                	push   $0x1
    2f07:	e8 b4 0f 00 00       	call   3ec0 <printf>
    2f0c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f13:	e8 5a 0e 00 00       	call   3d72 <exit>
    2f18:	50                   	push   %eax
    2f19:	50                   	push   %eax
    2f1a:	68 40 57 00 00       	push   $0x5740
    2f1f:	6a 01                	push   $0x1
    2f21:	e8 9a 0f 00 00       	call   3ec0 <printf>
    2f26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f2d:	e8 40 0e 00 00       	call   3d72 <exit>
    2f32:	50                   	push   %eax
    2f33:	50                   	push   %eax
    2f34:	68 2c 4f 00 00       	push   $0x4f2c
    2f39:	6a 01                	push   $0x1
    2f3b:	e8 80 0f 00 00       	call   3ec0 <printf>
    2f40:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f47:	e8 26 0e 00 00       	call   3d72 <exit>
    2f4c:	50                   	push   %eax
    2f4d:	50                   	push   %eax
    2f4e:	68 0f 4f 00 00       	push   $0x4f0f
    2f53:	6a 01                	push   $0x1
    2f55:	e8 66 0f 00 00       	call   3ec0 <printf>
    2f5a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f61:	e8 0c 0e 00 00       	call   3d72 <exit>
    2f66:	8d 76 00             	lea    0x0(%esi),%esi
    2f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002f70 <iref>:
    2f70:	55                   	push   %ebp
    2f71:	89 e5                	mov    %esp,%ebp
    2f73:	53                   	push   %ebx
    2f74:	bb 33 00 00 00       	mov    $0x33,%ebx
    2f79:	83 ec 0c             	sub    $0xc,%esp
    2f7c:	68 8d 4f 00 00       	push   $0x4f8d
    2f81:	6a 01                	push   $0x1
    2f83:	e8 38 0f 00 00       	call   3ec0 <printf>
    2f88:	83 c4 10             	add    $0x10,%esp
    2f8b:	90                   	nop
    2f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2f90:	83 ec 0c             	sub    $0xc,%esp
    2f93:	68 9e 4f 00 00       	push   $0x4f9e
    2f98:	e8 3d 0e 00 00       	call   3dda <mkdir>
    2f9d:	83 c4 10             	add    $0x10,%esp
    2fa0:	85 c0                	test   %eax,%eax
    2fa2:	0f 85 bb 00 00 00    	jne    3063 <iref+0xf3>
    2fa8:	83 ec 0c             	sub    $0xc,%esp
    2fab:	68 9e 4f 00 00       	push   $0x4f9e
    2fb0:	e8 2d 0e 00 00       	call   3de2 <chdir>
    2fb5:	83 c4 10             	add    $0x10,%esp
    2fb8:	85 c0                	test   %eax,%eax
    2fba:	0f 85 be 00 00 00    	jne    307e <iref+0x10e>
    2fc0:	83 ec 0c             	sub    $0xc,%esp
    2fc3:	68 53 46 00 00       	push   $0x4653
    2fc8:	e8 0d 0e 00 00       	call   3dda <mkdir>
    2fcd:	59                   	pop    %ecx
    2fce:	58                   	pop    %eax
    2fcf:	68 53 46 00 00       	push   $0x4653
    2fd4:	68 4a 4f 00 00       	push   $0x4f4a
    2fd9:	e8 f4 0d 00 00       	call   3dd2 <link>
    2fde:	58                   	pop    %eax
    2fdf:	5a                   	pop    %edx
    2fe0:	68 00 02 00 00       	push   $0x200
    2fe5:	68 53 46 00 00       	push   $0x4653
    2fea:	e8 c3 0d 00 00       	call   3db2 <open>
    2fef:	83 c4 10             	add    $0x10,%esp
    2ff2:	85 c0                	test   %eax,%eax
    2ff4:	78 0c                	js     3002 <iref+0x92>
    2ff6:	83 ec 0c             	sub    $0xc,%esp
    2ff9:	50                   	push   %eax
    2ffa:	e8 9b 0d 00 00       	call   3d9a <close>
    2fff:	83 c4 10             	add    $0x10,%esp
    3002:	83 ec 08             	sub    $0x8,%esp
    3005:	68 00 02 00 00       	push   $0x200
    300a:	68 88 4b 00 00       	push   $0x4b88
    300f:	e8 9e 0d 00 00       	call   3db2 <open>
    3014:	83 c4 10             	add    $0x10,%esp
    3017:	85 c0                	test   %eax,%eax
    3019:	78 0c                	js     3027 <iref+0xb7>
    301b:	83 ec 0c             	sub    $0xc,%esp
    301e:	50                   	push   %eax
    301f:	e8 76 0d 00 00       	call   3d9a <close>
    3024:	83 c4 10             	add    $0x10,%esp
    3027:	83 ec 0c             	sub    $0xc,%esp
    302a:	68 88 4b 00 00       	push   $0x4b88
    302f:	e8 8e 0d 00 00       	call   3dc2 <unlink>
    3034:	83 c4 10             	add    $0x10,%esp
    3037:	83 eb 01             	sub    $0x1,%ebx
    303a:	0f 85 50 ff ff ff    	jne    2f90 <iref+0x20>
    3040:	83 ec 0c             	sub    $0xc,%esp
    3043:	68 79 42 00 00       	push   $0x4279
    3048:	e8 95 0d 00 00       	call   3de2 <chdir>
    304d:	58                   	pop    %eax
    304e:	5a                   	pop    %edx
    304f:	68 cc 4f 00 00       	push   $0x4fcc
    3054:	6a 01                	push   $0x1
    3056:	e8 65 0e 00 00       	call   3ec0 <printf>
    305b:	83 c4 10             	add    $0x10,%esp
    305e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3061:	c9                   	leave  
    3062:	c3                   	ret    
    3063:	83 ec 08             	sub    $0x8,%esp
    3066:	68 a4 4f 00 00       	push   $0x4fa4
    306b:	6a 01                	push   $0x1
    306d:	e8 4e 0e 00 00       	call   3ec0 <printf>
    3072:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3079:	e8 f4 0c 00 00       	call   3d72 <exit>
    307e:	83 ec 08             	sub    $0x8,%esp
    3081:	68 b8 4f 00 00       	push   $0x4fb8
    3086:	6a 01                	push   $0x1
    3088:	e8 33 0e 00 00       	call   3ec0 <printf>
    308d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3094:	e8 d9 0c 00 00       	call   3d72 <exit>
    3099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000030a0 <forktest>:
    30a0:	55                   	push   %ebp
    30a1:	89 e5                	mov    %esp,%ebp
    30a3:	53                   	push   %ebx
    30a4:	31 db                	xor    %ebx,%ebx
    30a6:	83 ec 0c             	sub    $0xc,%esp
    30a9:	68 e0 4f 00 00       	push   $0x4fe0
    30ae:	6a 01                	push   $0x1
    30b0:	e8 0b 0e 00 00       	call   3ec0 <printf>
    30b5:	83 c4 10             	add    $0x10,%esp
    30b8:	eb 13                	jmp    30cd <forktest+0x2d>
    30ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    30c0:	74 69                	je     312b <forktest+0x8b>
    30c2:	83 c3 01             	add    $0x1,%ebx
    30c5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    30cb:	74 43                	je     3110 <forktest+0x70>
    30cd:	e8 98 0c 00 00       	call   3d6a <fork>
    30d2:	85 c0                	test   %eax,%eax
    30d4:	79 ea                	jns    30c0 <forktest+0x20>
    30d6:	85 db                	test   %ebx,%ebx
    30d8:	74 14                	je     30ee <forktest+0x4e>
    30da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    30e0:	e8 95 0c 00 00       	call   3d7a <wait>
    30e5:	85 c0                	test   %eax,%eax
    30e7:	78 4c                	js     3135 <forktest+0x95>
    30e9:	83 eb 01             	sub    $0x1,%ebx
    30ec:	75 f2                	jne    30e0 <forktest+0x40>
    30ee:	e8 87 0c 00 00       	call   3d7a <wait>
    30f3:	83 f8 ff             	cmp    $0xffffffff,%eax
    30f6:	75 58                	jne    3150 <forktest+0xb0>
    30f8:	83 ec 08             	sub    $0x8,%esp
    30fb:	68 12 50 00 00       	push   $0x5012
    3100:	6a 01                	push   $0x1
    3102:	e8 b9 0d 00 00       	call   3ec0 <printf>
    3107:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    310a:	c9                   	leave  
    310b:	c3                   	ret    
    310c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3110:	83 ec 08             	sub    $0x8,%esp
    3113:	68 80 57 00 00       	push   $0x5780
    3118:	6a 01                	push   $0x1
    311a:	e8 a1 0d 00 00       	call   3ec0 <printf>
    311f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3126:	e8 47 0c 00 00       	call   3d72 <exit>
    312b:	83 ec 0c             	sub    $0xc,%esp
    312e:	6a 00                	push   $0x0
    3130:	e8 3d 0c 00 00       	call   3d72 <exit>
    3135:	83 ec 08             	sub    $0x8,%esp
    3138:	68 eb 4f 00 00       	push   $0x4feb
    313d:	6a 01                	push   $0x1
    313f:	e8 7c 0d 00 00       	call   3ec0 <printf>
    3144:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    314b:	e8 22 0c 00 00       	call   3d72 <exit>
    3150:	83 ec 08             	sub    $0x8,%esp
    3153:	68 ff 4f 00 00       	push   $0x4fff
    3158:	6a 01                	push   $0x1
    315a:	e8 61 0d 00 00       	call   3ec0 <printf>
    315f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3166:	e8 07 0c 00 00       	call   3d72 <exit>
    316b:	90                   	nop
    316c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003170 <sbrktest>:
    3170:	55                   	push   %ebp
    3171:	89 e5                	mov    %esp,%ebp
    3173:	57                   	push   %edi
    3174:	56                   	push   %esi
    3175:	53                   	push   %ebx
    3176:	31 ff                	xor    %edi,%edi
    3178:	83 ec 64             	sub    $0x64,%esp
    317b:	68 20 50 00 00       	push   $0x5020
    3180:	ff 35 a8 62 00 00    	pushl  0x62a8
    3186:	e8 35 0d 00 00       	call   3ec0 <printf>
    318b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3192:	e8 63 0c 00 00       	call   3dfa <sbrk>
    3197:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    319e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    31a1:	e8 54 0c 00 00       	call   3dfa <sbrk>
    31a6:	83 c4 10             	add    $0x10,%esp
    31a9:	89 c3                	mov    %eax,%ebx
    31ab:	90                   	nop
    31ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    31b0:	83 ec 0c             	sub    $0xc,%esp
    31b3:	6a 01                	push   $0x1
    31b5:	e8 40 0c 00 00       	call   3dfa <sbrk>
    31ba:	83 c4 10             	add    $0x10,%esp
    31bd:	39 d8                	cmp    %ebx,%eax
    31bf:	0f 85 85 02 00 00    	jne    344a <sbrktest+0x2da>
    31c5:	83 c7 01             	add    $0x1,%edi
    31c8:	c6 03 01             	movb   $0x1,(%ebx)
    31cb:	83 c3 01             	add    $0x1,%ebx
    31ce:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    31d4:	75 da                	jne    31b0 <sbrktest+0x40>
    31d6:	e8 8f 0b 00 00       	call   3d6a <fork>
    31db:	85 c0                	test   %eax,%eax
    31dd:	89 c7                	mov    %eax,%edi
    31df:	0f 88 e7 03 00 00    	js     35cc <sbrktest+0x45c>
    31e5:	83 ec 0c             	sub    $0xc,%esp
    31e8:	83 c3 01             	add    $0x1,%ebx
    31eb:	6a 01                	push   $0x1
    31ed:	e8 08 0c 00 00       	call   3dfa <sbrk>
    31f2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    31f9:	e8 fc 0b 00 00       	call   3dfa <sbrk>
    31fe:	83 c4 10             	add    $0x10,%esp
    3201:	39 d8                	cmp    %ebx,%eax
    3203:	0f 85 a4 03 00 00    	jne    35ad <sbrktest+0x43d>
    3209:	85 ff                	test   %edi,%edi
    320b:	0f 84 92 03 00 00    	je     35a3 <sbrktest+0x433>
    3211:	e8 64 0b 00 00       	call   3d7a <wait>
    3216:	83 ec 0c             	sub    $0xc,%esp
    3219:	6a 00                	push   $0x0
    321b:	e8 da 0b 00 00       	call   3dfa <sbrk>
    3220:	89 c3                	mov    %eax,%ebx
    3222:	b8 00 00 40 06       	mov    $0x6400000,%eax
    3227:	29 d8                	sub    %ebx,%eax
    3229:	89 04 24             	mov    %eax,(%esp)
    322c:	e8 c9 0b 00 00       	call   3dfa <sbrk>
    3231:	83 c4 10             	add    $0x10,%esp
    3234:	39 c3                	cmp    %eax,%ebx
    3236:	0f 85 48 03 00 00    	jne    3584 <sbrktest+0x414>
    323c:	83 ec 0c             	sub    $0xc,%esp
    323f:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
    3246:	6a 00                	push   $0x0
    3248:	e8 ad 0b 00 00       	call   3dfa <sbrk>
    324d:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    3254:	89 c3                	mov    %eax,%ebx
    3256:	e8 9f 0b 00 00       	call   3dfa <sbrk>
    325b:	83 c4 10             	add    $0x10,%esp
    325e:	83 f8 ff             	cmp    $0xffffffff,%eax
    3261:	0f 84 fe 02 00 00    	je     3565 <sbrktest+0x3f5>
    3267:	83 ec 0c             	sub    $0xc,%esp
    326a:	6a 00                	push   $0x0
    326c:	e8 89 0b 00 00       	call   3dfa <sbrk>
    3271:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    3277:	83 c4 10             	add    $0x10,%esp
    327a:	39 d0                	cmp    %edx,%eax
    327c:	0f 85 c5 02 00 00    	jne    3547 <sbrktest+0x3d7>
    3282:	83 ec 0c             	sub    $0xc,%esp
    3285:	6a 00                	push   $0x0
    3287:	e8 6e 0b 00 00       	call   3dfa <sbrk>
    328c:	89 c3                	mov    %eax,%ebx
    328e:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    3295:	e8 60 0b 00 00       	call   3dfa <sbrk>
    329a:	83 c4 10             	add    $0x10,%esp
    329d:	39 c3                	cmp    %eax,%ebx
    329f:	89 c7                	mov    %eax,%edi
    32a1:	0f 85 82 02 00 00    	jne    3529 <sbrktest+0x3b9>
    32a7:	83 ec 0c             	sub    $0xc,%esp
    32aa:	6a 00                	push   $0x0
    32ac:	e8 49 0b 00 00       	call   3dfa <sbrk>
    32b1:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    32b7:	83 c4 10             	add    $0x10,%esp
    32ba:	39 d0                	cmp    %edx,%eax
    32bc:	0f 85 67 02 00 00    	jne    3529 <sbrktest+0x3b9>
    32c2:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    32c9:	0f 84 3b 02 00 00    	je     350a <sbrktest+0x39a>
    32cf:	83 ec 0c             	sub    $0xc,%esp
    32d2:	6a 00                	push   $0x0
    32d4:	e8 21 0b 00 00       	call   3dfa <sbrk>
    32d9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32e0:	89 c3                	mov    %eax,%ebx
    32e2:	e8 13 0b 00 00       	call   3dfa <sbrk>
    32e7:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    32ea:	29 c1                	sub    %eax,%ecx
    32ec:	89 0c 24             	mov    %ecx,(%esp)
    32ef:	e8 06 0b 00 00       	call   3dfa <sbrk>
    32f4:	83 c4 10             	add    $0x10,%esp
    32f7:	39 c3                	cmp    %eax,%ebx
    32f9:	0f 85 ed 01 00 00    	jne    34ec <sbrktest+0x37c>
    32ff:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    3304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3308:	e8 e5 0a 00 00       	call   3df2 <getpid>
    330d:	89 c7                	mov    %eax,%edi
    330f:	e8 56 0a 00 00       	call   3d6a <fork>
    3314:	85 c0                	test   %eax,%eax
    3316:	0f 88 b1 01 00 00    	js     34cd <sbrktest+0x35d>
    331c:	0f 84 82 01 00 00    	je     34a4 <sbrktest+0x334>
    3322:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    3328:	e8 4d 0a 00 00       	call   3d7a <wait>
    332d:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    3333:	75 d3                	jne    3308 <sbrktest+0x198>
    3335:	8d 45 b8             	lea    -0x48(%ebp),%eax
    3338:	83 ec 0c             	sub    $0xc,%esp
    333b:	50                   	push   %eax
    333c:	e8 41 0a 00 00       	call   3d82 <pipe>
    3341:	83 c4 10             	add    $0x10,%esp
    3344:	85 c0                	test   %eax,%eax
    3346:	0f 85 3d 01 00 00    	jne    3489 <sbrktest+0x319>
    334c:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    334f:	8d 7d e8             	lea    -0x18(%ebp),%edi
    3352:	89 de                	mov    %ebx,%esi
    3354:	e8 11 0a 00 00       	call   3d6a <fork>
    3359:	85 c0                	test   %eax,%eax
    335b:	89 06                	mov    %eax,(%esi)
    335d:	0f 84 a1 00 00 00    	je     3404 <sbrktest+0x294>
    3363:	83 f8 ff             	cmp    $0xffffffff,%eax
    3366:	74 14                	je     337c <sbrktest+0x20c>
    3368:	8d 45 b7             	lea    -0x49(%ebp),%eax
    336b:	83 ec 04             	sub    $0x4,%esp
    336e:	6a 01                	push   $0x1
    3370:	50                   	push   %eax
    3371:	ff 75 b8             	pushl  -0x48(%ebp)
    3374:	e8 11 0a 00 00       	call   3d8a <read>
    3379:	83 c4 10             	add    $0x10,%esp
    337c:	83 c6 04             	add    $0x4,%esi
    337f:	39 f7                	cmp    %esi,%edi
    3381:	75 d1                	jne    3354 <sbrktest+0x1e4>
    3383:	83 ec 0c             	sub    $0xc,%esp
    3386:	68 00 10 00 00       	push   $0x1000
    338b:	e8 6a 0a 00 00       	call   3dfa <sbrk>
    3390:	83 c4 10             	add    $0x10,%esp
    3393:	89 c6                	mov    %eax,%esi
    3395:	8b 03                	mov    (%ebx),%eax
    3397:	83 f8 ff             	cmp    $0xffffffff,%eax
    339a:	74 11                	je     33ad <sbrktest+0x23d>
    339c:	83 ec 0c             	sub    $0xc,%esp
    339f:	50                   	push   %eax
    33a0:	e8 fd 09 00 00       	call   3da2 <kill>
    33a5:	e8 d0 09 00 00       	call   3d7a <wait>
    33aa:	83 c4 10             	add    $0x10,%esp
    33ad:	83 c3 04             	add    $0x4,%ebx
    33b0:	39 fb                	cmp    %edi,%ebx
    33b2:	75 e1                	jne    3395 <sbrktest+0x225>
    33b4:	83 fe ff             	cmp    $0xffffffff,%esi
    33b7:	0f 84 ad 00 00 00    	je     346a <sbrktest+0x2fa>
    33bd:	83 ec 0c             	sub    $0xc,%esp
    33c0:	6a 00                	push   $0x0
    33c2:	e8 33 0a 00 00       	call   3dfa <sbrk>
    33c7:	83 c4 10             	add    $0x10,%esp
    33ca:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    33cd:	73 1a                	jae    33e9 <sbrktest+0x279>
    33cf:	83 ec 0c             	sub    $0xc,%esp
    33d2:	6a 00                	push   $0x0
    33d4:	e8 21 0a 00 00       	call   3dfa <sbrk>
    33d9:	8b 75 a4             	mov    -0x5c(%ebp),%esi
    33dc:	29 c6                	sub    %eax,%esi
    33de:	89 34 24             	mov    %esi,(%esp)
    33e1:	e8 14 0a 00 00       	call   3dfa <sbrk>
    33e6:	83 c4 10             	add    $0x10,%esp
    33e9:	83 ec 08             	sub    $0x8,%esp
    33ec:	68 c8 50 00 00       	push   $0x50c8
    33f1:	ff 35 a8 62 00 00    	pushl  0x62a8
    33f7:	e8 c4 0a 00 00       	call   3ec0 <printf>
    33fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    33ff:	5b                   	pop    %ebx
    3400:	5e                   	pop    %esi
    3401:	5f                   	pop    %edi
    3402:	5d                   	pop    %ebp
    3403:	c3                   	ret    
    3404:	83 ec 0c             	sub    $0xc,%esp
    3407:	6a 00                	push   $0x0
    3409:	e8 ec 09 00 00       	call   3dfa <sbrk>
    340e:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3413:	29 c2                	sub    %eax,%edx
    3415:	89 14 24             	mov    %edx,(%esp)
    3418:	e8 dd 09 00 00       	call   3dfa <sbrk>
    341d:	83 c4 0c             	add    $0xc,%esp
    3420:	6a 01                	push   $0x1
    3422:	68 89 4b 00 00       	push   $0x4b89
    3427:	ff 75 bc             	pushl  -0x44(%ebp)
    342a:	e8 63 09 00 00       	call   3d92 <write>
    342f:	83 c4 10             	add    $0x10,%esp
    3432:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3438:	83 ec 0c             	sub    $0xc,%esp
    343b:	68 e8 03 00 00       	push   $0x3e8
    3440:	e8 bd 09 00 00       	call   3e02 <sleep>
    3445:	83 c4 10             	add    $0x10,%esp
    3448:	eb ee                	jmp    3438 <sbrktest+0x2c8>
    344a:	83 ec 0c             	sub    $0xc,%esp
    344d:	50                   	push   %eax
    344e:	53                   	push   %ebx
    344f:	57                   	push   %edi
    3450:	68 2b 50 00 00       	push   $0x502b
    3455:	ff 35 a8 62 00 00    	pushl  0x62a8
    345b:	e8 60 0a 00 00       	call   3ec0 <printf>
    3460:	83 c4 14             	add    $0x14,%esp
    3463:	6a 00                	push   $0x0
    3465:	e8 08 09 00 00       	call   3d72 <exit>
    346a:	83 ec 08             	sub    $0x8,%esp
    346d:	68 ad 50 00 00       	push   $0x50ad
    3472:	ff 35 a8 62 00 00    	pushl  0x62a8
    3478:	e8 43 0a 00 00       	call   3ec0 <printf>
    347d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3484:	e8 e9 08 00 00       	call   3d72 <exit>
    3489:	83 ec 08             	sub    $0x8,%esp
    348c:	68 69 45 00 00       	push   $0x4569
    3491:	6a 01                	push   $0x1
    3493:	e8 28 0a 00 00       	call   3ec0 <printf>
    3498:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    349f:	e8 ce 08 00 00       	call   3d72 <exit>
    34a4:	0f be 03             	movsbl (%ebx),%eax
    34a7:	50                   	push   %eax
    34a8:	53                   	push   %ebx
    34a9:	68 94 50 00 00       	push   $0x5094
    34ae:	ff 35 a8 62 00 00    	pushl  0x62a8
    34b4:	e8 07 0a 00 00       	call   3ec0 <printf>
    34b9:	89 3c 24             	mov    %edi,(%esp)
    34bc:	e8 e1 08 00 00       	call   3da2 <kill>
    34c1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34c8:	e8 a5 08 00 00       	call   3d72 <exit>
    34cd:	83 ec 08             	sub    $0x8,%esp
    34d0:	68 71 51 00 00       	push   $0x5171
    34d5:	ff 35 a8 62 00 00    	pushl  0x62a8
    34db:	e8 e0 09 00 00       	call   3ec0 <printf>
    34e0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34e7:	e8 86 08 00 00       	call   3d72 <exit>
    34ec:	50                   	push   %eax
    34ed:	53                   	push   %ebx
    34ee:	68 74 58 00 00       	push   $0x5874
    34f3:	ff 35 a8 62 00 00    	pushl  0x62a8
    34f9:	e8 c2 09 00 00       	call   3ec0 <printf>
    34fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3505:	e8 68 08 00 00       	call   3d72 <exit>
    350a:	83 ec 08             	sub    $0x8,%esp
    350d:	68 44 58 00 00       	push   $0x5844
    3512:	ff 35 a8 62 00 00    	pushl  0x62a8
    3518:	e8 a3 09 00 00       	call   3ec0 <printf>
    351d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3524:	e8 49 08 00 00       	call   3d72 <exit>
    3529:	57                   	push   %edi
    352a:	53                   	push   %ebx
    352b:	68 1c 58 00 00       	push   $0x581c
    3530:	ff 35 a8 62 00 00    	pushl  0x62a8
    3536:	e8 85 09 00 00       	call   3ec0 <printf>
    353b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3542:	e8 2b 08 00 00       	call   3d72 <exit>
    3547:	50                   	push   %eax
    3548:	53                   	push   %ebx
    3549:	68 e4 57 00 00       	push   $0x57e4
    354e:	ff 35 a8 62 00 00    	pushl  0x62a8
    3554:	e8 67 09 00 00       	call   3ec0 <printf>
    3559:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3560:	e8 0d 08 00 00       	call   3d72 <exit>
    3565:	83 ec 08             	sub    $0x8,%esp
    3568:	68 79 50 00 00       	push   $0x5079
    356d:	ff 35 a8 62 00 00    	pushl  0x62a8
    3573:	e8 48 09 00 00       	call   3ec0 <printf>
    3578:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    357f:	e8 ee 07 00 00       	call   3d72 <exit>
    3584:	83 ec 08             	sub    $0x8,%esp
    3587:	68 a4 57 00 00       	push   $0x57a4
    358c:	ff 35 a8 62 00 00    	pushl  0x62a8
    3592:	e8 29 09 00 00       	call   3ec0 <printf>
    3597:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    359e:	e8 cf 07 00 00       	call   3d72 <exit>
    35a3:	83 ec 0c             	sub    $0xc,%esp
    35a6:	6a 00                	push   $0x0
    35a8:	e8 c5 07 00 00       	call   3d72 <exit>
    35ad:	83 ec 08             	sub    $0x8,%esp
    35b0:	68 5d 50 00 00       	push   $0x505d
    35b5:	ff 35 a8 62 00 00    	pushl  0x62a8
    35bb:	e8 00 09 00 00       	call   3ec0 <printf>
    35c0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35c7:	e8 a6 07 00 00       	call   3d72 <exit>
    35cc:	83 ec 08             	sub    $0x8,%esp
    35cf:	68 46 50 00 00       	push   $0x5046
    35d4:	ff 35 a8 62 00 00    	pushl  0x62a8
    35da:	e8 e1 08 00 00       	call   3ec0 <printf>
    35df:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35e6:	e8 87 07 00 00       	call   3d72 <exit>
    35eb:	90                   	nop
    35ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000035f0 <validateint>:
    35f0:	55                   	push   %ebp
    35f1:	89 e5                	mov    %esp,%ebp
    35f3:	5d                   	pop    %ebp
    35f4:	c3                   	ret    
    35f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    35f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003600 <validatetest>:
    3600:	55                   	push   %ebp
    3601:	89 e5                	mov    %esp,%ebp
    3603:	56                   	push   %esi
    3604:	53                   	push   %ebx
    3605:	31 db                	xor    %ebx,%ebx
    3607:	83 ec 08             	sub    $0x8,%esp
    360a:	68 d6 50 00 00       	push   $0x50d6
    360f:	ff 35 a8 62 00 00    	pushl  0x62a8
    3615:	e8 a6 08 00 00       	call   3ec0 <printf>
    361a:	83 c4 10             	add    $0x10,%esp
    361d:	8d 76 00             	lea    0x0(%esi),%esi
    3620:	e8 45 07 00 00       	call   3d6a <fork>
    3625:	85 c0                	test   %eax,%eax
    3627:	89 c6                	mov    %eax,%esi
    3629:	74 63                	je     368e <validatetest+0x8e>
    362b:	83 ec 0c             	sub    $0xc,%esp
    362e:	6a 00                	push   $0x0
    3630:	e8 cd 07 00 00       	call   3e02 <sleep>
    3635:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    363c:	e8 c1 07 00 00       	call   3e02 <sleep>
    3641:	89 34 24             	mov    %esi,(%esp)
    3644:	e8 59 07 00 00       	call   3da2 <kill>
    3649:	e8 2c 07 00 00       	call   3d7a <wait>
    364e:	58                   	pop    %eax
    364f:	5a                   	pop    %edx
    3650:	53                   	push   %ebx
    3651:	68 e5 50 00 00       	push   $0x50e5
    3656:	e8 77 07 00 00       	call   3dd2 <link>
    365b:	83 c4 10             	add    $0x10,%esp
    365e:	83 f8 ff             	cmp    $0xffffffff,%eax
    3661:	75 35                	jne    3698 <validatetest+0x98>
    3663:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    3669:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    366f:	75 af                	jne    3620 <validatetest+0x20>
    3671:	83 ec 08             	sub    $0x8,%esp
    3674:	68 09 51 00 00       	push   $0x5109
    3679:	ff 35 a8 62 00 00    	pushl  0x62a8
    367f:	e8 3c 08 00 00       	call   3ec0 <printf>
    3684:	83 c4 10             	add    $0x10,%esp
    3687:	8d 65 f8             	lea    -0x8(%ebp),%esp
    368a:	5b                   	pop    %ebx
    368b:	5e                   	pop    %esi
    368c:	5d                   	pop    %ebp
    368d:	c3                   	ret    
    368e:	83 ec 0c             	sub    $0xc,%esp
    3691:	6a 00                	push   $0x0
    3693:	e8 da 06 00 00       	call   3d72 <exit>
    3698:	83 ec 08             	sub    $0x8,%esp
    369b:	68 f0 50 00 00       	push   $0x50f0
    36a0:	ff 35 a8 62 00 00    	pushl  0x62a8
    36a6:	e8 15 08 00 00       	call   3ec0 <printf>
    36ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36b2:	e8 bb 06 00 00       	call   3d72 <exit>
    36b7:	89 f6                	mov    %esi,%esi
    36b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036c0 <bsstest>:
    36c0:	55                   	push   %ebp
    36c1:	89 e5                	mov    %esp,%ebp
    36c3:	83 ec 10             	sub    $0x10,%esp
    36c6:	68 16 51 00 00       	push   $0x5116
    36cb:	ff 35 a8 62 00 00    	pushl  0x62a8
    36d1:	e8 ea 07 00 00       	call   3ec0 <printf>
    36d6:	83 c4 10             	add    $0x10,%esp
    36d9:	80 3d 60 63 00 00 00 	cmpb   $0x0,0x6360
    36e0:	75 35                	jne    3717 <bsstest+0x57>
    36e2:	b8 61 63 00 00       	mov    $0x6361,%eax
    36e7:	89 f6                	mov    %esi,%esi
    36e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    36f0:	80 38 00             	cmpb   $0x0,(%eax)
    36f3:	75 22                	jne    3717 <bsstest+0x57>
    36f5:	83 c0 01             	add    $0x1,%eax
    36f8:	3d 70 8a 00 00       	cmp    $0x8a70,%eax
    36fd:	75 f1                	jne    36f0 <bsstest+0x30>
    36ff:	83 ec 08             	sub    $0x8,%esp
    3702:	68 31 51 00 00       	push   $0x5131
    3707:	ff 35 a8 62 00 00    	pushl  0x62a8
    370d:	e8 ae 07 00 00       	call   3ec0 <printf>
    3712:	83 c4 10             	add    $0x10,%esp
    3715:	c9                   	leave  
    3716:	c3                   	ret    
    3717:	83 ec 08             	sub    $0x8,%esp
    371a:	68 20 51 00 00       	push   $0x5120
    371f:	ff 35 a8 62 00 00    	pushl  0x62a8
    3725:	e8 96 07 00 00       	call   3ec0 <printf>
    372a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3731:	e8 3c 06 00 00       	call   3d72 <exit>
    3736:	8d 76 00             	lea    0x0(%esi),%esi
    3739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003740 <bigargtest>:
    3740:	55                   	push   %ebp
    3741:	89 e5                	mov    %esp,%ebp
    3743:	83 ec 14             	sub    $0x14,%esp
    3746:	68 3e 51 00 00       	push   $0x513e
    374b:	e8 72 06 00 00       	call   3dc2 <unlink>
    3750:	e8 15 06 00 00       	call   3d6a <fork>
    3755:	83 c4 10             	add    $0x10,%esp
    3758:	85 c0                	test   %eax,%eax
    375a:	74 3f                	je     379b <bigargtest+0x5b>
    375c:	0f 88 d0 00 00 00    	js     3832 <bigargtest+0xf2>
    3762:	e8 13 06 00 00       	call   3d7a <wait>
    3767:	83 ec 08             	sub    $0x8,%esp
    376a:	6a 00                	push   $0x0
    376c:	68 3e 51 00 00       	push   $0x513e
    3771:	e8 3c 06 00 00       	call   3db2 <open>
    3776:	83 c4 10             	add    $0x10,%esp
    3779:	85 c0                	test   %eax,%eax
    377b:	0f 88 93 00 00 00    	js     3814 <bigargtest+0xd4>
    3781:	83 ec 0c             	sub    $0xc,%esp
    3784:	50                   	push   %eax
    3785:	e8 10 06 00 00       	call   3d9a <close>
    378a:	c7 04 24 3e 51 00 00 	movl   $0x513e,(%esp)
    3791:	e8 2c 06 00 00       	call   3dc2 <unlink>
    3796:	83 c4 10             	add    $0x10,%esp
    3799:	c9                   	leave  
    379a:	c3                   	ret    
    379b:	b8 c0 62 00 00       	mov    $0x62c0,%eax
    37a0:	c7 00 98 58 00 00    	movl   $0x5898,(%eax)
    37a6:	83 c0 04             	add    $0x4,%eax
    37a9:	3d 3c 63 00 00       	cmp    $0x633c,%eax
    37ae:	75 f0                	jne    37a0 <bigargtest+0x60>
    37b0:	51                   	push   %ecx
    37b1:	51                   	push   %ecx
    37b2:	68 48 51 00 00       	push   $0x5148
    37b7:	ff 35 a8 62 00 00    	pushl  0x62a8
    37bd:	c7 05 3c 63 00 00 00 	movl   $0x0,0x633c
    37c4:	00 00 00 
    37c7:	e8 f4 06 00 00       	call   3ec0 <printf>
    37cc:	58                   	pop    %eax
    37cd:	5a                   	pop    %edx
    37ce:	68 c0 62 00 00       	push   $0x62c0
    37d3:	68 15 43 00 00       	push   $0x4315
    37d8:	e8 cd 05 00 00       	call   3daa <exec>
    37dd:	59                   	pop    %ecx
    37de:	58                   	pop    %eax
    37df:	68 55 51 00 00       	push   $0x5155
    37e4:	ff 35 a8 62 00 00    	pushl  0x62a8
    37ea:	e8 d1 06 00 00       	call   3ec0 <printf>
    37ef:	58                   	pop    %eax
    37f0:	5a                   	pop    %edx
    37f1:	68 00 02 00 00       	push   $0x200
    37f6:	68 3e 51 00 00       	push   $0x513e
    37fb:	e8 b2 05 00 00       	call   3db2 <open>
    3800:	89 04 24             	mov    %eax,(%esp)
    3803:	e8 92 05 00 00       	call   3d9a <close>
    3808:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    380f:	e8 5e 05 00 00       	call   3d72 <exit>
    3814:	50                   	push   %eax
    3815:	50                   	push   %eax
    3816:	68 7e 51 00 00       	push   $0x517e
    381b:	ff 35 a8 62 00 00    	pushl  0x62a8
    3821:	e8 9a 06 00 00       	call   3ec0 <printf>
    3826:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    382d:	e8 40 05 00 00       	call   3d72 <exit>
    3832:	52                   	push   %edx
    3833:	52                   	push   %edx
    3834:	68 65 51 00 00       	push   $0x5165
    3839:	ff 35 a8 62 00 00    	pushl  0x62a8
    383f:	e8 7c 06 00 00       	call   3ec0 <printf>
    3844:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    384b:	e8 22 05 00 00       	call   3d72 <exit>

00003850 <fsfull>:
    3850:	55                   	push   %ebp
    3851:	89 e5                	mov    %esp,%ebp
    3853:	57                   	push   %edi
    3854:	56                   	push   %esi
    3855:	53                   	push   %ebx
    3856:	31 db                	xor    %ebx,%ebx
    3858:	83 ec 54             	sub    $0x54,%esp
    385b:	68 93 51 00 00       	push   $0x5193
    3860:	6a 01                	push   $0x1
    3862:	e8 59 06 00 00       	call   3ec0 <printf>
    3867:	83 c4 10             	add    $0x10,%esp
    386a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3870:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3875:	89 de                	mov    %ebx,%esi
    3877:	89 d9                	mov    %ebx,%ecx
    3879:	f7 eb                	imul   %ebx
    387b:	c1 fe 1f             	sar    $0x1f,%esi
    387e:	89 df                	mov    %ebx,%edi
    3880:	83 ec 04             	sub    $0x4,%esp
    3883:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    3887:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    388b:	c1 fa 06             	sar    $0x6,%edx
    388e:	29 f2                	sub    %esi,%edx
    3890:	8d 42 30             	lea    0x30(%edx),%eax
    3893:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    3899:	88 45 a9             	mov    %al,-0x57(%ebp)
    389c:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    38a1:	29 d1                	sub    %edx,%ecx
    38a3:	f7 e9                	imul   %ecx
    38a5:	c1 f9 1f             	sar    $0x1f,%ecx
    38a8:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    38ad:	c1 fa 05             	sar    $0x5,%edx
    38b0:	29 ca                	sub    %ecx,%edx
    38b2:	b9 67 66 66 66       	mov    $0x66666667,%ecx
    38b7:	83 c2 30             	add    $0x30,%edx
    38ba:	88 55 aa             	mov    %dl,-0x56(%ebp)
    38bd:	f7 eb                	imul   %ebx
    38bf:	c1 fa 05             	sar    $0x5,%edx
    38c2:	29 f2                	sub    %esi,%edx
    38c4:	6b d2 64             	imul   $0x64,%edx,%edx
    38c7:	29 d7                	sub    %edx,%edi
    38c9:	89 f8                	mov    %edi,%eax
    38cb:	c1 ff 1f             	sar    $0x1f,%edi
    38ce:	f7 e9                	imul   %ecx
    38d0:	89 d8                	mov    %ebx,%eax
    38d2:	c1 fa 02             	sar    $0x2,%edx
    38d5:	29 fa                	sub    %edi,%edx
    38d7:	83 c2 30             	add    $0x30,%edx
    38da:	88 55 ab             	mov    %dl,-0x55(%ebp)
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
    38f5:	8d 45 a8             	lea    -0x58(%ebp),%eax
    38f8:	50                   	push   %eax
    38f9:	68 a0 51 00 00       	push   $0x51a0
    38fe:	6a 01                	push   $0x1
    3900:	e8 bb 05 00 00       	call   3ec0 <printf>
    3905:	58                   	pop    %eax
    3906:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3909:	5a                   	pop    %edx
    390a:	68 02 02 00 00       	push   $0x202
    390f:	50                   	push   %eax
    3910:	e8 9d 04 00 00       	call   3db2 <open>
    3915:	83 c4 10             	add    $0x10,%esp
    3918:	85 c0                	test   %eax,%eax
    391a:	89 c7                	mov    %eax,%edi
    391c:	78 50                	js     396e <fsfull+0x11e>
    391e:	31 f6                	xor    %esi,%esi
    3920:	eb 08                	jmp    392a <fsfull+0xda>
    3922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3928:	01 c6                	add    %eax,%esi
    392a:	83 ec 04             	sub    $0x4,%esp
    392d:	68 00 02 00 00       	push   $0x200
    3932:	68 80 8a 00 00       	push   $0x8a80
    3937:	57                   	push   %edi
    3938:	e8 55 04 00 00       	call   3d92 <write>
    393d:	83 c4 10             	add    $0x10,%esp
    3940:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3945:	7f e1                	jg     3928 <fsfull+0xd8>
    3947:	83 ec 04             	sub    $0x4,%esp
    394a:	56                   	push   %esi
    394b:	68 bc 51 00 00       	push   $0x51bc
    3950:	6a 01                	push   $0x1
    3952:	e8 69 05 00 00       	call   3ec0 <printf>
    3957:	89 3c 24             	mov    %edi,(%esp)
    395a:	e8 3b 04 00 00       	call   3d9a <close>
    395f:	83 c4 10             	add    $0x10,%esp
    3962:	85 f6                	test   %esi,%esi
    3964:	74 22                	je     3988 <fsfull+0x138>
    3966:	83 c3 01             	add    $0x1,%ebx
    3969:	e9 02 ff ff ff       	jmp    3870 <fsfull+0x20>
    396e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3971:	83 ec 04             	sub    $0x4,%esp
    3974:	50                   	push   %eax
    3975:	68 ac 51 00 00       	push   $0x51ac
    397a:	6a 01                	push   $0x1
    397c:	e8 3f 05 00 00       	call   3ec0 <printf>
    3981:	83 c4 10             	add    $0x10,%esp
    3984:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3988:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    398d:	89 de                	mov    %ebx,%esi
    398f:	89 d9                	mov    %ebx,%ecx
    3991:	f7 eb                	imul   %ebx
    3993:	c1 fe 1f             	sar    $0x1f,%esi
    3996:	89 df                	mov    %ebx,%edi
    3998:	83 ec 0c             	sub    $0xc,%esp
    399b:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    399f:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    39a3:	c1 fa 06             	sar    $0x6,%edx
    39a6:	29 f2                	sub    %esi,%edx
    39a8:	8d 42 30             	lea    0x30(%edx),%eax
    39ab:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    39b1:	88 45 a9             	mov    %al,-0x57(%ebp)
    39b4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    39b9:	29 d1                	sub    %edx,%ecx
    39bb:	f7 e9                	imul   %ecx
    39bd:	c1 f9 1f             	sar    $0x1f,%ecx
    39c0:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    39c5:	c1 fa 05             	sar    $0x5,%edx
    39c8:	29 ca                	sub    %ecx,%edx
    39ca:	b9 67 66 66 66       	mov    $0x66666667,%ecx
    39cf:	83 c2 30             	add    $0x30,%edx
    39d2:	88 55 aa             	mov    %dl,-0x56(%ebp)
    39d5:	f7 eb                	imul   %ebx
    39d7:	c1 fa 05             	sar    $0x5,%edx
    39da:	29 f2                	sub    %esi,%edx
    39dc:	6b d2 64             	imul   $0x64,%edx,%edx
    39df:	29 d7                	sub    %edx,%edi
    39e1:	89 f8                	mov    %edi,%eax
    39e3:	c1 ff 1f             	sar    $0x1f,%edi
    39e6:	f7 e9                	imul   %ecx
    39e8:	89 d8                	mov    %ebx,%eax
    39ea:	c1 fa 02             	sar    $0x2,%edx
    39ed:	29 fa                	sub    %edi,%edx
    39ef:	83 c2 30             	add    $0x30,%edx
    39f2:	88 55 ab             	mov    %dl,-0x55(%ebp)
    39f5:	f7 e9                	imul   %ecx
    39f7:	89 d9                	mov    %ebx,%ecx
    39f9:	83 eb 01             	sub    $0x1,%ebx
    39fc:	c1 fa 02             	sar    $0x2,%edx
    39ff:	29 f2                	sub    %esi,%edx
    3a01:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3a04:	01 c0                	add    %eax,%eax
    3a06:	29 c1                	sub    %eax,%ecx
    3a08:	89 c8                	mov    %ecx,%eax
    3a0a:	83 c0 30             	add    $0x30,%eax
    3a0d:	88 45 ac             	mov    %al,-0x54(%ebp)
    3a10:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3a13:	50                   	push   %eax
    3a14:	e8 a9 03 00 00       	call   3dc2 <unlink>
    3a19:	83 c4 10             	add    $0x10,%esp
    3a1c:	83 fb ff             	cmp    $0xffffffff,%ebx
    3a1f:	0f 85 63 ff ff ff    	jne    3988 <fsfull+0x138>
    3a25:	83 ec 08             	sub    $0x8,%esp
    3a28:	68 cc 51 00 00       	push   $0x51cc
    3a2d:	6a 01                	push   $0x1
    3a2f:	e8 8c 04 00 00       	call   3ec0 <printf>
    3a34:	83 c4 10             	add    $0x10,%esp
    3a37:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3a3a:	5b                   	pop    %ebx
    3a3b:	5e                   	pop    %esi
    3a3c:	5f                   	pop    %edi
    3a3d:	5d                   	pop    %ebp
    3a3e:	c3                   	ret    
    3a3f:	90                   	nop

00003a40 <uio>:
    3a40:	55                   	push   %ebp
    3a41:	89 e5                	mov    %esp,%ebp
    3a43:	83 ec 10             	sub    $0x10,%esp
    3a46:	68 e2 51 00 00       	push   $0x51e2
    3a4b:	6a 01                	push   $0x1
    3a4d:	e8 6e 04 00 00       	call   3ec0 <printf>
    3a52:	e8 13 03 00 00       	call   3d6a <fork>
    3a57:	83 c4 10             	add    $0x10,%esp
    3a5a:	85 c0                	test   %eax,%eax
    3a5c:	74 1b                	je     3a79 <uio+0x39>
    3a5e:	78 44                	js     3aa4 <uio+0x64>
    3a60:	e8 15 03 00 00       	call   3d7a <wait>
    3a65:	83 ec 08             	sub    $0x8,%esp
    3a68:	68 ec 51 00 00       	push   $0x51ec
    3a6d:	6a 01                	push   $0x1
    3a6f:	e8 4c 04 00 00       	call   3ec0 <printf>
    3a74:	83 c4 10             	add    $0x10,%esp
    3a77:	c9                   	leave  
    3a78:	c3                   	ret    
    3a79:	ba 70 00 00 00       	mov    $0x70,%edx
    3a7e:	b8 09 00 00 00       	mov    $0x9,%eax
    3a83:	ee                   	out    %al,(%dx)
    3a84:	ba 71 00 00 00       	mov    $0x71,%edx
    3a89:	ec                   	in     (%dx),%al
    3a8a:	52                   	push   %edx
    3a8b:	52                   	push   %edx
    3a8c:	68 78 59 00 00       	push   $0x5978
    3a91:	6a 01                	push   $0x1
    3a93:	e8 28 04 00 00       	call   3ec0 <printf>
    3a98:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a9f:	e8 ce 02 00 00       	call   3d72 <exit>
    3aa4:	50                   	push   %eax
    3aa5:	50                   	push   %eax
    3aa6:	68 71 51 00 00       	push   $0x5171
    3aab:	6a 01                	push   $0x1
    3aad:	e8 0e 04 00 00       	call   3ec0 <printf>
    3ab2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ab9:	e8 b4 02 00 00       	call   3d72 <exit>
    3abe:	66 90                	xchg   %ax,%ax

00003ac0 <argptest>:
    3ac0:	55                   	push   %ebp
    3ac1:	89 e5                	mov    %esp,%ebp
    3ac3:	53                   	push   %ebx
    3ac4:	83 ec 0c             	sub    $0xc,%esp
    3ac7:	6a 00                	push   $0x0
    3ac9:	68 fb 51 00 00       	push   $0x51fb
    3ace:	e8 df 02 00 00       	call   3db2 <open>
    3ad3:	83 c4 10             	add    $0x10,%esp
    3ad6:	85 c0                	test   %eax,%eax
    3ad8:	78 39                	js     3b13 <argptest+0x53>
    3ada:	83 ec 0c             	sub    $0xc,%esp
    3add:	89 c3                	mov    %eax,%ebx
    3adf:	6a 00                	push   $0x0
    3ae1:	e8 14 03 00 00       	call   3dfa <sbrk>
    3ae6:	83 c4 0c             	add    $0xc,%esp
    3ae9:	83 e8 01             	sub    $0x1,%eax
    3aec:	6a ff                	push   $0xffffffff
    3aee:	50                   	push   %eax
    3aef:	53                   	push   %ebx
    3af0:	e8 95 02 00 00       	call   3d8a <read>
    3af5:	89 1c 24             	mov    %ebx,(%esp)
    3af8:	e8 9d 02 00 00       	call   3d9a <close>
    3afd:	58                   	pop    %eax
    3afe:	5a                   	pop    %edx
    3aff:	68 0d 52 00 00       	push   $0x520d
    3b04:	6a 01                	push   $0x1
    3b06:	e8 b5 03 00 00       	call   3ec0 <printf>
    3b0b:	83 c4 10             	add    $0x10,%esp
    3b0e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3b11:	c9                   	leave  
    3b12:	c3                   	ret    
    3b13:	51                   	push   %ecx
    3b14:	51                   	push   %ecx
    3b15:	68 00 52 00 00       	push   $0x5200
    3b1a:	6a 02                	push   $0x2
    3b1c:	e8 9f 03 00 00       	call   3ec0 <printf>
    3b21:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b28:	e8 45 02 00 00       	call   3d72 <exit>
    3b2d:	8d 76 00             	lea    0x0(%esi),%esi

00003b30 <rand>:
    3b30:	69 05 a4 62 00 00 0d 	imul   $0x19660d,0x62a4,%eax
    3b37:	66 19 00 
    3b3a:	55                   	push   %ebp
    3b3b:	89 e5                	mov    %esp,%ebp
    3b3d:	5d                   	pop    %ebp
    3b3e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3b43:	a3 a4 62 00 00       	mov    %eax,0x62a4
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
    3b53:	8b 45 08             	mov    0x8(%ebp),%eax
    3b56:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    3b59:	53                   	push   %ebx
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
    3b83:	8b 55 08             	mov    0x8(%ebp),%edx
    3b86:	53                   	push   %ebx
    3b87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    3b8a:	0f b6 02             	movzbl (%edx),%eax
    3b8d:	84 c0                	test   %al,%al
    3b8f:	74 2d                	je     3bbe <strcmp+0x3e>
    3b91:	0f b6 19             	movzbl (%ecx),%ebx
    3b94:	38 d8                	cmp    %bl,%al
    3b96:	74 0e                	je     3ba6 <strcmp+0x26>
    3b98:	eb 2b                	jmp    3bc5 <strcmp+0x45>
    3b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3ba0:	38 c8                	cmp    %cl,%al
    3ba2:	75 15                	jne    3bb9 <strcmp+0x39>
    p++, q++;
    3ba4:	89 d9                	mov    %ebx,%ecx
    3ba6:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3ba9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    3bac:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3baf:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    3bb3:	84 c0                	test   %al,%al
    3bb5:	75 e9                	jne    3ba0 <strcmp+0x20>
    3bb7:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3bb9:	29 c8                	sub    %ecx,%eax
}
    3bbb:	5b                   	pop    %ebx
    3bbc:	5d                   	pop    %ebp
    3bbd:	c3                   	ret    
    3bbe:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3bc1:	31 c0                	xor    %eax,%eax
    3bc3:	eb f4                	jmp    3bb9 <strcmp+0x39>
    3bc5:	0f b6 cb             	movzbl %bl,%ecx
    3bc8:	eb ef                	jmp    3bb9 <strcmp+0x39>
    3bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003bd0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

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
    3c03:	8b 55 08             	mov    0x8(%ebp),%edx
    3c06:	57                   	push   %edi
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
    3c23:	8b 45 08             	mov    0x8(%ebp),%eax
    3c26:	53                   	push   %ebx
    3c27:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    3c2a:	0f b6 18             	movzbl (%eax),%ebx
    3c2d:	84 db                	test   %bl,%bl
    3c2f:	74 1d                	je     3c4e <strchr+0x2e>
    if(*s == c)
    3c31:	38 d3                	cmp    %dl,%bl
    3c33:	89 d1                	mov    %edx,%ecx
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
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3c65:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
    3c67:	53                   	push   %ebx
    3c68:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    3c6b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3c6e:	eb 31                	jmp    3ca1 <gets+0x41>
    cc = read(0, &c, 1);
    3c70:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3c77:	00 
    3c78:	89 7c 24 04          	mov    %edi,0x4(%esp)
    3c7c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c83:	e8 02 01 00 00       	call   3d8a <read>
    if(cc < 1)
    3c88:	85 c0                	test   %eax,%eax
    3c8a:	7e 1d                	jle    3ca9 <gets+0x49>
      break;
    buf[i++] = c;
    3c8c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3c90:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    3c92:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    3c95:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    3c97:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    3c9b:	74 0c                	je     3ca9 <gets+0x49>
    3c9d:	3c 0a                	cmp    $0xa,%al
    3c9f:	74 08                	je     3ca9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3ca1:	8d 5e 01             	lea    0x1(%esi),%ebx
    3ca4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    3ca7:	7c c7                	jl     3c70 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3ca9:	8b 45 08             	mov    0x8(%ebp),%eax
    3cac:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3cb0:	83 c4 2c             	add    $0x2c,%esp
    3cb3:	5b                   	pop    %ebx
    3cb4:	5e                   	pop    %esi
    3cb5:	5f                   	pop    %edi
    3cb6:	5d                   	pop    %ebp
    3cb7:	c3                   	ret    
    3cb8:	90                   	nop
    3cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003cc0 <stat>:

int
stat(char *n, struct stat *st)
{
    3cc0:	55                   	push   %ebp
    3cc1:	89 e5                	mov    %esp,%ebp
    3cc3:	56                   	push   %esi
    3cc4:	53                   	push   %ebx
    3cc5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3cc8:	8b 45 08             	mov    0x8(%ebp),%eax
    3ccb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3cd2:	00 
    3cd3:	89 04 24             	mov    %eax,(%esp)
    3cd6:	e8 d7 00 00 00       	call   3db2 <open>
  if(fd < 0)
    3cdb:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3cdd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    3cdf:	78 27                	js     3d08 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    3ce1:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ce4:	89 1c 24             	mov    %ebx,(%esp)
    3ce7:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ceb:	e8 da 00 00 00       	call   3dca <fstat>
  close(fd);
    3cf0:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
    3cf3:	89 c6                	mov    %eax,%esi
  close(fd);
    3cf5:	e8 a0 00 00 00       	call   3d9a <close>
  return r;
    3cfa:	89 f0                	mov    %esi,%eax
}
    3cfc:	83 c4 10             	add    $0x10,%esp
    3cff:	5b                   	pop    %ebx
    3d00:	5e                   	pop    %esi
    3d01:	5d                   	pop    %ebp
    3d02:	c3                   	ret    
    3d03:	90                   	nop
    3d04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    3d08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3d0d:	eb ed                	jmp    3cfc <stat+0x3c>
    3d0f:	90                   	nop

00003d10 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    3d10:	55                   	push   %ebp
    3d11:	89 e5                	mov    %esp,%ebp
    3d13:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3d16:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3d17:	0f be 11             	movsbl (%ecx),%edx
    3d1a:	8d 42 d0             	lea    -0x30(%edx),%eax
    3d1d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
    3d1f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    3d24:	77 17                	ja     3d3d <atoi+0x2d>
    3d26:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    3d28:	83 c1 01             	add    $0x1,%ecx
    3d2b:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3d2e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3d32:	0f be 11             	movsbl (%ecx),%edx
    3d35:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3d38:	80 fb 09             	cmp    $0x9,%bl
    3d3b:	76 eb                	jbe    3d28 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
    3d3d:	5b                   	pop    %ebx
    3d3e:	5d                   	pop    %ebp
    3d3f:	c3                   	ret    

00003d40 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3d40:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3d41:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
    3d43:	89 e5                	mov    %esp,%ebp
    3d45:	56                   	push   %esi
    3d46:	8b 45 08             	mov    0x8(%ebp),%eax
    3d49:	53                   	push   %ebx
    3d4a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3d4d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3d50:	85 db                	test   %ebx,%ebx
    3d52:	7e 12                	jle    3d66 <memmove+0x26>
    3d54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    3d58:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    3d5c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    3d5f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3d62:	39 da                	cmp    %ebx,%edx
    3d64:	75 f2                	jne    3d58 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    3d66:	5b                   	pop    %ebx
    3d67:	5e                   	pop    %esi
    3d68:	5d                   	pop    %ebp
    3d69:	c3                   	ret    

00003d6a <fork>:
    3d6a:	b8 01 00 00 00       	mov    $0x1,%eax
    3d6f:	cd 40                	int    $0x40
    3d71:	c3                   	ret    

00003d72 <exit>:
    3d72:	b8 02 00 00 00       	mov    $0x2,%eax
    3d77:	cd 40                	int    $0x40
    3d79:	c3                   	ret    

00003d7a <wait>:
    3d7a:	b8 03 00 00 00       	mov    $0x3,%eax
    3d7f:	cd 40                	int    $0x40
    3d81:	c3                   	ret    

00003d82 <pipe>:
    3d82:	b8 04 00 00 00       	mov    $0x4,%eax
    3d87:	cd 40                	int    $0x40
    3d89:	c3                   	ret    

00003d8a <read>:
    3d8a:	b8 05 00 00 00       	mov    $0x5,%eax
    3d8f:	cd 40                	int    $0x40
    3d91:	c3                   	ret    

00003d92 <write>:
    3d92:	b8 10 00 00 00       	mov    $0x10,%eax
    3d97:	cd 40                	int    $0x40
    3d99:	c3                   	ret    

00003d9a <close>:
    3d9a:	b8 15 00 00 00       	mov    $0x15,%eax
    3d9f:	cd 40                	int    $0x40
    3da1:	c3                   	ret    

00003da2 <kill>:
    3da2:	b8 06 00 00 00       	mov    $0x6,%eax
    3da7:	cd 40                	int    $0x40
    3da9:	c3                   	ret    

00003daa <exec>:
    3daa:	b8 07 00 00 00       	mov    $0x7,%eax
    3daf:	cd 40                	int    $0x40
    3db1:	c3                   	ret    

00003db2 <open>:
    3db2:	b8 0f 00 00 00       	mov    $0xf,%eax
    3db7:	cd 40                	int    $0x40
    3db9:	c3                   	ret    

00003dba <mknod>:
    3dba:	b8 11 00 00 00       	mov    $0x11,%eax
    3dbf:	cd 40                	int    $0x40
    3dc1:	c3                   	ret    

00003dc2 <unlink>:
    3dc2:	b8 12 00 00 00       	mov    $0x12,%eax
    3dc7:	cd 40                	int    $0x40
    3dc9:	c3                   	ret    

00003dca <fstat>:
    3dca:	b8 08 00 00 00       	mov    $0x8,%eax
    3dcf:	cd 40                	int    $0x40
    3dd1:	c3                   	ret    

00003dd2 <link>:
    3dd2:	b8 13 00 00 00       	mov    $0x13,%eax
    3dd7:	cd 40                	int    $0x40
    3dd9:	c3                   	ret    

00003dda <mkdir>:
    3dda:	b8 14 00 00 00       	mov    $0x14,%eax
    3ddf:	cd 40                	int    $0x40
    3de1:	c3                   	ret    

00003de2 <chdir>:
    3de2:	b8 09 00 00 00       	mov    $0x9,%eax
    3de7:	cd 40                	int    $0x40
    3de9:	c3                   	ret    

00003dea <dup>:
    3dea:	b8 0a 00 00 00       	mov    $0xa,%eax
    3def:	cd 40                	int    $0x40
    3df1:	c3                   	ret    

00003df2 <getpid>:
    3df2:	b8 0b 00 00 00       	mov    $0xb,%eax
    3df7:	cd 40                	int    $0x40
    3df9:	c3                   	ret    

00003dfa <sbrk>:
    3dfa:	b8 0c 00 00 00       	mov    $0xc,%eax
    3dff:	cd 40                	int    $0x40
    3e01:	c3                   	ret    

00003e02 <sleep>:
    3e02:	b8 0d 00 00 00       	mov    $0xd,%eax
    3e07:	cd 40                	int    $0x40
    3e09:	c3                   	ret    

00003e0a <uptime>:
    3e0a:	b8 0e 00 00 00       	mov    $0xe,%eax
    3e0f:	cd 40                	int    $0x40
    3e11:	c3                   	ret    
    3e12:	66 90                	xchg   %ax,%ax
    3e14:	66 90                	xchg   %ax,%ax
    3e16:	66 90                	xchg   %ax,%ax
    3e18:	66 90                	xchg   %ax,%ax
    3e1a:	66 90                	xchg   %ax,%ax
    3e1c:	66 90                	xchg   %ax,%ax
    3e1e:	66 90                	xchg   %ax,%ax

00003e20 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3e20:	55                   	push   %ebp
    3e21:	89 e5                	mov    %esp,%ebp
    3e23:	57                   	push   %edi
    3e24:	56                   	push   %esi
    3e25:	89 c6                	mov    %eax,%esi
    3e27:	53                   	push   %ebx
    3e28:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    3e2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3e2e:	85 db                	test   %ebx,%ebx
    3e30:	74 09                	je     3e3b <printint+0x1b>
    3e32:	89 d0                	mov    %edx,%eax
    3e34:	c1 e8 1f             	shr    $0x1f,%eax
    3e37:	84 c0                	test   %al,%al
    3e39:	75 75                	jne    3eb0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    3e3b:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3e3d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3e44:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
    3e47:	31 ff                	xor    %edi,%edi
    3e49:	89 ce                	mov    %ecx,%esi
    3e4b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    3e4e:	eb 02                	jmp    3e52 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    3e50:	89 cf                	mov    %ecx,%edi
    3e52:	31 d2                	xor    %edx,%edx
    3e54:	f7 f6                	div    %esi
    3e56:	8d 4f 01             	lea    0x1(%edi),%ecx
    3e59:	0f b6 92 cf 59 00 00 	movzbl 0x59cf(%edx),%edx
  }while((x /= base) != 0);
    3e60:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    3e62:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    3e65:	75 e9                	jne    3e50 <printint+0x30>
  if(neg)
    3e67:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    3e6a:	89 c8                	mov    %ecx,%eax
    3e6c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
    3e6f:	85 d2                	test   %edx,%edx
    3e71:	74 08                	je     3e7b <printint+0x5b>
    buf[i++] = '-';
    3e73:	8d 4f 02             	lea    0x2(%edi),%ecx
    3e76:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    3e7b:	8d 79 ff             	lea    -0x1(%ecx),%edi
    3e7e:	66 90                	xchg   %ax,%ax
    3e80:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    3e85:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3e88:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3e8f:	00 
    3e90:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    3e94:	89 34 24             	mov    %esi,(%esp)
    3e97:	88 45 d7             	mov    %al,-0x29(%ebp)
    3e9a:	e8 f3 fe ff ff       	call   3d92 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3e9f:	83 ff ff             	cmp    $0xffffffff,%edi
    3ea2:	75 dc                	jne    3e80 <printint+0x60>
    putc(fd, buf[i]);
}
    3ea4:	83 c4 4c             	add    $0x4c,%esp
    3ea7:	5b                   	pop    %ebx
    3ea8:	5e                   	pop    %esi
    3ea9:	5f                   	pop    %edi
    3eaa:	5d                   	pop    %ebp
    3eab:	c3                   	ret    
    3eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    3eb0:	89 d0                	mov    %edx,%eax
    3eb2:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    3eb4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    3ebb:	eb 87                	jmp    3e44 <printint+0x24>
    3ebd:	8d 76 00             	lea    0x0(%esi),%esi

00003ec0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3ec0:	55                   	push   %ebp
    3ec1:	89 e5                	mov    %esp,%ebp
    3ec3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    3ec4:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3ec6:	56                   	push   %esi
    3ec7:	53                   	push   %ebx
    3ec8:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ecb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    3ece:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3ed1:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    3ed4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    3ed7:	0f b6 13             	movzbl (%ebx),%edx
    3eda:	83 c3 01             	add    $0x1,%ebx
    3edd:	84 d2                	test   %dl,%dl
    3edf:	75 39                	jne    3f1a <printf+0x5a>
    3ee1:	e9 c2 00 00 00       	jmp    3fa8 <printf+0xe8>
    3ee6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3ee8:	83 fa 25             	cmp    $0x25,%edx
    3eeb:	0f 84 bf 00 00 00    	je     3fb0 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3ef1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    3ef4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3efb:	00 
    3efc:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f00:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
    3f03:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3f06:	e8 87 fe ff ff       	call   3d92 <write>
    3f0b:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3f0e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    3f12:	84 d2                	test   %dl,%dl
    3f14:	0f 84 8e 00 00 00    	je     3fa8 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
    3f1a:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    3f1c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    3f1f:	74 c7                	je     3ee8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3f21:	83 ff 25             	cmp    $0x25,%edi
    3f24:	75 e5                	jne    3f0b <printf+0x4b>
      if(c == 'd'){
    3f26:	83 fa 64             	cmp    $0x64,%edx
    3f29:	0f 84 31 01 00 00    	je     4060 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3f2f:	25 f7 00 00 00       	and    $0xf7,%eax
    3f34:	83 f8 70             	cmp    $0x70,%eax
    3f37:	0f 84 83 00 00 00    	je     3fc0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3f3d:	83 fa 73             	cmp    $0x73,%edx
    3f40:	0f 84 a2 00 00 00    	je     3fe8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3f46:	83 fa 63             	cmp    $0x63,%edx
    3f49:	0f 84 35 01 00 00    	je     4084 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3f4f:	83 fa 25             	cmp    $0x25,%edx
    3f52:	0f 84 e0 00 00 00    	je     4038 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3f58:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3f5b:	83 c3 01             	add    $0x1,%ebx
    3f5e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3f65:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3f66:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3f68:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f6c:	89 34 24             	mov    %esi,(%esp)
    3f6f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    3f72:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    3f76:	e8 17 fe ff ff       	call   3d92 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    3f7b:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3f7e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3f81:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3f88:	00 
    3f89:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f8d:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    3f90:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3f93:	e8 fa fd ff ff       	call   3d92 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3f98:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    3f9c:	84 d2                	test   %dl,%dl
    3f9e:	0f 85 76 ff ff ff    	jne    3f1a <printf+0x5a>
    3fa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3fa8:	83 c4 3c             	add    $0x3c,%esp
    3fab:	5b                   	pop    %ebx
    3fac:	5e                   	pop    %esi
    3fad:	5f                   	pop    %edi
    3fae:	5d                   	pop    %ebp
    3faf:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    3fb0:	bf 25 00 00 00       	mov    $0x25,%edi
    3fb5:	e9 51 ff ff ff       	jmp    3f0b <printf+0x4b>
    3fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3fc0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3fc3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3fc8:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3fca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3fd1:	8b 10                	mov    (%eax),%edx
    3fd3:	89 f0                	mov    %esi,%eax
    3fd5:	e8 46 fe ff ff       	call   3e20 <printint>
        ap++;
    3fda:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    3fde:	e9 28 ff ff ff       	jmp    3f0b <printf+0x4b>
    3fe3:	90                   	nop
    3fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    3fe8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    3feb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    3fef:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
    3ff1:	b8 c8 59 00 00       	mov    $0x59c8,%eax
    3ff6:	85 ff                	test   %edi,%edi
    3ff8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    3ffb:	0f b6 07             	movzbl (%edi),%eax
    3ffe:	84 c0                	test   %al,%al
    4000:	74 2a                	je     402c <printf+0x16c>
    4002:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    4008:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    400b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    400e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4011:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4018:	00 
    4019:	89 44 24 04          	mov    %eax,0x4(%esp)
    401d:	89 34 24             	mov    %esi,(%esp)
    4020:	e8 6d fd ff ff       	call   3d92 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    4025:	0f b6 07             	movzbl (%edi),%eax
    4028:	84 c0                	test   %al,%al
    402a:	75 dc                	jne    4008 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    402c:	31 ff                	xor    %edi,%edi
    402e:	e9 d8 fe ff ff       	jmp    3f0b <printf+0x4b>
    4033:	90                   	nop
    4034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4038:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    403b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    403d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4044:	00 
    4045:	89 44 24 04          	mov    %eax,0x4(%esp)
    4049:	89 34 24             	mov    %esi,(%esp)
    404c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    4050:	e8 3d fd ff ff       	call   3d92 <write>
    4055:	e9 b1 fe ff ff       	jmp    3f0b <printf+0x4b>
    405a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    4060:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4063:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    4068:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    406b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4072:	8b 10                	mov    (%eax),%edx
    4074:	89 f0                	mov    %esi,%eax
    4076:	e8 a5 fd ff ff       	call   3e20 <printint>
        ap++;
    407b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    407f:	e9 87 fe ff ff       	jmp    3f0b <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    4084:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    4087:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    4089:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    408b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4092:	00 
    4093:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    4096:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4099:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    409c:	89 44 24 04          	mov    %eax,0x4(%esp)
    40a0:	e8 ed fc ff ff       	call   3d92 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
    40a5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    40a9:	e9 5d fe ff ff       	jmp    3f0b <printf+0x4b>
    40ae:	66 90                	xchg   %ax,%ax

000040b0 <free>:
    40b0:	55                   	push   %ebp
    40b1:	a1 40 63 00 00       	mov    0x6340,%eax
    40b6:	89 e5                	mov    %esp,%ebp
    40b8:	57                   	push   %edi
    40b9:	56                   	push   %esi
    40ba:	53                   	push   %ebx
    40bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    40be:	8b 10                	mov    (%eax),%edx
    40c0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    40c3:	39 c8                	cmp    %ecx,%eax
    40c5:	73 19                	jae    40e0 <free+0x30>
    40c7:	89 f6                	mov    %esi,%esi
    40c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    40d0:	39 d1                	cmp    %edx,%ecx
    40d2:	72 1c                	jb     40f0 <free+0x40>
    40d4:	39 d0                	cmp    %edx,%eax
    40d6:	73 18                	jae    40f0 <free+0x40>
    40d8:	89 d0                	mov    %edx,%eax
    40da:	39 c8                	cmp    %ecx,%eax
    40dc:	8b 10                	mov    (%eax),%edx
    40de:	72 f0                	jb     40d0 <free+0x20>
    40e0:	39 d0                	cmp    %edx,%eax
    40e2:	72 f4                	jb     40d8 <free+0x28>
    40e4:	39 d1                	cmp    %edx,%ecx
    40e6:	73 f0                	jae    40d8 <free+0x28>
    40e8:	90                   	nop
    40e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    40f0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    40f3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    40f6:	39 d7                	cmp    %edx,%edi
    40f8:	74 19                	je     4113 <free+0x63>
    40fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
    40fd:	8b 50 04             	mov    0x4(%eax),%edx
    4100:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    4103:	39 f1                	cmp    %esi,%ecx
    4105:	74 23                	je     412a <free+0x7a>
    4107:	89 08                	mov    %ecx,(%eax)
    4109:	a3 40 63 00 00       	mov    %eax,0x6340
    410e:	5b                   	pop    %ebx
    410f:	5e                   	pop    %esi
    4110:	5f                   	pop    %edi
    4111:	5d                   	pop    %ebp
    4112:	c3                   	ret    
    4113:	03 72 04             	add    0x4(%edx),%esi
    4116:	89 73 fc             	mov    %esi,-0x4(%ebx)
    4119:	8b 10                	mov    (%eax),%edx
    411b:	8b 12                	mov    (%edx),%edx
    411d:	89 53 f8             	mov    %edx,-0x8(%ebx)
    4120:	8b 50 04             	mov    0x4(%eax),%edx
    4123:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    4126:	39 f1                	cmp    %esi,%ecx
    4128:	75 dd                	jne    4107 <free+0x57>
    412a:	03 53 fc             	add    -0x4(%ebx),%edx
    412d:	a3 40 63 00 00       	mov    %eax,0x6340
    4132:	89 50 04             	mov    %edx,0x4(%eax)
    4135:	8b 53 f8             	mov    -0x8(%ebx),%edx
    4138:	89 10                	mov    %edx,(%eax)
    413a:	5b                   	pop    %ebx
    413b:	5e                   	pop    %esi
    413c:	5f                   	pop    %edi
    413d:	5d                   	pop    %ebp
    413e:	c3                   	ret    
    413f:	90                   	nop

00004140 <malloc>:
    4140:	55                   	push   %ebp
    4141:	89 e5                	mov    %esp,%ebp
    4143:	57                   	push   %edi
    4144:	56                   	push   %esi
    4145:	53                   	push   %ebx
    4146:	83 ec 0c             	sub    $0xc,%esp
    4149:	8b 45 08             	mov    0x8(%ebp),%eax
    414c:	8b 15 40 63 00 00    	mov    0x6340,%edx
    4152:	8d 78 07             	lea    0x7(%eax),%edi
    4155:	c1 ef 03             	shr    $0x3,%edi
    4158:	83 c7 01             	add    $0x1,%edi
    415b:	85 d2                	test   %edx,%edx
    415d:	0f 84 a3 00 00 00    	je     4206 <malloc+0xc6>
    4163:	8b 02                	mov    (%edx),%eax
    4165:	8b 48 04             	mov    0x4(%eax),%ecx
    4168:	39 cf                	cmp    %ecx,%edi
    416a:	76 74                	jbe    41e0 <malloc+0xa0>
    416c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    4172:	be 00 10 00 00       	mov    $0x1000,%esi
    4177:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    417e:	0f 43 f7             	cmovae %edi,%esi
    4181:	ba 00 80 00 00       	mov    $0x8000,%edx
    4186:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    418c:	0f 46 da             	cmovbe %edx,%ebx
    418f:	eb 10                	jmp    41a1 <malloc+0x61>
    4191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4198:	8b 02                	mov    (%edx),%eax
    419a:	8b 48 04             	mov    0x4(%eax),%ecx
    419d:	39 cf                	cmp    %ecx,%edi
    419f:	76 3f                	jbe    41e0 <malloc+0xa0>
    41a1:	39 05 40 63 00 00    	cmp    %eax,0x6340
    41a7:	89 c2                	mov    %eax,%edx
    41a9:	75 ed                	jne    4198 <malloc+0x58>
    41ab:	83 ec 0c             	sub    $0xc,%esp
    41ae:	53                   	push   %ebx
    41af:	e8 46 fc ff ff       	call   3dfa <sbrk>
    41b4:	83 c4 10             	add    $0x10,%esp
    41b7:	83 f8 ff             	cmp    $0xffffffff,%eax
    41ba:	74 1c                	je     41d8 <malloc+0x98>
    41bc:	89 70 04             	mov    %esi,0x4(%eax)
    41bf:	83 ec 0c             	sub    $0xc,%esp
    41c2:	83 c0 08             	add    $0x8,%eax
    41c5:	50                   	push   %eax
    41c6:	e8 e5 fe ff ff       	call   40b0 <free>
    41cb:	8b 15 40 63 00 00    	mov    0x6340,%edx
    41d1:	83 c4 10             	add    $0x10,%esp
    41d4:	85 d2                	test   %edx,%edx
    41d6:	75 c0                	jne    4198 <malloc+0x58>
    41d8:	31 c0                	xor    %eax,%eax
    41da:	eb 1c                	jmp    41f8 <malloc+0xb8>
    41dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    41e0:	39 cf                	cmp    %ecx,%edi
    41e2:	74 1c                	je     4200 <malloc+0xc0>
    41e4:	29 f9                	sub    %edi,%ecx
    41e6:	89 48 04             	mov    %ecx,0x4(%eax)
    41e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    41ec:	89 78 04             	mov    %edi,0x4(%eax)
    41ef:	89 15 40 63 00 00    	mov    %edx,0x6340
    41f5:	83 c0 08             	add    $0x8,%eax
    41f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    41fb:	5b                   	pop    %ebx
    41fc:	5e                   	pop    %esi
    41fd:	5f                   	pop    %edi
    41fe:	5d                   	pop    %ebp
    41ff:	c3                   	ret    
    4200:	8b 08                	mov    (%eax),%ecx
    4202:	89 0a                	mov    %ecx,(%edx)
    4204:	eb e9                	jmp    41ef <malloc+0xaf>
    4206:	c7 05 40 63 00 00 44 	movl   $0x6344,0x6340
    420d:	63 00 00 
    4210:	c7 05 44 63 00 00 44 	movl   $0x6344,0x6344
    4217:	63 00 00 
    421a:	b8 44 63 00 00       	mov    $0x6344,%eax
    421f:	c7 05 48 63 00 00 00 	movl   $0x0,0x6348
    4226:	00 00 00 
    4229:	e9 3e ff ff ff       	jmp    416c <malloc+0x2c>
