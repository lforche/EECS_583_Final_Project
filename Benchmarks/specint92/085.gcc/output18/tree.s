#NO_APP
gcc_compiled.:
.globl _tree_code_type
.text
LC0:
	.ascii "x\0"
LC1:
	.ascii "t\0"
LC2:
	.ascii "s\0"
LC3:
	.ascii "c\0"
LC4:
	.ascii "d\0"
LC5:
	.ascii "r\0"
LC6:
	.ascii "e\0"
.data
	.even
_tree_code_type:
	.long LC0
	.long LC0
	.long LC0
	.long LC0
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC1
	.long LC2
	.long LC2
	.long LC2
	.long LC2
	.long LC2
	.long LC2
	.long LC2
	.long LC2
	.long LC2
	.long LC2
	.long LC2
	.long LC2
	.long LC3
	.long LC3
	.long LC3
	.long LC3
	.long LC4
	.long LC4
	.long LC4
	.long LC4
	.long LC4
	.long LC4
	.long LC4
	.long LC4
	.long LC4
	.long LC5
	.long LC5
	.long LC5
	.long LC5
	.long LC5
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
	.long LC6
.globl _tree_code_length
	.even
_tree_code_length:
	.long 0
	.long 7
	.long 2
	.long 2
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 1
	.long 1
	.long 1
	.long 1
	.long 5
	.long 5
	.long 3
	.long 1
	.long 3
	.long 1
	.long 1
	.long 1
	.long 2
	.long 3
	.long 3
	.long 3
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 2
	.long 1
	.long 2
	.long 1
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 3
	.long 3
	.long 4
	.long 3
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 1
	.long 1
	.long 1
	.long 1
	.long 1
	.long 2
	.long 1
	.long 2
	.long 2
	.long 1
	.long 1
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 1
	.long 2
	.long 2
	.long 2
	.long 2
	.long 1
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 2
	.long 1
	.long 2
	.long 1
	.long 1
	.long 2
	.long 2
	.long 1
	.long 1
	.long 2
	.long 2
	.long 1
	.long 2
	.long 1
	.long 1
	.long 1
	.long 2
	.long 2
	.long 2
	.long 2
.globl _tree_node_counter
	.even
_tree_node_counter:
	.long 0
.text
	.even
.globl _init_tree
_init_tree:
	link a6,#0
	moveml #0x3820,sp@-
	pea _free
	pea _xmalloc
	clrl sp@-
	clrl sp@-
	pea _permanent_obstack
	lea __obstack_begin,a2
	jbsr a2@
	pea _free
	pea _xmalloc
	clrl sp@-
	clrl sp@-
	pea _temporary_obstack
	jbsr a2@
	movel #_temporary_obstack,d2
	movel d2,a2
	clrl d3
	addw #40,sp
	movel _temporary_obstack+12,d4
	cmpl _temporary_obstack+16,d4
	jls L3
	clrl sp@-
	movel d2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L3:
	addl d3,a2@(12)
	movel d2,a0
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
	jge L5
	movel a0@(16),a0@(12)
L5:
	movel a0@(12),a0@(8)
	movel d2,_temporary_firstobj
	pea _free
	pea _xmalloc
	clrl sp@-
	clrl sp@-
	pea _momentary_obstack
	jbsr __obstack_begin
	movel #_momentary_obstack,d2
	movel d2,a2
	clrl d3
	addw #20,sp
	movel _momentary_obstack+12,d4
	cmpl _momentary_obstack+16,d4
	jls L7
	clrl sp@-
	movel d2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L7:
	addl d3,a2@(12)
	movel d2,a0
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
	jge L9
	movel a0@(16),a0@(12)
L9:
	movel a0@(12),a0@(8)
	movel d2,_momentary_firstobj
	pea _free
	pea _xmalloc
	clrl sp@-
	clrl sp@-
	pea _maybepermanent_obstack
	jbsr __obstack_begin
	movel #_maybepermanent_obstack,d2
	movel d2,a2
	clrl d3
	addw #20,sp
	movel _maybepermanent_obstack+12,d4
	cmpl _maybepermanent_obstack+16,d4
	jls L11
	clrl sp@-
	movel d2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L11:
	addl d3,a2@(12)
	movel d2,a0
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
	jge L13
	movel a0@(16),a0@(12)
L13:
	movel a0@(12),a0@(8)
	movel d2,_maybepermanent_firstobj
	movel #_permanent_obstack,_current_obstack
	movel #_permanent_obstack,_expression_obstack
	movel #_permanent_obstack,d0
	movel d0,_saveable_obstack
	movel d0,_rtl_obstack
	moveq #1,d4
	movel d4,_tree_node_counter
	pea 4036:w
	clrl sp@-
	pea _hash_table
	jbsr _memset
	moveml a6@(-16),#0x41c
	unlk a6
	rts
	.even
.globl _temporary_allocation
_temporary_allocation:
	link a6,#0
	movel #_temporary_obstack,_current_obstack
	movel #_temporary_obstack,_expression_obstack
	movel #_maybepermanent_obstack,d0
	movel d0,_saveable_obstack
	movel d0,_rtl_obstack
	clrl _momentary_stack
	unlk a6
	rts
	.even
.globl _end_temporary_allocation
_end_temporary_allocation:
	link a6,#0
	movel #_permanent_obstack,_current_obstack
	movel #_permanent_obstack,_expression_obstack
	movel #_permanent_obstack,d0
	movel d0,_saveable_obstack
	movel d0,_rtl_obstack
	unlk a6
	rts
	.even
.globl _resume_temporary_allocation
_resume_temporary_allocation:
	link a6,#0
	movel #_temporary_obstack,_current_obstack
	movel #_temporary_obstack,_expression_obstack
	movel #_maybepermanent_obstack,d0
	movel d0,_saveable_obstack
	movel d0,_rtl_obstack
	unlk a6
	rts
	.even
.globl _allocation_temporary_p
_allocation_temporary_p:
	link a6,#0
	cmpl #_temporary_obstack,_current_obstack
	seq d0
	moveq #1,d1
	andl d1,d0
	unlk a6
	rts
	.even
.globl _permanent_allocation
_permanent_allocation:
	link a6,#0
	movel #_temporary_obstack,d1
	movel _temporary_firstobj,d0
	cmpl _temporary_obstack+4,d0
	jcs L19
	cmpl _temporary_obstack+16,d0
	jcc L19
	movel d0,_temporary_obstack+8
	movel d0,_temporary_obstack+12
	jra L20
L19:
	movel d0,sp@-
	movel d1,sp@-
	jbsr _obstack_free
	addqw #8,sp
L20:
	movel #_momentary_obstack,d1
	movel _momentary_firstobj,d0
	cmpl _momentary_obstack+4,d0
	jcs L21
	cmpl _momentary_obstack+16,d0
	jcc L21
	movel d0,_momentary_obstack+8
	movel d0,_momentary_obstack+12
	jra L22
L21:
	movel d0,sp@-
	movel d1,sp@-
	jbsr _obstack_free
	addqw #8,sp
L22:
	movel #_maybepermanent_obstack,d1
	movel _maybepermanent_firstobj,d0
	cmpl _maybepermanent_obstack+4,d0
	jcs L23
	cmpl _maybepermanent_obstack+16,d0
	jcc L23
	movel d0,_maybepermanent_obstack+8
	movel d0,_maybepermanent_obstack+12
	jra L24
L23:
	movel d0,sp@-
	movel d1,sp@-
	jbsr _obstack_free
L24:
	movel #_permanent_obstack,_current_obstack
	movel #_permanent_obstack,_expression_obstack
	movel #_permanent_obstack,d0
	movel d0,_saveable_obstack
	movel d0,_rtl_obstack
	unlk a6
	rts
	.even
.globl _preserve_data
_preserve_data:
	link a6,#0
	moveml #0x3020,sp@-
	movel #_maybepermanent_obstack,d2
	movel d2,a2
	clrl d3
	movel _maybepermanent_obstack+12,a1
	cmpl _maybepermanent_obstack+16,a1
	jls L27
	clrl sp@-
	movel d2,sp@-
	jbsr __obstack_newchunk
L27:
	addl d3,a2@(12)
	movel d2,a0
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
	jge L29
	movel a0@(16),a0@(12)
L29:
	movel a0@(12),a0@(8)
	movel d2,_maybepermanent_firstobj
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _oballoc
_oballoc:
	link a6,#0
	moveml #0x2030,sp@-
	movel _current_obstack,a2
	movel a2,a3
	movel a6@(8),d2
	movel d2,d0
	addl a2@(12),d0
	cmpl a2@(16),d0
	jls L32
	movel d2,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
L32:
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
	jge L34
	movel a0@(16),a0@(12)
L34:
	movel a0@(12),a0@(8)
	movel d2,d0
	moveml a6@(-12),#0xc04
	unlk a6
	rts
	.even
.globl _obfree
_obfree:
	link a6,#0
	movel _current_obstack,a0
	movel a6@(8),d0
	cmpl a0@(4),d0
	jcs L36
	cmpl a0@(16),d0
	jcc L36
	movel d0,a0@(8)
	movel d0,a0@(12)
	jra L37
L36:
	movel d0,sp@-
	movel a0,sp@-
	jbsr _obstack_free
L37:
	unlk a6
	rts
	.even
.globl _permalloc
_permalloc:
	link a6,#0
	moveml #0x3020,sp@-
	movel #_permanent_obstack,d3
	movel d3,a2
	movel a6@(8),d2
	movel d2,d0
	addl _permanent_obstack+12,d0
	cmpl _permanent_obstack+16,d0
	jls L40
	movel d2,sp@-
	movel d3,sp@-
	jbsr __obstack_newchunk
L40:
	addl d2,a2@(12)
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
	jge L42
	movel a0@(16),a0@(12)
L42:
	movel a0@(12),a0@(8)
	movel d2,d0
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _push_momentary
_push_momentary:
	link a6,#0
	moveml #0x3020,sp@-
	movel #_momentary_obstack,d3
	movel d3,a2
	moveq #12,d2
	movel d2,d0
	addl _momentary_obstack+12,d0
	cmpl _momentary_obstack+16,d0
	jls L45
	movel d2,sp@-
	movel d3,sp@-
	jbsr __obstack_newchunk
L45:
	addl d2,a2@(12)
	movel d3,a0
	movel a0@(8),a1
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
	jge L47
	movel a0@(16),a0@(12)
L47:
	movel a0@(12),a0@(8)
	movel _momentary_stack,a1@
	movel _momentary_obstack+8,a1@(4)
	movel _expression_obstack,a1@(8)
	movel a1,_momentary_stack
	movel #_momentary_obstack,_expression_obstack
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _clear_momentary
_clear_momentary:
	link a6,#0
	movel #_momentary_obstack,d1
	movel _momentary_stack,a0
	movel a0@(4),d0
	cmpl _momentary_obstack+4,d0
	jcs L49
	cmpl _momentary_obstack+16,d0
	jcc L49
	movel d0,_momentary_obstack+8
	movel d0,_momentary_obstack+12
	jra L50
L49:
	movel d0,sp@-
	movel d1,sp@-
	jbsr _obstack_free
L50:
	unlk a6
	rts
	.even
.globl _pop_momentary
_pop_momentary:
	link a6,#0
	movel a2,sp@-
	movel _momentary_stack,a2
	movel a2@,_momentary_stack
	movel #_momentary_obstack,d1
	movel a2,d0
	cmpl _momentary_obstack+4,a2
	jcs L52
	cmpl _momentary_obstack+16,a2
	jcc L52
	movel a2,_momentary_obstack+8
	movel a2,_momentary_obstack+12
	jra L53
L52:
	movel d0,sp@-
	movel d1,sp@-
	jbsr _obstack_free
L53:
	movel a2@(8),_expression_obstack
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _suspend_momentary
_suspend_momentary:
	link a6,#0
	cmpl #_momentary_obstack,_expression_obstack
	seq d0
	movel _saveable_obstack,_expression_obstack
	moveq #1,d1
	andl d1,d0
	unlk a6
	rts
	.even
.globl _resume_momentary
_resume_momentary:
	link a6,#0
	tstl a6@(8)
	jeq L56
	movel #_momentary_obstack,_expression_obstack
L56:
	unlk a6
	rts
	.even
.globl _make_node
_make_node:
	link a6,#0
	moveml #0x3f30,sp@-
	movel a6@(8),d5
	lea _tree_code_type,a0
	movel a0@(d5:l:4),a0
	moveb a0@,d6
	extbl d6
	movel _current_obstack,a2
	moveq #-99,d0
	addl d6,d0
	moveq #21,d7
	cmpl d7,d0
	jhi L58
LI73:
	movew pc@(L73-LI73-2:b,d0:l:2),d7
	jmp pc@(2,d7:w)
L73:
	.word L69-L73
	.word L59-L73
	.word L68-L73
	.word L58-L73
	.word L58-L73
	.word L58-L73
	.word L58-L73
	.word L58-L73
	.word L58-L73
	.word L58-L73
	.word L58-L73
	.word L58-L73
	.word L58-L73
	.word L58-L73
	.word L58-L73
	.word L68-L73
	.word L65-L73
	.word L61-L73
	.word L58-L73
	.word L58-L73
	.word L58-L73
	.word L71-L73
L59:
	moveq #84,d2
	jra L88
L61:
	moveq #76,d2
	cmpl #_permanent_obstack,a2
	jeq L58
	tstl _all_types_permanent
	jne L89
	jra L90
L65:
	lea _tree_code_length,a0
	movel a0@(d5:l:4),d0
	asll #2,d0
	moveq #24,d2
	addl d0,d2
L88:
	cmpl #_permanent_obstack,a2
	jeq L58
L90:
	movel _saveable_obstack,a2
	jra L58
L68:
	movel _expression_obstack,a2
	lea _tree_code_length,a0
	movel a0@(d5:l:4),d0
	subql #1,d0
	asll #2,d0
	moveq #24,d2
	addl d0,d2
	jra L58
L69:
	movel _expression_obstack,a2
	moveq #36,d7
	cmpl d5,d7
	jne L71
	moveq #28,d2
	jra L58
L71:
	lea _tree_code_length,a0
	movel a0@(d5:l:4),d0
	asll #2,d0
	moveq #16,d2
	addl d0,d2
	moveq #1,d7
	cmpl d5,d7
	jne L58
L89:
	lea _permanent_obstack,a2
L58:
	movel a2,d4
	movel a2,a3
	movel d2,d3
	movel d2,d0
	addl a2@(12),d0
	cmpl a2@(16),d0
	jls L76
	movel d2,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
L76:
	addl d3,a3@(12)
	movel d4,a0
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
	jge L78
	movel a0@(16),a0@(12)
L78:
	movel a0@(12),a0@(8)
	movel d3,a0
	movel _tree_node_counter,a0@
	addql #1,_tree_node_counter
	clrl a0@(8)
	clrl a0@(4)
	movel d2,d0
	lsrl #2,d0
	jra L91
L82:
	clrl a0@(d0:l:4)
L91:
	subql #1,d0
	moveq #2,d7
	cmpl d0,d7
	jcs L82
	moveb d5,a0@(12)
	cmpl #_permanent_obstack,a2
	jne L83
	orb #128,a0@(14)
L83:
	moveq #100,d7
	cmpl d6,d7
	jne L84
	moveb #1,a0@(33)
	moveb #1,a0@(32)
	moveb #1,a0@(34)
	movel _lineno,a0@(20)
	movel _input_filename,a0@(16)
L84:
	moveq #116,d7
	cmpl d6,d7
	jne L85
	moveb #1,a0@(30)
	moveb #1,a0@(29)
	movel a0,a0@(60)
L85:
	moveq #99,d7
	cmpl d6,d7
	jne L86
	orb #2,a0@(13)
L86:
	movel a0,d0
	moveml a6@(-32),#0xcfc
	unlk a6
	rts
	.even
.globl _copy_node
_copy_node:
	link a6,#0
	moveml #0x3838,sp@-
	movel a6@(8),a4
	clrl d1
	moveb a4@(12),d1
	lea _tree_code_type,a0
	movel a0@(d1:l:4),a0
	moveb a0@,d0
	extbl d0
	moveq #-99,d4
	addl d4,d0
	moveq #21,d4
	cmpl d4,d0
	jhi L93
LI102:
	movew pc@(L102-LI102-2:b,d0:l:2),d4
	jmp pc@(2,d4:w)
L102:
	.word L99-L102
	.word L94-L102
	.word L98-L102
	.word L93-L102
	.word L93-L102
	.word L93-L102
	.word L93-L102
	.word L93-L102
	.word L93-L102
	.word L93-L102
	.word L93-L102
	.word L93-L102
	.word L93-L102
	.word L93-L102
	.word L93-L102
	.word L98-L102
	.word L96-L102
	.word L95-L102
	.word L93-L102
	.word L93-L102
	.word L93-L102
	.word L101-L102
L94:
	moveq #84,d2
	jra L93
L95:
	moveq #76,d2
	jra L93
L96:
	lea _tree_code_length,a0
	movel a0@(d1:l:4),d0
	asll #2,d0
	moveq #24,d2
	jra L113
L98:
	lea _tree_code_length,a0
	movel a0@(d1:l:4),d0
	subql #1,d0
	asll #2,d0
	moveq #24,d2
	jra L113
L99:
	moveq #36,d4
	cmpl d1,d4
	jne L101
	moveq #28,d2
	jra L93
L101:
	lea _tree_code_length,a0
	movel a0@(d1:l:4),d0
	asll #2,d0
	moveq #16,d2
L113:
	addl d0,d2
L93:
	movel _current_obstack,a2
	movel a2,a3
	movel d2,d3
	movel d2,d0
	addl a2@(12),d0
	cmpl a2@(16),d0
	jls L105
	movel d2,sp@-
	movel a2,sp@-
	jbsr __obstack_newchunk
L105:
	addl d3,a3@(12)
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
	jge L107
	movel a0@(16),a0@(12)
L107:
	movel a0@(12),a0@(8)
	movel d3,a0
	movel d2,d0
	addql #3,d0
	lsrl #2,d0
	jra L114
L111:
	movel a4@(d0:l:4),a0@(d0:l:4)
L114:
	subql #1,d0
	jpl L111
	movel _tree_node_counter,a0@
	addql #1,_tree_node_counter
	clrl a0@(4)
	cmpl #_permanent_obstack,_current_obstack
	seq d0
	bfins d0,a0@(14){#0:#1}
	movel a0,d0
	moveml a6@(-24),#0x1c1c
	unlk a6
	rts
LC7:
	.ascii "`%s' and `%s' identical in first n characters\0"
	.even
.globl _get_identifier
_get_identifier:
	link a6,#0
	moveml #0x3c3c,sp@-
	movel a6@(8),a5
	clrl d4
	tstb a5@(d4:l)
	jeq L143
L118:
	addql #1,d4
	tstb a5@(d4:l)
	jne L118
L143:
	movel d4,d3
	tstl _warn_id_clash
	jeq L120
	cmpl _id_clash_len,d4
	jle L120
	movel _id_clash_len,d3
L120:
	movel d3,d5
	clrl d2
	cmpl d2,d3
	jle L142
L124:
	movel d5,d0
	mulsl #613,d0
	moveb a5@(d2:l),d1
	extbl d1
	movel d0,d5
	addl d1,d5
	addql #1,d2
	cmpl d2,d3
	jgt L124
L142:
	andl #1073741823,d5
	divsll #1009,d1:d5
	movel d1,d5
	lea _hash_table,a0
	movel a0@(d5:l:4),a2
	tstl a2
	jeq L141
L129:
	cmpl a2@(16),d4
	jne L127
	movel a5,sp@-
	movel a2@(20),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jeq L144
L127:
	movel a2@(4),a2
	tstl a2
	jne L129
L141:
	tstl _warn_id_clash
	jeq L130
	cmpl _id_clash_len,d4
	jle L130
	lea _hash_table,a0
	movel a0@(d5:l:4),a2
	tstl a2
	jeq L130
L135:
	movel _id_clash_len,sp@-
	movel a5,sp@-
	movel a2@(20),sp@-
	jbsr _strncmp
	addw #12,sp
	tstl d0
	jne L133
	movel a5,sp@-
	movel a2@(20),sp@-
	pea LC7
	jbsr _warning
	addw #12,sp
	jra L130
L133:
	movel a2@(4),a2
	tstl a2
	jne L135
L130:
	pea 1:w
	jbsr _make_node
	movel d0,a2
	movel d4,a2@(16)
	movel #_permanent_obstack,d2
	movel d2,a4
	movel d4,a3
	movel a3,d0
	addl _permanent_obstack+12,d0
	addql #1,d0
	addqw #4,sp
	cmpl _permanent_obstack+16,d0
	jls L137
	pea a3@(1)
	movel d2,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L137:
	movel a3,sp@-
	movel a5,sp@-
	movel a4@(12),sp@-
	jbsr _memcpy
	addl a4@(12),a3
	movel a3,a4@(12)
	lea a4@(12),a0
	movel a0@,a1
	clrb a1@
	addql #1,a0@
	movel d2,a0
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
	jge L139
	movel a0@(16),a0@(12)
L139:
	movel a0@(12),a0@(8)
	movel d2,a2@(20)
	lea _hash_table,a0
	movel a0@(d5:l:4),a2@(4)
	movel a2,a0@(d5:l:4)
L144:
	movel a2,d0
	moveml a6@(-32),#0x3c3c
	unlk a6
	rts
	.even
.globl _build_int_2
_build_int_2:
	link a6,#0
	pea 35:w
	jbsr _make_node
	movel d0,a0
	movel a6@(8),a0@(16)
	movel a6@(12),a0@(20)
	movel _integer_type_node,a0@(8)
	unlk a6
	rts
	.even
.globl _build_real
_build_real:
	link a6,#0
	pea 36:w
	jbsr _make_node
	movel d0,a0
	movel a6@(8),a0@(8)
	movel a6@(12),a0@(20)
	movel a6@(16),a0@(24)
	unlk a6
	rts
	.even
.globl _build_real_from_int_cst
_build_real_from_int_cst:
	link a6,#0
	fmovem #0x4,sp@-
	movel a2,sp@-
	movel a6@(12),a2
	pea 36:w
	jbsr _make_node
	movel d0,a0
	movel a6@(8),a0@(8)
	tstl a2@(20)
	jge L148
	movel a2@(20),d0
	notl d0
	fmovel d0,fp0
	fmuld #0r4294967296,fp0
	movel a2@(16),d0
	notl d0
	fmovel d0,fp1
	fjge L149
	faddd #0r4294967296,fp1
L149:
	faddx fp1,fp0
	fnegx fp0,fp0
	fmovecr #0x32,fp2
	fsubx fp2,fp0
	jra L150
L148:
	fmovel a2@(20),fp0
	fmuld #0r4294967296,fp0
	fmovel a2@(16),fp1
	fjge L151
	faddd #0r4294967296,fp1
L151:
	faddx fp1,fp0
L150:
	fmoved fp0,a0@(20)
	movel a0,d0
	movel a6@(-16),a2
	fmovem a6@(-12),#0x20
	unlk a6
	rts
	.even
.globl _build_string
_build_string:
	link a6,#0
	moveml #0x203c,sp@-
	movel a6@(8),d2
	pea 38:w
	jbsr _make_node
	movel d0,a5
	movel d2,a5@(20)
	movel _saveable_obstack,a4
	movel a4,a3
	movel d2,a2
	movel a2,d0
	addl a4@(12),d0
	addql #1,d0
	addqw #4,sp
	cmpl a4@(16),d0
	jls L154
	pea a2@(1)
	movel a4,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L154:
	movel a2,sp@-
	movel a6@(12),sp@-
	movel a3@(12),sp@-
	jbsr _memcpy
	addl a3@(12),a2
	movel a2,a3@(12)
	lea a3@(12),a0
	movel a0@,a1
	clrb a1@
	addql #1,a0@
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
	jge L156
	movel a0@(16),a0@(12)
L156:
	movel a0@(12),a0@(8)
	movel d2,a5@(24)
	movel a5,d0
	moveml a6@(-20),#0x3c04
	unlk a6
	rts
	.even
.globl _build_complex
_build_complex:
	link a6,#0
	pea 37:w
	jbsr _make_node
	movel d0,a0
	movel a6@(8),a0@(20)
	movel a6@(12),a0@(24)
	unlk a6
	rts
	.even
.globl _integer_zerop
_integer_zerop:
	link a6,#0
	movel a6@(8),a0
	clrl d0
	cmpb #35,a0@(12)
	jne L159
	tstl a0@(16)
	jne L159
	tstl a0@(20)
	jne L159
	moveq #1,d0
L159:
	unlk a6
	rts
	.even
.globl _integer_onep
_integer_onep:
	link a6,#0
	movel a6@(8),a0
	clrl d0
	cmpb #35,a0@(12)
	jne L161
	moveq #1,d1
	cmpl a0@(16),d1
	jne L161
	tstl a0@(20)
	jne L161
	moveq #1,d0
L161:
	unlk a6
	rts
	.even
.globl _integer_all_onesp
_integer_all_onesp:
	link a6,#0
	moveml #0x3000,sp@-
	movel a6@(8),a1
	cmpb #35,a1@(12)
	jeq L163
	clrl d0
	jra L162
L163:
	movel a1@(8),a0
	btst #3,a0@(14)
	jne L164
	clrl d0
	moveq #-1,d3
	cmpl a1@(16),d3
	jne L162
	moveq #-1,d3
	cmpl a1@(20),d3
	jne L162
	moveq #1,d0
	jra L162
L164:
	movel a1@(8),a0
	clrl d1
	moveb a0@(31),d1
	moveq #31,d3
	cmpl d1,d3
	jge L166
	clrl d2
	moveq #-1,d3
	cmpl a1@(16),d3
	jne L167
	moveq #-32,d3
	addl d3,d1
	moveq #1,d0
	asll d1,d0
	subql #1,d0
	cmpl a1@(20),d0
	jne L167
	moveq #1,d2
L167:
	movel d2,d0
	jra L162
L166:
	moveq #1,d0
	asll d1,d0
	subql #1,d0
	cmpl a1@(16),d0
	seq d0
	moveq #1,d3
	andl d3,d0
L162:
	moveml a6@(-8),#0xc
	unlk a6
	rts
	.even
.globl _list_length
_list_length:
	link a6,#0
	clrl d0
	movel a6@(8),a0
	tstl a0
	jeq L174
L173:
	addql #1,d0
	movel a0@(4),a0
	tstl a0
	jne L173
L174:
	unlk a6
	rts
	.even
.globl _chainon
_chainon:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(8),d3
	movel a6@(12),d2
	tstl d3
	jeq L176
	movel d3,a2
	tstl a2@(4)
	jeq L183
L181:
	cmpl a2,d2
	jne L179
	jbsr _abort
L179:
	movel a2@(4),a2
	tstl a2@(4)
	jne L181
L183:
	movel d2,a2@(4)
	movel d3,d0
	jra L175
L176:
	movel d2,d0
L175:
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _build_tree_list
_build_tree_list:
	link a6,#0
	pea 3:w
	jbsr _make_node
	movel d0,a0
	movel a6@(8),a0@(16)
	movel a6@(12),a0@(20)
	unlk a6
	rts
	.even
.globl _tree_cons
_tree_cons:
	link a6,#0
	pea 3:w
	jbsr _make_node
	movel d0,a0
	movel a6@(16),a0@(4)
	movel a6@(8),a0@(16)
	movel a6@(12),a0@(20)
	unlk a6
	rts
	.even
.globl _perm_tree_cons
_perm_tree_cons:
	link a6,#0
	movel d2,sp@-
	movel _current_obstack,d2
	movel #_permanent_obstack,_current_obstack
	pea 3:w
	jbsr _make_node
	movel d0,a0
	movel a6@(16),a0@(4)
	movel a6@(8),a0@(16)
	movel a6@(12),a0@(20)
	movel d2,_current_obstack
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _temp_tree_cons
_temp_tree_cons:
	link a6,#0
	movel d2,sp@-
	movel _current_obstack,d2
	movel #_temporary_obstack,_current_obstack
	pea 3:w
	jbsr _make_node
	movel d0,a0
	movel a6@(16),a0@(4)
	movel a6@(8),a0@(16)
	movel a6@(12),a0@(20)
	movel d2,_current_obstack
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _saveable_tree_cons
_saveable_tree_cons:
	link a6,#0
	movel d2,sp@-
	movel _current_obstack,d2
	movel _saveable_obstack,_current_obstack
	pea 3:w
	jbsr _make_node
	movel d0,a0
	movel a6@(16),a0@(4)
	movel a6@(8),a0@(16)
	movel a6@(12),a0@(20)
	movel d2,_current_obstack
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _tree_last
_tree_last:
	link a6,#0
	movel a6@(8),a0
	tstl a0
	jeq L190
	jra L191
L193:
	movel d0,a0
L191:
	movel a0@(4),d0
	jne L193
L190:
	movel a0,d0
	unlk a6
	rts
	.even
.globl _nreverse
_nreverse:
	link a6,#0
	clrl d1
	movel a6@(8),a0
	tstl a0
	jeq L199
L198:
	movel a0@(4),d0
	movel d1,a0@(4)
	movel a0,d1
	movel d0,a0
	tstl a0
	jne L198
L199:
	movel d1,d0
	unlk a6
	rts
	.even
.globl _size_in_bytes
_size_in_bytes:
	link a6,#0
	movel a6@(8),a0
	cmpl _error_mark_node,a0
	jne L201
	movel _integer_zero_node,d0
	jra L200
L201:
	movel a0@(60),a0
	tstl a0@(24)
	jne L202
	movel a0,sp@-
	clrl sp@-
	jbsr _incomplete_type_error
	movel _integer_zero_node,d0
	jra L200
L202:
	pea 8:w
	clrl d0
	moveb a0@(29),d0
	movel d0,sp@-
	movel a0@(24),sp@-
	jbsr _convert_units
L200:
	unlk a6
	rts
	.even
.globl _int_size_in_bytes
_int_size_in_bytes:
	link a6,#0
	movel a6@(8),a1
	cmpl _error_mark_node,a1
	jne L204
	clrl d0
	jra L203
L204:
	movel a1@(60),a1
	tstl a1@(24)
	jeq L208
	movel a1@(24),a0
	cmpb #35,a0@(12)
	jeq L206
L208:
	moveq #-1,d0
	jra L203
L206:
	movel a1@(24),a0
	clrl d0
	moveb a1@(29),d0
	mulsl a0@(16),d0
	addql #7,d0
	jpl L207
	addql #7,d0
L207:
	asrl #3,d0
L203:
	unlk a6
	rts
	.even
.globl _array_type_nelts
_array_type_nelts:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a0
	movel a0@(16),a2
	movel _integer_zero_node,sp@-
	movel a2@(20),sp@-
	jbsr _tree_int_cst_equal
	addqw #8,sp
	tstl d0
	jeq L210
	movel a2@(52),d0
	jra L211
L210:
	movel a2@(20),sp@-
	movel a2@(52),sp@-
	movel _integer_type_node,sp@-
	pea 64:w
	jbsr _build
	addw #16,sp
	movel d0,sp@-
	jbsr _fold
L211:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _staticp
_staticp:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),a1
L222:
	clrl d0
	moveb a1@(12),d0
	moveq #43,d1
	cmpl d0,d1
	jeq L214
	moveq #39,d1
	cmpl d0,d1
	jeq L214
	moveq #53,d1
	cmpl d0,d1
	jne L213
L214:
	btst #5,a1@(13)
	jne L223
	tstb a1@(13)
	jlt L223
L213:
	moveq #38,d1
	cmpl d0,d1
	jne L216
L223:
	moveq #1,d0
	jra L212
L216:
	moveq #48,d1
	cmpl d0,d1
	jne L217
	clrl d2
	movel a1@(24),a0
	tstl a0@(48)
	jne L218
	movel a1@(20),sp@-
	jbsr _staticp
	tstl d0
	jeq L218
	moveq #1,d2
L218:
	movel d2,d0
	jra L212
L217:
	moveq #49,d1
	cmpl d0,d1
	jne L219
	movel a1@(20),a0
	bfextu a0@(13){#6:#1},d0
	jra L212
L219:
	moveq #52,d1
	cmpl d0,d1
	jne L220
	movel a1@(8),a0
	movel a0@(24),a0
	cmpb #35,a0@(12)
	jne L220
	movel a1@(24),a0
	cmpb #35,a0@(12)
	jne L220
	movel a1@(20),a1
	jra L222
L220:
	clrl d0
L212:
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _lvalue_p
_lvalue_p:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),a2
L228:
	clrl d2
	moveb a2@(12),d2
	movel a2,sp@-
	jbsr _language_lvalue_valid
	addqw #4,sp
	tstl d0
	jeq L225
	moveq #60,d1
	cmpl d1,d2
	jhi L225
LI239:
	movew pc@(L239-LI239-2:b,d2:l:2),d1
	jmp pc@(2,d1:w)
L239:
	.word L235-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L242-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L235-L239
	.word L235-L239
	.word L235-L239
	.word L225-L239
	.word L225-L239
	.word L227-L239
	.word L235-L239
	.word L225-L239
	.word L225-L239
	.word L235-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L225-L239
	.word L237-L239
L227:
	movel a2@(20),a2
	jra L228
L235:
	movel a2@(8),a0
	cmpb #21,a0@(12)
	jeq L225
L242:
	moveq #1,d0
	jra L224
L237:
	movel a2@(8),a0
	cmpb #13,a0@(12)
	jeq L242
L225:
	clrl d0
L224:
	moveml a6@(-8),#0x404
	unlk a6
	rts
LC8:
	.ascii "invalid lvalue in %s\0"
	.even
.globl _lvalue_or_else
_lvalue_or_else:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),sp@-
	jbsr _lvalue_p
	movel d0,d2
	addqw #4,sp
	jne L244
	movel a6@(12),sp@-
	pea LC8
	jbsr _error
L244:
	movel d2,d0
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _save_expr
_save_expr:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a2
	movel a2,sp@-
	jbsr _fold
	movel d0,a0
	addqw #4,sp
	btst #1,a0@(13)
	jne L247
	btst #2,a0@(13)
	jne L247
	cmpb #112,a0@(12)
	jne L246
L247:
	movel a0,d0
	jra L245
L246:
	clrl sp@-
	movel a0,sp@-
	movel a2@(8),sp@-
	pea 112:w
	jbsr _build
L245:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _stabilize_reference
_stabilize_reference:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),a2
	clrl d2
	moveb a2@(12),d2
	moveq #49,d1
	cmpl d2,d1
	jeq L260
	moveq #49,d1
	cmpl d2,d1
	jlt L266
	moveq #45,d1
	cmpl d2,d1
	jlt L267
	moveq #43,d1
	cmpl d2,d1
	jle L252
	tstl d2
	jeq L264
	jra L263
L267:
	moveq #48,d1
	cmpl d2,d1
	jeq L261
	jra L263
L266:
	moveq #79,d1
	cmpl d2,d1
	jlt L268
	moveq #75,d1
	cmpl d2,d1
	jle L259
	moveq #52,d1
	cmpl d2,d1
	jeq L262
	jra L263
L268:
	moveq #111,d1
	cmpl d2,d1
	jlt L263
	moveq #110,d1
	cmpl d2,d1
	jle L259
	jra L263
L252:
	movel a2,a0
	jra L249
L259:
	movel a2@(20),sp@-
	jbsr _stabilize_reference
	movel d0,sp@-
	movel d2,sp@-
	jra L269
L260:
	movel a2@(20),sp@-
	jbsr _save_expr
	movel d0,sp@-
	pea 49:w
L269:
	jbsr _build_nt
	movel d0,a0
	jra L249
L261:
	movel a2@(24),sp@-
	movel a2@(20),sp@-
	jbsr _stabilize_reference
	addqw #4,sp
	movel d0,sp@-
	pea 48:w
	jra L270
L262:
	movel a2@(24),sp@-
	jbsr _save_expr
	movel d0,sp@-
	movel a2@(20),sp@-
	jbsr _stabilize_reference
	addqw #4,sp
	movel d0,sp@-
	pea 52:w
L270:
	jbsr _build_nt
	movel d0,a0
	jra L249
L263:
	movel a2,d0
	jra L248
L264:
	movel _error_mark_node,d0
	jra L248
L249:
	movel a2@(8),a0@(8)
	bfextu a2@(13){#5:#1},d0
	bfins d0,a0@(13){#5:#1}
	bfextu a2@(13){#3:#1},d0
	bfins d0,a0@(13){#3:#1}
	bfextu a2@(14){#3:#1},d0
	bfins d0,a0@(14){#3:#1}
	movel a0,d0
L248:
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _build
_build:
	link a6,#0
	moveml #0x3020,sp@-
	lea a6@(8),a2
	movel a2@+,d2
	movel d2,sp@-
	jbsr _make_node
	movel d0,a1
	lea _tree_code_length,a0
	movel a0@(d2:l:4),d1
	movel a2@+,a1@(8)
	moveq #2,d3
	cmpl d1,d3
	jne L272
	movel a2@+,a0
	movel a2@+,a2
	movel a0,a1@(20)
	movel a2,a1@(24)
	clrl d0
	tstl a0
	jeq L275
	btst #4,a0@(13)
	jne L274
L275:
	tstl a2
	jeq L273
	btst #4,a2@(13)
	jeq L273
L274:
	moveq #1,d0
L273:
	bfins d0,a1@(13){#3:#1}
	jra L276
L272:
	clrl d0
	cmpl d0,d1
	jle L276
L281:
	movel a2@+,a0
	movel a0,a1@(20,d0:l:4)
	jeq L279
	btst #4,a0@(13)
	jeq L279
	orb #16,a1@(13)
L279:
	addql #1,d0
	cmpl d0,d1
	jgt L281
L276:
	movel a1,d0
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _build_nt
_build_nt:
	link a6,#0
	moveml #0x2020,sp@-
	lea a6@(8),a2
	movel a2@+,d2
	movel d2,sp@-
	jbsr _make_node
	movel d0,a1
	lea _tree_code_length,a0
	movel a0@(d2:l:4),d1
	clrl d0
	cmpl d0,d1
	jle L288
L287:
	movel a2@+,a1@(20,d0:l:4)
	addql #1,d0
	cmpl d0,d1
	jgt L287
L288:
	movel a1,d0
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _build_op_identifier
_build_op_identifier:
	link a6,#0
	pea 2:w
	jbsr _make_node
	movel d0,a0
	movel a6@(8),a0@(16)
	movel a6@(12),a0@(20)
	unlk a6
	rts
	.even
.globl _build_decl
_build_decl:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),d2
	movel d2,sp@-
	jbsr _make_node
	movel d0,a2
	movel a6@(12),a2@(36)
	movel a6@(16),a2@(8)
	clrl a2@(52)
	clrl a2@(60)
	addqw #4,sp
	moveq #43,d1
	cmpl d2,d1
	jeq L292
	moveq #44,d1
	cmpl d2,d1
	jeq L292
	moveq #45,d1
	cmpl d2,d1
	jne L291
L292:
	clrl sp@-
	movel a2,sp@-
	jbsr _layout_decl
	jra L293
L291:
	moveq #39,d1
	cmpl d2,d1
	jne L293
	moveq #1,d1
	movel d1,a2@(28)
L293:
	movel a2,d0
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _build_let
_build_let:
	link a6,#0
	pea 28:w
	jbsr _make_node
	movel d0,a0
	movel a6@(8),a0@(16)
	movel a6@(12),a0@(20)
	movel a6@(16),a0@(28)
	movel a6@(20),a0@(24)
	movel a6@(24),a0@(32)
	clrl a0@(36)
	movel a6@(28),a0@(40)
	unlk a6
	rts
	.even
.globl _build_type_variant
_build_type_variant:
	link a6,#0
	moveml #0x3820,sp@-
	movel a6@(8),a1
	movel a1@(60),a2
	movel _current_obstack,d4
	tstl a6@(12)
	sne d3
	moveq #1,d1
	andl d1,d3
	tstl a6@(16)
	sne d2
	moveq #1,d1
	andl d1,d2
	movel a2,a0
	tstl a0
	jeq L304
L301:
	bfextu a0@(13){#5:#1},d0
	cmpl d3,d0
	jne L299
	bfextu a0@(13){#3:#1},d0
	cmpl d2,d0
	jne L299
	movel a0,d0
	jra L296
L299:
	movel a0@(56),a0
	tstl a0
	jne L301
L304:
	tstb a1@(14)
	jge L302
	movel #_permanent_obstack,d0
	jra L303
L302:
	movel _saveable_obstack,d0
L303:
	movel d0,_current_obstack
	movel a1,sp@-
	jbsr _copy_node
	movel d0,a0
	bfins d3,a0@(13){#5:#1}
	bfins d2,a0@(13){#3:#1}
	clrl a0@(32)
	clrl a0@(36)
	movel a2@(56),a0@(56)
	movel a0,a2@(56)
	movel d4,_current_obstack
L296:
	moveml a6@(-16),#0x41c
	unlk a6
	rts
	.even
.globl _type_hash_list
_type_hash_list:
	link a6,#0
	clrl d0
	movel a6@(8),a1
	tstl a1
	jeq L310
L309:
	movel a1@(20),a0
	addl a0@,d0
	movel a1@(4),a1
	tstl a1
	jne L309
L310:
	unlk a6
	rts
	.even
.globl _type_hash_lookup
_type_hash_lookup:
	link a6,#0
	moveml #0x3030,sp@-
	movel a6@(8),d2
	movel a6@(12),a3
	movel d2,d0
	moveq #59,d3
	divsll d3,d1:d0
	lea _type_hash_table,a0
	movel a0@(d1:l:4),a2
	tstl a2
	jeq L320
L319:
	cmpl a2@(4),d2
	jne L314
	movel a2@(8),a0
	moveb a0@(12),d3
	cmpb a3@(12),d3
	jne L314
	movel a0@(8),d3
	cmpl a3@(8),d3
	jne L314
	movel a0@(52),d3
	cmpl a3@(52),d3
	jeq L316
	movel a3@(52),sp@-
	movel a0@(52),sp@-
	jbsr _tree_int_cst_equal
	addqw #8,sp
	tstl d0
	jeq L314
L316:
	movel a2@(8),a0
	movel a0@(20),d3
	cmpl a3@(20),d3
	jeq L317
	movel a3@(20),sp@-
	movel a0@(20),sp@-
	jbsr _tree_int_cst_equal
	addqw #8,sp
	tstl d0
	jeq L314
L317:
	movel a2@(8),a0
	movel a0@(16),d3
	cmpl a3@(16),d3
	jeq L318
	movel a0@(16),a1
	cmpb #3,a1@(12)
	jne L314
	movel a3@(16),a0
	cmpb #3,a0@(12)
	jne L314
	movel a0,sp@-
	movel a1,sp@-
	jbsr _type_list_equal
	addqw #8,sp
	tstl d0
	jeq L314
L318:
	movel a2@(8),d0
	jra L311
L314:
	movel a2@,a2
	tstl a2
	jne L319
L320:
	clrl d0
L311:
	moveml a6@(-16),#0xc0c
	unlk a6
	rts
	.even
.globl _type_hash_add
_type_hash_add:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),d2
	pea 12:w
	jbsr _oballoc
	movel d0,a0
	movel d2,a0@(4)
	movel a6@(12),a0@(8)
	moveq #59,d1
	divsll d1,d0:d2
	lea _type_hash_table,a1
	movel a1@(d0:l:4),a0@
	movel a0,a1@(d0:l:4)
	movel a6@(-4),d2
	unlk a6
	rts
.globl _debug_no_type_hash
.data
	.even
_debug_no_type_hash:
	.long 0
.text
	.even
.globl _type_hash_canon
_type_hash_canon:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(8),d3
	movel a6@(12),a2
	tstl _debug_no_type_hash
	jne L329
	movel a2,sp@-
	movel d3,sp@-
	jbsr _type_hash_lookup
	movel d0,d2
	addqw #8,sp
	jeq L324
	tstb a2@(14)
	jge L325
	movel #_permanent_obstack,d0
	jra L326
L325:
	movel _saveable_obstack,d0
L326:
	movel d0,a0
	movel a2,d0
	cmpl a0@(4),a2
	jcs L327
	cmpl a0@(16),a2
	jcc L327
	movel a2,a0@(8)
	movel a2,a0@(12)
	jra L328
L327:
	movel d0,sp@-
	movel a0,sp@-
	jbsr _obstack_free
L328:
	movel d2,d0
	jra L322
L324:
	cmpl #_permanent_obstack,_current_obstack
	jne L329
	movel a2,sp@-
	movel d3,sp@-
	jbsr _type_hash_add
L329:
	movel a2,d0
L322:
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _type_list_equal
_type_list_equal:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(8),a2
	movel a6@(12),a3
	tstl a2
	jeq L332
L336:
	tstl a3
	jeq L332
	movel a2@(20),d1
	cmpl a3@(20),d1
	jne L338
	movel a2@(16),d1
	cmpl a3@(16),d1
	jeq L333
	movel a3@(16),sp@-
	movel a2@(16),sp@-
	jbsr _simple_cst_equal
	addqw #8,sp
	tstl d0
	jne L333
L338:
	clrl d0
	jra L330
L333:
	movel a2@(4),a2
	movel a3@(4),a3
	tstl a2
	jne L336
L332:
	cmpl a2,a3
	seq d0
	moveq #1,d1
	andl d1,d0
L330:
	moveml a6@(-8),#0xc00
	unlk a6
	rts
	.even
.globl _tree_int_cst_equal
_tree_int_cst_equal:
	link a6,#0
	movel a6@(8),a1
	movel a6@(12),a0
	cmpl a1,a0
	jeq L344
	tstl a1
	jeq L343
	tstl a0
	jeq L343
	cmpb #35,a1@(12)
	jne L343
	cmpb #35,a0@(12)
	jne L343
	movel a1@(16),d1
	cmpl a0@(16),d1
	jne L343
	movel a1@(20),d1
	cmpl a0@(20),d1
	jne L343
L344:
	moveq #1,d0
	jra L339
L343:
	clrl d0
L339:
	unlk a6
	rts
	.even
.globl _tree_int_cst_lt
_tree_int_cst_lt:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a1
	movel a6@(12),a2
	cmpl a1,a2
	jne L346
	clrl d0
	jra L345
L346:
	movel a1@(8),a0
	btst #3,a0@(14)
	jne L347
	clrl d0
	movel a1@(20),d1
	cmpl a2@(20),d1
	jlt L351
	jra L352
L347:
	clrl d0
	movel a1@(20),d1
	cmpl a2@(20),d1
	jcs L351
L352:
	cmpl a2@(20),d1
	jne L350
	movel a1@(16),d1
	cmpl a2@(16),d1
	jcc L350
L351:
	moveq #1,d0
L350:
L345:
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _simple_cst_equal
_simple_cst_equal:
	link a6,#0
	moveml #0x3038,sp@-
	movel a6@(8),a3
	movel a6@(12),a2
L361:
	cmpl a3,a2
	jeq L390
	tstl a3
	jeq L392
	tstl a2
	jeq L392
	clrl d1
	moveb a3@(12),d1
	clrl d0
	moveb a2@(12),d0
	moveq #111,d3
	cmpl d1,d3
	jeq L358
	moveq #110,d3
	cmpl d1,d3
	jne L357
L358:
	moveq #111,d3
	cmpl d0,d3
	jeq L387
	moveq #110,d3
	cmpl d0,d3
	jeq L387
	movel a3@(20),a3
	jra L361
L357:
	moveq #111,d3
	cmpl d0,d3
	jeq L391
	moveq #110,d3
	cmpl d0,d3
	jeq L391
	cmpl d1,d0
	jeq L366
L392:
	clrl d0
	jra L353
L366:
	moveq #-35,d0
	addl d1,d0
	moveq #80,d3
	cmpl d3,d0
	jhi L388
LI389:
	movew pc@(L389-LI389-2:b,d0:l:2),d3
	jmp pc@(2,d3:w)
L389:
	.word L368-L389
	.word L370-L389
	.word L388-L389
	.word L371-L389
	.word L388-L389
	.word L388-L389
	.word L392-L389
	.word L388-L389
	.word L392-L389
	.word L392-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L373-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L383-L389
	.word L383-L389
	.word L383-L389
	.word L383-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L383-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L387-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L383-L389
	.word L383-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L388-L389
	.word L387-L389
	.word L387-L389
L368:
	clrl d0
	movel a3@(16),d3
	cmpl a2@(16),d3
	jne L353
	movel a3@(20),d3
	cmpl a2@(20),d3
	jne L353
L390:
	moveq #1,d0
	jra L353
L370:
	fmoved a3@(20),fp0
	fcmpd a2@(20),fp0
	fseq d0
	moveq #1,d3
	andl d3,d0
	jra L353
L371:
	clrl d2
	movel a3@(20),d3
	cmpl a2@(20),d3
	jne L384
	movel a2@(24),sp@-
	movel a3@(24),sp@-
	jbsr _strcmp
	tstl d0
	jne L384
	jra L393
L373:
	jbsr _abort
	jra L392
L383:
	clrl d2
	movel a2@(20),sp@-
	movel a3@(20),sp@-
	lea _simple_cst_equal,a4
	jbsr a4@
	addqw #8,sp
	tstl d0
	jeq L384
	movel a2@(24),sp@-
	movel a3@(24),sp@-
	jbsr a4@
	tstl d0
	jeq L384
L393:
	moveq #1,d2
L384:
	movel d2,d0
	jra L353
L387:
	movel a3@(20),a3
L391:
	movel a2@(20),a2
	jra L361
L388:
	jbsr _abort
L353:
	moveml a6@(-20),#0x1c0c
	unlk a6
	rts
	.even
.globl _build_pointer_type
_build_pointer_type:
	link a6,#0
	moveml #0x3030,sp@-
	movel a6@(8),a3
	movel a3@(32),a2
	movel _current_obstack,d2
	movel _saveable_obstack,d3
	tstl a2
	jne L397
	tstb a3@(14)
	jge L396
	movel #_permanent_obstack,_current_obstack
	movel #_permanent_obstack,_saveable_obstack
L396:
	pea 11:w
	jbsr _make_node
	movel d0,a2
	movel a3,a2@(8)
	movel a2,a3@(32)
	movel a2,sp@-
	jbsr _layout_type
	movel d2,_current_obstack
	movel d3,_saveable_obstack
L397:
	movel a2,d0
	moveml a6@(-16),#0xc0c
	unlk a6
	rts
	.even
.globl _build_index_type
_build_index_type:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(8),a3
	pea 5:w
	jbsr _make_node
	movel d0,a2
	movel a3@(16),d2
	moveb #32,a2@(31)
	clrl sp@-
	clrl sp@-
	jbsr _build_int_2
	movel d0,a0
	movel a0,a2@(20)
	movel a2,a0@(8)
	movel a3,a2@(52)
	movel a2,a3@(8)
	moveb #4,a2@(28)
	movel _sizetype,a0
	movel a0@(24),a2@(24)
	moveb a0@(29),a2@(29)
	moveb a0@(30),a2@(30)
	movel a2,sp@-
	tstl d2
	jle L399
	movel d2,d0
	jra L400
L399:
	movel d2,d0
	negl d0
L400:
	movel d0,sp@-
	jbsr _type_hash_canon
	moveml a6@(-12),#0xc04
	unlk a6
	rts
LC9:
	.ascii "arrays of functions are not meaningful\0"
	.even
.globl _build_array_type
_build_array_type:
	link a6,#0
	moveml #0x38,sp@-
	movel a6@(8),a3
	movel a6@(12),a4
	pea 16:w
	jbsr _make_node
	movel d0,a2
	addqw #4,sp
	cmpb #21,a3@(12)
	jne L402
	pea LC9
	jbsr _error
	movel _integer_type_node,a3
	addqw #4,sp
L402:
	movel a3,a2@(8)
	movel a4,a2@(16)
	movel a3,sp@-
	jbsr _build_pointer_type
	addqw #4,sp
	tstl a4
	jeq L404
	movel a3@,d0
	addl a4@,d0
	movel a2,sp@-
	movel d0,sp@-
	jbsr _type_hash_canon
	movel d0,a2
	addqw #8,sp
	tstl a2@(24)
	jne L404
	movel a2,sp@-
	jbsr _layout_type
L404:
	movel a2,d0
	moveml a6@(-12),#0x1c00
	unlk a6
	rts
LC10:
	.ascii "function return type cannot be function or array\0"
	.even
.globl _build_function_type
_build_function_type:
	link a6,#0
	moveml #0x2030,sp@-
	movel a6@(8),a3
	movel a6@(12),d2
	cmpb #21,a3@(12)
	jeq L407
	cmpb #16,a3@(12)
	jne L406
L407:
	pea LC10
	jbsr _error
	movel _integer_type_node,a3
	addqw #4,sp
L406:
	pea 21:w
	jbsr _make_node
	movel d0,a2
	movel a3,a2@(8)
	movel d2,a2@(16)
	movel d2,sp@-
	jbsr _type_hash_list
	addl a3@,d0
	movel a2,sp@-
	movel d0,sp@-
	jbsr _type_hash_canon
	movel d0,a2
	addw #16,sp
	tstl a2@(24)
	jne L408
	movel a2,sp@-
	jbsr _layout_type
L408:
	movel a2,d0
	moveml a6@(-12),#0xc04
	unlk a6
	rts
	.even
.globl _build_reference_type
_build_reference_type:
	link a6,#0
	moveml #0x3030,sp@-
	movel a6@(8),a3
	movel a3@(36),a2
	movel _current_obstack,d2
	movel _saveable_obstack,d3
	tstl a2
	jne L412
	tstb a3@(14)
	jge L411
	movel #_permanent_obstack,_current_obstack
	movel #_permanent_obstack,_saveable_obstack
L411:
	pea 13:w
	jbsr _make_node
	movel d0,a2
	movel a3,a2@(8)
	movel a2,a3@(36)
	movel a2,sp@-
	jbsr _layout_type
	movel d2,_current_obstack
	movel d3,_saveable_obstack
L412:
	movel a2,d0
	moveml a6@(-16),#0xc0c
	unlk a6
	rts
	.even
.globl _build_method_type
_build_method_type:
	link a6,#0
	moveml #0x38,sp@-
	movel a6@(8),a4
	movel a6@(12),a3
	pea 14:w
	jbsr _make_node
	movel d0,a2
	addqw #4,sp
	cmpb #21,a3@(12)
	jeq L414
	jbsr _abort
L414:
	movel a4,a2@(52)
	movel a3@(8),a2@(8)
	movel a3@(16),sp@-
	movel a4,sp@-
	jbsr _build_pointer_type
	addqw #4,sp
	movel d0,sp@-
	clrl sp@-
	jbsr _tree_cons
	movel d0,a2@(16)
	movel a4@,d0
	addl a3@,d0
	movel a2,sp@-
	movel d0,sp@-
	jbsr _type_hash_canon
	movel d0,a2
	addw #20,sp
	tstl a2@(24)
	jne L415
	movel a2,sp@-
	jbsr _layout_type
L415:
	movel a2,d0
	moveml a6@(-12),#0x1c00
	unlk a6
	rts
	.even
.globl _build_offset_type
_build_offset_type:
	link a6,#0
	moveml #0x38,sp@-
	movel a6@(8),a2
	movel a6@(12),a3
	pea 12:w
	jbsr _make_node
	movel d0,a4
	movel a2,a4@(52)
	movel a3,a4@(8)
	movel a2@,d0
	addl a3@,d0
	movel a4,sp@-
	movel d0,sp@-
	jbsr _type_hash_canon
	movel d0,a4
	addw #12,sp
	tstl a4@(24)
	jne L417
	movel a4,sp@-
	jbsr _layout_type
L417:
	movel a4,d0
	moveml a6@(-12),#0x1c00
	unlk a6
	rts
	.even
.globl _get_unwidened
_get_unwidened:
	link a6,#0
	moveml #0x3f30,sp@-
	movel a6@(8),a2
	movel a6@(12),d6
	movel a2@(8),a1
	jeq L419
	movel d6,a0
	jra L420
L419:
	movel a1,a0
L420:
	clrl d5
	moveb a0@(31),d5
	clrl d1
	tstl d6
	jeq L421
	cmpl d6,a1
	jeq L421
	clrl d0
	moveb a1@(31),d0
	cmpl d5,d0
	jge L421
	btst #3,a1@(14)
	jeq L421
	moveq #1,d1
L421:
	movel d1,d4
	movel a2,a3
	cmpb #111,a2@(12)
	jne L423
	clrl d1
	clrl d2
	andl #255,d3
L430:
	movel a2@(8),a0
	moveb a0@(31),d1
	movel a2@(20),a0
	movel a0@(8),a0
	moveb a0@(31),d2
	movel d1,d0
	subl d2,d0
	jpl L424
	cmpl d5,d1
	jlt L423
L424:
	movel a2@(20),a2
	tstl d0
	jle L422
	tstl d4
	jeq L427
	movel a2@(8),a0
	moveb a0@(31),d3
	cmpl d5,d3
	jlt L426
L427:
	movel a2,a3
L426:
	tstl d4
	jne L429
	cmpb #111,a2@(12)
	jne L422
L429:
	movel a2@(8),a0
	btst #3,a0@(14)
	jeq L422
	moveq #1,d4
	movel a2,a3
L422:
	cmpb #111,a2@(12)
	jeq L430
L423:
	cmpb #48,a2@(12)
	jne L431
	cmpb #6,a1@(12)
	jeq L431
	movel a2@(24),a0
	movel a0@(24),a1
	clrl d0
	moveb a0@(32),d0
	movel d0,d2
	mulsl a1@(16),d2
	bfextu a0@(14){#4:#1},d7
	movel d7,sp@-
	movel d2,sp@-
	jbsr _type_for_size
	movel d0,a1
	movel a2@(8),a0
	clrl d0
	moveb a0@(31),d0
	addqw #8,sp
	cmpl d2,d0
	jle L431
	tstl d6
	jne L433
	movel a2@(24),a0
	moveq #25,d7
	cmpl a0@(28),d7
	jeq L431
L433:
	tstl d4
	jeq L434
	cmpl d5,d2
	jge L434
	movel a2@(24),a0
	btst #3,a0@(14)
	jeq L431
L434:
	tstl a1
	jeq L431
	movel a2@(24),sp@-
	movel a2@(20),sp@-
	movel a1,sp@-
	pea 48:w
	jbsr _build
	movel d0,a3
	bfextu a2@(13){#3:#1},d0
	bfins d0,a3@(13){#3:#1}
	bfextu a2@(14){#3:#1},d0
	bfins d0,a3@(14){#3:#1}
L431:
	movel a3,d0
	moveml a6@(-32),#0xcfc
	unlk a6
	rts
	.even
.globl _get_narrower
_get_narrower:
	link a6,#0
	moveml #0x3c38,sp@-
	movel a6@(8),a2
	clrl d3
	moveq #1,d4
	movel a2,a3
	cmpb #111,a2@(12)
	jne L438
	clrl d2
	clrl d1
L444:
	movel a2@(8),a0
	moveb a0@(31),d2
	movel a2@(20),a0
	movel a0@(8),a1
	moveb a1@(31),d1
	movel d2,d0
	subl d1,d0
	jmi L438
	movel a0,a2
	tstl d0
	jle L440
	tstl d4
	jeq L441
	bfextu a1@(14){#4:#1},d3
	jra L442
L441:
	movel a2@(8),a0
	bfextu a0@(14){#4:#1},d0
	cmpl d3,d0
	jne L438
L442:
	clrl d4
L440:
	movel a2,a3
	cmpb #111,a2@(12)
	jeq L444
L438:
	cmpb #48,a2@(12)
	jne L445
	movel a2@(8),a0
	cmpb #6,a0@(12)
	jeq L445
	movel a2@(24),a0
	movel a0@(24),a1
	clrl d2
	moveb a0@(32),d2
	mulsl a1@(16),d2
	bfextu a2@(14){#4:#1},d5
	movel d5,sp@-
	movel d2,sp@-
	jbsr _type_for_size
	movel d0,d1
	movel a2@(8),a0
	clrl d0
	moveb a0@(31),d0
	addqw #8,sp
	cmpl d2,d0
	jle L445
	movel a2@(24),a0
	moveq #25,d5
	cmpl a0@(28),d5
	jeq L445
	tstl d4
	jne L447
	bfextu a0@(14){#4:#1},d0
	cmpl d3,d0
	jne L445
L447:
	tstl d1
	jeq L445
	tstl d4
	jeq L448
	movel a2@(24),a0
	bfextu a0@(14){#4:#1},d3
L448:
	movel a2@(24),sp@-
	movel a2@(20),sp@-
	movel d1,sp@-
	pea 48:w
	jbsr _build
	movel d0,a3
	bfextu a2@(13){#3:#1},d0
	bfins d0,a3@(13){#3:#1}
	bfextu a2@(14){#3:#1},d0
	bfins d0,a3@(14){#3:#1}
L445:
	movel a6@(12),a4
	movel d3,a4@
	movel a3,d0
	moveml a6@(-28),#0x1c3c
	unlk a6
	rts
	.even
.globl _type_precision
_type_precision:
	link a6,#0
	movel a6@(8),a0
	cmpb #5,a0@(12)
	jeq L453
	cmpb #8,a0@(12)
	jeq L453
	cmpb #6,a0@(12)
	jne L451
L453:
	clrl d0
	moveb a0@(31),d0
	jra L452
L451:
	moveq #32,d0
L452:
	unlk a6
	rts
	.even
.globl _int_fits_type_p
_int_fits_type_p:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),a1
	movel a6@(12),a2
	btst #3,a2@(14)
	jeq L455
	clrl d0
	movel a2@(52),a0
	movel a0@(20),d1
	cmpl a1@(20),d1
	jcs L454
	jne L457
	movel a0@(16),d1
	cmpl a1@(16),d1
	jcs L454
L457:
	movel a2@(20),a0
	movel a1@(20),d1
	cmpl a0@(20),d1
	jcs L454
	jra L463
L455:
	clrl d0
	movel a2@(52),a0
	movel a0@(20),d1
	cmpl a1@(20),d1
	jlt L460
	jne L461
	movel a0@(16),d1
	cmpl a1@(16),d1
	jcs L460
L461:
	movel a2@(20),a0
	movel a1@(20),d1
	cmpl a0@(20),d1
	jlt L460
L463:
	cmpl a0@(20),d1
	jne L462
	movel a1@(16),d1
	cmpl a0@(16),d1
	jcs L460
L462:
	moveq #1,d0
L460:
L454:
	movel a6@(-4),a2
	unlk a6
	rts
.comm _type_hash_table,236
.lcomm _hash_table,4036
.comm _momentary_stack,4
.comm _momentary_firstobj,4
.comm _temporary_firstobj,4
.comm _maybepermanent_firstobj,4
.comm _expression_obstack,4
.comm _current_obstack,4
.comm _rtl_obstack,4
.comm _saveable_obstack,4
.comm _momentary_obstack,36
.comm _temporary_obstack,36
.comm _maybepermanent_obstack,36
.comm _permanent_obstack,36
.comm _all_types_permanent,4
