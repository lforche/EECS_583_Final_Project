#NO_APP
gcc_compiled.:
.globl _rtl_obstack
.data
	.even
_rtl_obstack:
	.long _obstack
.text
LC0:
	.ascii "/* Generated automatically by the program `genoutput'\12from the machine description file `md'.  */\12\12\0"
LC1:
	.ascii "#include \"config.h\"\12\0"
LC2:
	.ascii "#include \"rtl.h\"\12\0"
LC3:
	.ascii "#include \"regs.h\"\12\0"
LC4:
	.ascii "#include \"hard-reg-set.h\"\12\0"
LC5:
	.ascii "#include \"real.h\"\12\0"
LC6:
	.ascii "#include \"conditions.h\"\12\0"
LC7:
	.ascii "#include \"insn-flags.h\"\12\0"
LC8:
	.ascii "#include \"insn-config.h\"\12\12\0"
LC9:
	.ascii "#ifndef __STDC__\12\0"
LC10:
	.ascii "#define const\12\0"
LC11:
	.ascii "#endif\12\12\0"
LC12:
	.ascii "#include \"output.h\"\12\0"
LC13:
	.ascii "#include \"aux-output.c\"\12\12\0"
LC14:
	.ascii "#ifndef INSN_MACHINE_INFO\12\0"
LC15:
	.ascii "#define INSN_MACHINE_INFO struct dummy1 {int i;}\12\0"
	.even
.globl _output_prologue
_output_prologue:
	link a6,#0
	movel a2,sp@-
	pea LC0
	lea _printf,a2
	jbsr a2@
	pea LC1
	jbsr a2@
	pea LC2
	jbsr a2@
	pea LC3
	jbsr a2@
	pea LC4
	jbsr a2@
	pea LC5
	jbsr a2@
	pea LC6
	jbsr a2@
	pea LC7
	jbsr a2@
	addw #32,sp
	pea LC8
	jbsr a2@
	pea LC9
	jbsr a2@
	pea LC10
	jbsr a2@
	pea LC11
	jbsr a2@
	pea LC12
	jbsr a2@
	pea LC13
	jbsr a2@
	pea LC14
	jbsr a2@
	pea LC15
	jbsr a2@
	addw #32,sp
	pea LC11
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
LC16:
	.ascii "\12char * const insn_template[] =\12  {\12\0"
LC17:
	.ascii "    \"%s\",\12\0"
LC18:
	.ascii "    0,\12\0"
LC19:
	.ascii "  };\12\0"
LC20:
	.ascii "\12char *(*const insn_outfun[])() =\12  {\12\0"
LC21:
	.ascii "    output_%d,\12\0"
LC22:
	.ascii "\12rtx (*const insn_gen_function[]) () =\12  {\12\0"
LC23:
	.ascii "    gen_%s,\12\0"
LC24:
	.ascii "\12const int insn_n_operands[] =\12  {\12\0"
LC25:
	.ascii "    %d,\12\0"
LC26:
	.ascii "\12const int insn_n_dups[] =\12  {\12\0"
LC27:
	.ascii "\12char *const insn_operand_constraint[][MAX_RECOG_OPERANDS] =\12  {\12\0"
LC28:
	.ascii "    {\0"
LC29:
	.ascii "wrong number of alternatives in operand %d of insn number %d\0"
LC30:
	.ascii " \"\",\0"
LC31:
	.ascii " \"%s\",\0"
LC32:
	.ascii " 0\0"
LC33:
	.ascii " },\12\0"
LC34:
	.ascii "\12const char insn_operand_address_p[][MAX_RECOG_OPERANDS] =\12  {\12\0"
LC35:
	.ascii " %d,\0"
LC36:
	.ascii "\12const enum machine_mode insn_operand_mode[][MAX_RECOG_OPERANDS] =\12  {\12\0"
LC37:
	.ascii " %smode,\0"
LC38:
	.ascii " VOIDmode\0"
LC39:
	.ascii "\12const char insn_operand_strict_low[][MAX_RECOG_OPERANDS] =\12  {\12\0"
LC40:
	.ascii "\12int (*const insn_operand_predicate[][MAX_RECOG_OPERANDS])() =\12  {\12\0"
LC41:
	.ascii "0\0"
LC42:
	.ascii " %s,\0"
LC43:
	.ascii "\12const INSN_MACHINE_INFO insn_machine_info[] =\12  {\12\0"
LC44:
	.ascii "    {%s},\12\0"
LC45:
	.ascii "     {0},\12\0"
LC46:
	.ascii "\12const int insn_n_alternatives[] =\12  {\12\0"
LC47:
	.ascii "     0,\12\0"
	.even
.globl _output_epilogue
_output_epilogue:
	link a6,#0
	moveml #0x3030,sp@-
	pea LC16
	jbsr _printf
	movel _insn_data,a2
	addqw #4,sp
	tstl a2
	jeq L117
L8:
	tstl a2@(8)
	jeq L6
	movel a2@(8),sp@-
	pea LC17
	jbsr _printf
	addqw #8,sp
	jra L5
L6:
	pea LC18
	jbsr _printf
	addqw #4,sp
L5:
	movel a2@(24),a2
	tstl a2
	jne L8
L117:
	pea LC19
	lea _printf,a2
	jbsr a2@
	pea LC20
	jbsr a2@
	movel _insn_data,a2
	addqw #8,sp
	tstl a2
	jeq L116
L14:
	tstb a2@(748)
	jeq L12
	movel a2@,sp@-
	pea LC21
	jbsr _printf
	addqw #8,sp
	jra L11
L12:
	pea LC18
	jbsr _printf
	addqw #4,sp
L11:
	movel a2@(24),a2
	tstl a2
	jne L14
L116:
	pea LC19
	lea _printf,a2
	jbsr a2@
	pea LC22
	jbsr a2@
	movel _insn_data,a2
	addqw #8,sp
	tstl a2
	jeq L115
L20:
	tstl a2@(4)
	jeq L18
	movel a2@(4),sp@-
	pea LC23
	jbsr _printf
	addqw #8,sp
	jra L17
L18:
	pea LC18
	jbsr _printf
	addqw #4,sp
L17:
	movel a2@(24),a2
	tstl a2
	jne L20
L115:
	pea LC19
	lea _printf,a2
	jbsr a2@
	pea LC24
	jbsr a2@
	movel _insn_data,a2
	addqw #8,sp
	tstl a2
	jeq L114
L24:
	movel a2@(12),sp@-
	pea LC25
	jbsr _printf
	addqw #8,sp
	movel a2@(24),a2
	tstl a2
	jne L24
L114:
	pea LC19
	lea _printf,a2
	jbsr a2@
	pea LC26
	jbsr a2@
	movel _insn_data,a2
	addqw #8,sp
	tstl a2
	jeq L113
L28:
	movel a2@(16),sp@-
	pea LC25
	jbsr _printf
	addqw #8,sp
	movel a2@(24),a2
	tstl a2
	jne L28
L113:
	pea LC19
	lea _printf,a2
	jbsr a2@
	addqw #4,sp
	tstl _have_constraints
	jeq L29
	pea LC27
	jbsr a2@
	movel _insn_data,a2
	addqw #4,sp
	tstl a2
	jeq L109
L48:
	clrl d3
	pea LC28
	jbsr _printf
	clrl d2
	addqw #4,sp
	cmpl a2@(12),d2
	jge L111
L40:
	lea a2@(d2:l:4),a0
	tstl a0@(188)
	jle L35
	tstl d3
	jne L37
	movel a0@(188),d3
	jra L35
L37:
	lea a2@(d2:l:4),a0
	cmpl a0@(188),d3
	jeq L35
	movel a2@,sp@-
	movel d2,sp@-
	pea LC29
	jbsr _error
	addw #12,sp
L35:
	addql #1,d2
	cmpl a2@(12),d2
	jlt L40
L111:
	movel d3,a2@(20)
	clrl d2
	cmpl a2@(12),d2
	jge L110
L46:
	tstl a2@(28,d2:l:4)
	jne L44
	pea LC30
	jbsr _printf
	addqw #4,sp
	jra L43
L44:
	movel a2@(28,d2:l:4),sp@-
	pea LC31
	jbsr _printf
	addqw #8,sp
L43:
	addql #1,d2
	cmpl a2@(12),d2
	jlt L46
L110:
	tstl a2@(12)
	jne L47
	pea LC32
	jbsr _printf
	addqw #4,sp
L47:
	pea LC33
	jbsr _printf
	addqw #4,sp
	movel a2@(24),a2
	tstl a2
	jne L48
	jra L109
L29:
	pea LC34
	jbsr _printf
	movel _insn_data,a2
	addqw #4,sp
	tstl a2
	jeq L109
L58:
	pea LC28
	jbsr _printf
	clrl d2
	addqw #4,sp
	cmpl a2@(12),d2
	jge L108
L56:
	lea a2@(0,d2:l),a0
	moveb a0@(508),d1
	extbl d1
	movel d1,sp@-
	pea LC35
	jbsr _printf
	addqw #8,sp
	addql #1,d2
	cmpl a2@(12),d2
	jlt L56
L108:
	tstl a2@(12)
	jne L57
	pea LC32
	jbsr _printf
	addqw #4,sp
L57:
	pea LC33
	jbsr _printf
	addqw #4,sp
	movel a2@(24),a2
	tstl a2
	jne L58
L109:
	pea LC19
	jbsr _printf
	addqw #4,sp
	pea LC36
	jbsr _printf
	movel _insn_data,a2
	addqw #4,sp
	tstl a2
	jeq L107
	lea _mode_name,a3
L67:
	pea LC28
	jbsr _printf
	clrl d2
	addqw #4,sp
	cmpl a2@(12),d2
	jge L106
L65:
	lea a2@(d2:l:4),a0
	movel a0@(548),d0
	movel a3@(d0:l:4),sp@-
	pea LC37
	jbsr _printf
	addqw #8,sp
	addql #1,d2
	cmpl a2@(12),d2
	jlt L65
L106:
	tstl a2@(12)
	jne L66
	pea LC38
	jbsr _printf
	addqw #4,sp
L66:
	pea LC33
	jbsr _printf
	addqw #4,sp
	movel a2@(24),a2
	tstl a2
	jne L67
L107:
	pea LC19
	lea _printf,a2
	jbsr a2@
	pea LC39
	jbsr a2@
	movel _insn_data,a2
	addqw #8,sp
	tstl a2
	jeq L105
L76:
	pea LC28
	jbsr _printf
	clrl d2
	addqw #4,sp
	cmpl a2@(12),d2
	jge L104
L74:
	lea a2@(0,d2:l),a0
	moveb a0@(708),d1
	extbl d1
	movel d1,sp@-
	pea LC35
	jbsr _printf
	addqw #8,sp
	addql #1,d2
	cmpl a2@(12),d2
	jlt L74
L104:
	tstl a2@(12)
	jne L75
	pea LC32
	jbsr _printf
	addqw #4,sp
L75:
	pea LC33
	jbsr _printf
	addqw #4,sp
	movel a2@(24),a2
	tstl a2
	jne L76
L105:
	pea LC19
	lea _printf,a2
	jbsr a2@
	pea LC40
	jbsr a2@
	movel _insn_data,a2
	addqw #8,sp
	tstl a2
	jeq L103
L87:
	pea LC28
	jbsr _printf
	clrl d2
	addqw #4,sp
	cmpl a2@(12),d2
	jge L102
L85:
	lea a2@(d2:l:4),a0
	tstl a0@(348)
	jeq L83
	movel a0@(348),a0
	tstb a0@
	jeq L83
	movel a0,d0
	jra L84
L83:
	movel #LC41,d0
L84:
	movel d0,sp@-
	pea LC42
	jbsr _printf
	addqw #8,sp
	addql #1,d2
	cmpl a2@(12),d2
	jlt L85
L102:
	tstl a2@(12)
	jne L86
	pea LC32
	jbsr _printf
	addqw #4,sp
L86:
	pea LC33
	jbsr _printf
	addqw #4,sp
	movel a2@(24),a2
	tstl a2
	jne L87
L103:
	pea LC19
	lea _printf,a2
	jbsr a2@
	pea LC43
	jbsr a2@
	movel _insn_data,a2
	addqw #8,sp
	tstl a2
	jeq L101
L93:
	tstl a2@(750)
	jeq L91
	movel a2@(750),sp@-
	pea LC44
	jbsr _printf
	addqw #8,sp
	jra L90
L91:
	pea LC45
	jbsr _printf
	addqw #4,sp
L90:
	movel a2@(24),a2
	tstl a2
	jne L93
L101:
	pea LC19
	lea _printf,a2
	jbsr a2@
	pea LC46
	jbsr a2@
	movel _insn_data,a2
	addqw #8,sp
	tstl a2
	jeq L100
L99:
	tstl a2@(20)
	jeq L97
	movel a2@(20),sp@-
	pea LC25
	jbsr _printf
	addqw #8,sp
	jra L96
L97:
	pea LC47
	jbsr _printf
	addqw #4,sp
L96:
	movel a2@(24),a2
	tstl a2
	jne L99
L100:
	pea LC19
	jbsr _printf
	moveml a6@(-16),#0xc0c
	unlk a6
	rts
LC48:
	.ascii "Too many operands (%d) in one instruction pattern.\12\0"
	.even
.globl _scan_operands
_scan_operands:
	link a6,#0
	moveml #0x3830,sp@-
	movel a6@(8),a3
	tstl a3
	jeq L118
	clrl d0
	movew a3@,d0
	moveq #4,d1
	cmpl d0,d1
	jne L120
	movel a3@(4),d2
	cmpl _max_opno,d2
	jle L121
	movel d2,_max_opno
L121:
	moveq #39,d1
	cmpl _max_opno,d1
	jge L122
	movel _max_opno,d1
	addql #1,d1
	movel d1,sp@-
	pea LC48
	jbsr _error
	addqw #8,sp
L122:
	lea _modes,a0
	clrl d0
	moveb a3@(2),d0
	movel d0,a0@(d2:l:4)
	lea _strict_low,a0
	moveb a6@(19),a0@(d2:l)
	lea _predicates,a0
	movel a3@(8),a0@(d2:l:4)
	lea _constraints,a0
	movel a3@(12),a0@(d2:l:4)
	jeq L123
	movel a3@(12),a0
	tstb a0@
	jeq L123
	movel a0,sp@-
	pea 44:w
	jbsr _n_occurrences
	lea _op_n_alternatives,a0
	addql #1,d0
	movel d0,a0@(d2:l:4)
	moveq #1,d1
	movel d1,_have_constraints
L123:
	lea _address_p,a0
	moveb a6@(15),a0@(d2:l)
	jra L118
L120:
	moveq #6,d1
	cmpl d0,d1
	jne L124
	movel a3@(4),d2
	cmpl _max_opno,d2
	jle L125
	movel d2,_max_opno
L125:
	moveq #39,d1
	cmpl _max_opno,d1
	jge L126
	movel _max_opno,d1
	addql #1,d1
	movel d1,sp@-
	pea LC48
	jbsr _error
	addqw #8,sp
L126:
	lea _modes,a0
	clrl d0
	moveb a3@(2),d0
	movel d0,a0@(d2:l:4)
	lea _strict_low,a0
	clrb a0@(d2:l)
	lea _predicates,a0
	movel a3@(8),a0@(d2:l:4)
	lea _constraints,a0
	clrl a0@(d2:l:4)
	lea _address_p,a0
	clrb a0@(d2:l)
	clrl d3
	jra L127
L130:
	clrl sp@-
	clrl sp@-
	movel a3@(12),a0
	movel a0@(4,d3:l:4),sp@-
	jbsr _scan_operands
	addw #12,sp
	addql #1,d3
L127:
	movel a3@(12),a0
	cmpl a0@,d3
	jcs L130
	jra L118
L124:
	moveq #5,d1
	cmpl d0,d1
	jne L131
	addql #1,_num_dups
	jra L118
L131:
	moveq #12,d1
	cmpl d0,d1
	jne L132
	clrl sp@-
	pea 1:w
	jra L148
L132:
	moveq #36,d1
	cmpl d0,d1
	jne L133
	pea 1:w
	clrl sp@-
L148:
	movel a3@(4),sp@-
	jbsr _scan_operands
	jra L118
L133:
	clrl d0
	movew a3@,d0
	lea _rtx_format,a0
	movel a0@(d0:l:4),a2
	clrl d3
	clrl d4
	jra L134
L147:
	moveb a2@+,d0
	cmpb #69,d0
	jeq L139
	cmpb #101,d0
	jne L136
	clrl sp@-
	clrl sp@-
	movel a3@(4,d3:l:4),sp@-
	jbsr _scan_operands
	addw #12,sp
	jra L136
L139:
	tstl a3@(4,d3:l:4)
	jeq L136
	clrl d2
	jra L141
L144:
	clrl sp@-
	clrl sp@-
	movel a3@(4,d3:l:4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _scan_operands
	addw #12,sp
	addql #1,d2
L141:
	movel a3@(4,d3:l:4),a0
	cmpl a0@,d2
	jcs L144
L136:
	addql #1,d3
L134:
	movew a3@,d4
	lea _rtx_length,a0
	cmpl a0@(d4:l:4),d3
	jlt L147
L118:
	moveml a6@(-20),#0xc1c
	unlk a6
	rts
LC49:
	.ascii "\12char *\12\0"
LC50:
	.ascii "output_%d (operands, insn)\12\0"
LC51:
	.ascii "     rtx *operands;\12\0"
LC52:
	.ascii "     rtx insn;\12\0"
LC53:
	.ascii "{\12\0"
LC54:
	.ascii "}\12\0"
	.even
.globl _gen_insn
_gen_insn:
	link a6,#0
	moveml #0x2038,sp@-
	movel a6@(8),a4
	pea 754:w
	jbsr _xmalloc
	movel d0,a3
	movel _next_code_number,a3@
	addql #1,_next_code_number
	movel a4@(4),a0
	addqw #4,sp
	tstb a0@
	jeq L150
	movel a0,a3@(4)
	jra L151
L150:
	clrl a3@(4)
L151:
	clrl a3@(24)
	tstl _end_of_insn_data
	jeq L152
	movel _end_of_insn_data,a0
	movel a3,a0@(24)
	jra L153
L152:
	movel a3,_insn_data
L153:
	movel a3,_end_of_insn_data
	moveq #-1,d1
	movel d1,_max_opno
	clrl _num_dups
	pea 160:w
	pea _constraints
	lea _mybzero,a2
	jbsr a2@
	pea 160:w
	pea _op_n_alternatives
	jbsr a2@
	pea 160:w
	pea _predicates
	jbsr a2@
	pea 40:w
	pea _address_p
	jbsr a2@
	addw #32,sp
	pea 160:w
	pea _modes
	jbsr a2@
	pea 40:w
	pea _strict_low
	jbsr a2@
	clrl d2
	addw #16,sp
	jra L154
L157:
	clrl sp@-
	clrl sp@-
	movel a4@(8),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _scan_operands
	addw #12,sp
	addql #1,d2
L154:
	movel a4@(8),a0
	cmpl a0@,d2
	jcs L157
	movel _max_opno,d1
	addql #1,d1
	movel d1,a3@(12)
	movel _num_dups,a3@(16)
	pea 160:w
	pea a3@(28)
	pea _constraints
	lea _mybcopy,a2
	jbsr a2@
	pea 160:w
	pea a3@(188)
	pea _op_n_alternatives
	jbsr a2@
	pea 160:w
	pea a3@(348)
	pea _predicates
	jbsr a2@
	addw #36,sp
	pea 40:w
	pea a3@(508)
	pea _address_p
	jbsr a2@
	pea 160:w
	pea a3@(548)
	pea _modes
	jbsr a2@
	pea 40:w
	pea a3@(708)
	pea _strict_low
	jbsr a2@
	movel a4@(20),a3@(750)
	movel a4@(16),a0
	addw #36,sp
	cmpb #42,a0@
	jeq L158
	movel a0,a3@(8)
	clrb a3@(748)
	jra L149
L158:
	clrl a3@(8)
	moveb #1,a3@(748)
	pea LC49
	lea _printf,a2
	jbsr a2@
	movel a3@,sp@-
	pea LC50
	jbsr a2@
	pea LC51
	jbsr a2@
	pea LC52
	jbsr a2@
	pea LC53
	jbsr a2@
	movel a4@(16),a2
	addqw #1,a2
	addw #24,sp
	tstb a2@
	jeq L174
	lea __iob+20,a3
	lea a3@(4),a4
L167:
	subql #1,a3@
	jmi L161
	movel a4@,a0
	moveb a2@+,a0@
	addql #1,a4@
	jra L159
L161:
	tstb __iob+37
	jge L163
	movel a3@,d0
	negl d0
	cmpl __iob+32,d0
	jge L163
	movel __iob+24,a0
	moveb a2@+,d0
	moveb d0,a0@
	cmpb #10,d0
	jeq L165
	addql #1,a4@
	jra L159
L165:
	movel a3,sp@-
	movel __iob+24,a0
	clrl d0
	moveb a0@,d0
	jra L175
L163:
	movel a3,sp@-
	clrl d0
	moveb a2@+,d0
L175:
	movel d0,sp@-
	jbsr __flsbuf
	addqw #8,sp
L159:
	tstb a2@
	jne L167
L174:
	lea __iob+20,a0
	subql #1,a0@
	jmi L168
	addqw #4,a0
	movel a0@,a1
	moveb #10,a1@
	addql #1,a0@
	jra L169
L168:
	lea __iob+20,a1
	tstb __iob+37
	jge L170
	movel a1@,d0
	negl d0
	cmpl __iob+32,d0
	jge L170
	movel __iob+24,a0
	moveb #10,a0@
	movel a1,sp@-
	movel __iob+24,a0
	clrl d0
	moveb a0@,d0
	movel d0,sp@-
	jra L176
L170:
	pea __iob+20
	pea 10:w
L176:
	jbsr __flsbuf
	addqw #8,sp
L169:
	pea LC54
	jbsr _printf
L149:
	moveml a6@(-16),#0x1c04
	unlk a6
	rts
LC55:
	.ascii "%s\12\0"
	.even
.globl _gen_peephole
_gen_peephole:
	link a6,#0
	moveml #0x2038,sp@-
	movel a6@(8),a4
	pea 754:w
	jbsr _xmalloc
	movel d0,a3
	movel _next_code_number,a3@
	addql #1,_next_code_number
	clrl a3@(4)
	clrl a3@(24)
	addqw #4,sp
	tstl _end_of_insn_data
	jeq L178
	movel _end_of_insn_data,a0
	movel a3,a0@(24)
	jra L179
L178:
	movel a3,_insn_data
L179:
	movel a3,_end_of_insn_data
	moveq #-1,d1
	movel d1,_max_opno
	pea 160:w
	pea _constraints
	lea _mybzero,a2
	jbsr a2@
	pea 160:w
	pea _op_n_alternatives
	jbsr a2@
	clrl d2
	addw #16,sp
	jra L180
L183:
	clrl sp@-
	clrl sp@-
	movel a4@(4),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _scan_operands
	addw #12,sp
	addql #1,d2
L180:
	movel a4@(4),a0
	cmpl a0@,d2
	jcs L183
	movel _max_opno,d1
	addql #1,d1
	movel d1,a3@(12)
	clrl a3@(16)
	pea 160:w
	pea a3@(28)
	pea _constraints
	lea _mybcopy,a2
	jbsr a2@
	pea 160:w
	pea a3@(188)
	pea _op_n_alternatives
	jbsr a2@
	pea 160:w
	pea a3@(348)
	lea _mybzero,a2
	jbsr a2@
	addw #32,sp
	pea 40:w
	pea a3@(508)
	jbsr a2@
	pea 160:w
	pea a3@(548)
	jbsr a2@
	pea 40:w
	pea a3@(708)
	jbsr a2@
	movel a4@(16),a3@(750)
	movel a4@(12),a0
	addw #24,sp
	cmpb #42,a0@
	jeq L184
	movel a0,a3@(8)
	clrb a3@(748)
	jra L177
L184:
	clrl a3@(8)
	moveb #1,a3@(748)
	pea LC49
	lea _printf,a2
	jbsr a2@
	movel a3@,sp@-
	pea LC50
	jbsr a2@
	pea LC51
	jbsr a2@
	pea LC52
	jbsr a2@
	pea LC53
	jbsr a2@
	movel a4@(12),d1
	addql #1,d1
	movel d1,sp@-
	pea LC55
	jbsr a2@
	addw #32,sp
	pea LC54
	jbsr a2@
L177:
	moveml a6@(-16),#0x1c04
	unlk a6
	rts
	.even
.globl _gen_expand
_gen_expand:
	link a6,#0
	moveml #0x2038,sp@-
	movel a6@(8),a4
	pea 754:w
	jbsr _xmalloc
	movel d0,a3
	movel _next_code_number,a3@
	addql #1,_next_code_number
	movel a4@(4),a0
	addqw #4,sp
	tstb a0@
	jeq L186
	movel a0,a3@(4)
	jra L187
L186:
	clrl a3@(4)
L187:
	clrl a3@(24)
	tstl _end_of_insn_data
	jeq L188
	movel _end_of_insn_data,a0
	movel a3,a0@(24)
	jra L189
L188:
	movel a3,_insn_data
L189:
	movel a3,_end_of_insn_data
	moveq #-1,d1
	movel d1,_max_opno
	clrl _num_dups
	pea 160:w
	pea _predicates
	lea _mybzero,a2
	jbsr a2@
	pea 160:w
	pea _modes
	jbsr a2@
	addw #16,sp
	tstl a4@(8)
	jeq L190
	clrl d2
	jra L191
L194:
	clrl sp@-
	clrl sp@-
	movel a4@(8),a0
	movel a0@(4,d2:l:4),sp@-
	jbsr _scan_operands
	addw #12,sp
	addql #1,d2
L191:
	movel a4@(8),a0
	cmpl a0@,d2
	jcs L194
L190:
	movel _max_opno,d1
	addql #1,d1
	movel d1,a3@(12)
	pea 160:w
	pea a3@(348)
	pea _predicates
	lea _mybcopy,a2
	jbsr a2@
	pea 160:w
	pea a3@(548)
	pea _modes
	jbsr a2@
	pea 160:w
	pea a3@(28)
	lea _mybzero,a2
	jbsr a2@
	addw #32,sp
	pea 160:w
	pea a3@(188)
	jbsr a2@
	pea 40:w
	pea a3@(508)
	jbsr a2@
	pea 40:w
	pea a3@(708)
	jbsr a2@
	clrl a3@(16)
	clrl a3@(8)
	clrb a3@(748)
	clrl a3@(750)
	moveml a6@(-16),#0x1c04
	unlk a6
	rts
LC56:
	.ascii "virtual memory exhausted\0"
	.even
.globl _xmalloc
_xmalloc:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),sp@-
	jbsr _malloc
	movel d0,d2
	addqw #4,sp
	jne L196
	pea LC56
	jbsr _fatal
L196:
	movel d2,d0
	movel a6@(-4),d2
	unlk a6
	rts
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
	jne L198
	pea LC56
	jbsr _fatal
L198:
	movel d2,d0
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _mybzero
_mybzero:
	link a6,#0
	movel a6@(8),a0
	movel a6@(12),d0
	jra L200
L202:
	clrb a0@+
L200:
	subql #1,d0
	moveq #-1,d1
	cmpl d0,d1
	jlt L202
	unlk a6
	rts
	.even
.globl _mybcopy
_mybcopy:
	link a6,#0
	movel a6@(8),a1
	movel a6@(12),a0
	movel a6@(16),d0
	jra L204
L206:
	moveb a1@+,a0@+
L204:
	subql #1,d0
	moveq #-1,d1
	cmpl d0,d1
	jlt L206
	unlk a6
	rts
LC57:
	.ascii "genoutput: \0"
LC58:
	.ascii "\12\0"
	.even
.globl _fatal
_fatal:
	link a6,#0
	moveml #0x2020,sp@-
	pea LC57
	movel #__iob+40,d2
	movel d2,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	movel d2,sp@-
	jbsr a2@
	pea LC58
	movel d2,sp@-
	jbsr a2@
	addw #32,sp
	pea 33:w
	jbsr _exit
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _error
_error:
	link a6,#0
	moveml #0x2020,sp@-
	pea LC57
	movel #__iob+40,d2
	movel d2,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	movel d2,sp@-
	jbsr a2@
	pea LC58
	movel d2,sp@-
	jbsr a2@
	moveml a6@(-8),#0x404
	unlk a6
	rts
LC59:
	.ascii "No input file name.\0"
LC60:
	.ascii "r\0"
	.even
.globl _main
_main:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(12),a2
	pea _free
	pea _xmalloc
	clrl sp@-
	clrl sp@-
	movel _rtl_obstack,sp@-
	jbsr __obstack_begin
	addw #20,sp
	moveq #1,d1
	cmpl a6@(8),d1
	jlt L210
	pea LC59
	jbsr _fatal
	addqw #4,sp
L210:
	pea LC60
	movel a2@(4),sp@-
	jbsr _fopen
	movel d0,d2
	addqw #8,sp
	jne L211
	movel a2@(4),sp@-
	jbsr _perror
	pea 33:w
	jbsr _exit
	addqw #8,sp
L211:
	jbsr _init_rtl
	jbsr _output_prologue
	clrl _next_code_number
	clrl _have_constraints
L212:
	movel d2,sp@-
	jbsr _read_skip_spaces
	addqw #4,sp
	moveq #-1,d1
	cmpl d0,d1
	jeq L213
	movel d2,sp@-
	movel d0,sp@-
	jbsr _ungetc
	movel d2,sp@-
	jbsr _read_rtx
	movel d0,a2
	addw #12,sp
	cmpw #7,a2@
	jne L215
	movel a2,sp@-
	jbsr _gen_insn
	addqw #4,sp
L215:
	cmpw #8,a2@
	jne L216
	movel a2,sp@-
	jbsr _gen_peephole
	addqw #4,sp
L216:
	cmpw #10,a2@
	jne L212
	movel a2,sp@-
	jbsr _gen_expand
	addqw #4,sp
	jra L212
L213:
	jbsr _output_epilogue
	pea __iob+20
	jbsr _fflush
	addqw #4,sp
	btst #5,__iob+37
	sne d0
	btst #0,d0
	jeq L218
	moveq #33,d0
	jra L219
L218:
	clrl d0
L219:
	movel d0,sp@-
	jbsr _exit
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _n_occurrences
_n_occurrences:
	link a6,#0
	moveb a6@(11),d1
	movel a6@(12),a0
	clrl d0
L226:
	tstb a0@
	jeq L225
	cmpb a0@+,d1
	jne L226
	addql #1,d0
	jra L226
L225:
	unlk a6
	rts
.comm _strict_low,40
.comm _modes,160
.comm _address_p,40
.comm _predicates,160
.comm _op_n_alternatives,160
.comm _constraints,160
.comm _num_dups,4
.comm _max_opno,4
.comm _have_constraints,4
.comm _end_of_insn_data,4
.comm _insn_data,4
.comm _next_code_number,4
.comm _obstack,36
