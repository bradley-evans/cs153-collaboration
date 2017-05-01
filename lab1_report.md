# Lab Report 1
April 30th, 2017 <br/>
Bradley Evans and Dharti Tarapara<br/>
CS153 Operating Systems<br/>

## Part 1: Hello World

*Implementing a hello world function and executing it in the xv6 shell.*

The `wait()` call is a straightforward function that force the process that calls it to halt operation until one of its children completes execution (until the child exits). The function is `int wait(int)` where the parameter is a pointer to an integer and the function returns the pid of the completed process.

The behavior of wait depends on if the process invoking it has children. If there are children, the invoking process is blocked until a child process belonging to it exists. Otherwise, `wait()` does nothing at all.

The purpose of this section is to familiarize ourselves with the implementation of a new system call. In our present case, we implement a simple *hello world* function that can be executed with the `hello` command from within the xv6 shell.

To make this happen, we edit the following files in the following ways:

- `defs.h`
	- A function prototype is added here.
	- `void hello(void);`
- `syscall.h`
	- Define a system call here.
	- `#define SYS_hello  22`
- `user.h`
	- Define a function prototype.
	- `int hello(void);`
- `proc.c`
	- Define the actual hello function.
	- `void 
    	hello(void) {
      	cprintf("hello!\n");
    	}`
- `sysproc.c`
	- Define the system call here. This will simply call our `hello()` program in `proc.c`.
	- `int sys_hello(void) {
  		hello();
  		return 0;
		}`
- `hello.c`
	- This is added to the root directory.
		```
		#include "types.h"
		#include "stat.h"
		#include "user.h"
		
		int main(int argc, char * argv[]) {
		  hello();
		  exit(-1);
		
		  return 0;
		} 
		```

Implemented in this way, the user can now execute a `hello` from the command line. This will trigger a system call, which will eventually call `hello()` from `proc.c`, displaying the hello world message.

## Part 2: Tracing a Wait

For this portion, I will run `make qemu-nox-gdb` on one terminal window (Terminal A) and monitor `gdb` in another (Terminal B). Once A is waiting for `gdb`, I initiate the debugger in B and set `break wait` in order to set a breakpoint for the `wait()` system call.

The breakpoint is triggered when I run `hello` in A:

```
Breakpoint 1, wait () at proc.c:233
233     {
```

Now I'll tell `gdb` to step through this wait call with `u`.

After the wait breakpoint, the program will then `acquire(&ptable.lock);` halting program execution while `wait()` looks for a child process to exit.
```
Breakpoint 1, wait () at proc.c:233
233     {
(gdb) u
=> 0x80103e95 <wait+5>: sub    $0xc,%esp
237       acquire(&ptable.lock);
```
Wait then tries to decide if the program has any children that need to run to completion.
```
=> 0x80103eab <wait+27>:        xor    %edx,%edx
240         havekids = 0;
```
It starts looking for the next program that can run. Specifically, for children of the running process. Hello doesn't have children, so this will be easy. It'll just move right along and do nothing.
```
=> 0x80103ead <wait+29>:        mov    $0x80112dd4,%ebx
241         for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
```
It makes sure the next process isn't a zombie.
```
=> 0x80103ec8 <wait+56>:        cmpl   $0x5,0xc(%ebx)
245           if(p->state == ZOMBIE){
```
Then it proceeds. If the process doesn't have kids, it kills the process, goes to sleep.
```
=> 0x80103ece <wait+62>:        sub    $0xffffff80,%ebx
241         for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
(gdb) u
=> 0x80103ed1 <wait+65>:        mov    $0x1,%edx
244           havekids = 1;
(gdb) u
=> 0x80103ed6 <wait+70>:        cmp    $0x80114dd4,%ebx
241         for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
(gdb) u
=> 0x80103ee0 <wait+80>:        test   %edx,%edx
262         if(!havekids || proc->killed){
(gdb) u
=> 0x80103eeb <wait+91>:        sub    $0x8,%esp
268         sleep(proc, &ptable.lock);  //DOC: wait-sleep
```
Wait releases the lock.
```
=> 0x80103eeb <wait+91>:        sub    $0x8,%esp
268         sleep(proc, &ptable.lock);  //DOC: wait-sleep
(gdb) u
=> 0x80103ef9 <wait+105>:       add    $0x10,%esp
269       }
(gdb) u
=> 0x80103efe <wait+110>:       sub    $0xc,%esp
248             kfree(p->kstack);
(gdb) u
=> 0x80103f04 <wait+116>:       mov    0x10(%ebx),%esi
247             pid = p->pid;


# snip #

=> 0x80103f35 <wait+165>:       movl   $0x0,0xc(%ebx)
255             p->state = UNUSED;
(gdb) u
=> 0x80103f3c <wait+172>:       movl   $0x80112da0,(%esp)
256             release(&ptable.lock);
```
And we reach the end of the wait call and return to the shell.