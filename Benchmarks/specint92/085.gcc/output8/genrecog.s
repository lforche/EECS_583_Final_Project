#NO_APP
gcc_compiled.:
.globl _rtl_obstack
.data
	.even
_rtl_obstack:
	.long _obstack
.text
LC0:
	.ascii "\0"
	.even
.globl _make_insn_sequence
_make_insn_sequence:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(8),a2
	movel a2@(12),a3
	clrl _dupcount
	movel a2@(8),a0
	moveq #1,d1
	cmpl a0@,d1
	jne L2
	movel a0@(4),a0
	jra L3
L2:
	pea 20:w
	jbsr _rtx_alloc
	movel d0,a0
	movel a2@(8),a0@(4)
	clrb a0@(2)
	addqw #4,sp
L3:
	pea LC0
	clrl sp@-
	movel a0,sp@-
	jbsr _add_to_sequence
	movel d0,a0
	tstb a3@
	jeq L4
	movel a3,a0@(76)
L4:
	movel _next_insn_code,a0@(24)
	addql #1,_next_insn_code
	movel _first,d0
	moveml a6@(-8),#0xc00
	unlk a6
	rts
LC1:
	.ascii "0\0"
LC2:
	.ascii "pc_rtx\0"
LC3:
	.ascii "cc0_rtx\0"
LC4:
	.ascii "const0_rtx\0"
LC5:
	.ascii "const1_rtx\0"
	.even
.globl _add_to_sequence
_add_to_sequence:
	link a6,#-4
	moveml #0x3e3c,sp@-
	movel a6@(8),a4
	movel a6@(12),a2
	movel a6@(16),d2
	pea 94:w
	jbsr _xmalloc
	movel d0,a3
	movel _next_number,a3@
	addql #1,_next_number
	movel d2,sp@-
	jbsr _copystr
	movel d0,a3@(4)
	clrl a3@(12)
	clrl a3@(28)
	clrl a3@(32)
	moveq #-1,d6
	movel d6,a3@(24)
	clrl a3@(20)
	moveq #-1,d6
	movel d6,a3@(36)
	moveq #-1,d6
	movel d6,a3@(40)
	moveq #-1,d6
	movel d6,a3@(44)
	clrl a3@(48)
	clrl a3@(56)
	clrl a3@(52)
	clrl a3@(60)
	clrb a3@(84)
	clrl a3@(64)
	clrl a3@(68)
	clrl a3@(72)
	clrl a3@(76)
	clrl a3@(80)
	clrl a3@(86)
	clrl a3@(90)
	movel a3,a6@(-4)
	addqw #8,sp
	tstl a2
	jne L6
	movel a3,_first
	jra L7
L6:
	movel a3,a2@(32)
L7:
	movel d2,sp@-
	jbsr _strlen
	movel d0,d4
	addqw #4,sp
	addql #3,d0
	moveq #-2,d6
	andl d6,d0
	subl d0,sp
	movel sp,a5
	movel d2,sp@-
	movel a5,sp@-
	jbsr _strcpy
	clrb a5@(1,d4:l)
	addqw #8,sp
L8:
	tstl a4
	jne L9
	movel #LC1,a3@(12)
	clrl a3@(8)
	clrl a3@(16)
	jra L57
L9:
	clrl d0
	moveb a4@(2),d0
	tstl d0
	jne L12
	clrl a3@(16)
	jra L10
L12:
	clrl d0
	moveb a4@(2),d0
	movel d0,a3@(16)
L10:
	clrl d0
	movew a4@,d0
	movel d0,a3@(8)
	movel d0,d1
	subql #4,d1
	moveq #86,d6
	cmpl d6,d1
	jhi L14
LI36:
	movew pc@(L36-LI36-2:b,d1:l:2),d6
	jmp pc@(2,d6:w)
L36:
	.word L15-L36
	.word L24-L36
	.word L18-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L25-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L31-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L28-L36
	.word L14-L36
	.word L14-L36
	.word L26-L36
	.word L14-L36
	.word L33-L36
	.word L59-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L27-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L14-L36
	.word L35-L36
	.word L35-L36
L15:
	movel a4@(4),a3@(36)
	clrl a3@(8)
	movel a4@(8),a3@(20)
	movel a3@(20),a0
	tstb a0@
	jne L16
	clrl a3@(20)
L16:
	movel a4@(12),a3@(80)
	movel a3@(80),a0
	tstb a0@
	jne L57
	clrl a3@(80)
	jra L57
L18:
	movel a4@(4),a3@(36)
	clrl a3@(8)
	movel a4@(8),a3@(20)
	movel a3@(20),a0
	tstb a0@
	jne L19
	clrl a3@(20)
L19:
	clrl d3
	jra L20
L23:
	moveb d3,d6
	addb #48,d6
	moveb d6,a5@(d4:l)
	movel a5,sp@-
	movel a3,sp@-
	movel a4@(12),a0
	movel a0@(4,d3:l:4),sp@-
	jbsr _add_to_sequence
	movel d0,a3
	addw #12,sp
	addql #1,d3
L20:
	movel a4@(12),a0
	cmpl a0@,d3
	jcs L23
	movel a6@(-4),a1
	movel a1@(32),a0
	clrb a0@(84)
	jra L57
L24:
	movel a4@(4),a3@(40)
	movel _dupcount,a3@(44)
	addql #1,_dupcount
	clrl a3@(8)
	jra L57
L25:
	movel a4@(4),a4
	jra L8
L26:
	movel #LC2,a3@(12)
	jra L57
L27:
	movel #LC3,a3@(12)
	jra L57
L28:
	tstl a4@(4)
	jne L29
	movel #LC4,a3@(12)
	jra L57
L29:
	moveq #1,d6
	cmpl a4@(4),d6
	jne L14
	movel #LC5,a3@(12)
	jra L57
L31:
	moveb #48,a5@(d4:l)
	movel a5,sp@-
	movel a3,sp@-
	movel a4@(4),sp@-
	lea _add_to_sequence,a2
	jbsr a2@
	movel d0,a3
	movel a6@(-4),a1
	movel a1@(32),a0
	moveb #1,a0@(84)
	moveb #49,a5@(d4:l)
	movel a5,sp@-
	movel a3,sp@-
	movel a4@(8),sp@-
	jra L58
L33:
	movel a6@(-4),a1
	moveq #1,d6
	movel d6,a1@(56)
	movel a4@(8),a1@(60)
L59:
	moveb #48,a5@(d4:l)
	movel a5,sp@-
	movel a3,sp@-
	movel a4@(4),sp@-
	jbsr _add_to_sequence
	movel d0,a3
	movel a6@(-4),a1
	movel a1@(32),a0
	moveb #1,a0@(84)
	jra L5
L35:
	moveb #48,a5@(d4:l)
	movel a5,sp@-
	movel a3,sp@-
	movel a4@(4),sp@-
	lea _add_to_sequence,a2
	jbsr a2@
	movel d0,a3
	movel a6@(-4),a1
	movel a1@(32),a0
	moveb #1,a0@(84)
	moveb #49,a5@(d4:l)
	movel a5,sp@-
	movel a3,sp@-
	movel a4@(8),sp@-
	jbsr a2@
	movel d0,a3
	moveb #50,a5@(d4:l)
	movel a5,sp@-
	movel a3,sp@-
	movel a4@(12),sp@-
L58:
	jbsr a2@
	movel d0,a3
	jra L5
L14:
	lea _rtx_format,a0
	movel a0@(d0:l:4),a2
	lea _rtx_length,a0
	movel a0@(d0:l:4),d5
	clrl d3
	cmpl d3,d5
	jle L57
L56:
	moveb d3,d6
	addb #48,d6
	moveb d6,a5@(d4:l)
	cmpb #101,a2@(d3:l)
	jeq L42
	cmpb #117,a2@(d3:l)
	jne L41
L42:
	movel a5,sp@-
	movel a3,sp@-
	movel a4@(4,d3:l:4),sp@-
	jbsr _add_to_sequence
	movel d0,a3
	addw #12,sp
	jra L40
L41:
	cmpb #105,a2@(d3:l)
	jne L44
	tstl d3
	jne L44
	movel a6@(-4),a1
	moveq #1,d6
	movel d6,a1@(48)
	movel a4@(4,d3:l:4),a1@(52)
	jra L40
L44:
	cmpb #105,a2@(d3:l)
	jne L46
	moveq #1,d6
	cmpl d3,d6
	jne L46
	movel a6@(-4),a1
	moveq #1,d6
	movel d6,a1@(56)
	movel a4@(4,d3:l:4),a1@(60)
	jra L40
L46:
	cmpb #69,a2@(d3:l)
	jne L48
	tstl d3
	jeq L49
	jbsr _abort
L49:
	movel a4@(4,d3:l:4),a0
	movel a6@(-4),a1
	movel a0@,a1@(86)
	clrl d2
	jra L50
L53:
	moveb d2,d6
	addb #97,d6
	moveb d6,a5@(d4:l)
	movel a5,sp@-
	movel a3,sp@-
	movel a4@(4,d3:l:4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _add_to_sequence
	movel d0,a3
	addw #12,sp
	addql #1,d2
L50:
	movel a4@(4,d3:l:4),a0
	cmpl a0@,d2
	jcs L53
	jra L40
L48:
	cmpb #48,a2@(d3:l)
	jeq L40
	jbsr _abort
L40:
	addql #1,d3
	cmpl d3,d5
	jgt L56
L57:
	movel a3,d0
L5:
	moveml a6@(-40),#0x3c7c
	unlk a6
	rts
	.even
.globl _merge_trees
_merge_trees:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(8),d2
	movel a6@(12),a2
	tstl a2
	jeq L65
L64:
	movel a2@(28),d3
	clrl a2@(28)
	movel a2,sp@-
	movel d2,sp@-
	jbsr _try_merge_1
	addqw #8,sp
	tstl d0
	jne L63
	movel a2,sp@-
	movel d2,sp@-
	jbsr _try_merge_2
	movel d0,d2
	addqw #8,sp
L63:
	movel d3,a2
	tstl a2
	jne L64
L65:
	movel d2,d0
	moveml a6@(-12),#0x40c
	unlk a6
	rts
LC6:
	.ascii "Two actions at one point in tree.\0"
	.even
.globl _try_merge_1
_try_merge_1:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(8),a2
	movel a6@(12),a3
	tstl a2
	jeq L79
L78:
	movel a2@(4),d1
	cmpl a3@(4),d1
	jeq L70
	tstl a2@(4)
	jeq L69
	tstl a3@(4)
	jeq L69
	movel a3@(4),sp@-
	movel a2@(4),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L69
L70:
	movel a2@(20),d1
	cmpl a3@(20),d1
	jeq L71
	tstl a2@(20)
	jeq L69
	tstl a3@(20)
	jeq L69
	movel a3@(20),sp@-
	movel a2@(20),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L69
L71:
	movel a2@(76),d1
	cmpl a3@(76),d1
	jeq L72
	tstl a2@(76)
	jeq L69
	tstl a3@(76)
	jeq L69
	movel a3@(76),sp@-
	movel a2@(76),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L69
L72:
	movel a2@(48),d1
	cmpl a3@(48),d1
	jne L69
	movel a2@(52),d1
	cmpl a3@(52),d1
	jne L69
	movel a2@(56),d1
	cmpl a3@(56),d1
	jne L69
	movel a2@(60),d1
	cmpl a3@(60),d1
	jne L69
	movel a2@(86),d1
	cmpl a3@(86),d1
	jne L69
	movel a2@(40),d1
	cmpl a3@(40),d1
	jne L69
	movel a2@(36),d1
	cmpl a3@(36),d1
	jne L69
	tstl a2@(20)
	jeq L73
	tstb a3@(84)
	jeq L74
	movel a2,sp@-
	jbsr _no_same_mode
	addqw #4,sp
	tstl d0
	jne L73
	jra L69
L74:
	tstl a2@(28)
	jne L69
L73:
	movel a2@(8),d1
	cmpl a3@(8),d1
	jne L69
	movel a2@(16),d1
	cmpl a3@(16),d1
	jne L69
	movel a3@(32),sp@-
	movel a2@(32),sp@-
	jbsr _merge_trees
	movel d0,a2@(32)
	addqw #8,sp
	tstl a2@(24)
	jlt L76
	tstl a3@(24)
	jlt L76
	pea LC6
	jbsr _fatal
L76:
	moveq #-1,d1
	cmpl a2@(24),d1
	jne L77
	movel a3@(24),a2@(24)
L77:
	moveq #1,d0
	jra L66
L69:
	movel a2@(28),a2
	tstl a2
	jne L78
L79:
	clrl d0
L66:
	moveml a6@(-8),#0xc00
	unlk a6
	rts
	.even
.globl _try_merge_2
_try_merge_2:
	link a6,#0
	moveml #0x203c,sp@-
	movel a6@(8),d2
	movel a6@(12),a4
	subl a5,a5
	subl a3,a3
	tstl a4@(20)
	movel d2,a2
	tstl a2
	jeq L82
L89:
	movel a2@(4),d1
	cmpl a4@(4),d1
	jeq L85
	tstl a2@(4)
	jeq L84
	tstl a4@(4)
	jeq L84
	movel a4@(4),sp@-
	movel a2@(4),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L84
L85:
	movel a2,a3
	tstb a3@(84)
	jeq L87
	movel a4@(16),d1
	cmpl a3@(16),d1
	jlt L82
	jra L87
L84:
	tstl a3
	jne L82
L87:
	movel a2,a5
	movel a2@(28),a2
	tstl a2
	jne L89
L82:
	tstl a5
	jeq L90
	movel a5@(28),a4@(28)
	movel a4,a5@(28)
	movel d2,d0
	jra L80
L90:
	movel d2,a4@(28)
	movel a4,d0
L80:
	moveml a6@(-20),#0x3c04
	unlk a6
	rts
	.even
.globl _no_same_mode
_no_same_mode:
	link a6,#0
	movel a6@(8),a0
	movel a0@(16),d0
	jra L95
L97:
	cmpl a0@(16),d0
	jne L95
	clrl d0
	jra L92
L95:
	movel a0@(28),a0
	tstl a0
	jne L97
	moveq #1,d0
L92:
	unlk a6
	rts
	.even
.globl _break_out_subroutines
_break_out_subroutines:
	link a6,#0
	moveml #0x38,sp@-
	movel a6@(8),a4
	subl a3,a3
	movel a4,a2
	tstl a2
	jeq L105
L103:
	movel a2@(32),sp@-
	jbsr _break_out_subroutines
	movel d0,a0
	lea a0@(1,a3:l),a3
	addqw #4,sp
	movel a2@(28),a2
	tstl a2
	jne L103
L105:
	moveq #50,d1
	cmpl a3,d1
	jge L104
	addql #1,_next_subroutine_number
	movel _next_subroutine_number,a4@(90)
	movel a4,sp@-
	jbsr _write_subroutine
	movew #1,a3
L104:
	movel a3,d0
	moveml a6@(-12),#0x1c00
	unlk a6
	rts
LC7:
	.ascii "int\12recog_%d (x0, insn)\12     register rtx x0;\12     rtx insn;\12{\12\0"
LC8:
	.ascii "  register rtx x1, x2, x3, x4, x5;\12  rtx x6, x7, x8, x9, x10, x11;\12\0"
LC9:
	.ascii "  int tem;\12\0"
LC10:
	.ascii " ret0: return -1;\12}\12\12\0"
	.even
.globl _write_subroutine
_write_subroutine:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(8),a3
	movel a3@(90),sp@-
	pea LC7
	lea _printf,a2
	jbsr a2@
	pea LC8
	jbsr a2@
	pea LC9
	jbsr a2@
	pea 1:w
	pea LC0
	clrl sp@-
	pea LC0
	movel a3,sp@-
	jbsr _write_tree
	addw #36,sp
	pea LC10
	jbsr a2@
	moveml a6@(-8),#0xc00
	unlk a6
	rts
LC11:
	.ascii " L%d:\12\0"
LC12:
	.ascii "  tem = recog_%d (x0, insn);\12\0"
LC13:
	.ascii "  if (tem >= 0) return tem;\12\0"
LC14:
	.ascii "  goto L%d;\12\0"
LC15:
	.ascii "  return recog_%d (x0, insn);\12\0"
LC16:
	.ascii "  }\12\0"
LC17:
	.ascii "  if (GET_MODE (x%d) != %smode)\12\0"
LC18:
	.ascii "    {\12    \0"
LC19:
	.ascii "      goto L%d;\12    }\12\0"
LC20:
	.ascii "    goto ret0;\12\0"
LC21:
	.ascii "  if (GET_CODE (x%d) != \0"
LC22:
	.ascii ")\12\0"
LC23:
	.ascii "    {\0"
LC24:
	.ascii "    goto L%d; }\12\0"
LC25:
	.ascii " switch (GET_MODE (x%d))\12  {\12\0"
LC26:
	.ascii " switch (GET_CODE (x%d))\12  {\12\0"
LC27:
	.ascii "  case %smode:\12\0"
LC28:
	.ascii "  case \0"
LC29:
	.ascii ":\12\0"
LC30:
	.ascii "  if (\0"
LC31:
	.ascii "x%d == %s\0"
LC32:
	.ascii "GET_CODE (x%d) == \0"
LC33:
	.ascii " && \0"
LC34:
	.ascii "GET_MODE (x%d) == %smode && \0"
LC35:
	.ascii "XINT (x%d, 0) == %d && \0"
LC36:
	.ascii "XVECLEN (x%d, 0) == %d && \0"
LC37:
	.ascii "XINT (x%d, 1) == %d && \0"
LC38:
	.ascii "rtx_equal_p (x%d, recog_operand[%d]) && \0"
LC39:
	.ascii "%s (x%d, %smode)\0"
LC40:
	.ascii "1\0"
LC41:
	.ascii ")\12    { recog_operand[%d] = x%d; \0"
LC42:
	.ascii ")\12    \0"
LC43:
	.ascii "if (%s) \0"
LC44:
	.ascii "return %d;\0"
LC45:
	.ascii "goto L%d;\0"
LC46:
	.ascii " }\12\0"
LC47:
	.ascii "\12\0"
LC48:
	.ascii "  break;\12\0"
LC49:
	.ascii " goto L%d;\12\0"
LC50:
	.ascii "  goto ret0;\12\0"
	.even
.globl _write_tree
_write_tree:
	link a6,#-120
	moveml #0x3f3c,sp@-
	movel a6@(8),a5
	movel a6@(16),d6
	movel a6@(20),d7
	clrl d4
	movel a6@(12),a4
	tstl a5@(90)
	jle L108
	tstl a6@(24)
	jne L108
	movel a5@,sp@-
	pea LC11
	lea _printf,a2
	jbsr a2@
	addqw #8,sp
	tstl d6
	jeq L109
	movel a5@(90),sp@-
	pea LC12
	jbsr a2@
	pea LC13
	jbsr a2@
	movel d7,sp@-
	movel a4,sp@-
	jbsr _change_state
	movel d6,sp@-
	pea LC14
	jbsr a2@
	jra L107
L109:
	movel a5@(90),sp@-
	pea LC15
	jbsr _printf
	jra L107
L108:
	moveq #1,d1
	movel d1,a5@(72)
	movel a5,a3
	tstl a3
	jeq L216
L197:
	movel a3@(28),a2
	tstl a2
	jeq L115
L121:
	tstl a3@(8)
	jeq L120
	tstl a2@(8)
	jeq L120
	movel a3@(8),d1
	cmpl a2@(8),d1
	jne L119
L120:
	tstl a3@(16)
	jeq L115
	tstl a2@(16)
	jeq L115
	movel a3@(16),d1
	cmpl a2@(16),d1
	jeq L115
	moveq #2,d1
	cmpl d4,d1
	jeq L119
	tstl a3@(20)
	jne L115
	tstl a2@(20)
	jne L115
L119:
	movel a3@(4),sp@-
	movel a2@(4),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L115
	movel a2@(28),a2
	tstl a2
	jne L121
L115:
	movel a2,a3@(68)
	jeq L122
	moveq #1,d1
	movel d1,a2@(72)
L122:
	moveq #2,d1
	cmpl d4,d1
	jne L123
	tstl a3@(16)
	jeq L124
	tstb a3@(84)
	jne L123
	tstl a3@(20)
	jeq L123
L124:
	clrl d4
	pea LC16
	jbsr _printf
	addqw #4,sp
L123:
	moveq #1,d1
	cmpl d4,d1
	jne L125
	tstl a3@(8)
	jne L125
	clrl d4
	pea LC16
	jbsr _printf
	addqw #4,sp
L125:
	tstl a3@(72)
	jeq L126
	movel a3@,sp@-
	pea LC11
	jbsr _printf
	addqw #8,sp
L126:
	tstl a3@(32)
	jne L127
	tstl a3@(24)
	jge L127
	jbsr _abort
L127:
	movel a3@(4),sp@-
	movel a4,sp@-
	jbsr _change_state
	movel a3@(4),a4
	movel a4,sp@-
	jbsr _strlen
	movel d0,d2
	clrl d0
	addw #12,sp
	tstl a3@(64)
	jne L129
	cmpb #42,a4@(-1,d2:l)
	jeq L129
	tstl a3@(20)
	jeq L128
L129:
	moveq #1,d0
L128:
	movel d0,d5
	tstl d4
	jne L130
	tstl d5
	jne L131
	tstl a3@(16)
	jeq L131
	tstl a3@(28)
	jeq L131
	movel a3@(16),sp@-
	movel a3,sp@-
	jbsr _same_modes
	addqw #8,sp
	tstl d0
	jeq L131
	movel a3@(16),d0
	lea _mode_name,a0
	movel a0@(d0:l:4),sp@-
	movel d2,sp@-
	pea LC17
	lea _printf,a2
	jbsr a2@
	addw #12,sp
	tstl d6
	jeq L132
	pea LC18
	jbsr a2@
	movel d7,sp@-
	movel a4,sp@-
	jbsr _change_state
	movel d6,sp@-
	pea LC19
	jbsr a2@
	addw #20,sp
	jra L133
L132:
	pea LC20
	jbsr _printf
	addqw #4,sp
L133:
	movel a3,sp@-
	jbsr _clear_modes
	moveq #1,d5
	addqw #4,sp
L131:
	tstl a3@(8)
	jeq L130
	tstl a3@(28)
	jeq L130
	movel a3@(8),sp@-
	movel a3,sp@-
	jbsr _same_codes
	addqw #8,sp
	tstl d0
	jeq L130
	movel d2,sp@-
	pea LC21
	lea _printf,a2
	jbsr a2@
	movel a3@(8),sp@-
	jbsr _print_code
	pea LC22
	jbsr a2@
	addw #16,sp
	tstl d6
	jeq L135
	pea LC23
	jbsr a2@
	movel d7,sp@-
	movel a4,sp@-
	jbsr _change_state
	movel d6,sp@-
	pea LC24
	jbsr a2@
	addw #20,sp
	jra L136
L135:
	pea LC20
	jbsr _printf
	addqw #4,sp
L136:
	movel a3,sp@-
	jbsr _clear_codes
	addqw #4,sp
L130:
	tstl d4
	jne L137
	cmpb #42,a4@(-1,d2:l)
	jeq L137
	clrl d3
	pea 28:w
	pea a6@(-28)
	jbsr _mybzero
	movel a3,a2
	clrl d0
	addqw #8,sp
	tstl a2
	jeq L139
L143:
	tstl a2@(16)
	jeq L139
	tstl a2@(20)
	jeq L141
	tstb a2@(84)
	jeq L139
L141:
	tstb a3@(84)
	jne L142
	movel a2@(16),a0
	tstb a0@(-28,a6:l)
	jeq L142
	moveq #1,d3
	jra L139
L142:
	movel a2@(16),a0
	moveb #1,a0@(-28,a6:l)
	movel a2@(28),a2
	addql #1,d0
	tstl a2
	jne L143
L139:
	tstl d3
	jne L137
	moveq #3,d1
	cmpl d0,d1
	jge L137
	moveq #2,d4
	movel d2,sp@-
	pea LC25
	jbsr _printf
	addqw #8,sp
L137:
	tstl d4
	jne L145
	pea 91:w
	pea a6@(-120)
	jbsr _mybzero
	movel a3,a2
	clrl d0
	addqw #8,sp
	tstl a2
	jeq L147
L150:
	tstl a2@(8)
	jeq L147
	movel a2@(8),a0
	tstb a0@(-120,a6:l)
	jne L147
	moveb #1,a0@(-120,a6:l)
	movel a2@(28),a2
	addql #1,d0
	tstl a2
	jne L150
L147:
	tstl a2
	jeq L152
	tstl a2@(8)
	jne L145
L152:
	moveq #3,d1
	cmpl d0,d1
	jge L145
	moveq #1,d4
	movel d2,sp@-
	pea LC26
	jbsr _printf
	addqw #8,sp
L145:
	moveq #2,d1
	cmpl d4,d1
	jne L153
	movel a3@(16),a1
	tstb a1@(-28,a6:l)
	jeq L153
	lea _mode_name,a0
	movel a0@(a1:l:4),sp@-
	pea LC27
	jbsr _printf
	movel a3@(16),a0
	clrb a0@(-28,a6:l)
	addqw #8,sp
L153:
	moveq #1,d1
	cmpl d4,d1
	jne L155
	movel a3@(8),a0
	tstb a0@(-120,a6:l)
	jeq L155
	pea LC28
	lea _printf,a2
	jbsr a2@
	movel a3@(8),sp@-
	jbsr _print_code
	pea LC29
	jbsr a2@
	movel a3@(8),a0
	clrb a0@(-120,a6:l)
	addw #12,sp
L155:
	pea LC30
	jbsr _printf
	addqw #4,sp
	tstl a3@(12)
	jne L158
	tstl a3@(8)
	jeq L157
	moveq #1,d1
	cmpl d4,d1
	jeq L157
L158:
	tstl a3@(12)
	jeq L159
	movel a3@(12),sp@-
	movel d2,sp@-
	pea LC31
	jbsr _printf
	jra L217
L159:
	movel d2,sp@-
	pea LC32
	jbsr _printf
	movel a3@(8),sp@-
	jbsr _print_code
L217:
	addw #12,sp
	pea LC33
	jbsr _printf
	addqw #4,sp
L157:
	tstl a3@(16)
	jeq L161
	tstl d5
	jne L161
	moveq #2,d1
	cmpl d4,d1
	jeq L161
	movel a3@(16),d0
	lea _mode_name,a0
	movel a0@(d0:l:4),sp@-
	movel d2,sp@-
	pea LC34
	jbsr _printf
	addw #12,sp
L161:
	tstl a3@(48)
	jeq L162
	movel a3@(52),sp@-
	movel d2,sp@-
	pea LC35
	jbsr _printf
	addw #12,sp
L162:
	tstl a3@(86)
	jeq L163
	movel a3@(86),sp@-
	movel d2,sp@-
	pea LC36
	jbsr _printf
	addw #12,sp
L163:
	tstl a3@(56)
	jeq L164
	movel a3@(60),sp@-
	movel d2,sp@-
	pea LC37
	jbsr _printf
	addw #12,sp
L164:
	tstl a3@(40)
	jlt L165
	movel a3@(40),sp@-
	movel d2,sp@-
	pea LC38
	jbsr _printf
	addw #12,sp
L165:
	tstl a3@(20)
	jeq L166
	movel a3@(16),d0
	lea _mode_name,a0
	movel a0@(d0:l:4),sp@-
	movel d2,sp@-
	movel a3@(20),sp@-
	pea LC39
	jbsr _printf
	addw #16,sp
	jra L167
L166:
	pea LC40
	jbsr _printf
	addqw #4,sp
L167:
	tstl a3@(36)
	jlt L168
	movel d2,sp@-
	movel a3@(36),sp@-
	pea LC41
	jbsr _printf
	addw #12,sp
	jra L169
L168:
	pea LC42
	jbsr _printf
	addqw #4,sp
L169:
	tstl a3@(76)
	jeq L170
	movel a3@(76),sp@-
	pea LC43
	jbsr _printf
	addqw #8,sp
L170:
	tstl a3@(24)
	jlt L171
	movel a3@(24),sp@-
	pea LC44
	jra L218
L171:
	movel a3@(32),a0
	movel a0@,sp@-
	pea LC45
L218:
	jbsr _printf
	addqw #8,sp
	tstl a3@(36)
	jlt L173
	pea LC46
	jra L219
L173:
	pea LC47
L219:
	jbsr _printf
	addqw #4,sp
	moveq #1,d1
	cmpl d4,d1
	jne L175
	movel a3@(28),a2
	tstl a2
	jeq L177
L181:
	tstl a2@(8)
	jeq L177
	movel a3@(8),d1
	cmpl a2@(8),d1
	jeq L177
	movel a2@(28),a2
	tstl a2
	jne L181
L177:
	tstl a2
	jeq L183
	tstl a2@(8)
	jne L182
L183:
	pea LC48
	jbsr _printf
	addqw #4,sp
	jra L175
L182:
	cmpl a3@(28),a2
	jeq L175
	movel a2@,sp@-
	pea LC49
	jbsr _printf
	moveq #1,d1
	movel d1,a2@(72)
	addqw #8,sp
L175:
	moveq #2,d1
	cmpl d4,d1
	jne L113
	movel a3@(28),a2
	tstl a2
	jeq L188
L192:
	tstl a2@(16)
	jeq L188
	movel a3@(16),d1
	cmpl a2@(16),d1
	jeq L188
	movel a2@(28),a2
	tstl a2
	jne L192
L188:
	tstl a2
	jeq L194
	tstl a2@(16)
	jne L193
L194:
	pea LC48
	jbsr _printf
	addqw #4,sp
	jra L113
L193:
	cmpl a3@(28),a2
	jeq L113
	movel a2@,sp@-
	pea LC49
	jbsr _printf
	moveq #1,d1
	movel d1,a2@(72)
	addqw #8,sp
L113:
	movel a3@(28),a3
	tstl a3
	jne L197
L216:
	tstl d4
	jeq L198
	pea LC16
	jbsr _printf
	addqw #4,sp
L198:
	tstl d6
	jeq L199
	movel d7,sp@-
	movel a4,sp@-
	jbsr _change_state
	movel d6,sp@-
	pea LC14
	jbsr _printf
	addw #16,sp
	jra L200
L199:
	pea LC50
	jbsr _printf
	addqw #4,sp
L200:
	movel a5,a3
	tstl a3
	jeq L107
L209:
	tstl a3@(32)
	jeq L203
	movel a3@(4),a4
	clrl sp@-
	tstl a3@(68)
	jeq L205
	movel a4,d0
	jra L206
L205:
	movel d7,d0
L206:
	movel d0,sp@-
	tstl a3@(68)
	jeq L207
	movel a3@(68),a0
	movel a0@,d0
	jra L208
L207:
	movel d6,d0
L208:
	movel d0,sp@-
	movel a4,sp@-
	movel a3@(32),sp@-
	jbsr _write_tree
	addw #20,sp
L203:
	movel a3@(28),a3
	tstl a3
	jne L209
L107:
	moveml a6@(-160),#0x3cfc
	unlk a6
	rts
	.even
.globl _print_code
_print_code:
	link a6,#0
	moveml #0x2038,sp@-
	lea _rtx_name,a0
	movel a6@(8),d2
	movel a0@(d2:l:4),a2
	tstb a2@
	jeq L239
	lea __iob+20,a3
	lea a3@(4),a4
L238:
	cmpb #96,a2@
	jle L224
	cmpb #122,a2@
	jgt L224
	subql #1,a3@
	jmi L225
	movel a4@,a0
	moveb a2@,d2
	addb #224,d2
	moveb d2,a0@
L243:
	addql #1,a4@
	jra L223
L225:
	tstb __iob+37
	jge L227
	movel a3@,d0
	negl d0
	cmpl __iob+32,d0
	jge L227
	movel __iob+24,a0
	moveb a2@,d0
	addb #224,d0
	moveb d0,a0@
	cmpb #10,d0
	jne L243
	movel a3,sp@-
	movel __iob+24,a0
	clrl d0
	moveb a0@,d0
	jra L241
L227:
	movel a3,sp@-
	moveb a2@,d1
	addb #224,d1
	clrl d0
	moveb d1,d0
	jra L241
L224:
	subql #1,a3@
	jmi L232
	movel a4@,a0
	moveb a2@,a0@
	jra L243
L232:
	tstb __iob+37
	jge L234
	movel a3@,d0
	negl d0
	cmpl __iob+32,d0
	jge L234
	movel __iob+24,a0
	moveb a2@,d0
	moveb d0,a0@
	cmpb #10,d0
	jne L243
	movel a3,sp@-
	movel __iob+24,a0
	clrl d0
	moveb a0@,d0
	jra L241
L234:
	movel a3,sp@-
	clrl d0
	moveb a2@,d0
L241:
	movel d0,sp@-
	jbsr __flsbuf
	addqw #8,sp
L223:
	addqw #1,a2
	tstb a2@
	jne L238
L239:
	moveml a6@(-16),#0x1c04
	unlk a6
	rts
	.even
.globl _same_codes
_same_codes:
	link a6,#0
	movel a6@(8),a0
	movel a6@(12),d0
	tstl a0
	jeq L250
L249:
	cmpl a0@(8),d0
	jeq L247
	clrl d0
	jra L244
L247:
	movel a0@(28),a0
	tstl a0
	jne L249
L250:
	moveq #1,d0
L244:
	unlk a6
	rts
	.even
.globl _clear_codes
_clear_codes:
	link a6,#0
	movel a6@(8),a0
	tstl a0
	jeq L256
L255:
	clrl a0@(8)
	movel a0@(28),a0
	tstl a0
	jne L255
L256:
	unlk a6
	rts
	.even
.globl _same_modes
_same_modes:
	link a6,#0
	movel a6@(8),a0
	movel a6@(12),d0
	tstl a0
	jeq L264
L263:
	cmpl a0@(16),d0
	jne L262
	tstl a0@(20)
	jeq L260
L262:
	clrl d0
	jra L257
L260:
	movel a0@(28),a0
	tstl a0
	jne L263
L264:
	moveq #1,d0
L257:
	unlk a6
	rts
	.even
.globl _clear_modes
_clear_modes:
	link a6,#0
	movel a6@(8),a0
	tstl a0
	jeq L270
L269:
	moveq #1,d0
	movel d0,a0@(64)
	movel a0@(28),a0
	tstl a0
	jne L269
L270:
	unlk a6
	rts
LC51:
	.ascii "  x%d = recog_addr_dummy;\12  XEXP (x%d, 0) = x%d;\12\0"
LC52:
	.ascii "  x%d = XVECEXP (x%d, 0, %d);\12\0"
LC53:
	.ascii "  x%d = XEXP (x%d, %c);\12\0"
	.even
.globl _change_state
_change_state:
	link a6,#0
	moveml #0x3038,sp@-
	movel a6@(8),d2
	movel a6@(12),a4
	movel d2,sp@-
	lea _strlen,a2
	jbsr a2@
	movel d0,a3
	movel a4,sp@-
	jbsr a2@
	movel d0,d3
	addqw #8,sp
	jra L272
L274:
	subqw #1,a3
L272:
	movel a3,sp@-
	movel a4,sp@-
	movel d2,sp@-
	jbsr _strncmp
	addw #12,sp
	tstl d0
	jne L274
	cmpl a3,d3
	jle L282
L281:
	cmpb #42,a3@(a4:l)
	jne L277
	movel a3,sp@-
	movel a3,d0
	addql #1,d0
	movel d0,sp@-
	movel d0,sp@-
	pea LC51
	jra L283
L277:
	cmpb #96,a3@(a4:l)
	jle L279
	cmpb #122,a3@(a4:l)
	jgt L279
	moveb a3@(a4:l),d0
	extbl d0
	movel d0,a0
	pea a0@(-97)
	movel a3,sp@-
	pea a3@(1)
	pea LC52
	jra L283
L279:
	moveb a3@(a4:l),d1
	extbl d1
	movel d1,sp@-
	movel a3,sp@-
	pea a3@(1)
	pea LC53
L283:
	jbsr _printf
	addw #16,sp
	addqw #1,a3
	cmpl a3,d3
	jgt L281
L282:
	moveml a6@(-20),#0x1c0c
	unlk a6
	rts
	.even
.globl _copystr
_copystr:
	link a6,#0
	moveml #0x3000,sp@-
	movel a6@(8),d3
	jne L285
	clrl d0
	jra L284
L285:
	movel d3,sp@-
	jbsr _strlen
	movel d0,a0
	pea a0@(1)
	jbsr _xmalloc
	movel d0,d2
	movel d3,sp@-
	movel d2,sp@-
	jbsr _strcpy
	movel d2,d0
L284:
	moveml a6@(-8),#0xc
	unlk a6
	rts
	.even
.globl _mybzero
_mybzero:
	link a6,#0
	movel a6@(8),a0
	movel a6@(12),d0
	jra L287
L289:
	clrb a0@+
L287:
	subql #1,d0
	moveq #-1,d1
	cmpl d0,d1
	jlt L289
	unlk a6
	rts
LC54:
	.ascii " \0"
	.even
.globl _concat
_concat:
	link a6,#0
	moveml #0x3830,sp@-
	movel a6@(8),d3
	movel a6@(12),d4
	tstl d3
	jne L291
	movel d4,d0
	jra L290
L291:
	tstl d4
	jne L292
	movel d3,d0
	jra L290
L292:
	movel d3,sp@-
	lea _strlen,a3
	jbsr a3@
	movel d0,a2
	movel d4,sp@-
	jbsr a3@
	movel d0,a0
	pea a0@(2,a2:l)
	jbsr _xmalloc
	movel d0,d2
	movel d3,sp@-
	movel d2,sp@-
	jbsr _strcpy
	pea LC54
	movel d2,sp@-
	lea _strcat,a2
	jbsr a2@
	movel d4,sp@-
	movel d2,sp@-
	jbsr a2@
	movel d2,d0
L290:
	moveml a6@(-20),#0xc1c
	unlk a6
	rts
LC55:
	.ascii "virtual memory exhausted\0"
	.even
.globl _xrealloc
_xrealloc:
	link a6,#0
	movel d2,sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	jbsr _realloc
	movel d0,d2
	addqw #8,sp
	jne L294
	pea LC55
	jbsr _fatal
L294:
	movel d2,d0
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _xmalloc
_xmalloc:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),sp@-
	jbsr _malloc
	movel d0,d2
	addqw #4,sp
	jne L296
	pea LC55
	jbsr _fatal
L296:
	movel d2,d0
	movel a6@(-4),d2
	unlk a6
	rts
LC56:
	.ascii "genrecog: \0"
LC57:
	.ascii "after %d instruction definitions\12\0"
	.even
.globl _fatal
_fatal:
	link a6,#0
	moveml #0x2020,sp@-
	pea LC56
	movel #__iob+40,d2
	movel d2,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	movel d2,sp@-
	jbsr a2@
	pea LC47
	movel d2,sp@-
	jbsr a2@
	addw #32,sp
	movel _next_insn_code,sp@-
	pea LC57
	movel d2,sp@-
	jbsr a2@
	pea 33:w
	jbsr _exit
	moveml a6@(-8),#0x404
	unlk a6
	rts
LC58:
	.ascii "No input file name.\0"
LC59:
	.ascii "r\0"
LC60:
	.ascii "/* Generated automatically by the program `genrecog'\12from the machine description file `md'.  */\12\12\0"
LC61:
	.ascii "#include \"config.h\"\12\0"
LC62:
	.ascii "#include \"rtl.h\"\12\0"
LC63:
	.ascii "#include \"insn-config.h\"\12\0"
LC64:
	.ascii "#include \"recog.h\"\12\0"
LC65:
	.ascii "\12/* `recog' contains a decision tree\12   that recognizes whether the rtx X0 is a valid instruction.\12\12   recog returns -1 if the rtx is not valid.\12   If the rtx is valid, recog returns a nonnegative number\12   which is the insn code number for the pattern that matched.\12\0"
LC66:
	.ascii "   This is the same as the order in the machine description of\12   the entry that matched.  This number can be used as an index into\12   insn_templates and insn_n_operands (found in insn-output.c)\12   or as an argument to output_insn_hairy (also in insn-output.c).  */\12\12\0"
LC67:
	.ascii "rtx recog_operand[MAX_RECOG_OPERANDS];\12\12\0"
LC68:
	.ascii "rtx *recog_operand_loc[MAX_RECOG_OPERANDS];\12\12\0"
LC69:
	.ascii "rtx *recog_dup_loc[MAX_DUP_OPERANDS];\12\12\0"
LC70:
	.ascii "char recog_dup_num[MAX_DUP_OPERANDS];\12\12\0"
LC71:
	.ascii "extern rtx recog_addr_dummy;\12\12\0"
LC72:
	.ascii "#define operands recog_operand\12\12\0"
LC73:
	.ascii "int\12recog (x0, insn)\12     register rtx x0;\12     rtx insn;\12{\12\0"
LC74:
	.ascii " ret0: return -1;\12}\12\0"
	.even
.globl _main
_main:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(12),a2
	clrl d3
	pea _free
	pea _xmalloc
	clrl sp@-
	clrl sp@-
	movel _rtl_obstack,sp@-
	jbsr __obstack_begin
	addw #20,sp
	moveq #1,d1
	cmpl a6@(8),d1
	jlt L299
	pea LC58
	jbsr _fatal
	addqw #4,sp
L299:
	pea LC59
	movel a2@(4),sp@-
	jbsr _fopen
	movel d0,d2
	addqw #8,sp
	jne L300
	movel a2@(4),sp@-
	jbsr _perror
	pea 33:w
	jbsr _exit
	addqw #8,sp
L300:
	jbsr _init_rtl
	clrl _next_insn_code
	pea LC60
	jbsr _printf
	addqw #4,sp
L301:
	movel d2,sp@-
	jbsr _read_skip_spaces
	addqw #4,sp
	moveq #-1,d1
	cmpl d0,d1
	jeq L302
	movel d2,sp@-
	movel d0,sp@-
	jbsr _ungetc
	movel d2,sp@-
	jbsr _read_rtx
	movel d0,a2
	addw #12,sp
	cmpw #7,a2@
	jne L304
	movel a2,sp@-
	jbsr _make_insn_sequence
	movel d0,sp@-
	movel d3,sp@-
	jbsr _merge_trees
	movel d0,d3
	addw #12,sp
L304:
	cmpw #8,a2@
	jeq L306
	cmpw #10,a2@
	jne L301
L306:
	addql #1,_next_insn_code
	jra L301
L302:
	pea LC61
	lea _printf,a2
	jbsr a2@
	pea LC62
	jbsr a2@
	pea LC63
	jbsr a2@
	pea LC64
	jbsr a2@
	pea LC65
	jbsr a2@
	pea LC66
	jbsr a2@
	pea LC67
	jbsr a2@
	pea LC68
	jbsr a2@
	addw #32,sp
	pea LC69
	jbsr a2@
	pea LC70
	jbsr a2@
	pea LC71
	jbsr a2@
	pea LC72
	jbsr a2@
	movel d3,sp@-
	jbsr _break_out_subroutines
	pea LC73
	jbsr a2@
	pea LC8
	jbsr a2@
	pea LC9
	jbsr a2@
	addw #32,sp
	pea 1:w
	pea LC0
	clrl sp@-
	pea LC0
	movel d3,sp@-
	jbsr _write_tree
	pea LC74
	jbsr a2@
	pea __iob+20
	jbsr _fflush
	addw #28,sp
	btst #5,__iob+37
	sne d0
	btst #0,d0
	jeq L307
	moveq #33,d0
	jra L308
L307:
	clrl d0
L308:
	movel d0,sp@-
	jbsr _exit
	moveml a6@(-12),#0x40c
	unlk a6
	rts
.comm _first,4
.comm _dupcount,4
.comm _next_insn_code,4
.comm _next_number,4
.comm _next_subroutine_number,4
.comm _obstack,36
