#NO_APP
gcc_compiled.:
.data
	.even
_in_section:
	.long 0
.text
LC0:
	.ascii ".text\0"
LC1:
	.ascii "%s\12\0"
	.even
.globl _text_section
_text_section:
	link a6,#0
	moveq #1,d1
	cmpl _in_section,d1
	jeq L2
	pea LC0
	pea LC1
	movel _asm_out_file,sp@-
	jbsr _fprintf
	moveq #1,d1
	movel d1,_in_section
L2:
	unlk a6
	rts
LC2:
	.ascii ".data\0"
	.even
.globl _data_section
_data_section:
	link a6,#0
	moveq #2,d1
	cmpl _in_section,d1
	jeq L4
	pea LC2
	pea LC1
	movel _asm_out_file,sp@-
	jbsr _fprintf
	moveq #2,d1
	movel d1,_in_section
L4:
	unlk a6
	rts
	.even
.globl _make_function_rtl
_make_function_rtl:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(8),a3
	tstl a3@(64)
	jne L8
	movel a3@(36),a0
	movel a0@(20),sp@-
	pea 4:w
	pea 39:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a3@(28),sp@-
	pea 37:w
	jbsr a2@
	movel d0,a3@(64)
L8:
	moveq #1,d1
	movel d1,_function_defined
	moveml a6@(-8),#0xc00
	unlk a6
	rts
LC3:
	.ascii "register name not specified for `%s'\0"
LC4:
	.ascii "invalid register name for `%s'\0"
LC5:
	.ascii "register name given for non-register variable `%s'\0"
LC6:
	.ascii "function declared `register'\0"
LC7:
	.ascii "data type of `%s' isn't suitable for a register\0"
LC8:
	.ascii "ANSI C forbids global register variables\0"
LC9:
	.ascii "global register variable has initial value\0"
LC10:
	.ascii "global register variable follows a function definition\0"
LC11:
	.ascii "%s.%d\0"
	.even
.globl _make_decl_rtl
_make_decl_rtl:
	link a6,#0
	moveml #0x303c,sp@-
	movel a6@(8),a5
	movel a6@(12),a4
	movel a5@(36),a0
	movel a0@(20),a3
	moveq #-1,d2
	tstl a4
	jeq L10
	cmpb #38,a4@(12)
	jeq L11
	jbsr _abort
L11:
	clrl d2
	lea _reg_names,a2
L16:
	movel a2@(d2:l:4),sp@-
	movel a4@(24),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jeq L13
	addql #1,d2
	moveq #55,d3
	cmpl d2,d3
	jge L16
L13:
	moveq #55,d3
	cmpl d2,d3
	jge L10
	movel _saveable_obstack,a2
	movel a2,a3
	movel a4@(24),sp@-
	jbsr _strlen
	movel d0,d2
	addql #2,d2
	movel d2,d0
	addl a2@(12),d0
	addqw #4,sp
	cmpl a2@(16),d0
	jls L20
	movel d2,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L20:
	addl d2,a3@(12)
	movel a2,a0
	movel a0@(8),d2
	movel a0@(12),d0
	addl a0@(24),d0
	movel a0@(24),d1
	notl d1
	andl d1,d0
	movel d0,a0@(12)
	subl a0@(4),d0
	movel a0@(16),d1
	subl a0@(4),d1
	cmpl d0,d1
	jge L22
	movel a0@(16),a0@(12)
L22:
	movel a0@(12),a0@(8)
	movel d2,a3
	moveb #42,a3@
	movel a4@(24),sp@-
	pea a3@(1)
	jbsr _strcpy
	moveq #-2,d2
	addqw #8,sp
L10:
	tstl a5@(64)
	jeq L24
	movel a5@(64),a0
	clrl d0
	moveb a0@(2),d0
	cmpl a5@(28),d0
	jeq L23
L24:
	clrl a5@(64)
	btst #5,a5@(14)
	jeq L25
	moveq #-1,d3
	cmpl d2,d3
	jne L25
	pea LC3
	movel a5,sp@-
	jbsr _error_with_decl
	addqw #8,sp
L25:
	btst #5,a5@(14)
	jeq L26
	moveq #-2,d3
	cmpl d2,d3
	jne L26
	pea LC4
	jra L55
L26:
	tstl d2
	jlt L28
	btst #5,a5@(14)
	jne L28
	pea LC5
	jra L55
L28:
	btst #5,a5@(14)
	jeq L30
	cmpb #39,a5@(12)
	jne L30
	pea LC6
	jbsr _error
	addqw #4,sp
	jra L27
L30:
	btst #5,a5@(14)
	jeq L32
	movel a5@(8),a0
	cmpb #26,a0@(28)
	jne L32
	pea LC7
L55:
	movel a5,sp@-
	jbsr _error_with_decl
	addqw #8,sp
	jra L27
L32:
	btst #5,a5@(14)
	jeq L27
	tstl _pedantic
	jeq L35
	pea LC8
	jbsr _warning
	addqw #4,sp
L35:
	tstl a5@(60)
	jeq L36
	clrl a5@(60)
	pea LC9
	jbsr _error
	addqw #4,sp
L36:
	lea _fixed_regs,a0
	tstb a0@(d2:l)
	jne L37
	tstl _function_defined
	jeq L37
	pea LC10
	jbsr _error
	addqw #4,sp
L37:
	movel d2,sp@-
	movel a5@(28),sp@-
	pea 34:w
	jbsr _gen_rtx
	movel d0,a5@(64)
	addw #12,sp
	moveq #15,d3
	cmpl d2,d3
	jge L38
	moveq #1,d1
	jra L39
L38:
	movel a5@(28),d0
	lea _mode_size,a0
	movel a0@(d0:l:4),d1
	addql #3,d1
	jpl L40
	addql #3,d1
L40:
	asrl #2,d1
L39:
	tstl d1
	jle L54
	lea _global_regs,a0
L43:
	subql #1,d1
	movel d2,d0
	addl d1,d0
	moveb #1,a0@(d0:l)
	tstl d1
	jgt L43
L54:
	jbsr _init_reg_sets_1
L27:
	tstl a5@(64)
	jne L23
	tstl a6@(16)
	jne L45
	tstb a5@(13)
	jlt L45
	tstl a4
	jne L45
	movel a3,sp@-
	lea _strlen,a2
	jbsr a2@
	addqw #4,sp
	moveq #11,d3
	addl d3,d0
	moveq #-2,d3
	andl d3,d0
	subl d0,sp
	movel sp,d2
	movel _var_labelno,sp@-
	movel a3,sp@-
	pea LC11
	movel d2,sp@-
	jbsr _sprintf
	movel _saveable_obstack,a4
	movel a4,a3
	movel d2,sp@-
	jbsr a2@
	movel d0,a2
	addl a4@(12),d0
	addql #1,d0
	addw #20,sp
	cmpl a4@(16),d0
	jls L47
	pea a2@(1)
	movel a4,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L47:
	movel a2,sp@-
	movel d2,sp@-
	movel a3@(12),sp@-
	jbsr _memcpy
	addl a3@(12),a2
	movel a2,a3@(12)
	lea a3@(12),a0
	movel a0@,a1
	clrb a1@
	addql #1,a0@
	addw #12,sp
	movel a4,a0
	movel a0@(8),d2
	movel a0@(12),d0
	addl a0@(24),d0
	movel a0@(24),d1
	notl d1
	andl d1,d0
	movel d0,a0@(12)
	subl a0@(4),d0
	movel a0@(16),d1
	subl a0@(4),d1
	cmpl d0,d1
	jge L49
	movel a0@(16),a0@(12)
L49:
	movel a0@(12),a0@(8)
	movel d2,a3
	addql #1,_var_labelno
L45:
	movel a3,sp@-
	pea 4:w
	pea 39:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a5@(28),sp@-
	pea 37:w
	jbsr a2@
	movel d0,a0
	movel a0,a5@(64)
	btst #4,a5@(13)
	jeq L50
	orb #16,a0@(3)
L50:
	btst #2,a5@(13)
	jeq L51
	movel a5@(64),a0
	orb #32,a0@(3)
L51:
	movel a5@(64),a1
	clrl d0
	movel a5@(8),a0
	cmpb #16,a0@(12)
	jeq L53
	cmpb #19,a0@(12)
	jeq L53
	cmpb #20,a0@(12)
	jne L52
L53:
	moveq #1,d0
L52:
	bfins d0,a1@(3){#4:#1}
L23:
	moveml a6@(-24),#0x3c0c
	unlk a6
	rts
LC12:
	.ascii "\11%s\12\0"
	.even
.globl _assemble_asm
_assemble_asm:
	link a6,#0
	jbsr _app_enable
	movel a6@(8),a0
	movel a0@(24),sp@-
	pea LC12
	movel _asm_out_file,sp@-
	jbsr _fprintf
	unlk a6
	rts
LC13:
	.ascii "\11.even\12\0"
LC14:
	.ascii ".globl \0"
LC15:
	.ascii "\12\0"
LC16:
	.ascii ":\12\0"
	.even
.globl _assemble_function
_assemble_function:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(8),a3
	movel a3@(64),a2
	cmpw #37,a2@
	jeq L58
	jbsr _abort
L58:
	movel a2@(4),a2
	cmpw #39,a2@
	jeq L59
	jbsr _abort
L59:
	movel a2@(4),d2
	jbsr _app_disable
	jbsr _text_section
	pea 2:w
	jbsr _floor_log2
	addqw #4,sp
	moveq #1,d1
	cmpl d0,d1
	jne L60
	pea LC13
	movel _asm_out_file,sp@-
	jbsr _fprintf
	addqw #8,sp
	jra L61
L60:
	pea 2:w
	jbsr _floor_log2
	addqw #4,sp
	tstl d0
	jeq L61
	jbsr _abort
L61:
	btst #6,a3@(13)
	jeq L63
	movel _asm_out_file,sp@-
	pea LC14
	lea _fputs,a2
	jbsr a2@
	movel d2,sp@-
	movel _asm_out_file,sp@-
	jbsr _assemble_name
	movel _asm_out_file,sp@-
	pea LC15
	jbsr a2@
	addw #24,sp
L63:
	movel d2,sp@-
	movel _asm_out_file,sp@-
	jbsr _assemble_name
	movel _asm_out_file,sp@-
	pea LC16
	jbsr _fputs
	moveml a6@(-12),#0xc04
	unlk a6
	rts
LC17:
	.ascii "\11.long \0"
	.even
.globl _assemble_integer_zero
_assemble_integer_zero:
	link a6,#0
	movel a2,sp@-
	pea LC17
	movel _asm_out_file,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel _const0_rtx,sp@-
	movel _asm_out_file,sp@-
	jbsr _output_addr_const
	pea LC15
	movel _asm_out_file,sp@-
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
LC18:
	.ascii "\11.ascii \"\0"
LC19:
	.ascii "\\%o\0"
LC20:
	.ascii "\"\12\11.ascii \"\0"
LC21:
	.ascii "\"\12\0"
	.even
.globl _assemble_string
_assemble_string:
	link a6,#0
	moveml #0x3f30,sp@-
	movel a6@(8),a3
	movel a6@(12),d7
	clrl d5
	movel #2000,d6
	cmpl d5,d7
	jle L98
L96:
	movel d7,d4
	subl d5,d4
	cmpl d4,d6
	jge L74
	movel d6,d4
L74:
	pea LC18
	movel _asm_out_file,sp@-
	jbsr _fprintf
	clrl d3
	addqw #8,sp
	cmpl d3,d4
	jle L97
	clrl d2
L95:
	moveb a3@(d3:l),d2
	moveq #34,d1
	cmpl d2,d1
	jeq L79
	moveq #92,d1
	cmpl d2,d1
	jne L78
L79:
	movel _asm_out_file,a0
	subql #1,a0@
	jmi L80
	addqw #4,a0
	movel a0@,a1
	moveb #92,a1@
	addql #1,a0@
	jra L78
L80:
	movel _asm_out_file,a0
	tstb a0@(17)
	jge L82
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L82
	movel a0@(4),a0
	moveb #92,a0@
	movel _asm_out_file,a0
	addqw #4,a0
	addql #1,a0@
	jra L78
L82:
	movel _asm_out_file,sp@-
	pea 92:w
	jbsr __flsbuf
	addqw #8,sp
L78:
	moveq #31,d1
	cmpl d2,d1
	jge L86
	moveq #126,d1
	cmpl d2,d1
	jlt L86
	movel _asm_out_file,a0
	subql #1,a0@
	jmi L87
	addqw #4,a0
	movel a0@,a1
	moveb d2,a1@
	addql #1,a0@
	jra L77
L87:
	movel _asm_out_file,a0
	tstb a0@(17)
	jge L89
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L89
	movel a0@(4),a0
	moveb d2,d0
	moveb d0,a0@
	cmpb #10,d0
	jeq L91
	movel _asm_out_file,a0
	addqw #4,a0
	addql #1,a0@
	jra L77
L91:
	movel _asm_out_file,sp@-
	movel _asm_out_file,a0
	movel a0@(4),a0
	clrl d0
	moveb a0@,d0
	movel d0,sp@-
	jbsr __flsbuf
	jra L99
L89:
	movel _asm_out_file,sp@-
	clrl d0
	moveb d2,d0
	movel d0,sp@-
	jbsr __flsbuf
	jra L99
L86:
	movel d2,sp@-
	pea LC19
	movel _asm_out_file,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel d4,d0
	subql #1,d0
	addw #12,sp
	cmpl d3,d0
	jle L77
	cmpb #47,a3@(1,d3:l)
	jls L77
	cmpb #57,a3@(1,d3:l)
	jhi L77
	pea LC20
	movel _asm_out_file,sp@-
	jbsr a2@
L99:
	addqw #8,sp
L77:
	addql #1,d3
	cmpl d3,d4
	jgt L95
L97:
	pea LC21
	movel _asm_out_file,sp@-
	jbsr _fprintf
	addl d4,d5
	addl d4,a3
	addqw #8,sp
	cmpl d5,d7
	jgt L96
L98:
	moveml a6@(-32),#0xcfc
	unlk a6
	rts
LC22:
	.ascii "storage size of static var `%s' isn't known\0"
LC23:
	.ascii ".comm \0"
LC24:
	.ascii ",%d\12\0"
LC25:
	.ascii ".lcomm \0"
LC26:
	.ascii "\11.skip %d\12\0"
	.even
.globl _assemble_variable
_assemble_variable:
	link a6,#0
	moveml #0x3c30,sp@-
	movel a6@(8),a3
	movel a6@(16),d2
	movel a3@(64),a0
	cmpw #34,a0@
	jeq L100
	tstb a3@(13)
	jlt L100
	cmpb #39,a3@(12)
	jeq L100
	tstl a3@(24)
	jne L104
	clrl sp@-
	movel a3,sp@-
	jbsr _layout_decl
	addqw #8,sp
L104:
	tstl a3@(24)
	jne L105
	movel a3@(36),a0
	movel a0@(20),sp@-
	pea LC22
	movel a3@(20),sp@-
	movel a3@(16),sp@-
	jbsr _error_with_file_and_line
	jra L100
L105:
	btst #2,a3@(14)
	jne L100
	orb #4,a3@(14)
	moveq #2,d5
	cmpl d2,d5
	jne L107
	tstl a6@(12)
	jeq L107
	clrl sp@-
	movel a3,sp@-
	jbsr _dbxout_symbol
	addqw #8,sp
L107:
	moveq #1,d5
	cmpl d2,d5
	jne L108
	movel a3@(16),sp@-
	jbsr _set_current_gdbfile
	addqw #4,sp
L108:
	movel a3@(24),a0
	btst #1,a0@(13)
	jeq L100
	jbsr _app_disable
	movel a3@(64),a0
	movel a0@(4),a0
	movel a0@(4),d4
	tstl a3@(60)
	jeq L111
	movel a3@(60),d5
	cmpl _error_mark_node,d5
	jne L110
L111:
	movel a3@(24),a0
	clrl d0
	moveb a3@(32),d0
	mulsl a0@(16),d0
	jpl L112
	addql #7,d0
L112:
	movel d0,d2
	asrl #3,d2
	jne L113
	moveq #1,d2
L113:
	addql #1,d2
	jpl L114
	addql #1,d2
L114:
	moveq #-2,d5
	andl d5,d2
	tstl _flag_shared_data
	jeq L115
	jbsr _data_section
L115:
	btst #6,a3@(13)
	jeq L116
	movel _asm_out_file,sp@-
	pea LC23
	jbsr _fputs
	movel d4,sp@-
	movel _asm_out_file,sp@-
	jbsr _assemble_name
	movel d2,sp@-
	pea LC24
	jra L137
L116:
	movel _asm_out_file,sp@-
	pea LC25
	jbsr _fputs
	movel d4,sp@-
	movel _asm_out_file,sp@-
	jbsr _assemble_name
	movel d2,sp@-
	pea LC24
	jra L137
L110:
	btst #6,a3@(13)
	jeq L118
	tstl a3@(36)
	jeq L118
	movel _asm_out_file,sp@-
	pea LC14
	lea _fputs,a2
	jbsr a2@
	movel d4,sp@-
	movel _asm_out_file,sp@-
	jbsr _assemble_name
	movel _asm_out_file,sp@-
	pea LC15
	jbsr a2@
	addw #24,sp
L118:
	tstl a3@(60)
	jeq L122
	movel a3@(60),sp@-
	jbsr _output_addressed_constants
	addqw #4,sp
L122:
	btst #2,a3@(13)
	jeq L123
	btst #4,a3@(13)
	jne L123
	jbsr _text_section
	jra L124
L123:
	jbsr _data_section
L124:
	clrl d2
	clrl d3
	jra L125
L127:
	addql #1,d2
L125:
	moveb a3@(33),d3
	movel d2,d0
	addql #1,d0
	moveq #8,d1
	asll d0,d1
	cmpl d3,d1
	jle L127
	moveq #1,d5
	cmpl d2,d5
	jne L129
	pea LC13
	movel _asm_out_file,sp@-
	jbsr _fprintf
	addqw #8,sp
	jra L130
L129:
	tstl d2
	jeq L130
	jbsr _abort
L130:
	movel d4,sp@-
	movel _asm_out_file,sp@-
	jbsr _assemble_name
	movel _asm_out_file,sp@-
	pea LC16
	jbsr _fputs
	addw #16,sp
	tstl a3@(60)
	jeq L135
	movel a3@(8),sp@-
	jbsr _int_size_in_bytes
	movel d0,sp@-
	movel a3@(60),sp@-
	jbsr _output_constant
	jra L100
L135:
	movel a3@(8),sp@-
	jbsr _int_size_in_bytes
	movel d0,sp@-
	pea LC26
L137:
	movel _asm_out_file,sp@-
	jbsr _fprintf
L100:
	moveml a6@(-24),#0xc3c
	unlk a6
	rts
	.even
.globl _assemble_external
_assemble_external:
	link a6,#0
	movel a6@(8),a1
	movel a1@(64),a0
	unlk a6
	rts
LC27:
	.ascii "_%s\0"
	.even
.globl _assemble_name
_assemble_name:
	link a6,#0
	movel a6@(8),d0
	movel a6@(12),a0
	cmpb #42,a0@
	jne L141
	movel d0,sp@-
	pea a0@(1)
	jbsr _fputs
	jra L142
L141:
	movel a0,sp@-
	pea LC27
	movel d0,sp@-
	jbsr _fprintf
L142:
	unlk a6
	rts
LC28:
	.ascii "LF\0"
LC29:
	.ascii "*%s%d\0"
	.even
.globl _assemble_static_space
_assemble_static_space:
	link a6,#-12
	moveml #0x3c30,sp@-
	movel a6@(8),d4
	addql #1,d4
	jpl L144
	addql #1,d4
L144:
	moveq #-2,d5
	andl d5,d4
	tstl _flag_shared_data
	jeq L145
	jbsr _data_section
L145:
	movel _const_labelno,sp@-
	pea LC28
	pea LC29
	moveq #-12,d2
	addl a6,d2
	movel d2,sp@-
	jbsr _sprintf
	addql #1,_const_labelno
	movel _saveable_obstack,a2
	movel a2,a3
	movel d2,sp@-
	jbsr _strlen
	movel d0,d2
	addql #2,d2
	movel d2,d0
	addl a2@(12),d0
	addw #20,sp
	cmpl a2@(16),d0
	jls L147
	movel d2,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L147:
	addl d2,a3@(12)
	movel a2,a0
	movel a0@(8),d3
	movel a0@(12),d0
	addl a0@(24),d0
	movel a0@(24),d1
	notl d1
	andl d1,d0
	movel d0,a0@(12)
	subl a0@(4),d0
	movel a0@(16),d1
	subl a0@(4),d1
	cmpl d0,d1
	jge L149
	movel a0@(16),a0@(12)
L149:
	movel a0@(12),a0@(8)
	moveq #-12,d2
	addl a6,d2
	movel d2,sp@-
	movel d3,sp@-
	jbsr _strcpy
	movel d3,sp@-
	pea 4:w
	pea 39:w
	jbsr _gen_rtx
	movel d0,d3
	movel _asm_out_file,sp@-
	pea LC25
	jbsr _fputs
	movel d2,sp@-
	movel _asm_out_file,sp@-
	jbsr _assemble_name
	addw #36,sp
	movel d4,sp@-
	pea LC24
	movel _asm_out_file,sp@-
	jbsr _fprintf
	movel d3,d0
	moveml a6@(-36),#0xc3c
	unlk a6
	rts
	.even
.globl _immed_double_const
_immed_double_const:
	link a6,#0
	moveml #0x3800,sp@-
	movel a6@(8),d2
	movel a6@(12),d1
	movel a6@(16),d3
	moveq #6,d4
	cmpl d3,d4
	jne L151
	tstl d2
	jne L151
	tstl d1
	jne L151
	movel _const0_rtx,d0
	jra L150
L151:
	movel _real_constant_chain,a0
	tstl a0
	jeq L157
	andl #255,d0
L156:
	cmpl a0@(12),d2
	jne L154
	cmpl a0@(16),d1
	jne L154
	moveb a0@(2),d0
	cmpl d0,d3
	jne L154
	movel a0,d0
	jra L150
L154:
	movel a0@(8),a0
	tstl a0
	jne L156
L157:
	movel d1,sp@-
	movel d2,sp@-
	clrl sp@-
	movel d3,sp@-
	pea 31:w
	jbsr _gen_rtx
	movel d0,a0
	movel _real_constant_chain,a0@(8)
	movel a0,_real_constant_chain
	movel _const0_rtx,a0@(4)
L150:
	moveml a6@(-12),#0x1c
	unlk a6
	rts
	.even
.globl _immed_real_const_1
_immed_real_const_1:
	link a6,#-8
	fmoved a6@(8),fp0
	movel a6@(16),d0
	fmoved fp0,a6@(-8)
	fnegx fp0,fp1
	fcmpx fp0,fp1
	fjne L159
	moveq #11,d1
	cmpl d0,d1
	jne L160
	movel _dconst0_rtx,d0
	jra L158
L160:
	movel _fconst0_rtx,d0
	jra L158
L159:
	movel d0,sp@-
	movel a6@(-4),sp@-
	movel a6@(-8),sp@-
	jbsr _immed_double_const
L158:
	unlk a6
	rts
	.even
.globl _immed_real_const
_immed_real_const:
	link a6,#0
	movel a6@(8),a0
	movel a0@(8),a1
	clrl d0
	moveb a1@(28),d0
	movel d0,sp@-
	movel a0@(24),sp@-
	movel a0@(20),sp@-
	jbsr _immed_real_const_1
	unlk a6
	rts
	.even
.globl _force_const_double_mem
_force_const_double_mem:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	movel a2@(4),d1
	cmpl _cc0_rtx,d1
	jne L170
	movel _real_constant_chain,a2@(8)
	movel a2,_real_constant_chain
	movel _const0_rtx,a2@(4)
L170:
	movel a2@(4),d1
	cmpl _const0_rtx,d1
	jne L171
	movel a2,sp@-
	clrl d0
	moveb a2@(2),d0
	movel d0,sp@-
	jbsr _force_const_mem
	movel d0,a2@(4)
	addqw #8,sp
L171:
	movel a2@(4),a0
	movel a0@(4),sp@-
	clrl d0
	moveb a2@(2),d0
	movel d0,sp@-
	jbsr _memory_address_p
	addqw #8,sp
	tstl d0
	jeq L172
	movel a2@(4),d0
	jra L169
L172:
	movel a2@(4),a0
	movel a0@(4),sp@-
	clrl d0
	moveb a2@(2),d0
	movel d0,sp@-
	pea 37:w
	jbsr _gen_rtx
L169:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _clear_const_double_mem
_clear_const_double_mem:
	link a6,#0
	movel _real_constant_chain,a0
	tstl a0
	jeq L178
L177:
	movel a0@(8),d0
	clrl a0@(8)
	movel _cc0_rtx,a0@(4)
	movel d0,a0
	tstl a0
	jne L177
L178:
	clrl _real_constant_chain
	unlk a6
	rts
	.even
_decode_addr_const:
	link a6,#0
	moveml #0x3038,sp@-
	movel a6@(12),a4
	movel a6@(8),a1
	movel a1@(20),a2
	clrl d3
	andl #255,d2
L180:
	cmpb #48,a2@(12)
	jne L182
	movel a2@(24),a0
	movel a0@(44),d0
	jra L196
L182:
	cmpb #52,a2@(12)
	jne L181
	movel a2@(24),a0
	cmpb #35,a0@(12)
	jne L187
	movel a2@(8),a0
	movel a0@(24),a0
	cmpb #35,a0@(12)
	jeq L186
L187:
	jbsr _abort
L186:
	movel a2@(8),a0
	moveb a0@(29),d2
	movel a0@(24),a0
	movel d2,d0
	mulsl a0@(16),d0
	movel a2@(24),a0
	mulsl a0@(16),d0
L196:
	tstl d0
	jge L188
	addql #7,d0
L188:
	asrl #3,d0
	addl d0,d3
	movel a2@(20),a2
	jra L180
L181:
	cmpb #43,a2@(12)
	jeq L191
	cmpb #39,a2@(12)
	jne L190
L191:
	movel a2@(64),a3
	jra L192
L190:
	btst #1,a2@(13)
	jeq L193
	movel a2@(16),a3
	jra L192
L193:
	jbsr _abort
L192:
	cmpw #37,a3@
	jeq L195
	jbsr _abort
L195:
	movel a3@(4),a4@
	movel d3,a4@(4)
	moveml a6@(-20),#0x1c0c
	unlk a6
	rts
	.even
.globl _const_hash
_const_hash:
	link a6,#-8
	moveml #0x3c38,sp@-
	movel a6@(8),a4
	clrl d0
	moveb a4@(12),d0
	moveq #35,d5
	cmpl d0,d5
	jne L198
	lea a4@(16),a0
	moveq #8,d4
	jra L199
L198:
	moveq #36,d5
	cmpl d0,d5
	jne L200
	lea a4@(20),a0
	moveq #8,d4
	jra L199
L200:
	moveq #38,d5
	cmpl d0,d5
	jne L202
	movel a4@(24),a0
	movel a4@(20),d4
	jra L199
L202:
	moveq #37,d5
	cmpl d0,d5
	jne L204
	movel a4@(20),sp@-
	lea _const_hash,a3
	jbsr a3@
	movel d0,a2
	movel a4@(24),sp@-
	jbsr a3@
	lea a2@(a2:l:4),a0
	addl a0,d0
	jra L197
L204:
	moveq #53,d5
	cmpl d0,d5
	jne L206
	moveq #5,d3
	movel a4@(24),a2
	tstl a2
	jeq L224
L210:
	movel a2@(20),sp@-
	jbsr _const_hash
	movel d3,d1
	mulsl #603,d1
	movel d1,d3
	addl d0,d3
	divsll #1007,d0:d3
	movel d0,d3
	addqw #4,sp
	movel a2@(4),a2
	tstl a2
	jne L210
L224:
	movel d3,d0
	jra L197
L206:
	moveq #114,d5
	cmpl d0,d5
	jne L212
	movel a6,d2
	subql #8,d2
	movel d2,sp@-
	movel a4,sp@-
	jbsr _decode_addr_const
	movel d2,a0
	moveq #8,d4
	jra L199
L212:
	moveq #63,d5
	cmpl d0,d5
	jeq L215
	moveq #64,d5
	cmpl d0,d5
	jne L214
L215:
	movel a4@(20),sp@-
	lea _const_hash,a3
	jbsr a3@
	movel d0,a2
	movel a4@(24),sp@-
	jbsr a3@
	lea a2@(a2:l:8),a0
	addl a0,d0
	jra L197
L214:
	moveq #111,d5
	cmpl d0,d5
	jeq L218
	moveq #110,d5
	cmpl d0,d5
	jne L199
L218:
	movel a4@(20),sp@-
	jbsr _const_hash
	moveq #7,d5
	mulsl d5,d0
	addql #2,d0
	jra L197
L199:
	movel d4,d3
	clrl d2
	cmpl d2,d4
	jle L223
L222:
	movel d3,d0
	mulsl #613,d0
	moveb a0@(d2:l),d1
	extbl d1
	movel d0,d3
	addl d1,d3
	addql #1,d2
	cmpl d2,d4
	jgt L222
L223:
	andl #1073741823,d3
	divsll #1007,d0:d3
	movel d0,d3
L197:
	moveml a6@(-36),#0x1c3c
	unlk a6
	rts
	.even
_compare_constant:
	link a6,#0
	movel a6@(12),d1
	addql #8,d1
	movel d1,sp@-
	movel a6@(8),sp@-
	jbsr _compare_constant_1
	tstl d0
	sne d0
	moveq #1,d1
	andl d1,d0
	unlk a6
	rts
	.even
_compare_constant_1:
	link a6,#-12
	moveml #0x3038,sp@-
	movel a6@(8),a4
	movel a6@(12),a3
	clrl d1
	moveb a4@(12),d1
	moveb a3@+,d0
	extbl d0
	cmpl d1,d0
	jne L263
	moveq #35,d3
	cmpl d1,d3
	jne L228
	lea a4@(16),a2
	moveq #8,d2
	jra L258
L228:
	moveq #36,d3
	cmpl d1,d3
	jne L230
	moveb a3@+,d0
	extbl d0
	movel a4@(8),a0
	clrl d1
	moveb a0@(31),d1
	cmpl d0,d1
	jne L263
	lea a4@(20),a2
	moveq #8,d2
	jra L258
L230:
	moveq #38,d3
	cmpl d1,d3
	jne L233
	tstl _flag_writable_strings
	jne L263
	movel a4@(24),a2
	movel a4@(20),d2
	pea 4:w
	movel a3,sp@-
	pea a4@(20)
	jbsr _memcmp
	tstl d0
	jne L263
	addqw #4,a3
	jra L258
L233:
	moveq #37,d3
	cmpl d1,d3
	jne L237
	movel a3,sp@-
	movel a4@(20),sp@-
	jbsr _compare_constant_1
	movel d0,a3
	addqw #8,sp
	tstl a3
	jeq L263
	movel a3,sp@-
	movel a4@(24),sp@-
	jra L264
L237:
	moveq #53,d3
	cmpl d1,d3
	jne L240
	movel a4@(24),sp@-
	jbsr _list_length
	movel d0,a6@(-4)
	pea 4:w
	movel a3,sp@-
	pea a6@(-4)
	jbsr _memcmp
	addw #16,sp
	tstl d0
	jne L263
	addqw #4,a3
	movel a4@(24),a2
	tstl a2
	jeq L265
L246:
	movel a3,sp@-
	movel a2@(20),sp@-
	jbsr _compare_constant_1
	movel d0,a3
	addqw #8,sp
	tstl a3
	jeq L263
	movel a2@(4),a2
	tstl a2
	jne L246
	jra L265
L240:
	moveq #114,d3
	cmpl d1,d3
	jne L248
	moveq #-12,d2
	addl a6,d2
	movel d2,sp@-
	movel a4,sp@-
	jbsr _decode_addr_const
	movel d2,a2
	moveq #8,d2
	jra L258
L248:
	moveq #63,d3
	cmpl d1,d3
	jeq L251
	moveq #64,d3
	cmpl d1,d3
	jne L250
L251:
	cmpb a3@+,d1
	jne L263
	movel a3,sp@-
	movel a4@(20),sp@-
	jbsr _compare_constant_1
	movel d0,a3
	addqw #8,sp
	tstl a3
	jeq L263
	movel a3,sp@-
	movel a4@(24),sp@-
	jra L264
L250:
	moveq #111,d3
	cmpl d1,d3
	jeq L256
	moveq #110,d3
	cmpl d1,d3
	jne L258
L256:
	cmpb a3@+,d1
	jne L263
	movel a3,sp@-
	movel a4@(20),sp@-
L264:
	jbsr _compare_constant_1
	movel d0,a3
	jra L226
L261:
	cmpmb a2@+,a3@+
	jeq L258
L263:
	clrl d0
	jra L226
L258:
	subql #1,d2
	jpl L261
L265:
	movel a3,d0
L226:
	moveml a6@(-32),#0x1c0c
	unlk a6
	rts
	.even
_record_constant:
	link a6,#-8
	moveml #0x2020,sp@-
	lea _permanent_obstack,a2
	moveq #4,d2
	movel d2,d0
	addl _permanent_obstack+12,d0
	cmpl _permanent_obstack+16,d0
	jls L268
	movel d2,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L268:
	movel d2,sp@-
	pea a6@(-4)
	movel a2@(12),sp@-
	jbsr _memcpy
	addl d2,a2@(12)
	addw #12,sp
	lea _permanent_obstack,a2
	moveq #4,d2
	movel d2,d0
	addl _permanent_obstack+12,d0
	cmpl _permanent_obstack+16,d0
	jls L270
	movel d2,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L270:
	movel d2,sp@-
	pea a6@(-8)
	movel a2@(12),sp@-
	jbsr _memcpy
	addl d2,a2@(12)
	addw #12,sp
	movel a6@(8),sp@-
	jbsr _record_constant_1
	lea _permanent_obstack,a0
	movel _permanent_obstack+8,d2
	movel _permanent_obstack+12,d0
	addl _permanent_obstack+24,d0
	movel _permanent_obstack+24,d1
	notl d1
	andl d1,d0
	movel d0,_permanent_obstack+12
	subl _permanent_obstack+4,d0
	movel _permanent_obstack+16,d1
	subl _permanent_obstack+4,d1
	cmpl d0,d1
	jge L272
	movel _permanent_obstack+16,_permanent_obstack+12
L272:
	movel a0@(12),a0@(8)
	movel d2,d0
	moveml a6@(-16),#0x404
	unlk a6
	rts
	.even
_record_constant_1:
	link a6,#-12
	moveml #0x3c30,sp@-
	movel a6@(8),a3
	clrl d2
	moveb a3@(12),d2
	movel #_permanent_obstack,d3
	movel _permanent_obstack+12,d0
	addql #1,d0
	cmpl _permanent_obstack+16,d0
	jls L275
	pea 1:w
	movel d3,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L275:
	moveq #12,d1
	addl d3,d1
	movel d1,a0
	movel a0@,a1
	moveb d2,a1@
	addql #1,a0@
	moveq #35,d1
	cmpl d2,d1
	jne L276
	moveq #16,d5
	jra L311
L276:
	moveq #36,d1
	cmpl d2,d1
	jne L278
	movel #_permanent_obstack,d2
	movel _permanent_obstack+12,d0
	addql #1,d0
	cmpl _permanent_obstack+16,d0
	jls L280
	pea 1:w
	movel d2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L280:
	moveq #12,d1
	addl d2,d1
	movel d1,a0
	movel a0@,a1
	movel a3@(8),a2
	moveb a2@(31),a1@
	addql #1,a0@
	moveq #20,d5
L311:
	addl a3,d5
	moveq #8,d4
	jra L277
L278:
	moveq #38,d1
	cmpl d2,d1
	jne L282
	tstl _flag_writable_strings
	jne L273
	movel a3@(24),d5
	movel a3@(20),d4
	lea _permanent_obstack,a2
	moveq #4,d2
	movel d2,d0
	addl _permanent_obstack+12,d0
	cmpl _permanent_obstack+16,d0
	jls L285
	movel d2,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L285:
	movel d2,sp@-
	pea a3@(20)
	movel a2@(12),sp@-
	jbsr _memcpy
	addl d2,a2@(12)
	addw #12,sp
	jra L277
L282:
	moveq #37,d1
	cmpl d2,d1
	jeq L312
	moveq #53,d1
	cmpl d2,d1
	jne L289
	movel a3@(24),sp@-
	jbsr _list_length
	movel d0,a6@(-4)
	lea _permanent_obstack,a2
	moveq #4,d2
	movel d2,d0
	addl _permanent_obstack+12,d0
	addqw #4,sp
	cmpl _permanent_obstack+16,d0
	jls L291
	movel d2,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L291:
	movel d2,sp@-
	pea a6@(-4)
	movel a2@(12),sp@-
	jbsr _memcpy
	addl d2,a2@(12)
	addw #12,sp
	movel a3@(24),a2
	tstl a2
	jeq L273
L295:
	movel a2@(20),sp@-
	jbsr _record_constant_1
	addqw #4,sp
	movel a2@(4),a2
	tstl a2
	jne L295
	jra L273
L289:
	moveq #114,d1
	cmpl d2,d1
	jne L297
	moveq #-12,d2
	addl a6,d2
	movel d2,sp@-
	movel a3,sp@-
	jbsr _decode_addr_const
	movel d2,d5
	moveq #8,d4
	addqw #8,sp
	jra L277
L297:
	moveq #63,d1
	cmpl d2,d1
	jeq L300
	moveq #64,d1
	cmpl d2,d1
	jne L299
L300:
	movel #_permanent_obstack,d3
	movel _permanent_obstack+12,d0
	addql #1,d0
	cmpl _permanent_obstack+16,d0
	jls L302
	pea 1:w
	movel d3,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L302:
	moveq #12,d1
	addl d3,d1
	movel d1,a0
	movel a0@,a1
	moveb d2,a1@
	addql #1,a0@
L312:
	movel a3@(20),sp@-
	lea _record_constant_1,a2
	jbsr a2@
	movel a3@(24),sp@-
	jbsr a2@
	jra L273
L299:
	moveq #111,d1
	cmpl d2,d1
	jeq L305
	moveq #110,d1
	cmpl d2,d1
	jne L277
L305:
	movel #_permanent_obstack,d3
	movel _permanent_obstack+12,d0
	addql #1,d0
	cmpl _permanent_obstack+16,d0
	jls L307
	pea 1:w
	movel d3,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L307:
	moveq #12,d1
	addl d3,d1
	movel d1,a0
	movel a0@,a1
	moveb d2,a1@
	addql #1,a0@
	movel a3@(20),sp@-
	jbsr _record_constant_1
	jra L273
L277:
	lea _permanent_obstack,a2
	movel d4,d2
	movel d2,d0
	addl _permanent_obstack+12,d0
	cmpl _permanent_obstack+16,d0
	jls L309
	movel d2,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L309:
	movel d2,sp@-
	movel d5,sp@-
	movel a2@(12),sp@-
	jbsr _memcpy
	addl d2,a2@(12)
L273:
	moveml a6@(-36),#0xc3c
	unlk a6
	rts
LC30:
	.ascii "LC\0"
LC31:
	.ascii "%s%d:\12\0"
	.even
_get_or_assign_label:
	link a6,#-12
	moveml #0x3838,sp@-
	movel a6@(8),a2
	movel a2,sp@-
	jbsr _output_addressed_constants
	movel a2,sp@-
	jbsr _const_hash
	divsll #1007,d1:d0
	movel d1,d2
	lea _const_hash_table,a0
	movel a0@(d2:l:4),a3
	addqw #8,sp
	tstl a3
	jeq L334
L318:
	movel a3,sp@-
	movel a2,sp@-
	jbsr _compare_constant
	addqw #8,sp
	tstl d0
	jeq L316
	movel a3@(4),d0
	jra L313
L316:
	movel a3@,a3
	tstl a3
	jne L318
L334:
	movel a2,sp@-
	jbsr _record_constant
	movel d0,a3
	lea _const_hash_table,a0
	movel a0@(d2:l:4),a3@
	movel a3,a0@(d2:l:4)
	addqw #4,sp
	cmpb #38,a2@(12)
	jne L319
	tstl _flag_writable_strings
	jeq L319
	jbsr _data_section
	jra L320
L319:
	jbsr _text_section
L320:
	clrl d2
	movel a2@(8),a0
	clrl d3
	jra L321
L323:
	addql #1,d2
L321:
	moveb a0@(30),d3
	movel d2,d0
	addql #1,d0
	moveq #8,d1
	asll d0,d1
	cmpl d3,d1
	jle L323
	moveq #1,d4
	cmpl d2,d4
	jne L325
	pea LC13
	movel _asm_out_file,sp@-
	jbsr _fprintf
	addqw #8,sp
	jra L326
L325:
	tstl d2
	jeq L326
	jbsr _abort
L326:
	movel _const_labelno,sp@-
	pea LC30
	pea LC31
	movel _asm_out_file,sp@-
	jbsr _fprintf
	addw #16,sp
	cmpb #38,a2@(12)
	jne L328
	movel a2@(20),d0
	jra L329
L328:
	movel a2@(8),sp@-
	jbsr _int_size_in_bytes
	addqw #4,sp
L329:
	movel d0,sp@-
	movel a2,sp@-
	jbsr _output_constant
	movel _const_labelno,sp@-
	pea LC30
	pea LC29
	moveq #-10,d2
	addl a6,d2
	movel d2,sp@-
	jbsr _sprintf
	addql #1,_const_labelno
	movel #_permanent_obstack,d3
	movel d3,a4
	movel d2,sp@-
	jbsr _strlen
	movel d0,a2
	addl _permanent_obstack+12,d0
	addql #1,d0
	addw #28,sp
	cmpl _permanent_obstack+16,d0
	jls L331
	pea a2@(1)
	movel d3,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L331:
	movel a2,sp@-
	pea a6@(-10)
	movel a4@(12),sp@-
	jbsr _memcpy
	addl a4@(12),a2
	movel a2,a4@(12)
	lea a4@(12),a0
	movel a0@,a1
	clrb a1@
	addql #1,a0@
	movel d3,a0
	movel a0@(8),d2
	movel a0@(12),d0
	addl a0@(24),d0
	movel a0@(24),d1
	notl d1
	andl d1,d0
	movel d0,a0@(12)
	subl a0@(4),d0
	movel a0@(16),d1
	subl a0@(4),d1
	cmpl d0,d1
	jge L333
	movel a0@(16),a0@(12)
L333:
	movel a0@(12),a0@(8)
	movel d2,a3@(4)
	movel d2,d0
L313:
	moveml a6@(-36),#0x1c1c
	unlk a6
	rts
	.even
.globl _output_constant_def
_output_constant_def:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(8),a3
	jbsr _allocation_temporary_p
	movel d0,d2
	cmpb #35,a3@(12)
	jne L336
	jbsr _abort
L336:
	tstl a3@(16)
	jne L339
	tstb a3@(14)
	jge L338
	jbsr _end_temporary_allocation
L338:
	movel a3,sp@-
	jbsr _get_or_assign_label
	movel d0,sp@-
	pea 4:w
	pea 39:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a3@(8),a0
	clrl d0
	moveb a0@(28),d0
	movel d0,sp@-
	pea 37:w
	jbsr a2@
	movel d0,a0
	movel a0,a3@(16)
	orb #32,a0@(3)
	addw #28,sp
	tstl d2
	jeq L339
	tstb a3@(14)
	jge L339
	jbsr _resume_temporary_allocation
L339:
	movel a3@(16),d0
	moveml a6@(-12),#0xc04
	unlk a6
	rts
	.even
.globl _init_const_rtx_hash_table
_init_const_rtx_hash_table:
	link a6,#0
	pea 244:w
	clrl sp@-
	pea _const_rtx_hash_table
	jbsr _memset
	unlk a6
	rts
	.even
_decode_rtx_const:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(12),a2
	movel a6@(16),a3
	movel a3,a0
	moveq #12,d0
	addl a3,d0
	cmpl a0,d0
	jls L365
L344:
	clrl a0@+
	cmpl a0,d0
	jhi L344
L365:
	movew #1,a3@
	movew a6@(10),a3@(2)
	clrl d0
	movew a2@,d0
	moveq #-30,d1
	addl d1,d0
	moveq #9,d1
	cmpl d1,d0
	jhi L357
LI358:
	movew pc@(L358-LI358-2:b,d0:l:2),d1
	jmp pc@(2,d1:w)
L358:
	.word L347-L358
	.word L346-L358
	.word L350-L358
	.word L357-L358
	.word L357-L358
	.word L357-L358
	.word L357-L358
	.word L357-L358
	.word L349-L358
	.word L348-L358
L346:
	clrw a3@
	clrw d0
	moveb a2@(2),d0
	movew d0,a3@(2)
	pea 8:w
	pea a2@(12)
	pea a3@(4)
	jbsr _memcpy
	jra L345
L347:
	movel a2@(4),a3@(8)
	jra L345
L348:
L349:
	movel a2,a3@(4)
	jra L345
L350:
	movel a2@(4),a2
	cmpw #44,a2@
	jne L351
	movel a2@(4),a0
	movel a0@(4),a3@(4)
	movel a2@(8),a0
	cmpw #30,a0@
	jeq L352
	jbsr _abort
L352:
	movel a2@(8),a0
	movel a0@(4),a3@(8)
	jra L345
L351:
	cmpw #45,a2@
	jne L354
	movel a2@(4),a3@(4)
	movel a2@(8),a0
	cmpw #30,a0@
	jeq L355
	jbsr _abort
L355:
	movel a2@(8),a0
	movel a0@(4),d1
	negl d1
	movel d1,a3@(8)
	jra L345
L354:
L357:
	jbsr _abort
L345:
	cmpw #1,a3@
	jne L359
	tstl a3@(4)
	jeq L359
	movel a3@(4),a0
	clrl d0
	movew a0@,d0
	moveq #39,d1
	cmpl d0,d1
	jlt L359
	moveq #38,d1
	cmpl d0,d1
	jgt L359
	movel a0@(4),a3@(4)
L359:
	moveml a6@(-8),#0xc00
	unlk a6
	rts
	.even
.globl _const_hash_rtx
_const_hash_rtx:
	link a6,#-12
	movel d2,sp@-
	pea a6@(-12)
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	jbsr _decode_rtx_const
	clrl d1
	clrl d0
L371:
	addl a6@(-12,d0:l:4),d1
	addql #1,d0
	moveq #2,d2
	cmpl d0,d2
	jcc L371
	andl #1073741823,d1
	moveq #61,d2
	divsll d2,d0:d1
	movel d0,d1
	movel a6@(-16),d2
	unlk a6
	rts
	.even
_compare_constant_rtx:
	link a6,#-12
	moveml #0x2020,sp@-
	movel a6@(16),a2
	addqw #8,a2
	moveq #-12,d2
	addl a6,d2
	movel d2,sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	jbsr _decode_rtx_const
	movel d2,a0
	moveq #3,d0
	jra L373
L376:
	cmpml a0@+,a2@+
	jeq L373
	clrl d0
	jra L372
L373:
	subql #1,d0
	jpl L376
	moveq #1,d0
L372:
	moveml a6@(-20),#0x404
	unlk a6
	rts
	.even
_record_constant_rtx:
	link a6,#-20
	moveml #0x2020,sp@-
	clrl a6@(-16)
	pea a6@(-12)
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	jbsr _decode_rtx_const
	movel _saveable_obstack,a2
	moveq #4,d2
	movel d2,d0
	addl a2@(12),d0
	addw #12,sp
	cmpl a2@(16),d0
	jls L379
	movel d2,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L379:
	movel d2,sp@-
	pea a6@(-16)
	movel a2@(12),sp@-
	jbsr _memcpy
	addl d2,a2@(12)
	addw #12,sp
	movel _saveable_obstack,a2
	moveq #4,d2
	movel d2,d0
	addl a2@(12),d0
	cmpl a2@(16),d0
	jls L381
	movel d2,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L381:
	movel d2,sp@-
	pea a6@(-20)
	movel a2@(12),sp@-
	jbsr _memcpy
	addl d2,a2@(12)
	addw #12,sp
	movel _saveable_obstack,a2
	moveq #12,d2
	movel d2,d0
	addl a2@(12),d0
	cmpl a2@(16),d0
	jls L383
	movel d2,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L383:
	movel d2,sp@-
	pea a6@(-12)
	movel a2@(12),sp@-
	jbsr _memcpy
	addl d2,a2@(12)
	movel _saveable_obstack,a0
	movel a0@(8),d2
	movel a0@(12),d0
	addl a0@(24),d0
	movel a0@(24),d1
	notl d1
	andl d1,d0
	movel d0,a0@(12)
	subl a0@(4),d0
	movel a0@(16),d1
	subl a0@(4),d1
	cmpl d0,d1
	jge L385
	movel a0@(16),a0@(12)
L385:
	movel a0@(12),a0@(8)
	movel d2,d0
	moveml a6@(-28),#0x404
	unlk a6
	rts
LC32:
	.ascii "\11.double 0r%.20e\12\0"
LC33:
	.ascii "\11.single 0r%.20e\12\0"
LC34:
	.ascii "\11.word \0"
LC35:
	.ascii "\11.byte \0"
	.even
.globl _force_const_mem
_force_const_mem:
	link a6,#-20
	moveml #0x3e3c,sp@-
	movel a6@(8),d5
	movel a6@(12),d4
	clrl d2
	movel d4,a4
	cmpw #31,a4@
	jne L387
	movel a4@(4),a0
	cmpw #37,a0@
	jne L387
	movel a0,d0
	jra L386
L387:
	movel d4,sp@-
	movel d5,sp@-
	jbsr _const_hash_rtx
	movel d0,d3
	lea _const_rtx_hash_table,a0
	movel a0@(d3:l:4),a5
	addqw #8,sp
	tstl a5
	jeq L389
L392:
	movel a5,sp@-
	movel d4,sp@-
	movel d5,sp@-
	jbsr _compare_constant_rtx
	addw #12,sp
	tstl d0
	jeq L390
	movel a5@(4),d2
	jra L389
L390:
	movel a5@,a5
	tstl a5
	jne L392
L389:
	tstl d2
	jne L393
	movel d4,sp@-
	movel d5,sp@-
	jbsr _record_constant_rtx
	movel d0,a5
	lea _const_rtx_hash_table,a0
	movel a0@(d3:l:4),a5@
	movel a5,a0@(d3:l:4)
	jbsr _text_section
	addqw #8,sp
	tstl d5
	jne L394
	moveq #4,d2
	jra L395
L394:
	lea _mode_size,a0
	movel a0@(d5:l:4),d2
L395:
	moveq #2,d6
	cmpl d2,d6
	jge L396
	moveq #2,d2
L396:
	movel d2,sp@-
	jbsr _exact_log2
	addqw #4,sp
	moveq #1,d6
	cmpl d0,d6
	jne L397
	pea LC13
	movel _asm_out_file,sp@-
	jbsr _fprintf
	addqw #8,sp
	jra L398
L397:
	movel d2,sp@-
	jbsr _exact_log2
	addqw #4,sp
	tstl d0
	jeq L398
	jbsr _abort
L398:
	movel _const_labelno,sp@-
	pea LC30
	pea LC31
	movel _asm_out_file,sp@-
	jbsr _fprintf
	addw #16,sp
	movel d4,a4
	cmpw #31,a4@
	jne L400
	pea 8:w
	pea a4@(12)
	pea a6@(-18)
	jbsr _memcpy
	addw #12,sp
	moveq #10,d6
	cmpl d5,d6
	jeq L404
	moveq #10,d6
	cmpl d5,d6
	jlt L407
	moveq #6,d6
	cmpl d5,d6
	jeq L402
	jra L408
L407:
	moveq #11,d6
	cmpl d5,d6
	jeq L403
	jra L408
L402:
	pea LC17
	movel _asm_out_file,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel a6@(-18),sp@-
	clrl sp@-
	pea 30:w
	lea _gen_rtx,a3
	jbsr a3@
	movel d0,sp@-
	movel _asm_out_file,sp@-
	lea _output_addr_const,a4
	jbsr a4@
	pea LC15
	movel _asm_out_file,sp@-
	jbsr a2@
	addw #36,sp
	pea LC17
	movel _asm_out_file,sp@-
	jbsr a2@
	movel a6@(-14),sp@-
	clrl sp@-
	pea 30:w
	jbsr a3@
	movel d0,sp@-
	movel _asm_out_file,sp@-
	jbsr a4@
	pea LC15
	movel _asm_out_file,sp@-
	jbsr a2@
	addw #36,sp
	jra L408
L403:
	movel a6@(-14),sp@-
	movel a6@(-18),sp@-
	pea LC32
	jra L423
L404:
	movel a6@(-14),sp@-
	movel a6@(-18),sp@-
	pea LC33
L423:
	movel _asm_out_file,sp@-
	jbsr _fprintf
	addw #16,sp
	jra L408
L400:
	moveq #2,d6
	cmpl d5,d6
	jeq L411
	moveq #2,d6
	cmpl d5,d6
	jlt L415
	moveq #1,d6
	cmpl d5,d6
	jeq L412
	jra L408
L415:
	moveq #4,d6
	cmpl d5,d6
	jne L408
	pea LC17
	jra L424
L411:
	pea LC34
	jra L424
L412:
	pea LC35
L424:
	movel _asm_out_file,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel d4,sp@-
	movel _asm_out_file,sp@-
	jbsr _output_addr_const
	pea LC15
	movel _asm_out_file,sp@-
	jbsr a2@
	addw #24,sp
L408:
	movel _const_labelno,sp@-
	pea LC30
	pea LC29
	moveq #-10,d2
	addl a6,d2
	movel d2,sp@-
	jbsr _sprintf
	addql #1,_const_labelno
	movel #_permanent_obstack,d3
	movel d3,a3
	movel d2,sp@-
	jbsr _strlen
	movel d0,a2
	addl _permanent_obstack+12,d0
	addql #1,d0
	addw #20,sp
	cmpl _permanent_obstack+16,d0
	jls L417
	pea a2@(1)
	movel d3,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L417:
	movel a2,sp@-
	pea a6@(-10)
	movel a3@(12),sp@-
	jbsr _memcpy
	addl a3@(12),a2
	movel a2,a3@(12)
	lea a3@(12),a0
	movel a0@,a1
	clrb a1@
	addql #1,a0@
	addw #12,sp
	movel d3,a0
	movel a0@(8),d2
	movel a0@(12),d0
	addl a0@(24),d0
	movel a0@(24),d1
	notl d1
	andl d1,d0
	movel d0,a0@(12)
	subl a0@(4),d0
	movel a0@(16),d1
	subl a0@(4),d1
	cmpl d0,d1
	jge L419
	movel a0@(16),a0@(12)
L419:
	movel a0@(12),a0@(8)
	movel d2,a5@(4)
L393:
	movel a5@(4),sp@-
	pea 4:w
	pea 39:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d5,sp@-
	pea 37:w
	jbsr a2@
	movel d0,a1
	orb #32,a1@(3)
	movel a1@(4),a0
	orb #32,a0@(3)
	movel d4,a4
	cmpw #31,a4@
	jne L420
	movel a4@(4),d6
	cmpl _cc0_rtx,d6
	jne L421
	movel _real_constant_chain,a4@(8)
	movel d4,_real_constant_chain
L421:
	movel d4,a4
	movel a1,a4@(4)
L420:
	movel a1,d0
L386:
	moveml a6@(-56),#0x3c7c
	unlk a6
	rts
	.even
.globl _output_addressed_constants
_output_addressed_constants:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(8),a3
	clrl d0
	moveb a3@(12),d0
	moveq #64,d1
	cmpl d0,d1
	jlt L445
	moveq #63,d1
	cmpl d0,d1
	jle L433
	tstl d0
	jeq L426
	moveq #53,d1
	cmpl d0,d1
	jeq L436
	jra L442
L445:
	moveq #110,d1
	cmpl d0,d1
	jgt L442
	moveq #111,d1
	cmpl d0,d1
	jge L435
	moveq #114,d1
	cmpl d0,d1
	jne L442
	movel a3@(20),a0
	cmpb #48,a0@(12)
	jne L447
L430:
	movel a0@(20),a0
	cmpb #48,a0@(12)
	jeq L430
L447:
	btst #1,a0@(13)
	jeq L426
	movel a0,sp@-
	jbsr _output_constant_def
	jra L426
L433:
	movel a3@(20),sp@-
	lea _output_addressed_constants,a2
	jbsr a2@
	movel a3@(24),sp@-
	jbsr a2@
	jra L426
L435:
	movel a3@(20),sp@-
	jbsr _output_addressed_constants
	jra L426
L436:
	movel a3@(24),a2
	tstl a2
	jeq L426
L440:
	movel a2@(20),sp@-
	jbsr _output_addressed_constants
	addqw #4,sp
	movel a2@(4),a2
	tstl a2
	jne L440
	jra L426
L442:
	btst #1,a3@(13)
	jne L426
	jbsr _abort
L426:
	moveml a6@(-8),#0xc00
	unlk a6
	rts
LC36:
	.ascii "8-byte integer constant expression too complicated\0"
LC37:
	.ascii "initializer for floating value is not a floating constant\0"
	.even
.globl _output_constant
_output_constant:
	link a6,#0
	moveml #0x303c,sp@-
	movel a6@(8),a5
	movel a6@(12),d2
	movel a5@(8),a0
	clrl d0
	moveb a0@(12),d0
	tstl d2
	jeq L448
	cmpb #111,a5@(12)
	jne L450
	movel a5@(20),a0
	movel a5@(8),d1
	cmpl a0@(8),d1
	jne L450
	movel a0,a5
L450:
	subql #5,d0
	moveq #15,d1
	cmpl d1,d0
	jhi L451
LI488:
	movew pc@(L488-LI488-2:b,d0:l:2),d1
	jmp pc@(2,d1:w)
L488:
	.word L455-L488
	.word L468-L488
	.word L474-L488
	.word L455-L488
	.word L451-L488
	.word L451-L488
	.word L455-L488
	.word L451-L488
	.word L455-L488
	.word L451-L488
	.word L451-L488
	.word L478-L488
	.word L451-L488
	.word L451-L488
	.word L485-L488
	.word L485-L488
L455:
L456:
	cmpb #111,a5@(12)
	jeq L458
	cmpb #110,a5@(12)
	jne L457
L458:
	movel a5@(20),a5
	jra L456
L457:
	movel a5@(8),a0
	cmpb #6,a0@(28)
	jne L459
	cmpb #35,a5@(12)
	jne L460
	pea LC17
	movel _asm_out_file,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel a5@(16),sp@-
	clrl sp@-
	pea 30:w
	lea _gen_rtx,a3
	jbsr a3@
	movel d0,sp@-
	movel _asm_out_file,sp@-
	lea _output_addr_const,a4
	jbsr a4@
	pea LC15
	movel _asm_out_file,sp@-
	jbsr a2@
	addw #36,sp
	pea LC17
	movel _asm_out_file,sp@-
	jbsr a2@
	movel a5@(20),sp@-
	clrl sp@-
	pea 30:w
	jbsr a3@
	movel d0,sp@-
	movel _asm_out_file,sp@-
	jbsr a4@
	pea LC15
	movel _asm_out_file,sp@-
	jbsr a2@
	subql #8,d2
	addw #36,sp
	jra L451
L460:
	pea LC36
	jbsr _error
	addqw #4,sp
	jra L451
L459:
	pea 1:w
	clrl sp@-
	clrl sp@-
	movel a5,sp@-
	jbsr _expand_expr
	movel d0,d3
	addw #16,sp
	moveq #1,d1
	cmpl d2,d1
	jne L462
	pea LC35
	movel _asm_out_file,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel d3,sp@-
	movel _asm_out_file,sp@-
	jbsr _output_addr_const
	pea LC15
	movel _asm_out_file,sp@-
	jbsr a2@
	subql #1,d2
	addw #24,sp
	jra L451
L462:
	moveq #2,d1
	cmpl d2,d1
	jne L464
	pea LC34
	movel _asm_out_file,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel d3,sp@-
	movel _asm_out_file,sp@-
	jbsr _output_addr_const
	pea LC15
	movel _asm_out_file,sp@-
	jbsr a2@
	subql #2,d2
	addw #24,sp
	jra L451
L464:
	moveq #4,d1
	cmpl d2,d1
	jne L491
	pea LC17
	movel _asm_out_file,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel d3,sp@-
	movel _asm_out_file,sp@-
	jbsr _output_addr_const
	pea LC15
	movel _asm_out_file,sp@-
	jbsr a2@
	subql #4,d2
	addw #24,sp
	jra L451
L468:
	cmpb #36,a5@(12)
	jeq L469
	pea LC37
	jbsr _error
	addqw #4,sp
L469:
	moveq #3,d1
	cmpl d2,d1
	jge L451
	moveq #7,d1
	cmpl d2,d1
	jlt L472
	movel a5@(24),sp@-
	movel a5@(20),sp@-
	pea LC33
	movel _asm_out_file,sp@-
	jbsr _fprintf
	subql #4,d2
	addw #16,sp
	jra L451
L472:
	movel a5@(24),sp@-
	movel a5@(20),sp@-
	pea LC32
	movel _asm_out_file,sp@-
	jbsr _fprintf
	subql #8,d2
	addw #16,sp
	jra L451
L474:
	movel d2,d0
	jge L475
	addql #1,d0
L475:
	asrl #1,d0
	movel d0,sp@-
	movel a5@(20),sp@-
	jbsr _output_constant
	movel d2,d0
	jge L476
	addql #1,d0
L476:
	asrl #1,d0
	movel d0,sp@-
	movel a5@(24),sp@-
	jbsr _output_constant
	movel d2,d0
	jge L477
	addql #1,d0
L477:
	moveq #-2,d1
	andl d1,d0
	subl d0,d2
	addw #16,sp
	jra L451
L478:
	cmpb #53,a5@(12)
	jeq L492
	cmpb #38,a5@(12)
	jne L481
	clrl d3
	cmpl a5@(20),d2
	jle L482
	movel d2,d3
	subl a5@(20),d3
	movel a5@(20),d2
L482:
	movel d2,sp@-
	movel a5@(24),sp@-
	jbsr _assemble_string
	movel d3,d2
	addqw #8,sp
	jra L451
L481:
L491:
	jbsr _abort
	jra L451
L485:
	cmpb #53,a5@(12)
	jne L486
L492:
	movel d2,sp@-
	movel a5,sp@-
	jbsr _output_constructor
	jra L448
L486:
	jbsr _abort
	jra L448
L451:
	tstl d2
	jle L448
	movel d2,sp@-
	pea LC26
	movel _asm_out_file,sp@-
	jbsr _fprintf
L448:
	moveml a6@(-24),#0x3c0c
	unlk a6
	rts
LC38:
	.ascii "\11.byte 0x%x\12\0"
LC39:
	.ascii "invalid initial value for member `%s'\0"
	.even
.globl _output_constructor
_output_constructor:
	link a6,#-4
	moveml #0x3f3c,sp@-
	subl a2,a2
	clrl d7
	moveq #-1,d6
	movel a6@(8),a1
	movel a1@(8),a0
	cmpb #19,a0@(12)
	jeq L495
	cmpb #20,a0@(12)
	jne L494
L495:
	movel a6@(8),a1
	movel a1@(8),a0
	movel a0@(16),a2
L494:
	movel a6@(8),a1
	movel a1@(24),a5
L532:
	tstl a5
	jeq L530
	movel a5@(20),a3
	cmpb #111,a3@(12)
	jne L499
	movel a3@(20),a0
	movel a3@(8),d5
	cmpl a0@(8),d5
	jne L499
	movel a0,a3
L499:
	tstl a2
	jeq L501
	moveq #25,d5
	cmpl a2@(28),d5
	jeq L500
L501:
	tstl d6
	jlt L502
	movel a4,sp@-
	pea LC38
	movel _asm_out_file,sp@-
	jbsr _fprintf
	addql #1,d7
	moveq #-1,d6
	addw #12,sp
L502:
	tstl a2
	jeq L503
	movel d7,d0
	asll #3,d0
	clrl d1
	moveb a2@(33),d1
	divsll d1,d1:d0
	tstl d1
	jeq L503
	moveb a2@(33),d1
	lsrb #3,d1
	clrl d0
	moveb d1,d0
	movel d7,a1
	lea a1@(-1,d0:l),a1
	movel a1,d2
	divsl d0,d2
	mulsl d0,d2
	movel d2,d5
	subl d7,d5
	movel d5,sp@-
	pea LC26
	movel _asm_out_file,sp@-
	jbsr _fprintf
	movel d2,d7
	addw #12,sp
L503:
	tstl a2
	jeq L504
	movel a2@(24),a0
	btst #1,a0@(13)
	jne L505
	jbsr _abort
L505:
	movel a2@(24),a0
	clrl d0
	moveb a2@(32),d0
	movel d0,d2
	mulsl a0@(16),d2
	addql #7,d2
	jpl L506
	addql #7,d2
L506:
	asrl #3,d2
	jra L507
L504:
	movel a6@(8),a1
	movel a1@(8),a0
	movel a0@(8),sp@-
	jbsr _int_size_in_bytes
	movel d0,d2
	addqw #4,sp
L507:
	movel d2,sp@-
	movel a3,sp@-
	jbsr _output_constant
	addl d2,d7
	addqw #8,sp
	jra L498
L500:
	cmpb #35,a3@(12)
	jeq L509
	movel a2@(36),a0
	movel a0@(20),sp@-
	pea LC39
	jbsr _error
	addqw #8,sp
	jra L498
L509:
	movel a2@(44),d4
	movel a2@(24),a0
	clrl d0
	moveb a2@(32),d0
	mulsl a0@(16),d0
	addl d4,d0
	movel d0,a6@(-4)
	cmpl a6@(-4),d4
	jge L498
L522:
	movel d4,d2
	jge L513
	addql #7,d2
L513:
	asrl #3,d2
	movel d4,d3
	jge L514
	addql #7,d3
L514:
	moveq #-8,d5
	andl d5,d3
	subl d4,d3
	negl d3
	tstl d6
	jge L531
	movel d2,d6
	subl a4,a4
	jra L516
L519:
	movel a4,sp@-
	pea LC38
	movel _asm_out_file,sp@-
	jbsr _fprintf
	addql #1,d6
	addql #1,d7
	subl a4,a4
	addw #12,sp
L531:
	cmpl d2,d6
	jne L519
L516:
	movel a6@(-4),d1
	subl d4,d1
	moveq #8,d0
	subl d3,d0
	cmpl d1,d0
	jle L520
	movel d1,d2
	jra L521
L520:
	moveq #8,d2
	subl d3,d2
L521:
	movel a6@(-4),d0
	subl d4,d0
	subl d2,d0
	movel a3@(16),d5
	asrl d0,d5
	movel d5,d0
	moveq #1,d1
	asll d2,d1
	subql #1,d1
	andl d1,d0
	moveq #8,d1
	subl d3,d1
	subl d2,d1
	asll d1,d0
	movel a4,d5
	orl d0,d5
	movel d5,a4
	addl d2,d4
	cmpl a6@(-4),d4
	jlt L522
L498:
	movel a5@(4),a5
	tstl a2
	jeq L523
	movel a2@(4),a2
	jra L532
L523:
	subl a2,a2
	jra L532
L530:
	tstl d6
	jlt L526
	movel a4,sp@-
	pea LC38
	movel _asm_out_file,sp@-
	jbsr _fprintf
	addql #1,d7
	addw #12,sp
L526:
	cmpl a6@(12),d7
	jge L527
	movel a6@(12),d5
	subl d7,d5
	movel d5,sp@-
	pea LC26
	movel _asm_out_file,sp@-
	jbsr _fprintf
L527:
	moveml a6@(-44),#0x3cfc
	unlk a6
	rts
.lcomm _const_rtx_hash_table,244
.lcomm _const_hash_table,4028
.lcomm _real_constant_chain,4
.lcomm _function_defined,4
.comm _var_labelno,4
.comm _const_labelno,4
