# Lab Report 1
April 30th, 2017 <br/>
Bradley Evans and Dharti Tarapara<br/>
CS153 Operating Systems<br/>

## Part 1: Hello World
*Implementing a hello world function and executing it in the xv6 shell.*

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