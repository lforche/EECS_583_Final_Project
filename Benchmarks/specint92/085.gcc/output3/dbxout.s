#NO_APP
gcc_compiled.:
.text
LC0:
	.ascii "\11.stabs \"%s\",%d,0,0,Ltext\12Ltext:\12\0"
	.even
.globl _dbxout_init
_dbxout_init:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),_asmfile
	moveq #100,d1
	movel d1,_typevec_len
	asll #2,d1
	movel d1,sp@-
	jbsr _xmalloc
	movel d0,_typevec
	movel _typevec_len,d1
	asll #2,d1
	movel d1,sp@-
	clrl sp@-
	movel d0,sp@-
	jbsr _memset
	pea 100:w
	movel a6@(12),sp@-
	pea LC0
	movel _asmfile,sp@-
	jbsr _fprintf
	moveq #1,d1
	movel d1,_next_type_number
	moveq #2,d1
	movel d1,_next_block_number
	addw #32,sp
	clrl sp@-
	movel _integer_type_node,a0
	movel a0@(48),sp@-
	lea _dbxout_symbol,a2
	jbsr a2@
	clrl sp@-
	movel _char_type_node,a0
	movel a0@(48),sp@-
	jbsr a2@
	jbsr _get_permanent_types
	movel d0,sp@-
	jbsr _dbxout_types
	movel a6@(-4),a2
	unlk a6
	rts
LC1:
	.ascii "\\\\\0"
LC2:
	.ascii ".stabs \"\0"
	.even
_dbxout_continue:
	link a6,#0
	movel a2,sp@-
	pea LC1
	movel _asmfile,sp@-
	lea _fprintf,a2
	jbsr a2@
	jbsr _dbxout_finish_symbol
	pea LC2
	movel _asmfile,sp@-
	jbsr a2@
	clrl _current_sym_nchars
	movel a6@(-4),a2
	unlk a6
	rts
LC3:
	.ascii "%d\0"
LC4:
	.ascii "=\0"
LC5:
	.ascii "r2;0;127;\0"
LC6:
	.ascii "r1;%d;%d;\0"
LC7:
	.ascii "r1;%d;0;\0"
LC8:
	.ascii "ar1;0;%d;\0"
LC9:
	.ascii "xs\0"
LC10:
	.ascii "xu\0"
LC11:
	.ascii ":\0"
LC12:
	.ascii "s%d\0"
LC13:
	.ascii "u%d\0"
LC14:
	.ascii "%s:\0"
LC15:
	.ascii ":%s\0"
LC16:
	.ascii ",0,0;\0"
LC17:
	.ascii ",%d,%d;\0"
LC18:
	.ascii "xe\0"
LC19:
	.ascii "%s:%d,\0"
	.even
_dbxout_type:
	link a6,#0
	moveml #0x3030,sp@-
	movel a6@(8),a3
	movel a6@(12),d2
	cmpl _error_mark_node,a3
	jne L4
	movel _integer_type_node,a3
	jra L5
L4:
	tstl a3@(24)
	jne L5
	movel a3@(60),a3
L5:
	tstl a3@(44)
	jne L7
	movel _next_type_number,a3@(44)
	addql #1,_next_type_number
	movel _next_type_number,d3
	cmpl _typevec_len,d3
	jne L7
	movel _typevec_len,d3
	asll #3,d3
	movel d3,sp@-
	movel _typevec,sp@-
	jbsr _xrealloc
	movel d0,_typevec
	movel _typevec_len,d0
	asll #2,d0
	movel d0,sp@-
	clrl sp@-
	addl _typevec,d0
	movel d0,sp@-
	jbsr _memset
	movel _typevec_len,d3
	asll #1,d3
	movel d3,_typevec_len
	addw #20,sp
L7:
	movel a3@(44),sp@-
	pea LC3
	movel _asmfile,sp@-
	jbsr _fprintf
	addql #3,_current_sym_nchars
	addw #12,sp
	movel a3@(44),d0
	movel _typevec,a0
	movel a0@(d0:l:4),d0
	moveq #1,d3
	cmpl d0,d3
	jeq L11
	moveq #1,d3
	cmpl d0,d3
	jge L9
	moveq #2,d3
	cmpl d0,d3
	jeq L3
	jra L9
L11:
	tstl d2
	jeq L3
L9:
	pea LC4
	movel _asmfile,sp@-
	jbsr _fprintf
	addql #1,_current_sym_nchars
	movel a3@(44),d0
	movel _typevec,a0
	moveq #2,d3
	movel d3,a0@(d0:l:4)
	addqw #8,sp
	clrl d0
	moveb a3@(12),d0
	subql #4,d0
	moveq #17,d3
	cmpl d3,d0
	jhi L178
LI179:
	movew pc@(L179-LI179-2:b,d0:l:2),d3
	jmp pc@(2,d3:w)
L179:
	.word L18-L179
	.word L19-L179
	.word L22-L179
	.word L178-L179
	.word L96-L179
	.word L178-L179
	.word L178-L179
	.word L121-L179
	.word L143-L179
	.word L158-L179
	.word L128-L179
	.word L178-L179
	.word L23-L179
	.word L178-L179
	.word L178-L179
	.word L27-L179
	.word L27-L179
	.word L171-L179
L18:
	movel a3@(44),sp@-
	pea LC3
	movel _asmfile,sp@-
	jbsr _fprintf
	addql #3,_current_sym_nchars
	jra L3
L19:
	cmpl _char_type_node,a3
	jne L20
	btst #3,a3@(14)
	jne L20
	pea LC5
	movel _asmfile,sp@-
	jbsr _fprintf
	jra L21
L20:
	movel a3@(52),a0
	movel a0@(16),sp@-
	movel a3@(20),a0
	movel a0@(16),sp@-
	pea LC6
	movel _asmfile,sp@-
	jbsr _fprintf
L21:
	moveq #25,d3
	addl d3,_current_sym_nchars
	jra L3
L22:
	movel a3,sp@-
	jbsr _size_in_bytes
	movel d0,a0
	movel a0@(16),sp@-
	pea LC7
	movel _asmfile,sp@-
	jbsr _fprintf
	moveq #16,d3
	addl d3,_current_sym_nchars
	jra L3
L23:
	tstl a3@(16)
	jeq L24
	movel a3@(16),a0
	movel a0@(52),a0
	movel a0@(16),d0
	jra L25
L24:
	moveq #-1,d0
L25:
	movel d0,sp@-
	pea LC8
	movel _asmfile,sp@-
	jbsr _fprintf
	moveq #17,d3
	addl d3,_current_sym_nchars
	jra L182
L27:
	tstl a3@(48)
	jeq L30
	tstl d2
	jeq L29
L30:
	tstl a3@(24)
	jne L28
L29:
	cmpb #19,a3@(12)
	jne L31
	movel #LC9,d0
	jra L32
L31:
	movel #LC10,d0
L32:
	movel d0,sp@-
	movel _asmfile,sp@-
	lea _fprintf,a2
	jbsr a2@
	addql #3,_current_sym_nchars
	movel a3,sp@-
	jbsr _dbxout_type_name
	pea LC11
	movel _asmfile,sp@-
	jbsr a2@
	movel a3@(44),d0
	movel _typevec,a0
	moveq #1,d3
	movel d3,a0@(d0:l:4)
	jra L3
L28:
	movel a3,sp@-
	jbsr _size_in_bytes
	movel d0,a2
	movel a2@(16),sp@-
	cmpb #19,a3@(12)
	jne L33
	movel #LC12,d0
	jra L34
L33:
	movel #LC13,d0
L34:
	movel d0,sp@-
	movel _asmfile,sp@-
	jbsr _fprintf
	addw #16,sp
	tstl a3@(64)
	jeq L35
	tstl _use_gdb_dbx_extensions
	jeq L35
	movel _asmfile,a0
	subql #1,a0@
	jmi L36
	addqw #4,a0
	movel a0@,a1
	moveb #33,a1@
	addql #1,a0@
	jra L37
L36:
	movel _asmfile,a0
	tstb a0@(17)
	jge L38
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L38
	movel a0@(4),a0
	moveb #33,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L37
L38:
	movel _asmfile,sp@-
	pea 33:w
	jbsr __flsbuf
	addqw #8,sp
L37:
	movel _asmfile,a0
	subql #1,a0@
	jmi L42
	addqw #4,a0
	movel a0@,a1
	addql #1,a0@
	movel a3@(64),a0
	btst #6,a0@(13)
	jeq L44
	moveb #50,d0
	jra L45
L44:
	moveb #48,d0
L45:
	moveb d0,a1@
	jra L43
L42:
	movel _asmfile,a0
	tstb a0@(17)
	jge L46
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L46
	movel a0@(4),a1
	movel a3@(64),a0
	btst #6,a0@(13)
	jeq L50
	moveb #50,d0
	jra L51
L50:
	moveb #48,d0
L51:
	moveb d0,a1@
	cmpb #10,d0
	jeq L48
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L43
L48:
	movel _asmfile,sp@-
	movel _asmfile,a0
	movel a0@(4),a0
	clrl d0
	moveb a0@,d0
	jra L183
L46:
	movel _asmfile,sp@-
	movel a3@(64),a0
	btst #6,a0@(13)
	jeq L52
	moveb #50,d1
	jra L53
L52:
	moveb #48,d1
L53:
	clrl d0
	moveb d1,d0
L183:
	movel d0,sp@-
	jbsr __flsbuf
	addqw #8,sp
L43:
	clrl sp@-
	movel a3@(64),a0
	movel a0@(20),sp@-
	jbsr _dbxout_type
	movel _asmfile,a0
	subql #1,a0@
	addqw #8,sp
	jmi L54
	addqw #4,a0
	movel a0@,a1
	moveb #44,a1@
	addql #1,a0@
	jra L55
L54:
	movel _asmfile,a0
	tstb a0@(17)
	jge L56
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L56
	movel a0@(4),a0
	moveb #44,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L55
L56:
	movel _asmfile,sp@-
	pea 44:w
	jbsr __flsbuf
	addqw #8,sp
L55:
	addql #3,_current_sym_nchars
L35:
	moveq #11,d3
	addl d3,_current_sym_nchars
	movel a3@(16),a2
	tstl a2
	jeq L181
L89:
	tstl a2@(36)
	jeq L62
	cmpl a3@(16),a2
	jeq L64
	moveq #80,d3
	cmpl _current_sym_nchars,d3
	jge L64
	jbsr _dbxout_continue
L64:
	movel a2@(36),a0
	movel a0@(20),sp@-
	pea LC14
	movel _asmfile,sp@-
	jbsr _fprintf
	movel _current_sym_nchars,d0
	addql #2,d0
	movel a2@(36),a0
	addl a0@(16),d0
	movel d0,_current_sym_nchars
	addw #12,sp
	tstl _use_gdb_dbx_extensions
	jeq L69
	movel _asmfile,a0
	subql #1,a0@
	jmi L70
	addqw #4,a0
	movel a0@,a1
	moveb #47,a1@
	addql #1,a0@
	jra L71
L70:
	movel _asmfile,a0
	tstb a0@(17)
	jge L72
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L72
	movel a0@(4),a0
	moveb #47,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L71
L72:
	movel _asmfile,sp@-
	pea 47:w
	jbsr __flsbuf
	addqw #8,sp
L71:
	addql #2,_current_sym_nchars
	cmpb #39,a2@(12)
	jne L76
	movel _asmfile,a0
	subql #1,a0@
	jmi L77
	addqw #4,a0
	movel a0@,a1
	moveb #58,a1@
	addql #1,a0@
	jra L78
L77:
	movel _asmfile,a0
	tstb a0@(17)
	jge L79
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L79
	movel a0@(4),a0
	moveb #58,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L78
L79:
	movel _asmfile,sp@-
	pea 58:w
	jbsr __flsbuf
	addqw #8,sp
L78:
	addql #1,_current_sym_nchars
	clrl sp@-
	movel a2@(8),sp@-
	jbsr _dbxout_type
	movel a2@(8),a0
	movel a0@(16),sp@-
	jbsr _dbxout_args
	movel a2@(64),a0
	movel a0@(4),a0
	movel a0@(4),sp@-
	jbsr _strlen
	movel _current_sym_nchars,d1
	addql #3,d1
	addl d0,d1
	movel d1,_current_sym_nchars
	addw #16,sp
	jra L84
L76:
L69:
	clrl sp@-
	movel a2@(8),sp@-
	jbsr _dbxout_type
	addqw #8,sp
L84:
	cmpb #43,a2@(12)
	jne L85
	tstl _use_gdb_dbx_extensions
	jeq L86
	movel a2@(64),a0
	movel a0@(4),a0
	movel a0@(4),sp@-
	pea LC15
	movel _asmfile,sp@-
	jbsr _fprintf
	movel a2@(64),a0
	movel a0@(4),a0
	movel a0@(4),sp@-
	jbsr _strlen
	movel _current_sym_nchars,d1
	addql #2,d1
	addl d0,d1
	movel d1,_current_sym_nchars
	jra L184
L86:
	pea LC16
	movel _asmfile,sp@-
	jbsr _fprintf
	addql #5,_current_sym_nchars
	addqw #8,sp
	jra L62
L85:
	movel a2@(24),a0
	clrl d0
	moveb a2@(32),d0
	mulsl a0@(16),d0
	movel d0,sp@-
	movel a2@(44),sp@-
	pea LC17
	movel _asmfile,sp@-
	jbsr _fprintf
	moveq #23,d3
	addl d3,_current_sym_nchars
L184:
	addw #16,sp
L62:
	movel a2@(4),a2
	tstl a2
	jne L89
L181:
	movel _asmfile,a0
	subql #1,a0@
	jmi L90
	addqw #4,a0
	movel a0@,a1
	moveb #59,a1@
	addql #1,a0@
	jra L185
L90:
	movel _asmfile,a0
	tstb a0@(17)
	jge L117
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L117
	movel a0@(4),a0
	moveb #59,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L185
L96:
	tstl a3@(48)
	jeq L99
	tstl d2
	jeq L98
L99:
	tstl a3@(24)
	jne L97
L98:
	pea LC18
	movel _asmfile,sp@-
	lea _fprintf,a2
	jbsr a2@
	addql #3,_current_sym_nchars
	movel a3,sp@-
	jbsr _dbxout_type_name
	movel a3@(44),d0
	movel _typevec,a0
	moveq #1,d3
	movel d3,a0@(d0:l:4)
	pea LC11
	movel _asmfile,sp@-
	jbsr a2@
	jra L3
L97:
	movel _asmfile,a0
	subql #1,a0@
	jmi L100
	addqw #4,a0
	movel a0@,a1
	moveb #101,a1@
	addql #1,a0@
	jra L101
L100:
	movel _asmfile,a0
	tstb a0@(17)
	jge L102
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L102
	movel a0@(4),a0
	moveb #101,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L101
L102:
	movel _asmfile,sp@-
	pea 101:w
	jbsr __flsbuf
	addqw #8,sp
L101:
	addql #1,_current_sym_nchars
	movel a3@(16),a2
	tstl a2
	jeq L180
L114:
	movel a2@(20),a0
	movel a0@(16),sp@-
	movel a2@(16),a0
	movel a0@(20),sp@-
	pea LC19
	movel _asmfile,sp@-
	jbsr _fprintf
	moveq #11,d0
	addl _current_sym_nchars,d0
	movel a2@(16),a0
	addl a0@(16),d0
	movel d0,_current_sym_nchars
	addw #16,sp
	tstl a2@(4)
	jeq L108
	moveq #80,d3
	cmpl _current_sym_nchars,d3
	jge L108
	jbsr _dbxout_continue
L108:
	movel a2@(4),a2
	tstl a2
	jne L114
L180:
	movel _asmfile,a0
	subql #1,a0@
	jmi L115
	addqw #4,a0
	movel a0@,a1
	moveb #59,a1@
	addql #1,a0@
	jra L116
L115:
	movel _asmfile,a0
	tstb a0@(17)
	jge L117
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L117
	movel a0@(4),a0
	moveb #59,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L116
L117:
	movel _asmfile,sp@-
	pea 59:w
	jbsr __flsbuf
L116:
L185:
	addql #1,_current_sym_nchars
	jra L3
L121:
	movel _asmfile,a0
	subql #1,a0@
	jmi L122
	addqw #4,a0
	movel a0@,a1
	moveb #42,a1@
	addql #1,a0@
	jra L186
L122:
	movel _asmfile,a0
	tstb a0@(17)
	jge L124
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L124
	movel a0@(4),a0
	moveb #42,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L186
L124:
	movel _asmfile,sp@-
	pea 42:w
	jra L188
L128:
	tstl _use_gdb_dbx_extensions
	jeq L182
	movel _asmfile,a0
	subql #1,a0@
	jmi L130
	addqw #4,a0
	movel a0@,a1
	moveb #64,a1@
	addql #1,a0@
	jra L131
L130:
	movel _asmfile,a0
	tstb a0@(17)
	jge L132
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L132
	movel a0@(4),a0
	moveb #64,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L131
L132:
	movel _asmfile,sp@-
	pea 64:w
	jbsr __flsbuf
	addqw #8,sp
L131:
	addql #1,_current_sym_nchars
	clrl sp@-
	movel a3@(52),sp@-
	jbsr _dbxout_type
	movel _asmfile,a0
	subql #1,a0@
	addqw #8,sp
	jmi L136
	addqw #4,a0
	movel a0@,a1
	moveb #44,a1@
	addql #1,a0@
	jra L186
L136:
	movel _asmfile,a0
	tstb a0@(17)
	jge L138
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L138
	movel a0@(4),a0
	moveb #44,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L186
L138:
	movel _asmfile,sp@-
	pea 44:w
	jra L188
L143:
	tstl _use_gdb_dbx_extensions
	jeq L182
	movel _asmfile,a0
	subql #1,a0@
	jmi L145
	addqw #4,a0
	movel a0@,a1
	moveb #64,a1@
	addql #1,a0@
	jra L146
L145:
	movel _asmfile,a0
	tstb a0@(17)
	jge L147
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L147
	movel a0@(4),a0
	moveb #64,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L146
L147:
	movel _asmfile,sp@-
	pea 64:w
	jbsr __flsbuf
	addqw #8,sp
L146:
	addql #1,_current_sym_nchars
	clrl sp@-
	movel a3@(52),sp@-
	jbsr _dbxout_type
	movel _asmfile,a0
	subql #1,a0@
	addqw #8,sp
	jmi L151
	addqw #4,a0
	movel a0@,a1
	moveb #44,a1@
	addql #1,a0@
	jra L186
L151:
	movel _asmfile,a0
	tstb a0@(17)
	jge L153
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L153
	movel a0@(4),a0
	moveb #44,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L186
L153:
	movel _asmfile,sp@-
	pea 44:w
	jra L188
L158:
	movel _asmfile,a0
	subql #1,a0@
	jmi L159
	addqw #4,a0
	movel a0@,a1
	addql #1,a0@
	tstl _use_gdb_dbx_extensions
	jeq L161
	moveb #38,d0
	jra L162
L161:
	moveb #42,d0
L162:
	moveb d0,a1@
	jra L186
L159:
	movel _asmfile,a0
	tstb a0@(17)
	jge L163
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L163
	movel a0@(4),a0
	tstl _use_gdb_dbx_extensions
	jeq L167
	moveb #38,d0
	jra L168
L167:
	moveb #42,d0
L168:
	moveb d0,a0@
	cmpb #10,d0
	jeq L165
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L186
L165:
	movel _asmfile,sp@-
	movel _asmfile,a0
	movel a0@(4),a0
	clrl d0
	moveb a0@,d0
	jra L187
L163:
	movel _asmfile,sp@-
	tstl _use_gdb_dbx_extensions
	jeq L169
	moveb #38,d1
	jra L170
L169:
	moveb #42,d1
L170:
	clrl d0
	moveb d1,d0
L187:
	movel d0,sp@-
	jra L188
L171:
	movel _asmfile,a0
	subql #1,a0@
	jmi L172
	addqw #4,a0
	movel a0@,a1
	moveb #102,a1@
	addql #1,a0@
	jra L173
L172:
	movel _asmfile,a0
	tstb a0@(17)
	jge L174
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L174
	movel a0@(4),a0
	moveb #102,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L173
L174:
	movel _asmfile,sp@-
	pea 102:w
L188:
	jbsr __flsbuf
	addqw #8,sp
L173:
L186:
	addql #1,_current_sym_nchars
L182:
	clrl sp@-
	movel a3@(8),sp@-
	jbsr _dbxout_type
	jra L3
L178:
	jbsr _abort
L3:
	moveml a6@(-16),#0xc0c
	unlk a6
	rts
LC20:
	.ascii "%s\0"
	.even
_dbxout_type_name:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(8),a2
	tstl a2@(48)
	jne L190
	jbsr _abort
L190:
	movel a2@(48),a0
	cmpb #1,a0@(12)
	jne L191
	movel a0,a3
	jra L192
L191:
	movel a2@(48),a0
	cmpb #42,a0@(12)
	jne L193
	movel a0@(36),a3
	jra L192
L193:
	jbsr _abort
L192:
	movel a3@(20),sp@-
	pea LC20
	movel _asmfile,sp@-
	jbsr _fprintf
	movel a3@(16),d1
	addl d1,_current_sym_nchars
	moveml a6@(-8),#0xc00
	unlk a6
	rts
LC21:
	.ascii ".stabs \"%s:%c\0"
LC22:
	.ascii ".stabs \"%s:t\0"
LC23:
	.ascii ".stabs \"%s:\0"
	.even
.globl _dbxout_symbol
_dbxout_symbol:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(8),a2
	clrl d2
	movel a2@(8),d3
	tstl a6@(12)
	jne L196
	jbsr _gettags
	movel d0,sp@-
	jbsr _dbxout_tags
	jbsr _get_permanent_types
	movel d0,sp@-
	jbsr _dbxout_types
	addqw #8,sp
L196:
	clrl _current_sym_code
	clrl _current_sym_value
	clrl _current_sym_addr
	movel a2@(36),a0
	movel a0@(16),d1
	addql #2,d1
	movel d1,_current_sym_nchars
	clrl d0
	moveb a2@(12),d0
	moveq #-39,d1
	addl d1,d0
	moveq #5,d1
	cmpl d1,d0
	jhi L195
LI246:
	movew pc@(L246-LI246-2:b,d0:l:2),d1
	jmp pc@(2,d1:w)
L246:
	.word L199-L246
	.word L195-L246
	.word L195-L246
	.word L208-L246
	.word L211-L246
	.word L210-L246
L199:
	tstl a2@(64)
	jeq L195
	tstb a2@(13)
	jlt L195
	movel a2@(64),a0
	cmpw #37,a0@
	jne L195
	movel a0@(4),a0
	cmpw #39,a0@
	jne L195
	btst #6,a2@(13)
	jeq L204
	moveq #70,d0
	jra L205
L204:
	moveq #102,d0
L205:
	movel d0,sp@-
	movel a2@(36),a0
	movel a0@(20),sp@-
	pea LC21
	movel _asmfile,sp@-
	jbsr _fprintf
	moveq #36,d1
	movel d1,_current_sym_code
	movel a2@(64),a0
	movel a0@(4),_current_sym_addr
	movel a2@(8),a0
	addw #16,sp
	tstl a0@(8)
	jeq L206
	clrl sp@-
	movel a0@(8),sp@-
	jra L248
L206:
	clrl sp@-
	movel _void_type_node,sp@-
L248:
	jbsr _dbxout_type
	addqw #8,sp
	jra L249
L208:
	btst #2,a2@(14)
	jne L195
	movel a2@(36),a0
	movel a0@(20),sp@-
	pea LC22
	movel _asmfile,sp@-
	jbsr _fprintf
	movel #128,_current_sym_code
	pea 1:w
	movel a2@(8),sp@-
	jbsr _dbxout_type
	jbsr _dbxout_finish_symbol
	orb #4,a2@(14)
	jra L195
L210:
	jbsr _abort
L211:
	tstl a2@(64)
	jeq L195
	tstb a2@(13)
	jlt L195
	movel a2@(64),a0
	cmpw #34,a0@
	jne L214
	tstl a0@(4)
	jlt L195
	moveq #55,d1
	cmpl a0@(4),d1
	jlt L195
L214:
	movel a2@(64),a0
	cmpw #37,a0@
	jne L216
	movel a0@(4),a0
	cmpw #39,a0@
	jne L216
	btst #6,a2@(13)
	jeq L217
	moveq #71,d2
	moveq #32,d1
	movel d1,_current_sym_code
	jra L223
L217:
	movel a2@(64),a0
	movel a0@(4),_current_sym_addr
	tstb a2@(14)
	jge L219
	moveq #83,d2
	jra L220
L219:
	moveq #86,d2
L220:
	tstl a2@(60)
	jne L221
	moveq #40,d1
	movel d1,_current_sym_code
	jra L223
L221:
	moveq #38,d1
	movel d1,_current_sym_code
	jra L223
L216:
	movel a2@(64),a0
	cmpw #34,a0@
	jne L224
	moveq #114,d2
	moveq #64,d1
	movel d1,_current_sym_code
	movel a2@(64),a0
	moveq #15,d1
	cmpl a0@(4),d1
	jlt L225
	movel a0@(4),d0
	jra L226
L225:
	movel a2@(64),a0
	movel a0@(4),d0
	addql #2,d0
L226:
	movel d0,_current_sym_value
	jra L223
L224:
	movel a2@(64),a0
	cmpw #37,a0@
	jne L228
	movel a0@(4),a0
	cmpw #37,a0@
	jeq L229
	cmpw #34,a0@
	jne L228
	moveq #14,d1
	cmpl a0@(4),d1
	jeq L228
L229:
	movel a2@(64),a0
	movel a0@(4),a0
	cmpw #34,a0@
	jne L230
	moveq #114,d2
	moveq #64,d1
	movel d1,_current_sym_code
	movel a2@(64),a0
	movel a0@(4),a0
	moveq #15,d1
	cmpl a0@(4),d1
	jlt L231
	movel a0@(4),d0
	jra L232
L231:
	movel a2@(64),a0
	movel a0@(4),a0
	movel a0@(4),d0
	addql #2,d0
L232:
	movel d0,_current_sym_value
	jra L233
L230:
	movel #128,_current_sym_code
	movel a2@(64),a0
	movel a0@(4),a0
	movel a0@(4),a0
	movel a0@(8),a0
	movel a0@(4),_current_sym_value
L233:
	movel a2@(8),sp@-
	jbsr _build_pointer_type
	movel d0,d3
	addqw #4,sp
	jra L223
L228:
	movel a2@(64),a0
	cmpw #37,a0@
	jne L235
	movel a0@(4),a0
	cmpw #34,a0@
	jne L235
	movel #128,_current_sym_code
	clrl _current_sym_value
	jra L223
L235:
	movel a2@(64),a0
	cmpw #37,a0@
	jne L195
	movel a0@(4),a0
	cmpw #44,a0@
	jne L195
	movel a0@(8),a0
	cmpw #30,a0@
	jne L195
	movel #128,_current_sym_code
	movel a2@(64),a0
	movel a0@(4),a0
	movel a0@(8),a0
	movel a0@(4),_current_sym_value
L223:
	movel a2@(36),a0
	movel a0@(20),sp@-
	pea LC23
	movel _asmfile,sp@-
	jbsr _fprintf
	addw #12,sp
	tstl d2
	jeq L239
	movel _asmfile,a0
	subql #1,a0@
	jmi L240
	addqw #4,a0
	movel a0@,a1
	moveb d2,a1@
	addql #1,a0@
	jra L239
L240:
	movel _asmfile,a0
	tstb a0@(17)
	jge L242
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L242
	movel a0@(4),a0
	moveb d2,d0
	moveb d0,a0@
	cmpb #10,d0
	jeq L244
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L239
L244:
	movel _asmfile,sp@-
	movel _asmfile,a0
	movel a0@(4),a0
	clrl d0
	moveb a0@,d0
	jra L250
L242:
	movel _asmfile,sp@-
	clrl d0
	moveb d2,d0
L250:
	movel d0,sp@-
	jbsr __flsbuf
	addqw #8,sp
L239:
	clrl sp@-
	movel d3,sp@-
	jbsr _dbxout_type
L249:
	jbsr _dbxout_finish_symbol
L195:
	moveml a6@(-12),#0x40c
	unlk a6
	rts
LC24:
	.ascii "\",%d,0,0,\0"
	.even
_dbxout_finish_symbol:
	link a6,#0
	movel _current_sym_code,sp@-
	pea LC24
	movel _asmfile,sp@-
	jbsr _fprintf
	addw #12,sp
	tstl _current_sym_addr
	jeq L252
	movel _current_sym_addr,sp@-
	movel _asmfile,sp@-
	jbsr _output_addr_const
	addqw #8,sp
	jra L253
L252:
	movel _current_sym_value,sp@-
	pea LC3
	movel _asmfile,sp@-
	jbsr _fprintf
	addw #12,sp
L253:
	movel _asmfile,a0
	subql #1,a0@
	jmi L254
	addqw #4,a0
	movel a0@,a1
	moveb #10,a1@
	addql #1,a0@
	jra L255
L254:
	movel _asmfile,a0
	tstb a0@(17)
	jge L256
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L256
	movel a0@(4),a0
	moveb #10,a0@
	movel _asmfile,sp@-
	movel _asmfile,a0
	movel a0@(4),a0
	clrl d0
	moveb a0@,d0
	movel d0,sp@-
	jra L260
L256:
	movel _asmfile,sp@-
	pea 10:w
L260:
	jbsr __flsbuf
L255:
	unlk a6
	rts
	.even
_dbxout_syms:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	tstl a2
	jeq L265
L264:
	pea 1:w
	movel a2,sp@-
	jbsr _dbxout_symbol
	movel a2@(4),a2
	addqw #8,sp
	tstl a2
	jne L264
L265:
	movel a6@(-4),a2
	unlk a6
	rts
LC25:
	.ascii ".stabs \"%s:p\0"
LC26:
	.ascii ".stabs \"%s:P\0"
	.even
_dbxout_parms:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(8),a2
	tstl a2
	jeq L286
	lea _mode_size,a3
L285:
	tstl a2@(44)
	jlt L270
	movel #160,_current_sym_code
	movel a2@(44),d0
	jge L271
	addql #7,d0
L271:
	asrl #3,d0
	movel d0,_current_sym_value
	clrl _current_sym_addr
	movel a2@(36),a0
	movel a0@(20),sp@-
	jbsr _strlen
	addql #2,d0
	movel d0,_current_sym_nchars
	movel a2@(36),a0
	movel a0@(20),sp@-
	pea LC25
	movel _asmfile,sp@-
	jbsr _fprintf
	movel a2@(64),a0
	addw #16,sp
	cmpw #34,a0@
	jne L272
	tstl a0@(4)
	jlt L272
	moveq #55,d2
	cmpl a0@(4),d2
	jge L287
L272:
	movel a2@(8),d2
	cmpl a2@(52),d2
	jeq L274
	movel a2@(52),a0
	clrl d0
	moveb a0@(28),d0
	movel a2@(64),a0
	clrl d1
	moveb a0@(2),d1
	movel a3@(d0:l:4),d0
	subl a3@(d1:l:4),d0
	addl d0,_current_sym_value
L274:
	movel a2@(64),a0
	cmpw #37,a0@
	jne L275
	movel a0@(4),a0
	cmpw #44,a0@
	jne L275
	movel a0@(8),a0
	cmpw #30,a0@
	jne L275
	movel a0@(4),d2
	cmpl _current_sym_value,d2
	jne L275
	clrl sp@-
	movel a2@(8),sp@-
	jra L288
L275:
	movel a2@(44),d0
	jge L277
	addql #7,d0
L277:
	asrl #3,d0
	movel d0,_current_sym_value
L287:
	clrl sp@-
	movel a2@(52),sp@-
L288:
	jbsr _dbxout_type
	addqw #8,sp
	jbsr _dbxout_finish_symbol
	jra L269
L270:
	movel a2@(64),a0
	cmpw #34,a0@
	jne L279
	tstl a0@(4)
	jlt L279
	moveq #55,d2
	cmpl a0@(4),d2
	jlt L279
	moveq #64,d2
	movel d2,_current_sym_code
	movel a2@(64),a0
	moveq #15,d2
	cmpl a0@(4),d2
	jlt L280
	movel a0@(4),d0
	jra L281
L280:
	movel a2@(64),a0
	movel a0@(4),d0
	addql #2,d0
L281:
	movel d0,_current_sym_value
	clrl _current_sym_addr
	movel a2@(36),a0
	movel a0@(20),sp@-
	jbsr _strlen
	addql #2,d0
	movel d0,_current_sym_nchars
	movel a2@(36),a0
	movel a0@(20),sp@-
	pea LC26
	movel _asmfile,sp@-
	jbsr _fprintf
	clrl sp@-
	movel a2@(52),sp@-
	jbsr _dbxout_type
	jbsr _dbxout_finish_symbol
	addw #24,sp
	jra L269
L279:
	movel a2@(64),a0
	cmpw #37,a0@
	jne L269
	movel a0@(4),d2
	cmpl _const0_rtx,d2
	jeq L269
	movel #128,_current_sym_code
	movel a2@(64),a0
	movel a0@(4),a0
	movel a0@(8),a0
	movel a0@(4),_current_sym_value
	clrl _current_sym_addr
	movel a2@(36),a0
	movel a0@(20),sp@-
	jbsr _strlen
	addql #2,d0
	movel d0,_current_sym_nchars
	movel a2@(36),a0
	movel a0@(20),sp@-
	pea LC25
	movel _asmfile,sp@-
	jbsr _fprintf
	addw #16,sp
	movel a2@(8),d2
	cmpl a2@(52),d2
	jeq L284
	movel a2@(52),a0
	clrl d0
	moveb a0@(28),d0
	movel a2@(64),a0
	clrl d1
	moveb a0@(2),d1
	movel a3@(d0:l:4),d0
	subl a3@(d1:l:4),d0
	addl d0,_current_sym_value
L284:
	clrl sp@-
	movel a2@(8),sp@-
	jbsr _dbxout_type
	jbsr _dbxout_finish_symbol
	addqw #8,sp
L269:
	movel a2@(4),a2
	tstl a2
	jne L285
L286:
	moveml a6@(-12),#0xc04
	unlk a6
	rts
LC27:
	.ascii ".stabs \"%s:r\0"
	.even
_dbxout_reg_parms:
	link a6,#0
	moveml #0x3030,sp@-
	movel a6@(8),a2
	tstl a2
	jeq L301
	andl #255,d2
	lea _mode_size,a3
L300:
	movel a2@(64),a0
	cmpw #34,a0@
	jne L292
	tstl a0@(4)
	jlt L292
	moveq #55,d3
	cmpl a0@(4),d3
	jlt L292
	tstl a2@(44)
	jlt L292
	moveq #64,d3
	movel d3,_current_sym_code
	movel a2@(64),a0
	moveq #15,d3
	cmpl a0@(4),d3
	jlt L293
	movel a0@(4),d0
	jra L294
L293:
	movel a2@(64),a0
	movel a0@(4),d0
	addql #2,d0
L294:
	movel d0,_current_sym_value
	clrl _current_sym_addr
	movel a2@(36),a0
	movel a0@(16),d3
	addql #2,d3
	movel d3,_current_sym_nchars
	movel a2@(36),a0
	movel a0@(20),sp@-
	pea LC27
	jra L302
L292:
	movel a2@(64),a0
	cmpw #37,a0@
	jne L295
	movel a0@(4),a0
	cmpw #44,a0@
	jne L295
	movel a0@(8),a0
	cmpw #30,a0@
	jne L295
	movel a2@(44),d1
	jge L297
	addql #7,d1
L297:
	asrl #3,d1
	moveq #-1,d3
	cmpl d1,d3
	jeq L298
	movel a2@(8),d3
	cmpl a2@(52),d3
	jeq L298
	movel a2@(52),a0
	moveb a0@(28),d2
	movel a2@(64),a0
	clrl d0
	moveb a0@(2),d0
	movel a3@(d2:l:4),d3
	subl a3@(d0:l:4),d3
	movel d3,d0
	addl d0,d1
L298:
	movel a2@(64),a0
	movel a0@(4),a0
	movel a0@(8),a0
	cmpl a0@(4),d1
	jeq L295
	movel #128,_current_sym_code
	movel a2@(64),a0
	movel a0@(4),a0
	movel a0@(8),a0
	movel a0@(4),_current_sym_value
	clrl _current_sym_addr
	movel a2@(36),a0
	movel a0@(16),d3
	addql #2,d3
	movel d3,_current_sym_nchars
	movel a2@(36),a0
	movel a0@(20),sp@-
	pea LC23
L302:
	movel _asmfile,sp@-
	jbsr _fprintf
	clrl sp@-
	movel a2@(8),sp@-
	jbsr _dbxout_type
	jbsr _dbxout_finish_symbol
	addw #20,sp
L295:
	movel a2@(4),a2
	tstl a2
	jne L300
L301:
	moveml a6@(-16),#0xc0c
	unlk a6
	rts
	.even
.globl _dbxout_args
_dbxout_args:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	tstl a2
	jeq L313
L312:
	movel _asmfile,a0
	subql #1,a0@
	jmi L306
	addqw #4,a0
	movel a0@,a1
	moveb #44,a1@
	addql #1,a0@
	jra L307
L306:
	movel _asmfile,a0
	tstb a0@(17)
	jge L308
	movel a0@,d0
	negl d0
	cmpl a0@(12),d0
	jge L308
	movel a0@(4),a0
	moveb #44,a0@
	movel _asmfile,a0
	addqw #4,a0
	addql #1,a0@
	jra L307
L308:
	movel _asmfile,sp@-
	pea 44:w
	jbsr __flsbuf
	addqw #8,sp
L307:
	clrl sp@-
	movel a2@(20),sp@-
	jbsr _dbxout_type
	addql #1,_current_sym_nchars
	movel a2@(4),a2
	addqw #8,sp
	tstl a2
	jne L312
L313:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _dbxout_types
_dbxout_types:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	tstl a2
	jeq L319
L318:
	tstl a2@(48)
	jeq L317
	movel a2@(48),a0
	cmpb #42,a0@(12)
	jne L317
	btst #2,a0@(14)
	jne L317
	pea 1:w
	movel a0,sp@-
	jbsr _dbxout_symbol
	addqw #8,sp
L317:
	movel a2@(4),a2
	tstl a2
	jne L318
L319:
	movel a6@(-4),a2
	unlk a6
	rts
LC28:
	.ascii ".stabs \"%s:T\0"
	.even
.globl _dbxout_tags
_dbxout_tags:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(8),a2
	tstl a2
	jeq L326
L325:
	movel a2@(20),a0
	movel a0@(60),a3
	tstl a2@(16)
	jeq L323
	btst #2,a2@(14)
	jne L323
	tstl a3@(24)
	jeq L323
	orb #4,a2@(14)
	movel #128,_current_sym_code
	clrl _current_sym_value
	clrl _current_sym_addr
	movel a2@(16),a0
	movel a0@(16),d1
	addql #2,d1
	movel d1,_current_sym_nchars
	movel a2@(16),a0
	movel a0@(20),sp@-
	pea LC28
	movel _asmfile,sp@-
	jbsr _fprintf
	pea 1:w
	movel a3,sp@-
	jbsr _dbxout_type
	jbsr _dbxout_finish_symbol
	addw #20,sp
L323:
	movel a2@(4),a2
	tstl a2
	jne L325
L326:
	moveml a6@(-8),#0xc00
	unlk a6
	rts
LC29:
	.ascii "LBB\0"
LC30:
	.ascii "*%s%d\0"
LC31:
	.ascii ".stabn %d,0,0,\0"
LC32:
	.ascii "\12\0"
LC33:
	.ascii "LBE\0"
	.even
_dbxout_block:
	link a6,#-40
	moveml #0x3c38,sp@-
	movel a6@(8),a3
	movel a6@(12),a4
	movel a6@(16),d5
	tstl a3
	jeq L341
	moveq #-20,d4
	addl a6,d4
	moveq #-40,d3
	addl a6,d3
L340:
	clrl d0
	moveb a3@(12),d0
	moveq #-28,d1
	addl d1,d0
	moveq #5,d1
	cmpl d1,d0
	jhi L330
LI338:
	movew pc@(L338-LI338-2:b,d0:l:2),d1
	jmp pc@(2,d1:w)
L338:
	.word L334-L338
	.word L333-L338
	.word L330-L338
	.word L330-L338
	.word L332-L338
	.word L332-L338
L332:
	clrl sp@-
	movel a4,sp@-
	movel a3@(24),sp@-
	jbsr _dbxout_block
	addw #12,sp
	jra L330
L333:
	clrl sp@-
	movel a4,sp@-
	movel a3@(28),sp@-
	lea _dbxout_block,a2
	jbsr a2@
	clrl sp@-
	movel a4,sp@-
	movel a3@(32),sp@-
	jbsr a2@
	addw #24,sp
	jra L330
L334:
	movel a3@(40),sp@-
	jbsr _dbxout_tags
	movel a3@(28),sp@-
	jbsr _dbxout_syms
	addqw #8,sp
	tstl d5
	jeq L335
	movel d5,sp@-
	jbsr _dbxout_reg_parms
	addqw #4,sp
L335:
	tstl a4
	jle L336
	movel _next_block_number,d2
	addql #1,_next_block_number
	movel d2,sp@-
	pea LC29
	pea LC30
	movel d4,sp@-
	jbsr _sprintf
	pea 192:w
	pea LC31
	movel _asmfile,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel d4,sp@-
	movel _asmfile,sp@-
	jbsr _assemble_name
	addw #36,sp
	pea LC32
	movel _asmfile,sp@-
	jbsr a2@
	addqw #8,sp
L336:
	clrl sp@-
	pea a4@(1)
	movel a3@(24),sp@-
	jbsr _dbxout_block
	addw #12,sp
	tstl a4
	jle L330
	movel d2,sp@-
	pea LC33
	pea LC30
	movel d3,sp@-
	jbsr _sprintf
	pea 224:w
	pea LC31
	movel _asmfile,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel d3,sp@-
	movel _asmfile,sp@-
	jbsr _assemble_name
	addw #36,sp
	pea LC32
	movel _asmfile,sp@-
	jbsr a2@
	addqw #8,sp
L330:
	movel a3@(4),a3
	tstl a3
	jne L340
L341:
	moveml a6@(-68),#0x1c3c
	unlk a6
	rts
	.even
.globl _dbxout_function
_dbxout_function:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	clrl sp@-
	movel a2,sp@-
	jbsr _dbxout_symbol
	movel a2@(52),sp@-
	jbsr _dbxout_parms
	movel a2@(52),sp@-
	clrl sp@-
	movel a2@(60),sp@-
	jbsr _dbxout_block
	jbsr _get_temporary_types
	movel d0,sp@-
	jbsr _dbxout_types
	movel a6@(-4),a2
	unlk a6
	rts
.lcomm _current_sym_nchars,4
.lcomm _current_sym_addr,4
.lcomm _current_sym_value,4
.lcomm _current_sym_code,4
.lcomm _next_block_number,4
.lcomm _next_type_number,4
.lcomm _typevec_len,4
.comm _typevec,4
.lcomm _asmfile,4
