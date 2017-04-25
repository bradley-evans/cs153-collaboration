
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4 0f                	in     $0xf,%al

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc d0 b5 10 80       	mov    $0x8010b5d0,%esp
8010002d:	b8 50 2e 10 80       	mov    $0x80102e50,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb 14 b6 10 80       	mov    $0x8010b614,%ebx
  struct buf head;
} bcache;

void
binit(void)
{
80100049:	83 ec 14             	sub    $0x14,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004c:	c7 44 24 04 80 6d 10 	movl   $0x80106d80,0x4(%esp)
80100053:	80 
80100054:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
8010005b:	e8 00 41 00 00       	call   80104160 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
80100060:	ba dc fc 10 80       	mov    $0x8010fcdc,%edx

  initlock(&bcache.lock, "bcache");

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
80100065:	c7 05 2c fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd2c
8010006c:	fc 10 80 
  bcache.head.next = &bcache.head;
8010006f:	c7 05 30 fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd30
80100076:	fc 10 80 
80100079:	eb 09                	jmp    80100084 <binit+0x44>
8010007b:	90                   	nop
8010007c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 da                	mov    %ebx,%edx
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100082:	89 c3                	mov    %eax,%ebx
80100084:	8d 43 0c             	lea    0xc(%ebx),%eax
    b->next = bcache.head.next;
80100087:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008a:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100091:	89 04 24             	mov    %eax,(%esp)
80100094:	c7 44 24 04 87 6d 10 	movl   $0x80106d87,0x4(%esp)
8010009b:	80 
8010009c:	e8 af 3f 00 00       	call   80104050 <initsleeplock>
    bcache.head.next->prev = b;
801000a1:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
801000a6:	89 58 50             	mov    %ebx,0x50(%eax)

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a9:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000af:	3d dc fc 10 80       	cmp    $0x8010fcdc,%eax
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
801000b4:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000ba:	75 c4                	jne    80100080 <binit+0x40>
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000bc:	83 c4 14             	add    $0x14,%esp
801000bf:	5b                   	pop    %ebx
801000c0:	5d                   	pop    %ebp
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 1c             	sub    $0x1c,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000dc:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000e3:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000e6:	e8 f5 40 00 00       	call   801041e0 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000eb:	8b 1d 30 fd 10 80    	mov    0x8010fd30,%ebx
801000f1:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
801000f7:	75 12                	jne    8010010b <bread+0x3b>
801000f9:	eb 25                	jmp    80100120 <bread+0x50>
801000fb:	90                   	nop
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Not cached; recycle some unused buffer and clean buffer
  // "clean" because B_DIRTY and not locked means log.c
  // hasn't yet committed the changes to the buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 2c fd 10 80    	mov    0x8010fd2c,%ebx
80100126:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 58                	jmp    80100188 <bread+0xb8>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100139:	74 4d                	je     80100188 <bread+0xb8>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
80100161:	e8 aa 41 00 00       	call   80104310 <release>
      acquiresleep(&b->lock);
80100166:	8d 43 0c             	lea    0xc(%ebx),%eax
80100169:	89 04 24             	mov    %eax,(%esp)
8010016c:	e8 1f 3f 00 00       	call   80104090 <acquiresleep>
bread(uint dev, uint blockno)
{
  struct buf *b;

  b = bget(dev, blockno);
  if(!(b->flags & B_VALID)) {
80100171:	f6 03 02             	testb  $0x2,(%ebx)
80100174:	75 08                	jne    8010017e <bread+0xae>
    iderw(b);
80100176:	89 1c 24             	mov    %ebx,(%esp)
80100179:	e8 92 1f 00 00       	call   80102110 <iderw>
  }
  return b;
}
8010017e:	83 c4 1c             	add    $0x1c,%esp
80100181:	89 d8                	mov    %ebx,%eax
80100183:	5b                   	pop    %ebx
80100184:	5e                   	pop    %esi
80100185:	5f                   	pop    %edi
80100186:	5d                   	pop    %ebp
80100187:	c3                   	ret    
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100188:	c7 04 24 8e 6d 10 80 	movl   $0x80106d8e,(%esp)
8010018f:	e8 cc 01 00 00       	call   80100360 <panic>
80100194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010019a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801001a0 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 14             	sub    $0x14,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	89 04 24             	mov    %eax,(%esp)
801001b0:	e8 7b 3f 00 00       	call   80104130 <holdingsleep>
801001b5:	85 c0                	test   %eax,%eax
801001b7:	74 10                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001b9:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bc:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001bf:	83 c4 14             	add    $0x14,%esp
801001c2:	5b                   	pop    %ebx
801001c3:	5d                   	pop    %ebp
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
801001c4:	e9 47 1f 00 00       	jmp    80102110 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
801001c9:	c7 04 24 9f 6d 10 80 	movl   $0x80106d9f,(%esp)
801001d0:	e8 8b 01 00 00       	call   80100360 <panic>
801001d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	83 ec 10             	sub    $0x10,%esp
801001e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	89 34 24             	mov    %esi,(%esp)
801001f1:	e8 3a 3f 00 00       	call   80104130 <holdingsleep>
801001f6:	85 c0                	test   %eax,%eax
801001f8:	74 5b                	je     80100255 <brelse+0x75>
    panic("brelse");

  releasesleep(&b->lock);
801001fa:	89 34 24             	mov    %esi,(%esp)
801001fd:	e8 ee 3e 00 00       	call   801040f0 <releasesleep>

  acquire(&bcache.lock);
80100202:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
80100209:	e8 d2 3f 00 00       	call   801041e0 <acquire>
  b->refcnt--;
  if (b->refcnt == 0) {
8010020e:	83 6b 4c 01          	subl   $0x1,0x4c(%ebx)
80100212:	75 2f                	jne    80100243 <brelse+0x63>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100214:	8b 43 54             	mov    0x54(%ebx),%eax
80100217:	8b 53 50             	mov    0x50(%ebx),%edx
8010021a:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
8010021d:	8b 43 50             	mov    0x50(%ebx),%eax
80100220:	8b 53 54             	mov    0x54(%ebx),%edx
80100223:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100226:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
    b->prev = &bcache.head;
8010022b:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
  b->refcnt--;
  if (b->refcnt == 0) {
    // no one is waiting for it.
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = bcache.head.next;
80100232:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
80100235:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
8010023a:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
8010023d:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
  }
  
  release(&bcache.lock);
80100243:	c7 45 08 e0 b5 10 80 	movl   $0x8010b5e0,0x8(%ebp)
}
8010024a:	83 c4 10             	add    $0x10,%esp
8010024d:	5b                   	pop    %ebx
8010024e:	5e                   	pop    %esi
8010024f:	5d                   	pop    %ebp
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
  
  release(&bcache.lock);
80100250:	e9 bb 40 00 00       	jmp    80104310 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
80100255:	c7 04 24 a6 6d 10 80 	movl   $0x80106da6,(%esp)
8010025c:	e8 ff 00 00 00       	call   80100360 <panic>
80100261:	66 90                	xchg   %ax,%ax
80100263:	66 90                	xchg   %ax,%ax
80100265:	66 90                	xchg   %ax,%ax
80100267:	66 90                	xchg   %ax,%ax
80100269:	66 90                	xchg   %ax,%ax
8010026b:	66 90                	xchg   %ax,%ax
8010026d:	66 90                	xchg   %ax,%ax
8010026f:	90                   	nop

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 1c             	sub    $0x1c,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	89 3c 24             	mov    %edi,(%esp)
80100282:	e8 f9 14 00 00       	call   80101780 <iunlock>
  target = n;
  acquire(&cons.lock);
80100287:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028e:	e8 4d 3f 00 00       	call   801041e0 <acquire>
  while(n > 0){
80100293:	8b 55 10             	mov    0x10(%ebp),%edx
80100296:	85 d2                	test   %edx,%edx
80100298:	0f 8e bc 00 00 00    	jle    8010035a <consoleread+0xea>
8010029e:	8b 5d 10             	mov    0x10(%ebp),%ebx
801002a1:	eb 26                	jmp    801002c9 <consoleread+0x59>
801002a3:	90                   	nop
801002a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(input.r == input.w){
      if(proc->killed){
801002a8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801002ae:	8b 40 24             	mov    0x24(%eax),%eax
801002b1:	85 c0                	test   %eax,%eax
801002b3:	75 73                	jne    80100328 <consoleread+0xb8>
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b5:	c7 44 24 04 20 a5 10 	movl   $0x8010a520,0x4(%esp)
801002bc:	80 
801002bd:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
801002c4:	e8 17 3a 00 00       	call   80103ce0 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c9:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002ce:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002d4:	74 d2                	je     801002a8 <consoleread+0x38>
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
801002d6:	8d 50 01             	lea    0x1(%eax),%edx
801002d9:	89 15 c0 ff 10 80    	mov    %edx,0x8010ffc0
801002df:	89 c2                	mov    %eax,%edx
801002e1:	83 e2 7f             	and    $0x7f,%edx
801002e4:	0f b6 8a 40 ff 10 80 	movzbl -0x7fef00c0(%edx),%ecx
801002eb:	0f be d1             	movsbl %cl,%edx
    if(c == C('D')){  // EOF
801002ee:	83 fa 04             	cmp    $0x4,%edx
801002f1:	74 56                	je     80100349 <consoleread+0xd9>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
801002f3:	83 c6 01             	add    $0x1,%esi
    --n;
801002f6:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
801002f9:	83 fa 0a             	cmp    $0xa,%edx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
801002fc:	88 4e ff             	mov    %cl,-0x1(%esi)
    --n;
    if(c == '\n')
801002ff:	74 52                	je     80100353 <consoleread+0xe3>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100301:	85 db                	test   %ebx,%ebx
80100303:	75 c4                	jne    801002c9 <consoleread+0x59>
80100305:	8b 45 10             	mov    0x10(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
80100308:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010030f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100312:	e8 f9 3f 00 00       	call   80104310 <release>
  ilock(ip);
80100317:	89 3c 24             	mov    %edi,(%esp)
8010031a:	e8 91 13 00 00       	call   801016b0 <ilock>
8010031f:	8b 45 e4             	mov    -0x1c(%ebp),%eax

  return target - n;
80100322:	eb 1d                	jmp    80100341 <consoleread+0xd1>
80100324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
      if(proc->killed){
        release(&cons.lock);
80100328:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010032f:	e8 dc 3f 00 00       	call   80104310 <release>
        ilock(ip);
80100334:	89 3c 24             	mov    %edi,(%esp)
80100337:	e8 74 13 00 00       	call   801016b0 <ilock>
        return -1;
8010033c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
80100341:	83 c4 1c             	add    $0x1c,%esp
80100344:	5b                   	pop    %ebx
80100345:	5e                   	pop    %esi
80100346:	5f                   	pop    %edi
80100347:	5d                   	pop    %ebp
80100348:	c3                   	ret    
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
80100349:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010034c:	76 05                	jbe    80100353 <consoleread+0xe3>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
8010034e:	a3 c0 ff 10 80       	mov    %eax,0x8010ffc0
80100353:	8b 45 10             	mov    0x10(%ebp),%eax
80100356:	29 d8                	sub    %ebx,%eax
80100358:	eb ae                	jmp    80100308 <consoleread+0x98>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
8010035a:	31 c0                	xor    %eax,%eax
8010035c:	eb aa                	jmp    80100308 <consoleread+0x98>
8010035e:	66 90                	xchg   %ax,%ax

80100360 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100360:	55                   	push   %ebp
80100361:	89 e5                	mov    %esp,%ebp
80100363:	56                   	push   %esi
80100364:	53                   	push   %ebx
80100365:	83 ec 40             	sub    $0x40,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100368:	fa                   	cli    
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
80100369:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
8010036f:	8d 5d d0             	lea    -0x30(%ebp),%ebx
{
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
80100372:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100379:	00 00 00 
8010037c:	8d 75 f8             	lea    -0x8(%ebp),%esi
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
8010037f:	0f b6 00             	movzbl (%eax),%eax
80100382:	c7 04 24 ad 6d 10 80 	movl   $0x80106dad,(%esp)
80100389:	89 44 24 04          	mov    %eax,0x4(%esp)
8010038d:	e8 be 02 00 00       	call   80100650 <cprintf>
  cprintf(s);
80100392:	8b 45 08             	mov    0x8(%ebp),%eax
80100395:	89 04 24             	mov    %eax,(%esp)
80100398:	e8 b3 02 00 00       	call   80100650 <cprintf>
  cprintf("\n");
8010039d:	c7 04 24 a6 72 10 80 	movl   $0x801072a6,(%esp)
801003a4:	e8 a7 02 00 00       	call   80100650 <cprintf>
  getcallerpcs(&s, pcs);
801003a9:	8d 45 08             	lea    0x8(%ebp),%eax
801003ac:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801003b0:	89 04 24             	mov    %eax,(%esp)
801003b3:	e8 c8 3d 00 00       	call   80104180 <getcallerpcs>
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003b8:	8b 03                	mov    (%ebx),%eax
801003ba:	83 c3 04             	add    $0x4,%ebx
801003bd:	c7 04 24 c9 6d 10 80 	movl   $0x80106dc9,(%esp)
801003c4:	89 44 24 04          	mov    %eax,0x4(%esp)
801003c8:	e8 83 02 00 00       	call   80100650 <cprintf>
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003cd:	39 f3                	cmp    %esi,%ebx
801003cf:	75 e7                	jne    801003b8 <panic+0x58>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003d1:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003d8:	00 00 00 
801003db:	eb fe                	jmp    801003db <panic+0x7b>
801003dd:	8d 76 00             	lea    0x0(%esi),%esi

801003e0 <consputc>:
}

void
consputc(int c)
{
  if(panicked){
801003e0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003e6:	85 d2                	test   %edx,%edx
801003e8:	74 06                	je     801003f0 <consputc+0x10>
801003ea:	fa                   	cli    
801003eb:	eb fe                	jmp    801003eb <consputc+0xb>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
801003f0:	55                   	push   %ebp
801003f1:	89 e5                	mov    %esp,%ebp
801003f3:	57                   	push   %edi
801003f4:	56                   	push   %esi
801003f5:	53                   	push   %ebx
801003f6:	89 c3                	mov    %eax,%ebx
801003f8:	83 ec 1c             	sub    $0x1c,%esp
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
801003fb:	3d 00 01 00 00       	cmp    $0x100,%eax
80100400:	0f 84 ac 00 00 00    	je     801004b2 <consputc+0xd2>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100406:	89 04 24             	mov    %eax,(%esp)
80100409:	e8 92 54 00 00       	call   801058a0 <uartputc>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010040e:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100413:	b8 0e 00 00 00       	mov    $0xe,%eax
80100418:	89 fa                	mov    %edi,%edx
8010041a:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010041b:	be d5 03 00 00       	mov    $0x3d5,%esi
80100420:	89 f2                	mov    %esi,%edx
80100422:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100423:	0f b6 c8             	movzbl %al,%ecx
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100426:	89 fa                	mov    %edi,%edx
80100428:	c1 e1 08             	shl    $0x8,%ecx
8010042b:	b8 0f 00 00 00       	mov    $0xf,%eax
80100430:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100431:	89 f2                	mov    %esi,%edx
80100433:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
80100434:	0f b6 c0             	movzbl %al,%eax
80100437:	09 c1                	or     %eax,%ecx

  if(c == '\n')
80100439:	83 fb 0a             	cmp    $0xa,%ebx
8010043c:	0f 84 0d 01 00 00    	je     8010054f <consputc+0x16f>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
80100442:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
80100448:	0f 84 e8 00 00 00    	je     80100536 <consputc+0x156>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
8010044e:	0f b6 db             	movzbl %bl,%ebx
80100451:	80 cf 07             	or     $0x7,%bh
80100454:	8d 79 01             	lea    0x1(%ecx),%edi
80100457:	66 89 9c 09 00 80 0b 	mov    %bx,-0x7ff48000(%ecx,%ecx,1)
8010045e:	80 

  if(pos < 0 || pos > 25*80)
8010045f:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
80100465:	0f 87 bf 00 00 00    	ja     8010052a <consputc+0x14a>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
8010046b:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100471:	7f 68                	jg     801004db <consputc+0xfb>
80100473:	89 f8                	mov    %edi,%eax
80100475:	89 fb                	mov    %edi,%ebx
80100477:	c1 e8 08             	shr    $0x8,%eax
8010047a:	89 c6                	mov    %eax,%esi
8010047c:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100483:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100488:	b8 0e 00 00 00       	mov    $0xe,%eax
8010048d:	89 fa                	mov    %edi,%edx
8010048f:	ee                   	out    %al,(%dx)
80100490:	89 f0                	mov    %esi,%eax
80100492:	b2 d5                	mov    $0xd5,%dl
80100494:	ee                   	out    %al,(%dx)
80100495:	b8 0f 00 00 00       	mov    $0xf,%eax
8010049a:	89 fa                	mov    %edi,%edx
8010049c:	ee                   	out    %al,(%dx)
8010049d:	89 d8                	mov    %ebx,%eax
8010049f:	b2 d5                	mov    $0xd5,%dl
801004a1:	ee                   	out    %al,(%dx)

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004a2:	b8 20 07 00 00       	mov    $0x720,%eax
801004a7:	66 89 01             	mov    %ax,(%ecx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004aa:	83 c4 1c             	add    $0x1c,%esp
801004ad:	5b                   	pop    %ebx
801004ae:	5e                   	pop    %esi
801004af:	5f                   	pop    %edi
801004b0:	5d                   	pop    %ebp
801004b1:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004b2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004b9:	e8 e2 53 00 00       	call   801058a0 <uartputc>
801004be:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004c5:	e8 d6 53 00 00       	call   801058a0 <uartputc>
801004ca:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004d1:	e8 ca 53 00 00       	call   801058a0 <uartputc>
801004d6:	e9 33 ff ff ff       	jmp    8010040e <consputc+0x2e>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004db:	c7 44 24 08 60 0e 00 	movl   $0xe60,0x8(%esp)
801004e2:	00 
    pos -= 80;
801004e3:	8d 5f b0             	lea    -0x50(%edi),%ebx

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004e6:	c7 44 24 04 a0 80 0b 	movl   $0x800b80a0,0x4(%esp)
801004ed:	80 
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
801004ee:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f5:	c7 04 24 00 80 0b 80 	movl   $0x800b8000,(%esp)
801004fc:	e8 ff 3e 00 00       	call   80104400 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100501:	b8 d0 07 00 00       	mov    $0x7d0,%eax
80100506:	29 f8                	sub    %edi,%eax
80100508:	01 c0                	add    %eax,%eax
8010050a:	89 34 24             	mov    %esi,(%esp)
8010050d:	89 44 24 08          	mov    %eax,0x8(%esp)
80100511:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100518:	00 
80100519:	e8 42 3e 00 00       	call   80104360 <memset>
8010051e:	89 f1                	mov    %esi,%ecx
80100520:	be 07 00 00 00       	mov    $0x7,%esi
80100525:	e9 59 ff ff ff       	jmp    80100483 <consputc+0xa3>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
8010052a:	c7 04 24 cd 6d 10 80 	movl   $0x80106dcd,(%esp)
80100531:	e8 2a fe ff ff       	call   80100360 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
80100536:	85 c9                	test   %ecx,%ecx
80100538:	8d 79 ff             	lea    -0x1(%ecx),%edi
8010053b:	0f 85 1e ff ff ff    	jne    8010045f <consputc+0x7f>
80100541:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
80100546:	31 db                	xor    %ebx,%ebx
80100548:	31 f6                	xor    %esi,%esi
8010054a:	e9 34 ff ff ff       	jmp    80100483 <consputc+0xa3>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
8010054f:	89 c8                	mov    %ecx,%eax
80100551:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100556:	f7 ea                	imul   %edx
80100558:	c1 ea 05             	shr    $0x5,%edx
8010055b:	8d 04 92             	lea    (%edx,%edx,4),%eax
8010055e:	c1 e0 04             	shl    $0x4,%eax
80100561:	8d 78 50             	lea    0x50(%eax),%edi
80100564:	e9 f6 fe ff ff       	jmp    8010045f <consputc+0x7f>
80100569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100570 <printint>:
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
80100570:	55                   	push   %ebp
80100571:	89 e5                	mov    %esp,%ebp
80100573:	57                   	push   %edi
80100574:	56                   	push   %esi
80100575:	89 d6                	mov    %edx,%esi
80100577:	53                   	push   %ebx
80100578:	83 ec 1c             	sub    $0x1c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
8010057b:	85 c9                	test   %ecx,%ecx
8010057d:	74 61                	je     801005e0 <printint+0x70>
8010057f:	85 c0                	test   %eax,%eax
80100581:	79 5d                	jns    801005e0 <printint+0x70>
    x = -xx;
80100583:	f7 d8                	neg    %eax
80100585:	bf 01 00 00 00       	mov    $0x1,%edi
  else
    x = xx;

  i = 0;
8010058a:	31 c9                	xor    %ecx,%ecx
8010058c:	eb 04                	jmp    80100592 <printint+0x22>
8010058e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
80100590:	89 d9                	mov    %ebx,%ecx
80100592:	31 d2                	xor    %edx,%edx
80100594:	f7 f6                	div    %esi
80100596:	8d 59 01             	lea    0x1(%ecx),%ebx
80100599:	0f b6 92 f8 6d 10 80 	movzbl -0x7fef9208(%edx),%edx
  }while((x /= base) != 0);
801005a0:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005a2:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
  }while((x /= base) != 0);
801005a6:	75 e8                	jne    80100590 <printint+0x20>

  if(sign)
801005a8:	85 ff                	test   %edi,%edi
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005aa:	89 d8                	mov    %ebx,%eax
  }while((x /= base) != 0);

  if(sign)
801005ac:	74 08                	je     801005b6 <printint+0x46>
    buf[i++] = '-';
801005ae:	8d 59 02             	lea    0x2(%ecx),%ebx
801005b1:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
801005b6:	83 eb 01             	sub    $0x1,%ebx
801005b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    consputc(buf[i]);
801005c0:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005c5:	83 eb 01             	sub    $0x1,%ebx
    consputc(buf[i]);
801005c8:	e8 13 fe ff ff       	call   801003e0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005cd:	83 fb ff             	cmp    $0xffffffff,%ebx
801005d0:	75 ee                	jne    801005c0 <printint+0x50>
    consputc(buf[i]);
}
801005d2:	83 c4 1c             	add    $0x1c,%esp
801005d5:	5b                   	pop    %ebx
801005d6:	5e                   	pop    %esi
801005d7:	5f                   	pop    %edi
801005d8:	5d                   	pop    %ebp
801005d9:	c3                   	ret    
801005da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
  else
    x = xx;
801005e0:	31 ff                	xor    %edi,%edi
801005e2:	eb a6                	jmp    8010058a <printint+0x1a>
801005e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801005f0 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
801005f0:	55                   	push   %ebp
801005f1:	89 e5                	mov    %esp,%ebp
801005f3:	57                   	push   %edi
801005f4:	56                   	push   %esi
801005f5:	53                   	push   %ebx
801005f6:	83 ec 1c             	sub    $0x1c,%esp
  int i;

  iunlock(ip);
801005f9:	8b 45 08             	mov    0x8(%ebp),%eax
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
801005fc:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
801005ff:	89 04 24             	mov    %eax,(%esp)
80100602:	e8 79 11 00 00       	call   80101780 <iunlock>
  acquire(&cons.lock);
80100607:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010060e:	e8 cd 3b 00 00       	call   801041e0 <acquire>
80100613:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100616:	85 f6                	test   %esi,%esi
80100618:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010061b:	7e 12                	jle    8010062f <consolewrite+0x3f>
8010061d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100620:	0f b6 07             	movzbl (%edi),%eax
80100623:	83 c7 01             	add    $0x1,%edi
80100626:	e8 b5 fd ff ff       	call   801003e0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
8010062b:	39 df                	cmp    %ebx,%edi
8010062d:	75 f1                	jne    80100620 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
8010062f:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100636:	e8 d5 3c 00 00       	call   80104310 <release>
  ilock(ip);
8010063b:	8b 45 08             	mov    0x8(%ebp),%eax
8010063e:	89 04 24             	mov    %eax,(%esp)
80100641:	e8 6a 10 00 00       	call   801016b0 <ilock>

  return n;
}
80100646:	83 c4 1c             	add    $0x1c,%esp
80100649:	89 f0                	mov    %esi,%eax
8010064b:	5b                   	pop    %ebx
8010064c:	5e                   	pop    %esi
8010064d:	5f                   	pop    %edi
8010064e:	5d                   	pop    %ebp
8010064f:	c3                   	ret    

80100650 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100650:	55                   	push   %ebp
80100651:	89 e5                	mov    %esp,%ebp
80100653:	57                   	push   %edi
80100654:	56                   	push   %esi
80100655:	53                   	push   %ebx
80100656:	83 ec 1c             	sub    $0x1c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100659:	a1 54 a5 10 80       	mov    0x8010a554,%eax
  if(locking)
8010065e:	85 c0                	test   %eax,%eax
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100660:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100663:	0f 85 27 01 00 00    	jne    80100790 <cprintf+0x140>
    acquire(&cons.lock);

  if (fmt == 0)
80100669:	8b 45 08             	mov    0x8(%ebp),%eax
8010066c:	85 c0                	test   %eax,%eax
8010066e:	89 c1                	mov    %eax,%ecx
80100670:	0f 84 2b 01 00 00    	je     801007a1 <cprintf+0x151>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100676:	0f b6 00             	movzbl (%eax),%eax
80100679:	31 db                	xor    %ebx,%ebx
8010067b:	89 cf                	mov    %ecx,%edi
8010067d:	8d 75 0c             	lea    0xc(%ebp),%esi
80100680:	85 c0                	test   %eax,%eax
80100682:	75 4c                	jne    801006d0 <cprintf+0x80>
80100684:	eb 5f                	jmp    801006e5 <cprintf+0x95>
80100686:	66 90                	xchg   %ax,%ax
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
80100688:	83 c3 01             	add    $0x1,%ebx
8010068b:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    if(c == 0)
8010068f:	85 d2                	test   %edx,%edx
80100691:	74 52                	je     801006e5 <cprintf+0x95>
      break;
    switch(c){
80100693:	83 fa 70             	cmp    $0x70,%edx
80100696:	74 72                	je     8010070a <cprintf+0xba>
80100698:	7f 66                	jg     80100700 <cprintf+0xb0>
8010069a:	83 fa 25             	cmp    $0x25,%edx
8010069d:	8d 76 00             	lea    0x0(%esi),%esi
801006a0:	0f 84 a2 00 00 00    	je     80100748 <cprintf+0xf8>
801006a6:	83 fa 64             	cmp    $0x64,%edx
801006a9:	75 7d                	jne    80100728 <cprintf+0xd8>
    case 'd':
      printint(*argp++, 10, 1);
801006ab:	8d 46 04             	lea    0x4(%esi),%eax
801006ae:	b9 01 00 00 00       	mov    $0x1,%ecx
801006b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006b6:	8b 06                	mov    (%esi),%eax
801006b8:	ba 0a 00 00 00       	mov    $0xa,%edx
801006bd:	e8 ae fe ff ff       	call   80100570 <printint>
801006c2:	8b 75 e4             	mov    -0x1c(%ebp),%esi

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006c5:	83 c3 01             	add    $0x1,%ebx
801006c8:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006cc:	85 c0                	test   %eax,%eax
801006ce:	74 15                	je     801006e5 <cprintf+0x95>
    if(c != '%'){
801006d0:	83 f8 25             	cmp    $0x25,%eax
801006d3:	74 b3                	je     80100688 <cprintf+0x38>
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
      consputc(c);
801006d5:	e8 06 fd ff ff       	call   801003e0 <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006da:	83 c3 01             	add    $0x1,%ebx
801006dd:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e1:	85 c0                	test   %eax,%eax
801006e3:	75 eb                	jne    801006d0 <cprintf+0x80>
      consputc(c);
      break;
    }
  }

  if(locking)
801006e5:	8b 45 e0             	mov    -0x20(%ebp),%eax
801006e8:	85 c0                	test   %eax,%eax
801006ea:	74 0c                	je     801006f8 <cprintf+0xa8>
    release(&cons.lock);
801006ec:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
801006f3:	e8 18 3c 00 00       	call   80104310 <release>
}
801006f8:	83 c4 1c             	add    $0x1c,%esp
801006fb:	5b                   	pop    %ebx
801006fc:	5e                   	pop    %esi
801006fd:	5f                   	pop    %edi
801006fe:	5d                   	pop    %ebp
801006ff:	c3                   	ret    
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100700:	83 fa 73             	cmp    $0x73,%edx
80100703:	74 53                	je     80100758 <cprintf+0x108>
80100705:	83 fa 78             	cmp    $0x78,%edx
80100708:	75 1e                	jne    80100728 <cprintf+0xd8>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
8010070a:	8d 46 04             	lea    0x4(%esi),%eax
8010070d:	31 c9                	xor    %ecx,%ecx
8010070f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100712:	8b 06                	mov    (%esi),%eax
80100714:	ba 10 00 00 00       	mov    $0x10,%edx
80100719:	e8 52 fe ff ff       	call   80100570 <printint>
8010071e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
      break;
80100721:	eb a2                	jmp    801006c5 <cprintf+0x75>
80100723:	90                   	nop
80100724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
80100728:	b8 25 00 00 00       	mov    $0x25,%eax
8010072d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100730:	e8 ab fc ff ff       	call   801003e0 <consputc>
      consputc(c);
80100735:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100738:	89 d0                	mov    %edx,%eax
8010073a:	e8 a1 fc ff ff       	call   801003e0 <consputc>
8010073f:	eb 99                	jmp    801006da <cprintf+0x8a>
80100741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	e8 8e fc ff ff       	call   801003e0 <consputc>
      break;
80100752:	e9 6e ff ff ff       	jmp    801006c5 <cprintf+0x75>
80100757:	90                   	nop
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100758:	8d 46 04             	lea    0x4(%esi),%eax
8010075b:	8b 36                	mov    (%esi),%esi
8010075d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        s = "(null)";
80100760:	b8 e0 6d 10 80       	mov    $0x80106de0,%eax
80100765:	85 f6                	test   %esi,%esi
80100767:	0f 44 f0             	cmove  %eax,%esi
      for(; *s; s++)
8010076a:	0f be 06             	movsbl (%esi),%eax
8010076d:	84 c0                	test   %al,%al
8010076f:	74 16                	je     80100787 <cprintf+0x137>
80100771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100778:	83 c6 01             	add    $0x1,%esi
        consputc(*s);
8010077b:	e8 60 fc ff ff       	call   801003e0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
80100780:	0f be 06             	movsbl (%esi),%eax
80100783:	84 c0                	test   %al,%al
80100785:	75 f1                	jne    80100778 <cprintf+0x128>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100787:	8b 75 e4             	mov    -0x1c(%ebp),%esi
8010078a:	e9 36 ff ff ff       	jmp    801006c5 <cprintf+0x75>
8010078f:	90                   	nop
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
80100790:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100797:	e8 44 3a 00 00       	call   801041e0 <acquire>
8010079c:	e9 c8 fe ff ff       	jmp    80100669 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007a1:	c7 04 24 e7 6d 10 80 	movl   $0x80106de7,(%esp)
801007a8:	e8 b3 fb ff ff       	call   80100360 <panic>
801007ad:	8d 76 00             	lea    0x0(%esi),%esi

801007b0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007b0:	55                   	push   %ebp
801007b1:	89 e5                	mov    %esp,%ebp
801007b3:	57                   	push   %edi
801007b4:	56                   	push   %esi
  int c, doprocdump = 0;
801007b5:	31 f6                	xor    %esi,%esi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007b7:	53                   	push   %ebx
801007b8:	83 ec 1c             	sub    $0x1c,%esp
801007bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007be:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
801007c5:	e8 16 3a 00 00       	call   801041e0 <acquire>
801007ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  while((c = getc()) >= 0){
801007d0:	ff d3                	call   *%ebx
801007d2:	85 c0                	test   %eax,%eax
801007d4:	89 c7                	mov    %eax,%edi
801007d6:	78 48                	js     80100820 <consoleintr+0x70>
    switch(c){
801007d8:	83 ff 10             	cmp    $0x10,%edi
801007db:	0f 84 2f 01 00 00    	je     80100910 <consoleintr+0x160>
801007e1:	7e 5d                	jle    80100840 <consoleintr+0x90>
801007e3:	83 ff 15             	cmp    $0x15,%edi
801007e6:	0f 84 d4 00 00 00    	je     801008c0 <consoleintr+0x110>
801007ec:	83 ff 7f             	cmp    $0x7f,%edi
801007ef:	90                   	nop
801007f0:	75 53                	jne    80100845 <consoleintr+0x95>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
801007f2:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
801007f7:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801007fd:	74 d1                	je     801007d0 <consoleintr+0x20>
        input.e--;
801007ff:	83 e8 01             	sub    $0x1,%eax
80100802:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100807:	b8 00 01 00 00       	mov    $0x100,%eax
8010080c:	e8 cf fb ff ff       	call   801003e0 <consputc>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
80100811:	ff d3                	call   *%ebx
80100813:	85 c0                	test   %eax,%eax
80100815:	89 c7                	mov    %eax,%edi
80100817:	79 bf                	jns    801007d8 <consoleintr+0x28>
80100819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100820:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100827:	e8 e4 3a 00 00       	call   80104310 <release>
  if(doprocdump) {
8010082c:	85 f6                	test   %esi,%esi
8010082e:	0f 85 ec 00 00 00    	jne    80100920 <consoleintr+0x170>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100834:	83 c4 1c             	add    $0x1c,%esp
80100837:	5b                   	pop    %ebx
80100838:	5e                   	pop    %esi
80100839:	5f                   	pop    %edi
8010083a:	5d                   	pop    %ebp
8010083b:	c3                   	ret    
8010083c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100840:	83 ff 08             	cmp    $0x8,%edi
80100843:	74 ad                	je     801007f2 <consoleintr+0x42>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100845:	85 ff                	test   %edi,%edi
80100847:	74 87                	je     801007d0 <consoleintr+0x20>
80100849:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010084e:	89 c2                	mov    %eax,%edx
80100850:	2b 15 c0 ff 10 80    	sub    0x8010ffc0,%edx
80100856:	83 fa 7f             	cmp    $0x7f,%edx
80100859:	0f 87 71 ff ff ff    	ja     801007d0 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010085f:	8d 50 01             	lea    0x1(%eax),%edx
80100862:	83 e0 7f             	and    $0x7f,%eax
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
80100865:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
80100868:	89 15 c8 ff 10 80    	mov    %edx,0x8010ffc8
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
8010086e:	0f 84 b8 00 00 00    	je     8010092c <consoleintr+0x17c>
        input.buf[input.e++ % INPUT_BUF] = c;
80100874:	89 f9                	mov    %edi,%ecx
80100876:	88 88 40 ff 10 80    	mov    %cl,-0x7fef00c0(%eax)
        consputc(c);
8010087c:	89 f8                	mov    %edi,%eax
8010087e:	e8 5d fb ff ff       	call   801003e0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
80100883:	83 ff 04             	cmp    $0x4,%edi
80100886:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010088b:	74 19                	je     801008a6 <consoleintr+0xf6>
8010088d:	83 ff 0a             	cmp    $0xa,%edi
80100890:	74 14                	je     801008a6 <consoleintr+0xf6>
80100892:	8b 0d c0 ff 10 80    	mov    0x8010ffc0,%ecx
80100898:	8d 91 80 00 00 00    	lea    0x80(%ecx),%edx
8010089e:	39 d0                	cmp    %edx,%eax
801008a0:	0f 85 2a ff ff ff    	jne    801007d0 <consoleintr+0x20>
          input.w = input.e;
          wakeup(&input.r);
801008a6:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
801008ad:	a3 c4 ff 10 80       	mov    %eax,0x8010ffc4
          wakeup(&input.r);
801008b2:	e8 c9 35 00 00       	call   80103e80 <wakeup>
801008b7:	e9 14 ff ff ff       	jmp    801007d0 <consoleintr+0x20>
801008bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
801008c0:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
801008c5:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801008cb:	75 2b                	jne    801008f8 <consoleintr+0x148>
801008cd:	e9 fe fe ff ff       	jmp    801007d0 <consoleintr+0x20>
801008d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
801008d8:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
801008dd:	b8 00 01 00 00       	mov    $0x100,%eax
801008e2:	e8 f9 fa ff ff       	call   801003e0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
801008e7:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
801008ec:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801008f2:	0f 84 d8 fe ff ff    	je     801007d0 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
801008f8:	83 e8 01             	sub    $0x1,%eax
801008fb:	89 c2                	mov    %eax,%edx
801008fd:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100900:	80 ba 40 ff 10 80 0a 	cmpb   $0xa,-0x7fef00c0(%edx)
80100907:	75 cf                	jne    801008d8 <consoleintr+0x128>
80100909:	e9 c2 fe ff ff       	jmp    801007d0 <consoleintr+0x20>
8010090e:	66 90                	xchg   %ax,%ax
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
80100910:	be 01 00 00 00       	mov    $0x1,%esi
80100915:	e9 b6 fe ff ff       	jmp    801007d0 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100920:	83 c4 1c             	add    $0x1c,%esp
80100923:	5b                   	pop    %ebx
80100924:	5e                   	pop    %esi
80100925:	5f                   	pop    %edi
80100926:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100927:	e9 34 36 00 00       	jmp    80103f60 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010092c:	c6 80 40 ff 10 80 0a 	movb   $0xa,-0x7fef00c0(%eax)
        consputc(c);
80100933:	b8 0a 00 00 00       	mov    $0xa,%eax
80100938:	e8 a3 fa ff ff       	call   801003e0 <consputc>
8010093d:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100942:	e9 5f ff ff ff       	jmp    801008a6 <consoleintr+0xf6>
80100947:	89 f6                	mov    %esi,%esi
80100949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100950 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
80100950:	55                   	push   %ebp
80100951:	89 e5                	mov    %esp,%ebp
80100953:	83 ec 18             	sub    $0x18,%esp
  initlock(&cons.lock, "console");
80100956:	c7 44 24 04 f0 6d 10 	movl   $0x80106df0,0x4(%esp)
8010095d:	80 
8010095e:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100965:	e8 f6 37 00 00       	call   80104160 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  picenable(IRQ_KBD);
8010096a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
80100971:	c7 05 8c 09 11 80 f0 	movl   $0x801005f0,0x8011098c
80100978:	05 10 80 
  devsw[CONSOLE].read = consoleread;
8010097b:	c7 05 88 09 11 80 70 	movl   $0x80100270,0x80110988
80100982:	02 10 80 
  cons.locking = 1;
80100985:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
8010098c:	00 00 00 

  picenable(IRQ_KBD);
8010098f:	e8 5c 28 00 00       	call   801031f0 <picenable>
  ioapicenable(IRQ_KBD, 0);
80100994:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010099b:	00 
8010099c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801009a3:	e8 f8 18 00 00       	call   801022a0 <ioapicenable>
}
801009a8:	c9                   	leave  
801009a9:	c3                   	ret    
801009aa:	66 90                	xchg   %ax,%ax
801009ac:	66 90                	xchg   %ax,%ax
801009ae:	66 90                	xchg   %ax,%ax

801009b0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009b0:	55                   	push   %ebp
801009b1:	89 e5                	mov    %esp,%ebp
801009b3:	57                   	push   %edi
801009b4:	56                   	push   %esi
801009b5:	53                   	push   %ebx
801009b6:	81 ec 1c 01 00 00    	sub    $0x11c,%esp
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;

  begin_op();
801009bc:	e8 bf 21 00 00       	call   80102b80 <begin_op>

  if((ip = namei(path)) == 0){
801009c1:	8b 45 08             	mov    0x8(%ebp),%eax
801009c4:	89 04 24             	mov    %eax,(%esp)
801009c7:	e8 14 15 00 00       	call   80101ee0 <namei>
801009cc:	85 c0                	test   %eax,%eax
801009ce:	89 c3                	mov    %eax,%ebx
801009d0:	74 37                	je     80100a09 <exec+0x59>
    end_op();
    return -1;
  }
  ilock(ip);
801009d2:	89 04 24             	mov    %eax,(%esp)
801009d5:	e8 d6 0c 00 00       	call   801016b0 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
801009da:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
801009e0:	c7 44 24 0c 34 00 00 	movl   $0x34,0xc(%esp)
801009e7:	00 
801009e8:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
801009ef:	00 
801009f0:	89 44 24 04          	mov    %eax,0x4(%esp)
801009f4:	89 1c 24             	mov    %ebx,(%esp)
801009f7:	e8 44 0f 00 00       	call   80101940 <readi>
801009fc:	83 f8 34             	cmp    $0x34,%eax
801009ff:	74 1f                	je     80100a20 <exec+0x70>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a01:	89 1c 24             	mov    %ebx,(%esp)
80100a04:	e8 e7 0e 00 00       	call   801018f0 <iunlockput>
    end_op();
80100a09:	e8 e2 21 00 00       	call   80102bf0 <end_op>
  }
  return -1;
80100a0e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a13:	81 c4 1c 01 00 00    	add    $0x11c,%esp
80100a19:	5b                   	pop    %ebx
80100a1a:	5e                   	pop    %esi
80100a1b:	5f                   	pop    %edi
80100a1c:	5d                   	pop    %ebp
80100a1d:	c3                   	ret    
80100a1e:	66 90                	xchg   %ax,%ax
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a20:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a27:	45 4c 46 
80100a2a:	75 d5                	jne    80100a01 <exec+0x51>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a2c:	e8 ef 5c 00 00       	call   80106720 <setupkvm>
80100a31:	85 c0                	test   %eax,%eax
80100a33:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a39:	74 c6                	je     80100a01 <exec+0x51>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a3b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a42:	00 
80100a43:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi

  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  sz = 0;
80100a49:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100a50:	00 00 00 
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a53:	0f 84 da 00 00 00    	je     80100b33 <exec+0x183>
80100a59:	31 ff                	xor    %edi,%edi
80100a5b:	eb 18                	jmp    80100a75 <exec+0xc5>
80100a5d:	8d 76 00             	lea    0x0(%esi),%esi
80100a60:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100a67:	83 c7 01             	add    $0x1,%edi
80100a6a:	83 c6 20             	add    $0x20,%esi
80100a6d:	39 f8                	cmp    %edi,%eax
80100a6f:	0f 8e be 00 00 00    	jle    80100b33 <exec+0x183>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100a75:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100a7b:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
80100a82:	00 
80100a83:	89 74 24 08          	mov    %esi,0x8(%esp)
80100a87:	89 44 24 04          	mov    %eax,0x4(%esp)
80100a8b:	89 1c 24             	mov    %ebx,(%esp)
80100a8e:	e8 ad 0e 00 00       	call   80101940 <readi>
80100a93:	83 f8 20             	cmp    $0x20,%eax
80100a96:	0f 85 84 00 00 00    	jne    80100b20 <exec+0x170>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100a9c:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100aa3:	75 bb                	jne    80100a60 <exec+0xb0>
      continue;
    if(ph.memsz < ph.filesz)
80100aa5:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100aab:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ab1:	72 6d                	jb     80100b20 <exec+0x170>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100ab3:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ab9:	72 65                	jb     80100b20 <exec+0x170>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100abb:	89 44 24 08          	mov    %eax,0x8(%esp)
80100abf:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100ac5:	89 44 24 04          	mov    %eax,0x4(%esp)
80100ac9:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100acf:	89 04 24             	mov    %eax,(%esp)
80100ad2:	e8 19 5f 00 00       	call   801069f0 <allocuvm>
80100ad7:	85 c0                	test   %eax,%eax
80100ad9:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100adf:	74 3f                	je     80100b20 <exec+0x170>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100ae1:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100ae7:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100aec:	75 32                	jne    80100b20 <exec+0x170>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100aee:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
80100af4:	89 44 24 04          	mov    %eax,0x4(%esp)
80100af8:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100afe:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80100b02:	89 54 24 10          	mov    %edx,0x10(%esp)
80100b06:	8b 95 08 ff ff ff    	mov    -0xf8(%ebp),%edx
80100b0c:	89 04 24             	mov    %eax,(%esp)
80100b0f:	89 54 24 0c          	mov    %edx,0xc(%esp)
80100b13:	e8 18 5e 00 00       	call   80106930 <loaduvm>
80100b18:	85 c0                	test   %eax,%eax
80100b1a:	0f 89 40 ff ff ff    	jns    80100a60 <exec+0xb0>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b20:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100b26:	89 04 24             	mov    %eax,(%esp)
80100b29:	e8 d2 5f 00 00       	call   80106b00 <freevm>
80100b2e:	e9 ce fe ff ff       	jmp    80100a01 <exec+0x51>
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b33:	89 1c 24             	mov    %ebx,(%esp)
80100b36:	e8 b5 0d 00 00       	call   801018f0 <iunlockput>
80100b3b:	90                   	nop
80100b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  end_op();
80100b40:	e8 ab 20 00 00       	call   80102bf0 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b45:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100b4b:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b50:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b55:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b5b:	89 44 24 04          	mov    %eax,0x4(%esp)
80100b5f:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100b65:	89 54 24 08          	mov    %edx,0x8(%esp)
80100b69:	89 04 24             	mov    %eax,(%esp)
80100b6c:	e8 7f 5e 00 00       	call   801069f0 <allocuvm>
80100b71:	85 c0                	test   %eax,%eax
80100b73:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b79:	75 18                	jne    80100b93 <exec+0x1e3>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b7b:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100b81:	89 04 24             	mov    %eax,(%esp)
80100b84:	e8 77 5f 00 00       	call   80106b00 <freevm>
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100b89:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100b8e:	e9 80 fe ff ff       	jmp    80100a13 <exec+0x63>
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100b93:	8b 9d ec fe ff ff    	mov    -0x114(%ebp),%ebx
80100b99:	89 d8                	mov    %ebx,%eax
80100b9b:	2d 00 20 00 00       	sub    $0x2000,%eax
80100ba0:	89 44 24 04          	mov    %eax,0x4(%esp)
80100ba4:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100baa:	89 04 24             	mov    %eax,(%esp)
80100bad:	e8 ce 5f 00 00       	call   80106b80 <clearpteu>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bb2:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bb5:	8b 00                	mov    (%eax),%eax
80100bb7:	85 c0                	test   %eax,%eax
80100bb9:	0f 84 66 01 00 00    	je     80100d25 <exec+0x375>
80100bbf:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100bc2:	31 f6                	xor    %esi,%esi
80100bc4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80100bc7:	89 f2                	mov    %esi,%edx
80100bc9:	89 fe                	mov    %edi,%esi
80100bcb:	89 d7                	mov    %edx,%edi
80100bcd:	83 c1 04             	add    $0x4,%ecx
80100bd0:	eb 0e                	jmp    80100be0 <exec+0x230>
80100bd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100bd8:	83 c1 04             	add    $0x4,%ecx
    if(argc >= MAXARG)
80100bdb:	83 ff 20             	cmp    $0x20,%edi
80100bde:	74 9b                	je     80100b7b <exec+0x1cb>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100be0:	89 04 24             	mov    %eax,(%esp)
80100be3:	89 8d f0 fe ff ff    	mov    %ecx,-0x110(%ebp)
80100be9:	e8 92 39 00 00       	call   80104580 <strlen>
80100bee:	f7 d0                	not    %eax
80100bf0:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100bf2:	8b 06                	mov    (%esi),%eax

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100bf4:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100bf7:	89 04 24             	mov    %eax,(%esp)
80100bfa:	e8 81 39 00 00       	call   80104580 <strlen>
80100bff:	83 c0 01             	add    $0x1,%eax
80100c02:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100c06:	8b 06                	mov    (%esi),%eax
80100c08:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80100c0c:	89 44 24 08          	mov    %eax,0x8(%esp)
80100c10:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100c16:	89 04 24             	mov    %eax,(%esp)
80100c19:	e8 c2 60 00 00       	call   80106ce0 <copyout>
80100c1e:	85 c0                	test   %eax,%eax
80100c20:	0f 88 55 ff ff ff    	js     80100b7b <exec+0x1cb>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c26:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c2c:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c32:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c39:	83 c7 01             	add    $0x1,%edi
80100c3c:	8b 01                	mov    (%ecx),%eax
80100c3e:	89 ce                	mov    %ecx,%esi
80100c40:	85 c0                	test   %eax,%eax
80100c42:	75 94                	jne    80100bd8 <exec+0x228>
80100c44:	89 fe                	mov    %edi,%esi
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c46:	8d 04 b5 04 00 00 00 	lea    0x4(,%esi,4),%eax
80100c4d:	89 d9                	mov    %ebx,%ecx
80100c4f:	29 c1                	sub    %eax,%ecx

  sp -= (3+argc+1) * 4;
80100c51:	83 c0 0c             	add    $0xc,%eax
80100c54:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c56:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100c5a:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100c60:	89 54 24 08          	mov    %edx,0x8(%esp)
80100c64:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100c68:	c7 84 b5 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%esi,4)
80100c6f:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c73:	89 04 24             	mov    %eax,(%esp)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
80100c76:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c7d:	ff ff ff 
  ustack[1] = argc;
80100c80:	89 b5 5c ff ff ff    	mov    %esi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c86:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c8c:	e8 4f 60 00 00       	call   80106ce0 <copyout>
80100c91:	85 c0                	test   %eax,%eax
80100c93:	0f 88 e2 fe ff ff    	js     80100b7b <exec+0x1cb>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100c99:	8b 45 08             	mov    0x8(%ebp),%eax
80100c9c:	0f b6 10             	movzbl (%eax),%edx
80100c9f:	84 d2                	test   %dl,%dl
80100ca1:	74 19                	je     80100cbc <exec+0x30c>
80100ca3:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100ca6:	83 c0 01             	add    $0x1,%eax
    if(*s == '/')
      last = s+1;
80100ca9:	80 fa 2f             	cmp    $0x2f,%dl
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cac:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
      last = s+1;
80100caf:	0f 44 c8             	cmove  %eax,%ecx
80100cb2:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cb5:	84 d2                	test   %dl,%dl
80100cb7:	75 f0                	jne    80100ca9 <exec+0x2f9>
80100cb9:	89 4d 08             	mov    %ecx,0x8(%ebp)
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));
80100cbc:	8b 45 08             	mov    0x8(%ebp),%eax
80100cbf:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80100cc6:	00 
80100cc7:	89 44 24 04          	mov    %eax,0x4(%esp)
80100ccb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cd1:	83 c0 6c             	add    $0x6c,%eax
80100cd4:	89 04 24             	mov    %eax,(%esp)
80100cd7:	e8 64 38 00 00       	call   80104540 <safestrcpy>

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100cdc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  proc->pgdir = pgdir;
80100ce2:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100ce8:	8b 70 04             	mov    0x4(%eax),%esi
  proc->pgdir = pgdir;
80100ceb:	89 48 04             	mov    %ecx,0x4(%eax)
  proc->sz = sz;
80100cee:	8b 8d ec fe ff ff    	mov    -0x114(%ebp),%ecx
80100cf4:	89 08                	mov    %ecx,(%eax)
  proc->tf->eip = elf.entry;  // main
80100cf6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cfc:	8b 8d 3c ff ff ff    	mov    -0xc4(%ebp),%ecx
80100d02:	8b 50 18             	mov    0x18(%eax),%edx
80100d05:	89 4a 38             	mov    %ecx,0x38(%edx)
  proc->tf->esp = sp;
80100d08:	8b 50 18             	mov    0x18(%eax),%edx
80100d0b:	89 5a 44             	mov    %ebx,0x44(%edx)
  switchuvm(proc);
80100d0e:	89 04 24             	mov    %eax,(%esp)
80100d11:	e8 ca 5a 00 00       	call   801067e0 <switchuvm>
  freevm(oldpgdir);
80100d16:	89 34 24             	mov    %esi,(%esp)
80100d19:	e8 e2 5d 00 00       	call   80106b00 <freevm>
  return 0;
80100d1e:	31 c0                	xor    %eax,%eax
80100d20:	e9 ee fc ff ff       	jmp    80100a13 <exec+0x63>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100d25:	8b 9d ec fe ff ff    	mov    -0x114(%ebp),%ebx
80100d2b:	31 f6                	xor    %esi,%esi
80100d2d:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100d33:	e9 0e ff ff ff       	jmp    80100c46 <exec+0x296>
80100d38:	66 90                	xchg   %ax,%ax
80100d3a:	66 90                	xchg   %ax,%ax
80100d3c:	66 90                	xchg   %ax,%ax
80100d3e:	66 90                	xchg   %ax,%ax

80100d40 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d40:	55                   	push   %ebp
80100d41:	89 e5                	mov    %esp,%ebp
80100d43:	83 ec 18             	sub    $0x18,%esp
  initlock(&ftable.lock, "ftable");
80100d46:	c7 44 24 04 09 6e 10 	movl   $0x80106e09,0x4(%esp)
80100d4d:	80 
80100d4e:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100d55:	e8 06 34 00 00       	call   80104160 <initlock>
}
80100d5a:	c9                   	leave  
80100d5b:	c3                   	ret    
80100d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100d60 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d64:	bb 14 00 11 80       	mov    $0x80110014,%ebx
}

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d69:	83 ec 14             	sub    $0x14,%esp
  struct file *f;

  acquire(&ftable.lock);
80100d6c:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100d73:	e8 68 34 00 00       	call   801041e0 <acquire>
80100d78:	eb 11                	jmp    80100d8b <filealloc+0x2b>
80100d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d80:	83 c3 18             	add    $0x18,%ebx
80100d83:	81 fb 74 09 11 80    	cmp    $0x80110974,%ebx
80100d89:	74 25                	je     80100db0 <filealloc+0x50>
    if(f->ref == 0){
80100d8b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d8e:	85 c0                	test   %eax,%eax
80100d90:	75 ee                	jne    80100d80 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100d92:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
80100d99:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100da0:	e8 6b 35 00 00       	call   80104310 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100da5:	83 c4 14             	add    $0x14,%esp
  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
      release(&ftable.lock);
      return f;
80100da8:	89 d8                	mov    %ebx,%eax
    }
  }
  release(&ftable.lock);
  return 0;
}
80100daa:	5b                   	pop    %ebx
80100dab:	5d                   	pop    %ebp
80100dac:	c3                   	ret    
80100dad:	8d 76 00             	lea    0x0(%esi),%esi
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100db0:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100db7:	e8 54 35 00 00       	call   80104310 <release>
  return 0;
}
80100dbc:	83 c4 14             	add    $0x14,%esp
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
80100dbf:	31 c0                	xor    %eax,%eax
}
80100dc1:	5b                   	pop    %ebx
80100dc2:	5d                   	pop    %ebp
80100dc3:	c3                   	ret    
80100dc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100dca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100dd0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100dd0:	55                   	push   %ebp
80100dd1:	89 e5                	mov    %esp,%ebp
80100dd3:	53                   	push   %ebx
80100dd4:	83 ec 14             	sub    $0x14,%esp
80100dd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dda:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100de1:	e8 fa 33 00 00       	call   801041e0 <acquire>
  if(f->ref < 1)
80100de6:	8b 43 04             	mov    0x4(%ebx),%eax
80100de9:	85 c0                	test   %eax,%eax
80100deb:	7e 1a                	jle    80100e07 <filedup+0x37>
    panic("filedup");
  f->ref++;
80100ded:	83 c0 01             	add    $0x1,%eax
80100df0:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100df3:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100dfa:	e8 11 35 00 00       	call   80104310 <release>
  return f;
}
80100dff:	83 c4 14             	add    $0x14,%esp
80100e02:	89 d8                	mov    %ebx,%eax
80100e04:	5b                   	pop    %ebx
80100e05:	5d                   	pop    %ebp
80100e06:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
80100e07:	c7 04 24 10 6e 10 80 	movl   $0x80106e10,(%esp)
80100e0e:	e8 4d f5 ff ff       	call   80100360 <panic>
80100e13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e20 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e20:	55                   	push   %ebp
80100e21:	89 e5                	mov    %esp,%ebp
80100e23:	57                   	push   %edi
80100e24:	56                   	push   %esi
80100e25:	53                   	push   %ebx
80100e26:	83 ec 1c             	sub    $0x1c,%esp
80100e29:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e2c:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100e33:	e8 a8 33 00 00       	call   801041e0 <acquire>
  if(f->ref < 1)
80100e38:	8b 57 04             	mov    0x4(%edi),%edx
80100e3b:	85 d2                	test   %edx,%edx
80100e3d:	0f 8e 89 00 00 00    	jle    80100ecc <fileclose+0xac>
    panic("fileclose");
  if(--f->ref > 0){
80100e43:	83 ea 01             	sub    $0x1,%edx
80100e46:	85 d2                	test   %edx,%edx
80100e48:	89 57 04             	mov    %edx,0x4(%edi)
80100e4b:	74 13                	je     80100e60 <fileclose+0x40>
    release(&ftable.lock);
80100e4d:	c7 45 08 e0 ff 10 80 	movl   $0x8010ffe0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e54:	83 c4 1c             	add    $0x1c,%esp
80100e57:	5b                   	pop    %ebx
80100e58:	5e                   	pop    %esi
80100e59:	5f                   	pop    %edi
80100e5a:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
80100e5b:	e9 b0 34 00 00       	jmp    80104310 <release>
    return;
  }
  ff = *f;
80100e60:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e64:	8b 37                	mov    (%edi),%esi
80100e66:	8b 5f 0c             	mov    0xc(%edi),%ebx
  f->ref = 0;
  f->type = FD_NONE;
80100e69:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e6f:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e72:	8b 47 10             	mov    0x10(%edi),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e75:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e7c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e7f:	e8 8c 34 00 00       	call   80104310 <release>

  if(ff.type == FD_PIPE)
80100e84:	83 fe 01             	cmp    $0x1,%esi
80100e87:	74 0f                	je     80100e98 <fileclose+0x78>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100e89:	83 fe 02             	cmp    $0x2,%esi
80100e8c:	74 22                	je     80100eb0 <fileclose+0x90>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e8e:	83 c4 1c             	add    $0x1c,%esp
80100e91:	5b                   	pop    %ebx
80100e92:	5e                   	pop    %esi
80100e93:	5f                   	pop    %edi
80100e94:	5d                   	pop    %ebp
80100e95:	c3                   	ret    
80100e96:	66 90                	xchg   %ax,%ax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
80100e98:	0f be 75 e7          	movsbl -0x19(%ebp),%esi
80100e9c:	89 1c 24             	mov    %ebx,(%esp)
80100e9f:	89 74 24 04          	mov    %esi,0x4(%esp)
80100ea3:	e8 f8 24 00 00       	call   801033a0 <pipeclose>
80100ea8:	eb e4                	jmp    80100e8e <fileclose+0x6e>
80100eaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  else if(ff.type == FD_INODE){
    begin_op();
80100eb0:	e8 cb 1c 00 00       	call   80102b80 <begin_op>
    iput(ff.ip);
80100eb5:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100eb8:	89 04 24             	mov    %eax,(%esp)
80100ebb:	e8 00 09 00 00       	call   801017c0 <iput>
    end_op();
  }
}
80100ec0:	83 c4 1c             	add    $0x1c,%esp
80100ec3:	5b                   	pop    %ebx
80100ec4:	5e                   	pop    %esi
80100ec5:	5f                   	pop    %edi
80100ec6:	5d                   	pop    %ebp
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
80100ec7:	e9 24 1d 00 00       	jmp    80102bf0 <end_op>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
80100ecc:	c7 04 24 18 6e 10 80 	movl   $0x80106e18,(%esp)
80100ed3:	e8 88 f4 ff ff       	call   80100360 <panic>
80100ed8:	90                   	nop
80100ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100ee0 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100ee0:	55                   	push   %ebp
80100ee1:	89 e5                	mov    %esp,%ebp
80100ee3:	53                   	push   %ebx
80100ee4:	83 ec 14             	sub    $0x14,%esp
80100ee7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100eea:	83 3b 02             	cmpl   $0x2,(%ebx)
80100eed:	75 31                	jne    80100f20 <filestat+0x40>
    ilock(f->ip);
80100eef:	8b 43 10             	mov    0x10(%ebx),%eax
80100ef2:	89 04 24             	mov    %eax,(%esp)
80100ef5:	e8 b6 07 00 00       	call   801016b0 <ilock>
    stati(f->ip, st);
80100efa:	8b 45 0c             	mov    0xc(%ebp),%eax
80100efd:	89 44 24 04          	mov    %eax,0x4(%esp)
80100f01:	8b 43 10             	mov    0x10(%ebx),%eax
80100f04:	89 04 24             	mov    %eax,(%esp)
80100f07:	e8 04 0a 00 00       	call   80101910 <stati>
    iunlock(f->ip);
80100f0c:	8b 43 10             	mov    0x10(%ebx),%eax
80100f0f:	89 04 24             	mov    %eax,(%esp)
80100f12:	e8 69 08 00 00       	call   80101780 <iunlock>
    return 0;
  }
  return -1;
}
80100f17:	83 c4 14             	add    $0x14,%esp
{
  if(f->type == FD_INODE){
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
80100f1a:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f1c:	5b                   	pop    %ebx
80100f1d:	5d                   	pop    %ebp
80100f1e:	c3                   	ret    
80100f1f:	90                   	nop
80100f20:	83 c4 14             	add    $0x14,%esp
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
80100f23:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f28:	5b                   	pop    %ebx
80100f29:	5d                   	pop    %ebp
80100f2a:	c3                   	ret    
80100f2b:	90                   	nop
80100f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f30 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f30:	55                   	push   %ebp
80100f31:	89 e5                	mov    %esp,%ebp
80100f33:	57                   	push   %edi
80100f34:	56                   	push   %esi
80100f35:	53                   	push   %ebx
80100f36:	83 ec 1c             	sub    $0x1c,%esp
80100f39:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f3c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f3f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f42:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f46:	74 68                	je     80100fb0 <fileread+0x80>
    return -1;
  if(f->type == FD_PIPE)
80100f48:	8b 03                	mov    (%ebx),%eax
80100f4a:	83 f8 01             	cmp    $0x1,%eax
80100f4d:	74 49                	je     80100f98 <fileread+0x68>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f4f:	83 f8 02             	cmp    $0x2,%eax
80100f52:	75 63                	jne    80100fb7 <fileread+0x87>
    ilock(f->ip);
80100f54:	8b 43 10             	mov    0x10(%ebx),%eax
80100f57:	89 04 24             	mov    %eax,(%esp)
80100f5a:	e8 51 07 00 00       	call   801016b0 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f5f:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80100f63:	8b 43 14             	mov    0x14(%ebx),%eax
80100f66:	89 74 24 04          	mov    %esi,0x4(%esp)
80100f6a:	89 44 24 08          	mov    %eax,0x8(%esp)
80100f6e:	8b 43 10             	mov    0x10(%ebx),%eax
80100f71:	89 04 24             	mov    %eax,(%esp)
80100f74:	e8 c7 09 00 00       	call   80101940 <readi>
80100f79:	85 c0                	test   %eax,%eax
80100f7b:	89 c6                	mov    %eax,%esi
80100f7d:	7e 03                	jle    80100f82 <fileread+0x52>
      f->off += r;
80100f7f:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100f82:	8b 43 10             	mov    0x10(%ebx),%eax
80100f85:	89 04 24             	mov    %eax,(%esp)
80100f88:	e8 f3 07 00 00       	call   80101780 <iunlock>
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
    ilock(f->ip);
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f8d:	89 f0                	mov    %esi,%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100f8f:	83 c4 1c             	add    $0x1c,%esp
80100f92:	5b                   	pop    %ebx
80100f93:	5e                   	pop    %esi
80100f94:	5f                   	pop    %edi
80100f95:	5d                   	pop    %ebp
80100f96:	c3                   	ret    
80100f97:	90                   	nop
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100f98:	8b 43 0c             	mov    0xc(%ebx),%eax
80100f9b:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100f9e:	83 c4 1c             	add    $0x1c,%esp
80100fa1:	5b                   	pop    %ebx
80100fa2:	5e                   	pop    %esi
80100fa3:	5f                   	pop    %edi
80100fa4:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fa5:	e9 a6 25 00 00       	jmp    80103550 <piperead>
80100faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
80100fb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fb5:	eb d8                	jmp    80100f8f <fileread+0x5f>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
80100fb7:	c7 04 24 22 6e 10 80 	movl   $0x80106e22,(%esp)
80100fbe:	e8 9d f3 ff ff       	call   80100360 <panic>
80100fc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100fd0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	57                   	push   %edi
80100fd4:	56                   	push   %esi
80100fd5:	53                   	push   %ebx
80100fd6:	83 ec 2c             	sub    $0x2c,%esp
80100fd9:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fdc:	8b 7d 08             	mov    0x8(%ebp),%edi
80100fdf:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fe2:	8b 45 10             	mov    0x10(%ebp),%eax
  int r;

  if(f->writable == 0)
80100fe5:	80 7f 09 00          	cmpb   $0x0,0x9(%edi)

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fe9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
80100fec:	0f 84 ae 00 00 00    	je     801010a0 <filewrite+0xd0>
    return -1;
  if(f->type == FD_PIPE)
80100ff2:	8b 07                	mov    (%edi),%eax
80100ff4:	83 f8 01             	cmp    $0x1,%eax
80100ff7:	0f 84 c2 00 00 00    	je     801010bf <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100ffd:	83 f8 02             	cmp    $0x2,%eax
80101000:	0f 85 d7 00 00 00    	jne    801010dd <filewrite+0x10d>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101006:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101009:	31 db                	xor    %ebx,%ebx
8010100b:	85 c0                	test   %eax,%eax
8010100d:	7f 31                	jg     80101040 <filewrite+0x70>
8010100f:	e9 9c 00 00 00       	jmp    801010b0 <filewrite+0xe0>
80101014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
      iunlock(f->ip);
80101018:	8b 4f 10             	mov    0x10(%edi),%ecx
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
8010101b:	01 47 14             	add    %eax,0x14(%edi)
8010101e:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101021:	89 0c 24             	mov    %ecx,(%esp)
80101024:	e8 57 07 00 00       	call   80101780 <iunlock>
      end_op();
80101029:	e8 c2 1b 00 00       	call   80102bf0 <end_op>
8010102e:	8b 45 e0             	mov    -0x20(%ebp),%eax

      if(r < 0)
        break;
      if(r != n1)
80101031:	39 f0                	cmp    %esi,%eax
80101033:	0f 85 98 00 00 00    	jne    801010d1 <filewrite+0x101>
        panic("short filewrite");
      i += r;
80101039:	01 c3                	add    %eax,%ebx
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
8010103b:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
8010103e:	7e 70                	jle    801010b0 <filewrite+0xe0>
      int n1 = n - i;
80101040:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101043:	b8 00 1a 00 00       	mov    $0x1a00,%eax
80101048:	29 de                	sub    %ebx,%esi
8010104a:	81 fe 00 1a 00 00    	cmp    $0x1a00,%esi
80101050:	0f 4f f0             	cmovg  %eax,%esi
      if(n1 > max)
        n1 = max;

      begin_op();
80101053:	e8 28 1b 00 00       	call   80102b80 <begin_op>
      ilock(f->ip);
80101058:	8b 47 10             	mov    0x10(%edi),%eax
8010105b:	89 04 24             	mov    %eax,(%esp)
8010105e:	e8 4d 06 00 00       	call   801016b0 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101063:	89 74 24 0c          	mov    %esi,0xc(%esp)
80101067:	8b 47 14             	mov    0x14(%edi),%eax
8010106a:	89 44 24 08          	mov    %eax,0x8(%esp)
8010106e:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101071:	01 d8                	add    %ebx,%eax
80101073:	89 44 24 04          	mov    %eax,0x4(%esp)
80101077:	8b 47 10             	mov    0x10(%edi),%eax
8010107a:	89 04 24             	mov    %eax,(%esp)
8010107d:	e8 be 09 00 00       	call   80101a40 <writei>
80101082:	85 c0                	test   %eax,%eax
80101084:	7f 92                	jg     80101018 <filewrite+0x48>
        f->off += r;
      iunlock(f->ip);
80101086:	8b 4f 10             	mov    0x10(%edi),%ecx
80101089:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010108c:	89 0c 24             	mov    %ecx,(%esp)
8010108f:	e8 ec 06 00 00       	call   80101780 <iunlock>
      end_op();
80101094:	e8 57 1b 00 00       	call   80102bf0 <end_op>

      if(r < 0)
80101099:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010109c:	85 c0                	test   %eax,%eax
8010109e:	74 91                	je     80101031 <filewrite+0x61>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010a0:	83 c4 2c             	add    $0x2c,%esp
filewrite(struct file *f, char *addr, int n)
{
  int r;

  if(f->writable == 0)
    return -1;
801010a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010a8:	5b                   	pop    %ebx
801010a9:	5e                   	pop    %esi
801010aa:	5f                   	pop    %edi
801010ab:	5d                   	pop    %ebp
801010ac:	c3                   	ret    
801010ad:	8d 76 00             	lea    0x0(%esi),%esi
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010b0:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
801010b3:	89 d8                	mov    %ebx,%eax
801010b5:	75 e9                	jne    801010a0 <filewrite+0xd0>
  }
  panic("filewrite");
}
801010b7:	83 c4 2c             	add    $0x2c,%esp
801010ba:	5b                   	pop    %ebx
801010bb:	5e                   	pop    %esi
801010bc:	5f                   	pop    %edi
801010bd:	5d                   	pop    %ebp
801010be:	c3                   	ret    
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010bf:	8b 47 0c             	mov    0xc(%edi),%eax
801010c2:	89 45 08             	mov    %eax,0x8(%ebp)
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010c5:	83 c4 2c             	add    $0x2c,%esp
801010c8:	5b                   	pop    %ebx
801010c9:	5e                   	pop    %esi
801010ca:	5f                   	pop    %edi
801010cb:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010cc:	e9 5f 23 00 00       	jmp    80103430 <pipewrite>
      end_op();

      if(r < 0)
        break;
      if(r != n1)
        panic("short filewrite");
801010d1:	c7 04 24 2b 6e 10 80 	movl   $0x80106e2b,(%esp)
801010d8:	e8 83 f2 ff ff       	call   80100360 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
801010dd:	c7 04 24 31 6e 10 80 	movl   $0x80106e31,(%esp)
801010e4:	e8 77 f2 ff ff       	call   80100360 <panic>
801010e9:	66 90                	xchg   %ax,%ax
801010eb:	66 90                	xchg   %ax,%ax
801010ed:	66 90                	xchg   %ax,%ax
801010ef:	90                   	nop

801010f0 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801010f0:	55                   	push   %ebp
801010f1:	89 e5                	mov    %esp,%ebp
801010f3:	57                   	push   %edi
801010f4:	56                   	push   %esi
801010f5:	53                   	push   %ebx
801010f6:	83 ec 2c             	sub    $0x2c,%esp
801010f9:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801010fc:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101101:	85 c0                	test   %eax,%eax
80101103:	0f 84 8c 00 00 00    	je     80101195 <balloc+0xa5>
80101109:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101110:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101113:	89 f0                	mov    %esi,%eax
80101115:	c1 f8 0c             	sar    $0xc,%eax
80101118:	03 05 f8 09 11 80    	add    0x801109f8,%eax
8010111e:	89 44 24 04          	mov    %eax,0x4(%esp)
80101122:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101125:	89 04 24             	mov    %eax,(%esp)
80101128:	e8 a3 ef ff ff       	call   801000d0 <bread>
8010112d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101130:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101135:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101138:	31 c0                	xor    %eax,%eax
8010113a:	eb 33                	jmp    8010116f <balloc+0x7f>
8010113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101140:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101143:	89 c2                	mov    %eax,%edx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
80101145:	89 c1                	mov    %eax,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101147:	c1 fa 03             	sar    $0x3,%edx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
8010114a:	83 e1 07             	and    $0x7,%ecx
8010114d:	bf 01 00 00 00       	mov    $0x1,%edi
80101152:	d3 e7                	shl    %cl,%edi
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101154:	0f b6 5c 13 5c       	movzbl 0x5c(%ebx,%edx,1),%ebx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
80101159:	89 f9                	mov    %edi,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010115b:	0f b6 fb             	movzbl %bl,%edi
8010115e:	85 cf                	test   %ecx,%edi
80101160:	74 46                	je     801011a8 <balloc+0xb8>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101162:	83 c0 01             	add    $0x1,%eax
80101165:	83 c6 01             	add    $0x1,%esi
80101168:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010116d:	74 05                	je     80101174 <balloc+0x84>
8010116f:	3b 75 e0             	cmp    -0x20(%ebp),%esi
80101172:	72 cc                	jb     80101140 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
80101174:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101177:	89 04 24             	mov    %eax,(%esp)
8010117a:	e8 61 f0 ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
8010117f:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101186:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101189:	3b 05 e0 09 11 80    	cmp    0x801109e0,%eax
8010118f:	0f 82 7b ff ff ff    	jb     80101110 <balloc+0x20>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
80101195:	c7 04 24 3b 6e 10 80 	movl   $0x80106e3b,(%esp)
8010119c:	e8 bf f1 ff ff       	call   80100360 <panic>
801011a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011a8:	09 d9                	or     %ebx,%ecx
801011aa:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801011ad:	88 4c 13 5c          	mov    %cl,0x5c(%ebx,%edx,1)
        log_write(bp);
801011b1:	89 1c 24             	mov    %ebx,(%esp)
801011b4:	e8 67 1b 00 00       	call   80102d20 <log_write>
        brelse(bp);
801011b9:	89 1c 24             	mov    %ebx,(%esp)
801011bc:	e8 1f f0 ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011c1:	8b 45 d8             	mov    -0x28(%ebp),%eax
801011c4:	89 74 24 04          	mov    %esi,0x4(%esp)
801011c8:	89 04 24             	mov    %eax,(%esp)
801011cb:	e8 00 ef ff ff       	call   801000d0 <bread>
  memset(bp->data, 0, BSIZE);
801011d0:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
801011d7:	00 
801011d8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801011df:	00 
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011e0:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011e2:	8d 40 5c             	lea    0x5c(%eax),%eax
801011e5:	89 04 24             	mov    %eax,(%esp)
801011e8:	e8 73 31 00 00       	call   80104360 <memset>
  log_write(bp);
801011ed:	89 1c 24             	mov    %ebx,(%esp)
801011f0:	e8 2b 1b 00 00       	call   80102d20 <log_write>
  brelse(bp);
801011f5:	89 1c 24             	mov    %ebx,(%esp)
801011f8:	e8 e3 ef ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
801011fd:	83 c4 2c             	add    $0x2c,%esp
80101200:	89 f0                	mov    %esi,%eax
80101202:	5b                   	pop    %ebx
80101203:	5e                   	pop    %esi
80101204:	5f                   	pop    %edi
80101205:	5d                   	pop    %ebp
80101206:	c3                   	ret    
80101207:	89 f6                	mov    %esi,%esi
80101209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101210 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101210:	55                   	push   %ebp
80101211:	89 e5                	mov    %esp,%ebp
80101213:	57                   	push   %edi
80101214:	89 c7                	mov    %eax,%edi
80101216:	56                   	push   %esi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101217:	31 f6                	xor    %esi,%esi
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101219:	53                   	push   %ebx

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010121a:	bb 34 0a 11 80       	mov    $0x80110a34,%ebx
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
8010121f:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101222:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101229:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
8010122c:	e8 af 2f 00 00       	call   801041e0 <acquire>

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101231:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101234:	eb 14                	jmp    8010124a <iget+0x3a>
80101236:	66 90                	xchg   %ax,%ax
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101238:	85 f6                	test   %esi,%esi
8010123a:	74 3c                	je     80101278 <iget+0x68>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010123c:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101242:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101248:	74 46                	je     80101290 <iget+0x80>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
8010124a:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010124d:	85 c9                	test   %ecx,%ecx
8010124f:	7e e7                	jle    80101238 <iget+0x28>
80101251:	39 3b                	cmp    %edi,(%ebx)
80101253:	75 e3                	jne    80101238 <iget+0x28>
80101255:	39 53 04             	cmp    %edx,0x4(%ebx)
80101258:	75 de                	jne    80101238 <iget+0x28>
      ip->ref++;
8010125a:	83 c1 01             	add    $0x1,%ecx
      release(&icache.lock);
      return ip;
8010125d:	89 de                	mov    %ebx,%esi
  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
8010125f:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
80101266:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101269:	e8 a2 30 00 00       	call   80104310 <release>
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);

  return ip;
}
8010126e:	83 c4 1c             	add    $0x1c,%esp
80101271:	89 f0                	mov    %esi,%eax
80101273:	5b                   	pop    %ebx
80101274:	5e                   	pop    %esi
80101275:	5f                   	pop    %edi
80101276:	5d                   	pop    %ebp
80101277:	c3                   	ret    
80101278:	85 c9                	test   %ecx,%ecx
8010127a:	0f 44 f3             	cmove  %ebx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010127d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101283:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101289:	75 bf                	jne    8010124a <iget+0x3a>
8010128b:	90                   	nop
8010128c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101290:	85 f6                	test   %esi,%esi
80101292:	74 29                	je     801012bd <iget+0xad>
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
80101294:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101296:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
80101299:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->flags = 0;
801012a0:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801012a7:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
801012ae:	e8 5d 30 00 00       	call   80104310 <release>

  return ip;
}
801012b3:	83 c4 1c             	add    $0x1c,%esp
801012b6:	89 f0                	mov    %esi,%eax
801012b8:	5b                   	pop    %ebx
801012b9:	5e                   	pop    %esi
801012ba:	5f                   	pop    %edi
801012bb:	5d                   	pop    %ebp
801012bc:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
801012bd:	c7 04 24 51 6e 10 80 	movl   $0x80106e51,(%esp)
801012c4:	e8 97 f0 ff ff       	call   80100360 <panic>
801012c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801012d0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012d0:	55                   	push   %ebp
801012d1:	89 e5                	mov    %esp,%ebp
801012d3:	57                   	push   %edi
801012d4:	56                   	push   %esi
801012d5:	53                   	push   %ebx
801012d6:	89 c3                	mov    %eax,%ebx
801012d8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012db:	83 fa 0b             	cmp    $0xb,%edx
801012de:	77 18                	ja     801012f8 <bmap+0x28>
801012e0:	8d 34 90             	lea    (%eax,%edx,4),%esi
    if((addr = ip->addrs[bn]) == 0)
801012e3:	8b 46 5c             	mov    0x5c(%esi),%eax
801012e6:	85 c0                	test   %eax,%eax
801012e8:	74 66                	je     80101350 <bmap+0x80>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801012ea:	83 c4 1c             	add    $0x1c,%esp
801012ed:	5b                   	pop    %ebx
801012ee:	5e                   	pop    %esi
801012ef:	5f                   	pop    %edi
801012f0:	5d                   	pop    %ebp
801012f1:	c3                   	ret    
801012f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
801012f8:	8d 72 f4             	lea    -0xc(%edx),%esi

  if(bn < NINDIRECT){
801012fb:	83 fe 7f             	cmp    $0x7f,%esi
801012fe:	77 77                	ja     80101377 <bmap+0xa7>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101300:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101306:	85 c0                	test   %eax,%eax
80101308:	74 5e                	je     80101368 <bmap+0x98>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010130a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010130e:	8b 03                	mov    (%ebx),%eax
80101310:	89 04 24             	mov    %eax,(%esp)
80101313:	e8 b8 ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101318:	8d 54 b0 5c          	lea    0x5c(%eax,%esi,4),%edx

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010131c:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
8010131e:	8b 32                	mov    (%edx),%esi
80101320:	85 f6                	test   %esi,%esi
80101322:	75 19                	jne    8010133d <bmap+0x6d>
      a[bn] = addr = balloc(ip->dev);
80101324:	8b 03                	mov    (%ebx),%eax
80101326:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101329:	e8 c2 fd ff ff       	call   801010f0 <balloc>
8010132e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101331:	89 02                	mov    %eax,(%edx)
80101333:	89 c6                	mov    %eax,%esi
      log_write(bp);
80101335:	89 3c 24             	mov    %edi,(%esp)
80101338:	e8 e3 19 00 00       	call   80102d20 <log_write>
    }
    brelse(bp);
8010133d:	89 3c 24             	mov    %edi,(%esp)
80101340:	e8 9b ee ff ff       	call   801001e0 <brelse>
    return addr;
  }

  panic("bmap: out of range");
}
80101345:	83 c4 1c             	add    $0x1c,%esp
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
80101348:	89 f0                	mov    %esi,%eax
    return addr;
  }

  panic("bmap: out of range");
}
8010134a:	5b                   	pop    %ebx
8010134b:	5e                   	pop    %esi
8010134c:	5f                   	pop    %edi
8010134d:	5d                   	pop    %ebp
8010134e:	c3                   	ret    
8010134f:	90                   	nop
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
80101350:	8b 03                	mov    (%ebx),%eax
80101352:	e8 99 fd ff ff       	call   801010f0 <balloc>
80101357:	89 46 5c             	mov    %eax,0x5c(%esi)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010135a:	83 c4 1c             	add    $0x1c,%esp
8010135d:	5b                   	pop    %ebx
8010135e:	5e                   	pop    %esi
8010135f:	5f                   	pop    %edi
80101360:	5d                   	pop    %ebp
80101361:	c3                   	ret    
80101362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101368:	8b 03                	mov    (%ebx),%eax
8010136a:	e8 81 fd ff ff       	call   801010f0 <balloc>
8010136f:	89 83 8c 00 00 00    	mov    %eax,0x8c(%ebx)
80101375:	eb 93                	jmp    8010130a <bmap+0x3a>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
80101377:	c7 04 24 61 6e 10 80 	movl   $0x80106e61,(%esp)
8010137e:	e8 dd ef ff ff       	call   80100360 <panic>
80101383:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101390 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
80101390:	55                   	push   %ebp
80101391:	89 e5                	mov    %esp,%ebp
80101393:	56                   	push   %esi
80101394:	53                   	push   %ebx
80101395:	83 ec 10             	sub    $0x10,%esp
  struct buf *bp;

  bp = bread(dev, 1);
80101398:	8b 45 08             	mov    0x8(%ebp),%eax
8010139b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
801013a2:	00 
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801013a3:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
801013a6:	89 04 24             	mov    %eax,(%esp)
801013a9:	e8 22 ed ff ff       	call   801000d0 <bread>
  memmove(sb, bp->data, sizeof(*sb));
801013ae:	89 34 24             	mov    %esi,(%esp)
801013b1:	c7 44 24 08 1c 00 00 	movl   $0x1c,0x8(%esp)
801013b8:	00 
void
readsb(int dev, struct superblock *sb)
{
  struct buf *bp;

  bp = bread(dev, 1);
801013b9:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013bb:	8d 40 5c             	lea    0x5c(%eax),%eax
801013be:	89 44 24 04          	mov    %eax,0x4(%esp)
801013c2:	e8 39 30 00 00       	call   80104400 <memmove>
  brelse(bp);
801013c7:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801013ca:	83 c4 10             	add    $0x10,%esp
801013cd:	5b                   	pop    %ebx
801013ce:	5e                   	pop    %esi
801013cf:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
801013d0:	e9 0b ee ff ff       	jmp    801001e0 <brelse>
801013d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801013d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013e0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801013e0:	55                   	push   %ebp
801013e1:	89 e5                	mov    %esp,%ebp
801013e3:	57                   	push   %edi
801013e4:	89 d7                	mov    %edx,%edi
801013e6:	56                   	push   %esi
801013e7:	53                   	push   %ebx
801013e8:	89 c3                	mov    %eax,%ebx
801013ea:	83 ec 1c             	sub    $0x1c,%esp
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
801013ed:	89 04 24             	mov    %eax,(%esp)
801013f0:	c7 44 24 04 e0 09 11 	movl   $0x801109e0,0x4(%esp)
801013f7:	80 
801013f8:	e8 93 ff ff ff       	call   80101390 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
801013fd:	89 fa                	mov    %edi,%edx
801013ff:	c1 ea 0c             	shr    $0xc,%edx
80101402:	03 15 f8 09 11 80    	add    0x801109f8,%edx
80101408:	89 1c 24             	mov    %ebx,(%esp)
  bi = b % BPB;
  m = 1 << (bi % 8);
8010140b:	bb 01 00 00 00       	mov    $0x1,%ebx
{
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
80101410:	89 54 24 04          	mov    %edx,0x4(%esp)
80101414:	e8 b7 ec ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
80101419:	89 f9                	mov    %edi,%ecx
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
8010141b:	81 e7 ff 0f 00 00    	and    $0xfff,%edi
80101421:	89 fa                	mov    %edi,%edx
  m = 1 << (bi % 8);
80101423:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
80101426:	c1 fa 03             	sar    $0x3,%edx
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101429:	d3 e3                	shl    %cl,%ebx
{
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
8010142b:	89 c6                	mov    %eax,%esi
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
8010142d:	0f b6 44 10 5c       	movzbl 0x5c(%eax,%edx,1),%eax
80101432:	0f b6 c8             	movzbl %al,%ecx
80101435:	85 d9                	test   %ebx,%ecx
80101437:	74 20                	je     80101459 <bfree+0x79>
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101439:	f7 d3                	not    %ebx
8010143b:	21 c3                	and    %eax,%ebx
8010143d:	88 5c 16 5c          	mov    %bl,0x5c(%esi,%edx,1)
  log_write(bp);
80101441:	89 34 24             	mov    %esi,(%esp)
80101444:	e8 d7 18 00 00       	call   80102d20 <log_write>
  brelse(bp);
80101449:	89 34 24             	mov    %esi,(%esp)
8010144c:	e8 8f ed ff ff       	call   801001e0 <brelse>
}
80101451:	83 c4 1c             	add    $0x1c,%esp
80101454:	5b                   	pop    %ebx
80101455:	5e                   	pop    %esi
80101456:	5f                   	pop    %edi
80101457:	5d                   	pop    %ebp
80101458:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101459:	c7 04 24 74 6e 10 80 	movl   $0x80106e74,(%esp)
80101460:	e8 fb ee ff ff       	call   80100360 <panic>
80101465:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101470 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101470:	55                   	push   %ebp
80101471:	89 e5                	mov    %esp,%ebp
80101473:	53                   	push   %ebx
80101474:	bb 40 0a 11 80       	mov    $0x80110a40,%ebx
80101479:	83 ec 24             	sub    $0x24,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
8010147c:	c7 44 24 04 87 6e 10 	movl   $0x80106e87,0x4(%esp)
80101483:	80 
80101484:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010148b:	e8 d0 2c 00 00       	call   80104160 <initlock>
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
80101490:	89 1c 24             	mov    %ebx,(%esp)
80101493:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101499:	c7 44 24 04 8e 6e 10 	movl   $0x80106e8e,0x4(%esp)
801014a0:	80 
801014a1:	e8 aa 2b 00 00       	call   80104050 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
801014a6:	81 fb 60 26 11 80    	cmp    $0x80112660,%ebx
801014ac:	75 e2                	jne    80101490 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }
  
  readsb(dev, &sb);
801014ae:	8b 45 08             	mov    0x8(%ebp),%eax
801014b1:	c7 44 24 04 e0 09 11 	movl   $0x801109e0,0x4(%esp)
801014b8:	80 
801014b9:	89 04 24             	mov    %eax,(%esp)
801014bc:	e8 cf fe ff ff       	call   80101390 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014c1:	a1 f8 09 11 80       	mov    0x801109f8,%eax
801014c6:	c7 04 24 e4 6e 10 80 	movl   $0x80106ee4,(%esp)
801014cd:	89 44 24 1c          	mov    %eax,0x1c(%esp)
801014d1:	a1 f4 09 11 80       	mov    0x801109f4,%eax
801014d6:	89 44 24 18          	mov    %eax,0x18(%esp)
801014da:	a1 f0 09 11 80       	mov    0x801109f0,%eax
801014df:	89 44 24 14          	mov    %eax,0x14(%esp)
801014e3:	a1 ec 09 11 80       	mov    0x801109ec,%eax
801014e8:	89 44 24 10          	mov    %eax,0x10(%esp)
801014ec:	a1 e8 09 11 80       	mov    0x801109e8,%eax
801014f1:	89 44 24 0c          	mov    %eax,0xc(%esp)
801014f5:	a1 e4 09 11 80       	mov    0x801109e4,%eax
801014fa:	89 44 24 08          	mov    %eax,0x8(%esp)
801014fe:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101503:	89 44 24 04          	mov    %eax,0x4(%esp)
80101507:	e8 44 f1 ff ff       	call   80100650 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
8010150c:	83 c4 24             	add    $0x24,%esp
8010150f:	5b                   	pop    %ebx
80101510:	5d                   	pop    %ebp
80101511:	c3                   	ret    
80101512:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101520 <ialloc>:
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	57                   	push   %edi
80101524:	56                   	push   %esi
80101525:	53                   	push   %ebx
80101526:	83 ec 2c             	sub    $0x2c,%esp
80101529:	8b 45 0c             	mov    0xc(%ebp),%eax
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010152c:	83 3d e8 09 11 80 01 	cmpl   $0x1,0x801109e8
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
80101533:	8b 7d 08             	mov    0x8(%ebp),%edi
80101536:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101539:	0f 86 a2 00 00 00    	jbe    801015e1 <ialloc+0xc1>
8010153f:	be 01 00 00 00       	mov    $0x1,%esi
80101544:	bb 01 00 00 00       	mov    $0x1,%ebx
80101549:	eb 1a                	jmp    80101565 <ialloc+0x45>
8010154b:	90                   	nop
8010154c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101550:	89 14 24             	mov    %edx,(%esp)
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101553:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101556:	e8 85 ec ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010155b:	89 de                	mov    %ebx,%esi
8010155d:	3b 1d e8 09 11 80    	cmp    0x801109e8,%ebx
80101563:	73 7c                	jae    801015e1 <ialloc+0xc1>
    bp = bread(dev, IBLOCK(inum, sb));
80101565:	89 f0                	mov    %esi,%eax
80101567:	c1 e8 03             	shr    $0x3,%eax
8010156a:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101570:	89 3c 24             	mov    %edi,(%esp)
80101573:	89 44 24 04          	mov    %eax,0x4(%esp)
80101577:	e8 54 eb ff ff       	call   801000d0 <bread>
8010157c:	89 c2                	mov    %eax,%edx
    dip = (struct dinode*)bp->data + inum%IPB;
8010157e:	89 f0                	mov    %esi,%eax
80101580:	83 e0 07             	and    $0x7,%eax
80101583:	c1 e0 06             	shl    $0x6,%eax
80101586:	8d 4c 02 5c          	lea    0x5c(%edx,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010158a:	66 83 39 00          	cmpw   $0x0,(%ecx)
8010158e:	75 c0                	jne    80101550 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101590:	89 0c 24             	mov    %ecx,(%esp)
80101593:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
8010159a:	00 
8010159b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801015a2:	00 
801015a3:	89 55 dc             	mov    %edx,-0x24(%ebp)
801015a6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801015a9:	e8 b2 2d 00 00       	call   80104360 <memset>
      dip->type = type;
801015ae:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
      log_write(bp);   // mark it allocated on the disk
801015b2:	8b 55 dc             	mov    -0x24(%ebp),%edx
  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
801015b5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
      log_write(bp);   // mark it allocated on the disk
801015b8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
801015bb:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
801015be:	89 14 24             	mov    %edx,(%esp)
801015c1:	e8 5a 17 00 00       	call   80102d20 <log_write>
      brelse(bp);
801015c6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801015c9:	89 14 24             	mov    %edx,(%esp)
801015cc:	e8 0f ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015d1:	83 c4 2c             	add    $0x2c,%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015d4:	89 f2                	mov    %esi,%edx
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015d6:	5b                   	pop    %ebx
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015d7:	89 f8                	mov    %edi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015d9:	5e                   	pop    %esi
801015da:	5f                   	pop    %edi
801015db:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015dc:	e9 2f fc ff ff       	jmp    80101210 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801015e1:	c7 04 24 94 6e 10 80 	movl   $0x80106e94,(%esp)
801015e8:	e8 73 ed ff ff       	call   80100360 <panic>
801015ed:	8d 76 00             	lea    0x0(%esi),%esi

801015f0 <iupdate>:
}

// Copy a modified in-memory inode to disk.
void
iupdate(struct inode *ip)
{
801015f0:	55                   	push   %ebp
801015f1:	89 e5                	mov    %esp,%ebp
801015f3:	56                   	push   %esi
801015f4:	53                   	push   %ebx
801015f5:	83 ec 10             	sub    $0x10,%esp
801015f8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015fb:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015fe:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101601:	c1 e8 03             	shr    $0x3,%eax
80101604:	03 05 f4 09 11 80    	add    0x801109f4,%eax
8010160a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010160e:	8b 43 a4             	mov    -0x5c(%ebx),%eax
80101611:	89 04 24             	mov    %eax,(%esp)
80101614:	e8 b7 ea ff ff       	call   801000d0 <bread>
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101619:	8b 53 a8             	mov    -0x58(%ebx),%edx
8010161c:	83 e2 07             	and    $0x7,%edx
8010161f:	c1 e2 06             	shl    $0x6,%edx
80101622:	8d 54 10 5c          	lea    0x5c(%eax,%edx,1),%edx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101626:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
80101628:	0f b7 43 f4          	movzwl -0xc(%ebx),%eax
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010162c:	83 c2 0c             	add    $0xc,%edx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
8010162f:	66 89 42 f4          	mov    %ax,-0xc(%edx)
  dip->major = ip->major;
80101633:	0f b7 43 f6          	movzwl -0xa(%ebx),%eax
80101637:	66 89 42 f6          	mov    %ax,-0xa(%edx)
  dip->minor = ip->minor;
8010163b:	0f b7 43 f8          	movzwl -0x8(%ebx),%eax
8010163f:	66 89 42 f8          	mov    %ax,-0x8(%edx)
  dip->nlink = ip->nlink;
80101643:	0f b7 43 fa          	movzwl -0x6(%ebx),%eax
80101647:	66 89 42 fa          	mov    %ax,-0x6(%edx)
  dip->size = ip->size;
8010164b:	8b 43 fc             	mov    -0x4(%ebx),%eax
8010164e:	89 42 fc             	mov    %eax,-0x4(%edx)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101651:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101655:	89 14 24             	mov    %edx,(%esp)
80101658:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
8010165f:	00 
80101660:	e8 9b 2d 00 00       	call   80104400 <memmove>
  log_write(bp);
80101665:	89 34 24             	mov    %esi,(%esp)
80101668:	e8 b3 16 00 00       	call   80102d20 <log_write>
  brelse(bp);
8010166d:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101670:	83 c4 10             	add    $0x10,%esp
80101673:	5b                   	pop    %ebx
80101674:	5e                   	pop    %esi
80101675:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
80101676:	e9 65 eb ff ff       	jmp    801001e0 <brelse>
8010167b:	90                   	nop
8010167c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101680 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101680:	55                   	push   %ebp
80101681:	89 e5                	mov    %esp,%ebp
80101683:	53                   	push   %ebx
80101684:	83 ec 14             	sub    $0x14,%esp
80101687:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010168a:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101691:	e8 4a 2b 00 00       	call   801041e0 <acquire>
  ip->ref++;
80101696:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
8010169a:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
801016a1:	e8 6a 2c 00 00       	call   80104310 <release>
  return ip;
}
801016a6:	83 c4 14             	add    $0x14,%esp
801016a9:	89 d8                	mov    %ebx,%eax
801016ab:	5b                   	pop    %ebx
801016ac:	5d                   	pop    %ebp
801016ad:	c3                   	ret    
801016ae:	66 90                	xchg   %ax,%ax

801016b0 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
801016b0:	55                   	push   %ebp
801016b1:	89 e5                	mov    %esp,%ebp
801016b3:	56                   	push   %esi
801016b4:	53                   	push   %ebx
801016b5:	83 ec 10             	sub    $0x10,%esp
801016b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
801016bb:	85 db                	test   %ebx,%ebx
801016bd:	0f 84 b0 00 00 00    	je     80101773 <ilock+0xc3>
801016c3:	8b 43 08             	mov    0x8(%ebx),%eax
801016c6:	85 c0                	test   %eax,%eax
801016c8:	0f 8e a5 00 00 00    	jle    80101773 <ilock+0xc3>
    panic("ilock");

  acquiresleep(&ip->lock);
801016ce:	8d 43 0c             	lea    0xc(%ebx),%eax
801016d1:	89 04 24             	mov    %eax,(%esp)
801016d4:	e8 b7 29 00 00       	call   80104090 <acquiresleep>

  if(!(ip->flags & I_VALID)){
801016d9:	f6 43 4c 02          	testb  $0x2,0x4c(%ebx)
801016dd:	74 09                	je     801016e8 <ilock+0x38>
    brelse(bp);
    ip->flags |= I_VALID;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
801016df:	83 c4 10             	add    $0x10,%esp
801016e2:	5b                   	pop    %ebx
801016e3:	5e                   	pop    %esi
801016e4:	5d                   	pop    %ebp
801016e5:	c3                   	ret    
801016e6:	66 90                	xchg   %ax,%ax
    panic("ilock");

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016e8:	8b 43 04             	mov    0x4(%ebx),%eax
801016eb:	c1 e8 03             	shr    $0x3,%eax
801016ee:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801016f4:	89 44 24 04          	mov    %eax,0x4(%esp)
801016f8:	8b 03                	mov    (%ebx),%eax
801016fa:	89 04 24             	mov    %eax,(%esp)
801016fd:	e8 ce e9 ff ff       	call   801000d0 <bread>
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101702:	8b 53 04             	mov    0x4(%ebx),%edx
80101705:	83 e2 07             	and    $0x7,%edx
80101708:	c1 e2 06             	shl    $0x6,%edx
8010170b:	8d 54 10 5c          	lea    0x5c(%eax,%edx,1),%edx
    panic("ilock");

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
8010170f:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
80101711:	0f b7 02             	movzwl (%edx),%eax
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101714:	83 c2 0c             	add    $0xc,%edx
  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
80101717:	66 89 43 50          	mov    %ax,0x50(%ebx)
    ip->major = dip->major;
8010171b:	0f b7 42 f6          	movzwl -0xa(%edx),%eax
8010171f:	66 89 43 52          	mov    %ax,0x52(%ebx)
    ip->minor = dip->minor;
80101723:	0f b7 42 f8          	movzwl -0x8(%edx),%eax
80101727:	66 89 43 54          	mov    %ax,0x54(%ebx)
    ip->nlink = dip->nlink;
8010172b:	0f b7 42 fa          	movzwl -0x6(%edx),%eax
8010172f:	66 89 43 56          	mov    %ax,0x56(%ebx)
    ip->size = dip->size;
80101733:	8b 42 fc             	mov    -0x4(%edx),%eax
80101736:	89 43 58             	mov    %eax,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101739:	8d 43 5c             	lea    0x5c(%ebx),%eax
8010173c:	89 54 24 04          	mov    %edx,0x4(%esp)
80101740:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
80101747:	00 
80101748:	89 04 24             	mov    %eax,(%esp)
8010174b:	e8 b0 2c 00 00       	call   80104400 <memmove>
    brelse(bp);
80101750:	89 34 24             	mov    %esi,(%esp)
80101753:	e8 88 ea ff ff       	call   801001e0 <brelse>
    ip->flags |= I_VALID;
80101758:	83 4b 4c 02          	orl    $0x2,0x4c(%ebx)
    if(ip->type == 0)
8010175c:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101761:	0f 85 78 ff ff ff    	jne    801016df <ilock+0x2f>
      panic("ilock: no type");
80101767:	c7 04 24 ac 6e 10 80 	movl   $0x80106eac,(%esp)
8010176e:	e8 ed eb ff ff       	call   80100360 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101773:	c7 04 24 a6 6e 10 80 	movl   $0x80106ea6,(%esp)
8010177a:	e8 e1 eb ff ff       	call   80100360 <panic>
8010177f:	90                   	nop

80101780 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101780:	55                   	push   %ebp
80101781:	89 e5                	mov    %esp,%ebp
80101783:	56                   	push   %esi
80101784:	53                   	push   %ebx
80101785:	83 ec 10             	sub    $0x10,%esp
80101788:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
8010178b:	85 db                	test   %ebx,%ebx
8010178d:	74 24                	je     801017b3 <iunlock+0x33>
8010178f:	8d 73 0c             	lea    0xc(%ebx),%esi
80101792:	89 34 24             	mov    %esi,(%esp)
80101795:	e8 96 29 00 00       	call   80104130 <holdingsleep>
8010179a:	85 c0                	test   %eax,%eax
8010179c:	74 15                	je     801017b3 <iunlock+0x33>
8010179e:	8b 43 08             	mov    0x8(%ebx),%eax
801017a1:	85 c0                	test   %eax,%eax
801017a3:	7e 0e                	jle    801017b3 <iunlock+0x33>
    panic("iunlock");

  releasesleep(&ip->lock);
801017a5:	89 75 08             	mov    %esi,0x8(%ebp)
}
801017a8:	83 c4 10             	add    $0x10,%esp
801017ab:	5b                   	pop    %ebx
801017ac:	5e                   	pop    %esi
801017ad:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
801017ae:	e9 3d 29 00 00       	jmp    801040f0 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
801017b3:	c7 04 24 bb 6e 10 80 	movl   $0x80106ebb,(%esp)
801017ba:	e8 a1 eb ff ff       	call   80100360 <panic>
801017bf:	90                   	nop

801017c0 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
801017c0:	55                   	push   %ebp
801017c1:	89 e5                	mov    %esp,%ebp
801017c3:	57                   	push   %edi
801017c4:	56                   	push   %esi
801017c5:	53                   	push   %ebx
801017c6:	83 ec 1c             	sub    $0x1c,%esp
801017c9:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&icache.lock);
801017cc:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
801017d3:	e8 08 2a 00 00       	call   801041e0 <acquire>
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
801017d8:	8b 46 08             	mov    0x8(%esi),%eax
801017db:	83 f8 01             	cmp    $0x1,%eax
801017de:	74 20                	je     80101800 <iput+0x40>
    ip->type = 0;
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
801017e0:	83 e8 01             	sub    $0x1,%eax
801017e3:	89 46 08             	mov    %eax,0x8(%esi)
  release(&icache.lock);
801017e6:	c7 45 08 00 0a 11 80 	movl   $0x80110a00,0x8(%ebp)
}
801017ed:	83 c4 1c             	add    $0x1c,%esp
801017f0:	5b                   	pop    %ebx
801017f1:	5e                   	pop    %esi
801017f2:	5f                   	pop    %edi
801017f3:	5d                   	pop    %ebp
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
  release(&icache.lock);
801017f4:	e9 17 2b 00 00       	jmp    80104310 <release>
801017f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
// case it has to free the inode.
void
iput(struct inode *ip)
{
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
80101800:	f6 46 4c 02          	testb  $0x2,0x4c(%esi)
80101804:	74 da                	je     801017e0 <iput+0x20>
80101806:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
8010180b:	75 d3                	jne    801017e0 <iput+0x20>
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
8010180d:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101814:	89 f3                	mov    %esi,%ebx
80101816:	e8 f5 2a 00 00       	call   80104310 <release>
8010181b:	8d 7e 30             	lea    0x30(%esi),%edi
8010181e:	eb 07                	jmp    80101827 <iput+0x67>
80101820:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101823:	39 fb                	cmp    %edi,%ebx
80101825:	74 19                	je     80101840 <iput+0x80>
    if(ip->addrs[i]){
80101827:	8b 53 5c             	mov    0x5c(%ebx),%edx
8010182a:	85 d2                	test   %edx,%edx
8010182c:	74 f2                	je     80101820 <iput+0x60>
      bfree(ip->dev, ip->addrs[i]);
8010182e:	8b 06                	mov    (%esi),%eax
80101830:	e8 ab fb ff ff       	call   801013e0 <bfree>
      ip->addrs[i] = 0;
80101835:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
8010183c:	eb e2                	jmp    80101820 <iput+0x60>
8010183e:	66 90                	xchg   %ax,%ax
    }
  }

  if(ip->addrs[NDIRECT]){
80101840:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101846:	85 c0                	test   %eax,%eax
80101848:	75 3e                	jne    80101888 <iput+0xc8>
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
8010184a:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101851:	89 34 24             	mov    %esi,(%esp)
80101854:	e8 97 fd ff ff       	call   801015f0 <iupdate>
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
    itrunc(ip);
    ip->type = 0;
80101859:	31 c0                	xor    %eax,%eax
8010185b:	66 89 46 50          	mov    %ax,0x50(%esi)
    iupdate(ip);
8010185f:	89 34 24             	mov    %esi,(%esp)
80101862:	e8 89 fd ff ff       	call   801015f0 <iupdate>
    acquire(&icache.lock);
80101867:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010186e:	e8 6d 29 00 00       	call   801041e0 <acquire>
80101873:	8b 46 08             	mov    0x8(%esi),%eax
    ip->flags = 0;
80101876:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010187d:	e9 5e ff ff ff       	jmp    801017e0 <iput+0x20>
80101882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101888:	89 44 24 04          	mov    %eax,0x4(%esp)
8010188c:	8b 06                	mov    (%esi),%eax
    a = (uint*)bp->data;
    for(j = 0; j < NINDIRECT; j++){
8010188e:	31 db                	xor    %ebx,%ebx
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101890:	89 04 24             	mov    %eax,(%esp)
80101893:	e8 38 e8 ff ff       	call   801000d0 <bread>
80101898:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
8010189b:	8d 78 5c             	lea    0x5c(%eax),%edi
    for(j = 0; j < NINDIRECT; j++){
8010189e:	31 c0                	xor    %eax,%eax
801018a0:	eb 13                	jmp    801018b5 <iput+0xf5>
801018a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801018a8:	83 c3 01             	add    $0x1,%ebx
801018ab:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
801018b1:	89 d8                	mov    %ebx,%eax
801018b3:	74 10                	je     801018c5 <iput+0x105>
      if(a[j])
801018b5:	8b 14 87             	mov    (%edi,%eax,4),%edx
801018b8:	85 d2                	test   %edx,%edx
801018ba:	74 ec                	je     801018a8 <iput+0xe8>
        bfree(ip->dev, a[j]);
801018bc:	8b 06                	mov    (%esi),%eax
801018be:	e8 1d fb ff ff       	call   801013e0 <bfree>
801018c3:	eb e3                	jmp    801018a8 <iput+0xe8>
    }
    brelse(bp);
801018c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801018c8:	89 04 24             	mov    %eax,(%esp)
801018cb:	e8 10 e9 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018d0:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018d6:	8b 06                	mov    (%esi),%eax
801018d8:	e8 03 fb ff ff       	call   801013e0 <bfree>
    ip->addrs[NDIRECT] = 0;
801018dd:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018e4:	00 00 00 
801018e7:	e9 5e ff ff ff       	jmp    8010184a <iput+0x8a>
801018ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801018f0 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
801018f0:	55                   	push   %ebp
801018f1:	89 e5                	mov    %esp,%ebp
801018f3:	53                   	push   %ebx
801018f4:	83 ec 14             	sub    $0x14,%esp
801018f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
801018fa:	89 1c 24             	mov    %ebx,(%esp)
801018fd:	e8 7e fe ff ff       	call   80101780 <iunlock>
  iput(ip);
80101902:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80101905:	83 c4 14             	add    $0x14,%esp
80101908:	5b                   	pop    %ebx
80101909:	5d                   	pop    %ebp
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
8010190a:	e9 b1 fe ff ff       	jmp    801017c0 <iput>
8010190f:	90                   	nop

80101910 <stati>:
}

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
80101910:	55                   	push   %ebp
80101911:	89 e5                	mov    %esp,%ebp
80101913:	8b 55 08             	mov    0x8(%ebp),%edx
80101916:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101919:	8b 0a                	mov    (%edx),%ecx
8010191b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010191e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101921:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101924:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101928:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010192b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010192f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101933:	8b 52 58             	mov    0x58(%edx),%edx
80101936:	89 50 10             	mov    %edx,0x10(%eax)
}
80101939:	5d                   	pop    %ebp
8010193a:	c3                   	ret    
8010193b:	90                   	nop
8010193c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101940 <readi>:

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	57                   	push   %edi
80101944:	56                   	push   %esi
80101945:	53                   	push   %ebx
80101946:	83 ec 2c             	sub    $0x2c,%esp
80101949:	8b 45 0c             	mov    0xc(%ebp),%eax
8010194c:	8b 7d 08             	mov    0x8(%ebp),%edi
8010194f:	8b 75 10             	mov    0x10(%ebp),%esi
80101952:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101955:	8b 45 14             	mov    0x14(%ebp),%eax
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101958:	66 83 7f 50 03       	cmpw   $0x3,0x50(%edi)

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
8010195d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101960:	0f 84 aa 00 00 00    	je     80101a10 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101966:	8b 47 58             	mov    0x58(%edi),%eax
80101969:	39 f0                	cmp    %esi,%eax
8010196b:	0f 82 c7 00 00 00    	jb     80101a38 <readi+0xf8>
80101971:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101974:	89 da                	mov    %ebx,%edx
80101976:	01 f2                	add    %esi,%edx
80101978:	0f 82 ba 00 00 00    	jb     80101a38 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
8010197e:	89 c1                	mov    %eax,%ecx
80101980:	29 f1                	sub    %esi,%ecx
80101982:	39 d0                	cmp    %edx,%eax
80101984:	0f 43 cb             	cmovae %ebx,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101987:	31 c0                	xor    %eax,%eax
80101989:	85 c9                	test   %ecx,%ecx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
8010198b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010198e:	74 70                	je     80101a00 <readi+0xc0>
80101990:	89 7d d8             	mov    %edi,-0x28(%ebp)
80101993:	89 c7                	mov    %eax,%edi
80101995:	8d 76 00             	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101998:	8b 5d d8             	mov    -0x28(%ebp),%ebx
8010199b:	89 f2                	mov    %esi,%edx
8010199d:	c1 ea 09             	shr    $0x9,%edx
801019a0:	89 d8                	mov    %ebx,%eax
801019a2:	e8 29 f9 ff ff       	call   801012d0 <bmap>
801019a7:	89 44 24 04          	mov    %eax,0x4(%esp)
801019ab:	8b 03                	mov    (%ebx),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
801019ad:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019b2:	89 04 24             	mov    %eax,(%esp)
801019b5:	e8 16 e7 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
801019ba:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801019bd:	29 f9                	sub    %edi,%ecx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019bf:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019c1:	89 f0                	mov    %esi,%eax
801019c3:	25 ff 01 00 00       	and    $0x1ff,%eax
801019c8:	29 c3                	sub    %eax,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019ca:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
801019ce:	39 cb                	cmp    %ecx,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019d0:	89 44 24 04          	mov    %eax,0x4(%esp)
801019d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
801019d7:	0f 47 d9             	cmova  %ecx,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019da:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019de:	01 df                	add    %ebx,%edi
801019e0:	01 de                	add    %ebx,%esi
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019e2:	89 55 dc             	mov    %edx,-0x24(%ebp)
801019e5:	89 04 24             	mov    %eax,(%esp)
801019e8:	e8 13 2a 00 00       	call   80104400 <memmove>
    brelse(bp);
801019ed:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019f0:	89 14 24             	mov    %edx,(%esp)
801019f3:	e8 e8 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019f8:	01 5d e0             	add    %ebx,-0x20(%ebp)
801019fb:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801019fe:	77 98                	ja     80101998 <readi+0x58>
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101a00:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a03:	83 c4 2c             	add    $0x2c,%esp
80101a06:	5b                   	pop    %ebx
80101a07:	5e                   	pop    %esi
80101a08:	5f                   	pop    %edi
80101a09:	5d                   	pop    %ebp
80101a0a:	c3                   	ret    
80101a0b:	90                   	nop
80101a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a10:	0f bf 47 52          	movswl 0x52(%edi),%eax
80101a14:	66 83 f8 09          	cmp    $0x9,%ax
80101a18:	77 1e                	ja     80101a38 <readi+0xf8>
80101a1a:	8b 04 c5 80 09 11 80 	mov    -0x7feef680(,%eax,8),%eax
80101a21:	85 c0                	test   %eax,%eax
80101a23:	74 13                	je     80101a38 <readi+0xf8>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a25:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101a28:	89 75 10             	mov    %esi,0x10(%ebp)
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101a2b:	83 c4 2c             	add    $0x2c,%esp
80101a2e:	5b                   	pop    %ebx
80101a2f:	5e                   	pop    %esi
80101a30:	5f                   	pop    %edi
80101a31:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a32:	ff e0                	jmp    *%eax
80101a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101a38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a3d:	eb c4                	jmp    80101a03 <readi+0xc3>
80101a3f:	90                   	nop

80101a40 <writei>:

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a40:	55                   	push   %ebp
80101a41:	89 e5                	mov    %esp,%ebp
80101a43:	57                   	push   %edi
80101a44:	56                   	push   %esi
80101a45:	53                   	push   %ebx
80101a46:	83 ec 2c             	sub    $0x2c,%esp
80101a49:	8b 45 08             	mov    0x8(%ebp),%eax
80101a4c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a4f:	8b 4d 14             	mov    0x14(%ebp),%ecx
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a52:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a57:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a5a:	8b 75 10             	mov    0x10(%ebp),%esi
80101a5d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a60:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a63:	0f 84 b7 00 00 00    	je     80101b20 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a69:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a6c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a6f:	0f 82 e3 00 00 00    	jb     80101b58 <writei+0x118>
80101a75:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101a78:	89 c8                	mov    %ecx,%eax
80101a7a:	01 f0                	add    %esi,%eax
80101a7c:	0f 82 d6 00 00 00    	jb     80101b58 <writei+0x118>
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101a82:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a87:	0f 87 cb 00 00 00    	ja     80101b58 <writei+0x118>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101a8d:	85 c9                	test   %ecx,%ecx
80101a8f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101a96:	74 77                	je     80101b0f <writei+0xcf>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a98:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101a9b:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101a9d:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101aa2:	c1 ea 09             	shr    $0x9,%edx
80101aa5:	89 f8                	mov    %edi,%eax
80101aa7:	e8 24 f8 ff ff       	call   801012d0 <bmap>
80101aac:	89 44 24 04          	mov    %eax,0x4(%esp)
80101ab0:	8b 07                	mov    (%edi),%eax
80101ab2:	89 04 24             	mov    %eax,(%esp)
80101ab5:	e8 16 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101aba:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101abd:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101ac0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ac3:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101ac5:	89 f0                	mov    %esi,%eax
80101ac7:	25 ff 01 00 00       	and    $0x1ff,%eax
80101acc:	29 c3                	sub    %eax,%ebx
80101ace:	39 cb                	cmp    %ecx,%ebx
80101ad0:	0f 47 d9             	cmova  %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101ad3:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ad7:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101ad9:	89 54 24 04          	mov    %edx,0x4(%esp)
80101add:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80101ae1:	89 04 24             	mov    %eax,(%esp)
80101ae4:	e8 17 29 00 00       	call   80104400 <memmove>
    log_write(bp);
80101ae9:	89 3c 24             	mov    %edi,(%esp)
80101aec:	e8 2f 12 00 00       	call   80102d20 <log_write>
    brelse(bp);
80101af1:	89 3c 24             	mov    %edi,(%esp)
80101af4:	e8 e7 e6 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101af9:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101afc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101aff:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b02:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b05:	77 91                	ja     80101a98 <writei+0x58>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101b07:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b0a:	39 70 58             	cmp    %esi,0x58(%eax)
80101b0d:	72 39                	jb     80101b48 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b0f:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b12:	83 c4 2c             	add    $0x2c,%esp
80101b15:	5b                   	pop    %ebx
80101b16:	5e                   	pop    %esi
80101b17:	5f                   	pop    %edi
80101b18:	5d                   	pop    %ebp
80101b19:	c3                   	ret    
80101b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b20:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b24:	66 83 f8 09          	cmp    $0x9,%ax
80101b28:	77 2e                	ja     80101b58 <writei+0x118>
80101b2a:	8b 04 c5 84 09 11 80 	mov    -0x7feef67c(,%eax,8),%eax
80101b31:	85 c0                	test   %eax,%eax
80101b33:	74 23                	je     80101b58 <writei+0x118>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b35:	89 4d 10             	mov    %ecx,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b38:	83 c4 2c             	add    $0x2c,%esp
80101b3b:	5b                   	pop    %ebx
80101b3c:	5e                   	pop    %esi
80101b3d:	5f                   	pop    %edi
80101b3e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b3f:	ff e0                	jmp    *%eax
80101b41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b48:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b4b:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b4e:	89 04 24             	mov    %eax,(%esp)
80101b51:	e8 9a fa ff ff       	call   801015f0 <iupdate>
80101b56:	eb b7                	jmp    80101b0f <writei+0xcf>
  }
  return n;
}
80101b58:	83 c4 2c             	add    $0x2c,%esp
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101b5b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b60:	5b                   	pop    %ebx
80101b61:	5e                   	pop    %esi
80101b62:	5f                   	pop    %edi
80101b63:	5d                   	pop    %ebp
80101b64:	c3                   	ret    
80101b65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b70 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b70:	55                   	push   %ebp
80101b71:	89 e5                	mov    %esp,%ebp
80101b73:	83 ec 18             	sub    $0x18,%esp
  return strncmp(s, t, DIRSIZ);
80101b76:	8b 45 0c             	mov    0xc(%ebp),%eax
80101b79:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101b80:	00 
80101b81:	89 44 24 04          	mov    %eax,0x4(%esp)
80101b85:	8b 45 08             	mov    0x8(%ebp),%eax
80101b88:	89 04 24             	mov    %eax,(%esp)
80101b8b:	e8 f0 28 00 00       	call   80104480 <strncmp>
}
80101b90:	c9                   	leave  
80101b91:	c3                   	ret    
80101b92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	57                   	push   %edi
80101ba4:	56                   	push   %esi
80101ba5:	53                   	push   %ebx
80101ba6:	83 ec 2c             	sub    $0x2c,%esp
80101ba9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bac:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bb1:	0f 85 97 00 00 00    	jne    80101c4e <dirlookup+0xae>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bb7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bba:	31 ff                	xor    %edi,%edi
80101bbc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bbf:	85 d2                	test   %edx,%edx
80101bc1:	75 0d                	jne    80101bd0 <dirlookup+0x30>
80101bc3:	eb 73                	jmp    80101c38 <dirlookup+0x98>
80101bc5:	8d 76 00             	lea    0x0(%esi),%esi
80101bc8:	83 c7 10             	add    $0x10,%edi
80101bcb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bce:	76 68                	jbe    80101c38 <dirlookup+0x98>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101bd0:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101bd7:	00 
80101bd8:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101bdc:	89 74 24 04          	mov    %esi,0x4(%esp)
80101be0:	89 1c 24             	mov    %ebx,(%esp)
80101be3:	e8 58 fd ff ff       	call   80101940 <readi>
80101be8:	83 f8 10             	cmp    $0x10,%eax
80101beb:	75 55                	jne    80101c42 <dirlookup+0xa2>
      panic("dirlink read");
    if(de.inum == 0)
80101bed:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bf2:	74 d4                	je     80101bc8 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101bf4:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bf7:	89 44 24 04          	mov    %eax,0x4(%esp)
80101bfb:	8b 45 0c             	mov    0xc(%ebp),%eax
80101bfe:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101c05:	00 
80101c06:	89 04 24             	mov    %eax,(%esp)
80101c09:	e8 72 28 00 00       	call   80104480 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101c0e:	85 c0                	test   %eax,%eax
80101c10:	75 b6                	jne    80101bc8 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101c12:	8b 45 10             	mov    0x10(%ebp),%eax
80101c15:	85 c0                	test   %eax,%eax
80101c17:	74 05                	je     80101c1e <dirlookup+0x7e>
        *poff = off;
80101c19:	8b 45 10             	mov    0x10(%ebp),%eax
80101c1c:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101c1e:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101c22:	8b 03                	mov    (%ebx),%eax
80101c24:	e8 e7 f5 ff ff       	call   80101210 <iget>
    }
  }

  return 0;
}
80101c29:	83 c4 2c             	add    $0x2c,%esp
80101c2c:	5b                   	pop    %ebx
80101c2d:	5e                   	pop    %esi
80101c2e:	5f                   	pop    %edi
80101c2f:	5d                   	pop    %ebp
80101c30:	c3                   	ret    
80101c31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101c38:	83 c4 2c             	add    $0x2c,%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101c3b:	31 c0                	xor    %eax,%eax
}
80101c3d:	5b                   	pop    %ebx
80101c3e:	5e                   	pop    %esi
80101c3f:	5f                   	pop    %edi
80101c40:	5d                   	pop    %ebp
80101c41:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101c42:	c7 04 24 d5 6e 10 80 	movl   $0x80106ed5,(%esp)
80101c49:	e8 12 e7 ff ff       	call   80100360 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101c4e:	c7 04 24 c3 6e 10 80 	movl   $0x80106ec3,(%esp)
80101c55:	e8 06 e7 ff ff       	call   80100360 <panic>
80101c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101c60 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c60:	55                   	push   %ebp
80101c61:	89 e5                	mov    %esp,%ebp
80101c63:	57                   	push   %edi
80101c64:	89 cf                	mov    %ecx,%edi
80101c66:	56                   	push   %esi
80101c67:	53                   	push   %ebx
80101c68:	89 c3                	mov    %eax,%ebx
80101c6a:	83 ec 2c             	sub    $0x2c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c6d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c70:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101c73:	0f 84 51 01 00 00    	je     80101dca <namex+0x16a>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101c79:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80101c7f:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c82:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101c89:	e8 52 25 00 00       	call   801041e0 <acquire>
  ip->ref++;
80101c8e:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101c92:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101c99:	e8 72 26 00 00       	call   80104310 <release>
80101c9e:	eb 03                	jmp    80101ca3 <namex+0x43>
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101ca0:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101ca3:	0f b6 03             	movzbl (%ebx),%eax
80101ca6:	3c 2f                	cmp    $0x2f,%al
80101ca8:	74 f6                	je     80101ca0 <namex+0x40>
    path++;
  if(*path == 0)
80101caa:	84 c0                	test   %al,%al
80101cac:	0f 84 ed 00 00 00    	je     80101d9f <namex+0x13f>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101cb2:	0f b6 03             	movzbl (%ebx),%eax
80101cb5:	89 da                	mov    %ebx,%edx
80101cb7:	84 c0                	test   %al,%al
80101cb9:	0f 84 b1 00 00 00    	je     80101d70 <namex+0x110>
80101cbf:	3c 2f                	cmp    $0x2f,%al
80101cc1:	75 0f                	jne    80101cd2 <namex+0x72>
80101cc3:	e9 a8 00 00 00       	jmp    80101d70 <namex+0x110>
80101cc8:	3c 2f                	cmp    $0x2f,%al
80101cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101cd0:	74 0a                	je     80101cdc <namex+0x7c>
    path++;
80101cd2:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101cd5:	0f b6 02             	movzbl (%edx),%eax
80101cd8:	84 c0                	test   %al,%al
80101cda:	75 ec                	jne    80101cc8 <namex+0x68>
80101cdc:	89 d1                	mov    %edx,%ecx
80101cde:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101ce0:	83 f9 0d             	cmp    $0xd,%ecx
80101ce3:	0f 8e 8f 00 00 00    	jle    80101d78 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101ce9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101ced:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101cf4:	00 
80101cf5:	89 3c 24             	mov    %edi,(%esp)
80101cf8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101cfb:	e8 00 27 00 00       	call   80104400 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101d00:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d03:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d05:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d08:	75 0e                	jne    80101d18 <namex+0xb8>
80101d0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    path++;
80101d10:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d13:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d16:	74 f8                	je     80101d10 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d18:	89 34 24             	mov    %esi,(%esp)
80101d1b:	e8 90 f9 ff ff       	call   801016b0 <ilock>
    if(ip->type != T_DIR){
80101d20:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d25:	0f 85 85 00 00 00    	jne    80101db0 <namex+0x150>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d2b:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d2e:	85 d2                	test   %edx,%edx
80101d30:	74 09                	je     80101d3b <namex+0xdb>
80101d32:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d35:	0f 84 a5 00 00 00    	je     80101de0 <namex+0x180>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d3b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101d42:	00 
80101d43:	89 7c 24 04          	mov    %edi,0x4(%esp)
80101d47:	89 34 24             	mov    %esi,(%esp)
80101d4a:	e8 51 fe ff ff       	call   80101ba0 <dirlookup>
80101d4f:	85 c0                	test   %eax,%eax
80101d51:	74 5d                	je     80101db0 <namex+0x150>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d53:	89 34 24             	mov    %esi,(%esp)
80101d56:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d59:	e8 22 fa ff ff       	call   80101780 <iunlock>
  iput(ip);
80101d5e:	89 34 24             	mov    %esi,(%esp)
80101d61:	e8 5a fa ff ff       	call   801017c0 <iput>
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
    }
    iunlockput(ip);
    ip = next;
80101d66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d69:	89 c6                	mov    %eax,%esi
80101d6b:	e9 33 ff ff ff       	jmp    80101ca3 <namex+0x43>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d70:	31 c9                	xor    %ecx,%ecx
80101d72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101d78:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80101d7c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101d80:	89 3c 24             	mov    %edi,(%esp)
80101d83:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d86:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d89:	e8 72 26 00 00       	call   80104400 <memmove>
    name[len] = 0;
80101d8e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d91:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d94:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d98:	89 d3                	mov    %edx,%ebx
80101d9a:	e9 66 ff ff ff       	jmp    80101d05 <namex+0xa5>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d9f:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101da2:	85 c0                	test   %eax,%eax
80101da4:	75 4c                	jne    80101df2 <namex+0x192>
80101da6:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101da8:	83 c4 2c             	add    $0x2c,%esp
80101dab:	5b                   	pop    %ebx
80101dac:	5e                   	pop    %esi
80101dad:	5f                   	pop    %edi
80101dae:	5d                   	pop    %ebp
80101daf:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101db0:	89 34 24             	mov    %esi,(%esp)
80101db3:	e8 c8 f9 ff ff       	call   80101780 <iunlock>
  iput(ip);
80101db8:	89 34 24             	mov    %esi,(%esp)
80101dbb:	e8 00 fa ff ff       	call   801017c0 <iput>
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dc0:	83 c4 2c             	add    $0x2c,%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101dc3:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dc5:	5b                   	pop    %ebx
80101dc6:	5e                   	pop    %esi
80101dc7:	5f                   	pop    %edi
80101dc8:	5d                   	pop    %ebp
80101dc9:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101dca:	ba 01 00 00 00       	mov    $0x1,%edx
80101dcf:	b8 01 00 00 00       	mov    $0x1,%eax
80101dd4:	e8 37 f4 ff ff       	call   80101210 <iget>
80101dd9:	89 c6                	mov    %eax,%esi
80101ddb:	e9 c3 fe ff ff       	jmp    80101ca3 <namex+0x43>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101de0:	89 34 24             	mov    %esi,(%esp)
80101de3:	e8 98 f9 ff ff       	call   80101780 <iunlock>
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101de8:	83 c4 2c             	add    $0x2c,%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101deb:	89 f0                	mov    %esi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101ded:	5b                   	pop    %ebx
80101dee:	5e                   	pop    %esi
80101def:	5f                   	pop    %edi
80101df0:	5d                   	pop    %ebp
80101df1:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101df2:	89 34 24             	mov    %esi,(%esp)
80101df5:	e8 c6 f9 ff ff       	call   801017c0 <iput>
    return 0;
80101dfa:	31 c0                	xor    %eax,%eax
80101dfc:	eb aa                	jmp    80101da8 <namex+0x148>
80101dfe:	66 90                	xchg   %ax,%ax

80101e00 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101e00:	55                   	push   %ebp
80101e01:	89 e5                	mov    %esp,%ebp
80101e03:	57                   	push   %edi
80101e04:	56                   	push   %esi
80101e05:	53                   	push   %ebx
80101e06:	83 ec 2c             	sub    $0x2c,%esp
80101e09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e0c:	8b 45 0c             	mov    0xc(%ebp),%eax
80101e0f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101e16:	00 
80101e17:	89 1c 24             	mov    %ebx,(%esp)
80101e1a:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e1e:	e8 7d fd ff ff       	call   80101ba0 <dirlookup>
80101e23:	85 c0                	test   %eax,%eax
80101e25:	0f 85 8b 00 00 00    	jne    80101eb6 <dirlink+0xb6>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e2b:	8b 43 58             	mov    0x58(%ebx),%eax
80101e2e:	31 ff                	xor    %edi,%edi
80101e30:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e33:	85 c0                	test   %eax,%eax
80101e35:	75 13                	jne    80101e4a <dirlink+0x4a>
80101e37:	eb 35                	jmp    80101e6e <dirlink+0x6e>
80101e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e40:	8d 57 10             	lea    0x10(%edi),%edx
80101e43:	39 53 58             	cmp    %edx,0x58(%ebx)
80101e46:	89 d7                	mov    %edx,%edi
80101e48:	76 24                	jbe    80101e6e <dirlink+0x6e>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e4a:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101e51:	00 
80101e52:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101e56:	89 74 24 04          	mov    %esi,0x4(%esp)
80101e5a:	89 1c 24             	mov    %ebx,(%esp)
80101e5d:	e8 de fa ff ff       	call   80101940 <readi>
80101e62:	83 f8 10             	cmp    $0x10,%eax
80101e65:	75 5e                	jne    80101ec5 <dirlink+0xc5>
      panic("dirlink read");
    if(de.inum == 0)
80101e67:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e6c:	75 d2                	jne    80101e40 <dirlink+0x40>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101e6e:	8b 45 0c             	mov    0xc(%ebp),%eax
80101e71:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101e78:	00 
80101e79:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e7d:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e80:	89 04 24             	mov    %eax,(%esp)
80101e83:	e8 68 26 00 00       	call   801044f0 <strncpy>
  de.inum = inum;
80101e88:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e8b:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101e92:	00 
80101e93:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101e97:	89 74 24 04          	mov    %esi,0x4(%esp)
80101e9b:	89 1c 24             	mov    %ebx,(%esp)
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101e9e:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ea2:	e8 99 fb ff ff       	call   80101a40 <writei>
80101ea7:	83 f8 10             	cmp    $0x10,%eax
80101eaa:	75 25                	jne    80101ed1 <dirlink+0xd1>
    panic("dirlink");

  return 0;
80101eac:	31 c0                	xor    %eax,%eax
}
80101eae:	83 c4 2c             	add    $0x2c,%esp
80101eb1:	5b                   	pop    %ebx
80101eb2:	5e                   	pop    %esi
80101eb3:	5f                   	pop    %edi
80101eb4:	5d                   	pop    %ebp
80101eb5:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101eb6:	89 04 24             	mov    %eax,(%esp)
80101eb9:	e8 02 f9 ff ff       	call   801017c0 <iput>
    return -1;
80101ebe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ec3:	eb e9                	jmp    80101eae <dirlink+0xae>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101ec5:	c7 04 24 d5 6e 10 80 	movl   $0x80106ed5,(%esp)
80101ecc:	e8 8f e4 ff ff       	call   80100360 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101ed1:	c7 04 24 bf 74 10 80 	movl   $0x801074bf,(%esp)
80101ed8:	e8 83 e4 ff ff       	call   80100360 <panic>
80101edd:	8d 76 00             	lea    0x0(%esi),%esi

80101ee0 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101ee0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ee1:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101ee3:	89 e5                	mov    %esp,%ebp
80101ee5:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ee8:	8b 45 08             	mov    0x8(%ebp),%eax
80101eeb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101eee:	e8 6d fd ff ff       	call   80101c60 <namex>
}
80101ef3:	c9                   	leave  
80101ef4:	c3                   	ret    
80101ef5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ef9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f00 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101f00:	55                   	push   %ebp
  return namex(path, 1, name);
80101f01:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101f06:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101f08:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f0b:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101f0e:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101f0f:	e9 4c fd ff ff       	jmp    80101c60 <namex>
80101f14:	66 90                	xchg   %ax,%ax
80101f16:	66 90                	xchg   %ax,%ax
80101f18:	66 90                	xchg   %ax,%ax
80101f1a:	66 90                	xchg   %ax,%ax
80101f1c:	66 90                	xchg   %ax,%ax
80101f1e:	66 90                	xchg   %ax,%ax

80101f20 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f20:	55                   	push   %ebp
80101f21:	89 e5                	mov    %esp,%ebp
80101f23:	56                   	push   %esi
80101f24:	89 c6                	mov    %eax,%esi
80101f26:	53                   	push   %ebx
80101f27:	83 ec 10             	sub    $0x10,%esp
  if(b == 0)
80101f2a:	85 c0                	test   %eax,%eax
80101f2c:	0f 84 99 00 00 00    	je     80101fcb <idestart+0xab>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f32:	8b 48 08             	mov    0x8(%eax),%ecx
80101f35:	81 f9 e7 03 00 00    	cmp    $0x3e7,%ecx
80101f3b:	0f 87 7e 00 00 00    	ja     80101fbf <idestart+0x9f>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f41:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f46:	66 90                	xchg   %ax,%ax
80101f48:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f49:	83 e0 c0             	and    $0xffffffc0,%eax
80101f4c:	3c 40                	cmp    $0x40,%al
80101f4e:	75 f8                	jne    80101f48 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f50:	31 db                	xor    %ebx,%ebx
80101f52:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f57:	89 d8                	mov    %ebx,%eax
80101f59:	ee                   	out    %al,(%dx)
80101f5a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f5f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f64:	ee                   	out    %al,(%dx)
80101f65:	0f b6 c1             	movzbl %cl,%eax
80101f68:	b2 f3                	mov    $0xf3,%dl
80101f6a:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101f6b:	89 c8                	mov    %ecx,%eax
80101f6d:	b2 f4                	mov    $0xf4,%dl
80101f6f:	c1 f8 08             	sar    $0x8,%eax
80101f72:	ee                   	out    %al,(%dx)
80101f73:	b2 f5                	mov    $0xf5,%dl
80101f75:	89 d8                	mov    %ebx,%eax
80101f77:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101f78:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101f7c:	b2 f6                	mov    $0xf6,%dl
80101f7e:	83 e0 01             	and    $0x1,%eax
80101f81:	c1 e0 04             	shl    $0x4,%eax
80101f84:	83 c8 e0             	or     $0xffffffe0,%eax
80101f87:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101f88:	f6 06 04             	testb  $0x4,(%esi)
80101f8b:	75 13                	jne    80101fa0 <idestart+0x80>
80101f8d:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f92:	b8 20 00 00 00       	mov    $0x20,%eax
80101f97:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f98:	83 c4 10             	add    $0x10,%esp
80101f9b:	5b                   	pop    %ebx
80101f9c:	5e                   	pop    %esi
80101f9d:	5d                   	pop    %ebp
80101f9e:	c3                   	ret    
80101f9f:	90                   	nop
80101fa0:	b2 f7                	mov    $0xf7,%dl
80101fa2:	b8 30 00 00 00       	mov    $0x30,%eax
80101fa7:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80101fa8:	b9 80 00 00 00       	mov    $0x80,%ecx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
80101fad:	83 c6 5c             	add    $0x5c,%esi
80101fb0:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101fb5:	fc                   	cld    
80101fb6:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fb8:	83 c4 10             	add    $0x10,%esp
80101fbb:	5b                   	pop    %ebx
80101fbc:	5e                   	pop    %esi
80101fbd:	5d                   	pop    %ebp
80101fbe:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
80101fbf:	c7 04 24 40 6f 10 80 	movl   $0x80106f40,(%esp)
80101fc6:	e8 95 e3 ff ff       	call   80100360 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
80101fcb:	c7 04 24 37 6f 10 80 	movl   $0x80106f37,(%esp)
80101fd2:	e8 89 e3 ff ff       	call   80100360 <panic>
80101fd7:	89 f6                	mov    %esi,%esi
80101fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fe0 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80101fe0:	55                   	push   %ebp
80101fe1:	89 e5                	mov    %esp,%ebp
80101fe3:	83 ec 18             	sub    $0x18,%esp
  int i;

  initlock(&idelock, "ide");
80101fe6:	c7 44 24 04 52 6f 10 	movl   $0x80106f52,0x4(%esp)
80101fed:	80 
80101fee:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80101ff5:	e8 66 21 00 00       	call   80104160 <initlock>
  picenable(IRQ_IDE);
80101ffa:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80102001:	e8 ea 11 00 00       	call   801031f0 <picenable>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102006:	a1 80 2d 11 80       	mov    0x80112d80,%eax
8010200b:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80102012:	83 e8 01             	sub    $0x1,%eax
80102015:	89 44 24 04          	mov    %eax,0x4(%esp)
80102019:	e8 82 02 00 00       	call   801022a0 <ioapicenable>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010201e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102023:	90                   	nop
80102024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102028:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102029:	83 e0 c0             	and    $0xffffffc0,%eax
8010202c:	3c 40                	cmp    $0x40,%al
8010202e:	75 f8                	jne    80102028 <ideinit+0x48>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102030:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102035:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010203a:	ee                   	out    %al,(%dx)
8010203b:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102040:	b2 f7                	mov    $0xf7,%dl
80102042:	eb 09                	jmp    8010204d <ideinit+0x6d>
80102044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80102048:	83 e9 01             	sub    $0x1,%ecx
8010204b:	74 0f                	je     8010205c <ideinit+0x7c>
8010204d:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
8010204e:	84 c0                	test   %al,%al
80102050:	74 f6                	je     80102048 <ideinit+0x68>
      havedisk1 = 1;
80102052:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102059:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010205c:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102061:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102066:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
80102067:	c9                   	leave  
80102068:	c3                   	ret    
80102069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102070 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102070:	55                   	push   %ebp
80102071:	89 e5                	mov    %esp,%ebp
80102073:	57                   	push   %edi
80102074:	56                   	push   %esi
80102075:	53                   	push   %ebx
80102076:	83 ec 1c             	sub    $0x1c,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102079:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80102080:	e8 5b 21 00 00       	call   801041e0 <acquire>
  if((b = idequeue) == 0){
80102085:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
8010208b:	85 db                	test   %ebx,%ebx
8010208d:	74 30                	je     801020bf <ideintr+0x4f>
    release(&idelock);
    // cprintf("spurious IDE interrupt\n");
    return;
  }
  idequeue = b->qnext;
8010208f:	8b 43 58             	mov    0x58(%ebx),%eax
80102092:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102097:	8b 33                	mov    (%ebx),%esi
80102099:	f7 c6 04 00 00 00    	test   $0x4,%esi
8010209f:	74 37                	je     801020d8 <ideintr+0x68>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801020a1:	83 e6 fb             	and    $0xfffffffb,%esi
801020a4:	83 ce 02             	or     $0x2,%esi
801020a7:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
801020a9:	89 1c 24             	mov    %ebx,(%esp)
801020ac:	e8 cf 1d 00 00       	call   80103e80 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
801020b1:	a1 64 a5 10 80       	mov    0x8010a564,%eax
801020b6:	85 c0                	test   %eax,%eax
801020b8:	74 05                	je     801020bf <ideintr+0x4f>
    idestart(idequeue);
801020ba:	e8 61 fe ff ff       	call   80101f20 <idestart>
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
  if((b = idequeue) == 0){
    release(&idelock);
801020bf:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
801020c6:	e8 45 22 00 00       	call   80104310 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
801020cb:	83 c4 1c             	add    $0x1c,%esp
801020ce:	5b                   	pop    %ebx
801020cf:	5e                   	pop    %esi
801020d0:	5f                   	pop    %edi
801020d1:	5d                   	pop    %ebp
801020d2:	c3                   	ret    
801020d3:	90                   	nop
801020d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020d8:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020dd:	8d 76 00             	lea    0x0(%esi),%esi
801020e0:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020e1:	89 c1                	mov    %eax,%ecx
801020e3:	83 e1 c0             	and    $0xffffffc0,%ecx
801020e6:	80 f9 40             	cmp    $0x40,%cl
801020e9:	75 f5                	jne    801020e0 <ideintr+0x70>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020eb:	a8 21                	test   $0x21,%al
801020ed:	75 b2                	jne    801020a1 <ideintr+0x31>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
801020ef:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
801020f2:	b9 80 00 00 00       	mov    $0x80,%ecx
801020f7:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020fc:	fc                   	cld    
801020fd:	f3 6d                	rep insl (%dx),%es:(%edi)
801020ff:	8b 33                	mov    (%ebx),%esi
80102101:	eb 9e                	jmp    801020a1 <ideintr+0x31>
80102103:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102110 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102110:	55                   	push   %ebp
80102111:	89 e5                	mov    %esp,%ebp
80102113:	53                   	push   %ebx
80102114:	83 ec 14             	sub    $0x14,%esp
80102117:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010211a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010211d:	89 04 24             	mov    %eax,(%esp)
80102120:	e8 0b 20 00 00       	call   80104130 <holdingsleep>
80102125:	85 c0                	test   %eax,%eax
80102127:	0f 84 9e 00 00 00    	je     801021cb <iderw+0xbb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010212d:	8b 03                	mov    (%ebx),%eax
8010212f:	83 e0 06             	and    $0x6,%eax
80102132:	83 f8 02             	cmp    $0x2,%eax
80102135:	0f 84 a8 00 00 00    	je     801021e3 <iderw+0xd3>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010213b:	8b 53 04             	mov    0x4(%ebx),%edx
8010213e:	85 d2                	test   %edx,%edx
80102140:	74 0d                	je     8010214f <iderw+0x3f>
80102142:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102147:	85 c0                	test   %eax,%eax
80102149:	0f 84 88 00 00 00    	je     801021d7 <iderw+0xc7>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
8010214f:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80102156:	e8 85 20 00 00       	call   801041e0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010215b:	a1 64 a5 10 80       	mov    0x8010a564,%eax
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102160:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102167:	85 c0                	test   %eax,%eax
80102169:	75 07                	jne    80102172 <iderw+0x62>
8010216b:	eb 4e                	jmp    801021bb <iderw+0xab>
8010216d:	8d 76 00             	lea    0x0(%esi),%esi
80102170:	89 d0                	mov    %edx,%eax
80102172:	8b 50 58             	mov    0x58(%eax),%edx
80102175:	85 d2                	test   %edx,%edx
80102177:	75 f7                	jne    80102170 <iderw+0x60>
80102179:	83 c0 58             	add    $0x58,%eax
    ;
  *pp = b;
8010217c:	89 18                	mov    %ebx,(%eax)

  // Start disk if necessary.
  if(idequeue == b)
8010217e:	39 1d 64 a5 10 80    	cmp    %ebx,0x8010a564
80102184:	74 3c                	je     801021c2 <iderw+0xb2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80102186:	8b 03                	mov    (%ebx),%eax
80102188:	83 e0 06             	and    $0x6,%eax
8010218b:	83 f8 02             	cmp    $0x2,%eax
8010218e:	74 1a                	je     801021aa <iderw+0x9a>
    sleep(b, &idelock);
80102190:	c7 44 24 04 80 a5 10 	movl   $0x8010a580,0x4(%esp)
80102197:	80 
80102198:	89 1c 24             	mov    %ebx,(%esp)
8010219b:	e8 40 1b 00 00       	call   80103ce0 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021a0:	8b 13                	mov    (%ebx),%edx
801021a2:	83 e2 06             	and    $0x6,%edx
801021a5:	83 fa 02             	cmp    $0x2,%edx
801021a8:	75 e6                	jne    80102190 <iderw+0x80>
    sleep(b, &idelock);
  }

  release(&idelock);
801021aa:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
801021b1:	83 c4 14             	add    $0x14,%esp
801021b4:	5b                   	pop    %ebx
801021b5:	5d                   	pop    %ebp
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }

  release(&idelock);
801021b6:	e9 55 21 00 00       	jmp    80104310 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021bb:	b8 64 a5 10 80       	mov    $0x8010a564,%eax
801021c0:	eb ba                	jmp    8010217c <iderw+0x6c>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
801021c2:	89 d8                	mov    %ebx,%eax
801021c4:	e8 57 fd ff ff       	call   80101f20 <idestart>
801021c9:	eb bb                	jmp    80102186 <iderw+0x76>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
801021cb:	c7 04 24 56 6f 10 80 	movl   $0x80106f56,(%esp)
801021d2:	e8 89 e1 ff ff       	call   80100360 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
801021d7:	c7 04 24 81 6f 10 80 	movl   $0x80106f81,(%esp)
801021de:	e8 7d e1 ff ff       	call   80100360 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
801021e3:	c7 04 24 6c 6f 10 80 	movl   $0x80106f6c,(%esp)
801021ea:	e8 71 e1 ff ff       	call   80100360 <panic>
801021ef:	90                   	nop

801021f0 <ioapicinit>:
void
ioapicinit(void)
{
  int i, id, maxintr;

  if(!ismp)
801021f0:	a1 84 27 11 80       	mov    0x80112784,%eax
801021f5:	85 c0                	test   %eax,%eax
801021f7:	0f 84 9b 00 00 00    	je     80102298 <ioapicinit+0xa8>
  ioapic->data = data;
}

void
ioapicinit(void)
{
801021fd:	55                   	push   %ebp
801021fe:	89 e5                	mov    %esp,%ebp
80102200:	56                   	push   %esi
80102201:	53                   	push   %ebx
80102202:	83 ec 10             	sub    $0x10,%esp
  int i, id, maxintr;

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
80102205:	c7 05 54 26 11 80 00 	movl   $0xfec00000,0x80112654
8010220c:	00 c0 fe 
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
8010220f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102216:	00 00 00 
  return ioapic->data;
80102219:	8b 15 54 26 11 80    	mov    0x80112654,%edx
8010221f:	8b 42 10             	mov    0x10(%edx),%eax
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
80102222:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
80102228:	8b 1d 54 26 11 80    	mov    0x80112654,%ebx
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010222e:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102235:	c1 e8 10             	shr    $0x10,%eax
80102238:	0f b6 f0             	movzbl %al,%esi

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  return ioapic->data;
8010223b:	8b 43 10             	mov    0x10(%ebx),%eax
  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
8010223e:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
80102241:	39 c2                	cmp    %eax,%edx
80102243:	74 12                	je     80102257 <ioapicinit+0x67>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102245:	c7 04 24 a0 6f 10 80 	movl   $0x80106fa0,(%esp)
8010224c:	e8 ff e3 ff ff       	call   80100650 <cprintf>
80102251:	8b 1d 54 26 11 80    	mov    0x80112654,%ebx
80102257:	ba 10 00 00 00       	mov    $0x10,%edx
8010225c:	31 c0                	xor    %eax,%eax
8010225e:	eb 02                	jmp    80102262 <ioapicinit+0x72>
80102260:	89 cb                	mov    %ecx,%ebx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102262:	89 13                	mov    %edx,(%ebx)
  ioapic->data = data;
80102264:	8b 1d 54 26 11 80    	mov    0x80112654,%ebx
8010226a:	8d 48 20             	lea    0x20(%eax),%ecx
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
8010226d:	81 c9 00 00 01 00    	or     $0x10000,%ecx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
80102273:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102276:	89 4b 10             	mov    %ecx,0x10(%ebx)
80102279:	8d 4a 01             	lea    0x1(%edx),%ecx
8010227c:	83 c2 02             	add    $0x2,%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010227f:	89 0b                	mov    %ecx,(%ebx)
  ioapic->data = data;
80102281:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
80102287:	39 c6                	cmp    %eax,%esi

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102289:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
80102290:	7d ce                	jge    80102260 <ioapicinit+0x70>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
80102292:	83 c4 10             	add    $0x10,%esp
80102295:	5b                   	pop    %ebx
80102296:	5e                   	pop    %esi
80102297:	5d                   	pop    %ebp
80102298:	f3 c3                	repz ret 
8010229a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801022a0 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
  if(!ismp)
801022a0:	8b 15 84 27 11 80    	mov    0x80112784,%edx
  }
}

void
ioapicenable(int irq, int cpunum)
{
801022a6:	55                   	push   %ebp
801022a7:	89 e5                	mov    %esp,%ebp
801022a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!ismp)
801022ac:	85 d2                	test   %edx,%edx
801022ae:	74 29                	je     801022d9 <ioapicenable+0x39>
    return;

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
801022b0:	8d 48 20             	lea    0x20(%eax),%ecx
801022b3:	8d 54 00 10          	lea    0x10(%eax,%eax,1),%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022b7:	a1 54 26 11 80       	mov    0x80112654,%eax
801022bc:	89 10                	mov    %edx,(%eax)
  ioapic->data = data;
801022be:	a1 54 26 11 80       	mov    0x80112654,%eax

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022c3:	83 c2 01             	add    $0x1,%edx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801022c6:	89 48 10             	mov    %ecx,0x10(%eax)

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022c9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022cc:	89 10                	mov    %edx,(%eax)
  ioapic->data = data;
801022ce:	a1 54 26 11 80       	mov    0x80112654,%eax

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022d3:	c1 e1 18             	shl    $0x18,%ecx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801022d6:	89 48 10             	mov    %ecx,0x10(%eax)
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
801022d9:	5d                   	pop    %ebp
801022da:	c3                   	ret    
801022db:	66 90                	xchg   %ax,%ax
801022dd:	66 90                	xchg   %ax,%ax
801022df:	90                   	nop

801022e0 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
801022e0:	55                   	push   %ebp
801022e1:	89 e5                	mov    %esp,%ebp
801022e3:	53                   	push   %ebx
801022e4:	83 ec 14             	sub    $0x14,%esp
801022e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
801022ea:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022f0:	75 7c                	jne    8010236e <kfree+0x8e>
801022f2:	81 fb 28 56 11 80    	cmp    $0x80115628,%ebx
801022f8:	72 74                	jb     8010236e <kfree+0x8e>
801022fa:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102300:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102305:	77 67                	ja     8010236e <kfree+0x8e>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102307:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010230e:	00 
8010230f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80102316:	00 
80102317:	89 1c 24             	mov    %ebx,(%esp)
8010231a:	e8 41 20 00 00       	call   80104360 <memset>

  if(kmem.use_lock)
8010231f:	8b 15 94 26 11 80    	mov    0x80112694,%edx
80102325:	85 d2                	test   %edx,%edx
80102327:	75 37                	jne    80102360 <kfree+0x80>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102329:	a1 98 26 11 80       	mov    0x80112698,%eax
8010232e:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
80102330:	a1 94 26 11 80       	mov    0x80112694,%eax

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
80102335:	89 1d 98 26 11 80    	mov    %ebx,0x80112698
  if(kmem.use_lock)
8010233b:	85 c0                	test   %eax,%eax
8010233d:	75 09                	jne    80102348 <kfree+0x68>
    release(&kmem.lock);
}
8010233f:	83 c4 14             	add    $0x14,%esp
80102342:	5b                   	pop    %ebx
80102343:	5d                   	pop    %ebp
80102344:	c3                   	ret    
80102345:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
80102348:	c7 45 08 60 26 11 80 	movl   $0x80112660,0x8(%ebp)
}
8010234f:	83 c4 14             	add    $0x14,%esp
80102352:	5b                   	pop    %ebx
80102353:	5d                   	pop    %ebp
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
80102354:	e9 b7 1f 00 00       	jmp    80104310 <release>
80102359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102360:	c7 04 24 60 26 11 80 	movl   $0x80112660,(%esp)
80102367:	e8 74 1e 00 00       	call   801041e0 <acquire>
8010236c:	eb bb                	jmp    80102329 <kfree+0x49>
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
8010236e:	c7 04 24 d2 6f 10 80 	movl   $0x80106fd2,(%esp)
80102375:	e8 e6 df ff ff       	call   80100360 <panic>
8010237a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102380 <freerange>:
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102380:	55                   	push   %ebp
80102381:	89 e5                	mov    %esp,%ebp
80102383:	56                   	push   %esi
80102384:	53                   	push   %ebx
80102385:	83 ec 10             	sub    $0x10,%esp
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102388:	8b 45 08             	mov    0x8(%ebp),%eax
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
8010238b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010238e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
80102394:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010239a:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
801023a0:	39 de                	cmp    %ebx,%esi
801023a2:	73 08                	jae    801023ac <freerange+0x2c>
801023a4:	eb 18                	jmp    801023be <freerange+0x3e>
801023a6:	66 90                	xchg   %ax,%ax
801023a8:	89 da                	mov    %ebx,%edx
801023aa:	89 c3                	mov    %eax,%ebx
    kfree(p);
801023ac:	89 14 24             	mov    %edx,(%esp)
801023af:	e8 2c ff ff ff       	call   801022e0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023b4:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
801023ba:	39 f0                	cmp    %esi,%eax
801023bc:	76 ea                	jbe    801023a8 <freerange+0x28>
    kfree(p);
}
801023be:	83 c4 10             	add    $0x10,%esp
801023c1:	5b                   	pop    %ebx
801023c2:	5e                   	pop    %esi
801023c3:	5d                   	pop    %ebp
801023c4:	c3                   	ret    
801023c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801023c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801023d0 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
801023d0:	55                   	push   %ebp
801023d1:	89 e5                	mov    %esp,%ebp
801023d3:	56                   	push   %esi
801023d4:	53                   	push   %ebx
801023d5:	83 ec 10             	sub    $0x10,%esp
801023d8:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
801023db:	c7 44 24 04 d8 6f 10 	movl   $0x80106fd8,0x4(%esp)
801023e2:	80 
801023e3:	c7 04 24 60 26 11 80 	movl   $0x80112660,(%esp)
801023ea:	e8 71 1d 00 00       	call   80104160 <initlock>

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023ef:	8b 45 08             	mov    0x8(%ebp),%eax
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
801023f2:	c7 05 94 26 11 80 00 	movl   $0x0,0x80112694
801023f9:	00 00 00 

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023fc:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
80102402:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102408:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
8010240e:	39 de                	cmp    %ebx,%esi
80102410:	73 0a                	jae    8010241c <kinit1+0x4c>
80102412:	eb 1a                	jmp    8010242e <kinit1+0x5e>
80102414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102418:	89 da                	mov    %ebx,%edx
8010241a:	89 c3                	mov    %eax,%ebx
    kfree(p);
8010241c:	89 14 24             	mov    %edx,(%esp)
8010241f:	e8 bc fe ff ff       	call   801022e0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102424:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
8010242a:	39 c6                	cmp    %eax,%esi
8010242c:	73 ea                	jae    80102418 <kinit1+0x48>
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}
8010242e:	83 c4 10             	add    $0x10,%esp
80102431:	5b                   	pop    %ebx
80102432:	5e                   	pop    %esi
80102433:	5d                   	pop    %ebp
80102434:	c3                   	ret    
80102435:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102440 <kinit2>:

void
kinit2(void *vstart, void *vend)
{
80102440:	55                   	push   %ebp
80102441:	89 e5                	mov    %esp,%ebp
80102443:	56                   	push   %esi
80102444:	53                   	push   %ebx
80102445:	83 ec 10             	sub    $0x10,%esp

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102448:	8b 45 08             	mov    0x8(%ebp),%eax
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
8010244b:	8b 75 0c             	mov    0xc(%ebp),%esi

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010244e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
80102454:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010245a:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
80102460:	39 de                	cmp    %ebx,%esi
80102462:	73 08                	jae    8010246c <kinit2+0x2c>
80102464:	eb 18                	jmp    8010247e <kinit2+0x3e>
80102466:	66 90                	xchg   %ax,%ax
80102468:	89 da                	mov    %ebx,%edx
8010246a:	89 c3                	mov    %eax,%ebx
    kfree(p);
8010246c:	89 14 24             	mov    %edx,(%esp)
8010246f:	e8 6c fe ff ff       	call   801022e0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102474:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
8010247a:	39 c6                	cmp    %eax,%esi
8010247c:	73 ea                	jae    80102468 <kinit2+0x28>

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
8010247e:	c7 05 94 26 11 80 01 	movl   $0x1,0x80112694
80102485:	00 00 00 
}
80102488:	83 c4 10             	add    $0x10,%esp
8010248b:	5b                   	pop    %ebx
8010248c:	5e                   	pop    %esi
8010248d:	5d                   	pop    %ebp
8010248e:	c3                   	ret    
8010248f:	90                   	nop

80102490 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
80102490:	55                   	push   %ebp
80102491:	89 e5                	mov    %esp,%ebp
80102493:	53                   	push   %ebx
80102494:	83 ec 14             	sub    $0x14,%esp
  struct run *r;

  if(kmem.use_lock)
80102497:	a1 94 26 11 80       	mov    0x80112694,%eax
8010249c:	85 c0                	test   %eax,%eax
8010249e:	75 30                	jne    801024d0 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
801024a0:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
  if(r)
801024a6:	85 db                	test   %ebx,%ebx
801024a8:	74 08                	je     801024b2 <kalloc+0x22>
    kmem.freelist = r->next;
801024aa:	8b 13                	mov    (%ebx),%edx
801024ac:	89 15 98 26 11 80    	mov    %edx,0x80112698
  if(kmem.use_lock)
801024b2:	85 c0                	test   %eax,%eax
801024b4:	74 0c                	je     801024c2 <kalloc+0x32>
    release(&kmem.lock);
801024b6:	c7 04 24 60 26 11 80 	movl   $0x80112660,(%esp)
801024bd:	e8 4e 1e 00 00       	call   80104310 <release>
  return (char*)r;
}
801024c2:	83 c4 14             	add    $0x14,%esp
801024c5:	89 d8                	mov    %ebx,%eax
801024c7:	5b                   	pop    %ebx
801024c8:	5d                   	pop    %ebp
801024c9:	c3                   	ret    
801024ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
801024d0:	c7 04 24 60 26 11 80 	movl   $0x80112660,(%esp)
801024d7:	e8 04 1d 00 00       	call   801041e0 <acquire>
801024dc:	a1 94 26 11 80       	mov    0x80112694,%eax
801024e1:	eb bd                	jmp    801024a0 <kalloc+0x10>
801024e3:	66 90                	xchg   %ax,%ax
801024e5:	66 90                	xchg   %ax,%ax
801024e7:	66 90                	xchg   %ax,%ax
801024e9:	66 90                	xchg   %ax,%ax
801024eb:	66 90                	xchg   %ax,%ax
801024ed:	66 90                	xchg   %ax,%ax
801024ef:	90                   	nop

801024f0 <kbdgetc>:
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801024f0:	ba 64 00 00 00       	mov    $0x64,%edx
801024f5:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
801024f6:	a8 01                	test   $0x1,%al
801024f8:	0f 84 ba 00 00 00    	je     801025b8 <kbdgetc+0xc8>
801024fe:	b2 60                	mov    $0x60,%dl
80102500:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102501:	0f b6 c8             	movzbl %al,%ecx

  if(data == 0xE0){
80102504:	81 f9 e0 00 00 00    	cmp    $0xe0,%ecx
8010250a:	0f 84 88 00 00 00    	je     80102598 <kbdgetc+0xa8>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102510:	84 c0                	test   %al,%al
80102512:	79 2c                	jns    80102540 <kbdgetc+0x50>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102514:	8b 15 b4 a5 10 80    	mov    0x8010a5b4,%edx
8010251a:	f6 c2 40             	test   $0x40,%dl
8010251d:	75 05                	jne    80102524 <kbdgetc+0x34>
8010251f:	89 c1                	mov    %eax,%ecx
80102521:	83 e1 7f             	and    $0x7f,%ecx
    shift &= ~(shiftcode[data] | E0ESC);
80102524:	0f b6 81 00 71 10 80 	movzbl -0x7fef8f00(%ecx),%eax
8010252b:	83 c8 40             	or     $0x40,%eax
8010252e:	0f b6 c0             	movzbl %al,%eax
80102531:	f7 d0                	not    %eax
80102533:	21 d0                	and    %edx,%eax
80102535:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
    return 0;
8010253a:	31 c0                	xor    %eax,%eax
8010253c:	c3                   	ret    
8010253d:	8d 76 00             	lea    0x0(%esi),%esi
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
80102540:	55                   	push   %ebp
80102541:	89 e5                	mov    %esp,%ebp
80102543:	53                   	push   %ebx
80102544:	8b 1d b4 a5 10 80    	mov    0x8010a5b4,%ebx
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
8010254a:	f6 c3 40             	test   $0x40,%bl
8010254d:	74 09                	je     80102558 <kbdgetc+0x68>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010254f:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102552:	83 e3 bf             	and    $0xffffffbf,%ebx
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102555:	0f b6 c8             	movzbl %al,%ecx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
80102558:	0f b6 91 00 71 10 80 	movzbl -0x7fef8f00(%ecx),%edx
  shift ^= togglecode[data];
8010255f:	0f b6 81 00 70 10 80 	movzbl -0x7fef9000(%ecx),%eax
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
80102566:	09 da                	or     %ebx,%edx
  shift ^= togglecode[data];
80102568:	31 c2                	xor    %eax,%edx
  c = charcode[shift & (CTL | SHIFT)][data];
8010256a:	89 d0                	mov    %edx,%eax
8010256c:	83 e0 03             	and    $0x3,%eax
8010256f:	8b 04 85 e0 6f 10 80 	mov    -0x7fef9020(,%eax,4),%eax
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
80102576:	89 15 b4 a5 10 80    	mov    %edx,0x8010a5b4
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
8010257c:	83 e2 08             	and    $0x8,%edx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
8010257f:	0f b6 04 08          	movzbl (%eax,%ecx,1),%eax
  if(shift & CAPSLOCK){
80102583:	74 0b                	je     80102590 <kbdgetc+0xa0>
    if('a' <= c && c <= 'z')
80102585:	8d 50 9f             	lea    -0x61(%eax),%edx
80102588:	83 fa 19             	cmp    $0x19,%edx
8010258b:	77 1b                	ja     801025a8 <kbdgetc+0xb8>
      c += 'A' - 'a';
8010258d:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102590:	5b                   	pop    %ebx
80102591:	5d                   	pop    %ebp
80102592:	c3                   	ret    
80102593:	90                   	nop
80102594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
80102598:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
    return 0;
8010259f:	31 c0                	xor    %eax,%eax
801025a1:	c3                   	ret    
801025a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
801025a8:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
801025ab:	8d 50 20             	lea    0x20(%eax),%edx
801025ae:	83 f9 19             	cmp    $0x19,%ecx
801025b1:	0f 46 c2             	cmovbe %edx,%eax
  }
  return c;
801025b4:	eb da                	jmp    80102590 <kbdgetc+0xa0>
801025b6:	66 90                	xchg   %ax,%ax
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
    return -1;
801025b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025bd:	c3                   	ret    
801025be:	66 90                	xchg   %ax,%ax

801025c0 <kbdintr>:
  return c;
}

void
kbdintr(void)
{
801025c0:	55                   	push   %ebp
801025c1:	89 e5                	mov    %esp,%ebp
801025c3:	83 ec 18             	sub    $0x18,%esp
  consoleintr(kbdgetc);
801025c6:	c7 04 24 f0 24 10 80 	movl   $0x801024f0,(%esp)
801025cd:	e8 de e1 ff ff       	call   801007b0 <consoleintr>
}
801025d2:	c9                   	leave  
801025d3:	c3                   	ret    
801025d4:	66 90                	xchg   %ax,%ax
801025d6:	66 90                	xchg   %ax,%ax
801025d8:	66 90                	xchg   %ax,%ax
801025da:	66 90                	xchg   %ax,%ax
801025dc:	66 90                	xchg   %ax,%ax
801025de:	66 90                	xchg   %ax,%ax

801025e0 <fill_rtcdate>:

  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
801025e0:	55                   	push   %ebp
801025e1:	89 c1                	mov    %eax,%ecx
801025e3:	89 e5                	mov    %esp,%ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801025e5:	ba 70 00 00 00       	mov    $0x70,%edx
801025ea:	53                   	push   %ebx
801025eb:	31 c0                	xor    %eax,%eax
801025ed:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801025ee:	bb 71 00 00 00       	mov    $0x71,%ebx
801025f3:	89 da                	mov    %ebx,%edx
801025f5:	ec                   	in     (%dx),%al
static uint cmos_read(uint reg)
{
  outb(CMOS_PORT,  reg);
  microdelay(200);

  return inb(CMOS_RETURN);
801025f6:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801025f9:	b2 70                	mov    $0x70,%dl
801025fb:	89 01                	mov    %eax,(%ecx)
801025fd:	b8 02 00 00 00       	mov    $0x2,%eax
80102602:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102603:	89 da                	mov    %ebx,%edx
80102605:	ec                   	in     (%dx),%al
80102606:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102609:	b2 70                	mov    $0x70,%dl
8010260b:	89 41 04             	mov    %eax,0x4(%ecx)
8010260e:	b8 04 00 00 00       	mov    $0x4,%eax
80102613:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102614:	89 da                	mov    %ebx,%edx
80102616:	ec                   	in     (%dx),%al
80102617:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010261a:	b2 70                	mov    $0x70,%dl
8010261c:	89 41 08             	mov    %eax,0x8(%ecx)
8010261f:	b8 07 00 00 00       	mov    $0x7,%eax
80102624:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102625:	89 da                	mov    %ebx,%edx
80102627:	ec                   	in     (%dx),%al
80102628:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010262b:	b2 70                	mov    $0x70,%dl
8010262d:	89 41 0c             	mov    %eax,0xc(%ecx)
80102630:	b8 08 00 00 00       	mov    $0x8,%eax
80102635:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102636:	89 da                	mov    %ebx,%edx
80102638:	ec                   	in     (%dx),%al
80102639:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010263c:	b2 70                	mov    $0x70,%dl
8010263e:	89 41 10             	mov    %eax,0x10(%ecx)
80102641:	b8 09 00 00 00       	mov    $0x9,%eax
80102646:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102647:	89 da                	mov    %ebx,%edx
80102649:	ec                   	in     (%dx),%al
8010264a:	0f b6 d8             	movzbl %al,%ebx
8010264d:	89 59 14             	mov    %ebx,0x14(%ecx)
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
}
80102650:	5b                   	pop    %ebx
80102651:	5d                   	pop    %ebp
80102652:	c3                   	ret    
80102653:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102660 <lapicinit>:
//PAGEBREAK!

void
lapicinit(void)
{
  if(!lapic)
80102660:	a1 9c 26 11 80       	mov    0x8011269c,%eax
}
//PAGEBREAK!

void
lapicinit(void)
{
80102665:	55                   	push   %ebp
80102666:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102668:	85 c0                	test   %eax,%eax
8010266a:	0f 84 c0 00 00 00    	je     80102730 <lapicinit+0xd0>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102670:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102677:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010267a:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010267d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102684:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102687:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010268a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102691:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
80102694:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102697:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010269e:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
801026a1:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026a4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801026ab:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026ae:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026b1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801026b8:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026bb:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
801026be:	8b 50 30             	mov    0x30(%eax),%edx
801026c1:	c1 ea 10             	shr    $0x10,%edx
801026c4:	80 fa 03             	cmp    $0x3,%dl
801026c7:	77 6f                	ja     80102738 <lapicinit+0xd8>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026c9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801026d0:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026d3:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026d6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026dd:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026e0:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026e3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ea:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026ed:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026f0:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801026f7:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026fa:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026fd:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102704:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102707:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010270a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102711:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102714:	8b 50 20             	mov    0x20(%eax),%edx
80102717:	90                   	nop
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102718:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
8010271e:	80 e6 10             	and    $0x10,%dh
80102721:	75 f5                	jne    80102718 <lapicinit+0xb8>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102723:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
8010272a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010272d:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102730:	5d                   	pop    %ebp
80102731:	c3                   	ret    
80102732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102738:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
8010273f:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
80102742:	8b 50 20             	mov    0x20(%eax),%edx
80102745:	eb 82                	jmp    801026c9 <lapicinit+0x69>
80102747:	89 f6                	mov    %esi,%esi
80102749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102750 <cpunum>:
  lapicw(TPR, 0);
}

int
cpunum(void)
{
80102750:	55                   	push   %ebp
80102751:	89 e5                	mov    %esp,%ebp
80102753:	56                   	push   %esi
80102754:	53                   	push   %ebx
80102755:	83 ec 10             	sub    $0x10,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80102758:	9c                   	pushf  
80102759:	58                   	pop    %eax
  // Cannot call cpu when interrupts are enabled:
  // result not guaranteed to last long enough to be used!
  // Would prefer to panic but even printing is chancy here:
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
8010275a:	f6 c4 02             	test   $0x2,%ah
8010275d:	74 12                	je     80102771 <cpunum+0x21>
    static int n;
    if(n++ == 0)
8010275f:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
80102764:	8d 50 01             	lea    0x1(%eax),%edx
80102767:	85 c0                	test   %eax,%eax
80102769:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
8010276f:	74 4a                	je     801027bb <cpunum+0x6b>
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
80102771:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102776:	85 c0                	test   %eax,%eax
80102778:	74 5d                	je     801027d7 <cpunum+0x87>
    return 0;

  apicid = lapic[ID] >> 24;
8010277a:	8b 58 20             	mov    0x20(%eax),%ebx
  for (i = 0; i < ncpu; ++i) {
8010277d:	8b 35 80 2d 11 80    	mov    0x80112d80,%esi
  }

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
80102783:	c1 eb 18             	shr    $0x18,%ebx
  for (i = 0; i < ncpu; ++i) {
80102786:	85 f6                	test   %esi,%esi
80102788:	7e 56                	jle    801027e0 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
8010278a:	0f b6 05 a0 27 11 80 	movzbl 0x801127a0,%eax
80102791:	39 d8                	cmp    %ebx,%eax
80102793:	74 42                	je     801027d7 <cpunum+0x87>
80102795:	ba 5c 28 11 80       	mov    $0x8011285c,%edx

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
8010279a:	31 c0                	xor    %eax,%eax
8010279c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027a0:	83 c0 01             	add    $0x1,%eax
801027a3:	39 f0                	cmp    %esi,%eax
801027a5:	74 39                	je     801027e0 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
801027a7:	0f b6 0a             	movzbl (%edx),%ecx
801027aa:	81 c2 bc 00 00 00    	add    $0xbc,%edx
801027b0:	39 d9                	cmp    %ebx,%ecx
801027b2:	75 ec                	jne    801027a0 <cpunum+0x50>
      return i;
  }
  panic("unknown apicid\n");
}
801027b4:	83 c4 10             	add    $0x10,%esp
801027b7:	5b                   	pop    %ebx
801027b8:	5e                   	pop    %esi
801027b9:	5d                   	pop    %ebp
801027ba:	c3                   	ret    
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
    static int n;
    if(n++ == 0)
      cprintf("cpu called from %x with interrupts enabled\n",
801027bb:	8b 45 04             	mov    0x4(%ebp),%eax
801027be:	c7 04 24 00 72 10 80 	movl   $0x80107200,(%esp)
801027c5:	89 44 24 04          	mov    %eax,0x4(%esp)
801027c9:	e8 82 de ff ff       	call   80100650 <cprintf>
        __builtin_return_address(0));
  }

  if (!lapic)
801027ce:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801027d3:	85 c0                	test   %eax,%eax
801027d5:	75 a3                	jne    8010277a <cpunum+0x2a>
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
801027d7:	83 c4 10             	add    $0x10,%esp
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
    return 0;
801027da:	31 c0                	xor    %eax,%eax
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
801027dc:	5b                   	pop    %ebx
801027dd:	5e                   	pop    %esi
801027de:	5d                   	pop    %ebp
801027df:	c3                   	ret    
  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
801027e0:	c7 04 24 2c 72 10 80 	movl   $0x8010722c,(%esp)
801027e7:	e8 74 db ff ff       	call   80100360 <panic>
801027ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027f0 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
801027f0:	a1 9c 26 11 80       	mov    0x8011269c,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
801027f5:	55                   	push   %ebp
801027f6:	89 e5                	mov    %esp,%ebp
  if(lapic)
801027f8:	85 c0                	test   %eax,%eax
801027fa:	74 0d                	je     80102809 <lapiceoi+0x19>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027fc:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102803:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102806:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
80102809:	5d                   	pop    %ebp
8010280a:	c3                   	ret    
8010280b:	90                   	nop
8010280c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102810 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102810:	55                   	push   %ebp
80102811:	89 e5                	mov    %esp,%ebp
}
80102813:	5d                   	pop    %ebp
80102814:	c3                   	ret    
80102815:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102820 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102820:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102821:	ba 70 00 00 00       	mov    $0x70,%edx
80102826:	89 e5                	mov    %esp,%ebp
80102828:	b8 0f 00 00 00       	mov    $0xf,%eax
8010282d:	53                   	push   %ebx
8010282e:	8b 4d 08             	mov    0x8(%ebp),%ecx
80102831:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80102834:	ee                   	out    %al,(%dx)
80102835:	b8 0a 00 00 00       	mov    $0xa,%eax
8010283a:	b2 71                	mov    $0x71,%dl
8010283c:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
8010283d:	31 c0                	xor    %eax,%eax
8010283f:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
80102845:	89 d8                	mov    %ebx,%eax
80102847:	c1 e8 04             	shr    $0x4,%eax
8010284a:	66 a3 69 04 00 80    	mov    %ax,0x80000469
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102850:	a1 9c 26 11 80       	mov    0x8011269c,%eax
  wrv[0] = 0;
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
80102855:	c1 e1 18             	shl    $0x18,%ecx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102858:	c1 eb 0c             	shr    $0xc,%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010285b:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102861:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102864:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
8010286b:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010286e:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102871:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102878:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010287b:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010287e:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102884:	8b 50 20             	mov    0x20(%eax),%edx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102887:	89 da                	mov    %ebx,%edx
80102889:	80 ce 06             	or     $0x6,%dh
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010288c:	89 90 00 03 00 00    	mov    %edx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102892:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102895:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010289b:	8b 48 20             	mov    0x20(%eax),%ecx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010289e:	89 90 00 03 00 00    	mov    %edx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801028a4:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
801028a7:	5b                   	pop    %ebx
801028a8:	5d                   	pop    %ebp
801028a9:	c3                   	ret    
801028aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801028b0 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
801028b0:	55                   	push   %ebp
801028b1:	ba 70 00 00 00       	mov    $0x70,%edx
801028b6:	89 e5                	mov    %esp,%ebp
801028b8:	b8 0b 00 00 00       	mov    $0xb,%eax
801028bd:	57                   	push   %edi
801028be:	56                   	push   %esi
801028bf:	53                   	push   %ebx
801028c0:	83 ec 4c             	sub    $0x4c,%esp
801028c3:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028c4:	b2 71                	mov    $0x71,%dl
801028c6:	ec                   	in     (%dx),%al
801028c7:	88 45 b7             	mov    %al,-0x49(%ebp)
801028ca:	8d 5d b8             	lea    -0x48(%ebp),%ebx
  struct rtcdate t1, t2;
  int sb, bcd;

  sb = cmos_read(CMOS_STATB);

  bcd = (sb & (1 << 2)) == 0;
801028cd:	80 65 b7 04          	andb   $0x4,-0x49(%ebp)
801028d1:	8d 7d d0             	lea    -0x30(%ebp),%edi
801028d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028d8:	be 70 00 00 00       	mov    $0x70,%esi

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
801028dd:	89 d8                	mov    %ebx,%eax
801028df:	e8 fc fc ff ff       	call   801025e0 <fill_rtcdate>
801028e4:	b8 0a 00 00 00       	mov    $0xa,%eax
801028e9:	89 f2                	mov    %esi,%edx
801028eb:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ec:	ba 71 00 00 00       	mov    $0x71,%edx
801028f1:	ec                   	in     (%dx),%al
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
801028f2:	84 c0                	test   %al,%al
801028f4:	78 e7                	js     801028dd <cmostime+0x2d>
        continue;
    fill_rtcdate(&t2);
801028f6:	89 f8                	mov    %edi,%eax
801028f8:	e8 e3 fc ff ff       	call   801025e0 <fill_rtcdate>
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
801028fd:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
80102904:	00 
80102905:	89 7c 24 04          	mov    %edi,0x4(%esp)
80102909:	89 1c 24             	mov    %ebx,(%esp)
8010290c:	e8 9f 1a 00 00       	call   801043b0 <memcmp>
80102911:	85 c0                	test   %eax,%eax
80102913:	75 c3                	jne    801028d8 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
80102915:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
80102919:	75 78                	jne    80102993 <cmostime+0xe3>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
8010291b:	8b 45 b8             	mov    -0x48(%ebp),%eax
8010291e:	89 c2                	mov    %eax,%edx
80102920:	83 e0 0f             	and    $0xf,%eax
80102923:	c1 ea 04             	shr    $0x4,%edx
80102926:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102929:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010292c:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
8010292f:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102932:	89 c2                	mov    %eax,%edx
80102934:	83 e0 0f             	and    $0xf,%eax
80102937:	c1 ea 04             	shr    $0x4,%edx
8010293a:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010293d:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102940:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102943:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102946:	89 c2                	mov    %eax,%edx
80102948:	83 e0 0f             	and    $0xf,%eax
8010294b:	c1 ea 04             	shr    $0x4,%edx
8010294e:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102951:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102954:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102957:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010295a:	89 c2                	mov    %eax,%edx
8010295c:	83 e0 0f             	and    $0xf,%eax
8010295f:	c1 ea 04             	shr    $0x4,%edx
80102962:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102965:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102968:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
8010296b:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010296e:	89 c2                	mov    %eax,%edx
80102970:	83 e0 0f             	and    $0xf,%eax
80102973:	c1 ea 04             	shr    $0x4,%edx
80102976:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102979:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010297c:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
8010297f:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102982:	89 c2                	mov    %eax,%edx
80102984:	83 e0 0f             	and    $0xf,%eax
80102987:	c1 ea 04             	shr    $0x4,%edx
8010298a:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010298d:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102990:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102993:	8b 4d 08             	mov    0x8(%ebp),%ecx
80102996:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102999:	89 01                	mov    %eax,(%ecx)
8010299b:	8b 45 bc             	mov    -0x44(%ebp),%eax
8010299e:	89 41 04             	mov    %eax,0x4(%ecx)
801029a1:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029a4:	89 41 08             	mov    %eax,0x8(%ecx)
801029a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029aa:	89 41 0c             	mov    %eax,0xc(%ecx)
801029ad:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029b0:	89 41 10             	mov    %eax,0x10(%ecx)
801029b3:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029b6:	89 41 14             	mov    %eax,0x14(%ecx)
  r->year += 2000;
801029b9:	81 41 14 d0 07 00 00 	addl   $0x7d0,0x14(%ecx)
}
801029c0:	83 c4 4c             	add    $0x4c,%esp
801029c3:	5b                   	pop    %ebx
801029c4:	5e                   	pop    %esi
801029c5:	5f                   	pop    %edi
801029c6:	5d                   	pop    %ebp
801029c7:	c3                   	ret    
801029c8:	66 90                	xchg   %ax,%ax
801029ca:	66 90                	xchg   %ax,%ax
801029cc:	66 90                	xchg   %ax,%ax
801029ce:	66 90                	xchg   %ax,%ax

801029d0 <install_trans>:
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
801029d0:	55                   	push   %ebp
801029d1:	89 e5                	mov    %esp,%ebp
801029d3:	57                   	push   %edi
801029d4:	56                   	push   %esi
801029d5:	53                   	push   %ebx
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801029d6:	31 db                	xor    %ebx,%ebx
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
801029d8:	83 ec 1c             	sub    $0x1c,%esp
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801029db:	a1 e8 26 11 80       	mov    0x801126e8,%eax
801029e0:	85 c0                	test   %eax,%eax
801029e2:	7e 78                	jle    80102a5c <install_trans+0x8c>
801029e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
801029e8:	a1 d4 26 11 80       	mov    0x801126d4,%eax
801029ed:	01 d8                	add    %ebx,%eax
801029ef:	83 c0 01             	add    $0x1,%eax
801029f2:	89 44 24 04          	mov    %eax,0x4(%esp)
801029f6:	a1 e4 26 11 80       	mov    0x801126e4,%eax
801029fb:	89 04 24             	mov    %eax,(%esp)
801029fe:	e8 cd d6 ff ff       	call   801000d0 <bread>
80102a03:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a05:	8b 04 9d ec 26 11 80 	mov    -0x7feed914(,%ebx,4),%eax
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a0c:	83 c3 01             	add    $0x1,%ebx
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a0f:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a13:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102a18:	89 04 24             	mov    %eax,(%esp)
80102a1b:	e8 b0 d6 ff ff       	call   801000d0 <bread>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102a20:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80102a27:	00 
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a28:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102a2a:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a2d:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a31:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a34:	89 04 24             	mov    %eax,(%esp)
80102a37:	e8 c4 19 00 00       	call   80104400 <memmove>
    bwrite(dbuf);  // write dst to disk
80102a3c:	89 34 24             	mov    %esi,(%esp)
80102a3f:	e8 5c d7 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102a44:	89 3c 24             	mov    %edi,(%esp)
80102a47:	e8 94 d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102a4c:	89 34 24             	mov    %esi,(%esp)
80102a4f:	e8 8c d7 ff ff       	call   801001e0 <brelse>
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a54:	39 1d e8 26 11 80    	cmp    %ebx,0x801126e8
80102a5a:	7f 8c                	jg     801029e8 <install_trans+0x18>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf);
    brelse(dbuf);
  }
}
80102a5c:	83 c4 1c             	add    $0x1c,%esp
80102a5f:	5b                   	pop    %ebx
80102a60:	5e                   	pop    %esi
80102a61:	5f                   	pop    %edi
80102a62:	5d                   	pop    %ebp
80102a63:	c3                   	ret    
80102a64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102a6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80102a70 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102a70:	55                   	push   %ebp
80102a71:	89 e5                	mov    %esp,%ebp
80102a73:	57                   	push   %edi
80102a74:	56                   	push   %esi
80102a75:	53                   	push   %ebx
80102a76:	83 ec 1c             	sub    $0x1c,%esp
  struct buf *buf = bread(log.dev, log.start);
80102a79:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102a7e:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a82:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102a87:	89 04 24             	mov    %eax,(%esp)
80102a8a:	e8 41 d6 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a8f:	8b 1d e8 26 11 80    	mov    0x801126e8,%ebx
  for (i = 0; i < log.lh.n; i++) {
80102a95:	31 d2                	xor    %edx,%edx
80102a97:	85 db                	test   %ebx,%ebx
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102a99:	89 c7                	mov    %eax,%edi
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a9b:	89 58 5c             	mov    %ebx,0x5c(%eax)
80102a9e:	8d 70 5c             	lea    0x5c(%eax),%esi
  for (i = 0; i < log.lh.n; i++) {
80102aa1:	7e 17                	jle    80102aba <write_head+0x4a>
80102aa3:	90                   	nop
80102aa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102aa8:	8b 0c 95 ec 26 11 80 	mov    -0x7feed914(,%edx,4),%ecx
80102aaf:	89 4c 96 04          	mov    %ecx,0x4(%esi,%edx,4)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102ab3:	83 c2 01             	add    $0x1,%edx
80102ab6:	39 da                	cmp    %ebx,%edx
80102ab8:	75 ee                	jne    80102aa8 <write_head+0x38>
    hb->block[i] = log.lh.block[i];
  }
  bwrite(buf);
80102aba:	89 3c 24             	mov    %edi,(%esp)
80102abd:	e8 de d6 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102ac2:	89 3c 24             	mov    %edi,(%esp)
80102ac5:	e8 16 d7 ff ff       	call   801001e0 <brelse>
}
80102aca:	83 c4 1c             	add    $0x1c,%esp
80102acd:	5b                   	pop    %ebx
80102ace:	5e                   	pop    %esi
80102acf:	5f                   	pop    %edi
80102ad0:	5d                   	pop    %ebp
80102ad1:	c3                   	ret    
80102ad2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ae0 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
80102ae0:	55                   	push   %ebp
80102ae1:	89 e5                	mov    %esp,%ebp
80102ae3:	56                   	push   %esi
80102ae4:	53                   	push   %ebx
80102ae5:	83 ec 30             	sub    $0x30,%esp
80102ae8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102aeb:	c7 44 24 04 3c 72 10 	movl   $0x8010723c,0x4(%esp)
80102af2:	80 
80102af3:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102afa:	e8 61 16 00 00       	call   80104160 <initlock>
  readsb(dev, &sb);
80102aff:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b02:	89 44 24 04          	mov    %eax,0x4(%esp)
80102b06:	89 1c 24             	mov    %ebx,(%esp)
80102b09:	e8 82 e8 ff ff       	call   80101390 <readsb>
  log.start = sb.logstart;
80102b0e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  log.size = sb.nlog;
80102b11:	8b 55 e8             	mov    -0x18(%ebp),%edx

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b14:	89 1c 24             	mov    %ebx,(%esp)
  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
80102b17:	89 1d e4 26 11 80    	mov    %ebx,0x801126e4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b1d:	89 44 24 04          	mov    %eax,0x4(%esp)

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
80102b21:	89 15 d8 26 11 80    	mov    %edx,0x801126d8
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102b27:	a3 d4 26 11 80       	mov    %eax,0x801126d4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b2c:	e8 9f d5 ff ff       	call   801000d0 <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102b31:	31 d2                	xor    %edx,%edx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102b33:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102b36:	8d 70 5c             	lea    0x5c(%eax),%esi
  for (i = 0; i < log.lh.n; i++) {
80102b39:	85 db                	test   %ebx,%ebx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102b3b:	89 1d e8 26 11 80    	mov    %ebx,0x801126e8
  for (i = 0; i < log.lh.n; i++) {
80102b41:	7e 17                	jle    80102b5a <initlog+0x7a>
80102b43:	90                   	nop
80102b44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    log.lh.block[i] = lh->block[i];
80102b48:	8b 4c 96 04          	mov    0x4(%esi,%edx,4),%ecx
80102b4c:	89 0c 95 ec 26 11 80 	mov    %ecx,-0x7feed914(,%edx,4)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102b53:	83 c2 01             	add    $0x1,%edx
80102b56:	39 da                	cmp    %ebx,%edx
80102b58:	75 ee                	jne    80102b48 <initlog+0x68>
    log.lh.block[i] = lh->block[i];
  }
  brelse(buf);
80102b5a:	89 04 24             	mov    %eax,(%esp)
80102b5d:	e8 7e d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102b62:	e8 69 fe ff ff       	call   801029d0 <install_trans>
  log.lh.n = 0;
80102b67:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102b6e:	00 00 00 
  write_head(); // clear the log
80102b71:	e8 fa fe ff ff       	call   80102a70 <write_head>
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
  recover_from_log();
}
80102b76:	83 c4 30             	add    $0x30,%esp
80102b79:	5b                   	pop    %ebx
80102b7a:	5e                   	pop    %esi
80102b7b:	5d                   	pop    %ebp
80102b7c:	c3                   	ret    
80102b7d:	8d 76 00             	lea    0x0(%esi),%esi

80102b80 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102b80:	55                   	push   %ebp
80102b81:	89 e5                	mov    %esp,%ebp
80102b83:	83 ec 18             	sub    $0x18,%esp
  acquire(&log.lock);
80102b86:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102b8d:	e8 4e 16 00 00       	call   801041e0 <acquire>
80102b92:	eb 18                	jmp    80102bac <begin_op+0x2c>
80102b94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102b98:	c7 44 24 04 a0 26 11 	movl   $0x801126a0,0x4(%esp)
80102b9f:	80 
80102ba0:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102ba7:	e8 34 11 00 00       	call   80103ce0 <sleep>
void
begin_op(void)
{
  acquire(&log.lock);
  while(1){
    if(log.committing){
80102bac:	a1 e0 26 11 80       	mov    0x801126e0,%eax
80102bb1:	85 c0                	test   %eax,%eax
80102bb3:	75 e3                	jne    80102b98 <begin_op+0x18>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102bb5:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102bba:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102bc0:	83 c0 01             	add    $0x1,%eax
80102bc3:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bc6:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bc9:	83 fa 1e             	cmp    $0x1e,%edx
80102bcc:	7f ca                	jg     80102b98 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102bce:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
80102bd5:	a3 dc 26 11 80       	mov    %eax,0x801126dc
      release(&log.lock);
80102bda:	e8 31 17 00 00       	call   80104310 <release>
      break;
    }
  }
}
80102bdf:	c9                   	leave  
80102be0:	c3                   	ret    
80102be1:	eb 0d                	jmp    80102bf0 <end_op>
80102be3:	90                   	nop
80102be4:	90                   	nop
80102be5:	90                   	nop
80102be6:	90                   	nop
80102be7:	90                   	nop
80102be8:	90                   	nop
80102be9:	90                   	nop
80102bea:	90                   	nop
80102beb:	90                   	nop
80102bec:	90                   	nop
80102bed:	90                   	nop
80102bee:	90                   	nop
80102bef:	90                   	nop

80102bf0 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102bf0:	55                   	push   %ebp
80102bf1:	89 e5                	mov    %esp,%ebp
80102bf3:	57                   	push   %edi
80102bf4:	56                   	push   %esi
80102bf5:	53                   	push   %ebx
80102bf6:	83 ec 1c             	sub    $0x1c,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102bf9:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102c00:	e8 db 15 00 00       	call   801041e0 <acquire>
  log.outstanding -= 1;
80102c05:	a1 dc 26 11 80       	mov    0x801126dc,%eax
  if(log.committing)
80102c0a:	8b 15 e0 26 11 80    	mov    0x801126e0,%edx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c10:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102c13:	85 d2                	test   %edx,%edx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c15:	a3 dc 26 11 80       	mov    %eax,0x801126dc
  if(log.committing)
80102c1a:	0f 85 f3 00 00 00    	jne    80102d13 <end_op+0x123>
    panic("log.committing");
  if(log.outstanding == 0){
80102c20:	85 c0                	test   %eax,%eax
80102c22:	0f 85 cb 00 00 00    	jne    80102cf3 <end_op+0x103>
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102c28:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c2f:	31 db                	xor    %ebx,%ebx
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
80102c31:	c7 05 e0 26 11 80 01 	movl   $0x1,0x801126e0
80102c38:	00 00 00 
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102c3b:	e8 d0 16 00 00       	call   80104310 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c40:	a1 e8 26 11 80       	mov    0x801126e8,%eax
80102c45:	85 c0                	test   %eax,%eax
80102c47:	0f 8e 90 00 00 00    	jle    80102cdd <end_op+0xed>
80102c4d:	8d 76 00             	lea    0x0(%esi),%esi
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102c50:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102c55:	01 d8                	add    %ebx,%eax
80102c57:	83 c0 01             	add    $0x1,%eax
80102c5a:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c5e:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102c63:	89 04 24             	mov    %eax,(%esp)
80102c66:	e8 65 d4 ff ff       	call   801000d0 <bread>
80102c6b:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c6d:	8b 04 9d ec 26 11 80 	mov    -0x7feed914(,%ebx,4),%eax
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c74:	83 c3 01             	add    $0x1,%ebx
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c77:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c7b:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102c80:	89 04 24             	mov    %eax,(%esp)
80102c83:	e8 48 d4 ff ff       	call   801000d0 <bread>
    memmove(to->data, from->data, BSIZE);
80102c88:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80102c8f:	00 
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c90:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102c92:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c95:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c99:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c9c:	89 04 24             	mov    %eax,(%esp)
80102c9f:	e8 5c 17 00 00       	call   80104400 <memmove>
    bwrite(to);  // write the log
80102ca4:	89 34 24             	mov    %esi,(%esp)
80102ca7:	e8 f4 d4 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102cac:	89 3c 24             	mov    %edi,(%esp)
80102caf:	e8 2c d5 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102cb4:	89 34 24             	mov    %esi,(%esp)
80102cb7:	e8 24 d5 ff ff       	call   801001e0 <brelse>
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102cbc:	3b 1d e8 26 11 80    	cmp    0x801126e8,%ebx
80102cc2:	7c 8c                	jl     80102c50 <end_op+0x60>
static void
commit()
{
  if (log.lh.n > 0) {
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102cc4:	e8 a7 fd ff ff       	call   80102a70 <write_head>
    install_trans(); // Now install writes to home locations
80102cc9:	e8 02 fd ff ff       	call   801029d0 <install_trans>
    log.lh.n = 0;
80102cce:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102cd5:	00 00 00 
    write_head();    // Erase the transaction from the log
80102cd8:	e8 93 fd ff ff       	call   80102a70 <write_head>

  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
80102cdd:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102ce4:	e8 f7 14 00 00       	call   801041e0 <acquire>
    log.committing = 0;
80102ce9:	c7 05 e0 26 11 80 00 	movl   $0x0,0x801126e0
80102cf0:	00 00 00 
    wakeup(&log);
80102cf3:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102cfa:	e8 81 11 00 00       	call   80103e80 <wakeup>
    release(&log.lock);
80102cff:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d06:	e8 05 16 00 00       	call   80104310 <release>
  }
}
80102d0b:	83 c4 1c             	add    $0x1c,%esp
80102d0e:	5b                   	pop    %ebx
80102d0f:	5e                   	pop    %esi
80102d10:	5f                   	pop    %edi
80102d11:	5d                   	pop    %ebp
80102d12:	c3                   	ret    
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
80102d13:	c7 04 24 40 72 10 80 	movl   $0x80107240,(%esp)
80102d1a:	e8 41 d6 ff ff       	call   80100360 <panic>
80102d1f:	90                   	nop

80102d20 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d20:	55                   	push   %ebp
80102d21:	89 e5                	mov    %esp,%ebp
80102d23:	53                   	push   %ebx
80102d24:	83 ec 14             	sub    $0x14,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d27:	a1 e8 26 11 80       	mov    0x801126e8,%eax
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d2c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d2f:	83 f8 1d             	cmp    $0x1d,%eax
80102d32:	0f 8f 98 00 00 00    	jg     80102dd0 <log_write+0xb0>
80102d38:	8b 0d d8 26 11 80    	mov    0x801126d8,%ecx
80102d3e:	8d 51 ff             	lea    -0x1(%ecx),%edx
80102d41:	39 d0                	cmp    %edx,%eax
80102d43:	0f 8d 87 00 00 00    	jge    80102dd0 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102d49:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102d4e:	85 c0                	test   %eax,%eax
80102d50:	0f 8e 86 00 00 00    	jle    80102ddc <log_write+0xbc>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102d56:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d5d:	e8 7e 14 00 00       	call   801041e0 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102d62:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102d68:	83 fa 00             	cmp    $0x0,%edx
80102d6b:	7e 54                	jle    80102dc1 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d6d:	8b 4b 08             	mov    0x8(%ebx),%ecx
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102d70:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d72:	39 0d ec 26 11 80    	cmp    %ecx,0x801126ec
80102d78:	75 0f                	jne    80102d89 <log_write+0x69>
80102d7a:	eb 3c                	jmp    80102db8 <log_write+0x98>
80102d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102d80:	39 0c 85 ec 26 11 80 	cmp    %ecx,-0x7feed914(,%eax,4)
80102d87:	74 2f                	je     80102db8 <log_write+0x98>
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102d89:	83 c0 01             	add    $0x1,%eax
80102d8c:	39 d0                	cmp    %edx,%eax
80102d8e:	75 f0                	jne    80102d80 <log_write+0x60>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102d90:	89 0c 95 ec 26 11 80 	mov    %ecx,-0x7feed914(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102d97:	83 c2 01             	add    $0x1,%edx
80102d9a:	89 15 e8 26 11 80    	mov    %edx,0x801126e8
  b->flags |= B_DIRTY; // prevent eviction
80102da0:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102da3:	c7 45 08 a0 26 11 80 	movl   $0x801126a0,0x8(%ebp)
}
80102daa:	83 c4 14             	add    $0x14,%esp
80102dad:	5b                   	pop    %ebx
80102dae:	5d                   	pop    %ebp
  }
  log.lh.block[i] = b->blockno;
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
  release(&log.lock);
80102daf:	e9 5c 15 00 00       	jmp    80104310 <release>
80102db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102db8:	89 0c 85 ec 26 11 80 	mov    %ecx,-0x7feed914(,%eax,4)
80102dbf:	eb df                	jmp    80102da0 <log_write+0x80>
80102dc1:	8b 43 08             	mov    0x8(%ebx),%eax
80102dc4:	a3 ec 26 11 80       	mov    %eax,0x801126ec
  if (i == log.lh.n)
80102dc9:	75 d5                	jne    80102da0 <log_write+0x80>
80102dcb:	eb ca                	jmp    80102d97 <log_write+0x77>
80102dcd:	8d 76 00             	lea    0x0(%esi),%esi
log_write(struct buf *b)
{
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
80102dd0:	c7 04 24 4f 72 10 80 	movl   $0x8010724f,(%esp)
80102dd7:	e8 84 d5 ff ff       	call   80100360 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102ddc:	c7 04 24 65 72 10 80 	movl   $0x80107265,(%esp)
80102de3:	e8 78 d5 ff ff       	call   80100360 <panic>
80102de8:	66 90                	xchg   %ax,%ax
80102dea:	66 90                	xchg   %ax,%ax
80102dec:	66 90                	xchg   %ax,%ax
80102dee:	66 90                	xchg   %ax,%ax

80102df0 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102df0:	55                   	push   %ebp
80102df1:	89 e5                	mov    %esp,%ebp
80102df3:	83 ec 18             	sub    $0x18,%esp
  cprintf("cpu%d: starting\n", cpunum());
80102df6:	e8 55 f9 ff ff       	call   80102750 <cpunum>
80102dfb:	c7 04 24 80 72 10 80 	movl   $0x80107280,(%esp)
80102e02:	89 44 24 04          	mov    %eax,0x4(%esp)
80102e06:	e8 45 d8 ff ff       	call   80100650 <cprintf>
  idtinit();       // load idt register
80102e0b:	e8 a0 27 00 00       	call   801055b0 <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
80102e10:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e17:	b8 01 00 00 00       	mov    $0x1,%eax
80102e1c:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
  scheduler();     // start running processes
80102e23:	e8 f8 0b 00 00       	call   80103a20 <scheduler>
80102e28:	90                   	nop
80102e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102e30 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102e30:	55                   	push   %ebp
80102e31:	89 e5                	mov    %esp,%ebp
80102e33:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e36:	e8 85 39 00 00       	call   801067c0 <switchkvm>
  seginit();
80102e3b:	e8 a0 37 00 00       	call   801065e0 <seginit>
  lapicinit();
80102e40:	e8 1b f8 ff ff       	call   80102660 <lapicinit>
  mpmain();
80102e45:	e8 a6 ff ff ff       	call   80102df0 <mpmain>
80102e4a:	66 90                	xchg   %ax,%ax
80102e4c:	66 90                	xchg   %ax,%ax
80102e4e:	66 90                	xchg   %ax,%ax

80102e50 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102e50:	55                   	push   %ebp
80102e51:	89 e5                	mov    %esp,%ebp
80102e53:	53                   	push   %ebx
80102e54:	83 e4 f0             	and    $0xfffffff0,%esp
80102e57:	83 ec 10             	sub    $0x10,%esp
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102e5a:	c7 44 24 04 00 00 40 	movl   $0x80400000,0x4(%esp)
80102e61:	80 
80102e62:	c7 04 24 28 56 11 80 	movl   $0x80115628,(%esp)
80102e69:	e8 62 f5 ff ff       	call   801023d0 <kinit1>
  kvmalloc();      // kernel page table
80102e6e:	e8 2d 39 00 00       	call   801067a0 <kvmalloc>
  mpinit();        // detect other processors
80102e73:	e8 a8 01 00 00       	call   80103020 <mpinit>
  lapicinit();     // interrupt controller
80102e78:	e8 e3 f7 ff ff       	call   80102660 <lapicinit>
80102e7d:	8d 76 00             	lea    0x0(%esi),%esi
  seginit();       // segment descriptors
80102e80:	e8 5b 37 00 00       	call   801065e0 <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpunum());
80102e85:	e8 c6 f8 ff ff       	call   80102750 <cpunum>
80102e8a:	c7 04 24 91 72 10 80 	movl   $0x80107291,(%esp)
80102e91:	89 44 24 04          	mov    %eax,0x4(%esp)
80102e95:	e8 b6 d7 ff ff       	call   80100650 <cprintf>
  picinit();       // another interrupt controller
80102e9a:	e8 81 03 00 00       	call   80103220 <picinit>
  ioapicinit();    // another interrupt controller
80102e9f:	e8 4c f3 ff ff       	call   801021f0 <ioapicinit>
  consoleinit();   // console hardware
80102ea4:	e8 a7 da ff ff       	call   80100950 <consoleinit>
  uartinit();      // serial port
80102ea9:	e8 42 2a 00 00       	call   801058f0 <uartinit>
80102eae:	66 90                	xchg   %ax,%ax
  pinit();         // process table
80102eb0:	e8 9b 08 00 00       	call   80103750 <pinit>
  tvinit();        // trap vectors
80102eb5:	e8 56 26 00 00       	call   80105510 <tvinit>
  binit();         // buffer cache
80102eba:	e8 81 d1 ff ff       	call   80100040 <binit>
80102ebf:	90                   	nop
  fileinit();      // file table
80102ec0:	e8 7b de ff ff       	call   80100d40 <fileinit>
  ideinit();       // disk
80102ec5:	e8 16 f1 ff ff       	call   80101fe0 <ideinit>
  if(!ismp)
80102eca:	a1 84 27 11 80       	mov    0x80112784,%eax
80102ecf:	85 c0                	test   %eax,%eax
80102ed1:	0f 84 ca 00 00 00    	je     80102fa1 <main+0x151>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102ed7:	c7 44 24 08 8a 00 00 	movl   $0x8a,0x8(%esp)
80102ede:	00 

  for(c = cpus; c < cpus+ncpu; c++){
80102edf:	bb a0 27 11 80       	mov    $0x801127a0,%ebx

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102ee4:	c7 44 24 04 8c a4 10 	movl   $0x8010a48c,0x4(%esp)
80102eeb:	80 
80102eec:	c7 04 24 00 70 00 80 	movl   $0x80007000,(%esp)
80102ef3:	e8 08 15 00 00       	call   80104400 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102ef8:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80102eff:	00 00 00 
80102f02:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f07:	39 d8                	cmp    %ebx,%eax
80102f09:	76 78                	jbe    80102f83 <main+0x133>
80102f0b:	90                   	nop
80102f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(c == cpus+cpunum())  // We've started already.
80102f10:	e8 3b f8 ff ff       	call   80102750 <cpunum>
80102f15:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80102f1b:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f20:	39 c3                	cmp    %eax,%ebx
80102f22:	74 46                	je     80102f6a <main+0x11a>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102f24:	e8 67 f5 ff ff       	call   80102490 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void**)(code-8) = mpenter;
80102f29:	c7 05 f8 6f 00 80 30 	movl   $0x80102e30,0x80006ff8
80102f30:	2e 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f33:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f3a:	90 10 00 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f3d:	05 00 10 00 00       	add    $0x1000,%eax
80102f42:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102f47:	0f b6 03             	movzbl (%ebx),%eax
80102f4a:	c7 44 24 04 00 70 00 	movl   $0x7000,0x4(%esp)
80102f51:	00 
80102f52:	89 04 24             	mov    %eax,(%esp)
80102f55:	e8 c6 f8 ff ff       	call   80102820 <lapicstartap>
80102f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f60:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80102f66:	85 c0                	test   %eax,%eax
80102f68:	74 f6                	je     80102f60 <main+0x110>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102f6a:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80102f71:	00 00 00 
80102f74:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
80102f7a:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f7f:	39 c3                	cmp    %eax,%ebx
80102f81:	72 8d                	jb     80102f10 <main+0xc0>
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f83:	c7 44 24 04 00 00 00 	movl   $0x8e000000,0x4(%esp)
80102f8a:	8e 
80102f8b:	c7 04 24 00 00 40 80 	movl   $0x80400000,(%esp)
80102f92:	e8 a9 f4 ff ff       	call   80102440 <kinit2>
  userinit();      // first user process
80102f97:	e8 d4 07 00 00       	call   80103770 <userinit>
  mpmain();        // finish this processor's setup
80102f9c:	e8 4f fe ff ff       	call   80102df0 <mpmain>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
80102fa1:	e8 0a 25 00 00       	call   801054b0 <timerinit>
80102fa6:	e9 2c ff ff ff       	jmp    80102ed7 <main+0x87>
80102fab:	66 90                	xchg   %ax,%ax
80102fad:	66 90                	xchg   %ax,%ax
80102faf:	90                   	nop

80102fb0 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fb0:	55                   	push   %ebp
80102fb1:	89 e5                	mov    %esp,%ebp
80102fb3:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102fb4:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fba:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
80102fbb:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fbe:	83 ec 10             	sub    $0x10,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102fc1:	39 de                	cmp    %ebx,%esi
80102fc3:	73 3c                	jae    80103001 <mpsearch1+0x51>
80102fc5:	8d 76 00             	lea    0x0(%esi),%esi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fc8:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
80102fcf:	00 
80102fd0:	c7 44 24 04 a8 72 10 	movl   $0x801072a8,0x4(%esp)
80102fd7:	80 
80102fd8:	89 34 24             	mov    %esi,(%esp)
80102fdb:	e8 d0 13 00 00       	call   801043b0 <memcmp>
80102fe0:	85 c0                	test   %eax,%eax
80102fe2:	75 16                	jne    80102ffa <mpsearch1+0x4a>
80102fe4:	31 c9                	xor    %ecx,%ecx
80102fe6:	31 d2                	xor    %edx,%edx
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80102fe8:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80102fec:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
80102fef:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80102ff1:	83 fa 10             	cmp    $0x10,%edx
80102ff4:	75 f2                	jne    80102fe8 <mpsearch1+0x38>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102ff6:	84 c9                	test   %cl,%cl
80102ff8:	74 10                	je     8010300a <mpsearch1+0x5a>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102ffa:	83 c6 10             	add    $0x10,%esi
80102ffd:	39 f3                	cmp    %esi,%ebx
80102fff:	77 c7                	ja     80102fc8 <mpsearch1+0x18>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
80103001:	83 c4 10             	add    $0x10,%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80103004:	31 c0                	xor    %eax,%eax
}
80103006:	5b                   	pop    %ebx
80103007:	5e                   	pop    %esi
80103008:	5d                   	pop    %ebp
80103009:	c3                   	ret    
8010300a:	83 c4 10             	add    $0x10,%esp
8010300d:	89 f0                	mov    %esi,%eax
8010300f:	5b                   	pop    %ebx
80103010:	5e                   	pop    %esi
80103011:	5d                   	pop    %ebp
80103012:	c3                   	ret    
80103013:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103020 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103020:	55                   	push   %ebp
80103021:	89 e5                	mov    %esp,%ebp
80103023:	57                   	push   %edi
80103024:	56                   	push   %esi
80103025:	53                   	push   %ebx
80103026:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103029:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103030:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103037:	c1 e0 08             	shl    $0x8,%eax
8010303a:	09 d0                	or     %edx,%eax
8010303c:	c1 e0 04             	shl    $0x4,%eax
8010303f:	85 c0                	test   %eax,%eax
80103041:	75 1b                	jne    8010305e <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103043:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010304a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103051:	c1 e0 08             	shl    $0x8,%eax
80103054:	09 d0                	or     %edx,%eax
80103056:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80103059:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
8010305e:	ba 00 04 00 00       	mov    $0x400,%edx
80103063:	e8 48 ff ff ff       	call   80102fb0 <mpsearch1>
80103068:	85 c0                	test   %eax,%eax
8010306a:	89 c7                	mov    %eax,%edi
8010306c:	0f 84 4e 01 00 00    	je     801031c0 <mpinit+0x1a0>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103072:	8b 77 04             	mov    0x4(%edi),%esi
80103075:	85 f6                	test   %esi,%esi
80103077:	0f 84 ce 00 00 00    	je     8010314b <mpinit+0x12b>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010307d:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
80103083:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
8010308a:	00 
8010308b:	c7 44 24 04 ad 72 10 	movl   $0x801072ad,0x4(%esp)
80103092:	80 
80103093:	89 04 24             	mov    %eax,(%esp)
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103096:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
80103099:	e8 12 13 00 00       	call   801043b0 <memcmp>
8010309e:	85 c0                	test   %eax,%eax
801030a0:	0f 85 a5 00 00 00    	jne    8010314b <mpinit+0x12b>
    return 0;
  if(conf->version != 1 && conf->version != 4)
801030a6:	0f b6 86 06 00 00 80 	movzbl -0x7ffffffa(%esi),%eax
801030ad:	3c 04                	cmp    $0x4,%al
801030af:	0f 85 29 01 00 00    	jne    801031de <mpinit+0x1be>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801030b5:	0f b7 86 04 00 00 80 	movzwl -0x7ffffffc(%esi),%eax
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030bc:	85 c0                	test   %eax,%eax
801030be:	74 1d                	je     801030dd <mpinit+0xbd>
static uchar
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
801030c0:	31 c9                	xor    %ecx,%ecx
  for(i=0; i<len; i++)
801030c2:	31 d2                	xor    %edx,%edx
801030c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
801030c8:	0f b6 9c 16 00 00 00 	movzbl -0x80000000(%esi,%edx,1),%ebx
801030cf:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030d0:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
801030d3:	01 d9                	add    %ebx,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030d5:	39 d0                	cmp    %edx,%eax
801030d7:	7f ef                	jg     801030c8 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801030d9:	84 c9                	test   %cl,%cl
801030db:	75 6e                	jne    8010314b <mpinit+0x12b>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801030dd:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801030e0:	85 db                	test   %ebx,%ebx
801030e2:	74 67                	je     8010314b <mpinit+0x12b>
    return;
  ismp = 1;
801030e4:	c7 05 84 27 11 80 01 	movl   $0x1,0x80112784
801030eb:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
801030ee:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
801030f4:	a3 9c 26 11 80       	mov    %eax,0x8011269c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030f9:	0f b7 8e 04 00 00 80 	movzwl -0x7ffffffc(%esi),%ecx
80103100:	8d 86 2c 00 00 80    	lea    -0x7fffffd4(%esi),%eax
80103106:	01 d9                	add    %ebx,%ecx
80103108:	39 c8                	cmp    %ecx,%eax
8010310a:	0f 83 90 00 00 00    	jae    801031a0 <mpinit+0x180>
    switch(*p){
80103110:	80 38 04             	cmpb   $0x4,(%eax)
80103113:	77 7b                	ja     80103190 <mpinit+0x170>
80103115:	0f b6 10             	movzbl (%eax),%edx
80103118:	ff 24 95 b4 72 10 80 	jmp    *-0x7fef8d4c(,%edx,4)
8010311f:	90                   	nop
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103120:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103123:	39 c1                	cmp    %eax,%ecx
80103125:	77 e9                	ja     80103110 <mpinit+0xf0>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp){
80103127:	a1 84 27 11 80       	mov    0x80112784,%eax
8010312c:	85 c0                	test   %eax,%eax
8010312e:	75 70                	jne    801031a0 <mpinit+0x180>
    // Didn't like what we found; fall back to no MP.
    ncpu = 1;
80103130:	c7 05 80 2d 11 80 01 	movl   $0x1,0x80112d80
80103137:	00 00 00 
    lapic = 0;
8010313a:	c7 05 9c 26 11 80 00 	movl   $0x0,0x8011269c
80103141:	00 00 00 
    ioapicid = 0;
80103144:	c6 05 80 27 11 80 00 	movb   $0x0,0x80112780
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
8010314b:	83 c4 1c             	add    $0x1c,%esp
8010314e:	5b                   	pop    %ebx
8010314f:	5e                   	pop    %esi
80103150:	5f                   	pop    %edi
80103151:	5d                   	pop    %ebp
80103152:	c3                   	ret    
80103153:	90                   	nop
80103154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103158:	8b 15 80 2d 11 80    	mov    0x80112d80,%edx
8010315e:	83 fa 07             	cmp    $0x7,%edx
80103161:	7f 17                	jg     8010317a <mpinit+0x15a>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103163:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
80103167:	69 d2 bc 00 00 00    	imul   $0xbc,%edx,%edx
        ncpu++;
8010316d:	83 05 80 2d 11 80 01 	addl   $0x1,0x80112d80
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103174:	88 9a a0 27 11 80    	mov    %bl,-0x7feed860(%edx)
        ncpu++;
      }
      p += sizeof(struct mpproc);
8010317a:	83 c0 14             	add    $0x14,%eax
      continue;
8010317d:	eb a4                	jmp    80103123 <mpinit+0x103>
8010317f:	90                   	nop
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103180:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
80103184:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103187:	88 15 80 27 11 80    	mov    %dl,0x80112780
      p += sizeof(struct mpioapic);
      continue;
8010318d:	eb 94                	jmp    80103123 <mpinit+0x103>
8010318f:	90                   	nop
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
80103190:	c7 05 84 27 11 80 00 	movl   $0x0,0x80112784
80103197:	00 00 00 
      break;
8010319a:	eb 87                	jmp    80103123 <mpinit+0x103>
8010319c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    lapic = 0;
    ioapicid = 0;
    return;
  }

  if(mp->imcrp){
801031a0:	80 7f 0c 00          	cmpb   $0x0,0xc(%edi)
801031a4:	74 a5                	je     8010314b <mpinit+0x12b>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801031a6:	ba 22 00 00 00       	mov    $0x22,%edx
801031ab:	b8 70 00 00 00       	mov    $0x70,%eax
801031b0:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801031b1:	b2 23                	mov    $0x23,%dl
801031b3:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
801031b4:	83 c8 01             	or     $0x1,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801031b7:	ee                   	out    %al,(%dx)
  }
}
801031b8:	83 c4 1c             	add    $0x1c,%esp
801031bb:	5b                   	pop    %ebx
801031bc:	5e                   	pop    %esi
801031bd:	5f                   	pop    %edi
801031be:	5d                   	pop    %ebp
801031bf:	c3                   	ret    
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801031c0:	ba 00 00 01 00       	mov    $0x10000,%edx
801031c5:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801031ca:	e8 e1 fd ff ff       	call   80102fb0 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031cf:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801031d1:	89 c7                	mov    %eax,%edi
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031d3:	0f 85 99 fe ff ff    	jne    80103072 <mpinit+0x52>
801031d9:	e9 6d ff ff ff       	jmp    8010314b <mpinit+0x12b>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
801031de:	3c 01                	cmp    $0x1,%al
801031e0:	0f 84 cf fe ff ff    	je     801030b5 <mpinit+0x95>
801031e6:	e9 60 ff ff ff       	jmp    8010314b <mpinit+0x12b>
801031eb:	66 90                	xchg   %ax,%ax
801031ed:	66 90                	xchg   %ax,%ax
801031ef:	90                   	nop

801031f0 <picenable>:
  outb(IO_PIC2+1, mask >> 8);
}

void
picenable(int irq)
{
801031f0:	55                   	push   %ebp
  picsetmask(irqmask & ~(1<<irq));
801031f1:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  outb(IO_PIC2+1, mask >> 8);
}

void
picenable(int irq)
{
801031f6:	89 e5                	mov    %esp,%ebp
801031f8:	ba 21 00 00 00       	mov    $0x21,%edx
  picsetmask(irqmask & ~(1<<irq));
801031fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103200:	d3 c0                	rol    %cl,%eax
80103202:	66 23 05 00 a0 10 80 	and    0x8010a000,%ax
static ushort irqmask = 0xFFFF & ~(1<<IRQ_SLAVE);

static void
picsetmask(ushort mask)
{
  irqmask = mask;
80103209:	66 a3 00 a0 10 80    	mov    %ax,0x8010a000
8010320f:	ee                   	out    %al,(%dx)
  outb(IO_PIC1+1, mask);
  outb(IO_PIC2+1, mask >> 8);
80103210:	66 c1 e8 08          	shr    $0x8,%ax
80103214:	b2 a1                	mov    $0xa1,%dl
80103216:	ee                   	out    %al,(%dx)

void
picenable(int irq)
{
  picsetmask(irqmask & ~(1<<irq));
}
80103217:	5d                   	pop    %ebp
80103218:	c3                   	ret    
80103219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103220 <picinit>:

// Initialize the 8259A interrupt controllers.
void
picinit(void)
{
80103220:	55                   	push   %ebp
80103221:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103226:	89 e5                	mov    %esp,%ebp
80103228:	57                   	push   %edi
80103229:	56                   	push   %esi
8010322a:	53                   	push   %ebx
8010322b:	bb 21 00 00 00       	mov    $0x21,%ebx
80103230:	89 da                	mov    %ebx,%edx
80103232:	ee                   	out    %al,(%dx)
80103233:	b9 a1 00 00 00       	mov    $0xa1,%ecx
80103238:	89 ca                	mov    %ecx,%edx
8010323a:	ee                   	out    %al,(%dx)
8010323b:	bf 11 00 00 00       	mov    $0x11,%edi
80103240:	be 20 00 00 00       	mov    $0x20,%esi
80103245:	89 f8                	mov    %edi,%eax
80103247:	89 f2                	mov    %esi,%edx
80103249:	ee                   	out    %al,(%dx)
8010324a:	b8 20 00 00 00       	mov    $0x20,%eax
8010324f:	89 da                	mov    %ebx,%edx
80103251:	ee                   	out    %al,(%dx)
80103252:	b8 04 00 00 00       	mov    $0x4,%eax
80103257:	ee                   	out    %al,(%dx)
80103258:	b8 03 00 00 00       	mov    $0x3,%eax
8010325d:	ee                   	out    %al,(%dx)
8010325e:	b3 a0                	mov    $0xa0,%bl
80103260:	89 f8                	mov    %edi,%eax
80103262:	89 da                	mov    %ebx,%edx
80103264:	ee                   	out    %al,(%dx)
80103265:	b8 28 00 00 00       	mov    $0x28,%eax
8010326a:	89 ca                	mov    %ecx,%edx
8010326c:	ee                   	out    %al,(%dx)
8010326d:	b8 02 00 00 00       	mov    $0x2,%eax
80103272:	ee                   	out    %al,(%dx)
80103273:	b8 03 00 00 00       	mov    $0x3,%eax
80103278:	ee                   	out    %al,(%dx)
80103279:	bf 68 00 00 00       	mov    $0x68,%edi
8010327e:	89 f2                	mov    %esi,%edx
80103280:	89 f8                	mov    %edi,%eax
80103282:	ee                   	out    %al,(%dx)
80103283:	b9 0a 00 00 00       	mov    $0xa,%ecx
80103288:	89 c8                	mov    %ecx,%eax
8010328a:	ee                   	out    %al,(%dx)
8010328b:	89 f8                	mov    %edi,%eax
8010328d:	89 da                	mov    %ebx,%edx
8010328f:	ee                   	out    %al,(%dx)
80103290:	89 c8                	mov    %ecx,%eax
80103292:	ee                   	out    %al,(%dx)
  outb(IO_PIC1, 0x0a);             // read IRR by default

  outb(IO_PIC2, 0x68);             // OCW3
  outb(IO_PIC2, 0x0a);             // OCW3

  if(irqmask != 0xFFFF)
80103293:	0f b7 05 00 a0 10 80 	movzwl 0x8010a000,%eax
8010329a:	66 83 f8 ff          	cmp    $0xffff,%ax
8010329e:	74 0a                	je     801032aa <picinit+0x8a>
801032a0:	b2 21                	mov    $0x21,%dl
801032a2:	ee                   	out    %al,(%dx)
static void
picsetmask(ushort mask)
{
  irqmask = mask;
  outb(IO_PIC1+1, mask);
  outb(IO_PIC2+1, mask >> 8);
801032a3:	66 c1 e8 08          	shr    $0x8,%ax
801032a7:	b2 a1                	mov    $0xa1,%dl
801032a9:	ee                   	out    %al,(%dx)
  outb(IO_PIC2, 0x68);             // OCW3
  outb(IO_PIC2, 0x0a);             // OCW3

  if(irqmask != 0xFFFF)
    picsetmask(irqmask);
}
801032aa:	5b                   	pop    %ebx
801032ab:	5e                   	pop    %esi
801032ac:	5f                   	pop    %edi
801032ad:	5d                   	pop    %ebp
801032ae:	c3                   	ret    
801032af:	90                   	nop

801032b0 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
801032b0:	55                   	push   %ebp
801032b1:	89 e5                	mov    %esp,%ebp
801032b3:	57                   	push   %edi
801032b4:	56                   	push   %esi
801032b5:	53                   	push   %ebx
801032b6:	83 ec 1c             	sub    $0x1c,%esp
801032b9:	8b 75 08             	mov    0x8(%ebp),%esi
801032bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
801032bf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801032c5:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
801032cb:	e8 90 da ff ff       	call   80100d60 <filealloc>
801032d0:	85 c0                	test   %eax,%eax
801032d2:	89 06                	mov    %eax,(%esi)
801032d4:	0f 84 a4 00 00 00    	je     8010337e <pipealloc+0xce>
801032da:	e8 81 da ff ff       	call   80100d60 <filealloc>
801032df:	85 c0                	test   %eax,%eax
801032e1:	89 03                	mov    %eax,(%ebx)
801032e3:	0f 84 87 00 00 00    	je     80103370 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
801032e9:	e8 a2 f1 ff ff       	call   80102490 <kalloc>
801032ee:	85 c0                	test   %eax,%eax
801032f0:	89 c7                	mov    %eax,%edi
801032f2:	74 7c                	je     80103370 <pipealloc+0xc0>
    goto bad;
  p->readopen = 1;
801032f4:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801032fb:	00 00 00 
  p->writeopen = 1;
801032fe:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80103305:	00 00 00 
  p->nwrite = 0;
80103308:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
8010330f:	00 00 00 
  p->nread = 0;
80103312:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103319:	00 00 00 
  initlock(&p->lock, "pipe");
8010331c:	89 04 24             	mov    %eax,(%esp)
8010331f:	c7 44 24 04 c8 72 10 	movl   $0x801072c8,0x4(%esp)
80103326:	80 
80103327:	e8 34 0e 00 00       	call   80104160 <initlock>
  (*f0)->type = FD_PIPE;
8010332c:	8b 06                	mov    (%esi),%eax
8010332e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103334:	8b 06                	mov    (%esi),%eax
80103336:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010333a:	8b 06                	mov    (%esi),%eax
8010333c:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103340:	8b 06                	mov    (%esi),%eax
80103342:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
80103345:	8b 03                	mov    (%ebx),%eax
80103347:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
8010334d:	8b 03                	mov    (%ebx),%eax
8010334f:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103353:	8b 03                	mov    (%ebx),%eax
80103355:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
80103359:	8b 03                	mov    (%ebx),%eax
  return 0;
8010335b:	31 db                	xor    %ebx,%ebx
  (*f0)->writable = 0;
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
8010335d:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103360:	83 c4 1c             	add    $0x1c,%esp
80103363:	89 d8                	mov    %ebx,%eax
80103365:	5b                   	pop    %ebx
80103366:	5e                   	pop    %esi
80103367:	5f                   	pop    %edi
80103368:	5d                   	pop    %ebp
80103369:	c3                   	ret    
8010336a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
80103370:	8b 06                	mov    (%esi),%eax
80103372:	85 c0                	test   %eax,%eax
80103374:	74 08                	je     8010337e <pipealloc+0xce>
    fileclose(*f0);
80103376:	89 04 24             	mov    %eax,(%esp)
80103379:	e8 a2 da ff ff       	call   80100e20 <fileclose>
  if(*f1)
8010337e:	8b 03                	mov    (%ebx),%eax
    fileclose(*f1);
  return -1;
80103380:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
80103385:	85 c0                	test   %eax,%eax
80103387:	74 d7                	je     80103360 <pipealloc+0xb0>
    fileclose(*f1);
80103389:	89 04 24             	mov    %eax,(%esp)
8010338c:	e8 8f da ff ff       	call   80100e20 <fileclose>
  return -1;
}
80103391:	83 c4 1c             	add    $0x1c,%esp
80103394:	89 d8                	mov    %ebx,%eax
80103396:	5b                   	pop    %ebx
80103397:	5e                   	pop    %esi
80103398:	5f                   	pop    %edi
80103399:	5d                   	pop    %ebp
8010339a:	c3                   	ret    
8010339b:	90                   	nop
8010339c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801033a0 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
801033a0:	55                   	push   %ebp
801033a1:	89 e5                	mov    %esp,%ebp
801033a3:	56                   	push   %esi
801033a4:	53                   	push   %ebx
801033a5:	83 ec 10             	sub    $0x10,%esp
801033a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
801033ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801033ae:	89 1c 24             	mov    %ebx,(%esp)
801033b1:	e8 2a 0e 00 00       	call   801041e0 <acquire>
  if(writable){
801033b6:	85 f6                	test   %esi,%esi
801033b8:	74 3e                	je     801033f8 <pipeclose+0x58>
    p->writeopen = 0;
    wakeup(&p->nread);
801033ba:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
801033c0:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801033c7:	00 00 00 
    wakeup(&p->nread);
801033ca:	89 04 24             	mov    %eax,(%esp)
801033cd:	e8 ae 0a 00 00       	call   80103e80 <wakeup>
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
801033d2:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801033d8:	85 d2                	test   %edx,%edx
801033da:	75 0a                	jne    801033e6 <pipeclose+0x46>
801033dc:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801033e2:	85 c0                	test   %eax,%eax
801033e4:	74 32                	je     80103418 <pipeclose+0x78>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801033e6:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801033e9:	83 c4 10             	add    $0x10,%esp
801033ec:	5b                   	pop    %ebx
801033ed:	5e                   	pop    %esi
801033ee:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801033ef:	e9 1c 0f 00 00       	jmp    80104310 <release>
801033f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
801033f8:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
801033fe:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103405:	00 00 00 
    wakeup(&p->nwrite);
80103408:	89 04 24             	mov    %eax,(%esp)
8010340b:	e8 70 0a 00 00       	call   80103e80 <wakeup>
80103410:	eb c0                	jmp    801033d2 <pipeclose+0x32>
80103412:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103418:	89 1c 24             	mov    %ebx,(%esp)
8010341b:	e8 f0 0e 00 00       	call   80104310 <release>
    kfree((char*)p);
80103420:	89 5d 08             	mov    %ebx,0x8(%ebp)
  } else
    release(&p->lock);
}
80103423:	83 c4 10             	add    $0x10,%esp
80103426:	5b                   	pop    %ebx
80103427:	5e                   	pop    %esi
80103428:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103429:	e9 b2 ee ff ff       	jmp    801022e0 <kfree>
8010342e:	66 90                	xchg   %ax,%ax

80103430 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103430:	55                   	push   %ebp
80103431:	89 e5                	mov    %esp,%ebp
80103433:	57                   	push   %edi
80103434:	56                   	push   %esi
80103435:	53                   	push   %ebx
80103436:	83 ec 1c             	sub    $0x1c,%esp
80103439:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i;

  acquire(&p->lock);
8010343c:	89 3c 24             	mov    %edi,(%esp)
8010343f:	e8 9c 0d 00 00       	call   801041e0 <acquire>
  for(i = 0; i < n; i++){
80103444:	8b 45 10             	mov    0x10(%ebp),%eax
80103447:	85 c0                	test   %eax,%eax
80103449:	0f 8e c2 00 00 00    	jle    80103511 <pipewrite+0xe1>
8010344f:	8b 45 0c             	mov    0xc(%ebp),%eax
80103452:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
80103458:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
8010345e:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
80103464:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103467:	03 45 10             	add    0x10(%ebp),%eax
8010346a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010346d:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
80103473:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
80103479:	39 d1                	cmp    %edx,%ecx
8010347b:	0f 85 c4 00 00 00    	jne    80103545 <pipewrite+0x115>
      if(p->readopen == 0 || proc->killed){
80103481:	8b 97 3c 02 00 00    	mov    0x23c(%edi),%edx
80103487:	85 d2                	test   %edx,%edx
80103489:	0f 84 a1 00 00 00    	je     80103530 <pipewrite+0x100>
8010348f:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103496:	8b 42 24             	mov    0x24(%edx),%eax
80103499:	85 c0                	test   %eax,%eax
8010349b:	74 22                	je     801034bf <pipewrite+0x8f>
8010349d:	e9 8e 00 00 00       	jmp    80103530 <pipewrite+0x100>
801034a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801034a8:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
801034ae:	85 c0                	test   %eax,%eax
801034b0:	74 7e                	je     80103530 <pipewrite+0x100>
801034b2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801034b8:	8b 48 24             	mov    0x24(%eax),%ecx
801034bb:	85 c9                	test   %ecx,%ecx
801034bd:	75 71                	jne    80103530 <pipewrite+0x100>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801034bf:	89 34 24             	mov    %esi,(%esp)
801034c2:	e8 b9 09 00 00       	call   80103e80 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801034c7:	89 7c 24 04          	mov    %edi,0x4(%esp)
801034cb:	89 1c 24             	mov    %ebx,(%esp)
801034ce:	e8 0d 08 00 00       	call   80103ce0 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801034d3:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
801034d9:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
801034df:	05 00 02 00 00       	add    $0x200,%eax
801034e4:	39 c2                	cmp    %eax,%edx
801034e6:	74 c0                	je     801034a8 <pipewrite+0x78>
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801034e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801034eb:	8d 4a 01             	lea    0x1(%edx),%ecx
801034ee:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801034f4:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
801034fa:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
801034fe:	0f b6 00             	movzbl (%eax),%eax
80103501:	88 44 17 34          	mov    %al,0x34(%edi,%edx,1)
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103505:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103508:	3b 45 e0             	cmp    -0x20(%ebp),%eax
8010350b:	0f 85 5c ff ff ff    	jne    8010346d <pipewrite+0x3d>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103511:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
80103517:	89 14 24             	mov    %edx,(%esp)
8010351a:	e8 61 09 00 00       	call   80103e80 <wakeup>
  release(&p->lock);
8010351f:	89 3c 24             	mov    %edi,(%esp)
80103522:	e8 e9 0d 00 00       	call   80104310 <release>
  return n;
80103527:	8b 45 10             	mov    0x10(%ebp),%eax
8010352a:	eb 11                	jmp    8010353d <pipewrite+0x10d>
8010352c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
        release(&p->lock);
80103530:	89 3c 24             	mov    %edi,(%esp)
80103533:	e8 d8 0d 00 00       	call   80104310 <release>
        return -1;
80103538:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
8010353d:	83 c4 1c             	add    $0x1c,%esp
80103540:	5b                   	pop    %ebx
80103541:	5e                   	pop    %esi
80103542:	5f                   	pop    %edi
80103543:	5d                   	pop    %ebp
80103544:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103545:	89 ca                	mov    %ecx,%edx
80103547:	eb 9f                	jmp    801034e8 <pipewrite+0xb8>
80103549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103550 <piperead>:
  return n;
}

int
piperead(struct pipe *p, char *addr, int n)
{
80103550:	55                   	push   %ebp
80103551:	89 e5                	mov    %esp,%ebp
80103553:	57                   	push   %edi
80103554:	56                   	push   %esi
80103555:	53                   	push   %ebx
80103556:	83 ec 1c             	sub    $0x1c,%esp
80103559:	8b 75 08             	mov    0x8(%ebp),%esi
8010355c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010355f:	89 34 24             	mov    %esi,(%esp)
80103562:	e8 79 0c 00 00       	call   801041e0 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103567:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
8010356d:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
80103573:	75 5b                	jne    801035d0 <piperead+0x80>
80103575:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
8010357b:	85 db                	test   %ebx,%ebx
8010357d:	74 51                	je     801035d0 <piperead+0x80>
8010357f:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
80103585:	eb 25                	jmp    801035ac <piperead+0x5c>
80103587:	90                   	nop
    if(proc->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80103588:	89 74 24 04          	mov    %esi,0x4(%esp)
8010358c:	89 1c 24             	mov    %ebx,(%esp)
8010358f:	e8 4c 07 00 00       	call   80103ce0 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103594:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
8010359a:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
801035a0:	75 2e                	jne    801035d0 <piperead+0x80>
801035a2:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
801035a8:	85 d2                	test   %edx,%edx
801035aa:	74 24                	je     801035d0 <piperead+0x80>
    if(proc->killed){
801035ac:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801035b2:	8b 48 24             	mov    0x24(%eax),%ecx
801035b5:	85 c9                	test   %ecx,%ecx
801035b7:	74 cf                	je     80103588 <piperead+0x38>
      release(&p->lock);
801035b9:	89 34 24             	mov    %esi,(%esp)
801035bc:	e8 4f 0d 00 00       	call   80104310 <release>
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801035c1:	83 c4 1c             	add    $0x1c,%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(proc->killed){
      release(&p->lock);
      return -1;
801035c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801035c9:	5b                   	pop    %ebx
801035ca:	5e                   	pop    %esi
801035cb:	5f                   	pop    %edi
801035cc:	5d                   	pop    %ebp
801035cd:	c3                   	ret    
801035ce:	66 90                	xchg   %ax,%ax
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801035d0:	8b 55 10             	mov    0x10(%ebp),%edx
    if(p->nread == p->nwrite)
801035d3:	31 db                	xor    %ebx,%ebx
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801035d5:	85 d2                	test   %edx,%edx
801035d7:	7f 2b                	jg     80103604 <piperead+0xb4>
801035d9:	eb 31                	jmp    8010360c <piperead+0xbc>
801035db:	90                   	nop
801035dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
801035e0:	8d 48 01             	lea    0x1(%eax),%ecx
801035e3:	25 ff 01 00 00       	and    $0x1ff,%eax
801035e8:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
801035ee:	0f b6 44 06 34       	movzbl 0x34(%esi,%eax,1),%eax
801035f3:	88 04 1f             	mov    %al,(%edi,%ebx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801035f6:	83 c3 01             	add    $0x1,%ebx
801035f9:	3b 5d 10             	cmp    0x10(%ebp),%ebx
801035fc:	74 0e                	je     8010360c <piperead+0xbc>
    if(p->nread == p->nwrite)
801035fe:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103604:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010360a:	75 d4                	jne    801035e0 <piperead+0x90>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
8010360c:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103612:	89 04 24             	mov    %eax,(%esp)
80103615:	e8 66 08 00 00       	call   80103e80 <wakeup>
  release(&p->lock);
8010361a:	89 34 24             	mov    %esi,(%esp)
8010361d:	e8 ee 0c 00 00       	call   80104310 <release>
  return i;
}
80103622:	83 c4 1c             	add    $0x1c,%esp
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
80103625:	89 d8                	mov    %ebx,%eax
}
80103627:	5b                   	pop    %ebx
80103628:	5e                   	pop    %esi
80103629:	5f                   	pop    %edi
8010362a:	5d                   	pop    %ebp
8010362b:	c3                   	ret    
8010362c:	66 90                	xchg   %ax,%ax
8010362e:	66 90                	xchg   %ax,%ax

80103630 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103630:	55                   	push   %ebp
80103631:	89 e5                	mov    %esp,%ebp
80103633:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103634:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103639:	83 ec 14             	sub    $0x14,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
8010363c:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103643:	e8 98 0b 00 00       	call   801041e0 <acquire>
80103648:	eb 11                	jmp    8010365b <allocproc+0x2b>
8010364a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103650:	83 eb 80             	sub    $0xffffff80,%ebx
80103653:	81 fb d4 4d 11 80    	cmp    $0x80114dd4,%ebx
80103659:	74 7d                	je     801036d8 <allocproc+0xa8>
    if(p->state == UNUSED)
8010365b:	8b 43 0c             	mov    0xc(%ebx),%eax
8010365e:	85 c0                	test   %eax,%eax
80103660:	75 ee                	jne    80103650 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103662:	a1 08 a0 10 80       	mov    0x8010a008,%eax

  release(&ptable.lock);
80103667:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
8010366e:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
80103675:	8d 50 01             	lea    0x1(%eax),%edx
80103678:	89 15 08 a0 10 80    	mov    %edx,0x8010a008
8010367e:	89 43 10             	mov    %eax,0x10(%ebx)

  release(&ptable.lock);
80103681:	e8 8a 0c 00 00       	call   80104310 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103686:	e8 05 ee ff ff       	call   80102490 <kalloc>
8010368b:	85 c0                	test   %eax,%eax
8010368d:	89 43 08             	mov    %eax,0x8(%ebx)
80103690:	74 5a                	je     801036ec <allocproc+0xbc>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103692:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
80103698:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
8010369d:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
801036a0:	c7 40 14 fd 54 10 80 	movl   $0x801054fd,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
801036a7:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
801036ae:	00 
801036af:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801036b6:	00 
801036b7:	89 04 24             	mov    %eax,(%esp)
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
801036ba:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
801036bd:	e8 9e 0c 00 00       	call   80104360 <memset>
  p->context->eip = (uint)forkret;
801036c2:	8b 43 1c             	mov    0x1c(%ebx),%eax
801036c5:	c7 40 10 00 37 10 80 	movl   $0x80103700,0x10(%eax)

  return p;
801036cc:	89 d8                	mov    %ebx,%eax
}
801036ce:	83 c4 14             	add    $0x14,%esp
801036d1:	5b                   	pop    %ebx
801036d2:	5d                   	pop    %ebp
801036d3:	c3                   	ret    
801036d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
801036d8:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
801036df:	e8 2c 0c 00 00       	call   80104310 <release>
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
801036e4:	83 c4 14             	add    $0x14,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;
801036e7:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
801036e9:	5b                   	pop    %ebx
801036ea:	5d                   	pop    %ebp
801036eb:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
801036ec:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
801036f3:	eb d9                	jmp    801036ce <allocproc+0x9e>
801036f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103700 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103700:	55                   	push   %ebp
80103701:	89 e5                	mov    %esp,%ebp
80103703:	83 ec 18             	sub    $0x18,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103706:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
8010370d:	e8 fe 0b 00 00       	call   80104310 <release>

  if (first) {
80103712:	a1 04 a0 10 80       	mov    0x8010a004,%eax
80103717:	85 c0                	test   %eax,%eax
80103719:	75 05                	jne    80103720 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010371b:	c9                   	leave  
8010371c:	c3                   	ret    
8010371d:	8d 76 00             	lea    0x0(%esi),%esi
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103720:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103727:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
8010372e:	00 00 00 
    iinit(ROOTDEV);
80103731:	e8 3a dd ff ff       	call   80101470 <iinit>
    initlog(ROOTDEV);
80103736:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010373d:	e8 9e f3 ff ff       	call   80102ae0 <initlog>
  }

  // Return to "caller", actually trapret (see allocproc).
}
80103742:	c9                   	leave  
80103743:	c3                   	ret    
80103744:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010374a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103750 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
80103750:	55                   	push   %ebp
80103751:	89 e5                	mov    %esp,%ebp
80103753:	83 ec 18             	sub    $0x18,%esp
  initlock(&ptable.lock, "ptable");
80103756:	c7 44 24 04 cd 72 10 	movl   $0x801072cd,0x4(%esp)
8010375d:	80 
8010375e:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103765:	e8 f6 09 00 00       	call   80104160 <initlock>
}
8010376a:	c9                   	leave  
8010376b:	c3                   	ret    
8010376c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103770 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
80103770:	55                   	push   %ebp
80103771:	89 e5                	mov    %esp,%ebp
80103773:	53                   	push   %ebx
80103774:	83 ec 14             	sub    $0x14,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
80103777:	e8 b4 fe ff ff       	call   80103630 <allocproc>
8010377c:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
8010377e:	a3 bc a5 10 80       	mov    %eax,0x8010a5bc
  if((p->pgdir = setupkvm()) == 0)
80103783:	e8 98 2f 00 00       	call   80106720 <setupkvm>
80103788:	85 c0                	test   %eax,%eax
8010378a:	89 43 04             	mov    %eax,0x4(%ebx)
8010378d:	0f 84 d4 00 00 00    	je     80103867 <userinit+0xf7>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103793:	89 04 24             	mov    %eax,(%esp)
80103796:	c7 44 24 08 2c 00 00 	movl   $0x2c,0x8(%esp)
8010379d:	00 
8010379e:	c7 44 24 04 60 a4 10 	movl   $0x8010a460,0x4(%esp)
801037a5:	80 
801037a6:	e8 05 31 00 00       	call   801068b0 <inituvm>
  p->sz = PGSIZE;
801037ab:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801037b1:	c7 44 24 08 4c 00 00 	movl   $0x4c,0x8(%esp)
801037b8:	00 
801037b9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801037c0:	00 
801037c1:	8b 43 18             	mov    0x18(%ebx),%eax
801037c4:	89 04 24             	mov    %eax,(%esp)
801037c7:	e8 94 0b 00 00       	call   80104360 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801037cc:	8b 43 18             	mov    0x18(%ebx),%eax
801037cf:	ba 23 00 00 00       	mov    $0x23,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801037d4:	b9 2b 00 00 00       	mov    $0x2b,%ecx
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801037d9:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801037dd:	8b 43 18             	mov    0x18(%ebx),%eax
801037e0:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
801037e4:	8b 43 18             	mov    0x18(%ebx),%eax
801037e7:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801037eb:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
801037ef:	8b 43 18             	mov    0x18(%ebx),%eax
801037f2:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801037f6:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
801037fa:	8b 43 18             	mov    0x18(%ebx),%eax
801037fd:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103804:	8b 43 18             	mov    0x18(%ebx),%eax
80103807:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
8010380e:	8b 43 18             	mov    0x18(%ebx),%eax
80103811:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103818:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010381b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80103822:	00 
80103823:	c7 44 24 04 ed 72 10 	movl   $0x801072ed,0x4(%esp)
8010382a:	80 
8010382b:	89 04 24             	mov    %eax,(%esp)
8010382e:	e8 0d 0d 00 00       	call   80104540 <safestrcpy>
  p->cwd = namei("/");
80103833:	c7 04 24 f6 72 10 80 	movl   $0x801072f6,(%esp)
8010383a:	e8 a1 e6 ff ff       	call   80101ee0 <namei>
8010383f:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
80103842:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103849:	e8 92 09 00 00       	call   801041e0 <acquire>

  p->state = RUNNABLE;
8010384e:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
80103855:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
8010385c:	e8 af 0a 00 00       	call   80104310 <release>
}
80103861:	83 c4 14             	add    $0x14,%esp
80103864:	5b                   	pop    %ebx
80103865:	5d                   	pop    %ebp
80103866:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
80103867:	c7 04 24 d4 72 10 80 	movl   $0x801072d4,(%esp)
8010386e:	e8 ed ca ff ff       	call   80100360 <panic>
80103873:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103880 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103880:	55                   	push   %ebp
80103881:	89 e5                	mov    %esp,%ebp
80103883:	83 ec 18             	sub    $0x18,%esp
  uint sz;

  sz = proc->sz;
80103886:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
8010388d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint sz;

  sz = proc->sz;
80103890:	8b 02                	mov    (%edx),%eax
  if(n > 0){
80103892:	83 f9 00             	cmp    $0x0,%ecx
80103895:	7e 39                	jle    801038d0 <growproc+0x50>
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
80103897:	01 c1                	add    %eax,%ecx
80103899:	89 4c 24 08          	mov    %ecx,0x8(%esp)
8010389d:	89 44 24 04          	mov    %eax,0x4(%esp)
801038a1:	8b 42 04             	mov    0x4(%edx),%eax
801038a4:	89 04 24             	mov    %eax,(%esp)
801038a7:	e8 44 31 00 00       	call   801069f0 <allocuvm>
801038ac:	85 c0                	test   %eax,%eax
801038ae:	74 40                	je     801038f0 <growproc+0x70>
801038b0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  proc->sz = sz;
801038b7:	89 02                	mov    %eax,(%edx)
  switchuvm(proc);
801038b9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801038bf:	89 04 24             	mov    %eax,(%esp)
801038c2:	e8 19 2f 00 00       	call   801067e0 <switchuvm>
  return 0;
801038c7:	31 c0                	xor    %eax,%eax
}
801038c9:	c9                   	leave  
801038ca:	c3                   	ret    
801038cb:	90                   	nop
801038cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
801038d0:	74 e5                	je     801038b7 <growproc+0x37>
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
801038d2:	01 c1                	add    %eax,%ecx
801038d4:	89 4c 24 08          	mov    %ecx,0x8(%esp)
801038d8:	89 44 24 04          	mov    %eax,0x4(%esp)
801038dc:	8b 42 04             	mov    0x4(%edx),%eax
801038df:	89 04 24             	mov    %eax,(%esp)
801038e2:	e8 f9 31 00 00       	call   80106ae0 <deallocuvm>
801038e7:	85 c0                	test   %eax,%eax
801038e9:	75 c5                	jne    801038b0 <growproc+0x30>
801038eb:	90                   	nop
801038ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint sz;

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
801038f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
  }
  proc->sz = sz;
  switchuvm(proc);
  return 0;
}
801038f5:	c9                   	leave  
801038f6:	c3                   	ret    
801038f7:	89 f6                	mov    %esi,%esi
801038f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103900 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103900:	55                   	push   %ebp
80103901:	89 e5                	mov    %esp,%ebp
80103903:	57                   	push   %edi
80103904:	56                   	push   %esi
80103905:	53                   	push   %ebx
80103906:	83 ec 1c             	sub    $0x1c,%esp
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
80103909:	e8 22 fd ff ff       	call   80103630 <allocproc>
8010390e:	85 c0                	test   %eax,%eax
80103910:	89 c3                	mov    %eax,%ebx
80103912:	0f 84 d5 00 00 00    	je     801039ed <fork+0xed>
    return -1;
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
80103918:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010391e:	8b 10                	mov    (%eax),%edx
80103920:	89 54 24 04          	mov    %edx,0x4(%esp)
80103924:	8b 40 04             	mov    0x4(%eax),%eax
80103927:	89 04 24             	mov    %eax,(%esp)
8010392a:	e8 81 32 00 00       	call   80106bb0 <copyuvm>
8010392f:	85 c0                	test   %eax,%eax
80103931:	89 43 04             	mov    %eax,0x4(%ebx)
80103934:	0f 84 ba 00 00 00    	je     801039f4 <fork+0xf4>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
8010393a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  np->parent = proc;
  *np->tf = *proc->tf;
80103940:	b9 13 00 00 00       	mov    $0x13,%ecx
80103945:	8b 7b 18             	mov    0x18(%ebx),%edi
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
80103948:	8b 00                	mov    (%eax),%eax
8010394a:	89 03                	mov    %eax,(%ebx)
  np->parent = proc;
8010394c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103952:	89 43 14             	mov    %eax,0x14(%ebx)
  *np->tf = *proc->tf;
80103955:	8b 70 18             	mov    0x18(%eax),%esi
80103958:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
8010395a:	31 f6                	xor    %esi,%esi
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
8010395c:	8b 43 18             	mov    0x18(%ebx),%eax
8010395f:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103966:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
8010396d:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = 0; i < NOFILE; i++)
    if(proc->ofile[i])
80103970:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
80103974:	85 c0                	test   %eax,%eax
80103976:	74 13                	je     8010398b <fork+0x8b>
      np->ofile[i] = filedup(proc->ofile[i]);
80103978:	89 04 24             	mov    %eax,(%esp)
8010397b:	e8 50 d4 ff ff       	call   80100dd0 <filedup>
80103980:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
80103984:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
8010398b:	83 c6 01             	add    $0x1,%esi
8010398e:	83 fe 10             	cmp    $0x10,%esi
80103991:	75 dd                	jne    80103970 <fork+0x70>
    if(proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);
80103993:	8b 42 68             	mov    0x68(%edx),%eax
80103996:	89 04 24             	mov    %eax,(%esp)
80103999:	e8 e2 dc ff ff       	call   80101680 <idup>
8010399e:	89 43 68             	mov    %eax,0x68(%ebx)

  safestrcpy(np->name, proc->name, sizeof(proc->name));
801039a1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801039a7:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
801039ae:	00 
801039af:	83 c0 6c             	add    $0x6c,%eax
801039b2:	89 44 24 04          	mov    %eax,0x4(%esp)
801039b6:	8d 43 6c             	lea    0x6c(%ebx),%eax
801039b9:	89 04 24             	mov    %eax,(%esp)
801039bc:	e8 7f 0b 00 00       	call   80104540 <safestrcpy>

  pid = np->pid;
801039c1:	8b 73 10             	mov    0x10(%ebx),%esi

  acquire(&ptable.lock);
801039c4:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
801039cb:	e8 10 08 00 00       	call   801041e0 <acquire>

  np->state = RUNNABLE;
801039d0:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
801039d7:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
801039de:	e8 2d 09 00 00       	call   80104310 <release>

  return pid;
801039e3:	89 f0                	mov    %esi,%eax
}
801039e5:	83 c4 1c             	add    $0x1c,%esp
801039e8:	5b                   	pop    %ebx
801039e9:	5e                   	pop    %esi
801039ea:	5f                   	pop    %edi
801039eb:	5d                   	pop    %ebp
801039ec:	c3                   	ret    
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
801039ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801039f2:	eb f1                	jmp    801039e5 <fork+0xe5>
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
801039f4:	8b 43 08             	mov    0x8(%ebx),%eax
801039f7:	89 04 24             	mov    %eax,(%esp)
801039fa:	e8 e1 e8 ff ff       	call   801022e0 <kfree>
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
801039ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
    np->kstack = 0;
80103a04:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103a0b:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103a12:	eb d1                	jmp    801039e5 <fork+0xe5>
80103a14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103a1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103a20 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103a20:	55                   	push   %ebp
80103a21:	89 e5                	mov    %esp,%ebp
80103a23:	53                   	push   %ebx
80103a24:	83 ec 14             	sub    $0x14,%esp
80103a27:	90                   	nop
}

static inline void
sti(void)
{
  asm volatile("sti");
80103a28:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a29:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a30:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a35:	e8 a6 07 00 00       	call   801041e0 <acquire>
80103a3a:	eb 0f                	jmp    80103a4b <scheduler+0x2b>
80103a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a40:	83 eb 80             	sub    $0xffffff80,%ebx
80103a43:	81 fb d4 4d 11 80    	cmp    $0x80114dd4,%ebx
80103a49:	74 55                	je     80103aa0 <scheduler+0x80>
      if(p->state != RUNNABLE)
80103a4b:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103a4f:	75 ef                	jne    80103a40 <scheduler+0x20>

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
80103a51:	89 1c 24             	mov    %ebx,(%esp)
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
80103a54:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a5b:	83 eb 80             	sub    $0xffffff80,%ebx

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
80103a5e:	e8 7d 2d 00 00       	call   801067e0 <switchuvm>
      p->state = RUNNING;
      swtch(&cpu->scheduler, p->context);
80103a63:	8b 43 9c             	mov    -0x64(%ebx),%eax
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103a66:	c7 43 8c 04 00 00 00 	movl   $0x4,-0x74(%ebx)
      swtch(&cpu->scheduler, p->context);
80103a6d:	89 44 24 04          	mov    %eax,0x4(%esp)
80103a71:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103a77:	83 c0 04             	add    $0x4,%eax
80103a7a:	89 04 24             	mov    %eax,(%esp)
80103a7d:	e8 19 0b 00 00       	call   8010459b <swtch>
      switchkvm();
80103a82:	e8 39 2d 00 00       	call   801067c0 <switchkvm>
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a87:	81 fb d4 4d 11 80    	cmp    $0x80114dd4,%ebx
      swtch(&cpu->scheduler, p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
80103a8d:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103a94:	00 00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a98:	75 b1                	jne    80103a4b <scheduler+0x2b>
80103a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
    }
    release(&ptable.lock);
80103aa0:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103aa7:	e8 64 08 00 00       	call   80104310 <release>

  }
80103aac:	e9 77 ff ff ff       	jmp    80103a28 <scheduler+0x8>
80103ab1:	eb 0d                	jmp    80103ac0 <sched>
80103ab3:	90                   	nop
80103ab4:	90                   	nop
80103ab5:	90                   	nop
80103ab6:	90                   	nop
80103ab7:	90                   	nop
80103ab8:	90                   	nop
80103ab9:	90                   	nop
80103aba:	90                   	nop
80103abb:	90                   	nop
80103abc:	90                   	nop
80103abd:	90                   	nop
80103abe:	90                   	nop
80103abf:	90                   	nop

80103ac0 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103ac0:	55                   	push   %ebp
80103ac1:	89 e5                	mov    %esp,%ebp
80103ac3:	53                   	push   %ebx
80103ac4:	83 ec 14             	sub    $0x14,%esp
  int intena;

  if(!holding(&ptable.lock))
80103ac7:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103ace:	e8 9d 07 00 00       	call   80104270 <holding>
80103ad3:	85 c0                	test   %eax,%eax
80103ad5:	74 4d                	je     80103b24 <sched+0x64>
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
80103ad7:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103add:	83 b8 ac 00 00 00 01 	cmpl   $0x1,0xac(%eax)
80103ae4:	75 62                	jne    80103b48 <sched+0x88>
    panic("sched locks");
  if(proc->state == RUNNING)
80103ae6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103aed:	83 7a 0c 04          	cmpl   $0x4,0xc(%edx)
80103af1:	74 49                	je     80103b3c <sched+0x7c>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103af3:	9c                   	pushf  
80103af4:	59                   	pop    %ecx
    panic("sched running");
  if(readeflags()&FL_IF)
80103af5:	80 e5 02             	and    $0x2,%ch
80103af8:	75 36                	jne    80103b30 <sched+0x70>
    panic("sched interruptible");
  intena = cpu->intena;
80103afa:	8b 98 b0 00 00 00    	mov    0xb0(%eax),%ebx
  swtch(&proc->context, cpu->scheduler);
80103b00:	83 c2 1c             	add    $0x1c,%edx
80103b03:	8b 40 04             	mov    0x4(%eax),%eax
80103b06:	89 14 24             	mov    %edx,(%esp)
80103b09:	89 44 24 04          	mov    %eax,0x4(%esp)
80103b0d:	e8 89 0a 00 00       	call   8010459b <swtch>
  cpu->intena = intena;
80103b12:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103b18:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
80103b1e:	83 c4 14             	add    $0x14,%esp
80103b21:	5b                   	pop    %ebx
80103b22:	5d                   	pop    %ebp
80103b23:	c3                   	ret    
sched(void)
{
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103b24:	c7 04 24 f8 72 10 80 	movl   $0x801072f8,(%esp)
80103b2b:	e8 30 c8 ff ff       	call   80100360 <panic>
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103b30:	c7 04 24 24 73 10 80 	movl   $0x80107324,(%esp)
80103b37:	e8 24 c8 ff ff       	call   80100360 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
80103b3c:	c7 04 24 16 73 10 80 	movl   $0x80107316,(%esp)
80103b43:	e8 18 c8 ff ff       	call   80100360 <panic>
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
80103b48:	c7 04 24 0a 73 10 80 	movl   $0x8010730a,(%esp)
80103b4f:	e8 0c c8 ff ff       	call   80100360 <panic>
80103b54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103b5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103b60 <exit>:

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void exit(int status)
{
80103b60:	55                   	push   %ebp
80103b61:	89 e5                	mov    %esp,%ebp
80103b63:	56                   	push   %esi
80103b64:	53                   	push   %ebx
  struct proc *p;
  int fd;

	proc->exit_status = status;		// LAB1 modification

  if(proc == initproc)
80103b65:	31 db                	xor    %ebx,%ebx

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void exit(int status)
{
80103b67:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  int fd;

	proc->exit_status = status;		// LAB1 modification
80103b6a:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103b71:	8b 45 08             	mov    0x8(%ebp),%eax

  if(proc == initproc)
80103b74:	3b 15 bc a5 10 80    	cmp    0x8010a5bc,%edx
void exit(int status)
{
  struct proc *p;
  int fd;

	proc->exit_status = status;		// LAB1 modification
80103b7a:	89 42 7c             	mov    %eax,0x7c(%edx)

  if(proc == initproc)
80103b7d:	0f 84 03 01 00 00    	je     80103c86 <exit+0x126>
80103b83:	90                   	nop
80103b84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
80103b88:	8d 73 08             	lea    0x8(%ebx),%esi
80103b8b:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103b8f:	85 c0                	test   %eax,%eax
80103b91:	74 17                	je     80103baa <exit+0x4a>
      fileclose(proc->ofile[fd]);
80103b93:	89 04 24             	mov    %eax,(%esp)
80103b96:	e8 85 d2 ff ff       	call   80100e20 <fileclose>
      proc->ofile[fd] = 0;
80103b9b:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103ba2:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103ba9:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103baa:	83 c3 01             	add    $0x1,%ebx
80103bad:	83 fb 10             	cmp    $0x10,%ebx
80103bb0:	75 d6                	jne    80103b88 <exit+0x28>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  begin_op();
80103bb2:	e8 c9 ef ff ff       	call   80102b80 <begin_op>
  iput(proc->cwd);
80103bb7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103bbd:	8b 40 68             	mov    0x68(%eax),%eax
80103bc0:	89 04 24             	mov    %eax,(%esp)
80103bc3:	e8 f8 db ff ff       	call   801017c0 <iput>
  end_op();
80103bc8:	e8 23 f0 ff ff       	call   80102bf0 <end_op>
  proc->cwd = 0;
80103bcd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103bd3:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
80103bda:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103be1:	e8 fa 05 00 00       	call   801041e0 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103be6:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103bed:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
  proc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103bf2:	8b 51 14             	mov    0x14(%ecx),%edx
80103bf5:	eb 0b                	jmp    80103c02 <exit+0xa2>
80103bf7:	90                   	nop
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103bf8:	83 e8 80             	sub    $0xffffff80,%eax
80103bfb:	3d d4 4d 11 80       	cmp    $0x80114dd4,%eax
80103c00:	74 1c                	je     80103c1e <exit+0xbe>
    if(p->state == SLEEPING && p->chan == chan)
80103c02:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c06:	75 f0                	jne    80103bf8 <exit+0x98>
80103c08:	3b 50 20             	cmp    0x20(%eax),%edx
80103c0b:	75 eb                	jne    80103bf8 <exit+0x98>
      p->state = RUNNABLE;
80103c0d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c14:	83 e8 80             	sub    $0xffffff80,%eax
80103c17:	3d d4 4d 11 80       	cmp    $0x80114dd4,%eax
80103c1c:	75 e4                	jne    80103c02 <exit+0xa2>
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103c1e:	8b 1d bc a5 10 80    	mov    0x8010a5bc,%ebx
80103c24:	ba d4 2d 11 80       	mov    $0x80112dd4,%edx
80103c29:	eb 10                	jmp    80103c3b <exit+0xdb>
80103c2b:	90                   	nop
80103c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c30:	83 ea 80             	sub    $0xffffff80,%edx
80103c33:	81 fa d4 4d 11 80    	cmp    $0x80114dd4,%edx
80103c39:	74 33                	je     80103c6e <exit+0x10e>
    if(p->parent == proc){
80103c3b:	3b 4a 14             	cmp    0x14(%edx),%ecx
80103c3e:	75 f0                	jne    80103c30 <exit+0xd0>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103c40:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103c44:	89 5a 14             	mov    %ebx,0x14(%edx)
      if(p->state == ZOMBIE)
80103c47:	75 e7                	jne    80103c30 <exit+0xd0>
80103c49:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103c4e:	eb 0a                	jmp    80103c5a <exit+0xfa>
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c50:	83 e8 80             	sub    $0xffffff80,%eax
80103c53:	3d d4 4d 11 80       	cmp    $0x80114dd4,%eax
80103c58:	74 d6                	je     80103c30 <exit+0xd0>
    if(p->state == SLEEPING && p->chan == chan)
80103c5a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c5e:	75 f0                	jne    80103c50 <exit+0xf0>
80103c60:	3b 58 20             	cmp    0x20(%eax),%ebx
80103c63:	75 eb                	jne    80103c50 <exit+0xf0>
      p->state = RUNNABLE;
80103c65:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103c6c:	eb e2                	jmp    80103c50 <exit+0xf0>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80103c6e:	c7 41 0c 05 00 00 00 	movl   $0x5,0xc(%ecx)
  sched();
80103c75:	e8 46 fe ff ff       	call   80103ac0 <sched>
  panic("zombie exit");
80103c7a:	c7 04 24 45 73 10 80 	movl   $0x80107345,(%esp)
80103c81:	e8 da c6 ff ff       	call   80100360 <panic>
  int fd;

	proc->exit_status = status;		// LAB1 modification

  if(proc == initproc)
    panic("init exiting");
80103c86:	c7 04 24 38 73 10 80 	movl   $0x80107338,(%esp)
80103c8d:	e8 ce c6 ff ff       	call   80100360 <panic>
80103c92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ca0 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103ca0:	55                   	push   %ebp
80103ca1:	89 e5                	mov    %esp,%ebp
80103ca3:	83 ec 18             	sub    $0x18,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103ca6:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103cad:	e8 2e 05 00 00       	call   801041e0 <acquire>
  proc->state = RUNNABLE;
80103cb2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103cb8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103cbf:	e8 fc fd ff ff       	call   80103ac0 <sched>
  release(&ptable.lock);
80103cc4:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103ccb:	e8 40 06 00 00       	call   80104310 <release>
}
80103cd0:	c9                   	leave  
80103cd1:	c3                   	ret    
80103cd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ce0 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103ce0:	55                   	push   %ebp
80103ce1:	89 e5                	mov    %esp,%ebp
80103ce3:	56                   	push   %esi
80103ce4:	53                   	push   %ebx
80103ce5:	83 ec 10             	sub    $0x10,%esp
  if(proc == 0)
80103ce8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103cee:	8b 75 08             	mov    0x8(%ebp),%esi
80103cf1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(proc == 0)
80103cf4:	85 c0                	test   %eax,%eax
80103cf6:	0f 84 8b 00 00 00    	je     80103d87 <sleep+0xa7>
    panic("sleep");

  if(lk == 0)
80103cfc:	85 db                	test   %ebx,%ebx
80103cfe:	74 7b                	je     80103d7b <sleep+0x9b>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103d00:	81 fb a0 2d 11 80    	cmp    $0x80112da0,%ebx
80103d06:	74 50                	je     80103d58 <sleep+0x78>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103d08:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103d0f:	e8 cc 04 00 00       	call   801041e0 <acquire>
    release(lk);
80103d14:	89 1c 24             	mov    %ebx,(%esp)
80103d17:	e8 f4 05 00 00       	call   80104310 <release>
  }

  // Go to sleep.
  proc->chan = chan;
80103d1c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d22:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103d25:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103d2c:	e8 8f fd ff ff       	call   80103ac0 <sched>

  // Tidy up.
  proc->chan = 0;
80103d31:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d37:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103d3e:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103d45:	e8 c6 05 00 00       	call   80104310 <release>
    acquire(lk);
80103d4a:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
}
80103d4d:	83 c4 10             	add    $0x10,%esp
80103d50:	5b                   	pop    %ebx
80103d51:	5e                   	pop    %esi
80103d52:	5d                   	pop    %ebp
  proc->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103d53:	e9 88 04 00 00       	jmp    801041e0 <acquire>
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }

  // Go to sleep.
  proc->chan = chan;
80103d58:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103d5b:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103d62:	e8 59 fd ff ff       	call   80103ac0 <sched>

  // Tidy up.
  proc->chan = 0;
80103d67:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d6d:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103d74:	83 c4 10             	add    $0x10,%esp
80103d77:	5b                   	pop    %ebx
80103d78:	5e                   	pop    %esi
80103d79:	5d                   	pop    %ebp
80103d7a:	c3                   	ret    
{
  if(proc == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103d7b:	c7 04 24 57 73 10 80 	movl   $0x80107357,(%esp)
80103d82:	e8 d9 c5 ff ff       	call   80100360 <panic>
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
    panic("sleep");
80103d87:	c7 04 24 51 73 10 80 	movl   $0x80107351,(%esp)
80103d8e:	e8 cd c5 ff ff       	call   80100360 <panic>
80103d93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103da0 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103da0:	55                   	push   %ebp
80103da1:	89 e5                	mov    %esp,%ebp
80103da3:	56                   	push   %esi
80103da4:	53                   	push   %ebx
80103da5:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
80103da8:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103daf:	e8 2c 04 00 00       	call   801041e0 <acquire>
80103db4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103dba:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103dbc:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
80103dc1:	eb 10                	jmp    80103dd3 <wait+0x33>
80103dc3:	90                   	nop
80103dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103dc8:	83 eb 80             	sub    $0xffffff80,%ebx
80103dcb:	81 fb d4 4d 11 80    	cmp    $0x80114dd4,%ebx
80103dd1:	74 1d                	je     80103df0 <wait+0x50>
      if(p->parent != proc)
80103dd3:	39 43 14             	cmp    %eax,0x14(%ebx)
80103dd6:	75 f0                	jne    80103dc8 <wait+0x28>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103dd8:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103ddc:	74 2f                	je     80103e0d <wait+0x6d>

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103dde:	83 eb 80             	sub    $0xffffff80,%ebx
      if(p->parent != proc)
        continue;
      havekids = 1;
80103de1:	ba 01 00 00 00       	mov    $0x1,%edx

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103de6:	81 fb d4 4d 11 80    	cmp    $0x80114dd4,%ebx
80103dec:	75 e5                	jne    80103dd3 <wait+0x33>
80103dee:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
80103df0:	85 d2                	test   %edx,%edx
80103df2:	74 6e                	je     80103e62 <wait+0xc2>
80103df4:	8b 50 24             	mov    0x24(%eax),%edx
80103df7:	85 d2                	test   %edx,%edx
80103df9:	75 67                	jne    80103e62 <wait+0xc2>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
80103dfb:	c7 44 24 04 a0 2d 11 	movl   $0x80112da0,0x4(%esp)
80103e02:	80 
80103e03:	89 04 24             	mov    %eax,(%esp)
80103e06:	e8 d5 fe ff ff       	call   80103ce0 <sleep>
  }
80103e0b:	eb a7                	jmp    80103db4 <wait+0x14>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103e0d:	8b 43 08             	mov    0x8(%ebx),%eax
      if(p->parent != proc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103e10:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103e13:	89 04 24             	mov    %eax,(%esp)
80103e16:	e8 c5 e4 ff ff       	call   801022e0 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103e1b:	8b 43 04             	mov    0x4(%ebx),%eax
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103e1e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103e25:	89 04 24             	mov    %eax,(%esp)
80103e28:	e8 d3 2c 00 00       	call   80106b00 <freevm>
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
80103e2d:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
80103e34:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103e3b:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103e42:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103e46:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103e4d:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103e54:	e8 b7 04 00 00       	call   80104310 <release>
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103e59:	83 c4 10             	add    $0x10,%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80103e5c:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103e5e:	5b                   	pop    %ebx
80103e5f:	5e                   	pop    %esi
80103e60:	5d                   	pop    %ebp
80103e61:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
80103e62:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103e69:	e8 a2 04 00 00       	call   80104310 <release>
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103e6e:	83 c4 10             	add    $0x10,%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
      return -1;
80103e71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103e76:	5b                   	pop    %ebx
80103e77:	5e                   	pop    %esi
80103e78:	5d                   	pop    %ebp
80103e79:	c3                   	ret    
80103e7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103e80 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103e80:	55                   	push   %ebp
80103e81:	89 e5                	mov    %esp,%ebp
80103e83:	53                   	push   %ebx
80103e84:	83 ec 14             	sub    $0x14,%esp
80103e87:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103e8a:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103e91:	e8 4a 03 00 00       	call   801041e0 <acquire>
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e96:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103e9b:	eb 0d                	jmp    80103eaa <wakeup+0x2a>
80103e9d:	8d 76 00             	lea    0x0(%esi),%esi
80103ea0:	83 e8 80             	sub    $0xffffff80,%eax
80103ea3:	3d d4 4d 11 80       	cmp    $0x80114dd4,%eax
80103ea8:	74 1e                	je     80103ec8 <wakeup+0x48>
    if(p->state == SLEEPING && p->chan == chan)
80103eaa:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103eae:	75 f0                	jne    80103ea0 <wakeup+0x20>
80103eb0:	3b 58 20             	cmp    0x20(%eax),%ebx
80103eb3:	75 eb                	jne    80103ea0 <wakeup+0x20>
      p->state = RUNNABLE;
80103eb5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ebc:	83 e8 80             	sub    $0xffffff80,%eax
80103ebf:	3d d4 4d 11 80       	cmp    $0x80114dd4,%eax
80103ec4:	75 e4                	jne    80103eaa <wakeup+0x2a>
80103ec6:	66 90                	xchg   %ax,%ax
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103ec8:	c7 45 08 a0 2d 11 80 	movl   $0x80112da0,0x8(%ebp)
}
80103ecf:	83 c4 14             	add    $0x14,%esp
80103ed2:	5b                   	pop    %ebx
80103ed3:	5d                   	pop    %ebp
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103ed4:	e9 37 04 00 00       	jmp    80104310 <release>
80103ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103ee0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103ee0:	55                   	push   %ebp
80103ee1:	89 e5                	mov    %esp,%ebp
80103ee3:	53                   	push   %ebx
80103ee4:	83 ec 14             	sub    $0x14,%esp
80103ee7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103eea:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103ef1:	e8 ea 02 00 00       	call   801041e0 <acquire>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ef6:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103efb:	eb 0d                	jmp    80103f0a <kill+0x2a>
80103efd:	8d 76 00             	lea    0x0(%esi),%esi
80103f00:	83 e8 80             	sub    $0xffffff80,%eax
80103f03:	3d d4 4d 11 80       	cmp    $0x80114dd4,%eax
80103f08:	74 36                	je     80103f40 <kill+0x60>
    if(p->pid == pid){
80103f0a:	39 58 10             	cmp    %ebx,0x10(%eax)
80103f0d:	75 f1                	jne    80103f00 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103f0f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80103f13:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103f1a:	74 14                	je     80103f30 <kill+0x50>
        p->state = RUNNABLE;
      release(&ptable.lock);
80103f1c:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103f23:	e8 e8 03 00 00       	call   80104310 <release>
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}
80103f28:	83 c4 14             	add    $0x14,%esp
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
80103f2b:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80103f2d:	5b                   	pop    %ebx
80103f2e:	5d                   	pop    %ebp
80103f2f:	c3                   	ret    
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80103f30:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103f37:	eb e3                	jmp    80103f1c <kill+0x3c>
80103f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80103f40:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103f47:	e8 c4 03 00 00       	call   80104310 <release>
  return -1;
}
80103f4c:	83 c4 14             	add    $0x14,%esp
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
80103f4f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103f54:	5b                   	pop    %ebx
80103f55:	5d                   	pop    %ebp
80103f56:	c3                   	ret    
80103f57:	89 f6                	mov    %esi,%esi
80103f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f60 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80103f60:	55                   	push   %ebp
80103f61:	89 e5                	mov    %esp,%ebp
80103f63:	57                   	push   %edi
80103f64:	56                   	push   %esi
80103f65:	53                   	push   %ebx
80103f66:	bb 40 2e 11 80       	mov    $0x80112e40,%ebx
80103f6b:	83 ec 4c             	sub    $0x4c,%esp
80103f6e:	8d 75 e8             	lea    -0x18(%ebp),%esi
80103f71:	eb 20                	jmp    80103f93 <procdump+0x33>
80103f73:	90                   	nop
80103f74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80103f78:	c7 04 24 a6 72 10 80 	movl   $0x801072a6,(%esp)
80103f7f:	e8 cc c6 ff ff       	call   80100650 <cprintf>
80103f84:	83 eb 80             	sub    $0xffffff80,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f87:	81 fb 40 4e 11 80    	cmp    $0x80114e40,%ebx
80103f8d:	0f 84 8d 00 00 00    	je     80104020 <procdump+0xc0>
    if(p->state == UNUSED)
80103f93:	8b 43 a0             	mov    -0x60(%ebx),%eax
80103f96:	85 c0                	test   %eax,%eax
80103f98:	74 ea                	je     80103f84 <procdump+0x24>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80103f9a:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80103f9d:	ba 68 73 10 80       	mov    $0x80107368,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80103fa2:	77 11                	ja     80103fb5 <procdump+0x55>
80103fa4:	8b 14 85 bc 73 10 80 	mov    -0x7fef8c44(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
80103fab:	b8 68 73 10 80       	mov    $0x80107368,%eax
80103fb0:	85 d2                	test   %edx,%edx
80103fb2:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80103fb5:	8b 43 a4             	mov    -0x5c(%ebx),%eax
80103fb8:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
80103fbc:	89 54 24 08          	mov    %edx,0x8(%esp)
80103fc0:	c7 04 24 6c 73 10 80 	movl   $0x8010736c,(%esp)
80103fc7:	89 44 24 04          	mov    %eax,0x4(%esp)
80103fcb:	e8 80 c6 ff ff       	call   80100650 <cprintf>
    if(p->state == SLEEPING){
80103fd0:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
80103fd4:	75 a2                	jne    80103f78 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80103fd6:	8d 45 c0             	lea    -0x40(%ebp),%eax
80103fd9:	89 44 24 04          	mov    %eax,0x4(%esp)
80103fdd:	8b 43 b0             	mov    -0x50(%ebx),%eax
80103fe0:	8d 7d c0             	lea    -0x40(%ebp),%edi
80103fe3:	8b 40 0c             	mov    0xc(%eax),%eax
80103fe6:	83 c0 08             	add    $0x8,%eax
80103fe9:	89 04 24             	mov    %eax,(%esp)
80103fec:	e8 8f 01 00 00       	call   80104180 <getcallerpcs>
80103ff1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80103ff8:	8b 17                	mov    (%edi),%edx
80103ffa:	85 d2                	test   %edx,%edx
80103ffc:	0f 84 76 ff ff ff    	je     80103f78 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104002:	89 54 24 04          	mov    %edx,0x4(%esp)
80104006:	83 c7 04             	add    $0x4,%edi
80104009:	c7 04 24 c9 6d 10 80 	movl   $0x80106dc9,(%esp)
80104010:	e8 3b c6 ff ff       	call   80100650 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80104015:	39 f7                	cmp    %esi,%edi
80104017:	75 df                	jne    80103ff8 <procdump+0x98>
80104019:	e9 5a ff ff ff       	jmp    80103f78 <procdump+0x18>
8010401e:	66 90                	xchg   %ax,%ax
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
80104020:	83 c4 4c             	add    $0x4c,%esp
80104023:	5b                   	pop    %ebx
80104024:	5e                   	pop    %esi
80104025:	5f                   	pop    %edi
80104026:	5d                   	pop    %ebp
80104027:	c3                   	ret    
80104028:	90                   	nop
80104029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104030 <myhello>:

void myhello(void) {
80104030:	55                   	push   %ebp
80104031:	89 e5                	mov    %esp,%ebp
80104033:	83 ec 18             	sub    $0x18,%esp
	cprintf("Hello from the other side...");
80104036:	c7 04 24 75 73 10 80 	movl   $0x80107375,(%esp)
8010403d:	e8 0e c6 ff ff       	call   80100650 <cprintf>
}
80104042:	c9                   	leave  
80104043:	c3                   	ret    
80104044:	66 90                	xchg   %ax,%ax
80104046:	66 90                	xchg   %ax,%ax
80104048:	66 90                	xchg   %ax,%ax
8010404a:	66 90                	xchg   %ax,%ax
8010404c:	66 90                	xchg   %ax,%ax
8010404e:	66 90                	xchg   %ax,%ax

80104050 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104050:	55                   	push   %ebp
80104051:	89 e5                	mov    %esp,%ebp
80104053:	53                   	push   %ebx
80104054:	83 ec 14             	sub    $0x14,%esp
80104057:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010405a:	c7 44 24 04 d4 73 10 	movl   $0x801073d4,0x4(%esp)
80104061:	80 
80104062:	8d 43 04             	lea    0x4(%ebx),%eax
80104065:	89 04 24             	mov    %eax,(%esp)
80104068:	e8 f3 00 00 00       	call   80104160 <initlock>
  lk->name = name;
8010406d:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
80104070:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
80104076:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
8010407d:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
80104080:	83 c4 14             	add    $0x14,%esp
80104083:	5b                   	pop    %ebx
80104084:	5d                   	pop    %ebp
80104085:	c3                   	ret    
80104086:	8d 76 00             	lea    0x0(%esi),%esi
80104089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104090 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104090:	55                   	push   %ebp
80104091:	89 e5                	mov    %esp,%ebp
80104093:	56                   	push   %esi
80104094:	53                   	push   %ebx
80104095:	83 ec 10             	sub    $0x10,%esp
80104098:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
8010409b:	8d 73 04             	lea    0x4(%ebx),%esi
8010409e:	89 34 24             	mov    %esi,(%esp)
801040a1:	e8 3a 01 00 00       	call   801041e0 <acquire>
  while (lk->locked) {
801040a6:	8b 13                	mov    (%ebx),%edx
801040a8:	85 d2                	test   %edx,%edx
801040aa:	74 16                	je     801040c2 <acquiresleep+0x32>
801040ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sleep(lk, &lk->lk);
801040b0:	89 74 24 04          	mov    %esi,0x4(%esp)
801040b4:	89 1c 24             	mov    %ebx,(%esp)
801040b7:	e8 24 fc ff ff       	call   80103ce0 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
801040bc:	8b 03                	mov    (%ebx),%eax
801040be:	85 c0                	test   %eax,%eax
801040c0:	75 ee                	jne    801040b0 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
801040c2:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = proc->pid;
801040c8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801040ce:	8b 40 10             	mov    0x10(%eax),%eax
801040d1:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801040d4:	89 75 08             	mov    %esi,0x8(%ebp)
}
801040d7:	83 c4 10             	add    $0x10,%esp
801040da:	5b                   	pop    %ebx
801040db:	5e                   	pop    %esi
801040dc:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = proc->pid;
  release(&lk->lk);
801040dd:	e9 2e 02 00 00       	jmp    80104310 <release>
801040e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801040e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801040f0 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
801040f0:	55                   	push   %ebp
801040f1:	89 e5                	mov    %esp,%ebp
801040f3:	56                   	push   %esi
801040f4:	53                   	push   %ebx
801040f5:	83 ec 10             	sub    $0x10,%esp
801040f8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801040fb:	8d 73 04             	lea    0x4(%ebx),%esi
801040fe:	89 34 24             	mov    %esi,(%esp)
80104101:	e8 da 00 00 00       	call   801041e0 <acquire>
  lk->locked = 0;
80104106:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010410c:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104113:	89 1c 24             	mov    %ebx,(%esp)
80104116:	e8 65 fd ff ff       	call   80103e80 <wakeup>
  release(&lk->lk);
8010411b:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010411e:	83 c4 10             	add    $0x10,%esp
80104121:	5b                   	pop    %ebx
80104122:	5e                   	pop    %esi
80104123:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104124:	e9 e7 01 00 00       	jmp    80104310 <release>
80104129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104130 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
80104130:	55                   	push   %ebp
80104131:	89 e5                	mov    %esp,%ebp
80104133:	56                   	push   %esi
80104134:	53                   	push   %ebx
80104135:	83 ec 10             	sub    $0x10,%esp
80104138:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010413b:	8d 73 04             	lea    0x4(%ebx),%esi
8010413e:	89 34 24             	mov    %esi,(%esp)
80104141:	e8 9a 00 00 00       	call   801041e0 <acquire>
  r = lk->locked;
80104146:	8b 1b                	mov    (%ebx),%ebx
  release(&lk->lk);
80104148:	89 34 24             	mov    %esi,(%esp)
8010414b:	e8 c0 01 00 00       	call   80104310 <release>
  return r;
}
80104150:	83 c4 10             	add    $0x10,%esp
80104153:	89 d8                	mov    %ebx,%eax
80104155:	5b                   	pop    %ebx
80104156:	5e                   	pop    %esi
80104157:	5d                   	pop    %ebp
80104158:	c3                   	ret    
80104159:	66 90                	xchg   %ax,%ax
8010415b:	66 90                	xchg   %ax,%ax
8010415d:	66 90                	xchg   %ax,%ax
8010415f:	90                   	nop

80104160 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104160:	55                   	push   %ebp
80104161:	89 e5                	mov    %esp,%ebp
80104163:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104166:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104169:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
8010416f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
80104172:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104179:	5d                   	pop    %ebp
8010417a:	c3                   	ret    
8010417b:	90                   	nop
8010417c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104180 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104180:	55                   	push   %ebp
80104181:	89 e5                	mov    %esp,%ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104183:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104186:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104189:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010418a:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
8010418d:	31 c0                	xor    %eax,%eax
8010418f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104190:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104196:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010419c:	77 1a                	ja     801041b8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010419e:	8b 5a 04             	mov    0x4(%edx),%ebx
801041a1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801041a4:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
801041a7:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801041a9:	83 f8 0a             	cmp    $0xa,%eax
801041ac:	75 e2                	jne    80104190 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801041ae:	5b                   	pop    %ebx
801041af:	5d                   	pop    %ebp
801041b0:	c3                   	ret    
801041b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
801041b8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801041bf:	83 c0 01             	add    $0x1,%eax
801041c2:	83 f8 0a             	cmp    $0xa,%eax
801041c5:	74 e7                	je     801041ae <getcallerpcs+0x2e>
    pcs[i] = 0;
801041c7:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801041ce:	83 c0 01             	add    $0x1,%eax
801041d1:	83 f8 0a             	cmp    $0xa,%eax
801041d4:	75 e2                	jne    801041b8 <getcallerpcs+0x38>
801041d6:	eb d6                	jmp    801041ae <getcallerpcs+0x2e>
801041d8:	90                   	nop
801041d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801041e0 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
801041e0:	55                   	push   %ebp
801041e1:	89 e5                	mov    %esp,%ebp
801041e3:	83 ec 18             	sub    $0x18,%esp
801041e6:	9c                   	pushf  
801041e7:	59                   	pop    %ecx
}

static inline void
cli(void)
{
  asm volatile("cli");
801041e8:	fa                   	cli    
{
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
801041e9:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801041ef:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
801041f5:	85 d2                	test   %edx,%edx
801041f7:	75 0c                	jne    80104205 <acquire+0x25>
    cpu->intena = eflags & FL_IF;
801041f9:	81 e1 00 02 00 00    	and    $0x200,%ecx
801041ff:	89 88 b0 00 00 00    	mov    %ecx,0xb0(%eax)
  cpu->ncli += 1;
80104205:	83 c2 01             	add    $0x1,%edx
80104208:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
8010420e:	8b 55 08             	mov    0x8(%ebp),%edx

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104211:	8b 0a                	mov    (%edx),%ecx
80104213:	85 c9                	test   %ecx,%ecx
80104215:	74 05                	je     8010421c <acquire+0x3c>
80104217:	3b 42 08             	cmp    0x8(%edx),%eax
8010421a:	74 3e                	je     8010425a <acquire+0x7a>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
8010421c:	b9 01 00 00 00       	mov    $0x1,%ecx
80104221:	eb 08                	jmp    8010422b <acquire+0x4b>
80104223:	90                   	nop
80104224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104228:	8b 55 08             	mov    0x8(%ebp),%edx
8010422b:	89 c8                	mov    %ecx,%eax
8010422d:	f0 87 02             	lock xchg %eax,(%edx)
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
80104230:	85 c0                	test   %eax,%eax
80104232:	75 f4                	jne    80104228 <acquire+0x48>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
80104234:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104239:	8b 45 08             	mov    0x8(%ebp),%eax
8010423c:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  getcallerpcs(&lk, lk->pcs);
80104243:	83 c0 0c             	add    $0xc,%eax
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104246:	89 50 fc             	mov    %edx,-0x4(%eax)
  getcallerpcs(&lk, lk->pcs);
80104249:	89 44 24 04          	mov    %eax,0x4(%esp)
8010424d:	8d 45 08             	lea    0x8(%ebp),%eax
80104250:	89 04 24             	mov    %eax,(%esp)
80104253:	e8 28 ff ff ff       	call   80104180 <getcallerpcs>
}
80104258:	c9                   	leave  
80104259:	c3                   	ret    
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
8010425a:	c7 04 24 df 73 10 80 	movl   $0x801073df,(%esp)
80104261:	e8 fa c0 ff ff       	call   80100360 <panic>
80104266:	8d 76 00             	lea    0x0(%esi),%esi
80104269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104270 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104270:	55                   	push   %ebp
  return lock->locked && lock->cpu == cpu;
80104271:	31 c0                	xor    %eax,%eax
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104273:	89 e5                	mov    %esp,%ebp
80104275:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == cpu;
80104278:	8b 0a                	mov    (%edx),%ecx
8010427a:	85 c9                	test   %ecx,%ecx
8010427c:	74 0f                	je     8010428d <holding+0x1d>
8010427e:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104284:	39 42 08             	cmp    %eax,0x8(%edx)
80104287:	0f 94 c0             	sete   %al
8010428a:	0f b6 c0             	movzbl %al,%eax
}
8010428d:	5d                   	pop    %ebp
8010428e:	c3                   	ret    
8010428f:	90                   	nop

80104290 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104290:	55                   	push   %ebp
80104291:	89 e5                	mov    %esp,%ebp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104293:	9c                   	pushf  
80104294:	59                   	pop    %ecx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104295:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
80104296:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010429c:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
801042a2:	85 d2                	test   %edx,%edx
801042a4:	75 0c                	jne    801042b2 <pushcli+0x22>
    cpu->intena = eflags & FL_IF;
801042a6:	81 e1 00 02 00 00    	and    $0x200,%ecx
801042ac:	89 88 b0 00 00 00    	mov    %ecx,0xb0(%eax)
  cpu->ncli += 1;
801042b2:	83 c2 01             	add    $0x1,%edx
801042b5:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
}
801042bb:	5d                   	pop    %ebp
801042bc:	c3                   	ret    
801042bd:	8d 76 00             	lea    0x0(%esi),%esi

801042c0 <popcli>:

void
popcli(void)
{
801042c0:	55                   	push   %ebp
801042c1:	89 e5                	mov    %esp,%ebp
801042c3:	83 ec 18             	sub    $0x18,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801042c6:	9c                   	pushf  
801042c7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801042c8:	f6 c4 02             	test   $0x2,%ah
801042cb:	75 34                	jne    80104301 <popcli+0x41>
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
801042cd:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801042d3:	8b 88 ac 00 00 00    	mov    0xac(%eax),%ecx
801042d9:	8d 51 ff             	lea    -0x1(%ecx),%edx
801042dc:	85 d2                	test   %edx,%edx
801042de:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
801042e4:	78 0f                	js     801042f5 <popcli+0x35>
    panic("popcli");
  if(cpu->ncli == 0 && cpu->intena)
801042e6:	75 0b                	jne    801042f3 <popcli+0x33>
801042e8:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
801042ee:	85 c0                	test   %eax,%eax
801042f0:	74 01                	je     801042f3 <popcli+0x33>
}

static inline void
sti(void)
{
  asm volatile("sti");
801042f2:	fb                   	sti    
    sti();
}
801042f3:	c9                   	leave  
801042f4:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
    panic("popcli");
801042f5:	c7 04 24 fe 73 10 80 	movl   $0x801073fe,(%esp)
801042fc:	e8 5f c0 ff ff       	call   80100360 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
80104301:	c7 04 24 e7 73 10 80 	movl   $0x801073e7,(%esp)
80104308:	e8 53 c0 ff ff       	call   80100360 <panic>
8010430d:	8d 76 00             	lea    0x0(%esi),%esi

80104310 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
80104310:	55                   	push   %ebp
80104311:	89 e5                	mov    %esp,%ebp
80104313:	83 ec 18             	sub    $0x18,%esp
80104316:	8b 45 08             	mov    0x8(%ebp),%eax

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104319:	8b 10                	mov    (%eax),%edx
8010431b:	85 d2                	test   %edx,%edx
8010431d:	74 0c                	je     8010432b <release+0x1b>
8010431f:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104326:	39 50 08             	cmp    %edx,0x8(%eax)
80104329:	74 0d                	je     80104338 <release+0x28>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
8010432b:	c7 04 24 05 74 10 80 	movl   $0x80107405,(%esp)
80104332:	e8 29 c0 ff ff       	call   80100360 <panic>
80104337:	90                   	nop

  lk->pcs[0] = 0;
80104338:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
8010433f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
80104346:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
8010434b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  popcli();
}
80104351:	c9                   	leave  
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
80104352:	e9 69 ff ff ff       	jmp    801042c0 <popcli>
80104357:	66 90                	xchg   %ax,%ax
80104359:	66 90                	xchg   %ax,%ax
8010435b:	66 90                	xchg   %ax,%ax
8010435d:	66 90                	xchg   %ax,%ax
8010435f:	90                   	nop

80104360 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104360:	55                   	push   %ebp
80104361:	89 e5                	mov    %esp,%ebp
80104363:	8b 55 08             	mov    0x8(%ebp),%edx
80104366:	57                   	push   %edi
80104367:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010436a:	53                   	push   %ebx
  if ((int)dst%4 == 0 && n%4 == 0){
8010436b:	f6 c2 03             	test   $0x3,%dl
8010436e:	75 05                	jne    80104375 <memset+0x15>
80104370:	f6 c1 03             	test   $0x3,%cl
80104373:	74 13                	je     80104388 <memset+0x28>
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
80104375:	89 d7                	mov    %edx,%edi
80104377:	8b 45 0c             	mov    0xc(%ebp),%eax
8010437a:	fc                   	cld    
8010437b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
8010437d:	5b                   	pop    %ebx
8010437e:	89 d0                	mov    %edx,%eax
80104380:	5f                   	pop    %edi
80104381:	5d                   	pop    %ebp
80104382:	c3                   	ret    
80104383:	90                   	nop
80104384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

void*
memset(void *dst, int c, uint n)
{
  if ((int)dst%4 == 0 && n%4 == 0){
    c &= 0xFF;
80104388:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
8010438c:	c1 e9 02             	shr    $0x2,%ecx
8010438f:	89 f8                	mov    %edi,%eax
80104391:	89 fb                	mov    %edi,%ebx
80104393:	c1 e0 18             	shl    $0x18,%eax
80104396:	c1 e3 10             	shl    $0x10,%ebx
80104399:	09 d8                	or     %ebx,%eax
8010439b:	09 f8                	or     %edi,%eax
8010439d:	c1 e7 08             	shl    $0x8,%edi
801043a0:	09 f8                	or     %edi,%eax
}

static inline void
stosl(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosl" :
801043a2:	89 d7                	mov    %edx,%edi
801043a4:	fc                   	cld    
801043a5:	f3 ab                	rep stos %eax,%es:(%edi)
  } else
    stosb(dst, c, n);
  return dst;
}
801043a7:	5b                   	pop    %ebx
801043a8:	89 d0                	mov    %edx,%eax
801043aa:	5f                   	pop    %edi
801043ab:	5d                   	pop    %ebp
801043ac:	c3                   	ret    
801043ad:	8d 76 00             	lea    0x0(%esi),%esi

801043b0 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
801043b0:	55                   	push   %ebp
801043b1:	89 e5                	mov    %esp,%ebp
801043b3:	8b 45 10             	mov    0x10(%ebp),%eax
801043b6:	57                   	push   %edi
801043b7:	56                   	push   %esi
801043b8:	8b 75 0c             	mov    0xc(%ebp),%esi
801043bb:	53                   	push   %ebx
801043bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801043bf:	85 c0                	test   %eax,%eax
801043c1:	8d 78 ff             	lea    -0x1(%eax),%edi
801043c4:	74 26                	je     801043ec <memcmp+0x3c>
    if(*s1 != *s2)
801043c6:	0f b6 03             	movzbl (%ebx),%eax
801043c9:	31 d2                	xor    %edx,%edx
801043cb:	0f b6 0e             	movzbl (%esi),%ecx
801043ce:	38 c8                	cmp    %cl,%al
801043d0:	74 16                	je     801043e8 <memcmp+0x38>
801043d2:	eb 24                	jmp    801043f8 <memcmp+0x48>
801043d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801043d8:	0f b6 44 13 01       	movzbl 0x1(%ebx,%edx,1),%eax
801043dd:	83 c2 01             	add    $0x1,%edx
801043e0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
801043e4:	38 c8                	cmp    %cl,%al
801043e6:	75 10                	jne    801043f8 <memcmp+0x48>
{
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801043e8:	39 fa                	cmp    %edi,%edx
801043ea:	75 ec                	jne    801043d8 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
801043ec:	5b                   	pop    %ebx
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
801043ed:	31 c0                	xor    %eax,%eax
}
801043ef:	5e                   	pop    %esi
801043f0:	5f                   	pop    %edi
801043f1:	5d                   	pop    %ebp
801043f2:	c3                   	ret    
801043f3:	90                   	nop
801043f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801043f8:	5b                   	pop    %ebx

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
801043f9:	29 c8                	sub    %ecx,%eax
    s1++, s2++;
  }

  return 0;
}
801043fb:	5e                   	pop    %esi
801043fc:	5f                   	pop    %edi
801043fd:	5d                   	pop    %ebp
801043fe:	c3                   	ret    
801043ff:	90                   	nop

80104400 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80104400:	55                   	push   %ebp
80104401:	89 e5                	mov    %esp,%ebp
80104403:	57                   	push   %edi
80104404:	8b 45 08             	mov    0x8(%ebp),%eax
80104407:	56                   	push   %esi
80104408:	8b 75 0c             	mov    0xc(%ebp),%esi
8010440b:	53                   	push   %ebx
8010440c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
8010440f:	39 c6                	cmp    %eax,%esi
80104411:	73 35                	jae    80104448 <memmove+0x48>
80104413:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104416:	39 c8                	cmp    %ecx,%eax
80104418:	73 2e                	jae    80104448 <memmove+0x48>
    s += n;
    d += n;
    while(n-- > 0)
8010441a:	85 db                	test   %ebx,%ebx

  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
8010441c:	8d 3c 18             	lea    (%eax,%ebx,1),%edi
    while(n-- > 0)
8010441f:	8d 53 ff             	lea    -0x1(%ebx),%edx
80104422:	74 1b                	je     8010443f <memmove+0x3f>
80104424:	f7 db                	neg    %ebx
80104426:	8d 34 19             	lea    (%ecx,%ebx,1),%esi
80104429:	01 fb                	add    %edi,%ebx
8010442b:	90                   	nop
8010442c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *--d = *--s;
80104430:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104434:	88 0c 13             	mov    %cl,(%ebx,%edx,1)
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
80104437:	83 ea 01             	sub    $0x1,%edx
8010443a:	83 fa ff             	cmp    $0xffffffff,%edx
8010443d:	75 f1                	jne    80104430 <memmove+0x30>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
8010443f:	5b                   	pop    %ebx
80104440:	5e                   	pop    %esi
80104441:	5f                   	pop    %edi
80104442:	5d                   	pop    %ebp
80104443:	c3                   	ret    
80104444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
80104448:	31 d2                	xor    %edx,%edx
8010444a:	85 db                	test   %ebx,%ebx
8010444c:	74 f1                	je     8010443f <memmove+0x3f>
8010444e:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
80104450:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104454:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104457:	83 c2 01             	add    $0x1,%edx
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
8010445a:	39 da                	cmp    %ebx,%edx
8010445c:	75 f2                	jne    80104450 <memmove+0x50>
      *d++ = *s++;

  return dst;
}
8010445e:	5b                   	pop    %ebx
8010445f:	5e                   	pop    %esi
80104460:	5f                   	pop    %edi
80104461:	5d                   	pop    %ebp
80104462:	c3                   	ret    
80104463:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104470 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104470:	55                   	push   %ebp
80104471:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104473:	5d                   	pop    %ebp

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
80104474:	e9 87 ff ff ff       	jmp    80104400 <memmove>
80104479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104480 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
80104480:	55                   	push   %ebp
80104481:	89 e5                	mov    %esp,%ebp
80104483:	56                   	push   %esi
80104484:	8b 75 10             	mov    0x10(%ebp),%esi
80104487:	53                   	push   %ebx
80104488:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010448b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(n > 0 && *p && *p == *q)
8010448e:	85 f6                	test   %esi,%esi
80104490:	74 30                	je     801044c2 <strncmp+0x42>
80104492:	0f b6 01             	movzbl (%ecx),%eax
80104495:	84 c0                	test   %al,%al
80104497:	74 2f                	je     801044c8 <strncmp+0x48>
80104499:	0f b6 13             	movzbl (%ebx),%edx
8010449c:	38 d0                	cmp    %dl,%al
8010449e:	75 46                	jne    801044e6 <strncmp+0x66>
801044a0:	8d 51 01             	lea    0x1(%ecx),%edx
801044a3:	01 ce                	add    %ecx,%esi
801044a5:	eb 14                	jmp    801044bb <strncmp+0x3b>
801044a7:	90                   	nop
801044a8:	0f b6 02             	movzbl (%edx),%eax
801044ab:	84 c0                	test   %al,%al
801044ad:	74 31                	je     801044e0 <strncmp+0x60>
801044af:	0f b6 19             	movzbl (%ecx),%ebx
801044b2:	83 c2 01             	add    $0x1,%edx
801044b5:	38 d8                	cmp    %bl,%al
801044b7:	75 17                	jne    801044d0 <strncmp+0x50>
    n--, p++, q++;
801044b9:	89 cb                	mov    %ecx,%ebx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
801044bb:	39 f2                	cmp    %esi,%edx
    n--, p++, q++;
801044bd:	8d 4b 01             	lea    0x1(%ebx),%ecx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
801044c0:	75 e6                	jne    801044a8 <strncmp+0x28>
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
801044c2:	5b                   	pop    %ebx
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
801044c3:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}
801044c5:	5e                   	pop    %esi
801044c6:	5d                   	pop    %ebp
801044c7:	c3                   	ret    
801044c8:	0f b6 1b             	movzbl (%ebx),%ebx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
801044cb:	31 c0                	xor    %eax,%eax
801044cd:	8d 76 00             	lea    0x0(%esi),%esi
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
801044d0:	0f b6 d3             	movzbl %bl,%edx
801044d3:	29 d0                	sub    %edx,%eax
}
801044d5:	5b                   	pop    %ebx
801044d6:	5e                   	pop    %esi
801044d7:	5d                   	pop    %ebp
801044d8:	c3                   	ret    
801044d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044e0:	0f b6 5b 01          	movzbl 0x1(%ebx),%ebx
801044e4:	eb ea                	jmp    801044d0 <strncmp+0x50>
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
801044e6:	89 d3                	mov    %edx,%ebx
801044e8:	eb e6                	jmp    801044d0 <strncmp+0x50>
801044ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801044f0 <strncpy>:
  return (uchar)*p - (uchar)*q;
}

char*
strncpy(char *s, const char *t, int n)
{
801044f0:	55                   	push   %ebp
801044f1:	89 e5                	mov    %esp,%ebp
801044f3:	8b 45 08             	mov    0x8(%ebp),%eax
801044f6:	56                   	push   %esi
801044f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
801044fa:	53                   	push   %ebx
801044fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
801044fe:	89 c2                	mov    %eax,%edx
80104500:	eb 19                	jmp    8010451b <strncpy+0x2b>
80104502:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104508:	83 c3 01             	add    $0x1,%ebx
8010450b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010450f:	83 c2 01             	add    $0x1,%edx
80104512:	84 c9                	test   %cl,%cl
80104514:	88 4a ff             	mov    %cl,-0x1(%edx)
80104517:	74 09                	je     80104522 <strncpy+0x32>
80104519:	89 f1                	mov    %esi,%ecx
8010451b:	85 c9                	test   %ecx,%ecx
8010451d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104520:	7f e6                	jg     80104508 <strncpy+0x18>
    ;
  while(n-- > 0)
80104522:	31 c9                	xor    %ecx,%ecx
80104524:	85 f6                	test   %esi,%esi
80104526:	7e 0f                	jle    80104537 <strncpy+0x47>
    *s++ = 0;
80104528:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
8010452c:	89 f3                	mov    %esi,%ebx
8010452e:	83 c1 01             	add    $0x1,%ecx
80104531:	29 cb                	sub    %ecx,%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
80104533:	85 db                	test   %ebx,%ebx
80104535:	7f f1                	jg     80104528 <strncpy+0x38>
    *s++ = 0;
  return os;
}
80104537:	5b                   	pop    %ebx
80104538:	5e                   	pop    %esi
80104539:	5d                   	pop    %ebp
8010453a:	c3                   	ret    
8010453b:	90                   	nop
8010453c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104540 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104546:	56                   	push   %esi
80104547:	8b 45 08             	mov    0x8(%ebp),%eax
8010454a:	53                   	push   %ebx
8010454b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
8010454e:	85 c9                	test   %ecx,%ecx
80104550:	7e 26                	jle    80104578 <safestrcpy+0x38>
80104552:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104556:	89 c1                	mov    %eax,%ecx
80104558:	eb 17                	jmp    80104571 <safestrcpy+0x31>
8010455a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104560:	83 c2 01             	add    $0x1,%edx
80104563:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104567:	83 c1 01             	add    $0x1,%ecx
8010456a:	84 db                	test   %bl,%bl
8010456c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010456f:	74 04                	je     80104575 <safestrcpy+0x35>
80104571:	39 f2                	cmp    %esi,%edx
80104573:	75 eb                	jne    80104560 <safestrcpy+0x20>
    ;
  *s = 0;
80104575:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104578:	5b                   	pop    %ebx
80104579:	5e                   	pop    %esi
8010457a:	5d                   	pop    %ebp
8010457b:	c3                   	ret    
8010457c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104580 <strlen>:

int
strlen(const char *s)
{
80104580:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104581:	31 c0                	xor    %eax,%eax
  return os;
}

int
strlen(const char *s)
{
80104583:	89 e5                	mov    %esp,%ebp
80104585:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
80104588:	80 3a 00             	cmpb   $0x0,(%edx)
8010458b:	74 0c                	je     80104599 <strlen+0x19>
8010458d:	8d 76 00             	lea    0x0(%esi),%esi
80104590:	83 c0 01             	add    $0x1,%eax
80104593:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104597:	75 f7                	jne    80104590 <strlen+0x10>
    ;
  return n;
}
80104599:	5d                   	pop    %ebp
8010459a:	c3                   	ret    

8010459b <swtch>:
8010459b:	8b 44 24 04          	mov    0x4(%esp),%eax
8010459f:	8b 54 24 08          	mov    0x8(%esp),%edx
801045a3:	55                   	push   %ebp
801045a4:	53                   	push   %ebx
801045a5:	56                   	push   %esi
801045a6:	57                   	push   %edi
801045a7:	89 20                	mov    %esp,(%eax)
801045a9:	89 d4                	mov    %edx,%esp
801045ab:	5f                   	pop    %edi
801045ac:	5e                   	pop    %esi
801045ad:	5b                   	pop    %ebx
801045ae:	5d                   	pop    %ebp
801045af:	c3                   	ret    

801045b0 <fetchint>:

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801045b0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
801045b7:	55                   	push   %ebp
801045b8:	89 e5                	mov    %esp,%ebp
801045ba:	8b 45 08             	mov    0x8(%ebp),%eax
  if(addr >= proc->sz || addr+4 > proc->sz)
801045bd:	8b 12                	mov    (%edx),%edx
801045bf:	39 c2                	cmp    %eax,%edx
801045c1:	76 15                	jbe    801045d8 <fetchint+0x28>
801045c3:	8d 48 04             	lea    0x4(%eax),%ecx
801045c6:	39 ca                	cmp    %ecx,%edx
801045c8:	72 0e                	jb     801045d8 <fetchint+0x28>
    return -1;
  *ip = *(int*)(addr);
801045ca:	8b 10                	mov    (%eax),%edx
801045cc:	8b 45 0c             	mov    0xc(%ebp),%eax
801045cf:	89 10                	mov    %edx,(%eax)
  return 0;
801045d1:	31 c0                	xor    %eax,%eax
}
801045d3:	5d                   	pop    %ebp
801045d4:	c3                   	ret    
801045d5:	8d 76 00             	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
801045d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  *ip = *(int*)(addr);
  return 0;
}
801045dd:	5d                   	pop    %ebp
801045de:	c3                   	ret    
801045df:	90                   	nop

801045e0 <fetchstr>:
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
801045e0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801045e6:	55                   	push   %ebp
801045e7:	89 e5                	mov    %esp,%ebp
801045e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  char *s, *ep;

  if(addr >= proc->sz)
801045ec:	39 08                	cmp    %ecx,(%eax)
801045ee:	76 2c                	jbe    8010461c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
801045f0:	8b 55 0c             	mov    0xc(%ebp),%edx
801045f3:	89 c8                	mov    %ecx,%eax
801045f5:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
801045f7:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801045fe:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104600:	39 d1                	cmp    %edx,%ecx
80104602:	73 18                	jae    8010461c <fetchstr+0x3c>
    if(*s == 0)
80104604:	80 39 00             	cmpb   $0x0,(%ecx)
80104607:	75 0c                	jne    80104615 <fetchstr+0x35>
80104609:	eb 1d                	jmp    80104628 <fetchstr+0x48>
8010460b:	90                   	nop
8010460c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104610:	80 38 00             	cmpb   $0x0,(%eax)
80104613:	74 13                	je     80104628 <fetchstr+0x48>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104615:	83 c0 01             	add    $0x1,%eax
80104618:	39 c2                	cmp    %eax,%edx
8010461a:	77 f4                	ja     80104610 <fetchstr+0x30>
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
    return -1;
8010461c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
  return -1;
}
80104621:	5d                   	pop    %ebp
80104622:	c3                   	ret    
80104623:	90                   	nop
80104624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
80104628:	29 c8                	sub    %ecx,%eax
  return -1;
}
8010462a:	5d                   	pop    %ebp
8010462b:	c3                   	ret    
8010462c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104630 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104630:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
}

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104637:	55                   	push   %ebp
80104638:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
8010463a:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010463d:	8b 42 18             	mov    0x18(%edx),%eax

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104640:	8b 12                	mov    (%edx),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104642:	8b 40 44             	mov    0x44(%eax),%eax
80104645:	8d 04 88             	lea    (%eax,%ecx,4),%eax
80104648:	8d 48 04             	lea    0x4(%eax),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
8010464b:	39 d1                	cmp    %edx,%ecx
8010464d:	73 19                	jae    80104668 <argint+0x38>
8010464f:	8d 48 08             	lea    0x8(%eax),%ecx
80104652:	39 ca                	cmp    %ecx,%edx
80104654:	72 12                	jb     80104668 <argint+0x38>
    return -1;
  *ip = *(int*)(addr);
80104656:	8b 50 04             	mov    0x4(%eax),%edx
80104659:	8b 45 0c             	mov    0xc(%ebp),%eax
8010465c:	89 10                	mov    %edx,(%eax)
  return 0;
8010465e:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
80104660:	5d                   	pop    %ebp
80104661:	c3                   	ret    
80104662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104668:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
8010466d:	5d                   	pop    %ebp
8010466e:	c3                   	ret    
8010466f:	90                   	nop

80104670 <argptr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104670:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104676:	55                   	push   %ebp
80104677:	89 e5                	mov    %esp,%ebp
80104679:	53                   	push   %ebx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
8010467a:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010467d:	8b 50 18             	mov    0x18(%eax),%edx
80104680:	8b 52 44             	mov    0x44(%edx),%edx
80104683:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104686:	8b 10                	mov    (%eax),%edx
argptr(int n, char **pp, int size)
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
80104688:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
8010468d:	8d 59 04             	lea    0x4(%ecx),%ebx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104690:	39 d3                	cmp    %edx,%ebx
80104692:	73 25                	jae    801046b9 <argptr+0x49>
80104694:	8d 59 08             	lea    0x8(%ecx),%ebx
80104697:	39 da                	cmp    %ebx,%edx
80104699:	72 1e                	jb     801046b9 <argptr+0x49>
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
8010469b:	8b 5d 10             	mov    0x10(%ebp),%ebx
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
8010469e:	8b 49 04             	mov    0x4(%ecx),%ecx
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
801046a1:	85 db                	test   %ebx,%ebx
801046a3:	78 14                	js     801046b9 <argptr+0x49>
801046a5:	39 d1                	cmp    %edx,%ecx
801046a7:	73 10                	jae    801046b9 <argptr+0x49>
801046a9:	8b 5d 10             	mov    0x10(%ebp),%ebx
801046ac:	01 cb                	add    %ecx,%ebx
801046ae:	39 d3                	cmp    %edx,%ebx
801046b0:	77 07                	ja     801046b9 <argptr+0x49>
    return -1;
  *pp = (char*)i;
801046b2:	8b 45 0c             	mov    0xc(%ebp),%eax
801046b5:	89 08                	mov    %ecx,(%eax)
  return 0;
801046b7:	31 c0                	xor    %eax,%eax
}
801046b9:	5b                   	pop    %ebx
801046ba:	5d                   	pop    %ebp
801046bb:	c3                   	ret    
801046bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801046c0 <argstr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801046c0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801046c6:	55                   	push   %ebp
801046c7:	89 e5                	mov    %esp,%ebp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801046c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801046cc:	8b 50 18             	mov    0x18(%eax),%edx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801046cf:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801046d1:	8b 52 44             	mov    0x44(%edx),%edx
801046d4:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
801046d7:	8d 4a 04             	lea    0x4(%edx),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801046da:	39 c1                	cmp    %eax,%ecx
801046dc:	73 07                	jae    801046e5 <argstr+0x25>
801046de:	8d 4a 08             	lea    0x8(%edx),%ecx
801046e1:	39 c8                	cmp    %ecx,%eax
801046e3:	73 0b                	jae    801046f0 <argstr+0x30>
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
801046e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
801046ea:	5d                   	pop    %ebp
801046eb:	c3                   	ret    
801046ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
801046f0:	8b 4a 04             	mov    0x4(%edx),%ecx
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
801046f3:	39 c1                	cmp    %eax,%ecx
801046f5:	73 ee                	jae    801046e5 <argstr+0x25>
    return -1;
  *pp = (char*)addr;
801046f7:	8b 55 0c             	mov    0xc(%ebp),%edx
801046fa:	89 c8                	mov    %ecx,%eax
801046fc:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
801046fe:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104705:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104707:	39 d1                	cmp    %edx,%ecx
80104709:	73 da                	jae    801046e5 <argstr+0x25>
    if(*s == 0)
8010470b:	80 39 00             	cmpb   $0x0,(%ecx)
8010470e:	75 12                	jne    80104722 <argstr+0x62>
80104710:	eb 1e                	jmp    80104730 <argstr+0x70>
80104712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104718:	80 38 00             	cmpb   $0x0,(%eax)
8010471b:	90                   	nop
8010471c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104720:	74 0e                	je     80104730 <argstr+0x70>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104722:	83 c0 01             	add    $0x1,%eax
80104725:	39 c2                	cmp    %eax,%edx
80104727:	77 ef                	ja     80104718 <argstr+0x58>
80104729:	eb ba                	jmp    801046e5 <argstr+0x25>
8010472b:	90                   	nop
8010472c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(*s == 0)
      return s - *pp;
80104730:	29 c8                	sub    %ecx,%eax
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
80104732:	5d                   	pop    %ebp
80104733:	c3                   	ret    
80104734:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010473a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104740 <syscall>:
[SYS_myhello] sys_myhello,
};

void
syscall(void)
{
80104740:	55                   	push   %ebp
80104741:	89 e5                	mov    %esp,%ebp
80104743:	53                   	push   %ebx
80104744:	83 ec 14             	sub    $0x14,%esp
  int num;

  num = proc->tf->eax;
80104747:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
8010474e:	8b 5a 18             	mov    0x18(%edx),%ebx
80104751:	8b 43 1c             	mov    0x1c(%ebx),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104754:	8d 48 ff             	lea    -0x1(%eax),%ecx
80104757:	83 f9 15             	cmp    $0x15,%ecx
8010475a:	77 1c                	ja     80104778 <syscall+0x38>
8010475c:	8b 0c 85 40 74 10 80 	mov    -0x7fef8bc0(,%eax,4),%ecx
80104763:	85 c9                	test   %ecx,%ecx
80104765:	74 11                	je     80104778 <syscall+0x38>
    proc->tf->eax = syscalls[num]();
80104767:	ff d1                	call   *%ecx
80104769:	89 43 1c             	mov    %eax,0x1c(%ebx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  }
}
8010476c:	83 c4 14             	add    $0x14,%esp
8010476f:	5b                   	pop    %ebx
80104770:	5d                   	pop    %ebp
80104771:	c3                   	ret    
80104772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104778:	89 44 24 0c          	mov    %eax,0xc(%esp)
            proc->pid, proc->name, num);
8010477c:	8d 42 6c             	lea    0x6c(%edx),%eax
8010477f:	89 44 24 08          	mov    %eax,0x8(%esp)

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104783:	8b 42 10             	mov    0x10(%edx),%eax
80104786:	c7 04 24 0d 74 10 80 	movl   $0x8010740d,(%esp)
8010478d:	89 44 24 04          	mov    %eax,0x4(%esp)
80104791:	e8 ba be ff ff       	call   80100650 <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
80104796:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010479c:	8b 40 18             	mov    0x18(%eax),%eax
8010479f:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
801047a6:	83 c4 14             	add    $0x14,%esp
801047a9:	5b                   	pop    %ebx
801047aa:	5d                   	pop    %ebp
801047ab:	c3                   	ret    
801047ac:	66 90                	xchg   %ax,%ax
801047ae:	66 90                	xchg   %ax,%ax

801047b0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801047b0:	55                   	push   %ebp
801047b1:	89 e5                	mov    %esp,%ebp
801047b3:	57                   	push   %edi
801047b4:	56                   	push   %esi
801047b5:	53                   	push   %ebx
801047b6:	83 ec 4c             	sub    $0x4c,%esp
801047b9:	89 4d c0             	mov    %ecx,-0x40(%ebp)
801047bc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801047bf:	8d 5d da             	lea    -0x26(%ebp),%ebx
801047c2:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801047c6:	89 04 24             	mov    %eax,(%esp)
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801047c9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
801047cc:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801047cf:	e8 2c d7 ff ff       	call   80101f00 <nameiparent>
801047d4:	85 c0                	test   %eax,%eax
801047d6:	89 c7                	mov    %eax,%edi
801047d8:	0f 84 da 00 00 00    	je     801048b8 <create+0x108>
    return 0;
  ilock(dp);
801047de:	89 04 24             	mov    %eax,(%esp)
801047e1:	e8 ca ce ff ff       	call   801016b0 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
801047e6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
801047e9:	89 44 24 08          	mov    %eax,0x8(%esp)
801047ed:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801047f1:	89 3c 24             	mov    %edi,(%esp)
801047f4:	e8 a7 d3 ff ff       	call   80101ba0 <dirlookup>
801047f9:	85 c0                	test   %eax,%eax
801047fb:	89 c6                	mov    %eax,%esi
801047fd:	74 41                	je     80104840 <create+0x90>
    iunlockput(dp);
801047ff:	89 3c 24             	mov    %edi,(%esp)
80104802:	e8 e9 d0 ff ff       	call   801018f0 <iunlockput>
    ilock(ip);
80104807:	89 34 24             	mov    %esi,(%esp)
8010480a:	e8 a1 ce ff ff       	call   801016b0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
8010480f:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104814:	75 12                	jne    80104828 <create+0x78>
80104816:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
8010481b:	89 f0                	mov    %esi,%eax
8010481d:	75 09                	jne    80104828 <create+0x78>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
8010481f:	83 c4 4c             	add    $0x4c,%esp
80104822:	5b                   	pop    %ebx
80104823:	5e                   	pop    %esi
80104824:	5f                   	pop    %edi
80104825:	5d                   	pop    %ebp
80104826:	c3                   	ret    
80104827:	90                   	nop
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104828:	89 34 24             	mov    %esi,(%esp)
8010482b:	e8 c0 d0 ff ff       	call   801018f0 <iunlockput>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104830:	83 c4 4c             	add    $0x4c,%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
80104833:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104835:	5b                   	pop    %ebx
80104836:	5e                   	pop    %esi
80104837:	5f                   	pop    %edi
80104838:	5d                   	pop    %ebp
80104839:	c3                   	ret    
8010483a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104840:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104844:	89 44 24 04          	mov    %eax,0x4(%esp)
80104848:	8b 07                	mov    (%edi),%eax
8010484a:	89 04 24             	mov    %eax,(%esp)
8010484d:	e8 ce cc ff ff       	call   80101520 <ialloc>
80104852:	85 c0                	test   %eax,%eax
80104854:	89 c6                	mov    %eax,%esi
80104856:	0f 84 bf 00 00 00    	je     8010491b <create+0x16b>
    panic("create: ialloc");

  ilock(ip);
8010485c:	89 04 24             	mov    %eax,(%esp)
8010485f:	e8 4c ce ff ff       	call   801016b0 <ilock>
  ip->major = major;
80104864:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104868:	66 89 46 52          	mov    %ax,0x52(%esi)
  ip->minor = minor;
8010486c:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104870:	66 89 46 54          	mov    %ax,0x54(%esi)
  ip->nlink = 1;
80104874:	b8 01 00 00 00       	mov    $0x1,%eax
80104879:	66 89 46 56          	mov    %ax,0x56(%esi)
  iupdate(ip);
8010487d:	89 34 24             	mov    %esi,(%esp)
80104880:	e8 6b cd ff ff       	call   801015f0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80104885:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
8010488a:	74 34                	je     801048c0 <create+0x110>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
8010488c:	8b 46 04             	mov    0x4(%esi),%eax
8010488f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104893:	89 3c 24             	mov    %edi,(%esp)
80104896:	89 44 24 08          	mov    %eax,0x8(%esp)
8010489a:	e8 61 d5 ff ff       	call   80101e00 <dirlink>
8010489f:	85 c0                	test   %eax,%eax
801048a1:	78 6c                	js     8010490f <create+0x15f>
    panic("create: dirlink");

  iunlockput(dp);
801048a3:	89 3c 24             	mov    %edi,(%esp)
801048a6:	e8 45 d0 ff ff       	call   801018f0 <iunlockput>

  return ip;
}
801048ab:	83 c4 4c             	add    $0x4c,%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
801048ae:	89 f0                	mov    %esi,%eax
}
801048b0:	5b                   	pop    %ebx
801048b1:	5e                   	pop    %esi
801048b2:	5f                   	pop    %edi
801048b3:	5d                   	pop    %ebp
801048b4:	c3                   	ret    
801048b5:	8d 76 00             	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
801048b8:	31 c0                	xor    %eax,%eax
801048ba:	e9 60 ff ff ff       	jmp    8010481f <create+0x6f>
801048bf:	90                   	nop
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
801048c0:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
801048c5:	89 3c 24             	mov    %edi,(%esp)
801048c8:	e8 23 cd ff ff       	call   801015f0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
801048cd:	8b 46 04             	mov    0x4(%esi),%eax
801048d0:	c7 44 24 04 90 73 10 	movl   $0x80107390,0x4(%esp)
801048d7:	80 
801048d8:	89 34 24             	mov    %esi,(%esp)
801048db:	89 44 24 08          	mov    %eax,0x8(%esp)
801048df:	e8 1c d5 ff ff       	call   80101e00 <dirlink>
801048e4:	85 c0                	test   %eax,%eax
801048e6:	78 1b                	js     80104903 <create+0x153>
801048e8:	8b 47 04             	mov    0x4(%edi),%eax
801048eb:	c7 44 24 04 8f 73 10 	movl   $0x8010738f,0x4(%esp)
801048f2:	80 
801048f3:	89 34 24             	mov    %esi,(%esp)
801048f6:	89 44 24 08          	mov    %eax,0x8(%esp)
801048fa:	e8 01 d5 ff ff       	call   80101e00 <dirlink>
801048ff:	85 c0                	test   %eax,%eax
80104901:	79 89                	jns    8010488c <create+0xdc>
      panic("create dots");
80104903:	c7 04 24 ab 74 10 80 	movl   $0x801074ab,(%esp)
8010490a:	e8 51 ba ff ff       	call   80100360 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
8010490f:	c7 04 24 b7 74 10 80 	movl   $0x801074b7,(%esp)
80104916:	e8 45 ba ff ff       	call   80100360 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
8010491b:	c7 04 24 9c 74 10 80 	movl   $0x8010749c,(%esp)
80104922:	e8 39 ba ff ff       	call   80100360 <panic>
80104927:	89 f6                	mov    %esi,%esi
80104929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104930 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104930:	55                   	push   %ebp
80104931:	89 e5                	mov    %esp,%ebp
80104933:	56                   	push   %esi
80104934:	89 c6                	mov    %eax,%esi
80104936:	53                   	push   %ebx
80104937:	89 d3                	mov    %edx,%ebx
80104939:	83 ec 20             	sub    $0x20,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
8010493c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010493f:	89 44 24 04          	mov    %eax,0x4(%esp)
80104943:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010494a:	e8 e1 fc ff ff       	call   80104630 <argint>
8010494f:	85 c0                	test   %eax,%eax
80104951:	78 35                	js     80104988 <argfd.constprop.0+0x58>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
80104953:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80104956:	83 f9 0f             	cmp    $0xf,%ecx
80104959:	77 2d                	ja     80104988 <argfd.constprop.0+0x58>
8010495b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104961:	8b 44 88 28          	mov    0x28(%eax,%ecx,4),%eax
80104965:	85 c0                	test   %eax,%eax
80104967:	74 1f                	je     80104988 <argfd.constprop.0+0x58>
    return -1;
  if(pfd)
80104969:	85 f6                	test   %esi,%esi
8010496b:	74 02                	je     8010496f <argfd.constprop.0+0x3f>
    *pfd = fd;
8010496d:	89 0e                	mov    %ecx,(%esi)
  if(pf)
8010496f:	85 db                	test   %ebx,%ebx
80104971:	74 0d                	je     80104980 <argfd.constprop.0+0x50>
    *pf = f;
80104973:	89 03                	mov    %eax,(%ebx)
  return 0;
80104975:	31 c0                	xor    %eax,%eax
}
80104977:	83 c4 20             	add    $0x20,%esp
8010497a:	5b                   	pop    %ebx
8010497b:	5e                   	pop    %esi
8010497c:	5d                   	pop    %ebp
8010497d:	c3                   	ret    
8010497e:	66 90                	xchg   %ax,%ax
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
80104980:	31 c0                	xor    %eax,%eax
80104982:	eb f3                	jmp    80104977 <argfd.constprop.0+0x47>
80104984:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80104988:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010498d:	eb e8                	jmp    80104977 <argfd.constprop.0+0x47>
8010498f:	90                   	nop

80104990 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104990:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104991:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104993:	89 e5                	mov    %esp,%ebp
80104995:	53                   	push   %ebx
80104996:	83 ec 24             	sub    $0x24,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104999:	8d 55 f4             	lea    -0xc(%ebp),%edx
8010499c:	e8 8f ff ff ff       	call   80104930 <argfd.constprop.0>
801049a1:	85 c0                	test   %eax,%eax
801049a3:	78 1b                	js     801049c0 <sys_dup+0x30>
    return -1;
  if((fd=fdalloc(f)) < 0)
801049a5:	8b 55 f4             	mov    -0xc(%ebp),%edx
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801049a8:	31 db                	xor    %ebx,%ebx
801049aa:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    if(proc->ofile[fd] == 0){
801049b0:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
801049b4:	85 c9                	test   %ecx,%ecx
801049b6:	74 18                	je     801049d0 <sys_dup+0x40>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801049b8:	83 c3 01             	add    $0x1,%ebx
801049bb:	83 fb 10             	cmp    $0x10,%ebx
801049be:	75 f0                	jne    801049b0 <sys_dup+0x20>
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
801049c0:	83 c4 24             	add    $0x24,%esp
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
801049c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
801049c8:	5b                   	pop    %ebx
801049c9:	5d                   	pop    %ebp
801049ca:	c3                   	ret    
801049cb:	90                   	nop
801049cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
801049d0:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
801049d4:	89 14 24             	mov    %edx,(%esp)
801049d7:	e8 f4 c3 ff ff       	call   80100dd0 <filedup>
  return fd;
}
801049dc:	83 c4 24             	add    $0x24,%esp
  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
801049df:	89 d8                	mov    %ebx,%eax
}
801049e1:	5b                   	pop    %ebx
801049e2:	5d                   	pop    %ebp
801049e3:	c3                   	ret    
801049e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801049ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801049f0 <sys_read>:

int
sys_read(void)
{
801049f0:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801049f1:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
801049f3:	89 e5                	mov    %esp,%ebp
801049f5:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801049f8:	8d 55 ec             	lea    -0x14(%ebp),%edx
801049fb:	e8 30 ff ff ff       	call   80104930 <argfd.constprop.0>
80104a00:	85 c0                	test   %eax,%eax
80104a02:	78 54                	js     80104a58 <sys_read+0x68>
80104a04:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104a07:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a0b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80104a12:	e8 19 fc ff ff       	call   80104630 <argint>
80104a17:	85 c0                	test   %eax,%eax
80104a19:	78 3d                	js     80104a58 <sys_read+0x68>
80104a1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104a1e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104a25:	89 44 24 08          	mov    %eax,0x8(%esp)
80104a29:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a2c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a30:	e8 3b fc ff ff       	call   80104670 <argptr>
80104a35:	85 c0                	test   %eax,%eax
80104a37:	78 1f                	js     80104a58 <sys_read+0x68>
    return -1;
  return fileread(f, p, n);
80104a39:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104a3c:	89 44 24 08          	mov    %eax,0x8(%esp)
80104a40:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a43:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a47:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104a4a:	89 04 24             	mov    %eax,(%esp)
80104a4d:	e8 de c4 ff ff       	call   80100f30 <fileread>
}
80104a52:	c9                   	leave  
80104a53:	c3                   	ret    
80104a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104a58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80104a5d:	c9                   	leave  
80104a5e:	c3                   	ret    
80104a5f:	90                   	nop

80104a60 <sys_write>:

int
sys_write(void)
{
80104a60:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104a61:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104a63:	89 e5                	mov    %esp,%ebp
80104a65:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104a68:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104a6b:	e8 c0 fe ff ff       	call   80104930 <argfd.constprop.0>
80104a70:	85 c0                	test   %eax,%eax
80104a72:	78 54                	js     80104ac8 <sys_write+0x68>
80104a74:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104a77:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a7b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80104a82:	e8 a9 fb ff ff       	call   80104630 <argint>
80104a87:	85 c0                	test   %eax,%eax
80104a89:	78 3d                	js     80104ac8 <sys_write+0x68>
80104a8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104a8e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104a95:	89 44 24 08          	mov    %eax,0x8(%esp)
80104a99:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a9c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104aa0:	e8 cb fb ff ff       	call   80104670 <argptr>
80104aa5:	85 c0                	test   %eax,%eax
80104aa7:	78 1f                	js     80104ac8 <sys_write+0x68>
    return -1;
  return filewrite(f, p, n);
80104aa9:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104aac:	89 44 24 08          	mov    %eax,0x8(%esp)
80104ab0:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104ab3:	89 44 24 04          	mov    %eax,0x4(%esp)
80104ab7:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104aba:	89 04 24             	mov    %eax,(%esp)
80104abd:	e8 0e c5 ff ff       	call   80100fd0 <filewrite>
}
80104ac2:	c9                   	leave  
80104ac3:	c3                   	ret    
80104ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104ac8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80104acd:	c9                   	leave  
80104ace:	c3                   	ret    
80104acf:	90                   	nop

80104ad0 <sys_close>:

int
sys_close(void)
{
80104ad0:	55                   	push   %ebp
80104ad1:	89 e5                	mov    %esp,%ebp
80104ad3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104ad6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104ad9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104adc:	e8 4f fe ff ff       	call   80104930 <argfd.constprop.0>
80104ae1:	85 c0                	test   %eax,%eax
80104ae3:	78 23                	js     80104b08 <sys_close+0x38>
    return -1;
  proc->ofile[fd] = 0;
80104ae5:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104ae8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104aee:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104af5:	00 
  fileclose(f);
80104af6:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104af9:	89 04 24             	mov    %eax,(%esp)
80104afc:	e8 1f c3 ff ff       	call   80100e20 <fileclose>
  return 0;
80104b01:	31 c0                	xor    %eax,%eax
}
80104b03:	c9                   	leave  
80104b04:	c3                   	ret    
80104b05:	8d 76 00             	lea    0x0(%esi),%esi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80104b08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  proc->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80104b0d:	c9                   	leave  
80104b0e:	c3                   	ret    
80104b0f:	90                   	nop

80104b10 <sys_fstat>:

int
sys_fstat(void)
{
80104b10:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104b11:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104b13:	89 e5                	mov    %esp,%ebp
80104b15:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104b18:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104b1b:	e8 10 fe ff ff       	call   80104930 <argfd.constprop.0>
80104b20:	85 c0                	test   %eax,%eax
80104b22:	78 34                	js     80104b58 <sys_fstat+0x48>
80104b24:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b27:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
80104b2e:	00 
80104b2f:	89 44 24 04          	mov    %eax,0x4(%esp)
80104b33:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104b3a:	e8 31 fb ff ff       	call   80104670 <argptr>
80104b3f:	85 c0                	test   %eax,%eax
80104b41:	78 15                	js     80104b58 <sys_fstat+0x48>
    return -1;
  return filestat(f, st);
80104b43:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104b46:	89 44 24 04          	mov    %eax,0x4(%esp)
80104b4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104b4d:	89 04 24             	mov    %eax,(%esp)
80104b50:	e8 8b c3 ff ff       	call   80100ee0 <filestat>
}
80104b55:	c9                   	leave  
80104b56:	c3                   	ret    
80104b57:	90                   	nop
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104b58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80104b5d:	c9                   	leave  
80104b5e:	c3                   	ret    
80104b5f:	90                   	nop

80104b60 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104b60:	55                   	push   %ebp
80104b61:	89 e5                	mov    %esp,%ebp
80104b63:	57                   	push   %edi
80104b64:	56                   	push   %esi
80104b65:	53                   	push   %ebx
80104b66:	83 ec 3c             	sub    $0x3c,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104b69:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104b6c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104b70:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104b77:	e8 44 fb ff ff       	call   801046c0 <argstr>
80104b7c:	85 c0                	test   %eax,%eax
80104b7e:	0f 88 e6 00 00 00    	js     80104c6a <sys_link+0x10a>
80104b84:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104b87:	89 44 24 04          	mov    %eax,0x4(%esp)
80104b8b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104b92:	e8 29 fb ff ff       	call   801046c0 <argstr>
80104b97:	85 c0                	test   %eax,%eax
80104b99:	0f 88 cb 00 00 00    	js     80104c6a <sys_link+0x10a>
    return -1;

  begin_op();
80104b9f:	e8 dc df ff ff       	call   80102b80 <begin_op>
  if((ip = namei(old)) == 0){
80104ba4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80104ba7:	89 04 24             	mov    %eax,(%esp)
80104baa:	e8 31 d3 ff ff       	call   80101ee0 <namei>
80104baf:	85 c0                	test   %eax,%eax
80104bb1:	89 c3                	mov    %eax,%ebx
80104bb3:	0f 84 ac 00 00 00    	je     80104c65 <sys_link+0x105>
    end_op();
    return -1;
  }

  ilock(ip);
80104bb9:	89 04 24             	mov    %eax,(%esp)
80104bbc:	e8 ef ca ff ff       	call   801016b0 <ilock>
  if(ip->type == T_DIR){
80104bc1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104bc6:	0f 84 91 00 00 00    	je     80104c5d <sys_link+0xfd>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
80104bcc:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80104bd1:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80104bd4:	89 1c 24             	mov    %ebx,(%esp)
80104bd7:	e8 14 ca ff ff       	call   801015f0 <iupdate>
  iunlock(ip);
80104bdc:	89 1c 24             	mov    %ebx,(%esp)
80104bdf:	e8 9c cb ff ff       	call   80101780 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80104be4:	8b 45 d0             	mov    -0x30(%ebp),%eax
80104be7:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104beb:	89 04 24             	mov    %eax,(%esp)
80104bee:	e8 0d d3 ff ff       	call   80101f00 <nameiparent>
80104bf3:	85 c0                	test   %eax,%eax
80104bf5:	89 c6                	mov    %eax,%esi
80104bf7:	74 4f                	je     80104c48 <sys_link+0xe8>
    goto bad;
  ilock(dp);
80104bf9:	89 04 24             	mov    %eax,(%esp)
80104bfc:	e8 af ca ff ff       	call   801016b0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104c01:	8b 03                	mov    (%ebx),%eax
80104c03:	39 06                	cmp    %eax,(%esi)
80104c05:	75 39                	jne    80104c40 <sys_link+0xe0>
80104c07:	8b 43 04             	mov    0x4(%ebx),%eax
80104c0a:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104c0e:	89 34 24             	mov    %esi,(%esp)
80104c11:	89 44 24 08          	mov    %eax,0x8(%esp)
80104c15:	e8 e6 d1 ff ff       	call   80101e00 <dirlink>
80104c1a:	85 c0                	test   %eax,%eax
80104c1c:	78 22                	js     80104c40 <sys_link+0xe0>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104c1e:	89 34 24             	mov    %esi,(%esp)
80104c21:	e8 ca cc ff ff       	call   801018f0 <iunlockput>
  iput(ip);
80104c26:	89 1c 24             	mov    %ebx,(%esp)
80104c29:	e8 92 cb ff ff       	call   801017c0 <iput>

  end_op();
80104c2e:	e8 bd df ff ff       	call   80102bf0 <end_op>
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104c33:	83 c4 3c             	add    $0x3c,%esp
  iunlockput(dp);
  iput(ip);

  end_op();

  return 0;
80104c36:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104c38:	5b                   	pop    %ebx
80104c39:	5e                   	pop    %esi
80104c3a:	5f                   	pop    %edi
80104c3b:	5d                   	pop    %ebp
80104c3c:	c3                   	ret    
80104c3d:	8d 76 00             	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80104c40:	89 34 24             	mov    %esi,(%esp)
80104c43:	e8 a8 cc ff ff       	call   801018f0 <iunlockput>
  end_op();

  return 0;

bad:
  ilock(ip);
80104c48:	89 1c 24             	mov    %ebx,(%esp)
80104c4b:	e8 60 ca ff ff       	call   801016b0 <ilock>
  ip->nlink--;
80104c50:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104c55:	89 1c 24             	mov    %ebx,(%esp)
80104c58:	e8 93 c9 ff ff       	call   801015f0 <iupdate>
  iunlockput(ip);
80104c5d:	89 1c 24             	mov    %ebx,(%esp)
80104c60:	e8 8b cc ff ff       	call   801018f0 <iunlockput>
  end_op();
80104c65:	e8 86 df ff ff       	call   80102bf0 <end_op>
  return -1;
}
80104c6a:	83 c4 3c             	add    $0x3c,%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
80104c6d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104c72:	5b                   	pop    %ebx
80104c73:	5e                   	pop    %esi
80104c74:	5f                   	pop    %edi
80104c75:	5d                   	pop    %ebp
80104c76:	c3                   	ret    
80104c77:	89 f6                	mov    %esi,%esi
80104c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c80 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104c80:	55                   	push   %ebp
80104c81:	89 e5                	mov    %esp,%ebp
80104c83:	57                   	push   %edi
80104c84:	56                   	push   %esi
80104c85:	53                   	push   %ebx
80104c86:	83 ec 5c             	sub    $0x5c,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104c89:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104c8c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104c97:	e8 24 fa ff ff       	call   801046c0 <argstr>
80104c9c:	85 c0                	test   %eax,%eax
80104c9e:	0f 88 76 01 00 00    	js     80104e1a <sys_unlink+0x19a>
    return -1;

  begin_op();
80104ca4:	e8 d7 de ff ff       	call   80102b80 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104ca9:	8b 45 c0             	mov    -0x40(%ebp),%eax
80104cac:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104caf:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104cb3:	89 04 24             	mov    %eax,(%esp)
80104cb6:	e8 45 d2 ff ff       	call   80101f00 <nameiparent>
80104cbb:	85 c0                	test   %eax,%eax
80104cbd:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104cc0:	0f 84 4f 01 00 00    	je     80104e15 <sys_unlink+0x195>
    end_op();
    return -1;
  }

  ilock(dp);
80104cc6:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104cc9:	89 34 24             	mov    %esi,(%esp)
80104ccc:	e8 df c9 ff ff       	call   801016b0 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104cd1:	c7 44 24 04 90 73 10 	movl   $0x80107390,0x4(%esp)
80104cd8:	80 
80104cd9:	89 1c 24             	mov    %ebx,(%esp)
80104cdc:	e8 8f ce ff ff       	call   80101b70 <namecmp>
80104ce1:	85 c0                	test   %eax,%eax
80104ce3:	0f 84 21 01 00 00    	je     80104e0a <sys_unlink+0x18a>
80104ce9:	c7 44 24 04 8f 73 10 	movl   $0x8010738f,0x4(%esp)
80104cf0:	80 
80104cf1:	89 1c 24             	mov    %ebx,(%esp)
80104cf4:	e8 77 ce ff ff       	call   80101b70 <namecmp>
80104cf9:	85 c0                	test   %eax,%eax
80104cfb:	0f 84 09 01 00 00    	je     80104e0a <sys_unlink+0x18a>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
80104d01:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104d04:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104d08:	89 44 24 08          	mov    %eax,0x8(%esp)
80104d0c:	89 34 24             	mov    %esi,(%esp)
80104d0f:	e8 8c ce ff ff       	call   80101ba0 <dirlookup>
80104d14:	85 c0                	test   %eax,%eax
80104d16:	89 c3                	mov    %eax,%ebx
80104d18:	0f 84 ec 00 00 00    	je     80104e0a <sys_unlink+0x18a>
    goto bad;
  ilock(ip);
80104d1e:	89 04 24             	mov    %eax,(%esp)
80104d21:	e8 8a c9 ff ff       	call   801016b0 <ilock>

  if(ip->nlink < 1)
80104d26:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104d2b:	0f 8e 24 01 00 00    	jle    80104e55 <sys_unlink+0x1d5>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
80104d31:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104d36:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104d39:	74 7d                	je     80104db8 <sys_unlink+0x138>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
80104d3b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80104d42:	00 
80104d43:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80104d4a:	00 
80104d4b:	89 34 24             	mov    %esi,(%esp)
80104d4e:	e8 0d f6 ff ff       	call   80104360 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104d53:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80104d56:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80104d5d:	00 
80104d5e:	89 74 24 04          	mov    %esi,0x4(%esp)
80104d62:	89 44 24 08          	mov    %eax,0x8(%esp)
80104d66:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104d69:	89 04 24             	mov    %eax,(%esp)
80104d6c:	e8 cf cc ff ff       	call   80101a40 <writei>
80104d71:	83 f8 10             	cmp    $0x10,%eax
80104d74:	0f 85 cf 00 00 00    	jne    80104e49 <sys_unlink+0x1c9>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80104d7a:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104d7f:	0f 84 a3 00 00 00    	je     80104e28 <sys_unlink+0x1a8>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
80104d85:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104d88:	89 04 24             	mov    %eax,(%esp)
80104d8b:	e8 60 cb ff ff       	call   801018f0 <iunlockput>

  ip->nlink--;
80104d90:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104d95:	89 1c 24             	mov    %ebx,(%esp)
80104d98:	e8 53 c8 ff ff       	call   801015f0 <iupdate>
  iunlockput(ip);
80104d9d:	89 1c 24             	mov    %ebx,(%esp)
80104da0:	e8 4b cb ff ff       	call   801018f0 <iunlockput>

  end_op();
80104da5:	e8 46 de ff ff       	call   80102bf0 <end_op>

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80104daa:	83 c4 5c             	add    $0x5c,%esp
  iupdate(ip);
  iunlockput(ip);

  end_op();

  return 0;
80104dad:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80104daf:	5b                   	pop    %ebx
80104db0:	5e                   	pop    %esi
80104db1:	5f                   	pop    %edi
80104db2:	5d                   	pop    %ebp
80104db3:	c3                   	ret    
80104db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80104db8:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104dbc:	0f 86 79 ff ff ff    	jbe    80104d3b <sys_unlink+0xbb>
80104dc2:	bf 20 00 00 00       	mov    $0x20,%edi
80104dc7:	eb 15                	jmp    80104dde <sys_unlink+0x15e>
80104dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104dd0:	8d 57 10             	lea    0x10(%edi),%edx
80104dd3:	3b 53 58             	cmp    0x58(%ebx),%edx
80104dd6:	0f 83 5f ff ff ff    	jae    80104d3b <sys_unlink+0xbb>
80104ddc:	89 d7                	mov    %edx,%edi
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104dde:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80104de5:	00 
80104de6:	89 7c 24 08          	mov    %edi,0x8(%esp)
80104dea:	89 74 24 04          	mov    %esi,0x4(%esp)
80104dee:	89 1c 24             	mov    %ebx,(%esp)
80104df1:	e8 4a cb ff ff       	call   80101940 <readi>
80104df6:	83 f8 10             	cmp    $0x10,%eax
80104df9:	75 42                	jne    80104e3d <sys_unlink+0x1bd>
      panic("isdirempty: readi");
    if(de.inum != 0)
80104dfb:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104e00:	74 ce                	je     80104dd0 <sys_unlink+0x150>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80104e02:	89 1c 24             	mov    %ebx,(%esp)
80104e05:	e8 e6 ca ff ff       	call   801018f0 <iunlockput>
  end_op();

  return 0;

bad:
  iunlockput(dp);
80104e0a:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104e0d:	89 04 24             	mov    %eax,(%esp)
80104e10:	e8 db ca ff ff       	call   801018f0 <iunlockput>
  end_op();
80104e15:	e8 d6 dd ff ff       	call   80102bf0 <end_op>
  return -1;
}
80104e1a:	83 c4 5c             	add    $0x5c,%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80104e1d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e22:	5b                   	pop    %ebx
80104e23:	5e                   	pop    %esi
80104e24:	5f                   	pop    %edi
80104e25:	5d                   	pop    %ebp
80104e26:	c3                   	ret    
80104e27:	90                   	nop

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80104e28:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104e2b:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80104e30:	89 04 24             	mov    %eax,(%esp)
80104e33:	e8 b8 c7 ff ff       	call   801015f0 <iupdate>
80104e38:	e9 48 ff ff ff       	jmp    80104d85 <sys_unlink+0x105>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
80104e3d:	c7 04 24 d9 74 10 80 	movl   $0x801074d9,(%esp)
80104e44:	e8 17 b5 ff ff       	call   80100360 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
80104e49:	c7 04 24 eb 74 10 80 	movl   $0x801074eb,(%esp)
80104e50:	e8 0b b5 ff ff       	call   80100360 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
80104e55:	c7 04 24 c7 74 10 80 	movl   $0x801074c7,(%esp)
80104e5c:	e8 ff b4 ff ff       	call   80100360 <panic>
80104e61:	eb 0d                	jmp    80104e70 <sys_open>
80104e63:	90                   	nop
80104e64:	90                   	nop
80104e65:	90                   	nop
80104e66:	90                   	nop
80104e67:	90                   	nop
80104e68:	90                   	nop
80104e69:	90                   	nop
80104e6a:	90                   	nop
80104e6b:	90                   	nop
80104e6c:	90                   	nop
80104e6d:	90                   	nop
80104e6e:	90                   	nop
80104e6f:	90                   	nop

80104e70 <sys_open>:
  return ip;
}

int
sys_open(void)
{
80104e70:	55                   	push   %ebp
80104e71:	89 e5                	mov    %esp,%ebp
80104e73:	57                   	push   %edi
80104e74:	56                   	push   %esi
80104e75:	53                   	push   %ebx
80104e76:	83 ec 2c             	sub    $0x2c,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80104e79:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104e7c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104e80:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104e87:	e8 34 f8 ff ff       	call   801046c0 <argstr>
80104e8c:	85 c0                	test   %eax,%eax
80104e8e:	0f 88 81 00 00 00    	js     80104f15 <sys_open+0xa5>
80104e94:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104e97:	89 44 24 04          	mov    %eax,0x4(%esp)
80104e9b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104ea2:	e8 89 f7 ff ff       	call   80104630 <argint>
80104ea7:	85 c0                	test   %eax,%eax
80104ea9:	78 6a                	js     80104f15 <sys_open+0xa5>
    return -1;

  begin_op();
80104eab:	e8 d0 dc ff ff       	call   80102b80 <begin_op>

  if(omode & O_CREATE){
80104eb0:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80104eb4:	75 72                	jne    80104f28 <sys_open+0xb8>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80104eb6:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104eb9:	89 04 24             	mov    %eax,(%esp)
80104ebc:	e8 1f d0 ff ff       	call   80101ee0 <namei>
80104ec1:	85 c0                	test   %eax,%eax
80104ec3:	89 c7                	mov    %eax,%edi
80104ec5:	74 49                	je     80104f10 <sys_open+0xa0>
      end_op();
      return -1;
    }
    ilock(ip);
80104ec7:	89 04 24             	mov    %eax,(%esp)
80104eca:	e8 e1 c7 ff ff       	call   801016b0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80104ecf:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80104ed4:	0f 84 ae 00 00 00    	je     80104f88 <sys_open+0x118>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80104eda:	e8 81 be ff ff       	call   80100d60 <filealloc>
80104edf:	85 c0                	test   %eax,%eax
80104ee1:	89 c6                	mov    %eax,%esi
80104ee3:	74 23                	je     80104f08 <sys_open+0x98>
80104ee5:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104eec:	31 db                	xor    %ebx,%ebx
80104eee:	66 90                	xchg   %ax,%ax
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
80104ef0:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
80104ef4:	85 c0                	test   %eax,%eax
80104ef6:	74 50                	je     80104f48 <sys_open+0xd8>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104ef8:	83 c3 01             	add    $0x1,%ebx
80104efb:	83 fb 10             	cmp    $0x10,%ebx
80104efe:	75 f0                	jne    80104ef0 <sys_open+0x80>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
80104f00:	89 34 24             	mov    %esi,(%esp)
80104f03:	e8 18 bf ff ff       	call   80100e20 <fileclose>
    iunlockput(ip);
80104f08:	89 3c 24             	mov    %edi,(%esp)
80104f0b:	e8 e0 c9 ff ff       	call   801018f0 <iunlockput>
    end_op();
80104f10:	e8 db dc ff ff       	call   80102bf0 <end_op>
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
80104f15:	83 c4 2c             	add    $0x2c,%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
80104f18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
80104f1d:	5b                   	pop    %ebx
80104f1e:	5e                   	pop    %esi
80104f1f:	5f                   	pop    %edi
80104f20:	5d                   	pop    %ebp
80104f21:	c3                   	ret    
80104f22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80104f28:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104f2b:	31 c9                	xor    %ecx,%ecx
80104f2d:	ba 02 00 00 00       	mov    $0x2,%edx
80104f32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104f39:	e8 72 f8 ff ff       	call   801047b0 <create>
    if(ip == 0){
80104f3e:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80104f40:	89 c7                	mov    %eax,%edi
    if(ip == 0){
80104f42:	75 96                	jne    80104eda <sys_open+0x6a>
80104f44:	eb ca                	jmp    80104f10 <sys_open+0xa0>
80104f46:	66 90                	xchg   %ax,%ax
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80104f48:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80104f4c:	89 3c 24             	mov    %edi,(%esp)
80104f4f:	e8 2c c8 ff ff       	call   80101780 <iunlock>
  end_op();
80104f54:	e8 97 dc ff ff       	call   80102bf0 <end_op>

  f->type = FD_INODE;
80104f59:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80104f5f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
80104f62:	89 7e 10             	mov    %edi,0x10(%esi)
  f->off = 0;
80104f65:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  f->readable = !(omode & O_WRONLY);
80104f6c:	89 d0                	mov    %edx,%eax
80104f6e:	83 e0 01             	and    $0x1,%eax
80104f71:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104f74:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80104f77:	88 46 08             	mov    %al,0x8(%esi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
80104f7a:	89 d8                	mov    %ebx,%eax

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104f7c:	0f 95 46 09          	setne  0x9(%esi)
  return fd;
}
80104f80:	83 c4 2c             	add    $0x2c,%esp
80104f83:	5b                   	pop    %ebx
80104f84:	5e                   	pop    %esi
80104f85:	5f                   	pop    %edi
80104f86:	5d                   	pop    %ebp
80104f87:	c3                   	ret    
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80104f88:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80104f8b:	85 d2                	test   %edx,%edx
80104f8d:	0f 84 47 ff ff ff    	je     80104eda <sys_open+0x6a>
80104f93:	e9 70 ff ff ff       	jmp    80104f08 <sys_open+0x98>
80104f98:	90                   	nop
80104f99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104fa0 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
80104fa0:	55                   	push   %ebp
80104fa1:	89 e5                	mov    %esp,%ebp
80104fa3:	83 ec 28             	sub    $0x28,%esp
  char *path;
  struct inode *ip;

  begin_op();
80104fa6:	e8 d5 db ff ff       	call   80102b80 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
80104fab:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104fae:	89 44 24 04          	mov    %eax,0x4(%esp)
80104fb2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104fb9:	e8 02 f7 ff ff       	call   801046c0 <argstr>
80104fbe:	85 c0                	test   %eax,%eax
80104fc0:	78 2e                	js     80104ff0 <sys_mkdir+0x50>
80104fc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104fc5:	31 c9                	xor    %ecx,%ecx
80104fc7:	ba 01 00 00 00       	mov    $0x1,%edx
80104fcc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104fd3:	e8 d8 f7 ff ff       	call   801047b0 <create>
80104fd8:	85 c0                	test   %eax,%eax
80104fda:	74 14                	je     80104ff0 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
80104fdc:	89 04 24             	mov    %eax,(%esp)
80104fdf:	e8 0c c9 ff ff       	call   801018f0 <iunlockput>
  end_op();
80104fe4:	e8 07 dc ff ff       	call   80102bf0 <end_op>
  return 0;
80104fe9:	31 c0                	xor    %eax,%eax
}
80104feb:	c9                   	leave  
80104fec:	c3                   	ret    
80104fed:	8d 76 00             	lea    0x0(%esi),%esi
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
80104ff0:	e8 fb db ff ff       	call   80102bf0 <end_op>
    return -1;
80104ff5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
80104ffa:	c9                   	leave  
80104ffb:	c3                   	ret    
80104ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105000 <sys_mknod>:

int
sys_mknod(void)
{
80105000:	55                   	push   %ebp
80105001:	89 e5                	mov    %esp,%ebp
80105003:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105006:	e8 75 db ff ff       	call   80102b80 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010500b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010500e:	89 44 24 04          	mov    %eax,0x4(%esp)
80105012:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105019:	e8 a2 f6 ff ff       	call   801046c0 <argstr>
8010501e:	85 c0                	test   %eax,%eax
80105020:	78 5e                	js     80105080 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105022:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105025:	89 44 24 04          	mov    %eax,0x4(%esp)
80105029:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105030:	e8 fb f5 ff ff       	call   80104630 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
80105035:	85 c0                	test   %eax,%eax
80105037:	78 47                	js     80105080 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105039:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010503c:	89 44 24 04          	mov    %eax,0x4(%esp)
80105040:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80105047:	e8 e4 f5 ff ff       	call   80104630 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
8010504c:	85 c0                	test   %eax,%eax
8010504e:	78 30                	js     80105080 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
80105050:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105054:	ba 03 00 00 00       	mov    $0x3,%edx
     (ip = create(path, T_DEV, major, minor)) == 0){
80105059:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
8010505d:	89 04 24             	mov    %eax,(%esp)
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105060:	8b 45 ec             	mov    -0x14(%ebp),%eax
80105063:	e8 48 f7 ff ff       	call   801047b0 <create>
80105068:	85 c0                	test   %eax,%eax
8010506a:	74 14                	je     80105080 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
8010506c:	89 04 24             	mov    %eax,(%esp)
8010506f:	e8 7c c8 ff ff       	call   801018f0 <iunlockput>
  end_op();
80105074:	e8 77 db ff ff       	call   80102bf0 <end_op>
  return 0;
80105079:	31 c0                	xor    %eax,%eax
}
8010507b:	c9                   	leave  
8010507c:	c3                   	ret    
8010507d:	8d 76 00             	lea    0x0(%esi),%esi
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
80105080:	e8 6b db ff ff       	call   80102bf0 <end_op>
    return -1;
80105085:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010508a:	c9                   	leave  
8010508b:	c3                   	ret    
8010508c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105090 <sys_chdir>:

int
sys_chdir(void)
{
80105090:	55                   	push   %ebp
80105091:	89 e5                	mov    %esp,%ebp
80105093:	53                   	push   %ebx
80105094:	83 ec 24             	sub    $0x24,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105097:	e8 e4 da ff ff       	call   80102b80 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
8010509c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010509f:	89 44 24 04          	mov    %eax,0x4(%esp)
801050a3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801050aa:	e8 11 f6 ff ff       	call   801046c0 <argstr>
801050af:	85 c0                	test   %eax,%eax
801050b1:	78 5a                	js     8010510d <sys_chdir+0x7d>
801050b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801050b6:	89 04 24             	mov    %eax,(%esp)
801050b9:	e8 22 ce ff ff       	call   80101ee0 <namei>
801050be:	85 c0                	test   %eax,%eax
801050c0:	89 c3                	mov    %eax,%ebx
801050c2:	74 49                	je     8010510d <sys_chdir+0x7d>
    end_op();
    return -1;
  }
  ilock(ip);
801050c4:	89 04 24             	mov    %eax,(%esp)
801050c7:	e8 e4 c5 ff ff       	call   801016b0 <ilock>
  if(ip->type != T_DIR){
801050cc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
    iunlockput(ip);
801050d1:	89 1c 24             	mov    %ebx,(%esp)
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
801050d4:	75 32                	jne    80105108 <sys_chdir+0x78>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801050d6:	e8 a5 c6 ff ff       	call   80101780 <iunlock>
  iput(proc->cwd);
801050db:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801050e1:	8b 40 68             	mov    0x68(%eax),%eax
801050e4:	89 04 24             	mov    %eax,(%esp)
801050e7:	e8 d4 c6 ff ff       	call   801017c0 <iput>
  end_op();
801050ec:	e8 ff da ff ff       	call   80102bf0 <end_op>
  proc->cwd = ip;
801050f1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801050f7:	89 58 68             	mov    %ebx,0x68(%eax)
  return 0;
}
801050fa:	83 c4 24             	add    $0x24,%esp
  }
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
  return 0;
801050fd:	31 c0                	xor    %eax,%eax
}
801050ff:	5b                   	pop    %ebx
80105100:	5d                   	pop    %ebp
80105101:	c3                   	ret    
80105102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
80105108:	e8 e3 c7 ff ff       	call   801018f0 <iunlockput>
    end_op();
8010510d:	e8 de da ff ff       	call   80102bf0 <end_op>
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
  return 0;
}
80105112:	83 c4 24             	add    $0x24,%esp
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
    end_op();
    return -1;
80105115:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
  return 0;
}
8010511a:	5b                   	pop    %ebx
8010511b:	5d                   	pop    %ebp
8010511c:	c3                   	ret    
8010511d:	8d 76 00             	lea    0x0(%esi),%esi

80105120 <sys_exec>:

int
sys_exec(void)
{
80105120:	55                   	push   %ebp
80105121:	89 e5                	mov    %esp,%ebp
80105123:	57                   	push   %edi
80105124:	56                   	push   %esi
80105125:	53                   	push   %ebx
80105126:	81 ec ac 00 00 00    	sub    $0xac,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
8010512c:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
80105132:	89 44 24 04          	mov    %eax,0x4(%esp)
80105136:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010513d:	e8 7e f5 ff ff       	call   801046c0 <argstr>
80105142:	85 c0                	test   %eax,%eax
80105144:	0f 88 84 00 00 00    	js     801051ce <sys_exec+0xae>
8010514a:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105150:	89 44 24 04          	mov    %eax,0x4(%esp)
80105154:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010515b:	e8 d0 f4 ff ff       	call   80104630 <argint>
80105160:	85 c0                	test   %eax,%eax
80105162:	78 6a                	js     801051ce <sys_exec+0xae>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105164:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
  for(i=0;; i++){
8010516a:	31 db                	xor    %ebx,%ebx
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
8010516c:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
80105173:	00 
80105174:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
8010517a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105181:	00 
80105182:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105188:	89 04 24             	mov    %eax,(%esp)
8010518b:	e8 d0 f1 ff ff       	call   80104360 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105190:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105196:	89 7c 24 04          	mov    %edi,0x4(%esp)
8010519a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010519d:	89 04 24             	mov    %eax,(%esp)
801051a0:	e8 0b f4 ff ff       	call   801045b0 <fetchint>
801051a5:	85 c0                	test   %eax,%eax
801051a7:	78 25                	js     801051ce <sys_exec+0xae>
      return -1;
    if(uarg == 0){
801051a9:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801051af:	85 c0                	test   %eax,%eax
801051b1:	74 2d                	je     801051e0 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801051b3:	89 74 24 04          	mov    %esi,0x4(%esp)
801051b7:	89 04 24             	mov    %eax,(%esp)
801051ba:	e8 21 f4 ff ff       	call   801045e0 <fetchstr>
801051bf:	85 c0                	test   %eax,%eax
801051c1:	78 0b                	js     801051ce <sys_exec+0xae>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
801051c3:	83 c3 01             	add    $0x1,%ebx
801051c6:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
801051c9:	83 fb 20             	cmp    $0x20,%ebx
801051cc:	75 c2                	jne    80105190 <sys_exec+0x70>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801051ce:	81 c4 ac 00 00 00    	add    $0xac,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
801051d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801051d9:	5b                   	pop    %ebx
801051da:	5e                   	pop    %esi
801051db:	5f                   	pop    %edi
801051dc:	5d                   	pop    %ebp
801051dd:	c3                   	ret    
801051de:	66 90                	xchg   %ax,%ax
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801051e0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801051e6:	89 44 24 04          	mov    %eax,0x4(%esp)
801051ea:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
801051f0:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801051f7:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801051fb:	89 04 24             	mov    %eax,(%esp)
801051fe:	e8 ad b7 ff ff       	call   801009b0 <exec>
}
80105203:	81 c4 ac 00 00 00    	add    $0xac,%esp
80105209:	5b                   	pop    %ebx
8010520a:	5e                   	pop    %esi
8010520b:	5f                   	pop    %edi
8010520c:	5d                   	pop    %ebp
8010520d:	c3                   	ret    
8010520e:	66 90                	xchg   %ax,%ax

80105210 <sys_pipe>:

int
sys_pipe(void)
{
80105210:	55                   	push   %ebp
80105211:	89 e5                	mov    %esp,%ebp
80105213:	57                   	push   %edi
80105214:	56                   	push   %esi
80105215:	53                   	push   %ebx
80105216:	83 ec 2c             	sub    $0x2c,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105219:	8d 45 dc             	lea    -0x24(%ebp),%eax
8010521c:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
80105223:	00 
80105224:	89 44 24 04          	mov    %eax,0x4(%esp)
80105228:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010522f:	e8 3c f4 ff ff       	call   80104670 <argptr>
80105234:	85 c0                	test   %eax,%eax
80105236:	78 7a                	js     801052b2 <sys_pipe+0xa2>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80105238:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010523b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010523f:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105242:	89 04 24             	mov    %eax,(%esp)
80105245:	e8 66 e0 ff ff       	call   801032b0 <pipealloc>
8010524a:	85 c0                	test   %eax,%eax
8010524c:	78 64                	js     801052b2 <sys_pipe+0xa2>
8010524e:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105255:	31 c0                	xor    %eax,%eax
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105257:	8b 5d e0             	mov    -0x20(%ebp),%ebx
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
8010525a:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
8010525e:	85 d2                	test   %edx,%edx
80105260:	74 16                	je     80105278 <sys_pipe+0x68>
80105262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105268:	83 c0 01             	add    $0x1,%eax
8010526b:	83 f8 10             	cmp    $0x10,%eax
8010526e:	74 2f                	je     8010529f <sys_pipe+0x8f>
    if(proc->ofile[fd] == 0){
80105270:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
80105274:	85 d2                	test   %edx,%edx
80105276:	75 f0                	jne    80105268 <sys_pipe+0x58>
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105278:	8b 7d e4             	mov    -0x1c(%ebp),%edi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
8010527b:	8d 70 08             	lea    0x8(%eax),%esi
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
8010527e:	31 d2                	xor    %edx,%edx
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105280:	89 5c b1 08          	mov    %ebx,0x8(%ecx,%esi,4)
80105284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
80105288:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
8010528d:	74 31                	je     801052c0 <sys_pipe+0xb0>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
8010528f:	83 c2 01             	add    $0x1,%edx
80105292:	83 fa 10             	cmp    $0x10,%edx
80105295:	75 f1                	jne    80105288 <sys_pipe+0x78>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
80105297:	c7 44 b1 08 00 00 00 	movl   $0x0,0x8(%ecx,%esi,4)
8010529e:	00 
    fileclose(rf);
8010529f:	89 1c 24             	mov    %ebx,(%esp)
801052a2:	e8 79 bb ff ff       	call   80100e20 <fileclose>
    fileclose(wf);
801052a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801052aa:	89 04 24             	mov    %eax,(%esp)
801052ad:	e8 6e bb ff ff       	call   80100e20 <fileclose>
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
801052b2:	83 c4 2c             	add    $0x2c,%esp
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
801052b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
801052ba:	5b                   	pop    %ebx
801052bb:	5e                   	pop    %esi
801052bc:	5f                   	pop    %edi
801052bd:	5d                   	pop    %ebp
801052be:	c3                   	ret    
801052bf:	90                   	nop
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
801052c0:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
801052c4:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801052c7:	89 01                	mov    %eax,(%ecx)
  fd[1] = fd1;
801052c9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801052cc:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
}
801052cf:	83 c4 2c             	add    $0x2c,%esp
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
801052d2:	31 c0                	xor    %eax,%eax
}
801052d4:	5b                   	pop    %ebx
801052d5:	5e                   	pop    %esi
801052d6:	5f                   	pop    %edi
801052d7:	5d                   	pop    %ebp
801052d8:	c3                   	ret    
801052d9:	66 90                	xchg   %ax,%ax
801052db:	66 90                	xchg   %ax,%ax
801052dd:	66 90                	xchg   %ax,%ax
801052df:	90                   	nop

801052e0 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
801052e0:	55                   	push   %ebp
801052e1:	89 e5                	mov    %esp,%ebp
  return fork();
}
801052e3:	5d                   	pop    %ebp
#include "proc.h"

int
sys_fork(void)
{
  return fork();
801052e4:	e9 17 e6 ff ff       	jmp    80103900 <fork>
801052e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801052f0 <sys_exit>:
}

int
sys_exit(int status) // LAB1 modification
{
801052f0:	55                   	push   %ebp
801052f1:	89 e5                	mov    %esp,%ebp
801052f3:	83 ec 18             	sub    $0x18,%esp
  exit(status);
801052f6:	8b 45 08             	mov    0x8(%ebp),%eax
801052f9:	89 04 24             	mov    %eax,(%esp)
801052fc:	e8 5f e8 ff ff       	call   80103b60 <exit>
  return 0;  // not reached
}
80105301:	31 c0                	xor    %eax,%eax
80105303:	c9                   	leave  
80105304:	c3                   	ret    
80105305:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105310 <sys_wait>:

int
sys_wait(void)
{
80105310:	55                   	push   %ebp
80105311:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105313:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
80105314:	e9 87 ea ff ff       	jmp    80103da0 <wait>
80105319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105320 <sys_kill>:
}

int
sys_kill(void)
{
80105320:	55                   	push   %ebp
80105321:	89 e5                	mov    %esp,%ebp
80105323:	83 ec 28             	sub    $0x28,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105326:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105329:	89 44 24 04          	mov    %eax,0x4(%esp)
8010532d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105334:	e8 f7 f2 ff ff       	call   80104630 <argint>
80105339:	85 c0                	test   %eax,%eax
8010533b:	78 13                	js     80105350 <sys_kill+0x30>
    return -1;
  return kill(pid);
8010533d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105340:	89 04 24             	mov    %eax,(%esp)
80105343:	e8 98 eb ff ff       	call   80103ee0 <kill>
}
80105348:	c9                   	leave  
80105349:	c3                   	ret    
8010534a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
80105350:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
80105355:	c9                   	leave  
80105356:	c3                   	ret    
80105357:	89 f6                	mov    %esi,%esi
80105359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105360 <sys_getpid>:

int
sys_getpid(void)
{
  return proc->pid;
80105360:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return kill(pid);
}

int
sys_getpid(void)
{
80105366:	55                   	push   %ebp
80105367:	89 e5                	mov    %esp,%ebp
  return proc->pid;
}
80105369:	5d                   	pop    %ebp
}

int
sys_getpid(void)
{
  return proc->pid;
8010536a:	8b 40 10             	mov    0x10(%eax),%eax
}
8010536d:	c3                   	ret    
8010536e:	66 90                	xchg   %ax,%ax

80105370 <sys_sbrk>:

int
sys_sbrk(void)
{
80105370:	55                   	push   %ebp
80105371:	89 e5                	mov    %esp,%ebp
80105373:	53                   	push   %ebx
80105374:	83 ec 24             	sub    $0x24,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105377:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010537a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010537e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105385:	e8 a6 f2 ff ff       	call   80104630 <argint>
8010538a:	85 c0                	test   %eax,%eax
8010538c:	78 22                	js     801053b0 <sys_sbrk+0x40>
    return -1;
  addr = proc->sz;
8010538e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(growproc(n) < 0)
80105394:	8b 55 f4             	mov    -0xc(%ebp),%edx
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
80105397:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105399:	89 14 24             	mov    %edx,(%esp)
8010539c:	e8 df e4 ff ff       	call   80103880 <growproc>
801053a1:	85 c0                	test   %eax,%eax
801053a3:	78 0b                	js     801053b0 <sys_sbrk+0x40>
    return -1;
  return addr;
801053a5:	89 d8                	mov    %ebx,%eax
}
801053a7:	83 c4 24             	add    $0x24,%esp
801053aa:	5b                   	pop    %ebx
801053ab:	5d                   	pop    %ebp
801053ac:	c3                   	ret    
801053ad:	8d 76 00             	lea    0x0(%esi),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
801053b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053b5:	eb f0                	jmp    801053a7 <sys_sbrk+0x37>
801053b7:	89 f6                	mov    %esi,%esi
801053b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801053c0 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
801053c0:	55                   	push   %ebp
801053c1:	89 e5                	mov    %esp,%ebp
801053c3:	53                   	push   %ebx
801053c4:	83 ec 24             	sub    $0x24,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801053c7:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053ca:	89 44 24 04          	mov    %eax,0x4(%esp)
801053ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801053d5:	e8 56 f2 ff ff       	call   80104630 <argint>
801053da:	85 c0                	test   %eax,%eax
801053dc:	78 7e                	js     8010545c <sys_sleep+0x9c>
    return -1;
  acquire(&tickslock);
801053de:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
801053e5:	e8 f6 ed ff ff       	call   801041e0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801053ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
801053ed:	8b 1d 20 56 11 80    	mov    0x80115620,%ebx
  while(ticks - ticks0 < n){
801053f3:	85 d2                	test   %edx,%edx
801053f5:	75 29                	jne    80105420 <sys_sleep+0x60>
801053f7:	eb 4f                	jmp    80105448 <sys_sleep+0x88>
801053f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105400:	c7 44 24 04 e0 4d 11 	movl   $0x80114de0,0x4(%esp)
80105407:	80 
80105408:	c7 04 24 20 56 11 80 	movl   $0x80115620,(%esp)
8010540f:	e8 cc e8 ff ff       	call   80103ce0 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105414:	a1 20 56 11 80       	mov    0x80115620,%eax
80105419:	29 d8                	sub    %ebx,%eax
8010541b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010541e:	73 28                	jae    80105448 <sys_sleep+0x88>
    if(proc->killed){
80105420:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105426:	8b 40 24             	mov    0x24(%eax),%eax
80105429:	85 c0                	test   %eax,%eax
8010542b:	74 d3                	je     80105400 <sys_sleep+0x40>
      release(&tickslock);
8010542d:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
80105434:	e8 d7 ee ff ff       	call   80104310 <release>
      return -1;
80105439:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
8010543e:	83 c4 24             	add    $0x24,%esp
80105441:	5b                   	pop    %ebx
80105442:	5d                   	pop    %ebp
80105443:	c3                   	ret    
80105444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105448:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
8010544f:	e8 bc ee ff ff       	call   80104310 <release>
  return 0;
}
80105454:	83 c4 24             	add    $0x24,%esp
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
80105457:	31 c0                	xor    %eax,%eax
}
80105459:	5b                   	pop    %ebx
8010545a:	5d                   	pop    %ebp
8010545b:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
8010545c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105461:	eb db                	jmp    8010543e <sys_sleep+0x7e>
80105463:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105470 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105470:	55                   	push   %ebp
80105471:	89 e5                	mov    %esp,%ebp
80105473:	53                   	push   %ebx
80105474:	83 ec 14             	sub    $0x14,%esp
  uint xticks;

  acquire(&tickslock);
80105477:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
8010547e:	e8 5d ed ff ff       	call   801041e0 <acquire>
  xticks = ticks;
80105483:	8b 1d 20 56 11 80    	mov    0x80115620,%ebx
  release(&tickslock);
80105489:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
80105490:	e8 7b ee ff ff       	call   80104310 <release>
  return xticks;
}
80105495:	83 c4 14             	add    $0x14,%esp
80105498:	89 d8                	mov    %ebx,%eax
8010549a:	5b                   	pop    %ebx
8010549b:	5d                   	pop    %ebp
8010549c:	c3                   	ret    
8010549d:	8d 76 00             	lea    0x0(%esi),%esi

801054a0 <sys_myhello>:

int
sys_myhello(void)
{
801054a0:	55                   	push   %ebp
801054a1:	89 e5                	mov    %esp,%ebp
801054a3:	83 ec 08             	sub    $0x8,%esp
	myhello();
801054a6:	e8 85 eb ff ff       	call   80104030 <myhello>
	return 0;   
}
801054ab:	31 c0                	xor    %eax,%eax
801054ad:	c9                   	leave  
801054ae:	c3                   	ret    
801054af:	90                   	nop

801054b0 <timerinit>:
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first

void
timerinit(void)
{
801054b0:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801054b1:	ba 43 00 00 00       	mov    $0x43,%edx
801054b6:	89 e5                	mov    %esp,%ebp
801054b8:	b8 34 00 00 00       	mov    $0x34,%eax
801054bd:	83 ec 18             	sub    $0x18,%esp
801054c0:	ee                   	out    %al,(%dx)
801054c1:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
801054c6:	b2 40                	mov    $0x40,%dl
801054c8:	ee                   	out    %al,(%dx)
801054c9:	b8 2e 00 00 00       	mov    $0x2e,%eax
801054ce:	ee                   	out    %al,(%dx)
  // Interrupt 100 times/sec.
  outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  outb(IO_TIMER1, TIMER_DIV(100) % 256);
  outb(IO_TIMER1, TIMER_DIV(100) / 256);
  picenable(IRQ_TIMER);
801054cf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801054d6:	e8 15 dd ff ff       	call   801031f0 <picenable>
}
801054db:	c9                   	leave  
801054dc:	c3                   	ret    

801054dd <alltraps>:
801054dd:	1e                   	push   %ds
801054de:	06                   	push   %es
801054df:	0f a0                	push   %fs
801054e1:	0f a8                	push   %gs
801054e3:	60                   	pusha  
801054e4:	66 b8 10 00          	mov    $0x10,%ax
801054e8:	8e d8                	mov    %eax,%ds
801054ea:	8e c0                	mov    %eax,%es
801054ec:	66 b8 18 00          	mov    $0x18,%ax
801054f0:	8e e0                	mov    %eax,%fs
801054f2:	8e e8                	mov    %eax,%gs
801054f4:	54                   	push   %esp
801054f5:	e8 e6 00 00 00       	call   801055e0 <trap>
801054fa:	83 c4 04             	add    $0x4,%esp

801054fd <trapret>:
801054fd:	61                   	popa   
801054fe:	0f a9                	pop    %gs
80105500:	0f a1                	pop    %fs
80105502:	07                   	pop    %es
80105503:	1f                   	pop    %ds
80105504:	83 c4 08             	add    $0x8,%esp
80105507:	cf                   	iret   
80105508:	66 90                	xchg   %ax,%ax
8010550a:	66 90                	xchg   %ax,%ax
8010550c:	66 90                	xchg   %ax,%ax
8010550e:	66 90                	xchg   %ax,%ax

80105510 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105510:	31 c0                	xor    %eax,%eax
80105512:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105518:	8b 14 85 0c a0 10 80 	mov    -0x7fef5ff4(,%eax,4),%edx
8010551f:	b9 08 00 00 00       	mov    $0x8,%ecx
80105524:	66 89 0c c5 22 4e 11 	mov    %cx,-0x7feeb1de(,%eax,8)
8010552b:	80 
8010552c:	c6 04 c5 24 4e 11 80 	movb   $0x0,-0x7feeb1dc(,%eax,8)
80105533:	00 
80105534:	c6 04 c5 25 4e 11 80 	movb   $0x8e,-0x7feeb1db(,%eax,8)
8010553b:	8e 
8010553c:	66 89 14 c5 20 4e 11 	mov    %dx,-0x7feeb1e0(,%eax,8)
80105543:	80 
80105544:	c1 ea 10             	shr    $0x10,%edx
80105547:	66 89 14 c5 26 4e 11 	mov    %dx,-0x7feeb1da(,%eax,8)
8010554e:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
8010554f:	83 c0 01             	add    $0x1,%eax
80105552:	3d 00 01 00 00       	cmp    $0x100,%eax
80105557:	75 bf                	jne    80105518 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105559:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
8010555a:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
8010555f:	89 e5                	mov    %esp,%ebp
80105561:	83 ec 18             	sub    $0x18,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105564:	a1 0c a1 10 80       	mov    0x8010a10c,%eax

  initlock(&tickslock, "time");
80105569:	c7 44 24 04 fa 74 10 	movl   $0x801074fa,0x4(%esp)
80105570:	80 
80105571:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105578:	66 89 15 22 50 11 80 	mov    %dx,0x80115022
8010557f:	66 a3 20 50 11 80    	mov    %ax,0x80115020
80105585:	c1 e8 10             	shr    $0x10,%eax
80105588:	c6 05 24 50 11 80 00 	movb   $0x0,0x80115024
8010558f:	c6 05 25 50 11 80 ef 	movb   $0xef,0x80115025
80105596:	66 a3 26 50 11 80    	mov    %ax,0x80115026

  initlock(&tickslock, "time");
8010559c:	e8 bf eb ff ff       	call   80104160 <initlock>
}
801055a1:	c9                   	leave  
801055a2:	c3                   	ret    
801055a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801055a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055b0 <idtinit>:

void
idtinit(void)
{
801055b0:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
801055b1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
801055b6:	89 e5                	mov    %esp,%ebp
801055b8:	83 ec 10             	sub    $0x10,%esp
801055bb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
801055bf:	b8 20 4e 11 80       	mov    $0x80114e20,%eax
801055c4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
801055c8:	c1 e8 10             	shr    $0x10,%eax
801055cb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
801055cf:	8d 45 fa             	lea    -0x6(%ebp),%eax
801055d2:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
801055d5:	c9                   	leave  
801055d6:	c3                   	ret    
801055d7:	89 f6                	mov    %esi,%esi
801055d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055e0 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
801055e0:	55                   	push   %ebp
801055e1:	89 e5                	mov    %esp,%ebp
801055e3:	57                   	push   %edi
801055e4:	56                   	push   %esi
801055e5:	53                   	push   %ebx
801055e6:	83 ec 2c             	sub    $0x2c,%esp
801055e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
801055ec:	8b 43 30             	mov    0x30(%ebx),%eax
801055ef:	83 f8 40             	cmp    $0x40,%eax
801055f2:	0f 84 08 01 00 00    	je     80105700 <trap+0x120>
    if(proc->killed)
      exit(0);
    return;
  }

  switch(tf->trapno){
801055f8:	83 e8 20             	sub    $0x20,%eax
801055fb:	83 f8 1f             	cmp    $0x1f,%eax
801055fe:	77 60                	ja     80105660 <trap+0x80>
80105600:	ff 24 85 a0 75 10 80 	jmp    *-0x7fef8a60(,%eax,4)
80105607:	90                   	nop
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
80105608:	e8 43 d1 ff ff       	call   80102750 <cpunum>
8010560d:	85 c0                	test   %eax,%eax
8010560f:	90                   	nop
80105610:	0f 84 ea 01 00 00    	je     80105800 <trap+0x220>
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);
    }
    lapiceoi();
80105616:	e8 d5 d1 ff ff       	call   801027f0 <lapiceoi>
8010561b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105621:	85 c0                	test   %eax,%eax
80105623:	74 2d                	je     80105652 <trap+0x72>
80105625:	8b 50 24             	mov    0x24(%eax),%edx
80105628:	85 d2                	test   %edx,%edx
8010562a:	0f 85 9c 00 00 00    	jne    801056cc <trap+0xec>
    exit(0);

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105630:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105634:	0f 84 9e 01 00 00    	je     801057d8 <trap+0x1f8>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
8010563a:	8b 40 24             	mov    0x24(%eax),%eax
8010563d:	85 c0                	test   %eax,%eax
8010563f:	74 11                	je     80105652 <trap+0x72>
80105641:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105645:	83 e0 03             	and    $0x3,%eax
80105648:	66 83 f8 03          	cmp    $0x3,%ax
8010564c:	0f 84 d8 00 00 00    	je     8010572a <trap+0x14a>
    exit(0);
}
80105652:	83 c4 2c             	add    $0x2c,%esp
80105655:	5b                   	pop    %ebx
80105656:	5e                   	pop    %esi
80105657:	5f                   	pop    %edi
80105658:	5d                   	pop    %ebp
80105659:	c3                   	ret    
8010565a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
80105660:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80105667:	85 c9                	test   %ecx,%ecx
80105669:	0f 84 c1 01 00 00    	je     80105830 <trap+0x250>
8010566f:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105673:	0f 84 b7 01 00 00    	je     80105830 <trap+0x250>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105679:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010567c:	8b 73 38             	mov    0x38(%ebx),%esi
8010567f:	e8 cc d0 ff ff       	call   80102750 <cpunum>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105684:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010568b:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
8010568f:	89 74 24 18          	mov    %esi,0x18(%esp)
80105693:	89 44 24 14          	mov    %eax,0x14(%esp)
80105697:	8b 43 34             	mov    0x34(%ebx),%eax
8010569a:	89 44 24 10          	mov    %eax,0x10(%esp)
8010569e:	8b 43 30             	mov    0x30(%ebx),%eax
801056a1:	89 44 24 0c          	mov    %eax,0xc(%esp)
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
801056a5:	8d 42 6c             	lea    0x6c(%edx),%eax
801056a8:	89 44 24 08          	mov    %eax,0x8(%esp)
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801056ac:	8b 42 10             	mov    0x10(%edx),%eax
801056af:	c7 04 24 5c 75 10 80 	movl   $0x8010755c,(%esp)
801056b6:	89 44 24 04          	mov    %eax,0x4(%esp)
801056ba:	e8 91 af ff ff       	call   80100650 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
            rcr2());
    proc->killed = 1;
801056bf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801056c5:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801056cc:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
801056d0:	83 e2 03             	and    $0x3,%edx
801056d3:	66 83 fa 03          	cmp    $0x3,%dx
801056d7:	0f 85 53 ff ff ff    	jne    80105630 <trap+0x50>
    exit(0);
801056dd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801056e4:	e8 77 e4 ff ff       	call   80103b60 <exit>

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
801056e9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801056ef:	85 c0                	test   %eax,%eax
801056f1:	0f 85 39 ff ff ff    	jne    80105630 <trap+0x50>
801056f7:	e9 56 ff ff ff       	jmp    80105652 <trap+0x72>
801056fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
80105700:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105706:	8b 70 24             	mov    0x24(%eax),%esi
80105709:	85 f6                	test   %esi,%esi
8010570b:	0f 85 af 00 00 00    	jne    801057c0 <trap+0x1e0>
      exit(0);
    proc->tf = tf;
80105711:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80105714:	e8 27 f0 ff ff       	call   80104740 <syscall>
    if(proc->killed)
80105719:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010571f:	8b 58 24             	mov    0x24(%eax),%ebx
80105722:	85 db                	test   %ebx,%ebx
80105724:	0f 84 28 ff ff ff    	je     80105652 <trap+0x72>
      exit(0);
8010572a:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit(0);
}
80105731:	83 c4 2c             	add    $0x2c,%esp
80105734:	5b                   	pop    %ebx
80105735:	5e                   	pop    %esi
80105736:	5f                   	pop    %edi
80105737:	5d                   	pop    %ebp
    if(proc->killed)
      exit(0);
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit(0);
80105738:	e9 23 e4 ff ff       	jmp    80103b60 <exit>
8010573d:	8d 76 00             	lea    0x0(%esi),%esi
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105740:	e8 7b ce ff ff       	call   801025c0 <kbdintr>
    lapiceoi();
80105745:	e8 a6 d0 ff ff       	call   801027f0 <lapiceoi>
8010574a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
80105750:	e9 cc fe ff ff       	jmp    80105621 <trap+0x41>
80105755:	8d 76 00             	lea    0x0(%esi),%esi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105758:	e8 13 c9 ff ff       	call   80102070 <ideintr>
    lapiceoi();
8010575d:	e8 8e d0 ff ff       	call   801027f0 <lapiceoi>
80105762:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
80105768:	e9 b4 fe ff ff       	jmp    80105621 <trap+0x41>
8010576d:	8d 76 00             	lea    0x0(%esi),%esi
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105770:	e8 2b 02 00 00       	call   801059a0 <uartintr>
    lapiceoi();
80105775:	e8 76 d0 ff ff       	call   801027f0 <lapiceoi>
8010577a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
80105780:	e9 9c fe ff ff       	jmp    80105621 <trap+0x41>
80105785:	8d 76 00             	lea    0x0(%esi),%esi
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105788:	8b 7b 38             	mov    0x38(%ebx),%edi
8010578b:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
8010578f:	e8 bc cf ff ff       	call   80102750 <cpunum>
80105794:	c7 04 24 04 75 10 80 	movl   $0x80107504,(%esp)
8010579b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
8010579f:	89 74 24 08          	mov    %esi,0x8(%esp)
801057a3:	89 44 24 04          	mov    %eax,0x4(%esp)
801057a7:	e8 a4 ae ff ff       	call   80100650 <cprintf>
            cpunum(), tf->cs, tf->eip);
    lapiceoi();
801057ac:	e8 3f d0 ff ff       	call   801027f0 <lapiceoi>
801057b1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
801057b7:	e9 65 fe ff ff       	jmp    80105621 <trap+0x41>
801057bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
      exit(0);
801057c0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801057c7:	e8 94 e3 ff ff       	call   80103b60 <exit>
801057cc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801057d2:	e9 3a ff ff ff       	jmp    80105711 <trap+0x131>
801057d7:	90                   	nop
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit(0);

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
801057d8:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
801057dc:	0f 85 58 fe ff ff    	jne    8010563a <trap+0x5a>
    yield();
801057e2:	e8 b9 e4 ff ff       	call   80103ca0 <yield>

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801057e7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801057ed:	85 c0                	test   %eax,%eax
801057ef:	0f 85 45 fe ff ff    	jne    8010563a <trap+0x5a>
801057f5:	e9 58 fe ff ff       	jmp    80105652 <trap+0x72>
801057fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
80105800:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
80105807:	e8 d4 e9 ff ff       	call   801041e0 <acquire>
      ticks++;
      wakeup(&ticks);
8010580c:	c7 04 24 20 56 11 80 	movl   $0x80115620,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
      ticks++;
80105813:	83 05 20 56 11 80 01 	addl   $0x1,0x80115620
      wakeup(&ticks);
8010581a:	e8 61 e6 ff ff       	call   80103e80 <wakeup>
      release(&tickslock);
8010581f:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
80105826:	e8 e5 ea ff ff       	call   80104310 <release>
8010582b:	e9 e6 fd ff ff       	jmp    80105616 <trap+0x36>
80105830:	0f 20 d7             	mov    %cr2,%edi

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105833:	8b 73 38             	mov    0x38(%ebx),%esi
80105836:	e8 15 cf ff ff       	call   80102750 <cpunum>
8010583b:	89 7c 24 10          	mov    %edi,0x10(%esp)
8010583f:	89 74 24 0c          	mov    %esi,0xc(%esp)
80105843:	89 44 24 08          	mov    %eax,0x8(%esp)
80105847:	8b 43 30             	mov    0x30(%ebx),%eax
8010584a:	c7 04 24 28 75 10 80 	movl   $0x80107528,(%esp)
80105851:	89 44 24 04          	mov    %eax,0x4(%esp)
80105855:	e8 f6 ad ff ff       	call   80100650 <cprintf>
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
8010585a:	c7 04 24 ff 74 10 80 	movl   $0x801074ff,(%esp)
80105861:	e8 fa aa ff ff       	call   80100360 <panic>
80105866:	66 90                	xchg   %ax,%ax
80105868:	66 90                	xchg   %ax,%ax
8010586a:	66 90                	xchg   %ax,%ax
8010586c:	66 90                	xchg   %ax,%ax
8010586e:	66 90                	xchg   %ax,%ax

80105870 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105870:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
80105875:	55                   	push   %ebp
80105876:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105878:	85 c0                	test   %eax,%eax
8010587a:	74 14                	je     80105890 <uartgetc+0x20>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010587c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105881:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105882:	a8 01                	test   $0x1,%al
80105884:	74 0a                	je     80105890 <uartgetc+0x20>
80105886:	b2 f8                	mov    $0xf8,%dl
80105888:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105889:	0f b6 c0             	movzbl %al,%eax
}
8010588c:	5d                   	pop    %ebp
8010588d:	c3                   	ret    
8010588e:	66 90                	xchg   %ax,%ax

static int
uartgetc(void)
{
  if(!uart)
    return -1;
80105890:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
80105895:	5d                   	pop    %ebp
80105896:	c3                   	ret    
80105897:	89 f6                	mov    %esi,%esi
80105899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801058a0 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
801058a0:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
801058a5:	85 c0                	test   %eax,%eax
801058a7:	74 3f                	je     801058e8 <uartputc+0x48>
    uartputc(*p);
}

void
uartputc(int c)
{
801058a9:	55                   	push   %ebp
801058aa:	89 e5                	mov    %esp,%ebp
801058ac:	56                   	push   %esi
801058ad:	be fd 03 00 00       	mov    $0x3fd,%esi
801058b2:	53                   	push   %ebx
  int i;

  if(!uart)
801058b3:	bb 80 00 00 00       	mov    $0x80,%ebx
    uartputc(*p);
}

void
uartputc(int c)
{
801058b8:	83 ec 10             	sub    $0x10,%esp
801058bb:	eb 14                	jmp    801058d1 <uartputc+0x31>
801058bd:	8d 76 00             	lea    0x0(%esi),%esi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
801058c0:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
801058c7:	e8 44 cf ff ff       	call   80102810 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
801058cc:	83 eb 01             	sub    $0x1,%ebx
801058cf:	74 07                	je     801058d8 <uartputc+0x38>
801058d1:	89 f2                	mov    %esi,%edx
801058d3:	ec                   	in     (%dx),%al
801058d4:	a8 20                	test   $0x20,%al
801058d6:	74 e8                	je     801058c0 <uartputc+0x20>
    microdelay(10);
  outb(COM1+0, c);
801058d8:	0f b6 45 08          	movzbl 0x8(%ebp),%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801058dc:	ba f8 03 00 00       	mov    $0x3f8,%edx
801058e1:	ee                   	out    %al,(%dx)
}
801058e2:	83 c4 10             	add    $0x10,%esp
801058e5:	5b                   	pop    %ebx
801058e6:	5e                   	pop    %esi
801058e7:	5d                   	pop    %ebp
801058e8:	f3 c3                	repz ret 
801058ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801058f0 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
801058f0:	55                   	push   %ebp
801058f1:	31 c9                	xor    %ecx,%ecx
801058f3:	89 e5                	mov    %esp,%ebp
801058f5:	89 c8                	mov    %ecx,%eax
801058f7:	57                   	push   %edi
801058f8:	bf fa 03 00 00       	mov    $0x3fa,%edi
801058fd:	56                   	push   %esi
801058fe:	89 fa                	mov    %edi,%edx
80105900:	53                   	push   %ebx
80105901:	83 ec 1c             	sub    $0x1c,%esp
80105904:	ee                   	out    %al,(%dx)
80105905:	be fb 03 00 00       	mov    $0x3fb,%esi
8010590a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
8010590f:	89 f2                	mov    %esi,%edx
80105911:	ee                   	out    %al,(%dx)
80105912:	b8 0c 00 00 00       	mov    $0xc,%eax
80105917:	b2 f8                	mov    $0xf8,%dl
80105919:	ee                   	out    %al,(%dx)
8010591a:	bb f9 03 00 00       	mov    $0x3f9,%ebx
8010591f:	89 c8                	mov    %ecx,%eax
80105921:	89 da                	mov    %ebx,%edx
80105923:	ee                   	out    %al,(%dx)
80105924:	b8 03 00 00 00       	mov    $0x3,%eax
80105929:	89 f2                	mov    %esi,%edx
8010592b:	ee                   	out    %al,(%dx)
8010592c:	b2 fc                	mov    $0xfc,%dl
8010592e:	89 c8                	mov    %ecx,%eax
80105930:	ee                   	out    %al,(%dx)
80105931:	b8 01 00 00 00       	mov    $0x1,%eax
80105936:	89 da                	mov    %ebx,%edx
80105938:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105939:	b2 fd                	mov    $0xfd,%dl
8010593b:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
8010593c:	3c ff                	cmp    $0xff,%al
8010593e:	74 52                	je     80105992 <uartinit+0xa2>
    return;
  uart = 1;
80105940:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105947:	00 00 00 
8010594a:	89 fa                	mov    %edi,%edx
8010594c:	ec                   	in     (%dx),%al
8010594d:	b2 f8                	mov    $0xf8,%dl
8010594f:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
80105950:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105957:	bb 20 76 10 80       	mov    $0x80107620,%ebx

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
8010595c:	e8 8f d8 ff ff       	call   801031f0 <picenable>
  ioapicenable(IRQ_COM1, 0);
80105961:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105968:	00 
80105969:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
80105970:	e8 2b c9 ff ff       	call   801022a0 <ioapicenable>

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105975:	b8 78 00 00 00       	mov    $0x78,%eax
8010597a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    uartputc(*p);
80105980:	89 04 24             	mov    %eax,(%esp)
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105983:	83 c3 01             	add    $0x1,%ebx
    uartputc(*p);
80105986:	e8 15 ff ff ff       	call   801058a0 <uartputc>
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
8010598b:	0f be 03             	movsbl (%ebx),%eax
8010598e:	84 c0                	test   %al,%al
80105990:	75 ee                	jne    80105980 <uartinit+0x90>
    uartputc(*p);
}
80105992:	83 c4 1c             	add    $0x1c,%esp
80105995:	5b                   	pop    %ebx
80105996:	5e                   	pop    %esi
80105997:	5f                   	pop    %edi
80105998:	5d                   	pop    %ebp
80105999:	c3                   	ret    
8010599a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801059a0 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
801059a0:	55                   	push   %ebp
801059a1:	89 e5                	mov    %esp,%ebp
801059a3:	83 ec 18             	sub    $0x18,%esp
  consoleintr(uartgetc);
801059a6:	c7 04 24 70 58 10 80 	movl   $0x80105870,(%esp)
801059ad:	e8 fe ad ff ff       	call   801007b0 <consoleintr>
}
801059b2:	c9                   	leave  
801059b3:	c3                   	ret    

801059b4 <vector0>:
801059b4:	6a 00                	push   $0x0
801059b6:	6a 00                	push   $0x0
801059b8:	e9 20 fb ff ff       	jmp    801054dd <alltraps>

801059bd <vector1>:
801059bd:	6a 00                	push   $0x0
801059bf:	6a 01                	push   $0x1
801059c1:	e9 17 fb ff ff       	jmp    801054dd <alltraps>

801059c6 <vector2>:
801059c6:	6a 00                	push   $0x0
801059c8:	6a 02                	push   $0x2
801059ca:	e9 0e fb ff ff       	jmp    801054dd <alltraps>

801059cf <vector3>:
801059cf:	6a 00                	push   $0x0
801059d1:	6a 03                	push   $0x3
801059d3:	e9 05 fb ff ff       	jmp    801054dd <alltraps>

801059d8 <vector4>:
801059d8:	6a 00                	push   $0x0
801059da:	6a 04                	push   $0x4
801059dc:	e9 fc fa ff ff       	jmp    801054dd <alltraps>

801059e1 <vector5>:
801059e1:	6a 00                	push   $0x0
801059e3:	6a 05                	push   $0x5
801059e5:	e9 f3 fa ff ff       	jmp    801054dd <alltraps>

801059ea <vector6>:
801059ea:	6a 00                	push   $0x0
801059ec:	6a 06                	push   $0x6
801059ee:	e9 ea fa ff ff       	jmp    801054dd <alltraps>

801059f3 <vector7>:
801059f3:	6a 00                	push   $0x0
801059f5:	6a 07                	push   $0x7
801059f7:	e9 e1 fa ff ff       	jmp    801054dd <alltraps>

801059fc <vector8>:
801059fc:	6a 08                	push   $0x8
801059fe:	e9 da fa ff ff       	jmp    801054dd <alltraps>

80105a03 <vector9>:
80105a03:	6a 00                	push   $0x0
80105a05:	6a 09                	push   $0x9
80105a07:	e9 d1 fa ff ff       	jmp    801054dd <alltraps>

80105a0c <vector10>:
80105a0c:	6a 0a                	push   $0xa
80105a0e:	e9 ca fa ff ff       	jmp    801054dd <alltraps>

80105a13 <vector11>:
80105a13:	6a 0b                	push   $0xb
80105a15:	e9 c3 fa ff ff       	jmp    801054dd <alltraps>

80105a1a <vector12>:
80105a1a:	6a 0c                	push   $0xc
80105a1c:	e9 bc fa ff ff       	jmp    801054dd <alltraps>

80105a21 <vector13>:
80105a21:	6a 0d                	push   $0xd
80105a23:	e9 b5 fa ff ff       	jmp    801054dd <alltraps>

80105a28 <vector14>:
80105a28:	6a 0e                	push   $0xe
80105a2a:	e9 ae fa ff ff       	jmp    801054dd <alltraps>

80105a2f <vector15>:
80105a2f:	6a 00                	push   $0x0
80105a31:	6a 0f                	push   $0xf
80105a33:	e9 a5 fa ff ff       	jmp    801054dd <alltraps>

80105a38 <vector16>:
80105a38:	6a 00                	push   $0x0
80105a3a:	6a 10                	push   $0x10
80105a3c:	e9 9c fa ff ff       	jmp    801054dd <alltraps>

80105a41 <vector17>:
80105a41:	6a 11                	push   $0x11
80105a43:	e9 95 fa ff ff       	jmp    801054dd <alltraps>

80105a48 <vector18>:
80105a48:	6a 00                	push   $0x0
80105a4a:	6a 12                	push   $0x12
80105a4c:	e9 8c fa ff ff       	jmp    801054dd <alltraps>

80105a51 <vector19>:
80105a51:	6a 00                	push   $0x0
80105a53:	6a 13                	push   $0x13
80105a55:	e9 83 fa ff ff       	jmp    801054dd <alltraps>

80105a5a <vector20>:
80105a5a:	6a 00                	push   $0x0
80105a5c:	6a 14                	push   $0x14
80105a5e:	e9 7a fa ff ff       	jmp    801054dd <alltraps>

80105a63 <vector21>:
80105a63:	6a 00                	push   $0x0
80105a65:	6a 15                	push   $0x15
80105a67:	e9 71 fa ff ff       	jmp    801054dd <alltraps>

80105a6c <vector22>:
80105a6c:	6a 00                	push   $0x0
80105a6e:	6a 16                	push   $0x16
80105a70:	e9 68 fa ff ff       	jmp    801054dd <alltraps>

80105a75 <vector23>:
80105a75:	6a 00                	push   $0x0
80105a77:	6a 17                	push   $0x17
80105a79:	e9 5f fa ff ff       	jmp    801054dd <alltraps>

80105a7e <vector24>:
80105a7e:	6a 00                	push   $0x0
80105a80:	6a 18                	push   $0x18
80105a82:	e9 56 fa ff ff       	jmp    801054dd <alltraps>

80105a87 <vector25>:
80105a87:	6a 00                	push   $0x0
80105a89:	6a 19                	push   $0x19
80105a8b:	e9 4d fa ff ff       	jmp    801054dd <alltraps>

80105a90 <vector26>:
80105a90:	6a 00                	push   $0x0
80105a92:	6a 1a                	push   $0x1a
80105a94:	e9 44 fa ff ff       	jmp    801054dd <alltraps>

80105a99 <vector27>:
80105a99:	6a 00                	push   $0x0
80105a9b:	6a 1b                	push   $0x1b
80105a9d:	e9 3b fa ff ff       	jmp    801054dd <alltraps>

80105aa2 <vector28>:
80105aa2:	6a 00                	push   $0x0
80105aa4:	6a 1c                	push   $0x1c
80105aa6:	e9 32 fa ff ff       	jmp    801054dd <alltraps>

80105aab <vector29>:
80105aab:	6a 00                	push   $0x0
80105aad:	6a 1d                	push   $0x1d
80105aaf:	e9 29 fa ff ff       	jmp    801054dd <alltraps>

80105ab4 <vector30>:
80105ab4:	6a 00                	push   $0x0
80105ab6:	6a 1e                	push   $0x1e
80105ab8:	e9 20 fa ff ff       	jmp    801054dd <alltraps>

80105abd <vector31>:
80105abd:	6a 00                	push   $0x0
80105abf:	6a 1f                	push   $0x1f
80105ac1:	e9 17 fa ff ff       	jmp    801054dd <alltraps>

80105ac6 <vector32>:
80105ac6:	6a 00                	push   $0x0
80105ac8:	6a 20                	push   $0x20
80105aca:	e9 0e fa ff ff       	jmp    801054dd <alltraps>

80105acf <vector33>:
80105acf:	6a 00                	push   $0x0
80105ad1:	6a 21                	push   $0x21
80105ad3:	e9 05 fa ff ff       	jmp    801054dd <alltraps>

80105ad8 <vector34>:
80105ad8:	6a 00                	push   $0x0
80105ada:	6a 22                	push   $0x22
80105adc:	e9 fc f9 ff ff       	jmp    801054dd <alltraps>

80105ae1 <vector35>:
80105ae1:	6a 00                	push   $0x0
80105ae3:	6a 23                	push   $0x23
80105ae5:	e9 f3 f9 ff ff       	jmp    801054dd <alltraps>

80105aea <vector36>:
80105aea:	6a 00                	push   $0x0
80105aec:	6a 24                	push   $0x24
80105aee:	e9 ea f9 ff ff       	jmp    801054dd <alltraps>

80105af3 <vector37>:
80105af3:	6a 00                	push   $0x0
80105af5:	6a 25                	push   $0x25
80105af7:	e9 e1 f9 ff ff       	jmp    801054dd <alltraps>

80105afc <vector38>:
80105afc:	6a 00                	push   $0x0
80105afe:	6a 26                	push   $0x26
80105b00:	e9 d8 f9 ff ff       	jmp    801054dd <alltraps>

80105b05 <vector39>:
80105b05:	6a 00                	push   $0x0
80105b07:	6a 27                	push   $0x27
80105b09:	e9 cf f9 ff ff       	jmp    801054dd <alltraps>

80105b0e <vector40>:
80105b0e:	6a 00                	push   $0x0
80105b10:	6a 28                	push   $0x28
80105b12:	e9 c6 f9 ff ff       	jmp    801054dd <alltraps>

80105b17 <vector41>:
80105b17:	6a 00                	push   $0x0
80105b19:	6a 29                	push   $0x29
80105b1b:	e9 bd f9 ff ff       	jmp    801054dd <alltraps>

80105b20 <vector42>:
80105b20:	6a 00                	push   $0x0
80105b22:	6a 2a                	push   $0x2a
80105b24:	e9 b4 f9 ff ff       	jmp    801054dd <alltraps>

80105b29 <vector43>:
80105b29:	6a 00                	push   $0x0
80105b2b:	6a 2b                	push   $0x2b
80105b2d:	e9 ab f9 ff ff       	jmp    801054dd <alltraps>

80105b32 <vector44>:
80105b32:	6a 00                	push   $0x0
80105b34:	6a 2c                	push   $0x2c
80105b36:	e9 a2 f9 ff ff       	jmp    801054dd <alltraps>

80105b3b <vector45>:
80105b3b:	6a 00                	push   $0x0
80105b3d:	6a 2d                	push   $0x2d
80105b3f:	e9 99 f9 ff ff       	jmp    801054dd <alltraps>

80105b44 <vector46>:
80105b44:	6a 00                	push   $0x0
80105b46:	6a 2e                	push   $0x2e
80105b48:	e9 90 f9 ff ff       	jmp    801054dd <alltraps>

80105b4d <vector47>:
80105b4d:	6a 00                	push   $0x0
80105b4f:	6a 2f                	push   $0x2f
80105b51:	e9 87 f9 ff ff       	jmp    801054dd <alltraps>

80105b56 <vector48>:
80105b56:	6a 00                	push   $0x0
80105b58:	6a 30                	push   $0x30
80105b5a:	e9 7e f9 ff ff       	jmp    801054dd <alltraps>

80105b5f <vector49>:
80105b5f:	6a 00                	push   $0x0
80105b61:	6a 31                	push   $0x31
80105b63:	e9 75 f9 ff ff       	jmp    801054dd <alltraps>

80105b68 <vector50>:
80105b68:	6a 00                	push   $0x0
80105b6a:	6a 32                	push   $0x32
80105b6c:	e9 6c f9 ff ff       	jmp    801054dd <alltraps>

80105b71 <vector51>:
80105b71:	6a 00                	push   $0x0
80105b73:	6a 33                	push   $0x33
80105b75:	e9 63 f9 ff ff       	jmp    801054dd <alltraps>

80105b7a <vector52>:
80105b7a:	6a 00                	push   $0x0
80105b7c:	6a 34                	push   $0x34
80105b7e:	e9 5a f9 ff ff       	jmp    801054dd <alltraps>

80105b83 <vector53>:
80105b83:	6a 00                	push   $0x0
80105b85:	6a 35                	push   $0x35
80105b87:	e9 51 f9 ff ff       	jmp    801054dd <alltraps>

80105b8c <vector54>:
80105b8c:	6a 00                	push   $0x0
80105b8e:	6a 36                	push   $0x36
80105b90:	e9 48 f9 ff ff       	jmp    801054dd <alltraps>

80105b95 <vector55>:
80105b95:	6a 00                	push   $0x0
80105b97:	6a 37                	push   $0x37
80105b99:	e9 3f f9 ff ff       	jmp    801054dd <alltraps>

80105b9e <vector56>:
80105b9e:	6a 00                	push   $0x0
80105ba0:	6a 38                	push   $0x38
80105ba2:	e9 36 f9 ff ff       	jmp    801054dd <alltraps>

80105ba7 <vector57>:
80105ba7:	6a 00                	push   $0x0
80105ba9:	6a 39                	push   $0x39
80105bab:	e9 2d f9 ff ff       	jmp    801054dd <alltraps>

80105bb0 <vector58>:
80105bb0:	6a 00                	push   $0x0
80105bb2:	6a 3a                	push   $0x3a
80105bb4:	e9 24 f9 ff ff       	jmp    801054dd <alltraps>

80105bb9 <vector59>:
80105bb9:	6a 00                	push   $0x0
80105bbb:	6a 3b                	push   $0x3b
80105bbd:	e9 1b f9 ff ff       	jmp    801054dd <alltraps>

80105bc2 <vector60>:
80105bc2:	6a 00                	push   $0x0
80105bc4:	6a 3c                	push   $0x3c
80105bc6:	e9 12 f9 ff ff       	jmp    801054dd <alltraps>

80105bcb <vector61>:
80105bcb:	6a 00                	push   $0x0
80105bcd:	6a 3d                	push   $0x3d
80105bcf:	e9 09 f9 ff ff       	jmp    801054dd <alltraps>

80105bd4 <vector62>:
80105bd4:	6a 00                	push   $0x0
80105bd6:	6a 3e                	push   $0x3e
80105bd8:	e9 00 f9 ff ff       	jmp    801054dd <alltraps>

80105bdd <vector63>:
80105bdd:	6a 00                	push   $0x0
80105bdf:	6a 3f                	push   $0x3f
80105be1:	e9 f7 f8 ff ff       	jmp    801054dd <alltraps>

80105be6 <vector64>:
80105be6:	6a 00                	push   $0x0
80105be8:	6a 40                	push   $0x40
80105bea:	e9 ee f8 ff ff       	jmp    801054dd <alltraps>

80105bef <vector65>:
80105bef:	6a 00                	push   $0x0
80105bf1:	6a 41                	push   $0x41
80105bf3:	e9 e5 f8 ff ff       	jmp    801054dd <alltraps>

80105bf8 <vector66>:
80105bf8:	6a 00                	push   $0x0
80105bfa:	6a 42                	push   $0x42
80105bfc:	e9 dc f8 ff ff       	jmp    801054dd <alltraps>

80105c01 <vector67>:
80105c01:	6a 00                	push   $0x0
80105c03:	6a 43                	push   $0x43
80105c05:	e9 d3 f8 ff ff       	jmp    801054dd <alltraps>

80105c0a <vector68>:
80105c0a:	6a 00                	push   $0x0
80105c0c:	6a 44                	push   $0x44
80105c0e:	e9 ca f8 ff ff       	jmp    801054dd <alltraps>

80105c13 <vector69>:
80105c13:	6a 00                	push   $0x0
80105c15:	6a 45                	push   $0x45
80105c17:	e9 c1 f8 ff ff       	jmp    801054dd <alltraps>

80105c1c <vector70>:
80105c1c:	6a 00                	push   $0x0
80105c1e:	6a 46                	push   $0x46
80105c20:	e9 b8 f8 ff ff       	jmp    801054dd <alltraps>

80105c25 <vector71>:
80105c25:	6a 00                	push   $0x0
80105c27:	6a 47                	push   $0x47
80105c29:	e9 af f8 ff ff       	jmp    801054dd <alltraps>

80105c2e <vector72>:
80105c2e:	6a 00                	push   $0x0
80105c30:	6a 48                	push   $0x48
80105c32:	e9 a6 f8 ff ff       	jmp    801054dd <alltraps>

80105c37 <vector73>:
80105c37:	6a 00                	push   $0x0
80105c39:	6a 49                	push   $0x49
80105c3b:	e9 9d f8 ff ff       	jmp    801054dd <alltraps>

80105c40 <vector74>:
80105c40:	6a 00                	push   $0x0
80105c42:	6a 4a                	push   $0x4a
80105c44:	e9 94 f8 ff ff       	jmp    801054dd <alltraps>

80105c49 <vector75>:
80105c49:	6a 00                	push   $0x0
80105c4b:	6a 4b                	push   $0x4b
80105c4d:	e9 8b f8 ff ff       	jmp    801054dd <alltraps>

80105c52 <vector76>:
80105c52:	6a 00                	push   $0x0
80105c54:	6a 4c                	push   $0x4c
80105c56:	e9 82 f8 ff ff       	jmp    801054dd <alltraps>

80105c5b <vector77>:
80105c5b:	6a 00                	push   $0x0
80105c5d:	6a 4d                	push   $0x4d
80105c5f:	e9 79 f8 ff ff       	jmp    801054dd <alltraps>

80105c64 <vector78>:
80105c64:	6a 00                	push   $0x0
80105c66:	6a 4e                	push   $0x4e
80105c68:	e9 70 f8 ff ff       	jmp    801054dd <alltraps>

80105c6d <vector79>:
80105c6d:	6a 00                	push   $0x0
80105c6f:	6a 4f                	push   $0x4f
80105c71:	e9 67 f8 ff ff       	jmp    801054dd <alltraps>

80105c76 <vector80>:
80105c76:	6a 00                	push   $0x0
80105c78:	6a 50                	push   $0x50
80105c7a:	e9 5e f8 ff ff       	jmp    801054dd <alltraps>

80105c7f <vector81>:
80105c7f:	6a 00                	push   $0x0
80105c81:	6a 51                	push   $0x51
80105c83:	e9 55 f8 ff ff       	jmp    801054dd <alltraps>

80105c88 <vector82>:
80105c88:	6a 00                	push   $0x0
80105c8a:	6a 52                	push   $0x52
80105c8c:	e9 4c f8 ff ff       	jmp    801054dd <alltraps>

80105c91 <vector83>:
80105c91:	6a 00                	push   $0x0
80105c93:	6a 53                	push   $0x53
80105c95:	e9 43 f8 ff ff       	jmp    801054dd <alltraps>

80105c9a <vector84>:
80105c9a:	6a 00                	push   $0x0
80105c9c:	6a 54                	push   $0x54
80105c9e:	e9 3a f8 ff ff       	jmp    801054dd <alltraps>

80105ca3 <vector85>:
80105ca3:	6a 00                	push   $0x0
80105ca5:	6a 55                	push   $0x55
80105ca7:	e9 31 f8 ff ff       	jmp    801054dd <alltraps>

80105cac <vector86>:
80105cac:	6a 00                	push   $0x0
80105cae:	6a 56                	push   $0x56
80105cb0:	e9 28 f8 ff ff       	jmp    801054dd <alltraps>

80105cb5 <vector87>:
80105cb5:	6a 00                	push   $0x0
80105cb7:	6a 57                	push   $0x57
80105cb9:	e9 1f f8 ff ff       	jmp    801054dd <alltraps>

80105cbe <vector88>:
80105cbe:	6a 00                	push   $0x0
80105cc0:	6a 58                	push   $0x58
80105cc2:	e9 16 f8 ff ff       	jmp    801054dd <alltraps>

80105cc7 <vector89>:
80105cc7:	6a 00                	push   $0x0
80105cc9:	6a 59                	push   $0x59
80105ccb:	e9 0d f8 ff ff       	jmp    801054dd <alltraps>

80105cd0 <vector90>:
80105cd0:	6a 00                	push   $0x0
80105cd2:	6a 5a                	push   $0x5a
80105cd4:	e9 04 f8 ff ff       	jmp    801054dd <alltraps>

80105cd9 <vector91>:
80105cd9:	6a 00                	push   $0x0
80105cdb:	6a 5b                	push   $0x5b
80105cdd:	e9 fb f7 ff ff       	jmp    801054dd <alltraps>

80105ce2 <vector92>:
80105ce2:	6a 00                	push   $0x0
80105ce4:	6a 5c                	push   $0x5c
80105ce6:	e9 f2 f7 ff ff       	jmp    801054dd <alltraps>

80105ceb <vector93>:
80105ceb:	6a 00                	push   $0x0
80105ced:	6a 5d                	push   $0x5d
80105cef:	e9 e9 f7 ff ff       	jmp    801054dd <alltraps>

80105cf4 <vector94>:
80105cf4:	6a 00                	push   $0x0
80105cf6:	6a 5e                	push   $0x5e
80105cf8:	e9 e0 f7 ff ff       	jmp    801054dd <alltraps>

80105cfd <vector95>:
80105cfd:	6a 00                	push   $0x0
80105cff:	6a 5f                	push   $0x5f
80105d01:	e9 d7 f7 ff ff       	jmp    801054dd <alltraps>

80105d06 <vector96>:
80105d06:	6a 00                	push   $0x0
80105d08:	6a 60                	push   $0x60
80105d0a:	e9 ce f7 ff ff       	jmp    801054dd <alltraps>

80105d0f <vector97>:
80105d0f:	6a 00                	push   $0x0
80105d11:	6a 61                	push   $0x61
80105d13:	e9 c5 f7 ff ff       	jmp    801054dd <alltraps>

80105d18 <vector98>:
80105d18:	6a 00                	push   $0x0
80105d1a:	6a 62                	push   $0x62
80105d1c:	e9 bc f7 ff ff       	jmp    801054dd <alltraps>

80105d21 <vector99>:
80105d21:	6a 00                	push   $0x0
80105d23:	6a 63                	push   $0x63
80105d25:	e9 b3 f7 ff ff       	jmp    801054dd <alltraps>

80105d2a <vector100>:
80105d2a:	6a 00                	push   $0x0
80105d2c:	6a 64                	push   $0x64
80105d2e:	e9 aa f7 ff ff       	jmp    801054dd <alltraps>

80105d33 <vector101>:
80105d33:	6a 00                	push   $0x0
80105d35:	6a 65                	push   $0x65
80105d37:	e9 a1 f7 ff ff       	jmp    801054dd <alltraps>

80105d3c <vector102>:
80105d3c:	6a 00                	push   $0x0
80105d3e:	6a 66                	push   $0x66
80105d40:	e9 98 f7 ff ff       	jmp    801054dd <alltraps>

80105d45 <vector103>:
80105d45:	6a 00                	push   $0x0
80105d47:	6a 67                	push   $0x67
80105d49:	e9 8f f7 ff ff       	jmp    801054dd <alltraps>

80105d4e <vector104>:
80105d4e:	6a 00                	push   $0x0
80105d50:	6a 68                	push   $0x68
80105d52:	e9 86 f7 ff ff       	jmp    801054dd <alltraps>

80105d57 <vector105>:
80105d57:	6a 00                	push   $0x0
80105d59:	6a 69                	push   $0x69
80105d5b:	e9 7d f7 ff ff       	jmp    801054dd <alltraps>

80105d60 <vector106>:
80105d60:	6a 00                	push   $0x0
80105d62:	6a 6a                	push   $0x6a
80105d64:	e9 74 f7 ff ff       	jmp    801054dd <alltraps>

80105d69 <vector107>:
80105d69:	6a 00                	push   $0x0
80105d6b:	6a 6b                	push   $0x6b
80105d6d:	e9 6b f7 ff ff       	jmp    801054dd <alltraps>

80105d72 <vector108>:
80105d72:	6a 00                	push   $0x0
80105d74:	6a 6c                	push   $0x6c
80105d76:	e9 62 f7 ff ff       	jmp    801054dd <alltraps>

80105d7b <vector109>:
80105d7b:	6a 00                	push   $0x0
80105d7d:	6a 6d                	push   $0x6d
80105d7f:	e9 59 f7 ff ff       	jmp    801054dd <alltraps>

80105d84 <vector110>:
80105d84:	6a 00                	push   $0x0
80105d86:	6a 6e                	push   $0x6e
80105d88:	e9 50 f7 ff ff       	jmp    801054dd <alltraps>

80105d8d <vector111>:
80105d8d:	6a 00                	push   $0x0
80105d8f:	6a 6f                	push   $0x6f
80105d91:	e9 47 f7 ff ff       	jmp    801054dd <alltraps>

80105d96 <vector112>:
80105d96:	6a 00                	push   $0x0
80105d98:	6a 70                	push   $0x70
80105d9a:	e9 3e f7 ff ff       	jmp    801054dd <alltraps>

80105d9f <vector113>:
80105d9f:	6a 00                	push   $0x0
80105da1:	6a 71                	push   $0x71
80105da3:	e9 35 f7 ff ff       	jmp    801054dd <alltraps>

80105da8 <vector114>:
80105da8:	6a 00                	push   $0x0
80105daa:	6a 72                	push   $0x72
80105dac:	e9 2c f7 ff ff       	jmp    801054dd <alltraps>

80105db1 <vector115>:
80105db1:	6a 00                	push   $0x0
80105db3:	6a 73                	push   $0x73
80105db5:	e9 23 f7 ff ff       	jmp    801054dd <alltraps>

80105dba <vector116>:
80105dba:	6a 00                	push   $0x0
80105dbc:	6a 74                	push   $0x74
80105dbe:	e9 1a f7 ff ff       	jmp    801054dd <alltraps>

80105dc3 <vector117>:
80105dc3:	6a 00                	push   $0x0
80105dc5:	6a 75                	push   $0x75
80105dc7:	e9 11 f7 ff ff       	jmp    801054dd <alltraps>

80105dcc <vector118>:
80105dcc:	6a 00                	push   $0x0
80105dce:	6a 76                	push   $0x76
80105dd0:	e9 08 f7 ff ff       	jmp    801054dd <alltraps>

80105dd5 <vector119>:
80105dd5:	6a 00                	push   $0x0
80105dd7:	6a 77                	push   $0x77
80105dd9:	e9 ff f6 ff ff       	jmp    801054dd <alltraps>

80105dde <vector120>:
80105dde:	6a 00                	push   $0x0
80105de0:	6a 78                	push   $0x78
80105de2:	e9 f6 f6 ff ff       	jmp    801054dd <alltraps>

80105de7 <vector121>:
80105de7:	6a 00                	push   $0x0
80105de9:	6a 79                	push   $0x79
80105deb:	e9 ed f6 ff ff       	jmp    801054dd <alltraps>

80105df0 <vector122>:
80105df0:	6a 00                	push   $0x0
80105df2:	6a 7a                	push   $0x7a
80105df4:	e9 e4 f6 ff ff       	jmp    801054dd <alltraps>

80105df9 <vector123>:
80105df9:	6a 00                	push   $0x0
80105dfb:	6a 7b                	push   $0x7b
80105dfd:	e9 db f6 ff ff       	jmp    801054dd <alltraps>

80105e02 <vector124>:
80105e02:	6a 00                	push   $0x0
80105e04:	6a 7c                	push   $0x7c
80105e06:	e9 d2 f6 ff ff       	jmp    801054dd <alltraps>

80105e0b <vector125>:
80105e0b:	6a 00                	push   $0x0
80105e0d:	6a 7d                	push   $0x7d
80105e0f:	e9 c9 f6 ff ff       	jmp    801054dd <alltraps>

80105e14 <vector126>:
80105e14:	6a 00                	push   $0x0
80105e16:	6a 7e                	push   $0x7e
80105e18:	e9 c0 f6 ff ff       	jmp    801054dd <alltraps>

80105e1d <vector127>:
80105e1d:	6a 00                	push   $0x0
80105e1f:	6a 7f                	push   $0x7f
80105e21:	e9 b7 f6 ff ff       	jmp    801054dd <alltraps>

80105e26 <vector128>:
80105e26:	6a 00                	push   $0x0
80105e28:	68 80 00 00 00       	push   $0x80
80105e2d:	e9 ab f6 ff ff       	jmp    801054dd <alltraps>

80105e32 <vector129>:
80105e32:	6a 00                	push   $0x0
80105e34:	68 81 00 00 00       	push   $0x81
80105e39:	e9 9f f6 ff ff       	jmp    801054dd <alltraps>

80105e3e <vector130>:
80105e3e:	6a 00                	push   $0x0
80105e40:	68 82 00 00 00       	push   $0x82
80105e45:	e9 93 f6 ff ff       	jmp    801054dd <alltraps>

80105e4a <vector131>:
80105e4a:	6a 00                	push   $0x0
80105e4c:	68 83 00 00 00       	push   $0x83
80105e51:	e9 87 f6 ff ff       	jmp    801054dd <alltraps>

80105e56 <vector132>:
80105e56:	6a 00                	push   $0x0
80105e58:	68 84 00 00 00       	push   $0x84
80105e5d:	e9 7b f6 ff ff       	jmp    801054dd <alltraps>

80105e62 <vector133>:
80105e62:	6a 00                	push   $0x0
80105e64:	68 85 00 00 00       	push   $0x85
80105e69:	e9 6f f6 ff ff       	jmp    801054dd <alltraps>

80105e6e <vector134>:
80105e6e:	6a 00                	push   $0x0
80105e70:	68 86 00 00 00       	push   $0x86
80105e75:	e9 63 f6 ff ff       	jmp    801054dd <alltraps>

80105e7a <vector135>:
80105e7a:	6a 00                	push   $0x0
80105e7c:	68 87 00 00 00       	push   $0x87
80105e81:	e9 57 f6 ff ff       	jmp    801054dd <alltraps>

80105e86 <vector136>:
80105e86:	6a 00                	push   $0x0
80105e88:	68 88 00 00 00       	push   $0x88
80105e8d:	e9 4b f6 ff ff       	jmp    801054dd <alltraps>

80105e92 <vector137>:
80105e92:	6a 00                	push   $0x0
80105e94:	68 89 00 00 00       	push   $0x89
80105e99:	e9 3f f6 ff ff       	jmp    801054dd <alltraps>

80105e9e <vector138>:
80105e9e:	6a 00                	push   $0x0
80105ea0:	68 8a 00 00 00       	push   $0x8a
80105ea5:	e9 33 f6 ff ff       	jmp    801054dd <alltraps>

80105eaa <vector139>:
80105eaa:	6a 00                	push   $0x0
80105eac:	68 8b 00 00 00       	push   $0x8b
80105eb1:	e9 27 f6 ff ff       	jmp    801054dd <alltraps>

80105eb6 <vector140>:
80105eb6:	6a 00                	push   $0x0
80105eb8:	68 8c 00 00 00       	push   $0x8c
80105ebd:	e9 1b f6 ff ff       	jmp    801054dd <alltraps>

80105ec2 <vector141>:
80105ec2:	6a 00                	push   $0x0
80105ec4:	68 8d 00 00 00       	push   $0x8d
80105ec9:	e9 0f f6 ff ff       	jmp    801054dd <alltraps>

80105ece <vector142>:
80105ece:	6a 00                	push   $0x0
80105ed0:	68 8e 00 00 00       	push   $0x8e
80105ed5:	e9 03 f6 ff ff       	jmp    801054dd <alltraps>

80105eda <vector143>:
80105eda:	6a 00                	push   $0x0
80105edc:	68 8f 00 00 00       	push   $0x8f
80105ee1:	e9 f7 f5 ff ff       	jmp    801054dd <alltraps>

80105ee6 <vector144>:
80105ee6:	6a 00                	push   $0x0
80105ee8:	68 90 00 00 00       	push   $0x90
80105eed:	e9 eb f5 ff ff       	jmp    801054dd <alltraps>

80105ef2 <vector145>:
80105ef2:	6a 00                	push   $0x0
80105ef4:	68 91 00 00 00       	push   $0x91
80105ef9:	e9 df f5 ff ff       	jmp    801054dd <alltraps>

80105efe <vector146>:
80105efe:	6a 00                	push   $0x0
80105f00:	68 92 00 00 00       	push   $0x92
80105f05:	e9 d3 f5 ff ff       	jmp    801054dd <alltraps>

80105f0a <vector147>:
80105f0a:	6a 00                	push   $0x0
80105f0c:	68 93 00 00 00       	push   $0x93
80105f11:	e9 c7 f5 ff ff       	jmp    801054dd <alltraps>

80105f16 <vector148>:
80105f16:	6a 00                	push   $0x0
80105f18:	68 94 00 00 00       	push   $0x94
80105f1d:	e9 bb f5 ff ff       	jmp    801054dd <alltraps>

80105f22 <vector149>:
80105f22:	6a 00                	push   $0x0
80105f24:	68 95 00 00 00       	push   $0x95
80105f29:	e9 af f5 ff ff       	jmp    801054dd <alltraps>

80105f2e <vector150>:
80105f2e:	6a 00                	push   $0x0
80105f30:	68 96 00 00 00       	push   $0x96
80105f35:	e9 a3 f5 ff ff       	jmp    801054dd <alltraps>

80105f3a <vector151>:
80105f3a:	6a 00                	push   $0x0
80105f3c:	68 97 00 00 00       	push   $0x97
80105f41:	e9 97 f5 ff ff       	jmp    801054dd <alltraps>

80105f46 <vector152>:
80105f46:	6a 00                	push   $0x0
80105f48:	68 98 00 00 00       	push   $0x98
80105f4d:	e9 8b f5 ff ff       	jmp    801054dd <alltraps>

80105f52 <vector153>:
80105f52:	6a 00                	push   $0x0
80105f54:	68 99 00 00 00       	push   $0x99
80105f59:	e9 7f f5 ff ff       	jmp    801054dd <alltraps>

80105f5e <vector154>:
80105f5e:	6a 00                	push   $0x0
80105f60:	68 9a 00 00 00       	push   $0x9a
80105f65:	e9 73 f5 ff ff       	jmp    801054dd <alltraps>

80105f6a <vector155>:
80105f6a:	6a 00                	push   $0x0
80105f6c:	68 9b 00 00 00       	push   $0x9b
80105f71:	e9 67 f5 ff ff       	jmp    801054dd <alltraps>

80105f76 <vector156>:
80105f76:	6a 00                	push   $0x0
80105f78:	68 9c 00 00 00       	push   $0x9c
80105f7d:	e9 5b f5 ff ff       	jmp    801054dd <alltraps>

80105f82 <vector157>:
80105f82:	6a 00                	push   $0x0
80105f84:	68 9d 00 00 00       	push   $0x9d
80105f89:	e9 4f f5 ff ff       	jmp    801054dd <alltraps>

80105f8e <vector158>:
80105f8e:	6a 00                	push   $0x0
80105f90:	68 9e 00 00 00       	push   $0x9e
80105f95:	e9 43 f5 ff ff       	jmp    801054dd <alltraps>

80105f9a <vector159>:
80105f9a:	6a 00                	push   $0x0
80105f9c:	68 9f 00 00 00       	push   $0x9f
80105fa1:	e9 37 f5 ff ff       	jmp    801054dd <alltraps>

80105fa6 <vector160>:
80105fa6:	6a 00                	push   $0x0
80105fa8:	68 a0 00 00 00       	push   $0xa0
80105fad:	e9 2b f5 ff ff       	jmp    801054dd <alltraps>

80105fb2 <vector161>:
80105fb2:	6a 00                	push   $0x0
80105fb4:	68 a1 00 00 00       	push   $0xa1
80105fb9:	e9 1f f5 ff ff       	jmp    801054dd <alltraps>

80105fbe <vector162>:
80105fbe:	6a 00                	push   $0x0
80105fc0:	68 a2 00 00 00       	push   $0xa2
80105fc5:	e9 13 f5 ff ff       	jmp    801054dd <alltraps>

80105fca <vector163>:
80105fca:	6a 00                	push   $0x0
80105fcc:	68 a3 00 00 00       	push   $0xa3
80105fd1:	e9 07 f5 ff ff       	jmp    801054dd <alltraps>

80105fd6 <vector164>:
80105fd6:	6a 00                	push   $0x0
80105fd8:	68 a4 00 00 00       	push   $0xa4
80105fdd:	e9 fb f4 ff ff       	jmp    801054dd <alltraps>

80105fe2 <vector165>:
80105fe2:	6a 00                	push   $0x0
80105fe4:	68 a5 00 00 00       	push   $0xa5
80105fe9:	e9 ef f4 ff ff       	jmp    801054dd <alltraps>

80105fee <vector166>:
80105fee:	6a 00                	push   $0x0
80105ff0:	68 a6 00 00 00       	push   $0xa6
80105ff5:	e9 e3 f4 ff ff       	jmp    801054dd <alltraps>

80105ffa <vector167>:
80105ffa:	6a 00                	push   $0x0
80105ffc:	68 a7 00 00 00       	push   $0xa7
80106001:	e9 d7 f4 ff ff       	jmp    801054dd <alltraps>

80106006 <vector168>:
80106006:	6a 00                	push   $0x0
80106008:	68 a8 00 00 00       	push   $0xa8
8010600d:	e9 cb f4 ff ff       	jmp    801054dd <alltraps>

80106012 <vector169>:
80106012:	6a 00                	push   $0x0
80106014:	68 a9 00 00 00       	push   $0xa9
80106019:	e9 bf f4 ff ff       	jmp    801054dd <alltraps>

8010601e <vector170>:
8010601e:	6a 00                	push   $0x0
80106020:	68 aa 00 00 00       	push   $0xaa
80106025:	e9 b3 f4 ff ff       	jmp    801054dd <alltraps>

8010602a <vector171>:
8010602a:	6a 00                	push   $0x0
8010602c:	68 ab 00 00 00       	push   $0xab
80106031:	e9 a7 f4 ff ff       	jmp    801054dd <alltraps>

80106036 <vector172>:
80106036:	6a 00                	push   $0x0
80106038:	68 ac 00 00 00       	push   $0xac
8010603d:	e9 9b f4 ff ff       	jmp    801054dd <alltraps>

80106042 <vector173>:
80106042:	6a 00                	push   $0x0
80106044:	68 ad 00 00 00       	push   $0xad
80106049:	e9 8f f4 ff ff       	jmp    801054dd <alltraps>

8010604e <vector174>:
8010604e:	6a 00                	push   $0x0
80106050:	68 ae 00 00 00       	push   $0xae
80106055:	e9 83 f4 ff ff       	jmp    801054dd <alltraps>

8010605a <vector175>:
8010605a:	6a 00                	push   $0x0
8010605c:	68 af 00 00 00       	push   $0xaf
80106061:	e9 77 f4 ff ff       	jmp    801054dd <alltraps>

80106066 <vector176>:
80106066:	6a 00                	push   $0x0
80106068:	68 b0 00 00 00       	push   $0xb0
8010606d:	e9 6b f4 ff ff       	jmp    801054dd <alltraps>

80106072 <vector177>:
80106072:	6a 00                	push   $0x0
80106074:	68 b1 00 00 00       	push   $0xb1
80106079:	e9 5f f4 ff ff       	jmp    801054dd <alltraps>

8010607e <vector178>:
8010607e:	6a 00                	push   $0x0
80106080:	68 b2 00 00 00       	push   $0xb2
80106085:	e9 53 f4 ff ff       	jmp    801054dd <alltraps>

8010608a <vector179>:
8010608a:	6a 00                	push   $0x0
8010608c:	68 b3 00 00 00       	push   $0xb3
80106091:	e9 47 f4 ff ff       	jmp    801054dd <alltraps>

80106096 <vector180>:
80106096:	6a 00                	push   $0x0
80106098:	68 b4 00 00 00       	push   $0xb4
8010609d:	e9 3b f4 ff ff       	jmp    801054dd <alltraps>

801060a2 <vector181>:
801060a2:	6a 00                	push   $0x0
801060a4:	68 b5 00 00 00       	push   $0xb5
801060a9:	e9 2f f4 ff ff       	jmp    801054dd <alltraps>

801060ae <vector182>:
801060ae:	6a 00                	push   $0x0
801060b0:	68 b6 00 00 00       	push   $0xb6
801060b5:	e9 23 f4 ff ff       	jmp    801054dd <alltraps>

801060ba <vector183>:
801060ba:	6a 00                	push   $0x0
801060bc:	68 b7 00 00 00       	push   $0xb7
801060c1:	e9 17 f4 ff ff       	jmp    801054dd <alltraps>

801060c6 <vector184>:
801060c6:	6a 00                	push   $0x0
801060c8:	68 b8 00 00 00       	push   $0xb8
801060cd:	e9 0b f4 ff ff       	jmp    801054dd <alltraps>

801060d2 <vector185>:
801060d2:	6a 00                	push   $0x0
801060d4:	68 b9 00 00 00       	push   $0xb9
801060d9:	e9 ff f3 ff ff       	jmp    801054dd <alltraps>

801060de <vector186>:
801060de:	6a 00                	push   $0x0
801060e0:	68 ba 00 00 00       	push   $0xba
801060e5:	e9 f3 f3 ff ff       	jmp    801054dd <alltraps>

801060ea <vector187>:
801060ea:	6a 00                	push   $0x0
801060ec:	68 bb 00 00 00       	push   $0xbb
801060f1:	e9 e7 f3 ff ff       	jmp    801054dd <alltraps>

801060f6 <vector188>:
801060f6:	6a 00                	push   $0x0
801060f8:	68 bc 00 00 00       	push   $0xbc
801060fd:	e9 db f3 ff ff       	jmp    801054dd <alltraps>

80106102 <vector189>:
80106102:	6a 00                	push   $0x0
80106104:	68 bd 00 00 00       	push   $0xbd
80106109:	e9 cf f3 ff ff       	jmp    801054dd <alltraps>

8010610e <vector190>:
8010610e:	6a 00                	push   $0x0
80106110:	68 be 00 00 00       	push   $0xbe
80106115:	e9 c3 f3 ff ff       	jmp    801054dd <alltraps>

8010611a <vector191>:
8010611a:	6a 00                	push   $0x0
8010611c:	68 bf 00 00 00       	push   $0xbf
80106121:	e9 b7 f3 ff ff       	jmp    801054dd <alltraps>

80106126 <vector192>:
80106126:	6a 00                	push   $0x0
80106128:	68 c0 00 00 00       	push   $0xc0
8010612d:	e9 ab f3 ff ff       	jmp    801054dd <alltraps>

80106132 <vector193>:
80106132:	6a 00                	push   $0x0
80106134:	68 c1 00 00 00       	push   $0xc1
80106139:	e9 9f f3 ff ff       	jmp    801054dd <alltraps>

8010613e <vector194>:
8010613e:	6a 00                	push   $0x0
80106140:	68 c2 00 00 00       	push   $0xc2
80106145:	e9 93 f3 ff ff       	jmp    801054dd <alltraps>

8010614a <vector195>:
8010614a:	6a 00                	push   $0x0
8010614c:	68 c3 00 00 00       	push   $0xc3
80106151:	e9 87 f3 ff ff       	jmp    801054dd <alltraps>

80106156 <vector196>:
80106156:	6a 00                	push   $0x0
80106158:	68 c4 00 00 00       	push   $0xc4
8010615d:	e9 7b f3 ff ff       	jmp    801054dd <alltraps>

80106162 <vector197>:
80106162:	6a 00                	push   $0x0
80106164:	68 c5 00 00 00       	push   $0xc5
80106169:	e9 6f f3 ff ff       	jmp    801054dd <alltraps>

8010616e <vector198>:
8010616e:	6a 00                	push   $0x0
80106170:	68 c6 00 00 00       	push   $0xc6
80106175:	e9 63 f3 ff ff       	jmp    801054dd <alltraps>

8010617a <vector199>:
8010617a:	6a 00                	push   $0x0
8010617c:	68 c7 00 00 00       	push   $0xc7
80106181:	e9 57 f3 ff ff       	jmp    801054dd <alltraps>

80106186 <vector200>:
80106186:	6a 00                	push   $0x0
80106188:	68 c8 00 00 00       	push   $0xc8
8010618d:	e9 4b f3 ff ff       	jmp    801054dd <alltraps>

80106192 <vector201>:
80106192:	6a 00                	push   $0x0
80106194:	68 c9 00 00 00       	push   $0xc9
80106199:	e9 3f f3 ff ff       	jmp    801054dd <alltraps>

8010619e <vector202>:
8010619e:	6a 00                	push   $0x0
801061a0:	68 ca 00 00 00       	push   $0xca
801061a5:	e9 33 f3 ff ff       	jmp    801054dd <alltraps>

801061aa <vector203>:
801061aa:	6a 00                	push   $0x0
801061ac:	68 cb 00 00 00       	push   $0xcb
801061b1:	e9 27 f3 ff ff       	jmp    801054dd <alltraps>

801061b6 <vector204>:
801061b6:	6a 00                	push   $0x0
801061b8:	68 cc 00 00 00       	push   $0xcc
801061bd:	e9 1b f3 ff ff       	jmp    801054dd <alltraps>

801061c2 <vector205>:
801061c2:	6a 00                	push   $0x0
801061c4:	68 cd 00 00 00       	push   $0xcd
801061c9:	e9 0f f3 ff ff       	jmp    801054dd <alltraps>

801061ce <vector206>:
801061ce:	6a 00                	push   $0x0
801061d0:	68 ce 00 00 00       	push   $0xce
801061d5:	e9 03 f3 ff ff       	jmp    801054dd <alltraps>

801061da <vector207>:
801061da:	6a 00                	push   $0x0
801061dc:	68 cf 00 00 00       	push   $0xcf
801061e1:	e9 f7 f2 ff ff       	jmp    801054dd <alltraps>

801061e6 <vector208>:
801061e6:	6a 00                	push   $0x0
801061e8:	68 d0 00 00 00       	push   $0xd0
801061ed:	e9 eb f2 ff ff       	jmp    801054dd <alltraps>

801061f2 <vector209>:
801061f2:	6a 00                	push   $0x0
801061f4:	68 d1 00 00 00       	push   $0xd1
801061f9:	e9 df f2 ff ff       	jmp    801054dd <alltraps>

801061fe <vector210>:
801061fe:	6a 00                	push   $0x0
80106200:	68 d2 00 00 00       	push   $0xd2
80106205:	e9 d3 f2 ff ff       	jmp    801054dd <alltraps>

8010620a <vector211>:
8010620a:	6a 00                	push   $0x0
8010620c:	68 d3 00 00 00       	push   $0xd3
80106211:	e9 c7 f2 ff ff       	jmp    801054dd <alltraps>

80106216 <vector212>:
80106216:	6a 00                	push   $0x0
80106218:	68 d4 00 00 00       	push   $0xd4
8010621d:	e9 bb f2 ff ff       	jmp    801054dd <alltraps>

80106222 <vector213>:
80106222:	6a 00                	push   $0x0
80106224:	68 d5 00 00 00       	push   $0xd5
80106229:	e9 af f2 ff ff       	jmp    801054dd <alltraps>

8010622e <vector214>:
8010622e:	6a 00                	push   $0x0
80106230:	68 d6 00 00 00       	push   $0xd6
80106235:	e9 a3 f2 ff ff       	jmp    801054dd <alltraps>

8010623a <vector215>:
8010623a:	6a 00                	push   $0x0
8010623c:	68 d7 00 00 00       	push   $0xd7
80106241:	e9 97 f2 ff ff       	jmp    801054dd <alltraps>

80106246 <vector216>:
80106246:	6a 00                	push   $0x0
80106248:	68 d8 00 00 00       	push   $0xd8
8010624d:	e9 8b f2 ff ff       	jmp    801054dd <alltraps>

80106252 <vector217>:
80106252:	6a 00                	push   $0x0
80106254:	68 d9 00 00 00       	push   $0xd9
80106259:	e9 7f f2 ff ff       	jmp    801054dd <alltraps>

8010625e <vector218>:
8010625e:	6a 00                	push   $0x0
80106260:	68 da 00 00 00       	push   $0xda
80106265:	e9 73 f2 ff ff       	jmp    801054dd <alltraps>

8010626a <vector219>:
8010626a:	6a 00                	push   $0x0
8010626c:	68 db 00 00 00       	push   $0xdb
80106271:	e9 67 f2 ff ff       	jmp    801054dd <alltraps>

80106276 <vector220>:
80106276:	6a 00                	push   $0x0
80106278:	68 dc 00 00 00       	push   $0xdc
8010627d:	e9 5b f2 ff ff       	jmp    801054dd <alltraps>

80106282 <vector221>:
80106282:	6a 00                	push   $0x0
80106284:	68 dd 00 00 00       	push   $0xdd
80106289:	e9 4f f2 ff ff       	jmp    801054dd <alltraps>

8010628e <vector222>:
8010628e:	6a 00                	push   $0x0
80106290:	68 de 00 00 00       	push   $0xde
80106295:	e9 43 f2 ff ff       	jmp    801054dd <alltraps>

8010629a <vector223>:
8010629a:	6a 00                	push   $0x0
8010629c:	68 df 00 00 00       	push   $0xdf
801062a1:	e9 37 f2 ff ff       	jmp    801054dd <alltraps>

801062a6 <vector224>:
801062a6:	6a 00                	push   $0x0
801062a8:	68 e0 00 00 00       	push   $0xe0
801062ad:	e9 2b f2 ff ff       	jmp    801054dd <alltraps>

801062b2 <vector225>:
801062b2:	6a 00                	push   $0x0
801062b4:	68 e1 00 00 00       	push   $0xe1
801062b9:	e9 1f f2 ff ff       	jmp    801054dd <alltraps>

801062be <vector226>:
801062be:	6a 00                	push   $0x0
801062c0:	68 e2 00 00 00       	push   $0xe2
801062c5:	e9 13 f2 ff ff       	jmp    801054dd <alltraps>

801062ca <vector227>:
801062ca:	6a 00                	push   $0x0
801062cc:	68 e3 00 00 00       	push   $0xe3
801062d1:	e9 07 f2 ff ff       	jmp    801054dd <alltraps>

801062d6 <vector228>:
801062d6:	6a 00                	push   $0x0
801062d8:	68 e4 00 00 00       	push   $0xe4
801062dd:	e9 fb f1 ff ff       	jmp    801054dd <alltraps>

801062e2 <vector229>:
801062e2:	6a 00                	push   $0x0
801062e4:	68 e5 00 00 00       	push   $0xe5
801062e9:	e9 ef f1 ff ff       	jmp    801054dd <alltraps>

801062ee <vector230>:
801062ee:	6a 00                	push   $0x0
801062f0:	68 e6 00 00 00       	push   $0xe6
801062f5:	e9 e3 f1 ff ff       	jmp    801054dd <alltraps>

801062fa <vector231>:
801062fa:	6a 00                	push   $0x0
801062fc:	68 e7 00 00 00       	push   $0xe7
80106301:	e9 d7 f1 ff ff       	jmp    801054dd <alltraps>

80106306 <vector232>:
80106306:	6a 00                	push   $0x0
80106308:	68 e8 00 00 00       	push   $0xe8
8010630d:	e9 cb f1 ff ff       	jmp    801054dd <alltraps>

80106312 <vector233>:
80106312:	6a 00                	push   $0x0
80106314:	68 e9 00 00 00       	push   $0xe9
80106319:	e9 bf f1 ff ff       	jmp    801054dd <alltraps>

8010631e <vector234>:
8010631e:	6a 00                	push   $0x0
80106320:	68 ea 00 00 00       	push   $0xea
80106325:	e9 b3 f1 ff ff       	jmp    801054dd <alltraps>

8010632a <vector235>:
8010632a:	6a 00                	push   $0x0
8010632c:	68 eb 00 00 00       	push   $0xeb
80106331:	e9 a7 f1 ff ff       	jmp    801054dd <alltraps>

80106336 <vector236>:
80106336:	6a 00                	push   $0x0
80106338:	68 ec 00 00 00       	push   $0xec
8010633d:	e9 9b f1 ff ff       	jmp    801054dd <alltraps>

80106342 <vector237>:
80106342:	6a 00                	push   $0x0
80106344:	68 ed 00 00 00       	push   $0xed
80106349:	e9 8f f1 ff ff       	jmp    801054dd <alltraps>

8010634e <vector238>:
8010634e:	6a 00                	push   $0x0
80106350:	68 ee 00 00 00       	push   $0xee
80106355:	e9 83 f1 ff ff       	jmp    801054dd <alltraps>

8010635a <vector239>:
8010635a:	6a 00                	push   $0x0
8010635c:	68 ef 00 00 00       	push   $0xef
80106361:	e9 77 f1 ff ff       	jmp    801054dd <alltraps>

80106366 <vector240>:
80106366:	6a 00                	push   $0x0
80106368:	68 f0 00 00 00       	push   $0xf0
8010636d:	e9 6b f1 ff ff       	jmp    801054dd <alltraps>

80106372 <vector241>:
80106372:	6a 00                	push   $0x0
80106374:	68 f1 00 00 00       	push   $0xf1
80106379:	e9 5f f1 ff ff       	jmp    801054dd <alltraps>

8010637e <vector242>:
8010637e:	6a 00                	push   $0x0
80106380:	68 f2 00 00 00       	push   $0xf2
80106385:	e9 53 f1 ff ff       	jmp    801054dd <alltraps>

8010638a <vector243>:
8010638a:	6a 00                	push   $0x0
8010638c:	68 f3 00 00 00       	push   $0xf3
80106391:	e9 47 f1 ff ff       	jmp    801054dd <alltraps>

80106396 <vector244>:
80106396:	6a 00                	push   $0x0
80106398:	68 f4 00 00 00       	push   $0xf4
8010639d:	e9 3b f1 ff ff       	jmp    801054dd <alltraps>

801063a2 <vector245>:
801063a2:	6a 00                	push   $0x0
801063a4:	68 f5 00 00 00       	push   $0xf5
801063a9:	e9 2f f1 ff ff       	jmp    801054dd <alltraps>

801063ae <vector246>:
801063ae:	6a 00                	push   $0x0
801063b0:	68 f6 00 00 00       	push   $0xf6
801063b5:	e9 23 f1 ff ff       	jmp    801054dd <alltraps>

801063ba <vector247>:
801063ba:	6a 00                	push   $0x0
801063bc:	68 f7 00 00 00       	push   $0xf7
801063c1:	e9 17 f1 ff ff       	jmp    801054dd <alltraps>

801063c6 <vector248>:
801063c6:	6a 00                	push   $0x0
801063c8:	68 f8 00 00 00       	push   $0xf8
801063cd:	e9 0b f1 ff ff       	jmp    801054dd <alltraps>

801063d2 <vector249>:
801063d2:	6a 00                	push   $0x0
801063d4:	68 f9 00 00 00       	push   $0xf9
801063d9:	e9 ff f0 ff ff       	jmp    801054dd <alltraps>

801063de <vector250>:
801063de:	6a 00                	push   $0x0
801063e0:	68 fa 00 00 00       	push   $0xfa
801063e5:	e9 f3 f0 ff ff       	jmp    801054dd <alltraps>

801063ea <vector251>:
801063ea:	6a 00                	push   $0x0
801063ec:	68 fb 00 00 00       	push   $0xfb
801063f1:	e9 e7 f0 ff ff       	jmp    801054dd <alltraps>

801063f6 <vector252>:
801063f6:	6a 00                	push   $0x0
801063f8:	68 fc 00 00 00       	push   $0xfc
801063fd:	e9 db f0 ff ff       	jmp    801054dd <alltraps>

80106402 <vector253>:
80106402:	6a 00                	push   $0x0
80106404:	68 fd 00 00 00       	push   $0xfd
80106409:	e9 cf f0 ff ff       	jmp    801054dd <alltraps>

8010640e <vector254>:
8010640e:	6a 00                	push   $0x0
80106410:	68 fe 00 00 00       	push   $0xfe
80106415:	e9 c3 f0 ff ff       	jmp    801054dd <alltraps>

8010641a <vector255>:
8010641a:	6a 00                	push   $0x0
8010641c:	68 ff 00 00 00       	push   $0xff
80106421:	e9 b7 f0 ff ff       	jmp    801054dd <alltraps>
80106426:	66 90                	xchg   %ax,%ax
80106428:	66 90                	xchg   %ax,%ax
8010642a:	66 90                	xchg   %ax,%ax
8010642c:	66 90                	xchg   %ax,%ax
8010642e:	66 90                	xchg   %ax,%ax

80106430 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106430:	55                   	push   %ebp
80106431:	89 e5                	mov    %esp,%ebp
80106433:	57                   	push   %edi
80106434:	56                   	push   %esi
80106435:	89 d6                	mov    %edx,%esi
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106437:	c1 ea 16             	shr    $0x16,%edx
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
8010643a:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
8010643b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
8010643e:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
80106441:	8b 1f                	mov    (%edi),%ebx
80106443:	f6 c3 01             	test   $0x1,%bl
80106446:	74 28                	je     80106470 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106448:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010644e:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106454:	c1 ee 0a             	shr    $0xa,%esi
}
80106457:	83 c4 1c             	add    $0x1c,%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
8010645a:	89 f2                	mov    %esi,%edx
8010645c:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106462:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
80106465:	5b                   	pop    %ebx
80106466:	5e                   	pop    %esi
80106467:	5f                   	pop    %edi
80106468:	5d                   	pop    %ebp
80106469:	c3                   	ret    
8010646a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106470:	85 c9                	test   %ecx,%ecx
80106472:	74 34                	je     801064a8 <walkpgdir+0x78>
80106474:	e8 17 c0 ff ff       	call   80102490 <kalloc>
80106479:	85 c0                	test   %eax,%eax
8010647b:	89 c3                	mov    %eax,%ebx
8010647d:	74 29                	je     801064a8 <walkpgdir+0x78>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
8010647f:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106486:	00 
80106487:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010648e:	00 
8010648f:	89 04 24             	mov    %eax,(%esp)
80106492:	e8 c9 de ff ff       	call   80104360 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106497:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010649d:	83 c8 07             	or     $0x7,%eax
801064a0:	89 07                	mov    %eax,(%edi)
801064a2:	eb b0                	jmp    80106454 <walkpgdir+0x24>
801064a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
  return &pgtab[PTX(va)];
}
801064a8:	83 c4 1c             	add    $0x1c,%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
801064ab:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
801064ad:	5b                   	pop    %ebx
801064ae:	5e                   	pop    %esi
801064af:	5f                   	pop    %edi
801064b0:	5d                   	pop    %ebp
801064b1:	c3                   	ret    
801064b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801064b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801064c0 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
801064c0:	55                   	push   %ebp
801064c1:	89 e5                	mov    %esp,%ebp
801064c3:	57                   	push   %edi
801064c4:	56                   	push   %esi
801064c5:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
801064c6:	89 d3                	mov    %edx,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
801064c8:	83 ec 1c             	sub    $0x1c,%esp
801064cb:	8b 7d 08             	mov    0x8(%ebp),%edi
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
801064ce:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
801064d4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
801064d7:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
801064db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
801064de:	83 4d 0c 01          	orl    $0x1,0xc(%ebp)
{
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
801064e2:	81 65 e4 00 f0 ff ff 	andl   $0xfffff000,-0x1c(%ebp)
801064e9:	29 df                	sub    %ebx,%edi
801064eb:	eb 18                	jmp    80106505 <mappages+0x45>
801064ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
801064f0:	f6 00 01             	testb  $0x1,(%eax)
801064f3:	75 3d                	jne    80106532 <mappages+0x72>
      panic("remap");
    *pte = pa | perm | PTE_P;
801064f5:	0b 75 0c             	or     0xc(%ebp),%esi
    if(a == last)
801064f8:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
801064fb:	89 30                	mov    %esi,(%eax)
    if(a == last)
801064fd:	74 29                	je     80106528 <mappages+0x68>
      break;
    a += PGSIZE;
801064ff:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106505:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106508:	b9 01 00 00 00       	mov    $0x1,%ecx
8010650d:	89 da                	mov    %ebx,%edx
8010650f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106512:	e8 19 ff ff ff       	call   80106430 <walkpgdir>
80106517:	85 c0                	test   %eax,%eax
80106519:	75 d5                	jne    801064f0 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
8010651b:	83 c4 1c             	add    $0x1c,%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
8010651e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106523:	5b                   	pop    %ebx
80106524:	5e                   	pop    %esi
80106525:	5f                   	pop    %edi
80106526:	5d                   	pop    %ebp
80106527:	c3                   	ret    
80106528:	83 c4 1c             	add    $0x1c,%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
8010652b:	31 c0                	xor    %eax,%eax
}
8010652d:	5b                   	pop    %ebx
8010652e:	5e                   	pop    %esi
8010652f:	5f                   	pop    %edi
80106530:	5d                   	pop    %ebp
80106531:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
80106532:	c7 04 24 28 76 10 80 	movl   $0x80107628,(%esp)
80106539:	e8 22 9e ff ff       	call   80100360 <panic>
8010653e:	66 90                	xchg   %ax,%ax

80106540 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106540:	55                   	push   %ebp
80106541:	89 e5                	mov    %esp,%ebp
80106543:	57                   	push   %edi
80106544:	89 c7                	mov    %eax,%edi
80106546:	56                   	push   %esi
80106547:	89 d6                	mov    %edx,%esi
80106549:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
8010654a:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106550:	83 ec 1c             	sub    $0x1c,%esp
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106553:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106559:	39 d3                	cmp    %edx,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
8010655b:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
8010655e:	72 3b                	jb     8010659b <deallocuvm.part.0+0x5b>
80106560:	eb 5e                	jmp    801065c0 <deallocuvm.part.0+0x80>
80106562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106568:	8b 10                	mov    (%eax),%edx
8010656a:	f6 c2 01             	test   $0x1,%dl
8010656d:	74 22                	je     80106591 <deallocuvm.part.0+0x51>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
8010656f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106575:	74 54                	je     801065cb <deallocuvm.part.0+0x8b>
        panic("kfree");
      char *v = P2V(pa);
80106577:	81 c2 00 00 00 80    	add    $0x80000000,%edx
      kfree(v);
8010657d:	89 14 24             	mov    %edx,(%esp)
80106580:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106583:	e8 58 bd ff ff       	call   801022e0 <kfree>
      *pte = 0;
80106588:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010658b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106591:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106597:	39 f3                	cmp    %esi,%ebx
80106599:	73 25                	jae    801065c0 <deallocuvm.part.0+0x80>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010659b:	31 c9                	xor    %ecx,%ecx
8010659d:	89 da                	mov    %ebx,%edx
8010659f:	89 f8                	mov    %edi,%eax
801065a1:	e8 8a fe ff ff       	call   80106430 <walkpgdir>
    if(!pte)
801065a6:	85 c0                	test   %eax,%eax
801065a8:	75 be                	jne    80106568 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
801065aa:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
801065b0:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801065b6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801065bc:	39 f3                	cmp    %esi,%ebx
801065be:	72 db                	jb     8010659b <deallocuvm.part.0+0x5b>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
801065c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
801065c3:	83 c4 1c             	add    $0x1c,%esp
801065c6:	5b                   	pop    %ebx
801065c7:	5e                   	pop    %esi
801065c8:	5f                   	pop    %edi
801065c9:	5d                   	pop    %ebp
801065ca:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
801065cb:	c7 04 24 d2 6f 10 80 	movl   $0x80106fd2,(%esp)
801065d2:	e8 89 9d ff ff       	call   80100360 <panic>
801065d7:	89 f6                	mov    %esi,%esi
801065d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801065e0 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
801065e0:	55                   	push   %ebp
801065e1:	89 e5                	mov    %esp,%ebp
801065e3:	83 ec 18             	sub    $0x18,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
801065e6:	e8 65 c1 ff ff       	call   80102750 <cpunum>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801065eb:	31 c9                	xor    %ecx,%ecx
801065ed:	ba ff ff ff ff       	mov    $0xffffffff,%edx

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
801065f2:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
801065f8:	05 a0 27 11 80       	add    $0x801127a0,%eax
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801065fd:	66 89 50 78          	mov    %dx,0x78(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106601:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106606:	66 89 48 7a          	mov    %cx,0x7a(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010660a:	31 c9                	xor    %ecx,%ecx
8010660c:	66 89 90 80 00 00 00 	mov    %dx,0x80(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106613:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106618:	66 89 88 82 00 00 00 	mov    %cx,0x82(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010661f:	31 c9                	xor    %ecx,%ecx
80106621:	66 89 90 90 00 00 00 	mov    %dx,0x90(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106628:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010662d:	66 89 88 92 00 00 00 	mov    %cx,0x92(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106634:	31 c9                	xor    %ecx,%ecx
80106636:	66 89 90 98 00 00 00 	mov    %dx,0x98(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
8010663d:	8d 90 b4 00 00 00    	lea    0xb4(%eax),%edx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106643:	66 89 88 9a 00 00 00 	mov    %cx,0x9a(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
8010664a:	31 c9                	xor    %ecx,%ecx
8010664c:	66 89 88 88 00 00 00 	mov    %cx,0x88(%eax)
80106653:	89 d1                	mov    %edx,%ecx
80106655:	c1 e9 10             	shr    $0x10,%ecx
80106658:	66 89 90 8a 00 00 00 	mov    %dx,0x8a(%eax)
8010665f:	c1 ea 18             	shr    $0x18,%edx
80106662:	88 88 8c 00 00 00    	mov    %cl,0x8c(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80106668:	b9 37 00 00 00       	mov    $0x37,%ecx
8010666d:	88 90 8f 00 00 00    	mov    %dl,0x8f(%eax)

  lgdt(c->gdt, sizeof(c->gdt));
80106673:	8d 50 70             	lea    0x70(%eax),%edx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106676:	c6 40 7d 9a          	movb   $0x9a,0x7d(%eax)
8010667a:	c6 40 7e cf          	movb   $0xcf,0x7e(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010667e:	c6 80 85 00 00 00 92 	movb   $0x92,0x85(%eax)
80106685:	c6 80 86 00 00 00 cf 	movb   $0xcf,0x86(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010668c:	c6 80 95 00 00 00 fa 	movb   $0xfa,0x95(%eax)
80106693:	c6 80 96 00 00 00 cf 	movb   $0xcf,0x96(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
8010669a:	c6 80 9d 00 00 00 f2 	movb   $0xf2,0x9d(%eax)
801066a1:	c6 80 9e 00 00 00 cf 	movb   $0xcf,0x9e(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
801066a8:	c6 80 8d 00 00 00 92 	movb   $0x92,0x8d(%eax)
801066af:	c6 80 8e 00 00 00 c0 	movb   $0xc0,0x8e(%eax)
801066b6:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
  pd[1] = (uint)p;
801066ba:	66 89 55 f4          	mov    %dx,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
801066be:	c1 ea 10             	shr    $0x10,%edx
801066c1:	66 89 55 f6          	mov    %dx,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
801066c5:	8d 55 f2             	lea    -0xe(%ebp),%edx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801066c8:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
801066cc:	c6 40 7f 00          	movb   $0x0,0x7f(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801066d0:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
801066d7:	c6 80 87 00 00 00 00 	movb   $0x0,0x87(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801066de:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
801066e5:	c6 80 97 00 00 00 00 	movb   $0x0,0x97(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801066ec:	c6 80 9c 00 00 00 00 	movb   $0x0,0x9c(%eax)
801066f3:	c6 80 9f 00 00 00 00 	movb   $0x0,0x9f(%eax)
801066fa:	0f 01 12             	lgdtl  (%edx)
}

static inline void
loadgs(ushort v)
{
  asm volatile("movw %0, %%gs" : : "r" (v));
801066fd:	ba 18 00 00 00       	mov    $0x18,%edx
80106702:	8e ea                	mov    %edx,%gs
  lgdt(c->gdt, sizeof(c->gdt));
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
80106704:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
8010670b:	00 00 00 00 

  lgdt(c->gdt, sizeof(c->gdt));
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
8010670f:	65 a3 00 00 00 00    	mov    %eax,%gs:0x0
  proc = 0;
}
80106715:	c9                   	leave  
80106716:	c3                   	ret    
80106717:	89 f6                	mov    %esi,%esi
80106719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106720 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106720:	55                   	push   %ebp
80106721:	89 e5                	mov    %esp,%ebp
80106723:	56                   	push   %esi
80106724:	53                   	push   %ebx
80106725:	83 ec 10             	sub    $0x10,%esp
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106728:	e8 63 bd ff ff       	call   80102490 <kalloc>
8010672d:	85 c0                	test   %eax,%eax
8010672f:	89 c6                	mov    %eax,%esi
80106731:	74 55                	je     80106788 <setupkvm+0x68>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106733:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010673a:	00 
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
8010673b:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106740:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106747:	00 
80106748:	89 04 24             	mov    %eax,(%esp)
8010674b:	e8 10 dc ff ff       	call   80104360 <memset>
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106750:	8b 53 0c             	mov    0xc(%ebx),%edx
80106753:	8b 43 04             	mov    0x4(%ebx),%eax
80106756:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106759:	89 54 24 04          	mov    %edx,0x4(%esp)
8010675d:	8b 13                	mov    (%ebx),%edx
8010675f:	89 04 24             	mov    %eax,(%esp)
80106762:	29 c1                	sub    %eax,%ecx
80106764:	89 f0                	mov    %esi,%eax
80106766:	e8 55 fd ff ff       	call   801064c0 <mappages>
8010676b:	85 c0                	test   %eax,%eax
8010676d:	78 19                	js     80106788 <setupkvm+0x68>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
8010676f:	83 c3 10             	add    $0x10,%ebx
80106772:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106778:	72 d6                	jb     80106750 <setupkvm+0x30>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
8010677a:	83 c4 10             	add    $0x10,%esp
8010677d:	89 f0                	mov    %esi,%eax
8010677f:	5b                   	pop    %ebx
80106780:	5e                   	pop    %esi
80106781:	5d                   	pop    %ebp
80106782:	c3                   	ret    
80106783:	90                   	nop
80106784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106788:	83 c4 10             	add    $0x10,%esp
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
8010678b:	31 c0                	xor    %eax,%eax
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
8010678d:	5b                   	pop    %ebx
8010678e:	5e                   	pop    %esi
8010678f:	5d                   	pop    %ebp
80106790:	c3                   	ret    
80106791:	eb 0d                	jmp    801067a0 <kvmalloc>
80106793:	90                   	nop
80106794:	90                   	nop
80106795:	90                   	nop
80106796:	90                   	nop
80106797:	90                   	nop
80106798:	90                   	nop
80106799:	90                   	nop
8010679a:	90                   	nop
8010679b:	90                   	nop
8010679c:	90                   	nop
8010679d:	90                   	nop
8010679e:	90                   	nop
8010679f:	90                   	nop

801067a0 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
801067a0:	55                   	push   %ebp
801067a1:	89 e5                	mov    %esp,%ebp
801067a3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
801067a6:	e8 75 ff ff ff       	call   80106720 <setupkvm>
801067ab:	a3 24 56 11 80       	mov    %eax,0x80115624
// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801067b0:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
801067b5:	0f 22 d8             	mov    %eax,%cr3
void
kvmalloc(void)
{
  kpgdir = setupkvm();
  switchkvm();
}
801067b8:	c9                   	leave  
801067b9:	c3                   	ret    
801067ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801067c0 <switchkvm>:
// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801067c0:	a1 24 56 11 80       	mov    0x80115624,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
801067c5:	55                   	push   %ebp
801067c6:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801067c8:	05 00 00 00 80       	add    $0x80000000,%eax
801067cd:	0f 22 d8             	mov    %eax,%cr3
}
801067d0:	5d                   	pop    %ebp
801067d1:	c3                   	ret    
801067d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801067d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801067e0 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
801067e0:	55                   	push   %ebp
801067e1:	89 e5                	mov    %esp,%ebp
801067e3:	53                   	push   %ebx
801067e4:	83 ec 14             	sub    $0x14,%esp
801067e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
801067ea:	85 db                	test   %ebx,%ebx
801067ec:	0f 84 94 00 00 00    	je     80106886 <switchuvm+0xa6>
    panic("switchuvm: no process");
  if(p->kstack == 0)
801067f2:	8b 43 08             	mov    0x8(%ebx),%eax
801067f5:	85 c0                	test   %eax,%eax
801067f7:	0f 84 a1 00 00 00    	je     8010689e <switchuvm+0xbe>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
801067fd:	8b 43 04             	mov    0x4(%ebx),%eax
80106800:	85 c0                	test   %eax,%eax
80106802:	0f 84 8a 00 00 00    	je     80106892 <switchuvm+0xb2>
    panic("switchuvm: no pgdir");

  pushcli();
80106808:	e8 83 da ff ff       	call   80104290 <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
8010680d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106813:	b9 67 00 00 00       	mov    $0x67,%ecx
80106818:	8d 50 08             	lea    0x8(%eax),%edx
8010681b:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80106822:	89 d1                	mov    %edx,%ecx
80106824:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
8010682b:	c1 ea 18             	shr    $0x18,%edx
8010682e:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
80106834:	c1 e9 10             	shr    $0x10,%ecx
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
80106837:	ba 10 00 00 00       	mov    $0x10,%edx
8010683c:	66 89 50 10          	mov    %dx,0x10(%eax)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");

  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106840:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
80106846:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
  cpu->gdt[SEG_TSS].s = 0;
8010684d:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106854:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106857:	8d 91 00 10 00 00    	lea    0x1000(%ecx),%edx
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
8010685d:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx

  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106862:	89 50 0c             	mov    %edx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
80106865:	66 89 48 6e          	mov    %cx,0x6e(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80106869:	b8 30 00 00 00       	mov    $0x30,%eax
8010686e:	0f 00 d8             	ltr    %ax
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106871:	8b 43 04             	mov    0x4(%ebx),%eax
80106874:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106879:	0f 22 d8             	mov    %eax,%cr3
  popcli();
}
8010687c:	83 c4 14             	add    $0x14,%esp
8010687f:	5b                   	pop    %ebx
80106880:	5d                   	pop    %ebp
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
80106881:	e9 3a da ff ff       	jmp    801042c0 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
80106886:	c7 04 24 2e 76 10 80 	movl   $0x8010762e,(%esp)
8010688d:	e8 ce 9a ff ff       	call   80100360 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
80106892:	c7 04 24 59 76 10 80 	movl   $0x80107659,(%esp)
80106899:	e8 c2 9a ff ff       	call   80100360 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
8010689e:	c7 04 24 44 76 10 80 	movl   $0x80107644,(%esp)
801068a5:	e8 b6 9a ff ff       	call   80100360 <panic>
801068aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801068b0 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
801068b0:	55                   	push   %ebp
801068b1:	89 e5                	mov    %esp,%ebp
801068b3:	57                   	push   %edi
801068b4:	56                   	push   %esi
801068b5:	53                   	push   %ebx
801068b6:	83 ec 1c             	sub    $0x1c,%esp
801068b9:	8b 75 10             	mov    0x10(%ebp),%esi
801068bc:	8b 45 08             	mov    0x8(%ebp),%eax
801068bf:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
801068c2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
801068c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
801068cb:	77 54                	ja     80106921 <inituvm+0x71>
    panic("inituvm: more than a page");
  mem = kalloc();
801068cd:	e8 be bb ff ff       	call   80102490 <kalloc>
  memset(mem, 0, PGSIZE);
801068d2:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
801068d9:	00 
801068da:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801068e1:	00 
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
801068e2:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
801068e4:	89 04 24             	mov    %eax,(%esp)
801068e7:	e8 74 da ff ff       	call   80104360 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
801068ec:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801068f2:	b9 00 10 00 00       	mov    $0x1000,%ecx
801068f7:	89 04 24             	mov    %eax,(%esp)
801068fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801068fd:	31 d2                	xor    %edx,%edx
801068ff:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
80106906:	00 
80106907:	e8 b4 fb ff ff       	call   801064c0 <mappages>
  memmove(mem, init, sz);
8010690c:	89 75 10             	mov    %esi,0x10(%ebp)
8010690f:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106912:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106915:	83 c4 1c             	add    $0x1c,%esp
80106918:	5b                   	pop    %ebx
80106919:	5e                   	pop    %esi
8010691a:	5f                   	pop    %edi
8010691b:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
8010691c:	e9 df da ff ff       	jmp    80104400 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106921:	c7 04 24 6d 76 10 80 	movl   $0x8010766d,(%esp)
80106928:	e8 33 9a ff ff       	call   80100360 <panic>
8010692d:	8d 76 00             	lea    0x0(%esi),%esi

80106930 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106930:	55                   	push   %ebp
80106931:	89 e5                	mov    %esp,%ebp
80106933:	57                   	push   %edi
80106934:	56                   	push   %esi
80106935:	53                   	push   %ebx
80106936:	83 ec 1c             	sub    $0x1c,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106939:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106940:	0f 85 98 00 00 00    	jne    801069de <loaduvm+0xae>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106946:	8b 75 18             	mov    0x18(%ebp),%esi
80106949:	31 db                	xor    %ebx,%ebx
8010694b:	85 f6                	test   %esi,%esi
8010694d:	75 1a                	jne    80106969 <loaduvm+0x39>
8010694f:	eb 77                	jmp    801069c8 <loaduvm+0x98>
80106951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106958:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010695e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106964:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106967:	76 5f                	jbe    801069c8 <loaduvm+0x98>
80106969:	8b 55 0c             	mov    0xc(%ebp),%edx
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
8010696c:	31 c9                	xor    %ecx,%ecx
8010696e:	8b 45 08             	mov    0x8(%ebp),%eax
80106971:	01 da                	add    %ebx,%edx
80106973:	e8 b8 fa ff ff       	call   80106430 <walkpgdir>
80106978:	85 c0                	test   %eax,%eax
8010697a:	74 56                	je     801069d2 <loaduvm+0xa2>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
8010697c:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
8010697e:	bf 00 10 00 00       	mov    $0x1000,%edi
80106983:	8b 4d 14             	mov    0x14(%ebp),%ecx
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106986:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
8010698b:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
80106991:	0f 42 fe             	cmovb  %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106994:	05 00 00 00 80       	add    $0x80000000,%eax
80106999:	89 44 24 04          	mov    %eax,0x4(%esp)
8010699d:	8b 45 10             	mov    0x10(%ebp),%eax
801069a0:	01 d9                	add    %ebx,%ecx
801069a2:	89 7c 24 0c          	mov    %edi,0xc(%esp)
801069a6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
801069aa:	89 04 24             	mov    %eax,(%esp)
801069ad:	e8 8e af ff ff       	call   80101940 <readi>
801069b2:	39 f8                	cmp    %edi,%eax
801069b4:	74 a2                	je     80106958 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
801069b6:	83 c4 1c             	add    $0x1c,%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
801069b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
801069be:	5b                   	pop    %ebx
801069bf:	5e                   	pop    %esi
801069c0:	5f                   	pop    %edi
801069c1:	5d                   	pop    %ebp
801069c2:	c3                   	ret    
801069c3:	90                   	nop
801069c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801069c8:	83 c4 1c             	add    $0x1c,%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
801069cb:	31 c0                	xor    %eax,%eax
}
801069cd:	5b                   	pop    %ebx
801069ce:	5e                   	pop    %esi
801069cf:	5f                   	pop    %edi
801069d0:	5d                   	pop    %ebp
801069d1:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
801069d2:	c7 04 24 87 76 10 80 	movl   $0x80107687,(%esp)
801069d9:	e8 82 99 ff ff       	call   80100360 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
801069de:	c7 04 24 28 77 10 80 	movl   $0x80107728,(%esp)
801069e5:	e8 76 99 ff ff       	call   80100360 <panic>
801069ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801069f0 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
801069f0:	55                   	push   %ebp
801069f1:	89 e5                	mov    %esp,%ebp
801069f3:	57                   	push   %edi
801069f4:	56                   	push   %esi
801069f5:	53                   	push   %ebx
801069f6:	83 ec 1c             	sub    $0x1c,%esp
801069f9:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
801069fc:	85 ff                	test   %edi,%edi
801069fe:	0f 88 7e 00 00 00    	js     80106a82 <allocuvm+0x92>
    return 0;
  if(newsz < oldsz)
80106a04:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106a07:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106a0a:	72 78                	jb     80106a84 <allocuvm+0x94>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106a0c:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106a12:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106a18:	39 df                	cmp    %ebx,%edi
80106a1a:	77 4a                	ja     80106a66 <allocuvm+0x76>
80106a1c:	eb 72                	jmp    80106a90 <allocuvm+0xa0>
80106a1e:	66 90                	xchg   %ax,%ax
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106a20:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106a27:	00 
80106a28:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106a2f:	00 
80106a30:	89 04 24             	mov    %eax,(%esp)
80106a33:	e8 28 d9 ff ff       	call   80104360 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106a38:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106a3e:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106a43:	89 04 24             	mov    %eax,(%esp)
80106a46:	8b 45 08             	mov    0x8(%ebp),%eax
80106a49:	89 da                	mov    %ebx,%edx
80106a4b:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
80106a52:	00 
80106a53:	e8 68 fa ff ff       	call   801064c0 <mappages>
80106a58:	85 c0                	test   %eax,%eax
80106a5a:	78 44                	js     80106aa0 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106a5c:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106a62:	39 df                	cmp    %ebx,%edi
80106a64:	76 2a                	jbe    80106a90 <allocuvm+0xa0>
    mem = kalloc();
80106a66:	e8 25 ba ff ff       	call   80102490 <kalloc>
    if(mem == 0){
80106a6b:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106a6d:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106a6f:	75 af                	jne    80106a20 <allocuvm+0x30>
      cprintf("allocuvm out of memory\n");
80106a71:	c7 04 24 a5 76 10 80 	movl   $0x801076a5,(%esp)
80106a78:	e8 d3 9b ff ff       	call   80100650 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106a7d:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106a80:	77 48                	ja     80106aca <allocuvm+0xda>
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80106a82:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80106a84:	83 c4 1c             	add    $0x1c,%esp
80106a87:	5b                   	pop    %ebx
80106a88:	5e                   	pop    %esi
80106a89:	5f                   	pop    %edi
80106a8a:	5d                   	pop    %ebp
80106a8b:	c3                   	ret    
80106a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106a90:	83 c4 1c             	add    $0x1c,%esp
80106a93:	89 f8                	mov    %edi,%eax
80106a95:	5b                   	pop    %ebx
80106a96:	5e                   	pop    %esi
80106a97:	5f                   	pop    %edi
80106a98:	5d                   	pop    %ebp
80106a99:	c3                   	ret    
80106a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106aa0:	c7 04 24 bd 76 10 80 	movl   $0x801076bd,(%esp)
80106aa7:	e8 a4 9b ff ff       	call   80100650 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106aac:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106aaf:	76 0d                	jbe    80106abe <allocuvm+0xce>
80106ab1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106ab4:	89 fa                	mov    %edi,%edx
80106ab6:	8b 45 08             	mov    0x8(%ebp),%eax
80106ab9:	e8 82 fa ff ff       	call   80106540 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106abe:	89 34 24             	mov    %esi,(%esp)
80106ac1:	e8 1a b8 ff ff       	call   801022e0 <kfree>
      return 0;
80106ac6:	31 c0                	xor    %eax,%eax
80106ac8:	eb ba                	jmp    80106a84 <allocuvm+0x94>
80106aca:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106acd:	89 fa                	mov    %edi,%edx
80106acf:	8b 45 08             	mov    0x8(%ebp),%eax
80106ad2:	e8 69 fa ff ff       	call   80106540 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106ad7:	31 c0                	xor    %eax,%eax
80106ad9:	eb a9                	jmp    80106a84 <allocuvm+0x94>
80106adb:	90                   	nop
80106adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106ae0 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106ae0:	55                   	push   %ebp
80106ae1:	89 e5                	mov    %esp,%ebp
80106ae3:	8b 55 0c             	mov    0xc(%ebp),%edx
80106ae6:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106ae9:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106aec:	39 d1                	cmp    %edx,%ecx
80106aee:	73 08                	jae    80106af8 <deallocuvm+0x18>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106af0:	5d                   	pop    %ebp
80106af1:	e9 4a fa ff ff       	jmp    80106540 <deallocuvm.part.0>
80106af6:	66 90                	xchg   %ax,%ax
80106af8:	89 d0                	mov    %edx,%eax
80106afa:	5d                   	pop    %ebp
80106afb:	c3                   	ret    
80106afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106b00 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106b00:	55                   	push   %ebp
80106b01:	89 e5                	mov    %esp,%ebp
80106b03:	56                   	push   %esi
80106b04:	53                   	push   %ebx
80106b05:	83 ec 10             	sub    $0x10,%esp
80106b08:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106b0b:	85 f6                	test   %esi,%esi
80106b0d:	74 59                	je     80106b68 <freevm+0x68>
80106b0f:	31 c9                	xor    %ecx,%ecx
80106b11:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106b16:	89 f0                	mov    %esi,%eax
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106b18:	31 db                	xor    %ebx,%ebx
80106b1a:	e8 21 fa ff ff       	call   80106540 <deallocuvm.part.0>
80106b1f:	eb 12                	jmp    80106b33 <freevm+0x33>
80106b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b28:	83 c3 01             	add    $0x1,%ebx
80106b2b:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
80106b31:	74 27                	je     80106b5a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106b33:	8b 14 9e             	mov    (%esi,%ebx,4),%edx
80106b36:	f6 c2 01             	test   $0x1,%dl
80106b39:	74 ed                	je     80106b28 <freevm+0x28>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106b3b:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106b41:	83 c3 01             	add    $0x1,%ebx
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106b44:	81 c2 00 00 00 80    	add    $0x80000000,%edx
      kfree(v);
80106b4a:	89 14 24             	mov    %edx,(%esp)
80106b4d:	e8 8e b7 ff ff       	call   801022e0 <kfree>
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106b52:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
80106b58:	75 d9                	jne    80106b33 <freevm+0x33>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106b5a:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106b5d:	83 c4 10             	add    $0x10,%esp
80106b60:	5b                   	pop    %ebx
80106b61:	5e                   	pop    %esi
80106b62:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106b63:	e9 78 b7 ff ff       	jmp    801022e0 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80106b68:	c7 04 24 d9 76 10 80 	movl   $0x801076d9,(%esp)
80106b6f:	e8 ec 97 ff ff       	call   80100360 <panic>
80106b74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106b80 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106b80:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106b81:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106b83:	89 e5                	mov    %esp,%ebp
80106b85:	83 ec 18             	sub    $0x18,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106b88:	8b 55 0c             	mov    0xc(%ebp),%edx
80106b8b:	8b 45 08             	mov    0x8(%ebp),%eax
80106b8e:	e8 9d f8 ff ff       	call   80106430 <walkpgdir>
  if(pte == 0)
80106b93:	85 c0                	test   %eax,%eax
80106b95:	74 05                	je     80106b9c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106b97:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106b9a:	c9                   	leave  
80106b9b:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
80106b9c:	c7 04 24 ea 76 10 80 	movl   $0x801076ea,(%esp)
80106ba3:	e8 b8 97 ff ff       	call   80100360 <panic>
80106ba8:	90                   	nop
80106ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106bb0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106bb0:	55                   	push   %ebp
80106bb1:	89 e5                	mov    %esp,%ebp
80106bb3:	57                   	push   %edi
80106bb4:	56                   	push   %esi
80106bb5:	53                   	push   %ebx
80106bb6:	83 ec 2c             	sub    $0x2c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106bb9:	e8 62 fb ff ff       	call   80106720 <setupkvm>
80106bbe:	85 c0                	test   %eax,%eax
80106bc0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106bc3:	0f 84 b2 00 00 00    	je     80106c7b <copyuvm+0xcb>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106bc9:	8b 45 0c             	mov    0xc(%ebp),%eax
80106bcc:	85 c0                	test   %eax,%eax
80106bce:	0f 84 9c 00 00 00    	je     80106c70 <copyuvm+0xc0>
80106bd4:	31 db                	xor    %ebx,%ebx
80106bd6:	eb 48                	jmp    80106c20 <copyuvm+0x70>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106bd8:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106bde:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106be5:	00 
80106be6:	89 7c 24 04          	mov    %edi,0x4(%esp)
80106bea:	89 04 24             	mov    %eax,(%esp)
80106bed:	e8 0e d8 ff ff       	call   80104400 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80106bf2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106bf5:	8d 96 00 00 00 80    	lea    -0x80000000(%esi),%edx
80106bfb:	89 14 24             	mov    %edx,(%esp)
80106bfe:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106c03:	89 da                	mov    %ebx,%edx
80106c05:	89 44 24 04          	mov    %eax,0x4(%esp)
80106c09:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106c0c:	e8 af f8 ff ff       	call   801064c0 <mappages>
80106c11:	85 c0                	test   %eax,%eax
80106c13:	78 41                	js     80106c56 <copyuvm+0xa6>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106c15:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c1b:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
80106c1e:	76 50                	jbe    80106c70 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106c20:	8b 45 08             	mov    0x8(%ebp),%eax
80106c23:	31 c9                	xor    %ecx,%ecx
80106c25:	89 da                	mov    %ebx,%edx
80106c27:	e8 04 f8 ff ff       	call   80106430 <walkpgdir>
80106c2c:	85 c0                	test   %eax,%eax
80106c2e:	74 5b                	je     80106c8b <copyuvm+0xdb>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106c30:	8b 30                	mov    (%eax),%esi
80106c32:	f7 c6 01 00 00 00    	test   $0x1,%esi
80106c38:	74 45                	je     80106c7f <copyuvm+0xcf>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106c3a:	89 f7                	mov    %esi,%edi
    flags = PTE_FLAGS(*pte);
80106c3c:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
80106c42:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106c45:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
80106c4b:	e8 40 b8 ff ff       	call   80102490 <kalloc>
80106c50:	85 c0                	test   %eax,%eax
80106c52:	89 c6                	mov    %eax,%esi
80106c54:	75 82                	jne    80106bd8 <copyuvm+0x28>
      goto bad;
  }
  return d;

bad:
  freevm(d);
80106c56:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106c59:	89 04 24             	mov    %eax,(%esp)
80106c5c:	e8 9f fe ff ff       	call   80106b00 <freevm>
  return 0;
80106c61:	31 c0                	xor    %eax,%eax
}
80106c63:	83 c4 2c             	add    $0x2c,%esp
80106c66:	5b                   	pop    %ebx
80106c67:	5e                   	pop    %esi
80106c68:	5f                   	pop    %edi
80106c69:	5d                   	pop    %ebp
80106c6a:	c3                   	ret    
80106c6b:	90                   	nop
80106c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106c70:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106c73:	83 c4 2c             	add    $0x2c,%esp
80106c76:	5b                   	pop    %ebx
80106c77:	5e                   	pop    %esi
80106c78:	5f                   	pop    %edi
80106c79:	5d                   	pop    %ebp
80106c7a:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
80106c7b:	31 c0                	xor    %eax,%eax
80106c7d:	eb e4                	jmp    80106c63 <copyuvm+0xb3>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80106c7f:	c7 04 24 0e 77 10 80 	movl   $0x8010770e,(%esp)
80106c86:	e8 d5 96 ff ff       	call   80100360 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
80106c8b:	c7 04 24 f4 76 10 80 	movl   $0x801076f4,(%esp)
80106c92:	e8 c9 96 ff ff       	call   80100360 <panic>
80106c97:	89 f6                	mov    %esi,%esi
80106c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ca0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106ca0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106ca1:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106ca3:	89 e5                	mov    %esp,%ebp
80106ca5:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106ca8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106cab:	8b 45 08             	mov    0x8(%ebp),%eax
80106cae:	e8 7d f7 ff ff       	call   80106430 <walkpgdir>
  if((*pte & PTE_P) == 0)
80106cb3:	8b 00                	mov    (%eax),%eax
80106cb5:	89 c2                	mov    %eax,%edx
80106cb7:	83 e2 05             	and    $0x5,%edx
    return 0;
  if((*pte & PTE_U) == 0)
80106cba:	83 fa 05             	cmp    $0x5,%edx
80106cbd:	75 11                	jne    80106cd0 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106cbf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106cc4:	05 00 00 00 80       	add    $0x80000000,%eax
}
80106cc9:	c9                   	leave  
80106cca:	c3                   	ret    
80106ccb:	90                   	nop
80106ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80106cd0:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80106cd2:	c9                   	leave  
80106cd3:	c3                   	ret    
80106cd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106cda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ce0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106ce0:	55                   	push   %ebp
80106ce1:	89 e5                	mov    %esp,%ebp
80106ce3:	57                   	push   %edi
80106ce4:	56                   	push   %esi
80106ce5:	53                   	push   %ebx
80106ce6:	83 ec 1c             	sub    $0x1c,%esp
80106ce9:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106cec:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106cef:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106cf2:	85 db                	test   %ebx,%ebx
80106cf4:	75 3a                	jne    80106d30 <copyout+0x50>
80106cf6:	eb 68                	jmp    80106d60 <copyout+0x80>
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106cf8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106cfb:	89 f2                	mov    %esi,%edx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106cfd:	89 7c 24 04          	mov    %edi,0x4(%esp)
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106d01:	29 ca                	sub    %ecx,%edx
80106d03:	81 c2 00 10 00 00    	add    $0x1000,%edx
80106d09:	39 da                	cmp    %ebx,%edx
80106d0b:	0f 47 d3             	cmova  %ebx,%edx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106d0e:	29 f1                	sub    %esi,%ecx
80106d10:	01 c8                	add    %ecx,%eax
80106d12:	89 54 24 08          	mov    %edx,0x8(%esp)
80106d16:	89 04 24             	mov    %eax,(%esp)
80106d19:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106d1c:	e8 df d6 ff ff       	call   80104400 <memmove>
    len -= n;
    buf += n;
80106d21:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    va = va0 + PGSIZE;
80106d24:	8d 8e 00 10 00 00    	lea    0x1000(%esi),%ecx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
80106d2a:	01 d7                	add    %edx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106d2c:	29 d3                	sub    %edx,%ebx
80106d2e:	74 30                	je     80106d60 <copyout+0x80>
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
80106d30:	8b 45 08             	mov    0x8(%ebp),%eax
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
80106d33:	89 ce                	mov    %ecx,%esi
80106d35:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80106d3b:	89 74 24 04          	mov    %esi,0x4(%esp)
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
80106d3f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    pa0 = uva2ka(pgdir, (char*)va0);
80106d42:	89 04 24             	mov    %eax,(%esp)
80106d45:	e8 56 ff ff ff       	call   80106ca0 <uva2ka>
    if(pa0 == 0)
80106d4a:	85 c0                	test   %eax,%eax
80106d4c:	75 aa                	jne    80106cf8 <copyout+0x18>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80106d4e:	83 c4 1c             	add    $0x1c,%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
80106d51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80106d56:	5b                   	pop    %ebx
80106d57:	5e                   	pop    %esi
80106d58:	5f                   	pop    %edi
80106d59:	5d                   	pop    %ebp
80106d5a:	c3                   	ret    
80106d5b:	90                   	nop
80106d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106d60:	83 c4 1c             	add    $0x1c,%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
80106d63:	31 c0                	xor    %eax,%eax
}
80106d65:	5b                   	pop    %ebx
80106d66:	5e                   	pop    %esi
80106d67:	5f                   	pop    %edi
80106d68:	5d                   	pop    %ebp
80106d69:	c3                   	ret    
