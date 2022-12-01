#NO_APP
gcc_compiled.:
.globl _rtl_dump
.data
	.even
_rtl_dump:
	.long 0
.globl _rtl_dump_and_exit
	.even
_rtl_dump_and_exit:
	.long 0
.globl _jump_opt_dump
	.even
_jump_opt_dump:
	.long 0
.globl _cse_dump
	.even
_cse_dump:
	.long 0
.globl _loop_dump
	.even
_loop_dump:
	.long 0
.globl _flow_dump
	.even
_flow_dump:
	.long 0
.globl _combine_dump
	.even
_combine_dump:
	.long 0
.globl _local_reg_dump
	.even
_local_reg_dump:
	.long 0
.globl _global_reg_dump
	.even
_global_reg_dump:
	.long 0
.globl _jump2_opt_dump
	.even
_jump2_opt_dump:
	.long 0
.globl _write_symbols
	.even
_write_symbols:
	.long 0
.globl _optimize
	.even
_optimize:
	.long 0
.globl _flag_caller_saves
	.even
_flag_caller_saves:
	.long 0
.globl _flag_pcc_struct_return
	.even
_flag_pcc_struct_return:
	.long 0
.globl _flag_force_mem
	.even
_flag_force_mem:
	.long 0
.globl _flag_force_addr
	.even
_flag_force_addr:
	.long 0
.globl _flag_defer_pop
	.even
_flag_defer_pop:
	.long 1
.globl _flag_float_store
	.even
_flag_float_store:
	.long 0
.globl _flag_combine_regs
	.even
_flag_combine_regs:
	.long 0
.globl _flag_strength_reduce
	.even
_flag_strength_reduce:
	.long 0
.globl _flag_writable_strings
	.even
_flag_writable_strings:
	.long 0
.globl _flag_no_function_cse
	.even
_flag_no_function_cse:
	.long 0
.globl _flag_omit_frame_pointer
	.even
_flag_omit_frame_pointer:
	.long 0
.globl _flag_no_peephole
	.even
_flag_no_peephole:
	.long 0
.globl _obey_regdecls
	.even
_obey_regdecls:
	.long 0
.globl _quiet_flag
	.even
_quiet_flag:
	.long 0
.globl _inhibit_warnings
	.even
_inhibit_warnings:
	.long 0
.globl _extra_warnings
	.even
_extra_warnings:
	.long 0
.globl _errorcount
	.even
_errorcount:
	.long 0
.globl _warningcount
	.even
_warningcount:
	.long 0
.globl _sorrycount
	.even
_sorrycount:
	.long 0
.globl _profile_flag
	.even
_profile_flag:
	.long 0
.globl _pedantic
	.even
_pedantic:
	.long 0
.globl _f_options
.text
LC0:
	.ascii "float-store\0"
LC1:
	.ascii "volatile\0"
LC2:
	.ascii "defer-pop\0"
LC3:
	.ascii "omit-frame-pointer\0"
LC4:
	.ascii "strength-reduce\0"
LC5:
	.ascii "writable-strings\0"
LC6:
	.ascii "peephole\0"
LC7:
	.ascii "force-mem\0"
LC8:
	.ascii "force-addr\0"
LC9:
	.ascii "combine-regs\0"
LC10:
	.ascii "function-cse\0"
LC11:
	.ascii "inline-functions\0"
LC12:
	.ascii "keep-inline-functions\0"
LC13:
	.ascii "syntax-only\0"
LC14:
	.ascii "shared-data\0"
LC15:
	.ascii "caller-saves\0"
LC16:
	.ascii "pcc-struct-return\0"
.data
	.even
_f_options:
	.long LC0
	.long _flag_float_store
	.long 1
	.long LC1
	.long _flag_volatile
	.long 1
	.long LC2
	.long _flag_defer_pop
	.long 1
	.long LC3
	.long _flag_omit_frame_pointer
	.long 1
	.long LC4
	.long _flag_strength_reduce
	.long 1
	.long LC5
	.long _flag_writable_strings
	.long 1
	.long LC6
	.long _flag_no_peephole
	.long 0
	.long LC7
	.long _flag_force_mem
	.long 1
	.long LC8
	.long _flag_force_addr
	.long 1
	.long LC9
	.long _flag_combine_regs
	.long 1
	.long LC10
	.long _flag_no_function_cse
	.long 0
	.long LC11
	.long _flag_inline_functions
	.long 1
	.long LC12
	.long _flag_keep_inline_functions
	.long 1
	.long LC13
	.long _flag_syntax_only
	.long 1
	.long LC14
	.long _flag_shared_data
	.long 1
	.long LC15
	.long _flag_caller_saves
	.long 1
	.long LC16
	.long _flag_pcc_struct_return
	.long 1
.text
	.even
.globl _gettime
_gettime:
	link a6,#-16
	tstl _quiet_flag
	jeq L2
	clrl d0
	jra L1
L2:
	pea a6@(-16)
	jbsr _times
	movel a6@(-16),d0
	addl a6@(-12),d0
	mulsl #16666,d0
L1:
	unlk a6
	rts
LC17:
	.ascii "time in %s: %d.%06d\12\0"
	.even
.globl _print_time
_print_time:
	link a6,#0
	movel a6@(12),d0
	divsll #1000000,d1:d0
	movel d1,sp@-
	movel d0,sp@-
	movel a6@(8),sp@-
	pea LC17
	pea __iob+40
	jbsr _fprintf
	unlk a6
	rts
	.even
.globl _count_error
_count_error:
	link a6,#0
	movel a6@(8),d0
	jeq L5
	tstl _inhibit_warnings
	jeq L5
	clrl d0
	jra L4
L5:
	tstl d0
	jeq L6
	addql #1,_warningcount
	jra L7
L6:
	addql #1,_errorcount
L7:
	moveq #1,d0
L4:
	unlk a6
	rts
LC18:
	.ascii "cc1: \0"
	.even
.globl _pfatal_with_name
_pfatal_with_name:
	link a6,#0
	pea LC18
	pea __iob+40
	jbsr _fprintf
	movel a6@(8),sp@-
	jbsr _perror
	pea 35:w
	jbsr _exit
	unlk a6
	rts
LC19:
	.ascii "cc1:%s: I/O error\12\0"
	.even
.globl _fatal_io_error
_fatal_io_error:
	link a6,#0
	movel a6@(8),sp@-
	pea LC19
	pea __iob+40
	jbsr _fprintf
	pea 35:w
	jbsr _exit
	unlk a6
	rts
	.even
.globl _fatal
_fatal:
	link a6,#0
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	jbsr _error
	pea 34:w
	jbsr _exit
	unlk a6
	rts
.data
	.even
_last_error_function:
	.long 0
.text
LC20:
	.ascii " %s\0"
	.even
.globl _announce_function
_announce_function:
	link a6,#0
	movel d2,sp@-
	tstl _quiet_flag
	jne L12
	movel a6@(8),a1
	movel a1@(36),a0
	movel a0@(20),sp@-
	pea LC20
	movel #__iob+40,d2
	movel d2,sp@-
	jbsr _fprintf
	movel d2,sp@-
	jbsr _fflush
	moveq #1,d1
	movel d1,_need_error_newline
	movel _current_function_decl,_last_error_function
L12:
	movel a6@(-4),d2
	unlk a6
	rts
LC21:
	.ascii "\12\0"
LC22:
	.ascii "%s: \0"
LC23:
	.ascii "At top level:\12\0"
LC24:
	.ascii "In function %s:\12\0"
	.even
_report_error_function:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),d2
	tstl _need_error_newline
	jeq L14
	pea LC21
	pea __iob+40
	jbsr _fprintf
	clrl _need_error_newline
	addqw #8,sp
L14:
	movel _last_error_function,d1
	cmpl _current_function_decl,d1
	jeq L15
	tstl d2
	jeq L16
	movel d2,sp@-
	pea LC22
	pea __iob+40
	jbsr _fprintf
	addw #12,sp
L16:
	tstl _current_function_decl
	jne L17
	pea LC23
	pea __iob+40
	jbsr _fprintf
	jra L18
L17:
	movel _current_function_decl,a0
	movel a0@(36),a0
	movel a0@(20),sp@-
	pea LC24
	pea __iob+40
	jbsr _fprintf
L18:
	movel _current_function_decl,_last_error_function
L15:
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _error
_error:
	link a6,#0
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	movel _lineno,sp@-
	movel _input_filename,sp@-
	jbsr _error_with_file_and_line
	unlk a6
	rts
LC25:
	.ascii "%s:%d: \0"
	.even
.globl _error_with_file_and_line
_error_with_file_and_line:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),d2
	clrl sp@-
	jbsr _count_error
	movel d2,sp@-
	jbsr _report_error_function
	addqw #8,sp
	tstl d2
	jeq L21
	movel a6@(12),sp@-
	movel d2,sp@-
	pea LC25
	pea __iob+40
	jbsr _fprintf
	addw #16,sp
	jra L22
L21:
	pea LC18
	pea __iob+40
	jbsr _fprintf
	addqw #8,sp
L22:
	movel a6@(24),sp@-
	movel a6@(20),sp@-
	movel a6@(16),sp@-
	movel #__iob+40,d2
	movel d2,sp@-
	lea _fprintf,a2
	jbsr a2@
	pea LC21
	movel d2,sp@-
	jbsr a2@
	moveml a6@(-8),#0x404
	unlk a6
	rts
LC26:
	.ascii "((anonymous))\0"
	.even
.globl _error_with_decl
_error_with_decl:
	link a6,#0
	moveml #0x3830,sp@-
	movel a6@(8),a2
	movel a6@(12),d4
	movel a6@(16),d3
	clrl sp@-
	jbsr _count_error
	movel a2@(16),sp@-
	jbsr _report_error_function
	movel a2@(20),sp@-
	movel a2@(16),sp@-
	pea LC25
	movel #__iob+40,d2
	movel d2,sp@-
	lea _fprintf,a3
	jbsr a3@
	addw #24,sp
	tstl a2@(36)
	jeq L24
	movel d3,sp@-
	movel a2@(36),a0
	movel a0@(20),sp@-
	movel d4,sp@-
	movel d2,sp@-
	jbsr a3@
	jra L26
L24:
	movel d3,sp@-
	pea LC26
	movel d4,sp@-
	pea __iob+40
	jbsr _fprintf
L26:
	addw #16,sp
	pea LC21
	pea __iob+40
	jbsr _fprintf
	moveml a6@(-20),#0xc1c
	unlk a6
	rts
	.even
.globl _error_for_asm
_error_for_asm:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(8),a3
	movel a3@(16),a1
	cmpw #25,a1@
	jne L28
	movel a1@(8),a0
	cmpw #22,a0@
	jeq L35
L28:
	cmpw #22,a1@
	jne L30
	movel a1,a2
	jra L29
L30:
	cmpw #20,a1@
	jne L32
	movel a1@(4),a0
	movel a0@(4),a0
	cmpw #25,a0@
	jne L32
	movel a0@(8),a2
	jra L29
L32:
	cmpw #20,a1@
	jne L29
	movel a1@(4),a0
	movel a0@(4),a0
	cmpw #22,a0@
	jne L29
L35:
	movel a0,a2
L29:
	movel a2@(24),d0
	movel a2@(28),d1
	movel a6@(20),sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	movel d1,sp@-
	movel d0,sp@-
	jbsr _error_with_file_and_line
	moveml a6@(-8),#0xc00
	unlk a6
	rts
LC27:
	.ascii "warning: \0"
	.even
.globl _warning_with_file_and_line
_warning_with_file_and_line:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),d2
	pea 1:w
	jbsr _count_error
	addqw #4,sp
	tstl d0
	jeq L36
	movel d2,sp@-
	jbsr _report_error_function
	addqw #4,sp
	tstl d2
	jeq L38
	movel a6@(12),sp@-
	movel d2,sp@-
	pea LC25
	pea __iob+40
	jbsr _fprintf
	addw #16,sp
	jra L39
L38:
	pea LC18
	pea __iob+40
	jbsr _fprintf
	addqw #8,sp
L39:
	pea LC27
	movel #__iob+40,d2
	movel d2,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel a6@(24),sp@-
	movel a6@(20),sp@-
	movel a6@(16),sp@-
	movel d2,sp@-
	jbsr a2@
	pea LC21
	movel d2,sp@-
	jbsr a2@
L36:
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _warning
_warning:
	link a6,#0
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	movel _lineno,sp@-
	movel _input_filename,sp@-
	jbsr _warning_with_file_and_line
	unlk a6
	rts
	.even
.globl _warning_with_decl
_warning_with_decl:
	link a6,#0
	moveml #0x3830,sp@-
	movel a6@(8),a3
	movel a6@(12),d4
	movel a6@(16),d3
	pea 1:w
	jbsr _count_error
	addqw #4,sp
	tstl d0
	jeq L41
	movel a3@(16),sp@-
	jbsr _report_error_function
	movel a3@(20),sp@-
	movel a3@(16),sp@-
	pea LC25
	movel #__iob+40,d2
	movel d2,sp@-
	lea _fprintf,a2
	jbsr a2@
	pea LC27
	movel d2,sp@-
	jbsr a2@
	addw #28,sp
	tstl a3@(36)
	jeq L43
	movel d3,sp@-
	movel a3@(36),a0
	movel a0@(20),sp@-
	movel d4,sp@-
	movel d2,sp@-
	jbsr a2@
	jra L45
L43:
	movel d3,sp@-
	pea LC26
	movel d4,sp@-
	pea __iob+40
	jbsr _fprintf
L45:
	addw #16,sp
	pea LC21
	pea __iob+40
	jbsr _fprintf
L41:
	moveml a6@(-20),#0xc1c
	unlk a6
	rts
LC28:
	.ascii "sorry, not implemented: \0"
	.even
.globl _sorry
_sorry:
	link a6,#0
	moveml #0x2020,sp@-
	addql #1,_sorrycount
	tstl _input_filename
	jeq L47
	movel _lineno,sp@-
	movel _input_filename,sp@-
	pea LC25
	pea __iob+40
	jbsr _fprintf
	addw #16,sp
	jra L48
L47:
	pea LC18
	pea __iob+40
	jbsr _fprintf
	addqw #8,sp
L48:
	pea LC28
	movel #__iob+40,d2
	movel d2,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	movel d2,sp@-
	jbsr a2@
	pea LC21
	movel d2,sp@-
	jbsr a2@
	moveml a6@(-8),#0x404
	unlk a6
	rts
LC29:
	.ascii "c++: \0"
LC30:
	.ascii " (fatal)\12\0"
	.even
.globl _really_sorry
_really_sorry:
	link a6,#0
	moveml #0x2020,sp@-
	tstl _input_filename
	jeq L50
	movel _lineno,sp@-
	movel _input_filename,sp@-
	pea LC25
	pea __iob+40
	jbsr _fprintf
	addw #16,sp
	jra L51
L50:
	pea LC29
	pea __iob+40
	jbsr _fprintf
	addqw #8,sp
L51:
	pea LC28
	movel #__iob+40,d2
	movel d2,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	movel d2,sp@-
	jbsr a2@
	pea LC30
	jbsr _fatal
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _botch
_botch:
	link a6,#0
	jbsr _abort
	unlk a6
	rts
LC31:
	.ascii "Virtual memory exhausted.\0"
	.even
.globl _xmalloc
_xmalloc:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),sp@-
	jbsr _malloc
	movel d0,d2
	addqw #4,sp
	jne L54
	pea LC31
	jbsr _fatal
L54:
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
	jne L56
	pea LC31
	jbsr _fatal
L56:
	movel d2,d0
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _exact_log2
_exact_log2:
	link a6,#0
	moveml #0x3000,sp@-
	movel a6@(8),d2
	clrl d1
L62:
	moveq #1,d0
	asll d1,d0
	cmpl d2,d0
	jne L60
	movel d1,d0
	jra L57
L60:
	addql #1,d1
	moveq #31,d3
	cmpl d1,d3
	jge L62
	moveq #-1,d0
L57:
	moveml a6@(-8),#0xc
	unlk a6
	rts
	.even
.globl _floor_log2
_floor_log2:
	link a6,#0
	moveml #0x3000,sp@-
	movel a6@(8),d2
	clrl d1
L68:
	moveq #-1,d0
	asll d1,d0
	andl d2,d0
	jne L66
	movel d1,d0
	subql #1,d0
	jra L63
L66:
	addql #1,d1
	moveq #31,d3
	cmpl d1,d3
	jge L68
	moveq #31,d0
L63:
	moveml a6@(-8),#0xc
	unlk a6
	rts
	.even
.globl _set_float_handler
_set_float_handler:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),d1
	sne d0
	moveq #1,d2
	andl d2,d0
	movel d0,_float_handled
	tstl d1
	jeq L70
	pea 232:w
	movel d1,sp@-
	pea _float_handler
	jbsr _memcpy
L70:
	movel a6@(-4),d2
	unlk a6
	rts
LC32:
	.ascii "floating overflow in constant folding\0"
	.even
_float_signal:
	link a6,#0
	tstl _float_handled
	jne L72
	jbsr _abort
L72:
	pea LC32
	jbsr _warning
	clrl _float_handled
	pea 1:w
	pea _float_handler
	jbsr _longjmp
	unlk a6
	rts
LC33:
	.ascii "output pipe has been closed\0"
	.even
_pipe_closed:
	link a6,#0
	pea LC33
	jbsr _fatal
	unlk a6
	rts
LC34:
	.ascii "gccdump\0"
LC35:
	.ascii "-\0"
LC36:
	.ascii "stdin\0"
LC37:
	.ascii "r\0"
LC38:
	.ascii ".rtl\0"
LC39:
	.ascii "w\0"
LC40:
	.ascii ".jump\0"
LC41:
	.ascii ".cse\0"
LC42:
	.ascii ".loop\0"
LC43:
	.ascii ".flow\0"
LC44:
	.ascii ".combine\0"
LC45:
	.ascii ".lreg\0"
LC46:
	.ascii ".greg\0"
LC47:
	.ascii ".jump2\0"
LC48:
	.ascii ".c\0"
LC49:
	.ascii ".i\0"
LC50:
	.ascii ".co\0"
LC51:
	.ascii ".s\0"
LC52:
	.ascii "#NO_APP\12\0"
LC53:
	.ascii "gcc_compiled.:\12\0"
LC54:
	.ascii ".sym\0"
LC55:
	.ascii "`%s' declared but never defined\0"
LC56:
	.ascii "`%s' defined but not used\0"
LC57:
	.ascii "parse\0"
LC58:
	.ascii "integration\0"
LC59:
	.ascii "jump\0"
LC60:
	.ascii "cse\0"
LC61:
	.ascii "loop\0"
LC62:
	.ascii "flow\0"
LC63:
	.ascii "combine\0"
LC64:
	.ascii "local-alloc\0"
LC65:
	.ascii "global-alloc\0"
LC66:
	.ascii "final\0"
LC67:
	.ascii "varconst\0"
LC68:
	.ascii "symout\0"
LC69:
	.ascii "dump\0"
	.even
_compile_file:
	link a6,#-60
	moveml #0x3830,sp@-
	movel a6@(8),d4
	sne d3
	moveq #1,d1
	andl d1,d3
	tstl _dump_base_name
	jne L75
	tstl d4
	jeq L76
	movel d4,d0
	jra L77
L76:
	movel #LC34,d0
L77:
	movel d0,_dump_base_name
L75:
	movel _dump_base_name,sp@-
	jbsr _strlen
	movel d0,a3
	clrl _parse_time
	clrl _varconst_time
	clrl _integration_time
	clrl _jump_time
	clrl _cse_time
	clrl _loop_time
	clrl _flow_time
	clrl _combine_time
	clrl _local_alloc_time
	clrl _global_alloc_time
	clrl _final_time
	clrl _symout_time
	clrl _dump_time
	addqw #4,sp
	tstl d4
	jeq L79
	pea LC35
	movel d4,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L78
L79:
	movel #__iob,_finput
	movel #LC36,d4
	jra L80
L78:
	pea LC37
	movel d4,sp@-
	jbsr _fopen
	movel d0,_finput
	addqw #8,sp
L80:
	tstl _finput
	jne L81
	movel d4,sp@-
	jbsr _pfatal_with_name
	addqw #4,sp
L81:
	jbsr _init_tree
	jbsr _init_lex
	jbsr _init_rtl
	jbsr _init_emit_once
	jbsr _init_decl_processing
	jbsr _init_optabs
	tstl _rtl_dump
	jeq L82
	pea a3@(6)
	jbsr _xmalloc
	movel d0,d2
	movel _dump_base_name,sp@-
	movel d2,sp@-
	jbsr _strcpy
	pea LC38
	movel d2,sp@-
	jbsr _strcat
	pea LC39
	movel d2,sp@-
	jbsr _fopen
	movel d0,_rtl_dump_file
	addw #28,sp
	jne L82
	movel d2,sp@-
	jbsr _pfatal_with_name
	addqw #4,sp
L82:
	tstl _jump_opt_dump
	jeq L84
	pea a3@(6)
	jbsr _xmalloc
	movel d0,d2
	movel _dump_base_name,sp@-
	movel d2,sp@-
	jbsr _strcpy
	pea LC40
	movel d2,sp@-
	jbsr _strcat
	pea LC39
	movel d2,sp@-
	jbsr _fopen
	movel d0,_jump_opt_dump_file
	addw #28,sp
	jne L84
	movel d2,sp@-
	jbsr _pfatal_with_name
	addqw #4,sp
L84:
	tstl _cse_dump
	jeq L86
	pea a3@(6)
	jbsr _xmalloc
	movel d0,d2
	movel _dump_base_name,sp@-
	movel d2,sp@-
	jbsr _strcpy
	pea LC41
	movel d2,sp@-
	jbsr _strcat
	pea LC39
	movel d2,sp@-
	jbsr _fopen
	movel d0,_cse_dump_file
	addw #28,sp
	jne L86
	movel d2,sp@-
	jbsr _pfatal_with_name
	addqw #4,sp
L86:
	tstl _loop_dump
	jeq L88
	pea a3@(6)
	jbsr _xmalloc
	movel d0,d2
	movel _dump_base_name,sp@-
	movel d2,sp@-
	jbsr _strcpy
	pea LC42
	movel d2,sp@-
	jbsr _strcat
	pea LC39
	movel d2,sp@-
	jbsr _fopen
	movel d0,_loop_dump_file
	addw #28,sp
	jne L88
	movel d2,sp@-
	jbsr _pfatal_with_name
	addqw #4,sp
L88:
	tstl _flow_dump
	jeq L90
	pea a3@(6)
	jbsr _xmalloc
	movel d0,d2
	movel _dump_base_name,sp@-
	movel d2,sp@-
	jbsr _strcpy
	pea LC43
	movel d2,sp@-
	jbsr _strcat
	pea LC39
	movel d2,sp@-
	jbsr _fopen
	movel d0,_flow_dump_file
	addw #28,sp
	jne L90
	movel d2,sp@-
	jbsr _pfatal_with_name
	addqw #4,sp
L90:
	tstl _combine_dump
	jeq L92
	pea a3@(10)
	jbsr _xmalloc
	movel d0,d2
	movel _dump_base_name,sp@-
	movel d2,sp@-
	jbsr _strcpy
	pea LC44
	movel d2,sp@-
	jbsr _strcat
	pea LC39
	movel d2,sp@-
	jbsr _fopen
	movel d0,_combine_dump_file
	addw #28,sp
	jne L92
	movel d2,sp@-
	jbsr _pfatal_with_name
	addqw #4,sp
L92:
	tstl _local_reg_dump
	jeq L94
	pea a3@(6)
	jbsr _xmalloc
	movel d0,d2
	movel _dump_base_name,sp@-
	movel d2,sp@-
	jbsr _strcpy
	pea LC45
	movel d2,sp@-
	jbsr _strcat
	pea LC39
	movel d2,sp@-
	jbsr _fopen
	movel d0,_local_reg_dump_file
	addw #28,sp
	jne L94
	movel d2,sp@-
	jbsr _pfatal_with_name
	addqw #4,sp
L94:
	tstl _global_reg_dump
	jeq L96
	pea a3@(6)
	jbsr _xmalloc
	movel d0,d2
	movel _dump_base_name,sp@-
	movel d2,sp@-
	jbsr _strcpy
	pea LC46
	movel d2,sp@-
	jbsr _strcat
	pea LC39
	movel d2,sp@-
	jbsr _fopen
	movel d0,_global_reg_dump_file
	addw #28,sp
	jne L96
	movel d2,sp@-
	jbsr _pfatal_with_name
	addqw #4,sp
L96:
	tstl _jump2_opt_dump
	jeq L98
	pea a3@(7)
	jbsr _xmalloc
	movel d0,d2
	movel _dump_base_name,sp@-
	movel d2,sp@-
	jbsr _strcpy
	pea LC47
	movel d2,sp@-
	jbsr _strcat
	pea LC39
	movel d2,sp@-
	jbsr _fopen
	movel d0,_jump2_opt_dump_file
	addw #28,sp
	jne L98
	movel d2,sp@-
	jbsr _pfatal_with_name
	addqw #4,sp
L98:
	tstl d3
	jne L100
	tstl _asm_file_name
	jne L100
	movel #__iob+20,_asm_out_file
	jra L101
L100:
	pea a3@(6)
	jbsr _xmalloc
	movel d0,a2
	movel _dump_base_name,sp@-
	jbsr _strlen
	movel d0,d2
	movel _dump_base_name,sp@-
	movel a2,sp@-
	jbsr _strcpy
	addw #16,sp
	moveq #2,d1
	cmpl d2,d1
	jge L102
	pea a2@(-2,d2:l)
	pea LC48
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jeq L149
L102:
	moveq #2,d1
	cmpl d2,d1
	jge L104
	pea a2@(-2,d2:l)
	pea LC49
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L104
L149:
	clrb a2@(-2,d2:l)
	jra L103
L104:
	moveq #3,d1
	cmpl d2,d1
	jge L103
	pea a2@(-3,d2:l)
	pea LC50
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L103
	clrb a2@(-3,d2:l)
L103:
	pea LC51
	movel a2,sp@-
	jbsr _strcat
	addqw #8,sp
	tstl _asm_file_name
	jne L107
	movel a2,sp@-
	jbsr _strlen
	movel d0,a0
	pea a0@(1)
	jbsr _malloc
	movel d0,_asm_file_name
	movel a2,sp@-
	movel d0,sp@-
	jbsr _strcpy
	addw #16,sp
L107:
	pea LC35
	movel _asm_file_name,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L108
	movel #__iob+20,_asm_out_file
	jra L109
L108:
	pea LC39
	movel _asm_file_name,sp@-
	jbsr _fopen
	movel d0,_asm_out_file
	addqw #8,sp
L109:
	tstl _asm_out_file
	jne L101
	movel _asm_file_name,sp@-
	jbsr _pfatal_with_name
	addqw #4,sp
L101:
	movel d4,_input_filename
	movel _finput,sp@-
	jbsr _check_newline
	movel d0,sp@-
	jbsr _ungetc
	addqw #8,sp
	tstl _main_input_filename
	jne L111
	movel d4,_main_input_filename
L111:
	pea LC52
	movel _asm_out_file,sp@-
	lea _fprintf,a2
	jbsr a2@
	pea LC53
	movel _asm_out_file,sp@-
	jbsr a2@
	addw #16,sp
	moveq #1,d1
	cmpl _write_symbols,d1
	jne L112
	pea a3@(6)
	jbsr _xmalloc
	movel d0,a2
	movel _dump_base_name,sp@-
	jbsr _strlen
	movel d0,d2
	movel _dump_base_name,sp@-
	movel a2,sp@-
	jbsr _strcpy
	addw #16,sp
	moveq #2,d1
	cmpl d2,d1
	jge L113
	pea a2@(-2,d2:l)
	pea LC48
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jeq L150
L113:
	moveq #2,d1
	cmpl d2,d1
	jge L115
	pea a2@(-2,d2:l)
	pea LC49
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L115
L150:
	clrb a2@(-2,d2:l)
	jra L114
L115:
	moveq #3,d1
	cmpl d2,d1
	jge L114
	pea a2@(-3,d2:l)
	pea LC50
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L114
	clrb a2@(-3,d2:l)
L114:
	pea LC54
	movel a2,sp@-
	jbsr _strcat
	addqw #8,sp
	tstl _sym_file_name
	jne L118
	movel a2,_sym_file_name
L118:
	movel _main_input_filename,sp@-
	movel _asm_out_file,sp@-
	movel _sym_file_name,sp@-
	jbsr _symout_init
	addw #12,sp
L112:
	moveq #2,d1
	cmpl _write_symbols,d1
	jne L119
	movel _main_input_filename,sp@-
	movel _asm_out_file,sp@-
	jbsr _dbxout_init
	addqw #8,sp
L119:
	movel _main_input_filename,sp@-
	jbsr _init_final
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	jbsr _yyparse
	jbsr a2@
	subl d2,d0
	addl d0,_parse_time
	movel _varconst_time,d1
	subl d1,_parse_time
	jbsr _getdecls
	movel d0,d3
	movel d3,a2
	addqw #4,sp
	tstl a2
	jeq L148
L128:
	cmpb #43,a2@(12)
	jne L123
	btst #5,a2@(13)
	jeq L123
	btst #2,a2@(14)
	jne L123
	pea 1:w
	pea 1:w
	clrl sp@-
	movel a2,sp@-
	jbsr _rest_of_decl_compilation
	addw #16,sp
L123:
	cmpb #39,a2@(12)
	jne L124
	btst #2,a2@(14)
	jne L124
	tstl a2@(60)
	jeq L124
	btst #6,a2@(14)
	jeq L124
	movel a2,sp@-
	jbsr _output_inline_function
	addqw #4,sp
L124:
	tstl _warn_unused
	jeq L125
	cmpb #39,a2@(12)
	jne L125
	tstl a2@(60)
	jne L125
	tstb a2@(13)
	jge L125
	btst #6,a2@(13)
	jne L125
	pea LC55
	movel a2,sp@-
	jbsr _warning_with_decl
	addqw #8,sp
L125:
	tstl _warn_unused
	jeq L122
	cmpb #39,a2@(12)
	jeq L127
	cmpb #43,a2@(12)
	jne L122
L127:
	tstb a2@(13)
	jlt L122
	btst #6,a2@(13)
	jne L122
	btst #0,a2@(14)
	jne L122
	btst #1,a2@(14)
	jne L122
	pea LC56
	movel a2,sp@-
	jbsr _warning_with_decl
	addqw #8,sp
L122:
	movel a2@(4),a2
	tstl a2
	jne L128
L148:
	moveq #2,d1
	cmpl _write_symbols,d1
	jne L129
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	jbsr _gettags
	movel d0,sp@-
	jbsr _dbxout_tags
	jbsr _get_permanent_types
	movel d0,sp@-
	jbsr _dbxout_types
	jbsr a2@
	subl d2,d0
	addl d0,_symout_time
	addqw #8,sp
L129:
	moveq #1,d1
	cmpl _write_symbols,d1
	jne L133
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	pea a6@(-60)
	movel _finput,a0
	moveb a0@(18),d1
	extbl d1
	movel d1,sp@-
	jbsr _fstat
	jbsr _get_permanent_types
	movel d0,sp@-
	jbsr _symout_types
	jbsr _gettags
	movel d0,sp@-
	movel d3,sp@-
	jbsr _symout_top_blocks
	movel a6@(-24),sp@-
	movel d4,sp@-
	jbsr _symout_finish
	jbsr a2@
	subl d2,d0
	addl d0,_symout_time
	addw #28,sp
L133:
	movel _main_input_filename,sp@-
	jbsr _end_final
	addqw #4,sp
	tstl _rtl_dump
	jeq L137
	movel _rtl_dump_file,sp@-
	jbsr _fclose
	addqw #4,sp
L137:
	tstl _jump_opt_dump
	jeq L138
	movel _jump_opt_dump_file,sp@-
	jbsr _fclose
	addqw #4,sp
L138:
	tstl _cse_dump
	jeq L139
	movel _cse_dump_file,sp@-
	jbsr _fclose
	addqw #4,sp
L139:
	tstl _loop_dump
	jeq L140
	movel _loop_dump_file,sp@-
	jbsr _fclose
	addqw #4,sp
L140:
	tstl _flow_dump
	jeq L141
	movel _flow_dump_file,sp@-
	jbsr _fclose
	addqw #4,sp
L141:
	tstl _combine_dump
	jeq L142
	movel _combine_dump_file,sp@-
	jbsr _dump_combine_total_stats
	movel _combine_dump_file,sp@-
	jbsr _fclose
	addqw #8,sp
L142:
	tstl _local_reg_dump
	jeq L143
	movel _local_reg_dump_file,sp@-
	jbsr _fclose
	addqw #4,sp
L143:
	tstl _global_reg_dump
	jeq L144
	movel _global_reg_dump_file,sp@-
	jbsr _fclose
	addqw #4,sp
L144:
	tstl _jump2_opt_dump
	jeq L145
	movel _jump2_opt_dump_file,sp@-
	jbsr _fclose
	addqw #4,sp
L145:
	movel _finput,sp@-
	jbsr _fclose
	movel _asm_out_file,a0
	addqw #4,sp
	btst #5,a0@(17)
	sne d0
	btst #0,d0
	jeq L146
	movel _asm_file_name,sp@-
	jbsr _fatal_io_error
	addqw #4,sp
L146:
	movel _asm_out_file,sp@-
	jbsr _fclose
	addqw #4,sp
	tstl _quiet_flag
	jne L147
	pea LC21
	pea __iob+40
	jbsr _fprintf
	movel _parse_time,sp@-
	pea LC57
	lea _print_time,a2
	jbsr a2@
	movel _integration_time,sp@-
	pea LC58
	jbsr a2@
	movel _jump_time,sp@-
	pea LC59
	jbsr a2@
	addw #32,sp
	movel _cse_time,sp@-
	pea LC60
	jbsr a2@
	movel _loop_time,sp@-
	pea LC61
	jbsr a2@
	movel _flow_time,sp@-
	pea LC62
	jbsr a2@
	movel _combine_time,sp@-
	pea LC63
	jbsr a2@
	addw #32,sp
	movel _local_alloc_time,sp@-
	pea LC64
	jbsr a2@
	movel _global_alloc_time,sp@-
	pea LC65
	jbsr a2@
	movel _final_time,sp@-
	pea LC66
	jbsr a2@
	movel _varconst_time,sp@-
	pea LC67
	jbsr a2@
	addw #32,sp
	movel _symout_time,sp@-
	pea LC68
	jbsr a2@
	movel _dump_time,sp@-
	pea LC69
	jbsr a2@
L147:
	moveml a6@(-80),#0xc1c
	unlk a6
	rts
	.even
.globl _rest_of_decl_compilation
_rest_of_decl_compilation:
	link a6,#0
	moveml #0x3830,sp@-
	movel a6@(8),a3
	movel a6@(16),d3
	movel a6@(20),d2
	btst #5,a3@(13)
	jne L153
	tstb a3@(13)
	jge L152
L153:
	jbsr _gettime
	movel d0,d4
	movel d3,sp@-
	movel a6@(12),sp@-
	movel a3,sp@-
	jbsr _make_decl_rtl
	addw #12,sp
	tstl d2
	jne L158
	tstl d3
	jeq L158
	tstl a3@(60)
	jeq L157
	movel a3@(60),d1
	cmpl _error_mark_node,d1
	jeq L157
L158:
	movel d2,sp@-
	movel _write_symbols,sp@-
	movel d3,sp@-
	movel a3,sp@-
	jbsr _assemble_variable
	addw #16,sp
L157:
	jbsr _gettime
	subl d4,d0
	addl d0,_varconst_time
	jra L159
L152:
	moveq #2,d1
	cmpl _write_symbols,d1
	jne L159
	cmpb #42,a3@(12)
	jne L159
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	clrl sp@-
	movel a3,sp@-
	jbsr _dbxout_symbol
	jbsr a2@
	subl d2,d0
	addl d0,_varconst_time
	addqw #8,sp
L159:
	tstl d3
	jeq L164
	moveq #1,d1
	cmpl _write_symbols,d1
	jne L165
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	jbsr _get_temporary_types
	movel d0,sp@-
	jbsr _symout_types
	jbsr a2@
	subl d2,d0
	addl d0,_symout_time
	jra L164
L165:
	jbsr _get_temporary_types
L164:
	moveml a6@(-20),#0xc1c
	unlk a6
	rts
LC70:
	.ascii "\12;; Function %s\12\12\0"
LC71:
	.ascii ";; (integrable)\12\12\0"
	.even
.globl _rest_of_compilation
_rest_of_compilation:
	link a6,#0
	moveml #0x3c38,sp@-
	movel a6@(8),a4
	jbsr _gettime
	movel d0,d5
	tstl a4@(72)
	jne L171
	tstl _flag_inline_functions
	jne L173
	btst #1,a4@(14)
	jeq L172
L173:
	jbsr _gettime
	movel d0,d4
	bfextu a4@(14){#6:#1},d3
	movel a4,sp@-
	jbsr _function_cannot_inline_p
	movel d0,d2
	addqw #4,sp
	jeq L177
	tstl d3
	jeq L177
	movel d2,sp@-
	movel a4,sp@-
	jbsr _warning_with_decl
	addqw #8,sp
L177:
	tstl d2
	jne L178
	movel a4,sp@-
	jbsr _save_for_inline
	addqw #4,sp
	jra L179
L178:
	andb #253,a4@(14)
L179:
	jbsr _gettime
	subl d4,d0
	addl d0,_integration_time
L172:
	jbsr _get_insns
	movel d0,d4
	tstl _rtl_dump
	jeq L180
	jbsr _gettime
	movel d0,d2
	movel a4@(36),a0
	movel a0@(20),sp@-
	pea LC70
	movel _rtl_dump_file,sp@-
	lea _fprintf,a2
	jbsr a2@
	addw #12,sp
	tstl a4@(72)
	jeq L184
	pea LC71
	movel _rtl_dump_file,sp@-
	jbsr a2@
	addqw #8,sp
L184:
	movel d4,sp@-
	movel _rtl_dump_file,sp@-
	jbsr _print_rtl
	movel _rtl_dump_file,sp@-
	jbsr _fflush
	jbsr _gettime
	subl d2,d0
	addl d0,_dump_time
	addw #12,sp
L180:
	btst #6,a4@(13)
	jne L171
	btst #1,a4@(14)
	jeq L171
	tstl _flag_keep_inline_functions
	jeq L186
L171:
	tstl _rtl_dump_and_exit
	jne L186
	orb #4,a4@(14)
	jbsr _get_insns
	movel d0,d4
	movel d4,sp@-
	jbsr _unshare_all_rtl
	addqw #4,sp
	tstl _optimize
	jne L189
	tstl _extra_warnings
	jne L189
	tstl _warn_return_type
	jne L189
	btst #4,a4@(14)
	jeq L188
L189:
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	clrl sp@-
	clrl sp@-
	movel d4,sp@-
	jbsr _jump_optimize
	jbsr a2@
	subl d2,d0
	addl d0,_jump_time
	addw #12,sp
L188:
	tstl _jump_opt_dump
	jeq L193
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	movel a4@(36),a0
	movel a0@(20),sp@-
	pea LC70
	movel _jump_opt_dump_file,sp@-
	jbsr _fprintf
	movel d4,sp@-
	movel _jump_opt_dump_file,sp@-
	jbsr _print_rtl
	movel _jump_opt_dump_file,sp@-
	jbsr _fflush
	jbsr a2@
	subl d2,d0
	addl d0,_dump_time
	addw #24,sp
L193:
	tstl _optimize
	jeq L197
	lea _gettime,a3
	jbsr a3@
	movel d0,d2
	clrl sp@-
	lea _max_reg_num,a2
	jbsr a2@
	movel d0,sp@-
	movel d4,sp@-
	jbsr _reg_scan
	jbsr a3@
	subl d2,d0
	addl d0,_cse_time
	addw #12,sp
	jbsr a3@
	movel d0,d2
	jbsr a2@
	movel d0,sp@-
	movel d4,sp@-
	jbsr _cse_main
	movel d0,d3
	jbsr a3@
	subl d2,d0
	addl d0,_cse_time
	addqw #8,sp
	tstl d3
	jeq L197
	jbsr a3@
	movel d0,d2
	clrl sp@-
	clrl sp@-
	movel d4,sp@-
	jbsr _jump_optimize
	jbsr a3@
	subl d2,d0
	addl d0,_jump_time
	addw #12,sp
L197:
	tstl _cse_dump
	jeq L208
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	movel a4@(36),a0
	movel a0@(20),sp@-
	pea LC70
	movel _cse_dump_file,sp@-
	jbsr _fprintf
	movel d4,sp@-
	movel _cse_dump_file,sp@-
	jbsr _print_rtl
	movel _cse_dump_file,sp@-
	jbsr _fflush
	jbsr a2@
	subl d2,d0
	addl d0,_dump_time
	addw #24,sp
L208:
	tstl _loop_dump
	jeq L212
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	movel a4@(36),a0
	movel a0@(20),sp@-
	pea LC70
	movel _loop_dump_file,sp@-
	jbsr _fprintf
	jbsr a2@
	subl d2,d0
	addl d0,_dump_time
	addw #12,sp
L212:
	tstl _optimize
	jeq L216
	jbsr _gettime
	movel d0,d2
	pea 1:w
	jbsr _max_reg_num
	movel d0,sp@-
	movel d4,sp@-
	jbsr _reg_scan
	addw #12,sp
	tstl _loop_dump
	jeq L220
	movel _loop_dump_file,d0
	jra L221
L220:
	clrl d0
L221:
	movel d0,sp@-
	movel d4,sp@-
	jbsr _loop_optimize
	jbsr _gettime
	subl d2,d0
	addl d0,_loop_time
	addqw #8,sp
L216:
	tstl _loop_dump
	jeq L222
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	movel d4,sp@-
	movel _loop_dump_file,sp@-
	jbsr _print_rtl
	movel _loop_dump_file,sp@-
	jbsr _fflush
	jbsr a2@
	subl d2,d0
	addl d0,_dump_time
	addw #12,sp
L222:
	tstl _optimize
	jeq L226
	clrl _obey_regdecls
L226:
	jbsr _regclass_init
	tstl _flow_dump
	jeq L227
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	movel a4@(36),a0
	movel a0@(20),sp@-
	pea LC70
	movel _flow_dump_file,sp@-
	jbsr _fprintf
	jbsr a2@
	subl d2,d0
	addl d0,_dump_time
	addw #12,sp
L227:
	tstl _obey_regdecls
	jeq L231
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	lea _max_reg_num,a3
	jbsr a3@
	movel d0,sp@-
	movel d4,sp@-
	jbsr _regclass
	movel _flow_dump_file,sp@-
	jbsr a3@
	movel d0,sp@-
	movel d4,sp@-
	jbsr _stupid_life_analysis
	jbsr a2@
	subl d2,d0
	addl d0,_flow_time
	addw #20,sp
	jra L235
L231:
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	movel _flow_dump_file,sp@-
	jbsr _max_reg_num
	movel d0,sp@-
	movel d4,sp@-
	jbsr _flow_analysis
	jbsr a2@
	subl d2,d0
	addl d0,_flow_time
	addw #12,sp
	tstl _extra_warnings
	jeq L235
	movel a4@(60),sp@-
	jbsr _uninitialized_vars_warning
	addqw #4,sp
L235:
	tstl _flow_dump
	jeq L240
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	movel d4,sp@-
	movel _flow_dump_file,sp@-
	jbsr _print_rtl
	movel _flow_dump_file,sp@-
	jbsr _fflush
	jbsr a2@
	subl d2,d0
	addl d0,_dump_time
	addw #12,sp
L240:
	tstl _optimize
	jeq L244
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	jbsr _max_reg_num
	movel d0,sp@-
	movel d4,sp@-
	jbsr _combine_instructions
	jbsr a2@
	subl d2,d0
	addl d0,_combine_time
	addqw #8,sp
L244:
	tstl _combine_dump
	jeq L248
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	movel a4@(36),a0
	movel a0@(20),sp@-
	pea LC70
	movel _combine_dump_file,sp@-
	jbsr _fprintf
	movel _combine_dump_file,sp@-
	jbsr _dump_combine_stats
	movel d4,sp@-
	movel _combine_dump_file,sp@-
	jbsr _print_rtl
	movel _combine_dump_file,sp@-
	jbsr _fflush
	jbsr a2@
	subl d2,d0
	addl d0,_dump_time
	addw #28,sp
L248:
	tstl _obey_regdecls
	jne L252
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	jbsr _max_reg_num
	movel d0,sp@-
	movel d4,sp@-
	jbsr _regclass
	jbsr _local_alloc
	jbsr a2@
	subl d2,d0
	addl d0,_local_alloc_time
	addqw #8,sp
L252:
	tstl _local_reg_dump
	jeq L256
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	movel a4@(36),a0
	movel a0@(20),sp@-
	pea LC70
	movel _local_reg_dump_file,sp@-
	jbsr _fprintf
	movel _local_reg_dump_file,sp@-
	jbsr _dump_flow_info
	movel _local_reg_dump_file,sp@-
	jbsr _dump_local_alloc
	movel d4,sp@-
	movel _local_reg_dump_file,sp@-
	jbsr _print_rtl
	movel _local_reg_dump_file,sp@-
	jbsr _fflush
	addw #32,sp
	jbsr a2@
	subl d2,d0
	addl d0,_dump_time
L256:
	tstl _global_reg_dump
	jeq L260
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	movel a4@(36),a0
	movel a0@(20),sp@-
	pea LC70
	movel _global_reg_dump_file,sp@-
	jbsr _fprintf
	jbsr a2@
	subl d2,d0
	addl d0,_dump_time
	addw #12,sp
L260:
	jbsr _gettime
	movel d0,d2
	tstl _obey_regdecls
	jne L267
	tstl _global_reg_dump
	jeq L268
	movel _global_reg_dump_file,d0
	jra L269
L268:
	clrl d0
L269:
	movel d0,sp@-
	jbsr _global_alloc
	addqw #4,sp
	jra L270
L267:
	tstl _global_reg_dump
	jeq L271
	movel _global_reg_dump_file,d0
	jra L272
L271:
	clrl d0
L272:
	movel d0,sp@-
	clrl sp@-
	movel d4,sp@-
	jbsr _reload
	addw #12,sp
L270:
	lea _gettime,a2
	jbsr a2@
	subl d2,d0
	addl d0,_global_alloc_time
	tstl _global_reg_dump
	jeq L273
	jbsr a2@
	movel d0,d2
	movel _global_reg_dump_file,sp@-
	jbsr _dump_global_regs
	movel d4,sp@-
	movel _global_reg_dump_file,sp@-
	jbsr _print_rtl
	movel _global_reg_dump_file,sp@-
	jbsr _fflush
	jbsr a2@
	subl d2,d0
	addl d0,_dump_time
	addw #16,sp
L273:
	moveq #1,d1
	movel d1,_rtx_equal_function_value_matters
	moveq #1,d1
	movel d1,_reload_completed
	tstl _optimize
	jeq L277
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	pea 1:w
	pea 1:w
	movel d4,sp@-
	jbsr _jump_optimize
	jbsr a2@
	subl d2,d0
	addl d0,_jump_time
	addw #12,sp
L277:
	tstl _jump2_opt_dump
	jeq L281
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	movel a4@(36),a0
	movel a0@(20),sp@-
	pea LC70
	movel _jump2_opt_dump_file,sp@-
	jbsr _fprintf
	movel d4,sp@-
	movel _jump2_opt_dump_file,sp@-
	jbsr _print_rtl
	movel _jump2_opt_dump_file,sp@-
	jbsr _fflush
	jbsr a2@
	subl d2,d0
	addl d0,_dump_time
	addw #24,sp
L281:
	lea _gettime,a3
	jbsr a3@
	movel d0,d2
	movel a4,sp@-
	jbsr _assemble_function
	movel _optimize,sp@-
	movel _write_symbols,sp@-
	movel _asm_out_file,sp@-
	movel d4,sp@-
	jbsr _final_start_function
	clrl sp@-
	movel _optimize,sp@-
	movel _write_symbols,sp@-
	movel _asm_out_file,sp@-
	movel d4,sp@-
	jbsr _final
	addw #40,sp
	movel _optimize,sp@-
	movel _write_symbols,sp@-
	movel _asm_out_file,sp@-
	movel d4,sp@-
	jbsr _final_end_function
	movel _asm_out_file,sp@-
	jbsr _fflush
	jbsr a3@
	subl d2,d0
	addl d0,_final_time
	addw #20,sp
	moveq #1,d1
	cmpl _write_symbols,d1
	jne L288
	jbsr a3@
	movel d0,d2
	jbsr _get_permanent_types
	movel d0,sp@-
	lea _symout_types,a2
	jbsr a2@
	jbsr _get_temporary_types
	movel d0,sp@-
	jbsr a2@
	clrl sp@-
	movel a4@(52),sp@-
	movel a4@(60),sp@-
	jbsr _symout_function
	movel d0,a4@(76)
	jbsr _symout_function_end
	jbsr a3@
	subl d2,d0
	addl d0,_symout_time
	addw #20,sp
	jra L292
L288:
	jbsr _get_temporary_types
L292:
	moveq #2,d1
	cmpl _write_symbols,d1
	jne L186
	lea _gettime,a2
	jbsr a2@
	movel d0,d2
	movel a4,sp@-
	jbsr _dbxout_function
	jbsr a2@
	subl d2,d0
	addl d0,_symout_time
	addqw #4,sp
L186:
	clrl _rtx_equal_function_value_matters
	clrl _reload_completed
	jbsr _clear_const_double_mem
	jbsr _gettime
	subl d5,d0
	subl d0,_parse_time
	moveml a6@(-28),#0x1c3c
	unlk a6
	rts
LC72:
	.ascii "\0"
LC73:
	.ascii "dumpbase\0"
LC74:
	.ascii "fixed-\0"
LC75:
	.ascii "call-used-\0"
LC76:
	.ascii "call-saved-\0"
LC77:
	.ascii "Invalid option `%s'\0"
LC78:
	.ascii "noreg\0"
LC79:
	.ascii "opt\0"
LC80:
	.ascii "O\0"
LC81:
	.ascii "pedantic\0"
LC82:
	.ascii "quiet\0"
LC83:
	.ascii "version\0"
LC84:
	.ascii "%s version %s\0"
LC85:
	.ascii " (68k, MIT syntax)\0"
LC86:
	.ascii "1.35\0"
LC87:
	.ascii " compiled by GNU C version %s.\12\0"
LC88:
	.ascii "W\0"
LC89:
	.ascii "Wunused\0"
LC90:
	.ascii "Wshadow\0"
LC91:
	.ascii "Wswitch\0"
LC92:
	.ascii "Wid-clash-\0"
LC93:
	.ascii "p\0"
LC94:
	.ascii "a\0"
LC95:
	.ascii "gg\0"
LC96:
	.ascii "g\0"
LC97:
	.ascii "G\0"
LC98:
	.ascii "o\0"
	.even
.globl _main
_main:
	link a6,#0
	moveml #0x3e3c,sp@-
	movel a6@(8),d6
	movel a6@(12),a4
	clrl d5
	pea _float_signal
	pea 8:w
	lea _signal,a2
	jbsr a2@
	pea _pipe_closed
	pea 13:w
	jbsr a2@
	moveq #1,d1
	movel d1,_flag_signed_char
	moveq #1,d1
	movel d1,_obey_regdecls
	jbsr _init_reg_sets
	clrl _target_flags
	pea LC72
	jbsr _set_target_switch
	moveq #1,d4
	addw #20,sp
	cmpl d4,d6
	jle L396
	lea _f_options,a5
L390:
	movel a4@(d4:l:4),a0
	cmpb #45,a0@
	jne L301
	tstb a0@(1)
	jeq L301
	movel a0,a3
	addqw #1,a3
	cmpb #89,a3@
	jne L302
	addqw #1,a3
L302:
	cmpb #109,a3@
	jne L303
	pea a3@(1)
	jbsr _set_target_switch
	addqw #4,sp
	jra L300
L303:
	pea LC73
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L305
	addql #1,d4
	movel a4@(d4:l:4),_dump_base_name
	jra L300
L305:
	cmpb #100,a3@
	jne L307
	lea a3@(1),a0
	tstb a0@
	jeq L300
L324:
	moveb a0@+,d0
	extbl d0
	moveq #-74,d1
	addl d1,d0
	moveq #47,d1
	cmpl d1,d0
	jhi L308
LI322:
	movew pc@(L322-LI322-2:b,d0:l:2),d1
	jmp pc@(2,d1:w)
L322:
	.word L315-L322
	.word L308-L322
	.word L317-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L311-L322
	.word L308-L322
	.word L308-L322
	.word L312-L322
	.word L313-L322
	.word L308-L322
	.word L308-L322
	.word L314-L322
	.word L308-L322
	.word L316-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L319-L322
	.word L320-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L308-L322
	.word L321-L322
L311:
	moveq #1,d1
	movel d1,_combine_dump
	jra L308
L312:
	moveq #1,d1
	movel d1,_flow_dump
	jra L308
L313:
	moveq #1,d1
	movel d1,_global_reg_dump
	jra L308
L314:
	moveq #1,d1
	movel d1,_jump_opt_dump
	jra L308
L315:
	moveq #1,d1
	movel d1,_jump2_opt_dump
	jra L308
L316:
	moveq #1,d1
	movel d1,_local_reg_dump
	jra L308
L317:
	moveq #1,d1
	movel d1,_loop_dump
	jra L308
L319:
	moveq #1,d1
	movel d1,_rtl_dump
	jra L308
L320:
	moveq #1,d1
	movel d1,_cse_dump
	jra L308
L321:
	moveq #1,d1
	movel d1,_yydebug
L308:
	tstb a0@
	jne L324
	jra L300
L307:
	cmpb #102,a3@
	jne L326
	addqw #1,a3
	clrl d3
	subl a2,a2
L332:
	moveq #16,d1
	cmpl a2,d1
	jcs L328
	lea a2@(a2:l:2),a1
	movel a1,d0
	movel d0,d2
	asll #2,d2
	movel a5@(d2:l),sp@-
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L330
	movel a5@(4,d2:l),a0
	movel a5@(8,d2:l),a0@
	moveq #1,d3
L330:
	cmpb #110,a3@
	jne L329
	cmpb #111,a3@(1)
	jne L329
	cmpb #45,a3@(2)
	jne L329
	lea a2@(a2:l:2),a1
	movel a1,d0
	movel d0,d2
	asll #2,d2
	movel a5@(d2:l),sp@-
	pea a3@(3)
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L329
	movel a5@(4,d2:l),a0
	tstl a5@(8,d2:l)
	seq d0
	moveq #1,d1
	andl d1,d0
	movel d0,a0@
	moveq #1,d3
L329:
	addqw #1,a2
	tstl d3
	jeq L332
L328:
	tstl d3
	jne L300
	pea 6:w
	pea LC74
	movel a3,sp@-
	jbsr _strncmp
	addw #12,sp
	tstl d0
	jne L335
	pea 1:w
	pea 1:w
	pea a3@(6)
	jra L397
L335:
	pea 10:w
	pea LC75
	movel a3,sp@-
	jbsr _strncmp
	addw #12,sp
	tstl d0
	jne L337
	pea 1:w
	clrl sp@-
	pea a3@(10)
	jra L397
L337:
	pea 11:w
	pea LC76
	movel a3,sp@-
	jbsr _strncmp
	addw #12,sp
	tstl d0
	jne L339
	clrl sp@-
	clrl sp@-
	pea a3@(11)
L397:
	jbsr _fix_register
	addw #12,sp
	jra L300
L339:
	movel a4@(d4:l:4),sp@-
	jbsr _lang_decode_option
	addqw #4,sp
	tstl d0
	jne L300
	jra L387
L326:
	pea LC78
	movel a3,sp@-
	lea _strcmp,a2
	jbsr a2@
	addqw #8,sp
	tstl d0
	jeq L300
	pea LC79
	movel a3,sp@-
	jbsr a2@
	addqw #8,sp
	tstl d0
	jeq L398
	pea LC80
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L347
L398:
	moveq #1,d1
	movel d1,_optimize
	clrl _obey_regdecls
	jra L300
L347:
	pea LC81
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L349
	moveq #1,d1
	movel d1,_pedantic
	jra L300
L349:
	movel a4@(d4:l:4),sp@-
	jbsr _lang_decode_option
	addqw #4,sp
	tstl d0
	jne L300
	pea LC82
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L353
	moveq #1,d1
	movel d1,_quiet_flag
	jra L300
L353:
	pea LC83
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L355
	movel _version_string,sp@-
	movel _language_string,sp@-
	pea LC84
	movel #__iob+40,d2
	movel d2,sp@-
	lea _fprintf,a2
	jbsr a2@
	pea LC85
	movel d2,sp@-
	jbsr a2@
	pea LC86
	pea LC87
	movel d2,sp@-
	jbsr a2@
	addw #36,sp
	jra L300
L355:
	pea LC39
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L357
	moveq #1,d1
	movel d1,_inhibit_warnings
	jra L300
L357:
	pea LC88
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L359
	moveq #1,d1
	movel d1,_extra_warnings
	jra L300
L359:
	pea LC89
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L361
	moveq #1,d1
	movel d1,_warn_unused
	jra L300
L361:
	pea LC90
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L363
	moveq #1,d1
	movel d1,_warn_shadow
	jra L300
L363:
	pea LC91
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L365
	moveq #1,d1
	movel d1,_warn_switch
	jra L300
L365:
	pea 10:w
	pea LC92
	movel a3,sp@-
	jbsr _strncmp
	addw #12,sp
	tstl d0
	jne L367
	lea a3@(10),a2
L399:
	tstb a2@
	jeq L394
	cmpb #47,a2@
	jle L370
	cmpb #57,a2@
	jgt L370
	addqw #1,a2
	jra L399
L370:
	movel a4@(d4:l:4),sp@-
	pea LC77
	jbsr _error
	addqw #8,sp
	jra L399
L394:
	moveq #1,d1
	movel d1,_warn_id_clash
	pea a3@(10)
	jbsr _atoi
	movel d0,_id_clash_len
	addqw #4,sp
	jra L300
L367:
	pea LC93
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L374
	moveq #1,d1
	movel d1,_profile_flag
	jra L300
L374:
	pea LC94
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L376
	moveq #1,d1
	movel d1,_profile_block_flag
	jra L300
L376:
	pea LC95
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L378
	moveq #1,d1
	movel d1,_write_symbols
	jra L300
L378:
	pea LC96
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jeq L400
	pea LC97
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L382
L400:
	moveq #2,d1
	movel d1,_write_symbols
	jra L300
L382:
	pea LC68
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L384
	tstl _write_symbols
	jne L385
	moveq #1,d1
	movel d1,_write_symbols
L385:
	addql #1,d4
	movel a4@(d4:l:4),_sym_file_name
	jra L300
L384:
	pea LC98
	movel a3,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L387
	addql #1,d4
	movel a4@(d4:l:4),_asm_file_name
	jra L300
L387:
	movel a4@(d4:l:4),sp@-
	pea LC77
	jbsr _error
	addqw #8,sp
	jra L300
L301:
	movel a4@(d4:l:4),d5
L300:
	addql #1,d4
	cmpl d4,d6
	jgt L390
L396:
	btst #6,_target_flags+3
	jeq L391
	moveq #-3,d1
	andl d1,_target_flags
L391:
	jbsr _init_reg_sets_1
	movel d5,sp@-
	jbsr _compile_file
	addqw #4,sp
	tstl _errorcount
	jeq L392
	pea 33:w
	jbsr _exit
	addqw #4,sp
L392:
	tstl _sorrycount
	jeq L393
	pea 33:w
	jbsr _exit
	addqw #4,sp
L393:
	clrl sp@-
	jbsr _exit
	moveq #34,d0
	moveml a6@(-36),#0x3c7c
	unlk a6
	rts
.globl _target_switches
LC99:
	.ascii "68020\0"
LC100:
	.ascii "c68020\0"
LC101:
	.ascii "68881\0"
LC102:
	.ascii "bitfield\0"
LC103:
	.ascii "68000\0"
LC104:
	.ascii "c68000\0"
LC105:
	.ascii "soft-float\0"
LC106:
	.ascii "nobitfield\0"
LC107:
	.ascii "rtd\0"
LC108:
	.ascii "nortd\0"
LC109:
	.ascii "short\0"
LC110:
	.ascii "noshort\0"
LC111:
	.ascii "fpa\0"
LC112:
	.ascii "nofpa\0"
.data
	.even
_target_switches:
	.long LC99
	.long 5
	.long LC100
	.long 5
	.long LC101
	.long 2
	.long LC102
	.long 4
	.long LC103
	.long -5
	.long LC104
	.long -5
	.long LC105
	.long -66
	.long LC106
	.long -4
	.long LC107
	.long 8
	.long LC108
	.long -8
	.long LC109
	.long 32
	.long LC110
	.long -32
	.long LC111
	.long 64
	.long LC112
	.long -64
	.long LC72
	.long 7
.text
	.even
.globl _set_target_switch
_set_target_switch:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(8),d3
	clrl d2
	lea _target_switches,a2
L408:
	movel d3,sp@-
	movel a2@(d2:l:8),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L404
	tstl a2@(4,d2:l:8)
	jge L406
	movel a2@(4,d2:l:8),d0
	negl d0
	notl d0
	andl d0,_target_flags
	jra L401
L406:
	movel a2@(4,d2:l:8),d1
	orl d1,_target_flags
	jra L401
L404:
	addql #1,d2
	moveq #14,d1
	cmpl d2,d1
	jcc L408
	movel d3,sp@-
	pea LC77
	jbsr _error
L401:
	moveml a6@(-12),#0x40c
	unlk a6
	rts
.comm _float_handler,232
.comm _float_handled,4
.lcomm _need_error_newline,4
.comm _dump_time,4
.comm _symout_time,4
.comm _final_time,4
.comm _global_alloc_time,4
.comm _local_alloc_time,4
.comm _combine_time,4
.comm _flow_time,4
.comm _loop_time,4
.comm _cse_time,4
.comm _jump_time,4
.comm _integration_time,4
.comm _varconst_time,4
.comm _parse_time,4
.comm _jump2_opt_dump_file,4
.comm _global_reg_dump_file,4
.comm _local_reg_dump_file,4
.comm _combine_dump_file,4
.comm _flow_dump_file,4
.comm _loop_dump_file,4
.comm _cse_dump_file,4
.comm _jump_opt_dump_file,4
.comm _rtl_dump_file,4
.comm _asm_out_file,4
.comm _sym_file_name,4
.comm _asm_file_name,4
.comm _dump_base_name,4
.comm _flag_shared_data,4
.comm _flag_syntax_only,4
.comm _flag_keep_inline_functions,4
.comm _flag_inline_functions,4
.comm _flag_volatile,4
.comm _profile_block_flag,4
.comm _id_clash_len,4
.comm _warn_id_clash,4
.comm _warn_switch,4
.comm _warn_shadow,4
.comm _warn_unused,4
.comm _use_gdb_dbx_extensions,4
.comm _main_input_filename,4
.comm _input_filename,4
.comm _target_flags,4
