
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
void grade_backtrace(void);
static void lab1_switch_test(void);
static void lab1_print_cur_status(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	b8 e8 0d 11 00       	mov    $0x110de8,%eax
  10000b:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100010:	89 44 24 08          	mov    %eax,0x8(%esp)
  100014:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001b:	00 
  10001c:	c7 04 24 16 fa 10 00 	movl   $0x10fa16,(%esp)
  100023:	e8 aa 36 00 00       	call   1036d2 <memset>

    cons_init();                // init the console
  100028:	e8 bc 15 00 00       	call   1015e9 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002d:	c7 45 f4 60 38 10 00 	movl   $0x103860,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100034:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100037:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003b:	c7 04 24 7c 38 10 00 	movl   $0x10387c,(%esp)
  100042:	e8 01 03 00 00       	call   100348 <cprintf>

    print_kerninfo();
  100047:	e8 1f 08 00 00       	call   10086b <print_kerninfo>

    grade_backtrace();
  10004c:	e8 b4 00 00 00       	call   100105 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100051:	e8 d3 2c 00 00       	call   102d29 <pmm_init>

    pic_init();                 // init interrupt controller
  100056:	e8 e9 16 00 00       	call   101744 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005b:	e8 4d 18 00 00       	call   1018ad <idt_init>

    clock_init();               // init clock interrupt
  100060:	e8 25 0d 00 00       	call   100d8a <clock_init>
    intr_enable();              // enable irq interrupt
  100065:	e8 38 16 00 00       	call   1016a2 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  10006a:	e8 8e 01 00 00       	call   1001fd <lab1_switch_test>

    /* do nothing */
    size_t last = 0;
  10006f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
        //     cprintf("ticks  == %d\n", ticks);
        //     lab1_print_cur_status();
        //     last = ticks;
        // }
        extern volatile bool to_print_status;
        if (to_print_status)
  100076:	a1 a0 00 11 00       	mov    0x1100a0,%eax
  10007b:	85 c0                	test   %eax,%eax
  10007d:	74 f7                	je     100076 <kern_init+0x76>
        {
            lab1_print_cur_status();
  10007f:	e8 a9 00 00 00       	call   10012d <lab1_print_cur_status>
            to_print_status = 0;
  100084:	c7 05 a0 00 11 00 00 	movl   $0x0,0x1100a0
  10008b:	00 00 00 
    {
  10008e:	eb e6                	jmp    100076 <kern_init+0x76>

00100090 <grade_backtrace2>:
        }
    }
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100090:	55                   	push   %ebp
  100091:	89 e5                	mov    %esp,%ebp
  100093:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100096:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10009d:	00 
  10009e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  1000a5:	00 
  1000a6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000ad:	e8 f3 0b 00 00       	call   100ca5 <mon_backtrace>
}
  1000b2:	90                   	nop
  1000b3:	89 ec                	mov    %ebp,%esp
  1000b5:	5d                   	pop    %ebp
  1000b6:	c3                   	ret    

001000b7 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  1000b7:	55                   	push   %ebp
  1000b8:	89 e5                	mov    %esp,%ebp
  1000ba:	83 ec 18             	sub    $0x18,%esp
  1000bd:	89 5d fc             	mov    %ebx,-0x4(%ebp)
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000c0:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000c3:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000c6:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1000cc:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000d0:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000d4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000d8:	89 04 24             	mov    %eax,(%esp)
  1000db:	e8 b0 ff ff ff       	call   100090 <grade_backtrace2>
}
  1000e0:	90                   	nop
  1000e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000e4:	89 ec                	mov    %ebp,%esp
  1000e6:	5d                   	pop    %ebp
  1000e7:	c3                   	ret    

001000e8 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000e8:	55                   	push   %ebp
  1000e9:	89 e5                	mov    %esp,%ebp
  1000eb:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000ee:	8b 45 10             	mov    0x10(%ebp),%eax
  1000f1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000f8:	89 04 24             	mov    %eax,(%esp)
  1000fb:	e8 b7 ff ff ff       	call   1000b7 <grade_backtrace1>
}
  100100:	90                   	nop
  100101:	89 ec                	mov    %ebp,%esp
  100103:	5d                   	pop    %ebp
  100104:	c3                   	ret    

00100105 <grade_backtrace>:

void
grade_backtrace(void) {
  100105:	55                   	push   %ebp
  100106:	89 e5                	mov    %esp,%ebp
  100108:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  10010b:	b8 00 00 10 00       	mov    $0x100000,%eax
  100110:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  100117:	ff 
  100118:	89 44 24 04          	mov    %eax,0x4(%esp)
  10011c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100123:	e8 c0 ff ff ff       	call   1000e8 <grade_backtrace0>
}
  100128:	90                   	nop
  100129:	89 ec                	mov    %ebp,%esp
  10012b:	5d                   	pop    %ebp
  10012c:	c3                   	ret    

0010012d <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  10012d:	55                   	push   %ebp
  10012e:	89 e5                	mov    %esp,%ebp
  100130:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100133:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100136:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100139:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10013c:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10013f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100143:	83 e0 03             	and    $0x3,%eax
  100146:	89 c2                	mov    %eax,%edx
  100148:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10014d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100151:	89 44 24 04          	mov    %eax,0x4(%esp)
  100155:	c7 04 24 81 38 10 00 	movl   $0x103881,(%esp)
  10015c:	e8 e7 01 00 00       	call   100348 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100161:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100165:	89 c2                	mov    %eax,%edx
  100167:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10016c:	89 54 24 08          	mov    %edx,0x8(%esp)
  100170:	89 44 24 04          	mov    %eax,0x4(%esp)
  100174:	c7 04 24 8f 38 10 00 	movl   $0x10388f,(%esp)
  10017b:	e8 c8 01 00 00       	call   100348 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100180:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100184:	89 c2                	mov    %eax,%edx
  100186:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10018b:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100193:	c7 04 24 9d 38 10 00 	movl   $0x10389d,(%esp)
  10019a:	e8 a9 01 00 00       	call   100348 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10019f:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  1001a3:	89 c2                	mov    %eax,%edx
  1001a5:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001aa:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001ae:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001b2:	c7 04 24 ab 38 10 00 	movl   $0x1038ab,(%esp)
  1001b9:	e8 8a 01 00 00       	call   100348 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  1001be:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001c2:	89 c2                	mov    %eax,%edx
  1001c4:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001c9:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001cd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001d1:	c7 04 24 b9 38 10 00 	movl   $0x1038b9,(%esp)
  1001d8:	e8 6b 01 00 00       	call   100348 <cprintf>
    round ++;
  1001dd:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001e2:	40                   	inc    %eax
  1001e3:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001e8:	90                   	nop
  1001e9:	89 ec                	mov    %ebp,%esp
  1001eb:	5d                   	pop    %ebp
  1001ec:	c3                   	ret    

001001ed <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001ed:	55                   	push   %ebp
  1001ee:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
    asm volatile(
  1001f0:	cd 78                	int    $0x78
	    "int %0"
        :
        :"i"(T_SWITCH_TOU)
    );
}
  1001f2:	90                   	nop
  1001f3:	5d                   	pop    %ebp
  1001f4:	c3                   	ret    

001001f5 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001f5:	55                   	push   %ebp
  1001f6:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
    asm volatile(
  1001f8:	cd 79                	int    $0x79
        "int %0"
        :
        :"i"(T_SWITCH_TOK)
    );
}
  1001fa:	90                   	nop
  1001fb:	5d                   	pop    %ebp
  1001fc:	c3                   	ret    

001001fd <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001fd:	55                   	push   %ebp
  1001fe:	89 e5                	mov    %esp,%ebp
  100200:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  100203:	e8 25 ff ff ff       	call   10012d <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  100208:	c7 04 24 c8 38 10 00 	movl   $0x1038c8,(%esp)
  10020f:	e8 34 01 00 00       	call   100348 <cprintf>
    lab1_switch_to_user();
  100214:	e8 d4 ff ff ff       	call   1001ed <lab1_switch_to_user>
    lab1_print_cur_status();
  100219:	e8 0f ff ff ff       	call   10012d <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  10021e:	c7 04 24 e8 38 10 00 	movl   $0x1038e8,(%esp)
  100225:	e8 1e 01 00 00       	call   100348 <cprintf>
    lab1_switch_to_kernel();
  10022a:	e8 c6 ff ff ff       	call   1001f5 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  10022f:	e8 f9 fe ff ff       	call   10012d <lab1_print_cur_status>
}
  100234:	90                   	nop
  100235:	89 ec                	mov    %ebp,%esp
  100237:	5d                   	pop    %ebp
  100238:	c3                   	ret    

00100239 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100239:	55                   	push   %ebp
  10023a:	89 e5                	mov    %esp,%ebp
  10023c:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10023f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100243:	74 13                	je     100258 <readline+0x1f>
        cprintf("%s", prompt);
  100245:	8b 45 08             	mov    0x8(%ebp),%eax
  100248:	89 44 24 04          	mov    %eax,0x4(%esp)
  10024c:	c7 04 24 07 39 10 00 	movl   $0x103907,(%esp)
  100253:	e8 f0 00 00 00       	call   100348 <cprintf>
    }
    int i = 0, c;
  100258:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10025f:	e8 73 01 00 00       	call   1003d7 <getchar>
  100264:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100267:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10026b:	79 07                	jns    100274 <readline+0x3b>
            return NULL;
  10026d:	b8 00 00 00 00       	mov    $0x0,%eax
  100272:	eb 78                	jmp    1002ec <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100274:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100278:	7e 28                	jle    1002a2 <readline+0x69>
  10027a:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100281:	7f 1f                	jg     1002a2 <readline+0x69>
            cputchar(c);
  100283:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100286:	89 04 24             	mov    %eax,(%esp)
  100289:	e8 e2 00 00 00       	call   100370 <cputchar>
            buf[i ++] = c;
  10028e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100291:	8d 50 01             	lea    0x1(%eax),%edx
  100294:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100297:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10029a:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  1002a0:	eb 45                	jmp    1002e7 <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  1002a2:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  1002a6:	75 16                	jne    1002be <readline+0x85>
  1002a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1002ac:	7e 10                	jle    1002be <readline+0x85>
            cputchar(c);
  1002ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002b1:	89 04 24             	mov    %eax,(%esp)
  1002b4:	e8 b7 00 00 00       	call   100370 <cputchar>
            i --;
  1002b9:	ff 4d f4             	decl   -0xc(%ebp)
  1002bc:	eb 29                	jmp    1002e7 <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  1002be:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1002c2:	74 06                	je     1002ca <readline+0x91>
  1002c4:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1002c8:	75 95                	jne    10025f <readline+0x26>
            cputchar(c);
  1002ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002cd:	89 04 24             	mov    %eax,(%esp)
  1002d0:	e8 9b 00 00 00       	call   100370 <cputchar>
            buf[i] = '\0';
  1002d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002d8:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1002dd:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002e0:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1002e5:	eb 05                	jmp    1002ec <readline+0xb3>
        c = getchar();
  1002e7:	e9 73 ff ff ff       	jmp    10025f <readline+0x26>
        }
    }
}
  1002ec:	89 ec                	mov    %ebp,%esp
  1002ee:	5d                   	pop    %ebp
  1002ef:	c3                   	ret    

001002f0 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002f0:	55                   	push   %ebp
  1002f1:	89 e5                	mov    %esp,%ebp
  1002f3:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1002f9:	89 04 24             	mov    %eax,(%esp)
  1002fc:	e8 17 13 00 00       	call   101618 <cons_putc>
    (*cnt) ++;
  100301:	8b 45 0c             	mov    0xc(%ebp),%eax
  100304:	8b 00                	mov    (%eax),%eax
  100306:	8d 50 01             	lea    0x1(%eax),%edx
  100309:	8b 45 0c             	mov    0xc(%ebp),%eax
  10030c:	89 10                	mov    %edx,(%eax)
}
  10030e:	90                   	nop
  10030f:	89 ec                	mov    %ebp,%esp
  100311:	5d                   	pop    %ebp
  100312:	c3                   	ret    

00100313 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100313:	55                   	push   %ebp
  100314:	89 e5                	mov    %esp,%ebp
  100316:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100319:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100320:	8b 45 0c             	mov    0xc(%ebp),%eax
  100323:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100327:	8b 45 08             	mov    0x8(%ebp),%eax
  10032a:	89 44 24 08          	mov    %eax,0x8(%esp)
  10032e:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100331:	89 44 24 04          	mov    %eax,0x4(%esp)
  100335:	c7 04 24 f0 02 10 00 	movl   $0x1002f0,(%esp)
  10033c:	e8 bc 2b 00 00       	call   102efd <vprintfmt>
    return cnt;
  100341:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100344:	89 ec                	mov    %ebp,%esp
  100346:	5d                   	pop    %ebp
  100347:	c3                   	ret    

00100348 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100348:	55                   	push   %ebp
  100349:	89 e5                	mov    %esp,%ebp
  10034b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10034e:	8d 45 0c             	lea    0xc(%ebp),%eax
  100351:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100354:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100357:	89 44 24 04          	mov    %eax,0x4(%esp)
  10035b:	8b 45 08             	mov    0x8(%ebp),%eax
  10035e:	89 04 24             	mov    %eax,(%esp)
  100361:	e8 ad ff ff ff       	call   100313 <vcprintf>
  100366:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100369:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10036c:	89 ec                	mov    %ebp,%esp
  10036e:	5d                   	pop    %ebp
  10036f:	c3                   	ret    

00100370 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100370:	55                   	push   %ebp
  100371:	89 e5                	mov    %esp,%ebp
  100373:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100376:	8b 45 08             	mov    0x8(%ebp),%eax
  100379:	89 04 24             	mov    %eax,(%esp)
  10037c:	e8 97 12 00 00       	call   101618 <cons_putc>
}
  100381:	90                   	nop
  100382:	89 ec                	mov    %ebp,%esp
  100384:	5d                   	pop    %ebp
  100385:	c3                   	ret    

00100386 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100386:	55                   	push   %ebp
  100387:	89 e5                	mov    %esp,%ebp
  100389:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10038c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100393:	eb 13                	jmp    1003a8 <cputs+0x22>
        cputch(c, &cnt);
  100395:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100399:	8d 55 f0             	lea    -0x10(%ebp),%edx
  10039c:	89 54 24 04          	mov    %edx,0x4(%esp)
  1003a0:	89 04 24             	mov    %eax,(%esp)
  1003a3:	e8 48 ff ff ff       	call   1002f0 <cputch>
    while ((c = *str ++) != '\0') {
  1003a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1003ab:	8d 50 01             	lea    0x1(%eax),%edx
  1003ae:	89 55 08             	mov    %edx,0x8(%ebp)
  1003b1:	0f b6 00             	movzbl (%eax),%eax
  1003b4:	88 45 f7             	mov    %al,-0x9(%ebp)
  1003b7:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1003bb:	75 d8                	jne    100395 <cputs+0xf>
    }
    cputch('\n', &cnt);
  1003bd:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1003c0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003c4:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1003cb:	e8 20 ff ff ff       	call   1002f0 <cputch>
    return cnt;
  1003d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1003d3:	89 ec                	mov    %ebp,%esp
  1003d5:	5d                   	pop    %ebp
  1003d6:	c3                   	ret    

001003d7 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1003d7:	55                   	push   %ebp
  1003d8:	89 e5                	mov    %esp,%ebp
  1003da:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003dd:	90                   	nop
  1003de:	e8 61 12 00 00       	call   101644 <cons_getc>
  1003e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ea:	74 f2                	je     1003de <getchar+0x7>
        /* do nothing */;
    return c;
  1003ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003ef:	89 ec                	mov    %ebp,%esp
  1003f1:	5d                   	pop    %ebp
  1003f2:	c3                   	ret    

001003f3 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003f3:	55                   	push   %ebp
  1003f4:	89 e5                	mov    %esp,%ebp
  1003f6:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003fc:	8b 00                	mov    (%eax),%eax
  1003fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100401:	8b 45 10             	mov    0x10(%ebp),%eax
  100404:	8b 00                	mov    (%eax),%eax
  100406:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100409:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  100410:	e9 ca 00 00 00       	jmp    1004df <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  100415:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100418:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10041b:	01 d0                	add    %edx,%eax
  10041d:	89 c2                	mov    %eax,%edx
  10041f:	c1 ea 1f             	shr    $0x1f,%edx
  100422:	01 d0                	add    %edx,%eax
  100424:	d1 f8                	sar    %eax
  100426:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100429:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10042c:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10042f:	eb 03                	jmp    100434 <stab_binsearch+0x41>
            m --;
  100431:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  100434:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100437:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10043a:	7c 1f                	jl     10045b <stab_binsearch+0x68>
  10043c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10043f:	89 d0                	mov    %edx,%eax
  100441:	01 c0                	add    %eax,%eax
  100443:	01 d0                	add    %edx,%eax
  100445:	c1 e0 02             	shl    $0x2,%eax
  100448:	89 c2                	mov    %eax,%edx
  10044a:	8b 45 08             	mov    0x8(%ebp),%eax
  10044d:	01 d0                	add    %edx,%eax
  10044f:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100453:	0f b6 c0             	movzbl %al,%eax
  100456:	39 45 14             	cmp    %eax,0x14(%ebp)
  100459:	75 d6                	jne    100431 <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  10045b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10045e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100461:	7d 09                	jge    10046c <stab_binsearch+0x79>
            l = true_m + 1;
  100463:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100466:	40                   	inc    %eax
  100467:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10046a:	eb 73                	jmp    1004df <stab_binsearch+0xec>
        }

        // actual binary search
        any_matches = 1;
  10046c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100473:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100476:	89 d0                	mov    %edx,%eax
  100478:	01 c0                	add    %eax,%eax
  10047a:	01 d0                	add    %edx,%eax
  10047c:	c1 e0 02             	shl    $0x2,%eax
  10047f:	89 c2                	mov    %eax,%edx
  100481:	8b 45 08             	mov    0x8(%ebp),%eax
  100484:	01 d0                	add    %edx,%eax
  100486:	8b 40 08             	mov    0x8(%eax),%eax
  100489:	39 45 18             	cmp    %eax,0x18(%ebp)
  10048c:	76 11                	jbe    10049f <stab_binsearch+0xac>
            *region_left = m;
  10048e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100491:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100494:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100496:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100499:	40                   	inc    %eax
  10049a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10049d:	eb 40                	jmp    1004df <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  10049f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004a2:	89 d0                	mov    %edx,%eax
  1004a4:	01 c0                	add    %eax,%eax
  1004a6:	01 d0                	add    %edx,%eax
  1004a8:	c1 e0 02             	shl    $0x2,%eax
  1004ab:	89 c2                	mov    %eax,%edx
  1004ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1004b0:	01 d0                	add    %edx,%eax
  1004b2:	8b 40 08             	mov    0x8(%eax),%eax
  1004b5:	39 45 18             	cmp    %eax,0x18(%ebp)
  1004b8:	73 14                	jae    1004ce <stab_binsearch+0xdb>
            *region_right = m - 1;
  1004ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004bd:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004c0:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c3:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  1004c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004c8:	48                   	dec    %eax
  1004c9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004cc:	eb 11                	jmp    1004df <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1004ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004d4:	89 10                	mov    %edx,(%eax)
            l = m;
  1004d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004dc:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1004df:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004e2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004e5:	0f 8e 2a ff ff ff    	jle    100415 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  1004eb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004ef:	75 0f                	jne    100500 <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  1004f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004f4:	8b 00                	mov    (%eax),%eax
  1004f6:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004f9:	8b 45 10             	mov    0x10(%ebp),%eax
  1004fc:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1004fe:	eb 3e                	jmp    10053e <stab_binsearch+0x14b>
        l = *region_right;
  100500:	8b 45 10             	mov    0x10(%ebp),%eax
  100503:	8b 00                	mov    (%eax),%eax
  100505:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  100508:	eb 03                	jmp    10050d <stab_binsearch+0x11a>
  10050a:	ff 4d fc             	decl   -0x4(%ebp)
  10050d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100510:	8b 00                	mov    (%eax),%eax
  100512:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  100515:	7e 1f                	jle    100536 <stab_binsearch+0x143>
  100517:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10051a:	89 d0                	mov    %edx,%eax
  10051c:	01 c0                	add    %eax,%eax
  10051e:	01 d0                	add    %edx,%eax
  100520:	c1 e0 02             	shl    $0x2,%eax
  100523:	89 c2                	mov    %eax,%edx
  100525:	8b 45 08             	mov    0x8(%ebp),%eax
  100528:	01 d0                	add    %edx,%eax
  10052a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10052e:	0f b6 c0             	movzbl %al,%eax
  100531:	39 45 14             	cmp    %eax,0x14(%ebp)
  100534:	75 d4                	jne    10050a <stab_binsearch+0x117>
        *region_left = l;
  100536:	8b 45 0c             	mov    0xc(%ebp),%eax
  100539:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10053c:	89 10                	mov    %edx,(%eax)
}
  10053e:	90                   	nop
  10053f:	89 ec                	mov    %ebp,%esp
  100541:	5d                   	pop    %ebp
  100542:	c3                   	ret    

00100543 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100543:	55                   	push   %ebp
  100544:	89 e5                	mov    %esp,%ebp
  100546:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100549:	8b 45 0c             	mov    0xc(%ebp),%eax
  10054c:	c7 00 0c 39 10 00    	movl   $0x10390c,(%eax)
    info->eip_line = 0;
  100552:	8b 45 0c             	mov    0xc(%ebp),%eax
  100555:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10055c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10055f:	c7 40 08 0c 39 10 00 	movl   $0x10390c,0x8(%eax)
    info->eip_fn_namelen = 9;
  100566:	8b 45 0c             	mov    0xc(%ebp),%eax
  100569:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100570:	8b 45 0c             	mov    0xc(%ebp),%eax
  100573:	8b 55 08             	mov    0x8(%ebp),%edx
  100576:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100579:	8b 45 0c             	mov    0xc(%ebp),%eax
  10057c:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100583:	c7 45 f4 ac 41 10 00 	movl   $0x1041ac,-0xc(%ebp)
    stab_end = __STAB_END__;
  10058a:	c7 45 f0 c0 c3 10 00 	movl   $0x10c3c0,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100591:	c7 45 ec c1 c3 10 00 	movl   $0x10c3c1,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100598:	c7 45 e8 d9 ed 10 00 	movl   $0x10edd9,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10059f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1005a2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1005a5:	76 0b                	jbe    1005b2 <debuginfo_eip+0x6f>
  1005a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1005aa:	48                   	dec    %eax
  1005ab:	0f b6 00             	movzbl (%eax),%eax
  1005ae:	84 c0                	test   %al,%al
  1005b0:	74 0a                	je     1005bc <debuginfo_eip+0x79>
        return -1;
  1005b2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005b7:	e9 ab 02 00 00       	jmp    100867 <debuginfo_eip+0x324>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  1005bc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1005c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005c6:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1005c9:	c1 f8 02             	sar    $0x2,%eax
  1005cc:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1005d2:	48                   	dec    %eax
  1005d3:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1005d9:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005dd:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005e4:	00 
  1005e5:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005e8:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ec:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005ef:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005f6:	89 04 24             	mov    %eax,(%esp)
  1005f9:	e8 f5 fd ff ff       	call   1003f3 <stab_binsearch>
    if (lfile == 0)
  1005fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100601:	85 c0                	test   %eax,%eax
  100603:	75 0a                	jne    10060f <debuginfo_eip+0xcc>
        return -1;
  100605:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10060a:	e9 58 02 00 00       	jmp    100867 <debuginfo_eip+0x324>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  10060f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100612:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100615:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100618:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  10061b:	8b 45 08             	mov    0x8(%ebp),%eax
  10061e:	89 44 24 10          	mov    %eax,0x10(%esp)
  100622:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100629:	00 
  10062a:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10062d:	89 44 24 08          	mov    %eax,0x8(%esp)
  100631:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100634:	89 44 24 04          	mov    %eax,0x4(%esp)
  100638:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10063b:	89 04 24             	mov    %eax,(%esp)
  10063e:	e8 b0 fd ff ff       	call   1003f3 <stab_binsearch>

    if (lfun <= rfun) {
  100643:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100646:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100649:	39 c2                	cmp    %eax,%edx
  10064b:	7f 78                	jg     1006c5 <debuginfo_eip+0x182>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10064d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100650:	89 c2                	mov    %eax,%edx
  100652:	89 d0                	mov    %edx,%eax
  100654:	01 c0                	add    %eax,%eax
  100656:	01 d0                	add    %edx,%eax
  100658:	c1 e0 02             	shl    $0x2,%eax
  10065b:	89 c2                	mov    %eax,%edx
  10065d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100660:	01 d0                	add    %edx,%eax
  100662:	8b 10                	mov    (%eax),%edx
  100664:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100667:	2b 45 ec             	sub    -0x14(%ebp),%eax
  10066a:	39 c2                	cmp    %eax,%edx
  10066c:	73 22                	jae    100690 <debuginfo_eip+0x14d>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10066e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100671:	89 c2                	mov    %eax,%edx
  100673:	89 d0                	mov    %edx,%eax
  100675:	01 c0                	add    %eax,%eax
  100677:	01 d0                	add    %edx,%eax
  100679:	c1 e0 02             	shl    $0x2,%eax
  10067c:	89 c2                	mov    %eax,%edx
  10067e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100681:	01 d0                	add    %edx,%eax
  100683:	8b 10                	mov    (%eax),%edx
  100685:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100688:	01 c2                	add    %eax,%edx
  10068a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10068d:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100690:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100693:	89 c2                	mov    %eax,%edx
  100695:	89 d0                	mov    %edx,%eax
  100697:	01 c0                	add    %eax,%eax
  100699:	01 d0                	add    %edx,%eax
  10069b:	c1 e0 02             	shl    $0x2,%eax
  10069e:	89 c2                	mov    %eax,%edx
  1006a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006a3:	01 d0                	add    %edx,%eax
  1006a5:	8b 50 08             	mov    0x8(%eax),%edx
  1006a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006ab:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  1006ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006b1:	8b 40 10             	mov    0x10(%eax),%eax
  1006b4:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  1006b7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006ba:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  1006bd:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1006c3:	eb 15                	jmp    1006da <debuginfo_eip+0x197>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  1006c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c8:	8b 55 08             	mov    0x8(%ebp),%edx
  1006cb:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006d1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006d7:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006da:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006dd:	8b 40 08             	mov    0x8(%eax),%eax
  1006e0:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006e7:	00 
  1006e8:	89 04 24             	mov    %eax,(%esp)
  1006eb:	e8 5a 2e 00 00       	call   10354a <strfind>
  1006f0:	8b 55 0c             	mov    0xc(%ebp),%edx
  1006f3:	8b 4a 08             	mov    0x8(%edx),%ecx
  1006f6:	29 c8                	sub    %ecx,%eax
  1006f8:	89 c2                	mov    %eax,%edx
  1006fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006fd:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  100700:	8b 45 08             	mov    0x8(%ebp),%eax
  100703:	89 44 24 10          	mov    %eax,0x10(%esp)
  100707:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  10070e:	00 
  10070f:	8d 45 d0             	lea    -0x30(%ebp),%eax
  100712:	89 44 24 08          	mov    %eax,0x8(%esp)
  100716:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  100719:	89 44 24 04          	mov    %eax,0x4(%esp)
  10071d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100720:	89 04 24             	mov    %eax,(%esp)
  100723:	e8 cb fc ff ff       	call   1003f3 <stab_binsearch>
    if (lline <= rline) {
  100728:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10072b:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10072e:	39 c2                	cmp    %eax,%edx
  100730:	7f 23                	jg     100755 <debuginfo_eip+0x212>
        info->eip_line = stabs[rline].n_desc;
  100732:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100735:	89 c2                	mov    %eax,%edx
  100737:	89 d0                	mov    %edx,%eax
  100739:	01 c0                	add    %eax,%eax
  10073b:	01 d0                	add    %edx,%eax
  10073d:	c1 e0 02             	shl    $0x2,%eax
  100740:	89 c2                	mov    %eax,%edx
  100742:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100745:	01 d0                	add    %edx,%eax
  100747:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10074b:	89 c2                	mov    %eax,%edx
  10074d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100750:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100753:	eb 11                	jmp    100766 <debuginfo_eip+0x223>
        return -1;
  100755:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10075a:	e9 08 01 00 00       	jmp    100867 <debuginfo_eip+0x324>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  10075f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100762:	48                   	dec    %eax
  100763:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100766:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100769:	8b 45 e4             	mov    -0x1c(%ebp),%eax
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10076c:	39 c2                	cmp    %eax,%edx
  10076e:	7c 56                	jl     1007c6 <debuginfo_eip+0x283>
           && stabs[lline].n_type != N_SOL
  100770:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100773:	89 c2                	mov    %eax,%edx
  100775:	89 d0                	mov    %edx,%eax
  100777:	01 c0                	add    %eax,%eax
  100779:	01 d0                	add    %edx,%eax
  10077b:	c1 e0 02             	shl    $0x2,%eax
  10077e:	89 c2                	mov    %eax,%edx
  100780:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100783:	01 d0                	add    %edx,%eax
  100785:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100789:	3c 84                	cmp    $0x84,%al
  10078b:	74 39                	je     1007c6 <debuginfo_eip+0x283>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10078d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100790:	89 c2                	mov    %eax,%edx
  100792:	89 d0                	mov    %edx,%eax
  100794:	01 c0                	add    %eax,%eax
  100796:	01 d0                	add    %edx,%eax
  100798:	c1 e0 02             	shl    $0x2,%eax
  10079b:	89 c2                	mov    %eax,%edx
  10079d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007a0:	01 d0                	add    %edx,%eax
  1007a2:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007a6:	3c 64                	cmp    $0x64,%al
  1007a8:	75 b5                	jne    10075f <debuginfo_eip+0x21c>
  1007aa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007ad:	89 c2                	mov    %eax,%edx
  1007af:	89 d0                	mov    %edx,%eax
  1007b1:	01 c0                	add    %eax,%eax
  1007b3:	01 d0                	add    %edx,%eax
  1007b5:	c1 e0 02             	shl    $0x2,%eax
  1007b8:	89 c2                	mov    %eax,%edx
  1007ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007bd:	01 d0                	add    %edx,%eax
  1007bf:	8b 40 08             	mov    0x8(%eax),%eax
  1007c2:	85 c0                	test   %eax,%eax
  1007c4:	74 99                	je     10075f <debuginfo_eip+0x21c>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  1007c6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007cc:	39 c2                	cmp    %eax,%edx
  1007ce:	7c 42                	jl     100812 <debuginfo_eip+0x2cf>
  1007d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007d3:	89 c2                	mov    %eax,%edx
  1007d5:	89 d0                	mov    %edx,%eax
  1007d7:	01 c0                	add    %eax,%eax
  1007d9:	01 d0                	add    %edx,%eax
  1007db:	c1 e0 02             	shl    $0x2,%eax
  1007de:	89 c2                	mov    %eax,%edx
  1007e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007e3:	01 d0                	add    %edx,%eax
  1007e5:	8b 10                	mov    (%eax),%edx
  1007e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1007ea:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1007ed:	39 c2                	cmp    %eax,%edx
  1007ef:	73 21                	jae    100812 <debuginfo_eip+0x2cf>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007f1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007f4:	89 c2                	mov    %eax,%edx
  1007f6:	89 d0                	mov    %edx,%eax
  1007f8:	01 c0                	add    %eax,%eax
  1007fa:	01 d0                	add    %edx,%eax
  1007fc:	c1 e0 02             	shl    $0x2,%eax
  1007ff:	89 c2                	mov    %eax,%edx
  100801:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100804:	01 d0                	add    %edx,%eax
  100806:	8b 10                	mov    (%eax),%edx
  100808:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10080b:	01 c2                	add    %eax,%edx
  10080d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100810:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  100812:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100815:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100818:	39 c2                	cmp    %eax,%edx
  10081a:	7d 46                	jge    100862 <debuginfo_eip+0x31f>
        for (lline = lfun + 1;
  10081c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10081f:	40                   	inc    %eax
  100820:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100823:	eb 16                	jmp    10083b <debuginfo_eip+0x2f8>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100825:	8b 45 0c             	mov    0xc(%ebp),%eax
  100828:	8b 40 14             	mov    0x14(%eax),%eax
  10082b:	8d 50 01             	lea    0x1(%eax),%edx
  10082e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100831:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100834:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100837:	40                   	inc    %eax
  100838:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  10083b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10083e:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100841:	39 c2                	cmp    %eax,%edx
  100843:	7d 1d                	jge    100862 <debuginfo_eip+0x31f>
  100845:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100848:	89 c2                	mov    %eax,%edx
  10084a:	89 d0                	mov    %edx,%eax
  10084c:	01 c0                	add    %eax,%eax
  10084e:	01 d0                	add    %edx,%eax
  100850:	c1 e0 02             	shl    $0x2,%eax
  100853:	89 c2                	mov    %eax,%edx
  100855:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100858:	01 d0                	add    %edx,%eax
  10085a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10085e:	3c a0                	cmp    $0xa0,%al
  100860:	74 c3                	je     100825 <debuginfo_eip+0x2e2>
        }
    }
    return 0;
  100862:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100867:	89 ec                	mov    %ebp,%esp
  100869:	5d                   	pop    %ebp
  10086a:	c3                   	ret    

0010086b <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  10086b:	55                   	push   %ebp
  10086c:	89 e5                	mov    %esp,%ebp
  10086e:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100871:	c7 04 24 16 39 10 00 	movl   $0x103916,(%esp)
  100878:	e8 cb fa ff ff       	call   100348 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10087d:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100884:	00 
  100885:	c7 04 24 2f 39 10 00 	movl   $0x10392f,(%esp)
  10088c:	e8 b7 fa ff ff       	call   100348 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100891:	c7 44 24 04 5e 38 10 	movl   $0x10385e,0x4(%esp)
  100898:	00 
  100899:	c7 04 24 47 39 10 00 	movl   $0x103947,(%esp)
  1008a0:	e8 a3 fa ff ff       	call   100348 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  1008a5:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  1008ac:	00 
  1008ad:	c7 04 24 5f 39 10 00 	movl   $0x10395f,(%esp)
  1008b4:	e8 8f fa ff ff       	call   100348 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  1008b9:	c7 44 24 04 e8 0d 11 	movl   $0x110de8,0x4(%esp)
  1008c0:	00 
  1008c1:	c7 04 24 77 39 10 00 	movl   $0x103977,(%esp)
  1008c8:	e8 7b fa ff ff       	call   100348 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008cd:	b8 e8 0d 11 00       	mov    $0x110de8,%eax
  1008d2:	2d 00 00 10 00       	sub    $0x100000,%eax
  1008d7:	05 ff 03 00 00       	add    $0x3ff,%eax
  1008dc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008e2:	85 c0                	test   %eax,%eax
  1008e4:	0f 48 c2             	cmovs  %edx,%eax
  1008e7:	c1 f8 0a             	sar    $0xa,%eax
  1008ea:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ee:	c7 04 24 90 39 10 00 	movl   $0x103990,(%esp)
  1008f5:	e8 4e fa ff ff       	call   100348 <cprintf>
}
  1008fa:	90                   	nop
  1008fb:	89 ec                	mov    %ebp,%esp
  1008fd:	5d                   	pop    %ebp
  1008fe:	c3                   	ret    

001008ff <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008ff:	55                   	push   %ebp
  100900:	89 e5                	mov    %esp,%ebp
  100902:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  100908:	8d 45 dc             	lea    -0x24(%ebp),%eax
  10090b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10090f:	8b 45 08             	mov    0x8(%ebp),%eax
  100912:	89 04 24             	mov    %eax,(%esp)
  100915:	e8 29 fc ff ff       	call   100543 <debuginfo_eip>
  10091a:	85 c0                	test   %eax,%eax
  10091c:	74 15                	je     100933 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  10091e:	8b 45 08             	mov    0x8(%ebp),%eax
  100921:	89 44 24 04          	mov    %eax,0x4(%esp)
  100925:	c7 04 24 ba 39 10 00 	movl   $0x1039ba,(%esp)
  10092c:	e8 17 fa ff ff       	call   100348 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100931:	eb 6c                	jmp    10099f <print_debuginfo+0xa0>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100933:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10093a:	eb 1b                	jmp    100957 <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  10093c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10093f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100942:	01 d0                	add    %edx,%eax
  100944:	0f b6 10             	movzbl (%eax),%edx
  100947:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10094d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100950:	01 c8                	add    %ecx,%eax
  100952:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100954:	ff 45 f4             	incl   -0xc(%ebp)
  100957:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10095a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  10095d:	7c dd                	jl     10093c <print_debuginfo+0x3d>
        fnname[j] = '\0';
  10095f:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100965:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100968:	01 d0                	add    %edx,%eax
  10096a:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  10096d:	8b 55 ec             	mov    -0x14(%ebp),%edx
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100970:	8b 45 08             	mov    0x8(%ebp),%eax
  100973:	29 d0                	sub    %edx,%eax
  100975:	89 c1                	mov    %eax,%ecx
  100977:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10097a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10097d:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100981:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100987:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  10098b:	89 54 24 08          	mov    %edx,0x8(%esp)
  10098f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100993:	c7 04 24 d6 39 10 00 	movl   $0x1039d6,(%esp)
  10099a:	e8 a9 f9 ff ff       	call   100348 <cprintf>
}
  10099f:	90                   	nop
  1009a0:	89 ec                	mov    %ebp,%esp
  1009a2:	5d                   	pop    %ebp
  1009a3:	c3                   	ret    

001009a4 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  1009a4:	55                   	push   %ebp
  1009a5:	89 e5                	mov    %esp,%ebp
  1009a7:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  1009aa:	8b 45 04             	mov    0x4(%ebp),%eax
  1009ad:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  1009b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1009b3:	89 ec                	mov    %ebp,%esp
  1009b5:	5d                   	pop    %ebp
  1009b6:	c3                   	ret    

001009b7 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  1009b7:	55                   	push   %ebp
  1009b8:	89 e5                	mov    %esp,%ebp
  1009ba:	83 ec 38             	sub    $0x38,%esp
  1009bd:	89 5d fc             	mov    %ebx,-0x4(%ebp)
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  1009c0:	89 e8                	mov    %ebp,%eax
  1009c2:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return ebp;
  1009c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
      uint32_t ebp = read_ebp();
  1009c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
      uint32_t eip = read_eip();
  1009cb:	e8 d4 ff ff ff       	call   1009a4 <read_eip>
  1009d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
      int cnt = 0;
  1009d3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      while(ebp && cnt++ < STACKFRAME_DEPTH)
  1009da:	eb 69                	jmp    100a45 <print_stackframe+0x8e>
      {
		  cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x\n", 
		  ebp, eip, *((uint32_t *)ebp + 2), *((uint32_t *)ebp + 3), *((uint32_t *)ebp + 4), *((uint32_t *)ebp + 5));
  1009dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009df:	83 c0 14             	add    $0x14,%eax
		  cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x\n", 
  1009e2:	8b 18                	mov    (%eax),%ebx
		  ebp, eip, *((uint32_t *)ebp + 2), *((uint32_t *)ebp + 3), *((uint32_t *)ebp + 4), *((uint32_t *)ebp + 5));
  1009e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009e7:	83 c0 10             	add    $0x10,%eax
		  cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x\n", 
  1009ea:	8b 08                	mov    (%eax),%ecx
		  ebp, eip, *((uint32_t *)ebp + 2), *((uint32_t *)ebp + 3), *((uint32_t *)ebp + 4), *((uint32_t *)ebp + 5));
  1009ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009ef:	83 c0 0c             	add    $0xc,%eax
		  cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x\n", 
  1009f2:	8b 10                	mov    (%eax),%edx
		  ebp, eip, *((uint32_t *)ebp + 2), *((uint32_t *)ebp + 3), *((uint32_t *)ebp + 4), *((uint32_t *)ebp + 5));
  1009f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009f7:	83 c0 08             	add    $0x8,%eax
		  cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x\n", 
  1009fa:	8b 00                	mov    (%eax),%eax
  1009fc:	89 5c 24 18          	mov    %ebx,0x18(%esp)
  100a00:	89 4c 24 14          	mov    %ecx,0x14(%esp)
  100a04:	89 54 24 10          	mov    %edx,0x10(%esp)
  100a08:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100a0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a0f:	89 44 24 08          	mov    %eax,0x8(%esp)
  100a13:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a16:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a1a:	c7 04 24 e8 39 10 00 	movl   $0x1039e8,(%esp)
  100a21:	e8 22 f9 ff ff       	call   100348 <cprintf>
		  print_debuginfo(eip - 1);
  100a26:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a29:	48                   	dec    %eax
  100a2a:	89 04 24             	mov    %eax,(%esp)
  100a2d:	e8 cd fe ff ff       	call   1008ff <print_debuginfo>
		  eip = *((uint32_t *)(ebp + 4));
  100a32:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a35:	83 c0 04             	add    $0x4,%eax
  100a38:	8b 00                	mov    (%eax),%eax
  100a3a:	89 45 f0             	mov    %eax,-0x10(%ebp)
		  ebp = *((uint32_t *)ebp);
  100a3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a40:	8b 00                	mov    (%eax),%eax
  100a42:	89 45 f4             	mov    %eax,-0xc(%ebp)
      while(ebp && cnt++ < STACKFRAME_DEPTH)
  100a45:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a49:	74 0e                	je     100a59 <print_stackframe+0xa2>
  100a4b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a4e:	8d 50 01             	lea    0x1(%eax),%edx
  100a51:	89 55 ec             	mov    %edx,-0x14(%ebp)
  100a54:	83 f8 13             	cmp    $0x13,%eax
  100a57:	7e 83                	jle    1009dc <print_stackframe+0x25>
      }
}
  100a59:	90                   	nop
  100a5a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a5d:	89 ec                	mov    %ebp,%esp
  100a5f:	5d                   	pop    %ebp
  100a60:	c3                   	ret    

00100a61 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a61:	55                   	push   %ebp
  100a62:	89 e5                	mov    %esp,%ebp
  100a64:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a67:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a6e:	eb 0c                	jmp    100a7c <parse+0x1b>
            *buf ++ = '\0';
  100a70:	8b 45 08             	mov    0x8(%ebp),%eax
  100a73:	8d 50 01             	lea    0x1(%eax),%edx
  100a76:	89 55 08             	mov    %edx,0x8(%ebp)
  100a79:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a7c:	8b 45 08             	mov    0x8(%ebp),%eax
  100a7f:	0f b6 00             	movzbl (%eax),%eax
  100a82:	84 c0                	test   %al,%al
  100a84:	74 1d                	je     100aa3 <parse+0x42>
  100a86:	8b 45 08             	mov    0x8(%ebp),%eax
  100a89:	0f b6 00             	movzbl (%eax),%eax
  100a8c:	0f be c0             	movsbl %al,%eax
  100a8f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a93:	c7 04 24 a0 3a 10 00 	movl   $0x103aa0,(%esp)
  100a9a:	e8 77 2a 00 00       	call   103516 <strchr>
  100a9f:	85 c0                	test   %eax,%eax
  100aa1:	75 cd                	jne    100a70 <parse+0xf>
        }
        if (*buf == '\0') {
  100aa3:	8b 45 08             	mov    0x8(%ebp),%eax
  100aa6:	0f b6 00             	movzbl (%eax),%eax
  100aa9:	84 c0                	test   %al,%al
  100aab:	74 65                	je     100b12 <parse+0xb1>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100aad:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100ab1:	75 14                	jne    100ac7 <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100ab3:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100aba:	00 
  100abb:	c7 04 24 a5 3a 10 00 	movl   $0x103aa5,(%esp)
  100ac2:	e8 81 f8 ff ff       	call   100348 <cprintf>
        }
        argv[argc ++] = buf;
  100ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aca:	8d 50 01             	lea    0x1(%eax),%edx
  100acd:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100ad0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ad7:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ada:	01 c2                	add    %eax,%edx
  100adc:	8b 45 08             	mov    0x8(%ebp),%eax
  100adf:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ae1:	eb 03                	jmp    100ae6 <parse+0x85>
            buf ++;
  100ae3:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ae6:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae9:	0f b6 00             	movzbl (%eax),%eax
  100aec:	84 c0                	test   %al,%al
  100aee:	74 8c                	je     100a7c <parse+0x1b>
  100af0:	8b 45 08             	mov    0x8(%ebp),%eax
  100af3:	0f b6 00             	movzbl (%eax),%eax
  100af6:	0f be c0             	movsbl %al,%eax
  100af9:	89 44 24 04          	mov    %eax,0x4(%esp)
  100afd:	c7 04 24 a0 3a 10 00 	movl   $0x103aa0,(%esp)
  100b04:	e8 0d 2a 00 00       	call   103516 <strchr>
  100b09:	85 c0                	test   %eax,%eax
  100b0b:	74 d6                	je     100ae3 <parse+0x82>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b0d:	e9 6a ff ff ff       	jmp    100a7c <parse+0x1b>
            break;
  100b12:	90                   	nop
        }
    }
    return argc;
  100b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b16:	89 ec                	mov    %ebp,%esp
  100b18:	5d                   	pop    %ebp
  100b19:	c3                   	ret    

00100b1a <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b1a:	55                   	push   %ebp
  100b1b:	89 e5                	mov    %esp,%ebp
  100b1d:	83 ec 68             	sub    $0x68,%esp
  100b20:	89 5d fc             	mov    %ebx,-0x4(%ebp)
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b23:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b26:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b2a:	8b 45 08             	mov    0x8(%ebp),%eax
  100b2d:	89 04 24             	mov    %eax,(%esp)
  100b30:	e8 2c ff ff ff       	call   100a61 <parse>
  100b35:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b38:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b3c:	75 0a                	jne    100b48 <runcmd+0x2e>
        return 0;
  100b3e:	b8 00 00 00 00       	mov    $0x0,%eax
  100b43:	e9 83 00 00 00       	jmp    100bcb <runcmd+0xb1>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b48:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b4f:	eb 5a                	jmp    100bab <runcmd+0x91>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b51:	8b 55 b0             	mov    -0x50(%ebp),%edx
  100b54:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100b57:	89 c8                	mov    %ecx,%eax
  100b59:	01 c0                	add    %eax,%eax
  100b5b:	01 c8                	add    %ecx,%eax
  100b5d:	c1 e0 02             	shl    $0x2,%eax
  100b60:	05 00 f0 10 00       	add    $0x10f000,%eax
  100b65:	8b 00                	mov    (%eax),%eax
  100b67:	89 54 24 04          	mov    %edx,0x4(%esp)
  100b6b:	89 04 24             	mov    %eax,(%esp)
  100b6e:	e8 07 29 00 00       	call   10347a <strcmp>
  100b73:	85 c0                	test   %eax,%eax
  100b75:	75 31                	jne    100ba8 <runcmd+0x8e>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b77:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b7a:	89 d0                	mov    %edx,%eax
  100b7c:	01 c0                	add    %eax,%eax
  100b7e:	01 d0                	add    %edx,%eax
  100b80:	c1 e0 02             	shl    $0x2,%eax
  100b83:	05 08 f0 10 00       	add    $0x10f008,%eax
  100b88:	8b 10                	mov    (%eax),%edx
  100b8a:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b8d:	83 c0 04             	add    $0x4,%eax
  100b90:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100b93:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100b96:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100b99:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100b9d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ba1:	89 1c 24             	mov    %ebx,(%esp)
  100ba4:	ff d2                	call   *%edx
  100ba6:	eb 23                	jmp    100bcb <runcmd+0xb1>
    for (i = 0; i < NCOMMANDS; i ++) {
  100ba8:	ff 45 f4             	incl   -0xc(%ebp)
  100bab:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bae:	83 f8 02             	cmp    $0x2,%eax
  100bb1:	76 9e                	jbe    100b51 <runcmd+0x37>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100bb3:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100bb6:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bba:	c7 04 24 c3 3a 10 00 	movl   $0x103ac3,(%esp)
  100bc1:	e8 82 f7 ff ff       	call   100348 <cprintf>
    return 0;
  100bc6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bcb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100bce:	89 ec                	mov    %ebp,%esp
  100bd0:	5d                   	pop    %ebp
  100bd1:	c3                   	ret    

00100bd2 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bd2:	55                   	push   %ebp
  100bd3:	89 e5                	mov    %esp,%ebp
  100bd5:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100bd8:	c7 04 24 dc 3a 10 00 	movl   $0x103adc,(%esp)
  100bdf:	e8 64 f7 ff ff       	call   100348 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100be4:	c7 04 24 04 3b 10 00 	movl   $0x103b04,(%esp)
  100beb:	e8 58 f7 ff ff       	call   100348 <cprintf>

    if (tf != NULL) {
  100bf0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100bf4:	74 0b                	je     100c01 <kmonitor+0x2f>
        print_trapframe(tf);
  100bf6:	8b 45 08             	mov    0x8(%ebp),%eax
  100bf9:	89 04 24             	mov    %eax,(%esp)
  100bfc:	e8 64 0e 00 00       	call   101a65 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100c01:	c7 04 24 29 3b 10 00 	movl   $0x103b29,(%esp)
  100c08:	e8 2c f6 ff ff       	call   100239 <readline>
  100c0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c10:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c14:	74 eb                	je     100c01 <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100c16:	8b 45 08             	mov    0x8(%ebp),%eax
  100c19:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c20:	89 04 24             	mov    %eax,(%esp)
  100c23:	e8 f2 fe ff ff       	call   100b1a <runcmd>
  100c28:	85 c0                	test   %eax,%eax
  100c2a:	78 02                	js     100c2e <kmonitor+0x5c>
        if ((buf = readline("K> ")) != NULL) {
  100c2c:	eb d3                	jmp    100c01 <kmonitor+0x2f>
                break;
  100c2e:	90                   	nop
            }
        }
    }
}
  100c2f:	90                   	nop
  100c30:	89 ec                	mov    %ebp,%esp
  100c32:	5d                   	pop    %ebp
  100c33:	c3                   	ret    

00100c34 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c34:	55                   	push   %ebp
  100c35:	89 e5                	mov    %esp,%ebp
  100c37:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c3a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c41:	eb 3d                	jmp    100c80 <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c43:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c46:	89 d0                	mov    %edx,%eax
  100c48:	01 c0                	add    %eax,%eax
  100c4a:	01 d0                	add    %edx,%eax
  100c4c:	c1 e0 02             	shl    $0x2,%eax
  100c4f:	05 04 f0 10 00       	add    $0x10f004,%eax
  100c54:	8b 10                	mov    (%eax),%edx
  100c56:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100c59:	89 c8                	mov    %ecx,%eax
  100c5b:	01 c0                	add    %eax,%eax
  100c5d:	01 c8                	add    %ecx,%eax
  100c5f:	c1 e0 02             	shl    $0x2,%eax
  100c62:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c67:	8b 00                	mov    (%eax),%eax
  100c69:	89 54 24 08          	mov    %edx,0x8(%esp)
  100c6d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c71:	c7 04 24 2d 3b 10 00 	movl   $0x103b2d,(%esp)
  100c78:	e8 cb f6 ff ff       	call   100348 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c7d:	ff 45 f4             	incl   -0xc(%ebp)
  100c80:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c83:	83 f8 02             	cmp    $0x2,%eax
  100c86:	76 bb                	jbe    100c43 <mon_help+0xf>
    }
    return 0;
  100c88:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c8d:	89 ec                	mov    %ebp,%esp
  100c8f:	5d                   	pop    %ebp
  100c90:	c3                   	ret    

00100c91 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c91:	55                   	push   %ebp
  100c92:	89 e5                	mov    %esp,%ebp
  100c94:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c97:	e8 cf fb ff ff       	call   10086b <print_kerninfo>
    return 0;
  100c9c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ca1:	89 ec                	mov    %ebp,%esp
  100ca3:	5d                   	pop    %ebp
  100ca4:	c3                   	ret    

00100ca5 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100ca5:	55                   	push   %ebp
  100ca6:	89 e5                	mov    %esp,%ebp
  100ca8:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100cab:	e8 07 fd ff ff       	call   1009b7 <print_stackframe>
    return 0;
  100cb0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cb5:	89 ec                	mov    %ebp,%esp
  100cb7:	5d                   	pop    %ebp
  100cb8:	c3                   	ret    

00100cb9 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100cb9:	55                   	push   %ebp
  100cba:	89 e5                	mov    %esp,%ebp
  100cbc:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100cbf:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  100cc4:	85 c0                	test   %eax,%eax
  100cc6:	75 5b                	jne    100d23 <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  100cc8:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  100ccf:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100cd2:	8d 45 14             	lea    0x14(%ebp),%eax
  100cd5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100cd8:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cdb:	89 44 24 08          	mov    %eax,0x8(%esp)
  100cdf:	8b 45 08             	mov    0x8(%ebp),%eax
  100ce2:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ce6:	c7 04 24 36 3b 10 00 	movl   $0x103b36,(%esp)
  100ced:	e8 56 f6 ff ff       	call   100348 <cprintf>
    vcprintf(fmt, ap);
  100cf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cf5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cf9:	8b 45 10             	mov    0x10(%ebp),%eax
  100cfc:	89 04 24             	mov    %eax,(%esp)
  100cff:	e8 0f f6 ff ff       	call   100313 <vcprintf>
    cprintf("\n");
  100d04:	c7 04 24 52 3b 10 00 	movl   $0x103b52,(%esp)
  100d0b:	e8 38 f6 ff ff       	call   100348 <cprintf>
    
    cprintf("stack trackback:\n");
  100d10:	c7 04 24 54 3b 10 00 	movl   $0x103b54,(%esp)
  100d17:	e8 2c f6 ff ff       	call   100348 <cprintf>
    print_stackframe();
  100d1c:	e8 96 fc ff ff       	call   1009b7 <print_stackframe>
  100d21:	eb 01                	jmp    100d24 <__panic+0x6b>
        goto panic_dead;
  100d23:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  100d24:	e8 81 09 00 00       	call   1016aa <intr_disable>
    while (1) {
        kmonitor(NULL);
  100d29:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d30:	e8 9d fe ff ff       	call   100bd2 <kmonitor>
  100d35:	eb f2                	jmp    100d29 <__panic+0x70>

00100d37 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100d37:	55                   	push   %ebp
  100d38:	89 e5                	mov    %esp,%ebp
  100d3a:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d3d:	8d 45 14             	lea    0x14(%ebp),%eax
  100d40:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d43:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d46:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d4a:	8b 45 08             	mov    0x8(%ebp),%eax
  100d4d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d51:	c7 04 24 66 3b 10 00 	movl   $0x103b66,(%esp)
  100d58:	e8 eb f5 ff ff       	call   100348 <cprintf>
    vcprintf(fmt, ap);
  100d5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d60:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d64:	8b 45 10             	mov    0x10(%ebp),%eax
  100d67:	89 04 24             	mov    %eax,(%esp)
  100d6a:	e8 a4 f5 ff ff       	call   100313 <vcprintf>
    cprintf("\n");
  100d6f:	c7 04 24 52 3b 10 00 	movl   $0x103b52,(%esp)
  100d76:	e8 cd f5 ff ff       	call   100348 <cprintf>
    va_end(ap);
}
  100d7b:	90                   	nop
  100d7c:	89 ec                	mov    %ebp,%esp
  100d7e:	5d                   	pop    %ebp
  100d7f:	c3                   	ret    

00100d80 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d80:	55                   	push   %ebp
  100d81:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d83:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  100d88:	5d                   	pop    %ebp
  100d89:	c3                   	ret    

00100d8a <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d8a:	55                   	push   %ebp
  100d8b:	89 e5                	mov    %esp,%ebp
  100d8d:	83 ec 28             	sub    $0x28,%esp
  100d90:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100d96:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d9a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d9e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100da2:	ee                   	out    %al,(%dx)
}
  100da3:	90                   	nop
  100da4:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100daa:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dae:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100db2:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100db6:	ee                   	out    %al,(%dx)
}
  100db7:	90                   	nop
  100db8:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100dbe:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dc2:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100dc6:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100dca:	ee                   	out    %al,(%dx)
}
  100dcb:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100dcc:	c7 05 44 fe 10 00 00 	movl   $0x0,0x10fe44
  100dd3:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100dd6:	c7 04 24 84 3b 10 00 	movl   $0x103b84,(%esp)
  100ddd:	e8 66 f5 ff ff       	call   100348 <cprintf>
    pic_enable(IRQ_TIMER);
  100de2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100de9:	e8 21 09 00 00       	call   10170f <pic_enable>
}
  100dee:	90                   	nop
  100def:	89 ec                	mov    %ebp,%esp
  100df1:	5d                   	pop    %ebp
  100df2:	c3                   	ret    

00100df3 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100df3:	55                   	push   %ebp
  100df4:	89 e5                	mov    %esp,%ebp
  100df6:	83 ec 10             	sub    $0x10,%esp
  100df9:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dff:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e03:	89 c2                	mov    %eax,%edx
  100e05:	ec                   	in     (%dx),%al
  100e06:	88 45 f1             	mov    %al,-0xf(%ebp)
  100e09:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100e0f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100e13:	89 c2                	mov    %eax,%edx
  100e15:	ec                   	in     (%dx),%al
  100e16:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e19:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e1f:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e23:	89 c2                	mov    %eax,%edx
  100e25:	ec                   	in     (%dx),%al
  100e26:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e29:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e2f:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e33:	89 c2                	mov    %eax,%edx
  100e35:	ec                   	in     (%dx),%al
  100e36:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e39:	90                   	nop
  100e3a:	89 ec                	mov    %ebp,%esp
  100e3c:	5d                   	pop    %ebp
  100e3d:	c3                   	ret    

00100e3e <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e3e:	55                   	push   %ebp
  100e3f:	89 e5                	mov    %esp,%ebp
  100e41:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e44:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e4b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e4e:	0f b7 00             	movzwl (%eax),%eax
  100e51:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e55:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e58:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e5d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e60:	0f b7 00             	movzwl (%eax),%eax
  100e63:	0f b7 c0             	movzwl %ax,%eax
  100e66:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e6b:	74 12                	je     100e7f <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e6d:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e74:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100e7b:	b4 03 
  100e7d:	eb 13                	jmp    100e92 <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e7f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e82:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e86:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e89:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100e90:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e92:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100e99:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100e9d:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ea1:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ea5:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ea9:	ee                   	out    %al,(%dx)
}
  100eaa:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100eab:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100eb2:	40                   	inc    %eax
  100eb3:	0f b7 c0             	movzwl %ax,%eax
  100eb6:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100eba:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100ebe:	89 c2                	mov    %eax,%edx
  100ec0:	ec                   	in     (%dx),%al
  100ec1:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100ec4:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ec8:	0f b6 c0             	movzbl %al,%eax
  100ecb:	c1 e0 08             	shl    $0x8,%eax
  100ece:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100ed1:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ed8:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100edc:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ee0:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ee4:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100ee8:	ee                   	out    %al,(%dx)
}
  100ee9:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100eea:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ef1:	40                   	inc    %eax
  100ef2:	0f b7 c0             	movzwl %ax,%eax
  100ef5:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ef9:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100efd:	89 c2                	mov    %eax,%edx
  100eff:	ec                   	in     (%dx),%al
  100f00:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100f03:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f07:	0f b6 c0             	movzbl %al,%eax
  100f0a:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100f0d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f10:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100f15:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f18:	0f b7 c0             	movzwl %ax,%eax
  100f1b:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100f21:	90                   	nop
  100f22:	89 ec                	mov    %ebp,%esp
  100f24:	5d                   	pop    %ebp
  100f25:	c3                   	ret    

00100f26 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f26:	55                   	push   %ebp
  100f27:	89 e5                	mov    %esp,%ebp
  100f29:	83 ec 48             	sub    $0x48,%esp
  100f2c:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f32:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f36:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f3a:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f3e:	ee                   	out    %al,(%dx)
}
  100f3f:	90                   	nop
  100f40:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f46:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f4a:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f4e:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f52:	ee                   	out    %al,(%dx)
}
  100f53:	90                   	nop
  100f54:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f5a:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f5e:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f62:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f66:	ee                   	out    %al,(%dx)
}
  100f67:	90                   	nop
  100f68:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f6e:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f72:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f76:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f7a:	ee                   	out    %al,(%dx)
}
  100f7b:	90                   	nop
  100f7c:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100f82:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f86:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f8a:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f8e:	ee                   	out    %al,(%dx)
}
  100f8f:	90                   	nop
  100f90:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100f96:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f9a:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f9e:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100fa2:	ee                   	out    %al,(%dx)
}
  100fa3:	90                   	nop
  100fa4:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100faa:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fae:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100fb2:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100fb6:	ee                   	out    %al,(%dx)
}
  100fb7:	90                   	nop
  100fb8:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fbe:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100fc2:	89 c2                	mov    %eax,%edx
  100fc4:	ec                   	in     (%dx),%al
  100fc5:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100fc8:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100fcc:	3c ff                	cmp    $0xff,%al
  100fce:	0f 95 c0             	setne  %al
  100fd1:	0f b6 c0             	movzbl %al,%eax
  100fd4:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  100fd9:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fdf:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100fe3:	89 c2                	mov    %eax,%edx
  100fe5:	ec                   	in     (%dx),%al
  100fe6:	88 45 f1             	mov    %al,-0xf(%ebp)
  100fe9:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100fef:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100ff3:	89 c2                	mov    %eax,%edx
  100ff5:	ec                   	in     (%dx),%al
  100ff6:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100ff9:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  100ffe:	85 c0                	test   %eax,%eax
  101000:	74 0c                	je     10100e <serial_init+0xe8>
        pic_enable(IRQ_COM1);
  101002:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101009:	e8 01 07 00 00       	call   10170f <pic_enable>
    }
}
  10100e:	90                   	nop
  10100f:	89 ec                	mov    %ebp,%esp
  101011:	5d                   	pop    %ebp
  101012:	c3                   	ret    

00101013 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  101013:	55                   	push   %ebp
  101014:	89 e5                	mov    %esp,%ebp
  101016:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101019:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101020:	eb 08                	jmp    10102a <lpt_putc_sub+0x17>
        delay();
  101022:	e8 cc fd ff ff       	call   100df3 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101027:	ff 45 fc             	incl   -0x4(%ebp)
  10102a:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  101030:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101034:	89 c2                	mov    %eax,%edx
  101036:	ec                   	in     (%dx),%al
  101037:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10103a:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10103e:	84 c0                	test   %al,%al
  101040:	78 09                	js     10104b <lpt_putc_sub+0x38>
  101042:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101049:	7e d7                	jle    101022 <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  10104b:	8b 45 08             	mov    0x8(%ebp),%eax
  10104e:	0f b6 c0             	movzbl %al,%eax
  101051:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101057:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10105a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10105e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101062:	ee                   	out    %al,(%dx)
}
  101063:	90                   	nop
  101064:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  10106a:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10106e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101072:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101076:	ee                   	out    %al,(%dx)
}
  101077:	90                   	nop
  101078:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  10107e:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101082:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101086:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10108a:	ee                   	out    %al,(%dx)
}
  10108b:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10108c:	90                   	nop
  10108d:	89 ec                	mov    %ebp,%esp
  10108f:	5d                   	pop    %ebp
  101090:	c3                   	ret    

00101091 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101091:	55                   	push   %ebp
  101092:	89 e5                	mov    %esp,%ebp
  101094:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101097:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10109b:	74 0d                	je     1010aa <lpt_putc+0x19>
        lpt_putc_sub(c);
  10109d:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a0:	89 04 24             	mov    %eax,(%esp)
  1010a3:	e8 6b ff ff ff       	call   101013 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  1010a8:	eb 24                	jmp    1010ce <lpt_putc+0x3d>
        lpt_putc_sub('\b');
  1010aa:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010b1:	e8 5d ff ff ff       	call   101013 <lpt_putc_sub>
        lpt_putc_sub(' ');
  1010b6:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1010bd:	e8 51 ff ff ff       	call   101013 <lpt_putc_sub>
        lpt_putc_sub('\b');
  1010c2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010c9:	e8 45 ff ff ff       	call   101013 <lpt_putc_sub>
}
  1010ce:	90                   	nop
  1010cf:	89 ec                	mov    %ebp,%esp
  1010d1:	5d                   	pop    %ebp
  1010d2:	c3                   	ret    

001010d3 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  1010d3:	55                   	push   %ebp
  1010d4:	89 e5                	mov    %esp,%ebp
  1010d6:	83 ec 38             	sub    $0x38,%esp
  1010d9:	89 5d fc             	mov    %ebx,-0x4(%ebp)
    // set black on white
    if (!(c & ~0xFF)) {
  1010dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1010df:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010e4:	85 c0                	test   %eax,%eax
  1010e6:	75 07                	jne    1010ef <cga_putc+0x1c>
        c |= 0x0700;
  1010e8:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f2:	0f b6 c0             	movzbl %al,%eax
  1010f5:	83 f8 0d             	cmp    $0xd,%eax
  1010f8:	74 72                	je     10116c <cga_putc+0x99>
  1010fa:	83 f8 0d             	cmp    $0xd,%eax
  1010fd:	0f 8f a3 00 00 00    	jg     1011a6 <cga_putc+0xd3>
  101103:	83 f8 08             	cmp    $0x8,%eax
  101106:	74 0a                	je     101112 <cga_putc+0x3f>
  101108:	83 f8 0a             	cmp    $0xa,%eax
  10110b:	74 4c                	je     101159 <cga_putc+0x86>
  10110d:	e9 94 00 00 00       	jmp    1011a6 <cga_putc+0xd3>
    case '\b':
        if (crt_pos > 0) {
  101112:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101119:	85 c0                	test   %eax,%eax
  10111b:	0f 84 af 00 00 00    	je     1011d0 <cga_putc+0xfd>
            crt_pos --;
  101121:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101128:	48                   	dec    %eax
  101129:	0f b7 c0             	movzwl %ax,%eax
  10112c:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101132:	8b 45 08             	mov    0x8(%ebp),%eax
  101135:	98                   	cwtl   
  101136:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10113b:	98                   	cwtl   
  10113c:	83 c8 20             	or     $0x20,%eax
  10113f:	98                   	cwtl   
  101140:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  101146:	0f b7 15 64 fe 10 00 	movzwl 0x10fe64,%edx
  10114d:	01 d2                	add    %edx,%edx
  10114f:	01 ca                	add    %ecx,%edx
  101151:	0f b7 c0             	movzwl %ax,%eax
  101154:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101157:	eb 77                	jmp    1011d0 <cga_putc+0xfd>
    case '\n':
        crt_pos += CRT_COLS;
  101159:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101160:	83 c0 50             	add    $0x50,%eax
  101163:	0f b7 c0             	movzwl %ax,%eax
  101166:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  10116c:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  101173:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  10117a:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  10117f:	89 c8                	mov    %ecx,%eax
  101181:	f7 e2                	mul    %edx
  101183:	c1 ea 06             	shr    $0x6,%edx
  101186:	89 d0                	mov    %edx,%eax
  101188:	c1 e0 02             	shl    $0x2,%eax
  10118b:	01 d0                	add    %edx,%eax
  10118d:	c1 e0 04             	shl    $0x4,%eax
  101190:	29 c1                	sub    %eax,%ecx
  101192:	89 ca                	mov    %ecx,%edx
  101194:	0f b7 d2             	movzwl %dx,%edx
  101197:	89 d8                	mov    %ebx,%eax
  101199:	29 d0                	sub    %edx,%eax
  10119b:	0f b7 c0             	movzwl %ax,%eax
  10119e:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  1011a4:	eb 2b                	jmp    1011d1 <cga_putc+0xfe>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1011a6:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  1011ac:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011b3:	8d 50 01             	lea    0x1(%eax),%edx
  1011b6:	0f b7 d2             	movzwl %dx,%edx
  1011b9:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  1011c0:	01 c0                	add    %eax,%eax
  1011c2:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  1011c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1011c8:	0f b7 c0             	movzwl %ax,%eax
  1011cb:	66 89 02             	mov    %ax,(%edx)
        break;
  1011ce:	eb 01                	jmp    1011d1 <cga_putc+0xfe>
        break;
  1011d0:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  1011d1:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011d8:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  1011dd:	76 5e                	jbe    10123d <cga_putc+0x16a>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1011df:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1011e4:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1011ea:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1011ef:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1011f6:	00 
  1011f7:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011fb:	89 04 24             	mov    %eax,(%esp)
  1011fe:	e8 11 25 00 00       	call   103714 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101203:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  10120a:	eb 15                	jmp    101221 <cga_putc+0x14e>
            crt_buf[i] = 0x0700 | ' ';
  10120c:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  101212:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101215:	01 c0                	add    %eax,%eax
  101217:	01 d0                	add    %edx,%eax
  101219:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10121e:	ff 45 f4             	incl   -0xc(%ebp)
  101221:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101228:	7e e2                	jle    10120c <cga_putc+0x139>
        }
        crt_pos -= CRT_COLS;
  10122a:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101231:	83 e8 50             	sub    $0x50,%eax
  101234:	0f b7 c0             	movzwl %ax,%eax
  101237:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  10123d:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101244:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101248:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10124c:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101250:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101254:	ee                   	out    %al,(%dx)
}
  101255:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  101256:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10125d:	c1 e8 08             	shr    $0x8,%eax
  101260:	0f b7 c0             	movzwl %ax,%eax
  101263:	0f b6 c0             	movzbl %al,%eax
  101266:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  10126d:	42                   	inc    %edx
  10126e:	0f b7 d2             	movzwl %dx,%edx
  101271:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  101275:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101278:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10127c:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101280:	ee                   	out    %al,(%dx)
}
  101281:	90                   	nop
    outb(addr_6845, 15);
  101282:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101289:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  10128d:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101291:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101295:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101299:	ee                   	out    %al,(%dx)
}
  10129a:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  10129b:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1012a2:	0f b6 c0             	movzbl %al,%eax
  1012a5:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012ac:	42                   	inc    %edx
  1012ad:	0f b7 d2             	movzwl %dx,%edx
  1012b0:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  1012b4:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012b7:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1012bb:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1012bf:	ee                   	out    %al,(%dx)
}
  1012c0:	90                   	nop
}
  1012c1:	90                   	nop
  1012c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012c5:	89 ec                	mov    %ebp,%esp
  1012c7:	5d                   	pop    %ebp
  1012c8:	c3                   	ret    

001012c9 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  1012c9:	55                   	push   %ebp
  1012ca:	89 e5                	mov    %esp,%ebp
  1012cc:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1012cf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1012d6:	eb 08                	jmp    1012e0 <serial_putc_sub+0x17>
        delay();
  1012d8:	e8 16 fb ff ff       	call   100df3 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1012dd:	ff 45 fc             	incl   -0x4(%ebp)
  1012e0:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012e6:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1012ea:	89 c2                	mov    %eax,%edx
  1012ec:	ec                   	in     (%dx),%al
  1012ed:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1012f0:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1012f4:	0f b6 c0             	movzbl %al,%eax
  1012f7:	83 e0 20             	and    $0x20,%eax
  1012fa:	85 c0                	test   %eax,%eax
  1012fc:	75 09                	jne    101307 <serial_putc_sub+0x3e>
  1012fe:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101305:	7e d1                	jle    1012d8 <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  101307:	8b 45 08             	mov    0x8(%ebp),%eax
  10130a:	0f b6 c0             	movzbl %al,%eax
  10130d:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101313:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101316:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10131a:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10131e:	ee                   	out    %al,(%dx)
}
  10131f:	90                   	nop
}
  101320:	90                   	nop
  101321:	89 ec                	mov    %ebp,%esp
  101323:	5d                   	pop    %ebp
  101324:	c3                   	ret    

00101325 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101325:	55                   	push   %ebp
  101326:	89 e5                	mov    %esp,%ebp
  101328:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10132b:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10132f:	74 0d                	je     10133e <serial_putc+0x19>
        serial_putc_sub(c);
  101331:	8b 45 08             	mov    0x8(%ebp),%eax
  101334:	89 04 24             	mov    %eax,(%esp)
  101337:	e8 8d ff ff ff       	call   1012c9 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  10133c:	eb 24                	jmp    101362 <serial_putc+0x3d>
        serial_putc_sub('\b');
  10133e:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101345:	e8 7f ff ff ff       	call   1012c9 <serial_putc_sub>
        serial_putc_sub(' ');
  10134a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101351:	e8 73 ff ff ff       	call   1012c9 <serial_putc_sub>
        serial_putc_sub('\b');
  101356:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10135d:	e8 67 ff ff ff       	call   1012c9 <serial_putc_sub>
}
  101362:	90                   	nop
  101363:	89 ec                	mov    %ebp,%esp
  101365:	5d                   	pop    %ebp
  101366:	c3                   	ret    

00101367 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101367:	55                   	push   %ebp
  101368:	89 e5                	mov    %esp,%ebp
  10136a:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  10136d:	eb 33                	jmp    1013a2 <cons_intr+0x3b>
        if (c != 0) {
  10136f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101373:	74 2d                	je     1013a2 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101375:	a1 84 00 11 00       	mov    0x110084,%eax
  10137a:	8d 50 01             	lea    0x1(%eax),%edx
  10137d:	89 15 84 00 11 00    	mov    %edx,0x110084
  101383:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101386:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  10138c:	a1 84 00 11 00       	mov    0x110084,%eax
  101391:	3d 00 02 00 00       	cmp    $0x200,%eax
  101396:	75 0a                	jne    1013a2 <cons_intr+0x3b>
                cons.wpos = 0;
  101398:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  10139f:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1013a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1013a5:	ff d0                	call   *%eax
  1013a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1013aa:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1013ae:	75 bf                	jne    10136f <cons_intr+0x8>
            }
        }
    }
}
  1013b0:	90                   	nop
  1013b1:	90                   	nop
  1013b2:	89 ec                	mov    %ebp,%esp
  1013b4:	5d                   	pop    %ebp
  1013b5:	c3                   	ret    

001013b6 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1013b6:	55                   	push   %ebp
  1013b7:	89 e5                	mov    %esp,%ebp
  1013b9:	83 ec 10             	sub    $0x10,%esp
  1013bc:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013c2:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1013c6:	89 c2                	mov    %eax,%edx
  1013c8:	ec                   	in     (%dx),%al
  1013c9:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1013cc:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  1013d0:	0f b6 c0             	movzbl %al,%eax
  1013d3:	83 e0 01             	and    $0x1,%eax
  1013d6:	85 c0                	test   %eax,%eax
  1013d8:	75 07                	jne    1013e1 <serial_proc_data+0x2b>
        return -1;
  1013da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013df:	eb 2a                	jmp    10140b <serial_proc_data+0x55>
  1013e1:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013e7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1013eb:	89 c2                	mov    %eax,%edx
  1013ed:	ec                   	in     (%dx),%al
  1013ee:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  1013f1:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1013f5:	0f b6 c0             	movzbl %al,%eax
  1013f8:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1013fb:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1013ff:	75 07                	jne    101408 <serial_proc_data+0x52>
        c = '\b';
  101401:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101408:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10140b:	89 ec                	mov    %ebp,%esp
  10140d:	5d                   	pop    %ebp
  10140e:	c3                   	ret    

0010140f <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  10140f:	55                   	push   %ebp
  101410:	89 e5                	mov    %esp,%ebp
  101412:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  101415:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  10141a:	85 c0                	test   %eax,%eax
  10141c:	74 0c                	je     10142a <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  10141e:	c7 04 24 b6 13 10 00 	movl   $0x1013b6,(%esp)
  101425:	e8 3d ff ff ff       	call   101367 <cons_intr>
    }
}
  10142a:	90                   	nop
  10142b:	89 ec                	mov    %ebp,%esp
  10142d:	5d                   	pop    %ebp
  10142e:	c3                   	ret    

0010142f <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  10142f:	55                   	push   %ebp
  101430:	89 e5                	mov    %esp,%ebp
  101432:	83 ec 38             	sub    $0x38,%esp
  101435:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10143b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10143e:	89 c2                	mov    %eax,%edx
  101440:	ec                   	in     (%dx),%al
  101441:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  101444:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101448:	0f b6 c0             	movzbl %al,%eax
  10144b:	83 e0 01             	and    $0x1,%eax
  10144e:	85 c0                	test   %eax,%eax
  101450:	75 0a                	jne    10145c <kbd_proc_data+0x2d>
        return -1;
  101452:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101457:	e9 56 01 00 00       	jmp    1015b2 <kbd_proc_data+0x183>
  10145c:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101462:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101465:	89 c2                	mov    %eax,%edx
  101467:	ec                   	in     (%dx),%al
  101468:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  10146b:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  10146f:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101472:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101476:	75 17                	jne    10148f <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  101478:	a1 88 00 11 00       	mov    0x110088,%eax
  10147d:	83 c8 40             	or     $0x40,%eax
  101480:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  101485:	b8 00 00 00 00       	mov    $0x0,%eax
  10148a:	e9 23 01 00 00       	jmp    1015b2 <kbd_proc_data+0x183>
    } else if (data & 0x80) {
  10148f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101493:	84 c0                	test   %al,%al
  101495:	79 45                	jns    1014dc <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101497:	a1 88 00 11 00       	mov    0x110088,%eax
  10149c:	83 e0 40             	and    $0x40,%eax
  10149f:	85 c0                	test   %eax,%eax
  1014a1:	75 08                	jne    1014ab <kbd_proc_data+0x7c>
  1014a3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014a7:	24 7f                	and    $0x7f,%al
  1014a9:	eb 04                	jmp    1014af <kbd_proc_data+0x80>
  1014ab:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014af:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1014b2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014b6:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  1014bd:	0c 40                	or     $0x40,%al
  1014bf:	0f b6 c0             	movzbl %al,%eax
  1014c2:	f7 d0                	not    %eax
  1014c4:	89 c2                	mov    %eax,%edx
  1014c6:	a1 88 00 11 00       	mov    0x110088,%eax
  1014cb:	21 d0                	and    %edx,%eax
  1014cd:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  1014d2:	b8 00 00 00 00       	mov    $0x0,%eax
  1014d7:	e9 d6 00 00 00       	jmp    1015b2 <kbd_proc_data+0x183>
    } else if (shift & E0ESC) {
  1014dc:	a1 88 00 11 00       	mov    0x110088,%eax
  1014e1:	83 e0 40             	and    $0x40,%eax
  1014e4:	85 c0                	test   %eax,%eax
  1014e6:	74 11                	je     1014f9 <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  1014e8:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  1014ec:	a1 88 00 11 00       	mov    0x110088,%eax
  1014f1:	83 e0 bf             	and    $0xffffffbf,%eax
  1014f4:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  1014f9:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014fd:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  101504:	0f b6 d0             	movzbl %al,%edx
  101507:	a1 88 00 11 00       	mov    0x110088,%eax
  10150c:	09 d0                	or     %edx,%eax
  10150e:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  101513:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101517:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  10151e:	0f b6 d0             	movzbl %al,%edx
  101521:	a1 88 00 11 00       	mov    0x110088,%eax
  101526:	31 d0                	xor    %edx,%eax
  101528:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  10152d:	a1 88 00 11 00       	mov    0x110088,%eax
  101532:	83 e0 03             	and    $0x3,%eax
  101535:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  10153c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101540:	01 d0                	add    %edx,%eax
  101542:	0f b6 00             	movzbl (%eax),%eax
  101545:	0f b6 c0             	movzbl %al,%eax
  101548:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  10154b:	a1 88 00 11 00       	mov    0x110088,%eax
  101550:	83 e0 08             	and    $0x8,%eax
  101553:	85 c0                	test   %eax,%eax
  101555:	74 22                	je     101579 <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  101557:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  10155b:	7e 0c                	jle    101569 <kbd_proc_data+0x13a>
  10155d:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  101561:	7f 06                	jg     101569 <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  101563:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101567:	eb 10                	jmp    101579 <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  101569:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  10156d:	7e 0a                	jle    101579 <kbd_proc_data+0x14a>
  10156f:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101573:	7f 04                	jg     101579 <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  101575:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101579:	a1 88 00 11 00       	mov    0x110088,%eax
  10157e:	f7 d0                	not    %eax
  101580:	83 e0 06             	and    $0x6,%eax
  101583:	85 c0                	test   %eax,%eax
  101585:	75 28                	jne    1015af <kbd_proc_data+0x180>
  101587:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10158e:	75 1f                	jne    1015af <kbd_proc_data+0x180>
        cprintf("Rebooting!\n");
  101590:	c7 04 24 9f 3b 10 00 	movl   $0x103b9f,(%esp)
  101597:	e8 ac ed ff ff       	call   100348 <cprintf>
  10159c:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1015a2:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015a6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1015aa:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1015ad:	ee                   	out    %al,(%dx)
}
  1015ae:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1015af:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1015b2:	89 ec                	mov    %ebp,%esp
  1015b4:	5d                   	pop    %ebp
  1015b5:	c3                   	ret    

001015b6 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1015b6:	55                   	push   %ebp
  1015b7:	89 e5                	mov    %esp,%ebp
  1015b9:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  1015bc:	c7 04 24 2f 14 10 00 	movl   $0x10142f,(%esp)
  1015c3:	e8 9f fd ff ff       	call   101367 <cons_intr>
}
  1015c8:	90                   	nop
  1015c9:	89 ec                	mov    %ebp,%esp
  1015cb:	5d                   	pop    %ebp
  1015cc:	c3                   	ret    

001015cd <kbd_init>:

static void
kbd_init(void) {
  1015cd:	55                   	push   %ebp
  1015ce:	89 e5                	mov    %esp,%ebp
  1015d0:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  1015d3:	e8 de ff ff ff       	call   1015b6 <kbd_intr>
    pic_enable(IRQ_KBD);
  1015d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1015df:	e8 2b 01 00 00       	call   10170f <pic_enable>
}
  1015e4:	90                   	nop
  1015e5:	89 ec                	mov    %ebp,%esp
  1015e7:	5d                   	pop    %ebp
  1015e8:	c3                   	ret    

001015e9 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  1015e9:	55                   	push   %ebp
  1015ea:	89 e5                	mov    %esp,%ebp
  1015ec:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  1015ef:	e8 4a f8 ff ff       	call   100e3e <cga_init>
    serial_init();
  1015f4:	e8 2d f9 ff ff       	call   100f26 <serial_init>
    kbd_init();
  1015f9:	e8 cf ff ff ff       	call   1015cd <kbd_init>
    if (!serial_exists) {
  1015fe:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101603:	85 c0                	test   %eax,%eax
  101605:	75 0c                	jne    101613 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  101607:	c7 04 24 ab 3b 10 00 	movl   $0x103bab,(%esp)
  10160e:	e8 35 ed ff ff       	call   100348 <cprintf>
    }
}
  101613:	90                   	nop
  101614:	89 ec                	mov    %ebp,%esp
  101616:	5d                   	pop    %ebp
  101617:	c3                   	ret    

00101618 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101618:	55                   	push   %ebp
  101619:	89 e5                	mov    %esp,%ebp
  10161b:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  10161e:	8b 45 08             	mov    0x8(%ebp),%eax
  101621:	89 04 24             	mov    %eax,(%esp)
  101624:	e8 68 fa ff ff       	call   101091 <lpt_putc>
    cga_putc(c);
  101629:	8b 45 08             	mov    0x8(%ebp),%eax
  10162c:	89 04 24             	mov    %eax,(%esp)
  10162f:	e8 9f fa ff ff       	call   1010d3 <cga_putc>
    serial_putc(c);
  101634:	8b 45 08             	mov    0x8(%ebp),%eax
  101637:	89 04 24             	mov    %eax,(%esp)
  10163a:	e8 e6 fc ff ff       	call   101325 <serial_putc>
}
  10163f:	90                   	nop
  101640:	89 ec                	mov    %ebp,%esp
  101642:	5d                   	pop    %ebp
  101643:	c3                   	ret    

00101644 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101644:	55                   	push   %ebp
  101645:	89 e5                	mov    %esp,%ebp
  101647:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  10164a:	e8 c0 fd ff ff       	call   10140f <serial_intr>
    kbd_intr();
  10164f:	e8 62 ff ff ff       	call   1015b6 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  101654:	8b 15 80 00 11 00    	mov    0x110080,%edx
  10165a:	a1 84 00 11 00       	mov    0x110084,%eax
  10165f:	39 c2                	cmp    %eax,%edx
  101661:	74 36                	je     101699 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  101663:	a1 80 00 11 00       	mov    0x110080,%eax
  101668:	8d 50 01             	lea    0x1(%eax),%edx
  10166b:	89 15 80 00 11 00    	mov    %edx,0x110080
  101671:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  101678:	0f b6 c0             	movzbl %al,%eax
  10167b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  10167e:	a1 80 00 11 00       	mov    0x110080,%eax
  101683:	3d 00 02 00 00       	cmp    $0x200,%eax
  101688:	75 0a                	jne    101694 <cons_getc+0x50>
            cons.rpos = 0;
  10168a:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  101691:	00 00 00 
        }
        return c;
  101694:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101697:	eb 05                	jmp    10169e <cons_getc+0x5a>
    }
    return 0;
  101699:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10169e:	89 ec                	mov    %ebp,%esp
  1016a0:	5d                   	pop    %ebp
  1016a1:	c3                   	ret    

001016a2 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1016a2:	55                   	push   %ebp
  1016a3:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1016a5:	fb                   	sti    
}
  1016a6:	90                   	nop
    sti();
}
  1016a7:	90                   	nop
  1016a8:	5d                   	pop    %ebp
  1016a9:	c3                   	ret    

001016aa <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1016aa:	55                   	push   %ebp
  1016ab:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  1016ad:	fa                   	cli    
}
  1016ae:	90                   	nop
    cli();
}
  1016af:	90                   	nop
  1016b0:	5d                   	pop    %ebp
  1016b1:	c3                   	ret    

001016b2 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1016b2:	55                   	push   %ebp
  1016b3:	89 e5                	mov    %esp,%ebp
  1016b5:	83 ec 14             	sub    $0x14,%esp
  1016b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1016bb:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  1016bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1016c2:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  1016c8:	a1 8c 00 11 00       	mov    0x11008c,%eax
  1016cd:	85 c0                	test   %eax,%eax
  1016cf:	74 39                	je     10170a <pic_setmask+0x58>
        outb(IO_PIC1 + 1, mask);
  1016d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1016d4:	0f b6 c0             	movzbl %al,%eax
  1016d7:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  1016dd:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016e0:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016e4:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016e8:	ee                   	out    %al,(%dx)
}
  1016e9:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  1016ea:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1016ee:	c1 e8 08             	shr    $0x8,%eax
  1016f1:	0f b7 c0             	movzwl %ax,%eax
  1016f4:	0f b6 c0             	movzbl %al,%eax
  1016f7:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  1016fd:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101700:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101704:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101708:	ee                   	out    %al,(%dx)
}
  101709:	90                   	nop
    }
}
  10170a:	90                   	nop
  10170b:	89 ec                	mov    %ebp,%esp
  10170d:	5d                   	pop    %ebp
  10170e:	c3                   	ret    

0010170f <pic_enable>:

void
pic_enable(unsigned int irq) {
  10170f:	55                   	push   %ebp
  101710:	89 e5                	mov    %esp,%ebp
  101712:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101715:	8b 45 08             	mov    0x8(%ebp),%eax
  101718:	ba 01 00 00 00       	mov    $0x1,%edx
  10171d:	88 c1                	mov    %al,%cl
  10171f:	d3 e2                	shl    %cl,%edx
  101721:	89 d0                	mov    %edx,%eax
  101723:	98                   	cwtl   
  101724:	f7 d0                	not    %eax
  101726:	0f bf d0             	movswl %ax,%edx
  101729:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101730:	98                   	cwtl   
  101731:	21 d0                	and    %edx,%eax
  101733:	98                   	cwtl   
  101734:	0f b7 c0             	movzwl %ax,%eax
  101737:	89 04 24             	mov    %eax,(%esp)
  10173a:	e8 73 ff ff ff       	call   1016b2 <pic_setmask>
}
  10173f:	90                   	nop
  101740:	89 ec                	mov    %ebp,%esp
  101742:	5d                   	pop    %ebp
  101743:	c3                   	ret    

00101744 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101744:	55                   	push   %ebp
  101745:	89 e5                	mov    %esp,%ebp
  101747:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  10174a:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  101751:	00 00 00 
  101754:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  10175a:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10175e:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  101762:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  101766:	ee                   	out    %al,(%dx)
}
  101767:	90                   	nop
  101768:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  10176e:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101772:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  101776:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  10177a:	ee                   	out    %al,(%dx)
}
  10177b:	90                   	nop
  10177c:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101782:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101786:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  10178a:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  10178e:	ee                   	out    %al,(%dx)
}
  10178f:	90                   	nop
  101790:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  101796:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10179a:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10179e:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1017a2:	ee                   	out    %al,(%dx)
}
  1017a3:	90                   	nop
  1017a4:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  1017aa:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ae:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1017b2:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  1017b6:	ee                   	out    %al,(%dx)
}
  1017b7:	90                   	nop
  1017b8:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  1017be:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017c2:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  1017c6:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  1017ca:	ee                   	out    %al,(%dx)
}
  1017cb:	90                   	nop
  1017cc:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  1017d2:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017d6:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  1017da:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  1017de:	ee                   	out    %al,(%dx)
}
  1017df:	90                   	nop
  1017e0:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  1017e6:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ea:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1017ee:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1017f2:	ee                   	out    %al,(%dx)
}
  1017f3:	90                   	nop
  1017f4:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  1017fa:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017fe:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101802:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101806:	ee                   	out    %al,(%dx)
}
  101807:	90                   	nop
  101808:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10180e:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101812:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101816:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10181a:	ee                   	out    %al,(%dx)
}
  10181b:	90                   	nop
  10181c:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  101822:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101826:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10182a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10182e:	ee                   	out    %al,(%dx)
}
  10182f:	90                   	nop
  101830:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101836:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10183a:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10183e:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101842:	ee                   	out    %al,(%dx)
}
  101843:	90                   	nop
  101844:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  10184a:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10184e:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101852:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101856:	ee                   	out    %al,(%dx)
}
  101857:	90                   	nop
  101858:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  10185e:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101862:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101866:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10186a:	ee                   	out    %al,(%dx)
}
  10186b:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  10186c:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101873:	3d ff ff 00 00       	cmp    $0xffff,%eax
  101878:	74 0f                	je     101889 <pic_init+0x145>
        pic_setmask(irq_mask);
  10187a:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101881:	89 04 24             	mov    %eax,(%esp)
  101884:	e8 29 fe ff ff       	call   1016b2 <pic_setmask>
    }
}
  101889:	90                   	nop
  10188a:	89 ec                	mov    %ebp,%esp
  10188c:	5d                   	pop    %ebp
  10188d:	c3                   	ret    

0010188e <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  10188e:	55                   	push   %ebp
  10188f:	89 e5                	mov    %esp,%ebp
  101891:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  101894:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  10189b:	00 
  10189c:	c7 04 24 e0 3b 10 00 	movl   $0x103be0,(%esp)
  1018a3:	e8 a0 ea ff ff       	call   100348 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  1018a8:	90                   	nop
  1018a9:	89 ec                	mov    %ebp,%esp
  1018ab:	5d                   	pop    %ebp
  1018ac:	c3                   	ret    

001018ad <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1018ad:	55                   	push   %ebp
  1018ae:	89 e5                	mov    %esp,%ebp
  1018b0:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
      
    extern uintptr_t __vectors[];
    for(int i = 0; i < 256; i++)
  1018b3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1018ba:	e9 c4 00 00 00       	jmp    101983 <idt_init+0xd6>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  1018bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018c2:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  1018c9:	0f b7 d0             	movzwl %ax,%edx
  1018cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018cf:	66 89 14 c5 c0 00 11 	mov    %dx,0x1100c0(,%eax,8)
  1018d6:	00 
  1018d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018da:	66 c7 04 c5 c2 00 11 	movw   $0x8,0x1100c2(,%eax,8)
  1018e1:	00 08 00 
  1018e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018e7:	0f b6 14 c5 c4 00 11 	movzbl 0x1100c4(,%eax,8),%edx
  1018ee:	00 
  1018ef:	80 e2 e0             	and    $0xe0,%dl
  1018f2:	88 14 c5 c4 00 11 00 	mov    %dl,0x1100c4(,%eax,8)
  1018f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018fc:	0f b6 14 c5 c4 00 11 	movzbl 0x1100c4(,%eax,8),%edx
  101903:	00 
  101904:	80 e2 1f             	and    $0x1f,%dl
  101907:	88 14 c5 c4 00 11 00 	mov    %dl,0x1100c4(,%eax,8)
  10190e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101911:	0f b6 14 c5 c5 00 11 	movzbl 0x1100c5(,%eax,8),%edx
  101918:	00 
  101919:	80 e2 f0             	and    $0xf0,%dl
  10191c:	80 ca 0e             	or     $0xe,%dl
  10191f:	88 14 c5 c5 00 11 00 	mov    %dl,0x1100c5(,%eax,8)
  101926:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101929:	0f b6 14 c5 c5 00 11 	movzbl 0x1100c5(,%eax,8),%edx
  101930:	00 
  101931:	80 e2 ef             	and    $0xef,%dl
  101934:	88 14 c5 c5 00 11 00 	mov    %dl,0x1100c5(,%eax,8)
  10193b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10193e:	0f b6 14 c5 c5 00 11 	movzbl 0x1100c5(,%eax,8),%edx
  101945:	00 
  101946:	80 e2 9f             	and    $0x9f,%dl
  101949:	88 14 c5 c5 00 11 00 	mov    %dl,0x1100c5(,%eax,8)
  101950:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101953:	0f b6 14 c5 c5 00 11 	movzbl 0x1100c5(,%eax,8),%edx
  10195a:	00 
  10195b:	80 ca 80             	or     $0x80,%dl
  10195e:	88 14 c5 c5 00 11 00 	mov    %dl,0x1100c5(,%eax,8)
  101965:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101968:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  10196f:	c1 e8 10             	shr    $0x10,%eax
  101972:	0f b7 d0             	movzwl %ax,%edx
  101975:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101978:	66 89 14 c5 c6 00 11 	mov    %dx,0x1100c6(,%eax,8)
  10197f:	00 
    for(int i = 0; i < 256; i++)
  101980:	ff 45 fc             	incl   -0x4(%ebp)
  101983:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  10198a:	0f 8e 2f ff ff ff    	jle    1018bf <idt_init+0x12>
    SETGATE(idt[T_SWITCH_TOK], 1, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  101990:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101995:	0f b7 c0             	movzwl %ax,%eax
  101998:	66 a3 88 04 11 00    	mov    %ax,0x110488
  10199e:	66 c7 05 8a 04 11 00 	movw   $0x8,0x11048a
  1019a5:	08 00 
  1019a7:	0f b6 05 8c 04 11 00 	movzbl 0x11048c,%eax
  1019ae:	24 e0                	and    $0xe0,%al
  1019b0:	a2 8c 04 11 00       	mov    %al,0x11048c
  1019b5:	0f b6 05 8c 04 11 00 	movzbl 0x11048c,%eax
  1019bc:	24 1f                	and    $0x1f,%al
  1019be:	a2 8c 04 11 00       	mov    %al,0x11048c
  1019c3:	0f b6 05 8d 04 11 00 	movzbl 0x11048d,%eax
  1019ca:	0c 0f                	or     $0xf,%al
  1019cc:	a2 8d 04 11 00       	mov    %al,0x11048d
  1019d1:	0f b6 05 8d 04 11 00 	movzbl 0x11048d,%eax
  1019d8:	24 ef                	and    $0xef,%al
  1019da:	a2 8d 04 11 00       	mov    %al,0x11048d
  1019df:	0f b6 05 8d 04 11 00 	movzbl 0x11048d,%eax
  1019e6:	0c 60                	or     $0x60,%al
  1019e8:	a2 8d 04 11 00       	mov    %al,0x11048d
  1019ed:	0f b6 05 8d 04 11 00 	movzbl 0x11048d,%eax
  1019f4:	0c 80                	or     $0x80,%al
  1019f6:	a2 8d 04 11 00       	mov    %al,0x11048d
  1019fb:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101a00:	c1 e8 10             	shr    $0x10,%eax
  101a03:	0f b7 c0             	movzwl %ax,%eax
  101a06:	66 a3 8e 04 11 00    	mov    %ax,0x11048e
  101a0c:	c7 45 f8 60 f5 10 00 	movl   $0x10f560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  101a13:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a16:	0f 01 18             	lidtl  (%eax)
}
  101a19:	90                   	nop
    lidt(&idt_pd);
}
  101a1a:	90                   	nop
  101a1b:	89 ec                	mov    %ebp,%esp
  101a1d:	5d                   	pop    %ebp
  101a1e:	c3                   	ret    

00101a1f <trapname>:

static const char *
trapname(int trapno) {
  101a1f:	55                   	push   %ebp
  101a20:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101a22:	8b 45 08             	mov    0x8(%ebp),%eax
  101a25:	83 f8 13             	cmp    $0x13,%eax
  101a28:	77 0c                	ja     101a36 <trapname+0x17>
        return excnames[trapno];
  101a2a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2d:	8b 04 85 60 3f 10 00 	mov    0x103f60(,%eax,4),%eax
  101a34:	eb 18                	jmp    101a4e <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101a36:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101a3a:	7e 0d                	jle    101a49 <trapname+0x2a>
  101a3c:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101a40:	7f 07                	jg     101a49 <trapname+0x2a>
        return "Hardware Interrupt";
  101a42:	b8 ea 3b 10 00       	mov    $0x103bea,%eax
  101a47:	eb 05                	jmp    101a4e <trapname+0x2f>
    }
    return "(unknown trap)";
  101a49:	b8 fd 3b 10 00       	mov    $0x103bfd,%eax
}
  101a4e:	5d                   	pop    %ebp
  101a4f:	c3                   	ret    

00101a50 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101a50:	55                   	push   %ebp
  101a51:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101a53:	8b 45 08             	mov    0x8(%ebp),%eax
  101a56:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a5a:	83 f8 08             	cmp    $0x8,%eax
  101a5d:	0f 94 c0             	sete   %al
  101a60:	0f b6 c0             	movzbl %al,%eax
}
  101a63:	5d                   	pop    %ebp
  101a64:	c3                   	ret    

00101a65 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101a65:	55                   	push   %ebp
  101a66:	89 e5                	mov    %esp,%ebp
  101a68:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101a6b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a6e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a72:	c7 04 24 3e 3c 10 00 	movl   $0x103c3e,(%esp)
  101a79:	e8 ca e8 ff ff       	call   100348 <cprintf>
    print_regs(&tf->tf_regs);
  101a7e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a81:	89 04 24             	mov    %eax,(%esp)
  101a84:	e8 8f 01 00 00       	call   101c18 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a89:	8b 45 08             	mov    0x8(%ebp),%eax
  101a8c:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a90:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a94:	c7 04 24 4f 3c 10 00 	movl   $0x103c4f,(%esp)
  101a9b:	e8 a8 e8 ff ff       	call   100348 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101aa0:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa3:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101aa7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aab:	c7 04 24 62 3c 10 00 	movl   $0x103c62,(%esp)
  101ab2:	e8 91 e8 ff ff       	call   100348 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101ab7:	8b 45 08             	mov    0x8(%ebp),%eax
  101aba:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101abe:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac2:	c7 04 24 75 3c 10 00 	movl   $0x103c75,(%esp)
  101ac9:	e8 7a e8 ff ff       	call   100348 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101ace:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad1:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101ad5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ad9:	c7 04 24 88 3c 10 00 	movl   $0x103c88,(%esp)
  101ae0:	e8 63 e8 ff ff       	call   100348 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101ae5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae8:	8b 40 30             	mov    0x30(%eax),%eax
  101aeb:	89 04 24             	mov    %eax,(%esp)
  101aee:	e8 2c ff ff ff       	call   101a1f <trapname>
  101af3:	8b 55 08             	mov    0x8(%ebp),%edx
  101af6:	8b 52 30             	mov    0x30(%edx),%edx
  101af9:	89 44 24 08          	mov    %eax,0x8(%esp)
  101afd:	89 54 24 04          	mov    %edx,0x4(%esp)
  101b01:	c7 04 24 9b 3c 10 00 	movl   $0x103c9b,(%esp)
  101b08:	e8 3b e8 ff ff       	call   100348 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101b0d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b10:	8b 40 34             	mov    0x34(%eax),%eax
  101b13:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b17:	c7 04 24 ad 3c 10 00 	movl   $0x103cad,(%esp)
  101b1e:	e8 25 e8 ff ff       	call   100348 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101b23:	8b 45 08             	mov    0x8(%ebp),%eax
  101b26:	8b 40 38             	mov    0x38(%eax),%eax
  101b29:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b2d:	c7 04 24 bc 3c 10 00 	movl   $0x103cbc,(%esp)
  101b34:	e8 0f e8 ff ff       	call   100348 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101b39:	8b 45 08             	mov    0x8(%ebp),%eax
  101b3c:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b40:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b44:	c7 04 24 cb 3c 10 00 	movl   $0x103ccb,(%esp)
  101b4b:	e8 f8 e7 ff ff       	call   100348 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101b50:	8b 45 08             	mov    0x8(%ebp),%eax
  101b53:	8b 40 40             	mov    0x40(%eax),%eax
  101b56:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b5a:	c7 04 24 de 3c 10 00 	movl   $0x103cde,(%esp)
  101b61:	e8 e2 e7 ff ff       	call   100348 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b66:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101b6d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101b74:	eb 3d                	jmp    101bb3 <print_trapframe+0x14e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101b76:	8b 45 08             	mov    0x8(%ebp),%eax
  101b79:	8b 50 40             	mov    0x40(%eax),%edx
  101b7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b7f:	21 d0                	and    %edx,%eax
  101b81:	85 c0                	test   %eax,%eax
  101b83:	74 28                	je     101bad <print_trapframe+0x148>
  101b85:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b88:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101b8f:	85 c0                	test   %eax,%eax
  101b91:	74 1a                	je     101bad <print_trapframe+0x148>
            cprintf("%s,", IA32flags[i]);
  101b93:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b96:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101b9d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ba1:	c7 04 24 ed 3c 10 00 	movl   $0x103ced,(%esp)
  101ba8:	e8 9b e7 ff ff       	call   100348 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101bad:	ff 45 f4             	incl   -0xc(%ebp)
  101bb0:	d1 65 f0             	shll   -0x10(%ebp)
  101bb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101bb6:	83 f8 17             	cmp    $0x17,%eax
  101bb9:	76 bb                	jbe    101b76 <print_trapframe+0x111>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101bbb:	8b 45 08             	mov    0x8(%ebp),%eax
  101bbe:	8b 40 40             	mov    0x40(%eax),%eax
  101bc1:	c1 e8 0c             	shr    $0xc,%eax
  101bc4:	83 e0 03             	and    $0x3,%eax
  101bc7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bcb:	c7 04 24 f1 3c 10 00 	movl   $0x103cf1,(%esp)
  101bd2:	e8 71 e7 ff ff       	call   100348 <cprintf>

    if (!trap_in_kernel(tf)) {
  101bd7:	8b 45 08             	mov    0x8(%ebp),%eax
  101bda:	89 04 24             	mov    %eax,(%esp)
  101bdd:	e8 6e fe ff ff       	call   101a50 <trap_in_kernel>
  101be2:	85 c0                	test   %eax,%eax
  101be4:	75 2d                	jne    101c13 <print_trapframe+0x1ae>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101be6:	8b 45 08             	mov    0x8(%ebp),%eax
  101be9:	8b 40 44             	mov    0x44(%eax),%eax
  101bec:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bf0:	c7 04 24 fa 3c 10 00 	movl   $0x103cfa,(%esp)
  101bf7:	e8 4c e7 ff ff       	call   100348 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101bfc:	8b 45 08             	mov    0x8(%ebp),%eax
  101bff:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101c03:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c07:	c7 04 24 09 3d 10 00 	movl   $0x103d09,(%esp)
  101c0e:	e8 35 e7 ff ff       	call   100348 <cprintf>
    }
}
  101c13:	90                   	nop
  101c14:	89 ec                	mov    %ebp,%esp
  101c16:	5d                   	pop    %ebp
  101c17:	c3                   	ret    

00101c18 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101c18:	55                   	push   %ebp
  101c19:	89 e5                	mov    %esp,%ebp
  101c1b:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101c1e:	8b 45 08             	mov    0x8(%ebp),%eax
  101c21:	8b 00                	mov    (%eax),%eax
  101c23:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c27:	c7 04 24 1c 3d 10 00 	movl   $0x103d1c,(%esp)
  101c2e:	e8 15 e7 ff ff       	call   100348 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101c33:	8b 45 08             	mov    0x8(%ebp),%eax
  101c36:	8b 40 04             	mov    0x4(%eax),%eax
  101c39:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c3d:	c7 04 24 2b 3d 10 00 	movl   $0x103d2b,(%esp)
  101c44:	e8 ff e6 ff ff       	call   100348 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101c49:	8b 45 08             	mov    0x8(%ebp),%eax
  101c4c:	8b 40 08             	mov    0x8(%eax),%eax
  101c4f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c53:	c7 04 24 3a 3d 10 00 	movl   $0x103d3a,(%esp)
  101c5a:	e8 e9 e6 ff ff       	call   100348 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101c5f:	8b 45 08             	mov    0x8(%ebp),%eax
  101c62:	8b 40 0c             	mov    0xc(%eax),%eax
  101c65:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c69:	c7 04 24 49 3d 10 00 	movl   $0x103d49,(%esp)
  101c70:	e8 d3 e6 ff ff       	call   100348 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c75:	8b 45 08             	mov    0x8(%ebp),%eax
  101c78:	8b 40 10             	mov    0x10(%eax),%eax
  101c7b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c7f:	c7 04 24 58 3d 10 00 	movl   $0x103d58,(%esp)
  101c86:	e8 bd e6 ff ff       	call   100348 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c8b:	8b 45 08             	mov    0x8(%ebp),%eax
  101c8e:	8b 40 14             	mov    0x14(%eax),%eax
  101c91:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c95:	c7 04 24 67 3d 10 00 	movl   $0x103d67,(%esp)
  101c9c:	e8 a7 e6 ff ff       	call   100348 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101ca1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ca4:	8b 40 18             	mov    0x18(%eax),%eax
  101ca7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cab:	c7 04 24 76 3d 10 00 	movl   $0x103d76,(%esp)
  101cb2:	e8 91 e6 ff ff       	call   100348 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101cb7:	8b 45 08             	mov    0x8(%ebp),%eax
  101cba:	8b 40 1c             	mov    0x1c(%eax),%eax
  101cbd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cc1:	c7 04 24 85 3d 10 00 	movl   $0x103d85,(%esp)
  101cc8:	e8 7b e6 ff ff       	call   100348 <cprintf>
}
  101ccd:	90                   	nop
  101cce:	89 ec                	mov    %ebp,%esp
  101cd0:	5d                   	pop    %ebp
  101cd1:	c3                   	ret    

00101cd2 <trap_dispatch>:

volatile bool to_print_status;
/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101cd2:	55                   	push   %ebp
  101cd3:	89 e5                	mov    %esp,%ebp
  101cd5:	57                   	push   %edi
  101cd6:	56                   	push   %esi
  101cd7:	53                   	push   %ebx
  101cd8:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
    char c;

    switch (tf->tf_trapno) {
  101cde:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce1:	8b 40 30             	mov    0x30(%eax),%eax
  101ce4:	83 f8 79             	cmp    $0x79,%eax
  101ce7:	0f 84 19 03 00 00    	je     102006 <trap_dispatch+0x334>
  101ced:	83 f8 79             	cmp    $0x79,%eax
  101cf0:	0f 87 09 04 00 00    	ja     1020ff <trap_dispatch+0x42d>
  101cf6:	83 f8 78             	cmp    $0x78,%eax
  101cf9:	0f 84 75 02 00 00    	je     101f74 <trap_dispatch+0x2a2>
  101cff:	83 f8 78             	cmp    $0x78,%eax
  101d02:	0f 87 f7 03 00 00    	ja     1020ff <trap_dispatch+0x42d>
  101d08:	83 f8 2f             	cmp    $0x2f,%eax
  101d0b:	0f 87 ee 03 00 00    	ja     1020ff <trap_dispatch+0x42d>
  101d11:	83 f8 2e             	cmp    $0x2e,%eax
  101d14:	0f 83 1a 04 00 00    	jae    102134 <trap_dispatch+0x462>
  101d1a:	83 f8 24             	cmp    $0x24,%eax
  101d1d:	74 5e                	je     101d7d <trap_dispatch+0xab>
  101d1f:	83 f8 24             	cmp    $0x24,%eax
  101d22:	0f 87 d7 03 00 00    	ja     1020ff <trap_dispatch+0x42d>
  101d28:	83 f8 20             	cmp    $0x20,%eax
  101d2b:	74 0a                	je     101d37 <trap_dispatch+0x65>
  101d2d:	83 f8 21             	cmp    $0x21,%eax
  101d30:	74 74                	je     101da6 <trap_dispatch+0xd4>
  101d32:	e9 c8 03 00 00       	jmp    1020ff <trap_dispatch+0x42d>
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        extern volatile size_t ticks;
        ticks++;
  101d37:	a1 44 fe 10 00       	mov    0x10fe44,%eax
  101d3c:	40                   	inc    %eax
  101d3d:	a3 44 fe 10 00       	mov    %eax,0x10fe44
        if(ticks % TICK_NUM == 0)
  101d42:	8b 0d 44 fe 10 00    	mov    0x10fe44,%ecx
  101d48:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101d4d:	89 c8                	mov    %ecx,%eax
  101d4f:	f7 e2                	mul    %edx
  101d51:	c1 ea 05             	shr    $0x5,%edx
  101d54:	89 d0                	mov    %edx,%eax
  101d56:	c1 e0 02             	shl    $0x2,%eax
  101d59:	01 d0                	add    %edx,%eax
  101d5b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101d62:	01 d0                	add    %edx,%eax
  101d64:	c1 e0 02             	shl    $0x2,%eax
  101d67:	29 c1                	sub    %eax,%ecx
  101d69:	89 ca                	mov    %ecx,%edx
  101d6b:	85 d2                	test   %edx,%edx
  101d6d:	0f 85 c4 03 00 00    	jne    102137 <trap_dispatch+0x465>
	        print_ticks();
  101d73:	e8 16 fb ff ff       	call   10188e <print_ticks>
        break;
  101d78:	e9 ba 03 00 00       	jmp    102137 <trap_dispatch+0x465>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101d7d:	e8 c2 f8 ff ff       	call   101644 <cons_getc>
  101d82:	88 45 e3             	mov    %al,-0x1d(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101d85:	0f be 55 e3          	movsbl -0x1d(%ebp),%edx
  101d89:	0f be 45 e3          	movsbl -0x1d(%ebp),%eax
  101d8d:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d91:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d95:	c7 04 24 94 3d 10 00 	movl   $0x103d94,(%esp)
  101d9c:	e8 a7 e5 ff ff       	call   100348 <cprintf>
        break;
  101da1:	e9 9b 03 00 00       	jmp    102141 <trap_dispatch+0x46f>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101da6:	e8 99 f8 ff ff       	call   101644 <cons_getc>
  101dab:	88 45 e3             	mov    %al,-0x1d(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101dae:	0f be 55 e3          	movsbl -0x1d(%ebp),%edx
  101db2:	0f be 45 e3          	movsbl -0x1d(%ebp),%eax
  101db6:	89 54 24 08          	mov    %edx,0x8(%esp)
  101dba:	89 44 24 04          	mov    %eax,0x4(%esp)
  101dbe:	c7 04 24 a6 3d 10 00 	movl   $0x103da6,(%esp)
  101dc5:	e8 7e e5 ff ff       	call   100348 <cprintf>

        if (c == '3')
  101dca:	80 7d e3 33          	cmpb   $0x33,-0x1d(%ebp)
  101dce:	0f 85 93 00 00 00    	jne    101e67 <trap_dispatch+0x195>
        {
            cprintf("switch to user\n");
  101dd4:	c7 04 24 b5 3d 10 00 	movl   $0x103db5,(%esp)
  101ddb:	e8 68 e5 ff ff       	call   100348 <cprintf>
            to_print_status = 1;
  101de0:	c7 05 a0 00 11 00 01 	movl   $0x1,0x1100a0
  101de7:	00 00 00 
            static struct trapframe tmp_tf;
            if (tf->tf_cs != USER_CS)
  101dea:	8b 45 08             	mov    0x8(%ebp),%eax
  101ded:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101df1:	83 f8 1b             	cmp    $0x1b,%eax
  101df4:	74 71                	je     101e67 <trap_dispatch+0x195>
            {
                tmp_tf = *tf;
  101df6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101df9:	b8 4c 00 00 00       	mov    $0x4c,%eax
  101dfe:	83 e0 fc             	and    $0xfffffffc,%eax
  101e01:	89 c3                	mov    %eax,%ebx
  101e03:	b8 00 00 00 00       	mov    $0x0,%eax
  101e08:	8b 14 01             	mov    (%ecx,%eax,1),%edx
  101e0b:	89 90 c0 08 11 00    	mov    %edx,0x1108c0(%eax)
  101e11:	83 c0 04             	add    $0x4,%eax
  101e14:	39 d8                	cmp    %ebx,%eax
  101e16:	72 f0                	jb     101e08 <trap_dispatch+0x136>
                tmp_tf.tf_cs = USER_CS;
  101e18:	66 c7 05 fc 08 11 00 	movw   $0x1b,0x1108fc
  101e1f:	1b 00 
                tmp_tf.tf_ds = tmp_tf.tf_es = USER_DS;
  101e21:	66 c7 05 e8 08 11 00 	movw   $0x23,0x1108e8
  101e28:	23 00 
  101e2a:	0f b7 05 e8 08 11 00 	movzwl 0x1108e8,%eax
  101e31:	66 a3 ec 08 11 00    	mov    %ax,0x1108ec
                tmp_tf.tf_ss = USER_DS;
  101e37:	66 c7 05 08 09 11 00 	movw   $0x23,0x110908
  101e3e:	23 00 
                tmp_tf.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
  101e40:	8b 45 08             	mov    0x8(%ebp),%eax
  101e43:	83 c0 44             	add    $0x44,%eax
  101e46:	a3 04 09 11 00       	mov    %eax,0x110904

                tmp_tf.tf_eflags |= FL_IOPL_MASK;
  101e4b:	a1 00 09 11 00       	mov    0x110900,%eax
  101e50:	0d 00 30 00 00       	or     $0x3000,%eax
  101e55:	a3 00 09 11 00       	mov    %eax,0x110900

                *((uint32_t *)tf - 1) = (uint32_t)&tmp_tf;
  101e5a:	8b 45 08             	mov    0x8(%ebp),%eax
  101e5d:	83 e8 04             	sub    $0x4,%eax
  101e60:	ba c0 08 11 00       	mov    $0x1108c0,%edx
  101e65:	89 10                	mov    %edx,(%eax)
            }            
        }
        if (c == '0')
  101e67:	80 7d e3 30          	cmpb   $0x30,-0x1d(%ebp)
  101e6b:	0f 85 c9 02 00 00    	jne    10213a <trap_dispatch+0x468>
        {
            cprintf("switch to kernel\n");
  101e71:	c7 04 24 c5 3d 10 00 	movl   $0x103dc5,(%esp)
  101e78:	e8 cb e4 ff ff       	call   100348 <cprintf>
            to_print_status = 1;
  101e7d:	c7 05 a0 00 11 00 01 	movl   $0x1,0x1100a0
  101e84:	00 00 00 
            struct trapframe *tmp_tf_ptr;
            if (tf->tf_cs != KERNEL_CS)
  101e87:	8b 45 08             	mov    0x8(%ebp),%eax
  101e8a:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e8e:	83 f8 08             	cmp    $0x8,%eax
  101e91:	0f 84 a3 02 00 00    	je     10213a <trap_dispatch+0x468>
            {
                tf->tf_cs = KERNEL_CS;
  101e97:	8b 45 08             	mov    0x8(%ebp),%eax
  101e9a:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
                tf->tf_ds = tf->tf_es = KERNEL_DS;
  101ea0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ea3:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101ea9:	8b 45 08             	mov    0x8(%ebp),%eax
  101eac:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101eb0:	8b 45 08             	mov    0x8(%ebp),%eax
  101eb3:	66 89 50 2c          	mov    %dx,0x2c(%eax)
                tf->tf_eflags &= ~FL_IOPL_MASK;
  101eb7:	8b 45 08             	mov    0x8(%ebp),%eax
  101eba:	8b 40 40             	mov    0x40(%eax),%eax
  101ebd:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101ec2:	89 c2                	mov    %eax,%edx
  101ec4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ec7:	89 50 40             	mov    %edx,0x40(%eax)

                tmp_tf_ptr = (struct trapframe*)(tf->tf_esp - (sizeof(struct trapframe) - 8));
  101eca:	8b 45 08             	mov    0x8(%ebp),%eax
  101ecd:	8b 40 44             	mov    0x44(%eax),%eax
  101ed0:	83 e8 44             	sub    $0x44,%eax
  101ed3:	89 45 dc             	mov    %eax,-0x24(%ebp)
  101ed6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  101ed9:	89 45 d8             	mov    %eax,-0x28(%ebp)
  101edc:	8b 45 08             	mov    0x8(%ebp),%eax
  101edf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  101ee2:	c7 45 d0 44 00 00 00 	movl   $0x44,-0x30(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  101ee9:	8b 45 d8             	mov    -0x28(%ebp),%eax
  101eec:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
  101eef:	73 3f                	jae    101f30 <trap_dispatch+0x25e>
  101ef1:	8b 45 d8             	mov    -0x28(%ebp),%eax
  101ef4:	89 45 cc             	mov    %eax,-0x34(%ebp)
  101ef7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101efa:	89 45 c8             	mov    %eax,-0x38(%ebp)
  101efd:	8b 45 d0             	mov    -0x30(%ebp),%eax
  101f00:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  101f03:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  101f06:	c1 e8 02             	shr    $0x2,%eax
  101f09:	89 c1                	mov    %eax,%ecx
    asm volatile (
  101f0b:	8b 55 cc             	mov    -0x34(%ebp),%edx
  101f0e:	8b 45 c8             	mov    -0x38(%ebp),%eax
  101f11:	89 d7                	mov    %edx,%edi
  101f13:	89 c6                	mov    %eax,%esi
  101f15:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101f17:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
  101f1a:	83 e1 03             	and    $0x3,%ecx
  101f1d:	74 02                	je     101f21 <trap_dispatch+0x24f>
  101f1f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  101f21:	89 f0                	mov    %esi,%eax
  101f23:	89 fa                	mov    %edi,%edx
  101f25:	89 4d c0             	mov    %ecx,-0x40(%ebp)
  101f28:	89 55 bc             	mov    %edx,-0x44(%ebp)
  101f2b:	89 45 b8             	mov    %eax,-0x48(%ebp)
        return __memcpy(dst, src, n);
  101f2e:	eb 34                	jmp    101f64 <trap_dispatch+0x292>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  101f30:	8b 45 d0             	mov    -0x30(%ebp),%eax
  101f33:	8d 50 ff             	lea    -0x1(%eax),%edx
  101f36:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101f39:	01 c2                	add    %eax,%edx
  101f3b:	8b 45 d0             	mov    -0x30(%ebp),%eax
  101f3e:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101f41:	8b 45 d8             	mov    -0x28(%ebp),%eax
  101f44:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  101f47:	8b 45 d0             	mov    -0x30(%ebp),%eax
  101f4a:	89 c1                	mov    %eax,%ecx
  101f4c:	89 d8                	mov    %ebx,%eax
  101f4e:	89 d6                	mov    %edx,%esi
  101f50:	89 c7                	mov    %eax,%edi
  101f52:	fd                   	std    
  101f53:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  101f55:	fc                   	cld    
  101f56:	89 f8                	mov    %edi,%eax
  101f58:	89 f2                	mov    %esi,%edx
  101f5a:	89 4d b4             	mov    %ecx,-0x4c(%ebp)
  101f5d:	89 55 b0             	mov    %edx,-0x50(%ebp)
  101f60:	89 45 ac             	mov    %eax,-0x54(%ebp)
    return dst;
  101f63:	90                   	nop
                __memmove(tmp_tf_ptr, tf, sizeof(struct trapframe) - 8);

                *((uint32_t *)tf - 1) = (uint32_t)tmp_tf_ptr;
  101f64:	8b 45 08             	mov    0x8(%ebp),%eax
  101f67:	8d 50 fc             	lea    -0x4(%eax),%edx
  101f6a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  101f6d:	89 02                	mov    %eax,(%edx)
            }
        }

        break;
  101f6f:	e9 c6 01 00 00       	jmp    10213a <trap_dispatch+0x468>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        cprintf("switch to user\n");
  101f74:	c7 04 24 b5 3d 10 00 	movl   $0x103db5,(%esp)
  101f7b:	e8 c8 e3 ff ff       	call   100348 <cprintf>
        static struct trapframe tmp_tf;
        if (tf->tf_cs != USER_CS)
  101f80:	8b 45 08             	mov    0x8(%ebp),%eax
  101f83:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101f87:	83 f8 1b             	cmp    $0x1b,%eax
  101f8a:	0f 84 ad 01 00 00    	je     10213d <trap_dispatch+0x46b>
        {
            tmp_tf = *tf;
  101f90:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101f93:	b8 4c 00 00 00       	mov    $0x4c,%eax
  101f98:	83 e0 fc             	and    $0xfffffffc,%eax
  101f9b:	89 c3                	mov    %eax,%ebx
  101f9d:	b8 00 00 00 00       	mov    $0x0,%eax
  101fa2:	8b 14 01             	mov    (%ecx,%eax,1),%edx
  101fa5:	89 90 20 09 11 00    	mov    %edx,0x110920(%eax)
  101fab:	83 c0 04             	add    $0x4,%eax
  101fae:	39 d8                	cmp    %ebx,%eax
  101fb0:	72 f0                	jb     101fa2 <trap_dispatch+0x2d0>
            tmp_tf.tf_cs = USER_CS;
  101fb2:	66 c7 05 5c 09 11 00 	movw   $0x1b,0x11095c
  101fb9:	1b 00 
            tmp_tf.tf_ds = tmp_tf.tf_es = USER_DS;
  101fbb:	66 c7 05 48 09 11 00 	movw   $0x23,0x110948
  101fc2:	23 00 
  101fc4:	0f b7 05 48 09 11 00 	movzwl 0x110948,%eax
  101fcb:	66 a3 4c 09 11 00    	mov    %ax,0x11094c
            tmp_tf.tf_ss = USER_DS;
  101fd1:	66 c7 05 68 09 11 00 	movw   $0x23,0x110968
  101fd8:	23 00 
            tmp_tf.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
  101fda:	8b 45 08             	mov    0x8(%ebp),%eax
  101fdd:	83 c0 44             	add    $0x44,%eax
  101fe0:	a3 64 09 11 00       	mov    %eax,0x110964

            tmp_tf.tf_eflags |= FL_IOPL_MASK;
  101fe5:	a1 60 09 11 00       	mov    0x110960,%eax
  101fea:	0d 00 30 00 00       	or     $0x3000,%eax
  101fef:	a3 60 09 11 00       	mov    %eax,0x110960

            *((uint32_t *)tf - 1) = (uint32_t)&tmp_tf;
  101ff4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ff7:	83 e8 04             	sub    $0x4,%eax
  101ffa:	ba 20 09 11 00       	mov    $0x110920,%edx
  101fff:	89 10                	mov    %edx,(%eax)
        }
        break;
  102001:	e9 37 01 00 00       	jmp    10213d <trap_dispatch+0x46b>
    case T_SWITCH_TOK:
        cprintf("switch to kernel\n");
  102006:	c7 04 24 c5 3d 10 00 	movl   $0x103dc5,(%esp)
  10200d:	e8 36 e3 ff ff       	call   100348 <cprintf>
        struct trapframe *tmp_tf_ptr;
        if (tf->tf_cs != KERNEL_CS)
  102012:	8b 45 08             	mov    0x8(%ebp),%eax
  102015:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  102019:	83 f8 08             	cmp    $0x8,%eax
  10201c:	0f 84 1e 01 00 00    	je     102140 <trap_dispatch+0x46e>
        {
            tf->tf_cs = KERNEL_CS;
  102022:	8b 45 08             	mov    0x8(%ebp),%eax
  102025:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds = tf->tf_es = KERNEL_DS;
  10202b:	8b 45 08             	mov    0x8(%ebp),%eax
  10202e:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  102034:	8b 45 08             	mov    0x8(%ebp),%eax
  102037:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  10203b:	8b 45 08             	mov    0x8(%ebp),%eax
  10203e:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags &= ~FL_IOPL_MASK;
  102042:	8b 45 08             	mov    0x8(%ebp),%eax
  102045:	8b 40 40             	mov    0x40(%eax),%eax
  102048:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  10204d:	89 c2                	mov    %eax,%edx
  10204f:	8b 45 08             	mov    0x8(%ebp),%eax
  102052:	89 50 40             	mov    %edx,0x40(%eax)

            tmp_tf_ptr = (struct trapframe*)(tf->tf_esp - (sizeof(struct trapframe) - 8));
  102055:	8b 45 08             	mov    0x8(%ebp),%eax
  102058:	8b 40 44             	mov    0x44(%eax),%eax
  10205b:	83 e8 44             	sub    $0x44,%eax
  10205e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102061:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102064:	89 45 a8             	mov    %eax,-0x58(%ebp)
  102067:	8b 45 08             	mov    0x8(%ebp),%eax
  10206a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
  10206d:	c7 45 a0 44 00 00 00 	movl   $0x44,-0x60(%ebp)
    if (dst < src) {
  102074:	8b 45 a8             	mov    -0x58(%ebp),%eax
  102077:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
  10207a:	73 3f                	jae    1020bb <trap_dispatch+0x3e9>
  10207c:	8b 45 a8             	mov    -0x58(%ebp),%eax
  10207f:	89 45 9c             	mov    %eax,-0x64(%ebp)
  102082:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  102085:	89 45 98             	mov    %eax,-0x68(%ebp)
  102088:	8b 45 a0             	mov    -0x60(%ebp),%eax
  10208b:	89 45 94             	mov    %eax,-0x6c(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  10208e:	8b 45 94             	mov    -0x6c(%ebp),%eax
  102091:	c1 e8 02             	shr    $0x2,%eax
  102094:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102096:	8b 55 9c             	mov    -0x64(%ebp),%edx
  102099:	8b 45 98             	mov    -0x68(%ebp),%eax
  10209c:	89 d7                	mov    %edx,%edi
  10209e:	89 c6                	mov    %eax,%esi
  1020a0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1020a2:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
  1020a5:	83 e1 03             	and    $0x3,%ecx
  1020a8:	74 02                	je     1020ac <trap_dispatch+0x3da>
  1020aa:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1020ac:	89 f0                	mov    %esi,%eax
  1020ae:	89 fa                	mov    %edi,%edx
  1020b0:	89 4d 90             	mov    %ecx,-0x70(%ebp)
  1020b3:	89 55 8c             	mov    %edx,-0x74(%ebp)
  1020b6:	89 45 88             	mov    %eax,-0x78(%ebp)
        return __memcpy(dst, src, n);
  1020b9:	eb 37                	jmp    1020f2 <trap_dispatch+0x420>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  1020bb:	8b 45 a0             	mov    -0x60(%ebp),%eax
  1020be:	8d 50 ff             	lea    -0x1(%eax),%edx
  1020c1:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  1020c4:	01 c2                	add    %eax,%edx
  1020c6:	8b 45 a0             	mov    -0x60(%ebp),%eax
  1020c9:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1020cc:	8b 45 a8             	mov    -0x58(%ebp),%eax
  1020cf:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  1020d2:	8b 45 a0             	mov    -0x60(%ebp),%eax
  1020d5:	89 c1                	mov    %eax,%ecx
  1020d7:	89 d8                	mov    %ebx,%eax
  1020d9:	89 d6                	mov    %edx,%esi
  1020db:	89 c7                	mov    %eax,%edi
  1020dd:	fd                   	std    
  1020de:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1020e0:	fc                   	cld    
  1020e1:	89 f8                	mov    %edi,%eax
  1020e3:	89 f2                	mov    %esi,%edx
  1020e5:	89 4d 84             	mov    %ecx,-0x7c(%ebp)
  1020e8:	89 55 80             	mov    %edx,-0x80(%ebp)
  1020eb:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
    return dst;
  1020f1:	90                   	nop
            __memmove(tmp_tf_ptr, tf, sizeof(struct trapframe) - 8);

            *((uint32_t *)tf - 1) = (uint32_t)tmp_tf_ptr;
  1020f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1020f5:	8d 50 fc             	lea    -0x4(%eax),%edx
  1020f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1020fb:	89 02                	mov    %eax,(%edx)
        }
        // panic("T_SWITCH_** ??\n");
        break;
  1020fd:	eb 41                	jmp    102140 <trap_dispatch+0x46e>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  1020ff:	8b 45 08             	mov    0x8(%ebp),%eax
  102102:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  102106:	83 e0 03             	and    $0x3,%eax
  102109:	85 c0                	test   %eax,%eax
  10210b:	75 34                	jne    102141 <trap_dispatch+0x46f>
            print_trapframe(tf);
  10210d:	8b 45 08             	mov    0x8(%ebp),%eax
  102110:	89 04 24             	mov    %eax,(%esp)
  102113:	e8 4d f9 ff ff       	call   101a65 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  102118:	c7 44 24 08 d7 3d 10 	movl   $0x103dd7,0x8(%esp)
  10211f:	00 
  102120:	c7 44 24 04 f8 00 00 	movl   $0xf8,0x4(%esp)
  102127:	00 
  102128:	c7 04 24 f3 3d 10 00 	movl   $0x103df3,(%esp)
  10212f:	e8 85 eb ff ff       	call   100cb9 <__panic>
        break;
  102134:	90                   	nop
  102135:	eb 0a                	jmp    102141 <trap_dispatch+0x46f>
        break;
  102137:	90                   	nop
  102138:	eb 07                	jmp    102141 <trap_dispatch+0x46f>
        break;
  10213a:	90                   	nop
  10213b:	eb 04                	jmp    102141 <trap_dispatch+0x46f>
        break;
  10213d:	90                   	nop
  10213e:	eb 01                	jmp    102141 <trap_dispatch+0x46f>
        break;
  102140:	90                   	nop
        }
    }
}
  102141:	90                   	nop
  102142:	81 c4 8c 00 00 00    	add    $0x8c,%esp
  102148:	5b                   	pop    %ebx
  102149:	5e                   	pop    %esi
  10214a:	5f                   	pop    %edi
  10214b:	5d                   	pop    %ebp
  10214c:	c3                   	ret    

0010214d <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  10214d:	55                   	push   %ebp
  10214e:	89 e5                	mov    %esp,%ebp
  102150:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  102153:	8b 45 08             	mov    0x8(%ebp),%eax
  102156:	89 04 24             	mov    %eax,(%esp)
  102159:	e8 74 fb ff ff       	call   101cd2 <trap_dispatch>
}
  10215e:	90                   	nop
  10215f:	89 ec                	mov    %ebp,%esp
  102161:	5d                   	pop    %ebp
  102162:	c3                   	ret    

00102163 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102163:	1e                   	push   %ds
    pushl %es
  102164:	06                   	push   %es
    pushl %fs
  102165:	0f a0                	push   %fs
    pushl %gs
  102167:	0f a8                	push   %gs
    pushal
  102169:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  10216a:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  10216f:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102171:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102173:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102174:	e8 d4 ff ff ff       	call   10214d <trap>

    # pop the pushed stack pointer
    popl %esp
  102179:	5c                   	pop    %esp

0010217a <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  10217a:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  10217b:	0f a9                	pop    %gs
    popl %fs
  10217d:	0f a1                	pop    %fs
    popl %es
  10217f:	07                   	pop    %es
    popl %ds
  102180:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102181:	83 c4 08             	add    $0x8,%esp
    iret
  102184:	cf                   	iret   

00102185 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  102185:	6a 00                	push   $0x0
  pushl $0
  102187:	6a 00                	push   $0x0
  jmp __alltraps
  102189:	e9 d5 ff ff ff       	jmp    102163 <__alltraps>

0010218e <vector1>:
.globl vector1
vector1:
  pushl $0
  10218e:	6a 00                	push   $0x0
  pushl $1
  102190:	6a 01                	push   $0x1
  jmp __alltraps
  102192:	e9 cc ff ff ff       	jmp    102163 <__alltraps>

00102197 <vector2>:
.globl vector2
vector2:
  pushl $0
  102197:	6a 00                	push   $0x0
  pushl $2
  102199:	6a 02                	push   $0x2
  jmp __alltraps
  10219b:	e9 c3 ff ff ff       	jmp    102163 <__alltraps>

001021a0 <vector3>:
.globl vector3
vector3:
  pushl $0
  1021a0:	6a 00                	push   $0x0
  pushl $3
  1021a2:	6a 03                	push   $0x3
  jmp __alltraps
  1021a4:	e9 ba ff ff ff       	jmp    102163 <__alltraps>

001021a9 <vector4>:
.globl vector4
vector4:
  pushl $0
  1021a9:	6a 00                	push   $0x0
  pushl $4
  1021ab:	6a 04                	push   $0x4
  jmp __alltraps
  1021ad:	e9 b1 ff ff ff       	jmp    102163 <__alltraps>

001021b2 <vector5>:
.globl vector5
vector5:
  pushl $0
  1021b2:	6a 00                	push   $0x0
  pushl $5
  1021b4:	6a 05                	push   $0x5
  jmp __alltraps
  1021b6:	e9 a8 ff ff ff       	jmp    102163 <__alltraps>

001021bb <vector6>:
.globl vector6
vector6:
  pushl $0
  1021bb:	6a 00                	push   $0x0
  pushl $6
  1021bd:	6a 06                	push   $0x6
  jmp __alltraps
  1021bf:	e9 9f ff ff ff       	jmp    102163 <__alltraps>

001021c4 <vector7>:
.globl vector7
vector7:
  pushl $0
  1021c4:	6a 00                	push   $0x0
  pushl $7
  1021c6:	6a 07                	push   $0x7
  jmp __alltraps
  1021c8:	e9 96 ff ff ff       	jmp    102163 <__alltraps>

001021cd <vector8>:
.globl vector8
vector8:
  pushl $8
  1021cd:	6a 08                	push   $0x8
  jmp __alltraps
  1021cf:	e9 8f ff ff ff       	jmp    102163 <__alltraps>

001021d4 <vector9>:
.globl vector9
vector9:
  pushl $0
  1021d4:	6a 00                	push   $0x0
  pushl $9
  1021d6:	6a 09                	push   $0x9
  jmp __alltraps
  1021d8:	e9 86 ff ff ff       	jmp    102163 <__alltraps>

001021dd <vector10>:
.globl vector10
vector10:
  pushl $10
  1021dd:	6a 0a                	push   $0xa
  jmp __alltraps
  1021df:	e9 7f ff ff ff       	jmp    102163 <__alltraps>

001021e4 <vector11>:
.globl vector11
vector11:
  pushl $11
  1021e4:	6a 0b                	push   $0xb
  jmp __alltraps
  1021e6:	e9 78 ff ff ff       	jmp    102163 <__alltraps>

001021eb <vector12>:
.globl vector12
vector12:
  pushl $12
  1021eb:	6a 0c                	push   $0xc
  jmp __alltraps
  1021ed:	e9 71 ff ff ff       	jmp    102163 <__alltraps>

001021f2 <vector13>:
.globl vector13
vector13:
  pushl $13
  1021f2:	6a 0d                	push   $0xd
  jmp __alltraps
  1021f4:	e9 6a ff ff ff       	jmp    102163 <__alltraps>

001021f9 <vector14>:
.globl vector14
vector14:
  pushl $14
  1021f9:	6a 0e                	push   $0xe
  jmp __alltraps
  1021fb:	e9 63 ff ff ff       	jmp    102163 <__alltraps>

00102200 <vector15>:
.globl vector15
vector15:
  pushl $0
  102200:	6a 00                	push   $0x0
  pushl $15
  102202:	6a 0f                	push   $0xf
  jmp __alltraps
  102204:	e9 5a ff ff ff       	jmp    102163 <__alltraps>

00102209 <vector16>:
.globl vector16
vector16:
  pushl $0
  102209:	6a 00                	push   $0x0
  pushl $16
  10220b:	6a 10                	push   $0x10
  jmp __alltraps
  10220d:	e9 51 ff ff ff       	jmp    102163 <__alltraps>

00102212 <vector17>:
.globl vector17
vector17:
  pushl $17
  102212:	6a 11                	push   $0x11
  jmp __alltraps
  102214:	e9 4a ff ff ff       	jmp    102163 <__alltraps>

00102219 <vector18>:
.globl vector18
vector18:
  pushl $0
  102219:	6a 00                	push   $0x0
  pushl $18
  10221b:	6a 12                	push   $0x12
  jmp __alltraps
  10221d:	e9 41 ff ff ff       	jmp    102163 <__alltraps>

00102222 <vector19>:
.globl vector19
vector19:
  pushl $0
  102222:	6a 00                	push   $0x0
  pushl $19
  102224:	6a 13                	push   $0x13
  jmp __alltraps
  102226:	e9 38 ff ff ff       	jmp    102163 <__alltraps>

0010222b <vector20>:
.globl vector20
vector20:
  pushl $0
  10222b:	6a 00                	push   $0x0
  pushl $20
  10222d:	6a 14                	push   $0x14
  jmp __alltraps
  10222f:	e9 2f ff ff ff       	jmp    102163 <__alltraps>

00102234 <vector21>:
.globl vector21
vector21:
  pushl $0
  102234:	6a 00                	push   $0x0
  pushl $21
  102236:	6a 15                	push   $0x15
  jmp __alltraps
  102238:	e9 26 ff ff ff       	jmp    102163 <__alltraps>

0010223d <vector22>:
.globl vector22
vector22:
  pushl $0
  10223d:	6a 00                	push   $0x0
  pushl $22
  10223f:	6a 16                	push   $0x16
  jmp __alltraps
  102241:	e9 1d ff ff ff       	jmp    102163 <__alltraps>

00102246 <vector23>:
.globl vector23
vector23:
  pushl $0
  102246:	6a 00                	push   $0x0
  pushl $23
  102248:	6a 17                	push   $0x17
  jmp __alltraps
  10224a:	e9 14 ff ff ff       	jmp    102163 <__alltraps>

0010224f <vector24>:
.globl vector24
vector24:
  pushl $0
  10224f:	6a 00                	push   $0x0
  pushl $24
  102251:	6a 18                	push   $0x18
  jmp __alltraps
  102253:	e9 0b ff ff ff       	jmp    102163 <__alltraps>

00102258 <vector25>:
.globl vector25
vector25:
  pushl $0
  102258:	6a 00                	push   $0x0
  pushl $25
  10225a:	6a 19                	push   $0x19
  jmp __alltraps
  10225c:	e9 02 ff ff ff       	jmp    102163 <__alltraps>

00102261 <vector26>:
.globl vector26
vector26:
  pushl $0
  102261:	6a 00                	push   $0x0
  pushl $26
  102263:	6a 1a                	push   $0x1a
  jmp __alltraps
  102265:	e9 f9 fe ff ff       	jmp    102163 <__alltraps>

0010226a <vector27>:
.globl vector27
vector27:
  pushl $0
  10226a:	6a 00                	push   $0x0
  pushl $27
  10226c:	6a 1b                	push   $0x1b
  jmp __alltraps
  10226e:	e9 f0 fe ff ff       	jmp    102163 <__alltraps>

00102273 <vector28>:
.globl vector28
vector28:
  pushl $0
  102273:	6a 00                	push   $0x0
  pushl $28
  102275:	6a 1c                	push   $0x1c
  jmp __alltraps
  102277:	e9 e7 fe ff ff       	jmp    102163 <__alltraps>

0010227c <vector29>:
.globl vector29
vector29:
  pushl $0
  10227c:	6a 00                	push   $0x0
  pushl $29
  10227e:	6a 1d                	push   $0x1d
  jmp __alltraps
  102280:	e9 de fe ff ff       	jmp    102163 <__alltraps>

00102285 <vector30>:
.globl vector30
vector30:
  pushl $0
  102285:	6a 00                	push   $0x0
  pushl $30
  102287:	6a 1e                	push   $0x1e
  jmp __alltraps
  102289:	e9 d5 fe ff ff       	jmp    102163 <__alltraps>

0010228e <vector31>:
.globl vector31
vector31:
  pushl $0
  10228e:	6a 00                	push   $0x0
  pushl $31
  102290:	6a 1f                	push   $0x1f
  jmp __alltraps
  102292:	e9 cc fe ff ff       	jmp    102163 <__alltraps>

00102297 <vector32>:
.globl vector32
vector32:
  pushl $0
  102297:	6a 00                	push   $0x0
  pushl $32
  102299:	6a 20                	push   $0x20
  jmp __alltraps
  10229b:	e9 c3 fe ff ff       	jmp    102163 <__alltraps>

001022a0 <vector33>:
.globl vector33
vector33:
  pushl $0
  1022a0:	6a 00                	push   $0x0
  pushl $33
  1022a2:	6a 21                	push   $0x21
  jmp __alltraps
  1022a4:	e9 ba fe ff ff       	jmp    102163 <__alltraps>

001022a9 <vector34>:
.globl vector34
vector34:
  pushl $0
  1022a9:	6a 00                	push   $0x0
  pushl $34
  1022ab:	6a 22                	push   $0x22
  jmp __alltraps
  1022ad:	e9 b1 fe ff ff       	jmp    102163 <__alltraps>

001022b2 <vector35>:
.globl vector35
vector35:
  pushl $0
  1022b2:	6a 00                	push   $0x0
  pushl $35
  1022b4:	6a 23                	push   $0x23
  jmp __alltraps
  1022b6:	e9 a8 fe ff ff       	jmp    102163 <__alltraps>

001022bb <vector36>:
.globl vector36
vector36:
  pushl $0
  1022bb:	6a 00                	push   $0x0
  pushl $36
  1022bd:	6a 24                	push   $0x24
  jmp __alltraps
  1022bf:	e9 9f fe ff ff       	jmp    102163 <__alltraps>

001022c4 <vector37>:
.globl vector37
vector37:
  pushl $0
  1022c4:	6a 00                	push   $0x0
  pushl $37
  1022c6:	6a 25                	push   $0x25
  jmp __alltraps
  1022c8:	e9 96 fe ff ff       	jmp    102163 <__alltraps>

001022cd <vector38>:
.globl vector38
vector38:
  pushl $0
  1022cd:	6a 00                	push   $0x0
  pushl $38
  1022cf:	6a 26                	push   $0x26
  jmp __alltraps
  1022d1:	e9 8d fe ff ff       	jmp    102163 <__alltraps>

001022d6 <vector39>:
.globl vector39
vector39:
  pushl $0
  1022d6:	6a 00                	push   $0x0
  pushl $39
  1022d8:	6a 27                	push   $0x27
  jmp __alltraps
  1022da:	e9 84 fe ff ff       	jmp    102163 <__alltraps>

001022df <vector40>:
.globl vector40
vector40:
  pushl $0
  1022df:	6a 00                	push   $0x0
  pushl $40
  1022e1:	6a 28                	push   $0x28
  jmp __alltraps
  1022e3:	e9 7b fe ff ff       	jmp    102163 <__alltraps>

001022e8 <vector41>:
.globl vector41
vector41:
  pushl $0
  1022e8:	6a 00                	push   $0x0
  pushl $41
  1022ea:	6a 29                	push   $0x29
  jmp __alltraps
  1022ec:	e9 72 fe ff ff       	jmp    102163 <__alltraps>

001022f1 <vector42>:
.globl vector42
vector42:
  pushl $0
  1022f1:	6a 00                	push   $0x0
  pushl $42
  1022f3:	6a 2a                	push   $0x2a
  jmp __alltraps
  1022f5:	e9 69 fe ff ff       	jmp    102163 <__alltraps>

001022fa <vector43>:
.globl vector43
vector43:
  pushl $0
  1022fa:	6a 00                	push   $0x0
  pushl $43
  1022fc:	6a 2b                	push   $0x2b
  jmp __alltraps
  1022fe:	e9 60 fe ff ff       	jmp    102163 <__alltraps>

00102303 <vector44>:
.globl vector44
vector44:
  pushl $0
  102303:	6a 00                	push   $0x0
  pushl $44
  102305:	6a 2c                	push   $0x2c
  jmp __alltraps
  102307:	e9 57 fe ff ff       	jmp    102163 <__alltraps>

0010230c <vector45>:
.globl vector45
vector45:
  pushl $0
  10230c:	6a 00                	push   $0x0
  pushl $45
  10230e:	6a 2d                	push   $0x2d
  jmp __alltraps
  102310:	e9 4e fe ff ff       	jmp    102163 <__alltraps>

00102315 <vector46>:
.globl vector46
vector46:
  pushl $0
  102315:	6a 00                	push   $0x0
  pushl $46
  102317:	6a 2e                	push   $0x2e
  jmp __alltraps
  102319:	e9 45 fe ff ff       	jmp    102163 <__alltraps>

0010231e <vector47>:
.globl vector47
vector47:
  pushl $0
  10231e:	6a 00                	push   $0x0
  pushl $47
  102320:	6a 2f                	push   $0x2f
  jmp __alltraps
  102322:	e9 3c fe ff ff       	jmp    102163 <__alltraps>

00102327 <vector48>:
.globl vector48
vector48:
  pushl $0
  102327:	6a 00                	push   $0x0
  pushl $48
  102329:	6a 30                	push   $0x30
  jmp __alltraps
  10232b:	e9 33 fe ff ff       	jmp    102163 <__alltraps>

00102330 <vector49>:
.globl vector49
vector49:
  pushl $0
  102330:	6a 00                	push   $0x0
  pushl $49
  102332:	6a 31                	push   $0x31
  jmp __alltraps
  102334:	e9 2a fe ff ff       	jmp    102163 <__alltraps>

00102339 <vector50>:
.globl vector50
vector50:
  pushl $0
  102339:	6a 00                	push   $0x0
  pushl $50
  10233b:	6a 32                	push   $0x32
  jmp __alltraps
  10233d:	e9 21 fe ff ff       	jmp    102163 <__alltraps>

00102342 <vector51>:
.globl vector51
vector51:
  pushl $0
  102342:	6a 00                	push   $0x0
  pushl $51
  102344:	6a 33                	push   $0x33
  jmp __alltraps
  102346:	e9 18 fe ff ff       	jmp    102163 <__alltraps>

0010234b <vector52>:
.globl vector52
vector52:
  pushl $0
  10234b:	6a 00                	push   $0x0
  pushl $52
  10234d:	6a 34                	push   $0x34
  jmp __alltraps
  10234f:	e9 0f fe ff ff       	jmp    102163 <__alltraps>

00102354 <vector53>:
.globl vector53
vector53:
  pushl $0
  102354:	6a 00                	push   $0x0
  pushl $53
  102356:	6a 35                	push   $0x35
  jmp __alltraps
  102358:	e9 06 fe ff ff       	jmp    102163 <__alltraps>

0010235d <vector54>:
.globl vector54
vector54:
  pushl $0
  10235d:	6a 00                	push   $0x0
  pushl $54
  10235f:	6a 36                	push   $0x36
  jmp __alltraps
  102361:	e9 fd fd ff ff       	jmp    102163 <__alltraps>

00102366 <vector55>:
.globl vector55
vector55:
  pushl $0
  102366:	6a 00                	push   $0x0
  pushl $55
  102368:	6a 37                	push   $0x37
  jmp __alltraps
  10236a:	e9 f4 fd ff ff       	jmp    102163 <__alltraps>

0010236f <vector56>:
.globl vector56
vector56:
  pushl $0
  10236f:	6a 00                	push   $0x0
  pushl $56
  102371:	6a 38                	push   $0x38
  jmp __alltraps
  102373:	e9 eb fd ff ff       	jmp    102163 <__alltraps>

00102378 <vector57>:
.globl vector57
vector57:
  pushl $0
  102378:	6a 00                	push   $0x0
  pushl $57
  10237a:	6a 39                	push   $0x39
  jmp __alltraps
  10237c:	e9 e2 fd ff ff       	jmp    102163 <__alltraps>

00102381 <vector58>:
.globl vector58
vector58:
  pushl $0
  102381:	6a 00                	push   $0x0
  pushl $58
  102383:	6a 3a                	push   $0x3a
  jmp __alltraps
  102385:	e9 d9 fd ff ff       	jmp    102163 <__alltraps>

0010238a <vector59>:
.globl vector59
vector59:
  pushl $0
  10238a:	6a 00                	push   $0x0
  pushl $59
  10238c:	6a 3b                	push   $0x3b
  jmp __alltraps
  10238e:	e9 d0 fd ff ff       	jmp    102163 <__alltraps>

00102393 <vector60>:
.globl vector60
vector60:
  pushl $0
  102393:	6a 00                	push   $0x0
  pushl $60
  102395:	6a 3c                	push   $0x3c
  jmp __alltraps
  102397:	e9 c7 fd ff ff       	jmp    102163 <__alltraps>

0010239c <vector61>:
.globl vector61
vector61:
  pushl $0
  10239c:	6a 00                	push   $0x0
  pushl $61
  10239e:	6a 3d                	push   $0x3d
  jmp __alltraps
  1023a0:	e9 be fd ff ff       	jmp    102163 <__alltraps>

001023a5 <vector62>:
.globl vector62
vector62:
  pushl $0
  1023a5:	6a 00                	push   $0x0
  pushl $62
  1023a7:	6a 3e                	push   $0x3e
  jmp __alltraps
  1023a9:	e9 b5 fd ff ff       	jmp    102163 <__alltraps>

001023ae <vector63>:
.globl vector63
vector63:
  pushl $0
  1023ae:	6a 00                	push   $0x0
  pushl $63
  1023b0:	6a 3f                	push   $0x3f
  jmp __alltraps
  1023b2:	e9 ac fd ff ff       	jmp    102163 <__alltraps>

001023b7 <vector64>:
.globl vector64
vector64:
  pushl $0
  1023b7:	6a 00                	push   $0x0
  pushl $64
  1023b9:	6a 40                	push   $0x40
  jmp __alltraps
  1023bb:	e9 a3 fd ff ff       	jmp    102163 <__alltraps>

001023c0 <vector65>:
.globl vector65
vector65:
  pushl $0
  1023c0:	6a 00                	push   $0x0
  pushl $65
  1023c2:	6a 41                	push   $0x41
  jmp __alltraps
  1023c4:	e9 9a fd ff ff       	jmp    102163 <__alltraps>

001023c9 <vector66>:
.globl vector66
vector66:
  pushl $0
  1023c9:	6a 00                	push   $0x0
  pushl $66
  1023cb:	6a 42                	push   $0x42
  jmp __alltraps
  1023cd:	e9 91 fd ff ff       	jmp    102163 <__alltraps>

001023d2 <vector67>:
.globl vector67
vector67:
  pushl $0
  1023d2:	6a 00                	push   $0x0
  pushl $67
  1023d4:	6a 43                	push   $0x43
  jmp __alltraps
  1023d6:	e9 88 fd ff ff       	jmp    102163 <__alltraps>

001023db <vector68>:
.globl vector68
vector68:
  pushl $0
  1023db:	6a 00                	push   $0x0
  pushl $68
  1023dd:	6a 44                	push   $0x44
  jmp __alltraps
  1023df:	e9 7f fd ff ff       	jmp    102163 <__alltraps>

001023e4 <vector69>:
.globl vector69
vector69:
  pushl $0
  1023e4:	6a 00                	push   $0x0
  pushl $69
  1023e6:	6a 45                	push   $0x45
  jmp __alltraps
  1023e8:	e9 76 fd ff ff       	jmp    102163 <__alltraps>

001023ed <vector70>:
.globl vector70
vector70:
  pushl $0
  1023ed:	6a 00                	push   $0x0
  pushl $70
  1023ef:	6a 46                	push   $0x46
  jmp __alltraps
  1023f1:	e9 6d fd ff ff       	jmp    102163 <__alltraps>

001023f6 <vector71>:
.globl vector71
vector71:
  pushl $0
  1023f6:	6a 00                	push   $0x0
  pushl $71
  1023f8:	6a 47                	push   $0x47
  jmp __alltraps
  1023fa:	e9 64 fd ff ff       	jmp    102163 <__alltraps>

001023ff <vector72>:
.globl vector72
vector72:
  pushl $0
  1023ff:	6a 00                	push   $0x0
  pushl $72
  102401:	6a 48                	push   $0x48
  jmp __alltraps
  102403:	e9 5b fd ff ff       	jmp    102163 <__alltraps>

00102408 <vector73>:
.globl vector73
vector73:
  pushl $0
  102408:	6a 00                	push   $0x0
  pushl $73
  10240a:	6a 49                	push   $0x49
  jmp __alltraps
  10240c:	e9 52 fd ff ff       	jmp    102163 <__alltraps>

00102411 <vector74>:
.globl vector74
vector74:
  pushl $0
  102411:	6a 00                	push   $0x0
  pushl $74
  102413:	6a 4a                	push   $0x4a
  jmp __alltraps
  102415:	e9 49 fd ff ff       	jmp    102163 <__alltraps>

0010241a <vector75>:
.globl vector75
vector75:
  pushl $0
  10241a:	6a 00                	push   $0x0
  pushl $75
  10241c:	6a 4b                	push   $0x4b
  jmp __alltraps
  10241e:	e9 40 fd ff ff       	jmp    102163 <__alltraps>

00102423 <vector76>:
.globl vector76
vector76:
  pushl $0
  102423:	6a 00                	push   $0x0
  pushl $76
  102425:	6a 4c                	push   $0x4c
  jmp __alltraps
  102427:	e9 37 fd ff ff       	jmp    102163 <__alltraps>

0010242c <vector77>:
.globl vector77
vector77:
  pushl $0
  10242c:	6a 00                	push   $0x0
  pushl $77
  10242e:	6a 4d                	push   $0x4d
  jmp __alltraps
  102430:	e9 2e fd ff ff       	jmp    102163 <__alltraps>

00102435 <vector78>:
.globl vector78
vector78:
  pushl $0
  102435:	6a 00                	push   $0x0
  pushl $78
  102437:	6a 4e                	push   $0x4e
  jmp __alltraps
  102439:	e9 25 fd ff ff       	jmp    102163 <__alltraps>

0010243e <vector79>:
.globl vector79
vector79:
  pushl $0
  10243e:	6a 00                	push   $0x0
  pushl $79
  102440:	6a 4f                	push   $0x4f
  jmp __alltraps
  102442:	e9 1c fd ff ff       	jmp    102163 <__alltraps>

00102447 <vector80>:
.globl vector80
vector80:
  pushl $0
  102447:	6a 00                	push   $0x0
  pushl $80
  102449:	6a 50                	push   $0x50
  jmp __alltraps
  10244b:	e9 13 fd ff ff       	jmp    102163 <__alltraps>

00102450 <vector81>:
.globl vector81
vector81:
  pushl $0
  102450:	6a 00                	push   $0x0
  pushl $81
  102452:	6a 51                	push   $0x51
  jmp __alltraps
  102454:	e9 0a fd ff ff       	jmp    102163 <__alltraps>

00102459 <vector82>:
.globl vector82
vector82:
  pushl $0
  102459:	6a 00                	push   $0x0
  pushl $82
  10245b:	6a 52                	push   $0x52
  jmp __alltraps
  10245d:	e9 01 fd ff ff       	jmp    102163 <__alltraps>

00102462 <vector83>:
.globl vector83
vector83:
  pushl $0
  102462:	6a 00                	push   $0x0
  pushl $83
  102464:	6a 53                	push   $0x53
  jmp __alltraps
  102466:	e9 f8 fc ff ff       	jmp    102163 <__alltraps>

0010246b <vector84>:
.globl vector84
vector84:
  pushl $0
  10246b:	6a 00                	push   $0x0
  pushl $84
  10246d:	6a 54                	push   $0x54
  jmp __alltraps
  10246f:	e9 ef fc ff ff       	jmp    102163 <__alltraps>

00102474 <vector85>:
.globl vector85
vector85:
  pushl $0
  102474:	6a 00                	push   $0x0
  pushl $85
  102476:	6a 55                	push   $0x55
  jmp __alltraps
  102478:	e9 e6 fc ff ff       	jmp    102163 <__alltraps>

0010247d <vector86>:
.globl vector86
vector86:
  pushl $0
  10247d:	6a 00                	push   $0x0
  pushl $86
  10247f:	6a 56                	push   $0x56
  jmp __alltraps
  102481:	e9 dd fc ff ff       	jmp    102163 <__alltraps>

00102486 <vector87>:
.globl vector87
vector87:
  pushl $0
  102486:	6a 00                	push   $0x0
  pushl $87
  102488:	6a 57                	push   $0x57
  jmp __alltraps
  10248a:	e9 d4 fc ff ff       	jmp    102163 <__alltraps>

0010248f <vector88>:
.globl vector88
vector88:
  pushl $0
  10248f:	6a 00                	push   $0x0
  pushl $88
  102491:	6a 58                	push   $0x58
  jmp __alltraps
  102493:	e9 cb fc ff ff       	jmp    102163 <__alltraps>

00102498 <vector89>:
.globl vector89
vector89:
  pushl $0
  102498:	6a 00                	push   $0x0
  pushl $89
  10249a:	6a 59                	push   $0x59
  jmp __alltraps
  10249c:	e9 c2 fc ff ff       	jmp    102163 <__alltraps>

001024a1 <vector90>:
.globl vector90
vector90:
  pushl $0
  1024a1:	6a 00                	push   $0x0
  pushl $90
  1024a3:	6a 5a                	push   $0x5a
  jmp __alltraps
  1024a5:	e9 b9 fc ff ff       	jmp    102163 <__alltraps>

001024aa <vector91>:
.globl vector91
vector91:
  pushl $0
  1024aa:	6a 00                	push   $0x0
  pushl $91
  1024ac:	6a 5b                	push   $0x5b
  jmp __alltraps
  1024ae:	e9 b0 fc ff ff       	jmp    102163 <__alltraps>

001024b3 <vector92>:
.globl vector92
vector92:
  pushl $0
  1024b3:	6a 00                	push   $0x0
  pushl $92
  1024b5:	6a 5c                	push   $0x5c
  jmp __alltraps
  1024b7:	e9 a7 fc ff ff       	jmp    102163 <__alltraps>

001024bc <vector93>:
.globl vector93
vector93:
  pushl $0
  1024bc:	6a 00                	push   $0x0
  pushl $93
  1024be:	6a 5d                	push   $0x5d
  jmp __alltraps
  1024c0:	e9 9e fc ff ff       	jmp    102163 <__alltraps>

001024c5 <vector94>:
.globl vector94
vector94:
  pushl $0
  1024c5:	6a 00                	push   $0x0
  pushl $94
  1024c7:	6a 5e                	push   $0x5e
  jmp __alltraps
  1024c9:	e9 95 fc ff ff       	jmp    102163 <__alltraps>

001024ce <vector95>:
.globl vector95
vector95:
  pushl $0
  1024ce:	6a 00                	push   $0x0
  pushl $95
  1024d0:	6a 5f                	push   $0x5f
  jmp __alltraps
  1024d2:	e9 8c fc ff ff       	jmp    102163 <__alltraps>

001024d7 <vector96>:
.globl vector96
vector96:
  pushl $0
  1024d7:	6a 00                	push   $0x0
  pushl $96
  1024d9:	6a 60                	push   $0x60
  jmp __alltraps
  1024db:	e9 83 fc ff ff       	jmp    102163 <__alltraps>

001024e0 <vector97>:
.globl vector97
vector97:
  pushl $0
  1024e0:	6a 00                	push   $0x0
  pushl $97
  1024e2:	6a 61                	push   $0x61
  jmp __alltraps
  1024e4:	e9 7a fc ff ff       	jmp    102163 <__alltraps>

001024e9 <vector98>:
.globl vector98
vector98:
  pushl $0
  1024e9:	6a 00                	push   $0x0
  pushl $98
  1024eb:	6a 62                	push   $0x62
  jmp __alltraps
  1024ed:	e9 71 fc ff ff       	jmp    102163 <__alltraps>

001024f2 <vector99>:
.globl vector99
vector99:
  pushl $0
  1024f2:	6a 00                	push   $0x0
  pushl $99
  1024f4:	6a 63                	push   $0x63
  jmp __alltraps
  1024f6:	e9 68 fc ff ff       	jmp    102163 <__alltraps>

001024fb <vector100>:
.globl vector100
vector100:
  pushl $0
  1024fb:	6a 00                	push   $0x0
  pushl $100
  1024fd:	6a 64                	push   $0x64
  jmp __alltraps
  1024ff:	e9 5f fc ff ff       	jmp    102163 <__alltraps>

00102504 <vector101>:
.globl vector101
vector101:
  pushl $0
  102504:	6a 00                	push   $0x0
  pushl $101
  102506:	6a 65                	push   $0x65
  jmp __alltraps
  102508:	e9 56 fc ff ff       	jmp    102163 <__alltraps>

0010250d <vector102>:
.globl vector102
vector102:
  pushl $0
  10250d:	6a 00                	push   $0x0
  pushl $102
  10250f:	6a 66                	push   $0x66
  jmp __alltraps
  102511:	e9 4d fc ff ff       	jmp    102163 <__alltraps>

00102516 <vector103>:
.globl vector103
vector103:
  pushl $0
  102516:	6a 00                	push   $0x0
  pushl $103
  102518:	6a 67                	push   $0x67
  jmp __alltraps
  10251a:	e9 44 fc ff ff       	jmp    102163 <__alltraps>

0010251f <vector104>:
.globl vector104
vector104:
  pushl $0
  10251f:	6a 00                	push   $0x0
  pushl $104
  102521:	6a 68                	push   $0x68
  jmp __alltraps
  102523:	e9 3b fc ff ff       	jmp    102163 <__alltraps>

00102528 <vector105>:
.globl vector105
vector105:
  pushl $0
  102528:	6a 00                	push   $0x0
  pushl $105
  10252a:	6a 69                	push   $0x69
  jmp __alltraps
  10252c:	e9 32 fc ff ff       	jmp    102163 <__alltraps>

00102531 <vector106>:
.globl vector106
vector106:
  pushl $0
  102531:	6a 00                	push   $0x0
  pushl $106
  102533:	6a 6a                	push   $0x6a
  jmp __alltraps
  102535:	e9 29 fc ff ff       	jmp    102163 <__alltraps>

0010253a <vector107>:
.globl vector107
vector107:
  pushl $0
  10253a:	6a 00                	push   $0x0
  pushl $107
  10253c:	6a 6b                	push   $0x6b
  jmp __alltraps
  10253e:	e9 20 fc ff ff       	jmp    102163 <__alltraps>

00102543 <vector108>:
.globl vector108
vector108:
  pushl $0
  102543:	6a 00                	push   $0x0
  pushl $108
  102545:	6a 6c                	push   $0x6c
  jmp __alltraps
  102547:	e9 17 fc ff ff       	jmp    102163 <__alltraps>

0010254c <vector109>:
.globl vector109
vector109:
  pushl $0
  10254c:	6a 00                	push   $0x0
  pushl $109
  10254e:	6a 6d                	push   $0x6d
  jmp __alltraps
  102550:	e9 0e fc ff ff       	jmp    102163 <__alltraps>

00102555 <vector110>:
.globl vector110
vector110:
  pushl $0
  102555:	6a 00                	push   $0x0
  pushl $110
  102557:	6a 6e                	push   $0x6e
  jmp __alltraps
  102559:	e9 05 fc ff ff       	jmp    102163 <__alltraps>

0010255e <vector111>:
.globl vector111
vector111:
  pushl $0
  10255e:	6a 00                	push   $0x0
  pushl $111
  102560:	6a 6f                	push   $0x6f
  jmp __alltraps
  102562:	e9 fc fb ff ff       	jmp    102163 <__alltraps>

00102567 <vector112>:
.globl vector112
vector112:
  pushl $0
  102567:	6a 00                	push   $0x0
  pushl $112
  102569:	6a 70                	push   $0x70
  jmp __alltraps
  10256b:	e9 f3 fb ff ff       	jmp    102163 <__alltraps>

00102570 <vector113>:
.globl vector113
vector113:
  pushl $0
  102570:	6a 00                	push   $0x0
  pushl $113
  102572:	6a 71                	push   $0x71
  jmp __alltraps
  102574:	e9 ea fb ff ff       	jmp    102163 <__alltraps>

00102579 <vector114>:
.globl vector114
vector114:
  pushl $0
  102579:	6a 00                	push   $0x0
  pushl $114
  10257b:	6a 72                	push   $0x72
  jmp __alltraps
  10257d:	e9 e1 fb ff ff       	jmp    102163 <__alltraps>

00102582 <vector115>:
.globl vector115
vector115:
  pushl $0
  102582:	6a 00                	push   $0x0
  pushl $115
  102584:	6a 73                	push   $0x73
  jmp __alltraps
  102586:	e9 d8 fb ff ff       	jmp    102163 <__alltraps>

0010258b <vector116>:
.globl vector116
vector116:
  pushl $0
  10258b:	6a 00                	push   $0x0
  pushl $116
  10258d:	6a 74                	push   $0x74
  jmp __alltraps
  10258f:	e9 cf fb ff ff       	jmp    102163 <__alltraps>

00102594 <vector117>:
.globl vector117
vector117:
  pushl $0
  102594:	6a 00                	push   $0x0
  pushl $117
  102596:	6a 75                	push   $0x75
  jmp __alltraps
  102598:	e9 c6 fb ff ff       	jmp    102163 <__alltraps>

0010259d <vector118>:
.globl vector118
vector118:
  pushl $0
  10259d:	6a 00                	push   $0x0
  pushl $118
  10259f:	6a 76                	push   $0x76
  jmp __alltraps
  1025a1:	e9 bd fb ff ff       	jmp    102163 <__alltraps>

001025a6 <vector119>:
.globl vector119
vector119:
  pushl $0
  1025a6:	6a 00                	push   $0x0
  pushl $119
  1025a8:	6a 77                	push   $0x77
  jmp __alltraps
  1025aa:	e9 b4 fb ff ff       	jmp    102163 <__alltraps>

001025af <vector120>:
.globl vector120
vector120:
  pushl $0
  1025af:	6a 00                	push   $0x0
  pushl $120
  1025b1:	6a 78                	push   $0x78
  jmp __alltraps
  1025b3:	e9 ab fb ff ff       	jmp    102163 <__alltraps>

001025b8 <vector121>:
.globl vector121
vector121:
  pushl $0
  1025b8:	6a 00                	push   $0x0
  pushl $121
  1025ba:	6a 79                	push   $0x79
  jmp __alltraps
  1025bc:	e9 a2 fb ff ff       	jmp    102163 <__alltraps>

001025c1 <vector122>:
.globl vector122
vector122:
  pushl $0
  1025c1:	6a 00                	push   $0x0
  pushl $122
  1025c3:	6a 7a                	push   $0x7a
  jmp __alltraps
  1025c5:	e9 99 fb ff ff       	jmp    102163 <__alltraps>

001025ca <vector123>:
.globl vector123
vector123:
  pushl $0
  1025ca:	6a 00                	push   $0x0
  pushl $123
  1025cc:	6a 7b                	push   $0x7b
  jmp __alltraps
  1025ce:	e9 90 fb ff ff       	jmp    102163 <__alltraps>

001025d3 <vector124>:
.globl vector124
vector124:
  pushl $0
  1025d3:	6a 00                	push   $0x0
  pushl $124
  1025d5:	6a 7c                	push   $0x7c
  jmp __alltraps
  1025d7:	e9 87 fb ff ff       	jmp    102163 <__alltraps>

001025dc <vector125>:
.globl vector125
vector125:
  pushl $0
  1025dc:	6a 00                	push   $0x0
  pushl $125
  1025de:	6a 7d                	push   $0x7d
  jmp __alltraps
  1025e0:	e9 7e fb ff ff       	jmp    102163 <__alltraps>

001025e5 <vector126>:
.globl vector126
vector126:
  pushl $0
  1025e5:	6a 00                	push   $0x0
  pushl $126
  1025e7:	6a 7e                	push   $0x7e
  jmp __alltraps
  1025e9:	e9 75 fb ff ff       	jmp    102163 <__alltraps>

001025ee <vector127>:
.globl vector127
vector127:
  pushl $0
  1025ee:	6a 00                	push   $0x0
  pushl $127
  1025f0:	6a 7f                	push   $0x7f
  jmp __alltraps
  1025f2:	e9 6c fb ff ff       	jmp    102163 <__alltraps>

001025f7 <vector128>:
.globl vector128
vector128:
  pushl $0
  1025f7:	6a 00                	push   $0x0
  pushl $128
  1025f9:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  1025fe:	e9 60 fb ff ff       	jmp    102163 <__alltraps>

00102603 <vector129>:
.globl vector129
vector129:
  pushl $0
  102603:	6a 00                	push   $0x0
  pushl $129
  102605:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10260a:	e9 54 fb ff ff       	jmp    102163 <__alltraps>

0010260f <vector130>:
.globl vector130
vector130:
  pushl $0
  10260f:	6a 00                	push   $0x0
  pushl $130
  102611:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102616:	e9 48 fb ff ff       	jmp    102163 <__alltraps>

0010261b <vector131>:
.globl vector131
vector131:
  pushl $0
  10261b:	6a 00                	push   $0x0
  pushl $131
  10261d:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102622:	e9 3c fb ff ff       	jmp    102163 <__alltraps>

00102627 <vector132>:
.globl vector132
vector132:
  pushl $0
  102627:	6a 00                	push   $0x0
  pushl $132
  102629:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10262e:	e9 30 fb ff ff       	jmp    102163 <__alltraps>

00102633 <vector133>:
.globl vector133
vector133:
  pushl $0
  102633:	6a 00                	push   $0x0
  pushl $133
  102635:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10263a:	e9 24 fb ff ff       	jmp    102163 <__alltraps>

0010263f <vector134>:
.globl vector134
vector134:
  pushl $0
  10263f:	6a 00                	push   $0x0
  pushl $134
  102641:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102646:	e9 18 fb ff ff       	jmp    102163 <__alltraps>

0010264b <vector135>:
.globl vector135
vector135:
  pushl $0
  10264b:	6a 00                	push   $0x0
  pushl $135
  10264d:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102652:	e9 0c fb ff ff       	jmp    102163 <__alltraps>

00102657 <vector136>:
.globl vector136
vector136:
  pushl $0
  102657:	6a 00                	push   $0x0
  pushl $136
  102659:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10265e:	e9 00 fb ff ff       	jmp    102163 <__alltraps>

00102663 <vector137>:
.globl vector137
vector137:
  pushl $0
  102663:	6a 00                	push   $0x0
  pushl $137
  102665:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10266a:	e9 f4 fa ff ff       	jmp    102163 <__alltraps>

0010266f <vector138>:
.globl vector138
vector138:
  pushl $0
  10266f:	6a 00                	push   $0x0
  pushl $138
  102671:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102676:	e9 e8 fa ff ff       	jmp    102163 <__alltraps>

0010267b <vector139>:
.globl vector139
vector139:
  pushl $0
  10267b:	6a 00                	push   $0x0
  pushl $139
  10267d:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102682:	e9 dc fa ff ff       	jmp    102163 <__alltraps>

00102687 <vector140>:
.globl vector140
vector140:
  pushl $0
  102687:	6a 00                	push   $0x0
  pushl $140
  102689:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  10268e:	e9 d0 fa ff ff       	jmp    102163 <__alltraps>

00102693 <vector141>:
.globl vector141
vector141:
  pushl $0
  102693:	6a 00                	push   $0x0
  pushl $141
  102695:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10269a:	e9 c4 fa ff ff       	jmp    102163 <__alltraps>

0010269f <vector142>:
.globl vector142
vector142:
  pushl $0
  10269f:	6a 00                	push   $0x0
  pushl $142
  1026a1:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1026a6:	e9 b8 fa ff ff       	jmp    102163 <__alltraps>

001026ab <vector143>:
.globl vector143
vector143:
  pushl $0
  1026ab:	6a 00                	push   $0x0
  pushl $143
  1026ad:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1026b2:	e9 ac fa ff ff       	jmp    102163 <__alltraps>

001026b7 <vector144>:
.globl vector144
vector144:
  pushl $0
  1026b7:	6a 00                	push   $0x0
  pushl $144
  1026b9:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1026be:	e9 a0 fa ff ff       	jmp    102163 <__alltraps>

001026c3 <vector145>:
.globl vector145
vector145:
  pushl $0
  1026c3:	6a 00                	push   $0x0
  pushl $145
  1026c5:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1026ca:	e9 94 fa ff ff       	jmp    102163 <__alltraps>

001026cf <vector146>:
.globl vector146
vector146:
  pushl $0
  1026cf:	6a 00                	push   $0x0
  pushl $146
  1026d1:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1026d6:	e9 88 fa ff ff       	jmp    102163 <__alltraps>

001026db <vector147>:
.globl vector147
vector147:
  pushl $0
  1026db:	6a 00                	push   $0x0
  pushl $147
  1026dd:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1026e2:	e9 7c fa ff ff       	jmp    102163 <__alltraps>

001026e7 <vector148>:
.globl vector148
vector148:
  pushl $0
  1026e7:	6a 00                	push   $0x0
  pushl $148
  1026e9:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1026ee:	e9 70 fa ff ff       	jmp    102163 <__alltraps>

001026f3 <vector149>:
.globl vector149
vector149:
  pushl $0
  1026f3:	6a 00                	push   $0x0
  pushl $149
  1026f5:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1026fa:	e9 64 fa ff ff       	jmp    102163 <__alltraps>

001026ff <vector150>:
.globl vector150
vector150:
  pushl $0
  1026ff:	6a 00                	push   $0x0
  pushl $150
  102701:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102706:	e9 58 fa ff ff       	jmp    102163 <__alltraps>

0010270b <vector151>:
.globl vector151
vector151:
  pushl $0
  10270b:	6a 00                	push   $0x0
  pushl $151
  10270d:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102712:	e9 4c fa ff ff       	jmp    102163 <__alltraps>

00102717 <vector152>:
.globl vector152
vector152:
  pushl $0
  102717:	6a 00                	push   $0x0
  pushl $152
  102719:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10271e:	e9 40 fa ff ff       	jmp    102163 <__alltraps>

00102723 <vector153>:
.globl vector153
vector153:
  pushl $0
  102723:	6a 00                	push   $0x0
  pushl $153
  102725:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10272a:	e9 34 fa ff ff       	jmp    102163 <__alltraps>

0010272f <vector154>:
.globl vector154
vector154:
  pushl $0
  10272f:	6a 00                	push   $0x0
  pushl $154
  102731:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102736:	e9 28 fa ff ff       	jmp    102163 <__alltraps>

0010273b <vector155>:
.globl vector155
vector155:
  pushl $0
  10273b:	6a 00                	push   $0x0
  pushl $155
  10273d:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102742:	e9 1c fa ff ff       	jmp    102163 <__alltraps>

00102747 <vector156>:
.globl vector156
vector156:
  pushl $0
  102747:	6a 00                	push   $0x0
  pushl $156
  102749:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10274e:	e9 10 fa ff ff       	jmp    102163 <__alltraps>

00102753 <vector157>:
.globl vector157
vector157:
  pushl $0
  102753:	6a 00                	push   $0x0
  pushl $157
  102755:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10275a:	e9 04 fa ff ff       	jmp    102163 <__alltraps>

0010275f <vector158>:
.globl vector158
vector158:
  pushl $0
  10275f:	6a 00                	push   $0x0
  pushl $158
  102761:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102766:	e9 f8 f9 ff ff       	jmp    102163 <__alltraps>

0010276b <vector159>:
.globl vector159
vector159:
  pushl $0
  10276b:	6a 00                	push   $0x0
  pushl $159
  10276d:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102772:	e9 ec f9 ff ff       	jmp    102163 <__alltraps>

00102777 <vector160>:
.globl vector160
vector160:
  pushl $0
  102777:	6a 00                	push   $0x0
  pushl $160
  102779:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  10277e:	e9 e0 f9 ff ff       	jmp    102163 <__alltraps>

00102783 <vector161>:
.globl vector161
vector161:
  pushl $0
  102783:	6a 00                	push   $0x0
  pushl $161
  102785:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10278a:	e9 d4 f9 ff ff       	jmp    102163 <__alltraps>

0010278f <vector162>:
.globl vector162
vector162:
  pushl $0
  10278f:	6a 00                	push   $0x0
  pushl $162
  102791:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102796:	e9 c8 f9 ff ff       	jmp    102163 <__alltraps>

0010279b <vector163>:
.globl vector163
vector163:
  pushl $0
  10279b:	6a 00                	push   $0x0
  pushl $163
  10279d:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1027a2:	e9 bc f9 ff ff       	jmp    102163 <__alltraps>

001027a7 <vector164>:
.globl vector164
vector164:
  pushl $0
  1027a7:	6a 00                	push   $0x0
  pushl $164
  1027a9:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1027ae:	e9 b0 f9 ff ff       	jmp    102163 <__alltraps>

001027b3 <vector165>:
.globl vector165
vector165:
  pushl $0
  1027b3:	6a 00                	push   $0x0
  pushl $165
  1027b5:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1027ba:	e9 a4 f9 ff ff       	jmp    102163 <__alltraps>

001027bf <vector166>:
.globl vector166
vector166:
  pushl $0
  1027bf:	6a 00                	push   $0x0
  pushl $166
  1027c1:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1027c6:	e9 98 f9 ff ff       	jmp    102163 <__alltraps>

001027cb <vector167>:
.globl vector167
vector167:
  pushl $0
  1027cb:	6a 00                	push   $0x0
  pushl $167
  1027cd:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1027d2:	e9 8c f9 ff ff       	jmp    102163 <__alltraps>

001027d7 <vector168>:
.globl vector168
vector168:
  pushl $0
  1027d7:	6a 00                	push   $0x0
  pushl $168
  1027d9:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1027de:	e9 80 f9 ff ff       	jmp    102163 <__alltraps>

001027e3 <vector169>:
.globl vector169
vector169:
  pushl $0
  1027e3:	6a 00                	push   $0x0
  pushl $169
  1027e5:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1027ea:	e9 74 f9 ff ff       	jmp    102163 <__alltraps>

001027ef <vector170>:
.globl vector170
vector170:
  pushl $0
  1027ef:	6a 00                	push   $0x0
  pushl $170
  1027f1:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1027f6:	e9 68 f9 ff ff       	jmp    102163 <__alltraps>

001027fb <vector171>:
.globl vector171
vector171:
  pushl $0
  1027fb:	6a 00                	push   $0x0
  pushl $171
  1027fd:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102802:	e9 5c f9 ff ff       	jmp    102163 <__alltraps>

00102807 <vector172>:
.globl vector172
vector172:
  pushl $0
  102807:	6a 00                	push   $0x0
  pushl $172
  102809:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10280e:	e9 50 f9 ff ff       	jmp    102163 <__alltraps>

00102813 <vector173>:
.globl vector173
vector173:
  pushl $0
  102813:	6a 00                	push   $0x0
  pushl $173
  102815:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10281a:	e9 44 f9 ff ff       	jmp    102163 <__alltraps>

0010281f <vector174>:
.globl vector174
vector174:
  pushl $0
  10281f:	6a 00                	push   $0x0
  pushl $174
  102821:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102826:	e9 38 f9 ff ff       	jmp    102163 <__alltraps>

0010282b <vector175>:
.globl vector175
vector175:
  pushl $0
  10282b:	6a 00                	push   $0x0
  pushl $175
  10282d:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102832:	e9 2c f9 ff ff       	jmp    102163 <__alltraps>

00102837 <vector176>:
.globl vector176
vector176:
  pushl $0
  102837:	6a 00                	push   $0x0
  pushl $176
  102839:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10283e:	e9 20 f9 ff ff       	jmp    102163 <__alltraps>

00102843 <vector177>:
.globl vector177
vector177:
  pushl $0
  102843:	6a 00                	push   $0x0
  pushl $177
  102845:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10284a:	e9 14 f9 ff ff       	jmp    102163 <__alltraps>

0010284f <vector178>:
.globl vector178
vector178:
  pushl $0
  10284f:	6a 00                	push   $0x0
  pushl $178
  102851:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102856:	e9 08 f9 ff ff       	jmp    102163 <__alltraps>

0010285b <vector179>:
.globl vector179
vector179:
  pushl $0
  10285b:	6a 00                	push   $0x0
  pushl $179
  10285d:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102862:	e9 fc f8 ff ff       	jmp    102163 <__alltraps>

00102867 <vector180>:
.globl vector180
vector180:
  pushl $0
  102867:	6a 00                	push   $0x0
  pushl $180
  102869:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  10286e:	e9 f0 f8 ff ff       	jmp    102163 <__alltraps>

00102873 <vector181>:
.globl vector181
vector181:
  pushl $0
  102873:	6a 00                	push   $0x0
  pushl $181
  102875:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  10287a:	e9 e4 f8 ff ff       	jmp    102163 <__alltraps>

0010287f <vector182>:
.globl vector182
vector182:
  pushl $0
  10287f:	6a 00                	push   $0x0
  pushl $182
  102881:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102886:	e9 d8 f8 ff ff       	jmp    102163 <__alltraps>

0010288b <vector183>:
.globl vector183
vector183:
  pushl $0
  10288b:	6a 00                	push   $0x0
  pushl $183
  10288d:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102892:	e9 cc f8 ff ff       	jmp    102163 <__alltraps>

00102897 <vector184>:
.globl vector184
vector184:
  pushl $0
  102897:	6a 00                	push   $0x0
  pushl $184
  102899:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  10289e:	e9 c0 f8 ff ff       	jmp    102163 <__alltraps>

001028a3 <vector185>:
.globl vector185
vector185:
  pushl $0
  1028a3:	6a 00                	push   $0x0
  pushl $185
  1028a5:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1028aa:	e9 b4 f8 ff ff       	jmp    102163 <__alltraps>

001028af <vector186>:
.globl vector186
vector186:
  pushl $0
  1028af:	6a 00                	push   $0x0
  pushl $186
  1028b1:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1028b6:	e9 a8 f8 ff ff       	jmp    102163 <__alltraps>

001028bb <vector187>:
.globl vector187
vector187:
  pushl $0
  1028bb:	6a 00                	push   $0x0
  pushl $187
  1028bd:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1028c2:	e9 9c f8 ff ff       	jmp    102163 <__alltraps>

001028c7 <vector188>:
.globl vector188
vector188:
  pushl $0
  1028c7:	6a 00                	push   $0x0
  pushl $188
  1028c9:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1028ce:	e9 90 f8 ff ff       	jmp    102163 <__alltraps>

001028d3 <vector189>:
.globl vector189
vector189:
  pushl $0
  1028d3:	6a 00                	push   $0x0
  pushl $189
  1028d5:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1028da:	e9 84 f8 ff ff       	jmp    102163 <__alltraps>

001028df <vector190>:
.globl vector190
vector190:
  pushl $0
  1028df:	6a 00                	push   $0x0
  pushl $190
  1028e1:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1028e6:	e9 78 f8 ff ff       	jmp    102163 <__alltraps>

001028eb <vector191>:
.globl vector191
vector191:
  pushl $0
  1028eb:	6a 00                	push   $0x0
  pushl $191
  1028ed:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1028f2:	e9 6c f8 ff ff       	jmp    102163 <__alltraps>

001028f7 <vector192>:
.globl vector192
vector192:
  pushl $0
  1028f7:	6a 00                	push   $0x0
  pushl $192
  1028f9:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1028fe:	e9 60 f8 ff ff       	jmp    102163 <__alltraps>

00102903 <vector193>:
.globl vector193
vector193:
  pushl $0
  102903:	6a 00                	push   $0x0
  pushl $193
  102905:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10290a:	e9 54 f8 ff ff       	jmp    102163 <__alltraps>

0010290f <vector194>:
.globl vector194
vector194:
  pushl $0
  10290f:	6a 00                	push   $0x0
  pushl $194
  102911:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102916:	e9 48 f8 ff ff       	jmp    102163 <__alltraps>

0010291b <vector195>:
.globl vector195
vector195:
  pushl $0
  10291b:	6a 00                	push   $0x0
  pushl $195
  10291d:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102922:	e9 3c f8 ff ff       	jmp    102163 <__alltraps>

00102927 <vector196>:
.globl vector196
vector196:
  pushl $0
  102927:	6a 00                	push   $0x0
  pushl $196
  102929:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10292e:	e9 30 f8 ff ff       	jmp    102163 <__alltraps>

00102933 <vector197>:
.globl vector197
vector197:
  pushl $0
  102933:	6a 00                	push   $0x0
  pushl $197
  102935:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10293a:	e9 24 f8 ff ff       	jmp    102163 <__alltraps>

0010293f <vector198>:
.globl vector198
vector198:
  pushl $0
  10293f:	6a 00                	push   $0x0
  pushl $198
  102941:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102946:	e9 18 f8 ff ff       	jmp    102163 <__alltraps>

0010294b <vector199>:
.globl vector199
vector199:
  pushl $0
  10294b:	6a 00                	push   $0x0
  pushl $199
  10294d:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102952:	e9 0c f8 ff ff       	jmp    102163 <__alltraps>

00102957 <vector200>:
.globl vector200
vector200:
  pushl $0
  102957:	6a 00                	push   $0x0
  pushl $200
  102959:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10295e:	e9 00 f8 ff ff       	jmp    102163 <__alltraps>

00102963 <vector201>:
.globl vector201
vector201:
  pushl $0
  102963:	6a 00                	push   $0x0
  pushl $201
  102965:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10296a:	e9 f4 f7 ff ff       	jmp    102163 <__alltraps>

0010296f <vector202>:
.globl vector202
vector202:
  pushl $0
  10296f:	6a 00                	push   $0x0
  pushl $202
  102971:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102976:	e9 e8 f7 ff ff       	jmp    102163 <__alltraps>

0010297b <vector203>:
.globl vector203
vector203:
  pushl $0
  10297b:	6a 00                	push   $0x0
  pushl $203
  10297d:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102982:	e9 dc f7 ff ff       	jmp    102163 <__alltraps>

00102987 <vector204>:
.globl vector204
vector204:
  pushl $0
  102987:	6a 00                	push   $0x0
  pushl $204
  102989:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  10298e:	e9 d0 f7 ff ff       	jmp    102163 <__alltraps>

00102993 <vector205>:
.globl vector205
vector205:
  pushl $0
  102993:	6a 00                	push   $0x0
  pushl $205
  102995:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10299a:	e9 c4 f7 ff ff       	jmp    102163 <__alltraps>

0010299f <vector206>:
.globl vector206
vector206:
  pushl $0
  10299f:	6a 00                	push   $0x0
  pushl $206
  1029a1:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1029a6:	e9 b8 f7 ff ff       	jmp    102163 <__alltraps>

001029ab <vector207>:
.globl vector207
vector207:
  pushl $0
  1029ab:	6a 00                	push   $0x0
  pushl $207
  1029ad:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1029b2:	e9 ac f7 ff ff       	jmp    102163 <__alltraps>

001029b7 <vector208>:
.globl vector208
vector208:
  pushl $0
  1029b7:	6a 00                	push   $0x0
  pushl $208
  1029b9:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1029be:	e9 a0 f7 ff ff       	jmp    102163 <__alltraps>

001029c3 <vector209>:
.globl vector209
vector209:
  pushl $0
  1029c3:	6a 00                	push   $0x0
  pushl $209
  1029c5:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1029ca:	e9 94 f7 ff ff       	jmp    102163 <__alltraps>

001029cf <vector210>:
.globl vector210
vector210:
  pushl $0
  1029cf:	6a 00                	push   $0x0
  pushl $210
  1029d1:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1029d6:	e9 88 f7 ff ff       	jmp    102163 <__alltraps>

001029db <vector211>:
.globl vector211
vector211:
  pushl $0
  1029db:	6a 00                	push   $0x0
  pushl $211
  1029dd:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1029e2:	e9 7c f7 ff ff       	jmp    102163 <__alltraps>

001029e7 <vector212>:
.globl vector212
vector212:
  pushl $0
  1029e7:	6a 00                	push   $0x0
  pushl $212
  1029e9:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1029ee:	e9 70 f7 ff ff       	jmp    102163 <__alltraps>

001029f3 <vector213>:
.globl vector213
vector213:
  pushl $0
  1029f3:	6a 00                	push   $0x0
  pushl $213
  1029f5:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1029fa:	e9 64 f7 ff ff       	jmp    102163 <__alltraps>

001029ff <vector214>:
.globl vector214
vector214:
  pushl $0
  1029ff:	6a 00                	push   $0x0
  pushl $214
  102a01:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102a06:	e9 58 f7 ff ff       	jmp    102163 <__alltraps>

00102a0b <vector215>:
.globl vector215
vector215:
  pushl $0
  102a0b:	6a 00                	push   $0x0
  pushl $215
  102a0d:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102a12:	e9 4c f7 ff ff       	jmp    102163 <__alltraps>

00102a17 <vector216>:
.globl vector216
vector216:
  pushl $0
  102a17:	6a 00                	push   $0x0
  pushl $216
  102a19:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102a1e:	e9 40 f7 ff ff       	jmp    102163 <__alltraps>

00102a23 <vector217>:
.globl vector217
vector217:
  pushl $0
  102a23:	6a 00                	push   $0x0
  pushl $217
  102a25:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102a2a:	e9 34 f7 ff ff       	jmp    102163 <__alltraps>

00102a2f <vector218>:
.globl vector218
vector218:
  pushl $0
  102a2f:	6a 00                	push   $0x0
  pushl $218
  102a31:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102a36:	e9 28 f7 ff ff       	jmp    102163 <__alltraps>

00102a3b <vector219>:
.globl vector219
vector219:
  pushl $0
  102a3b:	6a 00                	push   $0x0
  pushl $219
  102a3d:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102a42:	e9 1c f7 ff ff       	jmp    102163 <__alltraps>

00102a47 <vector220>:
.globl vector220
vector220:
  pushl $0
  102a47:	6a 00                	push   $0x0
  pushl $220
  102a49:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102a4e:	e9 10 f7 ff ff       	jmp    102163 <__alltraps>

00102a53 <vector221>:
.globl vector221
vector221:
  pushl $0
  102a53:	6a 00                	push   $0x0
  pushl $221
  102a55:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102a5a:	e9 04 f7 ff ff       	jmp    102163 <__alltraps>

00102a5f <vector222>:
.globl vector222
vector222:
  pushl $0
  102a5f:	6a 00                	push   $0x0
  pushl $222
  102a61:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102a66:	e9 f8 f6 ff ff       	jmp    102163 <__alltraps>

00102a6b <vector223>:
.globl vector223
vector223:
  pushl $0
  102a6b:	6a 00                	push   $0x0
  pushl $223
  102a6d:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102a72:	e9 ec f6 ff ff       	jmp    102163 <__alltraps>

00102a77 <vector224>:
.globl vector224
vector224:
  pushl $0
  102a77:	6a 00                	push   $0x0
  pushl $224
  102a79:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102a7e:	e9 e0 f6 ff ff       	jmp    102163 <__alltraps>

00102a83 <vector225>:
.globl vector225
vector225:
  pushl $0
  102a83:	6a 00                	push   $0x0
  pushl $225
  102a85:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102a8a:	e9 d4 f6 ff ff       	jmp    102163 <__alltraps>

00102a8f <vector226>:
.globl vector226
vector226:
  pushl $0
  102a8f:	6a 00                	push   $0x0
  pushl $226
  102a91:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102a96:	e9 c8 f6 ff ff       	jmp    102163 <__alltraps>

00102a9b <vector227>:
.globl vector227
vector227:
  pushl $0
  102a9b:	6a 00                	push   $0x0
  pushl $227
  102a9d:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102aa2:	e9 bc f6 ff ff       	jmp    102163 <__alltraps>

00102aa7 <vector228>:
.globl vector228
vector228:
  pushl $0
  102aa7:	6a 00                	push   $0x0
  pushl $228
  102aa9:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102aae:	e9 b0 f6 ff ff       	jmp    102163 <__alltraps>

00102ab3 <vector229>:
.globl vector229
vector229:
  pushl $0
  102ab3:	6a 00                	push   $0x0
  pushl $229
  102ab5:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102aba:	e9 a4 f6 ff ff       	jmp    102163 <__alltraps>

00102abf <vector230>:
.globl vector230
vector230:
  pushl $0
  102abf:	6a 00                	push   $0x0
  pushl $230
  102ac1:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102ac6:	e9 98 f6 ff ff       	jmp    102163 <__alltraps>

00102acb <vector231>:
.globl vector231
vector231:
  pushl $0
  102acb:	6a 00                	push   $0x0
  pushl $231
  102acd:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102ad2:	e9 8c f6 ff ff       	jmp    102163 <__alltraps>

00102ad7 <vector232>:
.globl vector232
vector232:
  pushl $0
  102ad7:	6a 00                	push   $0x0
  pushl $232
  102ad9:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102ade:	e9 80 f6 ff ff       	jmp    102163 <__alltraps>

00102ae3 <vector233>:
.globl vector233
vector233:
  pushl $0
  102ae3:	6a 00                	push   $0x0
  pushl $233
  102ae5:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102aea:	e9 74 f6 ff ff       	jmp    102163 <__alltraps>

00102aef <vector234>:
.globl vector234
vector234:
  pushl $0
  102aef:	6a 00                	push   $0x0
  pushl $234
  102af1:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102af6:	e9 68 f6 ff ff       	jmp    102163 <__alltraps>

00102afb <vector235>:
.globl vector235
vector235:
  pushl $0
  102afb:	6a 00                	push   $0x0
  pushl $235
  102afd:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102b02:	e9 5c f6 ff ff       	jmp    102163 <__alltraps>

00102b07 <vector236>:
.globl vector236
vector236:
  pushl $0
  102b07:	6a 00                	push   $0x0
  pushl $236
  102b09:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102b0e:	e9 50 f6 ff ff       	jmp    102163 <__alltraps>

00102b13 <vector237>:
.globl vector237
vector237:
  pushl $0
  102b13:	6a 00                	push   $0x0
  pushl $237
  102b15:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102b1a:	e9 44 f6 ff ff       	jmp    102163 <__alltraps>

00102b1f <vector238>:
.globl vector238
vector238:
  pushl $0
  102b1f:	6a 00                	push   $0x0
  pushl $238
  102b21:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102b26:	e9 38 f6 ff ff       	jmp    102163 <__alltraps>

00102b2b <vector239>:
.globl vector239
vector239:
  pushl $0
  102b2b:	6a 00                	push   $0x0
  pushl $239
  102b2d:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102b32:	e9 2c f6 ff ff       	jmp    102163 <__alltraps>

00102b37 <vector240>:
.globl vector240
vector240:
  pushl $0
  102b37:	6a 00                	push   $0x0
  pushl $240
  102b39:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102b3e:	e9 20 f6 ff ff       	jmp    102163 <__alltraps>

00102b43 <vector241>:
.globl vector241
vector241:
  pushl $0
  102b43:	6a 00                	push   $0x0
  pushl $241
  102b45:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102b4a:	e9 14 f6 ff ff       	jmp    102163 <__alltraps>

00102b4f <vector242>:
.globl vector242
vector242:
  pushl $0
  102b4f:	6a 00                	push   $0x0
  pushl $242
  102b51:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102b56:	e9 08 f6 ff ff       	jmp    102163 <__alltraps>

00102b5b <vector243>:
.globl vector243
vector243:
  pushl $0
  102b5b:	6a 00                	push   $0x0
  pushl $243
  102b5d:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102b62:	e9 fc f5 ff ff       	jmp    102163 <__alltraps>

00102b67 <vector244>:
.globl vector244
vector244:
  pushl $0
  102b67:	6a 00                	push   $0x0
  pushl $244
  102b69:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102b6e:	e9 f0 f5 ff ff       	jmp    102163 <__alltraps>

00102b73 <vector245>:
.globl vector245
vector245:
  pushl $0
  102b73:	6a 00                	push   $0x0
  pushl $245
  102b75:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102b7a:	e9 e4 f5 ff ff       	jmp    102163 <__alltraps>

00102b7f <vector246>:
.globl vector246
vector246:
  pushl $0
  102b7f:	6a 00                	push   $0x0
  pushl $246
  102b81:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102b86:	e9 d8 f5 ff ff       	jmp    102163 <__alltraps>

00102b8b <vector247>:
.globl vector247
vector247:
  pushl $0
  102b8b:	6a 00                	push   $0x0
  pushl $247
  102b8d:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102b92:	e9 cc f5 ff ff       	jmp    102163 <__alltraps>

00102b97 <vector248>:
.globl vector248
vector248:
  pushl $0
  102b97:	6a 00                	push   $0x0
  pushl $248
  102b99:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102b9e:	e9 c0 f5 ff ff       	jmp    102163 <__alltraps>

00102ba3 <vector249>:
.globl vector249
vector249:
  pushl $0
  102ba3:	6a 00                	push   $0x0
  pushl $249
  102ba5:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102baa:	e9 b4 f5 ff ff       	jmp    102163 <__alltraps>

00102baf <vector250>:
.globl vector250
vector250:
  pushl $0
  102baf:	6a 00                	push   $0x0
  pushl $250
  102bb1:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102bb6:	e9 a8 f5 ff ff       	jmp    102163 <__alltraps>

00102bbb <vector251>:
.globl vector251
vector251:
  pushl $0
  102bbb:	6a 00                	push   $0x0
  pushl $251
  102bbd:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102bc2:	e9 9c f5 ff ff       	jmp    102163 <__alltraps>

00102bc7 <vector252>:
.globl vector252
vector252:
  pushl $0
  102bc7:	6a 00                	push   $0x0
  pushl $252
  102bc9:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102bce:	e9 90 f5 ff ff       	jmp    102163 <__alltraps>

00102bd3 <vector253>:
.globl vector253
vector253:
  pushl $0
  102bd3:	6a 00                	push   $0x0
  pushl $253
  102bd5:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102bda:	e9 84 f5 ff ff       	jmp    102163 <__alltraps>

00102bdf <vector254>:
.globl vector254
vector254:
  pushl $0
  102bdf:	6a 00                	push   $0x0
  pushl $254
  102be1:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102be6:	e9 78 f5 ff ff       	jmp    102163 <__alltraps>

00102beb <vector255>:
.globl vector255
vector255:
  pushl $0
  102beb:	6a 00                	push   $0x0
  pushl $255
  102bed:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102bf2:	e9 6c f5 ff ff       	jmp    102163 <__alltraps>

00102bf7 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102bf7:	55                   	push   %ebp
  102bf8:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102bfa:	8b 45 08             	mov    0x8(%ebp),%eax
  102bfd:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102c00:	b8 23 00 00 00       	mov    $0x23,%eax
  102c05:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102c07:	b8 23 00 00 00       	mov    $0x23,%eax
  102c0c:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102c0e:	b8 10 00 00 00       	mov    $0x10,%eax
  102c13:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102c15:	b8 10 00 00 00       	mov    $0x10,%eax
  102c1a:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102c1c:	b8 10 00 00 00       	mov    $0x10,%eax
  102c21:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102c23:	ea 2a 2c 10 00 08 00 	ljmp   $0x8,$0x102c2a
}
  102c2a:	90                   	nop
  102c2b:	5d                   	pop    %ebp
  102c2c:	c3                   	ret    

00102c2d <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102c2d:	55                   	push   %ebp
  102c2e:	89 e5                	mov    %esp,%ebp
  102c30:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102c33:	b8 80 09 11 00       	mov    $0x110980,%eax
  102c38:	05 00 04 00 00       	add    $0x400,%eax
  102c3d:	a3 84 0d 11 00       	mov    %eax,0x110d84
    ts.ts_ss0 = KERNEL_DS;
  102c42:	66 c7 05 88 0d 11 00 	movw   $0x10,0x110d88
  102c49:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102c4b:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  102c52:	68 00 
  102c54:	b8 80 0d 11 00       	mov    $0x110d80,%eax
  102c59:	0f b7 c0             	movzwl %ax,%eax
  102c5c:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  102c62:	b8 80 0d 11 00       	mov    $0x110d80,%eax
  102c67:	c1 e8 10             	shr    $0x10,%eax
  102c6a:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  102c6f:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102c76:	24 f0                	and    $0xf0,%al
  102c78:	0c 09                	or     $0x9,%al
  102c7a:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102c7f:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102c86:	0c 10                	or     $0x10,%al
  102c88:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102c8d:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102c94:	24 9f                	and    $0x9f,%al
  102c96:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102c9b:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102ca2:	0c 80                	or     $0x80,%al
  102ca4:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102ca9:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102cb0:	24 f0                	and    $0xf0,%al
  102cb2:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102cb7:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102cbe:	24 ef                	and    $0xef,%al
  102cc0:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102cc5:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102ccc:	24 df                	and    $0xdf,%al
  102cce:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102cd3:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102cda:	0c 40                	or     $0x40,%al
  102cdc:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102ce1:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102ce8:	24 7f                	and    $0x7f,%al
  102cea:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102cef:	b8 80 0d 11 00       	mov    $0x110d80,%eax
  102cf4:	c1 e8 18             	shr    $0x18,%eax
  102cf7:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102cfc:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102d03:	24 ef                	and    $0xef,%al
  102d05:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102d0a:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  102d11:	e8 e1 fe ff ff       	call   102bf7 <lgdt>
  102d16:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("ltr %0" :: "r" (sel));
  102d1c:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102d20:	0f 00 d8             	ltr    %ax
}
  102d23:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102d24:	90                   	nop
  102d25:	89 ec                	mov    %ebp,%esp
  102d27:	5d                   	pop    %ebp
  102d28:	c3                   	ret    

00102d29 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102d29:	55                   	push   %ebp
  102d2a:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102d2c:	e8 fc fe ff ff       	call   102c2d <gdt_init>
}
  102d31:	90                   	nop
  102d32:	5d                   	pop    %ebp
  102d33:	c3                   	ret    

00102d34 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102d34:	55                   	push   %ebp
  102d35:	89 e5                	mov    %esp,%ebp
  102d37:	83 ec 58             	sub    $0x58,%esp
  102d3a:	8b 45 10             	mov    0x10(%ebp),%eax
  102d3d:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102d40:	8b 45 14             	mov    0x14(%ebp),%eax
  102d43:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102d46:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102d49:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102d4c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102d4f:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102d52:	8b 45 18             	mov    0x18(%ebp),%eax
  102d55:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102d58:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d5b:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102d5e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102d61:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102d64:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d67:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d6a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102d6e:	74 1c                	je     102d8c <printnum+0x58>
  102d70:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d73:	ba 00 00 00 00       	mov    $0x0,%edx
  102d78:	f7 75 e4             	divl   -0x1c(%ebp)
  102d7b:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102d7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d81:	ba 00 00 00 00       	mov    $0x0,%edx
  102d86:	f7 75 e4             	divl   -0x1c(%ebp)
  102d89:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d8c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d8f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d92:	f7 75 e4             	divl   -0x1c(%ebp)
  102d95:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102d98:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102d9b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d9e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102da1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102da4:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102da7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102daa:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102dad:	8b 45 18             	mov    0x18(%ebp),%eax
  102db0:	ba 00 00 00 00       	mov    $0x0,%edx
  102db5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102db8:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102dbb:	19 d1                	sbb    %edx,%ecx
  102dbd:	72 4c                	jb     102e0b <printnum+0xd7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102dbf:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102dc2:	8d 50 ff             	lea    -0x1(%eax),%edx
  102dc5:	8b 45 20             	mov    0x20(%ebp),%eax
  102dc8:	89 44 24 18          	mov    %eax,0x18(%esp)
  102dcc:	89 54 24 14          	mov    %edx,0x14(%esp)
  102dd0:	8b 45 18             	mov    0x18(%ebp),%eax
  102dd3:	89 44 24 10          	mov    %eax,0x10(%esp)
  102dd7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102dda:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102ddd:	89 44 24 08          	mov    %eax,0x8(%esp)
  102de1:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102de5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102de8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dec:	8b 45 08             	mov    0x8(%ebp),%eax
  102def:	89 04 24             	mov    %eax,(%esp)
  102df2:	e8 3d ff ff ff       	call   102d34 <printnum>
  102df7:	eb 1b                	jmp    102e14 <printnum+0xe0>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102df9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dfc:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e00:	8b 45 20             	mov    0x20(%ebp),%eax
  102e03:	89 04 24             	mov    %eax,(%esp)
  102e06:	8b 45 08             	mov    0x8(%ebp),%eax
  102e09:	ff d0                	call   *%eax
        while (-- width > 0)
  102e0b:	ff 4d 1c             	decl   0x1c(%ebp)
  102e0e:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102e12:	7f e5                	jg     102df9 <printnum+0xc5>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102e14:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102e17:	05 30 40 10 00       	add    $0x104030,%eax
  102e1c:	0f b6 00             	movzbl (%eax),%eax
  102e1f:	0f be c0             	movsbl %al,%eax
  102e22:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e25:	89 54 24 04          	mov    %edx,0x4(%esp)
  102e29:	89 04 24             	mov    %eax,(%esp)
  102e2c:	8b 45 08             	mov    0x8(%ebp),%eax
  102e2f:	ff d0                	call   *%eax
}
  102e31:	90                   	nop
  102e32:	89 ec                	mov    %ebp,%esp
  102e34:	5d                   	pop    %ebp
  102e35:	c3                   	ret    

00102e36 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102e36:	55                   	push   %ebp
  102e37:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102e39:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102e3d:	7e 14                	jle    102e53 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102e3f:	8b 45 08             	mov    0x8(%ebp),%eax
  102e42:	8b 00                	mov    (%eax),%eax
  102e44:	8d 48 08             	lea    0x8(%eax),%ecx
  102e47:	8b 55 08             	mov    0x8(%ebp),%edx
  102e4a:	89 0a                	mov    %ecx,(%edx)
  102e4c:	8b 50 04             	mov    0x4(%eax),%edx
  102e4f:	8b 00                	mov    (%eax),%eax
  102e51:	eb 30                	jmp    102e83 <getuint+0x4d>
    }
    else if (lflag) {
  102e53:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102e57:	74 16                	je     102e6f <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102e59:	8b 45 08             	mov    0x8(%ebp),%eax
  102e5c:	8b 00                	mov    (%eax),%eax
  102e5e:	8d 48 04             	lea    0x4(%eax),%ecx
  102e61:	8b 55 08             	mov    0x8(%ebp),%edx
  102e64:	89 0a                	mov    %ecx,(%edx)
  102e66:	8b 00                	mov    (%eax),%eax
  102e68:	ba 00 00 00 00       	mov    $0x0,%edx
  102e6d:	eb 14                	jmp    102e83 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102e6f:	8b 45 08             	mov    0x8(%ebp),%eax
  102e72:	8b 00                	mov    (%eax),%eax
  102e74:	8d 48 04             	lea    0x4(%eax),%ecx
  102e77:	8b 55 08             	mov    0x8(%ebp),%edx
  102e7a:	89 0a                	mov    %ecx,(%edx)
  102e7c:	8b 00                	mov    (%eax),%eax
  102e7e:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102e83:	5d                   	pop    %ebp
  102e84:	c3                   	ret    

00102e85 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102e85:	55                   	push   %ebp
  102e86:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102e88:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102e8c:	7e 14                	jle    102ea2 <getint+0x1d>
        return va_arg(*ap, long long);
  102e8e:	8b 45 08             	mov    0x8(%ebp),%eax
  102e91:	8b 00                	mov    (%eax),%eax
  102e93:	8d 48 08             	lea    0x8(%eax),%ecx
  102e96:	8b 55 08             	mov    0x8(%ebp),%edx
  102e99:	89 0a                	mov    %ecx,(%edx)
  102e9b:	8b 50 04             	mov    0x4(%eax),%edx
  102e9e:	8b 00                	mov    (%eax),%eax
  102ea0:	eb 28                	jmp    102eca <getint+0x45>
    }
    else if (lflag) {
  102ea2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102ea6:	74 12                	je     102eba <getint+0x35>
        return va_arg(*ap, long);
  102ea8:	8b 45 08             	mov    0x8(%ebp),%eax
  102eab:	8b 00                	mov    (%eax),%eax
  102ead:	8d 48 04             	lea    0x4(%eax),%ecx
  102eb0:	8b 55 08             	mov    0x8(%ebp),%edx
  102eb3:	89 0a                	mov    %ecx,(%edx)
  102eb5:	8b 00                	mov    (%eax),%eax
  102eb7:	99                   	cltd   
  102eb8:	eb 10                	jmp    102eca <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102eba:	8b 45 08             	mov    0x8(%ebp),%eax
  102ebd:	8b 00                	mov    (%eax),%eax
  102ebf:	8d 48 04             	lea    0x4(%eax),%ecx
  102ec2:	8b 55 08             	mov    0x8(%ebp),%edx
  102ec5:	89 0a                	mov    %ecx,(%edx)
  102ec7:	8b 00                	mov    (%eax),%eax
  102ec9:	99                   	cltd   
    }
}
  102eca:	5d                   	pop    %ebp
  102ecb:	c3                   	ret    

00102ecc <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102ecc:	55                   	push   %ebp
  102ecd:	89 e5                	mov    %esp,%ebp
  102ecf:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102ed2:	8d 45 14             	lea    0x14(%ebp),%eax
  102ed5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102ed8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102edb:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102edf:	8b 45 10             	mov    0x10(%ebp),%eax
  102ee2:	89 44 24 08          	mov    %eax,0x8(%esp)
  102ee6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ee9:	89 44 24 04          	mov    %eax,0x4(%esp)
  102eed:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef0:	89 04 24             	mov    %eax,(%esp)
  102ef3:	e8 05 00 00 00       	call   102efd <vprintfmt>
    va_end(ap);
}
  102ef8:	90                   	nop
  102ef9:	89 ec                	mov    %ebp,%esp
  102efb:	5d                   	pop    %ebp
  102efc:	c3                   	ret    

00102efd <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102efd:	55                   	push   %ebp
  102efe:	89 e5                	mov    %esp,%ebp
  102f00:	56                   	push   %esi
  102f01:	53                   	push   %ebx
  102f02:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102f05:	eb 17                	jmp    102f1e <vprintfmt+0x21>
            if (ch == '\0') {
  102f07:	85 db                	test   %ebx,%ebx
  102f09:	0f 84 bf 03 00 00    	je     1032ce <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  102f0f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f12:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f16:	89 1c 24             	mov    %ebx,(%esp)
  102f19:	8b 45 08             	mov    0x8(%ebp),%eax
  102f1c:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102f1e:	8b 45 10             	mov    0x10(%ebp),%eax
  102f21:	8d 50 01             	lea    0x1(%eax),%edx
  102f24:	89 55 10             	mov    %edx,0x10(%ebp)
  102f27:	0f b6 00             	movzbl (%eax),%eax
  102f2a:	0f b6 d8             	movzbl %al,%ebx
  102f2d:	83 fb 25             	cmp    $0x25,%ebx
  102f30:	75 d5                	jne    102f07 <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  102f32:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102f36:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102f3d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102f40:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102f43:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102f4a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102f4d:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102f50:	8b 45 10             	mov    0x10(%ebp),%eax
  102f53:	8d 50 01             	lea    0x1(%eax),%edx
  102f56:	89 55 10             	mov    %edx,0x10(%ebp)
  102f59:	0f b6 00             	movzbl (%eax),%eax
  102f5c:	0f b6 d8             	movzbl %al,%ebx
  102f5f:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102f62:	83 f8 55             	cmp    $0x55,%eax
  102f65:	0f 87 37 03 00 00    	ja     1032a2 <vprintfmt+0x3a5>
  102f6b:	8b 04 85 54 40 10 00 	mov    0x104054(,%eax,4),%eax
  102f72:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102f74:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102f78:	eb d6                	jmp    102f50 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102f7a:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102f7e:	eb d0                	jmp    102f50 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102f80:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102f87:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102f8a:	89 d0                	mov    %edx,%eax
  102f8c:	c1 e0 02             	shl    $0x2,%eax
  102f8f:	01 d0                	add    %edx,%eax
  102f91:	01 c0                	add    %eax,%eax
  102f93:	01 d8                	add    %ebx,%eax
  102f95:	83 e8 30             	sub    $0x30,%eax
  102f98:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102f9b:	8b 45 10             	mov    0x10(%ebp),%eax
  102f9e:	0f b6 00             	movzbl (%eax),%eax
  102fa1:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102fa4:	83 fb 2f             	cmp    $0x2f,%ebx
  102fa7:	7e 38                	jle    102fe1 <vprintfmt+0xe4>
  102fa9:	83 fb 39             	cmp    $0x39,%ebx
  102fac:	7f 33                	jg     102fe1 <vprintfmt+0xe4>
            for (precision = 0; ; ++ fmt) {
  102fae:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  102fb1:	eb d4                	jmp    102f87 <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102fb3:	8b 45 14             	mov    0x14(%ebp),%eax
  102fb6:	8d 50 04             	lea    0x4(%eax),%edx
  102fb9:	89 55 14             	mov    %edx,0x14(%ebp)
  102fbc:	8b 00                	mov    (%eax),%eax
  102fbe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102fc1:	eb 1f                	jmp    102fe2 <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  102fc3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102fc7:	79 87                	jns    102f50 <vprintfmt+0x53>
                width = 0;
  102fc9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102fd0:	e9 7b ff ff ff       	jmp    102f50 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102fd5:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102fdc:	e9 6f ff ff ff       	jmp    102f50 <vprintfmt+0x53>
            goto process_precision;
  102fe1:	90                   	nop

        process_precision:
            if (width < 0)
  102fe2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102fe6:	0f 89 64 ff ff ff    	jns    102f50 <vprintfmt+0x53>
                width = precision, precision = -1;
  102fec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102fef:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ff2:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102ff9:	e9 52 ff ff ff       	jmp    102f50 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102ffe:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  103001:	e9 4a ff ff ff       	jmp    102f50 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  103006:	8b 45 14             	mov    0x14(%ebp),%eax
  103009:	8d 50 04             	lea    0x4(%eax),%edx
  10300c:	89 55 14             	mov    %edx,0x14(%ebp)
  10300f:	8b 00                	mov    (%eax),%eax
  103011:	8b 55 0c             	mov    0xc(%ebp),%edx
  103014:	89 54 24 04          	mov    %edx,0x4(%esp)
  103018:	89 04 24             	mov    %eax,(%esp)
  10301b:	8b 45 08             	mov    0x8(%ebp),%eax
  10301e:	ff d0                	call   *%eax
            break;
  103020:	e9 a4 02 00 00       	jmp    1032c9 <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103025:	8b 45 14             	mov    0x14(%ebp),%eax
  103028:	8d 50 04             	lea    0x4(%eax),%edx
  10302b:	89 55 14             	mov    %edx,0x14(%ebp)
  10302e:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103030:	85 db                	test   %ebx,%ebx
  103032:	79 02                	jns    103036 <vprintfmt+0x139>
                err = -err;
  103034:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103036:	83 fb 06             	cmp    $0x6,%ebx
  103039:	7f 0b                	jg     103046 <vprintfmt+0x149>
  10303b:	8b 34 9d 14 40 10 00 	mov    0x104014(,%ebx,4),%esi
  103042:	85 f6                	test   %esi,%esi
  103044:	75 23                	jne    103069 <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  103046:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  10304a:	c7 44 24 08 41 40 10 	movl   $0x104041,0x8(%esp)
  103051:	00 
  103052:	8b 45 0c             	mov    0xc(%ebp),%eax
  103055:	89 44 24 04          	mov    %eax,0x4(%esp)
  103059:	8b 45 08             	mov    0x8(%ebp),%eax
  10305c:	89 04 24             	mov    %eax,(%esp)
  10305f:	e8 68 fe ff ff       	call   102ecc <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103064:	e9 60 02 00 00       	jmp    1032c9 <vprintfmt+0x3cc>
                printfmt(putch, putdat, "%s", p);
  103069:	89 74 24 0c          	mov    %esi,0xc(%esp)
  10306d:	c7 44 24 08 4a 40 10 	movl   $0x10404a,0x8(%esp)
  103074:	00 
  103075:	8b 45 0c             	mov    0xc(%ebp),%eax
  103078:	89 44 24 04          	mov    %eax,0x4(%esp)
  10307c:	8b 45 08             	mov    0x8(%ebp),%eax
  10307f:	89 04 24             	mov    %eax,(%esp)
  103082:	e8 45 fe ff ff       	call   102ecc <printfmt>
            break;
  103087:	e9 3d 02 00 00       	jmp    1032c9 <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  10308c:	8b 45 14             	mov    0x14(%ebp),%eax
  10308f:	8d 50 04             	lea    0x4(%eax),%edx
  103092:	89 55 14             	mov    %edx,0x14(%ebp)
  103095:	8b 30                	mov    (%eax),%esi
  103097:	85 f6                	test   %esi,%esi
  103099:	75 05                	jne    1030a0 <vprintfmt+0x1a3>
                p = "(null)";
  10309b:	be 4d 40 10 00       	mov    $0x10404d,%esi
            }
            if (width > 0 && padc != '-') {
  1030a0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1030a4:	7e 76                	jle    10311c <vprintfmt+0x21f>
  1030a6:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  1030aa:	74 70                	je     10311c <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  1030ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1030af:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030b3:	89 34 24             	mov    %esi,(%esp)
  1030b6:	e8 16 03 00 00       	call   1033d1 <strnlen>
  1030bb:	89 c2                	mov    %eax,%edx
  1030bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1030c0:	29 d0                	sub    %edx,%eax
  1030c2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1030c5:	eb 16                	jmp    1030dd <vprintfmt+0x1e0>
                    putch(padc, putdat);
  1030c7:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  1030cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  1030ce:	89 54 24 04          	mov    %edx,0x4(%esp)
  1030d2:	89 04 24             	mov    %eax,(%esp)
  1030d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d8:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  1030da:	ff 4d e8             	decl   -0x18(%ebp)
  1030dd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1030e1:	7f e4                	jg     1030c7 <vprintfmt+0x1ca>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1030e3:	eb 37                	jmp    10311c <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  1030e5:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  1030e9:	74 1f                	je     10310a <vprintfmt+0x20d>
  1030eb:	83 fb 1f             	cmp    $0x1f,%ebx
  1030ee:	7e 05                	jle    1030f5 <vprintfmt+0x1f8>
  1030f0:	83 fb 7e             	cmp    $0x7e,%ebx
  1030f3:	7e 15                	jle    10310a <vprintfmt+0x20d>
                    putch('?', putdat);
  1030f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030f8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030fc:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  103103:	8b 45 08             	mov    0x8(%ebp),%eax
  103106:	ff d0                	call   *%eax
  103108:	eb 0f                	jmp    103119 <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  10310a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10310d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103111:	89 1c 24             	mov    %ebx,(%esp)
  103114:	8b 45 08             	mov    0x8(%ebp),%eax
  103117:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103119:	ff 4d e8             	decl   -0x18(%ebp)
  10311c:	89 f0                	mov    %esi,%eax
  10311e:	8d 70 01             	lea    0x1(%eax),%esi
  103121:	0f b6 00             	movzbl (%eax),%eax
  103124:	0f be d8             	movsbl %al,%ebx
  103127:	85 db                	test   %ebx,%ebx
  103129:	74 27                	je     103152 <vprintfmt+0x255>
  10312b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10312f:	78 b4                	js     1030e5 <vprintfmt+0x1e8>
  103131:	ff 4d e4             	decl   -0x1c(%ebp)
  103134:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103138:	79 ab                	jns    1030e5 <vprintfmt+0x1e8>
                }
            }
            for (; width > 0; width --) {
  10313a:	eb 16                	jmp    103152 <vprintfmt+0x255>
                putch(' ', putdat);
  10313c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10313f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103143:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10314a:	8b 45 08             	mov    0x8(%ebp),%eax
  10314d:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  10314f:	ff 4d e8             	decl   -0x18(%ebp)
  103152:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103156:	7f e4                	jg     10313c <vprintfmt+0x23f>
            }
            break;
  103158:	e9 6c 01 00 00       	jmp    1032c9 <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  10315d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103160:	89 44 24 04          	mov    %eax,0x4(%esp)
  103164:	8d 45 14             	lea    0x14(%ebp),%eax
  103167:	89 04 24             	mov    %eax,(%esp)
  10316a:	e8 16 fd ff ff       	call   102e85 <getint>
  10316f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103172:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  103175:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103178:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10317b:	85 d2                	test   %edx,%edx
  10317d:	79 26                	jns    1031a5 <vprintfmt+0x2a8>
                putch('-', putdat);
  10317f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103182:	89 44 24 04          	mov    %eax,0x4(%esp)
  103186:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  10318d:	8b 45 08             	mov    0x8(%ebp),%eax
  103190:	ff d0                	call   *%eax
                num = -(long long)num;
  103192:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103195:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103198:	f7 d8                	neg    %eax
  10319a:	83 d2 00             	adc    $0x0,%edx
  10319d:	f7 da                	neg    %edx
  10319f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031a2:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  1031a5:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1031ac:	e9 a8 00 00 00       	jmp    103259 <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1031b1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1031b4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031b8:	8d 45 14             	lea    0x14(%ebp),%eax
  1031bb:	89 04 24             	mov    %eax,(%esp)
  1031be:	e8 73 fc ff ff       	call   102e36 <getuint>
  1031c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031c6:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1031c9:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1031d0:	e9 84 00 00 00       	jmp    103259 <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1031d5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1031d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031dc:	8d 45 14             	lea    0x14(%ebp),%eax
  1031df:	89 04 24             	mov    %eax,(%esp)
  1031e2:	e8 4f fc ff ff       	call   102e36 <getuint>
  1031e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031ea:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  1031ed:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1031f4:	eb 63                	jmp    103259 <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  1031f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031f9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031fd:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  103204:	8b 45 08             	mov    0x8(%ebp),%eax
  103207:	ff d0                	call   *%eax
            putch('x', putdat);
  103209:	8b 45 0c             	mov    0xc(%ebp),%eax
  10320c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103210:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103217:	8b 45 08             	mov    0x8(%ebp),%eax
  10321a:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  10321c:	8b 45 14             	mov    0x14(%ebp),%eax
  10321f:	8d 50 04             	lea    0x4(%eax),%edx
  103222:	89 55 14             	mov    %edx,0x14(%ebp)
  103225:	8b 00                	mov    (%eax),%eax
  103227:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10322a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103231:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103238:	eb 1f                	jmp    103259 <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  10323a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10323d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103241:	8d 45 14             	lea    0x14(%ebp),%eax
  103244:	89 04 24             	mov    %eax,(%esp)
  103247:	e8 ea fb ff ff       	call   102e36 <getuint>
  10324c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10324f:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  103252:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103259:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  10325d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103260:	89 54 24 18          	mov    %edx,0x18(%esp)
  103264:	8b 55 e8             	mov    -0x18(%ebp),%edx
  103267:	89 54 24 14          	mov    %edx,0x14(%esp)
  10326b:	89 44 24 10          	mov    %eax,0x10(%esp)
  10326f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103272:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103275:	89 44 24 08          	mov    %eax,0x8(%esp)
  103279:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10327d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103280:	89 44 24 04          	mov    %eax,0x4(%esp)
  103284:	8b 45 08             	mov    0x8(%ebp),%eax
  103287:	89 04 24             	mov    %eax,(%esp)
  10328a:	e8 a5 fa ff ff       	call   102d34 <printnum>
            break;
  10328f:	eb 38                	jmp    1032c9 <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103291:	8b 45 0c             	mov    0xc(%ebp),%eax
  103294:	89 44 24 04          	mov    %eax,0x4(%esp)
  103298:	89 1c 24             	mov    %ebx,(%esp)
  10329b:	8b 45 08             	mov    0x8(%ebp),%eax
  10329e:	ff d0                	call   *%eax
            break;
  1032a0:	eb 27                	jmp    1032c9 <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1032a2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032a5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032a9:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1032b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1032b3:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  1032b5:	ff 4d 10             	decl   0x10(%ebp)
  1032b8:	eb 03                	jmp    1032bd <vprintfmt+0x3c0>
  1032ba:	ff 4d 10             	decl   0x10(%ebp)
  1032bd:	8b 45 10             	mov    0x10(%ebp),%eax
  1032c0:	48                   	dec    %eax
  1032c1:	0f b6 00             	movzbl (%eax),%eax
  1032c4:	3c 25                	cmp    $0x25,%al
  1032c6:	75 f2                	jne    1032ba <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  1032c8:	90                   	nop
    while (1) {
  1032c9:	e9 37 fc ff ff       	jmp    102f05 <vprintfmt+0x8>
                return;
  1032ce:	90                   	nop
        }
    }
}
  1032cf:	83 c4 40             	add    $0x40,%esp
  1032d2:	5b                   	pop    %ebx
  1032d3:	5e                   	pop    %esi
  1032d4:	5d                   	pop    %ebp
  1032d5:	c3                   	ret    

001032d6 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1032d6:	55                   	push   %ebp
  1032d7:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1032d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032dc:	8b 40 08             	mov    0x8(%eax),%eax
  1032df:	8d 50 01             	lea    0x1(%eax),%edx
  1032e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032e5:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1032e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032eb:	8b 10                	mov    (%eax),%edx
  1032ed:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032f0:	8b 40 04             	mov    0x4(%eax),%eax
  1032f3:	39 c2                	cmp    %eax,%edx
  1032f5:	73 12                	jae    103309 <sprintputch+0x33>
        *b->buf ++ = ch;
  1032f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032fa:	8b 00                	mov    (%eax),%eax
  1032fc:	8d 48 01             	lea    0x1(%eax),%ecx
  1032ff:	8b 55 0c             	mov    0xc(%ebp),%edx
  103302:	89 0a                	mov    %ecx,(%edx)
  103304:	8b 55 08             	mov    0x8(%ebp),%edx
  103307:	88 10                	mov    %dl,(%eax)
    }
}
  103309:	90                   	nop
  10330a:	5d                   	pop    %ebp
  10330b:	c3                   	ret    

0010330c <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  10330c:	55                   	push   %ebp
  10330d:	89 e5                	mov    %esp,%ebp
  10330f:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103312:	8d 45 14             	lea    0x14(%ebp),%eax
  103315:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103318:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10331b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10331f:	8b 45 10             	mov    0x10(%ebp),%eax
  103322:	89 44 24 08          	mov    %eax,0x8(%esp)
  103326:	8b 45 0c             	mov    0xc(%ebp),%eax
  103329:	89 44 24 04          	mov    %eax,0x4(%esp)
  10332d:	8b 45 08             	mov    0x8(%ebp),%eax
  103330:	89 04 24             	mov    %eax,(%esp)
  103333:	e8 0a 00 00 00       	call   103342 <vsnprintf>
  103338:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10333b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10333e:	89 ec                	mov    %ebp,%esp
  103340:	5d                   	pop    %ebp
  103341:	c3                   	ret    

00103342 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103342:	55                   	push   %ebp
  103343:	89 e5                	mov    %esp,%ebp
  103345:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103348:	8b 45 08             	mov    0x8(%ebp),%eax
  10334b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10334e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103351:	8d 50 ff             	lea    -0x1(%eax),%edx
  103354:	8b 45 08             	mov    0x8(%ebp),%eax
  103357:	01 d0                	add    %edx,%eax
  103359:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10335c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  103363:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103367:	74 0a                	je     103373 <vsnprintf+0x31>
  103369:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10336c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10336f:	39 c2                	cmp    %eax,%edx
  103371:	76 07                	jbe    10337a <vsnprintf+0x38>
        return -E_INVAL;
  103373:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103378:	eb 2a                	jmp    1033a4 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  10337a:	8b 45 14             	mov    0x14(%ebp),%eax
  10337d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103381:	8b 45 10             	mov    0x10(%ebp),%eax
  103384:	89 44 24 08          	mov    %eax,0x8(%esp)
  103388:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10338b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10338f:	c7 04 24 d6 32 10 00 	movl   $0x1032d6,(%esp)
  103396:	e8 62 fb ff ff       	call   102efd <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  10339b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10339e:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1033a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1033a4:	89 ec                	mov    %ebp,%esp
  1033a6:	5d                   	pop    %ebp
  1033a7:	c3                   	ret    

001033a8 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  1033a8:	55                   	push   %ebp
  1033a9:	89 e5                	mov    %esp,%ebp
  1033ab:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1033ae:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  1033b5:	eb 03                	jmp    1033ba <strlen+0x12>
        cnt ++;
  1033b7:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  1033ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1033bd:	8d 50 01             	lea    0x1(%eax),%edx
  1033c0:	89 55 08             	mov    %edx,0x8(%ebp)
  1033c3:	0f b6 00             	movzbl (%eax),%eax
  1033c6:	84 c0                	test   %al,%al
  1033c8:	75 ed                	jne    1033b7 <strlen+0xf>
    }
    return cnt;
  1033ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1033cd:	89 ec                	mov    %ebp,%esp
  1033cf:	5d                   	pop    %ebp
  1033d0:	c3                   	ret    

001033d1 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  1033d1:	55                   	push   %ebp
  1033d2:	89 e5                	mov    %esp,%ebp
  1033d4:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1033d7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1033de:	eb 03                	jmp    1033e3 <strnlen+0x12>
        cnt ++;
  1033e0:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1033e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1033e6:	3b 45 0c             	cmp    0xc(%ebp),%eax
  1033e9:	73 10                	jae    1033fb <strnlen+0x2a>
  1033eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ee:	8d 50 01             	lea    0x1(%eax),%edx
  1033f1:	89 55 08             	mov    %edx,0x8(%ebp)
  1033f4:	0f b6 00             	movzbl (%eax),%eax
  1033f7:	84 c0                	test   %al,%al
  1033f9:	75 e5                	jne    1033e0 <strnlen+0xf>
    }
    return cnt;
  1033fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1033fe:	89 ec                	mov    %ebp,%esp
  103400:	5d                   	pop    %ebp
  103401:	c3                   	ret    

00103402 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  103402:	55                   	push   %ebp
  103403:	89 e5                	mov    %esp,%ebp
  103405:	57                   	push   %edi
  103406:	56                   	push   %esi
  103407:	83 ec 20             	sub    $0x20,%esp
  10340a:	8b 45 08             	mov    0x8(%ebp),%eax
  10340d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103410:	8b 45 0c             	mov    0xc(%ebp),%eax
  103413:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  103416:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103419:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10341c:	89 d1                	mov    %edx,%ecx
  10341e:	89 c2                	mov    %eax,%edx
  103420:	89 ce                	mov    %ecx,%esi
  103422:	89 d7                	mov    %edx,%edi
  103424:	ac                   	lods   %ds:(%esi),%al
  103425:	aa                   	stos   %al,%es:(%edi)
  103426:	84 c0                	test   %al,%al
  103428:	75 fa                	jne    103424 <strcpy+0x22>
  10342a:	89 fa                	mov    %edi,%edx
  10342c:	89 f1                	mov    %esi,%ecx
  10342e:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103431:	89 55 e8             	mov    %edx,-0x18(%ebp)
  103434:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return dst;
  103437:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  10343a:	83 c4 20             	add    $0x20,%esp
  10343d:	5e                   	pop    %esi
  10343e:	5f                   	pop    %edi
  10343f:	5d                   	pop    %ebp
  103440:	c3                   	ret    

00103441 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  103441:	55                   	push   %ebp
  103442:	89 e5                	mov    %esp,%ebp
  103444:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  103447:	8b 45 08             	mov    0x8(%ebp),%eax
  10344a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  10344d:	eb 1e                	jmp    10346d <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  10344f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103452:	0f b6 10             	movzbl (%eax),%edx
  103455:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103458:	88 10                	mov    %dl,(%eax)
  10345a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10345d:	0f b6 00             	movzbl (%eax),%eax
  103460:	84 c0                	test   %al,%al
  103462:	74 03                	je     103467 <strncpy+0x26>
            src ++;
  103464:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  103467:	ff 45 fc             	incl   -0x4(%ebp)
  10346a:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  10346d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103471:	75 dc                	jne    10344f <strncpy+0xe>
    }
    return dst;
  103473:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103476:	89 ec                	mov    %ebp,%esp
  103478:	5d                   	pop    %ebp
  103479:	c3                   	ret    

0010347a <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  10347a:	55                   	push   %ebp
  10347b:	89 e5                	mov    %esp,%ebp
  10347d:	57                   	push   %edi
  10347e:	56                   	push   %esi
  10347f:	83 ec 20             	sub    $0x20,%esp
  103482:	8b 45 08             	mov    0x8(%ebp),%eax
  103485:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103488:	8b 45 0c             	mov    0xc(%ebp),%eax
  10348b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  10348e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103491:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103494:	89 d1                	mov    %edx,%ecx
  103496:	89 c2                	mov    %eax,%edx
  103498:	89 ce                	mov    %ecx,%esi
  10349a:	89 d7                	mov    %edx,%edi
  10349c:	ac                   	lods   %ds:(%esi),%al
  10349d:	ae                   	scas   %es:(%edi),%al
  10349e:	75 08                	jne    1034a8 <strcmp+0x2e>
  1034a0:	84 c0                	test   %al,%al
  1034a2:	75 f8                	jne    10349c <strcmp+0x22>
  1034a4:	31 c0                	xor    %eax,%eax
  1034a6:	eb 04                	jmp    1034ac <strcmp+0x32>
  1034a8:	19 c0                	sbb    %eax,%eax
  1034aa:	0c 01                	or     $0x1,%al
  1034ac:	89 fa                	mov    %edi,%edx
  1034ae:	89 f1                	mov    %esi,%ecx
  1034b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1034b3:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1034b6:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  1034b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  1034bc:	83 c4 20             	add    $0x20,%esp
  1034bf:	5e                   	pop    %esi
  1034c0:	5f                   	pop    %edi
  1034c1:	5d                   	pop    %ebp
  1034c2:	c3                   	ret    

001034c3 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  1034c3:	55                   	push   %ebp
  1034c4:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1034c6:	eb 09                	jmp    1034d1 <strncmp+0xe>
        n --, s1 ++, s2 ++;
  1034c8:	ff 4d 10             	decl   0x10(%ebp)
  1034cb:	ff 45 08             	incl   0x8(%ebp)
  1034ce:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1034d1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1034d5:	74 1a                	je     1034f1 <strncmp+0x2e>
  1034d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1034da:	0f b6 00             	movzbl (%eax),%eax
  1034dd:	84 c0                	test   %al,%al
  1034df:	74 10                	je     1034f1 <strncmp+0x2e>
  1034e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1034e4:	0f b6 10             	movzbl (%eax),%edx
  1034e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034ea:	0f b6 00             	movzbl (%eax),%eax
  1034ed:	38 c2                	cmp    %al,%dl
  1034ef:	74 d7                	je     1034c8 <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  1034f1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1034f5:	74 18                	je     10350f <strncmp+0x4c>
  1034f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1034fa:	0f b6 00             	movzbl (%eax),%eax
  1034fd:	0f b6 d0             	movzbl %al,%edx
  103500:	8b 45 0c             	mov    0xc(%ebp),%eax
  103503:	0f b6 00             	movzbl (%eax),%eax
  103506:	0f b6 c8             	movzbl %al,%ecx
  103509:	89 d0                	mov    %edx,%eax
  10350b:	29 c8                	sub    %ecx,%eax
  10350d:	eb 05                	jmp    103514 <strncmp+0x51>
  10350f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103514:	5d                   	pop    %ebp
  103515:	c3                   	ret    

00103516 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  103516:	55                   	push   %ebp
  103517:	89 e5                	mov    %esp,%ebp
  103519:	83 ec 04             	sub    $0x4,%esp
  10351c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10351f:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  103522:	eb 13                	jmp    103537 <strchr+0x21>
        if (*s == c) {
  103524:	8b 45 08             	mov    0x8(%ebp),%eax
  103527:	0f b6 00             	movzbl (%eax),%eax
  10352a:	38 45 fc             	cmp    %al,-0x4(%ebp)
  10352d:	75 05                	jne    103534 <strchr+0x1e>
            return (char *)s;
  10352f:	8b 45 08             	mov    0x8(%ebp),%eax
  103532:	eb 12                	jmp    103546 <strchr+0x30>
        }
        s ++;
  103534:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  103537:	8b 45 08             	mov    0x8(%ebp),%eax
  10353a:	0f b6 00             	movzbl (%eax),%eax
  10353d:	84 c0                	test   %al,%al
  10353f:	75 e3                	jne    103524 <strchr+0xe>
    }
    return NULL;
  103541:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103546:	89 ec                	mov    %ebp,%esp
  103548:	5d                   	pop    %ebp
  103549:	c3                   	ret    

0010354a <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  10354a:	55                   	push   %ebp
  10354b:	89 e5                	mov    %esp,%ebp
  10354d:	83 ec 04             	sub    $0x4,%esp
  103550:	8b 45 0c             	mov    0xc(%ebp),%eax
  103553:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  103556:	eb 0e                	jmp    103566 <strfind+0x1c>
        if (*s == c) {
  103558:	8b 45 08             	mov    0x8(%ebp),%eax
  10355b:	0f b6 00             	movzbl (%eax),%eax
  10355e:	38 45 fc             	cmp    %al,-0x4(%ebp)
  103561:	74 0f                	je     103572 <strfind+0x28>
            break;
        }
        s ++;
  103563:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  103566:	8b 45 08             	mov    0x8(%ebp),%eax
  103569:	0f b6 00             	movzbl (%eax),%eax
  10356c:	84 c0                	test   %al,%al
  10356e:	75 e8                	jne    103558 <strfind+0xe>
  103570:	eb 01                	jmp    103573 <strfind+0x29>
            break;
  103572:	90                   	nop
    }
    return (char *)s;
  103573:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103576:	89 ec                	mov    %ebp,%esp
  103578:	5d                   	pop    %ebp
  103579:	c3                   	ret    

0010357a <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  10357a:	55                   	push   %ebp
  10357b:	89 e5                	mov    %esp,%ebp
  10357d:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  103580:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  103587:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  10358e:	eb 03                	jmp    103593 <strtol+0x19>
        s ++;
  103590:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  103593:	8b 45 08             	mov    0x8(%ebp),%eax
  103596:	0f b6 00             	movzbl (%eax),%eax
  103599:	3c 20                	cmp    $0x20,%al
  10359b:	74 f3                	je     103590 <strtol+0x16>
  10359d:	8b 45 08             	mov    0x8(%ebp),%eax
  1035a0:	0f b6 00             	movzbl (%eax),%eax
  1035a3:	3c 09                	cmp    $0x9,%al
  1035a5:	74 e9                	je     103590 <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  1035a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1035aa:	0f b6 00             	movzbl (%eax),%eax
  1035ad:	3c 2b                	cmp    $0x2b,%al
  1035af:	75 05                	jne    1035b6 <strtol+0x3c>
        s ++;
  1035b1:	ff 45 08             	incl   0x8(%ebp)
  1035b4:	eb 14                	jmp    1035ca <strtol+0x50>
    }
    else if (*s == '-') {
  1035b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1035b9:	0f b6 00             	movzbl (%eax),%eax
  1035bc:	3c 2d                	cmp    $0x2d,%al
  1035be:	75 0a                	jne    1035ca <strtol+0x50>
        s ++, neg = 1;
  1035c0:	ff 45 08             	incl   0x8(%ebp)
  1035c3:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  1035ca:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1035ce:	74 06                	je     1035d6 <strtol+0x5c>
  1035d0:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  1035d4:	75 22                	jne    1035f8 <strtol+0x7e>
  1035d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1035d9:	0f b6 00             	movzbl (%eax),%eax
  1035dc:	3c 30                	cmp    $0x30,%al
  1035de:	75 18                	jne    1035f8 <strtol+0x7e>
  1035e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1035e3:	40                   	inc    %eax
  1035e4:	0f b6 00             	movzbl (%eax),%eax
  1035e7:	3c 78                	cmp    $0x78,%al
  1035e9:	75 0d                	jne    1035f8 <strtol+0x7e>
        s += 2, base = 16;
  1035eb:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  1035ef:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  1035f6:	eb 29                	jmp    103621 <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  1035f8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1035fc:	75 16                	jne    103614 <strtol+0x9a>
  1035fe:	8b 45 08             	mov    0x8(%ebp),%eax
  103601:	0f b6 00             	movzbl (%eax),%eax
  103604:	3c 30                	cmp    $0x30,%al
  103606:	75 0c                	jne    103614 <strtol+0x9a>
        s ++, base = 8;
  103608:	ff 45 08             	incl   0x8(%ebp)
  10360b:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  103612:	eb 0d                	jmp    103621 <strtol+0xa7>
    }
    else if (base == 0) {
  103614:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103618:	75 07                	jne    103621 <strtol+0xa7>
        base = 10;
  10361a:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  103621:	8b 45 08             	mov    0x8(%ebp),%eax
  103624:	0f b6 00             	movzbl (%eax),%eax
  103627:	3c 2f                	cmp    $0x2f,%al
  103629:	7e 1b                	jle    103646 <strtol+0xcc>
  10362b:	8b 45 08             	mov    0x8(%ebp),%eax
  10362e:	0f b6 00             	movzbl (%eax),%eax
  103631:	3c 39                	cmp    $0x39,%al
  103633:	7f 11                	jg     103646 <strtol+0xcc>
            dig = *s - '0';
  103635:	8b 45 08             	mov    0x8(%ebp),%eax
  103638:	0f b6 00             	movzbl (%eax),%eax
  10363b:	0f be c0             	movsbl %al,%eax
  10363e:	83 e8 30             	sub    $0x30,%eax
  103641:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103644:	eb 48                	jmp    10368e <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  103646:	8b 45 08             	mov    0x8(%ebp),%eax
  103649:	0f b6 00             	movzbl (%eax),%eax
  10364c:	3c 60                	cmp    $0x60,%al
  10364e:	7e 1b                	jle    10366b <strtol+0xf1>
  103650:	8b 45 08             	mov    0x8(%ebp),%eax
  103653:	0f b6 00             	movzbl (%eax),%eax
  103656:	3c 7a                	cmp    $0x7a,%al
  103658:	7f 11                	jg     10366b <strtol+0xf1>
            dig = *s - 'a' + 10;
  10365a:	8b 45 08             	mov    0x8(%ebp),%eax
  10365d:	0f b6 00             	movzbl (%eax),%eax
  103660:	0f be c0             	movsbl %al,%eax
  103663:	83 e8 57             	sub    $0x57,%eax
  103666:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103669:	eb 23                	jmp    10368e <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  10366b:	8b 45 08             	mov    0x8(%ebp),%eax
  10366e:	0f b6 00             	movzbl (%eax),%eax
  103671:	3c 40                	cmp    $0x40,%al
  103673:	7e 3b                	jle    1036b0 <strtol+0x136>
  103675:	8b 45 08             	mov    0x8(%ebp),%eax
  103678:	0f b6 00             	movzbl (%eax),%eax
  10367b:	3c 5a                	cmp    $0x5a,%al
  10367d:	7f 31                	jg     1036b0 <strtol+0x136>
            dig = *s - 'A' + 10;
  10367f:	8b 45 08             	mov    0x8(%ebp),%eax
  103682:	0f b6 00             	movzbl (%eax),%eax
  103685:	0f be c0             	movsbl %al,%eax
  103688:	83 e8 37             	sub    $0x37,%eax
  10368b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  10368e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103691:	3b 45 10             	cmp    0x10(%ebp),%eax
  103694:	7d 19                	jge    1036af <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  103696:	ff 45 08             	incl   0x8(%ebp)
  103699:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10369c:	0f af 45 10          	imul   0x10(%ebp),%eax
  1036a0:	89 c2                	mov    %eax,%edx
  1036a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1036a5:	01 d0                	add    %edx,%eax
  1036a7:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  1036aa:	e9 72 ff ff ff       	jmp    103621 <strtol+0xa7>
            break;
  1036af:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  1036b0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1036b4:	74 08                	je     1036be <strtol+0x144>
        *endptr = (char *) s;
  1036b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036b9:	8b 55 08             	mov    0x8(%ebp),%edx
  1036bc:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  1036be:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1036c2:	74 07                	je     1036cb <strtol+0x151>
  1036c4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1036c7:	f7 d8                	neg    %eax
  1036c9:	eb 03                	jmp    1036ce <strtol+0x154>
  1036cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  1036ce:	89 ec                	mov    %ebp,%esp
  1036d0:	5d                   	pop    %ebp
  1036d1:	c3                   	ret    

001036d2 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  1036d2:	55                   	push   %ebp
  1036d3:	89 e5                	mov    %esp,%ebp
  1036d5:	83 ec 28             	sub    $0x28,%esp
  1036d8:	89 7d fc             	mov    %edi,-0x4(%ebp)
  1036db:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036de:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  1036e1:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  1036e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1036e8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1036eb:	88 55 f7             	mov    %dl,-0x9(%ebp)
  1036ee:	8b 45 10             	mov    0x10(%ebp),%eax
  1036f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  1036f4:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  1036f7:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  1036fb:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1036fe:	89 d7                	mov    %edx,%edi
  103700:	f3 aa                	rep stos %al,%es:(%edi)
  103702:	89 fa                	mov    %edi,%edx
  103704:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103707:	89 55 e8             	mov    %edx,-0x18(%ebp)
    return s;
  10370a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  10370d:	8b 7d fc             	mov    -0x4(%ebp),%edi
  103710:	89 ec                	mov    %ebp,%esp
  103712:	5d                   	pop    %ebp
  103713:	c3                   	ret    

00103714 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  103714:	55                   	push   %ebp
  103715:	89 e5                	mov    %esp,%ebp
  103717:	57                   	push   %edi
  103718:	56                   	push   %esi
  103719:	53                   	push   %ebx
  10371a:	83 ec 30             	sub    $0x30,%esp
  10371d:	8b 45 08             	mov    0x8(%ebp),%eax
  103720:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103723:	8b 45 0c             	mov    0xc(%ebp),%eax
  103726:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103729:	8b 45 10             	mov    0x10(%ebp),%eax
  10372c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if (dst < src) {
  10372f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103732:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  103735:	73 42                	jae    103779 <memmove+0x65>
  103737:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10373a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10373d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103740:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103743:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103746:	89 45 dc             	mov    %eax,-0x24(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103749:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10374c:	c1 e8 02             	shr    $0x2,%eax
  10374f:	89 c1                	mov    %eax,%ecx
    asm volatile (
  103751:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103754:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103757:	89 d7                	mov    %edx,%edi
  103759:	89 c6                	mov    %eax,%esi
  10375b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10375d:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  103760:	83 e1 03             	and    $0x3,%ecx
  103763:	74 02                	je     103767 <memmove+0x53>
  103765:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103767:	89 f0                	mov    %esi,%eax
  103769:	89 fa                	mov    %edi,%edx
  10376b:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  10376e:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  103771:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  103774:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  103777:	eb 36                	jmp    1037af <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  103779:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10377c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10377f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103782:	01 c2                	add    %eax,%edx
  103784:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103787:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10378a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10378d:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  103790:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103793:	89 c1                	mov    %eax,%ecx
  103795:	89 d8                	mov    %ebx,%eax
  103797:	89 d6                	mov    %edx,%esi
  103799:	89 c7                	mov    %eax,%edi
  10379b:	fd                   	std    
  10379c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10379e:	fc                   	cld    
  10379f:	89 f8                	mov    %edi,%eax
  1037a1:	89 f2                	mov    %esi,%edx
  1037a3:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  1037a6:	89 55 c8             	mov    %edx,-0x38(%ebp)
  1037a9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  1037ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  1037af:	83 c4 30             	add    $0x30,%esp
  1037b2:	5b                   	pop    %ebx
  1037b3:	5e                   	pop    %esi
  1037b4:	5f                   	pop    %edi
  1037b5:	5d                   	pop    %ebp
  1037b6:	c3                   	ret    

001037b7 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  1037b7:	55                   	push   %ebp
  1037b8:	89 e5                	mov    %esp,%ebp
  1037ba:	57                   	push   %edi
  1037bb:	56                   	push   %esi
  1037bc:	83 ec 20             	sub    $0x20,%esp
  1037bf:	8b 45 08             	mov    0x8(%ebp),%eax
  1037c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1037c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1037c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1037cb:	8b 45 10             	mov    0x10(%ebp),%eax
  1037ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1037d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1037d4:	c1 e8 02             	shr    $0x2,%eax
  1037d7:	89 c1                	mov    %eax,%ecx
    asm volatile (
  1037d9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1037dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1037df:	89 d7                	mov    %edx,%edi
  1037e1:	89 c6                	mov    %eax,%esi
  1037e3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1037e5:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  1037e8:	83 e1 03             	and    $0x3,%ecx
  1037eb:	74 02                	je     1037ef <memcpy+0x38>
  1037ed:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1037ef:	89 f0                	mov    %esi,%eax
  1037f1:	89 fa                	mov    %edi,%edx
  1037f3:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1037f6:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1037f9:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  1037fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  1037ff:	83 c4 20             	add    $0x20,%esp
  103802:	5e                   	pop    %esi
  103803:	5f                   	pop    %edi
  103804:	5d                   	pop    %ebp
  103805:	c3                   	ret    

00103806 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  103806:	55                   	push   %ebp
  103807:	89 e5                	mov    %esp,%ebp
  103809:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  10380c:	8b 45 08             	mov    0x8(%ebp),%eax
  10380f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103812:	8b 45 0c             	mov    0xc(%ebp),%eax
  103815:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  103818:	eb 2e                	jmp    103848 <memcmp+0x42>
        if (*s1 != *s2) {
  10381a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10381d:	0f b6 10             	movzbl (%eax),%edx
  103820:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103823:	0f b6 00             	movzbl (%eax),%eax
  103826:	38 c2                	cmp    %al,%dl
  103828:	74 18                	je     103842 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  10382a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10382d:	0f b6 00             	movzbl (%eax),%eax
  103830:	0f b6 d0             	movzbl %al,%edx
  103833:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103836:	0f b6 00             	movzbl (%eax),%eax
  103839:	0f b6 c8             	movzbl %al,%ecx
  10383c:	89 d0                	mov    %edx,%eax
  10383e:	29 c8                	sub    %ecx,%eax
  103840:	eb 18                	jmp    10385a <memcmp+0x54>
        }
        s1 ++, s2 ++;
  103842:	ff 45 fc             	incl   -0x4(%ebp)
  103845:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  103848:	8b 45 10             	mov    0x10(%ebp),%eax
  10384b:	8d 50 ff             	lea    -0x1(%eax),%edx
  10384e:	89 55 10             	mov    %edx,0x10(%ebp)
  103851:	85 c0                	test   %eax,%eax
  103853:	75 c5                	jne    10381a <memcmp+0x14>
    }
    return 0;
  103855:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10385a:	89 ec                	mov    %ebp,%esp
  10385c:	5d                   	pop    %ebp
  10385d:	c3                   	ret    
