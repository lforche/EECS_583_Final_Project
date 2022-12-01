#NO_APP
gcc_compiled.:
.text
	.even
.globl _jump_optimize
_jump_optimize:
	link a6,#-36
	moveml #0x3f3c,sp@-
	moveq #1,d7
	movel d7,a6@(-28)
	clrl a6@(-36)
	movel a6@(8),a3
	tstl a3
	jeq L127
L8:
	cmpw #17,a3@
	jne L5
	clrl a3@(20)
L5:
	cmpw #14,a3@
	jne L6
	clrl a3@(32)
L6:
	movel a3@(4),d7
	cmpl a6@(-36),d7
	jle L4
	movel a3@(4),a6@(-36)
L4:
	movel a3@(12),a3
	tstl a3
	jne L8
L127:
	addql #1,a6@(-36)
	movel a6@(-36),d0
	asll #2,d0
	movel d0,d1
	addql #1,d1
	moveq #-2,d7
	andl d7,d1
	subl d1,sp
	movel sp,d1
	movel d1,_jump_chain
	movel d0,sp@-
	clrl sp@-
	movel d1,sp@-
	jbsr _memset
	movel a6@(8),a3
	addw #12,sp
L128:
	tstl a3
	jeq L126
	cmpw #16,a3@
	jne L12
	movel a3@(12),a3
	tstl a3
	jeq L128
L17:
	cmpw #17,a3@
	jeq L128
	cmpw #18,a3@
	jne L15
	moveq #-6,d7
	cmpl a3@(20),d7
	jeq L15
	movel a3@(12),a3
	jra L13
L15:
	movel a3,sp@-
	jbsr _delete_insn
	movel d0,a3
	addqw #4,sp
L13:
	tstl a3
	jne L17
	jra L128
L12:
	movel a3@(12),a3
	jra L128
L126:
	movel a6@(8),a3
	tstl a3
	jeq L124
L26:
	cmpw #14,a3@
	jne L22
	btst #4,a3@(3)
	jne L22
	movel a6@(12),sp@-
	movel a3,sp@-
	movel a3@(16),sp@-
	jbsr _mark_jump_label
	addw #12,sp
	tstl a3@(32)
	jeq L24
	movel a3,sp@-
	jbsr _simplejump_p
	addqw #4,sp
	tstl d0
	jeq L24
	movel a3@(4),d0
	movel _jump_chain,a0
	movel a3@(32),a1
	movel a1@(4),d1
	movel a0@(d1:l:4),a0@(d0:l:4)
	movel a3@(32),a1
	movel a1@(4),d0
	movel a3,a0@(d0:l:4)
L24:
	movel a3@(16),a0
	cmpw #29,a0@
	jne L22
	movel a3@(4),d0
	movel _jump_chain,a0
	movel a0@,a0@(d0:l:4)
	movel a3,a0@
L22:
	movel a3@(12),a3
	tstl a3
	jne L26
L124:
	clrl a6@(-32)
	movel a6@(8),a3
L129:
	tstl a3
	jeq L123
	cmpw #17,a3@
	jne L30
	tstl a3@(20)
	jne L30
	movel a3,sp@-
	jbsr _delete_insn
	movel d0,a3
	addqw #4,sp
	jra L129
L30:
	movel a3,a6@(-32)
	movel a3@(12),a3
	jra L129
L123:
	tstl _optimize
	jne L33
	movel a6@(-32),a3
	tstl a3
	jeq L35
L38:
	cmpw #17,a3@
	jeq L36
	cmpw #14,a3@
	jne L37
	movel a3@(16),a0
	cmpw #29,a0@
	jeq L36
L37:
	cmpw #18,a3@
	jne L35
	moveq #-6,d7
	cmpl a3@(20),d7
	jeq L35
L36:
	movel a3@(8),a3
	tstl a3
	jne L38
L35:
	tstl a3
	jeq L39
	cmpw #18,a3@
	jne L39
	moveq #-6,d7
	cmpl a3@(20),d7
	jne L39
	btst #4,a3@(3)
	jne L39
	moveq #1,d7
	movel d7,_current_function_returns_null
L39:
	movel a6@(8),a3
	tstl a3
	jeq L1
L43:
	andb #239,a3@(3)
	movel a3@(12),a3
	tstl a3
	jne L43
	jra L1
L33:
	tstl a6@(16)
	jeq L44
	movel a6@(8),a3
	tstl a3
	jeq L44
L62:
	movel a3@(12),d3
	cmpw #13,a3@
	jne L48
	movel a3@(16),a4
	cmpw #26,a4@
	jeq L130
	cmpw #27,a4@
	jeq L130
	cmpw #25,a4@
	jne L52
	movel a4@(4),d7
	cmpl a4@(8),d7
	jeq L53
	movel a4@(4),a1
	cmpw #37,a1@
	jne L52
	movel a4@(8),a0
	cmpw #37,a0@
	jne L52
	movel a1,sp@-
	movel a0,sp@-
	jbsr _rtx_equal_p
	addqw #8,sp
	tstl d0
	jeq L52
L53:
	movel a4@(4),a0
	cmpw #37,a0@
	jne L54
	btst #4,a0@(3)
	jne L52
L54:
	movel a4@(8),a0
	cmpw #37,a0@
	jne L130
	btst #4,a0@(3)
	jeq L130
L52:
	cmpw #25,a4@
	jne L48
	movel a4@(8),sp@-
	lea _true_regnum,a2
	jbsr a2@
	movel d0,d2
	movel a4@(4),sp@-
	jbsr a2@
	movel d0,d1
	addqw #8,sp
	cmpl d2,d1
	jne L58
	tstl d2
	jge L130
L58:
	tstl d2
	jlt L48
	tstl d1
	jlt L48
	movel a4@(8),a0
	clrl d0
	moveb a0@(2),d0
	movel d0,sp@-
	movel d1,sp@-
	clrl sp@-
	movel d2,sp@-
	clrl sp@-
	movel a3,sp@-
	clrl sp@-
	jbsr _find_equiv_reg
	movel d0,a1
	addw #28,sp
	tstl a1
	jeq L48
	movel a4@(4),a0
	moveb a1@(2),d7
	cmpb a0@(2),d7
	jne L48
L130:
	movel a3,sp@-
	jbsr _delete_insn
	addqw #4,sp
L48:
	movel d3,a3
	tstl a3
	jne L62
L44:
L109:
	clrl d5
	movel a6@(8),a3
	tstl a3
	jeq L119
L108:
	movel a3@(12),d6
	cmpw #14,a3@
	jne L68
	movel a3@(16),a0
	cmpw #23,a0@
	jne L69
	movel a6@(16),sp@-
	clrl sp@-
	movel a0,sp@-
	jbsr _tension_vector_labels
	orl d0,d5
	addw #12,sp
L69:
	movel a3@(16),a0
	cmpw #24,a0@
	jne L68
	movel a6@(16),sp@-
	pea 1:w
	movel a0,sp@-
	jbsr _tension_vector_labels
	orl d0,d5
	addw #12,sp
L68:
	cmpw #14,a3@
	jne L71
	tstl a3@(32)
	jeq L71
	movel a3@(32),sp@-
	jbsr _prev_real_insn
	movel d0,a4
	addqw #4,sp
	cmpl a4,a3
	jne L72
	movel a3,sp@-
	jbsr _condjump_p
	addqw #4,sp
	tstl d0
	jeq L72
	movel a3,sp@-
	jbsr _delete_jump
	moveq #1,d5
	addqw #4,sp
	jra L67
L72:
	movel a3,sp@-
	jbsr _next_real_insn
	movel d0,a2
	addqw #4,sp
	tstl a2
	jeq L74
	cmpw #14,a2@
	jne L74
	movel a3,sp@-
	jbsr _condjump_p
	addqw #4,sp
	tstl d0
	jeq L74
	movel a2,sp@-
	jbsr _simplejump_p
	addqw #4,sp
	tstl d0
	jeq L74
	movel a3@(32),d7
	cmpl a2@(32),d7
	jne L74
	movel a3,sp@-
	jbsr _delete_jump
	moveq #1,d5
	movel a3@(12),d6
	addqw #4,sp
	jra L67
L74:
	movel a3,sp@-
	jbsr _simplejump_p
	addqw #4,sp
	tstl d0
	jeq L76
	movel a3@(32),sp@-
	jbsr _next_real_insn
	movel d0,a2
	addqw #4,sp
	tstl a2
	jeq L76
	movel a2@(16),a0
	cmpw #29,a0@
	jne L76
	movel a0,a3@(16)
	moveq #-1,d7
	movel d7,a3@(20)
	jra L67
L76:
	tstl a4
	jeq L78
	cmpw #14,a4@
	jne L78
	movel a4,sp@-
	jbsr _prev_real_insn
	addqw #4,sp
	cmpl d0,a3
	jne L78
	movel a4,sp@-
	movel a3,sp@-
	jbsr _no_labels_between_p
	addqw #8,sp
	tstl d0
	jeq L78
	movel a4,sp@-
	jbsr _simplejump_p
	addqw #4,sp
	tstl d0
	jeq L78
	movel a3,sp@-
	jbsr _condjump_p
	addqw #4,sp
	tstl d0
	jeq L78
	movel a4@(32),a0
	addql #1,a0@(20)
	movel a4,sp@-
	jbsr _delete_insn
	movel a4@(32),sp@-
	movel a3,sp@-
	jbsr _invert_jump
	movel a4@(32),a0
	subql #1,a0@(20)
	movel a3,d6
	moveq #1,d5
	jra L131
L78:
	movel a6@(16),sp@-
	movel a3@(32),sp@-
	jbsr _follow_jumps
	addqw #8,sp
	cmpl a3@(32),d0
	jeq L80
	movel d0,sp@-
	movel a3,sp@-
	jbsr _redirect_jump
	moveq #1,d5
	movel a3,d6
	addqw #8,sp
L80:
	movel a3,sp@-
	jbsr _next_label
	movel d0,d4
	addqw #4,sp
	jeq L81
	movel d4,sp@-
	jbsr _prev_real_insn
	addqw #4,sp
	movel d0,d3
	jra L82
L81:
	clrl d3
L82:
	tstl a6@(-28)
	jne L83
	movel a3,sp@-
	jbsr _condjump_p
	addqw #4,sp
	tstl d0
	jeq L83
	cmpl a3@(32),d4
	jne L83
	movel d4,a5
	moveq #1,d7
	cmpl a5@(20),d7
	jne L83
	movel d3,a5
	cmpw #14,a5@
	jne L83
	movel d3,sp@-
	jbsr _simplejump_p
	addqw #4,sp
	tstl d0
	jeq L83
	movel d4,sp@-
	jbsr _next_label
	movel d0,d2
	addqw #4,sp
	jeq L84
	movel d2,sp@-
	jbsr _prev_real_insn
	addqw #4,sp
	movel d0,a4
	jra L85
L84:
	subl a4,a4
L85:
	cmpl d3,a4
	jeq L83
	movel d3,a5
	cmpl a5@(32),d2
	jne L83
	cmpw #14,a4@
	jne L83
	movel a4@(12),d0
	movel d0,a5
	cmpw #16,a5@
	jne L83
	movel a3@(12),a0
	movel d4,a5
	movel a5@(12),a2
	movel d3,a5
	movel a5@(12),a1
	movel a2,a3@(12)
	movel a3,a2@(8)
	movel a1,a4@(12)
	movel a4,a1@(8)
	movel d4,a5
	movel a0,a5@(12)
	movel d4,a0@(8)
	movel d3,a5
	movel d0,a5@(12)
	movel d0,a5
	movel d3,a5@(8)
	movel d4,sp@-
	movel a3,sp@-
	jbsr _invert_jump
	moveq #1,d5
	addqw #8,sp
	jra L67
L83:
	tstl a6@(12)
	jeq L87
	movel a3,sp@-
	jbsr _condjump_p
	addqw #4,sp
	tstl d0
	jeq L87
	movel a3@(32),sp@-
	jbsr _prev_real_insn
	movel d0,d2
	addqw #4,sp
	jeq L88
	movel a3,sp@-
	movel d2,sp@-
	jbsr _jump_back_p
	addqw #8,sp
	tstl d0
	jne L88
	clrl d2
L88:
	clrl a6@(-4)
	tstl d2
	jeq L89
	pea a6@(-8)
	pea a6@(-4)
	pea 2:w
	movel d2,sp@-
	movel a3,sp@-
	jbsr _find_cross_jump
	addw #20,sp
L89:
	tstl a6@(-4)
	jeq L87
	movel a6@(-8),sp@-
	movel a6@(-4),sp@-
	movel a3,sp@-
	jbsr _do_cross_jump
	movel a3@(32),sp@-
	clrl sp@-
	pea 38:w
	jbsr _gen_rtx
	movel a3@(16),a0
	movel d0,a0@(8)
	movel a3,sp@-
	jbsr _emit_barrier_after
	moveq #1,d5
	movel a3,d6
	addw #28,sp
L87:
	tstl a6@(12)
	jeq L67
	movel a3,sp@-
	jbsr _simplejump_p
	addqw #4,sp
	tstl d0
	jeq L67
	clrl a6@(-12)
	pea a6@(-16)
	pea a6@(-12)
	pea 1:w
	movel a3@(32),sp@-
	movel a3,sp@-
	jbsr _find_cross_jump
	movel a3@(32),a0
	addw #20,sp
	movel a0@(4),d7
	cmpl a6@(-36),d7
	jge L92
	movel a0@(4),d0
	jra L132
L97:
	tstl a6@(-12)
	jne L92
	cmpl a2,a3
	jeq L95
	movel a2@(32),d7
	cmpl a3@(32),d7
	jne L95
	btst #4,a2@(3)
	jne L95
	pea a6@(-16)
	pea a6@(-12)
	pea 2:w
	movel a2,sp@-
	movel a3,sp@-
	jbsr _find_cross_jump
	addw #20,sp
L95:
	movel a2@(4),d0
L132:
	movel _jump_chain,a0
	movel a0@(d0:l:4),a2
	tstl a2
	jne L97
L92:
	tstl a6@(-12)
	jeq L67
	movel a6@(-16),sp@-
	movel a6@(-12),sp@-
	jra L133
L71:
	cmpw #14,a3@
	jne L67
	movel a3@(16),a0
	cmpw #29,a0@
	jne L67
	tstl a6@(12)
	jeq L67
	clrl a6@(-20)
	movel _jump_chain,a0
	movel a0@,a2
	tstl a2
	jeq L103
L106:
	tstl a6@(-20)
	jne L103
	cmpl a2,a3
	jeq L104
	btst #4,a2@(3)
	jne L104
	movel a2@(16),a0
	cmpw #29,a0@
	jne L104
	pea a6@(-24)
	pea a6@(-20)
	pea 2:w
	movel a2,sp@-
	movel a3,sp@-
	jbsr _find_cross_jump
	addw #20,sp
L104:
	movel a2@(4),d0
	movel _jump_chain,a0
	movel a0@(d0:l:4),a2
	tstl a2
	jne L106
L103:
	tstl a6@(-20)
	jeq L67
	movel a6@(-24),sp@-
	movel a6@(-20),sp@-
L133:
	movel a3,sp@-
	jbsr _do_cross_jump
	moveq #1,d5
	movel a3,d6
L131:
	addw #12,sp
L67:
	movel d6,a3
	tstl a3
	jne L108
L119:
	clrl a6@(-28)
	tstl d5
	jne L109
	movel a6@(-32),a3
	tstl a3
	jeq L111
L114:
	cmpw #17,a3@
	jeq L112
	cmpw #14,a3@
	jne L113
	movel a3@(16),a0
	cmpw #29,a0@
	jeq L112
L113:
	cmpw #18,a3@
	jne L111
	moveq #-6,d7
	cmpl a3@(20),d7
	jeq L111
L112:
	movel a3@(8),a3
	tstl a3
	jne L114
L111:
	tstl a3
	jeq L1
	cmpw #18,a3@
	jne L1
	moveq #-6,d7
	cmpl a3@(20),d7
	jne L1
	moveq #1,d7
	movel d7,_current_function_returns_null
	movel a3,sp@-
	jbsr _delete_insn
L1:
	moveml a6@(-76),#0x3cfc
	unlk a6
	rts
	.even
_find_cross_jump:
	link a6,#0
	moveml #0x3f3c,sp@-
	movel a6@(8),d7
	movel a6@(16),d2
	movel d7,a4
	movel a6@(12),a2
	clrl d3
	clrl d4
	clrl d6
	clrl d5
	movel a6@(20),a0
	clrl a0@
	movel a6@(24),a0
	clrl a0@
	jra L159
L139:
	cmpw #18,a4@
	jne L142
L159:
	movel a4@(8),a4
	tstl a4
	jne L139
	jra L142
L143:
	cmpw #18,a2@
	jeq L142
	cmpw #17,a2@
	jne L141
L142:
	movel a2@(8),a2
	tstl a2
	jne L143
L141:
	tstl a4
	jeq L136
	cmpl a2,d7
	jeq L136
	cmpl a6@(12),a4
	jeq L136
	cmpw #17,a4@
	jeq L160
	tstl a2
	jeq L136
	movew a2@,d1
	cmpw a4@,d1
	jne L136
	movel a4@(16),a3
	movel a2@(16),a5
	movew a5@,d1
	cmpw a3@,d1
	jne L151
	movel a5,sp@-
	movel a3,sp@-
	jbsr _rtx_renumbered_equal_p
	addqw #8,sp
	tstl d0
	jne L150
L151:
	movel a3,sp@-
	lea _sets_cc0_p,a2
	jbsr a2@
	addqw #4,sp
	tstl d0
	jne L153
	movel a5,sp@-
	jbsr a2@
	addqw #4,sp
	tstl d0
	jeq L152
L153:
	movel d6,d3
	movel d5,d4
	addql #1,d2
L152:
	cmpw #14,a4@
	jne L136
	tstl a4@(32)
	jeq L136
	movel a4@(32),sp@-
	jbsr _prev_real_insn
	cmpl d0,d7
	jne L136
L160:
	subql #1,d2
	jra L136
L150:
	cmpw #26,a3@
	jeq L159
	cmpw #27,a3@
	jeq L159
	movel d3,d6
	movel d4,d5
	movel a4,d3
	movel a2,d4
	subql #1,d2
	jra L159
L136:
	tstl d2
	jgt L156
	tstl d3
	jeq L156
	movel a6@(20),a0
	movel d3,a0@
	movel a6@(24),a0
	movel d4,a0@
L156:
	moveml a6@(-40),#0x3cfc
	unlk a6
	rts
	.even
_do_cross_jump:
	link a6,#0
	moveml #0x3c,sp@-
	movel a6@(8),a4
	movel a6@(12),a3
	movel a6@(16),a5
	movel a5@(8),a2
	cmpw #17,a2@
	jeq L162
	jbsr _gen_label_rtx
	movel d0,a2
	movel a5@(8),sp@-
	movel a2,sp@-
	jbsr _emit_label_after
	clrl a2@(20)
	addqw #8,sp
L162:
	movel a4@(16),a0
	cmpw #29,a0@
	jne L163
	movel a2,sp@-
	jbsr _gen_jump
	movel d0,a4@(16)
	moveq #-1,d1
	movel d1,a4@(20)
	movel a2,a4@(32)
	addql #1,a2@(20)
	addqw #4,sp
	jra L164
L163:
	movel a2,sp@-
	movel a4,sp@-
	jbsr _redirect_jump
	addqw #8,sp
L164:
	movel a3@(8),a3
L171:
	cmpl a3@(12),a4
	jeq L170
	movel a3@(12),a0
	cmpw #18,a0@
	jeq L167
	movel a0,sp@-
	jbsr _delete_insn
	addqw #4,sp
	jra L171
L167:
	movel a3@(12),a3
	jra L171
L170:
	moveml a6@(-16),#0x3c00
	unlk a6
	rts
	.even
_jump_back_p:
	link a6,#0
	moveml #0x3838,sp@-
	movel a6@(8),a2
	movel a6@(12),a4
	movel a2,sp@-
	lea _simplejump_p,a3
	jbsr a3@
	addqw #4,sp
	tstl d0
	jne L177
	movel a2,sp@-
	jbsr _condjump_p
	addqw #4,sp
	tstl d0
	jeq L177
	movel a4,sp@-
	jbsr a3@
	addqw #4,sp
	tstl d0
	jne L177
	movel a2@(32),sp@-
	jbsr _prev_real_insn
	addqw #4,sp
	cmpl a4,d0
	jne L177
	movel a2,sp@-
	jbsr _prev_real_insn
	movel d0,a0
	addqw #4,sp
	cmpw #13,a0@
	jne L177
	movel a0@(16),a0
	cmpw #25,a0@
	jne L177
	movel a0@(4),d1
	cmpl _cc0_rtx,d1
	jne L177
	movel a0@(8),a0
	clrl d0
	moveb a0@(2),d0
	lea _mode_class,a1
	moveq #1,d1
	cmpl a1@(d0:l:4),d1
	jeq L176
	cmpw #43,a0@
	jne L177
	movel a0@(4),a0
	clrl d0
	moveb a0@(2),d0
	moveq #1,d1
	cmpl a1@(d0:l:4),d1
	jeq L176
L177:
	clrl d0
	jra L172
L176:
	movel a2@(16),a0
	movel a0@(8),a0
	movel a0@(4),a3
	movel a4@(16),a1
	movel a1@(8),a1
	movel a1@(4),a2
	clrl d3
	movew a3@,d3
	clrl d2
	movew a2@,d2
	movel a0@(8),d1
	cmpl _pc_rtx,d1
	jne L178
	movel d3,sp@-
	jbsr _reverse_condition
	movel d0,d3
	addqw #4,sp
L178:
	movel a4@(16),a0
	movel a0@(8),a0
	movel a0@(12),d1
	cmpl _pc_rtx,d1
	jne L179
	movel d2,sp@-
	jbsr _reverse_condition
	movel d0,d2
	addqw #4,sp
L179:
	clrl d4
	cmpl d3,d2
	jne L180
	movel a2@(4),sp@-
	movel a3@(4),sp@-
	lea _rtx_renumbered_equal_p,a4
	jbsr a4@
	addqw #8,sp
	tstl d0
	jeq L180
	movel a2@(8),sp@-
	movel a3@(8),sp@-
	jbsr a4@
	tstl d0
	jeq L180
	moveq #1,d4
L180:
	movel d4,d0
L172:
	moveml a6@(-24),#0x1c1c
	unlk a6
	rts
	.even
_reverse_condition:
	link a6,#0
	moveq #-67,d0
	addl a6@(8),d0
	moveq #9,d1
	cmpl d1,d0
	jhi L193
LI194:
	movew pc@(L194-LI194-2:b,d0:l:2),d1
	jmp pc@(2,d1:w)
L194:
	.word L184-L194
	.word L183-L194
	.word L186-L194
	.word L185-L194
	.word L188-L194
	.word L187-L194
	.word L190-L194
	.word L189-L194
	.word L192-L194
	.word L191-L194
L183:
	moveq #67,d0
	jra L181
L184:
	moveq #68,d0
	jra L181
L185:
	moveq #71,d0
	jra L181
L186:
	moveq #72,d0
	jra L181
L187:
	moveq #69,d0
	jra L181
L188:
	moveq #70,d0
	jra L181
L189:
	moveq #75,d0
	jra L181
L190:
	moveq #76,d0
	jra L181
L191:
	moveq #73,d0
	jra L181
L192:
	moveq #74,d0
	jra L181
L193:
	jbsr _abort
	clrl d0
L181:
	unlk a6
	rts
	.even
.globl _simplejump_p
_simplejump_p:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	movel a2@(16),a1
	cmpw #25,a1@
	jne L199
	movel a1@(4),a0
	cmpw #33,a0@
	jne L199
	movel a1@(8),a0
	cmpw #38,a0@
	jeq L198
L199:
	clrl d0
	jra L195
L198:
	moveq #1,d0
L195:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _condjump_p
_condjump_p:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	movel a2@(16),a1
	cmpw #25,a1@
	jne L206
	movel a1@(4),a0
	cmpw #33,a0@
	jne L206
	movel a1@(8),a0
	cmpw #38,a0@
	jeq L207
	movel a1@(8),a0
	cmpw #42,a0@
	jne L206
	movel a1@(8),a0
	movel a0@(12),a2
	cmpl _pc_rtx,a2
	jne L205
	movel a0@(8),a0
	cmpw #38,a0@
	jeq L207
L205:
	movel a1@(8),a0
	movel a0@(8),a2
	cmpl _pc_rtx,a2
	jne L206
	movel a0@(12),a0
	cmpw #38,a0@
	jne L206
L207:
	moveq #1,d0
	jra L200
L206:
	clrl d0
L200:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _sets_cc0_p
_sets_cc0_p:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(8),a1
	cmpw #25,a1@
	jne L209
	movel a1@(4),d3
	cmpl _cc0_rtx,d3
	jne L209
L223:
	moveq #1,d0
	jra L208
L209:
	cmpw #20,a1@
	jne L210
	clrl d1
	clrl d2
	movel a1@(4),a0
	movel a0@,d0
	subql #1,d0
	jmi L222
	movel a1@(4),a2
L217:
	movel a2@(4,d0:l:4),a0
	cmpw #25,a0@
	jne L214
	movel a0@(4),d3
	cmpl _cc0_rtx,d3
	jne L214
	moveq #1,d1
	jra L213
L214:
	movel a1@(4),a0
	movel a0@(4,d0:l:4),a0
	cmpw #25,a0@
	jne L213
	moveq #1,d2
L213:
	subql #1,d0
	jpl L217
L222:
	tstl d1
	jeq L210
	tstl d2
	jeq L223
	moveq #-1,d0
	jra L208
L210:
	clrl d0
L208:
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _no_labels_between_p
_no_labels_between_p:
	link a6,#0
	movel a6@(12),d0
	movel a6@(8),a0
	cmpl a0,d0
	jeq L230
L229:
	cmpw #17,a0@
	jne L227
	clrl d0
	jra L224
L227:
	movel a0@(12),a0
	cmpl a0,d0
	jne L229
L230:
	moveq #1,d0
L224:
	unlk a6
	rts
	.even
.globl _prev_real_insn
_prev_real_insn:
	link a6,#0
	movel a6@(8),a1
	movel a1@(8),a0
	andl #65535,d0
L232:
	tstl a0
	jne L234
	clrl d0
	jra L231
L234:
	movew a0@,d0
	moveq #13,d1
	cmpl d0,d1
	jeq L233
	moveq #15,d1
	cmpl d0,d1
	jeq L233
	moveq #14,d1
	cmpl d0,d1
	jeq L233
	movel a0@(8),a0
	jra L232
L233:
	movel a0,d0
L231:
	unlk a6
	rts
	.even
.globl _next_real_insn
_next_real_insn:
	link a6,#0
	movel a6@(8),a1
	movel a1@(12),a0
	andl #65535,d0
L238:
	tstl a0
	jeq L239
	movew a0@,d0
	moveq #13,d1
	cmpl d0,d1
	jeq L239
	moveq #15,d1
	cmpl d0,d1
	jeq L239
	moveq #14,d1
	cmpl d0,d1
	jeq L239
	movel a0@(12),a0
	jra L238
L239:
	movel a0,d0
	unlk a6
	rts
	.even
.globl _next_label
_next_label:
	link a6,#0
	movel a6@(8),a0
L244:
	movel a0@(12),a0
	tstl a0
	jeq L245
	cmpw #17,a0@
	jne L244
L245:
	movel a0,d0
	unlk a6
	rts
	.even
_follow_jumps:
	link a6,#0
	moveml #0x3c00,sp@-
	movel a6@(8),d4
	movel a6@(12),d5
	movel d4,d2
	clrl d3
L258:
	movel d2,sp@-
	jbsr _next_real_insn
	movel d0,a1
	addqw #4,sp
	tstl a1
	jeq L249
	cmpw #14,a1@
	jne L249
	tstl a1@(32)
	jeq L249
	movel a1@(12),a0
	tstl a0
	jeq L249
	cmpw #16,a0@
	jne L249
	tstl d5
	jne L251
	movel d2,a0
	cmpl a0,a1
	jeq L251
L256:
	cmpw #18,a0@
	jne L254
	moveq #-4,d1
	cmpl a0@(20),d1
	jeq L249
L254:
	movel a0@(12),a0
	cmpl a0,a1
	jne L256
L251:
	cmpl a1@(32),d4
	jeq L249
	movel a1@(32),d2
	addql #1,d3
	moveq #9,d1
	cmpl d3,d1
	jge L258
L249:
	movel d2,d0
	moveml a6@(-16),#0x3c
	unlk a6
	rts
	.even
_tension_vector_labels:
	link a6,#0
	moveml #0x3c30,sp@-
	movel a6@(8),a3
	movel a6@(12),d4
	movel a6@(16),d5
	clrl d3
	movel a3@(4,d4:l:4),a0
	movel a0@,d2
	jra L263
L266:
	movel a3@(4,d4:l:4),a0
	movel a0@(4,d2:l:4),a0
	movel a0@(4),a2
	movel d5,sp@-
	movel a2,sp@-
	jbsr _follow_jumps
	movel d0,a1
	addqw #8,sp
	cmpl a1,a2
	jeq L263
	movel a3@(4,d4:l:4),a0
	movel a0@(4,d2:l:4),a0
	movel a1,a0@(4)
	addql #1,a1@(20)
	subql #1,a2@(20)
	jne L265
	movel a2,sp@-
	jbsr _delete_insn
	addqw #4,sp
L265:
	moveq #1,d3
L263:
	subql #1,d2
	jpl L266
	movel d3,d0
	moveml a6@(-24),#0xc3c
	unlk a6
	rts
	.even
_mark_jump_label:
	link a6,#0
	moveml #0x3838,sp@-
	movel a6@(8),a4
	movel a6@(12),a2
	movel a6@(16),d4
	clrl d0
	movew a4@,d0
	moveq #38,d1
	cmpl d0,d1
	jne L269
	movel a4@(4),a1
	cmpw #17,a1@
	jne L268
	movel a1@(12),a0
	tstl a0
	jeq L272
L278:
	cmpw #17,a0@
	jne L274
	movel a0,a1
	jra L273
L274:
	cmpw #18,a0@
	jne L272
	moveq #-4,d1
	cmpl a0@(20),d1
	jeq L272
	moveq #-6,d1
	cmpl a0@(20),d1
	jeq L272
L273:
	movel a0@(12),a0
	tstl a0
	jne L278
L272:
	movel a1,a4@(4)
	addql #1,a1@(20)
	tstl a2
	jeq L268
	movel a1,a2@(32)
	jra L268
L269:
	moveq #23,d1
	cmpl d0,d1
	jeq L281
	moveq #24,d1
	cmpl d0,d1
	jne L280
L281:
	subl a2,a2
L280:
	lea _rtx_format,a0
	movel a0@(d0:l:4),a3
	lea _rtx_length,a0
	movel a0@(d0:l:4),d3
	jlt L268
L292:
	cmpb #101,a3@(d3:l)
	jne L285
	movel d4,sp@-
	movel a2,sp@-
	movel a4@(4,d3:l:4),sp@-
	jbsr _mark_jump_label
	addw #12,sp
	jra L284
L285:
	cmpb #69,a3@(d3:l)
	jne L284
	clrl d2
	jra L288
L291:
	movel d4,sp@-
	movel a2,sp@-
	movel a4@(4,d3:l:4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _mark_jump_label
	addw #12,sp
	addql #1,d2
L288:
	movel a4@(4,d3:l:4),a0
	cmpl a0@,d2
	jcs L291
L284:
	subql #1,d3
	jpl L292
L268:
	moveml a6@(-24),#0x1c1c
	unlk a6
	rts
	.even
_delete_jump:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a1
	movel a1@(16),a0
	cmpw #25,a0@
	jne L296
	movel a0@(4),a0
	cmpw #33,a0@
	jne L296
	movel a1@(8),a2
	movel a1,sp@-
	jbsr _delete_insn
	addqw #4,sp
	tstl a2
	jeq L298
L299:
	cmpw #18,a2@
	jne L298
	movel a2@(8),a2
	tstl a2
	jne L299
L298:
	tstl a2
	jeq L296
	cmpw #13,a2@
	jne L296
	movel a2@(16),sp@-
	jbsr _sets_cc0_p
	addqw #4,sp
	tstl d0
	jle L296
	clrl sp@-
	pea 2:w
	movel a2,sp@-
	jbsr _find_reg_note
	addw #12,sp
	tstl d0
	jne L296
	movel a2,sp@-
	jbsr _delete_insn
L296:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _delete_insn
_delete_insn:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(8),a3
	movel a3@(12),a2
	movel a3@(8),a1
	btst #4,a3@(3)
	jeq L303
	tstl a2
	jeq L320
L306:
	btst #4,a2@(3)
	jeq L320
	movel a2@(12),a2
	tstl a2
	jne L306
	jra L320
L303:
	orb #16,a3@(3)
	tstl a2
	jeq L307
	cmpw #16,a2@
	jne L307
	orb #16,a2@(3)
	movel a2@(12),a2
L307:
	tstl _optimize
	jeq L308
	tstl a1
	jeq L309
	movel a2,a1@(12)
L309:
	tstl a2
	jeq L308
	movel a1,a2@(8)
L308:
	cmpw #14,a3@
	jne L331
	tstl a3@(32)
	jeq L331
	movel a3@(32),a0
	subql #1,a0@(20)
	jne L331
	movel a3@(32),sp@-
	jbsr _delete_insn
	tstl a2
	jeq L320
L315:
	btst #4,a2@(3)
	jeq L320
	movel a2@(12),a2
	tstl a2
	jne L315
	jra L320
L319:
	btst #4,a1@(3)
	jne L318
	cmpw #18,a1@
	jne L317
L318:
	movel a1@(8),a1
L331:
	tstl a1
	jne L319
L317:
	cmpw #17,a3@
	jne L320
	tstl a1
	jeq L320
	cmpw #16,a1@
	jne L320
	tstl a2
	jeq L320
	clrl d2
L326:
	movew a2@,d2
	moveq #13,d1
	cmpl d2,d1
	jeq L323
	moveq #14,d1
	cmpl d2,d1
	jeq L323
	moveq #15,d1
	cmpl d2,d1
	jeq L323
	moveq #18,d1
	cmpl d2,d1
	jne L320
L323:
	moveq #18,d1
	cmpl d2,d1
	jne L324
	moveq #-6,d1
	cmpl a2@(20),d1
	jeq L324
	movel a2@(12),a2
	jra L321
L324:
	movel a2,sp@-
	jbsr _delete_insn
	movel d0,a2
	addqw #4,sp
L321:
	tstl a2
	jne L326
L320:
	movel a2,d0
	moveml a6@(-12),#0xc04
	unlk a6
	rts
	.even
.globl _next_nondeleted_insn
_next_nondeleted_insn:
	link a6,#0
	movel a6@(8),a0
	jra L333
L335:
	movel a0@(12),a0
L333:
	btst #4,a0@(3)
	jne L335
	movel a0,d0
	unlk a6
	rts
	.even
.globl _delete_for_peephole
_delete_for_peephole:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),d0
	movel a6@(8),a0
L337:
	movel a0@(12),a2
	movel a0@(8),a1
	cmpw #18,a0@
	jeq L339
	orb #16,a0@(3)
	tstl a1
	jeq L340
	movel a2,a1@(12)
L340:
	tstl a2
	jeq L339
	movel a1,a2@(8)
L339:
	cmpl a0,d0
	jeq L338
	movel a2,a0
	jra L337
L338:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _invert_jump
_invert_jump:
	link a6,#0
	moveml #0x38,sp@-
	movel a6@(8),a2
	movel a6@(12),a3
	movel a2@(32),a4
	movel a3,sp@-
	movel a4,sp@-
	movel a2@(16),sp@-
	jbsr _invert_exp
	movel a3,a2@(32)
	addql #1,a3@(20)
	moveq #-1,d1
	movel d1,a2@(20)
	subql #1,a4@(20)
	addw #12,sp
	jne L344
	movel a4,sp@-
	jbsr _delete_insn
L344:
	moveml a6@(-12),#0x1c00
	unlk a6
	rts
	.even
.globl _invert_exp
_invert_exp:
	link a6,#0
	moveml #0x3e30,sp@-
	movel a6@(8),a2
	movel a6@(12),d4
	movel a6@(16),d5
	tstl a2
	jeq L345
	clrl d1
	movew a2@,d1
	moveq #42,d6
	cmpl d1,d6
	jne L347
	movel a2@(8),d0
	movel a2@(12),a2@(8)
	movel d0,a2@(12)
L347:
	moveq #38,d6
	cmpl d1,d6
	jne L348
	cmpl a2@(4),d4
	jne L345
	movel d5,a2@(4)
	jra L345
L348:
	lea _rtx_format,a0
	movel a0@(d1:l:4),a3
	lea _rtx_length,a0
	movel a0@(d1:l:4),d3
	jra L352
L359:
	cmpb #101,a3@(d3:l)
	jne L353
	movel d5,sp@-
	movel d4,sp@-
	movel a2@(4,d3:l:4),sp@-
	jbsr _invert_exp
	addw #12,sp
L353:
	cmpb #69,a3@(d3:l)
	jne L352
	clrl d2
	jra L355
L358:
	movel d5,sp@-
	movel d4,sp@-
	movel a2@(4,d3:l:4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _invert_exp
	addw #12,sp
	addql #1,d2
L355:
	movel a2@(4,d3:l:4),a0
	cmpl a0@,d2
	jcs L358
L352:
	subql #1,d3
	jpl L359
L345:
	moveml a6@(-28),#0xc7c
	unlk a6
	rts
	.even
.globl _redirect_jump
_redirect_jump:
	link a6,#0
	moveml #0x38,sp@-
	movel a6@(8),a4
	movel a6@(12),a3
	movel a4@(32),a2
	cmpl a3,a2
	jeq L361
	movel a3,sp@-
	movel a2,sp@-
	movel a4@(16),sp@-
	jbsr _redirect_exp
	movel a3,a4@(32)
	addql #1,a3@(20)
	moveq #-1,d1
	movel d1,a4@(20)
	subql #1,a2@(20)
	addw #12,sp
	jne L361
	movel a2,sp@-
	jbsr _delete_insn
L361:
	moveml a6@(-12),#0x1c00
	unlk a6
	rts
	.even
_redirect_exp:
	link a6,#0
	moveml #0x3c30,sp@-
	movel a6@(8),a2
	movel a6@(12),d4
	movel a6@(16),d5
	clrl d0
	movew a2@,d0
	moveq #38,d1
	cmpl d0,d1
	jne L365
	cmpl a2@(4),d4
	jne L364
	movel d5,a2@(4)
	jra L364
L365:
	lea _rtx_format,a0
	movel a0@(d0:l:4),a3
	lea _rtx_length,a0
	movel a0@(d0:l:4),d3
	jra L369
L376:
	cmpb #101,a3@(d3:l)
	jne L370
	movel d5,sp@-
	movel d4,sp@-
	movel a2@(4,d3:l:4),sp@-
	jbsr _redirect_exp
	addw #12,sp
L370:
	cmpb #69,a3@(d3:l)
	jne L369
	clrl d2
	jra L372
L375:
	movel d5,sp@-
	movel d4,sp@-
	movel a2@(4,d3:l:4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _redirect_exp
	addw #12,sp
	addql #1,d2
L372:
	movel a2@(4,d3:l:4),a0
	cmpl a0@,d2
	jcs L375
L369:
	subql #1,d3
	jpl L376
L364:
	moveml a6@(-24),#0xc3c
	unlk a6
	rts
	.even
.globl _rtx_renumbered_equal_p
_rtx_renumbered_equal_p:
	link a6,#0
	moveml #0x303c,sp@-
	movel a6@(8),a3
	movel a6@(12),a4
	clrl d1
	movew a3@,d1
	cmpl a3,a4
	jeq L427
	moveq #34,d3
	cmpl d1,d3
	jeq L381
	moveq #35,d3
	cmpl d1,d3
	jne L380
	movel a3@(4),a0
	cmpw #34,a0@
	jne L380
L381:
	cmpw #34,a4@
	jeq L382
	cmpw #35,a4@
	jne L380
	movel a4@(4),a0
	cmpw #34,a0@
	jne L380
L382:
	moveb a3@(2),d3
	cmpb a4@(2),d3
	jne L432
	moveq #35,d3
	cmpl d1,d3
	jne L384
	movel a3@(4),a0
	movel a0@(4),a2
	movel _reg_renumber,a0
	tstw a0@(a2:l:2)
	jlt L385
	movew a0@(a2:l:2),a2
L385:
	addl a3@(8),a2
	jra L386
L384:
	movel a3@(4),a2
	movel _reg_renumber,a0
	tstw a0@(a2:l:2)
	jlt L386
	movew a0@(a2:l:2),a2
L386:
	cmpw #35,a4@
	jne L388
	movel a4@(4),a0
	movel a0@(4),a0
	movel _reg_renumber,a1
	tstw a1@(a0:l:2)
	jlt L389
	movew a1@(a0:l:2),a0
L389:
	addl a4@(8),a0
	jra L390
L388:
	movel a4@(4),a0
	movel _reg_renumber,a1
	tstw a1@(a0:l:2)
	jlt L390
	movew a1@(a0:l:2),a0
L390:
	cmpl a2,a0
	seq d0
	jra L429
L380:
	clrl d0
	movew a4@,d0
	cmpl d1,d0
	jne L432
	moveq #-23,d0
	addl d1,d0
	moveq #17,d3
	cmpl d3,d0
	jhi L393
LI401:
	movew pc@(L401-LI401-2:b,d0:l:2),d3
	jmp pc@(2,d3:w)
L401:
	.word L432-L401
	.word L432-L401
	.word L393-L401
	.word L393-L401
	.word L393-L401
	.word L393-L401
	.word L393-L401
	.word L400-L401
	.word L393-L401
	.word L393-L401
	.word L432-L401
	.word L393-L401
	.word L393-L401
	.word L393-L401
	.word L393-L401
	.word L399-L401
	.word L400-L401
	.word L432-L401
L399:
	movel a3@(4),sp@-
	lea _next_real_insn,a2
	jbsr a2@
	movel d0,d2
	movel a4@(4),sp@-
	jbsr a2@
	cmpl d2,d0
	seq d0
	jra L429
L400:
	movel a3@(4),d3
	cmpl a4@(4),d3
	seq d0
L429:
	moveq #1,d3
	andl d3,d0
	jra L378
L393:
	moveb a3@(2),d3
	cmpb a4@(2),d3
	jne L432
	lea _rtx_format,a0
	movel a0@(d1:l:4),a5
	lea _rtx_length,a0
	movel a0@(d1:l:4),a2
	jra L406
L425:
	moveb a2@(a5:l),d0
	cmpb #101,d0
	jeq L412
	jgt L424
	cmpb #48,d0
	jeq L406
	cmpb #69,d0
	jeq L415
	jra L422
L424:
	cmpb #105,d0
	jeq L408
	cmpb #115,d0
	jeq L410
	jra L422
L408:
	movel a3@(4,a2:l:4),d3
	cmpl a4@(4,a2:l:4),d3
	jeq L406
L432:
	clrl d0
	jra L378
L410:
	movel a4@(4,a2:l:4),sp@-
	movel a3@(4,a2:l:4),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jeq L406
	jra L432
L412:
	movel a4@(4,a2:l:4),sp@-
	movel a3@(4,a2:l:4),sp@-
	jbsr _rtx_renumbered_equal_p
	addqw #8,sp
	tstl d0
	jne L406
	jra L432
L415:
	movel a3@(4,a2:l:4),a0
	movel a4@(4,a2:l:4),a1
	movel a0@,d3
	cmpl a1@,d3
	jne L432
	movel a3@(4,a2:l:4),a0
	movel a0@,d2
	subql #1,d2
	jmi L406
L421:
	movel a4@(4,a2:l:4),a0
	movel a0@(4,d2:l:4),sp@-
	movel a3@(4,a2:l:4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _rtx_renumbered_equal_p
	addqw #8,sp
	tstl d0
	jeq L432
	subql #1,d2
	jpl L421
	jra L406
L422:
	jbsr _abort
L406:
	subqw #1,a2
	tstl a2
	jge L425
L427:
	moveq #1,d0
L378:
	moveml a6@(-24),#0x3c0c
	unlk a6
	rts
	.even
.globl _true_regnum
_true_regnum:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	cmpw #34,a2@
	jne L434
	moveq #55,d1
	cmpl a2@(4),d1
	jge L435
	movel a2@(4),d0
	movel _reg_renumber,a0
	movew a0@(d0:l:2),d0
	extl d0
	jra L433
L435:
	movel a2@(4),d0
	jra L433
L434:
	cmpw #35,a2@
	jne L436
	movel a2@(4),sp@-
	jbsr _true_regnum
	tstl d0
	jlt L436
	moveq #55,d1
	cmpl d0,d1
	jlt L436
	addl a2@(8),d0
	jra L433
L436:
	moveq #-1,d0
L433:
	movel a6@(-4),a2
	unlk a6
	rts
.comm _jump_chain,4
