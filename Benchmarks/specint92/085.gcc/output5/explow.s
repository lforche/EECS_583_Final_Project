#NO_APP
gcc_compiled.:
.text
	.even
.globl _plus_constant
_plus_constant:
	link a6,#0
	moveml #0x3830,sp@-
	movel a6@(8),a3
	movel a6@(12),d1
	clrl d0
	movew a3@,d0
	clrl d2
	moveb a3@(2),d2
	clrl d3
	tstl d1
	jeq L22
	moveq #30,d4
	cmpl d0,d4
	jne L3
	addl a3@(4),d1
	movel d1,sp@-
	clrl sp@-
	pea 30:w
	jbsr _gen_rtx
	jra L1
L3:
	moveq #32,d4
	cmpl d0,d4
	jne L4
	movel a3@(4),a3
	jra L7
L4:
	moveq #39,d4
	cmpl d0,d4
	jeq L7
	moveq #38,d4
	cmpl d0,d4
	jne L5
L7:
	moveq #1,d3
L5:
	cmpw #44,a3@
	jne L8
	movel a3@(4),a0
	cmpw #30,a0@
	jne L9
	addl a0@(4),d1
	movel a3@(8),a3
	jra L8
L9:
	movel a3@(8),a0
	cmpw #30,a0@
	jne L11
	addl a0@(4),d1
	movel a3@(4),a3
	jra L8
L11:
	movel a3@(4),a0
	cmpw #38,a0@
	jeq L14
	cmpw #39,a0@
	jeq L14
	cmpw #30,a0@
	jeq L14
	cmpw #32,a0@
	jne L13
L14:
	movel a3@(8),sp@-
	movel d1,sp@-
	movel a3@(4),sp@-
	jbsr _plus_constant
	addqw #8,sp
	movel d0,sp@-
	jra L24
L13:
	movel a3@(8),a0
	cmpw #38,a0@
	jeq L17
	cmpw #39,a0@
	jeq L17
	cmpw #30,a0@
	jeq L17
	cmpw #32,a0@
	jne L8
L17:
	movel d1,sp@-
	movel a3@(8),sp@-
	jbsr _plus_constant
	movel d0,sp@-
	movel a3@(4),sp@-
L24:
	movel d2,sp@-
	pea 44:w
	jbsr _gen_rtx
	jra L1
L8:
	tstl d1
	jeq L18
	movel d1,sp@-
	clrl sp@-
	pea 30:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a3,sp@-
	movel d2,sp@-
	pea 44:w
	jbsr a2@
	movel d0,a3
	addw #28,sp
L18:
	cmpw #39,a3@
	jeq L22
	cmpw #38,a3@
	jeq L22
	tstl d3
	jeq L22
	movel a3,sp@-
	movel d2,sp@-
	pea 32:w
	jbsr _gen_rtx
	jra L1
L22:
	movel a3,d0
L1:
	moveml a6@(-20),#0xc1c
	unlk a6
	rts
	.even
.globl _eliminate_constant_term
_eliminate_constant_term:
	link a6,#-4
	moveml #0x3038,sp@-
	movel a6@(8),a3
	movel a6@(12),a4
L28:
	cmpw #44,a3@
	jne L30
	movel a3@(4),a0
	cmpw #30,a0@
	jne L27
	movel a0@(4),d1
	addl d1,a4@
	movel a3@(8),a3
	jra L28
L27:
	movel a3@(8),a0
	cmpw #30,a0@
	jne L29
	movel a0@(4),d1
	addl d1,a4@
	movel a3@(4),a3
	jra L28
L29:
	clrl a6@(-4)
	movel a6,d2
	subql #4,d2
	movel d2,sp@-
	movel a3@(4),sp@-
	lea _eliminate_constant_term,a2
	jbsr a2@
	movel d0,d3
	movel d2,sp@-
	movel a3@(8),sp@-
	jbsr a2@
	addw #16,sp
	cmpl a3@(8),d0
	jne L31
	cmpl a3@(4),d3
	jeq L30
L31:
	movel a6@(-4),d1
	addl d1,a4@
	movel d0,sp@-
	movel d3,sp@-
	clrl d0
	moveb a3@(2),d0
	movel d0,sp@-
	pea 44:w
	jbsr _gen_rtx
	jra L25
L30:
	movel a3,d0
L25:
	moveml a6@(-24),#0x1c0c
	unlk a6
	rts
	.even
.globl _expr_size
_expr_size:
	link a6,#0
	clrl sp@-
	pea 4:w
	clrl sp@-
	movel a6@(8),a0
	movel a0@(8),sp@-
	jbsr _size_in_bytes
	addqw #4,sp
	movel d0,sp@-
	jbsr _expand_expr
	unlk a6
	rts
	.even
.globl _lookup_static_chain
_lookup_static_chain:
	link a6,#0
	jbsr _abort
	unlk a6
	rts
	.even
_break_out_memory_refs:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(8),a3
	cmpw #37,a3@
	jeq L36
	cmpw #32,a3@
	jeq L36
	cmpw #39,a3@
	jne L35
L36:
	movel a3,sp@-
	pea 4:w
	jbsr _force_reg
	movel d0,d2
	movel d2,sp@-
	jbsr _mark_reg_pointer
	movel d2,a3
	jra L37
L35:
	cmpw #44,a3@
	jeq L39
	cmpw #45,a3@
	jeq L39
	cmpw #47,a3@
	jne L37
L39:
	movel a3@(4),sp@-
	lea _break_out_memory_refs,a2
	jbsr a2@
	movel d0,d2
	movel a3@(8),sp@-
	jbsr a2@
	addqw #8,sp
	cmpl a3@(4),d2
	jne L41
	cmpl a3@(8),d0
	jeq L37
L41:
	movel d0,sp@-
	movel d2,sp@-
	pea 4:w
	clrl d0
	movew a3@,d0
	movel d0,sp@-
	jbsr _gen_rtx
	movel d0,a3
L37:
	movel a3,d0
	moveml a6@(-12),#0xc04
	unlk a6
	rts
	.even
.globl _copy_all_regs
_copy_all_regs:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(8),a3
	cmpw #34,a3@
	jne L43
	moveq #14,d1
	cmpl a3@(4),d1
	jeq L45
	movel a3,sp@-
	jbsr _copy_to_reg
	jra L52
L43:
	cmpw #37,a3@
	jne L46
	movel a3,sp@-
	jbsr _copy_to_reg
	jra L52
L46:
	cmpw #44,a3@
	jeq L49
	cmpw #45,a3@
	jeq L49
	cmpw #47,a3@
	jne L45
L49:
	movel a3@(4),sp@-
	lea _copy_all_regs,a2
	jbsr a2@
	movel d0,d2
	movel a3@(8),sp@-
	jbsr a2@
	addqw #8,sp
	cmpl a3@(4),d2
	jne L51
	cmpl a3@(8),d0
	jeq L45
L51:
	movel d0,sp@-
	movel d2,sp@-
	pea 4:w
	clrl d0
	movew a3@,d0
	movel d0,sp@-
	jbsr _gen_rtx
L52:
	movel d0,a3
L45:
	movel a3,d0
	moveml a6@(-12),#0xc04
	unlk a6
	rts
	.even
.globl _memory_address
_memory_address:
	link a6,#-4
	moveml #0x3020,sp@-
	movel a6@(8),d3
	movel a6@(12),a2
	tstl _cse_not_expected
	jne L54
	cmpw #38,a2@
	jeq L190
	cmpw #39,a2@
	jeq L190
	cmpw #30,a2@
	jeq L190
	cmpw #32,a2@
	jeq L190
L54:
	cmpw #41,a2@
	jne L56
	movel a2@(4),a0
	cmpw #34,a0@
	jeq L189
L56:
	movel a2,d2
	tstl _cse_not_expected
	jne L57
	cmpw #34,a2@
	jeq L57
	movel a2,sp@-
	jbsr _break_out_memory_refs
	movel d0,a2
	addqw #4,sp
L57:
	cmpw #38,a2@
	jeq L63
	cmpw #39,a2@
	jeq L63
	cmpw #30,a2@
	jeq L63
	cmpw #32,a2@
	jeq L63
	cmpw #34,a2@
	jne L60
	moveq #-24,d0
	andl a2@(4),d0
	jne L63
L60:
	cmpw #63,a2@
	jeq L62
	cmpw #66,a2@
	jne L61
L62:
	movel a2@(4),a0
	cmpw #34,a0@
	jne L61
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L61:
	cmpw #44,a2@
	jne L58
	movel a2@(4),a0
	cmpw #34,a0@
	jne L58
	moveq #-24,d0
	andl a0@(4),d0
	jeq L58
	movel a2@(8),a0
	cmpw #30,a0@
	jne L58
	movel a0@(4),d0
	addl #32768,d0
	cmpl #65535,d0
	jls L63
L58:
	cmpw #44,a2@
	jne L64
	movel a2@(4),a0
	cmpw #34,a0@
	jne L66
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L65
L66:
	movel a2@(4),a0
	cmpw #77,a0@
	jne L67
	movel a0@(4),a0
	cmpw #34,a0@
	jne L67
	cmpb #2,a0@(2)
	jne L67
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L65
L67:
	btst #0,_target_flags+3
	jeq L64
	movel a2@(4),a0
	cmpw #47,a0@
	jne L64
	movel a0@(4),a0
	cmpw #34,a0@
	jne L69
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L68
L69:
	movel a2@(4),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L64
	movel a0@(4),a0
	cmpw #34,a0@
	jne L64
	cmpb #2,a0@(2)
	jne L64
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L64
L68:
	movel a2@(4),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L64
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L65
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L65
	moveq #8,d1
	cmpl a0@(4),d1
	jne L64
L65:
	movel a2@(8),a0
	cmpw #38,a0@
	jeq L63
	cmpw #34,a0@
	jne L64
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L64:
	cmpw #44,a2@
	jne L72
	movel a2@(8),a0
	cmpw #34,a0@
	jne L74
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L73
L74:
	movel a2@(8),a0
	cmpw #77,a0@
	jne L75
	movel a0@(4),a0
	cmpw #34,a0@
	jne L75
	cmpb #2,a0@(2)
	jne L75
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L73
L75:
	btst #0,_target_flags+3
	jeq L72
	movel a2@(8),a0
	cmpw #47,a0@
	jne L72
	movel a0@(4),a0
	cmpw #34,a0@
	jne L77
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L76
L77:
	movel a2@(8),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L72
	movel a0@(4),a0
	cmpw #34,a0@
	jne L72
	cmpb #2,a0@(2)
	jne L72
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L72
L76:
	movel a2@(8),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L72
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L73
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L73
	moveq #8,d1
	cmpl a0@(4),d1
	jne L72
L73:
	movel a2@(4),a0
	cmpw #38,a0@
	jeq L63
	cmpw #34,a0@
	jne L72
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L72:
	cmpw #44,a2@
	jne L80
	movel a2@(8),a0
	cmpw #30,a0@
	jne L81
	movel a0@(4),d0
	addl #128,d0
	cmpl #255,d0
	jhi L81
	movel a2@(4),a1
	cmpw #44,a1@
	jne L82
	movel a1@(4),a0
	cmpw #34,a0@
	jne L84
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L83
L84:
	movel a1@(4),a0
	cmpw #77,a0@
	jne L85
	movel a0@(4),a0
	cmpw #34,a0@
	jne L85
	cmpb #2,a0@(2)
	jne L85
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L83
L85:
	btst #0,_target_flags+3
	jeq L82
	movel a1@(4),a0
	cmpw #47,a0@
	jne L82
	movel a0@(4),a0
	cmpw #34,a0@
	jne L87
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L86
L87:
	movel a1@(4),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L82
	movel a0@(4),a0
	cmpw #34,a0@
	jne L82
	cmpb #2,a0@(2)
	jne L82
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L82
L86:
	movel a1@(4),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L82
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L83
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L83
	moveq #8,d1
	cmpl a0@(4),d1
	jne L82
L83:
	movel a1@(8),a0
	cmpw #38,a0@
	jeq L63
	cmpw #34,a0@
	jne L82
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L82:
	cmpw #44,a1@
	jne L81
	movel a1@(8),a0
	cmpw #34,a0@
	jne L92
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L91
L92:
	movel a1@(8),a0
	cmpw #77,a0@
	jne L93
	movel a0@(4),a0
	cmpw #34,a0@
	jne L93
	cmpb #2,a0@(2)
	jne L93
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L91
L93:
	btst #0,_target_flags+3
	jeq L81
	movel a1@(8),a0
	cmpw #47,a0@
	jne L81
	movel a0@(4),a0
	cmpw #34,a0@
	jne L95
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L94
L95:
	movel a1@(8),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L81
	movel a0@(4),a0
	cmpw #34,a0@
	jne L81
	cmpb #2,a0@(2)
	jne L81
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L81
L94:
	movel a1@(8),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L81
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L91
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L91
	moveq #8,d1
	cmpl a0@(4),d1
	jne L81
L91:
	movel a1@(4),a0
	cmpw #38,a0@
	jeq L63
	cmpw #34,a0@
	jne L81
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L81:
	movel a2@(4),a0
	cmpw #30,a0@
	jne L80
	movel a0@(4),d0
	addl #128,d0
	cmpl #255,d0
	jhi L80
	movel a2@(8),a1
	cmpw #44,a1@
	jne L99
	movel a1@(4),a0
	cmpw #34,a0@
	jne L101
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L100
L101:
	movel a1@(4),a0
	cmpw #77,a0@
	jne L102
	movel a0@(4),a0
	cmpw #34,a0@
	jne L102
	cmpb #2,a0@(2)
	jne L102
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L100
L102:
	btst #0,_target_flags+3
	jeq L99
	movel a1@(4),a0
	cmpw #47,a0@
	jne L99
	movel a0@(4),a0
	cmpw #34,a0@
	jne L104
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L103
L104:
	movel a1@(4),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L99
	movel a0@(4),a0
	cmpw #34,a0@
	jne L99
	cmpb #2,a0@(2)
	jne L99
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L99
L103:
	movel a1@(4),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L99
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L100
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L100
	moveq #8,d1
	cmpl a0@(4),d1
	jne L99
L100:
	movel a1@(8),a0
	cmpw #38,a0@
	jeq L63
	cmpw #34,a0@
	jne L99
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L99:
	cmpw #44,a1@
	jne L80
	movel a1@(8),a0
	cmpw #34,a0@
	jne L109
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L108
L109:
	movel a1@(8),a0
	cmpw #77,a0@
	jne L110
	movel a0@(4),a0
	cmpw #34,a0@
	jne L110
	cmpb #2,a0@(2)
	jne L110
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L108
L110:
	btst #0,_target_flags+3
	jeq L80
	movel a1@(8),a0
	cmpw #47,a0@
	jne L80
	movel a0@(4),a0
	cmpw #34,a0@
	jne L112
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L111
L112:
	movel a1@(8),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L80
	movel a0@(4),a0
	cmpw #34,a0@
	jne L80
	cmpb #2,a0@(2)
	jne L80
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L80
L111:
	movel a1@(8),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L80
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L108
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L108
	moveq #8,d1
	cmpl a0@(4),d1
	jne L80
L108:
	movel a1@(4),a0
	cmpw #38,a0@
	jeq L63
	cmpw #34,a0@
	jne L80
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L80:
	movel d2,sp@-
	movel d3,sp@-
	jbsr _memory_address_p
	addqw #8,sp
	tstl d0
	jne L116
	cmpl a2,d2
	sne d2
	moveq #1,d1
	andl d1,d2
	cmpw #44,a2@
	jne L117
	movel a2@(4),a0
	cmpw #47,a0@
	jne L118
	moveq #1,d2
	clrl sp@-
	movel a0,sp@-
	jbsr _force_operand
	movel d0,a2@(4)
	addqw #8,sp
L118:
	movel a2@(8),a0
	cmpw #47,a0@
	jne L119
	moveq #1,d2
	clrl sp@-
	movel a0,sp@-
	jbsr _force_operand
	movel d0,a2@(8)
	addqw #8,sp
L119:
	tstl d2
	jeq L120
	movel a2@(8),a0
	cmpw #34,a0@
	jne L120
	movel a2@(4),a0
	cmpw #34,a0@
	jeq L189
L120:
	tstl d2
	jeq L121
	cmpw #38,a2@
	jeq L63
	cmpw #39,a2@
	jeq L63
	cmpw #30,a2@
	jeq L63
	cmpw #32,a2@
	jeq L63
	cmpw #34,a2@
	jne L124
	moveq #-24,d0
	andl a2@(4),d0
	jne L63
L124:
	cmpw #63,a2@
	jeq L126
	cmpw #66,a2@
	jne L125
L126:
	movel a2@(4),a0
	cmpw #34,a0@
	jne L125
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L125:
	cmpw #44,a2@
	jne L122
	movel a2@(4),a0
	cmpw #34,a0@
	jne L122
	moveq #-24,d0
	andl a0@(4),d0
	jeq L122
	movel a2@(8),a0
	cmpw #30,a0@
	jne L122
	movel a0@(4),d0
	addl #32768,d0
	cmpl #65535,d0
	jls L63
L122:
	cmpw #44,a2@
	jne L127
	movel a2@(4),a0
	cmpw #34,a0@
	jne L129
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L128
L129:
	movel a2@(4),a0
	cmpw #77,a0@
	jne L130
	movel a0@(4),a0
	cmpw #34,a0@
	jne L130
	cmpb #2,a0@(2)
	jne L130
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L128
L130:
	btst #0,_target_flags+3
	jeq L127
	movel a2@(4),a0
	cmpw #47,a0@
	jne L127
	movel a0@(4),a0
	cmpw #34,a0@
	jne L132
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L131
L132:
	movel a2@(4),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L127
	movel a0@(4),a0
	cmpw #34,a0@
	jne L127
	cmpb #2,a0@(2)
	jne L127
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L127
L131:
	movel a2@(4),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L127
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L128
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L128
	moveq #8,d1
	cmpl a0@(4),d1
	jne L127
L128:
	movel a2@(8),a0
	cmpw #38,a0@
	jeq L63
	cmpw #34,a0@
	jne L127
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L127:
	cmpw #44,a2@
	jne L135
	movel a2@(8),a0
	cmpw #34,a0@
	jne L137
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L136
L137:
	movel a2@(8),a0
	cmpw #77,a0@
	jne L138
	movel a0@(4),a0
	cmpw #34,a0@
	jne L138
	cmpb #2,a0@(2)
	jne L138
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L136
L138:
	btst #0,_target_flags+3
	jeq L135
	movel a2@(8),a0
	cmpw #47,a0@
	jne L135
	movel a0@(4),a0
	cmpw #34,a0@
	jne L140
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L139
L140:
	movel a2@(8),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L135
	movel a0@(4),a0
	cmpw #34,a0@
	jne L135
	cmpb #2,a0@(2)
	jne L135
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L135
L139:
	movel a2@(8),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L135
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L136
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L136
	moveq #8,d1
	cmpl a0@(4),d1
	jne L135
L136:
	movel a2@(4),a0
	cmpw #38,a0@
	jeq L63
	cmpw #34,a0@
	jne L135
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L135:
	cmpw #44,a2@
	jne L121
	movel a2@(8),a0
	cmpw #30,a0@
	jne L144
	movel a0@(4),d0
	addl #128,d0
	cmpl #255,d0
	jhi L144
	movel a2@(4),a1
	cmpw #44,a1@
	jne L145
	movel a1@(4),a0
	cmpw #34,a0@
	jne L147
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L146
L147:
	movel a1@(4),a0
	cmpw #77,a0@
	jne L148
	movel a0@(4),a0
	cmpw #34,a0@
	jne L148
	cmpb #2,a0@(2)
	jne L148
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L146
L148:
	btst #0,_target_flags+3
	jeq L145
	movel a1@(4),a0
	cmpw #47,a0@
	jne L145
	movel a0@(4),a0
	cmpw #34,a0@
	jne L150
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L149
L150:
	movel a1@(4),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L145
	movel a0@(4),a0
	cmpw #34,a0@
	jne L145
	cmpb #2,a0@(2)
	jne L145
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L145
L149:
	movel a1@(4),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L145
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L146
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L146
	moveq #8,d1
	cmpl a0@(4),d1
	jne L145
L146:
	movel a1@(8),a0
	cmpw #38,a0@
	jeq L63
	cmpw #34,a0@
	jne L145
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L145:
	cmpw #44,a1@
	jne L144
	movel a1@(8),a0
	cmpw #34,a0@
	jne L155
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L154
L155:
	movel a1@(8),a0
	cmpw #77,a0@
	jne L156
	movel a0@(4),a0
	cmpw #34,a0@
	jne L156
	cmpb #2,a0@(2)
	jne L156
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L154
L156:
	btst #0,_target_flags+3
	jeq L144
	movel a1@(8),a0
	cmpw #47,a0@
	jne L144
	movel a0@(4),a0
	cmpw #34,a0@
	jne L158
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L157
L158:
	movel a1@(8),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L144
	movel a0@(4),a0
	cmpw #34,a0@
	jne L144
	cmpb #2,a0@(2)
	jne L144
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L144
L157:
	movel a1@(8),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L144
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L154
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L154
	moveq #8,d1
	cmpl a0@(4),d1
	jne L144
L154:
	movel a1@(4),a0
	cmpw #38,a0@
	jeq L63
	cmpw #34,a0@
	jne L144
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L144:
	movel a2@(4),a0
	cmpw #30,a0@
	jne L121
	movel a0@(4),d0
	addl #128,d0
	cmpl #255,d0
	jhi L121
	movel a2@(8),a1
	cmpw #44,a1@
	jne L162
	movel a1@(4),a0
	cmpw #34,a0@
	jne L164
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L163
L164:
	movel a1@(4),a0
	cmpw #77,a0@
	jne L165
	movel a0@(4),a0
	cmpw #34,a0@
	jne L165
	cmpb #2,a0@(2)
	jne L165
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L163
L165:
	btst #0,_target_flags+3
	jeq L162
	movel a1@(4),a0
	cmpw #47,a0@
	jne L162
	movel a0@(4),a0
	cmpw #34,a0@
	jne L167
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L166
L167:
	movel a1@(4),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L162
	movel a0@(4),a0
	cmpw #34,a0@
	jne L162
	cmpb #2,a0@(2)
	jne L162
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L162
L166:
	movel a1@(4),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L162
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L163
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L163
	moveq #8,d1
	cmpl a0@(4),d1
	jne L162
L163:
	movel a1@(8),a0
	cmpw #38,a0@
	jeq L63
	cmpw #34,a0@
	jne L162
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L162:
	cmpw #44,a1@
	jne L121
	movel a1@(8),a0
	cmpw #34,a0@
	jne L172
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L171
L172:
	movel a1@(8),a0
	cmpw #77,a0@
	jne L173
	movel a0@(4),a0
	cmpw #34,a0@
	jne L173
	cmpb #2,a0@(2)
	jne L173
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L171
L173:
	btst #0,_target_flags+3
	jeq L121
	movel a1@(8),a0
	cmpw #47,a0@
	jne L121
	movel a0@(4),a0
	cmpw #34,a0@
	jne L175
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L174
L175:
	movel a1@(8),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L121
	movel a0@(4),a0
	cmpw #34,a0@
	jne L121
	cmpb #2,a0@(2)
	jne L121
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L121
L174:
	movel a1@(8),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L121
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L171
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L171
	moveq #8,d1
	cmpl a0@(4),d1
	jne L121
L171:
	movel a1@(4),a0
	cmpw #38,a0@
	jeq L63
	cmpw #34,a0@
	jne L121
	moveq #-24,d0
	andl a0@(4),d0
	jne L63
L121:
	movel a2@(4),a0
	cmpw #34,a0@
	jeq L179
	cmpw #77,a0@
	jne L178
	movel a0@(4),a0
	cmpw #34,a0@
	jne L178
	cmpb #2,a0@(2)
	jne L178
L179:
	pea 4:w
	jbsr _gen_reg_rtx
	movel d0,d2
	clrl sp@-
	movel a2@(8),sp@-
	jbsr _force_operand
	movel d0,sp@-
	movel d2,sp@-
	jbsr _emit_move_insn
	movel d2,a2@(8)
	jra L189
L178:
	movel a2@(8),a0
	cmpw #34,a0@
	jeq L182
	cmpw #77,a0@
	jne L117
	movel a0@(4),a0
	cmpw #34,a0@
	jne L117
	cmpb #2,a0@(2)
	jne L117
L182:
	pea 4:w
	jbsr _gen_reg_rtx
	movel d0,d2
	clrl sp@-
	movel a2@(4),sp@-
	jbsr _force_operand
	movel d0,sp@-
	movel d2,sp@-
	jbsr _emit_move_insn
	movel d2,a2@(4)
	jra L189
L117:
	cmpw #44,a2@
	jne L183
	clrl a6@(-4)
	pea a6@(-4)
	movel a2,sp@-
	jbsr _eliminate_constant_term
	movel d0,d2
	addqw #8,sp
	tstl a6@(-4)
	jeq L188
	movel d2,sp@-
	movel d3,sp@-
	jbsr _memory_address_p
	addqw #8,sp
	tstl d0
	jeq L188
	movel a6@(-4),sp@-
	movel d2,sp@-
	jbsr _copy_to_reg
	addqw #4,sp
	movel d0,sp@-
	jbsr _plus_constant
	movel d0,d2
	movel d2,sp@-
	movel d3,sp@-
	jbsr _memory_address_p
	addw #16,sp
	tstl d0
	jeq L188
	movel d2,d0
	jra L53
L183:
	cmpw #47,a2@
	jeq L188
	cmpw #45,a2@
	jne L190
L188:
	clrl sp@-
	movel a2,sp@-
	jbsr _force_operand
	jra L53
L116:
	movel d2,a2
L63:
	tstl _flag_force_addr
	jeq L189
	tstl _optimize
	jeq L189
	cmpw #34,a2@
	jeq L189
	cmpw #44,a2@
	jne L190
	movel a2@(4),d1
	cmpl _frame_pointer_rtx,d1
	jeq L189
	cmpl _arg_pointer_rtx,d1
	jeq L189
L190:
	movel a2,sp@-
	pea 4:w
	jbsr _force_reg
	jra L53
L189:
	movel a2,d0
L53:
	moveml a6@(-16),#0x40c
	unlk a6
	rts
	.even
.globl _memory_address_noforce
_memory_address_noforce:
	link a6,#0
	movel d2,sp@-
	movel _flag_force_addr,d2
	clrl _flag_force_addr
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	jbsr _memory_address
	movel d2,_flag_force_addr
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _stabilize
_stabilize:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(8),a3
	cmpw #37,a3@
	jne L194
	movel a3@(4),a2
	movel a2,sp@-
	jbsr _rtx_unstable_p
	addqw #4,sp
	tstl d0
	jeq L194
	movel a2,sp@-
	jbsr _copy_all_regs
	movel d0,a0
	addqw #4,sp
	cmpw #34,a0@
	jeq L195
	movel a0,sp@-
	jbsr _copy_to_reg
	movel d0,a0
	addqw #4,sp
L195:
	movel a0,sp@-
	clrl d0
	moveb a3@(2),d0
	movel d0,sp@-
	pea 37:w
	jbsr _gen_rtx
	movel d0,a0
	cmpw #44,a2@
	jeq L197
	btst #3,a3@(3)
	jeq L196
L197:
	orb #8,a0@(3)
L196:
	movel a0,d0
	jra L192
L194:
	movel a3,d0
L192:
	moveml a6@(-8),#0xc00
	unlk a6
	rts
	.even
.globl _copy_to_reg
_copy_to_reg:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),a2
	clrl d0
	moveb a2@(2),d0
	movel d0,sp@-
	jbsr _gen_reg_rtx
	movel d0,d2
	movel a2,sp@-
	movel d2,sp@-
	jbsr _emit_move_insn
	movel d2,d0
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _copy_addr_to_reg
_copy_addr_to_reg:
	link a6,#0
	movel d2,sp@-
	pea 4:w
	jbsr _gen_reg_rtx
	movel d0,d2
	movel a6@(8),sp@-
	movel d2,sp@-
	jbsr _emit_move_insn
	movel d2,d0
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _copy_to_mode_reg
_copy_to_mode_reg:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(8),d2
	movel a6@(12),a2
	movel d2,sp@-
	jbsr _gen_reg_rtx
	movel d0,d3
	clrl d0
	moveb a2@(2),d0
	addqw #4,sp
	cmpl d0,d2
	jeq L201
	tstb a2@(2)
	jeq L201
	jbsr _abort
L201:
	movel a2,sp@-
	movel d3,sp@-
	jbsr _emit_move_insn
	movel d3,d0
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _force_reg
_force_reg:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(12),a2
	cmpw #34,a2@
	jne L203
	movel a2,d0
	jra L202
L203:
	movel a6@(8),sp@-
	jbsr _gen_reg_rtx
	movel d0,d2
	movel a2,sp@-
	movel d2,sp@-
	jbsr _emit_move_insn
	movel d0,a3
	addw #12,sp
	cmpw #38,a2@
	jeq L205
	cmpw #39,a2@
	jeq L205
	cmpw #30,a2@
	jeq L205
	cmpw #32,a2@
	jne L204
L205:
	movel a3@(28),sp@-
	movel a2,sp@-
	pea 3:w
	pea 2:w
	jbsr _gen_rtx
	movel d0,a3@(28)
L204:
	movel d2,d0
L202:
	moveml a6@(-12),#0xc04
	unlk a6
	rts
	.even
.globl _force_not_mem
_force_not_mem:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),a2
	cmpw #37,a2@
	jeq L207
	movel a2,d0
	jra L206
L207:
	clrl d0
	moveb a2@(2),d0
	movel d0,sp@-
	jbsr _gen_reg_rtx
	movel d0,d2
	movel a2,sp@-
	movel d2,sp@-
	jbsr _emit_move_insn
	movel d2,d0
L206:
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _copy_to_suggested_reg
_copy_to_suggested_reg:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),a2
	movel a6@(12),a0
	tstl a0
	jeq L209
	cmpw #34,a0@
	jne L209
	movel a0,d2
	jra L210
L209:
	clrl d0
	moveb a2@(2),d0
	movel d0,sp@-
	jbsr _gen_reg_rtx
	movel d0,d2
	addqw #4,sp
L210:
	movel a2,sp@-
	movel d2,sp@-
	jbsr _emit_move_insn
	movel d2,d0
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _adjust_stack
_adjust_stack:
	link a6,#0
	movel a6@(8),d0
	clrl sp@-
	movel d0,sp@-
	jbsr _protect_from_queue
	movel d0,sp@-
	movel _stack_pointer_rtx,sp@-
	jbsr _gen_add2_insn
	movel d0,sp@-
	jbsr _emit_insn
	unlk a6
	rts
	.even
.globl _anti_adjust_stack
_anti_adjust_stack:
	link a6,#0
	movel a6@(8),d0
	clrl sp@-
	movel d0,sp@-
	jbsr _protect_from_queue
	movel d0,sp@-
	movel _stack_pointer_rtx,sp@-
	jbsr _gen_sub2_insn
	movel d0,sp@-
	jbsr _emit_insn
	unlk a6
	rts
	.even
.globl _round_push
_round_push:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(8),a3
	moveq #2,d2
	cmpw #30,a3@
	jne L215
	movel d2,d0
	addl a3@(4),d0
	subql #1,d0
	divsl d2,d0
	mulsl d2,d0
	cmpl a3@(4),d0
	jeq L217
	movel d0,sp@-
	clrl sp@-
	pea 30:w
	jbsr _gen_rtx
	jra L218
L215:
	pea 1:w
	clrl sp@-
	movel d2,sp@-
	clrl sp@-
	pea 30:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	movel a3,sp@-
	pea 4:w
	pea 67:w
	clrl sp@-
	jbsr _expand_divmod
	movel d0,a3
	pea 1:w
	clrl sp@-
	movel d2,sp@-
	clrl sp@-
	pea 30:w
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	movel a3,sp@-
	pea 4:w
	jbsr _expand_mult
L218:
	movel d0,a3
L217:
	movel a3,d0
	moveml a6@(-12),#0xc04
	unlk a6
	rts
	.even
.globl _hard_function_value
_hard_function_value:
	link a6,#0
	clrl sp@-
	clrl d0
	movel a6@(8),a0
	moveb a0@(28),d0
	movel d0,sp@-
	pea 34:w
	jbsr _gen_rtx
	unlk a6
	rts
	.even
.globl _hard_libcall_value
_hard_libcall_value:
	link a6,#0
	clrl sp@-
	movel a6@(8),sp@-
	pea 34:w
	jbsr _gen_rtx
	unlk a6
	rts
