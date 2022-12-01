#NO_APP
gcc_compiled.:
.text
	.even
.globl _init_recog
_init_recog:
	link a6,#0
	clrl _volatile_ok
	clrl sp@-
	clrl sp@-
	pea 37:w
	jbsr _gen_rtx
	movel d0,_recog_addr_dummy
	unlk a6
	rts
	.even
.globl _recog_memoized
_recog_memoized:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	moveq #1,d1
	movel d1,_volatile_ok
	tstl a2@(20)
	jge L3
	movel a2,sp@-
	movel a2@(16),sp@-
	jbsr _recog
	movel d0,a2@(20)
L3:
	movel a2@(20),d0
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _next_insn_tests_no_inequality
_next_insn_tests_no_inequality:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),a1
	movel a1@(12),a0
	clrl d2
	cmpw #14,a0@
	jeq L6
	cmpw #13,a0@
	jeq L6
	cmpw #15,a0@
	jne L5
L6:
	movel a0@(16),sp@-
	jbsr _inequality_comparisons_p
	tstl d0
	jne L5
	moveq #1,d2
L5:
	movel d2,d0
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _next_insns_test_no_inequality
_next_insns_test_no_inequality:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a1
	movel a1@(12),a2
L8:
	cmpw #17,a2@
	jeq L17
	cmpw #16,a2@
	jeq L17
	cmpw #18,a2@
	jeq L10
	movel a2@(16),sp@-
	jbsr _inequality_comparisons_p
	addqw #4,sp
	tstl d0
	jeq L14
	clrl d0
	jra L7
L14:
	movel a2@(16),a0
	cmpw #25,a0@
	jne L15
	movel a0@(4),a1
	cmpl _cc0_rtx,a1
	jeq L17
L15:
	movel a2@(16),sp@-
	movel _cc0_rtx,sp@-
	jbsr _reg_mentioned_p
	addqw #8,sp
	tstl d0
	jne L10
L17:
	moveq #1,d0
	jra L7
L10:
	movel a2@(12),a2
	jra L8
L7:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
_inequality_comparisons_p:
	link a6,#0
	moveml #0x3c30,sp@-
	movel a6@(8),a2
	clrl d0
	movew a2@,d0
	moveq #-30,d1
	addl d0,d1
	moveq #46,d5
	cmpl d5,d1
	jhi L19
LI38:
	movew pc@(L38-LI38-2:b,d1:l:2),d5
	jmp pc@(2,d5:w)
L38:
	.word L54-L38
	.word L54-L38
	.word L54-L38
	.word L54-L38
	.word L54-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L54-L38
	.word L54-L38
	.word L54-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L19-L38
	.word L35-L38
	.word L35-L38
	.word L35-L38
	.word L35-L38
	.word L35-L38
	.word L35-L38
	.word L35-L38
	.word L35-L38
L35:
	clrl d0
	movel a2@(4),d5
	cmpl _cc0_rtx,d5
	jeq L56
	movel a2@(8),d5
	cmpl _cc0_rtx,d5
	jne L18
	jra L56
L19:
	lea _rtx_length,a0
	movel a0@(d0:l:4),d4
	lea _rtx_format,a0
	movel a0@(d0:l:4),a3
	clrl d3
	cmpl d3,d4
	jle L54
L52:
	cmpb #101,a3@(d3:l)
	jne L43
	movel a2@(4,d3:l:4),sp@-
	jbsr _inequality_comparisons_p
	addqw #4,sp
	tstl d0
	jeq L42
L56:
	moveq #1,d0
	jra L18
L43:
	cmpb #69,a3@(d3:l)
	jne L42
	movel a2@(4,d3:l:4),a0
	movel a0@,d2
	jra L49
L51:
	movel a2@(4,d3:l:4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _inequality_comparisons_p
	addqw #4,sp
	tstl d0
	jne L56
L49:
	subql #1,d2
	jpl L51
L42:
	addql #1,d3
	cmpl d3,d4
	jgt L52
L54:
	clrl d0
L18:
	moveml a6@(-24),#0xc3c
	unlk a6
	rts
	.even
.globl _general_operand
_general_operand:
	link a6,#0
	moveml #0x3830,sp@-
	movel a6@(8),a3
	movel a6@(12),d2
	clrl d1
	movew a3@,d1
	clrl d3
	tstl d2
	jne L58
	clrl d2
	moveb a3@(2),d2
L58:
	cmpw #38,a3@
	jeq L60
	cmpw #39,a3@
	jeq L60
	cmpw #30,a3@
	jeq L60
	cmpw #32,a3@
	jne L59
L60:
	clrl d1
	tstb a3@(2)
	jeq L62
	clrl d0
	moveb a3@(2),d0
	cmpl d0,d2
	jne L61
L62:
	moveq #1,d1
L61:
	movel d1,d0
	jra L57
L59:
	clrl d0
	moveb a3@(2),d0
	cmpl d0,d2
	jne L69
	moveq #35,d4
	cmpl d1,d4
	jne L129
	clrl d1
L66:
	movel a3@(4),a3
	movew a3@,d1
	moveq #35,d4
	cmpl d1,d4
	jeq L66
L129:
	moveq #34,d4
	cmpl d1,d4
	jeq L128
	moveq #31,d4
	cmpl d1,d4
	jeq L128
	moveq #37,d4
	cmpl d1,d4
	jne L69
	movel a3@(4),a1
	tstl _volatile_ok
	jne L70
	btst #4,a3@(3)
	jne L69
L70:
	cmpw #38,a1@
	jeq L76
	cmpw #39,a1@
	jeq L76
	cmpw #30,a1@
	jeq L76
	cmpw #32,a1@
	jeq L76
	cmpw #34,a1@
	jne L73
	moveq #-24,d0
	andl a1@(4),d0
	jne L76
L73:
	cmpw #63,a1@
	jeq L75
	cmpw #66,a1@
	jne L74
L75:
	movel a1@(4),a0
	cmpw #34,a0@
	jne L74
	moveq #-24,d0
	andl a0@(4),d0
	jne L76
L74:
	cmpw #44,a1@
	jne L71
	movel a1@(4),a0
	cmpw #34,a0@
	jne L71
	moveq #-24,d0
	andl a0@(4),d0
	jeq L71
	movel a1@(8),a0
	cmpw #30,a0@
	jne L71
	movel a0@(4),d0
	addl #32768,d0
	cmpl #65535,d0
	jls L76
L71:
	cmpw #44,a1@
	jne L77
	movel a1@(4),a0
	cmpw #34,a0@
	jne L79
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L78
L79:
	movel a1@(4),a0
	cmpw #77,a0@
	jne L80
	movel a0@(4),a0
	cmpw #34,a0@
	jne L80
	cmpb #2,a0@(2)
	jne L80
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L78
L80:
	btst #0,_target_flags+3
	jeq L77
	movel a1@(4),a0
	cmpw #47,a0@
	jne L77
	movel a0@(4),a0
	cmpw #34,a0@
	jne L82
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L81
L82:
	movel a1@(4),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L77
	movel a0@(4),a0
	cmpw #34,a0@
	jne L77
	cmpb #2,a0@(2)
	jne L77
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jge L77
L81:
	movel a1@(4),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L77
	moveq #2,d4
	cmpl a0@(4),d4
	jeq L78
	moveq #4,d4
	cmpl a0@(4),d4
	jeq L78
	moveq #8,d4
	cmpl a0@(4),d4
	jne L77
L78:
	movel a1@(8),a0
	cmpw #38,a0@
	jeq L76
	cmpw #34,a0@
	jne L77
	moveq #-24,d0
	andl a0@(4),d0
	jne L76
L77:
	cmpw #44,a1@
	jne L85
	movel a1@(8),a0
	cmpw #34,a0@
	jne L87
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L86
L87:
	movel a1@(8),a0
	cmpw #77,a0@
	jne L88
	movel a0@(4),a0
	cmpw #34,a0@
	jne L88
	cmpb #2,a0@(2)
	jne L88
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L86
L88:
	btst #0,_target_flags+3
	jeq L85
	movel a1@(8),a0
	cmpw #47,a0@
	jne L85
	movel a0@(4),a0
	cmpw #34,a0@
	jne L90
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L89
L90:
	movel a1@(8),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L85
	movel a0@(4),a0
	cmpw #34,a0@
	jne L85
	cmpb #2,a0@(2)
	jne L85
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jge L85
L89:
	movel a1@(8),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L85
	moveq #2,d4
	cmpl a0@(4),d4
	jeq L86
	moveq #4,d4
	cmpl a0@(4),d4
	jeq L86
	moveq #8,d4
	cmpl a0@(4),d4
	jne L85
L86:
	movel a1@(4),a0
	cmpw #38,a0@
	jeq L76
	cmpw #34,a0@
	jne L85
	moveq #-24,d0
	andl a0@(4),d0
	jne L76
L85:
	cmpw #44,a1@
	jne L69
	movel a1@(8),a0
	cmpw #30,a0@
	jne L94
	movel a0@(4),d0
	addl #128,d0
	cmpl #255,d0
	jhi L94
	movel a1@(4),a2
	cmpw #44,a2@
	jne L95
	movel a2@(4),a0
	cmpw #34,a0@
	jne L97
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L96
L97:
	movel a2@(4),a0
	cmpw #77,a0@
	jne L98
	movel a0@(4),a0
	cmpw #34,a0@
	jne L98
	cmpb #2,a0@(2)
	jne L98
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L96
L98:
	btst #0,_target_flags+3
	jeq L95
	movel a2@(4),a0
	cmpw #47,a0@
	jne L95
	movel a0@(4),a0
	cmpw #34,a0@
	jne L100
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L99
L100:
	movel a2@(4),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L95
	movel a0@(4),a0
	cmpw #34,a0@
	jne L95
	cmpb #2,a0@(2)
	jne L95
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jge L95
L99:
	movel a2@(4),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L95
	moveq #2,d4
	cmpl a0@(4),d4
	jeq L96
	moveq #4,d4
	cmpl a0@(4),d4
	jeq L96
	moveq #8,d4
	cmpl a0@(4),d4
	jne L95
L96:
	movel a2@(8),a0
	cmpw #38,a0@
	jeq L76
	cmpw #34,a0@
	jne L95
	moveq #-24,d0
	andl a0@(4),d0
	jne L76
L95:
	cmpw #44,a2@
	jne L94
	movel a2@(8),a0
	cmpw #34,a0@
	jne L105
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L104
L105:
	movel a2@(8),a0
	cmpw #77,a0@
	jne L106
	movel a0@(4),a0
	cmpw #34,a0@
	jne L106
	cmpb #2,a0@(2)
	jne L106
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L104
L106:
	btst #0,_target_flags+3
	jeq L94
	movel a2@(8),a0
	cmpw #47,a0@
	jne L94
	movel a0@(4),a0
	cmpw #34,a0@
	jne L108
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L107
L108:
	movel a2@(8),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L94
	movel a0@(4),a0
	cmpw #34,a0@
	jne L94
	cmpb #2,a0@(2)
	jne L94
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jge L94
L107:
	movel a2@(8),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L94
	moveq #2,d4
	cmpl a0@(4),d4
	jeq L104
	moveq #4,d4
	cmpl a0@(4),d4
	jeq L104
	moveq #8,d4
	cmpl a0@(4),d4
	jne L94
L104:
	movel a2@(4),a0
	cmpw #38,a0@
	jeq L76
	cmpw #34,a0@
	jne L94
	moveq #-24,d0
	andl a0@(4),d0
	jne L76
L94:
	movel a1@(4),a0
	cmpw #30,a0@
	jne L69
	movel a0@(4),d0
	addl #128,d0
	cmpl #255,d0
	jhi L69
	movel a1@(8),a1
	cmpw #44,a1@
	jne L112
	movel a1@(4),a0
	cmpw #34,a0@
	jne L114
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L113
L114:
	movel a1@(4),a0
	cmpw #77,a0@
	jne L115
	movel a0@(4),a0
	cmpw #34,a0@
	jne L115
	cmpb #2,a0@(2)
	jne L115
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L113
L115:
	btst #0,_target_flags+3
	jeq L112
	movel a1@(4),a0
	cmpw #47,a0@
	jne L112
	movel a0@(4),a0
	cmpw #34,a0@
	jne L117
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L116
L117:
	movel a1@(4),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L112
	movel a0@(4),a0
	cmpw #34,a0@
	jne L112
	cmpb #2,a0@(2)
	jne L112
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jge L112
L116:
	movel a1@(4),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L112
	moveq #2,d4
	cmpl a0@(4),d4
	jeq L113
	moveq #4,d4
	cmpl a0@(4),d4
	jeq L113
	moveq #8,d4
	cmpl a0@(4),d4
	jne L112
L113:
	movel a1@(8),a0
	cmpw #38,a0@
	jeq L76
	cmpw #34,a0@
	jne L112
	moveq #-24,d0
	andl a0@(4),d0
	jne L76
L112:
	cmpw #44,a1@
	jne L69
	movel a1@(8),a0
	cmpw #34,a0@
	jne L122
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L121
L122:
	movel a1@(8),a0
	cmpw #77,a0@
	jne L123
	movel a0@(4),a0
	cmpw #34,a0@
	jne L123
	cmpb #2,a0@(2)
	jne L123
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L121
L123:
	btst #0,_target_flags+3
	jeq L69
	movel a1@(8),a0
	cmpw #47,a0@
	jne L69
	movel a0@(4),a0
	cmpw #34,a0@
	jne L125
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jlt L124
L125:
	movel a1@(8),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L69
	movel a0@(4),a0
	cmpw #34,a0@
	jne L69
	cmpb #2,a0@(2)
	jne L69
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d4
	cmpl d0,d4
	jge L69
L124:
	movel a1@(8),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L69
	moveq #2,d4
	cmpl a0@(4),d4
	jeq L121
	moveq #4,d4
	cmpl a0@(4),d4
	jeq L121
	moveq #8,d4
	cmpl a0@(4),d4
	jne L69
L121:
	movel a1@(4),a0
	cmpw #38,a0@
	jeq L76
	cmpw #34,a0@
	jne L69
	moveq #-24,d0
	andl a0@(4),d0
	jne L76
L69:
	clrl d0
	jra L57
L76:
	tstl d3
	jeq L128
	movel a3@(4),sp@-
	jbsr _mode_dependent_address_p
	tstl d0
	seq d0
	moveq #1,d4
	andl d4,d0
	jra L57
L128:
	moveq #1,d0
L57:
	moveml a6@(-20),#0xc1c
	unlk a6
	rts
	.even
.globl _address_operand
_address_operand:
	link a6,#0
	movel a6@(8),sp@-
	movel a6@(12),sp@-
	jbsr _memory_address_p
	unlk a6
	rts
	.even
.globl _register_operand
_register_operand:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),a0
	movel a6@(12),d1
	clrl d0
	moveb a0@(2),d0
	cmpl d0,d1
	jeq L132
	tstl d1
	jeq L132
	clrl d0
	jra L131
L132:
	cmpw #35,a0@
	jne L139
	tstl _reload_completed
	jne L139
	movel d1,sp@-
	movel a0,sp@-
	jbsr _general_operand
	jra L131
L137:
	movel a0@(4),a0
L139:
	cmpw #35,a0@
	jeq L137
	cmpw #34,a0@
	seq d0
	moveq #1,d2
	andl d2,d0
L131:
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _immediate_operand
_immediate_operand:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),a0
	movel a6@(12),d2
	clrl d1
	cmpw #38,a0@
	jeq L142
	cmpw #39,a0@
	jeq L142
	cmpw #30,a0@
	jeq L142
	cmpw #32,a0@
	jeq L142
	cmpw #31,a0@
	jne L141
	clrl d0
	moveb a0@(2),d0
	cmpl d0,d2
	jeq L142
	tstl d2
	jne L141
L142:
	moveq #1,d1
L141:
	movel d1,d0
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _nonimmediate_operand
_nonimmediate_operand:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),a2
	clrl d2
	movel a6@(12),sp@-
	movel a2,sp@-
	jbsr _general_operand
	tstl d0
	jeq L144
	cmpw #38,a2@
	jeq L144
	cmpw #39,a2@
	jeq L144
	cmpw #30,a2@
	jeq L144
	cmpw #32,a2@
	jeq L144
	cmpw #31,a2@
	jeq L144
	moveq #1,d2
L144:
	movel d2,d0
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _nonmemory_operand
_nonmemory_operand:
	link a6,#0
	moveml #0x3000,sp@-
	movel a6@(8),a0
	movel a6@(12),d2
	cmpw #38,a0@
	jeq L147
	cmpw #39,a0@
	jeq L147
	cmpw #30,a0@
	jeq L147
	cmpw #32,a0@
	jeq L147
	cmpw #31,a0@
	jne L146
L147:
	clrl d1
	tstb a0@(2)
	jeq L149
	clrl d0
	moveb a0@(2),d0
	cmpl d0,d2
	jne L148
L149:
	moveq #1,d1
L148:
	movel d1,d0
	jra L145
L146:
	clrl d0
	moveb a0@(2),d0
	cmpl d0,d2
	jeq L150
	tstl d2
	jeq L150
	clrl d0
	jra L145
L150:
	cmpw #35,a0@
	jne L157
	tstl _reload_completed
	jne L157
	movel d2,sp@-
	movel a0,sp@-
	jbsr _general_operand
	jra L145
L155:
	movel a0@(4),a0
L157:
	cmpw #35,a0@
	jeq L155
	cmpw #34,a0@
	seq d0
	moveq #1,d3
	andl d3,d0
L145:
	moveml a6@(-8),#0xc
	unlk a6
	rts
	.even
.globl _push_operand
_push_operand:
	link a6,#0
	movel a6@(8),a0
	cmpw #37,a0@
	jne L162
	clrl d0
	moveb a0@(2),d0
	cmpl a6@(12),d0
	jne L162
	movel a0@(4),a0
	cmpw #63,a0@
	jeq L161
L162:
	clrl d0
	jra L158
L161:
	movel a0@(4),d1
	cmpl _stack_pointer_rtx,d1
	seq d0
	moveq #1,d1
	andl d1,d0
L158:
	unlk a6
	rts
	.even
.globl _memory_address_p
_memory_address_p:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),a2
	cmpw #38,a2@
	jeq L169
	cmpw #39,a2@
	jeq L169
	cmpw #30,a2@
	jeq L169
	cmpw #32,a2@
	jeq L169
	cmpw #34,a2@
	jne L166
	moveq #-24,d0
	andl a2@(4),d0
	jne L169
L166:
	cmpw #63,a2@
	jeq L168
	cmpw #66,a2@
	jne L167
L168:
	movel a2@(4),a0
	cmpw #34,a0@
	jne L167
	moveq #-24,d0
	andl a0@(4),d0
	jne L169
L167:
	cmpw #44,a2@
	jne L164
	movel a2@(4),a0
	cmpw #34,a0@
	jne L164
	moveq #-24,d0
	andl a0@(4),d0
	jeq L164
	movel a2@(8),a0
	cmpw #30,a0@
	jne L164
	movel a0@(4),d0
	addl #32768,d0
	cmpl #65535,d0
	jls L169
L164:
	cmpw #44,a2@
	jne L170
	movel a2@(4),a0
	cmpw #34,a0@
	jne L172
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L171
L172:
	movel a2@(4),a0
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
	jeq L170
	movel a2@(4),a0
	cmpw #47,a0@
	jne L170
	movel a0@(4),a0
	cmpw #34,a0@
	jne L175
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L174
L175:
	movel a2@(4),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L170
	movel a0@(4),a0
	cmpw #34,a0@
	jne L170
	cmpb #2,a0@(2)
	jne L170
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L170
L174:
	movel a2@(4),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L170
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L171
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L171
	moveq #8,d1
	cmpl a0@(4),d1
	jne L170
L171:
	movel a2@(8),a0
	cmpw #38,a0@
	jeq L169
	cmpw #34,a0@
	jne L170
	moveq #-24,d0
	andl a0@(4),d0
	jne L169
L170:
	cmpw #44,a2@
	jne L178
	movel a2@(8),a0
	cmpw #34,a0@
	jne L180
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L179
L180:
	movel a2@(8),a0
	cmpw #77,a0@
	jne L181
	movel a0@(4),a0
	cmpw #34,a0@
	jne L181
	cmpb #2,a0@(2)
	jne L181
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L179
L181:
	btst #0,_target_flags+3
	jeq L178
	movel a2@(8),a0
	cmpw #47,a0@
	jne L178
	movel a0@(4),a0
	cmpw #34,a0@
	jne L183
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L182
L183:
	movel a2@(8),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L178
	movel a0@(4),a0
	cmpw #34,a0@
	jne L178
	cmpb #2,a0@(2)
	jne L178
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L178
L182:
	movel a2@(8),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L178
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L179
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L179
	moveq #8,d1
	cmpl a0@(4),d1
	jne L178
L179:
	movel a2@(4),a0
	cmpw #38,a0@
	jeq L169
	cmpw #34,a0@
	jne L178
	moveq #-24,d0
	andl a0@(4),d0
	jne L169
L178:
	cmpw #44,a2@
	jne L186
	movel a2@(8),a0
	cmpw #30,a0@
	jne L187
	movel a0@(4),d0
	addl #128,d0
	cmpl #255,d0
	jhi L187
	movel a2@(4),a1
	cmpw #44,a1@
	jne L188
	movel a1@(4),a0
	cmpw #34,a0@
	jne L190
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L189
L190:
	movel a1@(4),a0
	cmpw #77,a0@
	jne L191
	movel a0@(4),a0
	cmpw #34,a0@
	jne L191
	cmpb #2,a0@(2)
	jne L191
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L189
L191:
	btst #0,_target_flags+3
	jeq L188
	movel a1@(4),a0
	cmpw #47,a0@
	jne L188
	movel a0@(4),a0
	cmpw #34,a0@
	jne L193
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L192
L193:
	movel a1@(4),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L188
	movel a0@(4),a0
	cmpw #34,a0@
	jne L188
	cmpb #2,a0@(2)
	jne L188
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L188
L192:
	movel a1@(4),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L188
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L189
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L189
	moveq #8,d1
	cmpl a0@(4),d1
	jne L188
L189:
	movel a1@(8),a0
	cmpw #38,a0@
	jeq L169
	cmpw #34,a0@
	jne L188
	moveq #-24,d0
	andl a0@(4),d0
	jne L169
L188:
	cmpw #44,a1@
	jne L187
	movel a1@(8),a0
	cmpw #34,a0@
	jne L198
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L197
L198:
	movel a1@(8),a0
	cmpw #77,a0@
	jne L199
	movel a0@(4),a0
	cmpw #34,a0@
	jne L199
	cmpb #2,a0@(2)
	jne L199
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L197
L199:
	btst #0,_target_flags+3
	jeq L187
	movel a1@(8),a0
	cmpw #47,a0@
	jne L187
	movel a0@(4),a0
	cmpw #34,a0@
	jne L201
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L200
L201:
	movel a1@(8),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L187
	movel a0@(4),a0
	cmpw #34,a0@
	jne L187
	cmpb #2,a0@(2)
	jne L187
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L187
L200:
	movel a1@(8),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L187
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L197
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L197
	moveq #8,d1
	cmpl a0@(4),d1
	jne L187
L197:
	movel a1@(4),a0
	cmpw #38,a0@
	jeq L169
	cmpw #34,a0@
	jne L187
	moveq #-24,d0
	andl a0@(4),d0
	jne L169
L187:
	movel a2@(4),a0
	cmpw #30,a0@
	jne L186
	movel a0@(4),d0
	addl #128,d0
	cmpl #255,d0
	jhi L186
	movel a2@(8),a1
	cmpw #44,a1@
	jne L205
	movel a1@(4),a0
	cmpw #34,a0@
	jne L207
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L206
L207:
	movel a1@(4),a0
	cmpw #77,a0@
	jne L208
	movel a0@(4),a0
	cmpw #34,a0@
	jne L208
	cmpb #2,a0@(2)
	jne L208
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L206
L208:
	btst #0,_target_flags+3
	jeq L205
	movel a1@(4),a0
	cmpw #47,a0@
	jne L205
	movel a0@(4),a0
	cmpw #34,a0@
	jne L210
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L209
L210:
	movel a1@(4),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L205
	movel a0@(4),a0
	cmpw #34,a0@
	jne L205
	cmpb #2,a0@(2)
	jne L205
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L205
L209:
	movel a1@(4),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L205
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L206
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L206
	moveq #8,d1
	cmpl a0@(4),d1
	jne L205
L206:
	movel a1@(8),a0
	cmpw #38,a0@
	jeq L169
	cmpw #34,a0@
	jne L205
	moveq #-24,d0
	andl a0@(4),d0
	jne L169
L205:
	cmpw #44,a1@
	jne L186
	movel a1@(8),a0
	cmpw #34,a0@
	jne L215
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L214
L215:
	movel a1@(8),a0
	cmpw #77,a0@
	jne L216
	movel a0@(4),a0
	cmpw #34,a0@
	jne L216
	cmpb #2,a0@(2)
	jne L216
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L214
L216:
	btst #0,_target_flags+3
	jeq L186
	movel a1@(8),a0
	cmpw #47,a0@
	jne L186
	movel a0@(4),a0
	cmpw #34,a0@
	jne L218
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jlt L217
L218:
	movel a1@(8),a0
	movel a0@(4),a0
	cmpw #77,a0@
	jne L186
	movel a0@(4),a0
	cmpw #34,a0@
	jne L186
	cmpb #2,a0@(2)
	jne L186
	movel a0@(4),d0
	eorw #16,d0
	moveq #7,d1
	cmpl d0,d1
	jge L186
L217:
	movel a1@(8),a0
	movel a0@(8),a0
	cmpw #30,a0@
	jne L186
	moveq #2,d1
	cmpl a0@(4),d1
	jeq L214
	moveq #4,d1
	cmpl a0@(4),d1
	jeq L214
	moveq #8,d1
	cmpl a0@(4),d1
	jne L186
L214:
	movel a1@(4),a0
	cmpw #38,a0@
	jeq L169
	cmpw #34,a0@
	jne L186
	moveq #-24,d0
	andl a0@(4),d0
	jne L169
L186:
	clrl d0
	jra L163
L169:
	moveq #1,d0
L163:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _memory_operand
_memory_operand:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(8),a2
	movel a6@(12),d0
	clrl d2
	tstl _reload_completed
	jne L222
	clrl d2
	cmpw #37,a2@
	jne L223
	movel d0,sp@-
	movel a2,sp@-
	jbsr _general_operand
	tstl d0
	jeq L223
	moveq #1,d2
L223:
	movel d2,d0
	jra L221
L222:
	cmpw #35,a2@
	jne L229
	moveq #1,d2
L226:
	movel a2@(4),a2
	cmpw #35,a2@
	jeq L226
L229:
	clrl d3
	cmpw #37,a2@
	jne L227
	movel d0,sp@-
	movel a2,sp@-
	jbsr _general_operand
	addqw #8,sp
	tstl d0
	jeq L227
	tstl d2
	jeq L228
	movel a2@(4),sp@-
	jbsr _mode_dependent_address_p
	tstl d0
	jne L227
L228:
	moveq #1,d3
L227:
	movel d3,d0
L221:
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _indirect_operand
_indirect_operand:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),a2
	movel a6@(12),d1
	clrl d2
	clrl d0
	moveb a2@(2),d0
	cmpl d0,d1
	jne L231
	movel d1,sp@-
	movel a2,sp@-
	jbsr _memory_operand
	addqw #8,sp
	tstl d0
	jeq L231
	pea 4:w
	movel a2@(4),sp@-
	jbsr _general_operand
	tstl d0
	jeq L231
	moveq #1,d2
L231:
	movel d2,d0
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _asm_noperands
_asm_noperands:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(8),a2
	cmpw #22,a2@
	jne L233
	movel a2@(16),a0
	movel a0@,d0
	jra L232
L233:
	cmpw #25,a2@
	jne L234
	movel a2@(8),a0
	cmpw #22,a0@
	jne L234
	movel a0@(16),a0
	movel a0@,d0
	addql #1,d0
	jra L232
L234:
	cmpw #20,a2@
	jne L236
	movel a2@(4),a1
	movel a1@(4),a0
	cmpw #25,a0@
	jne L236
	movel a0@(8),a0
	cmpw #22,a0@
	jne L236
	movel a1@,d0
	jle L238
	movel a2@(4),a1
L242:
	movel a1@(d0:l:4),a0
	cmpw #25,a0@
	jeq L238
	cmpw #27,a0@
	jne L251
	subql #1,d0
	tstl d0
	jgt L242
L238:
	movel d0,d1
	clrl d0
	cmpl d0,d1
	jle L259
	movel a2@(4),a3
L249:
	movel a3@(4,d0:l:4),a1
	cmpw #25,a1@
	jne L251
	movel a1@(8),a0
	cmpw #22,a0@
	jne L251
	movel a1@(8),a0
	movel a2@(4),a1
	movel a1@(4),a1
	movel a1@(8),a1
	movel a0@(16),d2
	cmpl a1@(16),d2
	jne L251
	addql #1,d0
	cmpl d0,d1
	jgt L249
L259:
	movel a2@(4),a0
	movel a0@(4),a0
	movel a0@(8),a0
	movel a0@(16),a0
	movel d1,d0
	addl a0@,d0
	jra L232
L236:
	cmpw #20,a2@
	jne L251
	movel a2@(4),a1
	movel a1@(4),a0
	cmpw #22,a0@
	jne L251
	movel a1@,d0
	subql #1,d0
	tstl d0
	jle L258
	movel a2@(4),a1
L256:
	movel a1@(4,d0:l:4),a0
	cmpw #27,a0@
	jne L251
	subql #1,d0
	tstl d0
	jgt L256
L258:
	movel a2@(4),a0
	movel a0@(4),a0
	movel a0@(16),a0
	movel a0@,d0
	jra L232
L251:
	moveq #-1,d0
L232:
	moveml a6@(-12),#0xc04
	unlk a6
	rts
	.even
.globl _decode_asm_operands
_decode_asm_operands:
	link a6,#-4
	moveml #0x3f3c,sp@-
	movel a6@(8),a3
	movel a6@(12),a4
	movel a6@(16),a5
	movel a6@(20),d7
	clrl d0
	cmpw #25,a3@
	jne L262
	movel a3@(8),a0
	cmpw #22,a0@
	jne L262
	movel a0,a1
	movel a1@(16),a0
	movel a0@,d4
	addql #1,d4
	moveq #1,d2
	cmpl d2,d4
	jle L318
	andl #255,d1
L270:
	tstl a5
	jeq L266
	movel d2,d0
	asll #2,d0
	addl a1@(16),d0
	movel d0,a5@(d2:l:4)
L266:
	tstl a4
	jeq L267
	movel a1@(16),a0
	movel a0@(d2:l:4),a4@(d2:l:4)
L267:
	tstl d7
	jeq L268
	movel a1@(20),a0
	movel a0@(d2:l:4),a0
	movel d7,a2
	movel a0@(4),a2@(d2:l:4)
L268:
	tstl a6@(24)
	jeq L265
	movel a1@(20),a0
	movel a0@(d2:l:4),a0
	moveb a0@(2),d1
	movel a6@(24),a2
	movel d1,a2@(d2:l:4)
L265:
	addql #1,d2
	cmpl d2,d4
	jgt L270
L318:
	tstl a4
	jeq L271
	movel a3@(4),a4@
L271:
	tstl a5
	jeq L272
	movel a3,a2
	addqw #4,a2
	movel a2,a5@
L272:
	tstl d7
	jeq L273
	movel d7,a2
	movel a1@(8),a2@
L273:
	tstl a6@(24)
	jeq L314
	movel a3@(4),a0
	clrl d0
	moveb a0@(2),d0
	movel a6@(24),a2
	movel d0,a2@
	jra L314
L262:
	cmpw #22,a3@
	jne L276
	movel a3,a1
	movel a3@(16),a0
	movel a0@,d4
	clrl d2
	cmpl d2,d4
	jle L314
	andl #255,d3
L284:
	tstl a5
	jeq L280
	movel d2,d0
	asll #2,d0
	addql #4,d0
	addl a1@(16),d0
	movel d0,a5@(d2:l:4)
L280:
	tstl a4
	jeq L281
	movel a1@(16),a0
	movel a0@(4,d2:l:4),a4@(d2:l:4)
L281:
	tstl d7
	jeq L282
	movel a1@(20),a0
	movel a0@(4,d2:l:4),a0
	movel d7,a2
	movel a0@(4),a2@(d2:l:4)
L282:
	tstl a6@(24)
	jeq L279
	movel a1@(20),a0
	movel a0@(4,d2:l:4),a0
	moveb a0@(2),d3
	movel a6@(24),a2
	movel d3,a2@(d2:l:4)
L279:
	addql #1,d2
	cmpl d2,d4
	jgt L284
	jra L314
L276:
	cmpw #20,a3@
	jne L286
	movel a3@(4),a1
	movel a1@(4),a0
	cmpw #25,a0@
	jne L286
	movel a0@(8),a6@(-4)
	movel a1@,d0
	movel a6@(-4),a2
	movel a2@(16),a0
	movel a0@,d4
	clrl d3
	clrl d2
	cmpl d2,d0
	jle L288
	andl #255,d5
L295:
	movel a3@(4),a0
	movel a0@(4,d2:l:4),a0
	cmpw #27,a0@
	jeq L288
	tstl a4
	jeq L291
	movel a0@(4),a4@(d2:l:4)
L291:
	tstl a5
	jeq L292
	movel a3@(4),a0
	movel a0@(4,d2:l:4),a2
	addqw #4,a2
	movel a2,a5@(d2:l:4)
L292:
	tstl d7
	jeq L293
	movel a3@(4),a0
	movel a0@(4,d2:l:4),a0
	movel a0@(8),a0
	movel d7,a2
	movel a0@(8),a2@(d2:l:4)
L293:
	tstl a6@(24)
	jeq L294
	movel a3@(4),a0
	movel a0@(4,d2:l:4),a0
	movel a0@(4),a0
	moveb a0@(2),d5
	movel a6@(24),a2
	movel d5,a2@(d2:l:4)
L294:
	addql #1,d3
	addql #1,d2
	cmpl d2,d0
	jgt L295
L288:
	clrl d2
	cmpl d2,d4
	jle L315
	andl #255,d6
L303:
	tstl a5
	jeq L299
	movel d2,d1
	addl d3,d1
	movel d2,d0
	asll #2,d0
	addql #4,d0
	movel a6@(-4),a2
	addl a2@(16),d0
	movel d0,a5@(d1:l:4)
L299:
	tstl a4
	jeq L300
	movel d2,d0
	addl d3,d0
	movel a6@(-4),a2
	movel a2@(16),a0
	movel a0@(4,d2:l:4),a4@(d0:l:4)
L300:
	tstl d7
	jeq L301
	movel d2,d0
	addl d3,d0
	movel a6@(-4),a2
	movel a2@(20),a0
	movel a0@(4,d2:l:4),a0
	movel d7,a2
	movel a0@(4),a2@(d0:l:4)
L301:
	tstl a6@(24)
	jeq L298
	movel d2,d0
	addl d3,d0
	movel a6@(-4),a2
	movel a2@(20),a0
	movel a0@(4,d2:l:4),a0
	moveb a0@(2),d6
	movel a6@(24),a2
	movel d6,a2@(d0:l:4)
L298:
	addql #1,d2
	cmpl d2,d4
	jgt L303
L315:
	movel a6@(-4),a2
	movel a2@(4),d0
	jra L275
L286:
	cmpw #20,a3@
	jne L275
	movel a3@(4),a0
	movel a0@(4),a0
	cmpw #22,a0@
	jne L275
	movel a0,a1
	movel a1@(16),a0
	movel a0@,d1
	clrl d2
	cmpl d2,d1
	jle L314
	andl #255,d4
L313:
	tstl a5
	jeq L309
	movel d2,d0
	asll #2,d0
	addql #4,d0
	addl a1@(16),d0
	movel d0,a5@(d2:l:4)
L309:
	tstl a4
	jeq L310
	movel a1@(16),a0
	movel a0@(4,d2:l:4),a4@(d2:l:4)
L310:
	tstl d7
	jeq L311
	movel a1@(20),a0
	movel a0@(4,d2:l:4),a0
	movel d7,a2
	movel a0@(4),a2@(d2:l:4)
L311:
	tstl a6@(24)
	jeq L308
	movel a1@(20),a0
	movel a0@(4,d2:l:4),a0
	moveb a0@(2),d4
	movel a6@(24),a2
	movel d4,a2@(d2:l:4)
L308:
	addql #1,d2
	cmpl d2,d1
	jgt L313
L314:
	movel a1@(4),d0
L275:
	moveml a6@(-44),#0x3cfc
	unlk a6
	rts
	.even
_find_constant_term_loc:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	movel a2@,a0
	clrl d0
	movew a0@,d0
	moveq #30,d1
	cmpl d0,d1
	jeq L325
	moveq #39,d1
	cmpl d0,d1
	jeq L325
	moveq #38,d1
	cmpl d0,d1
	jeq L325
	moveq #32,d1
	cmpl d0,d1
	jeq L325
	movel a2@,a0
	cmpw #44,a0@
	jne L328
	movel a2@,a0
	tstl a0@(4)
	jeq L323
	movel a0@(4),a0
	cmpw #38,a0@
	jeq L324
	cmpw #39,a0@
	jeq L324
	cmpw #30,a0@
	jeq L324
	cmpw #32,a0@
	jne L323
L324:
	movel a2@,a0
	tstl a0@(8)
	jeq L323
	movel a0@(8),a0
	cmpw #38,a0@
	jeq L325
	cmpw #39,a0@
	jeq L325
	cmpw #30,a0@
	jeq L325
	cmpw #32,a0@
	jne L323
L325:
	movel a2,d0
	jra L319
L323:
	movel a2@,a0
	tstl a0@(4)
	jeq L326
	movel a0,d1
	addql #4,d1
	movel d1,sp@-
	jbsr _find_constant_term_loc
	addqw #4,sp
	tstl d0
	jne L319
L326:
	movel a2@,a0
	tstl a0@(8)
	jeq L328
	movel a0,d1
	addql #8,d1
	movel d1,sp@-
	jbsr _find_constant_term_loc
	tstl d0
	jne L319
L328:
	clrl d0
L319:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _offsetable_memref_p
_offsetable_memref_p:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),a0
	clrl d2
	cmpw #37,a0@
	jne L331
	movel a0@(4),sp@-
	clrl d0
	moveb a0@(2),d0
	movel d0,sp@-
	pea 1:w
	jbsr _offsetable_address_p
	tstl d0
	jeq L331
	moveq #1,d2
L331:
	movel d2,d0
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _offsetable_address_p
_offsetable_address_p:
	link a6,#-4
	moveml #0x3030,sp@-
	movel a6@(12),d3
	movel a6@(16),a2
	clrl d2
	movew a2@,d2
	movel a2,a6@(-4)
	tstl a6@(8)
	jeq L333
	lea _strict_memory_address_p,a3
	jra L334
L333:
	lea _memory_address_p,a3
L334:
	cmpw #38,a2@
	jeq L336
	cmpw #39,a2@
	jeq L336
	cmpw #30,a2@
	jeq L336
	cmpw #32,a2@
	jne L335
L336:
	moveq #1,d0
	jra L332
L335:
	moveq #44,d1
	cmpl d2,d1
	jne L337
	pea a6@(-4)
	jbsr _find_constant_term_loc
	movel d0,a0
	addqw #4,sp
	tstl a0
	jeq L337
	movel a0@,a0
	movel a0,a6@(-4)
	movel a0@(4),d2
	movel d2,d0
	subql #1,d0
	lea _mode_size,a1
	addl a1@(d3:l:4),d0
	movel d0,a0@(4)
	movel a2,sp@-
	movel d3,sp@-
	jbsr a3@
	movel a6@(-4),a0
	movel d2,a0@(4)
	jra L332
L337:
	moveq #63,d1
	cmpl d2,d1
	jeq L339
	moveq #64,d1
	cmpl d2,d1
	jeq L339
	moveq #65,d1
	cmpl d2,d1
	jeq L339
	moveq #66,d1
	cmpl d2,d1
	jne L338
L339:
	clrl d0
	jra L332
L338:
	lea _mode_size,a0
	movel a0@(d3:l:4),d1
	subql #1,d1
	movel d1,sp@-
	movel a2,sp@-
	jbsr _plus_constant
	movel d0,sp@-
	movel d3,sp@-
	jbsr a3@
L332:
	moveml a6@(-20),#0xc0c
	unlk a6
	rts
	.even
.globl _mode_dependent_address_p
_mode_dependent_address_p:
	link a6,#0
	movel a6@(8),a0
	cmpw #66,a0@
	jeq L343
	cmpw #63,a0@
	jeq L343
	clrl d0
	jra L340
L343:
	moveq #1,d0
L340:
	unlk a6
	rts
	.even
.globl _mode_independent_operand
_mode_independent_operand:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	movel a6@(12),sp@-
	movel a2,sp@-
	jbsr _general_operand
	tstl d0
	jeq L349
	cmpw #37,a2@
	jne L350
	movel a2@(4),a0
	cmpw #66,a0@
	jeq L349
	cmpw #63,a0@
	jeq L349
L350:
	moveq #1,d0
	jra L344
L349:
	clrl d0
L344:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _adj_offsetable_operand
_adj_offsetable_operand:
	link a6,#-4
	moveml #0x2038,sp@-
	movel a6@(8),a4
	movel a6@(12),d2
	clrl d0
	movew a4@,d0
	moveq #37,d1
	cmpl d0,d1
	jne L352
	movel a4@(4),a2
	cmpw #38,a2@
	jeq L355
	cmpw #39,a2@
	jeq L355
	cmpw #30,a2@
	jeq L355
	cmpw #32,a2@
	jeq L355
	cmpw #44,a2@
	jne L355
	movel a2,a6@(-4)
	movel a4,sp@-
	jbsr _copy_rtx
	movel d0,a4
	movel a4@(4),a6@(-4)
	pea a6@(-4)
	jbsr _find_constant_term_loc
	movel d0,a3
	addqw #8,sp
	tstl a3
	jeq L355
	movel d2,sp@-
	movel a3@,sp@-
	jbsr _plus_constant
	movel d0,a3@
	movel a4,d0
	jra L351
L355:
	movel d2,sp@-
	movel a2,sp@-
	jbsr _plus_constant
	movel d0,sp@-
	clrl d0
	moveb a4@(2),d0
	movel d0,sp@-
	pea 37:w
	jbsr _gen_rtx
	jra L351
L352:
	jbsr _abort
L351:
	moveml a6@(-20),#0x1c04
	unlk a6
	rts
	.even
.globl _constrain_operands
_constrain_operands:
	link a6,#-60
	moveml #0x3f3c,sp@-
	movel a6@(8),a2
	lea _insn_n_operands,a0
	movel a0@(a2:l:4),d6
	lea _insn_n_alternatives,a0
	movel a0@(a2:l:4),a5
	jeq L469
	tstl a5
	jeq L469
	clrl d2
	cmpl d2,d6
	jle L468
	lea a2@(a2:l:4),a1
	movel a1,d0
	asll #2,d0
	lea _insn_operand_constraint,a0
	addl d0,a0
L363:
	movel a0@(d2:l:4),a6@(-20,d2:l:4)
	addql #1,d2
	cmpl d2,d6
	jgt L363
L468:
	clrl _which_alternative
	cmpl _which_alternative,a5
	jle L467
	lea _recog_operand,a4
L463:
	clrl d7
	clrl d4
	clrl d5
	cmpl d5,d6
	jle L466
L458:
	movel a4@(d5:l:4),a2
	movel a6@(-20,d5:l:4),a3
	clrl d3
	cmpw #35,a2@
	jne L465
L371:
	jbsr _abort
	cmpw #35,a2@
	jeq L371
L465:
	tstb a3@
	jeq L470
	cmpb #44,a3@
	jne L374
	jra L470
L456:
	moveb a3@+,d2
	extbl d2
	moveq #44,d1
	cmpl d2,d1
	jeq L375
	moveq #-33,d0
	addl d2,d0
	moveq #82,d1
	cmpl d1,d0
	jhi L437
LI455:
	movew pc@(L455-LI455-2:b,d0:l:2),d1
	jmp pc@(2,d1:w)
L455:
	.word L374-L455
	.word L437-L455
	.word L374-L455
	.word L437-L455
	.word L374-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L374-L455
	.word L374-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L388-L455
	.word L388-L455
	.word L388-L455
	.word L388-L455
	.word L388-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L399-L455
	.word L374-L455
	.word L402-L455
	.word L374-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L405-L455
	.word L408-L455
	.word L408-L455
	.word L425-L455
	.word L425-L455
	.word L425-L455
	.word L425-L455
	.word L425-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L392-L455
	.word L437-L455
	.word L416-L455
	.word L437-L455
	.word L437-L455
	.word L437-L455
	.word L397-L455
	.word L419-L455
	.word L435-L455
	.word L470-L455
	.word L437-L455
	.word L395-L455
	.word L414-L455
L388:
	movel a4@(d5:l:4),sp@-
	lea _recog_operand-192,a1
	movel a1@(d2:l:4),sp@-
	jbsr _operands_match_p
	addqw #8,sp
	tstl d0
	jeq L389
	moveq #1,d3
L389:
	moveq #2,d1
	cmpl d0,d1
	jne L374
	movel d5,a6@(-60,d4:l:8)
	moveq #-48,d1
	addl d1,d2
	movel d2,a6@(-56,d4:l:8)
	addql #1,d4
	jra L374
L392:
	cmpw #34,a2@
	jne L470
	clrl d0
	moveb a2@(2),d0
	movel d0,sp@-
	clrl sp@-
	pea 10:w
	jra L471
L395:
	cmpw #34,a2@
	jne L374
	clrl d0
	moveb a2@(2),d0
	movel d0,sp@-
	clrl sp@-
	pea 10:w
	jra L471
L397:
	cmpw #37,a2@
	jne L374
	jra L470
L399:
	cmpw #37,a2@
	jne L374
	movel a2@(4),a0
	cmpw #63,a0@
	jeq L470
	cmpw #65,a0@
	jne L374
	jra L470
L402:
	cmpw #37,a2@
	jne L374
	movel a2@(4),a0
	cmpw #64,a0@
	jeq L470
	cmpw #66,a0@
	jne L374
	jra L470
L405:
	cmpw #31,a2@
	jne L374
	jra L470
L408:
	cmpw #31,a2@
	jne L374
	moveq #71,d1
	cmpl d2,d1
	jne L410
	btst #1,_target_flags+3
	jeq L470
	movel a2,sp@-
	jbsr _standard_68881_constant_p
	addqw #4,sp
	tstl d0
	jeq L470
	jra L374
L410:
	moveq #72,d1
	cmpl d2,d1
	jne L374
	btst #6,_target_flags+3
	jeq L374
	movel a2,sp@-
	jbsr _standard_sun_fpa_constant_p
	addqw #4,sp
	jra L472
L414:
	cmpw #30,a2@
	jeq L374
L416:
	cmpw #38,a2@
	jeq L470
	cmpw #39,a2@
	jeq L470
	cmpw #30,a2@
	jeq L470
	cmpw #32,a2@
	jne L374
	jra L470
L419:
	cmpw #30,a2@
	jne L374
	jra L470
L425:
	cmpw #30,a2@
	jne L374
	moveq #73,d1
	cmpl d2,d1
	jne L427
	tstl a2@(4)
	jle L374
	moveq #8,d1
	cmpl a2@(4),d1
	jge L470
	jra L374
L427:
	moveq #74,d1
	cmpl d2,d1
	jne L429
	cmpl #-32768,a2@(4)
	jlt L374
	cmpl #32767,a2@(4)
	jle L470
	jra L374
L429:
	moveq #75,d1
	cmpl d2,d1
	jne L431
	moveq #-128,d1
	cmpl a2@(4),d1
	jgt L470
	moveq #127,d1
	cmpl a2@(4),d1
	jlt L470
	jra L374
L431:
	moveq #76,d1
	cmpl d2,d1
	jne L374
	tstl a2@(4)
	jge L374
	moveq #-8,d1
	cmpl a2@(4),d1
	jgt L374
	jra L470
L435:
	movel a2,sp@-
	jbsr _offsetable_memref_p
	addqw #4,sp
	jra L472
L437:
	cmpw #34,a2@
	jne L374
	clrl d0
	moveb a2@(2),d0
	movel d0,sp@-
	clrl sp@-
	moveq #97,d1
	cmpl d2,d1
	jne L439
	moveq #9,d0
	jra L440
L439:
	moveq #100,d1
	cmpl d2,d1
	jne L441
	moveq #5,d0
	jra L440
L441:
	moveq #102,d1
	cmpl d2,d1
	jne L443
	btst #1,_target_flags+3
	jeq L451
	moveq #3,d0
	jra L440
L443:
	moveq #120,d1
	cmpl d2,d1
	jne L447
	btst #6,_target_flags+3
	jeq L451
	moveq #2,d0
	jra L440
L447:
	moveq #121,d1
	cmpl d2,d1
	jne L451
	btst #6,_target_flags+3
	jeq L453
	moveq #1,d0
	jra L440
L453:
L451:
	clrl d0
L440:
	movel d0,sp@-
L471:
	movel a2,sp@-
	jbsr _reg_fits_class_p
	addw #16,sp
L472:
	tstl d0
	jeq L374
L470:
	moveq #1,d3
L374:
	tstb a3@
	jne L456
L375:
	movel a3,a6@(-20,d5:l:4)
	tstl d3
	jne L368
	moveq #1,d7
L368:
	addql #1,d5
	cmpl d5,d6
	jgt L458
L466:
	tstl d7
	jne L459
	jra L460
L462:
	movel a6@(-56,d4:l:8),d0
	movel a6@(-60,d4:l:8),d1
	movel a4@(d1:l:4),a4@(d0:l:4)
L460:
	subql #1,d4
	jpl L462
L469:
	moveq #1,d0
	jra L357
L459:
	addql #1,_which_alternative
	cmpl _which_alternative,a5
	jgt L463
L467:
	clrl d0
L357:
	moveml a6@(-100),#0x3cfc
	unlk a6
	rts
	.even
.globl _reg_fits_class_p
_reg_fits_class_p:
	link a6,#0
	moveml #0x3e00,sp@-
	movel a6@(12),d5
	movel a6@(16),d3
	movel a6@(8),a1
	movel a1@(4),d4
	moveq #55,d6
	cmpl d4,d6
	jlt L474
	movel d4,d0
	addl d3,d0
	jpl L475
	moveq #31,d6
	addl d6,d0
L475:
	asrl #5,d0
	movel d0,d2
	asll #2,d2
	lea _reg_class_contents,a1
	lea a1@(d5:l:8),a0
	movel d4,d0
	addl d3,d0
	movel d0,d1
	jge L476
	moveq #31,d6
	addl d6,d0
L476:
	moveq #-32,d6
	andl d6,d0
	subl d1,d0
	negl d0
	movel a0@(d2:l),d6
	btst d0,d6
	jeq L474
	addl d3,d4
	moveq #15,d6
	cmpl d4,d6
	jge L477
	moveq #1,d1
	jra L478
L477:
	lea _mode_size,a0
	movel a6@(20),d6
	movel a0@(d6:l:4),d1
	addql #3,d1
	jpl L479
	addql #3,d1
L479:
	asrl #2,d1
L478:
	subql #1,d1
	tstl d1
	jle L481
	movel d5,d0
	asll #3,d0
	lea _reg_class_contents,a0
	addl d0,a0
L486:
	movel d4,d0
	addl d1,d0
	jpl L484
	moveq #31,d6
	addl d6,d0
L484:
	asrl #5,d0
	movel d0,d3
	asll #2,d3
	movel d4,d0
	addl d1,d0
	movel d0,d2
	jge L485
	moveq #31,d6
	addl d6,d0
L485:
	moveq #-32,d6
	andl d6,d0
	subl d2,d0
	negl d0
	movel a0@(d3:l),d6
	btst d0,d6
	jeq L481
	subql #1,d1
	tstl d1
	jgt L486
L481:
	tstl d1
	seq d0
	moveq #1,d6
	andl d6,d0
	jra L473
L474:
	clrl d0
L473:
	moveml a6@(-20),#0x7c
	unlk a6
	rts
.comm _reload_completed,4
.comm _which_alternative,4
.comm _recog_addr_dummy,4
.comm _volatile_ok,4
