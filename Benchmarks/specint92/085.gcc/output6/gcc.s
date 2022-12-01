#NO_APP
gcc_compiled.:
.globl _compilers
.text
LC0:
	.ascii ".c\0"
LC1:
	.ascii "cpp %{nostdinc} %{C} %{v} %{D*} %{U*} %{I*} %{M*} %{trigraphs} -undef         -D__GNUC__ %{ansi:-trigraphs -$ -D__STRICT_ANSI__} %{!ansi:%p} %P        %c %{O:-D__OPTIMIZE__} %{traditional} %{pedantic}\11%{Wcomment*} %{Wtrigraphs} %{Wall} %C        %i %{!M*:%{!E:%{!pipe:%g.cpp}}}%{E:%{o*}}%{M*:%{o*}} |\12    %{!M*:%{!E:cc1 %{!pipe:%g.cpp} %1 \11\11   %{!Q:-quiet} -dumpbase %i %{Y*} %{d*} %{m*} %{f*} %{a}\11\11   %{g} %{O} %{W*} %{w} %{pedantic} %{ansi} %{traditional}\11\11   %{v:-version} %{gg:-symout %g.sym} %{pg:-p} %{p}\11\11   %{pg:%{fomit-frame-pointer:%e-pg and -fomit-frame-pointer are incompatible}}\11\11   %{S:%{o*}%{!o*:-o %b.s}}%{!S:-o %{|!pipe:%g.s}} |\12              %{!S:as %{R} %{j} %{J} %{h} %{d2} %a %{gg:-G %g.sym}\11\11      %{c:%{o*}%{!o*:-o %w%b.o}}%{!c:-o %d%w%b.o}                      %{!pipe:%g.s}\12 }}}\0"
LC2:
	.ascii ".cc\0"
LC3:
	.ascii "cpp -+ %{nostdinc} %{C} %{v} %{D*} %{U*} %{I*} %{M*}         -undef -D__GNUC__ %p %P        %c %{O:-D__OPTIMIZE__} %{traditional} %{pedantic}\11%{Wcomment*} %{Wtrigraphs} %{Wall} %C        %i %{!M*:%{!E:%{!pipe:%g.cpp}}}%{E:%{o*}}%{M*:%{o*}} |\12    %{!M*:%{!E:cc1plus %{!pipe:%g.cpp} %1\11\11   %{!Q:-quiet} -dumpbase %i %{Y*} %{d*} %{m*} %{f*} %{a}\11\11   %{g} %{O} %{W*} %{w} %{pedantic} %{traditional}\11\11   %{v:-version} %{gg:-symout %g.sym} %{pg:-p} %{p}\11\11   %{pg:%{fomit-frame-pointer:%e-pg and -fomit-frame-pointer are incompatible}}\11\11   %{S:%{o*}%{!o*:-o %b.s}}%{!S:-o %{|!pipe:%g.s}} |\12              %{!S:as %{R} %{j} %{J} %{h} %{d2} %a %{gg:-G %g.sym}\11\11      %{c:%{o*}%{!o*:-o %w%b.o}}%{!c:-o %d%w%b.o}                      %{!pipe:%g.s}\12 }}}\0"
LC4:
	.ascii ".i\0"
LC5:
	.ascii "cc1 %i %1 %{!Q:-quiet} %{Y*} %{d*} %{m*} %{f*} %{a}\11%{g} %{O} %{W*} %{w} %{pedantic} %{ansi} %{traditional}\11%{v:-version} %{gg:-symout %g.sym} %{pg:-p} %{p}\11%{S:%{o*}%{!o*:-o %b.s}}%{!S:-o %{|!pipe:%g.s}} |\12    %{!S:as %{R} %{j} %{J} %{h} %{d2} %a %{gg:-G %g.sym}            %{c:%{o*}%{!o*:-o %w%b.o}}%{!c:-o %d%w%b.o} %{!pipe:%g.s}\12 }\0"
LC6:
	.ascii ".s\0"
LC7:
	.ascii "%{!S:as %{R} %{j} %{J} %{h} %{d2} %a             %{c:%{o*}%{!o*:-o %w%b.o}}%{!c:-o %d%w%b.o} %i\12 }\0"
LC8:
	.ascii ".S\0"
LC9:
	.ascii "cpp %{nostdinc} %{C} %{v} %{D*} %{U*} %{I*} %{M*} %{trigraphs}         -undef -D__GNUC__ -$ %p %P        %c %{O:-D__OPTIMIZE__} %{traditional} %{pedantic}\11%{Wcomment*} %{Wtrigraphs} %{Wall} %C        %i %{!M*:%{!E:%{!pipe:%g.cpp}}}%{E:%{o*}}%{M*:%{o*}} |\12    %{!M*:%{!E:%{!S:as %{R} %{j} %{J} %{h} %{d2} %a                     %{c:%{o*}%{!o*:-o %w%b.o}}%{!c:-o %d%w%b.o}\11\11    %{!pipe:%g.s}\12 }}}\0"
.data
	.even
_compilers:
	.long LC0
	.long LC1
	.long LC2
	.long LC3
	.long LC4
	.long LC5
	.long LC6
	.long LC7
	.long LC8
	.long LC9
	.long 0
	.long 0
.globl _link_spec
.text
LC10:
	.ascii "%{!c:%{!M*:%{!E:%{!S:ld %{o*} %l %{A} %{d} %{e*} %{N} %{n} %{r} %{s} %{S} %{T*} %{t} %{u*} %{X} %{x} %{z} %{y*} %{!nostdlib:%S}  %{L*} %o %{!nostdlib:gnulib%s %{g:-lg} %L}\12 }}}}\0"
.data
	.even
_link_spec:
	.long LC10
.text
	.even
.globl _record_temp_file
_record_temp_file:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(8),d2
	movel d2,sp@-
	jbsr _strlen
	movel d0,a0
	pea a0@(1)
	lea _xmalloc,a2
	jbsr a2@
	movel d0,d3
	movel d2,sp@-
	movel d3,sp@-
	jbsr _strcpy
	addw #16,sp
	tstl a6@(12)
	jeq L2
	pea 8:w
	jbsr a2@
	movel d0,a0
	movel _always_delete_queue,a0@(4)
	movel d3,a0@
	movel a0,_always_delete_queue
	addqw #4,sp
L2:
	tstl a6@(16)
	jeq L3
	pea 8:w
	jbsr _xmalloc
	movel d0,a0
	movel _failure_delete_queue,a0@(4)
	movel d3,a0@
	movel a0,_failure_delete_queue
L3:
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _delete_temp_files
_delete_temp_files:
	link a6,#0
	movel a2,sp@-
	movel _always_delete_queue,a2
	tstl a2
	jeq L15
L8:
	movel a2@,sp@-
	jbsr _unlink
	addqw #4,sp
	movel a2@(4),a2
	tstl a2
	jne L8
L15:
	tstl a6@(8)
	jne L9
	movel _failure_delete_queue,a2
	tstl a2
	jeq L9
L13:
	movel a2@,sp@-
	jbsr _unlink
	addqw #4,sp
	movel a2@(4),a2
	tstl a2
	jne L13
L9:
	clrl _always_delete_queue
	clrl _failure_delete_queue
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _clear_failure_queue
_clear_failure_queue:
	link a6,#0
	clrl _failure_delete_queue
	unlk a6
	rts
LC11:
	.ascii "/tmp/ccXXXXXX\0"
	.even
.globl _choose_temp_base
_choose_temp_base:
	link a6,#0
	moveml #0x2020,sp@-
	movel #LC11,d2
	movel d2,sp@-
	lea _strlen,a2
	jbsr a2@
	movel d0,a0
	pea a0@(1)
	jbsr _xmalloc
	movel d0,_temp_filename
	movel d2,sp@-
	movel d0,sp@-
	jbsr _strcpy
	movel _temp_filename,sp@-
	jbsr _mktemp
	movel _temp_filename,sp@-
	jbsr a2@
	movel d0,_temp_filename_length
	moveml a6@(-8),#0x404
	unlk a6
	rts
.globl _user_exec_prefix
.data
	.even
_user_exec_prefix:
	.long 0
.globl _env_exec_prefix
	.even
_env_exec_prefix:
	.long 0
.globl _standard_exec_prefix
.text
LC12:
	.ascii "/usr/local/lib/gcc-\0"
.data
	.even
_standard_exec_prefix:
	.long LC12
.globl _standard_exec_prefix_1
.text
LC13:
	.ascii "/usr/lib/gcc-\0"
.data
	.even
_standard_exec_prefix_1:
	.long LC13
.globl _standard_startfile_prefix
.text
LC14:
	.ascii "/usr/local/lib/\0"
.data
	.even
_standard_startfile_prefix:
	.long LC14
.globl _standard_startfile_prefix_1
.text
LC15:
	.ascii "/lib/\0"
.data
	.even
_standard_startfile_prefix_1:
	.long LC15
.globl _standard_startfile_prefix_2
.text
LC16:
	.ascii "/usr/lib/\0"
.data
	.even
_standard_startfile_prefix_2:
	.long LC16
.text
	.even
.globl _clear_args
_clear_args:
	link a6,#0
	clrl _argbuf_index
	unlk a6
	rts
	.even
.globl _store_arg
_store_arg:
	link a6,#0
	moveml #0x3800,sp@-
	movel a6@(8),d4
	movel a6@(12),d3
	movel a6@(16),d2
	movel _argbuf_index,d0
	addql #1,d0
	cmpl _argbuf_length,d0
	jne L20
	movel _argbuf_length,d0
	asll #1,d0
	movel d0,_argbuf_length
	asll #2,d0
	movel d0,sp@-
	movel _argbuf,sp@-
	jbsr _realloc
	movel d0,_argbuf
	addqw #8,sp
L20:
	movel _argbuf_index,d0
	movel _argbuf,a0
	movel d4,a0@(d0:l:4)
	addql #1,_argbuf_index
	movel _argbuf_index,d0
	clrl a0@(d0:l:4)
	tstl d3
	jne L22
	tstl d2
	jeq L21
L22:
	movel d2,sp@-
	movel d3,sp@-
	movel d4,sp@-
	jbsr _record_temp_file
L21:
	moveml a6@(-12),#0x1c
	unlk a6
	rts
	.even
_find_exec_file:
	link a6,#0
	moveml #0x3830,sp@-
	movel a6@(8),d4
	clrl d2
	movel _standard_exec_prefix,sp@-
	lea _strlen,a3
	jbsr a3@
	movel d0,a2
	addqw #4,sp
	tstl _user_exec_prefix
	jeq L24
	movel _user_exec_prefix,sp@-
	jbsr a3@
	addqw #4,sp
	cmpl d0,a2
	jge L24
	movel _user_exec_prefix,sp@-
	jbsr a3@
	movel d0,a2
	addqw #4,sp
L24:
	tstl _env_exec_prefix
	jeq L25
	movel _env_exec_prefix,sp@-
	lea _strlen,a3
	jbsr a3@
	addqw #4,sp
	cmpl d0,a2
	jge L25
	movel _env_exec_prefix,sp@-
	jbsr a3@
	movel d0,a2
	addqw #4,sp
L25:
	movel _standard_exec_prefix_1,sp@-
	lea _strlen,a3
	jbsr a3@
	addqw #4,sp
	cmpl d0,a2
	jge L26
	movel _standard_exec_prefix_1,sp@-
	jbsr a3@
	movel d0,a2
	addqw #4,sp
L26:
	movel d4,sp@-
	jbsr _strlen
	movel d0,a0
	pea a0@(1,a2:l)
	jbsr _xmalloc
	movel d0,d3
	addqw #8,sp
	tstl _user_exec_prefix
	jeq L27
	movel _user_exec_prefix,sp@-
	movel d3,sp@-
	jbsr _strcpy
	movel d4,sp@-
	movel d3,sp@-
	jbsr _strcat
	pea 1:w
	movel d3,sp@-
	jbsr _access
	addw #24,sp
	tstl d0
	seq d2
	moveq #1,d1
	andl d1,d2
L27:
	tstl d2
	jne L28
	tstl _env_exec_prefix
	jeq L28
	movel _env_exec_prefix,sp@-
	movel d3,sp@-
	jbsr _strcpy
	movel d4,sp@-
	movel d3,sp@-
	jbsr _strcat
	pea 1:w
	movel d3,sp@-
	jbsr _access
	addw #24,sp
	tstl d0
	seq d2
	moveq #1,d1
	andl d1,d2
L28:
	tstl d2
	jne L29
	movel _standard_exec_prefix,sp@-
	movel d3,sp@-
	jbsr _strcpy
	movel d4,sp@-
	movel d3,sp@-
	jbsr _strcat
	pea 1:w
	movel d3,sp@-
	jbsr _access
	addw #24,sp
	tstl d0
	seq d2
	moveq #1,d1
	andl d1,d2
L29:
	tstl d2
	jne L30
	movel _standard_exec_prefix_1,sp@-
	movel d3,sp@-
	jbsr _strcpy
	movel _argbuf,a0
	movel a0@,sp@-
	movel d3,sp@-
	jbsr _strcat
	pea 1:w
	movel d3,sp@-
	jbsr _access
	tstl d0
	seq d2
	moveq #1,d1
	andl d1,d2
L30:
	tstl d2
	jeq L31
	movel d3,d0
	jra L23
L31:
	clrl d0
L23:
	moveml a6@(-20),#0xc1c
	unlk a6
	rts
LC17:
	.ascii "pipe\0"
LC18:
	.ascii "vfork\0"
	.even
_pexecute:
	link a6,#-8
	moveml #0x3c20,sp@-
	movel a6@(12),d5
	movel _last_pipe_input,d3
	moveq #1,d2
	tstl a6@(20)
	jeq L34
	pea a6@(-8)
	jbsr _pipe
	addqw #4,sp
	tstl d0
	jge L35
	pea LC17
	jbsr _pfatal_with_name
	addqw #4,sp
L35:
	movel a6@(-4),d2
	movel a6@(-8),_last_pipe_input
	jra L36
L34:
	clrl _last_pipe_input
L36:
	jbsr _fork
	movel d0,d4
	moveq #-1,d1
	cmpl d4,d1
	jeq L38
	tstl d4
	jeq L39
	jra L43
L38:
	pea LC18
	jbsr _pfatal_with_name
	jra L37
L39:
	tstl d3
	jeq L40
	clrl sp@-
	lea _close,a2
	jbsr a2@
	movel d3,sp@-
	jbsr _dup
	movel d3,sp@-
	jbsr a2@
	addw #12,sp
L40:
	moveq #1,d1
	cmpl d2,d1
	jeq L41
	pea 1:w
	lea _close,a2
	jbsr a2@
	movel d2,sp@-
	jbsr _dup
	movel d2,sp@-
	jbsr a2@
	addw #12,sp
L41:
	tstl _last_pipe_input
	jeq L42
	movel _last_pipe_input,sp@-
	jbsr _close
	addqw #4,sp
L42:
	movel a6@(16),sp@-
	movel d5,sp@-
	movel a6@(8),a0
	jbsr a0@
	movel d5,sp@-
	jbsr _perror_exec
	pea -1:w
	jbsr _exit
	addw #16,sp
L43:
	tstl d3
	jeq L44
	movel d3,sp@-
	jbsr _close
	addqw #4,sp
L44:
	moveq #1,d1
	cmpl d2,d1
	jeq L45
	movel d2,sp@-
	jbsr _close
L45:
	movel d4,d0
L37:
	moveml a6@(-28),#0x43c
	unlk a6
	rts
LC19:
	.ascii "|\0"
LC20:
	.ascii " %s\0"
LC21:
	.ascii " |\0"
LC22:
	.ascii "\12\0"
LC23:
	.ascii "Program %s got fatal signal %d.\0"
	.even
.globl _execute
_execute:
	link a6,#-4
	moveml #0x3c3c,sp@-
	movew #1,a4
	subl a3,a3
	cmpl _argbuf_index,a3
	jge L96
L52:
	pea LC19
	movel _argbuf,a0
	movel a0@(a3:l:4),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L50
	addqw #1,a4
L50:
	addqw #1,a3
	cmpl _argbuf_index,a3
	jlt L52
L96:
	lea a4@(a4:l:2),a1
	movel a1,d0
	asll #2,d0
	addql #1,d0
	moveq #-2,d5
	andl d5,d0
	subl d0,sp
	movel sp,a5
	movel _argbuf,a0
	movel a0@,a5@
	movel a0,a5@(4)
	movel a5@,sp@-
	jbsr _find_exec_file
	addqw #4,sp
	tstl d0
	jeq L53
	movel a5@(4),a0
	movel d0,a0@
L53:
	movew #1,a4
	subl a3,a3
	cmpl _argbuf_index,a3
	jge L95
L59:
	pea LC19
	movel _argbuf,a0
	movel a0@(a3:l:4),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L56
	movel _argbuf,a0
	clrl a0@(a3:l:4)
	lea a4@(a4:l:2),a1
	movel a1,d0
	movel d0,d2
	asll #2,d2
	movel a0@(4,a3:l:4),a5@(d2:l)
	movel a3,d0
	asll #2,d0
	addql #4,d0
	addl _argbuf,d0
	movel d0,a5@(4,d2:l)
	movel a5@(d2:l),sp@-
	jbsr _find_exec_file
	addqw #4,sp
	tstl d0
	jeq L58
	movel a5@(4,d2:l),a0
	movel d0,a0@
L58:
	addqw #1,a4
L56:
	addqw #1,a3
	cmpl _argbuf_index,a3
	jlt L59
L95:
	movel _argbuf_index,d0
	movel _argbuf,a0
	clrl a0@(d0:l:4)
	tstb _vflag
	jeq L60
	subl a3,a3
	cmpl a3,a4
	jle L94
	movel #__iob+40,d2
L69:
	lea a3@(a3:l:2),a0
	movel a5@(4,a0:l:4),a2
	tstl a2@
	jeq L93
L67:
	movel a2@+,sp@-
	pea LC20
	movel d2,sp@-
	jbsr _fprintf
	addw #12,sp
	tstl a2@
	jne L67
L93:
	movel a3,d0
	addql #1,d0
	cmpl d0,a4
	jeq L68
	pea LC21
	movel d2,sp@-
	jbsr _fprintf
	addqw #8,sp
L68:
	pea LC22
	movel d2,sp@-
	jbsr _fprintf
	addqw #8,sp
	addqw #1,a3
	cmpl a3,a4
	jgt L69
L94:
	pea __iob+40
	jbsr _fflush
	addqw #4,sp
L60:
	clrl _last_pipe_input
	subl a3,a3
	cmpl a3,a4
	jle L92
L76:
	lea a3@(a3:l:2),a1
	movel a1,d0
	asll #2,d0
	movel a5@(4,d0:l),a0
	movel a0@,d2
	movel a3,d1
	addql #1,d1
	cmpl d1,a4
	sgt d1
	moveq #1,d5
	andl d5,d1
	movel d1,sp@-
	movel a0,sp@-
	movel d2,sp@-
	cmpl a5@(d0:l),d2
	jeq L73
	movel #_execv,d0
	jra L74
L73:
	movel #_execvp,d0
L74:
	movel d0,sp@-
	jbsr _pexecute
	lea a3@(a3:l:2),a1
	movel a1,d1
	asll #2,d1
	movel d0,a5@(8,d1:l)
	addw #16,sp
	cmpl a5@(d1:l),d2
	jeq L72
	movel d2,sp@-
	jbsr _free
	addqw #4,sp
L72:
	addqw #1,a3
	cmpl a3,a4
	jgt L76
L92:
	clrl d3
	subl a3,a3
	cmpl a3,a4
	jle L91
L89:
	pea a6@(-4)
	jbsr _wait
	movel d0,d2
	addqw #4,sp
	jge L80
	jbsr _abort
L80:
	tstl a6@(-4)
	jeq L79
	subl a0,a0
	cmpl a0,a4
	jle L90
L86:
	lea a0@(a0:l:2),a1
	movel a1,d0
	asll #2,d0
	cmpl a5@(8,d0:l),d2
	jne L84
	movel a5@(d0:l),d4
L84:
	addqw #1,a0
	cmpl a0,a4
	jgt L86
L90:
	moveq #127,d0
	andl a6@(-4),d0
	jeq L87
	movel d0,sp@-
	movel d4,sp@-
	pea LC23
	jbsr _fatal
	addw #12,sp
L87:
	movel a6@(-4),d0
	andl #65280,d0
	asrl #8,d0
	tstl d0
	jle L79
	moveq #-1,d3
L79:
	addqw #1,a3
	cmpl a3,a4
	jgt L89
L91:
	movel d3,d0
	moveml a6@(-36),#0x3c3c
	unlk a6
	rts
LC24:
	.ascii "GCC_EXEC_PREFIX\0"
LC25:
	.ascii "Tdata\0"
	.even
.globl _process_command
_process_command:
	link a6,#0
	moveml #0x3038,sp@-
	movel a6@(8),d3
	movel a6@(12),a3
	clrl _n_switches
	clrl _n_infiles
	pea LC24
	jbsr _getenv
	movel d0,_env_exec_prefix
	moveq #1,d2
	addqw #4,sp
	cmpl d2,d3
	jle L126
L112:
	movel a3@(d2:l:4),a0
	cmpb #45,a0@
	jne L101
	cmpb #108,a0@(1)
	jeq L101
	addqw #1,a0
	moveb a0@,d0
	extbl d0
	moveq #66,d1
	cmpl d0,d1
	jeq L103
	moveq #118,d1
	cmpl d0,d1
	jeq L104
	jra L105
L103:
	addqw #1,a0
	movel a0,_user_exec_prefix
	jra L100
L104:
	addqb #1,_vflag
	addql #1,_n_switches
	jra L100
L105:
	addql #1,_n_switches
	moveq #68,d1
	cmpl d0,d1
	jeq L107
	moveq #85,d1
	cmpl d0,d1
	jeq L107
	moveq #111,d1
	cmpl d0,d1
	jeq L107
	moveq #101,d1
	cmpl d0,d1
	jeq L107
	moveq #84,d1
	cmpl d0,d1
	jeq L107
	moveq #117,d1
	cmpl d0,d1
	jeq L107
	moveq #73,d1
	cmpl d0,d1
	jeq L107
	moveq #89,d1
	cmpl d0,d1
	jeq L107
	moveq #109,d1
	cmpl d0,d1
	jeq L107
	moveq #76,d1
	cmpl d0,d1
	jne L106
L107:
	tstb a0@(1)
	jeq L127
L106:
	pea LC25
	movel a0,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L100
L127:
	addql #1,d2
	jra L100
L101:
	addql #1,_n_infiles
L100:
	addql #1,d2
	cmpl d2,d3
	jgt L112
L126:
	movel _n_switches,a0
	addqw #1,a0
	lea a0@(a0:l:2),a4
	movel a4,d0
	asll #2,d0
	movel d0,sp@-
	lea _xmalloc,a2
	jbsr a2@
	movel d0,_switches
	movel _n_infiles,d0
	addql #1,d0
	asll #2,d0
	movel d0,sp@-
	jbsr a2@
	movel d0,_infiles
	clrl _n_switches
	clrl _n_infiles
	moveq #1,d2
	addqw #8,sp
	cmpl d2,d3
	jle L125
L124:
	movel a3@(d2:l:4),a0
	cmpb #45,a0@
	jne L116
	cmpb #108,a0@(1)
	jeq L116
	movel a0,a2
	addqw #1,a2
	moveb a2@,d0
	extbl d0
	moveq #66,d1
	cmpl d0,d1
	jeq L115
	movel _n_switches,a0
	movel _switches,a1
	lea a0@(a0:l:2),a0
	movel a2,a1@(a0:l:4)
	moveq #68,d1
	cmpl d0,d1
	jeq L121
	moveq #85,d1
	cmpl d0,d1
	jeq L121
	moveq #111,d1
	cmpl d0,d1
	jeq L121
	moveq #101,d1
	cmpl d0,d1
	jeq L121
	moveq #84,d1
	cmpl d0,d1
	jeq L121
	moveq #117,d1
	cmpl d0,d1
	jeq L121
	moveq #73,d1
	cmpl d0,d1
	jeq L121
	moveq #89,d1
	cmpl d0,d1
	jeq L121
	moveq #109,d1
	cmpl d0,d1
	jeq L121
	moveq #76,d1
	cmpl d0,d1
	jne L120
L121:
	tstb a2@(1)
	jeq L119
L120:
	pea LC25
	movel a2,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L118
L119:
	movel _n_switches,a0
	movel _switches,a1
	lea a0@(a0:l:2),a0
	addql #1,d2
	movel a3@(d2:l:4),a1@(4,a0:l:4)
	jra L122
L118:
	movel _n_switches,a0
	movel _switches,a1
	lea a0@(a0:l:2),a0
	clrl a1@(4,a0:l:4)
L122:
	movel _n_switches,a0
	movel _switches,a1
	lea a0@(a0:l:2),a0
	clrl a1@(8,a0:l:4)
	addql #1,_n_switches
	jra L115
L116:
	movel _n_infiles,d0
	movel _infiles,a0
	movel a3@(d2:l:4),a0@(d0:l:4)
	addql #1,_n_infiles
L115:
	addql #1,d2
	cmpl d2,d3
	jgt L124
L125:
	movel _n_switches,a0
	movel _switches,a1
	lea a0@(a0:l:2),a0
	clrl a1@(a0:l:4)
	movel _n_infiles,d0
	movel _infiles,a0
	clrl a0@(d0:l:4)
	moveml a6@(-20),#0x1c0c
	unlk a6
	rts
	.even
.globl _do_spec
_do_spec:
	link a6,#0
	movel d2,sp@-
	jbsr _clear_args
	clrl _arg_going
	clrl _delete_this_arg
	clrl _this_is_output_file
	clrl _this_is_library_file
	clrl sp@-
	movel a6@(8),sp@-
	jbsr _do_spec_1
	movel d0,d2
	addqw #8,sp
	jne L129
	tstl _argbuf_index
	jle L130
	pea LC19
	movel _argbuf_index,d0
	movel _argbuf,a0
	movel a0@(-4,d0:l:4),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L130
	subql #1,_argbuf_index
L130:
	tstl _argbuf_index
	jle L129
	jbsr _execute
	movel d0,d2
L129:
	movel d2,d0
	movel a6@(-4),d2
	unlk a6
	rts
LC26:
	.ascii "Invalid specification!  Bug in cc.\0"
LC27:
	.ascii "%s\0"
LC28:
	.ascii "\0"
LC29:
	.ascii "%{m68000:-mc68010}%{mc68000:-mc68010}%{!mc68000:%{!m68000:-mc68020}}\0"
LC30:
	.ascii "%{funsigned-char:-D__CHAR_UNSIGNED__}\0"
LC31:
	.ascii "%{!msoft-float:%{mfpa:-D__HAVE_FPA__ }%{!mfpa:-D__HAVE_68881__ }}%{!ansi:%{m68000:-Dmc68010}%{mc68000:-Dmc68010}%{!mc68000:%{!m68000:-Dmc68020}}}\0"
LC32:
	.ascii "%{!p:%{!pg:-lc}}%{p:-lc_p}%{pg:-lc_p} %{a:/usr/lib/bb_link.o} \0"
LC33:
	.ascii "-Dmc68000 -Dsun -Dunix\0"
LC34:
	.ascii "-D\0"
LC35:
	.ascii "%{pg:gcrt0.o%s}%{!pg:%{p:mcrt0.o%s}%{!p:crt0.o%s}}\11   %{mfpa:Wcrt1.o%s}\11\11\11\11\11   %{msoft-float:Fcrt1.o%s}\11\11\11\11   %{!mfpa:%{!msoft-float:Mcrt1.o%s}}\0"
	.even
.globl _do_spec_1
_do_spec_1:
	link a6,#-28
	moveml #0x3c3c,sp@-
	movel a6@(12),d4
	movel a6@(8),a4
	lea _obstack,a5
	moveq #12,d5
	addl a5,d5
	movel d5,a6@(-4)
	moveq #12,d5
	addl a5,d5
	movel d5,a6@(-8)
	moveq #12,d5
	addl a5,d5
	movel d5,a6@(-12)
	moveq #12,d5
	addl a5,d5
	movel d5,a6@(-16)
	moveq #12,d5
	addl a5,d5
	movel d5,a6@(-20)
	moveq #12,d5
	addl a5,d5
	movel d5,a6@(-24)
	jra L133
L229:
	tstl d4
	jeq L226
	moveq #97,d0
	jra L227
L226:
	movel d3,d0
L227:
	moveq #32,d5
	cmpl d0,d5
	jeq L165
	moveq #32,d5
	cmpl d0,d5
	jlt L228
	moveq #9,d5
	cmpl d0,d5
	jeq L165
	moveq #10,d5
	cmpl d0,d5
	jeq L136
	jra L222
L228:
	moveq #37,d5
	cmpl d0,d5
	jeq L173
	moveq #124,d5
	cmpl d0,d5
	jeq L154
	jra L222
L136:
	tstl _arg_going
	jeq L137
	movel _obstack+12,d0
	addql #1,d0
	cmpl _obstack+16,d0
	jls L139
	pea 1:w
	movel a5,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L139:
	movel a6@(-4),a1
	movel a1@,a0
	clrb a0@
	addql #1,a1@
	movel _obstack+8,d2
	movel _obstack+12,d0
	addl _obstack+24,d0
	movel _obstack+24,d1
	notl d1
	andl d1,d0
	movel d0,_obstack+12
	subl _obstack+4,d0
	movel _obstack+16,d1
	subl _obstack+4,d1
	cmpl d0,d1
	jge L141
	movel _obstack+16,_obstack+12
L141:
	movel a5@(12),a5@(8)
	tstl _this_is_library_file
	jeq L142
	movel d2,sp@-
	jbsr _find_file
	movel d0,d2
	addqw #4,sp
L142:
	movel _this_is_output_file,sp@-
	movel _delete_this_arg,sp@-
	movel d2,sp@-
	jbsr _store_arg
	addw #12,sp
	tstl _this_is_output_file
	jeq L137
	movel _input_file_number,d0
	movel _outfiles,a0
	movel d2,a0@(d0:l:4)
L137:
	clrl _arg_going
	tstl _argbuf_index
	jle L144
	pea LC19
	movel _argbuf_index,d0
	movel _argbuf,a0
	movel a0@(-4,d0:l:4),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L144
	subl a2,a2
	cmpl _n_switches,a2
	jge L146
L149:
	pea LC17
	movel _switches,a0
	lea a2@(a2:l:2),a1
	movel a0@(a1:l:4),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jeq L146
	addqw #1,a2
	cmpl _n_switches,a2
	jlt L149
L146:
	cmpl _n_switches,a2
	jge L150
	movel _switches,a0
	lea a2@(a2:l:2),a1
	moveq #1,d5
	movel d5,a0@(8,a1:l:4)
	jra L133
L150:
	subql #1,_argbuf_index
L144:
	tstl _argbuf_index
	jle L152
	jbsr _execute
	tstl d0
	jne L132
L152:
	jbsr _clear_args
	jra L166
L154:
	tstl _arg_going
	jeq L155
	movel _obstack+12,d0
	addql #1,d0
	cmpl _obstack+16,d0
	jls L157
	pea 1:w
	movel a5,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L157:
	movel a6@(-8),a1
	movel a1@,a0
	clrb a0@
	addql #1,a1@
	movel _obstack+8,d2
	movel _obstack+12,d0
	addl _obstack+24,d0
	movel _obstack+24,d1
	notl d1
	andl d1,d0
	movel d0,_obstack+12
	subl _obstack+4,d0
	movel _obstack+16,d1
	subl _obstack+4,d1
	cmpl d0,d1
	jge L159
	movel _obstack+16,_obstack+12
L159:
	movel a5@(12),a5@(8)
	tstl _this_is_library_file
	jeq L160
	movel d2,sp@-
	jbsr _find_file
	movel d0,d2
	addqw #4,sp
L160:
	movel _this_is_output_file,sp@-
	movel _delete_this_arg,sp@-
	movel d2,sp@-
	jbsr _store_arg
	addw #12,sp
	tstl _this_is_output_file
	jeq L155
	movel _input_file_number,d0
	movel _outfiles,a0
	movel d2,a0@(d0:l:4)
L155:
	movel _obstack+12,d0
	addql #1,d0
	cmpl _obstack+16,d0
	jls L163
	pea 1:w
	movel a5,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L163:
	movel a6@(-12),a1
	jra L233
L165:
	tstl _arg_going
	jeq L166
	movel _obstack+12,d0
	addql #1,d0
	cmpl _obstack+16,d0
	jls L168
	pea 1:w
	movel a5,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L168:
	movel a6@(-16),a1
	movel a1@,a0
	clrb a0@
	addql #1,a1@
	movel _obstack+8,d2
	movel _obstack+12,d0
	addl _obstack+24,d0
	movel _obstack+24,d1
	notl d1
	andl d1,d0
	movel d0,_obstack+12
	subl _obstack+4,d0
	movel _obstack+16,d1
	subl _obstack+4,d1
	cmpl d0,d1
	jge L170
	movel _obstack+16,_obstack+12
L170:
	movel a5@(12),a5@(8)
	tstl _this_is_library_file
	jeq L171
	movel d2,sp@-
	jbsr _find_file
	movel d0,d2
	addqw #4,sp
L171:
	movel _this_is_output_file,sp@-
	movel _delete_this_arg,sp@-
	movel d2,sp@-
	jbsr _store_arg
	addw #12,sp
	tstl _this_is_output_file
	jeq L166
	movel _input_file_number,d0
	movel _outfiles,a0
	movel d2,a0@(d0:l:4)
L166:
	clrl _arg_going
	clrl _delete_this_arg
	clrl _this_is_output_file
	clrl _this_is_library_file
	jra L133
L173:
	moveb a4@+,d3
	extbl d3
	moveq #123,d5
	cmpl d5,d3
	jhi L220
LI221:
	movew pc@(L221-LI221-2:b,d3:l:2),d5
	jmp pc@(2,d5:w)
L221:
	.word L175-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L199-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L202-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L205-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L207-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L209-L221
	.word L220-L221
	.word L220-L221
	.word L219-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L203-L221
	.word L176-L221
	.word L204-L221
	.word L179-L221
	.word L180-L221
	.word L220-L221
	.word L184-L221
	.word L220-L221
	.word L187-L221
	.word L220-L221
	.word L220-L221
	.word L206-L221
	.word L220-L221
	.word L220-L221
	.word L190-L221
	.word L208-L221
	.word L220-L221
	.word L220-L221
	.word L195-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L196-L221
	.word L220-L221
	.word L220-L221
	.word L220-L221
	.word L197-L221
L175:
	pea LC26
	jbsr _fatal
	addqw #4,sp
L176:
	movel _basename_length,d2
	movel d2,d0
	addl _obstack+12,d0
	cmpl _obstack+16,d0
	jls L178
	movel d2,sp@-
	movel a5,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L178:
	movel d2,sp@-
	movel _input_basename,sp@-
	movel a5@(12),sp@-
	jbsr _memcpy
	addl d2,a5@(12)
	addw #12,sp
	jra L234
L179:
	moveq #2,d5
	movel d5,_delete_this_arg
	jra L133
L180:
	movel a4,d3
	tstb a4@
	jeq L182
L183:
	cmpb #10,a4@
	jeq L182
	addqw #1,a4
	tstb a4@
	jne L183
L182:
	movel a4,d0
	subl d3,d0
	movel d0,d1
	addql #2,d1
	moveq #-2,d5
	andl d5,d1
	subl d1,sp
	movel sp,d2
	movel d0,sp@-
	movel d3,sp@-
	movel d2,sp@-
	jbsr _strncpy
	movel d2,sp@-
	pea LC27
	jbsr _error
	moveq #-1,d0
	jra L132
L184:
	movel _temp_filename_length,d2
	movel d2,d0
	addl _obstack+12,d0
	cmpl _obstack+16,d0
	jls L186
	movel d2,sp@-
	movel a5,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L186:
	movel d2,sp@-
	movel _temp_filename,sp@-
	movel a5@(12),sp@-
	jbsr _memcpy
	addl d2,a5@(12)
	addw #12,sp
	moveq #1,d5
	movel d5,_delete_this_arg
	jra L234
L187:
	movel _input_filename_length,d2
	movel d2,d0
	addl _obstack+12,d0
	cmpl _obstack+16,d0
	jls L189
	movel d2,sp@-
	movel a5,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L189:
	movel d2,sp@-
	movel _input_filename,sp@-
	movel a5@(12),sp@-
	jbsr _memcpy
	addl d2,a5@(12)
	addw #12,sp
	jra L234
L190:
	clrl d2
	cmpl _n_infiles,d2
	jge L133
L194:
	clrl sp@-
	clrl sp@-
	movel _outfiles,a0
	movel a0@(d2:l:4),sp@-
	jbsr _store_arg
	addw #12,sp
	addql #1,d2
	cmpl _n_infiles,d2
	jlt L194
	jra L133
L195:
	moveq #1,d5
	movel d5,_this_is_library_file
	jra L133
L196:
	moveq #1,d5
	movel d5,_this_is_output_file
	jra L133
L197:
	movel a4,sp@-
	jbsr _handle_braces
	movel d0,a4
	addqw #4,sp
	tstl a4
	jne L133
	moveq #-1,d0
	jra L132
L199:
	movel _obstack+12,d0
	addql #1,d0
	cmpl _obstack+16,d0
	jls L201
	pea 1:w
	movel a5,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L201:
	movel a6@(-20),a1
	movel a1@,a0
	moveb #37,a0@
	addql #1,a1@
	jra L133
L202:
	clrl sp@-
	pea LC28
	jra L235
L203:
	clrl sp@-
	pea LC29
	jra L235
L204:
	clrl sp@-
	pea LC30
	jra L235
L205:
	clrl sp@-
	pea LC31
	jra L235
L206:
	clrl sp@-
	pea LC28
	jra L235
L207:
	clrl sp@-
	pea LC32
	jra L235
L208:
	clrl sp@-
	pea LC33
	jra L235
L209:
	pea LC33
	jbsr _strlen
	asll #1,d0
	addqw #4,sp
	addql #2,d0
	moveq #-2,d5
	andl d5,d0
	subl d0,sp
	movel sp,d2
	movel d2,a2
	lea LC33,a3
L210:
	pea 2:w
	pea LC34
	movel a3,sp@-
	jbsr _strncmp
	addw #12,sp
	tstl d0
	jne L212
	moveb #45,a2@+
	moveb #68,a2@+
	moveb #95,a2@+
	moveb #95,a2@+
	addqw #2,a3
	jra L210
L212:
	cmpb #32,a3@
	jeq L215
	tstb a3@
	jne L236
L215:
	moveb #95,a2@+
	moveb #95,a2@+
	tstb a3@
	jeq L211
L236:
	moveb a3@+,a2@+
	jra L210
L211:
	clrb a2@
	clrl sp@-
	movel d2,sp@-
	jra L235
L219:
	clrl sp@-
	pea LC35
L235:
	jbsr _do_spec_1
	addqw #8,sp
	jra L133
L220:
	jbsr _abort
	jra L133
L222:
	movel _obstack+12,d0
	addql #1,d0
	cmpl _obstack+16,d0
	jls L224
	pea 1:w
	movel a5,sp@-
	jbsr __obstack_newchunk
	addqw #8,sp
L224:
	movel a6@(-24),a1
L233:
	movel a1@,a0
	moveb d3,a0@
	addql #1,a1@
L234:
	moveq #1,d5
	movel d5,_arg_going
L133:
	moveb a4@+,d3
	extbl d3
	jne L229
	clrl d0
L132:
	moveml a6@(-60),#0x3c3c
	unlk a6
	rts
LC36:
	.ascii "-\0"
	.even
.globl _handle_braces
_handle_braces:
	link a6,#0
	moveml #0x3f3c,sp@-
	movel a6@(8),a3
	clrl d7
	clrl d6
	cmpb #124,a3@
	jne L238
	moveq #1,d7
	addqw #1,a3
L238:
	cmpb #33,a3@
	jne L239
	moveq #1,d6
	addqw #1,a3
L239:
	movel a3,d4
	cmpb #58,a3@
	jeq L241
L242:
	cmpb #125,a3@
	jeq L241
	addqw #1,a3
	cmpb #58,a3@
	jne L242
L241:
	cmpb #125,a3@
	jeq L243
	moveq #1,d2
	lea a3@(1),a4
L251:
	cmpb #123,a4@
	jne L246
	addql #1,d2
	jra L247
L246:
	cmpb #125,a4@
	jne L248
	subql #1,d2
	jra L247
L248:
	tstb a4@
	jne L247
	jbsr _abort
L247:
	addqw #1,a4
	tstl d2
	jgt L251
	jra L252
L243:
	lea a3@(1),a4
L252:
	cmpb #42,a3@(-1)
	jne L253
	cmpb #125,a3@
	jne L253
	subqw #1,a3
	subl a2,a2
	cmpl _n_switches,a2
	jge L259
L258:
	movel a3,d1
	subl d4,d1
	movel d1,sp@-
	movel d4,sp@-
	movel _switches,a0
	lea a2@(a2:l:2),a1
	movel a0@(a1:l:4),sp@-
	jbsr _strncmp
	addw #12,sp
	tstl d0
	jne L256
	movel a2,sp@-
	jbsr _give_switch
	addqw #4,sp
L256:
	addqw #1,a2
	cmpl _n_switches,a2
	jlt L258
	jra L259
L253:
	clrl d5
	cmpb #42,a3@(-1)
	jne L260
	subl a2,a2
	cmpl _n_switches,a2
	jge L266
	movel a3,d0
	subl d4,d0
	movel d0,d3
	subql #1,d3
L265:
	movel d3,sp@-
	movel d4,sp@-
	movel _switches,a0
	lea a2@(a2:l:2),a5
	movel a5,d0
	movel d0,d2
	asll #2,d2
	movel a0@(d2:l),sp@-
	jbsr _strncmp
	addw #12,sp
	tstl d0
	jne L263
	movel _switches,a0
	moveq #1,d1
	movel d1,a0@(8,d2:l)
	moveq #1,d5
L263:
	addqw #1,a2
	cmpl _n_switches,a2
	jlt L265
	jra L266
L260:
	subl a2,a2
	cmpl _n_switches,a2
	jge L266
	movel a3,d3
	subl d4,d3
L271:
	movel d3,sp@-
	movel d4,sp@-
	movel _switches,a0
	lea a2@(a2:l:2),a5
	movel a5,d0
	movel d0,d2
	asll #2,d2
	movel a0@(d2:l),sp@-
	jbsr _strncmp
	addw #12,sp
	tstl d0
	jne L269
	movel _switches,a1
	movel a1@(d2:l),a0
	tstb a0@(d3:l)
	jne L269
	moveq #1,d1
	movel d1,a1@(8,d2:l)
	moveq #1,d5
	jra L266
L269:
	addqw #1,a2
	cmpl _n_switches,a2
	jlt L271
L266:
	cmpl d5,d6
	jeq L272
	cmpb #125,a3@
	jne L273
	movel a2,sp@-
	jbsr _give_switch
	jra L259
L273:
	clrl sp@-
	movel a4,a0
	subl a3,a0
	pea a0@(-2)
	pea a3@(1)
	jbsr _save_string
	addqw #8,sp
	movel d0,sp@-
	jbsr _do_spec_1
	tstl d0
	jge L259
	clrl d0
	jra L237
L272:
	tstl d7
	jeq L259
	pea LC36
	jbsr _do_spec_1
L259:
	movel a4,d0
L237:
	moveml a6@(-40),#0x3cfc
	unlk a6
	rts
LC37:
	.ascii " \0"
	.even
.globl _give_switch
_give_switch:
	link a6,#0
	moveml #0x2038,sp@-
	movel a6@(8),a3
	clrl sp@-
	pea LC36
	lea _do_spec_1,a2
	jbsr a2@
	pea 1:w
	movel _switches,a0
	lea a3@(a3:l:2),a4
	movel a4,d0
	movel d0,d2
	asll #2,d2
	movel a0@(d2:l),sp@-
	jbsr a2@
	clrl sp@-
	pea LC37
	jbsr a2@
	movel _switches,a0
	addw #24,sp
	tstl a0@(4,d2:l)
	jeq L283
	pea 1:w
	movel a0@(4,d2:l),sp@-
	jbsr a2@
	clrl sp@-
	pea LC37
	jbsr a2@
L283:
	movel _switches,a0
	lea a3@(a3:l:2),a1
	moveq #1,d1
	movel d1,a0@(8,a1:l:4)
	moveml a6@(-16),#0x1c04
	unlk a6
	rts
LC38:
	.ascii "./\0"
	.even
.globl _find_file
_find_file:
	link a6,#0
	moveml #0x3830,sp@-
	movel a6@(8),d4
	clrl d2
	movel _standard_exec_prefix,sp@-
	lea _strlen,a3
	jbsr a3@
	movel d0,a2
	addqw #4,sp
	tstl _user_exec_prefix
	jeq L285
	movel _user_exec_prefix,sp@-
	jbsr a3@
	addqw #4,sp
	cmpl d0,a2
	jge L285
	movel _user_exec_prefix,sp@-
	jbsr a3@
	movel d0,a2
	addqw #4,sp
L285:
	tstl _env_exec_prefix
	jeq L286
	movel _env_exec_prefix,sp@-
	lea _strlen,a3
	jbsr a3@
	addqw #4,sp
	cmpl d0,a2
	jge L286
	movel _env_exec_prefix,sp@-
	jbsr a3@
	movel d0,a2
	addqw #4,sp
L286:
	movel _standard_exec_prefix,sp@-
	lea _strlen,a3
	jbsr a3@
	addqw #4,sp
	cmpl d0,a2
	jge L287
	movel _standard_exec_prefix,sp@-
	jbsr a3@
	movel d0,a2
	addqw #4,sp
L287:
	movel _standard_exec_prefix_1,sp@-
	lea _strlen,a3
	jbsr a3@
	addqw #4,sp
	cmpl d0,a2
	jge L288
	movel _standard_exec_prefix_1,sp@-
	jbsr a3@
	movel d0,a2
	addqw #4,sp
L288:
	movel _standard_startfile_prefix,sp@-
	lea _strlen,a3
	jbsr a3@
	addqw #4,sp
	cmpl d0,a2
	jge L289
	movel _standard_startfile_prefix,sp@-
	jbsr a3@
	movel d0,a2
	addqw #4,sp
L289:
	movel _standard_startfile_prefix_1,sp@-
	lea _strlen,a3
	jbsr a3@
	addqw #4,sp
	cmpl d0,a2
	jge L290
	movel _standard_startfile_prefix_1,sp@-
	jbsr a3@
	movel d0,a2
	addqw #4,sp
L290:
	movel _standard_startfile_prefix_2,sp@-
	lea _strlen,a3
	jbsr a3@
	addqw #4,sp
	cmpl d0,a2
	jge L291
	movel _standard_startfile_prefix_2,sp@-
	jbsr a3@
	movel d0,a2
	addqw #4,sp
L291:
	movel d4,sp@-
	jbsr _strlen
	movel d0,a0
	addqw #4,sp
	lea a0@(2,a2:l),a1
	movel a1,d0
	moveq #-2,d1
	andl d1,d0
	subl d0,sp
	movel sp,d3
	tstl _user_exec_prefix
	jeq L292
	movel _user_exec_prefix,sp@-
	movel d3,sp@-
	jbsr _strcpy
	movel d4,sp@-
	movel d3,sp@-
	jbsr _strcat
	pea 4:w
	movel d3,sp@-
	jbsr _access
	addw #24,sp
	tstl d0
	seq d2
	moveq #1,d1
	andl d1,d2
L292:
	tstl d2
	jne L293
	tstl _env_exec_prefix
	jeq L293
	movel _env_exec_prefix,sp@-
	movel d3,sp@-
	jbsr _strcpy
	movel d4,sp@-
	movel d3,sp@-
	jbsr _strcat
	pea 4:w
	movel d3,sp@-
	jbsr _access
	addw #24,sp
	tstl d0
	seq d2
	moveq #1,d1
	andl d1,d2
L293:
	tstl d2
	jne L294
	movel _standard_exec_prefix,sp@-
	movel d3,sp@-
	jbsr _strcpy
	movel d4,sp@-
	movel d3,sp@-
	jbsr _strcat
	pea 4:w
	movel d3,sp@-
	jbsr _access
	addw #24,sp
	tstl d0
	seq d2
	moveq #1,d1
	andl d1,d2
L294:
	tstl d2
	jne L295
	movel _standard_exec_prefix_1,sp@-
	movel d3,sp@-
	jbsr _strcpy
	movel d4,sp@-
	movel d3,sp@-
	jbsr _strcat
	pea 4:w
	movel d3,sp@-
	jbsr _access
	addw #24,sp
	tstl d0
	seq d2
	moveq #1,d1
	andl d1,d2
L295:
	tstl d2
	jne L296
	movel _standard_startfile_prefix,sp@-
	movel d3,sp@-
	jbsr _strcpy
	movel d4,sp@-
	movel d3,sp@-
	jbsr _strcat
	pea 4:w
	movel d3,sp@-
	jbsr _access
	addw #24,sp
	tstl d0
	seq d2
	moveq #1,d1
	andl d1,d2
L296:
	tstl d2
	jne L297
	movel _standard_startfile_prefix_1,sp@-
	movel d3,sp@-
	jbsr _strcpy
	movel d4,sp@-
	movel d3,sp@-
	jbsr _strcat
	pea 4:w
	movel d3,sp@-
	jbsr _access
	addw #24,sp
	tstl d0
	seq d2
	moveq #1,d1
	andl d1,d2
L297:
	tstl d2
	jne L298
	movel _standard_startfile_prefix_2,sp@-
	movel d3,sp@-
	jbsr _strcpy
	movel d4,sp@-
	movel d3,sp@-
	jbsr _strcat
	pea 4:w
	movel d3,sp@-
	jbsr _access
	addw #24,sp
	tstl d0
	seq d2
	moveq #1,d1
	andl d1,d2
L298:
	tstl d2
	jne L299
	pea LC38
	movel d3,sp@-
	jbsr _strcpy
	movel d4,sp@-
	movel d3,sp@-
	jbsr _strcat
	pea 4:w
	movel d3,sp@-
	jbsr _access
	addw #24,sp
	tstl d0
	seq d2
	moveq #1,d1
	andl d1,d2
L299:
	tstl d2
	jeq L300
	movel d3,sp@-
	jbsr _strlen
	movel d0,sp@-
	movel d3,sp@-
	jbsr _save_string
	jra L284
L300:
	movel d4,d0
L284:
	moveml a6@(-20),#0xc1c
	unlk a6
	rts
	.even
.globl _fatal_error
_fatal_error:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),d2
	clrl sp@-
	movel d2,sp@-
	jbsr _signal
	clrl sp@-
	jbsr _delete_temp_files
	movel d2,sp@-
	jbsr _getpid
	movel d0,sp@-
	jbsr _kill
	movel a6@(-4),d2
	unlk a6
	rts
LC39:
	.ascii "gcc version %s\12\0"
LC40:
	.ascii "No input files specified.\0"
LC41:
	.ascii "%s: linker input file unused since linking not done\0"
LC42:
	.ascii "unrecognized option `-%s'\0"
	.even
.globl _main
_main:
	link a6,#0
	moveml #0x3838,sp@-
	movel a6@(12),a3
	clrl d3
	clrl d2
	movel a3@,_programname
	pea 1:w
	pea 2:w
	lea _signal,a2
	jbsr a2@
	addqw #8,sp
	moveq #1,d4
	cmpl d0,d4
	jeq L303
	pea _fatal_error
	pea 2:w
	jbsr a2@
	addqw #8,sp
L303:
	pea 1:w
	pea 1:w
	lea _signal,a2
	jbsr a2@
	addqw #8,sp
	moveq #1,d4
	cmpl d0,d4
	jeq L304
	pea _fatal_error
	pea 1:w
	jbsr a2@
	addqw #8,sp
L304:
	pea 1:w
	pea 15:w
	lea _signal,a2
	jbsr a2@
	addqw #8,sp
	moveq #1,d4
	cmpl d0,d4
	jeq L305
	pea _fatal_error
	pea 15:w
	jbsr a2@
	addqw #8,sp
L305:
	moveq #10,d4
	movel d4,_argbuf_length
	asll #2,d4
	movel d4,sp@-
	lea _xmalloc,a2
	jbsr a2@
	movel d0,_argbuf
	pea _free
	movel a2,sp@-
	clrl sp@-
	clrl sp@-
	pea _obstack
	jbsr __obstack_begin
	jbsr _choose_temp_base
	movel a3,sp@-
	movel a6@(8),sp@-
	jbsr _process_command
	addw #32,sp
	tstb _vflag
	jeq L306
	movel _version_string,sp@-
	pea LC39
	pea __iob+40
	jbsr _fprintf
	addw #12,sp
	tstl _n_infiles
	jne L306
	clrl sp@-
	jbsr _exit
	addqw #4,sp
L306:
	tstl _n_infiles
	jne L308
	pea LC40
	jbsr _fatal
	addqw #4,sp
L308:
	movel _n_infiles,d4
	asll #2,d4
	movel d4,sp@-
	jbsr _xmalloc
	movel d0,_outfiles
	movel _n_infiles,d4
	asll #2,d4
	movel d4,sp@-
	clrl sp@-
	movel d0,sp@-
	jbsr _memset
	subl a4,a4
	addw #16,sp
	cmpl _n_infiles,a4
	jge L335
L324:
	movel _infiles,a0
	movel a0@(a4:l:4),_input_filename
	movel _input_filename,sp@-
	jbsr _strlen
	movel d0,_input_filename_length
	movel a4,_input_file_number
	movel _outfiles,a0
	movel _input_filename,a0@(a4:l:4)
	lea _compilers,a2
	addqw #4,sp
	tstl a2@(4)
	jeq L313
L322:
	movel a2@,sp@-
	lea _strlen,a3
	jbsr a3@
	addqw #4,sp
	cmpl _input_filename_length,d0
	jge L314
	movel a2@,sp@-
	jbsr a3@
	movel _infiles,a0
	movel a0@(a4:l:4),d1
	addl _input_filename_length,d1
	subl d0,d1
	movel d1,sp@-
	movel a2@,sp@-
	jbsr _strcmp
	addw #12,sp
	tstl d0
	jne L314
	movel _input_filename,_input_basename
	movel _input_filename,a0
	tstb a0@
	jeq L333
L320:
	cmpb #47,a0@
	jne L318
	movel a0,d4
	addql #1,d4
	movel d4,_input_basename
L318:
	addqw #1,a0
	tstb a0@
	jne L320
L333:
	movel a2@,sp@-
	jbsr _strlen
	subl _input_filename_length,d0
	negl d0
	movel _input_basename,d1
	subl _input_filename,d1
	subl d1,d0
	movel d0,_basename_length
	movel a2@(4),sp@-
	jbsr _do_spec
	addqw #8,sp
	tstl d0
	jge L313
	moveq #1,d2
	jra L313
L314:
	addqw #8,a2
	tstl a2@(4)
	jne L322
L313:
	tstl a2@(4)
	jne L323
	tstl d3
	jeq L323
	movel _input_filename,sp@-
	pea LC41
	jbsr _error
	addqw #8,sp
L323:
	jbsr _clear_failure_queue
	addqw #1,a4
	cmpl _n_infiles,a4
	jlt L324
L335:
	tstl d3
	jne L325
	tstl d2
	jne L325
	movel _link_spec,sp@-
	jbsr _do_spec
	addqw #4,sp
	tstl d0
	jge L325
	moveq #1,d2
L325:
	jbsr _validate_all_switches
	subl a4,a4
	cmpl _n_switches,a4
	jge L332
L331:
	movel _switches,a0
	lea a4@(a4:l:2),a1
	movel a1,d0
	asll #2,d0
	tstl a0@(8,d0:l)
	jne L329
	movel a0@(d0:l),sp@-
	pea LC42
	jbsr _error
	addqw #8,sp
L329:
	addqw #1,a4
	cmpl _n_switches,a4
	jlt L331
L332:
	tstl d2
	seq d0
	moveq #1,d4
	andl d4,d0
	movel d0,sp@-
	jbsr _delete_temp_files
	movel d2,sp@-
	jbsr _exit
	moveml a6@(-24),#0x1c1c
	unlk a6
	rts
LC43:
	.ascii "Virtual memory full.\0"
	.even
.globl _xmalloc
_xmalloc:
	link a6,#0
	movel d2,sp@-
	movel a6@(8),sp@-
	jbsr _malloc
	movel d0,d2
	addqw #4,sp
	jne L337
	pea LC43
	jbsr _fatal
L337:
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
	jne L339
	pea LC43
	jbsr _fatal
L339:
	movel d2,d0
	movel a6@(-4),d2
	unlk a6
	rts
	.even
.globl _concat
_concat:
	link a6,#0
	moveml #0x3e38,sp@-
	movel a6@(8),d5
	movel a6@(12),d3
	movel a6@(16),d2
	movel d5,sp@-
	lea _strlen,a3
	jbsr a3@
	movel d0,a2
	movel d3,sp@-
	jbsr a3@
	movel d0,d4
	movel d2,sp@-
	jbsr a3@
	movel d0,a3
	lea a2@(0,d4:l),a0
	pea a3@(1,a0:l)
	jbsr _xmalloc
	movel d0,d6
	movel d5,sp@-
	movel d6,sp@-
	lea _strcpy,a4
	jbsr a4@
	movel d3,sp@-
	lea a2@(0,d6:l),a2
	movel a2,sp@-
	jbsr a4@
	addw #32,sp
	movel d2,sp@-
	addl d4,a2
	movel a2,sp@-
	jbsr a4@
	clrb a3@(a2:l)
	movel d6,d0
	moveml a6@(-32),#0x1c7c
	unlk a6
	rts
	.even
.globl _save_string
_save_string:
	link a6,#0
	moveml #0x30,sp@-
	movel a6@(12),a2
	pea a2@(1)
	jbsr _xmalloc
	movel d0,a3
	movel a2,sp@-
	movel a6@(8),sp@-
	movel a3,sp@-
	jbsr _memcpy
	clrb a2@(a3:l)
	movel a3,d0
	moveml a6@(-8),#0xc00
	unlk a6
	rts
LC44:
	.ascii "%s: \0"
LC45:
	.ascii "cannot open %s\0"
	.even
.globl _pfatal_with_name
_pfatal_with_name:
	link a6,#0
	movel _errno,d1
	cmpl _sys_nerr,d1
	jge L343
	pea LC28
	movel _errno,d0
	lea _sys_errlist,a0
	movel a0@(d0:l:4),sp@-
	pea LC44
	jbsr _concat
	addw #12,sp
	jra L344
L343:
	movel #LC45,d0
L344:
	movel a6@(8),sp@-
	movel d0,sp@-
	jbsr _fatal
	unlk a6
	rts
	.even
.globl _perror_with_name
_perror_with_name:
	link a6,#0
	movel _errno,d1
	cmpl _sys_nerr,d1
	jge L346
	pea LC28
	movel _errno,d0
	lea _sys_errlist,a0
	movel a0@(d0:l:4),sp@-
	pea LC44
	jbsr _concat
	addw #12,sp
	jra L347
L346:
	movel #LC45,d0
L347:
	movel a6@(8),sp@-
	movel d0,sp@-
	jbsr _error
	unlk a6
	rts
LC46:
	.ascii "installation problem, cannot exec %s: \0"
LC47:
	.ascii "installation problem, cannot exec %s\0"
	.even
.globl _perror_exec
_perror_exec:
	link a6,#0
	movel _errno,d1
	cmpl _sys_nerr,d1
	jge L349
	pea LC28
	movel _errno,d0
	lea _sys_errlist,a0
	movel a0@(d0:l:4),sp@-
	pea LC46
	jbsr _concat
	addw #12,sp
	jra L350
L349:
	movel #LC47,d0
L350:
	movel a6@(8),sp@-
	movel d0,sp@-
	jbsr _error
	unlk a6
	rts
	.even
.globl _fatal
_fatal:
	link a6,#0
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	jbsr _error
	clrl sp@-
	jbsr _delete_temp_files
	pea 1:w
	jbsr _exit
	unlk a6
	rts
	.even
.globl _error
_error:
	link a6,#0
	moveml #0x2020,sp@-
	movel _programname,sp@-
	pea LC44
	movel #__iob+40,d2
	movel d2,sp@-
	lea _fprintf,a2
	jbsr a2@
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	movel d2,sp@-
	jbsr a2@
	pea LC22
	movel d2,sp@-
	jbsr a2@
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _validate_all_switches
_validate_all_switches:
	link a6,#0
	moveml #0x30,sp@-
	lea _compilers,a3
	tstl a3@(4)
	jeq L366
L361:
	movel a3@(4),a2
	jra L357
L360:
	cmpb #37,d0
	jne L357
	cmpb #123,a2@
	jne L357
	pea a2@(1)
	jbsr _validate_switches
	addqw #4,sp
L357:
	moveb a2@+,d0
	jne L360
	addqw #8,a3
	tstl a3@(4)
	jne L361
L366:
	movel _link_spec,a2
	jra L362
L365:
	cmpb #37,d0
	jne L362
	cmpb #123,a2@
	jne L362
	pea a2@(1)
	jbsr _validate_switches
	addqw #4,sp
L362:
	moveb a2@+,d0
	jne L365
	moveml a6@(-8),#0xc00
	unlk a6
	rts
	.even
.globl _validate_switches
_validate_switches:
	link a6,#0
	moveml #0x3838,sp@-
	movel a6@(8),a3
	cmpb #124,a3@
	jne L368
	addqw #1,a3
L368:
	cmpb #33,a3@
	jne L369
	addqw #1,a3
L369:
	movel a3,d4
	cmpb #58,a3@
	jeq L371
L372:
	cmpb #125,a3@
	jeq L371
	addqw #1,a3
	cmpb #58,a3@
	jne L372
L371:
	cmpb #42,a3@(-1)
	jne L373
	subqw #1,a3
	subl a2,a2
	cmpl _n_switches,a2
	jge L379
L378:
	movel a3,d1
	subl d4,d1
	movel d1,sp@-
	movel d4,sp@-
	movel _switches,a0
	lea a2@(a2:l:2),a4
	movel a4,d0
	movel d0,d2
	asll #2,d2
	movel a0@(d2:l),sp@-
	jbsr _strncmp
	addw #12,sp
	tstl d0
	jne L376
	movel _switches,a0
	moveq #1,d1
	movel d1,a0@(8,d2:l)
L376:
	addqw #1,a2
	cmpl _n_switches,a2
	jlt L378
	jra L379
L373:
	subl a2,a2
	cmpl _n_switches,a2
	jge L379
	movel a3,d3
	subl d4,d3
L384:
	movel d3,sp@-
	movel d4,sp@-
	movel _switches,a0
	lea a2@(a2:l:2),a4
	movel a4,d0
	movel d0,d2
	asll #2,d2
	movel a0@(d2:l),sp@-
	jbsr _strncmp
	addw #12,sp
	tstl d0
	jne L382
	movel _switches,a1
	movel a1@(d2:l),a0
	tstb a0@(d3:l)
	jne L382
	moveq #1,d1
	movel d1,a1@(8,d2:l)
L382:
	addqw #1,a2
	cmpl _n_switches,a2
	jlt L384
L379:
	moveml a6@(-24),#0x1c1c
	unlk a6
	rts
.comm _this_is_library_file,4
.comm _this_is_output_file,4
.comm _delete_this_arg,4
.comm _arg_going,4
.comm _input_basename,4
.comm _basename_length,4
.comm _input_filename_length,4
.comm _input_file_number,4
.comm _input_filename,4
.comm _outfiles,4
.comm _n_infiles,4
.comm _infiles,4
.comm _n_switches,4
.comm _switches,4
.comm _last_pipe_input,4
.comm _programname,4
.comm _vflag,2
.comm _argbuf_index,4
.comm _argbuf_length,4
.comm _argbuf,4
.comm _failure_delete_queue,4
.comm _always_delete_queue,4
.comm _temp_filename_length,4
.comm _temp_filename,4
.comm _obstack,36
