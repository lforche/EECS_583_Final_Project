#NO_APP
gcc_compiled.:
.text
LC0:
	.ascii "varargs function cannot be inline\0"
LC1:
	.ascii "function too large to be inline\0"
LC2:
	.ascii "function with large aggregate parameter cannot be inline\0"
LC3:
	.ascii "no prototype, and parameter address used; cannot be inline\0"
LC4:
	.ascii "address of an aggregate parameter is used; cannot be inline\0"
	.even
.globl _function_cannot_inline_p
_function_cannot_inline_p:
	link a6,#0
	moveml #0x3038,sp@-
	movel a6@(8),a3
	movel a3@(8),a0
	movel a0@(16),sp@-
	jbsr _tree_last
	movel d0,a2
	movel a3@(52),sp@-
	jbsr _list_length
	movel d0,a0
	bfextu a3@(14){#6:#1},d0
	asll #4,d0
	lea a0@(8,d0:l),a4
	movel a4,d3
	asll #3,d3
	addqw #8,sp
	tstl a2
	jeq L2
	movel a2@(20),a4
	cmpl _void_type_node,a4
	jeq L2
	movel #LC0,d0
	jra L1
L2:
	jbsr _get_max_uid
	movel d3,d1
	asll #1,d1
	cmpl d0,d1
	jlt L22
	movel a3@(52),a1
	tstl a1
	jeq L21
L11:
	movel a1@(8),a0
	cmpb #26,a0@(28)
	jne L7
	movel #LC2,d0
	jra L1
L7:
	tstl a2
	jne L8
	btst #6,a1@(14)
	jeq L8
	movel #LC3,d0
	jra L1
L8:
	movel a1@(8),a0
	cmpb #19,a0@(12)
	jeq L10
	cmpb #20,a0@(12)
	jne L6
L10:
	movel a1@(64),a0
	cmpw #37,a0@
	jne L6
	movel #LC4,d0
	jra L1
L6:
	movel a1@(4),a1
	tstl a1
	jne L11
L21:
	jbsr _get_max_uid
	cmpl d0,d3
	jge L12
	clrl d2
	jbsr _get_first_nonparm_insn
	movel d0,a0
	tstl a0
	jeq L14
L18:
	cmpl d2,d3
	jle L14
	cmpw #13,a0@
	jeq L17
	cmpw #14,a0@
	jeq L17
	cmpw #15,a0@
	jne L15
L17:
	addql #1,d2
L15:
	movel a0@(12),a0
	tstl a0
	jne L18
L14:
	cmpl d2,d3
	jgt L12
L22:
	movel #LC1,d0
	jra L1
L12:
	clrl d0
L1:
	moveml a6@(-20),#0x1c0c
	unlk a6
	rts
	.even
.globl _save_for_inline
_save_for_inline:
	link a6,#-20
	moveml #0x3f3c,sp@-
	tstl _return_label
	jne L24
	jbsr _gen_label_rtx
	movel d0,_return_label
	movel d0,sp@-
	jbsr _emit_label
	addqw #4,sp
L24:
	jbsr _max_label_num
	movel d0,d7
	jbsr _get_first_label_num
	movel d0,a6@(-12)
	jbsr _max_parm_reg_num
	movel d0,_max_parm_reg
	jbsr _max_reg_num
	movel d0,d6
	movel _max_parm_reg,d0
	asll #2,d0
	movel d0,d1
	addql #1,d1
	moveq #-2,d4
	andl d4,d1
	subl d1,sp
	movel sp,d1
	movel d1,_parmdecl_map
	movel d0,sp@-
	clrl sp@-
	movel d1,sp@-
	jbsr _memset
	movel a6@(8),a5
	movel a5@(52),a0
	addw #12,sp
	tstl a0
	jeq L61
	movel _parmdecl_map,a2
L30:
	movel a0@(64),a1
	cmpw #34,a1@
	jne L28
	movel a1@(4),d0
	movel a0,a2@(d0:l:4)
	andb #239,a0@(13)
	jra L29
L28:
	orb #16,a0@(13)
L29:
	orb #4,a0@(13)
	movel a0@(4),a0
	tstl a0
	jne L30
L61:
	movel _current_function_args_size,sp@-
	movel d6,sp@-
	movel _max_parm_reg,sp@-
	movel d7,sp@-
	movel a6@(-12),sp@-
	clrl sp@-
	clrl sp@-
	jbsr _gen_inline_header_rtx
	movel d0,a6@(-8)
	movel d0,a5
	movel a5@(4),a6@(-16)
	jbsr _preserve_data
	jbsr _get_insns
	movel d0,a3
	addw #28,sp
	cmpw #18,a3@
	jeq L31
	jbsr _abort
L31:
	pea 18:w
	jbsr _rtx_alloc
	movel d0,a6@(-4)
	movel d0,a5
	movel a3@(16),a5@(16)
	movel a3@(20),a5@(20)
	movel a3@(4),a5@(4)
	clrl a5@(8)
	clrl a5@(12)
	movel a5,d5
	movel d6,d0
	addql #1,d0
	asll #2,d0
	addqw #4,sp
	addql #1,d0
	moveq #-2,d4
	andl d4,d0
	subl d0,sp
	movel sp,d0
	movel d0,_reg_map
	movel _rtx_length+136,d0
	subql #1,d0
	asll #2,d0
	addql #8,d0
	movel d6,d2
	subql #1,d2
	moveq #55,d4
	cmpl d2,d4
	jge L60
	lea _maybepermanent_obstack,a2
	movel d0,d3
L39:
	movel _reg_map,a6@(-20)
	movel d3,d0
	addl _maybepermanent_obstack+12,d0
	cmpl _maybepermanent_obstack+16,d0
	jls L36
	movel d3,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L36:
	movel d3,sp@-
	movel _regno_reg_rtx,a0
	movel a0@(d2:l:4),sp@-
	movel a2@(12),sp@-
	jbsr _memcpy
	addl d3,a2@(12)
	addw #12,sp
	movel a2@(8),a0
	movel a2@(12),d0
	addl a2@(24),d0
	movel a2@(24),d1
	notl d1
	andl d1,d0
	movel d0,a2@(12)
	subl a2@(4),d0
	movel a2@(16),d1
	subl a2@(4),d1
	cmpl d0,d1
	jge L38
	movel a2@(16),a2@(12)
L38:
	movel a2@(12),a2@(8)
	movel a6@(-20),a5
	movel a0,a5@(d2:l:4)
	subql #1,d2
	moveq #55,d4
	cmpl d2,d4
	jlt L39
L60:
	moveq #-56,d0
	addl d6,d0
	asll #2,d0
	movel d0,sp@-
	movel _reg_map,d4
	addl #224,d4
	movel d4,sp@-
	movel _regno_reg_rtx,d4
	addl #224,d4
	movel d4,sp@-
	jbsr _memcpy
	movel d7,d0
	subl a6@(-12),d0
	asll #2,d0
	addw #12,sp
	addql #1,d0
	moveq #-2,d4
	andl d4,d0
	subl d0,sp
	movel sp,d0
	movel d0,_label_map
	movel a6@(-12),d0
	asll #2,d0
	subl d0,_label_map
	movel a6@(-12),d2
	cmpl d2,d7
	jle L59
L43:
	jbsr _gen_label_rtx
	movel _label_map,a0
	movel d0,a0@(d2:l:4)
	addql #1,d2
	cmpl d2,d7
	jgt L43
L59:
	movel a6@(-16),d0
	asll #2,d0
	movel d0,d1
	addql #1,d1
	moveq #-2,d4
	andl d4,d1
	subl d1,sp
	movel sp,d1
	movel d1,_insn_map
	movel d0,sp@-
	clrl sp@-
	movel d1,sp@-
	jbsr _memset
	movel a3@(12),a3
	addw #12,sp
	tstl a3
	jeq L58
L57:
	clrl _orig_asm_operands_vector
	clrl _copy_asm_operands_vector
	clrl d0
	movew a3@,d0
	moveq #-13,d4
	addl d4,d0
	moveq #5,d4
	cmpl d4,d0
	jhi L55
LI56:
	movew pc@(L56-LI56-2:b,d0:l:2),d4
	jmp pc@(2,d4:w)
L56:
	.word L52-L56
	.word L52-L56
	.word L52-L56
	.word L54-L56
	.word L53-L56
	.word L48-L56
L48:
	moveq #-6,d4
	cmpl a3@(20),d4
	jeq L46
	pea 18:w
	jbsr _rtx_alloc
	movel d0,a4
	movel a3@(16),a4@(16)
	movel a3@(20),a4@(20)
	addqw #4,sp
	jra L47
L52:
	clrl d0
	movew a3@,d0
	movel d0,sp@-
	jbsr _rtx_alloc
	movel d0,a4
	movel a3@(16),sp@-
	lea _copy_for_inline,a2
	jbsr a2@
	movel d0,a4@(16)
	moveq #-1,d4
	movel d4,a4@(20)
	clrl a4@(24)
	movel a3@(28),sp@-
	jbsr a2@
	movel d0,a4@(28)
	addw #12,sp
	jra L47
L53:
	movel a3@(16),d0
	movel _label_map,a0
	movel a0@(d0:l:4),a4
	jra L47
L54:
	pea 16:w
	jbsr _rtx_alloc
	movel d0,a4
	addqw #4,sp
	jra L47
L55:
	jbsr _abort
L47:
	movel a3@(4),a4@(4)
	movel a3@(4),d0
	movel _insn_map,a0
	movel a4,a0@(d0:l:4)
	movel d5,a5
	movel a4,a5@(12)
	movel d5,a4@(8)
	movel a4,d5
L46:
	movel a3@(12),a3
	tstl a3
	jne L57
L58:
	movel d5,a5
	clrl a5@(12)
	jbsr _get_first_nonparm_insn
	movel a6@(-8),a5
	movel d0,a5@(12)
	jbsr _get_insns
	movel d0,a5@(16)
	movel a6@(8),a5
	movel a6@(-8),a5@(72)
	jbsr _get_frame_size
	movel d0,a5@(68)
	orb #2,a5@(14)
	clrl _parmdecl_map
	clrl _label_map
	clrl _reg_map
	clrl _return_label
	movel d5,sp@-
	movel a6@(-4),sp@-
	jbsr _set_new_first_and_last_insn
	moveml a6@(-60),#0x3cfc
	unlk a6
	rts
	.even
_copy_for_inline:
	link a6,#0
	moveml #0x3838,sp@-
	movel a6@(8),a2
	movel a2,a4
	tstl a2
	jeq L106
	clrl d4
	movew a2@,d4
	moveq #-22,d0
	addl d4,d0
	moveq #19,d1
	cmpl d1,d0
	jhi L64
LI88:
	movew pc@(L88-LI88-2:b,d0:l:2),d1
	jmp pc@(2,d1:w)
L88:
	.word L71-L88
	.word L64-L88
	.word L64-L88
	.word L86-L88
	.word L64-L88
	.word L64-L88
	.word L64-L88
	.word L64-L88
	.word L106-L88
	.word L106-L88
	.word L64-L88
	.word L106-L88
	.word L83-L88
	.word L64-L88
	.word L64-L88
	.word L73-L88
	.word L82-L88
	.word L106-L88
	.word L106-L88
	.word L106-L88
L71:
	movel _orig_asm_operands_vector,d1
	cmpl a4@(16),d1
	jne L64
	pea 22:w
	jbsr _rtx_alloc
	movel d0,a2
	movel a4@(4),a2@(4)
	movel a4@(8),a2@(8)
	movel a4@(12),a2@(12)
	movel _copy_asm_operands_vector,a2@(16)
	movel a4@(20),a2@(20)
	jra L62
L73:
	movel a2@(4),a0
	cmpw #38,a0@
	jeq L106
	cmpw #39,a0@
	jeq L106
	cmpw #30,a0@
	jeq L106
	cmpw #32,a0@
	jeq L106
	movel a2@(4),a0
	cmpw #44,a0@
	jne L64
	movel a0@(4),a0
	cmpw #34,a0@
	jne L64
	moveq #14,d1
	cmpl a0@(4),d1
	jeq L77
	moveq #14,d1
	cmpl a0@(4),d1
	jne L64
L77:
	movel a2@(4),a0
	movel a0@(8),a0
	cmpw #38,a0@
	jeq L78
	cmpw #39,a0@
	jeq L78
	cmpw #30,a0@
	jeq L78
	cmpw #32,a0@
	jne L64
L78:
	movel a2@(4),a0
	cmpw #34,a0@
	jne L64
	moveq #14,d1
	cmpl a0@(4),d1
	jeq L80
	moveq #14,d1
	cmpl a0@(4),d1
	jne L64
L80:
	movel a2@(8),a0
	cmpw #38,a0@
	jeq L106
	cmpw #39,a0@
	jeq L106
	cmpw #30,a0@
	jeq L106
	cmpw #32,a0@
	jne L64
	jra L106
L82:
	movel a4@(4),a0
	movel a0@(16),d0
	movel _label_map,a0
	movel a0@(d0:l:4),sp@-
	clrl d0
	moveb a4@(2),d0
	movel d0,sp@-
	pea 38:w
	jbsr _gen_rtx
	jra L62
L83:
	moveq #55,d1
	cmpl a2@(4),d1
	jge L106
	movel a2@(4),d0
	movel _reg_map,a0
	movel a0@(d0:l:4),d0
	jra L62
L86:
	movel a2@(4),a0
	cmpw #34,a0@
	jne L64
	movel a0@(4),d1
	cmpl _max_parm_reg,d1
	jge L64
	moveq #55,d1
	cmpl a0@(4),d1
	jge L64
	movel a0@(4),d0
	movel _parmdecl_map,a0
	tstl a0@(d0:l:4)
	jeq L64
	movel a0@(d0:l:4),a0
	andb #251,a0@(13)
L64:
	movel d4,sp@-
	jbsr _rtx_alloc
	movel d0,a2
	lea _rtx_length,a0
	movel a0@(d4:l:4),d0
	addql #1,d0
	asll #2,d0
	movel d0,sp@-
	movel a4,sp@-
	movel a2,sp@-
	jbsr _memcpy
	lea _rtx_format,a0
	movel a0@(d4:l:4),a3
	clrl d3
	addw #16,sp
	jra L90
L105:
	moveb a3@+,d0
	cmpb #101,d0
	jeq L94
	jgt L104
	cmpb #69,d0
	jeq L96
	jra L92
L104:
	cmpb #117,d0
	jeq L95
	jra L92
L94:
	movel a2@(4,d3:l:4),sp@-
	jbsr _copy_for_inline
	movel d0,a2@(4,d3:l:4)
	addqw #4,sp
	jra L92
L95:
	movel a2@(4,d3:l:4),a0
	movel a0@(4),d0
	movel _insn_map,a0
	movel a0@(d0:l:4),d0
	jra L62
L96:
	tstl a2@(4,d3:l:4)
	jeq L92
	movel a2@(4,d3:l:4),a0
	tstl a0@
	jeq L92
	movel a0,d1
	addql #4,d1
	movel d1,sp@-
	movel a0@,sp@-
	jbsr _gen_rtvec_v
	movel d0,a2@(4,d3:l:4)
	clrl d2
	addqw #8,sp
	jra L98
L101:
	movel a2@(4,d3:l:4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _copy_for_inline
	movel a2@(4,d3:l:4),a0
	movel d0,a0@(4,d2:l:4)
	addqw #4,sp
	addql #1,d2
L98:
	movel a2@(4,d3:l:4),a0
	cmpl a0@,d2
	jcs L101
L92:
	addql #1,d3
L90:
	lea _rtx_length,a0
	cmpl a0@(d4:l:4),d3
	jlt L105
	moveq #22,d1
	cmpl d4,d1
	jne L106
	tstl _orig_asm_operands_vector
	jne L106
	movel a4@(16),_orig_asm_operands_vector
	movel a2@(16),_copy_asm_operands_vector
L106:
	movel a2,d0
L62:
	moveml a6@(-24),#0x1c1c
	unlk a6
	rts
	.even
.globl _expand_inline_function
_expand_inline_function:
	link a6,#-36
	moveml #0x3f3c,sp@-
	movel a6@(12),d3
	movel a6@(16),d7
	movel a6@(8),a1
	movel a1@(72),a6@(-4)
	movel a6@(-4),a1
	movel a1@(12),a6@(-8)
	movel a1@(32),d5
	addql #1,d5
	movel d5,a6@(-12)
	movel a1@(20),a6@(-16)
	movel a1@(24),a6@(-20)
	clrl a6@(-28)
	clrl d6
	clrl a6@(-32)
	moveq #55,d5
	cmpl a6@(-12),d5
	jlt L108
	jbsr _abort
L108:
	movel a6@(8),a1
	movel a1@(52),sp@-
	lea _list_length,a2
	jbsr a2@
	movel d0,d2
	moveq #8,d5
	movel d5,_first_parm_offset
	movel d3,sp@-
	jbsr a2@
	addqw #8,sp
	cmpl d0,d2
	jne L207
	movel a6@(8),a1
	movel a1@(52),a3
	movel d3,a5
	tstl a3
	jeq L206
	clrl d0
	clrl d1
L115:
	movel a5@(20),a2
	movel a3@(52),a0
	moveb a0@(28),d0
	movel a2@(8),a0
	moveb a0@(28),d1
	cmpl d0,d1
	jne L207
	moveq #26,d5
	cmpl d0,d5
	jne L112
	movel a2@(8),d5
	cmpl a3@(8),d5
	jeq L112
L207:
	moveq #-1,d0
	jra L107
L112:
	movel a3@(4),a3
	movel a5@(4),a5
	tstl a3
	jne L115
L206:
	clrl sp@-
	jbsr _pushlevel
	clrl sp@-
	jbsr _expand_start_bindings
	movel d2,d0
	asll #2,d0
	addqw #8,sp
	addql #1,d0
	moveq #-2,d5
	andl d5,d0
	subl d0,sp
	movel sp,a6@(-24)
	movel a6@(8),a1
	movel a1@(52),a3
	movel d3,a5
	clrl d2
	tstl a3
	jeq L205
	clrl d4
	clrl a6@(-36)
L127:
	movel a5@(20),d3
	movel a3@(52),a0
	moveb a0@(28),d4
	movel a3@(8),a0
	moveb a0@(28),a6@(-33)
	movel a3@(20),sp@-
	movel a3@(16),sp@-
	jbsr _emit_note
	addqw #8,sp
	btst #6,a3@(14)
	jeq L119
	movel a3@(8),sp@-
	jbsr _int_size_in_bytes
	movel d0,sp@-
	movel d4,sp@-
	jbsr _assign_stack_local
	movel d0,a2
	movel a2@(4),sp@-
	movel a3@(28),sp@-
	jbsr _memory_address_p
	addw #20,sp
	tstl d0
	jne L120
	movel a2@(4),sp@-
	jbsr _copy_rtx
	movel d0,sp@-
	clrl sp@-
	movel a2,sp@-
	jbsr _change_address
	movel d0,a2
	addw #16,sp
L120:
	clrl sp@-
	movel a2,sp@-
	movel d3,sp@-
	jbsr _store_expr
	addw #12,sp
	jra L121
L119:
	btst #2,a3@(13)
	jeq L123
	btst #4,a3@(13)
	jeq L122
L123:
	movel d4,sp@-
	jbsr _gen_reg_rtx
	movel d0,a2
	clrl sp@-
	movel a2,sp@-
	movel d3,sp@-
	jbsr _store_expr
	addw #16,sp
	jra L121
L122:
	clrl sp@-
	movel d4,sp@-
	clrl sp@-
	movel d3,sp@-
	jbsr _expand_expr
	movel d0,a2
	addw #16,sp
	cmpw #34,a2@
	jeq L121
	cmpw #38,a2@
	jeq L121
	cmpw #39,a2@
	jeq L121
	cmpw #30,a2@
	jeq L121
	cmpw #32,a2@
	jeq L121
	movel a2,sp@-
	jbsr _copy_to_reg
	movel d0,a2
	addqw #4,sp
L121:
	cmpl a6@(-36),d4
	jeq L126
	movel a2,sp@-
	movel a6@(-36),sp@-
	jbsr _convert_to_mode
	movel d0,a2
	addqw #8,sp
L126:
	movel a6@(-24),a1
	movel a2,a1@(d2:l:4)
	movel a3@(4),a3
	movel a5@(4),a5
	addql #1,d2
	tstl a3
	jne L127
L205:
	movel a6@(-24),sp@-
	movel a6@(8),a1
	movel a1@(52),sp@-
	jbsr _copy_parm_decls
	jbsr _emit_queue
	jbsr _do_pending_stack_adjust
	addqw #8,sp
	tstl a6@(28)
	jeq L128
	movel _struct_value_rtx,a0
	cmpw #37,a0@
	jne L129
	movel a6@(28),sp@-
	pea 4:w
	jbsr _force_reg
	movel d0,a6@(-32)
	jra L208
L129:
	movel _struct_value_rtx,a6@(-32)
	movel a6@(28),sp@-
	movel a6@(-32),sp@-
	jbsr _emit_move_insn
L208:
	addqw #8,sp
L128:
	movel a6@(-12),d0
	asll #2,d0
	movel d0,d1
	addql #1,d1
	moveq #-2,d5
	andl d5,d1
	subl d1,sp
	movel sp,d1
	movel d1,_reg_map
	movel d0,sp@-
	clrl sp@-
	movel d1,sp@-
	jbsr _memset
	addw #12,sp
	movel a6@(8),a1
	tstl a1@(52)
	jeq L131
	movel a1@(52),d2
	movel a6@(-4),a1
	movel a1@(36),d1
	movel d1,d0
	jge L132
	addql #3,d0
L132:
	moveq #-4,d5
	andl d5,d0
	addql #1,d0
	moveq #-2,d5
	andl d5,d0
	subl d0,sp
	movel sp,d0
	movel d0,_parm_map
	movel d1,d0
	jge L133
	addql #3,d0
L133:
	moveq #-4,d5
	andl d5,d0
	movel d0,sp@-
	clrl sp@-
	movel _parm_map,sp@-
	jbsr _memset
	movel _first_parm_offset,d0
	jge L134
	addql #3,d0
L134:
	moveq #-4,d5
	andl d5,d0
	subl d0,_parm_map
	movel d2,a3
	clrl d2
	addw #12,sp
	tstl a3
	jeq L204
L152:
	tstl a3@(44)
	jlt L138
	movel a3@(44),d0
	jge L139
	moveq #31,d5
	addl d5,d0
L139:
	asrl #5,d0
	jra L209
L138:
	movel a3@(64),a0
	subl a2,a2
	cmpw #37,a0@
	jne L141
	movel a0@(4),a0
	cmpw #44,a0@
	jne L142
	movel a0@(4),d5
	cmpl _frame_pointer_rtx,d5
	jne L143
	movel a0@(8),a5
	cmpw #30,a5@
	jne L143
	movel a5,a2
	jra L142
L143:
	movel a0@(8),d5
	cmpl _frame_pointer_rtx,d5
	jne L142
	movel a0@(4),a0
	cmpw #30,a0@
	jne L142
	movel a0,a2
L142:
	tstl a2
	jeq L210
	movel a2@(4),d0
	jge L147
	addql #3,d0
L147:
	asrl #2,d0
L209:
	movel _parm_map,a0
	movel a6@(-24),a1
	movel a1@(d2:l:4),a0@(d0:l:4)
	jra L140
L141:
	cmpw #34,a0@
	jeq L140
L210:
	jbsr _abort
L140:
	movel a3@(64),a0
	cmpw #34,a0@
	jne L137
	movel a0@(4),d0
	movel _reg_map,a0
	movel a6@(-24),a1
	movel a1@(d2:l:4),a0@(d0:l:4)
L137:
	movel a3@(4),a3
	addql #1,d2
	tstl a3
	jne L152
L204:
	tstl a6@(-32)
	jeq L159
	movel _struct_value_incoming_rtx,a0
	cmpw #34,a0@
	jeq L159
	cmpw #37,a0@
	jne L156
	movel a0@(4),a0
	movel a0@(4),d5
	cmpl _frame_pointer_rtx,d5
	jne L156
	movel a0@(8),a0
	cmpw #30,a0@
	jne L156
	movel a0@(4),d0
	jge L157
	addql #3,d0
L157:
	asrl #2,d0
	movel _parm_map,a0
	movel a6@(-32),a0@(d0:l:4)
	jra L159
L156:
	jbsr _abort
	jra L159
L131:
	clrl _parm_map
L159:
	movel a6@(-20),d0
	subl a6@(-16),d0
	asll #2,d0
	addql #1,d0
	moveq #-2,d5
	andl d5,d0
	subl d0,sp
	movel sp,d0
	movel d0,_label_map
	movel a6@(-16),d0
	asll #2,d0
	subl d0,_label_map
	movel a6@(-16),d2
	cmpl a6@(-20),d2
	jge L203
L163:
	jbsr _gen_label_rtx
	movel _label_map,a0
	movel d0,a0@(d2:l:4)
	addql #1,d2
	cmpl a6@(-20),d2
	jlt L163
L203:
	movel a6@(-4),a1
	movel a1@(4),d0
	asll #2,d0
	addql #1,d0
	moveq #-2,d5
	andl d5,d0
	subl d0,sp
	movel sp,d0
	movel d0,_insn_map
	movel a1@(4),d5
	asll #2,d5
	movel d5,sp@-
	clrl sp@-
	movel d0,sp@-
	jbsr _memset
	addw #12,sp
	tstl a6@(28)
	jne L165
	movel a6@(24),a1
	tstb a1@(28)
	jne L164
L165:
	clrl _inline_target
	jra L166
L164:
	clrl d2
	movel a6@(24),a1
	moveb a1@(28),d2
	movel a6@(8),a1
	movel a1@(48),a0
	clrl d3
	moveb a0@(28),d3
	tstl d7
	jeq L167
	movel d7,a1
	cmpw #34,a1@
	jne L167
	clrl d0
	moveb a1@(2),d0
	cmpl d0,d2
	jne L167
	movel d7,_inline_target
	jra L168
L167:
	movel d2,sp@-
	jbsr _gen_reg_rtx
	movel d0,d7
	movel d7,_inline_target
	addqw #4,sp
L168:
	cmpl d3,d2
	jeq L166
	clrl sp@-
	movel d7,sp@-
	movel d3,sp@-
	pea 35:w
	jbsr _gen_rtx
	movel d0,_inline_target
	addw #16,sp
L166:
	jbsr _get_frame_size
	movel d0,_fp_delta
	negl d0
	movel d0,_fp_delta
	movel d0,sp@-
	movel _frame_pointer_rtx,sp@-
	jbsr _plus_constant
	movel d0,sp@-
	pea 4:w
	jbsr _copy_to_mode_reg
	movel d0,_inline_fp_rtx
	movel a6@(8),a1
	movel a1@(68),sp@-
	clrl sp@-
	jbsr _assign_stack_local
	movel a6@(-8),a3
	addw #24,sp
	tstl a3
	jeq L202
L196:
	clrl d2
	clrl _orig_asm_operands_vector
	clrl _copy_asm_operands_vector
	clrl d0
	movew a3@,d0
	moveq #-13,d5
	addl d5,d0
	moveq #5,d5
	cmpl d5,d0
	jhi L194
LI195:
	movew pc@(L195-LI195-2:b,d0:l:2),d5
	jmp pc@(2,d5:w)
L195:
	.word L174-L195
	.word L184-L195
	.word L187-L195
	.word L190-L195
	.word L189-L195
	.word L191-L195
L174:
	movel a3@(16),a2
	tstl d6
	jeq L175
	cmpw #25,a2@
	jne L176
	movel a2@(4),d5
	cmpl _stack_pointer_rtx,d5
	jeq L175
L176:
	cmpw #25,a2@
	jne L177
	movel d6,sp@-
	movel a2@(8),sp@-
	jbsr _rtx_equal_p
	addqw #8,sp
	tstl d0
	jeq L177
	movel d6,sp@-
	movel a2@(4),sp@-
	jbsr _copy_rtx_and_substitute
	addqw #4,sp
	movel d0,sp@-
	jra L211
L177:
	cmpw #26,a2@
	jne L178
	movel d6,sp@-
	movel a2@(4),sp@-
	jbsr _rtx_equal_p
	addqw #8,sp
	tstl d0
	jeq L178
	movel d6,sp@-
	movel _inline_target,sp@-
L211:
	clrl sp@-
	pea 25:w
	jbsr _gen_rtx
	movel d0,sp@-
	jbsr _emit_insn
	movel d0,a4
	orb #2,a4@(3)
	clrl d6
	addw #20,sp
	jra L173
L178:
	clrl d6
L175:
	subl a4,a4
	cmpw #26,a2@
	jne L180
	movel a2@(4),a0
	cmpw #34,a0@
	jne L180
	btst #1,a0@(3)
	jne L173
L180:
	cmpw #25,a2@
	jne L181
	movel a2@(4),d5
	cmpl _cc0_rtx,d5
	jne L181
	movel a3,sp@-
	jbsr _try_fold_cc0
	movel d0,d2
	addqw #4,sp
L181:
	tstl d2
	jeq L182
	movel d2,a3
	jra L173
L182:
	movel a2,sp@-
	jbsr _copy_rtx_and_substitute
	movel d0,sp@-
	jbsr _emit_insn
	jra L212
L184:
	clrl d6
	movel a3@(16),a0
	cmpw #29,a0@
	jne L185
	tstl a6@(-28)
	jne L186
	jbsr _gen_label_rtx
	movel d0,a6@(-28)
L186:
	movel a6@(-28),sp@-
	jbsr _emit_jump
	addqw #4,sp
	jra L173
L185:
	movel a3@(16),sp@-
	jbsr _copy_rtx_and_substitute
	movel d0,sp@-
	jbsr _emit_jump_insn
L212:
	movel d0,a4
	orb #2,a4@(3)
	addqw #8,sp
	jra L173
L187:
	movel a3@(16),sp@-
	jbsr _copy_rtx_and_substitute
	movel d0,sp@-
	jbsr _emit_call_insn
	movel d0,a4
	orb #2,a4@(3)
	movel a3@(16),a0
	addqw #8,sp
	cmpw #25,a0@
	jne L173
	movel a0@(4),d6
	jra L173
L189:
	movel a3@(16),d0
	movel _label_map,a0
	movel a0@(d0:l:4),sp@-
	jbsr _emit_label
	movel d0,a4
	clrl d6
	addqw #4,sp
	jra L173
L190:
	jbsr _emit_barrier
	movel d0,a4
	jra L173
L191:
	moveq #-6,d5
	cmpl a3@(20),d5
	jeq L192
	movel a3@(20),sp@-
	movel a3@(16),sp@-
	jbsr _emit_note
	movel d0,a4
	addqw #8,sp
	jra L173
L192:
	subl a4,a4
	jra L173
L194:
	jbsr _abort
L173:
	movel a3@(4),d0
	movel _insn_map,a0
	movel a4,a0@(d0:l:4)
	movel a3@(12),a3
	tstl a3
	jne L196
L202:
	tstl a6@(-28)
	jeq L197
	movel a6@(-28),sp@-
	jbsr _emit_label
	addqw #4,sp
L197:
	clrl sp@-
	movel a6@(8),a1
	movel a1@(60),sp@-
	jbsr _copy_decl_tree
	pea 1:w
	pea 1:w
	jbsr _getdecls
	movel d0,sp@-
	jbsr _expand_end_bindings
	clrl sp@-
	pea 1:w
	pea 1:w
	jbsr _poplevel
	clrl _reg_map
	clrl _label_map
	addw #32,sp
	tstl a6@(20)
	jne L199
	movel a6@(24),a1
	tstb a1@(28)
	jne L198
L199:
	clrl d0
	jra L107
L198:
	tstl a6@(28)
	jeq L200
	tstl d7
	jne L200
	movel a6@(28),sp@-
	pea 26:w
	jbsr _memory_address
	movel d0,sp@-
	pea 26:w
	pea 37:w
	jbsr _gen_rtx
	jra L107
L200:
	movel d7,d0
L107:
	moveml a6@(-76),#0x3cfc
	unlk a6
	rts
	.even
_copy_parm_decls:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(12),a3
	movel a6@(8),a2
	clrl d2
	tstl a2
	jeq L218
L217:
	movel a2@(8),sp@-
	movel a2@(36),sp@-
	pea 43:w
	jbsr _build_decl
	movel d0,sp@-
	jbsr _pushdecl
	movel d0,a0
	orb #1,a0@(14)
	movel a3@(d2:l:4),a0@(64)
	addw #16,sp
	movel a2@(4),a2
	addql #1,d2
	tstl a2
	jne L217
L218:
	moveml a6@(-12),#0xc04
	unlk a6
	rts
	.even
_copy_decl_tree:
	link a6,#0
	moveml #0x3038,sp@-
	movel a6@(8),a4
	movel a6@(12),d3
	clrl sp@-
	jbsr _pushlevel
	movel a4@(28),a2
	addqw #4,sp
	tstl a2
	jeq L233
L227:
	movel a2@(8),sp@-
	movel a2@(36),sp@-
	clrl d0
	moveb a2@(12),d0
	movel d0,sp@-
	jbsr _build_decl
	movel d0,a3
	movel a2@(20),a3@(20)
	movel a2@(16),a3@(16)
	addw #12,sp
	tstl a2@(64)
	jeq L223
	movel a2@(64),a0
	cmpw #37,a0@
	jne L224
	movel a0@(4),a0
	cmpw #38,a0@
	jeq L225
	cmpw #39,a0@
	jeq L225
	cmpw #30,a0@
	jeq L225
	cmpw #32,a0@
	jne L224
L225:
	movel a2@(64),a3@(64)
	jra L223
L224:
	movel a2@(64),sp@-
	jbsr _copy_rtx_and_substitute
	movel d0,a3@(64)
	addqw #4,sp
L223:
	bfextu a2@(13){#0:#1},d0
	bfins d0,a3@(13){#0:#1}
	bfextu a2@(13){#2:#1},d0
	bfins d0,a3@(13){#2:#1}
	bfextu a2@(13){#1:#1},d0
	bfins d0,a3@(13){#1:#1}
	bfextu a2@(13){#6:#1},d0
	bfins d0,a3@(13){#6:#1}
	bfextu a2@(14){#1:#1},d0
	bfins d0,a3@(14){#1:#1}
	bfextu a2@(13){#5:#1},d0
	bfins d0,a3@(13){#5:#1}
	bfextu a2@(13){#3:#1},d0
	bfins d0,a3@(13){#3:#1}
	orb #1,a3@(14)
	movel a3,sp@-
	jbsr _pushdecl
	addqw #4,sp
	movel a2@(4),a2
	tstl a2
	jne L227
L233:
	movel a4@(24),a2
	tstl a2
	jeq L232
	movel d3,d2
	addql #1,d2
L231:
	movel d2,sp@-
	movel a2,sp@-
	jbsr _copy_decl_tree
	addqw #8,sp
	movel a2@(4),a2
	tstl a2
	jne L231
L232:
	clrl sp@-
	clrl sp@-
	tstl d3
	sgt d0
	moveq #1,d1
	andl d1,d0
	movel d0,sp@-
	jbsr _poplevel
	moveml a6@(-20),#0x1c0c
	unlk a6
	rts
	.even
_copy_rtx_and_substitute:
	link a6,#0
	moveml #0x3e38,sp@-
	movel a6@(8),a4
	tstl a4
	jne L235
	clrl d0
	jra L234
L235:
	clrl d4
	movew a4@,d4
	clrl d5
	moveb a4@(2),d5
	moveq #-17,d0
	addl d4,d0
	moveq #27,d6
	cmpl d6,d0
	jhi L236
LI313:
	movew pc@(L313-LI313-2:b,d0:l:2),d6
	jmp pc@(2,d6:w)
L313:
	.word L244-L313
	.word L236-L313
	.word L236-L313
	.word L236-L313
	.word L236-L313
	.word L251-L313
	.word L236-L313
	.word L236-L313
	.word L236-L313
	.word L236-L313
	.word L236-L313
	.word L253-L313
	.word L312-L313
	.word L250-L313
	.word L250-L313
	.word L236-L313
	.word L250-L313
	.word L237-L313
	.word L236-L313
	.word L236-L313
	.word L274-L313
	.word L245-L313
	.word L250-L313
	.word L250-L313
	.word L236-L313
	.word L236-L313
	.word L236-L313
	.word L256-L313
L237:
	movel a4@(4),d2
	moveq #55,d6
	cmpl d2,d6
	jlt L238
	btst #1,a4@(3)
	jeq L239
	tstl _inline_target
	jne L240
	jbsr _abort
L240:
	movel _inline_target,a0
	clrl d0
	moveb a0@(2),d0
	cmpl d5,d0
	jne L241
	movel a0,d0
	jra L234
L241:
	clrl sp@-
	movel _inline_target,sp@-
	jra L336
L239:
	moveq #14,d6
	cmpl d2,d6
	jne L250
	movel _fp_delta,sp@-
	movel a4,sp@-
	jbsr _plus_constant
	jra L234
L238:
	movel _reg_map,a0
	tstl a0@(d2:l:4)
	jne L243
	movel d5,sp@-
	jbsr _gen_reg_rtx
	movel _reg_map,a0
	movel d0,a0@(d2:l:4)
L243:
	movel _reg_map,a0
	movel a0@(d2:l:4),d0
	jra L234
L244:
	movel a4@(16),d0
	movel _label_map,a0
	movel a0@(d0:l:4),d0
	jra L234
L245:
	pea 38:w
	jbsr _rtx_alloc
	movel d0,a3
	moveb d5,a3@(2)
	movel a4@(4),a0
	movel a0@(16),d0
	movel _label_map,a0
	movel a0@(d0:l:4),a3@(4)
	jra L335
L250:
	movel a4,d0
	jra L234
L251:
	movel _orig_asm_operands_vector,d6
	cmpl a4@(16),d6
	jne L236
	pea 22:w
	jbsr _rtx_alloc
	movel d0,a3
	movel a4@(4),a3@(4)
	movel a4@(8),a3@(8)
	movel a4@(12),a3@(12)
	movel _copy_asm_operands_vector,a3@(16)
	movel a4@(20),a3@(20)
	jra L234
L253:
	tstl _optimize
	jeq L255
	tstl _flag_no_function_cse
	jeq L236
L255:
	movel a4@(8),sp@-
	lea _copy_rtx_and_substitute,a2
	jbsr a2@
	movel d0,sp@-
	movel a4@(4),a0
	movel a0@(4),sp@-
	jbsr a2@
	addqw #4,sp
	movel d0,sp@-
	movel a4@(4),a0
	clrl d0
	moveb a0@(2),d0
	movel d0,sp@-
	pea 37:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	clrl d0
	moveb a4@(2),d0
	movel d0,sp@-
	pea 28:w
	jbsr a2@
	jra L234
L256:
	movel a4@(4),d6
	cmpl _frame_pointer_rtx,d6
	jeq L258
	movel a4@(8),d6
	cmpl _frame_pointer_rtx,d6
	jne L257
L258:
	movel a4@(4),d6
	cmpl _frame_pointer_rtx,d6
	jeq L260
	cmpl _arg_pointer_rtx,d6
	jne L259
L260:
	movel a4@(8),a3
	jra L261
L259:
	movel a4@(4),a3
L261:
	cmpw #30,a3@
	jne L262
	movel a3@(4),d0
	jle L263
	movel d0,d1
	jge L264
	addql #3,d1
L264:
	asrl #2,d1
	movel _parm_map,a0
	movel a0@(d1:l:4),a3
	movel a3@(4),d0
	jra L234
L263:
	addl _fp_delta,d0
	movel d0,sp@-
	pea 4:w
	pea 30:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel _frame_pointer_rtx,sp@-
	movel d5,sp@-
	pea 44:w
	jbsr a2@
	jra L234
L262:
	movel a3,sp@-
	jbsr _copy_rtx_and_substitute
	movel d0,a3
	movel a3,sp@-
	movel _frame_pointer_rtx,sp@-
	movel d5,sp@-
	pea 44:w
	jbsr _gen_rtx
	movel d0,sp@-
	movel d5,sp@-
	jbsr _force_reg
	movel _fp_delta,sp@-
	movel d0,sp@-
	jbsr _plus_constant
	jra L234
L257:
	movel a4,sp@-
	movel _frame_pointer_rtx,sp@-
	jbsr _reg_mentioned_p
	addqw #8,sp
	tstl d0
	jeq L266
	movel a4,sp@-
	movel d5,sp@-
	jbsr _memory_address_p
	addqw #8,sp
	tstl d0
	jeq L267
	movel a4@(4),a0
	cmpw #30,a0@
	jne L268
	movel a4@(8),sp@-
	jbsr _copy_rtx_and_substitute
	movel d0,a3
	movel a4@(4),a0
	jra L337
L268:
	movel a4@(8),a0
	cmpw #30,a0@
	jne L270
	movel a4@(4),sp@-
	jbsr _copy_rtx_and_substitute
	movel d0,a3
	movel a4@(8),a0
L337:
	movel a0@(4),sp@-
	movel a3,sp@-
	jbsr _plus_constant
	addw #12,sp
	jra L269
L270:
	movel a4@(8),sp@-
	lea _copy_rtx_and_substitute,a2
	jbsr a2@
	movel d0,sp@-
	movel a4@(4),sp@-
	jbsr a2@
	addqw #4,sp
	movel d0,sp@-
	clrl d0
	moveb a4@(2),d0
	movel d0,sp@-
	pea 44:w
	jbsr _gen_rtx
	addw #20,sp
L269:
	movel d0,sp@-
	movel d5,sp@-
	jbsr _memory_address
	jra L234
L267:
L266:
	movel a4@(8),sp@-
	lea _copy_rtx_and_substitute,a2
	jbsr a2@
	movel d0,sp@-
	movel a4@(4),sp@-
	jbsr a2@
	addqw #4,sp
	movel d0,sp@-
	clrl d0
	moveb a4@(2),d0
	movel d0,sp@-
	pea 44:w
	jbsr _gen_rtx
	jra L234
L274:
	movel a4@(4),a3
	cmpl _frame_pointer_rtx,a3
	jeq L276
	cmpl _arg_pointer_rtx,a3
	jne L275
L276:
	movel _fp_delta,sp@-
	movel _frame_pointer_rtx,sp@-
	jbsr _plus_constant
	jra L338
L275:
	cmpw #63,a3@
	jne L277
	movel a3@(4),d6
	cmpl _stack_pointer_rtx,d6
	jne L277
	movel a3,sp@-
	jbsr _copy_rtx_and_substitute
	jra L338
L277:
	movel a3,sp@-
	movel d5,sp@-
	jbsr _memory_address_p
	addqw #8,sp
	tstl d0
	jne L278
	movel a3,sp@-
	jbsr _copy_address
L338:
	movel d0,sp@-
	movel d5,sp@-
	pea 37:w
	jbsr _gen_rtx
	jra L234
L278:
	cmpw #44,a3@
	jne L279
	movel a3@(4),d6
	cmpl _frame_pointer_rtx,d6
	jeq L281
	movel a3@(8),d6
	cmpl _frame_pointer_rtx,d6
	jne L280
L281:
	movel a3@(4),d6
	cmpl _frame_pointer_rtx,d6
	jeq L283
	cmpl _arg_pointer_rtx,d6
	jne L282
L283:
	movel a3@(4),d0
	movel a3@(8),a3
	jra L284
L282:
	movel a3@(8),d0
	movel a3@(4),a3
L284:
	cmpw #30,a3@
	jne L285
	movel a3@(4),d4
	cmpl _arg_pointer_rtx,d0
	jne L286
	cmpl _first_parm_offset,d4
	jlt L286
	movel d4,d3
	jge L287
	addql #3,d3
L287:
	asrl #2,d3
	movel d4,d2
	jge L288
	addql #3,d2
L288:
	moveq #-4,d6
	andl d6,d2
	subl d4,d2
	negl d2
	jra L289
L293:
	subql #1,d3
	movel _first_parm_offset,d0
	jge L292
	addql #3,d0
L292:
	asrl #2,d0
	cmpl d3,d0
	jle L291
	jbsr _abort
L291:
	addql #4,d2
L289:
	movel _parm_map,a0
	tstl a0@(d3:l:4)
	jeq L293
	movel a0@(d3:l:4),a3
	clrl d1
	moveb a3@(2),d1
	lea _mode_size,a0
	moveq #3,d6
	cmpl a0@(d1:l:4),d6
	jlt L294
	movel d2,d0
	subql #4,d0
	movel d0,d2
	addl a0@(d1:l:4),d2
L294:
	clrl d0
	moveb a3@(2),d0
	cmpl d0,d5
	jeq L335
	tstb a3@(2)
	jeq L335
	cmpw #37,a3@
	jne L296
	movel d2,sp@-
	movel a3@(4),sp@-
	jbsr _plus_constant
	movel d0,sp@-
	movel d5,sp@-
	movel a3,sp@-
	jbsr _change_address
	jra L234
L296:
	cmpw #34,a3@
	jne L297
	lea _mode_size,a0
	movel d2,d1
	addl a0@(d5:l:4),d1
	clrl d0
	moveb a3@(2),d0
	cmpl a0@(d0:l:4),d1
	jeq L298
	jbsr _abort
L298:
	clrl sp@-
	movel a3,sp@-
L336:
	movel d5,sp@-
	pea 35:w
	jbsr _gen_rtx
	jra L234
L297:
	jbsr _abort
	jra L335
L286:
	movel d4,d6
	addl _fp_delta,d6
	movel d6,sp@-
	pea 4:w
	pea 30:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel _frame_pointer_rtx,sp@-
	pea 4:w
	pea 44:w
	jbsr a2@
	movel d0,sp@-
	pea 4:w
	jbsr _memory_address_p
	addw #36,sp
	tstl d0
	jne L285
	movel d4,sp@-
	movel _inline_fp_rtx,sp@-
	jbsr _plus_constant
	movel d0,sp@-
	movel d5,sp@-
	pea 37:w
	jbsr a2@
	jra L234
L285:
	movel a3,sp@-
	jbsr _copy_rtx_and_substitute
	movel d0,a3
	movel a3,sp@-
	movel _frame_pointer_rtx,sp@-
	pea 4:w
	pea 44:w
	jbsr _gen_rtx
	movel _fp_delta,sp@-
	movel d0,sp@-
	jbsr _plus_constant
	movel d0,sp@-
	pea 4:w
	jbsr _memory_address
	addw #36,sp
	jra L311
L280:
	movel a3,sp@-
	movel _frame_pointer_rtx,sp@-
	jbsr _reg_mentioned_p
	addqw #8,sp
	tstl d0
	jeq L301
	movel a3@(4),a0
	cmpw #30,a0@
	jne L302
	movel a3@(8),sp@-
	jbsr _copy_rtx_and_substitute
	movel a3@(4),a0
	jra L339
L302:
	movel a3@(8),a0
	cmpw #30,a0@
	jne L304
	movel a3@(4),sp@-
	jbsr _copy_rtx_and_substitute
	movel a3@(8),a0
L339:
	movel a0@(4),sp@-
	movel d0,sp@-
	jbsr _plus_constant
	addw #12,sp
	jra L311
L304:
	movel a3@(8),sp@-
	lea _copy_rtx_and_substitute,a2
	jbsr a2@
	movel d0,sp@-
	movel a3@(4),sp@-
	jbsr a2@
	addqw #4,sp
	movel d0,sp@-
	clrl d0
	moveb a3@(2),d0
	movel d0,sp@-
	pea 44:w
	jbsr _gen_rtx
	addw #20,sp
	jra L311
L301:
	movel a3@(8),a0
	cmpw #30,a0@
	jne L307
	movel a0@(4),sp@-
	movel a3@(4),sp@-
	jra L340
L307:
	movel a3@(4),a0
	cmpw #30,a0@
	jne L309
	movel a0@(4),sp@-
	movel a3@(8),sp@-
L340:
	jbsr _copy_rtx_and_substitute
	addqw #4,sp
	movel d0,sp@-
	jbsr _plus_constant
	addqw #8,sp
	jra L311
L309:
	movel a3@(4),sp@-
	lea _copy_rtx_and_substitute,a2
	jbsr a2@
	movel d0,d2
	movel a3@(8),sp@-
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	clrl d0
	moveb a3@(2),d0
	movel d0,sp@-
	pea 44:w
	jbsr _gen_rtx
	addw #24,sp
	jra L311
L279:
	movel a3,sp@-
	jbsr _copy_rtx_and_substitute
	addqw #4,sp
L311:
	movel d0,sp@-
	movel d5,sp@-
	movel a4,sp@-
	jbsr _change_address
	jra L234
L312:
	jbsr _abort
L236:
	movel d4,sp@-
	jbsr _rtx_alloc
	movel d0,a3
	moveb d5,a3@(2)
	bfextu a4@(3){#4:#1},d0
	bfins d0,a3@(3){#4:#1}
	bfextu a4@(3){#3:#1},d0
	bfins d0,a3@(3){#3:#1}
	bfextu a4@(3){#2:#1},d0
	bfins d0,a3@(3){#2:#1}
	clrl d0
	movew a3@,d0
	lea _rtx_format,a0
	movel a0@(d0:l:4),a2
	clrl d3
	addqw #4,sp
	jra L315
L334:
	moveb a2@+,d0
	cmpb #101,d0
	jeq L320
	jgt L332
	cmpb #48,d0
	jeq L317
	cmpb #69,d0
	jeq L322
	jra L330
L332:
	cmpb #115,d0
	jeq L329
	jgt L333
	cmpb #105,d0
	jeq L328
	jra L330
L333:
	cmpb #117,d0
	jeq L321
	jra L330
L320:
	movel a4@(4,d3:l:4),sp@-
	jbsr _copy_rtx_and_substitute
	movel d0,a3@(4,d3:l:4)
	addqw #4,sp
	jra L317
L321:
	movel a4@(4,d3:l:4),a0
	movel a0@(4),d0
	movel _insn_map,a0
	movel a0@(d0:l:4),a3@(4,d3:l:4)
	jra L317
L322:
	movel a4@(4,d3:l:4),a3@(4,d3:l:4)
	jeq L317
	movel a4@(4,d3:l:4),a0
	tstl a0@
	jeq L317
	movel a0@,sp@-
	jbsr _rtvec_alloc
	movel d0,a3@(4,d3:l:4)
	clrl d2
	addqw #4,sp
	jra L324
L327:
	movel a4@(4,d3:l:4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _copy_rtx_and_substitute
	movel a3@(4,d3:l:4),a0
	movel d0,a0@(4,d2:l:4)
	addqw #4,sp
	addql #1,d2
L324:
	movel a3@(4,d3:l:4),a0
	cmpl a0@,d2
	jcs L327
	jra L317
L328:
L329:
	movel a4@(4,d3:l:4),a3@(4,d3:l:4)
	jra L317
L330:
	jbsr _abort
L317:
	addql #1,d3
L315:
	clrl d0
	movew a3@,d0
	lea _rtx_length,a0
	cmpl a0@(d0:l:4),d3
	jlt L334
	moveq #22,d6
	cmpl d4,d6
	jne L335
	tstl _orig_asm_operands_vector
	jne L335
	movel a4@(16),_orig_asm_operands_vector
	movel a3@(16),_copy_asm_operands_vector
L335:
	movel a3,d0
L234:
	moveml a6@(-32),#0x1c7c
	unlk a6
	rts
	.even
_copy_address:
	link a6,#0
	moveml #0x3838,sp@-
	movel a6@(8),a3
	tstl a3
	jne L342
	clrl d0
	jra L341
L342:
	clrl d1
	movew a3@,d1
	clrl d2
	moveb a3@(2),d2
	moveq #-17,d0
	addl d1,d0
	moveq #27,d4
	cmpl d4,d0
	jhi L343
LI356:
	movew pc@(L356-LI356-2:b,d0:l:2),d4
	jmp pc@(2,d4:w)
L356:
	.word L350-L356
	.word L343-L356
	.word L343-L356
	.word L343-L356
	.word L343-L356
	.word L343-L356
	.word L343-L356
	.word L343-L356
	.word L343-L356
	.word L343-L356
	.word L343-L356
	.word L343-L356
	.word L343-L356
	.word L355-L356
	.word L355-L356
	.word L343-L356
	.word L355-L356
	.word L344-L356
	.word L343-L356
	.word L343-L356
	.word L348-L356
	.word L350-L356
	.word L355-L356
	.word L355-L356
	.word L343-L356
	.word L343-L356
	.word L343-L356
	.word L346-L356
L344:
	moveq #14,d4
	cmpl a3@(4),d4
	jne L350
	movel _fp_delta,sp@-
	movel _frame_pointer_rtx,sp@-
	jbsr _plus_constant
	jra L341
L346:
	movel a3@(4),a0
	cmpw #34,a0@
	jne L343
	moveq #14,d4
	cmpl a0@(4),d4
	jne L343
	movel _fp_delta,sp@-
	movel a3,sp@-
	jbsr _plus_constant
	jra L341
L348:
	movel a3,sp@-
	jbsr _copy_rtx_and_substitute
	movel d0,sp@-
	jbsr _copy_to_reg
	jra L341
L350:
	movel a3,sp@-
	jbsr _copy_rtx_and_substitute
	jra L341
L355:
	movel a3,d0
	jra L341
L343:
	movel d1,sp@-
	jbsr _rtx_alloc
	movel d0,a2
	moveb d2,a2@(2)
	bfextu a3@(3){#4:#1},d0
	bfins d0,a2@(3){#4:#1}
	bfextu a3@(3){#3:#1},d0
	bfins d0,a2@(3){#3:#1}
	bfextu a3@(3){#2:#1},d0
	bfins d0,a2@(3){#2:#1}
	clrl d0
	movew a2@,d0
	lea _rtx_format,a0
	movel a0@(d0:l:4),a4
	clrl d3
	addqw #4,sp
	jra L358
L377:
	moveb a4@+,d0
	cmpb #101,d0
	jeq L363
	jgt L375
	cmpb #48,d0
	jeq L360
	cmpb #69,d0
	jeq L365
	jra L373
L375:
	cmpb #115,d0
	jeq L372
	jgt L376
	cmpb #105,d0
	jeq L371
	jra L373
L376:
	cmpb #117,d0
	jeq L364
	jra L373
L363:
	movel a3@(4,d3:l:4),sp@-
	jbsr _copy_rtx_and_substitute
	movel d0,a2@(4,d3:l:4)
	addqw #4,sp
	jra L360
L364:
	movel a3@(4,d3:l:4),a0
	movel a0@(4),d0
	movel _insn_map,a0
	movel a0@(d0:l:4),a2@(4,d3:l:4)
	jra L360
L365:
	movel a3@(4,d3:l:4),a2@(4,d3:l:4)
	jeq L360
	movel a3@(4,d3:l:4),a0
	tstl a0@
	jeq L360
	movel a0@,sp@-
	jbsr _rtvec_alloc
	movel d0,a2@(4,d3:l:4)
	clrl d2
	addqw #4,sp
	jra L367
L370:
	movel a3@(4,d3:l:4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _copy_rtx_and_substitute
	movel a2@(4,d3:l:4),a0
	movel d0,a0@(4,d2:l:4)
	addqw #4,sp
	addql #1,d2
L367:
	movel a2@(4,d3:l:4),a0
	cmpl a0@,d2
	jcs L370
	jra L360
L371:
L372:
	movel a3@(4,d3:l:4),a2@(4,d3:l:4)
	jra L360
L373:
	jbsr _abort
L360:
	addql #1,d3
L358:
	clrl d0
	movew a2@,d0
	lea _rtx_length,a0
	cmpl a0@(d0:l:4),d3
	jlt L377
	movel a2,d0
L341:
	moveml a6@(-24),#0x1c1c
	unlk a6
	rts
	.even
_try_fold_cc0:
	link a6,#0
	moveml #0x38,sp@-
	movel a6@(8),a4
	movel a4@(16),a0
	movel a0@(8),sp@-
	jbsr _copy_rtx_and_substitute
	movel d0,a3
	addqw #4,sp
	cmpw #38,a3@
	jeq L380
	cmpw #39,a3@
	jeq L380
	cmpw #30,a3@
	jeq L380
	cmpw #32,a3@
	jne L379
L380:
	tstl a4@(12)
	jeq L379
	movel a4@(12),a0
	movel a0@(16),a2
	cmpw #25,a2@
	jne L379
	movel a2@(4),d1
	cmpl _pc_rtx,d1
	jne L379
	movel a2@(8),a2
	cmpw #42,a2@
	jne L379
	movel a2@(4),a1
	clrl d0
	movew a1@,d0
	lea _rtx_length,a0
	moveq #2,d1
	cmpl a0@(d0:l:4),d1
	jne L379
	movel a1@(4),d1
	cmpl _cc0_rtx,d1
	jne L383
	movel a1@(8),a0
	cmpw #38,a0@
	jeq L384
	cmpw #39,a0@
	jeq L384
	cmpw #30,a0@
	jeq L384
	cmpw #32,a0@
	jne L383
L384:
	movel a1@(8),d0
	jne L382
L383:
	movel a1@(8),d1
	cmpl _cc0_rtx,d1
	jne L379
	movel a1@(4),a0
	cmpw #38,a0@
	jeq L385
	cmpw #39,a0@
	jeq L385
	cmpw #30,a0@
	jeq L385
	cmpw #32,a0@
	jne L379
L385:
	movel a1@(4),d0
	jeq L379
L382:
	movel d0,sp@-
	movel a3,sp@-
	movel a2@(12),sp@-
	movel a2@(8),sp@-
	movel a1,sp@-
	jbsr _fold_out_const_cc0
	movel d0,a3
	addw #20,sp
	tstl a3
	jeq L379
	cmpw #38,a3@
	jne L387
	movel a4@(12),a2
	tstl a2
	jeq L389
L390:
	cmpw #17,a2@
	jeq L389
	movel a2@(12),a2
	tstl a2
	jne L390
L389:
	tstl a2
	jne L391
	jbsr _abort
L391:
	movel a2@(16),d0
	movel _label_map,a0
	movel a0@(d0:l:4),d1
	cmpl a3@(4),d1
	jne L392
	movel a2@(8),d0
	jra L378
L392:
	movel a3,sp@-
	jbsr _emit_jump
	movel a4@(12),d0
	jra L378
L387:
	cmpl _pc_rtx,a3
	jne L395
	movel a4@(12),d0
	jra L378
L395:
	jbsr _abort
L379:
	clrl d0
L378:
	moveml a6@(-12),#0x1c00
	unlk a6
	rts
	.even
_fold_out_const_cc0:
	link a6,#0
	moveml #0x3f20,sp@-
	movel a6@(12),d6
	movel a6@(16),d5
	movel a6@(20),a1
	movel a6@(24),a0
	cmpw #30,a1@
	seq d1
	moveq #1,d7
	andl d7,d1
	cmpw #30,a0@
	seq d4
	moveq #1,d7
	andl d7,d4
	tstl d1
	jeq L399
	movel a1@(4),d2
	jra L400
L399:
	moveq #1,d2
L400:
	tstl d4
	jeq L401
	movel a0@(4),d3
	jra L402
L401:
	moveq #1,d3
L402:
	clrl d0
	movel a6@(8),a2
	movew a2@,d0
	moveq #-67,d7
	addl d7,d0
	moveq #9,d7
	cmpl d7,d0
	jhi L403
LI468:
	movew pc@(L468-LI468-2:b,d0:l:2),d7
	jmp pc@(2,d7:w)
L468:
	.word L404-L468
	.word L412-L468
	.word L420-L468
	.word L426-L468
	.word L432-L468
	.word L438-L468
	.word L444-L468
	.word L450-L468
	.word L456-L468
	.word L462-L468
L404:
	tstl d1
	jeq L405
	tstl d4
	jeq L405
	cmpl d2,d3
	jne L470
	jra L471
L405:
	tstl d2
	jeq L470
	tstl d3
	jeq L470
	tstl d1
	jne L403
	tstl d4
	jne L403
	movel a0,sp@-
	movel a1,sp@-
	jbsr _rtx_equal_p
	addqw #8,sp
	tstl d0
	jeq L403
	jra L471
L412:
	tstl d1
	jeq L413
	tstl d4
	jeq L413
	cmpl d2,d3
	jeq L470
	jra L471
L413:
	tstl d2
	jeq L471
	tstl d3
	jeq L471
	tstl d1
	jne L403
	tstl d4
	jne L403
	movel a0,sp@-
	movel a1,sp@-
	jbsr _rtx_equal_p
	addqw #8,sp
	tstl d0
	jeq L403
	jra L470
L420:
	tstl d1
	jeq L421
	tstl d4
	jeq L421
	cmpl d2,d3
	jle L470
	jra L471
L421:
	tstl d2
	jeq L471
	tstl d3
	jne L403
	jra L470
L426:
	tstl d1
	jeq L427
	tstl d4
	jeq L427
	cmpl d2,d3
	jlt L470
	jra L471
L427:
	tstl d2
	jeq L471
	tstl d3
	jne L403
	jra L470
L432:
	tstl d1
	jeq L433
	tstl d4
	jeq L433
	cmpl d2,d3
	jge L470
	jra L471
L433:
	tstl d2
	jeq L470
	jra L466
L438:
	tstl d1
	jeq L439
	tstl d4
	jeq L439
	cmpl d2,d3
	jgt L470
	jra L471
L439:
	tstl d2
	jeq L470
	jra L466
L444:
	tstl d1
	jeq L445
	tstl d4
	jeq L445
	cmpl d2,d3
	jls L470
	jra L471
L445:
	tstl d2
	jeq L471
	tstl d3
	jne L403
	jra L470
L450:
	tstl d1
	jeq L451
	tstl d4
	jeq L451
	cmpl d2,d3
	jcs L470
	jra L471
L451:
	tstl d2
	jeq L471
	tstl d3
	jne L403
	jra L470
L456:
	tstl d1
	jeq L457
	tstl d4
	jeq L457
	cmpl d2,d3
	jcc L470
	jra L471
L457:
	tstl d2
	jeq L470
	jra L466
L462:
	tstl d1
	jeq L463
	tstl d4
	jeq L463
	cmpl d2,d3
	jhi L470
	jra L471
L463:
	tstl d2
	jne L466
L470:
	movel d6,sp@-
	jbsr _copy_rtx_and_substitute
	jra L398
L466:
	tstl d3
	jne L403
L471:
	movel d5,sp@-
	jbsr _copy_rtx_and_substitute
	jra L398
L403:
	clrl d0
L398:
	moveml a6@(-28),#0x4fc
	unlk a6
	rts
	.even
.globl _output_inline_function
_output_inline_function:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(8),a2
	movel a2@(72),a3
	jbsr _temporary_allocation
	movel a2,_current_function_decl
	movel a2,sp@-
	jbsr _expand_function_start
	movel a2@(68),sp@-
	pea 26:w
	jbsr _assign_stack_local
	movel a3@(16),sp@-
	jbsr _restore_reg_data
	movel a2@(20),sp@-
	movel a2@(16),sp@-
	jbsr _expand_function_end
	movel a3,a0
	addw #24,sp
	tstl a0@(12)
	jeq L477
L475:
	movel a0@(12),a0
	tstl a0@(12)
	jne L475
L477:
	movel a0,sp@-
	movel a3@(16),sp@-
	jbsr _set_new_first_and_last_insn
	movel a2,sp@-
	jbsr _rest_of_compilation
	clrl _current_function_decl
	jbsr _permanent_allocation
	moveml a6@(-8),#0xc00
	unlk a6
	rts
.lcomm _first_parm_offset,4
.lcomm _max_parm_reg,4
.lcomm _parmdecl_map,4
.lcomm _insn_map,4
.lcomm _label_map,4
.lcomm _reg_map,4
.lcomm _copy_asm_operands_vector,4
.lcomm _orig_asm_operands_vector,4
.lcomm _fp_delta,4
.lcomm _fp_addr_p,4
.lcomm _parm_map,4
.lcomm _inline_fp_rtx,4
.lcomm _inline_target,4
