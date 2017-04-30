
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
   d:	c7 44 24 04 88 0c 00 	movl   $0xc88,0x4(%esp)
  14:	00 
  15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1c:	e8 4f 07 00 00       	call   770 <printf>
  
  if (atoi(argv[1]) == 1) {
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	89 04 24             	mov    %eax,(%esp)
  27:	e8 84 05 00 00       	call   5b0 <atoi>
  2c:	83 f8 01             	cmp    $0x1,%eax
  2f:	74 30                	je     61 <main+0x61>
	  exitWait();
  } else if (atoi(argv[1]) == 2) {
  31:	8b 43 04             	mov    0x4(%ebx),%eax
  34:	89 04 24             	mov    %eax,(%esp)
  37:	e8 74 05 00 00       	call   5b0 <atoi>
  3c:	83 f8 02             	cmp    $0x2,%eax
  3f:	74 27                	je     68 <main+0x68>
	  waitPid();
  }
  /*else if (atoi(argv[1]) == 3)
	PScheduler();*/
  else {
   printf(1, "\ntype \"lab1 1\" to test exit and wait, \"lab1 2\" to test waitpid and \"lab1 3\" to test the priority scheduler \n");
  41:	c7 44 24 04 bc 0c 00 	movl   $0xcbc,0x4(%esp)
  48:	00 
  49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  50:	e8 1b 07 00 00       	call   770 <printf>
  }
    // End of test
	 exit(0);
  55:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  5c:	e8 b1 05 00 00       	call   612 <exit>
	//int PScheduler(void);

  printf(1, "\n This program tests the correctness of your lab#1\n");
  
  if (atoi(argv[1]) == 1) {
	  exitWait();
  61:	e8 1a 00 00 00       	call   80 <exitWait>
  66:	eb ed                	jmp    55 <main+0x55>
  68:	90                   	nop
  69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  } else if (atoi(argv[1]) == 2) {
	  waitPid();
  70:	e8 0b 01 00 00       	call   180 <waitPid>
  75:	eb de                	jmp    55 <main+0x55>
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <exitWait>:
    // End of test
	 exit(0);
 }
  
  
 int exitWait(void) {
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	56                   	push   %esi
  84:	53                   	push   %ebx
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  85:	31 db                	xor    %ebx,%ebx
    // End of test
	 exit(0);
 }
  
  
 int exitWait(void) {
  87:	83 ec 20             	sub    $0x20,%esp
	  int pid, ret_pid, exit_status;
	  // printf(1, "exit_status current value: %d\n", exit_status);
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
  8a:	c7 44 24 04 d8 0a 00 	movl   $0xad8,0x4(%esp)
  91:	00 
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
  92:	8d 75 f4             	lea    -0xc(%ebp),%esi
	  int pid, ret_pid, exit_status;
	  // printf(1, "exit_status current value: %d\n", exit_status);
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
  95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9c:	e8 cf 06 00 00       	call   770 <printf>

  for (i = 0; i < 2; i++) {
    pid = fork();
  a1:	e8 64 05 00 00       	call   60a <fork>
    if (pid == 0) { // only the child executed this code
  a6:	83 f8 00             	cmp    $0x0,%eax
  a9:	74 45                	je     f0 <exitWait+0x70>
  ab:	90                   	nop
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      else
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
  b0:	0f 8e a3 00 00 00    	jle    159 <exitWait+0xd9>
      ret_pid = wait(&exit_status);
  b6:	89 34 24             	mov    %esi,(%esp)
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  b9:	83 c3 01             	add    $0x1,%ebx
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
  bc:	e8 59 05 00 00       	call   61a <wait>
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
  c1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  c4:	c7 44 24 04 50 0b 00 	movl   $0xb50,0x4(%esp)
  cb:	00 
  cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d3:	89 54 24 0c          	mov    %edx,0xc(%esp)
  d7:	89 44 24 08          	mov    %eax,0x8(%esp)
  db:	e8 90 06 00 00       	call   770 <printf>
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  e0:	83 fb 02             	cmp    $0x2,%ebx
  e3:	75 bc                	jne    a1 <exitWait+0x21>
	  printf(2, "\nError using fork\n");
      exit(-1);
    }
  }
  return 0;
} 
  e5:	83 c4 20             	add    $0x20,%esp
  e8:	31 c0                	xor    %eax,%eax
  ea:	5b                   	pop    %ebx
  eb:	5e                   	pop    %esi
  ec:	5d                   	pop    %ebp
  ed:	c3                   	ret    
  ee:	66 90                	xchg   %ax,%ax
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
    pid = fork();
    if (pid == 0) { // only the child executed this code
      if (i == 0)
  f0:	85 db                	test   %ebx,%ebx
  f2:	75 34                	jne    128 <exitWait+0xa8>
      {
      printf(1, "\nThis is child with PID# %d and I will exit with status %d\n", getpid(), 0);
  f4:	e8 99 05 00 00       	call   692 <getpid>
  f9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 100:	00 
 101:	c7 44 24 04 14 0b 00 	movl   $0xb14,0x4(%esp)
 108:	00 
 109:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 110:	89 44 24 08          	mov    %eax,0x8(%esp)
 114:	e8 57 06 00 00       	call   770 <printf>
      exit(0);
 119:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 120:	e8 ed 04 00 00       	call   612 <exit>
 125:	8d 76 00             	lea    0x0(%esi),%esi
  }
      else
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
 128:	e8 65 05 00 00       	call   692 <getpid>
 12d:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
 134:	ff 
 135:	c7 44 24 04 14 0b 00 	movl   $0xb14,0x4(%esp)
 13c:	00 
 13d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 144:	89 44 24 08          	mov    %eax,0x8(%esp)
 148:	e8 23 06 00 00       	call   770 <printf>
      exit(-1);
 14d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 154:	e8 b9 04 00 00       	call   612 <exit>
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
    } else  // something went wrong with fork system call
    {  
	  printf(2, "\nError using fork\n");
 159:	c7 44 24 04 2c 0d 00 	movl   $0xd2c,0x4(%esp)
 160:	00 
 161:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 168:	e8 03 06 00 00       	call   770 <printf>
      exit(-1);
 16d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 174:	e8 99 04 00 00       	call   612 <exit>
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000180 <waitPid>:
    }
  }
  return 0;
} 

int waitPid(void){
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	56                   	push   %esi
 184:	53                   	push   %ebx
 185:	83 ec 30             	sub    $0x30,%esp
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 188:	c7 44 24 04 94 0b 00 	movl   $0xb94,0x4(%esp)
 18f:	00 
 190:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 193:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 19a:	8d 75 f8             	lea    -0x8(%ebp),%esi

int waitPid(void){
	
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 19d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1a4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 1ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1b2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 1b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 1c0:	e8 ab 05 00 00       	call   770 <printf>

  for (i = 0; i <5; i++) {
    pid_a[i] = fork();
 1c5:	e8 40 04 00 00       	call   60a <fork>
	
    if (pid_a[i] == 0) { // only the child executed this code
 1ca:	85 c0                	test   %eax,%eax
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

  for (i = 0; i <5; i++) {
    pid_a[i] = fork();
 1cc:	89 03                	mov    %eax,(%ebx)
	
    if (pid_a[i] == 0) { // only the child executed this code
 1ce:	0f 84 d5 01 00 00    	je     3a9 <waitPid+0x229>
 1d4:	83 c3 04             	add    $0x4,%ebx
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

  for (i = 0; i <5; i++) {
 1d7:	39 f3                	cmp    %esi,%ebx
 1d9:	75 ea                	jne    1c5 <waitPid+0x45>
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
      exit(0);}}
       
      sleep(5);
 1db:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 1e2:	8d 5d e0             	lea    -0x20(%ebp),%ebx
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
      exit(0);}}
       
      sleep(5);
 1e5:	e8 b8 04 00 00       	call   6a2 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
 1ea:	8b 75 f0             	mov    -0x10(%ebp),%esi
 1ed:	c7 44 24 04 10 0c 00 	movl   $0xc10,0x4(%esp)
 1f4:	00 
 1f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1fc:	89 74 24 08          	mov    %esi,0x8(%esp)
 200:	e8 6b 05 00 00       	call   770 <printf>
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 205:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 209:	89 34 24             	mov    %esi,(%esp)
 20c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 213:	00 
 214:	e8 a1 04 00 00       	call   6ba <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 219:	8b 55 e0             	mov    -0x20(%ebp),%edx
 21c:	c7 44 24 04 4c 0c 00 	movl   $0xc4c,0x4(%esp)
 223:	00 
 224:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 22b:	89 54 24 0c          	mov    %edx,0xc(%esp)
 22f:	89 44 24 08          	mov    %eax,0x8(%esp)
 233:	e8 38 05 00 00       	call   770 <printf>
      sleep(5);
 238:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 23f:	e8 5e 04 00 00       	call   6a2 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[1]);
 244:	8b 75 e8             	mov    -0x18(%ebp),%esi
 247:	c7 44 24 04 10 0c 00 	movl   $0xc10,0x4(%esp)
 24e:	00 
 24f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 256:	89 74 24 08          	mov    %esi,0x8(%esp)
 25a:	e8 11 05 00 00       	call   770 <printf>
      ret_pid = waitpid(pid_a[1], &exit_status, 0);
 25f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 263:	89 34 24             	mov    %esi,(%esp)
 266:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 26d:	00 
 26e:	e8 47 04 00 00       	call   6ba <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 273:	8b 55 e0             	mov    -0x20(%ebp),%edx
 276:	c7 44 24 04 4c 0c 00 	movl   $0xc4c,0x4(%esp)
 27d:	00 
 27e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 285:	89 54 24 0c          	mov    %edx,0xc(%esp)
 289:	89 44 24 08          	mov    %eax,0x8(%esp)
 28d:	e8 de 04 00 00       	call   770 <printf>
      sleep(5);
 292:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 299:	e8 04 04 00 00       	call   6a2 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[2]);
 29e:	8b 75 ec             	mov    -0x14(%ebp),%esi
 2a1:	c7 44 24 04 10 0c 00 	movl   $0xc10,0x4(%esp)
 2a8:	00 
 2a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2b0:	89 74 24 08          	mov    %esi,0x8(%esp)
 2b4:	e8 b7 04 00 00       	call   770 <printf>
      ret_pid = waitpid(pid_a[2], &exit_status, 0);
 2b9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 2bd:	89 34 24             	mov    %esi,(%esp)
 2c0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 2c7:	00 
 2c8:	e8 ed 03 00 00       	call   6ba <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 2cd:	8b 55 e0             	mov    -0x20(%ebp),%edx
 2d0:	c7 44 24 04 4c 0c 00 	movl   $0xc4c,0x4(%esp)
 2d7:	00 
 2d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2df:	89 54 24 0c          	mov    %edx,0xc(%esp)
 2e3:	89 44 24 08          	mov    %eax,0x8(%esp)
 2e7:	e8 84 04 00 00       	call   770 <printf>
      sleep(5);
 2ec:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 2f3:	e8 aa 03 00 00       	call   6a2 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[0]);
 2f8:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 2fb:	c7 44 24 04 10 0c 00 	movl   $0xc10,0x4(%esp)
 302:	00 
 303:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 30a:	89 74 24 08          	mov    %esi,0x8(%esp)
 30e:	e8 5d 04 00 00       	call   770 <printf>
      ret_pid = waitpid(pid_a[0], &exit_status, 0);
 313:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 317:	89 34 24             	mov    %esi,(%esp)
 31a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 321:	00 
 322:	e8 93 03 00 00       	call   6ba <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 327:	8b 55 e0             	mov    -0x20(%ebp),%edx
 32a:	c7 44 24 04 4c 0c 00 	movl   $0xc4c,0x4(%esp)
 331:	00 
 332:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 339:	89 54 24 0c          	mov    %edx,0xc(%esp)
 33d:	89 44 24 08          	mov    %eax,0x8(%esp)
 341:	e8 2a 04 00 00       	call   770 <printf>
      sleep(5);
 346:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 34d:	e8 50 03 00 00       	call   6a2 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[4]);
 352:	8b 75 f4             	mov    -0xc(%ebp),%esi
 355:	c7 44 24 04 10 0c 00 	movl   $0xc10,0x4(%esp)
 35c:	00 
 35d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 364:	89 74 24 08          	mov    %esi,0x8(%esp)
 368:	e8 03 04 00 00       	call   770 <printf>
      ret_pid = waitpid(pid_a[4], &exit_status, 0);
 36d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 371:	89 34 24             	mov    %esi,(%esp)
 374:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 37b:	00 
 37c:	e8 39 03 00 00       	call   6ba <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 381:	8b 55 e0             	mov    -0x20(%ebp),%edx
 384:	c7 44 24 04 4c 0c 00 	movl   $0xc4c,0x4(%esp)
 38b:	00 
 38c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 393:	89 54 24 0c          	mov    %edx,0xc(%esp)
 397:	89 44 24 08          	mov    %eax,0x8(%esp)
 39b:	e8 d0 03 00 00       	call   770 <printf>
      
      return 0;
  }
 3a0:	83 c4 30             	add    $0x30,%esp
 3a3:	31 c0                	xor    %eax,%eax
 3a5:	5b                   	pop    %ebx
 3a6:	5e                   	pop    %esi
 3a7:	5d                   	pop    %ebp
 3a8:	c3                   	ret    
    pid_a[i] = fork();
	
    if (pid_a[i] == 0) { // only the child executed this code
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 3a9:	e8 e4 02 00 00       	call   692 <getpid>
 3ae:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 3b5:	00 
 3b6:	c7 44 24 04 d4 0b 00 	movl   $0xbd4,0x4(%esp)
 3bd:	00 
 3be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3c5:	89 44 24 08          	mov    %eax,0x8(%esp)
 3c9:	e8 a2 03 00 00       	call   770 <printf>
      exit(0);}}
 3ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3d5:	e8 38 02 00 00       	call   612 <exit>
 3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003e0 <PScheduler>:
      
      return 0;
  }
      
      
int PScheduler(void){
 3e0:	55                   	push   %ebp
  }
  
	*/		
	return 0;
  
}
 3e1:	31 c0                	xor    %eax,%eax
      
      return 0;
  }
      
      
int PScheduler(void){
 3e3:	89 e5                	mov    %esp,%ebp
  }
  
	*/		
	return 0;
  
}
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    
 3e7:	66 90                	xchg   %ax,%ax
 3e9:	66 90                	xchg   %ax,%ax
 3eb:	66 90                	xchg   %ax,%ax
 3ed:	66 90                	xchg   %ax,%ax
 3ef:	90                   	nop

000003f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	8b 45 08             	mov    0x8(%ebp),%eax
 3f6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3f9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3fa:	89 c2                	mov    %eax,%edx
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 400:	83 c1 01             	add    $0x1,%ecx
 403:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 407:	83 c2 01             	add    $0x1,%edx
 40a:	84 db                	test   %bl,%bl
 40c:	88 5a ff             	mov    %bl,-0x1(%edx)
 40f:	75 ef                	jne    400 <strcpy+0x10>
    ;
  return os;
}
 411:	5b                   	pop    %ebx
 412:	5d                   	pop    %ebp
 413:	c3                   	ret    
 414:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 41a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000420 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 55 08             	mov    0x8(%ebp),%edx
 426:	53                   	push   %ebx
 427:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 42a:	0f b6 02             	movzbl (%edx),%eax
 42d:	84 c0                	test   %al,%al
 42f:	74 2d                	je     45e <strcmp+0x3e>
 431:	0f b6 19             	movzbl (%ecx),%ebx
 434:	38 d8                	cmp    %bl,%al
 436:	74 0e                	je     446 <strcmp+0x26>
 438:	eb 2b                	jmp    465 <strcmp+0x45>
 43a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 440:	38 c8                	cmp    %cl,%al
 442:	75 15                	jne    459 <strcmp+0x39>
    p++, q++;
 444:	89 d9                	mov    %ebx,%ecx
 446:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 449:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 44c:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 44f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 453:	84 c0                	test   %al,%al
 455:	75 e9                	jne    440 <strcmp+0x20>
 457:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 459:	29 c8                	sub    %ecx,%eax
}
 45b:	5b                   	pop    %ebx
 45c:	5d                   	pop    %ebp
 45d:	c3                   	ret    
 45e:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 461:	31 c0                	xor    %eax,%eax
 463:	eb f4                	jmp    459 <strcmp+0x39>
 465:	0f b6 cb             	movzbl %bl,%ecx
 468:	eb ef                	jmp    459 <strcmp+0x39>
 46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000470 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 476:	80 39 00             	cmpb   $0x0,(%ecx)
 479:	74 12                	je     48d <strlen+0x1d>
 47b:	31 d2                	xor    %edx,%edx
 47d:	8d 76 00             	lea    0x0(%esi),%esi
 480:	83 c2 01             	add    $0x1,%edx
 483:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 487:	89 d0                	mov    %edx,%eax
 489:	75 f5                	jne    480 <strlen+0x10>
    ;
  return n;
}
 48b:	5d                   	pop    %ebp
 48c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 48d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 48f:	5d                   	pop    %ebp
 490:	c3                   	ret    
 491:	eb 0d                	jmp    4a0 <memset>
 493:	90                   	nop
 494:	90                   	nop
 495:	90                   	nop
 496:	90                   	nop
 497:	90                   	nop
 498:	90                   	nop
 499:	90                   	nop
 49a:	90                   	nop
 49b:	90                   	nop
 49c:	90                   	nop
 49d:	90                   	nop
 49e:	90                   	nop
 49f:	90                   	nop

000004a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	8b 55 08             	mov    0x8(%ebp),%edx
 4a6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ad:	89 d7                	mov    %edx,%edi
 4af:	fc                   	cld    
 4b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4b2:	89 d0                	mov    %edx,%eax
 4b4:	5f                   	pop    %edi
 4b5:	5d                   	pop    %ebp
 4b6:	c3                   	ret    
 4b7:	89 f6                	mov    %esi,%esi
 4b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004c0 <strchr>:

char*
strchr(const char *s, char c)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	8b 45 08             	mov    0x8(%ebp),%eax
 4c6:	53                   	push   %ebx
 4c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 4ca:	0f b6 18             	movzbl (%eax),%ebx
 4cd:	84 db                	test   %bl,%bl
 4cf:	74 1d                	je     4ee <strchr+0x2e>
    if(*s == c)
 4d1:	38 d3                	cmp    %dl,%bl
 4d3:	89 d1                	mov    %edx,%ecx
 4d5:	75 0d                	jne    4e4 <strchr+0x24>
 4d7:	eb 17                	jmp    4f0 <strchr+0x30>
 4d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4e0:	38 ca                	cmp    %cl,%dl
 4e2:	74 0c                	je     4f0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 4e4:	83 c0 01             	add    $0x1,%eax
 4e7:	0f b6 10             	movzbl (%eax),%edx
 4ea:	84 d2                	test   %dl,%dl
 4ec:	75 f2                	jne    4e0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 4ee:	31 c0                	xor    %eax,%eax
}
 4f0:	5b                   	pop    %ebx
 4f1:	5d                   	pop    %ebp
 4f2:	c3                   	ret    
 4f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000500 <gets>:

char*
gets(char *buf, int max)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 505:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 507:	53                   	push   %ebx
 508:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 50b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 50e:	eb 31                	jmp    541 <gets+0x41>
    cc = read(0, &c, 1);
 510:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 517:	00 
 518:	89 7c 24 04          	mov    %edi,0x4(%esp)
 51c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 523:	e8 02 01 00 00       	call   62a <read>
    if(cc < 1)
 528:	85 c0                	test   %eax,%eax
 52a:	7e 1d                	jle    549 <gets+0x49>
      break;
    buf[i++] = c;
 52c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 530:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 532:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 535:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 537:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 53b:	74 0c                	je     549 <gets+0x49>
 53d:	3c 0a                	cmp    $0xa,%al
 53f:	74 08                	je     549 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 541:	8d 5e 01             	lea    0x1(%esi),%ebx
 544:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 547:	7c c7                	jl     510 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 549:	8b 45 08             	mov    0x8(%ebp),%eax
 54c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 550:	83 c4 2c             	add    $0x2c,%esp
 553:	5b                   	pop    %ebx
 554:	5e                   	pop    %esi
 555:	5f                   	pop    %edi
 556:	5d                   	pop    %ebp
 557:	c3                   	ret    
 558:	90                   	nop
 559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000560 <stat>:

int
stat(char *n, struct stat *st)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	56                   	push   %esi
 564:	53                   	push   %ebx
 565:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 568:	8b 45 08             	mov    0x8(%ebp),%eax
 56b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 572:	00 
 573:	89 04 24             	mov    %eax,(%esp)
 576:	e8 d7 00 00 00       	call   652 <open>
  if(fd < 0)
 57b:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 57d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 57f:	78 27                	js     5a8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 581:	8b 45 0c             	mov    0xc(%ebp),%eax
 584:	89 1c 24             	mov    %ebx,(%esp)
 587:	89 44 24 04          	mov    %eax,0x4(%esp)
 58b:	e8 da 00 00 00       	call   66a <fstat>
  close(fd);
 590:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 593:	89 c6                	mov    %eax,%esi
  close(fd);
 595:	e8 a0 00 00 00       	call   63a <close>
  return r;
 59a:	89 f0                	mov    %esi,%eax
}
 59c:	83 c4 10             	add    $0x10,%esp
 59f:	5b                   	pop    %ebx
 5a0:	5e                   	pop    %esi
 5a1:	5d                   	pop    %ebp
 5a2:	c3                   	ret    
 5a3:	90                   	nop
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 5a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 5ad:	eb ed                	jmp    59c <stat+0x3c>
 5af:	90                   	nop

000005b0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 5b6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5b7:	0f be 11             	movsbl (%ecx),%edx
 5ba:	8d 42 d0             	lea    -0x30(%edx),%eax
 5bd:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
 5bf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 5c4:	77 17                	ja     5dd <atoi+0x2d>
 5c6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 5c8:	83 c1 01             	add    $0x1,%ecx
 5cb:	8d 04 80             	lea    (%eax,%eax,4),%eax
 5ce:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5d2:	0f be 11             	movsbl (%ecx),%edx
 5d5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 5d8:	80 fb 09             	cmp    $0x9,%bl
 5db:	76 eb                	jbe    5c8 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 5dd:	5b                   	pop    %ebx
 5de:	5d                   	pop    %ebp
 5df:	c3                   	ret    

000005e0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 5e0:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5e1:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 5e3:	89 e5                	mov    %esp,%ebp
 5e5:	56                   	push   %esi
 5e6:	8b 45 08             	mov    0x8(%ebp),%eax
 5e9:	53                   	push   %ebx
 5ea:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5ed:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5f0:	85 db                	test   %ebx,%ebx
 5f2:	7e 12                	jle    606 <memmove+0x26>
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 5f8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 5fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 5ff:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 602:	39 da                	cmp    %ebx,%edx
 604:	75 f2                	jne    5f8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 606:	5b                   	pop    %ebx
 607:	5e                   	pop    %esi
 608:	5d                   	pop    %ebp
 609:	c3                   	ret    

0000060a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 60a:	b8 01 00 00 00       	mov    $0x1,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <exit>:
SYSCALL(exit)
 612:	b8 02 00 00 00       	mov    $0x2,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <wait>:
SYSCALL(wait)
 61a:	b8 03 00 00 00       	mov    $0x3,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <pipe>:
SYSCALL(pipe)
 622:	b8 04 00 00 00       	mov    $0x4,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <read>:
SYSCALL(read)
 62a:	b8 05 00 00 00       	mov    $0x5,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <write>:
SYSCALL(write)
 632:	b8 10 00 00 00       	mov    $0x10,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <close>:
SYSCALL(close)
 63a:	b8 15 00 00 00       	mov    $0x15,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <kill>:
SYSCALL(kill)
 642:	b8 06 00 00 00       	mov    $0x6,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <exec>:
SYSCALL(exec)
 64a:	b8 07 00 00 00       	mov    $0x7,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <open>:
SYSCALL(open)
 652:	b8 0f 00 00 00       	mov    $0xf,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <mknod>:
SYSCALL(mknod)
 65a:	b8 11 00 00 00       	mov    $0x11,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <unlink>:
SYSCALL(unlink)
 662:	b8 12 00 00 00       	mov    $0x12,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <fstat>:
SYSCALL(fstat)
 66a:	b8 08 00 00 00       	mov    $0x8,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <link>:
SYSCALL(link)
 672:	b8 13 00 00 00       	mov    $0x13,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <mkdir>:
SYSCALL(mkdir)
 67a:	b8 14 00 00 00       	mov    $0x14,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    

00000682 <chdir>:
SYSCALL(chdir)
 682:	b8 09 00 00 00       	mov    $0x9,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret    

0000068a <dup>:
SYSCALL(dup)
 68a:	b8 0a 00 00 00       	mov    $0xa,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret    

00000692 <getpid>:
SYSCALL(getpid)
 692:	b8 0b 00 00 00       	mov    $0xb,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret    

0000069a <sbrk>:
SYSCALL(sbrk)
 69a:	b8 0c 00 00 00       	mov    $0xc,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret    

000006a2 <sleep>:
SYSCALL(sleep)
 6a2:	b8 0d 00 00 00       	mov    $0xd,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret    

000006aa <uptime>:
SYSCALL(uptime)
 6aa:	b8 0e 00 00 00       	mov    $0xe,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    

000006b2 <hello>:
SYSCALL(hello)		// MOD - 4/11 : WEEK 2 EXERCISE
 6b2:	b8 16 00 00 00       	mov    $0x16,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <waitpid>:
SYSCALL(waitpid)	// MOD - 4/29 : WEEK 4 EXERCISE
 6ba:	b8 17 00 00 00       	mov    $0x17,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    
 6c2:	66 90                	xchg   %ax,%ax
 6c4:	66 90                	xchg   %ax,%ax
 6c6:	66 90                	xchg   %ax,%ax
 6c8:	66 90                	xchg   %ax,%ax
 6ca:	66 90                	xchg   %ax,%ax
 6cc:	66 90                	xchg   %ax,%ax
 6ce:	66 90                	xchg   %ax,%ax

000006d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	89 c6                	mov    %eax,%esi
 6d7:	53                   	push   %ebx
 6d8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6de:	85 db                	test   %ebx,%ebx
 6e0:	74 09                	je     6eb <printint+0x1b>
 6e2:	89 d0                	mov    %edx,%eax
 6e4:	c1 e8 1f             	shr    $0x1f,%eax
 6e7:	84 c0                	test   %al,%al
 6e9:	75 75                	jne    760 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6eb:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6ed:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6f4:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 6f7:	31 ff                	xor    %edi,%edi
 6f9:	89 ce                	mov    %ecx,%esi
 6fb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 6fe:	eb 02                	jmp    702 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 700:	89 cf                	mov    %ecx,%edi
 702:	31 d2                	xor    %edx,%edx
 704:	f7 f6                	div    %esi
 706:	8d 4f 01             	lea    0x1(%edi),%ecx
 709:	0f b6 92 46 0d 00 00 	movzbl 0xd46(%edx),%edx
  }while((x /= base) != 0);
 710:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 712:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 715:	75 e9                	jne    700 <printint+0x30>
  if(neg)
 717:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 71a:	89 c8                	mov    %ecx,%eax
 71c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
 71f:	85 d2                	test   %edx,%edx
 721:	74 08                	je     72b <printint+0x5b>
    buf[i++] = '-';
 723:	8d 4f 02             	lea    0x2(%edi),%ecx
 726:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 72b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 72e:	66 90                	xchg   %ax,%ax
 730:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 735:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 738:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 73f:	00 
 740:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 744:	89 34 24             	mov    %esi,(%esp)
 747:	88 45 d7             	mov    %al,-0x29(%ebp)
 74a:	e8 e3 fe ff ff       	call   632 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 74f:	83 ff ff             	cmp    $0xffffffff,%edi
 752:	75 dc                	jne    730 <printint+0x60>
    putc(fd, buf[i]);
}
 754:	83 c4 4c             	add    $0x4c,%esp
 757:	5b                   	pop    %ebx
 758:	5e                   	pop    %esi
 759:	5f                   	pop    %edi
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 760:	89 d0                	mov    %edx,%eax
 762:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 764:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 76b:	eb 87                	jmp    6f4 <printint+0x24>
 76d:	8d 76 00             	lea    0x0(%esi),%esi

00000770 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 774:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 776:	56                   	push   %esi
 777:	53                   	push   %ebx
 778:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 77b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 77e:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 781:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 784:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 787:	0f b6 13             	movzbl (%ebx),%edx
 78a:	83 c3 01             	add    $0x1,%ebx
 78d:	84 d2                	test   %dl,%dl
 78f:	75 39                	jne    7ca <printf+0x5a>
 791:	e9 c2 00 00 00       	jmp    858 <printf+0xe8>
 796:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 798:	83 fa 25             	cmp    $0x25,%edx
 79b:	0f 84 bf 00 00 00    	je     860 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7a1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 7a4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7ab:	00 
 7ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b0:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7b3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7b6:	e8 77 fe ff ff       	call   632 <write>
 7bb:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7be:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 7c2:	84 d2                	test   %dl,%dl
 7c4:	0f 84 8e 00 00 00    	je     858 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
 7ca:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 7cc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 7cf:	74 c7                	je     798 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 7d1:	83 ff 25             	cmp    $0x25,%edi
 7d4:	75 e5                	jne    7bb <printf+0x4b>
      if(c == 'd'){
 7d6:	83 fa 64             	cmp    $0x64,%edx
 7d9:	0f 84 31 01 00 00    	je     910 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7df:	25 f7 00 00 00       	and    $0xf7,%eax
 7e4:	83 f8 70             	cmp    $0x70,%eax
 7e7:	0f 84 83 00 00 00    	je     870 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7ed:	83 fa 73             	cmp    $0x73,%edx
 7f0:	0f 84 a2 00 00 00    	je     898 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7f6:	83 fa 63             	cmp    $0x63,%edx
 7f9:	0f 84 35 01 00 00    	je     934 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7ff:	83 fa 25             	cmp    $0x25,%edx
 802:	0f 84 e0 00 00 00    	je     8e8 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 808:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 80b:	83 c3 01             	add    $0x1,%ebx
 80e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 815:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 816:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 818:	89 44 24 04          	mov    %eax,0x4(%esp)
 81c:	89 34 24             	mov    %esi,(%esp)
 81f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 822:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 826:	e8 07 fe ff ff       	call   632 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 82b:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 82e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 831:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 838:	00 
 839:	89 44 24 04          	mov    %eax,0x4(%esp)
 83d:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 840:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 843:	e8 ea fd ff ff       	call   632 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 848:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 84c:	84 d2                	test   %dl,%dl
 84e:	0f 85 76 ff ff ff    	jne    7ca <printf+0x5a>
 854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 858:	83 c4 3c             	add    $0x3c,%esp
 85b:	5b                   	pop    %ebx
 85c:	5e                   	pop    %esi
 85d:	5f                   	pop    %edi
 85e:	5d                   	pop    %ebp
 85f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 860:	bf 25 00 00 00       	mov    $0x25,%edi
 865:	e9 51 ff ff ff       	jmp    7bb <printf+0x4b>
 86a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 870:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 873:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 878:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 87a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 881:	8b 10                	mov    (%eax),%edx
 883:	89 f0                	mov    %esi,%eax
 885:	e8 46 fe ff ff       	call   6d0 <printint>
        ap++;
 88a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 88e:	e9 28 ff ff ff       	jmp    7bb <printf+0x4b>
 893:	90                   	nop
 894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 898:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 89b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 89f:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
 8a1:	b8 3f 0d 00 00       	mov    $0xd3f,%eax
 8a6:	85 ff                	test   %edi,%edi
 8a8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 8ab:	0f b6 07             	movzbl (%edi),%eax
 8ae:	84 c0                	test   %al,%al
 8b0:	74 2a                	je     8dc <printf+0x16c>
 8b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8b8:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8bb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 8be:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8c1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8c8:	00 
 8c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8cd:	89 34 24             	mov    %esi,(%esp)
 8d0:	e8 5d fd ff ff       	call   632 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 8d5:	0f b6 07             	movzbl (%edi),%eax
 8d8:	84 c0                	test   %al,%al
 8da:	75 dc                	jne    8b8 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8dc:	31 ff                	xor    %edi,%edi
 8de:	e9 d8 fe ff ff       	jmp    7bb <printf+0x4b>
 8e3:	90                   	nop
 8e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8e8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8eb:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8ed:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8f4:	00 
 8f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8f9:	89 34 24             	mov    %esi,(%esp)
 8fc:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 900:	e8 2d fd ff ff       	call   632 <write>
 905:	e9 b1 fe ff ff       	jmp    7bb <printf+0x4b>
 90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 910:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 913:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 918:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 91b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 922:	8b 10                	mov    (%eax),%edx
 924:	89 f0                	mov    %esi,%eax
 926:	e8 a5 fd ff ff       	call   6d0 <printint>
        ap++;
 92b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 92f:	e9 87 fe ff ff       	jmp    7bb <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 934:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 937:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 939:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 93b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 942:	00 
 943:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 946:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 949:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 94c:	89 44 24 04          	mov    %eax,0x4(%esp)
 950:	e8 dd fc ff ff       	call   632 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 955:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 959:	e9 5d fe ff ff       	jmp    7bb <printf+0x4b>
 95e:	66 90                	xchg   %ax,%ax

00000960 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 960:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 961:	a1 34 10 00 00       	mov    0x1034,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 966:	89 e5                	mov    %esp,%ebp
 968:	57                   	push   %edi
 969:	56                   	push   %esi
 96a:	53                   	push   %ebx
 96b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 96e:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 970:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 973:	39 d0                	cmp    %edx,%eax
 975:	72 11                	jb     988 <free+0x28>
 977:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 978:	39 c8                	cmp    %ecx,%eax
 97a:	72 04                	jb     980 <free+0x20>
 97c:	39 ca                	cmp    %ecx,%edx
 97e:	72 10                	jb     990 <free+0x30>
 980:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 982:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 984:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 986:	73 f0                	jae    978 <free+0x18>
 988:	39 ca                	cmp    %ecx,%edx
 98a:	72 04                	jb     990 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 98c:	39 c8                	cmp    %ecx,%eax
 98e:	72 f0                	jb     980 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 990:	8b 73 fc             	mov    -0x4(%ebx),%esi
 993:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 996:	39 cf                	cmp    %ecx,%edi
 998:	74 1e                	je     9b8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 99a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 99d:	8b 48 04             	mov    0x4(%eax),%ecx
 9a0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 9a3:	39 f2                	cmp    %esi,%edx
 9a5:	74 28                	je     9cf <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9a7:	89 10                	mov    %edx,(%eax)
  freep = p;
 9a9:	a3 34 10 00 00       	mov    %eax,0x1034
}
 9ae:	5b                   	pop    %ebx
 9af:	5e                   	pop    %esi
 9b0:	5f                   	pop    %edi
 9b1:	5d                   	pop    %ebp
 9b2:	c3                   	ret    
 9b3:	90                   	nop
 9b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 9b8:	03 71 04             	add    0x4(%ecx),%esi
 9bb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9be:	8b 08                	mov    (%eax),%ecx
 9c0:	8b 09                	mov    (%ecx),%ecx
 9c2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9c5:	8b 48 04             	mov    0x4(%eax),%ecx
 9c8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 9cb:	39 f2                	cmp    %esi,%edx
 9cd:	75 d8                	jne    9a7 <free+0x47>
    p->s.size += bp->s.size;
 9cf:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 9d2:	a3 34 10 00 00       	mov    %eax,0x1034
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 9d7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9da:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9dd:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9df:	5b                   	pop    %ebx
 9e0:	5e                   	pop    %esi
 9e1:	5f                   	pop    %edi
 9e2:	5d                   	pop    %ebp
 9e3:	c3                   	ret    
 9e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 9ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000009f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
 9f3:	57                   	push   %edi
 9f4:	56                   	push   %esi
 9f5:	53                   	push   %ebx
 9f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9fc:	8b 1d 34 10 00 00    	mov    0x1034,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a02:	8d 48 07             	lea    0x7(%eax),%ecx
 a05:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 a08:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a0a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 a0d:	0f 84 9b 00 00 00    	je     aae <malloc+0xbe>
 a13:	8b 13                	mov    (%ebx),%edx
 a15:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a18:	39 fe                	cmp    %edi,%esi
 a1a:	76 64                	jbe    a80 <malloc+0x90>
 a1c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 a23:	bb 00 80 00 00       	mov    $0x8000,%ebx
 a28:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a2b:	eb 0e                	jmp    a3b <malloc+0x4b>
 a2d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a30:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a32:	8b 78 04             	mov    0x4(%eax),%edi
 a35:	39 fe                	cmp    %edi,%esi
 a37:	76 4f                	jbe    a88 <malloc+0x98>
 a39:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a3b:	3b 15 34 10 00 00    	cmp    0x1034,%edx
 a41:	75 ed                	jne    a30 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 a43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a46:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 a4c:	bf 00 10 00 00       	mov    $0x1000,%edi
 a51:	0f 43 fe             	cmovae %esi,%edi
 a54:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 a57:	89 04 24             	mov    %eax,(%esp)
 a5a:	e8 3b fc ff ff       	call   69a <sbrk>
  if(p == (char*)-1)
 a5f:	83 f8 ff             	cmp    $0xffffffff,%eax
 a62:	74 18                	je     a7c <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a64:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 a67:	83 c0 08             	add    $0x8,%eax
 a6a:	89 04 24             	mov    %eax,(%esp)
 a6d:	e8 ee fe ff ff       	call   960 <free>
  return freep;
 a72:	8b 15 34 10 00 00    	mov    0x1034,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 a78:	85 d2                	test   %edx,%edx
 a7a:	75 b4                	jne    a30 <malloc+0x40>
        return 0;
 a7c:	31 c0                	xor    %eax,%eax
 a7e:	eb 20                	jmp    aa0 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a80:	89 d0                	mov    %edx,%eax
 a82:	89 da                	mov    %ebx,%edx
 a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 a88:	39 fe                	cmp    %edi,%esi
 a8a:	74 1c                	je     aa8 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a8c:	29 f7                	sub    %esi,%edi
 a8e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 a91:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 a94:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 a97:	89 15 34 10 00 00    	mov    %edx,0x1034
      return (void*)(p + 1);
 a9d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 aa0:	83 c4 1c             	add    $0x1c,%esp
 aa3:	5b                   	pop    %ebx
 aa4:	5e                   	pop    %esi
 aa5:	5f                   	pop    %edi
 aa6:	5d                   	pop    %ebp
 aa7:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 aa8:	8b 08                	mov    (%eax),%ecx
 aaa:	89 0a                	mov    %ecx,(%edx)
 aac:	eb e9                	jmp    a97 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 aae:	c7 05 34 10 00 00 38 	movl   $0x1038,0x1034
 ab5:	10 00 00 
    base.s.size = 0;
 ab8:	ba 38 10 00 00       	mov    $0x1038,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 abd:	c7 05 38 10 00 00 38 	movl   $0x1038,0x1038
 ac4:	10 00 00 
    base.s.size = 0;
 ac7:	c7 05 3c 10 00 00 00 	movl   $0x0,0x103c
 ace:	00 00 00 
 ad1:	e9 46 ff ff ff       	jmp    a1c <malloc+0x2c>
