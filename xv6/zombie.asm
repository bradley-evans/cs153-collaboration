
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  11:	e8 44 02 00 00       	call   25a <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 ce 02 00 00       	call   2f2 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  27:	83 ec 0c             	sub    $0xc,%esp
  2a:	6a 00                	push   $0x0
  2c:	e8 31 02 00 00       	call   262 <exit>
  31:	66 90                	xchg   %ax,%ax
  33:	66 90                	xchg   %ax,%ax
  35:	66 90                	xchg   %ax,%ax
  37:	66 90                	xchg   %ax,%ax
  39:	66 90                	xchg   %ax,%ax
  3b:	66 90                	xchg   %ax,%ax
  3d:	66 90                	xchg   %ax,%ax
  3f:	90                   	nop

00000040 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	8b 45 08             	mov    0x8(%ebp),%eax
  46:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  49:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  4a:	89 c2                	mov    %eax,%edx
  4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  50:	83 c1 01             	add    $0x1,%ecx
  53:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  57:	83 c2 01             	add    $0x1,%edx
  5a:	84 db                	test   %bl,%bl
  5c:	88 5a ff             	mov    %bl,-0x1(%edx)
  5f:	75 ef                	jne    50 <strcpy+0x10>
    ;
  return os;
}
  61:	5b                   	pop    %ebx
  62:	5d                   	pop    %ebp
  63:	c3                   	ret    
  64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000070 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	8b 55 08             	mov    0x8(%ebp),%edx
  76:	53                   	push   %ebx
  77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  7a:	0f b6 02             	movzbl (%edx),%eax
  7d:	84 c0                	test   %al,%al
  7f:	74 2d                	je     ae <strcmp+0x3e>
  81:	0f b6 19             	movzbl (%ecx),%ebx
  84:	38 d8                	cmp    %bl,%al
  86:	74 0e                	je     96 <strcmp+0x26>
  88:	eb 2b                	jmp    b5 <strcmp+0x45>
  8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  90:	38 c8                	cmp    %cl,%al
  92:	75 15                	jne    a9 <strcmp+0x39>
    p++, q++;
  94:	89 d9                	mov    %ebx,%ecx
  96:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  99:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  9c:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  9f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  a3:	84 c0                	test   %al,%al
  a5:	75 e9                	jne    90 <strcmp+0x20>
  a7:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a9:	29 c8                	sub    %ecx,%eax
}
  ab:	5b                   	pop    %ebx
  ac:	5d                   	pop    %ebp
  ad:	c3                   	ret    
  ae:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  b1:	31 c0                	xor    %eax,%eax
  b3:	eb f4                	jmp    a9 <strcmp+0x39>
  b5:	0f b6 cb             	movzbl %bl,%ecx
  b8:	eb ef                	jmp    a9 <strcmp+0x39>
  ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000c0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  c6:	80 39 00             	cmpb   $0x0,(%ecx)
  c9:	74 12                	je     dd <strlen+0x1d>
  cb:	31 d2                	xor    %edx,%edx
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  d0:	83 c2 01             	add    $0x1,%edx
  d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  d7:	89 d0                	mov    %edx,%eax
  d9:	75 f5                	jne    d0 <strlen+0x10>
    ;
  return n;
}
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
  dd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
  df:	5d                   	pop    %ebp
  e0:	c3                   	ret    
  e1:	eb 0d                	jmp    f0 <memset>
  e3:	90                   	nop
  e4:	90                   	nop
  e5:	90                   	nop
  e6:	90                   	nop
  e7:	90                   	nop
  e8:	90                   	nop
  e9:	90                   	nop
  ea:	90                   	nop
  eb:	90                   	nop
  ec:	90                   	nop
  ed:	90                   	nop
  ee:	90                   	nop
  ef:	90                   	nop

000000f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 55 08             	mov    0x8(%ebp),%edx
  f6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	89 d7                	mov    %edx,%edi
  ff:	fc                   	cld    
 100:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 102:	89 d0                	mov    %edx,%eax
 104:	5f                   	pop    %edi
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    
 107:	89 f6                	mov    %esi,%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <strchr>:

char*
strchr(const char *s, char c)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	53                   	push   %ebx
 117:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 11a:	0f b6 18             	movzbl (%eax),%ebx
 11d:	84 db                	test   %bl,%bl
 11f:	74 1d                	je     13e <strchr+0x2e>
    if(*s == c)
 121:	38 d3                	cmp    %dl,%bl
 123:	89 d1                	mov    %edx,%ecx
 125:	75 0d                	jne    134 <strchr+0x24>
 127:	eb 17                	jmp    140 <strchr+0x30>
 129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 130:	38 ca                	cmp    %cl,%dl
 132:	74 0c                	je     140 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 134:	83 c0 01             	add    $0x1,%eax
 137:	0f b6 10             	movzbl (%eax),%edx
 13a:	84 d2                	test   %dl,%dl
 13c:	75 f2                	jne    130 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 13e:	31 c0                	xor    %eax,%eax
}
 140:	5b                   	pop    %ebx
 141:	5d                   	pop    %ebp
 142:	c3                   	ret    
 143:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <gets>:

char*
gets(char *buf, int max)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 155:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 157:	53                   	push   %ebx
 158:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 15b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 15e:	eb 31                	jmp    191 <gets+0x41>
    cc = read(0, &c, 1);
 160:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 167:	00 
 168:	89 7c 24 04          	mov    %edi,0x4(%esp)
 16c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 173:	e8 02 01 00 00       	call   27a <read>
    if(cc < 1)
 178:	85 c0                	test   %eax,%eax
 17a:	7e 1d                	jle    199 <gets+0x49>
      break;
    buf[i++] = c;
 17c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 180:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 182:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 185:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 187:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 18b:	74 0c                	je     199 <gets+0x49>
 18d:	3c 0a                	cmp    $0xa,%al
 18f:	74 08                	je     199 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 191:	8d 5e 01             	lea    0x1(%esi),%ebx
 194:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 197:	7c c7                	jl     160 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 199:	8b 45 08             	mov    0x8(%ebp),%eax
 19c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1a0:	83 c4 2c             	add    $0x2c,%esp
 1a3:	5b                   	pop    %ebx
 1a4:	5e                   	pop    %esi
 1a5:	5f                   	pop    %edi
 1a6:	5d                   	pop    %ebp
 1a7:	c3                   	ret    
 1a8:	90                   	nop
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001b0 <stat>:

int
stat(char *n, struct stat *st)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
 1b5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b8:	8b 45 08             	mov    0x8(%ebp),%eax
 1bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1c2:	00 
 1c3:	89 04 24             	mov    %eax,(%esp)
 1c6:	e8 d7 00 00 00       	call   2a2 <open>
  if(fd < 0)
 1cb:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1cd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 1cf:	78 27                	js     1f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 1d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d4:	89 1c 24             	mov    %ebx,(%esp)
 1d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1db:	e8 da 00 00 00       	call   2ba <fstat>
  close(fd);
 1e0:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 1e3:	89 c6                	mov    %eax,%esi
  close(fd);
 1e5:	e8 a0 00 00 00       	call   28a <close>
  return r;
 1ea:	89 f0                	mov    %esi,%eax
}
 1ec:	83 c4 10             	add    $0x10,%esp
 1ef:	5b                   	pop    %ebx
 1f0:	5e                   	pop    %esi
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    
 1f3:	90                   	nop
 1f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 1f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1fd:	eb ed                	jmp    1ec <stat+0x3c>
 1ff:	90                   	nop

00000200 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 4d 08             	mov    0x8(%ebp),%ecx
 206:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 207:	0f be 11             	movsbl (%ecx),%edx
 20a:	8d 42 d0             	lea    -0x30(%edx),%eax
 20d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
 20f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 214:	77 17                	ja     22d <atoi+0x2d>
 216:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 218:	83 c1 01             	add    $0x1,%ecx
 21b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 21e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 222:	0f be 11             	movsbl (%ecx),%edx
 225:	8d 5a d0             	lea    -0x30(%edx),%ebx
 228:	80 fb 09             	cmp    $0x9,%bl
 22b:	76 eb                	jbe    218 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 22d:	5b                   	pop    %ebx
 22e:	5d                   	pop    %ebp
 22f:	c3                   	ret    

00000230 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 230:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 231:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 233:	89 e5                	mov    %esp,%ebp
 235:	56                   	push   %esi
 236:	8b 45 08             	mov    0x8(%ebp),%eax
 239:	53                   	push   %ebx
 23a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 23d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 240:	85 db                	test   %ebx,%ebx
 242:	7e 12                	jle    256 <memmove+0x26>
 244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 248:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 24c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 24f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 252:	39 da                	cmp    %ebx,%edx
 254:	75 f2                	jne    248 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 256:	5b                   	pop    %ebx
 257:	5e                   	pop    %esi
 258:	5d                   	pop    %ebp
 259:	c3                   	ret    

0000025a <fork>:
 25a:	b8 01 00 00 00       	mov    $0x1,%eax
 25f:	cd 40                	int    $0x40
 261:	c3                   	ret    

00000262 <exit>:
 262:	b8 02 00 00 00       	mov    $0x2,%eax
 267:	cd 40                	int    $0x40
 269:	c3                   	ret    

0000026a <wait>:
 26a:	b8 03 00 00 00       	mov    $0x3,%eax
 26f:	cd 40                	int    $0x40
 271:	c3                   	ret    

00000272 <pipe>:
 272:	b8 04 00 00 00       	mov    $0x4,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret    

0000027a <read>:
 27a:	b8 05 00 00 00       	mov    $0x5,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <write>:
 282:	b8 10 00 00 00       	mov    $0x10,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <close>:
 28a:	b8 15 00 00 00       	mov    $0x15,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <kill>:
 292:	b8 06 00 00 00       	mov    $0x6,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <exec>:
 29a:	b8 07 00 00 00       	mov    $0x7,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <open>:
 2a2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <mknod>:
 2aa:	b8 11 00 00 00       	mov    $0x11,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <unlink>:
 2b2:	b8 12 00 00 00       	mov    $0x12,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <fstat>:
 2ba:	b8 08 00 00 00       	mov    $0x8,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <link>:
 2c2:	b8 13 00 00 00       	mov    $0x13,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <mkdir>:
 2ca:	b8 14 00 00 00       	mov    $0x14,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <chdir>:
 2d2:	b8 09 00 00 00       	mov    $0x9,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <dup>:
 2da:	b8 0a 00 00 00       	mov    $0xa,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <getpid>:
 2e2:	b8 0b 00 00 00       	mov    $0xb,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <sbrk>:
 2ea:	b8 0c 00 00 00       	mov    $0xc,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <sleep>:
 2f2:	b8 0d 00 00 00       	mov    $0xd,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <uptime>:
 2fa:	b8 0e 00 00 00       	mov    $0xe,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    
 302:	66 90                	xchg   %ax,%ax
 304:	66 90                	xchg   %ax,%ax
 306:	66 90                	xchg   %ax,%ax
 308:	66 90                	xchg   %ax,%ax
 30a:	66 90                	xchg   %ax,%ax
 30c:	66 90                	xchg   %ax,%ax
 30e:	66 90                	xchg   %ax,%ax

00000310 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	56                   	push   %esi
 315:	89 c6                	mov    %eax,%esi
 317:	53                   	push   %ebx
 318:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 31b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 31e:	85 db                	test   %ebx,%ebx
 320:	74 09                	je     32b <printint+0x1b>
 322:	89 d0                	mov    %edx,%eax
 324:	c1 e8 1f             	shr    $0x1f,%eax
 327:	84 c0                	test   %al,%al
 329:	75 75                	jne    3a0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 32b:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 32d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 334:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 337:	31 ff                	xor    %edi,%edi
 339:	89 ce                	mov    %ecx,%esi
 33b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 33e:	eb 02                	jmp    342 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 340:	89 cf                	mov    %ecx,%edi
 342:	31 d2                	xor    %edx,%edx
 344:	f7 f6                	div    %esi
 346:	8d 4f 01             	lea    0x1(%edi),%ecx
 349:	0f b6 92 25 07 00 00 	movzbl 0x725(%edx),%edx
  }while((x /= base) != 0);
 350:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 352:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 355:	75 e9                	jne    340 <printint+0x30>
  if(neg)
 357:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 35a:	89 c8                	mov    %ecx,%eax
 35c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
 35f:	85 d2                	test   %edx,%edx
 361:	74 08                	je     36b <printint+0x5b>
    buf[i++] = '-';
 363:	8d 4f 02             	lea    0x2(%edi),%ecx
 366:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 36b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 36e:	66 90                	xchg   %ax,%ax
 370:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 375:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 378:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 37f:	00 
 380:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 384:	89 34 24             	mov    %esi,(%esp)
 387:	88 45 d7             	mov    %al,-0x29(%ebp)
 38a:	e8 f3 fe ff ff       	call   282 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 38f:	83 ff ff             	cmp    $0xffffffff,%edi
 392:	75 dc                	jne    370 <printint+0x60>
    putc(fd, buf[i]);
}
 394:	83 c4 4c             	add    $0x4c,%esp
 397:	5b                   	pop    %ebx
 398:	5e                   	pop    %esi
 399:	5f                   	pop    %edi
 39a:	5d                   	pop    %ebp
 39b:	c3                   	ret    
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3a0:	89 d0                	mov    %edx,%eax
 3a2:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 3a4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3ab:	eb 87                	jmp    334 <printint+0x24>
 3ad:	8d 76 00             	lea    0x0(%esi),%esi

000003b0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 3b4:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 3b6:	56                   	push   %esi
 3b7:	53                   	push   %ebx
 3b8:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3bb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3be:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 3c1:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3c4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 3c7:	0f b6 13             	movzbl (%ebx),%edx
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	84 d2                	test   %dl,%dl
 3cf:	75 39                	jne    40a <printf+0x5a>
 3d1:	e9 c2 00 00 00       	jmp    498 <printf+0xe8>
 3d6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3d8:	83 fa 25             	cmp    $0x25,%edx
 3db:	0f 84 bf 00 00 00    	je     4a0 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3e1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 3e4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3eb:	00 
 3ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 3f0:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3f3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3f6:	e8 87 fe ff ff       	call   282 <write>
 3fb:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3fe:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 402:	84 d2                	test   %dl,%dl
 404:	0f 84 8e 00 00 00    	je     498 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
 40a:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 40c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 40f:	74 c7                	je     3d8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 411:	83 ff 25             	cmp    $0x25,%edi
 414:	75 e5                	jne    3fb <printf+0x4b>
      if(c == 'd'){
 416:	83 fa 64             	cmp    $0x64,%edx
 419:	0f 84 31 01 00 00    	je     550 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 41f:	25 f7 00 00 00       	and    $0xf7,%eax
 424:	83 f8 70             	cmp    $0x70,%eax
 427:	0f 84 83 00 00 00    	je     4b0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 42d:	83 fa 73             	cmp    $0x73,%edx
 430:	0f 84 a2 00 00 00    	je     4d8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 436:	83 fa 63             	cmp    $0x63,%edx
 439:	0f 84 35 01 00 00    	je     574 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 43f:	83 fa 25             	cmp    $0x25,%edx
 442:	0f 84 e0 00 00 00    	je     528 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 448:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 44b:	83 c3 01             	add    $0x1,%ebx
 44e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 455:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 456:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 458:	89 44 24 04          	mov    %eax,0x4(%esp)
 45c:	89 34 24             	mov    %esi,(%esp)
 45f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 462:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 466:	e8 17 fe ff ff       	call   282 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 46b:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 46e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 471:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 478:	00 
 479:	89 44 24 04          	mov    %eax,0x4(%esp)
 47d:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 480:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 483:	e8 fa fd ff ff       	call   282 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 488:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 48c:	84 d2                	test   %dl,%dl
 48e:	0f 85 76 ff ff ff    	jne    40a <printf+0x5a>
 494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 498:	83 c4 3c             	add    $0x3c,%esp
 49b:	5b                   	pop    %ebx
 49c:	5e                   	pop    %esi
 49d:	5f                   	pop    %edi
 49e:	5d                   	pop    %ebp
 49f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4a0:	bf 25 00 00 00       	mov    $0x25,%edi
 4a5:	e9 51 ff ff ff       	jmp    3fb <printf+0x4b>
 4aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4b3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4b8:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4ba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4c1:	8b 10                	mov    (%eax),%edx
 4c3:	89 f0                	mov    %esi,%eax
 4c5:	e8 46 fe ff ff       	call   310 <printint>
        ap++;
 4ca:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 4ce:	e9 28 ff ff ff       	jmp    3fb <printf+0x4b>
 4d3:	90                   	nop
 4d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 4d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 4db:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 4df:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
 4e1:	b8 1e 07 00 00       	mov    $0x71e,%eax
 4e6:	85 ff                	test   %edi,%edi
 4e8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 4eb:	0f b6 07             	movzbl (%edi),%eax
 4ee:	84 c0                	test   %al,%al
 4f0:	74 2a                	je     51c <printf+0x16c>
 4f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4f8:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4fb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 4fe:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 501:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 508:	00 
 509:	89 44 24 04          	mov    %eax,0x4(%esp)
 50d:	89 34 24             	mov    %esi,(%esp)
 510:	e8 6d fd ff ff       	call   282 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 515:	0f b6 07             	movzbl (%edi),%eax
 518:	84 c0                	test   %al,%al
 51a:	75 dc                	jne    4f8 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 51c:	31 ff                	xor    %edi,%edi
 51e:	e9 d8 fe ff ff       	jmp    3fb <printf+0x4b>
 523:	90                   	nop
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 528:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 52b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 52d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 534:	00 
 535:	89 44 24 04          	mov    %eax,0x4(%esp)
 539:	89 34 24             	mov    %esi,(%esp)
 53c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 540:	e8 3d fd ff ff       	call   282 <write>
 545:	e9 b1 fe ff ff       	jmp    3fb <printf+0x4b>
 54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 550:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 553:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 558:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 55b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 562:	8b 10                	mov    (%eax),%edx
 564:	89 f0                	mov    %esi,%eax
 566:	e8 a5 fd ff ff       	call   310 <printint>
        ap++;
 56b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 56f:	e9 87 fe ff ff       	jmp    3fb <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 574:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 577:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 579:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 57b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 582:	00 
 583:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 586:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 589:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 58c:	89 44 24 04          	mov    %eax,0x4(%esp)
 590:	e8 ed fc ff ff       	call   282 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 595:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 599:	e9 5d fe ff ff       	jmp    3fb <printf+0x4b>
 59e:	66 90                	xchg   %ax,%ax

000005a0 <free>:
 5a0:	55                   	push   %ebp
 5a1:	a1 a4 09 00 00       	mov    0x9a4,%eax
 5a6:	89 e5                	mov    %esp,%ebp
 5a8:	57                   	push   %edi
 5a9:	56                   	push   %esi
 5aa:	53                   	push   %ebx
 5ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5ae:	8b 10                	mov    (%eax),%edx
 5b0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 5b3:	39 c8                	cmp    %ecx,%eax
 5b5:	73 19                	jae    5d0 <free+0x30>
 5b7:	89 f6                	mov    %esi,%esi
 5b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 5c0:	39 d1                	cmp    %edx,%ecx
 5c2:	72 1c                	jb     5e0 <free+0x40>
 5c4:	39 d0                	cmp    %edx,%eax
 5c6:	73 18                	jae    5e0 <free+0x40>
 5c8:	89 d0                	mov    %edx,%eax
 5ca:	39 c8                	cmp    %ecx,%eax
 5cc:	8b 10                	mov    (%eax),%edx
 5ce:	72 f0                	jb     5c0 <free+0x20>
 5d0:	39 d0                	cmp    %edx,%eax
 5d2:	72 f4                	jb     5c8 <free+0x28>
 5d4:	39 d1                	cmp    %edx,%ecx
 5d6:	73 f0                	jae    5c8 <free+0x28>
 5d8:	90                   	nop
 5d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5e0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5e3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5e6:	39 d7                	cmp    %edx,%edi
 5e8:	74 19                	je     603 <free+0x63>
 5ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5ed:	8b 50 04             	mov    0x4(%eax),%edx
 5f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5f3:	39 f1                	cmp    %esi,%ecx
 5f5:	74 23                	je     61a <free+0x7a>
 5f7:	89 08                	mov    %ecx,(%eax)
 5f9:	a3 a4 09 00 00       	mov    %eax,0x9a4
 5fe:	5b                   	pop    %ebx
 5ff:	5e                   	pop    %esi
 600:	5f                   	pop    %edi
 601:	5d                   	pop    %ebp
 602:	c3                   	ret    
 603:	03 72 04             	add    0x4(%edx),%esi
 606:	89 73 fc             	mov    %esi,-0x4(%ebx)
 609:	8b 10                	mov    (%eax),%edx
 60b:	8b 12                	mov    (%edx),%edx
 60d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 610:	8b 50 04             	mov    0x4(%eax),%edx
 613:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 616:	39 f1                	cmp    %esi,%ecx
 618:	75 dd                	jne    5f7 <free+0x57>
 61a:	03 53 fc             	add    -0x4(%ebx),%edx
 61d:	a3 a4 09 00 00       	mov    %eax,0x9a4
 622:	89 50 04             	mov    %edx,0x4(%eax)
 625:	8b 53 f8             	mov    -0x8(%ebx),%edx
 628:	89 10                	mov    %edx,(%eax)
 62a:	5b                   	pop    %ebx
 62b:	5e                   	pop    %esi
 62c:	5f                   	pop    %edi
 62d:	5d                   	pop    %ebp
 62e:	c3                   	ret    
 62f:	90                   	nop

00000630 <malloc>:
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
 636:	83 ec 0c             	sub    $0xc,%esp
 639:	8b 45 08             	mov    0x8(%ebp),%eax
 63c:	8b 15 a4 09 00 00    	mov    0x9a4,%edx
 642:	8d 78 07             	lea    0x7(%eax),%edi
 645:	c1 ef 03             	shr    $0x3,%edi
 648:	83 c7 01             	add    $0x1,%edi
 64b:	85 d2                	test   %edx,%edx
 64d:	0f 84 a3 00 00 00    	je     6f6 <malloc+0xc6>
 653:	8b 02                	mov    (%edx),%eax
 655:	8b 48 04             	mov    0x4(%eax),%ecx
 658:	39 cf                	cmp    %ecx,%edi
 65a:	76 74                	jbe    6d0 <malloc+0xa0>
 65c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 662:	be 00 10 00 00       	mov    $0x1000,%esi
 667:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 66e:	0f 43 f7             	cmovae %edi,%esi
 671:	ba 00 80 00 00       	mov    $0x8000,%edx
 676:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 67c:	0f 46 da             	cmovbe %edx,%ebx
 67f:	eb 10                	jmp    691 <malloc+0x61>
 681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 688:	8b 02                	mov    (%edx),%eax
 68a:	8b 48 04             	mov    0x4(%eax),%ecx
 68d:	39 cf                	cmp    %ecx,%edi
 68f:	76 3f                	jbe    6d0 <malloc+0xa0>
 691:	39 05 a4 09 00 00    	cmp    %eax,0x9a4
 697:	89 c2                	mov    %eax,%edx
 699:	75 ed                	jne    688 <malloc+0x58>
 69b:	83 ec 0c             	sub    $0xc,%esp
 69e:	53                   	push   %ebx
 69f:	e8 46 fc ff ff       	call   2ea <sbrk>
 6a4:	83 c4 10             	add    $0x10,%esp
 6a7:	83 f8 ff             	cmp    $0xffffffff,%eax
 6aa:	74 1c                	je     6c8 <malloc+0x98>
 6ac:	89 70 04             	mov    %esi,0x4(%eax)
 6af:	83 ec 0c             	sub    $0xc,%esp
 6b2:	83 c0 08             	add    $0x8,%eax
 6b5:	50                   	push   %eax
 6b6:	e8 e5 fe ff ff       	call   5a0 <free>
 6bb:	8b 15 a4 09 00 00    	mov    0x9a4,%edx
 6c1:	83 c4 10             	add    $0x10,%esp
 6c4:	85 d2                	test   %edx,%edx
 6c6:	75 c0                	jne    688 <malloc+0x58>
 6c8:	31 c0                	xor    %eax,%eax
 6ca:	eb 1c                	jmp    6e8 <malloc+0xb8>
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6d0:	39 cf                	cmp    %ecx,%edi
 6d2:	74 1c                	je     6f0 <malloc+0xc0>
 6d4:	29 f9                	sub    %edi,%ecx
 6d6:	89 48 04             	mov    %ecx,0x4(%eax)
 6d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 6dc:	89 78 04             	mov    %edi,0x4(%eax)
 6df:	89 15 a4 09 00 00    	mov    %edx,0x9a4
 6e5:	83 c0 08             	add    $0x8,%eax
 6e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6eb:	5b                   	pop    %ebx
 6ec:	5e                   	pop    %esi
 6ed:	5f                   	pop    %edi
 6ee:	5d                   	pop    %ebp
 6ef:	c3                   	ret    
 6f0:	8b 08                	mov    (%eax),%ecx
 6f2:	89 0a                	mov    %ecx,(%edx)
 6f4:	eb e9                	jmp    6df <malloc+0xaf>
 6f6:	c7 05 a4 09 00 00 a8 	movl   $0x9a8,0x9a4
 6fd:	09 00 00 
 700:	c7 05 a8 09 00 00 a8 	movl   $0x9a8,0x9a8
 707:	09 00 00 
 70a:	b8 a8 09 00 00       	mov    $0x9a8,%eax
 70f:	c7 05 ac 09 00 00 00 	movl   $0x0,0x9ac
 716:	00 00 00 
 719:	e9 3e ff ff ff       	jmp    65c <malloc+0x2c>
