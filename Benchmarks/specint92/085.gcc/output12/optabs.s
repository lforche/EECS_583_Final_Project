#NO_APP
gcc_compiled.:
.text
	.even
.globl _expand_binop
_expand_binop:
	link a6,#-8
	moveml #0x3f3c,sp@-
	movel a6@(16),a5
	movel a6@(20),d6
	movel a6@(24),a4
	movel a6@(32),d7
	jbsr _get_last_insn
	movel d0,a6@(-8)
	lea _mode_class,a0
	movel a6@(8),d1
	movel a0@(d1:l:4),a6@(-4)
	clrl sp@-
	movel a5,sp@-
	lea _protect_from_queue,a2
	jbsr a2@
	movel d0,a5
	clrl sp@-
	movel d6,sp@-
	jbsr a2@
	movel d0,d6
	addw #16,sp
	tstl a4
	jeq L2
	pea 1:w
	movel a4,sp@-
	jbsr a2@
	movel d0,a4
	addqw #8,sp
L2:
	tstl _flag_force_mem
	jeq L3
	movel a5,sp@-
	lea _force_not_mem,a2
	jbsr a2@
	movel d0,a5
	movel d6,sp@-
	jbsr a2@
	movel d0,d6
	addqw #8,sp
L3:
	movel a6@(12),d1
	cmpl _add_optab,d1
	jeq L5
	cmpl _and_optab,d1
	jeq L5
	cmpl _ior_optab,d1
	jeq L5
	cmpl _xor_optab,d1
	jeq L5
	cmpl _smul_optab,d1
	jeq L5
	cmpl _umul_optab,d1
	jeq L5
	cmpl _smul_widen_optab,d1
	jeq L5
	cmpl _umul_widen_optab,d1
	jne L4
L5:
	tstl a4
	jeq L10
	cmpw #34,a4@
	jne L8
L10:
	movel d6,a1
	cmpw #34,a1@
	jne L11
	cmpw #34,a5@
	jne L7
L11:
	cmpl a4,d6
	jeq L7
	jra L9
L8:
	movel a4,sp@-
	movel d6,sp@-
	jbsr _rtx_equal_p
	addqw #8,sp
	tstl d0
	jne L7
L9:
	cmpw #30,a5@
	jne L4
L7:
	movel d6,d3
	movel a5,d6
	movel d3,a5
L4:
	movel a6@(12),a1
	movel a6@(8),d1
	cmpl #246,a1@(4,d1:l:8)
	jeq L12
	movel a1@(4,d1:l:8),a3
	lea _insn_operand_mode,a0
	lea a3@(a3:l:4),a1
	movel a1,d0
	asll #2,d0
	movel a0@(4,d0:l),d2
	movel a0@(8,d0:l),d5
	movel a5,d4
	movel d6,a2
	tstl a4
	jeq L13
	movel a4,d3
	jra L14
L13:
	movel a6@(8),sp@-
	jbsr _gen_reg_rtx
	movel d0,d3
	addqw #4,sp
L14:
	tstb a5@(2)
	jeq L15
	clrl d0
	moveb a5@(2),d0
	cmpl d0,d2
	jeq L15
	movel a6@(28),sp@-
	movel d4,sp@-
	movel d2,sp@-
	jbsr _convert_to_mode
	movel d0,d4
	addw #12,sp
L15:
	tstb a2@(2)
	jeq L16
	clrl d0
	moveb a2@(2),d0
	cmpl d0,d5
	jeq L16
	movel a6@(28),sp@-
	movel a2,sp@-
	movel d5,sp@-
	jbsr _convert_to_mode
	movel d0,a2
	addw #12,sp
L16:
	lea _insn_operand_predicate,a0
	lea a3@(a3:l:4),a1
	movel d2,sp@-
	movel d4,sp@-
	movel a0@(4,a1:l:4),a0
	jbsr a0@
	addqw #8,sp
	tstl d0
	jne L17
	movel d4,sp@-
	movel d2,sp@-
	jbsr _force_reg
	movel d0,d4
	addqw #8,sp
L17:
	lea _insn_operand_predicate,a0
	lea a3@(a3:l:4),a1
	movel d5,sp@-
	movel a2,sp@-
	movel a0@(8,a1:l:4),a0
	jbsr a0@
	addqw #8,sp
	tstl d0
	jne L18
	movel a2,sp@-
	movel d5,sp@-
	jbsr _force_reg
	movel d0,a2
	addqw #8,sp
L18:
	lea _insn_operand_predicate,a0
	lea a3@(a3:l:4),a1
	movel a6@(8),sp@-
	movel d3,sp@-
	movel a0@(a1:l:4),a0
	jbsr a0@
	addqw #8,sp
	tstl d0
	jne L19
	movel a6@(8),sp@-
	jbsr _gen_reg_rtx
	movel d0,d3
	addqw #4,sp
L19:
	lea _insn_gen_function,a0
	movel a2,sp@-
	movel d4,sp@-
	movel d3,sp@-
	movel a0@(a3:l:4),a0
	jbsr a0@
	addw #12,sp
	tstl d0
	jeq L20
	movel d0,sp@-
	jbsr _emit_insn
	movel d3,d0
	jra L1
L20:
	movel a6@(-8),sp@-
	jbsr _delete_insns_since
	addqw #4,sp
L12:
	movel a6@(12),a1
	movel a6@(8),d1
	tstl a1@(8,d1:l:8)
	jeq L22
	moveq #1,d1
	cmpl d7,d1
	jeq L23
	moveq #3,d1
	cmpl d7,d1
	jne L22
L23:
	movel a6@(12),a1
	movel a6@(8),d1
	movel a1@(8,d1:l:8),sp@-
	pea 4:w
	pea 39:w
	jbsr _gen_rtx
	addw #12,sp
	tstl _flag_no_function_cse
	jne L24
	movel d0,sp@-
	pea 4:w
	jbsr _copy_to_mode_reg
	addqw #8,sp
L24:
	jbsr _get_last_insn
	movel d0,a3
	tstl a3
	jne L25
	jbsr _abort
L25:
	movel a6@(8),sp@-
	movel d6,sp@-
	movel a6@(8),sp@-
	movel a5,sp@-
	pea 2:w
	movel a6@(8),sp@-
	movel a6@(12),a1
	movel a6@(8),d1
	movel a1@(8,d1:l:8),sp@-
	pea 4:w
	pea 39:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	jbsr _emit_library_call
	movel a6@(8),sp@-
	jbsr _hard_libcall_value
	movel d0,a4
	addw #32,sp
	movel a4,sp@-
	jbsr _copy_to_reg
	movel d0,d3
	movel a3@(12),a3
	jbsr _get_last_insn
	movel d0,a4
	movel a4@(28),sp@-
	movel a3,sp@-
	pea 6:w
	pea 3:w
	jbsr a2@
	movel d0,sp@-
	movel d6,sp@-
	movel a5,sp@-
	movel a6@(8),sp@-
	movel a6@(12),a1
	movel a1@,sp@-
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	pea 5:w
	pea 2:w
	jbsr a2@
	movel d0,a4@(28)
	addw #36,sp
	movel a3@(28),sp@-
	movel a4,sp@-
	pea 7:w
	pea 3:w
	jbsr a2@
	movel d0,a3@(28)
	movel d3,d0
	jra L1
L22:
	movel a6@(-8),sp@-
	jbsr _delete_insns_since
	addqw #4,sp
	moveq #2,d1
	cmpl d7,d1
	jeq L26
	moveq #3,d1
	cmpl d7,d1
	jne L29
L26:
	moveq #3,d1
	cmpl d7,d1
	jne L27
	moveq #1,d7
	jra L28
L27:
	clrl d7
L28:
	moveq #1,d1
	cmpl a6@(-4),d1
	jeq L30
	moveq #2,d1
	cmpl a6@(-4),d1
	jne L29
L30:
	movel a6@(8),d2
	jra L33
L43:
	lea _mode_class,a0
	movel a0@(d2:l:4),d1
	cmpl a6@(-4),d1
	jne L29
	movel a6@(12),a1
	cmpl #246,a1@(4,d2:l:8)
	jne L35
	moveq #1,d1
	cmpl d7,d1
	jne L33
	tstl a1@(8,d2:l:8)
	jeq L33
L35:
	movel a5,a3
	movel d6,a2
	tstb a3@(2)
	jeq L36
	movel d2,sp@-
	jbsr _gen_reg_rtx
	movel d0,d3
	movel a6@(28),sp@-
	movel a3,sp@-
	movel d3,sp@-
	jbsr _convert_move
	movel d3,a3
	addw #16,sp
L36:
	tstb a2@(2)
	jeq L37
	movel d2,sp@-
	jbsr _gen_reg_rtx
	movel d0,d3
	movel a6@(28),sp@-
	movel a2,sp@-
	movel d3,sp@-
	jbsr _convert_move
	movel d3,a2
	addw #16,sp
L37:
	movel d7,sp@-
	movel a6@(28),sp@-
	clrl sp@-
	movel a2,sp@-
	movel a3,sp@-
	movel a6@(12),sp@-
	movel d2,sp@-
	jbsr _expand_binop
	movel d0,d3
	addw #28,sp
	jeq L38
	moveq #2,d1
	cmpl a6@(-4),d1
	jne L39
	tstl a4
	jne L40
	movel a6@(8),sp@-
	jbsr _gen_reg_rtx
	movel d0,a4
	addqw #4,sp
L40:
	clrl sp@-
	movel d3,sp@-
	movel a4,sp@-
	jbsr _convert_move
	movel a4,d0
	jra L1
L39:
	movel d3,sp@-
	movel a6@(8),sp@-
	jbsr _gen_lowpart
	jra L1
L38:
	movel a6@(-8),sp@-
	jbsr _delete_insns_since
	addqw #4,sp
L33:
	addql #1,d2
	moveq #27,d1
	cmpl d2,d1
	jge L43
L29:
	clrl d0
L1:
	moveml a6@(-48),#0x3cfc
	unlk a6
	rts
	.even
.globl _sign_expand_binop
_sign_expand_binop:
	link a6,#-228
	moveml #0x3f3c,sp@-
	movel a6@(8),d5
	movel a6@(12),a5
	movel a6@(16),a2
	movel a6@(20),a3
	movel a6@(24),d7
	movel a6@(28),d6
	movel a6@(32),d3
	movel a6@(36),a4
	jeq L46
	movel a5,d4
	jra L47
L46:
	movel a2,d4
L47:
	clrl sp@-
	movel d3,sp@-
	movel d6,sp@-
	movel d7,sp@-
	movel a3,sp@-
	movel d4,sp@-
	movel d5,sp@-
	jbsr _expand_binop
	addw #28,sp
	tstl d0
	jne L45
	tstl a4
	jeq L45
	movel a6,d2
	addl #-228,d2
	pea 228:w
	movel d2,sp@-
	movel a2,sp@-
	jbsr _bcopy
	addw #12,sp
	lea a6@(d5:l:8),a0
	movel #246,a0@(-224)
	clrl a0@(-220)
	pea 2:w
	movel d3,sp@-
	movel d6,sp@-
	movel d7,sp@-
	movel a3,sp@-
	movel d2,sp@-
	movel d5,sp@-
	lea _expand_binop,a2
	jbsr a2@
	addw #28,sp
	tstl d0
	jne L50
	tstl d3
	jeq L50
	pea 2:w
	movel d3,sp@-
	movel d6,sp@-
	movel d7,sp@-
	movel a3,sp@-
	movel a5,sp@-
	movel d5,sp@-
	jbsr a2@
	addw #28,sp
L50:
	tstl d0
	jne L45
	moveq #2,d1
	cmpl a4,d1
	jeq L45
	pea 1:w
	movel d3,sp@-
	movel d6,sp@-
	movel d7,sp@-
	movel a3,sp@-
	movel d4,sp@-
	movel d5,sp@-
	jbsr _expand_binop
	addw #28,sp
	tstl d0
	jne L45
	moveq #1,d1
	cmpl a4,d1
	jeq L45
	movel a4,sp@-
	movel d3,sp@-
	movel d6,sp@-
	movel d7,sp@-
	movel a3,sp@-
	pea a6@(-228)
	movel d5,sp@-
	jbsr _expand_binop
	addw #28,sp
	tstl d0
	jne L45
	tstl d3
	jeq L56
	movel a4,sp@-
	movel d3,sp@-
	movel d6,sp@-
	movel d7,sp@-
	movel a3,sp@-
	movel a5,sp@-
	movel d5,sp@-
	jbsr _expand_binop
	jra L45
L56:
	clrl d0
L45:
	moveml a6@(-268),#0x3cfc
	unlk a6
	rts
	.even
.globl _expand_twoval_binop
_expand_twoval_binop:
	link a6,#0
	moveml #0x3f38,sp@-
	movel a6@(8),a3
	movel a6@(12),d6
	movel a6@(16),d5
	movel a6@(20),d3
	movel a6@(24),d4
	movel a6@(28),a4
	tstl d3
	jeq L58
	movel d3,a0
	jra L59
L58:
	movel d4,a0
L59:
	clrl d2
	moveb a0@(2),d2
	lea _mode_class,a0
	movel a0@(d2:l:4),d7
	clrl sp@-
	movel d6,sp@-
	lea _protect_from_queue,a2
	jbsr a2@
	movel d0,d6
	clrl sp@-
	movel d5,sp@-
	jbsr a2@
	movel d0,d5
	addw #16,sp
	tstl _flag_force_mem
	jeq L60
	movel d6,sp@-
	lea _force_not_mem,a2
	jbsr a2@
	movel d0,d6
	movel d5,sp@-
	jbsr a2@
	movel d0,d5
	addqw #8,sp
L60:
	tstl d3
	jeq L61
	pea 1:w
	movel d3,sp@-
	jbsr _protect_from_queue
	movel d0,d3
	addqw #8,sp
	jra L62
L61:
	movel d2,sp@-
	jbsr _gen_reg_rtx
	movel d0,d3
	addqw #4,sp
L62:
	tstl d4
	jeq L63
	pea 1:w
	movel d4,sp@-
	jbsr _protect_from_queue
	movel d0,d4
	addqw #8,sp
	jra L64
L63:
	movel d2,sp@-
	jbsr _gen_reg_rtx
	movel d0,d4
	addqw #4,sp
L64:
	cmpl #246,a3@(4,d2:l:8)
	jeq L65
	movel a3@(4,d2:l:8),d0
	lea _insn_gen_function,a0
	movel d4,sp@-
	movel d5,sp@-
	movel d6,sp@-
	movel d3,sp@-
	movel a0@(d0:l:4),a0
	jbsr a0@
	movel d0,sp@-
	jbsr _emit_insn
	moveq #1,d0
	jra L57
L65:
	moveq #1,d1
	cmpl d7,d1
	jeq L67
	moveq #2,d1
	cmpl d7,d1
	jne L66
L67:
	movel d2,d0
	jra L70
L72:
	lea _mode_class,a0
	cmpl a0@(d0:l:4),d7
	jne L66
	cmpl #246,a3@(4,d0:l:8)
	jeq L70
	movel a4,sp@-
	movel d4,sp@-
	movel d3,sp@-
	movel d5,sp@-
	movel d6,sp@-
	movel d0,sp@-
	movel a3,sp@-
	jbsr _expand_twoval_binop_convert
	moveq #1,d0
	jra L57
L70:
	addql #1,d0
	moveq #27,d1
	cmpl d0,d1
	jge L72
L66:
	clrl d0
L57:
	moveml a6@(-36),#0x1cfc
	unlk a6
	rts
	.even
.globl _expand_twoval_binop_convert
_expand_twoval_binop_convert:
	link a6,#0
	moveml #0x3e30,sp@-
	movel a6@(16),d6
	movel a6@(32),d2
	pea 4:w
	lea _gen_reg_rtx,a3
	jbsr a3@
	movel d0,d4
	pea 4:w
	jbsr a3@
	movel d0,d3
	pea 4:w
	jbsr a3@
	movel d0,d5
	movel d2,sp@-
	movel d6,sp@-
	movel d5,sp@-
	lea _convert_move,a2
	jbsr a2@
	movel d5,d6
	pea 4:w
	jbsr a3@
	movel d0,d5
	movel d2,sp@-
	movel a6@(20),sp@-
	movel d5,sp@-
	jbsr a2@
	addw #40,sp
	movel d2,sp@-
	movel d3,sp@-
	movel d4,sp@-
	movel d5,sp@-
	movel d6,sp@-
	movel a6@(8),sp@-
	jbsr _expand_twoval_binop
	movel d2,sp@-
	movel d4,sp@-
	movel a6@(24),sp@-
	jbsr a2@
	addw #36,sp
	movel d2,sp@-
	movel d3,sp@-
	movel a6@(28),sp@-
	jbsr a2@
	moveq #1,d0
	moveml a6@(-28),#0xc7c
	unlk a6
	rts
	.even
.globl _expand_unop
_expand_unop:
	link a6,#-4
	moveml #0x3e3c,sp@-
	movel a6@(8),d5
	movel a6@(16),a5
	movel a6@(20),d2
	movel a6@(24),d6
	lea _mode_class,a0
	movel a0@(d5:l:4),d4
	clrl sp@-
	movel a5,sp@-
	jbsr _protect_from_queue
	movel d0,a5
	addqw #8,sp
	tstl _flag_force_mem
	jeq L76
	movel a5,sp@-
	jbsr _force_not_mem
	movel d0,a5
	addqw #4,sp
L76:
	tstl d2
	jeq L77
	pea 1:w
	movel d2,sp@-
	jbsr _protect_from_queue
	movel d0,d2
	addqw #8,sp
L77:
	movel a6@(12),a1
	cmpl #246,a1@(4,d5:l:8)
	jeq L78
	movel a1@(4,d5:l:8),a2
	lea _insn_operand_mode,a0
	lea a2@(a2:l:4),a1
	movel a0@(4,a1:l:4),d4
	tstl d2
	jeq L79
	movel d2,d3
	jra L80
L79:
	movel d5,sp@-
	jbsr _gen_reg_rtx
	movel d0,d3
	addqw #4,sp
L80:
	tstb a5@(2)
	jeq L81
	clrl d0
	moveb a5@(2),d0
	cmpl d0,d4
	jeq L81
	movel d6,sp@-
	movel a5,sp@-
	movel d4,sp@-
	jbsr _convert_to_mode
	movel d0,a5
	addw #12,sp
L81:
	lea _insn_operand_predicate,a0
	lea a2@(a2:l:4),a1
	movel d4,sp@-
	movel a5,sp@-
	movel a0@(4,a1:l:4),a0
	jbsr a0@
	addqw #8,sp
	tstl d0
	jne L82
	movel a5,sp@-
	movel d4,sp@-
	jbsr _force_reg
	movel d0,a5
	addqw #8,sp
L82:
	lea _insn_operand_predicate,a0
	lea a2@(a2:l:4),a1
	movel d5,sp@-
	movel d3,sp@-
	movel a0@(a1:l:4),a0
	jbsr a0@
	addqw #8,sp
	tstl d0
	jne L83
	movel d5,sp@-
	jbsr _gen_reg_rtx
	movel d0,d3
	addqw #4,sp
L83:
	lea _insn_gen_function,a0
	movel a5,sp@-
	movel d3,sp@-
	movel a0@(a2:l:4),a0
	jbsr a0@
	movel d0,sp@-
	jbsr _emit_insn
	movel d3,d0
	jra L75
L78:
	movel a6@(12),a1
	tstl a1@(8,d5:l:8)
	jeq L84
	movel a1@(8,d5:l:8),sp@-
	pea 4:w
	pea 39:w
	jbsr _gen_rtx
	addw #12,sp
	tstl _flag_no_function_cse
	jne L86
	movel d0,sp@-
	pea 4:w
	jbsr _copy_to_mode_reg
	addqw #8,sp
L86:
	lea _get_last_insn,a4
	jbsr a4@
	movel d0,a2
	movel d5,sp@-
	movel a5,sp@-
	pea 1:w
	movel d5,sp@-
	movel a6@(12),a1
	movel a1@(8,d5:l:8),sp@-
	pea 4:w
	pea 39:w
	lea _gen_rtx,a3
	jbsr a3@
	addw #12,sp
	movel d0,sp@-
	jbsr _emit_library_call
	movel d5,sp@-
	jbsr _hard_libcall_value
	movel d0,d2
	movel d2,sp@-
	jbsr _copy_to_reg
	movel d0,d3
	jbsr a4@
	movel d0,a4
	movel a4@(28),sp@-
	movel a2@(12),sp@-
	pea 6:w
	pea 3:w
	jbsr a3@
	movel d0,sp@-
	movel a5,sp@-
	movel d5,sp@-
	movel a6@(12),a1
	movel a1@,sp@-
	jbsr a3@
	addw #12,sp
	movel d0,sp@-
	pea 5:w
	pea 2:w
	jbsr a3@
	movel d0,a4@(28)
	addw #60,sp
	movel a2@(12),a0
	movel a0@(28),sp@-
	movel a4,sp@-
	pea 7:w
	pea 3:w
	jbsr a3@
	movel a2@(12),a0
	movel d0,a0@(28)
	movel d3,d0
	jra L75
L84:
	moveq #1,d1
	cmpl d4,d1
	jeq L88
	moveq #2,d1
	cmpl d4,d1
	jne L87
L88:
	movel d5,d2
	jra L91
L98:
	lea _mode_class,a0
	cmpl a0@(d2:l:4),d4
	jne L87
	movel a6@(12),a1
	cmpl #246,a1@(4,d2:l:8)
	jne L93
	tstl a1@(8,d2:l:8)
	jeq L91
L93:
	tstb a5@(2)
	jeq L94
	movel d2,sp@-
	jbsr _gen_reg_rtx
	movel d0,d3
	movel d6,sp@-
	movel a5,sp@-
	movel d3,sp@-
	jbsr _convert_move
	movel d3,a5
	addw #16,sp
L94:
	movel d6,sp@-
	clrl sp@-
	movel a5,sp@-
	movel a6@(12),sp@-
	movel d2,sp@-
	jbsr _expand_unop
	movel d0,d2
	addw #20,sp
	moveq #2,d1
	cmpl d4,d1
	jne L95
	tstl d2
	jne L96
	movel d5,sp@-
	jbsr _gen_reg_rtx
	movel d0,d2
	addqw #4,sp
L96:
	clrl sp@-
	movel d3,sp@-
	movel d2,sp@-
	jbsr _convert_move
	movel d2,d0
	jra L75
L95:
	movel d2,sp@-
	movel d5,sp@-
	jbsr _gen_lowpart
	jra L75
L91:
	addql #1,d2
	moveq #27,d1
	cmpl d2,d1
	jge L98
L87:
	clrl d0
L75:
	moveml a6@(-40),#0x3c7c
	unlk a6
	rts
	.even
.globl _emit_unop_insn
_emit_unop_insn:
	link a6,#0
	moveml #0x3e38,sp@-
	movel a6@(8),a3
	movel a6@(12),d3
	movel a6@(16),d2
	movel a6@(20),d6
	lea _insn_operand_mode,a0
	lea a3@(a3:l:4),a1
	movel a0@(4,a1:l:4),d4
	jbsr _get_last_insn
	movel d0,d5
	pea 1:w
	movel d3,sp@-
	lea _protect_from_queue,a2
	jbsr a2@
	movel d0,d3
	movel d3,a4
	clrl sp@-
	movel d2,sp@-
	jbsr a2@
	movel d0,d2
	addw #16,sp
	tstl _flag_force_mem
	jeq L101
	movel d2,sp@-
	jbsr _force_not_mem
	movel d0,d2
	addqw #4,sp
L101:
	lea _insn_operand_predicate,a0
	lea a3@(a3:l:4),a1
	movel d4,sp@-
	movel d2,sp@-
	movel a0@(4,a1:l:4),a0
	jbsr a0@
	addqw #8,sp
	tstl d0
	jne L102
	movel d2,sp@-
	movel d4,sp@-
	jbsr _force_reg
	movel d0,d2
	addqw #8,sp
L102:
	lea _insn_operand_predicate,a0
	lea a3@(a3:l:4),a1
	clrl d0
	moveb a4@(2),d0
	movel d0,sp@-
	movel a4,sp@-
	movel a0@(a1:l:4),a0
	jbsr a0@
	addqw #8,sp
	tstl d0
	jeq L104
	tstl _flag_force_mem
	jeq L103
	cmpw #37,a4@
	jne L103
L104:
	clrl d0
	moveb a4@(2),d0
	movel d0,sp@-
	jbsr _gen_reg_rtx
	movel d0,a4
	addqw #4,sp
L103:
	lea _insn_gen_function,a0
	movel d2,sp@-
	movel a4,sp@-
	movel a0@(a3:l:4),a0
	jbsr a0@
	movel d0,sp@-
	jbsr _emit_insn
	movel d0,a3
	addw #12,sp
	tstl d6
	jeq L105
	cmpl a3@(8),d5
	jeq L105
	movel a3@(28),sp@-
	movel d2,sp@-
	clrl d0
	moveb a4@(2),d0
	movel d0,sp@-
	movel d6,sp@-
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	pea 5:w
	pea 2:w
	jbsr a2@
	movel d0,a3@(28)
	addw #16,sp
L105:
	cmpl a4,d3
	jeq L106
	movel a4,sp@-
	movel d3,sp@-
	jbsr _emit_move_insn
L106:
	moveml a6@(-32),#0x1c7c
	unlk a6
	rts
	.even
.globl _emit_clr_insn
_emit_clr_insn:
	link a6,#0
	movel _const0_rtx,sp@-
	movel a6@(8),sp@-
	jbsr _emit_move_insn
	unlk a6
	rts
	.even
.globl _emit_0_to_1_insn
_emit_0_to_1_insn:
	link a6,#0
	movel _const1_rtx,sp@-
	movel a6@(8),sp@-
	jbsr _emit_move_insn
	unlk a6
	rts
LC0:
	.ascii "bcmp\0"
	.even
.globl _emit_cmp_insn
_emit_cmp_insn:
	link a6,#0
	moveml #0x3c3c,sp@-
	movel a6@(8),a3
	movel a6@(12),a4
	movel a6@(16),d2
	movel a6@(20),d5
	clrl d3
	moveb a3@(2),d3
	lea _mode_class,a0
	movel a0@(d3:l:4),d4
	tstl d3
	jne L110
	clrl d3
	moveb a4@(2),d3
L110:
	moveq #26,d1
	cmpl d3,d1
	jeq L111
	tstl _flag_force_mem
	jeq L111
	movel a3,sp@-
	lea _force_not_mem,a2
	jbsr a2@
	movel d0,a3
	movel a4,sp@-
	jbsr a2@
	movel d0,a4
	addqw #8,sp
L111:
	moveq #26,d1
	cmpl d3,d1
	jne L112
	jbsr _emit_queue
	clrl sp@-
	movel a3,sp@-
	lea _protect_from_queue,a2
	jbsr a2@
	movel d0,a3
	clrl sp@-
	movel a4,sp@-
	jbsr a2@
	movel d0,a4
	addw #16,sp
	tstl d2
	jne L113
	jbsr _abort
L113:
	pea 4:w
	movel d2,sp@-
	pea 4:w
	movel a4,sp@-
	pea 4:w
	movel a3,sp@-
	pea 3:w
	pea 4:w
	pea LC0
	pea 4:w
	pea 39:w
	jbsr _gen_rtx
	addw #12,sp
	movel d0,sp@-
	jbsr _emit_library_call
	addw #36,sp
	jra L129
L112:
	cmpl _const0_rtx,a4
	jeq L115
	cmpl _fconst0_rtx,a4
	jeq L115
	cmpl _dconst0_rtx,a4
	jne L114
L115:
	movel _tst_optab,a0
	cmpl #246,a0@(4,d3:l:8)
	jeq L114
	movel a0@(4,d3:l:8),a5
	jbsr _emit_queue
	clrl sp@-
	movel a3,sp@-
	lea _protect_from_queue,a2
	jbsr a2@
	movel d0,a3
	clrl sp@-
	movel a4,sp@-
	jbsr a2@
	lea _insn_operand_predicate,a0
	lea a5@(a5:l:4),a1
	movel a1,d0
	movel d0,d2
	asll #2,d2
	lea _insn_operand_mode,a2
	movel a2@(d2:l),sp@-
	movel a3,sp@-
	movel a0@(d2:l),a0
	jbsr a0@
	addw #24,sp
	tstl d0
	jne L116
	movel a3,sp@-
	movel a2@(d2:l),sp@-
	jbsr _force_reg
	movel d0,a3
	addqw #8,sp
L116:
	lea _insn_gen_function,a0
	movel a3,sp@-
	movel a0@(a5:l:4),a0
	jbsr a0@
	jra L140
L114:
	movel _cmp_optab,a0
	cmpl #246,a0@(4,d3:l:8)
	jeq L117
	movel a0@(4,d3:l:8),a5
	jbsr _emit_queue
	clrl sp@-
	movel a3,sp@-
	lea _protect_from_queue,a2
	jbsr a2@
	movel d0,a3
	clrl sp@-
	movel a4,sp@-
	jbsr a2@
	movel d0,a4
	lea _insn_operand_predicate,a0
	lea a5@(a5:l:4),a1
	movel a1,d0
	movel d0,d2
	asll #2,d2
	lea _insn_operand_mode,a2
	movel a2@(d2:l),sp@-
	movel a3,sp@-
	movel a0@(d2:l),a0
	jbsr a0@
	addw #24,sp
	tstl d0
	jne L118
	movel a3,sp@-
	movel a2@(d2:l),sp@-
	jbsr _force_reg
	movel d0,a3
	addqw #8,sp
L118:
	lea _insn_operand_predicate,a0
	lea a5@(a5:l:4),a1
	movel a1,d0
	movel d0,d2
	asll #2,d2
	lea _insn_operand_mode,a2
	movel a2@(4,d2:l),sp@-
	movel a4,sp@-
	movel a0@(4,d2:l),a0
	jbsr a0@
	addqw #8,sp
	tstl d0
	jne L119
	movel a4,sp@-
	movel a2@(4,d2:l),sp@-
	jbsr _force_reg
	movel d0,a4
	addqw #8,sp
L119:
	lea _insn_gen_function,a0
	movel a4,sp@-
	movel a3,sp@-
	movel a0@(a5:l:4),a0
	jbsr a0@
L140:
	movel d0,sp@-
	jbsr _emit_insn
	jra L109
L117:
	moveq #1,d1
	cmpl d4,d1
	jeq L121
	moveq #2,d1
	cmpl d4,d1
	jne L120
L121:
	movel d3,d2
	jra L124
L126:
	lea _mode_class,a0
	cmpl a0@(d2:l:4),d4
	jne L120
	movel _cmp_optab,a0
	cmpl #246,a0@(4,d2:l:8)
	jeq L124
	movel d5,sp@-
	movel a3,sp@-
	movel d2,sp@-
	lea _convert_to_mode,a2
	jbsr a2@
	movel d0,a3
	movel d5,sp@-
	movel a4,sp@-
	movel d2,sp@-
	jbsr a2@
	movel d0,a4
	movel d5,sp@-
	clrl sp@-
	movel a4,sp@-
	movel a3,sp@-
	jbsr _emit_cmp_insn
	jra L109
L124:
	addql #1,d2
	moveq #27,d1
	cmpl d2,d1
	jge L126
L120:
	movel _cmp_optab,a0
	tstl a0@(8,d3:l:8)
	jeq L127
	movel a0@(8,d3:l:8),d0
	tstl d5
	jeq L128
	movel _ucmp_optab,a0
	tstl a0@(8,d3:l:8)
	jeq L128
	movel a0@(8,d3:l:8),d0
L128:
	movel d3,sp@-
	movel a4,sp@-
	movel d3,sp@-
	movel a3,sp@-
	pea 2:w
	pea 4:w
	movel d0,sp@-
	pea 4:w
	pea 39:w
	jbsr _gen_rtx
	addw #12,sp
	movel d0,sp@-
	jbsr _emit_library_call
	lea _mode_class,a0
	addw #28,sp
	moveq #1,d1
	cmpl a0@(d3:l:4),d1
	jne L129
	clrl sp@-
	movel d5,sp@-
	clrl sp@-
	movel _const1_rtx,sp@-
	jra L141
L129:
	clrl sp@-
	clrl sp@-
	clrl sp@-
	movel _const0_rtx,sp@-
L141:
	pea 4:w
	jbsr _hard_libcall_value
	addqw #4,sp
	movel d0,sp@-
	jbsr _emit_cmp_insn
	jra L109
L127:
	moveq #2,d1
	cmpl d4,d1
	jne L131
	movel d3,d2
	addql #1,d2
	moveq #27,d1
	cmpl d2,d1
	jlt L109
L137:
	lea _mode_class,a0
	cmpl a0@(d2:l:4),d4
	jne L109
	movel _cmp_optab,a0
	cmpl #246,a0@(4,d2:l:8)
	jne L136
	tstl a0@(8,d2:l:8)
	jeq L134
L136:
	movel d5,sp@-
	movel a3,sp@-
	movel d2,sp@-
	lea _convert_to_mode,a2
	jbsr a2@
	movel d0,a3
	movel d5,sp@-
	movel a4,sp@-
	movel d2,sp@-
	jbsr a2@
	movel d0,a4
	movel d5,sp@-
	clrl sp@-
	movel a4,sp@-
	movel a3,sp@-
	jbsr _emit_cmp_insn
	addw #40,sp
L134:
	addql #1,d2
	moveq #27,d1
	cmpl d2,d1
	jge L137
	jra L109
L131:
	jbsr _abort
L109:
	moveml a6@(-32),#0x3c3c
	unlk a6
	rts
	.even
.globl _gen_add2_insn
_gen_add2_insn:
	link a6,#0
	movel a6@(8),a0
	movel _add_optab,a1
	clrl d0
	moveb a0@(2),d0
	movel a1@(4,d0:l:8),d0
	lea _insn_gen_function,a1
	movel a6@(12),sp@-
	movel a0,sp@-
	movel a0,sp@-
	movel a1@(d0:l:4),a0
	jbsr a0@
	unlk a6
	rts
	.even
.globl _have_add2_insn
_have_add2_insn:
	link a6,#0
	movel _add_optab,a0
	movel a6@(8),d1
	cmpl #246,a0@(4,d1:l:8)
	sne d0
	moveq #1,d1
	andl d1,d0
	unlk a6
	rts
	.even
.globl _gen_sub2_insn
_gen_sub2_insn:
	link a6,#0
	movel a6@(8),a0
	movel _sub_optab,a1
	clrl d0
	moveb a0@(2),d0
	movel a1@(4,d0:l:8),d0
	lea _insn_gen_function,a1
	movel a6@(12),sp@-
	movel a0,sp@-
	movel a0,sp@-
	movel a1@(d0:l:4),a0
	jbsr a0@
	unlk a6
	rts
	.even
.globl _have_sub2_insn
_have_sub2_insn:
	link a6,#0
	movel _add_optab,a0
	movel a6@(8),d1
	cmpl #246,a0@(4,d1:l:8)
	sne d0
	moveq #1,d1
	andl d1,d0
	unlk a6
	rts
	.even
.globl _gen_move_insn
_gen_move_insn:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	movel a6@(12),a1
	clrl d0
	moveb a2@(2),d0
	tstl d0
	jne L147
	clrl d0
	moveb a1@(2),d0
L147:
	movel _mov_optab,a0
	movel a0@(4,d0:l:8),d0
	lea _insn_gen_function,a0
	movel a1,sp@-
	movel a2,sp@-
	movel a0@(d0:l:4),a0
	jbsr a0@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
_can_fix_p:
	link a6,#0
	moveml #0x3f00,sp@-
	movel a6@(8),d4
	movel a6@(12),d2
	movel a6@(16),d6
	movel a6@(20),a1
	clrl a1@
	moveq #10,d7
	cmpl d2,d7
	sne d0
	moveq #1,d7
	andl d7,d0
	movel #_fixtrunctab,d5
	asll #4,d0
	moveq #6,d7
	cmpl d4,d7
	seq d1
	moveq #1,d7
	andl d7,d1
	movel d5,a0
	addl d0,a0
	movel d6,d3
	asll #2,d3
	lea a0@(d1:l:8),a0
	cmpl #246,a0@(d3:l)
	jeq L149
	moveq #10,d7
	cmpl d2,d7
	sne d0
	moveq #1,d7
	andl d7,d0
	asll #4,d0
	moveq #6,d7
	cmpl d4,d7
	seq d1
	moveq #1,d7
	andl d7,d1
	movel d5,a0
	addl d0,a0
	lea a0@(d1:l:8),a0
	movel a0@(d3:l),d0
	jra L148
L149:
	movel _ftrunc_optab,a0
	cmpl #246,a0@(4,d2:l:8)
	jeq L150
	moveq #1,d7
	movel d7,a1@
	moveq #10,d7
	cmpl d2,d7
	sne d0
	moveq #1,d7
	andl d7,d0
	asll #4,d0
	moveq #6,d7
	cmpl d4,d7
	seq d1
	moveq #1,d7
	andl d7,d1
	lea _fixtab,a0
	addl d0,a0
	lea a0@(d1:l:8),a0
	movel a0@(d6:l:4),d0
	jra L148
L150:
	movel #246,d0
L148:
	moveml a6@(-24),#0xfc
	unlk a6
	rts
	.even
_can_float_p:
	link a6,#0
	movel d2,sp@-
	moveq #10,d2
	cmpl a6@(8),d2
	sne d0
	moveq #1,d2
	andl d2,d0
	moveq #6,d2
	cmpl a6@(12),d2
	seq d1
	moveq #1,d2
	andl d2,d1
	asll #3,d0
	lea _floattab,a0
	addl d0,a0
	movel a0@(d1:l:4),d0
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _init_fixtab
_init_fixtab:
	link a6,#0
	lea _fixtab,a0
	movel #_fixtab+32,d0
	jra L153
L156:
	movel #246,a0@+
L153:
	cmpl a0,d0
	jhi L156
	lea _fixtrunctab,a0
	movel #_fixtrunctab+32,d0
	jra L157
L160:
	movel #246,a0@+
L157:
	cmpl a0,d0
	jhi L160
	btst #1,_target_flags+3
	jeq L161
	moveq #72,d1
	movel d1,_fixtab
L161:
	btst #1,_target_flags+3
	jeq L162
	moveq #75,d1
	movel d1,_fixtab+16
L162:
	btst #6,_target_flags+3
	jeq L163
	moveq #76,d1
	movel d1,_fixtrunctab
L163:
	btst #6,_target_flags+3
	jeq L164
	moveq #77,d1
	movel d1,_fixtrunctab+16
L164:
	unlk a6
	rts
	.even
.globl _init_floattab
_init_floattab:
	link a6,#0
	lea _floattab,a0
	movel #_floattab+16,d0
	jra L166
L169:
	movel #246,a0@+
L166:
	cmpl a0,d0
	jhi L169
	btst #1,_target_flags+3
	jne L171
	btst #6,_target_flags+3
	jeq L170
L171:
	moveq #58,d1
	movel d1,_floattab
L170:
	btst #1,_target_flags+3
	jne L173
	btst #6,_target_flags+3
	jeq L172
L173:
	moveq #61,d1
	movel d1,_floattab+8
L172:
	unlk a6
	rts
LC1:
	.ascii "__floatsidf\0"
LC2:
	.ascii "__floatdidf\0"
	.even
.globl _expand_float
_expand_float:
	link a6,#0
	moveml #0x383c,sp@-
	movel a6@(8),a5
	movel a6@(12),a4
	movel a6@(16),d3
	pea 1:w
	movel a5,sp@-
	lea _protect_from_queue,a2
	jbsr a2@
	movel d0,a5
	movel a5,a3
	clrl sp@-
	movel a4,sp@-
	jbsr a2@
	movel d0,a4
	addw #16,sp
	tstl _flag_force_mem
	jeq L175
	movel a4,sp@-
	jbsr _force_not_mem
	movel d0,a4
	addqw #4,sp
L175:
	tstl d3
	jeq L176
	cmpw #34,a3@
	jeq L176
	clrl d0
	moveb a3@(2),d0
	movel d0,sp@-
	jbsr _gen_reg_rtx
	movel d0,a3
	addqw #4,sp
L176:
	clrl d0
	moveb a4@(2),d0
	movel d0,sp@-
	clrl d0
	moveb a3@(2),d0
	movel d0,sp@-
	jbsr _can_float_p
	movel d0,d2
	addqw #8,sp
	cmpl #246,d2
	jne L197
	cmpb #10,a3@(2)
	jne L179
	pea 11:w
	clrl d0
	moveb a4@(2),d0
	movel d0,sp@-
	jbsr _can_float_p
	movel d0,d2
	addqw #8,sp
	cmpl #246,d2
	jne L198
L179:
	cmpb #6,a4@(2)
	jeq L181
	pea 6:w
	clrl d0
	moveb a3@(2),d0
	movel d0,sp@-
	lea _can_float_p,a2
	jbsr a2@
	addqw #8,sp
	cmpl #246,d0
	jne L182
	pea 6:w
	pea 11:w
	jbsr a2@
	addqw #8,sp
	cmpl #246,d0
	jeq L181
L182:
	pea 6:w
	jbsr _gen_reg_rtx
	movel d0,d2
	movel d3,sp@-
	movel a4,sp@-
	movel d2,sp@-
	jbsr _convert_move
	movel d2,a4
	clrl d3
	clrl d0
	moveb a4@(2),d0
	movel d0,sp@-
	clrl d0
	moveb a3@(2),d0
	movel d0,sp@-
	jbsr _can_float_p
	movel d0,d2
	addw #24,sp
	cmpl #246,d2
	jeq L183
L197:
	pea 82:w
	movel a4,sp@-
	movel a3,sp@-
	movel d2,sp@-
	jbsr _emit_unop_insn
	addw #16,sp
	jra L178
L183:
	pea 6:w
	pea 11:w
	jbsr _can_float_p
	movel d0,d2
	addqw #8,sp
	cmpl #246,d2
	jeq L178
L198:
	pea 11:w
	jbsr _gen_reg_rtx
	movel d0,a3
	pea 82:w
	movel a4,sp@-
	movel a3,sp@-
	movel d2,sp@-
	jbsr _emit_unop_insn
	addw #20,sp
	jra L178
L181:
	clrl d0
	moveb a4@(2),d0
	lea _mode_size,a0
	movel a0@(d0:l:4),d4
	cmpl a0@(16),d4
	jge L187
	movel d3,sp@-
	movel a4,sp@-
	pea 4:w
	jbsr _convert_to_mode
	movel d0,a4
	clrl d3
	addw #12,sp
L187:
	clrl d0
	moveb a4@(2),d0
	movel d0,sp@-
	movel a4,sp@-
	pea 1:w
	pea 11:w
	cmpb #4,a4@(2)
	jne L188
	movel #LC1,d0
	jra L189
L188:
	movel #LC2,d0
L189:
	movel d0,sp@-
	pea 4:w
	pea 39:w
	jbsr _gen_rtx
	addw #12,sp
	movel d0,sp@-
	jbsr _emit_library_call
	pea 11:w
	jbsr _hard_libcall_value
	movel d0,sp@-
	jbsr _copy_to_reg
	movel d0,a3
	addw #28,sp
L178:
	tstl d3
	jeq L190
	jbsr _gen_label_rtx
	movel d0,d3
	jbsr _do_pending_stack_adjust
	clrl sp@-
	clrl sp@-
	clrl sp@-
	cmpb #11,a3@(2)
	jne L191
	movel _dconst0_rtx,d0
	jra L192
L191:
	movel _fconst0_rtx,d0
L192:
	movel d0,sp@-
	movel a3,sp@-
	jbsr _emit_cmp_insn
	movel d3,sp@-
	jbsr _gen_bge
	movel d0,sp@-
	jbsr _emit_jump_insn
	clrl d0
	moveb a4@(2),d0
	lea _mode_size,a0
	movel a0@(d0:l:4),d4
	asll #3,d4
	movel d4,sp@-
	movel #1072693248,sp@-
	clrl sp@-
	jbsr _ldexp
	addw #40,sp
	pea 3:w
	clrl sp@-
	movel a3,sp@-
	clrl d2
	moveb a3@(2),d2
	movel d2,sp@-
	movel d1,sp@-
	movel d0,sp@-
	jbsr _immed_real_const_1
	addw #12,sp
	movel d0,sp@-
	movel a3,sp@-
	movel _add_optab,sp@-
	clrl d0
	moveb a3@(2),d0
	movel d0,sp@-
	jbsr _expand_binop
	addw #28,sp
	cmpl d0,a3
	jeq L193
	movel d0,sp@-
	movel a3,sp@-
	jbsr _emit_move_insn
	addqw #8,sp
L193:
	jbsr _do_pending_stack_adjust
	movel d3,sp@-
	jbsr _emit_label
	addqw #4,sp
L190:
	cmpl a3,a5
	jeq L194
	moveb a5@(2),d4
	cmpb a3@(2),d4
	jne L195
	movel a3,sp@-
	movel a5,sp@-
	jbsr _emit_move_insn
	jra L194
L195:
	clrl sp@-
	movel a3,sp@-
	movel a5,sp@-
	jbsr _convert_move
L194:
	moveml a6@(-28),#0x3c1c
	unlk a6
	rts
	.even
_ftruncify:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	clrl d0
	moveb a2@(2),d0
	movel d0,sp@-
	jbsr _gen_reg_rtx
	clrl sp@-
	movel d0,sp@-
	movel a2,sp@-
	movel _ftrunc_optab,sp@-
	clrl d0
	moveb a2@(2),d0
	movel d0,sp@-
	jbsr _expand_unop
	movel a6@(-4),a2
	unlk a6
	rts
LC3:
	.ascii "__fixunsdfsi\0"
LC4:
	.ascii "__fixdfsi\0"
LC5:
	.ascii "__fixunsdfdi\0"
LC6:
	.ascii "__fixdfdi\0"
	.even
.globl _expand_fix
_expand_fix:
	link a6,#-4
	moveml #0x3838,sp@-
	movel a6@(8),a4
	movel a6@(12),a3
	movel a6@(16),d4
	clrl a6@(-4)
L201:
	pea a6@(-4)
	movel d4,sp@-
	clrl d0
	moveb a3@(2),d0
	movel d0,sp@-
	clrl d0
	moveb a4@(2),d0
	movel d0,sp@-
	jbsr _can_fix_p
	movel d0,d2
	addw #16,sp
	cmpl #246,d2
	jeq L203
	tstl a6@(-4)
	jeq L204
	movel a3,sp@-
	jbsr _ftruncify
	movel d0,a3
	addqw #4,sp
L204:
	pea 83:w
	movel a3,sp@-
	movel a4,sp@-
	movel d2,sp@-
	jbsr _emit_unop_insn
	jra L200
L203:
	pea a6@(-4)
	movel d4,sp@-
	clrl d0
	moveb a3@(2),d0
	movel d0,sp@-
	pea 6:w
	jbsr _can_fix_p
	movel d0,d2
	addw #16,sp
	cmpb #6,a4@(2)
	jeq L205
	cmpl #246,d2
	jeq L205
	pea 6:w
	jbsr _gen_reg_rtx
	movel d0,d3
	addqw #4,sp
	tstl a6@(-4)
	jeq L206
	movel a3,sp@-
	jbsr _ftruncify
	movel d0,a3
	addqw #4,sp
L206:
	pea 83:w
	movel a3,sp@-
	movel d3,sp@-
	movel d2,sp@-
	jbsr _emit_unop_insn
	movel d4,sp@-
	movel d3,sp@-
	jra L217
L205:
	cmpb #11,a3@(2)
	jeq L202
	clrl sp@-
	movel a3,sp@-
	pea 11:w
	jbsr _convert_to_mode
	movel d0,a3
	addw #12,sp
	jra L201
L202:
	pea 1:w
	movel a4,sp@-
	lea _protect_from_queue,a2
	jbsr a2@
	movel d0,a4
	clrl sp@-
	movel a3,sp@-
	jbsr a2@
	movel d0,a3
	addw #16,sp
	tstl _flag_force_mem
	jeq L208
	movel a3,sp@-
	jbsr _force_not_mem
	movel d0,a3
	addqw #4,sp
L208:
	cmpb #6,a4@(2)
	jeq L209
	pea 11:w
	movel a3,sp@-
	pea 1:w
	pea 4:w
	tstl d4
	jeq L210
	movel #LC3,d0
	jra L211
L210:
	movel #LC4,d0
L211:
	movel d0,sp@-
	pea 4:w
	pea 39:w
	jbsr _gen_rtx
	addw #12,sp
	movel d0,sp@-
	jbsr _emit_library_call
	pea 4:w
	jra L218
L209:
	pea 11:w
	movel a3,sp@-
	pea 1:w
	pea 6:w
	tstl d4
	jeq L213
	movel #LC5,d0
	jra L214
L213:
	movel #LC6,d0
L214:
	movel d0,sp@-
	pea 4:w
	pea 39:w
	jbsr _gen_rtx
	addw #12,sp
	movel d0,sp@-
	jbsr _emit_library_call
	pea 6:w
L218:
	jbsr _hard_libcall_value
	movel d0,a0
	addw #24,sp
	moveb a4@(2),d1
	cmpb a0@(2),d1
	jne L215
	movel a0,sp@-
	movel a4,sp@-
	jbsr _emit_move_insn
	jra L200
L215:
	clrl sp@-
	movel a0,sp@-
L217:
	movel a4,sp@-
	jbsr _convert_move
L200:
	moveml a6@(-28),#0x1c1c
	unlk a6
	rts
	.even
_init_optab:
	link a6,#0
	pea 228:w
	jbsr _malloc
	movel d0,a0
	movel a6@(8),a0@
	clrl d0
L223:
	movel #246,a0@(4,d0:l:8)
	clrl a0@(8,d0:l:8)
	addql #1,d0
	moveq #27,d1
	cmpl d0,d1
	jge L223
	movel a0,d0
	unlk a6
	rts
LC7:
	.ascii "__adddi3\0"
LC8:
	.ascii "__addsf3\0"
LC9:
	.ascii "__adddf3\0"
LC10:
	.ascii "__subdi3\0"
LC11:
	.ascii "__subsf3\0"
LC12:
	.ascii "__subdf3\0"
LC13:
	.ascii "__mulsi3\0"
LC14:
	.ascii "__muldi3\0"
LC15:
	.ascii "__mulsf3\0"
LC16:
	.ascii "__muldf3\0"
LC17:
	.ascii "__umulsi3\0"
LC18:
	.ascii "__umuldi3\0"
LC19:
	.ascii "__umulsf3\0"
LC20:
	.ascii "__umuldf3\0"
LC21:
	.ascii "__divsi3\0"
LC22:
	.ascii "__divdi3\0"
LC23:
	.ascii "__udivsi3\0"
LC24:
	.ascii "__udivdi3\0"
LC25:
	.ascii "__modsi3\0"
LC26:
	.ascii "__moddi3\0"
LC27:
	.ascii "__umodsi3\0"
LC28:
	.ascii "__umoddi3\0"
LC29:
	.ascii "__divsf3\0"
LC30:
	.ascii "__divdf3\0"
LC31:
	.ascii "__anddi3\0"
LC32:
	.ascii "__andcbdi3\0"
LC33:
	.ascii "__iordi3\0"
LC34:
	.ascii "__xordi3\0"
LC35:
	.ascii "__ashlsi3\0"
LC36:
	.ascii "__ashldi3\0"
LC37:
	.ascii "__ashrsi3\0"
LC38:
	.ascii "__ashrdi3\0"
LC39:
	.ascii "__lshlsi3\0"
LC40:
	.ascii "__lshldi3\0"
LC41:
	.ascii "__lshrsi3\0"
LC42:
	.ascii "__lshrdi3\0"
LC43:
	.ascii "__rotlsi3\0"
LC44:
	.ascii "__rotldi3\0"
LC45:
	.ascii "__rotrsi3\0"
LC46:
	.ascii "__rotrdi3\0"
LC47:
	.ascii "__negsi2\0"
LC48:
	.ascii "__negdi2\0"
LC49:
	.ascii "__negsf2\0"
LC50:
	.ascii "__negdf2\0"
LC51:
	.ascii "__one_cmplsi2\0"
LC52:
	.ascii "__one_cmpldi2\0"
LC53:
	.ascii "ffs\0"
LC54:
	.ascii "__cmpdi2\0"
LC55:
	.ascii "__ucmpdi2\0"
LC56:
	.ascii "__cmpsf2\0"
LC57:
	.ascii "__cmpdf2\0"
	.even
.globl _init_optabs
_init_optabs:
	link a6,#0
	movel a2,sp@-
	jbsr _init_fixtab
	jbsr _init_floattab
	jbsr _init_comparisons
	pea 44:w
	lea _init_optab,a2
	jbsr a2@
	movel d0,_add_optab
	pea 45:w
	jbsr a2@
	movel d0,_sub_optab
	pea 47:w
	jbsr a2@
	movel d0,_smul_optab
	pea 50:w
	jbsr a2@
	movel d0,_umul_optab
	pea 47:w
	jbsr a2@
	movel d0,_smul_widen_optab
	pea 50:w
	jbsr a2@
	movel d0,_umul_widen_optab
	pea 48:w
	jbsr a2@
	movel d0,_sdiv_optab
	clrl sp@-
	jbsr a2@
	movel d0,_sdivmod_optab
	addw #32,sp
	pea 51:w
	jbsr a2@
	movel d0,_udiv_optab
	clrl sp@-
	jbsr a2@
	movel d0,_udivmod_optab
	pea 49:w
	jbsr a2@
	movel d0,_smod_optab
	pea 52:w
	jbsr a2@
	movel d0,_umod_optab
	pea 48:w
	jbsr a2@
	movel d0,_flodiv_optab
	clrl sp@-
	jbsr a2@
	movel d0,_ftrunc_optab
	pea 53:w
	jbsr a2@
	movel d0,_and_optab
	clrl sp@-
	jbsr a2@
	movel d0,_andcb_optab
	addw #32,sp
	pea 54:w
	jbsr a2@
	movel d0,_ior_optab
	pea 55:w
	jbsr a2@
	movel d0,_xor_optab
	pea 58:w
	jbsr a2@
	movel d0,_ashl_optab
	pea 60:w
	jbsr a2@
	movel d0,_ashr_optab
	pea 57:w
	jbsr a2@
	movel d0,_lshl_optab
	pea 61:w
	jbsr a2@
	movel d0,_lshr_optab
	pea 59:w
	jbsr a2@
	movel d0,_rotl_optab
	pea 62:w
	jbsr a2@
	movel d0,_rotr_optab
	addw #32,sp
	clrl sp@-
	jbsr a2@
	movel d0,_mov_optab
	clrl sp@-
	jbsr a2@
	movel d0,_movstrict_optab
	clrl sp@-
	jbsr a2@
	movel d0,_cmp_optab
	clrl sp@-
	jbsr a2@
	movel d0,_ucmp_optab
	clrl sp@-
	jbsr a2@
	movel d0,_tst_optab
	pea 46:w
	jbsr a2@
	movel d0,_neg_optab
	pea 86:w
	jbsr a2@
	movel d0,_abs_optab
	pea 56:w
	jbsr a2@
	movel d0,_one_cmpl_optab
	addw #32,sp
	pea 88:w
	jbsr a2@
	movel d0,_ffs_optab
	movel _add_optab,a0
	moveq #82,d1
	movel d1,a0@(12)
	moveq #80,d1
	movel d1,a0@(20)
	moveq #78,d1
	movel d1,a0@(36)
	btst #1,_target_flags+3
	jne L229
	btst #6,_target_flags+3
	jeq L228
L229:
	movel _add_optab,a0
	moveq #87,d1
	movel d1,a0@(84)
L228:
	btst #1,_target_flags+3
	jne L231
	btst #6,_target_flags+3
	jeq L230
L231:
	movel _add_optab,a0
	moveq #84,d1
	movel d1,a0@(92)
L230:
	movel _add_optab,a0
	movel #LC7,a0@(56)
	movel #LC8,a0@(88)
	movel #LC9,a0@(96)
	movel _sub_optab,a0
	moveq #94,d1
	movel d1,a0@(12)
	moveq #92,d1
	movel d1,a0@(20)
	moveq #90,d1
	movel d1,a0@(36)
	btst #1,_target_flags+3
	jne L236
	btst #6,_target_flags+3
	jeq L235
L236:
	movel _sub_optab,a0
	moveq #99,d1
	movel d1,a0@(84)
L235:
	btst #1,_target_flags+3
	jne L238
	btst #6,_target_flags+3
	jeq L237
L238:
	movel _sub_optab,a0
	moveq #96,d1
	movel d1,a0@(92)
L237:
	movel _sub_optab,a0
	movel #LC10,a0@(56)
	movel #LC11,a0@(88)
	movel #LC12,a0@(96)
	movel _smul_optab,a0
	moveq #102,d1
	movel d1,a0@(20)
	btst #0,_target_flags+3
	jeq L240
	moveq #104,d1
	movel d1,a0@(36)
L240:
	btst #1,_target_flags+3
	jne L242
	btst #6,_target_flags+3
	jeq L241
L242:
	movel _smul_optab,a0
	moveq #111,d1
	movel d1,a0@(84)
L241:
	btst #1,_target_flags+3
	jne L244
	btst #6,_target_flags+3
	jeq L243
L244:
	movel _smul_optab,a0
	moveq #108,d1
	movel d1,a0@(92)
L243:
	movel _smul_optab,a0
	movel #LC13,a0@(40)
	movel #LC14,a0@(56)
	movel #LC15,a0@(88)
	movel #LC16,a0@(96)
	movel _smul_widen_optab,a0
	moveq #103,d1
	movel d1,a0@(36)
	movel _umul_optab,a0
	moveq #105,d1
	movel d1,a0@(20)
	btst #0,_target_flags+3
	jeq L247
	moveq #107,d1
	movel d1,a0@(36)
L247:
	movel _umul_optab,a0
	movel #LC17,a0@(40)
	movel #LC18,a0@(56)
	movel #LC19,a0@(88)
	movel #LC20,a0@(96)
	movel _umul_widen_optab,a0
	moveq #106,d1
	movel d1,a0@(36)
	movel _sdiv_optab,a0
	moveq #114,d1
	movel d1,a0@(20)
	btst #0,_target_flags+3
	jeq L250
	moveq #116,d1
	movel d1,a0@(36)
L250:
	movel _sdiv_optab,a0
	movel #LC21,a0@(40)
	movel #LC22,a0@(56)
	movel _udiv_optab,a0
	moveq #117,d1
	movel d1,a0@(20)
	btst #0,_target_flags+3
	jeq L252
	moveq #119,d1
	movel d1,a0@(36)
L252:
	movel _udiv_optab,a0
	movel #LC23,a0@(40)
	movel #LC24,a0@(56)
	btst #0,_target_flags+3
	jeq L253
	movel _sdivmod_optab,a0
	movel #130,a0@(36)
L253:
	btst #0,_target_flags+3
	jeq L254
	movel _udivmod_optab,a0
	movel #131,a0@(36)
L254:
	movel _smod_optab,a0
	moveq #126,d1
	movel d1,a0@(20)
	movel #LC25,a0@(40)
	movel #LC26,a0@(56)
	movel _umod_optab,a0
	movel #128,a0@(20)
	movel #LC27,a0@(40)
	movel #LC28,a0@(56)
	btst #1,_target_flags+3
	jne L258
	btst #6,_target_flags+3
	jeq L257
L258:
	movel _flodiv_optab,a0
	moveq #123,d1
	movel d1,a0@(84)
L257:
	btst #1,_target_flags+3
	jne L260
	btst #6,_target_flags+3
	jeq L259
L260:
	movel _flodiv_optab,a0
	moveq #120,d1
	movel d1,a0@(92)
L259:
	movel _flodiv_optab,a0
	movel #LC29,a0@(88)
	movel #LC30,a0@(96)
	btst #1,_target_flags+3
	jeq L261
	movel _ftrunc_optab,a0
	moveq #69,d1
	movel d1,a0@(84)
L261:
	btst #1,_target_flags+3
	jeq L262
	movel _ftrunc_optab,a0
	moveq #68,d1
	movel d1,a0@(92)
L262:
	movel _and_optab,a0
	movel #134,a0@(12)
	movel #133,a0@(20)
	movel #132,a0@(36)
	movel #LC31,a0@(56)
	movel _andcb_optab,a0
	movel #LC32,a0@(56)
	movel _ior_optab,a0
	movel #139,a0@(12)
	movel #138,a0@(20)
	movel #137,a0@(36)
	movel #LC33,a0@(56)
	movel _xor_optab,a0
	movel #142,a0@(12)
	movel #141,a0@(20)
	movel #140,a0@(36)
	movel #LC34,a0@(56)
	movel _ashl_optab,a0
	movel #169,a0@(12)
	movel #168,a0@(20)
	movel #167,a0@(36)
	movel #LC35,a0@(40)
	movel #LC36,a0@(56)
	movel _ashr_optab,a0
	movel #172,a0@(12)
	movel #171,a0@(20)
	movel #170,a0@(36)
	movel #LC37,a0@(40)
	movel #LC38,a0@(56)
	movel _lshl_optab,a0
	movel #175,a0@(12)
	movel #174,a0@(20)
	movel #173,a0@(36)
	movel #LC39,a0@(40)
	movel #LC40,a0@(56)
	movel _lshr_optab,a0
	movel #178,a0@(12)
	movel #177,a0@(20)
	movel #176,a0@(36)
	movel #LC41,a0@(40)
	movel #LC42,a0@(56)
	movel _rotl_optab,a0
	movel #181,a0@(12)
	movel #180,a0@(20)
	movel #179,a0@(36)
	movel #LC43,a0@(40)
	movel #LC44,a0@(56)
	movel _rotr_optab,a0
	movel #184,a0@(12)
	movel #183,a0@(20)
	movel #182,a0@(36)
	movel #LC45,a0@(40)
	movel #LC46,a0@(56)
	movel _neg_optab,a0
	movel #145,a0@(12)
	movel #144,a0@(20)
	movel #143,a0@(36)
	btst #1,_target_flags+3
	jne L294
	btst #6,_target_flags+3
	jeq L293
L294:
	movel _neg_optab,a0
	movel #146,a0@(84)
L293:
	btst #1,_target_flags+3
	jne L296
	btst #6,_target_flags+3
	jeq L295
L296:
	movel _neg_optab,a0
	movel #149,a0@(92)
L295:
	movel _neg_optab,a0
	movel #LC47,a0@(40)
	movel #LC48,a0@(56)
	movel #LC49,a0@(88)
	movel #LC50,a0@(96)
	btst #1,_target_flags+3
	jne L298
	btst #6,_target_flags+3
	jeq L297
L298:
	movel _abs_optab,a0
	movel #152,a0@(84)
L297:
	btst #1,_target_flags+3
	jne L300
	btst #6,_target_flags+3
	jeq L299
L300:
	movel _abs_optab,a0
	movel #155,a0@(92)
L299:
	movel _one_cmpl_optab,a0
	movel #160,a0@(12)
	movel #159,a0@(20)
	movel #158,a0@(36)
	movel #LC51,a0@(40)
	movel #LC52,a0@(56)
	movel _ffs_optab,a0
	movel #LC53,a0@(40)
	movel _mov_optab,a0
	moveq #34,d1
	movel d1,a0@(12)
	moveq #32,d1
	movel d1,a0@(20)
	moveq #31,d1
	movel d1,a0@(36)
	moveq #38,d1
	movel d1,a0@(52)
	moveq #36,d1
	movel d1,a0@(84)
	moveq #37,d1
	movel d1,a0@(92)
	movel _movstrict_optab,a0
	moveq #35,d1
	movel d1,a0@(12)
	moveq #33,d1
	movel d1,a0@(20)
	movel _cmp_optab,a0
	moveq #13,d1
	movel d1,a0@(12)
	moveq #12,d1
	movel d1,a0@(20)
	moveq #11,d1
	movel d1,a0@(36)
	btst #1,_target_flags+3
	jne L316
	btst #6,_target_flags+3
	jeq L315
L316:
	movel _cmp_optab,a0
	moveq #17,d1
	movel d1,a0@(84)
L315:
	btst #1,_target_flags+3
	jne L318
	btst #6,_target_flags+3
	jeq L317
L318:
	movel _cmp_optab,a0
	moveq #14,d1
	movel d1,a0@(92)
L317:
	movel _tst_optab,a0
	moveq #4,d1
	movel d1,a0@(12)
	moveq #3,d1
	movel d1,a0@(20)
	moveq #2,d1
	movel d1,a0@(36)
	btst #1,_target_flags+3
	jne L323
	btst #6,_target_flags+3
	jeq L322
L323:
	movel _tst_optab,a0
	moveq #5,d1
	movel d1,a0@(84)
L322:
	btst #1,_target_flags+3
	jne L325
	btst #6,_target_flags+3
	jeq L324
L325:
	movel _tst_optab,a0
	moveq #8,d1
	movel d1,a0@(92)
L324:
	movel _cmp_optab,a0
	movel #LC54,a0@(56)
	movel _ucmp_optab,a1
	movel #LC55,a1@(56)
	movel #LC56,a0@(88)
	movel #LC57,a0@(96)
	lea _bcc_gen_fctn+272,a0
	movel #_gen_beq,a0@
	movel #_gen_bne,a0@(-4)
	movel #_gen_bgt,a0@(8)
	movel #_gen_bge,a0@(4)
	movel #_gen_bgtu,a0@(24)
	movel #_gen_bgeu,a0@(20)
	movel #_gen_blt,a0@(16)
	movel #_gen_ble,a0@(12)
	movel #_gen_bltu,a0@(32)
	movel #_gen_bleu,a0@(28)
	lea _setcc_gen_fctn+272,a0
	movel #_gen_seq,a0@
	movel #_gen_sne,a0@(-4)
	movel #_gen_sgt,a0@(8)
	movel #_gen_sge,a0@(4)
	movel #_gen_sgtu,a0@(24)
	movel #_gen_sgeu,a0@(20)
	movel #_gen_slt,a0@(16)
	movel #_gen_sle,a0@(12)
	movel #_gen_sltu,a0@(32)
	movel #_gen_sleu,a0@(28)
	movel a6@(-4),a2
	unlk a6
	rts
.lcomm _floattab,16
.lcomm _fixtrunctab,32
.lcomm _fixtab,32
.comm _ucmp_optab,4
.comm _setcc_gen_fctn,364
.comm _bcc_gen_fctn,364
.comm _ffs_optab,4
.comm _one_cmpl_optab,4
.comm _abs_optab,4
.comm _neg_optab,4
.comm _tst_optab,4
.comm _cmp_optab,4
.comm _movstrict_optab,4
.comm _mov_optab,4
.comm _rotr_optab,4
.comm _rotl_optab,4
.comm _lshr_optab,4
.comm _lshl_optab,4
.comm _ashr_optab,4
.comm _ashl_optab,4
.comm _xor_optab,4
.comm _ior_optab,4
.comm _andcb_optab,4
.comm _and_optab,4
.comm _ftrunc_optab,4
.comm _flodiv_optab,4
.comm _umod_optab,4
.comm _smod_optab,4
.comm _udivmod_optab,4
.comm _udiv_optab,4
.comm _sdivmod_optab,4
.comm _sdiv_optab,4
.comm _umul_widen_optab,4
.comm _smul_widen_optab,4
.comm _umul_optab,4
.comm _smul_optab,4
.comm _sub_optab,4
.comm _add_optab,4
