
_lab1:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
int waitPid(void);
int exitWait(void);
int PScheduler(void);

int main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
   a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	int exitWait(void);
	//int waitPid(void);
	//int PScheduler(void);

  printf(1, "\n This program tests the correctness of your lab#1\n");
   d:	c7 44 24 04 34 10 00 	movl   $0x1034,0x4(%esp)
  14:	00 
  15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1c:	e8 bf 08 00 00       	call   8e0 <printf>
  
  if (atoi(argv[1]) == 1) {
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	89 04 24             	mov    %eax,(%esp)
  27:	e8 f4 06 00 00       	call   720 <atoi>
  2c:	83 f8 01             	cmp    $0x1,%eax
  2f:	74 40                	je     71 <main+0x71>
	  exitWait();
  } else if (atoi(argv[1]) == 2) {
  31:	8b 43 04             	mov    0x4(%ebx),%eax
  34:	89 04 24             	mov    %eax,(%esp)
  37:	e8 e4 06 00 00       	call   720 <atoi>
  3c:	83 f8 02             	cmp    $0x2,%eax
  3f:	74 37                	je     78 <main+0x78>
	  waitPid();
  }
  else if (atoi(argv[1]) == 3)
  41:	8b 43 04             	mov    0x4(%ebx),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 d4 06 00 00       	call   720 <atoi>
  4c:	83 f8 03             	cmp    $0x3,%eax
  4f:	74 36                	je     87 <main+0x87>
	PScheduler();
  else {
   printf(1, "\ntype \"lab1 1\" to test exit and wait, \"lab1 2\" to test waitpid and \"lab1 3\" to test the priority scheduler \n");
  51:	c7 44 24 04 68 10 00 	movl   $0x1068,0x4(%esp)
  58:	00 
  59:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  60:	e8 7b 08 00 00       	call   8e0 <printf>
  }
    // End of test
	 exit(0);
  65:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  6c:	e8 11 07 00 00       	call   782 <exit>
	//int PScheduler(void);

  printf(1, "\n This program tests the correctness of your lab#1\n");
  
  if (atoi(argv[1]) == 1) {
	  exitWait();
  71:	e8 2a 00 00 00       	call   a0 <exitWait>
  76:	eb ed                	jmp    65 <main+0x65>
  78:	90                   	nop
  79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  } else if (atoi(argv[1]) == 2) {
	  waitPid();
  80:	e8 1b 01 00 00       	call   1a0 <waitPid>
  85:	eb de                	jmp    65 <main+0x65>
  }
  else if (atoi(argv[1]) == 3)
	PScheduler();
  87:	e8 74 03 00 00       	call   400 <PScheduler>
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  90:	eb d3                	jmp    65 <main+0x65>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <exitWait>:
    // End of test
	 exit(0);
 }
  
  
 int exitWait(void) {
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	56                   	push   %esi
  a4:	53                   	push   %ebx
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  a5:	31 db                	xor    %ebx,%ebx
    // End of test
	 exit(0);
 }
  
  
 int exitWait(void) {
  a7:	83 ec 20             	sub    $0x20,%esp
	  int pid, ret_pid, exit_status;
	  // printf(1, "exit_status current value: %d\n", exit_status);
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
  aa:	c7 44 24 04 48 0c 00 	movl   $0xc48,0x4(%esp)
  b1:	00 
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
  b2:	8d 75 f4             	lea    -0xc(%ebp),%esi
	  int pid, ret_pid, exit_status;
	  // printf(1, "exit_status current value: %d\n", exit_status);
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
  b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bc:	e8 1f 08 00 00       	call   8e0 <printf>

  for (i = 0; i < 2; i++) {
    pid = fork();
  c1:	e8 b4 06 00 00       	call   77a <fork>
    if (pid == 0) { // only the child executed this code
  c6:	83 f8 00             	cmp    $0x0,%eax
  c9:	74 45                	je     110 <exitWait+0x70>
  cb:	90                   	nop
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      else
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
  d0:	0f 8e a3 00 00 00    	jle    179 <exitWait+0xd9>
      ret_pid = wait(&exit_status);
  d6:	89 34 24             	mov    %esi,(%esp)
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  d9:	83 c3 01             	add    $0x1,%ebx
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
  dc:	e8 a9 06 00 00       	call   78a <wait>
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
  e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  e4:	c7 44 24 04 c0 0c 00 	movl   $0xcc0,0x4(%esp)
  eb:	00 
  ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f3:	89 54 24 0c          	mov    %edx,0xc(%esp)
  f7:	89 44 24 08          	mov    %eax,0x8(%esp)
  fb:	e8 e0 07 00 00       	call   8e0 <printf>
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
 100:	83 fb 02             	cmp    $0x2,%ebx
 103:	75 bc                	jne    c1 <exitWait+0x21>
	  printf(2, "\nError using fork\n");
      exit(-1);
    }
  }
  return 0;
} 
 105:	83 c4 20             	add    $0x20,%esp
 108:	31 c0                	xor    %eax,%eax
 10a:	5b                   	pop    %ebx
 10b:	5e                   	pop    %esi
 10c:	5d                   	pop    %ebp
 10d:	c3                   	ret    
 10e:	66 90                	xchg   %ax,%ax
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
    pid = fork();
    if (pid == 0) { // only the child executed this code
      if (i == 0)
 110:	85 db                	test   %ebx,%ebx
 112:	75 34                	jne    148 <exitWait+0xa8>
      {
      printf(1, "\nThis is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 114:	e8 e9 06 00 00       	call   802 <getpid>
 119:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 120:	00 
 121:	c7 44 24 04 84 0c 00 	movl   $0xc84,0x4(%esp)
 128:	00 
 129:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	e8 a7 07 00 00       	call   8e0 <printf>
      exit(0);
 139:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 140:	e8 3d 06 00 00       	call   782 <exit>
 145:	8d 76 00             	lea    0x0(%esi),%esi
  }
      else
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
 148:	e8 b5 06 00 00       	call   802 <getpid>
 14d:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
 154:	ff 
 155:	c7 44 24 04 84 0c 00 	movl   $0xc84,0x4(%esp)
 15c:	00 
 15d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 164:	89 44 24 08          	mov    %eax,0x8(%esp)
 168:	e8 73 07 00 00       	call   8e0 <printf>
      exit(-1);
 16d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 174:	e8 09 06 00 00       	call   782 <exit>
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
    } else  // something went wrong with fork system call
    {  
	  printf(2, "\nError using fork\n");
 179:	c7 44 24 04 d8 10 00 	movl   $0x10d8,0x4(%esp)
 180:	00 
 181:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 188:	e8 53 07 00 00       	call   8e0 <printf>
      exit(-1);
 18d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 194:	e8 e9 05 00 00       	call   782 <exit>
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <waitPid>:
    }
  }
  return 0;
} 

int waitPid(void){
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	56                   	push   %esi
 1a4:	53                   	push   %ebx
 1a5:	83 ec 30             	sub    $0x30,%esp
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 1a8:	c7 44 24 04 04 0d 00 	movl   $0xd04,0x4(%esp)
 1af:	00 
 1b0:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 1b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ba:	8d 75 f8             	lea    -0x8(%ebp),%esi

int waitPid(void){
	
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 1bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1c4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 1cb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1d2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 1d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 1e0:	e8 fb 06 00 00       	call   8e0 <printf>

  for (i = 0; i <5; i++) {
    pid_a[i] = fork();
 1e5:	e8 90 05 00 00       	call   77a <fork>
	
    if (pid_a[i] == 0) { // only the child executed this code
 1ea:	85 c0                	test   %eax,%eax
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

  for (i = 0; i <5; i++) {
    pid_a[i] = fork();
 1ec:	89 03                	mov    %eax,(%ebx)
	
    if (pid_a[i] == 0) { // only the child executed this code
 1ee:	0f 84 d5 01 00 00    	je     3c9 <waitPid+0x229>
 1f4:	83 c3 04             	add    $0x4,%ebx
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

  for (i = 0; i <5; i++) {
 1f7:	39 f3                	cmp    %esi,%ebx
 1f9:	75 ea                	jne    1e5 <waitPid+0x45>
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
      exit(0);}}
       
      sleep(5);
 1fb:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 202:	8d 5d e0             	lea    -0x20(%ebp),%ebx
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
      exit(0);}}
       
      sleep(5);
 205:	e8 08 06 00 00       	call   812 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
 20a:	8b 75 f0             	mov    -0x10(%ebp),%esi
 20d:	c7 44 24 04 80 0d 00 	movl   $0xd80,0x4(%esp)
 214:	00 
 215:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 21c:	89 74 24 08          	mov    %esi,0x8(%esp)
 220:	e8 bb 06 00 00       	call   8e0 <printf>
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 225:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 229:	89 34 24             	mov    %esi,(%esp)
 22c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 233:	00 
 234:	e8 f1 05 00 00       	call   82a <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 239:	8b 55 e0             	mov    -0x20(%ebp),%edx
 23c:	c7 44 24 04 bc 0d 00 	movl   $0xdbc,0x4(%esp)
 243:	00 
 244:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 24b:	89 54 24 0c          	mov    %edx,0xc(%esp)
 24f:	89 44 24 08          	mov    %eax,0x8(%esp)
 253:	e8 88 06 00 00       	call   8e0 <printf>
      sleep(5);
 258:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 25f:	e8 ae 05 00 00       	call   812 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[1]);
 264:	8b 75 e8             	mov    -0x18(%ebp),%esi
 267:	c7 44 24 04 80 0d 00 	movl   $0xd80,0x4(%esp)
 26e:	00 
 26f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 276:	89 74 24 08          	mov    %esi,0x8(%esp)
 27a:	e8 61 06 00 00       	call   8e0 <printf>
      ret_pid = waitpid(pid_a[1], &exit_status, 0);
 27f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 283:	89 34 24             	mov    %esi,(%esp)
 286:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 28d:	00 
 28e:	e8 97 05 00 00       	call   82a <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 293:	8b 55 e0             	mov    -0x20(%ebp),%edx
 296:	c7 44 24 04 bc 0d 00 	movl   $0xdbc,0x4(%esp)
 29d:	00 
 29e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2a5:	89 54 24 0c          	mov    %edx,0xc(%esp)
 2a9:	89 44 24 08          	mov    %eax,0x8(%esp)
 2ad:	e8 2e 06 00 00       	call   8e0 <printf>
      sleep(5);
 2b2:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 2b9:	e8 54 05 00 00       	call   812 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[2]);
 2be:	8b 75 ec             	mov    -0x14(%ebp),%esi
 2c1:	c7 44 24 04 80 0d 00 	movl   $0xd80,0x4(%esp)
 2c8:	00 
 2c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2d0:	89 74 24 08          	mov    %esi,0x8(%esp)
 2d4:	e8 07 06 00 00       	call   8e0 <printf>
      ret_pid = waitpid(pid_a[2], &exit_status, 0);
 2d9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 2dd:	89 34 24             	mov    %esi,(%esp)
 2e0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 2e7:	00 
 2e8:	e8 3d 05 00 00       	call   82a <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 2ed:	8b 55 e0             	mov    -0x20(%ebp),%edx
 2f0:	c7 44 24 04 bc 0d 00 	movl   $0xdbc,0x4(%esp)
 2f7:	00 
 2f8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2ff:	89 54 24 0c          	mov    %edx,0xc(%esp)
 303:	89 44 24 08          	mov    %eax,0x8(%esp)
 307:	e8 d4 05 00 00       	call   8e0 <printf>
      sleep(5);
 30c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 313:	e8 fa 04 00 00       	call   812 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[0]);
 318:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 31b:	c7 44 24 04 80 0d 00 	movl   $0xd80,0x4(%esp)
 322:	00 
 323:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 32a:	89 74 24 08          	mov    %esi,0x8(%esp)
 32e:	e8 ad 05 00 00       	call   8e0 <printf>
      ret_pid = waitpid(pid_a[0], &exit_status, 0);
 333:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 337:	89 34 24             	mov    %esi,(%esp)
 33a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 341:	00 
 342:	e8 e3 04 00 00       	call   82a <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 347:	8b 55 e0             	mov    -0x20(%ebp),%edx
 34a:	c7 44 24 04 bc 0d 00 	movl   $0xdbc,0x4(%esp)
 351:	00 
 352:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 359:	89 54 24 0c          	mov    %edx,0xc(%esp)
 35d:	89 44 24 08          	mov    %eax,0x8(%esp)
 361:	e8 7a 05 00 00       	call   8e0 <printf>
      sleep(5);
 366:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 36d:	e8 a0 04 00 00       	call   812 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[4]);
 372:	8b 75 f4             	mov    -0xc(%ebp),%esi
 375:	c7 44 24 04 80 0d 00 	movl   $0xd80,0x4(%esp)
 37c:	00 
 37d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 384:	89 74 24 08          	mov    %esi,0x8(%esp)
 388:	e8 53 05 00 00       	call   8e0 <printf>
      ret_pid = waitpid(pid_a[4], &exit_status, 0);
 38d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 391:	89 34 24             	mov    %esi,(%esp)
 394:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 39b:	00 
 39c:	e8 89 04 00 00       	call   82a <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 3a1:	8b 55 e0             	mov    -0x20(%ebp),%edx
 3a4:	c7 44 24 04 bc 0d 00 	movl   $0xdbc,0x4(%esp)
 3ab:	00 
 3ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3b3:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3b7:	89 44 24 08          	mov    %eax,0x8(%esp)
 3bb:	e8 20 05 00 00       	call   8e0 <printf>
      
      return 0;
  }
 3c0:	83 c4 30             	add    $0x30,%esp
 3c3:	31 c0                	xor    %eax,%eax
 3c5:	5b                   	pop    %ebx
 3c6:	5e                   	pop    %esi
 3c7:	5d                   	pop    %ebp
 3c8:	c3                   	ret    
    pid_a[i] = fork();
	
    if (pid_a[i] == 0) { // only the child executed this code
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 3c9:	e8 34 04 00 00       	call   802 <getpid>
 3ce:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 3d5:	00 
 3d6:	c7 44 24 04 44 0d 00 	movl   $0xd44,0x4(%esp)
 3dd:	00 
 3de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3e5:	89 44 24 08          	mov    %eax,0x8(%esp)
 3e9:	e8 f2 04 00 00       	call   8e0 <printf>
      exit(0);}}
 3ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3f5:	e8 88 03 00 00       	call   782 <exit>
 3fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000400 <PScheduler>:
      
      return 0;
  }
      
      
int PScheduler(void){
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	56                   	push   %esi
 404:	53                   	push   %ebx
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    setpriority(0);
    for (i = 0; i <  3; i++) {
 405:	31 db                	xor    %ebx,%ebx
      
      return 0;
  }
      
      
int PScheduler(void){
 407:	83 ec 20             	sub    $0x20,%esp
  
  
  int pid, ret_pid, exit_status;
  int i,j,k;
  
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
 40a:	c7 44 24 04 f8 0d 00 	movl   $0xdf8,0x4(%esp)
 411:	00 
 412:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 419:	e8 c2 04 00 00       	call   8e0 <printf>
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
 41e:	c7 44 24 04 50 0e 00 	movl   $0xe50,0x4(%esp)
 425:	00 
 426:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 42d:	e8 ae 04 00 00       	call   8e0 <printf>
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
 432:	c7 44 24 04 a0 0e 00 	movl   $0xea0,0x4(%esp)
 439:	00 
 43a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 441:	e8 9a 04 00 00       	call   8e0 <printf>
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
 446:	c7 44 24 04 f4 0e 00 	movl   $0xef4,0x4(%esp)
 44d:	00 
 44e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 455:	e8 86 04 00 00       	call   8e0 <printf>
    setpriority(0);
 45a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 461:	e8 cc 03 00 00       	call   832 <setpriority>
    for (i = 0; i <  3; i++) {
	pid = fork();
 466:	e8 0f 03 00 00       	call   77a <fork>
	if (pid > 0 ) {
 46b:	83 f8 00             	cmp    $0x0,%eax
 46e:	7e 59                	jle    4c9 <PScheduler+0xc9>
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    setpriority(0);
    for (i = 0; i <  3; i++) {
 470:	83 c3 01             	add    $0x1,%ebx
 473:	83 fb 03             	cmp    $0x3,%ebx
 476:	75 ee                	jne    466 <PScheduler+0x66>
 478:	bb 03 00 00 00       	mov    $0x3,%ebx
 47d:	8d 75 f4             	lea    -0xc(%ebp),%esi
        }
	}

	if(pid > 0) {
		for (i = 0; i <  3; i++) {
			ret_pid = wait(&exit_status);
 480:	89 34 24             	mov    %esi,(%esp)
 483:	e8 02 03 00 00       	call   78a <wait>
			printf(1,"\n This is the parent: child with PID# %d has finished with status %d \n",ret_pid,exit_status);
 488:	8b 55 f4             	mov    -0xc(%ebp),%edx
 48b:	c7 44 24 04 a4 0f 00 	movl   $0xfa4,0x4(%esp)
 492:	00 
 493:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 49a:	89 54 24 0c          	mov    %edx,0xc(%esp)
 49e:	89 44 24 08          	mov    %eax,0x8(%esp)
 4a2:	e8 39 04 00 00       	call   8e0 <printf>
			exit(-1);
        }
	}

	if(pid > 0) {
		for (i = 0; i <  3; i++) {
 4a7:	83 eb 01             	sub    $0x1,%ebx
 4aa:	75 d4                	jne    480 <PScheduler+0x80>
			ret_pid = wait(&exit_status);
			printf(1,"\n This is the parent: child with PID# %d has finished with status %d \n",ret_pid,exit_status);
			}
                     printf(1,"\n if processes with highest priority finished first then its correct \n");
 4ac:	c7 44 24 04 ec 0f 00 	movl   $0xfec,0x4(%esp)
 4b3:	00 
 4b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4bb:	e8 20 04 00 00       	call   8e0 <printf>
  }
  
		
	return 0;
  
}
 4c0:	83 c4 20             	add    $0x20,%esp
 4c3:	31 c0                	xor    %eax,%eax
 4c5:	5b                   	pop    %ebx
 4c6:	5e                   	pop    %esi
 4c7:	5d                   	pop    %ebp
 4c8:	c3                   	ret    
    setpriority(0);
    for (i = 0; i <  3; i++) {
	pid = fork();
	if (pid > 0 ) {
		continue;}
	else if ( pid == 0) {
 4c9:	75 75                	jne    540 <PScheduler+0x140>
		printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
 4cb:	e8 32 03 00 00       	call   802 <getpid>
 4d0:	6b db ec             	imul   $0xffffffec,%ebx,%ebx
 4d3:	c7 44 24 04 30 0f 00 	movl   $0xf30,0x4(%esp)
 4da:	00 
 4db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4e2:	83 c3 3c             	add    $0x3c,%ebx
 4e5:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 4e9:	89 44 24 08          	mov    %eax,0x8(%esp)
 4ed:	e8 ee 03 00 00       	call   8e0 <printf>
		setpriority(60-20*i);	
 4f2:	89 1c 24             	mov    %ebx,(%esp)
 4f5:	e8 38 03 00 00       	call   832 <setpriority>
 4fa:	ba 50 c3 00 00       	mov    $0xc350,%edx
 4ff:	90                   	nop
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    setpriority(0);
    for (i = 0; i <  3; i++) {
 500:	b8 10 27 00 00       	mov    $0x2710,%eax
 505:	8d 76 00             	lea    0x0(%esi),%esi
	else if ( pid == 0) {
		printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
		setpriority(60-20*i);	
		for (j=0;j<50000;j++) {
			for(k=0;k<10000;k++) {
				asm("nop"); }}
 508:	90                   	nop
		continue;}
	else if ( pid == 0) {
		printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
		setpriority(60-20*i);	
		for (j=0;j<50000;j++) {
			for(k=0;k<10000;k++) {
 509:	83 e8 01             	sub    $0x1,%eax
 50c:	75 fa                	jne    508 <PScheduler+0x108>
	if (pid > 0 ) {
		continue;}
	else if ( pid == 0) {
		printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
		setpriority(60-20*i);	
		for (j=0;j<50000;j++) {
 50e:	83 ea 01             	sub    $0x1,%edx
 511:	75 ed                	jne    500 <PScheduler+0x100>
			for(k=0;k<10000;k++) {
				asm("nop"); }}
		printf(1, "\n child# %d with priority %d has finished! \n",getpid(),60-20*i);		
 513:	e8 ea 02 00 00       	call   802 <getpid>
 518:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 51c:	c7 44 24 04 74 0f 00 	movl   $0xf74,0x4(%esp)
 523:	00 
 524:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 52b:	89 44 24 08          	mov    %eax,0x8(%esp)
 52f:	e8 ac 03 00 00       	call   8e0 <printf>
		exit(0);
 534:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 53b:	e8 42 02 00 00       	call   782 <exit>
        }
        else {
			printf(2," \n Error \n");
 540:	c7 44 24 04 eb 10 00 	movl   $0x10eb,0x4(%esp)
 547:	00 
 548:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 54f:	e8 8c 03 00 00       	call   8e0 <printf>
			exit(-1);
 554:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 55b:	e8 22 02 00 00       	call   782 <exit>

00000560 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	8b 45 08             	mov    0x8(%ebp),%eax
 566:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 569:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 56a:	89 c2                	mov    %eax,%edx
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 570:	83 c1 01             	add    $0x1,%ecx
 573:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 577:	83 c2 01             	add    $0x1,%edx
 57a:	84 db                	test   %bl,%bl
 57c:	88 5a ff             	mov    %bl,-0x1(%edx)
 57f:	75 ef                	jne    570 <strcpy+0x10>
    ;
  return os;
}
 581:	5b                   	pop    %ebx
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    
 584:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 58a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000590 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	8b 55 08             	mov    0x8(%ebp),%edx
 596:	53                   	push   %ebx
 597:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 59a:	0f b6 02             	movzbl (%edx),%eax
 59d:	84 c0                	test   %al,%al
 59f:	74 2d                	je     5ce <strcmp+0x3e>
 5a1:	0f b6 19             	movzbl (%ecx),%ebx
 5a4:	38 d8                	cmp    %bl,%al
 5a6:	74 0e                	je     5b6 <strcmp+0x26>
 5a8:	eb 2b                	jmp    5d5 <strcmp+0x45>
 5aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5b0:	38 c8                	cmp    %cl,%al
 5b2:	75 15                	jne    5c9 <strcmp+0x39>
    p++, q++;
 5b4:	89 d9                	mov    %ebx,%ecx
 5b6:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 5b9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 5bc:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 5bf:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 5c3:	84 c0                	test   %al,%al
 5c5:	75 e9                	jne    5b0 <strcmp+0x20>
 5c7:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 5c9:	29 c8                	sub    %ecx,%eax
}
 5cb:	5b                   	pop    %ebx
 5cc:	5d                   	pop    %ebp
 5cd:	c3                   	ret    
 5ce:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 5d1:	31 c0                	xor    %eax,%eax
 5d3:	eb f4                	jmp    5c9 <strcmp+0x39>
 5d5:	0f b6 cb             	movzbl %bl,%ecx
 5d8:	eb ef                	jmp    5c9 <strcmp+0x39>
 5da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005e0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 5e6:	80 39 00             	cmpb   $0x0,(%ecx)
 5e9:	74 12                	je     5fd <strlen+0x1d>
 5eb:	31 d2                	xor    %edx,%edx
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
 5f0:	83 c2 01             	add    $0x1,%edx
 5f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 5f7:	89 d0                	mov    %edx,%eax
 5f9:	75 f5                	jne    5f0 <strlen+0x10>
    ;
  return n;
}
 5fb:	5d                   	pop    %ebp
 5fc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 5fd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 5ff:	5d                   	pop    %ebp
 600:	c3                   	ret    
 601:	eb 0d                	jmp    610 <memset>
 603:	90                   	nop
 604:	90                   	nop
 605:	90                   	nop
 606:	90                   	nop
 607:	90                   	nop
 608:	90                   	nop
 609:	90                   	nop
 60a:	90                   	nop
 60b:	90                   	nop
 60c:	90                   	nop
 60d:	90                   	nop
 60e:	90                   	nop
 60f:	90                   	nop

00000610 <memset>:

void*
memset(void *dst, int c, uint n)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	8b 55 08             	mov    0x8(%ebp),%edx
 616:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 617:	8b 4d 10             	mov    0x10(%ebp),%ecx
 61a:	8b 45 0c             	mov    0xc(%ebp),%eax
 61d:	89 d7                	mov    %edx,%edi
 61f:	fc                   	cld    
 620:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 622:	89 d0                	mov    %edx,%eax
 624:	5f                   	pop    %edi
 625:	5d                   	pop    %ebp
 626:	c3                   	ret    
 627:	89 f6                	mov    %esi,%esi
 629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000630 <strchr>:

char*
strchr(const char *s, char c)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	8b 45 08             	mov    0x8(%ebp),%eax
 636:	53                   	push   %ebx
 637:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 63a:	0f b6 18             	movzbl (%eax),%ebx
 63d:	84 db                	test   %bl,%bl
 63f:	74 1d                	je     65e <strchr+0x2e>
    if(*s == c)
 641:	38 d3                	cmp    %dl,%bl
 643:	89 d1                	mov    %edx,%ecx
 645:	75 0d                	jne    654 <strchr+0x24>
 647:	eb 17                	jmp    660 <strchr+0x30>
 649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 650:	38 ca                	cmp    %cl,%dl
 652:	74 0c                	je     660 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 654:	83 c0 01             	add    $0x1,%eax
 657:	0f b6 10             	movzbl (%eax),%edx
 65a:	84 d2                	test   %dl,%dl
 65c:	75 f2                	jne    650 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 65e:	31 c0                	xor    %eax,%eax
}
 660:	5b                   	pop    %ebx
 661:	5d                   	pop    %ebp
 662:	c3                   	ret    
 663:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000670 <gets>:

char*
gets(char *buf, int max)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 675:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 677:	53                   	push   %ebx
 678:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 67b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 67e:	eb 31                	jmp    6b1 <gets+0x41>
    cc = read(0, &c, 1);
 680:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 687:	00 
 688:	89 7c 24 04          	mov    %edi,0x4(%esp)
 68c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 693:	e8 02 01 00 00       	call   79a <read>
    if(cc < 1)
 698:	85 c0                	test   %eax,%eax
 69a:	7e 1d                	jle    6b9 <gets+0x49>
      break;
    buf[i++] = c;
 69c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 6a0:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 6a2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 6a5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 6a7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 6ab:	74 0c                	je     6b9 <gets+0x49>
 6ad:	3c 0a                	cmp    $0xa,%al
 6af:	74 08                	je     6b9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 6b1:	8d 5e 01             	lea    0x1(%esi),%ebx
 6b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 6b7:	7c c7                	jl     680 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
 6bc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 6c0:	83 c4 2c             	add    $0x2c,%esp
 6c3:	5b                   	pop    %ebx
 6c4:	5e                   	pop    %esi
 6c5:	5f                   	pop    %edi
 6c6:	5d                   	pop    %ebp
 6c7:	c3                   	ret    
 6c8:	90                   	nop
 6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006d0 <stat>:

int
stat(char *n, struct stat *st)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	56                   	push   %esi
 6d4:	53                   	push   %ebx
 6d5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 6d8:	8b 45 08             	mov    0x8(%ebp),%eax
 6db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 6e2:	00 
 6e3:	89 04 24             	mov    %eax,(%esp)
 6e6:	e8 d7 00 00 00       	call   7c2 <open>
  if(fd < 0)
 6eb:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 6ed:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 6ef:	78 27                	js     718 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 6f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 6f4:	89 1c 24             	mov    %ebx,(%esp)
 6f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fb:	e8 da 00 00 00       	call   7da <fstat>
  close(fd);
 700:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 703:	89 c6                	mov    %eax,%esi
  close(fd);
 705:	e8 a0 00 00 00       	call   7aa <close>
  return r;
 70a:	89 f0                	mov    %esi,%eax
}
 70c:	83 c4 10             	add    $0x10,%esp
 70f:	5b                   	pop    %ebx
 710:	5e                   	pop    %esi
 711:	5d                   	pop    %ebp
 712:	c3                   	ret    
 713:	90                   	nop
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 718:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 71d:	eb ed                	jmp    70c <stat+0x3c>
 71f:	90                   	nop

00000720 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	8b 4d 08             	mov    0x8(%ebp),%ecx
 726:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 727:	0f be 11             	movsbl (%ecx),%edx
 72a:	8d 42 d0             	lea    -0x30(%edx),%eax
 72d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
 72f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 734:	77 17                	ja     74d <atoi+0x2d>
 736:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 738:	83 c1 01             	add    $0x1,%ecx
 73b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 73e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 742:	0f be 11             	movsbl (%ecx),%edx
 745:	8d 5a d0             	lea    -0x30(%edx),%ebx
 748:	80 fb 09             	cmp    $0x9,%bl
 74b:	76 eb                	jbe    738 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 74d:	5b                   	pop    %ebx
 74e:	5d                   	pop    %ebp
 74f:	c3                   	ret    

00000750 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 750:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 751:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 753:	89 e5                	mov    %esp,%ebp
 755:	56                   	push   %esi
 756:	8b 45 08             	mov    0x8(%ebp),%eax
 759:	53                   	push   %ebx
 75a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 75d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 760:	85 db                	test   %ebx,%ebx
 762:	7e 12                	jle    776 <memmove+0x26>
 764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 768:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 76c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 76f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 772:	39 da                	cmp    %ebx,%edx
 774:	75 f2                	jne    768 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 776:	5b                   	pop    %ebx
 777:	5e                   	pop    %esi
 778:	5d                   	pop    %ebp
 779:	c3                   	ret    

0000077a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 77a:	b8 01 00 00 00       	mov    $0x1,%eax
 77f:	cd 40                	int    $0x40
 781:	c3                   	ret    

00000782 <exit>:
SYSCALL(exit)
 782:	b8 02 00 00 00       	mov    $0x2,%eax
 787:	cd 40                	int    $0x40
 789:	c3                   	ret    

0000078a <wait>:
SYSCALL(wait)
 78a:	b8 03 00 00 00       	mov    $0x3,%eax
 78f:	cd 40                	int    $0x40
 791:	c3                   	ret    

00000792 <pipe>:
SYSCALL(pipe)
 792:	b8 04 00 00 00       	mov    $0x4,%eax
 797:	cd 40                	int    $0x40
 799:	c3                   	ret    

0000079a <read>:
SYSCALL(read)
 79a:	b8 05 00 00 00       	mov    $0x5,%eax
 79f:	cd 40                	int    $0x40
 7a1:	c3                   	ret    

000007a2 <write>:
SYSCALL(write)
 7a2:	b8 10 00 00 00       	mov    $0x10,%eax
 7a7:	cd 40                	int    $0x40
 7a9:	c3                   	ret    

000007aa <close>:
SYSCALL(close)
 7aa:	b8 15 00 00 00       	mov    $0x15,%eax
 7af:	cd 40                	int    $0x40
 7b1:	c3                   	ret    

000007b2 <kill>:
SYSCALL(kill)
 7b2:	b8 06 00 00 00       	mov    $0x6,%eax
 7b7:	cd 40                	int    $0x40
 7b9:	c3                   	ret    

000007ba <exec>:
SYSCALL(exec)
 7ba:	b8 07 00 00 00       	mov    $0x7,%eax
 7bf:	cd 40                	int    $0x40
 7c1:	c3                   	ret    

000007c2 <open>:
SYSCALL(open)
 7c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 7c7:	cd 40                	int    $0x40
 7c9:	c3                   	ret    

000007ca <mknod>:
SYSCALL(mknod)
 7ca:	b8 11 00 00 00       	mov    $0x11,%eax
 7cf:	cd 40                	int    $0x40
 7d1:	c3                   	ret    

000007d2 <unlink>:
SYSCALL(unlink)
 7d2:	b8 12 00 00 00       	mov    $0x12,%eax
 7d7:	cd 40                	int    $0x40
 7d9:	c3                   	ret    

000007da <fstat>:
SYSCALL(fstat)
 7da:	b8 08 00 00 00       	mov    $0x8,%eax
 7df:	cd 40                	int    $0x40
 7e1:	c3                   	ret    

000007e2 <link>:
SYSCALL(link)
 7e2:	b8 13 00 00 00       	mov    $0x13,%eax
 7e7:	cd 40                	int    $0x40
 7e9:	c3                   	ret    

000007ea <mkdir>:
SYSCALL(mkdir)
 7ea:	b8 14 00 00 00       	mov    $0x14,%eax
 7ef:	cd 40                	int    $0x40
 7f1:	c3                   	ret    

000007f2 <chdir>:
SYSCALL(chdir)
 7f2:	b8 09 00 00 00       	mov    $0x9,%eax
 7f7:	cd 40                	int    $0x40
 7f9:	c3                   	ret    

000007fa <dup>:
SYSCALL(dup)
 7fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 7ff:	cd 40                	int    $0x40
 801:	c3                   	ret    

00000802 <getpid>:
SYSCALL(getpid)
 802:	b8 0b 00 00 00       	mov    $0xb,%eax
 807:	cd 40                	int    $0x40
 809:	c3                   	ret    

0000080a <sbrk>:
SYSCALL(sbrk)
 80a:	b8 0c 00 00 00       	mov    $0xc,%eax
 80f:	cd 40                	int    $0x40
 811:	c3                   	ret    

00000812 <sleep>:
SYSCALL(sleep)
 812:	b8 0d 00 00 00       	mov    $0xd,%eax
 817:	cd 40                	int    $0x40
 819:	c3                   	ret    

0000081a <uptime>:
SYSCALL(uptime)
 81a:	b8 0e 00 00 00       	mov    $0xe,%eax
 81f:	cd 40                	int    $0x40
 821:	c3                   	ret    

00000822 <hello>:
SYSCALL(hello)		// MOD - 4/11 : WEEK 2 EXERCISE
 822:	b8 16 00 00 00       	mov    $0x16,%eax
 827:	cd 40                	int    $0x40
 829:	c3                   	ret    

0000082a <waitpid>:
SYSCALL(waitpid)	// MOD - 4/29 : WEEK 4 EXERCISE
 82a:	b8 17 00 00 00       	mov    $0x17,%eax
 82f:	cd 40                	int    $0x40
 831:	c3                   	ret    

00000832 <setpriority>:
 832:	b8 18 00 00 00       	mov    $0x18,%eax
 837:	cd 40                	int    $0x40
 839:	c3                   	ret    
 83a:	66 90                	xchg   %ax,%ax
 83c:	66 90                	xchg   %ax,%ax
 83e:	66 90                	xchg   %ax,%ax

00000840 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
 843:	57                   	push   %edi
 844:	56                   	push   %esi
 845:	89 c6                	mov    %eax,%esi
 847:	53                   	push   %ebx
 848:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 84b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 84e:	85 db                	test   %ebx,%ebx
 850:	74 09                	je     85b <printint+0x1b>
 852:	89 d0                	mov    %edx,%eax
 854:	c1 e8 1f             	shr    $0x1f,%eax
 857:	84 c0                	test   %al,%al
 859:	75 75                	jne    8d0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 85b:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 85d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 864:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 867:	31 ff                	xor    %edi,%edi
 869:	89 ce                	mov    %ecx,%esi
 86b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 86e:	eb 02                	jmp    872 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 870:	89 cf                	mov    %ecx,%edi
 872:	31 d2                	xor    %edx,%edx
 874:	f7 f6                	div    %esi
 876:	8d 4f 01             	lea    0x1(%edi),%ecx
 879:	0f b6 92 fd 10 00 00 	movzbl 0x10fd(%edx),%edx
  }while((x /= base) != 0);
 880:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 882:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 885:	75 e9                	jne    870 <printint+0x30>
  if(neg)
 887:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 88a:	89 c8                	mov    %ecx,%eax
 88c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
 88f:	85 d2                	test   %edx,%edx
 891:	74 08                	je     89b <printint+0x5b>
    buf[i++] = '-';
 893:	8d 4f 02             	lea    0x2(%edi),%ecx
 896:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 89b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 89e:	66 90                	xchg   %ax,%ax
 8a0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 8a5:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8af:	00 
 8b0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8b4:	89 34 24             	mov    %esi,(%esp)
 8b7:	88 45 d7             	mov    %al,-0x29(%ebp)
 8ba:	e8 e3 fe ff ff       	call   7a2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 8bf:	83 ff ff             	cmp    $0xffffffff,%edi
 8c2:	75 dc                	jne    8a0 <printint+0x60>
    putc(fd, buf[i]);
}
 8c4:	83 c4 4c             	add    $0x4c,%esp
 8c7:	5b                   	pop    %ebx
 8c8:	5e                   	pop    %esi
 8c9:	5f                   	pop    %edi
 8ca:	5d                   	pop    %ebp
 8cb:	c3                   	ret    
 8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 8d0:	89 d0                	mov    %edx,%eax
 8d2:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 8d4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 8db:	eb 87                	jmp    864 <printint+0x24>
 8dd:	8d 76 00             	lea    0x0(%esi),%esi

000008e0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8e0:	55                   	push   %ebp
 8e1:	89 e5                	mov    %esp,%ebp
 8e3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 8e4:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8e6:	56                   	push   %esi
 8e7:	53                   	push   %ebx
 8e8:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8eb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 8ee:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8f1:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 8f4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 8f7:	0f b6 13             	movzbl (%ebx),%edx
 8fa:	83 c3 01             	add    $0x1,%ebx
 8fd:	84 d2                	test   %dl,%dl
 8ff:	75 39                	jne    93a <printf+0x5a>
 901:	e9 c2 00 00 00       	jmp    9c8 <printf+0xe8>
 906:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 908:	83 fa 25             	cmp    $0x25,%edx
 90b:	0f 84 bf 00 00 00    	je     9d0 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 911:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 914:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 91b:	00 
 91c:	89 44 24 04          	mov    %eax,0x4(%esp)
 920:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 923:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 926:	e8 77 fe ff ff       	call   7a2 <write>
 92b:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 92e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 932:	84 d2                	test   %dl,%dl
 934:	0f 84 8e 00 00 00    	je     9c8 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
 93a:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 93c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 93f:	74 c7                	je     908 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 941:	83 ff 25             	cmp    $0x25,%edi
 944:	75 e5                	jne    92b <printf+0x4b>
      if(c == 'd'){
 946:	83 fa 64             	cmp    $0x64,%edx
 949:	0f 84 31 01 00 00    	je     a80 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 94f:	25 f7 00 00 00       	and    $0xf7,%eax
 954:	83 f8 70             	cmp    $0x70,%eax
 957:	0f 84 83 00 00 00    	je     9e0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 95d:	83 fa 73             	cmp    $0x73,%edx
 960:	0f 84 a2 00 00 00    	je     a08 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 966:	83 fa 63             	cmp    $0x63,%edx
 969:	0f 84 35 01 00 00    	je     aa4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 96f:	83 fa 25             	cmp    $0x25,%edx
 972:	0f 84 e0 00 00 00    	je     a58 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 978:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 97b:	83 c3 01             	add    $0x1,%ebx
 97e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 985:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 986:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 988:	89 44 24 04          	mov    %eax,0x4(%esp)
 98c:	89 34 24             	mov    %esi,(%esp)
 98f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 992:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 996:	e8 07 fe ff ff       	call   7a2 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 99b:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 99e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 9a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 9a8:	00 
 9a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 9ad:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 9b0:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9b3:	e8 ea fd ff ff       	call   7a2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9b8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 9bc:	84 d2                	test   %dl,%dl
 9be:	0f 85 76 ff ff ff    	jne    93a <printf+0x5a>
 9c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 9c8:	83 c4 3c             	add    $0x3c,%esp
 9cb:	5b                   	pop    %ebx
 9cc:	5e                   	pop    %esi
 9cd:	5f                   	pop    %edi
 9ce:	5d                   	pop    %ebp
 9cf:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 9d0:	bf 25 00 00 00       	mov    $0x25,%edi
 9d5:	e9 51 ff ff ff       	jmp    92b <printf+0x4b>
 9da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 9e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 9e3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9e8:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 9ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 9f1:	8b 10                	mov    (%eax),%edx
 9f3:	89 f0                	mov    %esi,%eax
 9f5:	e8 46 fe ff ff       	call   840 <printint>
        ap++;
 9fa:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 9fe:	e9 28 ff ff ff       	jmp    92b <printf+0x4b>
 a03:	90                   	nop
 a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 a08:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 a0b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 a0f:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
 a11:	b8 f6 10 00 00       	mov    $0x10f6,%eax
 a16:	85 ff                	test   %edi,%edi
 a18:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 a1b:	0f b6 07             	movzbl (%edi),%eax
 a1e:	84 c0                	test   %al,%al
 a20:	74 2a                	je     a4c <printf+0x16c>
 a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a28:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a2b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 a2e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a31:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a38:	00 
 a39:	89 44 24 04          	mov    %eax,0x4(%esp)
 a3d:	89 34 24             	mov    %esi,(%esp)
 a40:	e8 5d fd ff ff       	call   7a2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 a45:	0f b6 07             	movzbl (%edi),%eax
 a48:	84 c0                	test   %al,%al
 a4a:	75 dc                	jne    a28 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a4c:	31 ff                	xor    %edi,%edi
 a4e:	e9 d8 fe ff ff       	jmp    92b <printf+0x4b>
 a53:	90                   	nop
 a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a58:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a5b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a5d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a64:	00 
 a65:	89 44 24 04          	mov    %eax,0x4(%esp)
 a69:	89 34 24             	mov    %esi,(%esp)
 a6c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 a70:	e8 2d fd ff ff       	call   7a2 <write>
 a75:	e9 b1 fe ff ff       	jmp    92b <printf+0x4b>
 a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 a80:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 a83:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a88:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 a8b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a92:	8b 10                	mov    (%eax),%edx
 a94:	89 f0                	mov    %esi,%eax
 a96:	e8 a5 fd ff ff       	call   840 <printint>
        ap++;
 a9b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 a9f:	e9 87 fe ff ff       	jmp    92b <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 aa4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 aa7:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 aa9:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 aab:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 ab2:	00 
 ab3:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 ab6:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 ab9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 abc:	89 44 24 04          	mov    %eax,0x4(%esp)
 ac0:	e8 dd fc ff ff       	call   7a2 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 ac5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 ac9:	e9 5d fe ff ff       	jmp    92b <printf+0x4b>
 ace:	66 90                	xchg   %ax,%ax

00000ad0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ad0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ad1:	a1 f8 13 00 00       	mov    0x13f8,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 ad6:	89 e5                	mov    %esp,%ebp
 ad8:	57                   	push   %edi
 ad9:	56                   	push   %esi
 ada:	53                   	push   %ebx
 adb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ade:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 ae0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ae3:	39 d0                	cmp    %edx,%eax
 ae5:	72 11                	jb     af8 <free+0x28>
 ae7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ae8:	39 c8                	cmp    %ecx,%eax
 aea:	72 04                	jb     af0 <free+0x20>
 aec:	39 ca                	cmp    %ecx,%edx
 aee:	72 10                	jb     b00 <free+0x30>
 af0:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 af2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 af4:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 af6:	73 f0                	jae    ae8 <free+0x18>
 af8:	39 ca                	cmp    %ecx,%edx
 afa:	72 04                	jb     b00 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 afc:	39 c8                	cmp    %ecx,%eax
 afe:	72 f0                	jb     af0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b00:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b03:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 b06:	39 cf                	cmp    %ecx,%edi
 b08:	74 1e                	je     b28 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b0a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b0d:	8b 48 04             	mov    0x4(%eax),%ecx
 b10:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 b13:	39 f2                	cmp    %esi,%edx
 b15:	74 28                	je     b3f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b17:	89 10                	mov    %edx,(%eax)
  freep = p;
 b19:	a3 f8 13 00 00       	mov    %eax,0x13f8
}
 b1e:	5b                   	pop    %ebx
 b1f:	5e                   	pop    %esi
 b20:	5f                   	pop    %edi
 b21:	5d                   	pop    %ebp
 b22:	c3                   	ret    
 b23:	90                   	nop
 b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 b28:	03 71 04             	add    0x4(%ecx),%esi
 b2b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b2e:	8b 08                	mov    (%eax),%ecx
 b30:	8b 09                	mov    (%ecx),%ecx
 b32:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 b35:	8b 48 04             	mov    0x4(%eax),%ecx
 b38:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 b3b:	39 f2                	cmp    %esi,%edx
 b3d:	75 d8                	jne    b17 <free+0x47>
    p->s.size += bp->s.size;
 b3f:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 b42:	a3 f8 13 00 00       	mov    %eax,0x13f8
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 b47:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b4a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 b4d:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 b4f:	5b                   	pop    %ebx
 b50:	5e                   	pop    %esi
 b51:	5f                   	pop    %edi
 b52:	5d                   	pop    %ebp
 b53:	c3                   	ret    
 b54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 b5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b60 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b60:	55                   	push   %ebp
 b61:	89 e5                	mov    %esp,%ebp
 b63:	57                   	push   %edi
 b64:	56                   	push   %esi
 b65:	53                   	push   %ebx
 b66:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b69:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b6c:	8b 1d f8 13 00 00    	mov    0x13f8,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b72:	8d 48 07             	lea    0x7(%eax),%ecx
 b75:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 b78:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b7a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 b7d:	0f 84 9b 00 00 00    	je     c1e <malloc+0xbe>
 b83:	8b 13                	mov    (%ebx),%edx
 b85:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b88:	39 fe                	cmp    %edi,%esi
 b8a:	76 64                	jbe    bf0 <malloc+0x90>
 b8c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 b93:	bb 00 80 00 00       	mov    $0x8000,%ebx
 b98:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 b9b:	eb 0e                	jmp    bab <malloc+0x4b>
 b9d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ba0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 ba2:	8b 78 04             	mov    0x4(%eax),%edi
 ba5:	39 fe                	cmp    %edi,%esi
 ba7:	76 4f                	jbe    bf8 <malloc+0x98>
 ba9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bab:	3b 15 f8 13 00 00    	cmp    0x13f8,%edx
 bb1:	75 ed                	jne    ba0 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 bb3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 bb6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 bbc:	bf 00 10 00 00       	mov    $0x1000,%edi
 bc1:	0f 43 fe             	cmovae %esi,%edi
 bc4:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 bc7:	89 04 24             	mov    %eax,(%esp)
 bca:	e8 3b fc ff ff       	call   80a <sbrk>
  if(p == (char*)-1)
 bcf:	83 f8 ff             	cmp    $0xffffffff,%eax
 bd2:	74 18                	je     bec <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 bd4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 bd7:	83 c0 08             	add    $0x8,%eax
 bda:	89 04 24             	mov    %eax,(%esp)
 bdd:	e8 ee fe ff ff       	call   ad0 <free>
  return freep;
 be2:	8b 15 f8 13 00 00    	mov    0x13f8,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 be8:	85 d2                	test   %edx,%edx
 bea:	75 b4                	jne    ba0 <malloc+0x40>
        return 0;
 bec:	31 c0                	xor    %eax,%eax
 bee:	eb 20                	jmp    c10 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 bf0:	89 d0                	mov    %edx,%eax
 bf2:	89 da                	mov    %ebx,%edx
 bf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 bf8:	39 fe                	cmp    %edi,%esi
 bfa:	74 1c                	je     c18 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 bfc:	29 f7                	sub    %esi,%edi
 bfe:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 c01:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 c04:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 c07:	89 15 f8 13 00 00    	mov    %edx,0x13f8
      return (void*)(p + 1);
 c0d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 c10:	83 c4 1c             	add    $0x1c,%esp
 c13:	5b                   	pop    %ebx
 c14:	5e                   	pop    %esi
 c15:	5f                   	pop    %edi
 c16:	5d                   	pop    %ebp
 c17:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 c18:	8b 08                	mov    (%eax),%ecx
 c1a:	89 0a                	mov    %ecx,(%edx)
 c1c:	eb e9                	jmp    c07 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 c1e:	c7 05 f8 13 00 00 fc 	movl   $0x13fc,0x13f8
 c25:	13 00 00 
    base.s.size = 0;
 c28:	ba fc 13 00 00       	mov    $0x13fc,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 c2d:	c7 05 fc 13 00 00 fc 	movl   $0x13fc,0x13fc
 c34:	13 00 00 
    base.s.size = 0;
 c37:	c7 05 00 14 00 00 00 	movl   $0x0,0x1400
 c3e:	00 00 00 
 c41:	e9 46 ff ff ff       	jmp    b8c <malloc+0x2c>
