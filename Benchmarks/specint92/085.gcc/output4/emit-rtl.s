#NO_APP
gcc_compiled.:
.globl _reg_rtx_no
.data
	.even
_reg_rtx_no:
	.long 56
	.even
_label_num:
	.long 1
	.even
_first_insn:
	.long 0
	.even
_last_insn:
	.long 0
.globl _sequence_stack
	.even
_sequence_stack:
	.long 0
	.even
_cur_insn_uid:
	.long 1
	.even
_last_linenum:
	.long 0
	.even
_last_filename:
	.long 0
.text
	.even
.globl _gen_rtx
_gen_rtx:
	link a6,#0
	moveml #0x3038,sp@-
	lea a6@(8),a2
	movel a2@+,d3
	movel a2@+,d2
	moveq #30,d1
	cmpl d3,d1
	jne L2
	movel a2@+,d2
	jne L3
	movel _const0_rtx,d0
	jra L1
L3:
	moveq #1,d1
	cmpl d2,d1
	jne L4
	movel _const1_rtx,d0
	jra L1
L4:
	movel d3,sp@-
	jbsr _rtx_alloc
	movel d0,a3
	movel d2,a3@(4)
	jra L5
L2:
	movel d3,sp@-
	jbsr _rtx_alloc
	movel d0,a3
	moveb d2,a3@(2)
	lea _rtx_format,a0
	movel a0@(d3:l:4),a4
	clrl d2
	addqw #4,sp
	jra L6
L20:
	moveb a4@+,d0
	cmpb #101,d0
	jeq L14
	jgt L18
	cmpb #48,d0
	jeq L8
	cmpb #69,d0
	jeq L15
	jra L16
L18:
	cmpb #115,d0
	jeq L21
	jgt L19
	cmpb #105,d0
	jeq L21
	jra L16
L19:
	cmpb #117,d0
	jne L16
L14:
L15:
L21:
	movel a2@+,a3@(4,d2:l:4)
	jra L8
L16:
	jbsr _abort
L8:
	addql #1,d2
L6:
	lea _rtx_length,a0
	cmpl a0@(d3:l:4),d2
	jlt L20
L5:
	movel a3,d0
L1:
	moveml a6@(-20),#0x1c0c
	unlk a6
	rts
	.even
.globl _gen_rtvec
_gen_rtvec:
	link a6,#0
	movel d2,sp@-
	lea a6@(8),a1
	movel a1@+,d1
	jne L23
	clrl d0
	jra L22
L23:
	movel d1,d0
	asll #2,d0
	addql #1,d0
	moveq #-2,d2
	andl d2,d0
	subl d0,sp
	movel sp,a0
	clrl d0
	cmpl d0,d1
	jle L28
L27:
	movel a1@+,a0@(d0:l:4)
	addql #1,d0
	cmpl d0,d1
	jgt L27
L28:
	movel a0,sp@-
	movel d1,sp@-
	jbsr _gen_rtvec_v
L22:
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _gen_rtvec_v
_gen_rtvec_v:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),d2
	movel a6@(12),a2
	jne L30
	clrl d0
	jra L29
L30:
	movel d2,sp@-
	jbsr _rtvec_alloc
	movel d0,a0
	clrl d0
	cmpl d0,d2
	jle L35
L34:
	movel a2@+,a0@(4,d0:l:4)
	addql #1,d0
	cmpl d0,d2
	jgt L34
L35:
	movel a0,d0
L29:
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _gen_reg_rtx
_gen_reg_rtx:
	link a6,#0
	moveml #0x3038,sp@-
	movel _reg_rtx_no,d3
	cmpl _regno_pointer_flag_length,d3
	jne L37
	movel _regno_pointer_flag_length,d3
	asll #1,d3
	movel d3,sp@-
	lea _oballoc,a4
	jbsr a4@
	movel d0,d2
	movel _regno_pointer_flag_length,d3
	asll #1,d3
	movel d3,sp@-
	clrl sp@-
	movel d2,sp@-
	lea _memset,a3
	jbsr a3@
	movel _regno_pointer_flag_length,sp@-
	movel _regno_pointer_flag,sp@-
	movel d2,sp@-
	lea _memcpy,a2
	jbsr a2@
	movel d2,_regno_pointer_flag
	movel _regno_pointer_flag_length,d3
	asll #3,d3
	movel d3,sp@-
	jbsr a4@
	movel d0,d2
	addw #32,sp
	movel _regno_pointer_flag_length,d3
	asll #3,d3
	movel d3,sp@-
	clrl sp@-
	movel d2,sp@-
	jbsr a3@
	movel _regno_pointer_flag_length,d3
	asll #2,d3
	movel d3,sp@-
	movel _regno_reg_rtx,sp@-
	movel d2,sp@-
	jbsr a2@
	movel d2,_regno_reg_rtx
	movel _regno_pointer_flag_length,d3
	asll #1,d3
	movel d3,_regno_pointer_flag_length
	addw #24,sp
L37:
	movel _reg_rtx_no,sp@-
	movel a6@(8),sp@-
	pea 34:w
	jbsr _gen_rtx
	movel _reg_rtx_no,d1
	movel _regno_reg_rtx,a0
	movel d0,a0@(d1:l:4)
	addql #1,_reg_rtx_no
	moveml a6@(-20),#0x1c0c
	unlk a6
	rts
	.even
.globl _mark_reg_pointer
_mark_reg_pointer:
	link a6,#0
	movel _regno_pointer_flag,a0
	movel a6@(8),a1
	movel a1@(4),d0
	moveb #1,a0@(d0:l)
	unlk a6
	rts
	.even
.globl _max_reg_num
_max_reg_num:
	link a6,#0
	movel _reg_rtx_no,d0
	unlk a6
	rts
	.even
.globl _max_label_num
_max_label_num:
	link a6,#0
	movel _label_num,d0
	unlk a6
	rts
	.even
.globl _get_first_label_num
_get_first_label_num:
	link a6,#0
	movel _first_label_num,d0
	unlk a6
	rts
	.even
.globl _gen_lowpart
_gen_lowpart:
	link a6,#0
	moveml #0x3820,sp@-
	movel a6@(8),d2
	movel a6@(12),a2
	lea _mode_size,a0
	moveq #4,d4
	cmpl a0@(d2:l:4),d4
	jge L43
	clrl d0
	moveb a2@(2),d0
	movel a0@(d2:l:4),d4
	cmpl a0@(d0:l:4),d4
	jeq L43
	jbsr _abort
L43:
	clrl d0
	moveb a2@(2),d0
	cmpl d0,d2
	jne L44
	movel a2,d0
	jra L42
L44:
	cmpw #30,a2@
	jne L45
	lea _mode_size,a0
	movel a0@(d2:l:4),d0
	asll #3,d0
	moveq #31,d4
	cmpl d0,d4
	jge L46
	moveq #-1,d1
	jra L47
L46:
	lea _mode_size,a0
	movel a0@(d2:l:4),d0
	asll #3,d0
	moveq #1,d1
	asll d0,d1
	subql #1,d1
L47:
	andl a2@(4),d1
	jra L63
L45:
	cmpw #31,a2@
	jne L48
	lea _mode_size,a0
	movel a0@(d2:l:4),d0
	asll #3,d0
	moveq #31,d4
	cmpl d0,d4
	jge L49
	moveq #-1,d1
	jra L50
L49:
	lea _mode_size,a0
	movel a0@(d2:l:4),d0
	asll #3,d0
	moveq #1,d1
	asll d0,d1
	subql #1,d1
L50:
	andl a2@(12),d1
L63:
	movel d1,sp@-
	clrl sp@-
	pea 30:w
	jbsr _gen_rtx
	jra L42
L48:
	cmpw #37,a2@
	jne L51
	clrl d1
	lea _mode_size,a0
	moveq #4,d4
	cmpl a0@(d2:l:4),d4
	jge L52
	moveq #4,d3
	jra L53
L52:
	lea _mode_size,a0
	movel a0@(d2:l:4),d3
L53:
	clrl d0
	moveb a2@(2),d0
	lea _mode_size,a0
	moveq #4,d4
	cmpl a0@(d0:l:4),d4
	jge L54
	moveq #4,d0
	jra L55
L54:
	clrl d0
	moveb a2@(2),d0
	lea _mode_size,a0
	movel a0@(d0:l:4),d0
L55:
	subl d3,d0
	negl d0
	subl d0,d1
	movel d1,sp@-
	movel a2@(4),sp@-
	jbsr _plus_constant
	movel d0,sp@-
	movel d2,sp@-
	movel a2,sp@-
	jbsr _change_address
	jra L42
L51:
	cmpw #35,a2@
	jne L57
	movel a2@(4),a0
	clrl d0
	moveb a0@(2),d0
	cmpl d0,d2
	jne L58
	tstl a2@(8)
	jne L58
	movel a0,d0
	jra L42
L58:
	movel a2@(8),sp@-
	movel a2@(4),sp@-
	jra L64
L57:
	cmpw #34,a2@
	jne L61
	clrl sp@-
	movel a2,sp@-
L64:
	movel d2,sp@-
	pea 35:w
	jbsr _gen_rtx
	jra L42
L61:
	jbsr _abort
L42:
	moveml a6@(-16),#0x41c
	unlk a6
	rts
	.even
.globl _gen_highpart
_gen_highpart:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(8),d2
	movel a6@(12),a2
	cmpw #37,a2@
	jne L66
	clrl d0
	moveb a2@(2),d0
	lea _mode_size,a0
	moveq #4,d3
	cmpl a0@(d0:l:4),d3
	jge L67
	movel a0@(d0:l:4),d1
	jra L68
L67:
	moveq #4,d1
L68:
	lea _mode_size,a0
	moveq #4,d3
	cmpl a0@(d2:l:4),d3
	jge L69
	movel a0@(d2:l:4),d0
	jra L70
L69:
	moveq #4,d0
L70:
	subl d0,d1
	movel d1,sp@-
	movel a2@(4),sp@-
	jbsr _plus_constant
	movel d0,sp@-
	movel d2,sp@-
	movel a2,sp@-
	jbsr _change_address
	jra L65
L66:
	cmpw #34,a2@
	jne L72
	clrl d0
	moveb a2@(2),d0
	lea _mode_size,a0
	moveq #4,d3
	cmpl a0@(d0:l:4),d3
	jge L73
	clrl d0
	moveb a2@(2),d0
	moveq #4,d3
	cmpl a0@(d2:l:4),d3
	jge L74
	movel a0@(d2:l:4),d1
	jra L75
L74:
	moveq #4,d1
L75:
	movel a0@(d0:l:4),d0
	subl d1,d0
	jpl L76
	addql #3,d0
L76:
	asrl #2,d0
	movel d0,sp@-
	jra L78
L73:
	clrl sp@-
L78:
	movel a2,sp@-
	movel d2,sp@-
	pea 35:w
	jbsr _gen_rtx
	jra L65
L72:
	jbsr _abort
L65:
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _subreg_lowpart_p
_subreg_lowpart_p:
	link a6,#0
	movel a6@(8),a0
	cmpw #35,a0@
	jeq L80
	moveq #1,d0
	jra L79
L80:
	tstl a0@(8)
	seq d0
	moveq #1,d1
	andl d1,d0
L79:
	unlk a6
	rts
	.even
.globl _change_address
_change_address:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(8),a2
	movel a6@(12),d2
	movel a6@(16),d3
	cmpw #37,a2@
	jeq L82
	jbsr _abort
L82:
	tstl d2
	jne L83
	clrl d2
	moveb a2@(2),d2
L83:
	tstl d3
	jne L84
	movel a2@(4),d3
L84:
	movel d3,sp@-
	movel d2,sp@-
	jbsr _memory_address
	movel d0,sp@-
	movel d2,sp@-
	pea 37:w
	jbsr _gen_rtx
	movel d0,a0
	bfextu a2@(3){#3:#1},d0
	bfins d0,a0@(3){#3:#1}
	bfextu a2@(3){#2:#1},d0
	bfins d0,a0@(3){#2:#1}
	bfextu a2@(3){#4:#1},d0
	bfins d0,a0@(3){#4:#1}
	movel a0,d0
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _gen_label_rtx
_gen_label_rtx:
	link a6,#0
	movel _label_num,d0
	addql #1,_label_num
	movel d0,sp@-
	clrl sp@-
	clrl sp@-
	clrl sp@-
	clrl sp@-
	pea 17:w
	jbsr _gen_rtx
	movel d0,a0
	clrl a0@(20)
	unlk a6
	rts
	.even
.globl _gen_inline_header_rtx
_gen_inline_header_rtx:
	link a6,#0
	movel a6@(32),sp@-
	movel a6@(28),sp@-
	movel a6@(24),sp@-
	movel a6@(20),sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	movel _cur_insn_uid,d0
	addql #1,_cur_insn_uid
	movel d0,sp@-
	clrl sp@-
	pea 19:w
	jbsr _gen_rtx
	unlk a6
	rts
	.even
.globl _set_new_first_and_last_insn
_set_new_first_and_last_insn:
	link a6,#0
	movel a6@(8),_first_insn
	movel a6@(12),_last_insn
	unlk a6
	rts
.data
	.even
_unshare_copies:
	.long 0
.text
	.even
.globl _unshare_all_rtl
_unshare_all_rtl:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(8),a3
	tstl a3
	jeq L95
L94:
	cmpw #13,a3@
	jeq L93
	cmpw #14,a3@
	jeq L93
	cmpw #15,a3@
	jne L91
L93:
	movel a3@(16),sp@-
	lea _copy_rtx_if_shared,a2
	jbsr a2@
	movel d0,a3@(16)
	movel a3@(28),sp@-
	jbsr a2@
	movel d0,a3@(28)
	movel a3@(24),sp@-
	jbsr a2@
	movel d0,a3@(24)
	addw #12,sp
L91:
	movel a3@(12),a3
	tstl a3
	jne L94
L95:
	movel _stack_slot_list,sp@-
	jbsr _copy_rtx_if_shared
	moveml a6@(-8),#0xc00
	unlk a6
	rts
	.even
_copy_rtx_if_shared:
	link a6,#0
	moveml #0x3c30,sp@-
	movel a6@(8),a2
	clrl d5
	tstl a2
	jne L97
	clrl d0
	jra L96
L97:
	clrl d4
	movew a2@,d4
	moveq #-13,d0
	addl d4,d0
	moveq #28,d1
	cmpl d1,d0
	jhi L98
LI122:
	movew pc@(L122-LI122-2:b,d0:l:2),d1
	jmp pc@(2,d1:w)
L122:
	.word L140-L122
	.word L140-L122
	.word L140-L122
	.word L140-L122
	.word L140-L122
	.word L140-L122
	.word L98-L122
	.word L98-L122
	.word L98-L122
	.word L98-L122
	.word L98-L122
	.word L98-L122
	.word L98-L122
	.word L98-L122
	.word L98-L122
	.word L98-L122
	.word L98-L122
	.word L140-L122
	.word L140-L122
	.word L98-L122
	.word L140-L122
	.word L140-L122
	.word L98-L122
	.word L98-L122
	.word L113-L122
	.word L140-L122
	.word L140-L122
	.word L140-L122
	.word L140-L122
L113:
	movel a2@(4),a0
	cmpw #38,a0@
	jeq L140
	cmpw #39,a0@
	jeq L140
	cmpw #30,a0@
	jeq L140
	cmpw #32,a0@
	jeq L140
	movel a2@(4),a0
	cmpw #44,a0@
	jne L116
	movel a0@(4),d1
	cmpl _frame_pointer_rtx,d1
	jeq L117
	cmpl _arg_pointer_rtx,d1
	jne L116
L117:
	movel a2@(4),a0
	movel a0@(8),a0
	cmpw #38,a0@
	jeq L118
	cmpw #39,a0@
	jeq L118
	cmpw #30,a0@
	jeq L118
	cmpw #32,a0@
	jne L116
L118:
	btst #2,a2@(3)
	jne L119
	movel a2@(4),sp@-
	jbsr _copy_rtx_if_shared
	movel d0,a2@(4)
L119:
	orb #4,a2@(3)
	jra L140
L116:
	movel a2@(4),d1
	cmpl _frame_pointer_rtx,d1
	jeq L140
	cmpl _arg_pointer_rtx,d1
	jeq L140
L98:
	btst #2,a2@(3)
	jeq L124
	addql #1,_unshare_copies
	movel d4,sp@-
	jbsr _rtx_alloc
	movel d0,d2
	lea _rtx_length,a0
	movel a0@(d4:l:4),d0
	addql #1,d0
	asll #2,d0
	movel d0,sp@-
	movel a2,sp@-
	movel d2,sp@-
	jbsr _memcpy
	movel d2,a2
	moveq #1,d5
	addw #16,sp
L124:
	orb #4,a2@(3)
	lea _rtx_format,a0
	movel a0@(d4:l:4),a3
	clrl d3
	jra L125
L139:
	moveb a3@+,d0
	cmpb #69,d0
	jeq L130
	cmpb #101,d0
	jne L127
	movel a2@(4,d3:l:4),sp@-
	jbsr _copy_rtx_if_shared
	movel d0,a2@(4,d3:l:4)
	addqw #4,sp
	jra L127
L130:
	tstl a2@(4,d3:l:4)
	jeq L127
	tstl d5
	jeq L132
	movel a2@(4,d3:l:4),d1
	addql #4,d1
	movel d1,sp@-
	movel a2@(4,d3:l:4),a0
	movel a0@,sp@-
	jbsr _gen_rtvec_v
	movel d0,a2@(4,d3:l:4)
	addqw #8,sp
L132:
	clrl d2
	jra L133
L136:
	movel a2@(4,d3:l:4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _copy_rtx_if_shared
	movel a2@(4,d3:l:4),a0
	movel d0,a0@(4,d2:l:4)
	addqw #4,sp
	addql #1,d2
L133:
	movel a2@(4,d3:l:4),a0
	cmpl a0@,d2
	jcs L136
L127:
	addql #1,d3
L125:
	lea _rtx_length,a0
	cmpl a0@(d4:l:4),d3
	jlt L139
L140:
	movel a2,d0
L96:
	moveml a6@(-24),#0xc3c
	unlk a6
	rts
	.even
.globl _make_safe_from
_make_safe_from:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),a2
	movel a6@(12),a0
	clrl d0
L142:
	movew a0@,d0
	moveq #36,d1
	cmpl d0,d1
	jeq L148
	moveq #36,d1
	cmpl d0,d1
	jlt L152
	moveq #35,d1
	cmpl d0,d1
	jeq L145
	jra L150
L152:
	moveq #78,d1
	cmpl d0,d1
	jlt L150
	moveq #77,d1
	cmpl d0,d1
	jgt L150
L145:
L148:
	movel a0@(4),a0
	jra L142
L150:
	cmpw #37,a0@
	jne L155
	cmpw #38,a2@
	jeq L155
	cmpw #39,a2@
	jeq L155
	cmpw #30,a2@
	jeq L155
	cmpw #32,a2@
	jeq L155
	cmpw #31,a2@
	jeq L155
	cmpw #34,a2@
	jeq L155
	cmpw #35,a2@
	jne L154
L155:
	cmpw #34,a0@
	jne L153
	moveq #55,d1
	cmpl a0@(4),d1
	jge L154
	movel a2,sp@-
	movel a0,sp@-
	jbsr _reg_mentioned_p
	addqw #8,sp
	tstl d0
	jeq L153
L154:
	clrl d0
	moveb a2@(2),d0
	movel d0,sp@-
	jbsr _gen_reg_rtx
	movel d0,d2
	movel a2,sp@-
	movel d2,sp@-
	jbsr _emit_move_insn
	movel d2,d0
	jra L141
L153:
	movel a2,d0
L141:
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _get_insns
_get_insns:
	link a6,#0
	movel _first_insn,d0
	unlk a6
	rts
	.even
.globl _get_last_insn
_get_last_insn:
	link a6,#0
	movel _last_insn,d0
	unlk a6
	rts
	.even
.globl _get_max_uid
_get_max_uid:
	link a6,#0
	movel _cur_insn_uid,d0
	unlk a6
	rts
	.even
.globl _next_insn
_next_insn:
	link a6,#0
	movel a6@(8),a0
	tstl a0
	jeq L160
	movel a0@(12),d0
	jra L159
L160:
	clrl d0
L159:
	unlk a6
	rts
	.even
.globl _previous_insn
_previous_insn:
	link a6,#0
	movel a6@(8),a0
	tstl a0
	jeq L162
	movel a0@(8),d0
	jra L161
L162:
	clrl d0
L161:
	unlk a6
	rts
	.even
_make_insn_raw:
	link a6,#0
	pea 13:w
	jbsr _rtx_alloc
	movel d0,a0
	movel _cur_insn_uid,a0@(4)
	addql #1,_cur_insn_uid
	movel a6@(8),a0@(16)
	moveq #-1,d1
	movel d1,a0@(20)
	clrl a0@(24)
	clrl a0@(28)
	unlk a6
	rts
	.even
_make_jump_insn_raw:
	link a6,#0
	pea 14:w
	jbsr _rtx_alloc
	movel d0,a0
	movel _cur_insn_uid,a0@(4)
	addql #1,_cur_insn_uid
	movel a6@(8),a0@(16)
	moveq #-1,d1
	movel d1,a0@(20)
	clrl a0@(24)
	clrl a0@(28)
	clrl a0@(32)
	unlk a6
	rts
	.even
_add_insn:
	link a6,#0
	movel a6@(8),a1
	movel _last_insn,a1@(8)
	clrl a1@(12)
	tstl _last_insn
	jeq L166
	movel _last_insn,a0
	movel a1,a0@(12)
L166:
	tstl _first_insn
	jne L167
	movel a1,_first_insn
L167:
	movel a1,_last_insn
	unlk a6
	rts
	.even
_add_insn_after:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a1
	movel a6@(12),a2
	movel a2@(12),a1@(12)
	movel a2,a1@(8)
	tstl a1@(12)
	jeq L169
	movel a1@(12),a0
	movel a1,a0@(8)
	jra L170
L169:
	movel a1,_last_insn
L170:
	movel a1,a2@(12)
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _delete_insns_since
_delete_insns_since:
	link a6,#0
	movel a6@(8),a0
	tstl a0
	jne L172
	clrl _first_insn
	jra L173
L172:
	clrl a0@(12)
L173:
	movel a0,_last_insn
	unlk a6
	rts
	.even
.globl _reorder_insns
_reorder_insns:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(8),a2
	movel a6@(12),a1
	movel a6@(16),a3
	tstl a2@(8)
	jeq L175
	movel a2@(8),a0
	movel a1@(12),a0@(12)
L175:
	tstl a1@(12)
	jeq L176
	movel a1@(12),a0
	movel a2@(8),a0@(8)
L176:
	cmpl _last_insn,a1
	jne L177
	movel a2@(8),_last_insn
L177:
	cmpl _first_insn,a2
	jne L178
	movel a1@(12),_first_insn
L178:
	tstl a3@(12)
	jeq L179
	movel a3@(12),a0
	movel a1,a0@(8)
	movel a3@(12),a1@(12)
L179:
	movel a3,a2@(8)
	movel a2,a3@(12)
	cmpl _last_insn,a3
	jne L180
	movel a1,_last_insn
L180:
	moveml a6@(-8),#0xc00
	unlk a6
	rts
	.even
.globl _emit_insn_before
_emit_insn_before:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(8),a2
	movel a6@(12),a3
	cmpw #11,a2@
	jne L182
	tstl a2@(4)
	jeq L183
	clrl d2
	jra L184
L187:
	movel a3@(8),sp@-
	movel a2@(4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _add_insn_after
	addqw #8,sp
	addql #1,d2
L184:
	movel a2@(4),a0
	cmpl a0@,d2
	jcs L187
L183:
	movel a3@(8),d0
	jra L181
L182:
	clrl sp@-
	movel a2,sp@-
	jbsr _make_insn_raw
	movel d0,a1
	movel a3@(8),a1@(8)
	movel a3,a1@(12)
	tstl a1@(8)
	jeq L188
	movel a1@(8),a0
	movel a1,a0@(12)
	jra L189
L188:
	movel a1,_first_insn
L189:
	movel a1,a3@(8)
	movel a1,d0
L181:
	moveml a6@(-12),#0xc04
	unlk a6
	rts
	.even
.globl _emit_jump_insn_before
_emit_jump_insn_before:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),a2
	clrl sp@-
	movel a6@(8),sp@-
	jbsr _make_jump_insn_raw
	movel d0,a1
	movel a2@(8),a1@(8)
	movel a2,a1@(12)
	tstl a1@(8)
	jeq L191
	movel a1@(8),a0
	movel a1,a0@(12)
	jra L192
L191:
	movel a1,_first_insn
L192:
	movel a1,a2@(8)
	movel a1,d0
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _emit_call_insn_before
_emit_call_insn_before:
	link a6,#0
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	jbsr _emit_insn_before
	movel d0,a0
	movew #15,a0@
	unlk a6
	rts
	.even
.globl _emit_insn_after
_emit_insn_after:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(8),a3
	movel a6@(12),a2
	cmpw #11,a3@
	jne L195
	tstl a3@(4)
	jeq L196
	clrl d2
	jra L197
L200:
	movel a2,sp@-
	movel a3@(4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _add_insn_after
	movel a2@(12),a2
	addqw #8,sp
	addql #1,d2
L197:
	movel a3@(4),a0
	cmpl a0@,d2
	jcs L200
L196:
	movel a2,d0
	jra L194
L195:
	clrl sp@-
	movel a3,sp@-
	jbsr _make_insn_raw
	movel d0,d2
	movel a2,sp@-
	movel d2,sp@-
	jbsr _add_insn_after
	movel d2,d0
L194:
	moveml a6@(-12),#0xc04
	unlk a6
	rts
	.even
.globl _emit_jump_insn_after
_emit_jump_insn_after:
	link a6,#0
	movel d2,sp@-
	clrl sp@-
	movel a6@(8),sp@-
	jbsr _make_jump_insn_raw
	movel d0,d2
	movel a6@(12),sp@-
	movel d2,sp@-
	jbsr _add_insn_after
	movel d2,d0
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _emit_barrier_after
_emit_barrier_after:
	link a6,#0
	movel a2,sp@-
	pea 16:w
	jbsr _rtx_alloc
	movel d0,a2
	movel _cur_insn_uid,a2@(4)
	addql #1,_cur_insn_uid
	movel a6@(8),sp@-
	movel a2,sp@-
	jbsr _add_insn_after
	movel a2,d0
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _emit_label_after
_emit_label_after:
	link a6,#0
	movel a6@(8),a0
	tstl a0@(4)
	jne L205
	movel _cur_insn_uid,a0@(4)
	addql #1,_cur_insn_uid
	movel a6@(12),sp@-
	movel a0,sp@-
	jbsr _add_insn_after
L205:
	unlk a6
	rts
	.even
.globl _emit_note_after
_emit_note_after:
	link a6,#0
	pea 18:w
	jbsr _rtx_alloc
	movel d0,a0
	movel _cur_insn_uid,a0@(4)
	addql #1,_cur_insn_uid
	clrl a0@(16)
	movel a6@(8),a0@(20)
	movel a6@(12),sp@-
	movel a0,sp@-
	jbsr _add_insn_after
	unlk a6
	rts
	.even
.globl _emit_insn
_emit_insn:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(8),a2
	cmpw #11,a2@
	jne L208
	tstl a2@(4)
	jeq L214
	clrl d2
	jra L210
L213:
	movel a2@(4),a0
	movel a0@(4,d2:l:4),d3
	movel d3,sp@-
	jbsr _add_insn
	addqw #4,sp
	addql #1,d2
L210:
	movel a2@(4),a0
	cmpl a0@,d2
	jcs L213
	jra L214
L208:
	clrl sp@-
	movel a2,sp@-
	jbsr _make_insn_raw
	movel d0,d3
	movel d3,sp@-
	jbsr _add_insn
L214:
	movel d3,d0
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _emit_insns
_emit_insns:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),a0
	tstl a0
	jeq L219
L218:
	movel a0@(12),d2
	movel a0,sp@-
	jbsr _add_insn
	movel d2,a0
	addqw #4,sp
	tstl a0
	jne L218
L219:
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _emit_jump_insn
_emit_jump_insn:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),a0
	cmpw #11,a0@
	jne L221
	movel a0,sp@-
	jbsr _emit_insn
	jra L220
L221:
	clrl sp@-
	movel a0,sp@-
	jbsr _make_jump_insn_raw
	movel d0,d2
	movel d2,sp@-
	jbsr _add_insn
	movel d2,d0
L220:
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _emit_call_insn
_emit_call_insn:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a0
	cmpw #11,a0@
	jne L224
	movel a0,sp@-
	jbsr _emit_insn
	jra L223
L224:
	clrl sp@-
	movel a0,sp@-
	jbsr _make_insn_raw
	movel d0,a2
	movel a2,sp@-
	jbsr _add_insn
	movew #15,a2@
	movel a2,d0
L223:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _emit_label
_emit_label:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	tstl a2@(4)
	jne L227
	movel _cur_insn_uid,a2@(4)
	addql #1,_cur_insn_uid
	movel a2,sp@-
	jbsr _add_insn
L227:
	movel a2,d0
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _emit_barrier
_emit_barrier:
	link a6,#0
	movel a2,sp@-
	pea 16:w
	jbsr _rtx_alloc
	movel d0,a2
	movel _cur_insn_uid,a2@(4)
	addql #1,_cur_insn_uid
	movel a2,sp@-
	jbsr _add_insn
	movel a2,d0
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _emit_line_note
_emit_line_note:
	link a6,#0
	movel a6@(8),d1
	movel a6@(12),d0
	movel d1,_emit_filename
	movel d0,_emit_lineno
	tstl _no_line_numbers
	jeq L230
	clrl d0
	jra L229
L230:
	movel d0,sp@-
	movel d1,sp@-
	jbsr _emit_note
L229:
	unlk a6
	rts
	.even
.globl _emit_note
_emit_note:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(8),d3
	movel a6@(12),d2
	tstl _no_line_numbers
	jeq L232
	tstl d2
	jgt L235
L232:
	tstl d2
	jle L233
	tstl d3
	jeq L234
	tstl _last_filename
	jeq L234
	movel _last_filename,sp@-
	movel d3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L234
	cmpl _last_linenum,d2
	jne L234
L235:
	clrl d0
	jra L231
L234:
	movel d3,_last_filename
	movel d2,_last_linenum
L233:
	pea 18:w
	jbsr _rtx_alloc
	movel d0,a2
	movel _cur_insn_uid,a2@(4)
	addql #1,_cur_insn_uid
	movel d3,a2@(16)
	movel d2,a2@(20)
	movel a2,sp@-
	jbsr _add_insn
	movel a2,d0
L231:
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _emit_line_note_force
_emit_line_note_force:
	link a6,#0
	moveq #-1,d1
	movel d1,_last_linenum
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	jbsr _emit_line_note
	unlk a6
	rts
	.even
.globl _classify_insn
_classify_insn:
	link a6,#0
	movel a6@(8),a1
	cmpw #17,a1@
	jne L238
	moveq #17,d0
	jra L237
L238:
	cmpw #28,a1@
	jeq L257
	cmpw #29,a1@
	jeq L258
	cmpw #25,a1@
	jne L241
	movel a1@(4),d1
	cmpl _pc_rtx,d1
	jeq L258
	movel a1@(8),a0
	cmpw #28,a0@
	jeq L257
	jra L246
L241:
	cmpw #20,a1@
	jne L246
	movel a1@(4),a0
	movel a0@,d0
	jra L249
L255:
	movel a1@(4),a0
	movel a0@(4,d0:l:4),a0
	cmpw #28,a0@
	jeq L257
	movel a1@(4),a0
	movel a0@(4,d0:l:4),a0
	cmpw #25,a0@
	jne L252
	movel a0@(4),d1
	cmpl _pc_rtx,d1
	jne L252
L258:
	moveq #14,d0
	jra L237
L252:
	movel a1@(4),a0
	movel a0@(4,d0:l:4),a0
	cmpw #25,a0@
	jne L249
	movel a0@(8),a0
	cmpw #28,a0@
	jne L249
L257:
	moveq #15,d0
	jra L237
L249:
	subql #1,d0
	jpl L255
L246:
	moveq #13,d0
L237:
	unlk a6
	rts
	.even
.globl _emit
_emit:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	movel a2,sp@-
	jbsr _classify_insn
	addqw #4,sp
	moveq #17,d1
	cmpl d0,d1
	jne L260
	movel a2,sp@-
	jbsr _emit_label
	jra L261
L260:
	moveq #13,d1
	cmpl d0,d1
	jne L262
	movel a2,sp@-
	jbsr _emit_insn
	jra L261
L262:
	moveq #14,d1
	cmpl d0,d1
	jne L264
	movel a2,sp@-
	jbsr _emit_jump_insn
	movel d0,sp@-
	jbsr _simplejump_p
	addqw #8,sp
	tstl d0
	jne L266
	cmpw #29,a2@
	jne L261
L266:
	jbsr _emit_barrier
	jra L261
L264:
	moveq #15,d1
	cmpl d0,d1
	jne L261
	movel a2,sp@-
	jbsr _emit_call_insn
L261:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _start_sequence
_start_sequence:
	link a6,#0
	movel a2,sp@-
	movel _sequence_stack,sp@-
	movel _last_insn,sp@-
	clrl sp@-
	pea 3:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel _first_insn,sp@-
	clrl sp@-
	pea 3:w
	jbsr a2@
	movel d0,_sequence_stack
	clrl _first_insn
	clrl _last_insn
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _push_to_sequence
_push_to_sequence:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(8),a3
	movel a3,d2
	jeq L272
L274:
	tstl a3@(12)
	jeq L272
	movel a3@(12),a3
	tstl a3
	jne L274
L272:
	movel _sequence_stack,sp@-
	movel _last_insn,sp@-
	clrl sp@-
	pea 3:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel _first_insn,sp@-
	clrl sp@-
	pea 3:w
	jbsr a2@
	movel d0,_sequence_stack
	movel d2,_first_insn
	movel a3,_last_insn
	moveml a6@(-12),#0xc04
	unlk a6
	rts
	.even
.globl _end_sequence
_end_sequence:
	link a6,#0
	movel _sequence_stack,a0
	movel a0@(4),_first_insn
	movel a0@(8),a1
	movel a1@(4),_last_insn
	movel a0@(8),a0
	movel a0@(8),_sequence_stack
	unlk a6
	rts
	.even
.globl _gen_sequence
_gen_sequence:
	link a6,#0
	clrl d0
	movel _first_insn,a0
	tstl a0
	jeq L290
L281:
	addql #1,d0
	movel a0@(12),a0
	tstl a0
	jne L281
L290:
	tstl d0
	jne L282
	clrl sp@-
	jra L291
L282:
	moveq #1,d1
	cmpl d0,d1
	jne L283
	movel _first_insn,a0
	cmpw #13,a0@
	jeq L284
	cmpw #14,a0@
	jeq L284
	cmpw #15,a0@
	jne L283
L284:
	movel _first_insn,a0
	movel a0@(16),d0
	jra L277
L283:
	movel d0,sp@-
	jbsr _rtvec_alloc
	movel d0,a1
	clrl d0
	movel _first_insn,a0
	addqw #4,sp
	tstl a0
	jeq L289
L288:
	movel a0,a1@(4,d0:l:4)
	movel a0@(12),a0
	addql #1,d0
	tstl a0
	jne L288
L289:
	movel a1,sp@-
L291:
	clrl sp@-
	pea 11:w
	jbsr _gen_rtx
L277:
	unlk a6
	rts
	.even
.globl _restore_reg_data
_restore_reg_data:
	link a6,#0
	moveml #0x3020,sp@-
	clrl d3
	movel a6@(8),a2
	tstl a2
	jeq L313
	andl #65535,d2
L306:
	cmpl a2@(4),d3
	jgt L296
	movel a2@(4),d3
L296:
	movew a2@,d2
	moveq #-13,d0
	addl d2,d0
	moveq #5,d1
	cmpl d1,d0
	jhi L295
LI304:
	movew pc@(L304-LI304-2:b,d0:l:2),d1
	jmp pc@(2,d1:w)
L304:
	.word L303-L304
	.word L303-L304
	.word L303-L304
	.word L295-L304
	.word L295-L304
	.word L295-L304
L303:
	movel a2@(16),sp@-
	jbsr _restore_reg_data_1
	addqw #4,sp
L295:
	movel a2@(12),a2
	tstl a2
	jne L306
L313:
	addql #1,d3
	movel d3,_cur_insn_uid
	moveq #56,d2
	cmpl _reg_rtx_no,d2
	jge L312
L311:
	movel _regno_reg_rtx,a0
	tstl a0@(d2:l:4)
	jne L309
	movel d2,sp@-
	pea 4:w
	pea 34:w
	jbsr _gen_rtx
	movel _regno_reg_rtx,a0
	movel d0,a0@(d2:l:4)
	addw #12,sp
L309:
	addql #1,d2
	cmpl _reg_rtx_no,d2
	jlt L311
L312:
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
_restore_reg_data_1:
	link a6,#0
	moveml #0x383c,sp@-
	movel a6@(8),a5
	clrl d4
	movew a5@,d4
	moveq #-17,d0
	addl d4,d0
	moveq #24,d1
	cmpl d1,d0
	jhi L315
LI330:
	movew pc@(L330-LI330-2:b,d0:l:2),d1
	jmp pc@(2,d1:w)
L330:
	.word L314-L330
	.word L315-L330
	.word L315-L330
	.word L315-L330
	.word L315-L330
	.word L315-L330
	.word L315-L330
	.word L315-L330
	.word L315-L330
	.word L315-L330
	.word L315-L330
	.word L315-L330
	.word L315-L330
	.word L314-L330
	.word L314-L330
	.word L315-L330
	.word L314-L330
	.word L324-L330
	.word L315-L330
	.word L315-L330
	.word L328-L330
	.word L314-L330
	.word L314-L330
	.word L314-L330
	.word L314-L330
L324:
	moveq #55,d1
	cmpl a5@(4),d1
	jge L314
	movel a5@(4),d1
	cmpl _reg_rtx_no,d1
	jlt L326
	movel a5@(4),_reg_rtx_no
	movel _reg_rtx_no,d1
	cmpl _regno_pointer_flag_length,d1
	jne L327
	movel _regno_pointer_flag_length,d1
	asll #1,d1
	movel d1,sp@-
	lea _oballoc,a4
	jbsr a4@
	movel d0,d2
	movel _regno_pointer_flag_length,d1
	asll #1,d1
	movel d1,sp@-
	clrl sp@-
	movel d2,sp@-
	lea _memset,a3
	jbsr a3@
	movel _regno_pointer_flag_length,sp@-
	movel _regno_pointer_flag,sp@-
	movel d2,sp@-
	lea _memcpy,a2
	jbsr a2@
	movel d2,_regno_pointer_flag
	movel _regno_pointer_flag_length,d1
	asll #3,d1
	movel d1,sp@-
	jbsr a4@
	movel d0,d2
	addw #32,sp
	movel _regno_pointer_flag_length,d1
	asll #3,d1
	movel d1,sp@-
	clrl sp@-
	movel d2,sp@-
	jbsr a3@
	movel _regno_pointer_flag_length,d1
	asll #2,d1
	movel d1,sp@-
	movel _regno_reg_rtx,sp@-
	movel d2,sp@-
	jbsr a2@
	movel d2,_regno_reg_rtx
	movel _regno_pointer_flag_length,d1
	asll #1,d1
	movel d1,_regno_pointer_flag_length
L327:
	addql #1,_reg_rtx_no
L326:
	movel a5@(4),d0
	movel _regno_reg_rtx,a0
	movel a5,a0@(d0:l:4)
	jra L314
L328:
	movel a5@(4),a0
	cmpw #34,a0@
	jne L329
	movel a0,sp@-
	jbsr _mark_reg_pointer
	addqw #4,sp
L329:
	movel a5@(4),sp@-
	jbsr _restore_reg_data_1
	jra L314
L315:
	lea _rtx_format,a0
	movel a0@(d4:l:4),a2
	clrl d3
	jra L332
L345:
	moveb a2@+,d0
	cmpb #69,d0
	jeq L337
	cmpb #101,d0
	jne L334
	movel a5@(4,d3:l:4),sp@-
	jbsr _restore_reg_data_1
	addqw #4,sp
	jra L334
L337:
	tstl a5@(4,d3:l:4)
	jeq L334
	clrl d2
	jra L339
L342:
	movel a5@(4,d3:l:4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _restore_reg_data_1
	addqw #4,sp
	addql #1,d2
L339:
	movel a5@(4,d3:l:4),a0
	cmpl a0@,d2
	jcs L342
L334:
	addql #1,d3
L332:
	lea _rtx_length,a0
	cmpl a0@(d4:l:4),d3
	jlt L345
L314:
	moveml a6@(-28),#0x3c1c
	unlk a6
	rts
	.even
.globl _init_emit
_init_emit:
	link a6,#0
	moveml #0x30,sp@-
	clrl _first_insn
	clrl _last_insn
	clrl _sequence_stack
	moveq #1,d1
	movel d1,_cur_insn_uid
	moveq #56,d1
	movel d1,_reg_rtx_no
	clrl _last_linenum
	clrl _last_filename
	movel _label_num,_first_label_num
	tstl a6@(8)
	seq d0
	moveq #1,d1
	andl d1,d0
	movel d0,_no_line_numbers
	movel #156,_regno_pointer_flag_length
	pea 156:w
	lea _oballoc,a3
	jbsr a3@
	movel d0,_regno_pointer_flag
	movel _regno_pointer_flag_length,sp@-
	clrl sp@-
	movel d0,sp@-
	lea _memset,a2
	jbsr a2@
	movel _regno_pointer_flag_length,d1
	asll #2,d1
	movel d1,sp@-
	jbsr a3@
	movel d0,_regno_reg_rtx
	movel _regno_pointer_flag_length,d1
	asll #2,d1
	movel d1,sp@-
	clrl sp@-
	movel d0,sp@-
	jbsr a2@
	moveml a6@(-8),#0xc00
	unlk a6
	rts
	.even
.globl _init_emit_once
_init_emit_once:
	link a6,#-8
	moveml #0x2030,sp@-
	clrl sp@-
	pea 33:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,_pc_rtx
	clrl sp@-
	pea 40:w
	jbsr a2@
	movel d0,_cc0_rtx
	pea 30:w
	lea _rtx_alloc,a3
	jbsr a3@
	movel d0,a0
	movel a0,_const0_rtx
	clrl a0@(4)
	pea 30:w
	jbsr a3@
	movel d0,a0
	movel a0,_const1_rtx
	moveq #1,d1
	movel d1,a0@(4)
	pea 31:w
	jbsr a3@
	movel d0,_fconst0_rtx
	pea 31:w
	jbsr a3@
	movel d0,_dconst0_rtx
	clrl a6@(-8)
	clrl a6@(-4)
	addw #32,sp
	pea 8:w
	movel a6,d2
	subql #8,d2
	movel d2,sp@-
	moveq #12,d1
	addl _fconst0_rtx,d1
	movel d1,sp@-
	lea _memcpy,a3
	jbsr a3@
	movel _fconst0_rtx,a0
	movel _cc0_rtx,a0@(4)
	moveb #10,a0@(2)
	pea 8:w
	movel d2,sp@-
	moveq #12,d1
	addl _dconst0_rtx,d1
	movel d1,sp@-
	jbsr a3@
	movel _dconst0_rtx,a0
	movel _cc0_rtx,a0@(4)
	moveb #11,a0@(2)
	pea 15:w
	pea 4:w
	pea 34:w
	jbsr a2@
	movel d0,_stack_pointer_rtx
	addw #36,sp
	pea 14:w
	pea 4:w
	pea 34:w
	jbsr a2@
	movel d0,_frame_pointer_rtx
	pea 9:w
	pea 4:w
	pea 34:w
	jbsr a2@
	movel d0,_struct_value_rtx
	movel d0,_struct_value_incoming_rtx
	pea 8:w
	pea 4:w
	pea 34:w
	jbsr a2@
	movel d0,_static_chain_rtx
	movel d0,_static_chain_incoming_rtx
	movel _frame_pointer_rtx,_arg_pointer_rtx
	moveml a6@(-20),#0xc04
	unlk a6
	rts
.comm _regno_pointer_flag_length,4
.comm _cc1_rtx,4
.lcomm _no_line_numbers,4
.lcomm _first_label_num,4
.comm _regno_reg_rtx,4
.comm _regno_pointer_flag,4
.comm _static_chain_incoming_rtx,4
.comm _static_chain_rtx,4
.comm _struct_value_incoming_rtx,4
.comm _struct_value_rtx,4
.comm _arg_pointer_rtx,4
.comm _frame_pointer_rtx,4
.comm _stack_pointer_rtx,4
.comm _dconst0_rtx,4
.comm _fconst0_rtx,4
.comm _const1_rtx,4
.comm _const0_rtx,4
.comm _cc0_rtx,4
.comm _pc_rtx,4
