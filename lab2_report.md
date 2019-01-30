# Lab Report 1
April 30th, 2017 <br/>
Bradley Evans and Dharti Tarapara<br/>
CS153 Operating Systems<br/>

## Part 1: Finding Physical Addresses from Virtual

It turns out this was the trickiest part of the lab. We are given a virtual address and knowledge of how xv6 does addressing, and need to derive the physical address from there. We eventually accomplished this by way of the following code in `proc.c`.

// show snippets or list line numbers in other files where v2p and sys_v2p were declred perhaps?

```
void
v2p(int virtual, int* physical) 
{

  unsigned short int dir = virtual>>22;
  unsigned short int table = (virtual>>12)&0x3ff;
  unsigned short int offset = virtual & 0xfff;
  
  pde_t *pde;
  pte_t *pgtab;
  
  // Find the page directory entry.
  pde = &proc->pgdir[PDX(virtual)];
  // Use the page directory entry to find the page table entry.
  pgtab = (pte_t*)V2P(PTE_ADDR(*pde));
  
  cprintf("Virtual Address: dir:0x%x table:0x%x offset:0x%x \n",dir,table,offset);
  cprintf("Page Table Address: 0x%x \n",*pgtab);
  
  *physical = (PTE_ADDR(pgtab[PTX(virtual)])) | (virtual & 0xFFF);
  cprintf("Physical Address: 0x%x \n",*physical);

}
```

So, what does this do? We refer to figure 2-1 of the x86 textbook.

![](http://i.imgur.com/R5Rve8v.png)

First we read in the virtual address `virtual`. 

To derive the page directory entry `pde`, we reference the processes' page directory `proc->pgdir` with the first 10 bits of `virtual`. The mask `PDX(virtual)` strips out the first ten bits for us, providing the index within `proc->pgdir` that gives up the page directory entry we're looking for.

Now we need to find the appropriate page table entry. The first 20 bits of `pde` are the PPN (physical page number), and the middle 10 bits of `virtual` refer to the page table we're interested in. 

We set `pgtab` by taking a mask of the first 20 bits of `pde` then casting this as a pointer. 

Finally, we set `physical` to the PPN found in `pgtab` and the offset bits from the original `virtual` address.

We had to make use of an number of functions in `memlayout.h`, especially `V2P()`, `PTE_ADDR()`, and so on to make the functionality happen without writing a lot of unnecessary code.

## Part 2: Dereferencing Null Pointers

To get this done, we had to create a reserved page of data that began at memory address zero and ensure that memory addressing began at this new "start point" (one page after address 0). Any attempt to access that first page would then produce an error. In `exec.c`, we reserve this space with the following code snippet:

```
if((sz = allocuvm(pgdir, sz, PGSIZE)) == 0)
  goto bad; 	 
```
// Maybe show an example of a line or list line numbers? Just a suggestion, just so he knows where to look
A few other modifications needed to be made. For example, a few places in `syscall.c` that would throw an error if `addr >= p->sz` were modified to also throw an error if `addr == 0`.

xv6 now throws errors when a null pointer is dereferenced.

## Part 3: Stack Rearrangement

(IMPLEMENTED ON SEPARATE COPY OF XV6)
The goal for this part of the lab is to rearrange the `xv6` address space to mimic Linux.

`memlayout.h`

In this file, we defined USERTOP. 

```
#define USERTOP 0xDD4E000     // line 3
```

`syscall.c`

Next, we made sure that the current process' address stayed within the USERTOP threshold by replacing every instance of `proc-sz` with `USERTOP` or `KERNBASE`.

```
int
fetchint(uint addr, int *ip)
{
  if(addr >= USERTOP || addr+4 >= USERTOP)      // line 20
    return -1;
  *ip = *(int*)(addr);
  return 0;
}

int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= USERTOP)     // line 34
    return -1;
  *pp = (char*)addr;
  ep = (char*)USERTOP;      // line 37
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
  return -1;
}

int
argptr(int n, char **pp, int size)
{
  int i;
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= KERNBASE || (uint)i+size > KERNBASE)      // line 60
    return -1;
  *pp = (char*)i;
  return 0;
}
```

`proc.h`

Then in this file, we defined the variable `stackTop` in `struct proc`. This variable will hold the top of the stack.

```
uint stackTop;      // line 55
```

`exec.c`

Here, we then defined another variable also called `stackTop`to use internally.

```
uint stackTop;      // line 15
```

We allocated an inacessible page and and a second page for the user stack.

```
stackTop = USERTOP - (2 * PGSIZE);      // lines 67 - 72
  if ((sp = allocuvm(pgdir, stackTop, USERTOP)) == 0) {
    cprintf("exec.c 69\n");
    goto bad;
  }
  clearpteu(pgdir, (char*)stackTop);
```

We also set the process' `stackTop` equal to the internal `stackTop` value.

```
proc->stackTop = stackTop;      // line 109
```

`proc.c`

In this file, we set the process' initial `stackTop` value to zero in the `userinit` function.

```
p->stackTop = 0;      // line 93
```

Next, we added code to copy the process state from `p` into the new process with the new variable `proc->stackTop`.

```
// Copy process state from p
if((np->pgdir = copyuvm(proc->pgdir, proc->sz, proc->stackTop)) == 0){      // line 153 - 162
  kfree(np->kstack);
  np->kstack = 0;
  np->state = UNUSED;
  return -1;
}
np->sz = proc->sz;
np->parent = proc;
np->stackTop = proc->stackTop;      // line 161
*np->tf = *proc->tf;
```

`trap.c`

Here, we added a case for page faults when the OS kills a process.

```
case T_PGFLT:     // line 80 - 88
	if(growstack(proc->pgdir, proc->tf->esp, proc->stackTop) == 0)
		break;
	cprintf("pid %d %s: page fault on %d eip 0x%x ",proc->pid, proc->name, cpu->apicid, tf->eip);
	cprintf("stack 0x%x sz 0x%x addr 0x%x\n", proc->stackTop, proc->sz, rcr2());
	if(proc->tf->esp > proc->sz)
		deallocuvm(proc->pgdir, USERTOP, proc->stackTop);
	proc->killed = 1;
	break;
```

`vm.c`

In this file, we wrote a function `growstack` to grow the stack based on whether memory is already present or new memory needs to be allocated.

```
int     // line 391 - 413
growstack(pde_t *pgdir, uint sp, uint stackTop)
{
  pte_t *pte;
	uint newTop = stackTop - PGSIZE;
  cprintf("vm.c 392\n");
	if (sp > (stackTop + PGSIZE))
		return -1;


	// don't allocate new memory if already present
	if((pte = walkpgdir(pgdir, (void *) newTop, 1)) == 0)
		return -1;
	if(*pte & PTE_P)
		return -1;
	if(allocuvm(pgdir, newTop, stackTop) == 0)	
		return -1;

	proc->stackTop = proc->stackTop - PGSIZE;
	setpteu(proc->pgdir, (char *)(proc->stackTop + PGSIZE));
	clearpteu(proc->pgdir, (char *)proc->stackTop);
	return 0;
}
```

We also needed a helper function `setpteu` to set PTE_U on a page.

```
void      // line 320 - 330
setpteu(pde_t *pgdir, char *uva)
{
  cprintf("vm.c 323\n");
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("setpteu");
  *pte |= PTE_U;
}
```

Then, we modified `copyuvm` to take in a third parameter, `stack_top`, and use it to copy memory within the function for when there's a child process.

```
pde_t*
copyuvm(pde_t *pgdir, uint sz, uint stack_top)      /// line 336
{
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
      goto bad;
  }
  //cprintf("vm.c 358\n");
  
  // part 3 - start
  // for copying memory for child process
  if (stack_top == 0) return d;     // line 361 - 381
  
  // copy stack
  for(i = stack_top; i < USERTOP; i += PGSIZE){
    cprintf(".");
		if((pte = walkpgdir(pgdir, (void *) i, 1)) == 0)
			panic("copyuvm: pte should exist");
  		if(!(*pte & PTE_P))
			panic("copyuvm: page not present");
		pa = PTE_ADDR(*pte);
		flags = PTE_FLAGS(*pte);
		if((mem = kalloc()) == 0)
			goto bad;
		memmove(mem, (char*)P2V(pa), PGSIZE);
		if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
			goto bad;
 	}
 	cprintf("\n");
  // part 3 - end
  cprintf("vm.c 378\n");
  return d;

bad:
  cprintf("vm.c 382\n");
  freevm(d);
  return 0;
}
```

`defs.h`

The following functions were modified or added into the `defs.h` file.

```
pde_t*          copyuvm(pde_t*, uint, uint);      // line 179
void            setpteu(pde_t *pgdir, char *uva);       // line 184
int             growstack(pde_t*, uint, uint);      // line 185
```