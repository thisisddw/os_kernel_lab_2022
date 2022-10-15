
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	b8 68 0d 11 00       	mov    $0x110d68,%eax
  10000b:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100010:	89 44 24 08          	mov    %eax,0x8(%esp)
  100014:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001b:	00 
  10001c:	c7 04 24 16 fa 10 00 	movl   $0x10fa16,(%esp)
  100023:	e8 fd 34 00 00       	call   103525 <memset>

    cons_init();                // init the console
  100028:	e8 9d 15 00 00       	call   1015ca <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002d:	c7 45 f4 c0 36 10 00 	movl   $0x1036c0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100034:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100037:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003b:	c7 04 24 dc 36 10 00 	movl   $0x1036dc,(%esp)
  100042:	e8 e2 02 00 00       	call   100329 <cprintf>

    print_kerninfo();
  100047:	e8 00 08 00 00       	call   10084c <print_kerninfo>

    grade_backtrace();
  10004c:	e8 95 00 00 00       	call   1000e6 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100051:	e8 26 2b 00 00       	call   102b7c <pmm_init>

    pic_init();                 // init interrupt controller
  100056:	e8 ca 16 00 00       	call   101725 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005b:	e8 51 18 00 00       	call   1018b1 <idt_init>

    clock_init();               // init clock interrupt
  100060:	e8 06 0d 00 00       	call   100d6b <clock_init>
    intr_enable();              // enable irq interrupt
  100065:	e8 19 16 00 00       	call   101683 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  10006a:	e8 6f 01 00 00       	call   1001de <lab1_switch_test>

    /* do nothing */
    while (1);
  10006f:	eb fe                	jmp    10006f <kern_init+0x6f>

00100071 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100071:	55                   	push   %ebp
  100072:	89 e5                	mov    %esp,%ebp
  100074:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100077:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007e:	00 
  10007f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100086:	00 
  100087:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008e:	e8 f3 0b 00 00       	call   100c86 <mon_backtrace>
}
  100093:	90                   	nop
  100094:	89 ec                	mov    %ebp,%esp
  100096:	5d                   	pop    %ebp
  100097:	c3                   	ret    

00100098 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100098:	55                   	push   %ebp
  100099:	89 e5                	mov    %esp,%ebp
  10009b:	83 ec 18             	sub    $0x18,%esp
  10009e:	89 5d fc             	mov    %ebx,-0x4(%ebp)
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a1:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a4:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000a7:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1000ad:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b1:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b5:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000b9:	89 04 24             	mov    %eax,(%esp)
  1000bc:	e8 b0 ff ff ff       	call   100071 <grade_backtrace2>
}
  1000c1:	90                   	nop
  1000c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000c5:	89 ec                	mov    %ebp,%esp
  1000c7:	5d                   	pop    %ebp
  1000c8:	c3                   	ret    

001000c9 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c9:	55                   	push   %ebp
  1000ca:	89 e5                	mov    %esp,%ebp
  1000cc:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000cf:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d9:	89 04 24             	mov    %eax,(%esp)
  1000dc:	e8 b7 ff ff ff       	call   100098 <grade_backtrace1>
}
  1000e1:	90                   	nop
  1000e2:	89 ec                	mov    %ebp,%esp
  1000e4:	5d                   	pop    %ebp
  1000e5:	c3                   	ret    

001000e6 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e6:	55                   	push   %ebp
  1000e7:	89 e5                	mov    %esp,%ebp
  1000e9:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000ec:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000f1:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f8:	ff 
  1000f9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000fd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100104:	e8 c0 ff ff ff       	call   1000c9 <grade_backtrace0>
}
  100109:	90                   	nop
  10010a:	89 ec                	mov    %ebp,%esp
  10010c:	5d                   	pop    %ebp
  10010d:	c3                   	ret    

0010010e <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  10010e:	55                   	push   %ebp
  10010f:	89 e5                	mov    %esp,%ebp
  100111:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100114:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100117:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10011a:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10011d:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100120:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100124:	83 e0 03             	and    $0x3,%eax
  100127:	89 c2                	mov    %eax,%edx
  100129:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10012e:	89 54 24 08          	mov    %edx,0x8(%esp)
  100132:	89 44 24 04          	mov    %eax,0x4(%esp)
  100136:	c7 04 24 e1 36 10 00 	movl   $0x1036e1,(%esp)
  10013d:	e8 e7 01 00 00       	call   100329 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100142:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100146:	89 c2                	mov    %eax,%edx
  100148:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10014d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100151:	89 44 24 04          	mov    %eax,0x4(%esp)
  100155:	c7 04 24 ef 36 10 00 	movl   $0x1036ef,(%esp)
  10015c:	e8 c8 01 00 00       	call   100329 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100161:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100165:	89 c2                	mov    %eax,%edx
  100167:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10016c:	89 54 24 08          	mov    %edx,0x8(%esp)
  100170:	89 44 24 04          	mov    %eax,0x4(%esp)
  100174:	c7 04 24 fd 36 10 00 	movl   $0x1036fd,(%esp)
  10017b:	e8 a9 01 00 00       	call   100329 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100180:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100184:	89 c2                	mov    %eax,%edx
  100186:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10018b:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100193:	c7 04 24 0b 37 10 00 	movl   $0x10370b,(%esp)
  10019a:	e8 8a 01 00 00       	call   100329 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10019f:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001a3:	89 c2                	mov    %eax,%edx
  1001a5:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001aa:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001ae:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001b2:	c7 04 24 19 37 10 00 	movl   $0x103719,(%esp)
  1001b9:	e8 6b 01 00 00       	call   100329 <cprintf>
    round ++;
  1001be:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001c3:	40                   	inc    %eax
  1001c4:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001c9:	90                   	nop
  1001ca:	89 ec                	mov    %ebp,%esp
  1001cc:	5d                   	pop    %ebp
  1001cd:	c3                   	ret    

001001ce <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001ce:	55                   	push   %ebp
  1001cf:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
    asm volatile(
  1001d1:	cd 78                	int    $0x78
	    "int %0"
        :
        :"i"(T_SWITCH_TOU)
    );
}
  1001d3:	90                   	nop
  1001d4:	5d                   	pop    %ebp
  1001d5:	c3                   	ret    

001001d6 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001d6:	55                   	push   %ebp
  1001d7:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
    asm volatile(
  1001d9:	cd 79                	int    $0x79
        "int %0"
        :
        :"i"(T_SWITCH_TOK)
    );
}
  1001db:	90                   	nop
  1001dc:	5d                   	pop    %ebp
  1001dd:	c3                   	ret    

001001de <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001de:	55                   	push   %ebp
  1001df:	89 e5                	mov    %esp,%ebp
  1001e1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001e4:	e8 25 ff ff ff       	call   10010e <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001e9:	c7 04 24 28 37 10 00 	movl   $0x103728,(%esp)
  1001f0:	e8 34 01 00 00       	call   100329 <cprintf>
    lab1_switch_to_user();
  1001f5:	e8 d4 ff ff ff       	call   1001ce <lab1_switch_to_user>
    lab1_print_cur_status();
  1001fa:	e8 0f ff ff ff       	call   10010e <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001ff:	c7 04 24 48 37 10 00 	movl   $0x103748,(%esp)
  100206:	e8 1e 01 00 00       	call   100329 <cprintf>
    lab1_switch_to_kernel();
  10020b:	e8 c6 ff ff ff       	call   1001d6 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100210:	e8 f9 fe ff ff       	call   10010e <lab1_print_cur_status>
}
  100215:	90                   	nop
  100216:	89 ec                	mov    %ebp,%esp
  100218:	5d                   	pop    %ebp
  100219:	c3                   	ret    

0010021a <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  10021a:	55                   	push   %ebp
  10021b:	89 e5                	mov    %esp,%ebp
  10021d:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100220:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100224:	74 13                	je     100239 <readline+0x1f>
        cprintf("%s", prompt);
  100226:	8b 45 08             	mov    0x8(%ebp),%eax
  100229:	89 44 24 04          	mov    %eax,0x4(%esp)
  10022d:	c7 04 24 67 37 10 00 	movl   $0x103767,(%esp)
  100234:	e8 f0 00 00 00       	call   100329 <cprintf>
    }
    int i = 0, c;
  100239:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100240:	e8 73 01 00 00       	call   1003b8 <getchar>
  100245:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100248:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10024c:	79 07                	jns    100255 <readline+0x3b>
            return NULL;
  10024e:	b8 00 00 00 00       	mov    $0x0,%eax
  100253:	eb 78                	jmp    1002cd <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100255:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100259:	7e 28                	jle    100283 <readline+0x69>
  10025b:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100262:	7f 1f                	jg     100283 <readline+0x69>
            cputchar(c);
  100264:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100267:	89 04 24             	mov    %eax,(%esp)
  10026a:	e8 e2 00 00 00       	call   100351 <cputchar>
            buf[i ++] = c;
  10026f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100272:	8d 50 01             	lea    0x1(%eax),%edx
  100275:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100278:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10027b:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  100281:	eb 45                	jmp    1002c8 <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  100283:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100287:	75 16                	jne    10029f <readline+0x85>
  100289:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10028d:	7e 10                	jle    10029f <readline+0x85>
            cputchar(c);
  10028f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100292:	89 04 24             	mov    %eax,(%esp)
  100295:	e8 b7 00 00 00       	call   100351 <cputchar>
            i --;
  10029a:	ff 4d f4             	decl   -0xc(%ebp)
  10029d:	eb 29                	jmp    1002c8 <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  10029f:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1002a3:	74 06                	je     1002ab <readline+0x91>
  1002a5:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1002a9:	75 95                	jne    100240 <readline+0x26>
            cputchar(c);
  1002ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002ae:	89 04 24             	mov    %eax,(%esp)
  1002b1:	e8 9b 00 00 00       	call   100351 <cputchar>
            buf[i] = '\0';
  1002b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002b9:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1002be:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002c1:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1002c6:	eb 05                	jmp    1002cd <readline+0xb3>
        c = getchar();
  1002c8:	e9 73 ff ff ff       	jmp    100240 <readline+0x26>
        }
    }
}
  1002cd:	89 ec                	mov    %ebp,%esp
  1002cf:	5d                   	pop    %ebp
  1002d0:	c3                   	ret    

001002d1 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002d1:	55                   	push   %ebp
  1002d2:	89 e5                	mov    %esp,%ebp
  1002d4:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1002da:	89 04 24             	mov    %eax,(%esp)
  1002dd:	e8 17 13 00 00       	call   1015f9 <cons_putc>
    (*cnt) ++;
  1002e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002e5:	8b 00                	mov    (%eax),%eax
  1002e7:	8d 50 01             	lea    0x1(%eax),%edx
  1002ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ed:	89 10                	mov    %edx,(%eax)
}
  1002ef:	90                   	nop
  1002f0:	89 ec                	mov    %ebp,%esp
  1002f2:	5d                   	pop    %ebp
  1002f3:	c3                   	ret    

001002f4 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002f4:	55                   	push   %ebp
  1002f5:	89 e5                	mov    %esp,%ebp
  1002f7:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100301:	8b 45 0c             	mov    0xc(%ebp),%eax
  100304:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100308:	8b 45 08             	mov    0x8(%ebp),%eax
  10030b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10030f:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100312:	89 44 24 04          	mov    %eax,0x4(%esp)
  100316:	c7 04 24 d1 02 10 00 	movl   $0x1002d1,(%esp)
  10031d:	e8 2e 2a 00 00       	call   102d50 <vprintfmt>
    return cnt;
  100322:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100325:	89 ec                	mov    %ebp,%esp
  100327:	5d                   	pop    %ebp
  100328:	c3                   	ret    

00100329 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100329:	55                   	push   %ebp
  10032a:	89 e5                	mov    %esp,%ebp
  10032c:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10032f:	8d 45 0c             	lea    0xc(%ebp),%eax
  100332:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100335:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100338:	89 44 24 04          	mov    %eax,0x4(%esp)
  10033c:	8b 45 08             	mov    0x8(%ebp),%eax
  10033f:	89 04 24             	mov    %eax,(%esp)
  100342:	e8 ad ff ff ff       	call   1002f4 <vcprintf>
  100347:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10034a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10034d:	89 ec                	mov    %ebp,%esp
  10034f:	5d                   	pop    %ebp
  100350:	c3                   	ret    

00100351 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100351:	55                   	push   %ebp
  100352:	89 e5                	mov    %esp,%ebp
  100354:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100357:	8b 45 08             	mov    0x8(%ebp),%eax
  10035a:	89 04 24             	mov    %eax,(%esp)
  10035d:	e8 97 12 00 00       	call   1015f9 <cons_putc>
}
  100362:	90                   	nop
  100363:	89 ec                	mov    %ebp,%esp
  100365:	5d                   	pop    %ebp
  100366:	c3                   	ret    

00100367 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100367:	55                   	push   %ebp
  100368:	89 e5                	mov    %esp,%ebp
  10036a:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10036d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100374:	eb 13                	jmp    100389 <cputs+0x22>
        cputch(c, &cnt);
  100376:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10037a:	8d 55 f0             	lea    -0x10(%ebp),%edx
  10037d:	89 54 24 04          	mov    %edx,0x4(%esp)
  100381:	89 04 24             	mov    %eax,(%esp)
  100384:	e8 48 ff ff ff       	call   1002d1 <cputch>
    while ((c = *str ++) != '\0') {
  100389:	8b 45 08             	mov    0x8(%ebp),%eax
  10038c:	8d 50 01             	lea    0x1(%eax),%edx
  10038f:	89 55 08             	mov    %edx,0x8(%ebp)
  100392:	0f b6 00             	movzbl (%eax),%eax
  100395:	88 45 f7             	mov    %al,-0x9(%ebp)
  100398:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  10039c:	75 d8                	jne    100376 <cputs+0xf>
    }
    cputch('\n', &cnt);
  10039e:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1003a1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003a5:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1003ac:	e8 20 ff ff ff       	call   1002d1 <cputch>
    return cnt;
  1003b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1003b4:	89 ec                	mov    %ebp,%esp
  1003b6:	5d                   	pop    %ebp
  1003b7:	c3                   	ret    

001003b8 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1003b8:	55                   	push   %ebp
  1003b9:	89 e5                	mov    %esp,%ebp
  1003bb:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003be:	90                   	nop
  1003bf:	e8 61 12 00 00       	call   101625 <cons_getc>
  1003c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003cb:	74 f2                	je     1003bf <getchar+0x7>
        /* do nothing */;
    return c;
  1003cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003d0:	89 ec                	mov    %ebp,%esp
  1003d2:	5d                   	pop    %ebp
  1003d3:	c3                   	ret    

001003d4 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003d4:	55                   	push   %ebp
  1003d5:	89 e5                	mov    %esp,%ebp
  1003d7:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003da:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003dd:	8b 00                	mov    (%eax),%eax
  1003df:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003e2:	8b 45 10             	mov    0x10(%ebp),%eax
  1003e5:	8b 00                	mov    (%eax),%eax
  1003e7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003f1:	e9 ca 00 00 00       	jmp    1004c0 <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  1003f6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003fc:	01 d0                	add    %edx,%eax
  1003fe:	89 c2                	mov    %eax,%edx
  100400:	c1 ea 1f             	shr    $0x1f,%edx
  100403:	01 d0                	add    %edx,%eax
  100405:	d1 f8                	sar    %eax
  100407:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10040a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10040d:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100410:	eb 03                	jmp    100415 <stab_binsearch+0x41>
            m --;
  100412:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  100415:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100418:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10041b:	7c 1f                	jl     10043c <stab_binsearch+0x68>
  10041d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100420:	89 d0                	mov    %edx,%eax
  100422:	01 c0                	add    %eax,%eax
  100424:	01 d0                	add    %edx,%eax
  100426:	c1 e0 02             	shl    $0x2,%eax
  100429:	89 c2                	mov    %eax,%edx
  10042b:	8b 45 08             	mov    0x8(%ebp),%eax
  10042e:	01 d0                	add    %edx,%eax
  100430:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100434:	0f b6 c0             	movzbl %al,%eax
  100437:	39 45 14             	cmp    %eax,0x14(%ebp)
  10043a:	75 d6                	jne    100412 <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  10043c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10043f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100442:	7d 09                	jge    10044d <stab_binsearch+0x79>
            l = true_m + 1;
  100444:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100447:	40                   	inc    %eax
  100448:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10044b:	eb 73                	jmp    1004c0 <stab_binsearch+0xec>
        }

        // actual binary search
        any_matches = 1;
  10044d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100454:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100457:	89 d0                	mov    %edx,%eax
  100459:	01 c0                	add    %eax,%eax
  10045b:	01 d0                	add    %edx,%eax
  10045d:	c1 e0 02             	shl    $0x2,%eax
  100460:	89 c2                	mov    %eax,%edx
  100462:	8b 45 08             	mov    0x8(%ebp),%eax
  100465:	01 d0                	add    %edx,%eax
  100467:	8b 40 08             	mov    0x8(%eax),%eax
  10046a:	39 45 18             	cmp    %eax,0x18(%ebp)
  10046d:	76 11                	jbe    100480 <stab_binsearch+0xac>
            *region_left = m;
  10046f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100472:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100475:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100477:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10047a:	40                   	inc    %eax
  10047b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10047e:	eb 40                	jmp    1004c0 <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  100480:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100483:	89 d0                	mov    %edx,%eax
  100485:	01 c0                	add    %eax,%eax
  100487:	01 d0                	add    %edx,%eax
  100489:	c1 e0 02             	shl    $0x2,%eax
  10048c:	89 c2                	mov    %eax,%edx
  10048e:	8b 45 08             	mov    0x8(%ebp),%eax
  100491:	01 d0                	add    %edx,%eax
  100493:	8b 40 08             	mov    0x8(%eax),%eax
  100496:	39 45 18             	cmp    %eax,0x18(%ebp)
  100499:	73 14                	jae    1004af <stab_binsearch+0xdb>
            *region_right = m - 1;
  10049b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10049e:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004a1:	8b 45 10             	mov    0x10(%ebp),%eax
  1004a4:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  1004a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a9:	48                   	dec    %eax
  1004aa:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004ad:	eb 11                	jmp    1004c0 <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1004af:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004b2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004b5:	89 10                	mov    %edx,(%eax)
            l = m;
  1004b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004bd:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1004c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004c3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004c6:	0f 8e 2a ff ff ff    	jle    1003f6 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  1004cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004d0:	75 0f                	jne    1004e1 <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  1004d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d5:	8b 00                	mov    (%eax),%eax
  1004d7:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004da:	8b 45 10             	mov    0x10(%ebp),%eax
  1004dd:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1004df:	eb 3e                	jmp    10051f <stab_binsearch+0x14b>
        l = *region_right;
  1004e1:	8b 45 10             	mov    0x10(%ebp),%eax
  1004e4:	8b 00                	mov    (%eax),%eax
  1004e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004e9:	eb 03                	jmp    1004ee <stab_binsearch+0x11a>
  1004eb:	ff 4d fc             	decl   -0x4(%ebp)
  1004ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004f1:	8b 00                	mov    (%eax),%eax
  1004f3:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1004f6:	7e 1f                	jle    100517 <stab_binsearch+0x143>
  1004f8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004fb:	89 d0                	mov    %edx,%eax
  1004fd:	01 c0                	add    %eax,%eax
  1004ff:	01 d0                	add    %edx,%eax
  100501:	c1 e0 02             	shl    $0x2,%eax
  100504:	89 c2                	mov    %eax,%edx
  100506:	8b 45 08             	mov    0x8(%ebp),%eax
  100509:	01 d0                	add    %edx,%eax
  10050b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10050f:	0f b6 c0             	movzbl %al,%eax
  100512:	39 45 14             	cmp    %eax,0x14(%ebp)
  100515:	75 d4                	jne    1004eb <stab_binsearch+0x117>
        *region_left = l;
  100517:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051a:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10051d:	89 10                	mov    %edx,(%eax)
}
  10051f:	90                   	nop
  100520:	89 ec                	mov    %ebp,%esp
  100522:	5d                   	pop    %ebp
  100523:	c3                   	ret    

00100524 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100524:	55                   	push   %ebp
  100525:	89 e5                	mov    %esp,%ebp
  100527:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  10052a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052d:	c7 00 6c 37 10 00    	movl   $0x10376c,(%eax)
    info->eip_line = 0;
  100533:	8b 45 0c             	mov    0xc(%ebp),%eax
  100536:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10053d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100540:	c7 40 08 6c 37 10 00 	movl   $0x10376c,0x8(%eax)
    info->eip_fn_namelen = 9;
  100547:	8b 45 0c             	mov    0xc(%ebp),%eax
  10054a:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100551:	8b 45 0c             	mov    0xc(%ebp),%eax
  100554:	8b 55 08             	mov    0x8(%ebp),%edx
  100557:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10055a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10055d:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100564:	c7 45 f4 2c 40 10 00 	movl   $0x10402c,-0xc(%ebp)
    stab_end = __STAB_END__;
  10056b:	c7 45 f0 58 bf 10 00 	movl   $0x10bf58,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100572:	c7 45 ec 59 bf 10 00 	movl   $0x10bf59,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100579:	c7 45 e8 db e8 10 00 	movl   $0x10e8db,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100580:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100583:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100586:	76 0b                	jbe    100593 <debuginfo_eip+0x6f>
  100588:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10058b:	48                   	dec    %eax
  10058c:	0f b6 00             	movzbl (%eax),%eax
  10058f:	84 c0                	test   %al,%al
  100591:	74 0a                	je     10059d <debuginfo_eip+0x79>
        return -1;
  100593:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100598:	e9 ab 02 00 00       	jmp    100848 <debuginfo_eip+0x324>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  10059d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1005a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005a7:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1005aa:	c1 f8 02             	sar    $0x2,%eax
  1005ad:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1005b3:	48                   	dec    %eax
  1005b4:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ba:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005be:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005c5:	00 
  1005c6:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005c9:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005cd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005d0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005d7:	89 04 24             	mov    %eax,(%esp)
  1005da:	e8 f5 fd ff ff       	call   1003d4 <stab_binsearch>
    if (lfile == 0)
  1005df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005e2:	85 c0                	test   %eax,%eax
  1005e4:	75 0a                	jne    1005f0 <debuginfo_eip+0xcc>
        return -1;
  1005e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005eb:	e9 58 02 00 00       	jmp    100848 <debuginfo_eip+0x324>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005f3:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005f9:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ff:	89 44 24 10          	mov    %eax,0x10(%esp)
  100603:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  10060a:	00 
  10060b:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10060e:	89 44 24 08          	mov    %eax,0x8(%esp)
  100612:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100615:	89 44 24 04          	mov    %eax,0x4(%esp)
  100619:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10061c:	89 04 24             	mov    %eax,(%esp)
  10061f:	e8 b0 fd ff ff       	call   1003d4 <stab_binsearch>

    if (lfun <= rfun) {
  100624:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100627:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10062a:	39 c2                	cmp    %eax,%edx
  10062c:	7f 78                	jg     1006a6 <debuginfo_eip+0x182>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10062e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100631:	89 c2                	mov    %eax,%edx
  100633:	89 d0                	mov    %edx,%eax
  100635:	01 c0                	add    %eax,%eax
  100637:	01 d0                	add    %edx,%eax
  100639:	c1 e0 02             	shl    $0x2,%eax
  10063c:	89 c2                	mov    %eax,%edx
  10063e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100641:	01 d0                	add    %edx,%eax
  100643:	8b 10                	mov    (%eax),%edx
  100645:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100648:	2b 45 ec             	sub    -0x14(%ebp),%eax
  10064b:	39 c2                	cmp    %eax,%edx
  10064d:	73 22                	jae    100671 <debuginfo_eip+0x14d>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10064f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100652:	89 c2                	mov    %eax,%edx
  100654:	89 d0                	mov    %edx,%eax
  100656:	01 c0                	add    %eax,%eax
  100658:	01 d0                	add    %edx,%eax
  10065a:	c1 e0 02             	shl    $0x2,%eax
  10065d:	89 c2                	mov    %eax,%edx
  10065f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100662:	01 d0                	add    %edx,%eax
  100664:	8b 10                	mov    (%eax),%edx
  100666:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100669:	01 c2                	add    %eax,%edx
  10066b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10066e:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100671:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100674:	89 c2                	mov    %eax,%edx
  100676:	89 d0                	mov    %edx,%eax
  100678:	01 c0                	add    %eax,%eax
  10067a:	01 d0                	add    %edx,%eax
  10067c:	c1 e0 02             	shl    $0x2,%eax
  10067f:	89 c2                	mov    %eax,%edx
  100681:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100684:	01 d0                	add    %edx,%eax
  100686:	8b 50 08             	mov    0x8(%eax),%edx
  100689:	8b 45 0c             	mov    0xc(%ebp),%eax
  10068c:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10068f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100692:	8b 40 10             	mov    0x10(%eax),%eax
  100695:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100698:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10069b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10069e:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1006a4:	eb 15                	jmp    1006bb <debuginfo_eip+0x197>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  1006a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006a9:	8b 55 08             	mov    0x8(%ebp),%edx
  1006ac:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006b2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006be:	8b 40 08             	mov    0x8(%eax),%eax
  1006c1:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006c8:	00 
  1006c9:	89 04 24             	mov    %eax,(%esp)
  1006cc:	e8 cc 2c 00 00       	call   10339d <strfind>
  1006d1:	8b 55 0c             	mov    0xc(%ebp),%edx
  1006d4:	8b 4a 08             	mov    0x8(%edx),%ecx
  1006d7:	29 c8                	sub    %ecx,%eax
  1006d9:	89 c2                	mov    %eax,%edx
  1006db:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006de:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1006e4:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006e8:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006ef:	00 
  1006f0:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006f3:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006f7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006fa:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100701:	89 04 24             	mov    %eax,(%esp)
  100704:	e8 cb fc ff ff       	call   1003d4 <stab_binsearch>
    if (lline <= rline) {
  100709:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10070c:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10070f:	39 c2                	cmp    %eax,%edx
  100711:	7f 23                	jg     100736 <debuginfo_eip+0x212>
        info->eip_line = stabs[rline].n_desc;
  100713:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100716:	89 c2                	mov    %eax,%edx
  100718:	89 d0                	mov    %edx,%eax
  10071a:	01 c0                	add    %eax,%eax
  10071c:	01 d0                	add    %edx,%eax
  10071e:	c1 e0 02             	shl    $0x2,%eax
  100721:	89 c2                	mov    %eax,%edx
  100723:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100726:	01 d0                	add    %edx,%eax
  100728:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10072c:	89 c2                	mov    %eax,%edx
  10072e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100731:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100734:	eb 11                	jmp    100747 <debuginfo_eip+0x223>
        return -1;
  100736:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10073b:	e9 08 01 00 00       	jmp    100848 <debuginfo_eip+0x324>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100740:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100743:	48                   	dec    %eax
  100744:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100747:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10074a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10074d:	39 c2                	cmp    %eax,%edx
  10074f:	7c 56                	jl     1007a7 <debuginfo_eip+0x283>
           && stabs[lline].n_type != N_SOL
  100751:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100754:	89 c2                	mov    %eax,%edx
  100756:	89 d0                	mov    %edx,%eax
  100758:	01 c0                	add    %eax,%eax
  10075a:	01 d0                	add    %edx,%eax
  10075c:	c1 e0 02             	shl    $0x2,%eax
  10075f:	89 c2                	mov    %eax,%edx
  100761:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100764:	01 d0                	add    %edx,%eax
  100766:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10076a:	3c 84                	cmp    $0x84,%al
  10076c:	74 39                	je     1007a7 <debuginfo_eip+0x283>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10076e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100771:	89 c2                	mov    %eax,%edx
  100773:	89 d0                	mov    %edx,%eax
  100775:	01 c0                	add    %eax,%eax
  100777:	01 d0                	add    %edx,%eax
  100779:	c1 e0 02             	shl    $0x2,%eax
  10077c:	89 c2                	mov    %eax,%edx
  10077e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100781:	01 d0                	add    %edx,%eax
  100783:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100787:	3c 64                	cmp    $0x64,%al
  100789:	75 b5                	jne    100740 <debuginfo_eip+0x21c>
  10078b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10078e:	89 c2                	mov    %eax,%edx
  100790:	89 d0                	mov    %edx,%eax
  100792:	01 c0                	add    %eax,%eax
  100794:	01 d0                	add    %edx,%eax
  100796:	c1 e0 02             	shl    $0x2,%eax
  100799:	89 c2                	mov    %eax,%edx
  10079b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10079e:	01 d0                	add    %edx,%eax
  1007a0:	8b 40 08             	mov    0x8(%eax),%eax
  1007a3:	85 c0                	test   %eax,%eax
  1007a5:	74 99                	je     100740 <debuginfo_eip+0x21c>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  1007a7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007ad:	39 c2                	cmp    %eax,%edx
  1007af:	7c 42                	jl     1007f3 <debuginfo_eip+0x2cf>
  1007b1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007b4:	89 c2                	mov    %eax,%edx
  1007b6:	89 d0                	mov    %edx,%eax
  1007b8:	01 c0                	add    %eax,%eax
  1007ba:	01 d0                	add    %edx,%eax
  1007bc:	c1 e0 02             	shl    $0x2,%eax
  1007bf:	89 c2                	mov    %eax,%edx
  1007c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007c4:	01 d0                	add    %edx,%eax
  1007c6:	8b 10                	mov    (%eax),%edx
  1007c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1007cb:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1007ce:	39 c2                	cmp    %eax,%edx
  1007d0:	73 21                	jae    1007f3 <debuginfo_eip+0x2cf>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007d2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007d5:	89 c2                	mov    %eax,%edx
  1007d7:	89 d0                	mov    %edx,%eax
  1007d9:	01 c0                	add    %eax,%eax
  1007db:	01 d0                	add    %edx,%eax
  1007dd:	c1 e0 02             	shl    $0x2,%eax
  1007e0:	89 c2                	mov    %eax,%edx
  1007e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007e5:	01 d0                	add    %edx,%eax
  1007e7:	8b 10                	mov    (%eax),%edx
  1007e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007ec:	01 c2                	add    %eax,%edx
  1007ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007f1:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007f3:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007f6:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f9:	39 c2                	cmp    %eax,%edx
  1007fb:	7d 46                	jge    100843 <debuginfo_eip+0x31f>
        for (lline = lfun + 1;
  1007fd:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100800:	40                   	inc    %eax
  100801:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100804:	eb 16                	jmp    10081c <debuginfo_eip+0x2f8>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100806:	8b 45 0c             	mov    0xc(%ebp),%eax
  100809:	8b 40 14             	mov    0x14(%eax),%eax
  10080c:	8d 50 01             	lea    0x1(%eax),%edx
  10080f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100812:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100815:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100818:	40                   	inc    %eax
  100819:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  10081c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10081f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100822:	39 c2                	cmp    %eax,%edx
  100824:	7d 1d                	jge    100843 <debuginfo_eip+0x31f>
  100826:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100829:	89 c2                	mov    %eax,%edx
  10082b:	89 d0                	mov    %edx,%eax
  10082d:	01 c0                	add    %eax,%eax
  10082f:	01 d0                	add    %edx,%eax
  100831:	c1 e0 02             	shl    $0x2,%eax
  100834:	89 c2                	mov    %eax,%edx
  100836:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100839:	01 d0                	add    %edx,%eax
  10083b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10083f:	3c a0                	cmp    $0xa0,%al
  100841:	74 c3                	je     100806 <debuginfo_eip+0x2e2>
        }
    }
    return 0;
  100843:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100848:	89 ec                	mov    %ebp,%esp
  10084a:	5d                   	pop    %ebp
  10084b:	c3                   	ret    

0010084c <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  10084c:	55                   	push   %ebp
  10084d:	89 e5                	mov    %esp,%ebp
  10084f:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100852:	c7 04 24 76 37 10 00 	movl   $0x103776,(%esp)
  100859:	e8 cb fa ff ff       	call   100329 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10085e:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100865:	00 
  100866:	c7 04 24 8f 37 10 00 	movl   $0x10378f,(%esp)
  10086d:	e8 b7 fa ff ff       	call   100329 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100872:	c7 44 24 04 b1 36 10 	movl   $0x1036b1,0x4(%esp)
  100879:	00 
  10087a:	c7 04 24 a7 37 10 00 	movl   $0x1037a7,(%esp)
  100881:	e8 a3 fa ff ff       	call   100329 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100886:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  10088d:	00 
  10088e:	c7 04 24 bf 37 10 00 	movl   $0x1037bf,(%esp)
  100895:	e8 8f fa ff ff       	call   100329 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  10089a:	c7 44 24 04 68 0d 11 	movl   $0x110d68,0x4(%esp)
  1008a1:	00 
  1008a2:	c7 04 24 d7 37 10 00 	movl   $0x1037d7,(%esp)
  1008a9:	e8 7b fa ff ff       	call   100329 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008ae:	b8 68 0d 11 00       	mov    $0x110d68,%eax
  1008b3:	2d 00 00 10 00       	sub    $0x100000,%eax
  1008b8:	05 ff 03 00 00       	add    $0x3ff,%eax
  1008bd:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008c3:	85 c0                	test   %eax,%eax
  1008c5:	0f 48 c2             	cmovs  %edx,%eax
  1008c8:	c1 f8 0a             	sar    $0xa,%eax
  1008cb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008cf:	c7 04 24 f0 37 10 00 	movl   $0x1037f0,(%esp)
  1008d6:	e8 4e fa ff ff       	call   100329 <cprintf>
}
  1008db:	90                   	nop
  1008dc:	89 ec                	mov    %ebp,%esp
  1008de:	5d                   	pop    %ebp
  1008df:	c3                   	ret    

001008e0 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008e0:	55                   	push   %ebp
  1008e1:	89 e5                	mov    %esp,%ebp
  1008e3:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008e9:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008ec:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1008f3:	89 04 24             	mov    %eax,(%esp)
  1008f6:	e8 29 fc ff ff       	call   100524 <debuginfo_eip>
  1008fb:	85 c0                	test   %eax,%eax
  1008fd:	74 15                	je     100914 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008ff:	8b 45 08             	mov    0x8(%ebp),%eax
  100902:	89 44 24 04          	mov    %eax,0x4(%esp)
  100906:	c7 04 24 1a 38 10 00 	movl   $0x10381a,(%esp)
  10090d:	e8 17 fa ff ff       	call   100329 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100912:	eb 6c                	jmp    100980 <print_debuginfo+0xa0>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100914:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10091b:	eb 1b                	jmp    100938 <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  10091d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100920:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100923:	01 d0                	add    %edx,%eax
  100925:	0f b6 10             	movzbl (%eax),%edx
  100928:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10092e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100931:	01 c8                	add    %ecx,%eax
  100933:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100935:	ff 45 f4             	incl   -0xc(%ebp)
  100938:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10093b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  10093e:	7c dd                	jl     10091d <print_debuginfo+0x3d>
        fnname[j] = '\0';
  100940:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100946:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100949:	01 d0                	add    %edx,%eax
  10094b:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  10094e:	8b 55 ec             	mov    -0x14(%ebp),%edx
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100951:	8b 45 08             	mov    0x8(%ebp),%eax
  100954:	29 d0                	sub    %edx,%eax
  100956:	89 c1                	mov    %eax,%ecx
  100958:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10095b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10095e:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100962:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100968:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  10096c:	89 54 24 08          	mov    %edx,0x8(%esp)
  100970:	89 44 24 04          	mov    %eax,0x4(%esp)
  100974:	c7 04 24 36 38 10 00 	movl   $0x103836,(%esp)
  10097b:	e8 a9 f9 ff ff       	call   100329 <cprintf>
}
  100980:	90                   	nop
  100981:	89 ec                	mov    %ebp,%esp
  100983:	5d                   	pop    %ebp
  100984:	c3                   	ret    

00100985 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100985:	55                   	push   %ebp
  100986:	89 e5                	mov    %esp,%ebp
  100988:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  10098b:	8b 45 04             	mov    0x4(%ebp),%eax
  10098e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100991:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100994:	89 ec                	mov    %ebp,%esp
  100996:	5d                   	pop    %ebp
  100997:	c3                   	ret    

00100998 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100998:	55                   	push   %ebp
  100999:	89 e5                	mov    %esp,%ebp
  10099b:	83 ec 38             	sub    $0x38,%esp
  10099e:	89 5d fc             	mov    %ebx,-0x4(%ebp)
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  1009a1:	89 e8                	mov    %ebp,%eax
  1009a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return ebp;
  1009a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
      uint32_t ebp = read_ebp();
  1009a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
      uint32_t eip = read_eip();
  1009ac:	e8 d4 ff ff ff       	call   100985 <read_eip>
  1009b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
      int cnt = 0;
  1009b4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      while(ebp && cnt++ < STACKFRAME_DEPTH)
  1009bb:	eb 69                	jmp    100a26 <print_stackframe+0x8e>
      {
		  cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x\n", 
		  ebp, eip, *((uint32_t *)ebp + 2), *((uint32_t *)ebp + 3), *((uint32_t *)ebp + 4), *((uint32_t *)ebp + 5));
  1009bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009c0:	83 c0 14             	add    $0x14,%eax
		  cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x\n", 
  1009c3:	8b 18                	mov    (%eax),%ebx
		  ebp, eip, *((uint32_t *)ebp + 2), *((uint32_t *)ebp + 3), *((uint32_t *)ebp + 4), *((uint32_t *)ebp + 5));
  1009c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009c8:	83 c0 10             	add    $0x10,%eax
		  cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x\n", 
  1009cb:	8b 08                	mov    (%eax),%ecx
		  ebp, eip, *((uint32_t *)ebp + 2), *((uint32_t *)ebp + 3), *((uint32_t *)ebp + 4), *((uint32_t *)ebp + 5));
  1009cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009d0:	83 c0 0c             	add    $0xc,%eax
		  cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x\n", 
  1009d3:	8b 10                	mov    (%eax),%edx
		  ebp, eip, *((uint32_t *)ebp + 2), *((uint32_t *)ebp + 3), *((uint32_t *)ebp + 4), *((uint32_t *)ebp + 5));
  1009d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009d8:	83 c0 08             	add    $0x8,%eax
		  cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x\n", 
  1009db:	8b 00                	mov    (%eax),%eax
  1009dd:	89 5c 24 18          	mov    %ebx,0x18(%esp)
  1009e1:	89 4c 24 14          	mov    %ecx,0x14(%esp)
  1009e5:	89 54 24 10          	mov    %edx,0x10(%esp)
  1009e9:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1009ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009f0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009f7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009fb:	c7 04 24 48 38 10 00 	movl   $0x103848,(%esp)
  100a02:	e8 22 f9 ff ff       	call   100329 <cprintf>
		  print_debuginfo(eip - 1);
  100a07:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a0a:	48                   	dec    %eax
  100a0b:	89 04 24             	mov    %eax,(%esp)
  100a0e:	e8 cd fe ff ff       	call   1008e0 <print_debuginfo>
		  eip = *((uint32_t *)(ebp + 4));
  100a13:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a16:	83 c0 04             	add    $0x4,%eax
  100a19:	8b 00                	mov    (%eax),%eax
  100a1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
		  ebp = *((uint32_t *)ebp);
  100a1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a21:	8b 00                	mov    (%eax),%eax
  100a23:	89 45 f4             	mov    %eax,-0xc(%ebp)
      while(ebp && cnt++ < STACKFRAME_DEPTH)
  100a26:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a2a:	74 0e                	je     100a3a <print_stackframe+0xa2>
  100a2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a2f:	8d 50 01             	lea    0x1(%eax),%edx
  100a32:	89 55 ec             	mov    %edx,-0x14(%ebp)
  100a35:	83 f8 13             	cmp    $0x13,%eax
  100a38:	7e 83                	jle    1009bd <print_stackframe+0x25>
      }
}
  100a3a:	90                   	nop
  100a3b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a3e:	89 ec                	mov    %ebp,%esp
  100a40:	5d                   	pop    %ebp
  100a41:	c3                   	ret    

00100a42 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a42:	55                   	push   %ebp
  100a43:	89 e5                	mov    %esp,%ebp
  100a45:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a48:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a4f:	eb 0c                	jmp    100a5d <parse+0x1b>
            *buf ++ = '\0';
  100a51:	8b 45 08             	mov    0x8(%ebp),%eax
  100a54:	8d 50 01             	lea    0x1(%eax),%edx
  100a57:	89 55 08             	mov    %edx,0x8(%ebp)
  100a5a:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a5d:	8b 45 08             	mov    0x8(%ebp),%eax
  100a60:	0f b6 00             	movzbl (%eax),%eax
  100a63:	84 c0                	test   %al,%al
  100a65:	74 1d                	je     100a84 <parse+0x42>
  100a67:	8b 45 08             	mov    0x8(%ebp),%eax
  100a6a:	0f b6 00             	movzbl (%eax),%eax
  100a6d:	0f be c0             	movsbl %al,%eax
  100a70:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a74:	c7 04 24 00 39 10 00 	movl   $0x103900,(%esp)
  100a7b:	e8 e9 28 00 00       	call   103369 <strchr>
  100a80:	85 c0                	test   %eax,%eax
  100a82:	75 cd                	jne    100a51 <parse+0xf>
        }
        if (*buf == '\0') {
  100a84:	8b 45 08             	mov    0x8(%ebp),%eax
  100a87:	0f b6 00             	movzbl (%eax),%eax
  100a8a:	84 c0                	test   %al,%al
  100a8c:	74 65                	je     100af3 <parse+0xb1>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a8e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a92:	75 14                	jne    100aa8 <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a94:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100a9b:	00 
  100a9c:	c7 04 24 05 39 10 00 	movl   $0x103905,(%esp)
  100aa3:	e8 81 f8 ff ff       	call   100329 <cprintf>
        }
        argv[argc ++] = buf;
  100aa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aab:	8d 50 01             	lea    0x1(%eax),%edx
  100aae:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100ab1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ab8:	8b 45 0c             	mov    0xc(%ebp),%eax
  100abb:	01 c2                	add    %eax,%edx
  100abd:	8b 45 08             	mov    0x8(%ebp),%eax
  100ac0:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ac2:	eb 03                	jmp    100ac7 <parse+0x85>
            buf ++;
  100ac4:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ac7:	8b 45 08             	mov    0x8(%ebp),%eax
  100aca:	0f b6 00             	movzbl (%eax),%eax
  100acd:	84 c0                	test   %al,%al
  100acf:	74 8c                	je     100a5d <parse+0x1b>
  100ad1:	8b 45 08             	mov    0x8(%ebp),%eax
  100ad4:	0f b6 00             	movzbl (%eax),%eax
  100ad7:	0f be c0             	movsbl %al,%eax
  100ada:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ade:	c7 04 24 00 39 10 00 	movl   $0x103900,(%esp)
  100ae5:	e8 7f 28 00 00       	call   103369 <strchr>
  100aea:	85 c0                	test   %eax,%eax
  100aec:	74 d6                	je     100ac4 <parse+0x82>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100aee:	e9 6a ff ff ff       	jmp    100a5d <parse+0x1b>
            break;
  100af3:	90                   	nop
        }
    }
    return argc;
  100af4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100af7:	89 ec                	mov    %ebp,%esp
  100af9:	5d                   	pop    %ebp
  100afa:	c3                   	ret    

00100afb <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100afb:	55                   	push   %ebp
  100afc:	89 e5                	mov    %esp,%ebp
  100afe:	83 ec 68             	sub    $0x68,%esp
  100b01:	89 5d fc             	mov    %ebx,-0x4(%ebp)
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b04:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b07:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b0b:	8b 45 08             	mov    0x8(%ebp),%eax
  100b0e:	89 04 24             	mov    %eax,(%esp)
  100b11:	e8 2c ff ff ff       	call   100a42 <parse>
  100b16:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b19:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b1d:	75 0a                	jne    100b29 <runcmd+0x2e>
        return 0;
  100b1f:	b8 00 00 00 00       	mov    $0x0,%eax
  100b24:	e9 83 00 00 00       	jmp    100bac <runcmd+0xb1>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b29:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b30:	eb 5a                	jmp    100b8c <runcmd+0x91>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b32:	8b 55 b0             	mov    -0x50(%ebp),%edx
  100b35:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100b38:	89 c8                	mov    %ecx,%eax
  100b3a:	01 c0                	add    %eax,%eax
  100b3c:	01 c8                	add    %ecx,%eax
  100b3e:	c1 e0 02             	shl    $0x2,%eax
  100b41:	05 00 f0 10 00       	add    $0x10f000,%eax
  100b46:	8b 00                	mov    (%eax),%eax
  100b48:	89 54 24 04          	mov    %edx,0x4(%esp)
  100b4c:	89 04 24             	mov    %eax,(%esp)
  100b4f:	e8 79 27 00 00       	call   1032cd <strcmp>
  100b54:	85 c0                	test   %eax,%eax
  100b56:	75 31                	jne    100b89 <runcmd+0x8e>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b58:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b5b:	89 d0                	mov    %edx,%eax
  100b5d:	01 c0                	add    %eax,%eax
  100b5f:	01 d0                	add    %edx,%eax
  100b61:	c1 e0 02             	shl    $0x2,%eax
  100b64:	05 08 f0 10 00       	add    $0x10f008,%eax
  100b69:	8b 10                	mov    (%eax),%edx
  100b6b:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b6e:	83 c0 04             	add    $0x4,%eax
  100b71:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100b74:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100b77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100b7a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100b7e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b82:	89 1c 24             	mov    %ebx,(%esp)
  100b85:	ff d2                	call   *%edx
  100b87:	eb 23                	jmp    100bac <runcmd+0xb1>
    for (i = 0; i < NCOMMANDS; i ++) {
  100b89:	ff 45 f4             	incl   -0xc(%ebp)
  100b8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b8f:	83 f8 02             	cmp    $0x2,%eax
  100b92:	76 9e                	jbe    100b32 <runcmd+0x37>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b94:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b97:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b9b:	c7 04 24 23 39 10 00 	movl   $0x103923,(%esp)
  100ba2:	e8 82 f7 ff ff       	call   100329 <cprintf>
    return 0;
  100ba7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100baf:	89 ec                	mov    %ebp,%esp
  100bb1:	5d                   	pop    %ebp
  100bb2:	c3                   	ret    

00100bb3 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bb3:	55                   	push   %ebp
  100bb4:	89 e5                	mov    %esp,%ebp
  100bb6:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100bb9:	c7 04 24 3c 39 10 00 	movl   $0x10393c,(%esp)
  100bc0:	e8 64 f7 ff ff       	call   100329 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bc5:	c7 04 24 64 39 10 00 	movl   $0x103964,(%esp)
  100bcc:	e8 58 f7 ff ff       	call   100329 <cprintf>

    if (tf != NULL) {
  100bd1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100bd5:	74 0b                	je     100be2 <kmonitor+0x2f>
        print_trapframe(tf);
  100bd7:	8b 45 08             	mov    0x8(%ebp),%eax
  100bda:	89 04 24             	mov    %eax,(%esp)
  100bdd:	e8 87 0e 00 00       	call   101a69 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100be2:	c7 04 24 89 39 10 00 	movl   $0x103989,(%esp)
  100be9:	e8 2c f6 ff ff       	call   10021a <readline>
  100bee:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bf1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100bf5:	74 eb                	je     100be2 <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100bf7:	8b 45 08             	mov    0x8(%ebp),%eax
  100bfa:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c01:	89 04 24             	mov    %eax,(%esp)
  100c04:	e8 f2 fe ff ff       	call   100afb <runcmd>
  100c09:	85 c0                	test   %eax,%eax
  100c0b:	78 02                	js     100c0f <kmonitor+0x5c>
        if ((buf = readline("K> ")) != NULL) {
  100c0d:	eb d3                	jmp    100be2 <kmonitor+0x2f>
                break;
  100c0f:	90                   	nop
            }
        }
    }
}
  100c10:	90                   	nop
  100c11:	89 ec                	mov    %ebp,%esp
  100c13:	5d                   	pop    %ebp
  100c14:	c3                   	ret    

00100c15 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c15:	55                   	push   %ebp
  100c16:	89 e5                	mov    %esp,%ebp
  100c18:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c22:	eb 3d                	jmp    100c61 <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c24:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c27:	89 d0                	mov    %edx,%eax
  100c29:	01 c0                	add    %eax,%eax
  100c2b:	01 d0                	add    %edx,%eax
  100c2d:	c1 e0 02             	shl    $0x2,%eax
  100c30:	05 04 f0 10 00       	add    $0x10f004,%eax
  100c35:	8b 10                	mov    (%eax),%edx
  100c37:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100c3a:	89 c8                	mov    %ecx,%eax
  100c3c:	01 c0                	add    %eax,%eax
  100c3e:	01 c8                	add    %ecx,%eax
  100c40:	c1 e0 02             	shl    $0x2,%eax
  100c43:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c48:	8b 00                	mov    (%eax),%eax
  100c4a:	89 54 24 08          	mov    %edx,0x8(%esp)
  100c4e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c52:	c7 04 24 8d 39 10 00 	movl   $0x10398d,(%esp)
  100c59:	e8 cb f6 ff ff       	call   100329 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c5e:	ff 45 f4             	incl   -0xc(%ebp)
  100c61:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c64:	83 f8 02             	cmp    $0x2,%eax
  100c67:	76 bb                	jbe    100c24 <mon_help+0xf>
    }
    return 0;
  100c69:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c6e:	89 ec                	mov    %ebp,%esp
  100c70:	5d                   	pop    %ebp
  100c71:	c3                   	ret    

00100c72 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c72:	55                   	push   %ebp
  100c73:	89 e5                	mov    %esp,%ebp
  100c75:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c78:	e8 cf fb ff ff       	call   10084c <print_kerninfo>
    return 0;
  100c7d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c82:	89 ec                	mov    %ebp,%esp
  100c84:	5d                   	pop    %ebp
  100c85:	c3                   	ret    

00100c86 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c86:	55                   	push   %ebp
  100c87:	89 e5                	mov    %esp,%ebp
  100c89:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c8c:	e8 07 fd ff ff       	call   100998 <print_stackframe>
    return 0;
  100c91:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c96:	89 ec                	mov    %ebp,%esp
  100c98:	5d                   	pop    %ebp
  100c99:	c3                   	ret    

00100c9a <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100c9a:	55                   	push   %ebp
  100c9b:	89 e5                	mov    %esp,%ebp
  100c9d:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100ca0:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  100ca5:	85 c0                	test   %eax,%eax
  100ca7:	75 5b                	jne    100d04 <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  100ca9:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  100cb0:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100cb3:	8d 45 14             	lea    0x14(%ebp),%eax
  100cb6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100cb9:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cbc:	89 44 24 08          	mov    %eax,0x8(%esp)
  100cc0:	8b 45 08             	mov    0x8(%ebp),%eax
  100cc3:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cc7:	c7 04 24 96 39 10 00 	movl   $0x103996,(%esp)
  100cce:	e8 56 f6 ff ff       	call   100329 <cprintf>
    vcprintf(fmt, ap);
  100cd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd6:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cda:	8b 45 10             	mov    0x10(%ebp),%eax
  100cdd:	89 04 24             	mov    %eax,(%esp)
  100ce0:	e8 0f f6 ff ff       	call   1002f4 <vcprintf>
    cprintf("\n");
  100ce5:	c7 04 24 b2 39 10 00 	movl   $0x1039b2,(%esp)
  100cec:	e8 38 f6 ff ff       	call   100329 <cprintf>
    
    cprintf("stack trackback:\n");
  100cf1:	c7 04 24 b4 39 10 00 	movl   $0x1039b4,(%esp)
  100cf8:	e8 2c f6 ff ff       	call   100329 <cprintf>
    print_stackframe();
  100cfd:	e8 96 fc ff ff       	call   100998 <print_stackframe>
  100d02:	eb 01                	jmp    100d05 <__panic+0x6b>
        goto panic_dead;
  100d04:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  100d05:	e8 81 09 00 00       	call   10168b <intr_disable>
    while (1) {
        kmonitor(NULL);
  100d0a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d11:	e8 9d fe ff ff       	call   100bb3 <kmonitor>
  100d16:	eb f2                	jmp    100d0a <__panic+0x70>

00100d18 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100d18:	55                   	push   %ebp
  100d19:	89 e5                	mov    %esp,%ebp
  100d1b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d1e:	8d 45 14             	lea    0x14(%ebp),%eax
  100d21:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d24:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d27:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d2b:	8b 45 08             	mov    0x8(%ebp),%eax
  100d2e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d32:	c7 04 24 c6 39 10 00 	movl   $0x1039c6,(%esp)
  100d39:	e8 eb f5 ff ff       	call   100329 <cprintf>
    vcprintf(fmt, ap);
  100d3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d41:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d45:	8b 45 10             	mov    0x10(%ebp),%eax
  100d48:	89 04 24             	mov    %eax,(%esp)
  100d4b:	e8 a4 f5 ff ff       	call   1002f4 <vcprintf>
    cprintf("\n");
  100d50:	c7 04 24 b2 39 10 00 	movl   $0x1039b2,(%esp)
  100d57:	e8 cd f5 ff ff       	call   100329 <cprintf>
    va_end(ap);
}
  100d5c:	90                   	nop
  100d5d:	89 ec                	mov    %ebp,%esp
  100d5f:	5d                   	pop    %ebp
  100d60:	c3                   	ret    

00100d61 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d61:	55                   	push   %ebp
  100d62:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d64:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  100d69:	5d                   	pop    %ebp
  100d6a:	c3                   	ret    

00100d6b <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d6b:	55                   	push   %ebp
  100d6c:	89 e5                	mov    %esp,%ebp
  100d6e:	83 ec 28             	sub    $0x28,%esp
  100d71:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100d77:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d7b:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d7f:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d83:	ee                   	out    %al,(%dx)
}
  100d84:	90                   	nop
  100d85:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d8b:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d8f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d93:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d97:	ee                   	out    %al,(%dx)
}
  100d98:	90                   	nop
  100d99:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100d9f:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100da3:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100da7:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100dab:	ee                   	out    %al,(%dx)
}
  100dac:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100dad:	c7 05 44 fe 10 00 00 	movl   $0x0,0x10fe44
  100db4:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100db7:	c7 04 24 e4 39 10 00 	movl   $0x1039e4,(%esp)
  100dbe:	e8 66 f5 ff ff       	call   100329 <cprintf>
    pic_enable(IRQ_TIMER);
  100dc3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dca:	e8 21 09 00 00       	call   1016f0 <pic_enable>
}
  100dcf:	90                   	nop
  100dd0:	89 ec                	mov    %ebp,%esp
  100dd2:	5d                   	pop    %ebp
  100dd3:	c3                   	ret    

00100dd4 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dd4:	55                   	push   %ebp
  100dd5:	89 e5                	mov    %esp,%ebp
  100dd7:	83 ec 10             	sub    $0x10,%esp
  100dda:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100de0:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100de4:	89 c2                	mov    %eax,%edx
  100de6:	ec                   	in     (%dx),%al
  100de7:	88 45 f1             	mov    %al,-0xf(%ebp)
  100dea:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100df0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100df4:	89 c2                	mov    %eax,%edx
  100df6:	ec                   	in     (%dx),%al
  100df7:	88 45 f5             	mov    %al,-0xb(%ebp)
  100dfa:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e00:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e04:	89 c2                	mov    %eax,%edx
  100e06:	ec                   	in     (%dx),%al
  100e07:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e0a:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e10:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e14:	89 c2                	mov    %eax,%edx
  100e16:	ec                   	in     (%dx),%al
  100e17:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e1a:	90                   	nop
  100e1b:	89 ec                	mov    %ebp,%esp
  100e1d:	5d                   	pop    %ebp
  100e1e:	c3                   	ret    

00100e1f <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e1f:	55                   	push   %ebp
  100e20:	89 e5                	mov    %esp,%ebp
  100e22:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e25:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e2c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e2f:	0f b7 00             	movzwl (%eax),%eax
  100e32:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e36:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e39:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e3e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e41:	0f b7 00             	movzwl (%eax),%eax
  100e44:	0f b7 c0             	movzwl %ax,%eax
  100e47:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e4c:	74 12                	je     100e60 <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e4e:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e55:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100e5c:	b4 03 
  100e5e:	eb 13                	jmp    100e73 <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e60:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e63:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e67:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e6a:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100e71:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e73:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100e7a:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100e7e:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e82:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e86:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100e8a:	ee                   	out    %al,(%dx)
}
  100e8b:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e8c:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100e93:	40                   	inc    %eax
  100e94:	0f b7 c0             	movzwl %ax,%eax
  100e97:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e9b:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100e9f:	89 c2                	mov    %eax,%edx
  100ea1:	ec                   	in     (%dx),%al
  100ea2:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100ea5:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ea9:	0f b6 c0             	movzbl %al,%eax
  100eac:	c1 e0 08             	shl    $0x8,%eax
  100eaf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100eb2:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100eb9:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100ebd:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ec1:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ec5:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100ec9:	ee                   	out    %al,(%dx)
}
  100eca:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100ecb:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ed2:	40                   	inc    %eax
  100ed3:	0f b7 c0             	movzwl %ax,%eax
  100ed6:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100eda:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100ede:	89 c2                	mov    %eax,%edx
  100ee0:	ec                   	in     (%dx),%al
  100ee1:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100ee4:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100ee8:	0f b6 c0             	movzbl %al,%eax
  100eeb:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100eee:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ef1:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100ef6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ef9:	0f b7 c0             	movzwl %ax,%eax
  100efc:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100f02:	90                   	nop
  100f03:	89 ec                	mov    %ebp,%esp
  100f05:	5d                   	pop    %ebp
  100f06:	c3                   	ret    

00100f07 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f07:	55                   	push   %ebp
  100f08:	89 e5                	mov    %esp,%ebp
  100f0a:	83 ec 48             	sub    $0x48,%esp
  100f0d:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f13:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f17:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f1b:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f1f:	ee                   	out    %al,(%dx)
}
  100f20:	90                   	nop
  100f21:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f27:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f2b:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f2f:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f33:	ee                   	out    %al,(%dx)
}
  100f34:	90                   	nop
  100f35:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f3b:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f3f:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f43:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f47:	ee                   	out    %al,(%dx)
}
  100f48:	90                   	nop
  100f49:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f4f:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f53:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f57:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f5b:	ee                   	out    %al,(%dx)
}
  100f5c:	90                   	nop
  100f5d:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100f63:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f67:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f6b:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f6f:	ee                   	out    %al,(%dx)
}
  100f70:	90                   	nop
  100f71:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100f77:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f7b:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f7f:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f83:	ee                   	out    %al,(%dx)
}
  100f84:	90                   	nop
  100f85:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f8b:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f8f:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f93:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f97:	ee                   	out    %al,(%dx)
}
  100f98:	90                   	nop
  100f99:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f9f:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100fa3:	89 c2                	mov    %eax,%edx
  100fa5:	ec                   	in     (%dx),%al
  100fa6:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100fa9:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100fad:	3c ff                	cmp    $0xff,%al
  100faf:	0f 95 c0             	setne  %al
  100fb2:	0f b6 c0             	movzbl %al,%eax
  100fb5:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  100fba:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fc0:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100fc4:	89 c2                	mov    %eax,%edx
  100fc6:	ec                   	in     (%dx),%al
  100fc7:	88 45 f1             	mov    %al,-0xf(%ebp)
  100fca:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100fd0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100fd4:	89 c2                	mov    %eax,%edx
  100fd6:	ec                   	in     (%dx),%al
  100fd7:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fda:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  100fdf:	85 c0                	test   %eax,%eax
  100fe1:	74 0c                	je     100fef <serial_init+0xe8>
        pic_enable(IRQ_COM1);
  100fe3:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fea:	e8 01 07 00 00       	call   1016f0 <pic_enable>
    }
}
  100fef:	90                   	nop
  100ff0:	89 ec                	mov    %ebp,%esp
  100ff2:	5d                   	pop    %ebp
  100ff3:	c3                   	ret    

00100ff4 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100ff4:	55                   	push   %ebp
  100ff5:	89 e5                	mov    %esp,%ebp
  100ff7:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100ffa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101001:	eb 08                	jmp    10100b <lpt_putc_sub+0x17>
        delay();
  101003:	e8 cc fd ff ff       	call   100dd4 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101008:	ff 45 fc             	incl   -0x4(%ebp)
  10100b:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  101011:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101015:	89 c2                	mov    %eax,%edx
  101017:	ec                   	in     (%dx),%al
  101018:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10101b:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10101f:	84 c0                	test   %al,%al
  101021:	78 09                	js     10102c <lpt_putc_sub+0x38>
  101023:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10102a:	7e d7                	jle    101003 <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  10102c:	8b 45 08             	mov    0x8(%ebp),%eax
  10102f:	0f b6 c0             	movzbl %al,%eax
  101032:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101038:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10103b:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10103f:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101043:	ee                   	out    %al,(%dx)
}
  101044:	90                   	nop
  101045:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  10104b:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10104f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101053:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101057:	ee                   	out    %al,(%dx)
}
  101058:	90                   	nop
  101059:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  10105f:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101063:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101067:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10106b:	ee                   	out    %al,(%dx)
}
  10106c:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10106d:	90                   	nop
  10106e:	89 ec                	mov    %ebp,%esp
  101070:	5d                   	pop    %ebp
  101071:	c3                   	ret    

00101072 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101072:	55                   	push   %ebp
  101073:	89 e5                	mov    %esp,%ebp
  101075:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101078:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10107c:	74 0d                	je     10108b <lpt_putc+0x19>
        lpt_putc_sub(c);
  10107e:	8b 45 08             	mov    0x8(%ebp),%eax
  101081:	89 04 24             	mov    %eax,(%esp)
  101084:	e8 6b ff ff ff       	call   100ff4 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  101089:	eb 24                	jmp    1010af <lpt_putc+0x3d>
        lpt_putc_sub('\b');
  10108b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101092:	e8 5d ff ff ff       	call   100ff4 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101097:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10109e:	e8 51 ff ff ff       	call   100ff4 <lpt_putc_sub>
        lpt_putc_sub('\b');
  1010a3:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010aa:	e8 45 ff ff ff       	call   100ff4 <lpt_putc_sub>
}
  1010af:	90                   	nop
  1010b0:	89 ec                	mov    %ebp,%esp
  1010b2:	5d                   	pop    %ebp
  1010b3:	c3                   	ret    

001010b4 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  1010b4:	55                   	push   %ebp
  1010b5:	89 e5                	mov    %esp,%ebp
  1010b7:	83 ec 38             	sub    $0x38,%esp
  1010ba:	89 5d fc             	mov    %ebx,-0x4(%ebp)
    // set black on white
    if (!(c & ~0xFF)) {
  1010bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1010c0:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010c5:	85 c0                	test   %eax,%eax
  1010c7:	75 07                	jne    1010d0 <cga_putc+0x1c>
        c |= 0x0700;
  1010c9:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1010d3:	0f b6 c0             	movzbl %al,%eax
  1010d6:	83 f8 0d             	cmp    $0xd,%eax
  1010d9:	74 72                	je     10114d <cga_putc+0x99>
  1010db:	83 f8 0d             	cmp    $0xd,%eax
  1010de:	0f 8f a3 00 00 00    	jg     101187 <cga_putc+0xd3>
  1010e4:	83 f8 08             	cmp    $0x8,%eax
  1010e7:	74 0a                	je     1010f3 <cga_putc+0x3f>
  1010e9:	83 f8 0a             	cmp    $0xa,%eax
  1010ec:	74 4c                	je     10113a <cga_putc+0x86>
  1010ee:	e9 94 00 00 00       	jmp    101187 <cga_putc+0xd3>
    case '\b':
        if (crt_pos > 0) {
  1010f3:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1010fa:	85 c0                	test   %eax,%eax
  1010fc:	0f 84 af 00 00 00    	je     1011b1 <cga_putc+0xfd>
            crt_pos --;
  101102:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101109:	48                   	dec    %eax
  10110a:	0f b7 c0             	movzwl %ax,%eax
  10110d:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101113:	8b 45 08             	mov    0x8(%ebp),%eax
  101116:	98                   	cwtl   
  101117:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10111c:	98                   	cwtl   
  10111d:	83 c8 20             	or     $0x20,%eax
  101120:	98                   	cwtl   
  101121:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  101127:	0f b7 15 64 fe 10 00 	movzwl 0x10fe64,%edx
  10112e:	01 d2                	add    %edx,%edx
  101130:	01 ca                	add    %ecx,%edx
  101132:	0f b7 c0             	movzwl %ax,%eax
  101135:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101138:	eb 77                	jmp    1011b1 <cga_putc+0xfd>
    case '\n':
        crt_pos += CRT_COLS;
  10113a:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101141:	83 c0 50             	add    $0x50,%eax
  101144:	0f b7 c0             	movzwl %ax,%eax
  101147:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  10114d:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  101154:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  10115b:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  101160:	89 c8                	mov    %ecx,%eax
  101162:	f7 e2                	mul    %edx
  101164:	c1 ea 06             	shr    $0x6,%edx
  101167:	89 d0                	mov    %edx,%eax
  101169:	c1 e0 02             	shl    $0x2,%eax
  10116c:	01 d0                	add    %edx,%eax
  10116e:	c1 e0 04             	shl    $0x4,%eax
  101171:	29 c1                	sub    %eax,%ecx
  101173:	89 ca                	mov    %ecx,%edx
  101175:	0f b7 d2             	movzwl %dx,%edx
  101178:	89 d8                	mov    %ebx,%eax
  10117a:	29 d0                	sub    %edx,%eax
  10117c:	0f b7 c0             	movzwl %ax,%eax
  10117f:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  101185:	eb 2b                	jmp    1011b2 <cga_putc+0xfe>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101187:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  10118d:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101194:	8d 50 01             	lea    0x1(%eax),%edx
  101197:	0f b7 d2             	movzwl %dx,%edx
  10119a:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  1011a1:	01 c0                	add    %eax,%eax
  1011a3:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  1011a6:	8b 45 08             	mov    0x8(%ebp),%eax
  1011a9:	0f b7 c0             	movzwl %ax,%eax
  1011ac:	66 89 02             	mov    %ax,(%edx)
        break;
  1011af:	eb 01                	jmp    1011b2 <cga_putc+0xfe>
        break;
  1011b1:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  1011b2:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011b9:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  1011be:	76 5e                	jbe    10121e <cga_putc+0x16a>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1011c0:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1011c5:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1011cb:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1011d0:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1011d7:	00 
  1011d8:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011dc:	89 04 24             	mov    %eax,(%esp)
  1011df:	e8 83 23 00 00       	call   103567 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011e4:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011eb:	eb 15                	jmp    101202 <cga_putc+0x14e>
            crt_buf[i] = 0x0700 | ' ';
  1011ed:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  1011f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1011f6:	01 c0                	add    %eax,%eax
  1011f8:	01 d0                	add    %edx,%eax
  1011fa:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011ff:	ff 45 f4             	incl   -0xc(%ebp)
  101202:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101209:	7e e2                	jle    1011ed <cga_putc+0x139>
        }
        crt_pos -= CRT_COLS;
  10120b:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101212:	83 e8 50             	sub    $0x50,%eax
  101215:	0f b7 c0             	movzwl %ax,%eax
  101218:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  10121e:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101225:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101229:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10122d:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101231:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101235:	ee                   	out    %al,(%dx)
}
  101236:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  101237:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10123e:	c1 e8 08             	shr    $0x8,%eax
  101241:	0f b7 c0             	movzwl %ax,%eax
  101244:	0f b6 c0             	movzbl %al,%eax
  101247:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  10124e:	42                   	inc    %edx
  10124f:	0f b7 d2             	movzwl %dx,%edx
  101252:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  101256:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101259:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10125d:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101261:	ee                   	out    %al,(%dx)
}
  101262:	90                   	nop
    outb(addr_6845, 15);
  101263:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  10126a:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  10126e:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101272:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101276:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10127a:	ee                   	out    %al,(%dx)
}
  10127b:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  10127c:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101283:	0f b6 c0             	movzbl %al,%eax
  101286:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  10128d:	42                   	inc    %edx
  10128e:	0f b7 d2             	movzwl %dx,%edx
  101291:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  101295:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101298:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10129c:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1012a0:	ee                   	out    %al,(%dx)
}
  1012a1:	90                   	nop
}
  1012a2:	90                   	nop
  1012a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012a6:	89 ec                	mov    %ebp,%esp
  1012a8:	5d                   	pop    %ebp
  1012a9:	c3                   	ret    

001012aa <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  1012aa:	55                   	push   %ebp
  1012ab:	89 e5                	mov    %esp,%ebp
  1012ad:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1012b0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1012b7:	eb 08                	jmp    1012c1 <serial_putc_sub+0x17>
        delay();
  1012b9:	e8 16 fb ff ff       	call   100dd4 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1012be:	ff 45 fc             	incl   -0x4(%ebp)
  1012c1:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012c7:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1012cb:	89 c2                	mov    %eax,%edx
  1012cd:	ec                   	in     (%dx),%al
  1012ce:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1012d1:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1012d5:	0f b6 c0             	movzbl %al,%eax
  1012d8:	83 e0 20             	and    $0x20,%eax
  1012db:	85 c0                	test   %eax,%eax
  1012dd:	75 09                	jne    1012e8 <serial_putc_sub+0x3e>
  1012df:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012e6:	7e d1                	jle    1012b9 <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  1012e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1012eb:	0f b6 c0             	movzbl %al,%eax
  1012ee:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012f4:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012f7:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012fb:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012ff:	ee                   	out    %al,(%dx)
}
  101300:	90                   	nop
}
  101301:	90                   	nop
  101302:	89 ec                	mov    %ebp,%esp
  101304:	5d                   	pop    %ebp
  101305:	c3                   	ret    

00101306 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101306:	55                   	push   %ebp
  101307:	89 e5                	mov    %esp,%ebp
  101309:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10130c:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101310:	74 0d                	je     10131f <serial_putc+0x19>
        serial_putc_sub(c);
  101312:	8b 45 08             	mov    0x8(%ebp),%eax
  101315:	89 04 24             	mov    %eax,(%esp)
  101318:	e8 8d ff ff ff       	call   1012aa <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  10131d:	eb 24                	jmp    101343 <serial_putc+0x3d>
        serial_putc_sub('\b');
  10131f:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101326:	e8 7f ff ff ff       	call   1012aa <serial_putc_sub>
        serial_putc_sub(' ');
  10132b:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101332:	e8 73 ff ff ff       	call   1012aa <serial_putc_sub>
        serial_putc_sub('\b');
  101337:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10133e:	e8 67 ff ff ff       	call   1012aa <serial_putc_sub>
}
  101343:	90                   	nop
  101344:	89 ec                	mov    %ebp,%esp
  101346:	5d                   	pop    %ebp
  101347:	c3                   	ret    

00101348 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101348:	55                   	push   %ebp
  101349:	89 e5                	mov    %esp,%ebp
  10134b:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  10134e:	eb 33                	jmp    101383 <cons_intr+0x3b>
        if (c != 0) {
  101350:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101354:	74 2d                	je     101383 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101356:	a1 84 00 11 00       	mov    0x110084,%eax
  10135b:	8d 50 01             	lea    0x1(%eax),%edx
  10135e:	89 15 84 00 11 00    	mov    %edx,0x110084
  101364:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101367:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  10136d:	a1 84 00 11 00       	mov    0x110084,%eax
  101372:	3d 00 02 00 00       	cmp    $0x200,%eax
  101377:	75 0a                	jne    101383 <cons_intr+0x3b>
                cons.wpos = 0;
  101379:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  101380:	00 00 00 
    while ((c = (*proc)()) != -1) {
  101383:	8b 45 08             	mov    0x8(%ebp),%eax
  101386:	ff d0                	call   *%eax
  101388:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10138b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10138f:	75 bf                	jne    101350 <cons_intr+0x8>
            }
        }
    }
}
  101391:	90                   	nop
  101392:	90                   	nop
  101393:	89 ec                	mov    %ebp,%esp
  101395:	5d                   	pop    %ebp
  101396:	c3                   	ret    

00101397 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101397:	55                   	push   %ebp
  101398:	89 e5                	mov    %esp,%ebp
  10139a:	83 ec 10             	sub    $0x10,%esp
  10139d:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013a3:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1013a7:	89 c2                	mov    %eax,%edx
  1013a9:	ec                   	in     (%dx),%al
  1013aa:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1013ad:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  1013b1:	0f b6 c0             	movzbl %al,%eax
  1013b4:	83 e0 01             	and    $0x1,%eax
  1013b7:	85 c0                	test   %eax,%eax
  1013b9:	75 07                	jne    1013c2 <serial_proc_data+0x2b>
        return -1;
  1013bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013c0:	eb 2a                	jmp    1013ec <serial_proc_data+0x55>
  1013c2:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013c8:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1013cc:	89 c2                	mov    %eax,%edx
  1013ce:	ec                   	in     (%dx),%al
  1013cf:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  1013d2:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1013d6:	0f b6 c0             	movzbl %al,%eax
  1013d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1013dc:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1013e0:	75 07                	jne    1013e9 <serial_proc_data+0x52>
        c = '\b';
  1013e2:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1013e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1013ec:	89 ec                	mov    %ebp,%esp
  1013ee:	5d                   	pop    %ebp
  1013ef:	c3                   	ret    

001013f0 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013f0:	55                   	push   %ebp
  1013f1:	89 e5                	mov    %esp,%ebp
  1013f3:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013f6:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  1013fb:	85 c0                	test   %eax,%eax
  1013fd:	74 0c                	je     10140b <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013ff:	c7 04 24 97 13 10 00 	movl   $0x101397,(%esp)
  101406:	e8 3d ff ff ff       	call   101348 <cons_intr>
    }
}
  10140b:	90                   	nop
  10140c:	89 ec                	mov    %ebp,%esp
  10140e:	5d                   	pop    %ebp
  10140f:	c3                   	ret    

00101410 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101410:	55                   	push   %ebp
  101411:	89 e5                	mov    %esp,%ebp
  101413:	83 ec 38             	sub    $0x38,%esp
  101416:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10141c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10141f:	89 c2                	mov    %eax,%edx
  101421:	ec                   	in     (%dx),%al
  101422:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  101425:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101429:	0f b6 c0             	movzbl %al,%eax
  10142c:	83 e0 01             	and    $0x1,%eax
  10142f:	85 c0                	test   %eax,%eax
  101431:	75 0a                	jne    10143d <kbd_proc_data+0x2d>
        return -1;
  101433:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101438:	e9 56 01 00 00       	jmp    101593 <kbd_proc_data+0x183>
  10143d:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101443:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101446:	89 c2                	mov    %eax,%edx
  101448:	ec                   	in     (%dx),%al
  101449:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  10144c:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101450:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101453:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101457:	75 17                	jne    101470 <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  101459:	a1 88 00 11 00       	mov    0x110088,%eax
  10145e:	83 c8 40             	or     $0x40,%eax
  101461:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  101466:	b8 00 00 00 00       	mov    $0x0,%eax
  10146b:	e9 23 01 00 00       	jmp    101593 <kbd_proc_data+0x183>
    } else if (data & 0x80) {
  101470:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101474:	84 c0                	test   %al,%al
  101476:	79 45                	jns    1014bd <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101478:	a1 88 00 11 00       	mov    0x110088,%eax
  10147d:	83 e0 40             	and    $0x40,%eax
  101480:	85 c0                	test   %eax,%eax
  101482:	75 08                	jne    10148c <kbd_proc_data+0x7c>
  101484:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101488:	24 7f                	and    $0x7f,%al
  10148a:	eb 04                	jmp    101490 <kbd_proc_data+0x80>
  10148c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101490:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101493:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101497:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  10149e:	0c 40                	or     $0x40,%al
  1014a0:	0f b6 c0             	movzbl %al,%eax
  1014a3:	f7 d0                	not    %eax
  1014a5:	89 c2                	mov    %eax,%edx
  1014a7:	a1 88 00 11 00       	mov    0x110088,%eax
  1014ac:	21 d0                	and    %edx,%eax
  1014ae:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  1014b3:	b8 00 00 00 00       	mov    $0x0,%eax
  1014b8:	e9 d6 00 00 00       	jmp    101593 <kbd_proc_data+0x183>
    } else if (shift & E0ESC) {
  1014bd:	a1 88 00 11 00       	mov    0x110088,%eax
  1014c2:	83 e0 40             	and    $0x40,%eax
  1014c5:	85 c0                	test   %eax,%eax
  1014c7:	74 11                	je     1014da <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  1014c9:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  1014cd:	a1 88 00 11 00       	mov    0x110088,%eax
  1014d2:	83 e0 bf             	and    $0xffffffbf,%eax
  1014d5:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  1014da:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014de:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  1014e5:	0f b6 d0             	movzbl %al,%edx
  1014e8:	a1 88 00 11 00       	mov    0x110088,%eax
  1014ed:	09 d0                	or     %edx,%eax
  1014ef:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  1014f4:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014f8:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  1014ff:	0f b6 d0             	movzbl %al,%edx
  101502:	a1 88 00 11 00       	mov    0x110088,%eax
  101507:	31 d0                	xor    %edx,%eax
  101509:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  10150e:	a1 88 00 11 00       	mov    0x110088,%eax
  101513:	83 e0 03             	and    $0x3,%eax
  101516:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  10151d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101521:	01 d0                	add    %edx,%eax
  101523:	0f b6 00             	movzbl (%eax),%eax
  101526:	0f b6 c0             	movzbl %al,%eax
  101529:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  10152c:	a1 88 00 11 00       	mov    0x110088,%eax
  101531:	83 e0 08             	and    $0x8,%eax
  101534:	85 c0                	test   %eax,%eax
  101536:	74 22                	je     10155a <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  101538:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  10153c:	7e 0c                	jle    10154a <kbd_proc_data+0x13a>
  10153e:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  101542:	7f 06                	jg     10154a <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  101544:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101548:	eb 10                	jmp    10155a <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  10154a:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  10154e:	7e 0a                	jle    10155a <kbd_proc_data+0x14a>
  101550:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101554:	7f 04                	jg     10155a <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  101556:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  10155a:	a1 88 00 11 00       	mov    0x110088,%eax
  10155f:	f7 d0                	not    %eax
  101561:	83 e0 06             	and    $0x6,%eax
  101564:	85 c0                	test   %eax,%eax
  101566:	75 28                	jne    101590 <kbd_proc_data+0x180>
  101568:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10156f:	75 1f                	jne    101590 <kbd_proc_data+0x180>
        cprintf("Rebooting!\n");
  101571:	c7 04 24 ff 39 10 00 	movl   $0x1039ff,(%esp)
  101578:	e8 ac ed ff ff       	call   100329 <cprintf>
  10157d:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101583:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101587:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  10158b:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10158e:	ee                   	out    %al,(%dx)
}
  10158f:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101590:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101593:	89 ec                	mov    %ebp,%esp
  101595:	5d                   	pop    %ebp
  101596:	c3                   	ret    

00101597 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101597:	55                   	push   %ebp
  101598:	89 e5                	mov    %esp,%ebp
  10159a:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  10159d:	c7 04 24 10 14 10 00 	movl   $0x101410,(%esp)
  1015a4:	e8 9f fd ff ff       	call   101348 <cons_intr>
}
  1015a9:	90                   	nop
  1015aa:	89 ec                	mov    %ebp,%esp
  1015ac:	5d                   	pop    %ebp
  1015ad:	c3                   	ret    

001015ae <kbd_init>:

static void
kbd_init(void) {
  1015ae:	55                   	push   %ebp
  1015af:	89 e5                	mov    %esp,%ebp
  1015b1:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  1015b4:	e8 de ff ff ff       	call   101597 <kbd_intr>
    pic_enable(IRQ_KBD);
  1015b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1015c0:	e8 2b 01 00 00       	call   1016f0 <pic_enable>
}
  1015c5:	90                   	nop
  1015c6:	89 ec                	mov    %ebp,%esp
  1015c8:	5d                   	pop    %ebp
  1015c9:	c3                   	ret    

001015ca <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  1015ca:	55                   	push   %ebp
  1015cb:	89 e5                	mov    %esp,%ebp
  1015cd:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  1015d0:	e8 4a f8 ff ff       	call   100e1f <cga_init>
    serial_init();
  1015d5:	e8 2d f9 ff ff       	call   100f07 <serial_init>
    kbd_init();
  1015da:	e8 cf ff ff ff       	call   1015ae <kbd_init>
    if (!serial_exists) {
  1015df:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  1015e4:	85 c0                	test   %eax,%eax
  1015e6:	75 0c                	jne    1015f4 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  1015e8:	c7 04 24 0b 3a 10 00 	movl   $0x103a0b,(%esp)
  1015ef:	e8 35 ed ff ff       	call   100329 <cprintf>
    }
}
  1015f4:	90                   	nop
  1015f5:	89 ec                	mov    %ebp,%esp
  1015f7:	5d                   	pop    %ebp
  1015f8:	c3                   	ret    

001015f9 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015f9:	55                   	push   %ebp
  1015fa:	89 e5                	mov    %esp,%ebp
  1015fc:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015ff:	8b 45 08             	mov    0x8(%ebp),%eax
  101602:	89 04 24             	mov    %eax,(%esp)
  101605:	e8 68 fa ff ff       	call   101072 <lpt_putc>
    cga_putc(c);
  10160a:	8b 45 08             	mov    0x8(%ebp),%eax
  10160d:	89 04 24             	mov    %eax,(%esp)
  101610:	e8 9f fa ff ff       	call   1010b4 <cga_putc>
    serial_putc(c);
  101615:	8b 45 08             	mov    0x8(%ebp),%eax
  101618:	89 04 24             	mov    %eax,(%esp)
  10161b:	e8 e6 fc ff ff       	call   101306 <serial_putc>
}
  101620:	90                   	nop
  101621:	89 ec                	mov    %ebp,%esp
  101623:	5d                   	pop    %ebp
  101624:	c3                   	ret    

00101625 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101625:	55                   	push   %ebp
  101626:	89 e5                	mov    %esp,%ebp
  101628:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  10162b:	e8 c0 fd ff ff       	call   1013f0 <serial_intr>
    kbd_intr();
  101630:	e8 62 ff ff ff       	call   101597 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  101635:	8b 15 80 00 11 00    	mov    0x110080,%edx
  10163b:	a1 84 00 11 00       	mov    0x110084,%eax
  101640:	39 c2                	cmp    %eax,%edx
  101642:	74 36                	je     10167a <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  101644:	a1 80 00 11 00       	mov    0x110080,%eax
  101649:	8d 50 01             	lea    0x1(%eax),%edx
  10164c:	89 15 80 00 11 00    	mov    %edx,0x110080
  101652:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  101659:	0f b6 c0             	movzbl %al,%eax
  10165c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  10165f:	a1 80 00 11 00       	mov    0x110080,%eax
  101664:	3d 00 02 00 00       	cmp    $0x200,%eax
  101669:	75 0a                	jne    101675 <cons_getc+0x50>
            cons.rpos = 0;
  10166b:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  101672:	00 00 00 
        }
        return c;
  101675:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101678:	eb 05                	jmp    10167f <cons_getc+0x5a>
    }
    return 0;
  10167a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10167f:	89 ec                	mov    %ebp,%esp
  101681:	5d                   	pop    %ebp
  101682:	c3                   	ret    

00101683 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101683:	55                   	push   %ebp
  101684:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101686:	fb                   	sti    
}
  101687:	90                   	nop
    sti();
}
  101688:	90                   	nop
  101689:	5d                   	pop    %ebp
  10168a:	c3                   	ret    

0010168b <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  10168b:	55                   	push   %ebp
  10168c:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  10168e:	fa                   	cli    
}
  10168f:	90                   	nop
    cli();
}
  101690:	90                   	nop
  101691:	5d                   	pop    %ebp
  101692:	c3                   	ret    

00101693 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101693:	55                   	push   %ebp
  101694:	89 e5                	mov    %esp,%ebp
  101696:	83 ec 14             	sub    $0x14,%esp
  101699:	8b 45 08             	mov    0x8(%ebp),%eax
  10169c:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  1016a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1016a3:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  1016a9:	a1 8c 00 11 00       	mov    0x11008c,%eax
  1016ae:	85 c0                	test   %eax,%eax
  1016b0:	74 39                	je     1016eb <pic_setmask+0x58>
        outb(IO_PIC1 + 1, mask);
  1016b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1016b5:	0f b6 c0             	movzbl %al,%eax
  1016b8:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  1016be:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016c1:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016c5:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016c9:	ee                   	out    %al,(%dx)
}
  1016ca:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  1016cb:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1016cf:	c1 e8 08             	shr    $0x8,%eax
  1016d2:	0f b7 c0             	movzwl %ax,%eax
  1016d5:	0f b6 c0             	movzbl %al,%eax
  1016d8:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  1016de:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016e1:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016e5:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016e9:	ee                   	out    %al,(%dx)
}
  1016ea:	90                   	nop
    }
}
  1016eb:	90                   	nop
  1016ec:	89 ec                	mov    %ebp,%esp
  1016ee:	5d                   	pop    %ebp
  1016ef:	c3                   	ret    

001016f0 <pic_enable>:

void
pic_enable(unsigned int irq) {
  1016f0:	55                   	push   %ebp
  1016f1:	89 e5                	mov    %esp,%ebp
  1016f3:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  1016f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1016f9:	ba 01 00 00 00       	mov    $0x1,%edx
  1016fe:	88 c1                	mov    %al,%cl
  101700:	d3 e2                	shl    %cl,%edx
  101702:	89 d0                	mov    %edx,%eax
  101704:	98                   	cwtl   
  101705:	f7 d0                	not    %eax
  101707:	0f bf d0             	movswl %ax,%edx
  10170a:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101711:	98                   	cwtl   
  101712:	21 d0                	and    %edx,%eax
  101714:	98                   	cwtl   
  101715:	0f b7 c0             	movzwl %ax,%eax
  101718:	89 04 24             	mov    %eax,(%esp)
  10171b:	e8 73 ff ff ff       	call   101693 <pic_setmask>
}
  101720:	90                   	nop
  101721:	89 ec                	mov    %ebp,%esp
  101723:	5d                   	pop    %ebp
  101724:	c3                   	ret    

00101725 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101725:	55                   	push   %ebp
  101726:	89 e5                	mov    %esp,%ebp
  101728:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  10172b:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  101732:	00 00 00 
  101735:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  10173b:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10173f:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  101743:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  101747:	ee                   	out    %al,(%dx)
}
  101748:	90                   	nop
  101749:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  10174f:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101753:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  101757:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  10175b:	ee                   	out    %al,(%dx)
}
  10175c:	90                   	nop
  10175d:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101763:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101767:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  10176b:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  10176f:	ee                   	out    %al,(%dx)
}
  101770:	90                   	nop
  101771:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  101777:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10177b:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10177f:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101783:	ee                   	out    %al,(%dx)
}
  101784:	90                   	nop
  101785:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  10178b:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10178f:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101793:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101797:	ee                   	out    %al,(%dx)
}
  101798:	90                   	nop
  101799:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  10179f:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017a3:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  1017a7:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  1017ab:	ee                   	out    %al,(%dx)
}
  1017ac:	90                   	nop
  1017ad:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  1017b3:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017b7:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  1017bb:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  1017bf:	ee                   	out    %al,(%dx)
}
  1017c0:	90                   	nop
  1017c1:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  1017c7:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017cb:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1017cf:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1017d3:	ee                   	out    %al,(%dx)
}
  1017d4:	90                   	nop
  1017d5:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  1017db:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017df:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1017e3:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1017e7:	ee                   	out    %al,(%dx)
}
  1017e8:	90                   	nop
  1017e9:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  1017ef:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017f3:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1017f7:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1017fb:	ee                   	out    %al,(%dx)
}
  1017fc:	90                   	nop
  1017fd:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  101803:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101807:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10180b:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10180f:	ee                   	out    %al,(%dx)
}
  101810:	90                   	nop
  101811:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101817:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10181b:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10181f:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101823:	ee                   	out    %al,(%dx)
}
  101824:	90                   	nop
  101825:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  10182b:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10182f:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101833:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101837:	ee                   	out    %al,(%dx)
}
  101838:	90                   	nop
  101839:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  10183f:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101843:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101847:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10184b:	ee                   	out    %al,(%dx)
}
  10184c:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  10184d:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101854:	3d ff ff 00 00       	cmp    $0xffff,%eax
  101859:	74 0f                	je     10186a <pic_init+0x145>
        pic_setmask(irq_mask);
  10185b:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101862:	89 04 24             	mov    %eax,(%esp)
  101865:	e8 29 fe ff ff       	call   101693 <pic_setmask>
    }
}
  10186a:	90                   	nop
  10186b:	89 ec                	mov    %ebp,%esp
  10186d:	5d                   	pop    %ebp
  10186e:	c3                   	ret    

0010186f <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  10186f:	55                   	push   %ebp
  101870:	89 e5                	mov    %esp,%ebp
  101872:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  101875:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  10187c:	00 
  10187d:	c7 04 24 40 3a 10 00 	movl   $0x103a40,(%esp)
  101884:	e8 a0 ea ff ff       	call   100329 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  101889:	c7 04 24 4a 3a 10 00 	movl   $0x103a4a,(%esp)
  101890:	e8 94 ea ff ff       	call   100329 <cprintf>
    panic("EOT: kernel seems ok.");
  101895:	c7 44 24 08 58 3a 10 	movl   $0x103a58,0x8(%esp)
  10189c:	00 
  10189d:	c7 44 24 04 12 00 00 	movl   $0x12,0x4(%esp)
  1018a4:	00 
  1018a5:	c7 04 24 6e 3a 10 00 	movl   $0x103a6e,(%esp)
  1018ac:	e8 e9 f3 ff ff       	call   100c9a <__panic>

001018b1 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1018b1:	55                   	push   %ebp
  1018b2:	89 e5                	mov    %esp,%ebp
  1018b4:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
      
    extern uintptr_t __vectors[];
    for(int i = 0; i < 256; i++)
  1018b7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1018be:	e9 c4 00 00 00       	jmp    101987 <idt_init+0xd6>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  1018c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018c6:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  1018cd:	0f b7 d0             	movzwl %ax,%edx
  1018d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d3:	66 89 14 c5 a0 00 11 	mov    %dx,0x1100a0(,%eax,8)
  1018da:	00 
  1018db:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018de:	66 c7 04 c5 a2 00 11 	movw   $0x8,0x1100a2(,%eax,8)
  1018e5:	00 08 00 
  1018e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018eb:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  1018f2:	00 
  1018f3:	80 e2 e0             	and    $0xe0,%dl
  1018f6:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  1018fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101900:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  101907:	00 
  101908:	80 e2 1f             	and    $0x1f,%dl
  10190b:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  101912:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101915:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  10191c:	00 
  10191d:	80 e2 f0             	and    $0xf0,%dl
  101920:	80 ca 0e             	or     $0xe,%dl
  101923:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  10192a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10192d:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  101934:	00 
  101935:	80 e2 ef             	and    $0xef,%dl
  101938:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  10193f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101942:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  101949:	00 
  10194a:	80 e2 9f             	and    $0x9f,%dl
  10194d:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  101954:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101957:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  10195e:	00 
  10195f:	80 ca 80             	or     $0x80,%dl
  101962:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  101969:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10196c:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  101973:	c1 e8 10             	shr    $0x10,%eax
  101976:	0f b7 d0             	movzwl %ax,%edx
  101979:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10197c:	66 89 14 c5 a6 00 11 	mov    %dx,0x1100a6(,%eax,8)
  101983:	00 
    for(int i = 0; i < 256; i++)
  101984:	ff 45 fc             	incl   -0x4(%ebp)
  101987:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  10198e:	0f 8e 2f ff ff ff    	jle    1018c3 <idt_init+0x12>
    SETGATE(idt[T_SWITCH_TOK], 1, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  101994:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101999:	0f b7 c0             	movzwl %ax,%eax
  10199c:	66 a3 68 04 11 00    	mov    %ax,0x110468
  1019a2:	66 c7 05 6a 04 11 00 	movw   $0x8,0x11046a
  1019a9:	08 00 
  1019ab:	0f b6 05 6c 04 11 00 	movzbl 0x11046c,%eax
  1019b2:	24 e0                	and    $0xe0,%al
  1019b4:	a2 6c 04 11 00       	mov    %al,0x11046c
  1019b9:	0f b6 05 6c 04 11 00 	movzbl 0x11046c,%eax
  1019c0:	24 1f                	and    $0x1f,%al
  1019c2:	a2 6c 04 11 00       	mov    %al,0x11046c
  1019c7:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  1019ce:	0c 0f                	or     $0xf,%al
  1019d0:	a2 6d 04 11 00       	mov    %al,0x11046d
  1019d5:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  1019dc:	24 ef                	and    $0xef,%al
  1019de:	a2 6d 04 11 00       	mov    %al,0x11046d
  1019e3:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  1019ea:	0c 60                	or     $0x60,%al
  1019ec:	a2 6d 04 11 00       	mov    %al,0x11046d
  1019f1:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  1019f8:	0c 80                	or     $0x80,%al
  1019fa:	a2 6d 04 11 00       	mov    %al,0x11046d
  1019ff:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101a04:	c1 e8 10             	shr    $0x10,%eax
  101a07:	0f b7 c0             	movzwl %ax,%eax
  101a0a:	66 a3 6e 04 11 00    	mov    %ax,0x11046e
  101a10:	c7 45 f8 60 f5 10 00 	movl   $0x10f560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  101a17:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a1a:	0f 01 18             	lidtl  (%eax)
}
  101a1d:	90                   	nop
    lidt(&idt_pd);
}
  101a1e:	90                   	nop
  101a1f:	89 ec                	mov    %ebp,%esp
  101a21:	5d                   	pop    %ebp
  101a22:	c3                   	ret    

00101a23 <trapname>:

static const char *
trapname(int trapno) {
  101a23:	55                   	push   %ebp
  101a24:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101a26:	8b 45 08             	mov    0x8(%ebp),%eax
  101a29:	83 f8 13             	cmp    $0x13,%eax
  101a2c:	77 0c                	ja     101a3a <trapname+0x17>
        return excnames[trapno];
  101a2e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a31:	8b 04 85 e0 3d 10 00 	mov    0x103de0(,%eax,4),%eax
  101a38:	eb 18                	jmp    101a52 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101a3a:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101a3e:	7e 0d                	jle    101a4d <trapname+0x2a>
  101a40:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101a44:	7f 07                	jg     101a4d <trapname+0x2a>
        return "Hardware Interrupt";
  101a46:	b8 7f 3a 10 00       	mov    $0x103a7f,%eax
  101a4b:	eb 05                	jmp    101a52 <trapname+0x2f>
    }
    return "(unknown trap)";
  101a4d:	b8 92 3a 10 00       	mov    $0x103a92,%eax
}
  101a52:	5d                   	pop    %ebp
  101a53:	c3                   	ret    

00101a54 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101a54:	55                   	push   %ebp
  101a55:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101a57:	8b 45 08             	mov    0x8(%ebp),%eax
  101a5a:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a5e:	83 f8 08             	cmp    $0x8,%eax
  101a61:	0f 94 c0             	sete   %al
  101a64:	0f b6 c0             	movzbl %al,%eax
}
  101a67:	5d                   	pop    %ebp
  101a68:	c3                   	ret    

00101a69 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101a69:	55                   	push   %ebp
  101a6a:	89 e5                	mov    %esp,%ebp
  101a6c:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101a6f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a72:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a76:	c7 04 24 d3 3a 10 00 	movl   $0x103ad3,(%esp)
  101a7d:	e8 a7 e8 ff ff       	call   100329 <cprintf>
    print_regs(&tf->tf_regs);
  101a82:	8b 45 08             	mov    0x8(%ebp),%eax
  101a85:	89 04 24             	mov    %eax,(%esp)
  101a88:	e8 8f 01 00 00       	call   101c1c <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a8d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a90:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a94:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a98:	c7 04 24 e4 3a 10 00 	movl   $0x103ae4,(%esp)
  101a9f:	e8 85 e8 ff ff       	call   100329 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101aa4:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa7:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101aab:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aaf:	c7 04 24 f7 3a 10 00 	movl   $0x103af7,(%esp)
  101ab6:	e8 6e e8 ff ff       	call   100329 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101abb:	8b 45 08             	mov    0x8(%ebp),%eax
  101abe:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101ac2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac6:	c7 04 24 0a 3b 10 00 	movl   $0x103b0a,(%esp)
  101acd:	e8 57 e8 ff ff       	call   100329 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101ad2:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad5:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101ad9:	89 44 24 04          	mov    %eax,0x4(%esp)
  101add:	c7 04 24 1d 3b 10 00 	movl   $0x103b1d,(%esp)
  101ae4:	e8 40 e8 ff ff       	call   100329 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101ae9:	8b 45 08             	mov    0x8(%ebp),%eax
  101aec:	8b 40 30             	mov    0x30(%eax),%eax
  101aef:	89 04 24             	mov    %eax,(%esp)
  101af2:	e8 2c ff ff ff       	call   101a23 <trapname>
  101af7:	8b 55 08             	mov    0x8(%ebp),%edx
  101afa:	8b 52 30             	mov    0x30(%edx),%edx
  101afd:	89 44 24 08          	mov    %eax,0x8(%esp)
  101b01:	89 54 24 04          	mov    %edx,0x4(%esp)
  101b05:	c7 04 24 30 3b 10 00 	movl   $0x103b30,(%esp)
  101b0c:	e8 18 e8 ff ff       	call   100329 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101b11:	8b 45 08             	mov    0x8(%ebp),%eax
  101b14:	8b 40 34             	mov    0x34(%eax),%eax
  101b17:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b1b:	c7 04 24 42 3b 10 00 	movl   $0x103b42,(%esp)
  101b22:	e8 02 e8 ff ff       	call   100329 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101b27:	8b 45 08             	mov    0x8(%ebp),%eax
  101b2a:	8b 40 38             	mov    0x38(%eax),%eax
  101b2d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b31:	c7 04 24 51 3b 10 00 	movl   $0x103b51,(%esp)
  101b38:	e8 ec e7 ff ff       	call   100329 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101b3d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b40:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b44:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b48:	c7 04 24 60 3b 10 00 	movl   $0x103b60,(%esp)
  101b4f:	e8 d5 e7 ff ff       	call   100329 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101b54:	8b 45 08             	mov    0x8(%ebp),%eax
  101b57:	8b 40 40             	mov    0x40(%eax),%eax
  101b5a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b5e:	c7 04 24 73 3b 10 00 	movl   $0x103b73,(%esp)
  101b65:	e8 bf e7 ff ff       	call   100329 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b6a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101b71:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101b78:	eb 3d                	jmp    101bb7 <print_trapframe+0x14e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101b7a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7d:	8b 50 40             	mov    0x40(%eax),%edx
  101b80:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b83:	21 d0                	and    %edx,%eax
  101b85:	85 c0                	test   %eax,%eax
  101b87:	74 28                	je     101bb1 <print_trapframe+0x148>
  101b89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b8c:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101b93:	85 c0                	test   %eax,%eax
  101b95:	74 1a                	je     101bb1 <print_trapframe+0x148>
            cprintf("%s,", IA32flags[i]);
  101b97:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b9a:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101ba1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ba5:	c7 04 24 82 3b 10 00 	movl   $0x103b82,(%esp)
  101bac:	e8 78 e7 ff ff       	call   100329 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101bb1:	ff 45 f4             	incl   -0xc(%ebp)
  101bb4:	d1 65 f0             	shll   -0x10(%ebp)
  101bb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101bba:	83 f8 17             	cmp    $0x17,%eax
  101bbd:	76 bb                	jbe    101b7a <print_trapframe+0x111>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101bbf:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc2:	8b 40 40             	mov    0x40(%eax),%eax
  101bc5:	c1 e8 0c             	shr    $0xc,%eax
  101bc8:	83 e0 03             	and    $0x3,%eax
  101bcb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bcf:	c7 04 24 86 3b 10 00 	movl   $0x103b86,(%esp)
  101bd6:	e8 4e e7 ff ff       	call   100329 <cprintf>

    if (!trap_in_kernel(tf)) {
  101bdb:	8b 45 08             	mov    0x8(%ebp),%eax
  101bde:	89 04 24             	mov    %eax,(%esp)
  101be1:	e8 6e fe ff ff       	call   101a54 <trap_in_kernel>
  101be6:	85 c0                	test   %eax,%eax
  101be8:	75 2d                	jne    101c17 <print_trapframe+0x1ae>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101bea:	8b 45 08             	mov    0x8(%ebp),%eax
  101bed:	8b 40 44             	mov    0x44(%eax),%eax
  101bf0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bf4:	c7 04 24 8f 3b 10 00 	movl   $0x103b8f,(%esp)
  101bfb:	e8 29 e7 ff ff       	call   100329 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101c00:	8b 45 08             	mov    0x8(%ebp),%eax
  101c03:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101c07:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c0b:	c7 04 24 9e 3b 10 00 	movl   $0x103b9e,(%esp)
  101c12:	e8 12 e7 ff ff       	call   100329 <cprintf>
    }
}
  101c17:	90                   	nop
  101c18:	89 ec                	mov    %ebp,%esp
  101c1a:	5d                   	pop    %ebp
  101c1b:	c3                   	ret    

00101c1c <print_regs>:

void
print_regs(struct pushregs *regs) {
  101c1c:	55                   	push   %ebp
  101c1d:	89 e5                	mov    %esp,%ebp
  101c1f:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101c22:	8b 45 08             	mov    0x8(%ebp),%eax
  101c25:	8b 00                	mov    (%eax),%eax
  101c27:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c2b:	c7 04 24 b1 3b 10 00 	movl   $0x103bb1,(%esp)
  101c32:	e8 f2 e6 ff ff       	call   100329 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101c37:	8b 45 08             	mov    0x8(%ebp),%eax
  101c3a:	8b 40 04             	mov    0x4(%eax),%eax
  101c3d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c41:	c7 04 24 c0 3b 10 00 	movl   $0x103bc0,(%esp)
  101c48:	e8 dc e6 ff ff       	call   100329 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101c4d:	8b 45 08             	mov    0x8(%ebp),%eax
  101c50:	8b 40 08             	mov    0x8(%eax),%eax
  101c53:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c57:	c7 04 24 cf 3b 10 00 	movl   $0x103bcf,(%esp)
  101c5e:	e8 c6 e6 ff ff       	call   100329 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101c63:	8b 45 08             	mov    0x8(%ebp),%eax
  101c66:	8b 40 0c             	mov    0xc(%eax),%eax
  101c69:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c6d:	c7 04 24 de 3b 10 00 	movl   $0x103bde,(%esp)
  101c74:	e8 b0 e6 ff ff       	call   100329 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c79:	8b 45 08             	mov    0x8(%ebp),%eax
  101c7c:	8b 40 10             	mov    0x10(%eax),%eax
  101c7f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c83:	c7 04 24 ed 3b 10 00 	movl   $0x103bed,(%esp)
  101c8a:	e8 9a e6 ff ff       	call   100329 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c8f:	8b 45 08             	mov    0x8(%ebp),%eax
  101c92:	8b 40 14             	mov    0x14(%eax),%eax
  101c95:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c99:	c7 04 24 fc 3b 10 00 	movl   $0x103bfc,(%esp)
  101ca0:	e8 84 e6 ff ff       	call   100329 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101ca5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ca8:	8b 40 18             	mov    0x18(%eax),%eax
  101cab:	89 44 24 04          	mov    %eax,0x4(%esp)
  101caf:	c7 04 24 0b 3c 10 00 	movl   $0x103c0b,(%esp)
  101cb6:	e8 6e e6 ff ff       	call   100329 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101cbb:	8b 45 08             	mov    0x8(%ebp),%eax
  101cbe:	8b 40 1c             	mov    0x1c(%eax),%eax
  101cc1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cc5:	c7 04 24 1a 3c 10 00 	movl   $0x103c1a,(%esp)
  101ccc:	e8 58 e6 ff ff       	call   100329 <cprintf>
}
  101cd1:	90                   	nop
  101cd2:	89 ec                	mov    %ebp,%esp
  101cd4:	5d                   	pop    %ebp
  101cd5:	c3                   	ret    

00101cd6 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101cd6:	55                   	push   %ebp
  101cd7:	89 e5                	mov    %esp,%ebp
  101cd9:	57                   	push   %edi
  101cda:	56                   	push   %esi
  101cdb:	53                   	push   %ebx
  101cdc:	83 ec 5c             	sub    $0x5c,%esp
    char c;

    switch (tf->tf_trapno) {
  101cdf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce2:	8b 40 30             	mov    0x30(%eax),%eax
  101ce5:	83 f8 79             	cmp    $0x79,%eax
  101ce8:	0f 84 74 01 00 00    	je     101e62 <trap_dispatch+0x18c>
  101cee:	83 f8 79             	cmp    $0x79,%eax
  101cf1:	0f 87 61 02 00 00    	ja     101f58 <trap_dispatch+0x282>
  101cf7:	83 f8 78             	cmp    $0x78,%eax
  101cfa:	0f 84 d0 00 00 00    	je     101dd0 <trap_dispatch+0xfa>
  101d00:	83 f8 78             	cmp    $0x78,%eax
  101d03:	0f 87 4f 02 00 00    	ja     101f58 <trap_dispatch+0x282>
  101d09:	83 f8 2f             	cmp    $0x2f,%eax
  101d0c:	0f 87 46 02 00 00    	ja     101f58 <trap_dispatch+0x282>
  101d12:	83 f8 2e             	cmp    $0x2e,%eax
  101d15:	0f 83 72 02 00 00    	jae    101f8d <trap_dispatch+0x2b7>
  101d1b:	83 f8 24             	cmp    $0x24,%eax
  101d1e:	74 5e                	je     101d7e <trap_dispatch+0xa8>
  101d20:	83 f8 24             	cmp    $0x24,%eax
  101d23:	0f 87 2f 02 00 00    	ja     101f58 <trap_dispatch+0x282>
  101d29:	83 f8 20             	cmp    $0x20,%eax
  101d2c:	74 0a                	je     101d38 <trap_dispatch+0x62>
  101d2e:	83 f8 21             	cmp    $0x21,%eax
  101d31:	74 74                	je     101da7 <trap_dispatch+0xd1>
  101d33:	e9 20 02 00 00       	jmp    101f58 <trap_dispatch+0x282>
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        extern volatile size_t ticks;
        ticks++;
  101d38:	a1 44 fe 10 00       	mov    0x10fe44,%eax
  101d3d:	40                   	inc    %eax
  101d3e:	a3 44 fe 10 00       	mov    %eax,0x10fe44
        if(ticks % TICK_NUM == 0)
  101d43:	8b 0d 44 fe 10 00    	mov    0x10fe44,%ecx
  101d49:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101d4e:	89 c8                	mov    %ecx,%eax
  101d50:	f7 e2                	mul    %edx
  101d52:	c1 ea 05             	shr    $0x5,%edx
  101d55:	89 d0                	mov    %edx,%eax
  101d57:	c1 e0 02             	shl    $0x2,%eax
  101d5a:	01 d0                	add    %edx,%eax
  101d5c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101d63:	01 d0                	add    %edx,%eax
  101d65:	c1 e0 02             	shl    $0x2,%eax
  101d68:	29 c1                	sub    %eax,%ecx
  101d6a:	89 ca                	mov    %ecx,%edx
  101d6c:	85 d2                	test   %edx,%edx
  101d6e:	0f 85 1c 02 00 00    	jne    101f90 <trap_dispatch+0x2ba>
	        print_ticks();
  101d74:	e8 f6 fa ff ff       	call   10186f <print_ticks>
        break;
  101d79:	e9 12 02 00 00       	jmp    101f90 <trap_dispatch+0x2ba>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101d7e:	e8 a2 f8 ff ff       	call   101625 <cons_getc>
  101d83:	88 45 e3             	mov    %al,-0x1d(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101d86:	0f be 55 e3          	movsbl -0x1d(%ebp),%edx
  101d8a:	0f be 45 e3          	movsbl -0x1d(%ebp),%eax
  101d8e:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d92:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d96:	c7 04 24 29 3c 10 00 	movl   $0x103c29,(%esp)
  101d9d:	e8 87 e5 ff ff       	call   100329 <cprintf>
        break;
  101da2:	e9 f0 01 00 00       	jmp    101f97 <trap_dispatch+0x2c1>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101da7:	e8 79 f8 ff ff       	call   101625 <cons_getc>
  101dac:	88 45 e3             	mov    %al,-0x1d(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101daf:	0f be 55 e3          	movsbl -0x1d(%ebp),%edx
  101db3:	0f be 45 e3          	movsbl -0x1d(%ebp),%eax
  101db7:	89 54 24 08          	mov    %edx,0x8(%esp)
  101dbb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101dbf:	c7 04 24 3b 3c 10 00 	movl   $0x103c3b,(%esp)
  101dc6:	e8 5e e5 ff ff       	call   100329 <cprintf>
        break;
  101dcb:	e9 c7 01 00 00       	jmp    101f97 <trap_dispatch+0x2c1>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        cprintf("switch to user\n");
  101dd0:	c7 04 24 4a 3c 10 00 	movl   $0x103c4a,(%esp)
  101dd7:	e8 4d e5 ff ff       	call   100329 <cprintf>
        static struct trapframe tmp_tf;
        if (tf->tf_cs != USER_CS)
  101ddc:	8b 45 08             	mov    0x8(%ebp),%eax
  101ddf:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101de3:	83 f8 1b             	cmp    $0x1b,%eax
  101de6:	0f 84 a7 01 00 00    	je     101f93 <trap_dispatch+0x2bd>
        {
            tmp_tf = *tf;
  101dec:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101def:	b8 4c 00 00 00       	mov    $0x4c,%eax
  101df4:	83 e0 fc             	and    $0xfffffffc,%eax
  101df7:	89 c3                	mov    %eax,%ebx
  101df9:	b8 00 00 00 00       	mov    $0x0,%eax
  101dfe:	8b 14 01             	mov    (%ecx,%eax,1),%edx
  101e01:	89 90 a0 08 11 00    	mov    %edx,0x1108a0(%eax)
  101e07:	83 c0 04             	add    $0x4,%eax
  101e0a:	39 d8                	cmp    %ebx,%eax
  101e0c:	72 f0                	jb     101dfe <trap_dispatch+0x128>
            tmp_tf.tf_cs = USER_CS;
  101e0e:	66 c7 05 dc 08 11 00 	movw   $0x1b,0x1108dc
  101e15:	1b 00 
            tmp_tf.tf_ds = tmp_tf.tf_es = USER_DS;
  101e17:	66 c7 05 c8 08 11 00 	movw   $0x23,0x1108c8
  101e1e:	23 00 
  101e20:	0f b7 05 c8 08 11 00 	movzwl 0x1108c8,%eax
  101e27:	66 a3 cc 08 11 00    	mov    %ax,0x1108cc
            tmp_tf.tf_ss = USER_DS;
  101e2d:	66 c7 05 e8 08 11 00 	movw   $0x23,0x1108e8
  101e34:	23 00 
            tmp_tf.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
  101e36:	8b 45 08             	mov    0x8(%ebp),%eax
  101e39:	83 c0 44             	add    $0x44,%eax
  101e3c:	a3 e4 08 11 00       	mov    %eax,0x1108e4

            tmp_tf.tf_eflags |= FL_IOPL_MASK;
  101e41:	a1 e0 08 11 00       	mov    0x1108e0,%eax
  101e46:	0d 00 30 00 00       	or     $0x3000,%eax
  101e4b:	a3 e0 08 11 00       	mov    %eax,0x1108e0

            *((uint32_t *)tf - 1) = (uint32_t)&tmp_tf;
  101e50:	8b 45 08             	mov    0x8(%ebp),%eax
  101e53:	83 e8 04             	sub    $0x4,%eax
  101e56:	ba a0 08 11 00       	mov    $0x1108a0,%edx
  101e5b:	89 10                	mov    %edx,(%eax)
        }
        break;
  101e5d:	e9 31 01 00 00       	jmp    101f93 <trap_dispatch+0x2bd>
    case T_SWITCH_TOK:
        cprintf("switch to kernel\n");
  101e62:	c7 04 24 5a 3c 10 00 	movl   $0x103c5a,(%esp)
  101e69:	e8 bb e4 ff ff       	call   100329 <cprintf>
        struct trapframe *tmp_tf_ptr;
        if (tf->tf_cs != KERNEL_CS)
  101e6e:	8b 45 08             	mov    0x8(%ebp),%eax
  101e71:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e75:	83 f8 08             	cmp    $0x8,%eax
  101e78:	0f 84 18 01 00 00    	je     101f96 <trap_dispatch+0x2c0>
        {
            tf->tf_cs = KERNEL_CS;
  101e7e:	8b 45 08             	mov    0x8(%ebp),%eax
  101e81:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds = tf->tf_es = KERNEL_DS;
  101e87:	8b 45 08             	mov    0x8(%ebp),%eax
  101e8a:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101e90:	8b 45 08             	mov    0x8(%ebp),%eax
  101e93:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101e97:	8b 45 08             	mov    0x8(%ebp),%eax
  101e9a:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags &= ~FL_IOPL_MASK;
  101e9e:	8b 45 08             	mov    0x8(%ebp),%eax
  101ea1:	8b 40 40             	mov    0x40(%eax),%eax
  101ea4:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101ea9:	89 c2                	mov    %eax,%edx
  101eab:	8b 45 08             	mov    0x8(%ebp),%eax
  101eae:	89 50 40             	mov    %edx,0x40(%eax)

            tmp_tf_ptr = (struct trapframe*)(tf->tf_esp - (sizeof(struct trapframe) - 8));
  101eb1:	8b 45 08             	mov    0x8(%ebp),%eax
  101eb4:	8b 40 44             	mov    0x44(%eax),%eax
  101eb7:	83 e8 44             	sub    $0x44,%eax
  101eba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  101ebd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101ec0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  101ec3:	8b 45 08             	mov    0x8(%ebp),%eax
  101ec6:	89 45 d8             	mov    %eax,-0x28(%ebp)
  101ec9:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  101ed0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  101ed3:	3b 45 d8             	cmp    -0x28(%ebp),%eax
  101ed6:	73 3f                	jae    101f17 <trap_dispatch+0x241>
  101ed8:	8b 45 dc             	mov    -0x24(%ebp),%eax
  101edb:	89 45 d0             	mov    %eax,-0x30(%ebp)
  101ede:	8b 45 d8             	mov    -0x28(%ebp),%eax
  101ee1:	89 45 cc             	mov    %eax,-0x34(%ebp)
  101ee4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101ee7:	89 45 c8             	mov    %eax,-0x38(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  101eea:	8b 45 c8             	mov    -0x38(%ebp),%eax
  101eed:	c1 e8 02             	shr    $0x2,%eax
  101ef0:	89 c1                	mov    %eax,%ecx
    asm volatile (
  101ef2:	8b 55 d0             	mov    -0x30(%ebp),%edx
  101ef5:	8b 45 cc             	mov    -0x34(%ebp),%eax
  101ef8:	89 d7                	mov    %edx,%edi
  101efa:	89 c6                	mov    %eax,%esi
  101efc:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101efe:	8b 4d c8             	mov    -0x38(%ebp),%ecx
  101f01:	83 e1 03             	and    $0x3,%ecx
  101f04:	74 02                	je     101f08 <trap_dispatch+0x232>
  101f06:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  101f08:	89 f0                	mov    %esi,%eax
  101f0a:	89 fa                	mov    %edi,%edx
  101f0c:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  101f0f:	89 55 c0             	mov    %edx,-0x40(%ebp)
  101f12:	89 45 bc             	mov    %eax,-0x44(%ebp)
        return __memcpy(dst, src, n);
  101f15:	eb 34                	jmp    101f4b <trap_dispatch+0x275>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  101f17:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101f1a:	8d 50 ff             	lea    -0x1(%eax),%edx
  101f1d:	8b 45 d8             	mov    -0x28(%ebp),%eax
  101f20:	01 c2                	add    %eax,%edx
  101f22:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101f25:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101f28:	8b 45 dc             	mov    -0x24(%ebp),%eax
  101f2b:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  101f2e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101f31:	89 c1                	mov    %eax,%ecx
  101f33:	89 d8                	mov    %ebx,%eax
  101f35:	89 d6                	mov    %edx,%esi
  101f37:	89 c7                	mov    %eax,%edi
  101f39:	fd                   	std    
  101f3a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  101f3c:	fc                   	cld    
  101f3d:	89 f8                	mov    %edi,%eax
  101f3f:	89 f2                	mov    %esi,%edx
  101f41:	89 4d b8             	mov    %ecx,-0x48(%ebp)
  101f44:	89 55 b4             	mov    %edx,-0x4c(%ebp)
  101f47:	89 45 b0             	mov    %eax,-0x50(%ebp)
    return dst;
  101f4a:	90                   	nop
            __memmove(tmp_tf_ptr, tf, sizeof(struct trapframe) - 8);

            *((uint32_t *)tf - 1) = (uint32_t)tmp_tf_ptr;
  101f4b:	8b 45 08             	mov    0x8(%ebp),%eax
  101f4e:	8d 50 fc             	lea    -0x4(%eax),%edx
  101f51:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101f54:	89 02                	mov    %eax,(%edx)
        }
        // panic("T_SWITCH_** ??\n");
        break;
  101f56:	eb 3e                	jmp    101f96 <trap_dispatch+0x2c0>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101f58:	8b 45 08             	mov    0x8(%ebp),%eax
  101f5b:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101f5f:	83 e0 03             	and    $0x3,%eax
  101f62:	85 c0                	test   %eax,%eax
  101f64:	75 31                	jne    101f97 <trap_dispatch+0x2c1>
            print_trapframe(tf);
  101f66:	8b 45 08             	mov    0x8(%ebp),%eax
  101f69:	89 04 24             	mov    %eax,(%esp)
  101f6c:	e8 f8 fa ff ff       	call   101a69 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101f71:	c7 44 24 08 6c 3c 10 	movl   $0x103c6c,0x8(%esp)
  101f78:	00 
  101f79:	c7 44 24 04 d2 00 00 	movl   $0xd2,0x4(%esp)
  101f80:	00 
  101f81:	c7 04 24 6e 3a 10 00 	movl   $0x103a6e,(%esp)
  101f88:	e8 0d ed ff ff       	call   100c9a <__panic>
        break;
  101f8d:	90                   	nop
  101f8e:	eb 07                	jmp    101f97 <trap_dispatch+0x2c1>
        break;
  101f90:	90                   	nop
  101f91:	eb 04                	jmp    101f97 <trap_dispatch+0x2c1>
        break;
  101f93:	90                   	nop
  101f94:	eb 01                	jmp    101f97 <trap_dispatch+0x2c1>
        break;
  101f96:	90                   	nop
        }
    }
}
  101f97:	90                   	nop
  101f98:	83 c4 5c             	add    $0x5c,%esp
  101f9b:	5b                   	pop    %ebx
  101f9c:	5e                   	pop    %esi
  101f9d:	5f                   	pop    %edi
  101f9e:	5d                   	pop    %ebp
  101f9f:	c3                   	ret    

00101fa0 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101fa0:	55                   	push   %ebp
  101fa1:	89 e5                	mov    %esp,%ebp
  101fa3:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101fa6:	8b 45 08             	mov    0x8(%ebp),%eax
  101fa9:	89 04 24             	mov    %eax,(%esp)
  101fac:	e8 25 fd ff ff       	call   101cd6 <trap_dispatch>
}
  101fb1:	90                   	nop
  101fb2:	89 ec                	mov    %ebp,%esp
  101fb4:	5d                   	pop    %ebp
  101fb5:	c3                   	ret    

00101fb6 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101fb6:	1e                   	push   %ds
    pushl %es
  101fb7:	06                   	push   %es
    pushl %fs
  101fb8:	0f a0                	push   %fs
    pushl %gs
  101fba:	0f a8                	push   %gs
    pushal
  101fbc:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101fbd:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101fc2:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101fc4:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101fc6:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101fc7:	e8 d4 ff ff ff       	call   101fa0 <trap>

    # pop the pushed stack pointer
    popl %esp
  101fcc:	5c                   	pop    %esp

00101fcd <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101fcd:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101fce:	0f a9                	pop    %gs
    popl %fs
  101fd0:	0f a1                	pop    %fs
    popl %es
  101fd2:	07                   	pop    %es
    popl %ds
  101fd3:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101fd4:	83 c4 08             	add    $0x8,%esp
    iret
  101fd7:	cf                   	iret   

00101fd8 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101fd8:	6a 00                	push   $0x0
  pushl $0
  101fda:	6a 00                	push   $0x0
  jmp __alltraps
  101fdc:	e9 d5 ff ff ff       	jmp    101fb6 <__alltraps>

00101fe1 <vector1>:
.globl vector1
vector1:
  pushl $0
  101fe1:	6a 00                	push   $0x0
  pushl $1
  101fe3:	6a 01                	push   $0x1
  jmp __alltraps
  101fe5:	e9 cc ff ff ff       	jmp    101fb6 <__alltraps>

00101fea <vector2>:
.globl vector2
vector2:
  pushl $0
  101fea:	6a 00                	push   $0x0
  pushl $2
  101fec:	6a 02                	push   $0x2
  jmp __alltraps
  101fee:	e9 c3 ff ff ff       	jmp    101fb6 <__alltraps>

00101ff3 <vector3>:
.globl vector3
vector3:
  pushl $0
  101ff3:	6a 00                	push   $0x0
  pushl $3
  101ff5:	6a 03                	push   $0x3
  jmp __alltraps
  101ff7:	e9 ba ff ff ff       	jmp    101fb6 <__alltraps>

00101ffc <vector4>:
.globl vector4
vector4:
  pushl $0
  101ffc:	6a 00                	push   $0x0
  pushl $4
  101ffe:	6a 04                	push   $0x4
  jmp __alltraps
  102000:	e9 b1 ff ff ff       	jmp    101fb6 <__alltraps>

00102005 <vector5>:
.globl vector5
vector5:
  pushl $0
  102005:	6a 00                	push   $0x0
  pushl $5
  102007:	6a 05                	push   $0x5
  jmp __alltraps
  102009:	e9 a8 ff ff ff       	jmp    101fb6 <__alltraps>

0010200e <vector6>:
.globl vector6
vector6:
  pushl $0
  10200e:	6a 00                	push   $0x0
  pushl $6
  102010:	6a 06                	push   $0x6
  jmp __alltraps
  102012:	e9 9f ff ff ff       	jmp    101fb6 <__alltraps>

00102017 <vector7>:
.globl vector7
vector7:
  pushl $0
  102017:	6a 00                	push   $0x0
  pushl $7
  102019:	6a 07                	push   $0x7
  jmp __alltraps
  10201b:	e9 96 ff ff ff       	jmp    101fb6 <__alltraps>

00102020 <vector8>:
.globl vector8
vector8:
  pushl $8
  102020:	6a 08                	push   $0x8
  jmp __alltraps
  102022:	e9 8f ff ff ff       	jmp    101fb6 <__alltraps>

00102027 <vector9>:
.globl vector9
vector9:
  pushl $0
  102027:	6a 00                	push   $0x0
  pushl $9
  102029:	6a 09                	push   $0x9
  jmp __alltraps
  10202b:	e9 86 ff ff ff       	jmp    101fb6 <__alltraps>

00102030 <vector10>:
.globl vector10
vector10:
  pushl $10
  102030:	6a 0a                	push   $0xa
  jmp __alltraps
  102032:	e9 7f ff ff ff       	jmp    101fb6 <__alltraps>

00102037 <vector11>:
.globl vector11
vector11:
  pushl $11
  102037:	6a 0b                	push   $0xb
  jmp __alltraps
  102039:	e9 78 ff ff ff       	jmp    101fb6 <__alltraps>

0010203e <vector12>:
.globl vector12
vector12:
  pushl $12
  10203e:	6a 0c                	push   $0xc
  jmp __alltraps
  102040:	e9 71 ff ff ff       	jmp    101fb6 <__alltraps>

00102045 <vector13>:
.globl vector13
vector13:
  pushl $13
  102045:	6a 0d                	push   $0xd
  jmp __alltraps
  102047:	e9 6a ff ff ff       	jmp    101fb6 <__alltraps>

0010204c <vector14>:
.globl vector14
vector14:
  pushl $14
  10204c:	6a 0e                	push   $0xe
  jmp __alltraps
  10204e:	e9 63 ff ff ff       	jmp    101fb6 <__alltraps>

00102053 <vector15>:
.globl vector15
vector15:
  pushl $0
  102053:	6a 00                	push   $0x0
  pushl $15
  102055:	6a 0f                	push   $0xf
  jmp __alltraps
  102057:	e9 5a ff ff ff       	jmp    101fb6 <__alltraps>

0010205c <vector16>:
.globl vector16
vector16:
  pushl $0
  10205c:	6a 00                	push   $0x0
  pushl $16
  10205e:	6a 10                	push   $0x10
  jmp __alltraps
  102060:	e9 51 ff ff ff       	jmp    101fb6 <__alltraps>

00102065 <vector17>:
.globl vector17
vector17:
  pushl $17
  102065:	6a 11                	push   $0x11
  jmp __alltraps
  102067:	e9 4a ff ff ff       	jmp    101fb6 <__alltraps>

0010206c <vector18>:
.globl vector18
vector18:
  pushl $0
  10206c:	6a 00                	push   $0x0
  pushl $18
  10206e:	6a 12                	push   $0x12
  jmp __alltraps
  102070:	e9 41 ff ff ff       	jmp    101fb6 <__alltraps>

00102075 <vector19>:
.globl vector19
vector19:
  pushl $0
  102075:	6a 00                	push   $0x0
  pushl $19
  102077:	6a 13                	push   $0x13
  jmp __alltraps
  102079:	e9 38 ff ff ff       	jmp    101fb6 <__alltraps>

0010207e <vector20>:
.globl vector20
vector20:
  pushl $0
  10207e:	6a 00                	push   $0x0
  pushl $20
  102080:	6a 14                	push   $0x14
  jmp __alltraps
  102082:	e9 2f ff ff ff       	jmp    101fb6 <__alltraps>

00102087 <vector21>:
.globl vector21
vector21:
  pushl $0
  102087:	6a 00                	push   $0x0
  pushl $21
  102089:	6a 15                	push   $0x15
  jmp __alltraps
  10208b:	e9 26 ff ff ff       	jmp    101fb6 <__alltraps>

00102090 <vector22>:
.globl vector22
vector22:
  pushl $0
  102090:	6a 00                	push   $0x0
  pushl $22
  102092:	6a 16                	push   $0x16
  jmp __alltraps
  102094:	e9 1d ff ff ff       	jmp    101fb6 <__alltraps>

00102099 <vector23>:
.globl vector23
vector23:
  pushl $0
  102099:	6a 00                	push   $0x0
  pushl $23
  10209b:	6a 17                	push   $0x17
  jmp __alltraps
  10209d:	e9 14 ff ff ff       	jmp    101fb6 <__alltraps>

001020a2 <vector24>:
.globl vector24
vector24:
  pushl $0
  1020a2:	6a 00                	push   $0x0
  pushl $24
  1020a4:	6a 18                	push   $0x18
  jmp __alltraps
  1020a6:	e9 0b ff ff ff       	jmp    101fb6 <__alltraps>

001020ab <vector25>:
.globl vector25
vector25:
  pushl $0
  1020ab:	6a 00                	push   $0x0
  pushl $25
  1020ad:	6a 19                	push   $0x19
  jmp __alltraps
  1020af:	e9 02 ff ff ff       	jmp    101fb6 <__alltraps>

001020b4 <vector26>:
.globl vector26
vector26:
  pushl $0
  1020b4:	6a 00                	push   $0x0
  pushl $26
  1020b6:	6a 1a                	push   $0x1a
  jmp __alltraps
  1020b8:	e9 f9 fe ff ff       	jmp    101fb6 <__alltraps>

001020bd <vector27>:
.globl vector27
vector27:
  pushl $0
  1020bd:	6a 00                	push   $0x0
  pushl $27
  1020bf:	6a 1b                	push   $0x1b
  jmp __alltraps
  1020c1:	e9 f0 fe ff ff       	jmp    101fb6 <__alltraps>

001020c6 <vector28>:
.globl vector28
vector28:
  pushl $0
  1020c6:	6a 00                	push   $0x0
  pushl $28
  1020c8:	6a 1c                	push   $0x1c
  jmp __alltraps
  1020ca:	e9 e7 fe ff ff       	jmp    101fb6 <__alltraps>

001020cf <vector29>:
.globl vector29
vector29:
  pushl $0
  1020cf:	6a 00                	push   $0x0
  pushl $29
  1020d1:	6a 1d                	push   $0x1d
  jmp __alltraps
  1020d3:	e9 de fe ff ff       	jmp    101fb6 <__alltraps>

001020d8 <vector30>:
.globl vector30
vector30:
  pushl $0
  1020d8:	6a 00                	push   $0x0
  pushl $30
  1020da:	6a 1e                	push   $0x1e
  jmp __alltraps
  1020dc:	e9 d5 fe ff ff       	jmp    101fb6 <__alltraps>

001020e1 <vector31>:
.globl vector31
vector31:
  pushl $0
  1020e1:	6a 00                	push   $0x0
  pushl $31
  1020e3:	6a 1f                	push   $0x1f
  jmp __alltraps
  1020e5:	e9 cc fe ff ff       	jmp    101fb6 <__alltraps>

001020ea <vector32>:
.globl vector32
vector32:
  pushl $0
  1020ea:	6a 00                	push   $0x0
  pushl $32
  1020ec:	6a 20                	push   $0x20
  jmp __alltraps
  1020ee:	e9 c3 fe ff ff       	jmp    101fb6 <__alltraps>

001020f3 <vector33>:
.globl vector33
vector33:
  pushl $0
  1020f3:	6a 00                	push   $0x0
  pushl $33
  1020f5:	6a 21                	push   $0x21
  jmp __alltraps
  1020f7:	e9 ba fe ff ff       	jmp    101fb6 <__alltraps>

001020fc <vector34>:
.globl vector34
vector34:
  pushl $0
  1020fc:	6a 00                	push   $0x0
  pushl $34
  1020fe:	6a 22                	push   $0x22
  jmp __alltraps
  102100:	e9 b1 fe ff ff       	jmp    101fb6 <__alltraps>

00102105 <vector35>:
.globl vector35
vector35:
  pushl $0
  102105:	6a 00                	push   $0x0
  pushl $35
  102107:	6a 23                	push   $0x23
  jmp __alltraps
  102109:	e9 a8 fe ff ff       	jmp    101fb6 <__alltraps>

0010210e <vector36>:
.globl vector36
vector36:
  pushl $0
  10210e:	6a 00                	push   $0x0
  pushl $36
  102110:	6a 24                	push   $0x24
  jmp __alltraps
  102112:	e9 9f fe ff ff       	jmp    101fb6 <__alltraps>

00102117 <vector37>:
.globl vector37
vector37:
  pushl $0
  102117:	6a 00                	push   $0x0
  pushl $37
  102119:	6a 25                	push   $0x25
  jmp __alltraps
  10211b:	e9 96 fe ff ff       	jmp    101fb6 <__alltraps>

00102120 <vector38>:
.globl vector38
vector38:
  pushl $0
  102120:	6a 00                	push   $0x0
  pushl $38
  102122:	6a 26                	push   $0x26
  jmp __alltraps
  102124:	e9 8d fe ff ff       	jmp    101fb6 <__alltraps>

00102129 <vector39>:
.globl vector39
vector39:
  pushl $0
  102129:	6a 00                	push   $0x0
  pushl $39
  10212b:	6a 27                	push   $0x27
  jmp __alltraps
  10212d:	e9 84 fe ff ff       	jmp    101fb6 <__alltraps>

00102132 <vector40>:
.globl vector40
vector40:
  pushl $0
  102132:	6a 00                	push   $0x0
  pushl $40
  102134:	6a 28                	push   $0x28
  jmp __alltraps
  102136:	e9 7b fe ff ff       	jmp    101fb6 <__alltraps>

0010213b <vector41>:
.globl vector41
vector41:
  pushl $0
  10213b:	6a 00                	push   $0x0
  pushl $41
  10213d:	6a 29                	push   $0x29
  jmp __alltraps
  10213f:	e9 72 fe ff ff       	jmp    101fb6 <__alltraps>

00102144 <vector42>:
.globl vector42
vector42:
  pushl $0
  102144:	6a 00                	push   $0x0
  pushl $42
  102146:	6a 2a                	push   $0x2a
  jmp __alltraps
  102148:	e9 69 fe ff ff       	jmp    101fb6 <__alltraps>

0010214d <vector43>:
.globl vector43
vector43:
  pushl $0
  10214d:	6a 00                	push   $0x0
  pushl $43
  10214f:	6a 2b                	push   $0x2b
  jmp __alltraps
  102151:	e9 60 fe ff ff       	jmp    101fb6 <__alltraps>

00102156 <vector44>:
.globl vector44
vector44:
  pushl $0
  102156:	6a 00                	push   $0x0
  pushl $44
  102158:	6a 2c                	push   $0x2c
  jmp __alltraps
  10215a:	e9 57 fe ff ff       	jmp    101fb6 <__alltraps>

0010215f <vector45>:
.globl vector45
vector45:
  pushl $0
  10215f:	6a 00                	push   $0x0
  pushl $45
  102161:	6a 2d                	push   $0x2d
  jmp __alltraps
  102163:	e9 4e fe ff ff       	jmp    101fb6 <__alltraps>

00102168 <vector46>:
.globl vector46
vector46:
  pushl $0
  102168:	6a 00                	push   $0x0
  pushl $46
  10216a:	6a 2e                	push   $0x2e
  jmp __alltraps
  10216c:	e9 45 fe ff ff       	jmp    101fb6 <__alltraps>

00102171 <vector47>:
.globl vector47
vector47:
  pushl $0
  102171:	6a 00                	push   $0x0
  pushl $47
  102173:	6a 2f                	push   $0x2f
  jmp __alltraps
  102175:	e9 3c fe ff ff       	jmp    101fb6 <__alltraps>

0010217a <vector48>:
.globl vector48
vector48:
  pushl $0
  10217a:	6a 00                	push   $0x0
  pushl $48
  10217c:	6a 30                	push   $0x30
  jmp __alltraps
  10217e:	e9 33 fe ff ff       	jmp    101fb6 <__alltraps>

00102183 <vector49>:
.globl vector49
vector49:
  pushl $0
  102183:	6a 00                	push   $0x0
  pushl $49
  102185:	6a 31                	push   $0x31
  jmp __alltraps
  102187:	e9 2a fe ff ff       	jmp    101fb6 <__alltraps>

0010218c <vector50>:
.globl vector50
vector50:
  pushl $0
  10218c:	6a 00                	push   $0x0
  pushl $50
  10218e:	6a 32                	push   $0x32
  jmp __alltraps
  102190:	e9 21 fe ff ff       	jmp    101fb6 <__alltraps>

00102195 <vector51>:
.globl vector51
vector51:
  pushl $0
  102195:	6a 00                	push   $0x0
  pushl $51
  102197:	6a 33                	push   $0x33
  jmp __alltraps
  102199:	e9 18 fe ff ff       	jmp    101fb6 <__alltraps>

0010219e <vector52>:
.globl vector52
vector52:
  pushl $0
  10219e:	6a 00                	push   $0x0
  pushl $52
  1021a0:	6a 34                	push   $0x34
  jmp __alltraps
  1021a2:	e9 0f fe ff ff       	jmp    101fb6 <__alltraps>

001021a7 <vector53>:
.globl vector53
vector53:
  pushl $0
  1021a7:	6a 00                	push   $0x0
  pushl $53
  1021a9:	6a 35                	push   $0x35
  jmp __alltraps
  1021ab:	e9 06 fe ff ff       	jmp    101fb6 <__alltraps>

001021b0 <vector54>:
.globl vector54
vector54:
  pushl $0
  1021b0:	6a 00                	push   $0x0
  pushl $54
  1021b2:	6a 36                	push   $0x36
  jmp __alltraps
  1021b4:	e9 fd fd ff ff       	jmp    101fb6 <__alltraps>

001021b9 <vector55>:
.globl vector55
vector55:
  pushl $0
  1021b9:	6a 00                	push   $0x0
  pushl $55
  1021bb:	6a 37                	push   $0x37
  jmp __alltraps
  1021bd:	e9 f4 fd ff ff       	jmp    101fb6 <__alltraps>

001021c2 <vector56>:
.globl vector56
vector56:
  pushl $0
  1021c2:	6a 00                	push   $0x0
  pushl $56
  1021c4:	6a 38                	push   $0x38
  jmp __alltraps
  1021c6:	e9 eb fd ff ff       	jmp    101fb6 <__alltraps>

001021cb <vector57>:
.globl vector57
vector57:
  pushl $0
  1021cb:	6a 00                	push   $0x0
  pushl $57
  1021cd:	6a 39                	push   $0x39
  jmp __alltraps
  1021cf:	e9 e2 fd ff ff       	jmp    101fb6 <__alltraps>

001021d4 <vector58>:
.globl vector58
vector58:
  pushl $0
  1021d4:	6a 00                	push   $0x0
  pushl $58
  1021d6:	6a 3a                	push   $0x3a
  jmp __alltraps
  1021d8:	e9 d9 fd ff ff       	jmp    101fb6 <__alltraps>

001021dd <vector59>:
.globl vector59
vector59:
  pushl $0
  1021dd:	6a 00                	push   $0x0
  pushl $59
  1021df:	6a 3b                	push   $0x3b
  jmp __alltraps
  1021e1:	e9 d0 fd ff ff       	jmp    101fb6 <__alltraps>

001021e6 <vector60>:
.globl vector60
vector60:
  pushl $0
  1021e6:	6a 00                	push   $0x0
  pushl $60
  1021e8:	6a 3c                	push   $0x3c
  jmp __alltraps
  1021ea:	e9 c7 fd ff ff       	jmp    101fb6 <__alltraps>

001021ef <vector61>:
.globl vector61
vector61:
  pushl $0
  1021ef:	6a 00                	push   $0x0
  pushl $61
  1021f1:	6a 3d                	push   $0x3d
  jmp __alltraps
  1021f3:	e9 be fd ff ff       	jmp    101fb6 <__alltraps>

001021f8 <vector62>:
.globl vector62
vector62:
  pushl $0
  1021f8:	6a 00                	push   $0x0
  pushl $62
  1021fa:	6a 3e                	push   $0x3e
  jmp __alltraps
  1021fc:	e9 b5 fd ff ff       	jmp    101fb6 <__alltraps>

00102201 <vector63>:
.globl vector63
vector63:
  pushl $0
  102201:	6a 00                	push   $0x0
  pushl $63
  102203:	6a 3f                	push   $0x3f
  jmp __alltraps
  102205:	e9 ac fd ff ff       	jmp    101fb6 <__alltraps>

0010220a <vector64>:
.globl vector64
vector64:
  pushl $0
  10220a:	6a 00                	push   $0x0
  pushl $64
  10220c:	6a 40                	push   $0x40
  jmp __alltraps
  10220e:	e9 a3 fd ff ff       	jmp    101fb6 <__alltraps>

00102213 <vector65>:
.globl vector65
vector65:
  pushl $0
  102213:	6a 00                	push   $0x0
  pushl $65
  102215:	6a 41                	push   $0x41
  jmp __alltraps
  102217:	e9 9a fd ff ff       	jmp    101fb6 <__alltraps>

0010221c <vector66>:
.globl vector66
vector66:
  pushl $0
  10221c:	6a 00                	push   $0x0
  pushl $66
  10221e:	6a 42                	push   $0x42
  jmp __alltraps
  102220:	e9 91 fd ff ff       	jmp    101fb6 <__alltraps>

00102225 <vector67>:
.globl vector67
vector67:
  pushl $0
  102225:	6a 00                	push   $0x0
  pushl $67
  102227:	6a 43                	push   $0x43
  jmp __alltraps
  102229:	e9 88 fd ff ff       	jmp    101fb6 <__alltraps>

0010222e <vector68>:
.globl vector68
vector68:
  pushl $0
  10222e:	6a 00                	push   $0x0
  pushl $68
  102230:	6a 44                	push   $0x44
  jmp __alltraps
  102232:	e9 7f fd ff ff       	jmp    101fb6 <__alltraps>

00102237 <vector69>:
.globl vector69
vector69:
  pushl $0
  102237:	6a 00                	push   $0x0
  pushl $69
  102239:	6a 45                	push   $0x45
  jmp __alltraps
  10223b:	e9 76 fd ff ff       	jmp    101fb6 <__alltraps>

00102240 <vector70>:
.globl vector70
vector70:
  pushl $0
  102240:	6a 00                	push   $0x0
  pushl $70
  102242:	6a 46                	push   $0x46
  jmp __alltraps
  102244:	e9 6d fd ff ff       	jmp    101fb6 <__alltraps>

00102249 <vector71>:
.globl vector71
vector71:
  pushl $0
  102249:	6a 00                	push   $0x0
  pushl $71
  10224b:	6a 47                	push   $0x47
  jmp __alltraps
  10224d:	e9 64 fd ff ff       	jmp    101fb6 <__alltraps>

00102252 <vector72>:
.globl vector72
vector72:
  pushl $0
  102252:	6a 00                	push   $0x0
  pushl $72
  102254:	6a 48                	push   $0x48
  jmp __alltraps
  102256:	e9 5b fd ff ff       	jmp    101fb6 <__alltraps>

0010225b <vector73>:
.globl vector73
vector73:
  pushl $0
  10225b:	6a 00                	push   $0x0
  pushl $73
  10225d:	6a 49                	push   $0x49
  jmp __alltraps
  10225f:	e9 52 fd ff ff       	jmp    101fb6 <__alltraps>

00102264 <vector74>:
.globl vector74
vector74:
  pushl $0
  102264:	6a 00                	push   $0x0
  pushl $74
  102266:	6a 4a                	push   $0x4a
  jmp __alltraps
  102268:	e9 49 fd ff ff       	jmp    101fb6 <__alltraps>

0010226d <vector75>:
.globl vector75
vector75:
  pushl $0
  10226d:	6a 00                	push   $0x0
  pushl $75
  10226f:	6a 4b                	push   $0x4b
  jmp __alltraps
  102271:	e9 40 fd ff ff       	jmp    101fb6 <__alltraps>

00102276 <vector76>:
.globl vector76
vector76:
  pushl $0
  102276:	6a 00                	push   $0x0
  pushl $76
  102278:	6a 4c                	push   $0x4c
  jmp __alltraps
  10227a:	e9 37 fd ff ff       	jmp    101fb6 <__alltraps>

0010227f <vector77>:
.globl vector77
vector77:
  pushl $0
  10227f:	6a 00                	push   $0x0
  pushl $77
  102281:	6a 4d                	push   $0x4d
  jmp __alltraps
  102283:	e9 2e fd ff ff       	jmp    101fb6 <__alltraps>

00102288 <vector78>:
.globl vector78
vector78:
  pushl $0
  102288:	6a 00                	push   $0x0
  pushl $78
  10228a:	6a 4e                	push   $0x4e
  jmp __alltraps
  10228c:	e9 25 fd ff ff       	jmp    101fb6 <__alltraps>

00102291 <vector79>:
.globl vector79
vector79:
  pushl $0
  102291:	6a 00                	push   $0x0
  pushl $79
  102293:	6a 4f                	push   $0x4f
  jmp __alltraps
  102295:	e9 1c fd ff ff       	jmp    101fb6 <__alltraps>

0010229a <vector80>:
.globl vector80
vector80:
  pushl $0
  10229a:	6a 00                	push   $0x0
  pushl $80
  10229c:	6a 50                	push   $0x50
  jmp __alltraps
  10229e:	e9 13 fd ff ff       	jmp    101fb6 <__alltraps>

001022a3 <vector81>:
.globl vector81
vector81:
  pushl $0
  1022a3:	6a 00                	push   $0x0
  pushl $81
  1022a5:	6a 51                	push   $0x51
  jmp __alltraps
  1022a7:	e9 0a fd ff ff       	jmp    101fb6 <__alltraps>

001022ac <vector82>:
.globl vector82
vector82:
  pushl $0
  1022ac:	6a 00                	push   $0x0
  pushl $82
  1022ae:	6a 52                	push   $0x52
  jmp __alltraps
  1022b0:	e9 01 fd ff ff       	jmp    101fb6 <__alltraps>

001022b5 <vector83>:
.globl vector83
vector83:
  pushl $0
  1022b5:	6a 00                	push   $0x0
  pushl $83
  1022b7:	6a 53                	push   $0x53
  jmp __alltraps
  1022b9:	e9 f8 fc ff ff       	jmp    101fb6 <__alltraps>

001022be <vector84>:
.globl vector84
vector84:
  pushl $0
  1022be:	6a 00                	push   $0x0
  pushl $84
  1022c0:	6a 54                	push   $0x54
  jmp __alltraps
  1022c2:	e9 ef fc ff ff       	jmp    101fb6 <__alltraps>

001022c7 <vector85>:
.globl vector85
vector85:
  pushl $0
  1022c7:	6a 00                	push   $0x0
  pushl $85
  1022c9:	6a 55                	push   $0x55
  jmp __alltraps
  1022cb:	e9 e6 fc ff ff       	jmp    101fb6 <__alltraps>

001022d0 <vector86>:
.globl vector86
vector86:
  pushl $0
  1022d0:	6a 00                	push   $0x0
  pushl $86
  1022d2:	6a 56                	push   $0x56
  jmp __alltraps
  1022d4:	e9 dd fc ff ff       	jmp    101fb6 <__alltraps>

001022d9 <vector87>:
.globl vector87
vector87:
  pushl $0
  1022d9:	6a 00                	push   $0x0
  pushl $87
  1022db:	6a 57                	push   $0x57
  jmp __alltraps
  1022dd:	e9 d4 fc ff ff       	jmp    101fb6 <__alltraps>

001022e2 <vector88>:
.globl vector88
vector88:
  pushl $0
  1022e2:	6a 00                	push   $0x0
  pushl $88
  1022e4:	6a 58                	push   $0x58
  jmp __alltraps
  1022e6:	e9 cb fc ff ff       	jmp    101fb6 <__alltraps>

001022eb <vector89>:
.globl vector89
vector89:
  pushl $0
  1022eb:	6a 00                	push   $0x0
  pushl $89
  1022ed:	6a 59                	push   $0x59
  jmp __alltraps
  1022ef:	e9 c2 fc ff ff       	jmp    101fb6 <__alltraps>

001022f4 <vector90>:
.globl vector90
vector90:
  pushl $0
  1022f4:	6a 00                	push   $0x0
  pushl $90
  1022f6:	6a 5a                	push   $0x5a
  jmp __alltraps
  1022f8:	e9 b9 fc ff ff       	jmp    101fb6 <__alltraps>

001022fd <vector91>:
.globl vector91
vector91:
  pushl $0
  1022fd:	6a 00                	push   $0x0
  pushl $91
  1022ff:	6a 5b                	push   $0x5b
  jmp __alltraps
  102301:	e9 b0 fc ff ff       	jmp    101fb6 <__alltraps>

00102306 <vector92>:
.globl vector92
vector92:
  pushl $0
  102306:	6a 00                	push   $0x0
  pushl $92
  102308:	6a 5c                	push   $0x5c
  jmp __alltraps
  10230a:	e9 a7 fc ff ff       	jmp    101fb6 <__alltraps>

0010230f <vector93>:
.globl vector93
vector93:
  pushl $0
  10230f:	6a 00                	push   $0x0
  pushl $93
  102311:	6a 5d                	push   $0x5d
  jmp __alltraps
  102313:	e9 9e fc ff ff       	jmp    101fb6 <__alltraps>

00102318 <vector94>:
.globl vector94
vector94:
  pushl $0
  102318:	6a 00                	push   $0x0
  pushl $94
  10231a:	6a 5e                	push   $0x5e
  jmp __alltraps
  10231c:	e9 95 fc ff ff       	jmp    101fb6 <__alltraps>

00102321 <vector95>:
.globl vector95
vector95:
  pushl $0
  102321:	6a 00                	push   $0x0
  pushl $95
  102323:	6a 5f                	push   $0x5f
  jmp __alltraps
  102325:	e9 8c fc ff ff       	jmp    101fb6 <__alltraps>

0010232a <vector96>:
.globl vector96
vector96:
  pushl $0
  10232a:	6a 00                	push   $0x0
  pushl $96
  10232c:	6a 60                	push   $0x60
  jmp __alltraps
  10232e:	e9 83 fc ff ff       	jmp    101fb6 <__alltraps>

00102333 <vector97>:
.globl vector97
vector97:
  pushl $0
  102333:	6a 00                	push   $0x0
  pushl $97
  102335:	6a 61                	push   $0x61
  jmp __alltraps
  102337:	e9 7a fc ff ff       	jmp    101fb6 <__alltraps>

0010233c <vector98>:
.globl vector98
vector98:
  pushl $0
  10233c:	6a 00                	push   $0x0
  pushl $98
  10233e:	6a 62                	push   $0x62
  jmp __alltraps
  102340:	e9 71 fc ff ff       	jmp    101fb6 <__alltraps>

00102345 <vector99>:
.globl vector99
vector99:
  pushl $0
  102345:	6a 00                	push   $0x0
  pushl $99
  102347:	6a 63                	push   $0x63
  jmp __alltraps
  102349:	e9 68 fc ff ff       	jmp    101fb6 <__alltraps>

0010234e <vector100>:
.globl vector100
vector100:
  pushl $0
  10234e:	6a 00                	push   $0x0
  pushl $100
  102350:	6a 64                	push   $0x64
  jmp __alltraps
  102352:	e9 5f fc ff ff       	jmp    101fb6 <__alltraps>

00102357 <vector101>:
.globl vector101
vector101:
  pushl $0
  102357:	6a 00                	push   $0x0
  pushl $101
  102359:	6a 65                	push   $0x65
  jmp __alltraps
  10235b:	e9 56 fc ff ff       	jmp    101fb6 <__alltraps>

00102360 <vector102>:
.globl vector102
vector102:
  pushl $0
  102360:	6a 00                	push   $0x0
  pushl $102
  102362:	6a 66                	push   $0x66
  jmp __alltraps
  102364:	e9 4d fc ff ff       	jmp    101fb6 <__alltraps>

00102369 <vector103>:
.globl vector103
vector103:
  pushl $0
  102369:	6a 00                	push   $0x0
  pushl $103
  10236b:	6a 67                	push   $0x67
  jmp __alltraps
  10236d:	e9 44 fc ff ff       	jmp    101fb6 <__alltraps>

00102372 <vector104>:
.globl vector104
vector104:
  pushl $0
  102372:	6a 00                	push   $0x0
  pushl $104
  102374:	6a 68                	push   $0x68
  jmp __alltraps
  102376:	e9 3b fc ff ff       	jmp    101fb6 <__alltraps>

0010237b <vector105>:
.globl vector105
vector105:
  pushl $0
  10237b:	6a 00                	push   $0x0
  pushl $105
  10237d:	6a 69                	push   $0x69
  jmp __alltraps
  10237f:	e9 32 fc ff ff       	jmp    101fb6 <__alltraps>

00102384 <vector106>:
.globl vector106
vector106:
  pushl $0
  102384:	6a 00                	push   $0x0
  pushl $106
  102386:	6a 6a                	push   $0x6a
  jmp __alltraps
  102388:	e9 29 fc ff ff       	jmp    101fb6 <__alltraps>

0010238d <vector107>:
.globl vector107
vector107:
  pushl $0
  10238d:	6a 00                	push   $0x0
  pushl $107
  10238f:	6a 6b                	push   $0x6b
  jmp __alltraps
  102391:	e9 20 fc ff ff       	jmp    101fb6 <__alltraps>

00102396 <vector108>:
.globl vector108
vector108:
  pushl $0
  102396:	6a 00                	push   $0x0
  pushl $108
  102398:	6a 6c                	push   $0x6c
  jmp __alltraps
  10239a:	e9 17 fc ff ff       	jmp    101fb6 <__alltraps>

0010239f <vector109>:
.globl vector109
vector109:
  pushl $0
  10239f:	6a 00                	push   $0x0
  pushl $109
  1023a1:	6a 6d                	push   $0x6d
  jmp __alltraps
  1023a3:	e9 0e fc ff ff       	jmp    101fb6 <__alltraps>

001023a8 <vector110>:
.globl vector110
vector110:
  pushl $0
  1023a8:	6a 00                	push   $0x0
  pushl $110
  1023aa:	6a 6e                	push   $0x6e
  jmp __alltraps
  1023ac:	e9 05 fc ff ff       	jmp    101fb6 <__alltraps>

001023b1 <vector111>:
.globl vector111
vector111:
  pushl $0
  1023b1:	6a 00                	push   $0x0
  pushl $111
  1023b3:	6a 6f                	push   $0x6f
  jmp __alltraps
  1023b5:	e9 fc fb ff ff       	jmp    101fb6 <__alltraps>

001023ba <vector112>:
.globl vector112
vector112:
  pushl $0
  1023ba:	6a 00                	push   $0x0
  pushl $112
  1023bc:	6a 70                	push   $0x70
  jmp __alltraps
  1023be:	e9 f3 fb ff ff       	jmp    101fb6 <__alltraps>

001023c3 <vector113>:
.globl vector113
vector113:
  pushl $0
  1023c3:	6a 00                	push   $0x0
  pushl $113
  1023c5:	6a 71                	push   $0x71
  jmp __alltraps
  1023c7:	e9 ea fb ff ff       	jmp    101fb6 <__alltraps>

001023cc <vector114>:
.globl vector114
vector114:
  pushl $0
  1023cc:	6a 00                	push   $0x0
  pushl $114
  1023ce:	6a 72                	push   $0x72
  jmp __alltraps
  1023d0:	e9 e1 fb ff ff       	jmp    101fb6 <__alltraps>

001023d5 <vector115>:
.globl vector115
vector115:
  pushl $0
  1023d5:	6a 00                	push   $0x0
  pushl $115
  1023d7:	6a 73                	push   $0x73
  jmp __alltraps
  1023d9:	e9 d8 fb ff ff       	jmp    101fb6 <__alltraps>

001023de <vector116>:
.globl vector116
vector116:
  pushl $0
  1023de:	6a 00                	push   $0x0
  pushl $116
  1023e0:	6a 74                	push   $0x74
  jmp __alltraps
  1023e2:	e9 cf fb ff ff       	jmp    101fb6 <__alltraps>

001023e7 <vector117>:
.globl vector117
vector117:
  pushl $0
  1023e7:	6a 00                	push   $0x0
  pushl $117
  1023e9:	6a 75                	push   $0x75
  jmp __alltraps
  1023eb:	e9 c6 fb ff ff       	jmp    101fb6 <__alltraps>

001023f0 <vector118>:
.globl vector118
vector118:
  pushl $0
  1023f0:	6a 00                	push   $0x0
  pushl $118
  1023f2:	6a 76                	push   $0x76
  jmp __alltraps
  1023f4:	e9 bd fb ff ff       	jmp    101fb6 <__alltraps>

001023f9 <vector119>:
.globl vector119
vector119:
  pushl $0
  1023f9:	6a 00                	push   $0x0
  pushl $119
  1023fb:	6a 77                	push   $0x77
  jmp __alltraps
  1023fd:	e9 b4 fb ff ff       	jmp    101fb6 <__alltraps>

00102402 <vector120>:
.globl vector120
vector120:
  pushl $0
  102402:	6a 00                	push   $0x0
  pushl $120
  102404:	6a 78                	push   $0x78
  jmp __alltraps
  102406:	e9 ab fb ff ff       	jmp    101fb6 <__alltraps>

0010240b <vector121>:
.globl vector121
vector121:
  pushl $0
  10240b:	6a 00                	push   $0x0
  pushl $121
  10240d:	6a 79                	push   $0x79
  jmp __alltraps
  10240f:	e9 a2 fb ff ff       	jmp    101fb6 <__alltraps>

00102414 <vector122>:
.globl vector122
vector122:
  pushl $0
  102414:	6a 00                	push   $0x0
  pushl $122
  102416:	6a 7a                	push   $0x7a
  jmp __alltraps
  102418:	e9 99 fb ff ff       	jmp    101fb6 <__alltraps>

0010241d <vector123>:
.globl vector123
vector123:
  pushl $0
  10241d:	6a 00                	push   $0x0
  pushl $123
  10241f:	6a 7b                	push   $0x7b
  jmp __alltraps
  102421:	e9 90 fb ff ff       	jmp    101fb6 <__alltraps>

00102426 <vector124>:
.globl vector124
vector124:
  pushl $0
  102426:	6a 00                	push   $0x0
  pushl $124
  102428:	6a 7c                	push   $0x7c
  jmp __alltraps
  10242a:	e9 87 fb ff ff       	jmp    101fb6 <__alltraps>

0010242f <vector125>:
.globl vector125
vector125:
  pushl $0
  10242f:	6a 00                	push   $0x0
  pushl $125
  102431:	6a 7d                	push   $0x7d
  jmp __alltraps
  102433:	e9 7e fb ff ff       	jmp    101fb6 <__alltraps>

00102438 <vector126>:
.globl vector126
vector126:
  pushl $0
  102438:	6a 00                	push   $0x0
  pushl $126
  10243a:	6a 7e                	push   $0x7e
  jmp __alltraps
  10243c:	e9 75 fb ff ff       	jmp    101fb6 <__alltraps>

00102441 <vector127>:
.globl vector127
vector127:
  pushl $0
  102441:	6a 00                	push   $0x0
  pushl $127
  102443:	6a 7f                	push   $0x7f
  jmp __alltraps
  102445:	e9 6c fb ff ff       	jmp    101fb6 <__alltraps>

0010244a <vector128>:
.globl vector128
vector128:
  pushl $0
  10244a:	6a 00                	push   $0x0
  pushl $128
  10244c:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102451:	e9 60 fb ff ff       	jmp    101fb6 <__alltraps>

00102456 <vector129>:
.globl vector129
vector129:
  pushl $0
  102456:	6a 00                	push   $0x0
  pushl $129
  102458:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10245d:	e9 54 fb ff ff       	jmp    101fb6 <__alltraps>

00102462 <vector130>:
.globl vector130
vector130:
  pushl $0
  102462:	6a 00                	push   $0x0
  pushl $130
  102464:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102469:	e9 48 fb ff ff       	jmp    101fb6 <__alltraps>

0010246e <vector131>:
.globl vector131
vector131:
  pushl $0
  10246e:	6a 00                	push   $0x0
  pushl $131
  102470:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102475:	e9 3c fb ff ff       	jmp    101fb6 <__alltraps>

0010247a <vector132>:
.globl vector132
vector132:
  pushl $0
  10247a:	6a 00                	push   $0x0
  pushl $132
  10247c:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102481:	e9 30 fb ff ff       	jmp    101fb6 <__alltraps>

00102486 <vector133>:
.globl vector133
vector133:
  pushl $0
  102486:	6a 00                	push   $0x0
  pushl $133
  102488:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10248d:	e9 24 fb ff ff       	jmp    101fb6 <__alltraps>

00102492 <vector134>:
.globl vector134
vector134:
  pushl $0
  102492:	6a 00                	push   $0x0
  pushl $134
  102494:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102499:	e9 18 fb ff ff       	jmp    101fb6 <__alltraps>

0010249e <vector135>:
.globl vector135
vector135:
  pushl $0
  10249e:	6a 00                	push   $0x0
  pushl $135
  1024a0:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1024a5:	e9 0c fb ff ff       	jmp    101fb6 <__alltraps>

001024aa <vector136>:
.globl vector136
vector136:
  pushl $0
  1024aa:	6a 00                	push   $0x0
  pushl $136
  1024ac:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1024b1:	e9 00 fb ff ff       	jmp    101fb6 <__alltraps>

001024b6 <vector137>:
.globl vector137
vector137:
  pushl $0
  1024b6:	6a 00                	push   $0x0
  pushl $137
  1024b8:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1024bd:	e9 f4 fa ff ff       	jmp    101fb6 <__alltraps>

001024c2 <vector138>:
.globl vector138
vector138:
  pushl $0
  1024c2:	6a 00                	push   $0x0
  pushl $138
  1024c4:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1024c9:	e9 e8 fa ff ff       	jmp    101fb6 <__alltraps>

001024ce <vector139>:
.globl vector139
vector139:
  pushl $0
  1024ce:	6a 00                	push   $0x0
  pushl $139
  1024d0:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1024d5:	e9 dc fa ff ff       	jmp    101fb6 <__alltraps>

001024da <vector140>:
.globl vector140
vector140:
  pushl $0
  1024da:	6a 00                	push   $0x0
  pushl $140
  1024dc:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1024e1:	e9 d0 fa ff ff       	jmp    101fb6 <__alltraps>

001024e6 <vector141>:
.globl vector141
vector141:
  pushl $0
  1024e6:	6a 00                	push   $0x0
  pushl $141
  1024e8:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1024ed:	e9 c4 fa ff ff       	jmp    101fb6 <__alltraps>

001024f2 <vector142>:
.globl vector142
vector142:
  pushl $0
  1024f2:	6a 00                	push   $0x0
  pushl $142
  1024f4:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1024f9:	e9 b8 fa ff ff       	jmp    101fb6 <__alltraps>

001024fe <vector143>:
.globl vector143
vector143:
  pushl $0
  1024fe:	6a 00                	push   $0x0
  pushl $143
  102500:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102505:	e9 ac fa ff ff       	jmp    101fb6 <__alltraps>

0010250a <vector144>:
.globl vector144
vector144:
  pushl $0
  10250a:	6a 00                	push   $0x0
  pushl $144
  10250c:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102511:	e9 a0 fa ff ff       	jmp    101fb6 <__alltraps>

00102516 <vector145>:
.globl vector145
vector145:
  pushl $0
  102516:	6a 00                	push   $0x0
  pushl $145
  102518:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10251d:	e9 94 fa ff ff       	jmp    101fb6 <__alltraps>

00102522 <vector146>:
.globl vector146
vector146:
  pushl $0
  102522:	6a 00                	push   $0x0
  pushl $146
  102524:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102529:	e9 88 fa ff ff       	jmp    101fb6 <__alltraps>

0010252e <vector147>:
.globl vector147
vector147:
  pushl $0
  10252e:	6a 00                	push   $0x0
  pushl $147
  102530:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102535:	e9 7c fa ff ff       	jmp    101fb6 <__alltraps>

0010253a <vector148>:
.globl vector148
vector148:
  pushl $0
  10253a:	6a 00                	push   $0x0
  pushl $148
  10253c:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102541:	e9 70 fa ff ff       	jmp    101fb6 <__alltraps>

00102546 <vector149>:
.globl vector149
vector149:
  pushl $0
  102546:	6a 00                	push   $0x0
  pushl $149
  102548:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10254d:	e9 64 fa ff ff       	jmp    101fb6 <__alltraps>

00102552 <vector150>:
.globl vector150
vector150:
  pushl $0
  102552:	6a 00                	push   $0x0
  pushl $150
  102554:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102559:	e9 58 fa ff ff       	jmp    101fb6 <__alltraps>

0010255e <vector151>:
.globl vector151
vector151:
  pushl $0
  10255e:	6a 00                	push   $0x0
  pushl $151
  102560:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102565:	e9 4c fa ff ff       	jmp    101fb6 <__alltraps>

0010256a <vector152>:
.globl vector152
vector152:
  pushl $0
  10256a:	6a 00                	push   $0x0
  pushl $152
  10256c:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102571:	e9 40 fa ff ff       	jmp    101fb6 <__alltraps>

00102576 <vector153>:
.globl vector153
vector153:
  pushl $0
  102576:	6a 00                	push   $0x0
  pushl $153
  102578:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10257d:	e9 34 fa ff ff       	jmp    101fb6 <__alltraps>

00102582 <vector154>:
.globl vector154
vector154:
  pushl $0
  102582:	6a 00                	push   $0x0
  pushl $154
  102584:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102589:	e9 28 fa ff ff       	jmp    101fb6 <__alltraps>

0010258e <vector155>:
.globl vector155
vector155:
  pushl $0
  10258e:	6a 00                	push   $0x0
  pushl $155
  102590:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102595:	e9 1c fa ff ff       	jmp    101fb6 <__alltraps>

0010259a <vector156>:
.globl vector156
vector156:
  pushl $0
  10259a:	6a 00                	push   $0x0
  pushl $156
  10259c:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1025a1:	e9 10 fa ff ff       	jmp    101fb6 <__alltraps>

001025a6 <vector157>:
.globl vector157
vector157:
  pushl $0
  1025a6:	6a 00                	push   $0x0
  pushl $157
  1025a8:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1025ad:	e9 04 fa ff ff       	jmp    101fb6 <__alltraps>

001025b2 <vector158>:
.globl vector158
vector158:
  pushl $0
  1025b2:	6a 00                	push   $0x0
  pushl $158
  1025b4:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1025b9:	e9 f8 f9 ff ff       	jmp    101fb6 <__alltraps>

001025be <vector159>:
.globl vector159
vector159:
  pushl $0
  1025be:	6a 00                	push   $0x0
  pushl $159
  1025c0:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1025c5:	e9 ec f9 ff ff       	jmp    101fb6 <__alltraps>

001025ca <vector160>:
.globl vector160
vector160:
  pushl $0
  1025ca:	6a 00                	push   $0x0
  pushl $160
  1025cc:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1025d1:	e9 e0 f9 ff ff       	jmp    101fb6 <__alltraps>

001025d6 <vector161>:
.globl vector161
vector161:
  pushl $0
  1025d6:	6a 00                	push   $0x0
  pushl $161
  1025d8:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1025dd:	e9 d4 f9 ff ff       	jmp    101fb6 <__alltraps>

001025e2 <vector162>:
.globl vector162
vector162:
  pushl $0
  1025e2:	6a 00                	push   $0x0
  pushl $162
  1025e4:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1025e9:	e9 c8 f9 ff ff       	jmp    101fb6 <__alltraps>

001025ee <vector163>:
.globl vector163
vector163:
  pushl $0
  1025ee:	6a 00                	push   $0x0
  pushl $163
  1025f0:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1025f5:	e9 bc f9 ff ff       	jmp    101fb6 <__alltraps>

001025fa <vector164>:
.globl vector164
vector164:
  pushl $0
  1025fa:	6a 00                	push   $0x0
  pushl $164
  1025fc:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102601:	e9 b0 f9 ff ff       	jmp    101fb6 <__alltraps>

00102606 <vector165>:
.globl vector165
vector165:
  pushl $0
  102606:	6a 00                	push   $0x0
  pushl $165
  102608:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  10260d:	e9 a4 f9 ff ff       	jmp    101fb6 <__alltraps>

00102612 <vector166>:
.globl vector166
vector166:
  pushl $0
  102612:	6a 00                	push   $0x0
  pushl $166
  102614:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102619:	e9 98 f9 ff ff       	jmp    101fb6 <__alltraps>

0010261e <vector167>:
.globl vector167
vector167:
  pushl $0
  10261e:	6a 00                	push   $0x0
  pushl $167
  102620:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102625:	e9 8c f9 ff ff       	jmp    101fb6 <__alltraps>

0010262a <vector168>:
.globl vector168
vector168:
  pushl $0
  10262a:	6a 00                	push   $0x0
  pushl $168
  10262c:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102631:	e9 80 f9 ff ff       	jmp    101fb6 <__alltraps>

00102636 <vector169>:
.globl vector169
vector169:
  pushl $0
  102636:	6a 00                	push   $0x0
  pushl $169
  102638:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10263d:	e9 74 f9 ff ff       	jmp    101fb6 <__alltraps>

00102642 <vector170>:
.globl vector170
vector170:
  pushl $0
  102642:	6a 00                	push   $0x0
  pushl $170
  102644:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102649:	e9 68 f9 ff ff       	jmp    101fb6 <__alltraps>

0010264e <vector171>:
.globl vector171
vector171:
  pushl $0
  10264e:	6a 00                	push   $0x0
  pushl $171
  102650:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102655:	e9 5c f9 ff ff       	jmp    101fb6 <__alltraps>

0010265a <vector172>:
.globl vector172
vector172:
  pushl $0
  10265a:	6a 00                	push   $0x0
  pushl $172
  10265c:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102661:	e9 50 f9 ff ff       	jmp    101fb6 <__alltraps>

00102666 <vector173>:
.globl vector173
vector173:
  pushl $0
  102666:	6a 00                	push   $0x0
  pushl $173
  102668:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10266d:	e9 44 f9 ff ff       	jmp    101fb6 <__alltraps>

00102672 <vector174>:
.globl vector174
vector174:
  pushl $0
  102672:	6a 00                	push   $0x0
  pushl $174
  102674:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102679:	e9 38 f9 ff ff       	jmp    101fb6 <__alltraps>

0010267e <vector175>:
.globl vector175
vector175:
  pushl $0
  10267e:	6a 00                	push   $0x0
  pushl $175
  102680:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102685:	e9 2c f9 ff ff       	jmp    101fb6 <__alltraps>

0010268a <vector176>:
.globl vector176
vector176:
  pushl $0
  10268a:	6a 00                	push   $0x0
  pushl $176
  10268c:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102691:	e9 20 f9 ff ff       	jmp    101fb6 <__alltraps>

00102696 <vector177>:
.globl vector177
vector177:
  pushl $0
  102696:	6a 00                	push   $0x0
  pushl $177
  102698:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10269d:	e9 14 f9 ff ff       	jmp    101fb6 <__alltraps>

001026a2 <vector178>:
.globl vector178
vector178:
  pushl $0
  1026a2:	6a 00                	push   $0x0
  pushl $178
  1026a4:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1026a9:	e9 08 f9 ff ff       	jmp    101fb6 <__alltraps>

001026ae <vector179>:
.globl vector179
vector179:
  pushl $0
  1026ae:	6a 00                	push   $0x0
  pushl $179
  1026b0:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1026b5:	e9 fc f8 ff ff       	jmp    101fb6 <__alltraps>

001026ba <vector180>:
.globl vector180
vector180:
  pushl $0
  1026ba:	6a 00                	push   $0x0
  pushl $180
  1026bc:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1026c1:	e9 f0 f8 ff ff       	jmp    101fb6 <__alltraps>

001026c6 <vector181>:
.globl vector181
vector181:
  pushl $0
  1026c6:	6a 00                	push   $0x0
  pushl $181
  1026c8:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1026cd:	e9 e4 f8 ff ff       	jmp    101fb6 <__alltraps>

001026d2 <vector182>:
.globl vector182
vector182:
  pushl $0
  1026d2:	6a 00                	push   $0x0
  pushl $182
  1026d4:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1026d9:	e9 d8 f8 ff ff       	jmp    101fb6 <__alltraps>

001026de <vector183>:
.globl vector183
vector183:
  pushl $0
  1026de:	6a 00                	push   $0x0
  pushl $183
  1026e0:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1026e5:	e9 cc f8 ff ff       	jmp    101fb6 <__alltraps>

001026ea <vector184>:
.globl vector184
vector184:
  pushl $0
  1026ea:	6a 00                	push   $0x0
  pushl $184
  1026ec:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1026f1:	e9 c0 f8 ff ff       	jmp    101fb6 <__alltraps>

001026f6 <vector185>:
.globl vector185
vector185:
  pushl $0
  1026f6:	6a 00                	push   $0x0
  pushl $185
  1026f8:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1026fd:	e9 b4 f8 ff ff       	jmp    101fb6 <__alltraps>

00102702 <vector186>:
.globl vector186
vector186:
  pushl $0
  102702:	6a 00                	push   $0x0
  pushl $186
  102704:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102709:	e9 a8 f8 ff ff       	jmp    101fb6 <__alltraps>

0010270e <vector187>:
.globl vector187
vector187:
  pushl $0
  10270e:	6a 00                	push   $0x0
  pushl $187
  102710:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102715:	e9 9c f8 ff ff       	jmp    101fb6 <__alltraps>

0010271a <vector188>:
.globl vector188
vector188:
  pushl $0
  10271a:	6a 00                	push   $0x0
  pushl $188
  10271c:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102721:	e9 90 f8 ff ff       	jmp    101fb6 <__alltraps>

00102726 <vector189>:
.globl vector189
vector189:
  pushl $0
  102726:	6a 00                	push   $0x0
  pushl $189
  102728:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10272d:	e9 84 f8 ff ff       	jmp    101fb6 <__alltraps>

00102732 <vector190>:
.globl vector190
vector190:
  pushl $0
  102732:	6a 00                	push   $0x0
  pushl $190
  102734:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102739:	e9 78 f8 ff ff       	jmp    101fb6 <__alltraps>

0010273e <vector191>:
.globl vector191
vector191:
  pushl $0
  10273e:	6a 00                	push   $0x0
  pushl $191
  102740:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102745:	e9 6c f8 ff ff       	jmp    101fb6 <__alltraps>

0010274a <vector192>:
.globl vector192
vector192:
  pushl $0
  10274a:	6a 00                	push   $0x0
  pushl $192
  10274c:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102751:	e9 60 f8 ff ff       	jmp    101fb6 <__alltraps>

00102756 <vector193>:
.globl vector193
vector193:
  pushl $0
  102756:	6a 00                	push   $0x0
  pushl $193
  102758:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10275d:	e9 54 f8 ff ff       	jmp    101fb6 <__alltraps>

00102762 <vector194>:
.globl vector194
vector194:
  pushl $0
  102762:	6a 00                	push   $0x0
  pushl $194
  102764:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102769:	e9 48 f8 ff ff       	jmp    101fb6 <__alltraps>

0010276e <vector195>:
.globl vector195
vector195:
  pushl $0
  10276e:	6a 00                	push   $0x0
  pushl $195
  102770:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102775:	e9 3c f8 ff ff       	jmp    101fb6 <__alltraps>

0010277a <vector196>:
.globl vector196
vector196:
  pushl $0
  10277a:	6a 00                	push   $0x0
  pushl $196
  10277c:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102781:	e9 30 f8 ff ff       	jmp    101fb6 <__alltraps>

00102786 <vector197>:
.globl vector197
vector197:
  pushl $0
  102786:	6a 00                	push   $0x0
  pushl $197
  102788:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10278d:	e9 24 f8 ff ff       	jmp    101fb6 <__alltraps>

00102792 <vector198>:
.globl vector198
vector198:
  pushl $0
  102792:	6a 00                	push   $0x0
  pushl $198
  102794:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102799:	e9 18 f8 ff ff       	jmp    101fb6 <__alltraps>

0010279e <vector199>:
.globl vector199
vector199:
  pushl $0
  10279e:	6a 00                	push   $0x0
  pushl $199
  1027a0:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1027a5:	e9 0c f8 ff ff       	jmp    101fb6 <__alltraps>

001027aa <vector200>:
.globl vector200
vector200:
  pushl $0
  1027aa:	6a 00                	push   $0x0
  pushl $200
  1027ac:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1027b1:	e9 00 f8 ff ff       	jmp    101fb6 <__alltraps>

001027b6 <vector201>:
.globl vector201
vector201:
  pushl $0
  1027b6:	6a 00                	push   $0x0
  pushl $201
  1027b8:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1027bd:	e9 f4 f7 ff ff       	jmp    101fb6 <__alltraps>

001027c2 <vector202>:
.globl vector202
vector202:
  pushl $0
  1027c2:	6a 00                	push   $0x0
  pushl $202
  1027c4:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1027c9:	e9 e8 f7 ff ff       	jmp    101fb6 <__alltraps>

001027ce <vector203>:
.globl vector203
vector203:
  pushl $0
  1027ce:	6a 00                	push   $0x0
  pushl $203
  1027d0:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1027d5:	e9 dc f7 ff ff       	jmp    101fb6 <__alltraps>

001027da <vector204>:
.globl vector204
vector204:
  pushl $0
  1027da:	6a 00                	push   $0x0
  pushl $204
  1027dc:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1027e1:	e9 d0 f7 ff ff       	jmp    101fb6 <__alltraps>

001027e6 <vector205>:
.globl vector205
vector205:
  pushl $0
  1027e6:	6a 00                	push   $0x0
  pushl $205
  1027e8:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1027ed:	e9 c4 f7 ff ff       	jmp    101fb6 <__alltraps>

001027f2 <vector206>:
.globl vector206
vector206:
  pushl $0
  1027f2:	6a 00                	push   $0x0
  pushl $206
  1027f4:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1027f9:	e9 b8 f7 ff ff       	jmp    101fb6 <__alltraps>

001027fe <vector207>:
.globl vector207
vector207:
  pushl $0
  1027fe:	6a 00                	push   $0x0
  pushl $207
  102800:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102805:	e9 ac f7 ff ff       	jmp    101fb6 <__alltraps>

0010280a <vector208>:
.globl vector208
vector208:
  pushl $0
  10280a:	6a 00                	push   $0x0
  pushl $208
  10280c:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102811:	e9 a0 f7 ff ff       	jmp    101fb6 <__alltraps>

00102816 <vector209>:
.globl vector209
vector209:
  pushl $0
  102816:	6a 00                	push   $0x0
  pushl $209
  102818:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10281d:	e9 94 f7 ff ff       	jmp    101fb6 <__alltraps>

00102822 <vector210>:
.globl vector210
vector210:
  pushl $0
  102822:	6a 00                	push   $0x0
  pushl $210
  102824:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102829:	e9 88 f7 ff ff       	jmp    101fb6 <__alltraps>

0010282e <vector211>:
.globl vector211
vector211:
  pushl $0
  10282e:	6a 00                	push   $0x0
  pushl $211
  102830:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102835:	e9 7c f7 ff ff       	jmp    101fb6 <__alltraps>

0010283a <vector212>:
.globl vector212
vector212:
  pushl $0
  10283a:	6a 00                	push   $0x0
  pushl $212
  10283c:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102841:	e9 70 f7 ff ff       	jmp    101fb6 <__alltraps>

00102846 <vector213>:
.globl vector213
vector213:
  pushl $0
  102846:	6a 00                	push   $0x0
  pushl $213
  102848:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10284d:	e9 64 f7 ff ff       	jmp    101fb6 <__alltraps>

00102852 <vector214>:
.globl vector214
vector214:
  pushl $0
  102852:	6a 00                	push   $0x0
  pushl $214
  102854:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102859:	e9 58 f7 ff ff       	jmp    101fb6 <__alltraps>

0010285e <vector215>:
.globl vector215
vector215:
  pushl $0
  10285e:	6a 00                	push   $0x0
  pushl $215
  102860:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102865:	e9 4c f7 ff ff       	jmp    101fb6 <__alltraps>

0010286a <vector216>:
.globl vector216
vector216:
  pushl $0
  10286a:	6a 00                	push   $0x0
  pushl $216
  10286c:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102871:	e9 40 f7 ff ff       	jmp    101fb6 <__alltraps>

00102876 <vector217>:
.globl vector217
vector217:
  pushl $0
  102876:	6a 00                	push   $0x0
  pushl $217
  102878:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10287d:	e9 34 f7 ff ff       	jmp    101fb6 <__alltraps>

00102882 <vector218>:
.globl vector218
vector218:
  pushl $0
  102882:	6a 00                	push   $0x0
  pushl $218
  102884:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102889:	e9 28 f7 ff ff       	jmp    101fb6 <__alltraps>

0010288e <vector219>:
.globl vector219
vector219:
  pushl $0
  10288e:	6a 00                	push   $0x0
  pushl $219
  102890:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102895:	e9 1c f7 ff ff       	jmp    101fb6 <__alltraps>

0010289a <vector220>:
.globl vector220
vector220:
  pushl $0
  10289a:	6a 00                	push   $0x0
  pushl $220
  10289c:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1028a1:	e9 10 f7 ff ff       	jmp    101fb6 <__alltraps>

001028a6 <vector221>:
.globl vector221
vector221:
  pushl $0
  1028a6:	6a 00                	push   $0x0
  pushl $221
  1028a8:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1028ad:	e9 04 f7 ff ff       	jmp    101fb6 <__alltraps>

001028b2 <vector222>:
.globl vector222
vector222:
  pushl $0
  1028b2:	6a 00                	push   $0x0
  pushl $222
  1028b4:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1028b9:	e9 f8 f6 ff ff       	jmp    101fb6 <__alltraps>

001028be <vector223>:
.globl vector223
vector223:
  pushl $0
  1028be:	6a 00                	push   $0x0
  pushl $223
  1028c0:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1028c5:	e9 ec f6 ff ff       	jmp    101fb6 <__alltraps>

001028ca <vector224>:
.globl vector224
vector224:
  pushl $0
  1028ca:	6a 00                	push   $0x0
  pushl $224
  1028cc:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1028d1:	e9 e0 f6 ff ff       	jmp    101fb6 <__alltraps>

001028d6 <vector225>:
.globl vector225
vector225:
  pushl $0
  1028d6:	6a 00                	push   $0x0
  pushl $225
  1028d8:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1028dd:	e9 d4 f6 ff ff       	jmp    101fb6 <__alltraps>

001028e2 <vector226>:
.globl vector226
vector226:
  pushl $0
  1028e2:	6a 00                	push   $0x0
  pushl $226
  1028e4:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1028e9:	e9 c8 f6 ff ff       	jmp    101fb6 <__alltraps>

001028ee <vector227>:
.globl vector227
vector227:
  pushl $0
  1028ee:	6a 00                	push   $0x0
  pushl $227
  1028f0:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1028f5:	e9 bc f6 ff ff       	jmp    101fb6 <__alltraps>

001028fa <vector228>:
.globl vector228
vector228:
  pushl $0
  1028fa:	6a 00                	push   $0x0
  pushl $228
  1028fc:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102901:	e9 b0 f6 ff ff       	jmp    101fb6 <__alltraps>

00102906 <vector229>:
.globl vector229
vector229:
  pushl $0
  102906:	6a 00                	push   $0x0
  pushl $229
  102908:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  10290d:	e9 a4 f6 ff ff       	jmp    101fb6 <__alltraps>

00102912 <vector230>:
.globl vector230
vector230:
  pushl $0
  102912:	6a 00                	push   $0x0
  pushl $230
  102914:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102919:	e9 98 f6 ff ff       	jmp    101fb6 <__alltraps>

0010291e <vector231>:
.globl vector231
vector231:
  pushl $0
  10291e:	6a 00                	push   $0x0
  pushl $231
  102920:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102925:	e9 8c f6 ff ff       	jmp    101fb6 <__alltraps>

0010292a <vector232>:
.globl vector232
vector232:
  pushl $0
  10292a:	6a 00                	push   $0x0
  pushl $232
  10292c:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102931:	e9 80 f6 ff ff       	jmp    101fb6 <__alltraps>

00102936 <vector233>:
.globl vector233
vector233:
  pushl $0
  102936:	6a 00                	push   $0x0
  pushl $233
  102938:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10293d:	e9 74 f6 ff ff       	jmp    101fb6 <__alltraps>

00102942 <vector234>:
.globl vector234
vector234:
  pushl $0
  102942:	6a 00                	push   $0x0
  pushl $234
  102944:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102949:	e9 68 f6 ff ff       	jmp    101fb6 <__alltraps>

0010294e <vector235>:
.globl vector235
vector235:
  pushl $0
  10294e:	6a 00                	push   $0x0
  pushl $235
  102950:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102955:	e9 5c f6 ff ff       	jmp    101fb6 <__alltraps>

0010295a <vector236>:
.globl vector236
vector236:
  pushl $0
  10295a:	6a 00                	push   $0x0
  pushl $236
  10295c:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102961:	e9 50 f6 ff ff       	jmp    101fb6 <__alltraps>

00102966 <vector237>:
.globl vector237
vector237:
  pushl $0
  102966:	6a 00                	push   $0x0
  pushl $237
  102968:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10296d:	e9 44 f6 ff ff       	jmp    101fb6 <__alltraps>

00102972 <vector238>:
.globl vector238
vector238:
  pushl $0
  102972:	6a 00                	push   $0x0
  pushl $238
  102974:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102979:	e9 38 f6 ff ff       	jmp    101fb6 <__alltraps>

0010297e <vector239>:
.globl vector239
vector239:
  pushl $0
  10297e:	6a 00                	push   $0x0
  pushl $239
  102980:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102985:	e9 2c f6 ff ff       	jmp    101fb6 <__alltraps>

0010298a <vector240>:
.globl vector240
vector240:
  pushl $0
  10298a:	6a 00                	push   $0x0
  pushl $240
  10298c:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102991:	e9 20 f6 ff ff       	jmp    101fb6 <__alltraps>

00102996 <vector241>:
.globl vector241
vector241:
  pushl $0
  102996:	6a 00                	push   $0x0
  pushl $241
  102998:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10299d:	e9 14 f6 ff ff       	jmp    101fb6 <__alltraps>

001029a2 <vector242>:
.globl vector242
vector242:
  pushl $0
  1029a2:	6a 00                	push   $0x0
  pushl $242
  1029a4:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1029a9:	e9 08 f6 ff ff       	jmp    101fb6 <__alltraps>

001029ae <vector243>:
.globl vector243
vector243:
  pushl $0
  1029ae:	6a 00                	push   $0x0
  pushl $243
  1029b0:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1029b5:	e9 fc f5 ff ff       	jmp    101fb6 <__alltraps>

001029ba <vector244>:
.globl vector244
vector244:
  pushl $0
  1029ba:	6a 00                	push   $0x0
  pushl $244
  1029bc:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1029c1:	e9 f0 f5 ff ff       	jmp    101fb6 <__alltraps>

001029c6 <vector245>:
.globl vector245
vector245:
  pushl $0
  1029c6:	6a 00                	push   $0x0
  pushl $245
  1029c8:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1029cd:	e9 e4 f5 ff ff       	jmp    101fb6 <__alltraps>

001029d2 <vector246>:
.globl vector246
vector246:
  pushl $0
  1029d2:	6a 00                	push   $0x0
  pushl $246
  1029d4:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1029d9:	e9 d8 f5 ff ff       	jmp    101fb6 <__alltraps>

001029de <vector247>:
.globl vector247
vector247:
  pushl $0
  1029de:	6a 00                	push   $0x0
  pushl $247
  1029e0:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1029e5:	e9 cc f5 ff ff       	jmp    101fb6 <__alltraps>

001029ea <vector248>:
.globl vector248
vector248:
  pushl $0
  1029ea:	6a 00                	push   $0x0
  pushl $248
  1029ec:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1029f1:	e9 c0 f5 ff ff       	jmp    101fb6 <__alltraps>

001029f6 <vector249>:
.globl vector249
vector249:
  pushl $0
  1029f6:	6a 00                	push   $0x0
  pushl $249
  1029f8:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1029fd:	e9 b4 f5 ff ff       	jmp    101fb6 <__alltraps>

00102a02 <vector250>:
.globl vector250
vector250:
  pushl $0
  102a02:	6a 00                	push   $0x0
  pushl $250
  102a04:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102a09:	e9 a8 f5 ff ff       	jmp    101fb6 <__alltraps>

00102a0e <vector251>:
.globl vector251
vector251:
  pushl $0
  102a0e:	6a 00                	push   $0x0
  pushl $251
  102a10:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102a15:	e9 9c f5 ff ff       	jmp    101fb6 <__alltraps>

00102a1a <vector252>:
.globl vector252
vector252:
  pushl $0
  102a1a:	6a 00                	push   $0x0
  pushl $252
  102a1c:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102a21:	e9 90 f5 ff ff       	jmp    101fb6 <__alltraps>

00102a26 <vector253>:
.globl vector253
vector253:
  pushl $0
  102a26:	6a 00                	push   $0x0
  pushl $253
  102a28:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102a2d:	e9 84 f5 ff ff       	jmp    101fb6 <__alltraps>

00102a32 <vector254>:
.globl vector254
vector254:
  pushl $0
  102a32:	6a 00                	push   $0x0
  pushl $254
  102a34:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102a39:	e9 78 f5 ff ff       	jmp    101fb6 <__alltraps>

00102a3e <vector255>:
.globl vector255
vector255:
  pushl $0
  102a3e:	6a 00                	push   $0x0
  pushl $255
  102a40:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102a45:	e9 6c f5 ff ff       	jmp    101fb6 <__alltraps>

00102a4a <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102a4a:	55                   	push   %ebp
  102a4b:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102a4d:	8b 45 08             	mov    0x8(%ebp),%eax
  102a50:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102a53:	b8 23 00 00 00       	mov    $0x23,%eax
  102a58:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102a5a:	b8 23 00 00 00       	mov    $0x23,%eax
  102a5f:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102a61:	b8 10 00 00 00       	mov    $0x10,%eax
  102a66:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102a68:	b8 10 00 00 00       	mov    $0x10,%eax
  102a6d:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102a6f:	b8 10 00 00 00       	mov    $0x10,%eax
  102a74:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102a76:	ea 7d 2a 10 00 08 00 	ljmp   $0x8,$0x102a7d
}
  102a7d:	90                   	nop
  102a7e:	5d                   	pop    %ebp
  102a7f:	c3                   	ret    

00102a80 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102a80:	55                   	push   %ebp
  102a81:	89 e5                	mov    %esp,%ebp
  102a83:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102a86:	b8 00 09 11 00       	mov    $0x110900,%eax
  102a8b:	05 00 04 00 00       	add    $0x400,%eax
  102a90:	a3 04 0d 11 00       	mov    %eax,0x110d04
    ts.ts_ss0 = KERNEL_DS;
  102a95:	66 c7 05 08 0d 11 00 	movw   $0x10,0x110d08
  102a9c:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102a9e:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  102aa5:	68 00 
  102aa7:	b8 00 0d 11 00       	mov    $0x110d00,%eax
  102aac:	0f b7 c0             	movzwl %ax,%eax
  102aaf:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  102ab5:	b8 00 0d 11 00       	mov    $0x110d00,%eax
  102aba:	c1 e8 10             	shr    $0x10,%eax
  102abd:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  102ac2:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102ac9:	24 f0                	and    $0xf0,%al
  102acb:	0c 09                	or     $0x9,%al
  102acd:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102ad2:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102ad9:	0c 10                	or     $0x10,%al
  102adb:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102ae0:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102ae7:	24 9f                	and    $0x9f,%al
  102ae9:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102aee:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102af5:	0c 80                	or     $0x80,%al
  102af7:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102afc:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102b03:	24 f0                	and    $0xf0,%al
  102b05:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102b0a:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102b11:	24 ef                	and    $0xef,%al
  102b13:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102b18:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102b1f:	24 df                	and    $0xdf,%al
  102b21:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102b26:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102b2d:	0c 40                	or     $0x40,%al
  102b2f:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102b34:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102b3b:	24 7f                	and    $0x7f,%al
  102b3d:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102b42:	b8 00 0d 11 00       	mov    $0x110d00,%eax
  102b47:	c1 e8 18             	shr    $0x18,%eax
  102b4a:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102b4f:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102b56:	24 ef                	and    $0xef,%al
  102b58:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102b5d:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  102b64:	e8 e1 fe ff ff       	call   102a4a <lgdt>
  102b69:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("ltr %0" :: "r" (sel));
  102b6f:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102b73:	0f 00 d8             	ltr    %ax
}
  102b76:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102b77:	90                   	nop
  102b78:	89 ec                	mov    %ebp,%esp
  102b7a:	5d                   	pop    %ebp
  102b7b:	c3                   	ret    

00102b7c <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102b7c:	55                   	push   %ebp
  102b7d:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102b7f:	e8 fc fe ff ff       	call   102a80 <gdt_init>
}
  102b84:	90                   	nop
  102b85:	5d                   	pop    %ebp
  102b86:	c3                   	ret    

00102b87 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102b87:	55                   	push   %ebp
  102b88:	89 e5                	mov    %esp,%ebp
  102b8a:	83 ec 58             	sub    $0x58,%esp
  102b8d:	8b 45 10             	mov    0x10(%ebp),%eax
  102b90:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102b93:	8b 45 14             	mov    0x14(%ebp),%eax
  102b96:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102b99:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102b9c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102b9f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ba2:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102ba5:	8b 45 18             	mov    0x18(%ebp),%eax
  102ba8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102bab:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102bae:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102bb1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102bb4:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102bb7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102bbd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102bc1:	74 1c                	je     102bdf <printnum+0x58>
  102bc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bc6:	ba 00 00 00 00       	mov    $0x0,%edx
  102bcb:	f7 75 e4             	divl   -0x1c(%ebp)
  102bce:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102bd1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bd4:	ba 00 00 00 00       	mov    $0x0,%edx
  102bd9:	f7 75 e4             	divl   -0x1c(%ebp)
  102bdc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bdf:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102be2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102be5:	f7 75 e4             	divl   -0x1c(%ebp)
  102be8:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102beb:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102bee:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102bf1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102bf4:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102bf7:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102bfa:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102bfd:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102c00:	8b 45 18             	mov    0x18(%ebp),%eax
  102c03:	ba 00 00 00 00       	mov    $0x0,%edx
  102c08:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102c0b:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102c0e:	19 d1                	sbb    %edx,%ecx
  102c10:	72 4c                	jb     102c5e <printnum+0xd7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102c12:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102c15:	8d 50 ff             	lea    -0x1(%eax),%edx
  102c18:	8b 45 20             	mov    0x20(%ebp),%eax
  102c1b:	89 44 24 18          	mov    %eax,0x18(%esp)
  102c1f:	89 54 24 14          	mov    %edx,0x14(%esp)
  102c23:	8b 45 18             	mov    0x18(%ebp),%eax
  102c26:	89 44 24 10          	mov    %eax,0x10(%esp)
  102c2a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c2d:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102c30:	89 44 24 08          	mov    %eax,0x8(%esp)
  102c34:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102c38:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c3b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c3f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c42:	89 04 24             	mov    %eax,(%esp)
  102c45:	e8 3d ff ff ff       	call   102b87 <printnum>
  102c4a:	eb 1b                	jmp    102c67 <printnum+0xe0>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102c4c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c4f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c53:	8b 45 20             	mov    0x20(%ebp),%eax
  102c56:	89 04 24             	mov    %eax,(%esp)
  102c59:	8b 45 08             	mov    0x8(%ebp),%eax
  102c5c:	ff d0                	call   *%eax
        while (-- width > 0)
  102c5e:	ff 4d 1c             	decl   0x1c(%ebp)
  102c61:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102c65:	7f e5                	jg     102c4c <printnum+0xc5>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102c67:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102c6a:	05 b0 3e 10 00       	add    $0x103eb0,%eax
  102c6f:	0f b6 00             	movzbl (%eax),%eax
  102c72:	0f be c0             	movsbl %al,%eax
  102c75:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c78:	89 54 24 04          	mov    %edx,0x4(%esp)
  102c7c:	89 04 24             	mov    %eax,(%esp)
  102c7f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c82:	ff d0                	call   *%eax
}
  102c84:	90                   	nop
  102c85:	89 ec                	mov    %ebp,%esp
  102c87:	5d                   	pop    %ebp
  102c88:	c3                   	ret    

00102c89 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102c89:	55                   	push   %ebp
  102c8a:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102c8c:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102c90:	7e 14                	jle    102ca6 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102c92:	8b 45 08             	mov    0x8(%ebp),%eax
  102c95:	8b 00                	mov    (%eax),%eax
  102c97:	8d 48 08             	lea    0x8(%eax),%ecx
  102c9a:	8b 55 08             	mov    0x8(%ebp),%edx
  102c9d:	89 0a                	mov    %ecx,(%edx)
  102c9f:	8b 50 04             	mov    0x4(%eax),%edx
  102ca2:	8b 00                	mov    (%eax),%eax
  102ca4:	eb 30                	jmp    102cd6 <getuint+0x4d>
    }
    else if (lflag) {
  102ca6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102caa:	74 16                	je     102cc2 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102cac:	8b 45 08             	mov    0x8(%ebp),%eax
  102caf:	8b 00                	mov    (%eax),%eax
  102cb1:	8d 48 04             	lea    0x4(%eax),%ecx
  102cb4:	8b 55 08             	mov    0x8(%ebp),%edx
  102cb7:	89 0a                	mov    %ecx,(%edx)
  102cb9:	8b 00                	mov    (%eax),%eax
  102cbb:	ba 00 00 00 00       	mov    $0x0,%edx
  102cc0:	eb 14                	jmp    102cd6 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102cc2:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc5:	8b 00                	mov    (%eax),%eax
  102cc7:	8d 48 04             	lea    0x4(%eax),%ecx
  102cca:	8b 55 08             	mov    0x8(%ebp),%edx
  102ccd:	89 0a                	mov    %ecx,(%edx)
  102ccf:	8b 00                	mov    (%eax),%eax
  102cd1:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102cd6:	5d                   	pop    %ebp
  102cd7:	c3                   	ret    

00102cd8 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102cd8:	55                   	push   %ebp
  102cd9:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102cdb:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102cdf:	7e 14                	jle    102cf5 <getint+0x1d>
        return va_arg(*ap, long long);
  102ce1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ce4:	8b 00                	mov    (%eax),%eax
  102ce6:	8d 48 08             	lea    0x8(%eax),%ecx
  102ce9:	8b 55 08             	mov    0x8(%ebp),%edx
  102cec:	89 0a                	mov    %ecx,(%edx)
  102cee:	8b 50 04             	mov    0x4(%eax),%edx
  102cf1:	8b 00                	mov    (%eax),%eax
  102cf3:	eb 28                	jmp    102d1d <getint+0x45>
    }
    else if (lflag) {
  102cf5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102cf9:	74 12                	je     102d0d <getint+0x35>
        return va_arg(*ap, long);
  102cfb:	8b 45 08             	mov    0x8(%ebp),%eax
  102cfe:	8b 00                	mov    (%eax),%eax
  102d00:	8d 48 04             	lea    0x4(%eax),%ecx
  102d03:	8b 55 08             	mov    0x8(%ebp),%edx
  102d06:	89 0a                	mov    %ecx,(%edx)
  102d08:	8b 00                	mov    (%eax),%eax
  102d0a:	99                   	cltd   
  102d0b:	eb 10                	jmp    102d1d <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102d0d:	8b 45 08             	mov    0x8(%ebp),%eax
  102d10:	8b 00                	mov    (%eax),%eax
  102d12:	8d 48 04             	lea    0x4(%eax),%ecx
  102d15:	8b 55 08             	mov    0x8(%ebp),%edx
  102d18:	89 0a                	mov    %ecx,(%edx)
  102d1a:	8b 00                	mov    (%eax),%eax
  102d1c:	99                   	cltd   
    }
}
  102d1d:	5d                   	pop    %ebp
  102d1e:	c3                   	ret    

00102d1f <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102d1f:	55                   	push   %ebp
  102d20:	89 e5                	mov    %esp,%ebp
  102d22:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102d25:	8d 45 14             	lea    0x14(%ebp),%eax
  102d28:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102d2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d2e:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102d32:	8b 45 10             	mov    0x10(%ebp),%eax
  102d35:	89 44 24 08          	mov    %eax,0x8(%esp)
  102d39:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d3c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d40:	8b 45 08             	mov    0x8(%ebp),%eax
  102d43:	89 04 24             	mov    %eax,(%esp)
  102d46:	e8 05 00 00 00       	call   102d50 <vprintfmt>
    va_end(ap);
}
  102d4b:	90                   	nop
  102d4c:	89 ec                	mov    %ebp,%esp
  102d4e:	5d                   	pop    %ebp
  102d4f:	c3                   	ret    

00102d50 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102d50:	55                   	push   %ebp
  102d51:	89 e5                	mov    %esp,%ebp
  102d53:	56                   	push   %esi
  102d54:	53                   	push   %ebx
  102d55:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102d58:	eb 17                	jmp    102d71 <vprintfmt+0x21>
            if (ch == '\0') {
  102d5a:	85 db                	test   %ebx,%ebx
  102d5c:	0f 84 bf 03 00 00    	je     103121 <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  102d62:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d65:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d69:	89 1c 24             	mov    %ebx,(%esp)
  102d6c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d6f:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102d71:	8b 45 10             	mov    0x10(%ebp),%eax
  102d74:	8d 50 01             	lea    0x1(%eax),%edx
  102d77:	89 55 10             	mov    %edx,0x10(%ebp)
  102d7a:	0f b6 00             	movzbl (%eax),%eax
  102d7d:	0f b6 d8             	movzbl %al,%ebx
  102d80:	83 fb 25             	cmp    $0x25,%ebx
  102d83:	75 d5                	jne    102d5a <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  102d85:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102d89:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102d90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102d93:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102d96:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102d9d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102da0:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102da3:	8b 45 10             	mov    0x10(%ebp),%eax
  102da6:	8d 50 01             	lea    0x1(%eax),%edx
  102da9:	89 55 10             	mov    %edx,0x10(%ebp)
  102dac:	0f b6 00             	movzbl (%eax),%eax
  102daf:	0f b6 d8             	movzbl %al,%ebx
  102db2:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102db5:	83 f8 55             	cmp    $0x55,%eax
  102db8:	0f 87 37 03 00 00    	ja     1030f5 <vprintfmt+0x3a5>
  102dbe:	8b 04 85 d4 3e 10 00 	mov    0x103ed4(,%eax,4),%eax
  102dc5:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102dc7:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102dcb:	eb d6                	jmp    102da3 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102dcd:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102dd1:	eb d0                	jmp    102da3 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102dd3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102dda:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102ddd:	89 d0                	mov    %edx,%eax
  102ddf:	c1 e0 02             	shl    $0x2,%eax
  102de2:	01 d0                	add    %edx,%eax
  102de4:	01 c0                	add    %eax,%eax
  102de6:	01 d8                	add    %ebx,%eax
  102de8:	83 e8 30             	sub    $0x30,%eax
  102deb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102dee:	8b 45 10             	mov    0x10(%ebp),%eax
  102df1:	0f b6 00             	movzbl (%eax),%eax
  102df4:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102df7:	83 fb 2f             	cmp    $0x2f,%ebx
  102dfa:	7e 38                	jle    102e34 <vprintfmt+0xe4>
  102dfc:	83 fb 39             	cmp    $0x39,%ebx
  102dff:	7f 33                	jg     102e34 <vprintfmt+0xe4>
            for (precision = 0; ; ++ fmt) {
  102e01:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  102e04:	eb d4                	jmp    102dda <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102e06:	8b 45 14             	mov    0x14(%ebp),%eax
  102e09:	8d 50 04             	lea    0x4(%eax),%edx
  102e0c:	89 55 14             	mov    %edx,0x14(%ebp)
  102e0f:	8b 00                	mov    (%eax),%eax
  102e11:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102e14:	eb 1f                	jmp    102e35 <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  102e16:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102e1a:	79 87                	jns    102da3 <vprintfmt+0x53>
                width = 0;
  102e1c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102e23:	e9 7b ff ff ff       	jmp    102da3 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102e28:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102e2f:	e9 6f ff ff ff       	jmp    102da3 <vprintfmt+0x53>
            goto process_precision;
  102e34:	90                   	nop

        process_precision:
            if (width < 0)
  102e35:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102e39:	0f 89 64 ff ff ff    	jns    102da3 <vprintfmt+0x53>
                width = precision, precision = -1;
  102e3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102e42:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102e45:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102e4c:	e9 52 ff ff ff       	jmp    102da3 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102e51:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  102e54:	e9 4a ff ff ff       	jmp    102da3 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102e59:	8b 45 14             	mov    0x14(%ebp),%eax
  102e5c:	8d 50 04             	lea    0x4(%eax),%edx
  102e5f:	89 55 14             	mov    %edx,0x14(%ebp)
  102e62:	8b 00                	mov    (%eax),%eax
  102e64:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e67:	89 54 24 04          	mov    %edx,0x4(%esp)
  102e6b:	89 04 24             	mov    %eax,(%esp)
  102e6e:	8b 45 08             	mov    0x8(%ebp),%eax
  102e71:	ff d0                	call   *%eax
            break;
  102e73:	e9 a4 02 00 00       	jmp    10311c <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102e78:	8b 45 14             	mov    0x14(%ebp),%eax
  102e7b:	8d 50 04             	lea    0x4(%eax),%edx
  102e7e:	89 55 14             	mov    %edx,0x14(%ebp)
  102e81:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102e83:	85 db                	test   %ebx,%ebx
  102e85:	79 02                	jns    102e89 <vprintfmt+0x139>
                err = -err;
  102e87:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102e89:	83 fb 06             	cmp    $0x6,%ebx
  102e8c:	7f 0b                	jg     102e99 <vprintfmt+0x149>
  102e8e:	8b 34 9d 94 3e 10 00 	mov    0x103e94(,%ebx,4),%esi
  102e95:	85 f6                	test   %esi,%esi
  102e97:	75 23                	jne    102ebc <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  102e99:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102e9d:	c7 44 24 08 c1 3e 10 	movl   $0x103ec1,0x8(%esp)
  102ea4:	00 
  102ea5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ea8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102eac:	8b 45 08             	mov    0x8(%ebp),%eax
  102eaf:	89 04 24             	mov    %eax,(%esp)
  102eb2:	e8 68 fe ff ff       	call   102d1f <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102eb7:	e9 60 02 00 00       	jmp    10311c <vprintfmt+0x3cc>
                printfmt(putch, putdat, "%s", p);
  102ebc:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102ec0:	c7 44 24 08 ca 3e 10 	movl   $0x103eca,0x8(%esp)
  102ec7:	00 
  102ec8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ecb:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ecf:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed2:	89 04 24             	mov    %eax,(%esp)
  102ed5:	e8 45 fe ff ff       	call   102d1f <printfmt>
            break;
  102eda:	e9 3d 02 00 00       	jmp    10311c <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102edf:	8b 45 14             	mov    0x14(%ebp),%eax
  102ee2:	8d 50 04             	lea    0x4(%eax),%edx
  102ee5:	89 55 14             	mov    %edx,0x14(%ebp)
  102ee8:	8b 30                	mov    (%eax),%esi
  102eea:	85 f6                	test   %esi,%esi
  102eec:	75 05                	jne    102ef3 <vprintfmt+0x1a3>
                p = "(null)";
  102eee:	be cd 3e 10 00       	mov    $0x103ecd,%esi
            }
            if (width > 0 && padc != '-') {
  102ef3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ef7:	7e 76                	jle    102f6f <vprintfmt+0x21f>
  102ef9:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102efd:	74 70                	je     102f6f <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102eff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102f02:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f06:	89 34 24             	mov    %esi,(%esp)
  102f09:	e8 16 03 00 00       	call   103224 <strnlen>
  102f0e:	89 c2                	mov    %eax,%edx
  102f10:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f13:	29 d0                	sub    %edx,%eax
  102f15:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f18:	eb 16                	jmp    102f30 <vprintfmt+0x1e0>
                    putch(padc, putdat);
  102f1a:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102f1e:	8b 55 0c             	mov    0xc(%ebp),%edx
  102f21:	89 54 24 04          	mov    %edx,0x4(%esp)
  102f25:	89 04 24             	mov    %eax,(%esp)
  102f28:	8b 45 08             	mov    0x8(%ebp),%eax
  102f2b:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  102f2d:	ff 4d e8             	decl   -0x18(%ebp)
  102f30:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102f34:	7f e4                	jg     102f1a <vprintfmt+0x1ca>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102f36:	eb 37                	jmp    102f6f <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  102f38:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102f3c:	74 1f                	je     102f5d <vprintfmt+0x20d>
  102f3e:	83 fb 1f             	cmp    $0x1f,%ebx
  102f41:	7e 05                	jle    102f48 <vprintfmt+0x1f8>
  102f43:	83 fb 7e             	cmp    $0x7e,%ebx
  102f46:	7e 15                	jle    102f5d <vprintfmt+0x20d>
                    putch('?', putdat);
  102f48:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f4b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f4f:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102f56:	8b 45 08             	mov    0x8(%ebp),%eax
  102f59:	ff d0                	call   *%eax
  102f5b:	eb 0f                	jmp    102f6c <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  102f5d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f60:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f64:	89 1c 24             	mov    %ebx,(%esp)
  102f67:	8b 45 08             	mov    0x8(%ebp),%eax
  102f6a:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102f6c:	ff 4d e8             	decl   -0x18(%ebp)
  102f6f:	89 f0                	mov    %esi,%eax
  102f71:	8d 70 01             	lea    0x1(%eax),%esi
  102f74:	0f b6 00             	movzbl (%eax),%eax
  102f77:	0f be d8             	movsbl %al,%ebx
  102f7a:	85 db                	test   %ebx,%ebx
  102f7c:	74 27                	je     102fa5 <vprintfmt+0x255>
  102f7e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102f82:	78 b4                	js     102f38 <vprintfmt+0x1e8>
  102f84:	ff 4d e4             	decl   -0x1c(%ebp)
  102f87:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102f8b:	79 ab                	jns    102f38 <vprintfmt+0x1e8>
                }
            }
            for (; width > 0; width --) {
  102f8d:	eb 16                	jmp    102fa5 <vprintfmt+0x255>
                putch(' ', putdat);
  102f8f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f92:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f96:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102f9d:	8b 45 08             	mov    0x8(%ebp),%eax
  102fa0:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  102fa2:	ff 4d e8             	decl   -0x18(%ebp)
  102fa5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102fa9:	7f e4                	jg     102f8f <vprintfmt+0x23f>
            }
            break;
  102fab:	e9 6c 01 00 00       	jmp    10311c <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102fb0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fb3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fb7:	8d 45 14             	lea    0x14(%ebp),%eax
  102fba:	89 04 24             	mov    %eax,(%esp)
  102fbd:	e8 16 fd ff ff       	call   102cd8 <getint>
  102fc2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fc5:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102fc8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fcb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fce:	85 d2                	test   %edx,%edx
  102fd0:	79 26                	jns    102ff8 <vprintfmt+0x2a8>
                putch('-', putdat);
  102fd2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fd5:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fd9:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102fe0:	8b 45 08             	mov    0x8(%ebp),%eax
  102fe3:	ff d0                	call   *%eax
                num = -(long long)num;
  102fe5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fe8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102feb:	f7 d8                	neg    %eax
  102fed:	83 d2 00             	adc    $0x0,%edx
  102ff0:	f7 da                	neg    %edx
  102ff2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ff5:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102ff8:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102fff:	e9 a8 00 00 00       	jmp    1030ac <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  103004:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103007:	89 44 24 04          	mov    %eax,0x4(%esp)
  10300b:	8d 45 14             	lea    0x14(%ebp),%eax
  10300e:	89 04 24             	mov    %eax,(%esp)
  103011:	e8 73 fc ff ff       	call   102c89 <getuint>
  103016:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103019:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  10301c:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103023:	e9 84 00 00 00       	jmp    1030ac <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103028:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10302b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10302f:	8d 45 14             	lea    0x14(%ebp),%eax
  103032:	89 04 24             	mov    %eax,(%esp)
  103035:	e8 4f fc ff ff       	call   102c89 <getuint>
  10303a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10303d:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103040:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  103047:	eb 63                	jmp    1030ac <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  103049:	8b 45 0c             	mov    0xc(%ebp),%eax
  10304c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103050:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  103057:	8b 45 08             	mov    0x8(%ebp),%eax
  10305a:	ff d0                	call   *%eax
            putch('x', putdat);
  10305c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10305f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103063:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  10306a:	8b 45 08             	mov    0x8(%ebp),%eax
  10306d:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  10306f:	8b 45 14             	mov    0x14(%ebp),%eax
  103072:	8d 50 04             	lea    0x4(%eax),%edx
  103075:	89 55 14             	mov    %edx,0x14(%ebp)
  103078:	8b 00                	mov    (%eax),%eax
  10307a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10307d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103084:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  10308b:	eb 1f                	jmp    1030ac <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  10308d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103090:	89 44 24 04          	mov    %eax,0x4(%esp)
  103094:	8d 45 14             	lea    0x14(%ebp),%eax
  103097:	89 04 24             	mov    %eax,(%esp)
  10309a:	e8 ea fb ff ff       	call   102c89 <getuint>
  10309f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030a2:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  1030a5:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  1030ac:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  1030b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1030b3:	89 54 24 18          	mov    %edx,0x18(%esp)
  1030b7:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1030ba:	89 54 24 14          	mov    %edx,0x14(%esp)
  1030be:	89 44 24 10          	mov    %eax,0x10(%esp)
  1030c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030c5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1030c8:	89 44 24 08          	mov    %eax,0x8(%esp)
  1030cc:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1030d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030d3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1030da:	89 04 24             	mov    %eax,(%esp)
  1030dd:	e8 a5 fa ff ff       	call   102b87 <printnum>
            break;
  1030e2:	eb 38                	jmp    10311c <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1030e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030e7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030eb:	89 1c 24             	mov    %ebx,(%esp)
  1030ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f1:	ff d0                	call   *%eax
            break;
  1030f3:	eb 27                	jmp    10311c <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1030f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030f8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030fc:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  103103:	8b 45 08             	mov    0x8(%ebp),%eax
  103106:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  103108:	ff 4d 10             	decl   0x10(%ebp)
  10310b:	eb 03                	jmp    103110 <vprintfmt+0x3c0>
  10310d:	ff 4d 10             	decl   0x10(%ebp)
  103110:	8b 45 10             	mov    0x10(%ebp),%eax
  103113:	48                   	dec    %eax
  103114:	0f b6 00             	movzbl (%eax),%eax
  103117:	3c 25                	cmp    $0x25,%al
  103119:	75 f2                	jne    10310d <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  10311b:	90                   	nop
    while (1) {
  10311c:	e9 37 fc ff ff       	jmp    102d58 <vprintfmt+0x8>
                return;
  103121:	90                   	nop
        }
    }
}
  103122:	83 c4 40             	add    $0x40,%esp
  103125:	5b                   	pop    %ebx
  103126:	5e                   	pop    %esi
  103127:	5d                   	pop    %ebp
  103128:	c3                   	ret    

00103129 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103129:	55                   	push   %ebp
  10312a:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  10312c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10312f:	8b 40 08             	mov    0x8(%eax),%eax
  103132:	8d 50 01             	lea    0x1(%eax),%edx
  103135:	8b 45 0c             	mov    0xc(%ebp),%eax
  103138:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  10313b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10313e:	8b 10                	mov    (%eax),%edx
  103140:	8b 45 0c             	mov    0xc(%ebp),%eax
  103143:	8b 40 04             	mov    0x4(%eax),%eax
  103146:	39 c2                	cmp    %eax,%edx
  103148:	73 12                	jae    10315c <sprintputch+0x33>
        *b->buf ++ = ch;
  10314a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10314d:	8b 00                	mov    (%eax),%eax
  10314f:	8d 48 01             	lea    0x1(%eax),%ecx
  103152:	8b 55 0c             	mov    0xc(%ebp),%edx
  103155:	89 0a                	mov    %ecx,(%edx)
  103157:	8b 55 08             	mov    0x8(%ebp),%edx
  10315a:	88 10                	mov    %dl,(%eax)
    }
}
  10315c:	90                   	nop
  10315d:	5d                   	pop    %ebp
  10315e:	c3                   	ret    

0010315f <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  10315f:	55                   	push   %ebp
  103160:	89 e5                	mov    %esp,%ebp
  103162:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103165:	8d 45 14             	lea    0x14(%ebp),%eax
  103168:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  10316b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10316e:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103172:	8b 45 10             	mov    0x10(%ebp),%eax
  103175:	89 44 24 08          	mov    %eax,0x8(%esp)
  103179:	8b 45 0c             	mov    0xc(%ebp),%eax
  10317c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103180:	8b 45 08             	mov    0x8(%ebp),%eax
  103183:	89 04 24             	mov    %eax,(%esp)
  103186:	e8 0a 00 00 00       	call   103195 <vsnprintf>
  10318b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10318e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103191:	89 ec                	mov    %ebp,%esp
  103193:	5d                   	pop    %ebp
  103194:	c3                   	ret    

00103195 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103195:	55                   	push   %ebp
  103196:	89 e5                	mov    %esp,%ebp
  103198:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  10319b:	8b 45 08             	mov    0x8(%ebp),%eax
  10319e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1031a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031a4:	8d 50 ff             	lea    -0x1(%eax),%edx
  1031a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1031aa:	01 d0                	add    %edx,%eax
  1031ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1031b6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1031ba:	74 0a                	je     1031c6 <vsnprintf+0x31>
  1031bc:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1031bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031c2:	39 c2                	cmp    %eax,%edx
  1031c4:	76 07                	jbe    1031cd <vsnprintf+0x38>
        return -E_INVAL;
  1031c6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1031cb:	eb 2a                	jmp    1031f7 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1031cd:	8b 45 14             	mov    0x14(%ebp),%eax
  1031d0:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1031d4:	8b 45 10             	mov    0x10(%ebp),%eax
  1031d7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1031db:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1031de:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031e2:	c7 04 24 29 31 10 00 	movl   $0x103129,(%esp)
  1031e9:	e8 62 fb ff ff       	call   102d50 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  1031ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031f1:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1031f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1031f7:	89 ec                	mov    %ebp,%esp
  1031f9:	5d                   	pop    %ebp
  1031fa:	c3                   	ret    

001031fb <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  1031fb:	55                   	push   %ebp
  1031fc:	89 e5                	mov    %esp,%ebp
  1031fe:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  103201:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  103208:	eb 03                	jmp    10320d <strlen+0x12>
        cnt ++;
  10320a:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  10320d:	8b 45 08             	mov    0x8(%ebp),%eax
  103210:	8d 50 01             	lea    0x1(%eax),%edx
  103213:	89 55 08             	mov    %edx,0x8(%ebp)
  103216:	0f b6 00             	movzbl (%eax),%eax
  103219:	84 c0                	test   %al,%al
  10321b:	75 ed                	jne    10320a <strlen+0xf>
    }
    return cnt;
  10321d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103220:	89 ec                	mov    %ebp,%esp
  103222:	5d                   	pop    %ebp
  103223:	c3                   	ret    

00103224 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  103224:	55                   	push   %ebp
  103225:	89 e5                	mov    %esp,%ebp
  103227:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  10322a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  103231:	eb 03                	jmp    103236 <strnlen+0x12>
        cnt ++;
  103233:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  103236:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103239:	3b 45 0c             	cmp    0xc(%ebp),%eax
  10323c:	73 10                	jae    10324e <strnlen+0x2a>
  10323e:	8b 45 08             	mov    0x8(%ebp),%eax
  103241:	8d 50 01             	lea    0x1(%eax),%edx
  103244:	89 55 08             	mov    %edx,0x8(%ebp)
  103247:	0f b6 00             	movzbl (%eax),%eax
  10324a:	84 c0                	test   %al,%al
  10324c:	75 e5                	jne    103233 <strnlen+0xf>
    }
    return cnt;
  10324e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103251:	89 ec                	mov    %ebp,%esp
  103253:	5d                   	pop    %ebp
  103254:	c3                   	ret    

00103255 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  103255:	55                   	push   %ebp
  103256:	89 e5                	mov    %esp,%ebp
  103258:	57                   	push   %edi
  103259:	56                   	push   %esi
  10325a:	83 ec 20             	sub    $0x20,%esp
  10325d:	8b 45 08             	mov    0x8(%ebp),%eax
  103260:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103263:	8b 45 0c             	mov    0xc(%ebp),%eax
  103266:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  103269:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10326c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10326f:	89 d1                	mov    %edx,%ecx
  103271:	89 c2                	mov    %eax,%edx
  103273:	89 ce                	mov    %ecx,%esi
  103275:	89 d7                	mov    %edx,%edi
  103277:	ac                   	lods   %ds:(%esi),%al
  103278:	aa                   	stos   %al,%es:(%edi)
  103279:	84 c0                	test   %al,%al
  10327b:	75 fa                	jne    103277 <strcpy+0x22>
  10327d:	89 fa                	mov    %edi,%edx
  10327f:	89 f1                	mov    %esi,%ecx
  103281:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103284:	89 55 e8             	mov    %edx,-0x18(%ebp)
  103287:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return dst;
  10328a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  10328d:	83 c4 20             	add    $0x20,%esp
  103290:	5e                   	pop    %esi
  103291:	5f                   	pop    %edi
  103292:	5d                   	pop    %ebp
  103293:	c3                   	ret    

00103294 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  103294:	55                   	push   %ebp
  103295:	89 e5                	mov    %esp,%ebp
  103297:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  10329a:	8b 45 08             	mov    0x8(%ebp),%eax
  10329d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  1032a0:	eb 1e                	jmp    1032c0 <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  1032a2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032a5:	0f b6 10             	movzbl (%eax),%edx
  1032a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1032ab:	88 10                	mov    %dl,(%eax)
  1032ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1032b0:	0f b6 00             	movzbl (%eax),%eax
  1032b3:	84 c0                	test   %al,%al
  1032b5:	74 03                	je     1032ba <strncpy+0x26>
            src ++;
  1032b7:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  1032ba:	ff 45 fc             	incl   -0x4(%ebp)
  1032bd:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  1032c0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1032c4:	75 dc                	jne    1032a2 <strncpy+0xe>
    }
    return dst;
  1032c6:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1032c9:	89 ec                	mov    %ebp,%esp
  1032cb:	5d                   	pop    %ebp
  1032cc:	c3                   	ret    

001032cd <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  1032cd:	55                   	push   %ebp
  1032ce:	89 e5                	mov    %esp,%ebp
  1032d0:	57                   	push   %edi
  1032d1:	56                   	push   %esi
  1032d2:	83 ec 20             	sub    $0x20,%esp
  1032d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1032d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1032db:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032de:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  1032e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1032e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032e7:	89 d1                	mov    %edx,%ecx
  1032e9:	89 c2                	mov    %eax,%edx
  1032eb:	89 ce                	mov    %ecx,%esi
  1032ed:	89 d7                	mov    %edx,%edi
  1032ef:	ac                   	lods   %ds:(%esi),%al
  1032f0:	ae                   	scas   %es:(%edi),%al
  1032f1:	75 08                	jne    1032fb <strcmp+0x2e>
  1032f3:	84 c0                	test   %al,%al
  1032f5:	75 f8                	jne    1032ef <strcmp+0x22>
  1032f7:	31 c0                	xor    %eax,%eax
  1032f9:	eb 04                	jmp    1032ff <strcmp+0x32>
  1032fb:	19 c0                	sbb    %eax,%eax
  1032fd:	0c 01                	or     $0x1,%al
  1032ff:	89 fa                	mov    %edi,%edx
  103301:	89 f1                	mov    %esi,%ecx
  103303:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103306:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103309:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  10330c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  10330f:	83 c4 20             	add    $0x20,%esp
  103312:	5e                   	pop    %esi
  103313:	5f                   	pop    %edi
  103314:	5d                   	pop    %ebp
  103315:	c3                   	ret    

00103316 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  103316:	55                   	push   %ebp
  103317:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103319:	eb 09                	jmp    103324 <strncmp+0xe>
        n --, s1 ++, s2 ++;
  10331b:	ff 4d 10             	decl   0x10(%ebp)
  10331e:	ff 45 08             	incl   0x8(%ebp)
  103321:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103324:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103328:	74 1a                	je     103344 <strncmp+0x2e>
  10332a:	8b 45 08             	mov    0x8(%ebp),%eax
  10332d:	0f b6 00             	movzbl (%eax),%eax
  103330:	84 c0                	test   %al,%al
  103332:	74 10                	je     103344 <strncmp+0x2e>
  103334:	8b 45 08             	mov    0x8(%ebp),%eax
  103337:	0f b6 10             	movzbl (%eax),%edx
  10333a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10333d:	0f b6 00             	movzbl (%eax),%eax
  103340:	38 c2                	cmp    %al,%dl
  103342:	74 d7                	je     10331b <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  103344:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103348:	74 18                	je     103362 <strncmp+0x4c>
  10334a:	8b 45 08             	mov    0x8(%ebp),%eax
  10334d:	0f b6 00             	movzbl (%eax),%eax
  103350:	0f b6 d0             	movzbl %al,%edx
  103353:	8b 45 0c             	mov    0xc(%ebp),%eax
  103356:	0f b6 00             	movzbl (%eax),%eax
  103359:	0f b6 c8             	movzbl %al,%ecx
  10335c:	89 d0                	mov    %edx,%eax
  10335e:	29 c8                	sub    %ecx,%eax
  103360:	eb 05                	jmp    103367 <strncmp+0x51>
  103362:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103367:	5d                   	pop    %ebp
  103368:	c3                   	ret    

00103369 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  103369:	55                   	push   %ebp
  10336a:	89 e5                	mov    %esp,%ebp
  10336c:	83 ec 04             	sub    $0x4,%esp
  10336f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103372:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  103375:	eb 13                	jmp    10338a <strchr+0x21>
        if (*s == c) {
  103377:	8b 45 08             	mov    0x8(%ebp),%eax
  10337a:	0f b6 00             	movzbl (%eax),%eax
  10337d:	38 45 fc             	cmp    %al,-0x4(%ebp)
  103380:	75 05                	jne    103387 <strchr+0x1e>
            return (char *)s;
  103382:	8b 45 08             	mov    0x8(%ebp),%eax
  103385:	eb 12                	jmp    103399 <strchr+0x30>
        }
        s ++;
  103387:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  10338a:	8b 45 08             	mov    0x8(%ebp),%eax
  10338d:	0f b6 00             	movzbl (%eax),%eax
  103390:	84 c0                	test   %al,%al
  103392:	75 e3                	jne    103377 <strchr+0xe>
    }
    return NULL;
  103394:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103399:	89 ec                	mov    %ebp,%esp
  10339b:	5d                   	pop    %ebp
  10339c:	c3                   	ret    

0010339d <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  10339d:	55                   	push   %ebp
  10339e:	89 e5                	mov    %esp,%ebp
  1033a0:	83 ec 04             	sub    $0x4,%esp
  1033a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033a6:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1033a9:	eb 0e                	jmp    1033b9 <strfind+0x1c>
        if (*s == c) {
  1033ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ae:	0f b6 00             	movzbl (%eax),%eax
  1033b1:	38 45 fc             	cmp    %al,-0x4(%ebp)
  1033b4:	74 0f                	je     1033c5 <strfind+0x28>
            break;
        }
        s ++;
  1033b6:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  1033b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1033bc:	0f b6 00             	movzbl (%eax),%eax
  1033bf:	84 c0                	test   %al,%al
  1033c1:	75 e8                	jne    1033ab <strfind+0xe>
  1033c3:	eb 01                	jmp    1033c6 <strfind+0x29>
            break;
  1033c5:	90                   	nop
    }
    return (char *)s;
  1033c6:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1033c9:	89 ec                	mov    %ebp,%esp
  1033cb:	5d                   	pop    %ebp
  1033cc:	c3                   	ret    

001033cd <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  1033cd:	55                   	push   %ebp
  1033ce:	89 e5                	mov    %esp,%ebp
  1033d0:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  1033d3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  1033da:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  1033e1:	eb 03                	jmp    1033e6 <strtol+0x19>
        s ++;
  1033e3:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  1033e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1033e9:	0f b6 00             	movzbl (%eax),%eax
  1033ec:	3c 20                	cmp    $0x20,%al
  1033ee:	74 f3                	je     1033e3 <strtol+0x16>
  1033f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1033f3:	0f b6 00             	movzbl (%eax),%eax
  1033f6:	3c 09                	cmp    $0x9,%al
  1033f8:	74 e9                	je     1033e3 <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  1033fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1033fd:	0f b6 00             	movzbl (%eax),%eax
  103400:	3c 2b                	cmp    $0x2b,%al
  103402:	75 05                	jne    103409 <strtol+0x3c>
        s ++;
  103404:	ff 45 08             	incl   0x8(%ebp)
  103407:	eb 14                	jmp    10341d <strtol+0x50>
    }
    else if (*s == '-') {
  103409:	8b 45 08             	mov    0x8(%ebp),%eax
  10340c:	0f b6 00             	movzbl (%eax),%eax
  10340f:	3c 2d                	cmp    $0x2d,%al
  103411:	75 0a                	jne    10341d <strtol+0x50>
        s ++, neg = 1;
  103413:	ff 45 08             	incl   0x8(%ebp)
  103416:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  10341d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103421:	74 06                	je     103429 <strtol+0x5c>
  103423:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103427:	75 22                	jne    10344b <strtol+0x7e>
  103429:	8b 45 08             	mov    0x8(%ebp),%eax
  10342c:	0f b6 00             	movzbl (%eax),%eax
  10342f:	3c 30                	cmp    $0x30,%al
  103431:	75 18                	jne    10344b <strtol+0x7e>
  103433:	8b 45 08             	mov    0x8(%ebp),%eax
  103436:	40                   	inc    %eax
  103437:	0f b6 00             	movzbl (%eax),%eax
  10343a:	3c 78                	cmp    $0x78,%al
  10343c:	75 0d                	jne    10344b <strtol+0x7e>
        s += 2, base = 16;
  10343e:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103442:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  103449:	eb 29                	jmp    103474 <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  10344b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10344f:	75 16                	jne    103467 <strtol+0x9a>
  103451:	8b 45 08             	mov    0x8(%ebp),%eax
  103454:	0f b6 00             	movzbl (%eax),%eax
  103457:	3c 30                	cmp    $0x30,%al
  103459:	75 0c                	jne    103467 <strtol+0x9a>
        s ++, base = 8;
  10345b:	ff 45 08             	incl   0x8(%ebp)
  10345e:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  103465:	eb 0d                	jmp    103474 <strtol+0xa7>
    }
    else if (base == 0) {
  103467:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10346b:	75 07                	jne    103474 <strtol+0xa7>
        base = 10;
  10346d:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  103474:	8b 45 08             	mov    0x8(%ebp),%eax
  103477:	0f b6 00             	movzbl (%eax),%eax
  10347a:	3c 2f                	cmp    $0x2f,%al
  10347c:	7e 1b                	jle    103499 <strtol+0xcc>
  10347e:	8b 45 08             	mov    0x8(%ebp),%eax
  103481:	0f b6 00             	movzbl (%eax),%eax
  103484:	3c 39                	cmp    $0x39,%al
  103486:	7f 11                	jg     103499 <strtol+0xcc>
            dig = *s - '0';
  103488:	8b 45 08             	mov    0x8(%ebp),%eax
  10348b:	0f b6 00             	movzbl (%eax),%eax
  10348e:	0f be c0             	movsbl %al,%eax
  103491:	83 e8 30             	sub    $0x30,%eax
  103494:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103497:	eb 48                	jmp    1034e1 <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  103499:	8b 45 08             	mov    0x8(%ebp),%eax
  10349c:	0f b6 00             	movzbl (%eax),%eax
  10349f:	3c 60                	cmp    $0x60,%al
  1034a1:	7e 1b                	jle    1034be <strtol+0xf1>
  1034a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1034a6:	0f b6 00             	movzbl (%eax),%eax
  1034a9:	3c 7a                	cmp    $0x7a,%al
  1034ab:	7f 11                	jg     1034be <strtol+0xf1>
            dig = *s - 'a' + 10;
  1034ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1034b0:	0f b6 00             	movzbl (%eax),%eax
  1034b3:	0f be c0             	movsbl %al,%eax
  1034b6:	83 e8 57             	sub    $0x57,%eax
  1034b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1034bc:	eb 23                	jmp    1034e1 <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  1034be:	8b 45 08             	mov    0x8(%ebp),%eax
  1034c1:	0f b6 00             	movzbl (%eax),%eax
  1034c4:	3c 40                	cmp    $0x40,%al
  1034c6:	7e 3b                	jle    103503 <strtol+0x136>
  1034c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1034cb:	0f b6 00             	movzbl (%eax),%eax
  1034ce:	3c 5a                	cmp    $0x5a,%al
  1034d0:	7f 31                	jg     103503 <strtol+0x136>
            dig = *s - 'A' + 10;
  1034d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1034d5:	0f b6 00             	movzbl (%eax),%eax
  1034d8:	0f be c0             	movsbl %al,%eax
  1034db:	83 e8 37             	sub    $0x37,%eax
  1034de:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  1034e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1034e4:	3b 45 10             	cmp    0x10(%ebp),%eax
  1034e7:	7d 19                	jge    103502 <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  1034e9:	ff 45 08             	incl   0x8(%ebp)
  1034ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1034ef:	0f af 45 10          	imul   0x10(%ebp),%eax
  1034f3:	89 c2                	mov    %eax,%edx
  1034f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1034f8:	01 d0                	add    %edx,%eax
  1034fa:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  1034fd:	e9 72 ff ff ff       	jmp    103474 <strtol+0xa7>
            break;
  103502:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  103503:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103507:	74 08                	je     103511 <strtol+0x144>
        *endptr = (char *) s;
  103509:	8b 45 0c             	mov    0xc(%ebp),%eax
  10350c:	8b 55 08             	mov    0x8(%ebp),%edx
  10350f:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103511:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  103515:	74 07                	je     10351e <strtol+0x151>
  103517:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10351a:	f7 d8                	neg    %eax
  10351c:	eb 03                	jmp    103521 <strtol+0x154>
  10351e:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103521:	89 ec                	mov    %ebp,%esp
  103523:	5d                   	pop    %ebp
  103524:	c3                   	ret    

00103525 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103525:	55                   	push   %ebp
  103526:	89 e5                	mov    %esp,%ebp
  103528:	83 ec 28             	sub    $0x28,%esp
  10352b:	89 7d fc             	mov    %edi,-0x4(%ebp)
  10352e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103531:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103534:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  103538:	8b 45 08             	mov    0x8(%ebp),%eax
  10353b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10353e:	88 55 f7             	mov    %dl,-0x9(%ebp)
  103541:	8b 45 10             	mov    0x10(%ebp),%eax
  103544:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  103547:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  10354a:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10354e:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103551:	89 d7                	mov    %edx,%edi
  103553:	f3 aa                	rep stos %al,%es:(%edi)
  103555:	89 fa                	mov    %edi,%edx
  103557:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10355a:	89 55 e8             	mov    %edx,-0x18(%ebp)
    return s;
  10355d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  103560:	8b 7d fc             	mov    -0x4(%ebp),%edi
  103563:	89 ec                	mov    %ebp,%esp
  103565:	5d                   	pop    %ebp
  103566:	c3                   	ret    

00103567 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  103567:	55                   	push   %ebp
  103568:	89 e5                	mov    %esp,%ebp
  10356a:	57                   	push   %edi
  10356b:	56                   	push   %esi
  10356c:	53                   	push   %ebx
  10356d:	83 ec 30             	sub    $0x30,%esp
  103570:	8b 45 08             	mov    0x8(%ebp),%eax
  103573:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103576:	8b 45 0c             	mov    0xc(%ebp),%eax
  103579:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10357c:	8b 45 10             	mov    0x10(%ebp),%eax
  10357f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if (dst < src) {
  103582:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103585:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  103588:	73 42                	jae    1035cc <memmove+0x65>
  10358a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10358d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103590:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103593:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103596:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103599:	89 45 dc             	mov    %eax,-0x24(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  10359c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10359f:	c1 e8 02             	shr    $0x2,%eax
  1035a2:	89 c1                	mov    %eax,%ecx
    asm volatile (
  1035a4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1035a7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1035aa:	89 d7                	mov    %edx,%edi
  1035ac:	89 c6                	mov    %eax,%esi
  1035ae:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1035b0:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1035b3:	83 e1 03             	and    $0x3,%ecx
  1035b6:	74 02                	je     1035ba <memmove+0x53>
  1035b8:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1035ba:	89 f0                	mov    %esi,%eax
  1035bc:	89 fa                	mov    %edi,%edx
  1035be:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1035c1:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  1035c4:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  1035c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  1035ca:	eb 36                	jmp    103602 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  1035cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1035cf:	8d 50 ff             	lea    -0x1(%eax),%edx
  1035d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1035d5:	01 c2                	add    %eax,%edx
  1035d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1035da:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1035dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1035e0:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  1035e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1035e6:	89 c1                	mov    %eax,%ecx
  1035e8:	89 d8                	mov    %ebx,%eax
  1035ea:	89 d6                	mov    %edx,%esi
  1035ec:	89 c7                	mov    %eax,%edi
  1035ee:	fd                   	std    
  1035ef:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1035f1:	fc                   	cld    
  1035f2:	89 f8                	mov    %edi,%eax
  1035f4:	89 f2                	mov    %esi,%edx
  1035f6:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  1035f9:	89 55 c8             	mov    %edx,-0x38(%ebp)
  1035fc:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  1035ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103602:	83 c4 30             	add    $0x30,%esp
  103605:	5b                   	pop    %ebx
  103606:	5e                   	pop    %esi
  103607:	5f                   	pop    %edi
  103608:	5d                   	pop    %ebp
  103609:	c3                   	ret    

0010360a <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  10360a:	55                   	push   %ebp
  10360b:	89 e5                	mov    %esp,%ebp
  10360d:	57                   	push   %edi
  10360e:	56                   	push   %esi
  10360f:	83 ec 20             	sub    $0x20,%esp
  103612:	8b 45 08             	mov    0x8(%ebp),%eax
  103615:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103618:	8b 45 0c             	mov    0xc(%ebp),%eax
  10361b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10361e:	8b 45 10             	mov    0x10(%ebp),%eax
  103621:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103624:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103627:	c1 e8 02             	shr    $0x2,%eax
  10362a:	89 c1                	mov    %eax,%ecx
    asm volatile (
  10362c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10362f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103632:	89 d7                	mov    %edx,%edi
  103634:	89 c6                	mov    %eax,%esi
  103636:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103638:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10363b:	83 e1 03             	and    $0x3,%ecx
  10363e:	74 02                	je     103642 <memcpy+0x38>
  103640:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103642:	89 f0                	mov    %esi,%eax
  103644:	89 fa                	mov    %edi,%edx
  103646:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103649:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10364c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  10364f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103652:	83 c4 20             	add    $0x20,%esp
  103655:	5e                   	pop    %esi
  103656:	5f                   	pop    %edi
  103657:	5d                   	pop    %ebp
  103658:	c3                   	ret    

00103659 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  103659:	55                   	push   %ebp
  10365a:	89 e5                	mov    %esp,%ebp
  10365c:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  10365f:	8b 45 08             	mov    0x8(%ebp),%eax
  103662:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103665:	8b 45 0c             	mov    0xc(%ebp),%eax
  103668:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  10366b:	eb 2e                	jmp    10369b <memcmp+0x42>
        if (*s1 != *s2) {
  10366d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103670:	0f b6 10             	movzbl (%eax),%edx
  103673:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103676:	0f b6 00             	movzbl (%eax),%eax
  103679:	38 c2                	cmp    %al,%dl
  10367b:	74 18                	je     103695 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  10367d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103680:	0f b6 00             	movzbl (%eax),%eax
  103683:	0f b6 d0             	movzbl %al,%edx
  103686:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103689:	0f b6 00             	movzbl (%eax),%eax
  10368c:	0f b6 c8             	movzbl %al,%ecx
  10368f:	89 d0                	mov    %edx,%eax
  103691:	29 c8                	sub    %ecx,%eax
  103693:	eb 18                	jmp    1036ad <memcmp+0x54>
        }
        s1 ++, s2 ++;
  103695:	ff 45 fc             	incl   -0x4(%ebp)
  103698:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  10369b:	8b 45 10             	mov    0x10(%ebp),%eax
  10369e:	8d 50 ff             	lea    -0x1(%eax),%edx
  1036a1:	89 55 10             	mov    %edx,0x10(%ebp)
  1036a4:	85 c0                	test   %eax,%eax
  1036a6:	75 c5                	jne    10366d <memcmp+0x14>
    }
    return 0;
  1036a8:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1036ad:	89 ec                	mov    %ebp,%esp
  1036af:	5d                   	pop    %ebp
  1036b0:	c3                   	ret    
