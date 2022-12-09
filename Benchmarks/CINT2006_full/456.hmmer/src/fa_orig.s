	.text
	.file	"fast_algorithms.c"
	.file	0 "/n/eecs583b/home/zderosia/final/EECS_583_Final_Project/Benchmarks/CINT2006_full/456.hmmer/src" "fast_algorithms.c" md5 0xeac9a314a0439eb39fcedfa743374304
	.globl	P7Viterbi                       # -- Begin function P7Viterbi
	.p2align	4, 0x90
	.type	P7Viterbi,@function
P7Viterbi:                              # @P7Viterbi
.Lfunc_begin0:
	.loc	0 70 0                          # fast_algorithms.c:70:0
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$272, %rsp                      # imm = 0x110
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
.Ltmp0:
	.loc	0 98 21 prologue_end            # fast_algorithms.c:98:21
	movq	-32(%rbp), %rdi
	.loc	0 98 25 is_stmt 0               # fast_algorithms.c:98:25
	movl	-12(%rbp), %esi
	.loc	0 98 28                         # fast_algorithms.c:98:28
	movq	-24(%rbp), %rax
	.loc	0 98 33                         # fast_algorithms.c:98:33
	movl	136(%rax), %edx
	.loc	0 98 3                          # fast_algorithms.c:98:3
	leaq	-56(%rbp), %rcx
	leaq	-64(%rbp), %r8
	leaq	-72(%rbp), %r9
	leaq	-80(%rbp), %rax
	movq	%rax, (%rsp)
	callq	ResizePlan7Matrix
	.loc	0 102 3 is_stmt 1               # fast_algorithms.c:102:3
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc	0 102 15 is_stmt 0              # fast_algorithms.c:102:15
	movl	$0, 16(%rax)
	.loc	0 103 17 is_stmt 1              # fast_algorithms.c:103:17
	movq	-24(%rbp), %rax
	movl	336(%rax), %ecx
	.loc	0 103 3 is_stmt 0               # fast_algorithms.c:103:3
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc	0 103 15                        # fast_algorithms.c:103:15
	movl	%ecx, (%rax)
	.loc	0 104 31 is_stmt 1              # fast_algorithms.c:104:31
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc	0 104 43 is_stmt 0              # fast_algorithms.c:104:43
	movl	$-987654321, 12(%rax)           # imm = 0xC521974F
	.loc	0 104 17                        # fast_algorithms.c:104:17
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc	0 104 29                        # fast_algorithms.c:104:29
	movl	$-987654321, 8(%rax)            # imm = 0xC521974F
	.loc	0 104 3                         # fast_algorithms.c:104:3
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc	0 104 15                        # fast_algorithms.c:104:15
	movl	$-987654321, 4(%rax)            # imm = 0xC521974F
.Ltmp1:
	.loc	0 105 10 is_stmt 1              # fast_algorithms.c:105:10
	movl	$0, -88(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
.Ltmp2:
	.loc	0 105 15 is_stmt 0              # fast_algorithms.c:105:15
	movl	-88(%rbp), %eax
	.loc	0 105 20                        # fast_algorithms.c:105:20
	movq	-24(%rbp), %rcx
	.loc	0 105 17                        # fast_algorithms.c:105:17
	cmpl	136(%rcx), %eax
.Ltmp3:
	.loc	0 105 3                         # fast_algorithms.c:105:3
	jg	.LBB0_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
.Ltmp4:
	.loc	0 106 29 is_stmt 1              # fast_algorithms.c:106:29
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 106 39 is_stmt 0              # fast_algorithms.c:106:39
	movl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
	.loc	0 106 17                        # fast_algorithms.c:106:17
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 106 27                        # fast_algorithms.c:106:27
	movl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
	.loc	0 106 5                         # fast_algorithms.c:106:5
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 106 15                        # fast_algorithms.c:106:15
	movl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	0 105 29 is_stmt 1              # fast_algorithms.c:105:29
	movl	-88(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -88(%rbp)
	.loc	0 105 3 is_stmt 0               # fast_algorithms.c:105:3
	jmp	.LBB0_1
.Ltmp5:
.LBB0_4:                                # %for.end
	.loc	0 110 14 is_stmt 1              # fast_algorithms.c:110:14
	movq	-24(%rbp), %rax
	.loc	0 110 19 is_stmt 0              # fast_algorithms.c:110:19
	movl	136(%rax), %eax
	.loc	0 110 12                        # fast_algorithms.c:110:12
	movl	%eax, -252(%rbp)
	.loc	0 118 11 is_stmt 1              # fast_algorithms.c:118:11
	movq	-24(%rbp), %rax
	.loc	0 118 16 is_stmt 0              # fast_algorithms.c:118:16
	movq	312(%rax), %rax
	.loc	0 118 11                        # fast_algorithms.c:118:11
	movq	(%rax), %rax
	.loc	0 118 9                         # fast_algorithms.c:118:9
	movq	%rax, -200(%rbp)
	.loc	0 119 11 is_stmt 1              # fast_algorithms.c:119:11
	movq	-24(%rbp), %rax
	.loc	0 119 16 is_stmt 0              # fast_algorithms.c:119:16
	movq	312(%rax), %rax
	.loc	0 119 11                        # fast_algorithms.c:119:11
	movq	24(%rax), %rax
	.loc	0 119 9                         # fast_algorithms.c:119:9
	movq	%rax, -224(%rbp)
	.loc	0 120 11 is_stmt 1              # fast_algorithms.c:120:11
	movq	-24(%rbp), %rax
	.loc	0 120 16 is_stmt 0              # fast_algorithms.c:120:16
	movq	312(%rax), %rax
	.loc	0 120 11                        # fast_algorithms.c:120:11
	movq	40(%rax), %rax
	.loc	0 120 9                         # fast_algorithms.c:120:9
	movq	%rax, -240(%rbp)
	.loc	0 121 11 is_stmt 1              # fast_algorithms.c:121:11
	movq	-24(%rbp), %rax
	.loc	0 121 16 is_stmt 0              # fast_algorithms.c:121:16
	movq	312(%rax), %rax
	.loc	0 121 11                        # fast_algorithms.c:121:11
	movq	16(%rax), %rax
	.loc	0 121 9                         # fast_algorithms.c:121:9
	movq	%rax, -216(%rbp)
	.loc	0 122 11 is_stmt 1              # fast_algorithms.c:122:11
	movq	-24(%rbp), %rax
	.loc	0 122 16 is_stmt 0              # fast_algorithms.c:122:16
	movq	312(%rax), %rax
	.loc	0 122 11                        # fast_algorithms.c:122:11
	movq	48(%rax), %rax
	.loc	0 122 9                         # fast_algorithms.c:122:9
	movq	%rax, -248(%rbp)
	.loc	0 123 11 is_stmt 1              # fast_algorithms.c:123:11
	movq	-24(%rbp), %rax
	.loc	0 123 16 is_stmt 0              # fast_algorithms.c:123:16
	movq	312(%rax), %rax
	.loc	0 123 11                        # fast_algorithms.c:123:11
	movq	8(%rax), %rax
	.loc	0 123 9                         # fast_algorithms.c:123:9
	movq	%rax, -208(%rbp)
	.loc	0 124 11 is_stmt 1              # fast_algorithms.c:124:11
	movq	-24(%rbp), %rax
	.loc	0 124 16 is_stmt 0              # fast_algorithms.c:124:16
	movq	312(%rax), %rax
	.loc	0 124 11                        # fast_algorithms.c:124:11
	movq	32(%rax), %rax
	.loc	0 124 9                         # fast_algorithms.c:124:9
	movq	%rax, -232(%rbp)
	.loc	0 125 11 is_stmt 1              # fast_algorithms.c:125:11
	movq	-24(%rbp), %rax
	.loc	0 125 16 is_stmt 0              # fast_algorithms.c:125:16
	movq	368(%rax), %rax
	.loc	0 125 9                         # fast_algorithms.c:125:9
	movq	%rax, -168(%rbp)
.Ltmp6:
	.loc	0 126 10 is_stmt 1              # fast_algorithms.c:126:10
	movl	$1, -84(%rbp)
.LBB0_5:                                # %for.cond36
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
                                        #     Child Loop BB0_31 Depth 2
.Ltmp7:
	.loc	0 126 15 is_stmt 0              # fast_algorithms.c:126:15
	movl	-84(%rbp), %eax
	.loc	0 126 17                        # fast_algorithms.c:126:17
	cmpl	-12(%rbp), %eax
.Ltmp8:
	.loc	0 126 3                         # fast_algorithms.c:126:3
	jg	.LBB0_50
# %bb.6:                                # %for.body38
                                        #   in Loop: Header=BB0_5 Depth=1
.Ltmp9:
	.loc	0 127 13 is_stmt 1              # fast_algorithms.c:127:13
	movq	-64(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 127 11 is_stmt 0              # fast_algorithms.c:127:11
	movq	%rax, -104(%rbp)
	.loc	0 128 13 is_stmt 1              # fast_algorithms.c:128:13
	movq	-80(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 128 11 is_stmt 0              # fast_algorithms.c:128:11
	movq	%rax, -112(%rbp)
	.loc	0 129 13 is_stmt 1              # fast_algorithms.c:129:13
	movq	-72(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 129 11 is_stmt 0              # fast_algorithms.c:129:11
	movq	%rax, -120(%rbp)
	.loc	0 130 13 is_stmt 1              # fast_algorithms.c:130:13
	movq	-64(%rbp), %rax
	.loc	0 130 17 is_stmt 0              # fast_algorithms.c:130:17
	movl	-84(%rbp), %ecx
	.loc	0 130 18                        # fast_algorithms.c:130:18
	subl	$1, %ecx
	.loc	0 130 13                        # fast_algorithms.c:130:13
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 130 11                        # fast_algorithms.c:130:11
	movq	%rax, -144(%rbp)
	.loc	0 131 13 is_stmt 1              # fast_algorithms.c:131:13
	movq	-80(%rbp), %rax
	.loc	0 131 17 is_stmt 0              # fast_algorithms.c:131:17
	movl	-84(%rbp), %ecx
	.loc	0 131 18                        # fast_algorithms.c:131:18
	subl	$1, %ecx
	.loc	0 131 13                        # fast_algorithms.c:131:13
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 131 11                        # fast_algorithms.c:131:11
	movq	%rax, -192(%rbp)
	.loc	0 132 13 is_stmt 1              # fast_algorithms.c:132:13
	movq	-72(%rbp), %rax
	.loc	0 132 17 is_stmt 0              # fast_algorithms.c:132:17
	movl	-84(%rbp), %ecx
	.loc	0 132 18                        # fast_algorithms.c:132:18
	subl	$1, %ecx
	.loc	0 132 13                        # fast_algorithms.c:132:13
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 132 11                        # fast_algorithms.c:132:11
	movq	%rax, -160(%rbp)
	.loc	0 133 13 is_stmt 1              # fast_algorithms.c:133:13
	movq	-56(%rbp), %rax
	.loc	0 133 17 is_stmt 0              # fast_algorithms.c:133:17
	movl	-84(%rbp), %ecx
	.loc	0 133 18                        # fast_algorithms.c:133:18
	subl	$1, %ecx
	.loc	0 133 13                        # fast_algorithms.c:133:13
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	movl	(%rax), %eax
	.loc	0 133 11                        # fast_algorithms.c:133:11
	movl	%eax, -180(%rbp)
	.loc	0 134 13 is_stmt 1              # fast_algorithms.c:134:13
	movq	-24(%rbp), %rax
	.loc	0 134 18 is_stmt 0              # fast_algorithms.c:134:18
	movq	320(%rax), %rax
	.loc	0 134 28                        # fast_algorithms.c:134:28
	movq	-8(%rbp), %rcx
	movslq	-84(%rbp), %rdx
	.loc	0 134 22                        # fast_algorithms.c:134:22
	movsbl	(%rcx,%rdx), %ecx
	.loc	0 134 13                        # fast_algorithms.c:134:13
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 134 11                        # fast_algorithms.c:134:11
	movq	%rax, -128(%rbp)
	.loc	0 135 13 is_stmt 1              # fast_algorithms.c:135:13
	movq	-24(%rbp), %rax
	.loc	0 135 18 is_stmt 0              # fast_algorithms.c:135:18
	movq	328(%rax), %rax
	.loc	0 135 28                        # fast_algorithms.c:135:28
	movq	-8(%rbp), %rcx
	movslq	-84(%rbp), %rdx
	.loc	0 135 22                        # fast_algorithms.c:135:22
	movsbl	(%rcx,%rdx), %ecx
	.loc	0 135 13                        # fast_algorithms.c:135:13
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 135 11                        # fast_algorithms.c:135:11
	movq	%rax, -136(%rbp)
	.loc	0 136 5 is_stmt 1               # fast_algorithms.c:136:5
	movq	-104(%rbp), %rax
	.loc	0 136 11 is_stmt 0              # fast_algorithms.c:136:11
	movl	$-987654321, (%rax)             # imm = 0xC521974F
	.loc	0 137 5 is_stmt 1               # fast_algorithms.c:137:5
	movq	-112(%rbp), %rax
	.loc	0 137 11 is_stmt 0              # fast_algorithms.c:137:11
	movl	$-987654321, (%rax)             # imm = 0xC521974F
	.loc	0 138 5 is_stmt 1               # fast_algorithms.c:138:5
	movq	-120(%rbp), %rax
	.loc	0 138 11 is_stmt 0              # fast_algorithms.c:138:11
	movl	$-987654321, (%rax)             # imm = 0xC521974F
.Ltmp10:
	.loc	0 140 12 is_stmt 1              # fast_algorithms.c:140:12
	movl	$1, -88(%rbp)
.LBB0_7:                                # %for.cond69
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp11:
	.loc	0 140 17 is_stmt 0              # fast_algorithms.c:140:17
	movl	-88(%rbp), %eax
	.loc	0 140 19                        # fast_algorithms.c:140:19
	cmpl	-252(%rbp), %eax
.Ltmp12:
	.loc	0 140 5                         # fast_algorithms.c:140:5
	jg	.LBB0_28
# %bb.8:                                # %for.body72
                                        #   in Loop: Header=BB0_7 Depth=2
.Ltmp13:
	.loc	0 157 9 is_stmt 1               # fast_algorithms.c:157:9
	#APP
	xchgq	%r13, %r13
	#NO_APP
	.loc	0 158 17                        # fast_algorithms.c:158:17
	movq	-144(%rbp), %rax
	.loc	0 158 21 is_stmt 0              # fast_algorithms.c:158:21
	movl	-88(%rbp), %ecx
	.loc	0 158 22                        # fast_algorithms.c:158:22
	subl	$1, %ecx
	.loc	0 158 17                        # fast_algorithms.c:158:17
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %edx
	.loc	0 158 30                        # fast_algorithms.c:158:30
	movq	-200(%rbp), %rax
	.loc	0 158 35                        # fast_algorithms.c:158:35
	movl	-88(%rbp), %ecx
	.loc	0 158 36                        # fast_algorithms.c:158:36
	subl	$1, %ecx
	.loc	0 158 30                        # fast_algorithms.c:158:30
	movslq	%ecx, %rcx
	.loc	0 158 28                        # fast_algorithms.c:158:28
	addl	(%rax,%rcx,4), %edx
	.loc	0 158 9                         # fast_algorithms.c:158:9
	movq	-104(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 158 15                        # fast_algorithms.c:158:15
	movl	%edx, (%rax,%rcx,4)
.Ltmp14:
	.loc	0 159 19 is_stmt 1              # fast_algorithms.c:159:19
	movq	-160(%rbp), %rax
	.loc	0 159 22 is_stmt 0              # fast_algorithms.c:159:22
	movl	-88(%rbp), %ecx
	.loc	0 159 23                        # fast_algorithms.c:159:23
	subl	$1, %ecx
	.loc	0 159 19                        # fast_algorithms.c:159:19
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	0 159 30                        # fast_algorithms.c:159:30
	movq	-224(%rbp), %rcx
	.loc	0 159 35                        # fast_algorithms.c:159:35
	movl	-88(%rbp), %edx
	.loc	0 159 36                        # fast_algorithms.c:159:36
	subl	$1, %edx
	.loc	0 159 30                        # fast_algorithms.c:159:30
	movslq	%edx, %rdx
	.loc	0 159 28                        # fast_algorithms.c:159:28
	addl	(%rcx,%rdx,4), %eax
	.loc	0 159 17                        # fast_algorithms.c:159:17
	movl	%eax, -92(%rbp)
	.loc	0 159 43                        # fast_algorithms.c:159:43
	movq	-104(%rbp), %rcx
	movslq	-88(%rbp), %rdx
	.loc	0 159 41                        # fast_algorithms.c:159:41
	cmpl	(%rcx,%rdx,4), %eax
.Ltmp15:
	.loc	0 159 13                        # fast_algorithms.c:159:13
	jle	.LBB0_10
# %bb.9:                                # %if.then
                                        #   in Loop: Header=BB0_7 Depth=2
.Ltmp16:
	.loc	0 159 59                        # fast_algorithms.c:159:59
	movl	-92(%rbp), %edx
	.loc	0 159 51                        # fast_algorithms.c:159:51
	movq	-104(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 159 57                        # fast_algorithms.c:159:57
	movl	%edx, (%rax,%rcx,4)
.Ltmp17:
.LBB0_10:                               # %if.end
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 160 19 is_stmt 1              # fast_algorithms.c:160:19
	movq	-192(%rbp), %rax
	.loc	0 160 23 is_stmt 0              # fast_algorithms.c:160:23
	movl	-88(%rbp), %ecx
	.loc	0 160 24                        # fast_algorithms.c:160:24
	subl	$1, %ecx
	.loc	0 160 19                        # fast_algorithms.c:160:19
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	0 160 30                        # fast_algorithms.c:160:30
	movq	-240(%rbp), %rcx
	.loc	0 160 35                        # fast_algorithms.c:160:35
	movl	-88(%rbp), %edx
	.loc	0 160 36                        # fast_algorithms.c:160:36
	subl	$1, %edx
	.loc	0 160 30                        # fast_algorithms.c:160:30
	movslq	%edx, %rdx
	.loc	0 160 28                        # fast_algorithms.c:160:28
	addl	(%rcx,%rdx,4), %eax
	.loc	0 160 17                        # fast_algorithms.c:160:17
	movl	%eax, -92(%rbp)
	.loc	0 160 43                        # fast_algorithms.c:160:43
	movq	-104(%rbp), %rcx
	movslq	-88(%rbp), %rdx
	.loc	0 160 41                        # fast_algorithms.c:160:41
	cmpl	(%rcx,%rdx,4), %eax
.Ltmp18:
	.loc	0 160 13                        # fast_algorithms.c:160:13
	jle	.LBB0_12
# %bb.11:                               # %if.then105
                                        #   in Loop: Header=BB0_7 Depth=2
.Ltmp19:
	.loc	0 160 59                        # fast_algorithms.c:160:59
	movl	-92(%rbp), %edx
	.loc	0 160 51                        # fast_algorithms.c:160:51
	movq	-104(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 160 57                        # fast_algorithms.c:160:57
	movl	%edx, (%rax,%rcx,4)
.Ltmp20:
.LBB0_12:                               # %if.end108
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 161 19 is_stmt 1              # fast_algorithms.c:161:19
	movl	-180(%rbp), %eax
	.loc	0 161 26 is_stmt 0              # fast_algorithms.c:161:26
	movq	-168(%rbp), %rcx
	movslq	-88(%rbp), %rdx
	.loc	0 161 24                        # fast_algorithms.c:161:24
	addl	(%rcx,%rdx,4), %eax
	.loc	0 161 17                        # fast_algorithms.c:161:17
	movl	%eax, -92(%rbp)
	.loc	0 161 43                        # fast_algorithms.c:161:43
	movq	-104(%rbp), %rcx
	movslq	-88(%rbp), %rdx
	.loc	0 161 41                        # fast_algorithms.c:161:41
	cmpl	(%rcx,%rdx,4), %eax
.Ltmp21:
	.loc	0 161 13                        # fast_algorithms.c:161:13
	jle	.LBB0_14
# %bb.13:                               # %if.then116
                                        #   in Loop: Header=BB0_7 Depth=2
.Ltmp22:
	.loc	0 161 59                        # fast_algorithms.c:161:59
	movl	-92(%rbp), %edx
	.loc	0 161 51                        # fast_algorithms.c:161:51
	movq	-104(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 161 57                        # fast_algorithms.c:161:57
	movl	%edx, (%rax,%rcx,4)
.Ltmp23:
.LBB0_14:                               # %if.end119
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 162 18 is_stmt 1              # fast_algorithms.c:162:18
	movq	-128(%rbp), %rax
	movslq	-88(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	.loc	0 162 9 is_stmt 0               # fast_algorithms.c:162:9
	movq	-104(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 162 15                        # fast_algorithms.c:162:15
	addl	(%rax,%rcx,4), %edx
	movl	%edx, (%rax,%rcx,4)
.Ltmp24:
	.loc	0 163 13 is_stmt 1              # fast_algorithms.c:163:13
	movq	-104(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 163 19 is_stmt 0              # fast_algorithms.c:163:19
	cmpl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
.Ltmp25:
	.loc	0 163 13                        # fast_algorithms.c:163:13
	jge	.LBB0_16
# %bb.15:                               # %if.then129
                                        #   in Loop: Header=BB0_7 Depth=2
.Ltmp26:
	.loc	0 163 29                        # fast_algorithms.c:163:29
	movq	-104(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 163 35                        # fast_algorithms.c:163:35
	movl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
.Ltmp27:
.LBB0_16:                               # %if.end132
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 165 17 is_stmt 1              # fast_algorithms.c:165:17
	movq	-112(%rbp), %rax
	.loc	0 165 20 is_stmt 0              # fast_algorithms.c:165:20
	movl	-88(%rbp), %ecx
	.loc	0 165 21                        # fast_algorithms.c:165:21
	subl	$1, %ecx
	.loc	0 165 17                        # fast_algorithms.c:165:17
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %edx
	.loc	0 165 27                        # fast_algorithms.c:165:27
	movq	-248(%rbp), %rax
	.loc	0 165 32                        # fast_algorithms.c:165:32
	movl	-88(%rbp), %ecx
	.loc	0 165 33                        # fast_algorithms.c:165:33
	subl	$1, %ecx
	.loc	0 165 27                        # fast_algorithms.c:165:27
	movslq	%ecx, %rcx
	.loc	0 165 25                        # fast_algorithms.c:165:25
	addl	(%rax,%rcx,4), %edx
	.loc	0 165 9                         # fast_algorithms.c:165:9
	movq	-112(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 165 15                        # fast_algorithms.c:165:15
	movl	%edx, (%rax,%rcx,4)
.Ltmp28:
	.loc	0 166 19 is_stmt 1              # fast_algorithms.c:166:19
	movq	-104(%rbp), %rax
	.loc	0 166 22 is_stmt 0              # fast_algorithms.c:166:22
	movl	-88(%rbp), %ecx
	.loc	0 166 23                        # fast_algorithms.c:166:23
	subl	$1, %ecx
	.loc	0 166 19                        # fast_algorithms.c:166:19
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	0 166 29                        # fast_algorithms.c:166:29
	movq	-216(%rbp), %rcx
	.loc	0 166 34                        # fast_algorithms.c:166:34
	movl	-88(%rbp), %edx
	.loc	0 166 35                        # fast_algorithms.c:166:35
	subl	$1, %edx
	.loc	0 166 29                        # fast_algorithms.c:166:29
	movslq	%edx, %rdx
	.loc	0 166 27                        # fast_algorithms.c:166:27
	addl	(%rcx,%rdx,4), %eax
	.loc	0 166 17                        # fast_algorithms.c:166:17
	movl	%eax, -92(%rbp)
	.loc	0 166 42                        # fast_algorithms.c:166:42
	movq	-112(%rbp), %rcx
	movslq	-88(%rbp), %rdx
	.loc	0 166 40                        # fast_algorithms.c:166:40
	cmpl	(%rcx,%rdx,4), %eax
.Ltmp29:
	.loc	0 166 13                        # fast_algorithms.c:166:13
	jle	.LBB0_18
# %bb.17:                               # %if.then153
                                        #   in Loop: Header=BB0_7 Depth=2
.Ltmp30:
	.loc	0 166 57                        # fast_algorithms.c:166:57
	movl	-92(%rbp), %edx
	.loc	0 166 49                        # fast_algorithms.c:166:49
	movq	-112(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 166 55                        # fast_algorithms.c:166:55
	movl	%edx, (%rax,%rcx,4)
.Ltmp31:
.LBB0_18:                               # %if.end156
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 167 13 is_stmt 1              # fast_algorithms.c:167:13
	movq	-112(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 167 19 is_stmt 0              # fast_algorithms.c:167:19
	cmpl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
.Ltmp32:
	.loc	0 167 13                        # fast_algorithms.c:167:13
	jge	.LBB0_20
# %bb.19:                               # %if.then161
                                        #   in Loop: Header=BB0_7 Depth=2
.Ltmp33:
	.loc	0 167 29                        # fast_algorithms.c:167:29
	movq	-112(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 167 35                        # fast_algorithms.c:167:35
	movl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
.Ltmp34:
.LBB0_20:                               # %if.end164
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 168 9 is_stmt 1               # fast_algorithms.c:168:9
	#APP
	xchgq	%r13, %r13
	#NO_APP
.Ltmp35:
	.loc	0 171 13                        # fast_algorithms.c:171:13
	movl	-88(%rbp), %eax
	.loc	0 171 15 is_stmt 0              # fast_algorithms.c:171:15
	cmpl	-252(%rbp), %eax
.Ltmp36:
	.loc	0 171 13                        # fast_algorithms.c:171:13
	jge	.LBB0_26
# %bb.21:                               # %if.then167
                                        #   in Loop: Header=BB0_7 Depth=2
.Ltmp37:
	.loc	0 172 21 is_stmt 1              # fast_algorithms.c:172:21
	movq	-144(%rbp), %rax
	movslq	-88(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	.loc	0 172 30 is_stmt 0              # fast_algorithms.c:172:30
	movq	-208(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 172 28                        # fast_algorithms.c:172:28
	addl	(%rax,%rcx,4), %edx
	.loc	0 172 13                        # fast_algorithms.c:172:13
	movq	-120(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 172 19                        # fast_algorithms.c:172:19
	movl	%edx, (%rax,%rcx,4)
.Ltmp38:
	.loc	0 173 23 is_stmt 1              # fast_algorithms.c:173:23
	movq	-160(%rbp), %rax
	movslq	-88(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	0 173 31 is_stmt 0              # fast_algorithms.c:173:31
	movq	-232(%rbp), %rcx
	movslq	-88(%rbp), %rdx
	.loc	0 173 29                        # fast_algorithms.c:173:29
	addl	(%rcx,%rdx,4), %eax
	.loc	0 173 21                        # fast_algorithms.c:173:21
	movl	%eax, -92(%rbp)
	.loc	0 173 42                        # fast_algorithms.c:173:42
	movq	-120(%rbp), %rcx
	movslq	-88(%rbp), %rdx
	.loc	0 173 40                        # fast_algorithms.c:173:40
	cmpl	(%rcx,%rdx,4), %eax
.Ltmp39:
	.loc	0 173 17                        # fast_algorithms.c:173:17
	jle	.LBB0_23
# %bb.22:                               # %if.then184
                                        #   in Loop: Header=BB0_7 Depth=2
.Ltmp40:
	.loc	0 173 57                        # fast_algorithms.c:173:57
	movl	-92(%rbp), %edx
	.loc	0 173 49                        # fast_algorithms.c:173:49
	movq	-120(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 173 55                        # fast_algorithms.c:173:55
	movl	%edx, (%rax,%rcx,4)
.Ltmp41:
.LBB0_23:                               # %if.end187
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 174 22 is_stmt 1              # fast_algorithms.c:174:22
	movq	-136(%rbp), %rax
	movslq	-88(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	.loc	0 174 13 is_stmt 0              # fast_algorithms.c:174:13
	movq	-120(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 174 19                        # fast_algorithms.c:174:19
	addl	(%rax,%rcx,4), %edx
	movl	%edx, (%rax,%rcx,4)
.Ltmp42:
	.loc	0 175 17 is_stmt 1              # fast_algorithms.c:175:17
	movq	-120(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 175 23 is_stmt 0              # fast_algorithms.c:175:23
	cmpl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
.Ltmp43:
	.loc	0 175 17                        # fast_algorithms.c:175:17
	jge	.LBB0_25
# %bb.24:                               # %if.then197
                                        #   in Loop: Header=BB0_7 Depth=2
.Ltmp44:
	.loc	0 175 33                        # fast_algorithms.c:175:33
	movq	-120(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 175 39                        # fast_algorithms.c:175:39
	movl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
.Ltmp45:
.LBB0_25:                               # %if.end200
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 176 9 is_stmt 1               # fast_algorithms.c:176:9
	jmp	.LBB0_26
.Ltmp46:
.LBB0_26:                               # %if.end201
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 177 5                         # fast_algorithms.c:177:5
	jmp	.LBB0_27
.Ltmp47:
.LBB0_27:                               # %for.inc202
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 140 26                        # fast_algorithms.c:140:26
	movl	-88(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -88(%rbp)
	.loc	0 140 5 is_stmt 0               # fast_algorithms.c:140:5
	jmp	.LBB0_7
.Ltmp48:
.LBB0_28:                               # %for.end204
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 183 5 is_stmt 1               # fast_algorithms.c:183:5
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 183 17 is_stmt 0              # fast_algorithms.c:183:17
	movl	$-987654321, 16(%rax)           # imm = 0xC521974F
.Ltmp49:
	.loc	0 184 15 is_stmt 1              # fast_algorithms.c:184:15
	movq	-56(%rbp), %rax
	.loc	0 184 19 is_stmt 0              # fast_algorithms.c:184:19
	movl	-84(%rbp), %ecx
	.loc	0 184 20                        # fast_algorithms.c:184:20
	subl	$1, %ecx
	.loc	0 184 15                        # fast_algorithms.c:184:15
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	movl	16(%rax), %eax
	.loc	0 184 31                        # fast_algorithms.c:184:31
	movq	-24(%rbp), %rcx
	.loc	0 184 29                        # fast_algorithms.c:184:29
	addl	340(%rcx), %eax
	.loc	0 184 13                        # fast_algorithms.c:184:13
	movl	%eax, -92(%rbp)
	.loc	0 184 52                        # fast_algorithms.c:184:52
	cmpl	$-987654321, %eax               # imm = 0xC521974F
.Ltmp50:
	.loc	0 184 9                         # fast_algorithms.c:184:9
	jle	.LBB0_30
# %bb.29:                               # %if.then218
                                        #   in Loop: Header=BB0_5 Depth=1
.Ltmp51:
	.loc	0 185 21 is_stmt 1              # fast_algorithms.c:185:21
	movl	-92(%rbp), %ecx
	.loc	0 185 7 is_stmt 0               # fast_algorithms.c:185:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 185 19                        # fast_algorithms.c:185:19
	movl	%ecx, 16(%rax)
.Ltmp52:
.LBB0_30:                               # %if.end222
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 188 9 is_stmt 1               # fast_algorithms.c:188:9
	movl	$-987654321, -184(%rbp)         # imm = 0xC521974F
	.loc	0 189 11                        # fast_algorithms.c:189:11
	movq	-64(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 189 9 is_stmt 0               # fast_algorithms.c:189:9
	movq	%rax, -152(%rbp)
	.loc	0 190 11 is_stmt 1              # fast_algorithms.c:190:11
	movq	-24(%rbp), %rax
	.loc	0 190 16 is_stmt 0              # fast_algorithms.c:190:16
	movq	376(%rax), %rax
	.loc	0 190 9                         # fast_algorithms.c:190:9
	movq	%rax, -176(%rbp)
.Ltmp53:
	.loc	0 191 12 is_stmt 1              # fast_algorithms.c:191:12
	movl	$1, -88(%rbp)
.LBB0_31:                               # %for.cond225
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp54:
	.loc	0 191 17 is_stmt 0              # fast_algorithms.c:191:17
	movl	-88(%rbp), %eax
	.loc	0 191 22                        # fast_algorithms.c:191:22
	movq	-24(%rbp), %rcx
	.loc	0 191 19                        # fast_algorithms.c:191:19
	cmpl	136(%rcx), %eax
.Ltmp55:
	.loc	0 191 5                         # fast_algorithms.c:191:5
	jg	.LBB0_36
# %bb.32:                               # %for.body229
                                        #   in Loop: Header=BB0_31 Depth=2
.Ltmp56:
	.loc	0 192 18 is_stmt 1              # fast_algorithms.c:192:18
	movq	-152(%rbp), %rax
	movslq	-88(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	0 192 27 is_stmt 0              # fast_algorithms.c:192:27
	movq	-176(%rbp), %rcx
	movslq	-88(%rbp), %rdx
	.loc	0 192 25                        # fast_algorithms.c:192:25
	addl	(%rcx,%rdx,4), %eax
	.loc	0 192 15                        # fast_algorithms.c:192:15
	movl	%eax, -92(%rbp)
	.loc	0 192 34                        # fast_algorithms.c:192:34
	cmpl	-184(%rbp), %eax
.Ltmp57:
	.loc	0 192 11                        # fast_algorithms.c:192:11
	jle	.LBB0_34
# %bb.33:                               # %if.then237
                                        #   in Loop: Header=BB0_31 Depth=2
.Ltmp58:
	.loc	0 192 47                        # fast_algorithms.c:192:47
	movl	-92(%rbp), %eax
	.loc	0 192 45                        # fast_algorithms.c:192:45
	movl	%eax, -184(%rbp)
.LBB0_34:                               # %if.end238
                                        #   in Loop: Header=BB0_31 Depth=2
	.loc	0 192 36                        # fast_algorithms.c:192:36
	jmp	.LBB0_35
.Ltmp59:
.LBB0_35:                               # %for.inc239
                                        #   in Loop: Header=BB0_31 Depth=2
	.loc	0 191 31 is_stmt 1              # fast_algorithms.c:191:31
	movl	-88(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -88(%rbp)
	.loc	0 191 5 is_stmt 0               # fast_algorithms.c:191:5
	jmp	.LBB0_31
.Ltmp60:
.LBB0_36:                               # %for.end241
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 193 19 is_stmt 1              # fast_algorithms.c:193:19
	movl	-184(%rbp), %ecx
	.loc	0 193 5 is_stmt 0               # fast_algorithms.c:193:5
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 193 17                        # fast_algorithms.c:193:17
	movl	%ecx, 4(%rax)
	.loc	0 195 5 is_stmt 1               # fast_algorithms.c:195:5
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 195 17 is_stmt 0              # fast_algorithms.c:195:17
	movl	$-987654321, 12(%rax)           # imm = 0xC521974F
.Ltmp61:
	.loc	0 196 15 is_stmt 1              # fast_algorithms.c:196:15
	movq	-56(%rbp), %rax
	.loc	0 196 19 is_stmt 0              # fast_algorithms.c:196:19
	movl	-84(%rbp), %ecx
	.loc	0 196 20                        # fast_algorithms.c:196:20
	subl	$1, %ecx
	.loc	0 196 15                        # fast_algorithms.c:196:15
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	movl	12(%rax), %eax
	.loc	0 196 31                        # fast_algorithms.c:196:31
	movq	-24(%rbp), %rcx
	.loc	0 196 29                        # fast_algorithms.c:196:29
	addl	364(%rcx), %eax
	.loc	0 196 13                        # fast_algorithms.c:196:13
	movl	%eax, -92(%rbp)
	.loc	0 196 52                        # fast_algorithms.c:196:52
	cmpl	$-987654321, %eax               # imm = 0xC521974F
.Ltmp62:
	.loc	0 196 9                         # fast_algorithms.c:196:9
	jle	.LBB0_38
# %bb.37:                               # %if.then258
                                        #   in Loop: Header=BB0_5 Depth=1
.Ltmp63:
	.loc	0 197 21 is_stmt 1              # fast_algorithms.c:197:21
	movl	-92(%rbp), %ecx
	.loc	0 197 7 is_stmt 0               # fast_algorithms.c:197:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 197 19                        # fast_algorithms.c:197:19
	movl	%ecx, 12(%rax)
.Ltmp64:
.LBB0_38:                               # %if.end262
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 198 15 is_stmt 1              # fast_algorithms.c:198:15
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	4(%rax), %eax
	.loc	0 198 31 is_stmt 0              # fast_algorithms.c:198:31
	movq	-24(%rbp), %rcx
	.loc	0 198 29                        # fast_algorithms.c:198:29
	addl	348(%rcx), %eax
	.loc	0 198 13                        # fast_algorithms.c:198:13
	movl	%eax, -92(%rbp)
	.loc	0 198 54                        # fast_algorithms.c:198:54
	movq	-56(%rbp), %rcx
	movslq	-84(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	.loc	0 198 52                        # fast_algorithms.c:198:52
	cmpl	12(%rcx), %eax
.Ltmp65:
	.loc	0 198 9                         # fast_algorithms.c:198:9
	jle	.LBB0_40
# %bb.39:                               # %if.then275
                                        #   in Loop: Header=BB0_5 Depth=1
.Ltmp66:
	.loc	0 199 21 is_stmt 1              # fast_algorithms.c:199:21
	movl	-92(%rbp), %ecx
	.loc	0 199 7 is_stmt 0               # fast_algorithms.c:199:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 199 19                        # fast_algorithms.c:199:19
	movl	%ecx, 12(%rax)
.Ltmp67:
.LBB0_40:                               # %if.end279
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 202 5 is_stmt 1               # fast_algorithms.c:202:5
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 202 17 is_stmt 0              # fast_algorithms.c:202:17
	movl	$-987654321, (%rax)             # imm = 0xC521974F
.Ltmp68:
	.loc	0 203 15 is_stmt 1              # fast_algorithms.c:203:15
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	16(%rax), %eax
	.loc	0 203 29 is_stmt 0              # fast_algorithms.c:203:29
	movq	-24(%rbp), %rcx
	.loc	0 203 27                        # fast_algorithms.c:203:27
	addl	336(%rcx), %eax
	.loc	0 203 13                        # fast_algorithms.c:203:13
	movl	%eax, -92(%rbp)
	.loc	0 203 50                        # fast_algorithms.c:203:50
	cmpl	$-987654321, %eax               # imm = 0xC521974F
.Ltmp69:
	.loc	0 203 9                         # fast_algorithms.c:203:9
	jle	.LBB0_42
# %bb.41:                               # %if.then292
                                        #   in Loop: Header=BB0_5 Depth=1
.Ltmp70:
	.loc	0 204 21 is_stmt 1              # fast_algorithms.c:204:21
	movl	-92(%rbp), %ecx
	.loc	0 204 7 is_stmt 0               # fast_algorithms.c:204:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 204 19                        # fast_algorithms.c:204:19
	movl	%ecx, (%rax)
.Ltmp71:
.LBB0_42:                               # %if.end296
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 205 15 is_stmt 1              # fast_algorithms.c:205:15
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	12(%rax), %eax
	.loc	0 205 29 is_stmt 0              # fast_algorithms.c:205:29
	movq	-24(%rbp), %rcx
	.loc	0 205 27                        # fast_algorithms.c:205:27
	addl	360(%rcx), %eax
	.loc	0 205 13                        # fast_algorithms.c:205:13
	movl	%eax, -92(%rbp)
	.loc	0 205 52                        # fast_algorithms.c:205:52
	movq	-56(%rbp), %rcx
	movslq	-84(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	.loc	0 205 50                        # fast_algorithms.c:205:50
	cmpl	(%rcx), %eax
.Ltmp72:
	.loc	0 205 9                         # fast_algorithms.c:205:9
	jle	.LBB0_44
# %bb.43:                               # %if.then309
                                        #   in Loop: Header=BB0_5 Depth=1
.Ltmp73:
	.loc	0 206 21 is_stmt 1              # fast_algorithms.c:206:21
	movl	-92(%rbp), %ecx
	.loc	0 206 7 is_stmt 0               # fast_algorithms.c:206:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 206 19                        # fast_algorithms.c:206:19
	movl	%ecx, (%rax)
.Ltmp74:
.LBB0_44:                               # %if.end313
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 209 5 is_stmt 1               # fast_algorithms.c:209:5
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 209 17 is_stmt 0              # fast_algorithms.c:209:17
	movl	$-987654321, 8(%rax)            # imm = 0xC521974F
.Ltmp75:
	.loc	0 210 15 is_stmt 1              # fast_algorithms.c:210:15
	movq	-56(%rbp), %rax
	.loc	0 210 19 is_stmt 0              # fast_algorithms.c:210:19
	movl	-84(%rbp), %ecx
	.loc	0 210 20                        # fast_algorithms.c:210:20
	subl	$1, %ecx
	.loc	0 210 15                        # fast_algorithms.c:210:15
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	movl	8(%rax), %eax
	.loc	0 210 31                        # fast_algorithms.c:210:31
	movq	-24(%rbp), %rcx
	.loc	0 210 29                        # fast_algorithms.c:210:29
	addl	356(%rcx), %eax
	.loc	0 210 13                        # fast_algorithms.c:210:13
	movl	%eax, -92(%rbp)
	.loc	0 210 52                        # fast_algorithms.c:210:52
	cmpl	$-987654321, %eax               # imm = 0xC521974F
.Ltmp76:
	.loc	0 210 9                         # fast_algorithms.c:210:9
	jle	.LBB0_46
# %bb.45:                               # %if.then327
                                        #   in Loop: Header=BB0_5 Depth=1
.Ltmp77:
	.loc	0 211 21 is_stmt 1              # fast_algorithms.c:211:21
	movl	-92(%rbp), %ecx
	.loc	0 211 7 is_stmt 0               # fast_algorithms.c:211:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 211 19                        # fast_algorithms.c:211:19
	movl	%ecx, 8(%rax)
.Ltmp78:
.LBB0_46:                               # %if.end331
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 212 15 is_stmt 1              # fast_algorithms.c:212:15
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	4(%rax), %eax
	.loc	0 212 29 is_stmt 0              # fast_algorithms.c:212:29
	movq	-24(%rbp), %rcx
	.loc	0 212 27                        # fast_algorithms.c:212:27
	addl	344(%rcx), %eax
	.loc	0 212 13                        # fast_algorithms.c:212:13
	movl	%eax, -92(%rbp)
	.loc	0 212 52                        # fast_algorithms.c:212:52
	movq	-56(%rbp), %rcx
	movslq	-84(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	.loc	0 212 50                        # fast_algorithms.c:212:50
	cmpl	8(%rcx), %eax
.Ltmp79:
	.loc	0 212 9                         # fast_algorithms.c:212:9
	jle	.LBB0_48
# %bb.47:                               # %if.then344
                                        #   in Loop: Header=BB0_5 Depth=1
.Ltmp80:
	.loc	0 213 21 is_stmt 1              # fast_algorithms.c:213:21
	movl	-92(%rbp), %ecx
	.loc	0 213 7 is_stmt 0               # fast_algorithms.c:213:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 213 19                        # fast_algorithms.c:213:19
	movl	%ecx, 8(%rax)
.Ltmp81:
.LBB0_48:                               # %if.end348
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 214 3 is_stmt 1               # fast_algorithms.c:214:3
	jmp	.LBB0_49
.Ltmp82:
.LBB0_49:                               # %for.inc349
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 126 24                        # fast_algorithms.c:126:24
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
	.loc	0 126 3 is_stmt 0               # fast_algorithms.c:126:3
	jmp	.LBB0_5
.Ltmp83:
.LBB0_50:                               # %for.end351
	.loc	0 216 8 is_stmt 1               # fast_algorithms.c:216:8
	movq	-56(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	8(%rax), %eax
	.loc	0 216 22 is_stmt 0              # fast_algorithms.c:216:22
	movq	-24(%rbp), %rcx
	.loc	0 216 20                        # fast_algorithms.c:216:20
	addl	352(%rcx), %eax
	.loc	0 216 6                         # fast_algorithms.c:216:6
	movl	%eax, -92(%rbp)
.Ltmp84:
	.loc	0 218 14 is_stmt 1              # fast_algorithms.c:218:14
	cmpq	$0, -40(%rbp)
.Ltmp85:
	.loc	0 218 7 is_stmt 0               # fast_algorithms.c:218:7
	je	.LBB0_52
# %bb.51:                               # %if.then361
.Ltmp86:
	.loc	0 219 20 is_stmt 1              # fast_algorithms.c:219:20
	movq	-24(%rbp), %rdi
	.loc	0 219 25 is_stmt 0              # fast_algorithms.c:219:25
	movq	-8(%rbp), %rsi
	.loc	0 219 30                        # fast_algorithms.c:219:30
	movl	-12(%rbp), %edx
	.loc	0 219 33                        # fast_algorithms.c:219:33
	movq	-32(%rbp), %rcx
	.loc	0 219 5                         # fast_algorithms.c:219:5
	leaq	-48(%rbp), %r8
	callq	P7ViterbiTrace
	.loc	0 220 15 is_stmt 1              # fast_algorithms.c:220:15
	movq	-48(%rbp), %rcx
	.loc	0 220 6 is_stmt 0               # fast_algorithms.c:220:6
	movq	-40(%rbp), %rax
	.loc	0 220 13                        # fast_algorithms.c:220:13
	movq	%rcx, (%rax)
.Ltmp87:
.LBB0_52:                               # %if.end362
	.loc	0 223 18 is_stmt 1              # fast_algorithms.c:223:18
	movl	-92(%rbp), %edi
	.loc	0 223 10 is_stmt 0              # fast_algorithms.c:223:10
	callq	Scorify
	.loc	0 223 3                         # fast_algorithms.c:223:3
	addq	$272, %rsp                      # imm = 0x110
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp88:
.Lfunc_end0:
	.size	P7Viterbi, .Lfunc_end0-P7Viterbi
	.cfi_endproc
                                        # -- End function
	.file	1 "." "structs.h" md5 0xc0b2592c6453f33fb94e12cad3b97de1
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	37                              # DW_FORM_strx1
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	114                             # DW_AT_str_offsets_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	37                              # DW_FORM_strx1
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	115                             # DW_AT_addr_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	5                               # DW_FORM_data2
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	56                              # DW_AT_data_member_location
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	56                              # DW_AT_data_member_location
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	14                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	15                              # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	56                              # DW_AT_data_member_location
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0x49e DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.short	12                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.long	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.long	.Laddr_table_base0              # DW_AT_addr_base
	.byte	2                               # Abbrev [2] 0x23:0x4 DW_TAG_base_type
	.byte	3                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x27:0x1 DW_TAG_pointer_type
	.byte	4                               # Abbrev [4] 0x28:0x1a0 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	69                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	456                             # DW_AT_type
                                        # DW_AT_external
	.byte	5                               # Abbrev [5] 0x37:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	69                              # DW_AT_decl_line
	.long	460                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x42:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	116
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	69                              # DW_AT_decl_line
	.long	35                              # DW_AT_type
	.byte	5                               # Abbrev [5] 0x4d:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	104
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	69                              # DW_AT_decl_line
	.long	469                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x58:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	96
	.byte	60                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	69                              # DW_AT_decl_line
	.long	1004                            # DW_AT_type
	.byte	5                               # Abbrev [5] 0x63:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	88
	.byte	74                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	69                              # DW_AT_decl_line
	.long	1136                            # DW_AT_type
	.byte	6                               # Abbrev [6] 0x6e:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	80
	.byte	80                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	78                              # DW_AT_decl_line
	.long	1141                            # DW_AT_type
	.byte	6                               # Abbrev [6] 0x79:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	72
	.byte	61                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	79                              # DW_AT_decl_line
	.long	981                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x84:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	64
	.byte	62                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	80                              # DW_AT_decl_line
	.long	981                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x8f:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	63                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	81                              # DW_AT_decl_line
	.long	981                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x9b:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	64                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	82                              # DW_AT_decl_line
	.long	981                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0xa7:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\254\177"
	.byte	81                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	83                              # DW_AT_decl_line
	.long	35                              # DW_AT_type
	.byte	6                               # Abbrev [6] 0xb3:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	82                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	83                              # DW_AT_decl_line
	.long	35                              # DW_AT_type
	.byte	6                               # Abbrev [6] 0xbf:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.byte	83                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	84                              # DW_AT_decl_line
	.long	35                              # DW_AT_type
	.byte	6                               # Abbrev [6] 0xcb:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.byte	84                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	85                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0xd7:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.byte	85                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	85                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0xe3:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\210\177"
	.byte	86                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	85                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0xef:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\200\177"
	.byte	87                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	86                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0xfb:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\370~"
	.byte	88                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	86                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x107:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\360~"
	.byte	89                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	87                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x113:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\350~"
	.byte	90                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	87                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x11f:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\340~"
	.byte	91                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	87                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x12b:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\330~"
	.byte	92                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	88                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x137:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\320~"
	.byte	93                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	89                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x143:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\314~"
	.byte	94                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	90                              # DW_AT_decl_line
	.long	35                              # DW_AT_type
	.byte	6                               # Abbrev [6] 0x14f:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\310~"
	.byte	95                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	91                              # DW_AT_decl_line
	.long	35                              # DW_AT_type
	.byte	6                               # Abbrev [6] 0x15b:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\300~"
	.byte	96                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	92                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x167:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\270~"
	.byte	97                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	93                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x173:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\260~"
	.byte	98                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	93                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x17f:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\250~"
	.byte	99                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	93                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x18b:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\240~"
	.byte	100                             # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	93                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x197:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\230~"
	.byte	101                             # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	93                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x1a3:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\220~"
	.byte	102                             # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	93                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x1af:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\210~"
	.byte	103                             # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	93                              # DW_AT_decl_line
	.long	932                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x1bb:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\204~"
	.byte	30                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	94                              # DW_AT_decl_line
	.long	35                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	2                               # Abbrev [2] 0x1c8:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x1cc:0x5 DW_TAG_pointer_type
	.long	465                             # DW_AT_type
	.byte	2                               # Abbrev [2] 0x1d1:0x4 DW_TAG_base_type
	.byte	7                               # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x1d5:0x5 DW_TAG_pointer_type
	.long	474                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x1da:0x1ca DW_TAG_structure_type
	.byte	59                              # DW_AT_name
	.short	464                             # DW_AT_byte_size
	.byte	1                               # DW_AT_decl_file
	.byte	101                             # DW_AT_decl_line
	.byte	9                               # Abbrev [9] 0x1e0:0x9 DW_TAG_member
	.byte	10                              # DW_AT_name
	.long	460                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	113                             # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x1e9:0x9 DW_TAG_member
	.byte	11                              # DW_AT_name
	.long	460                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	114                             # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x1f2:0x9 DW_TAG_member
	.byte	12                              # DW_AT_name
	.long	460                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	115                             # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x1fb:0x9 DW_TAG_member
	.byte	13                              # DW_AT_name
	.long	460                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	116                             # DW_AT_decl_line
	.byte	24                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x204:0x9 DW_TAG_member
	.byte	14                              # DW_AT_name
	.long	460                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	117                             # DW_AT_decl_line
	.byte	32                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x20d:0x9 DW_TAG_member
	.byte	15                              # DW_AT_name
	.long	460                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	118                             # DW_AT_decl_line
	.byte	40                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x216:0x9 DW_TAG_member
	.byte	16                              # DW_AT_name
	.long	460                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	119                             # DW_AT_decl_line
	.byte	48                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x21f:0x9 DW_TAG_member
	.byte	17                              # DW_AT_name
	.long	35                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	120                             # DW_AT_decl_line
	.byte	56                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x228:0x9 DW_TAG_member
	.byte	18                              # DW_AT_name
	.long	460                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	121                             # DW_AT_decl_line
	.byte	64                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x231:0x9 DW_TAG_member
	.byte	19                              # DW_AT_name
	.long	932                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	122                             # DW_AT_decl_line
	.byte	72                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x23a:0x9 DW_TAG_member
	.byte	20                              # DW_AT_name
	.long	35                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	123                             # DW_AT_decl_line
	.byte	80                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x243:0x9 DW_TAG_member
	.byte	21                              # DW_AT_name
	.long	932                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	134                             # DW_AT_decl_line
	.byte	88                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x24c:0x9 DW_TAG_member
	.byte	22                              # DW_AT_name
	.long	932                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	135                             # DW_AT_decl_line
	.byte	96                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x255:0x9 DW_TAG_member
	.byte	23                              # DW_AT_name
	.long	932                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	136                             # DW_AT_decl_line
	.byte	104                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x25e:0x9 DW_TAG_member
	.byte	24                              # DW_AT_name
	.long	456                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	144                             # DW_AT_decl_line
	.byte	112                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x267:0x9 DW_TAG_member
	.byte	25                              # DW_AT_name
	.long	456                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	144                             # DW_AT_decl_line
	.byte	116                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x270:0x9 DW_TAG_member
	.byte	26                              # DW_AT_name
	.long	456                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	145                             # DW_AT_decl_line
	.byte	120                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x279:0x9 DW_TAG_member
	.byte	27                              # DW_AT_name
	.long	456                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	145                             # DW_AT_decl_line
	.byte	124                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x282:0x9 DW_TAG_member
	.byte	28                              # DW_AT_name
	.long	456                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	146                             # DW_AT_decl_line
	.byte	128                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x28b:0x9 DW_TAG_member
	.byte	29                              # DW_AT_name
	.long	456                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	146                             # DW_AT_decl_line
	.byte	132                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x294:0x9 DW_TAG_member
	.byte	30                              # DW_AT_name
	.long	35                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	155                             # DW_AT_decl_line
	.byte	136                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x29d:0x9 DW_TAG_member
	.byte	31                              # DW_AT_name
	.long	937                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	156                             # DW_AT_decl_line
	.byte	144                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x2a6:0x9 DW_TAG_member
	.byte	32                              # DW_AT_name
	.long	937                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	157                             # DW_AT_decl_line
	.byte	152                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x2af:0x9 DW_TAG_member
	.byte	33                              # DW_AT_name
	.long	937                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	158                             # DW_AT_decl_line
	.byte	160                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x2b8:0x9 DW_TAG_member
	.byte	34                              # DW_AT_name
	.long	456                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	159                             # DW_AT_decl_line
	.byte	168                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x2c1:0x9 DW_TAG_member
	.byte	35                              # DW_AT_name
	.long	947                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	168                             # DW_AT_decl_line
	.byte	172                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x2ca:0x9 DW_TAG_member
	.byte	37                              # DW_AT_name
	.long	942                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	169                             # DW_AT_decl_line
	.byte	208                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x2d3:0x9 DW_TAG_member
	.byte	38                              # DW_AT_name
	.long	942                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	170                             # DW_AT_decl_line
	.byte	216                             # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x2dc:0x9 DW_TAG_member
	.byte	39                              # DW_AT_name
	.long	969                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	174                             # DW_AT_decl_line
	.byte	224                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x2e5:0xa DW_TAG_member
	.byte	40                              # DW_AT_name
	.long	456                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	175                             # DW_AT_decl_line
	.short	304                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x2ef:0xa DW_TAG_member
	.byte	41                              # DW_AT_name
	.long	981                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	197                             # DW_AT_decl_line
	.short	312                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x2f9:0xa DW_TAG_member
	.byte	42                              # DW_AT_name
	.long	981                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	198                             # DW_AT_decl_line
	.short	320                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x303:0xa DW_TAG_member
	.byte	43                              # DW_AT_name
	.long	981                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	199                             # DW_AT_decl_line
	.short	328                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x30d:0xa DW_TAG_member
	.byte	44                              # DW_AT_name
	.long	986                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	200                             # DW_AT_decl_line
	.short	336                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x317:0xa DW_TAG_member
	.byte	45                              # DW_AT_name
	.long	932                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	201                             # DW_AT_decl_line
	.short	368                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x321:0xa DW_TAG_member
	.byte	46                              # DW_AT_name
	.long	932                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	202                             # DW_AT_decl_line
	.short	376                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x32b:0xa DW_TAG_member
	.byte	47                              # DW_AT_name
	.long	932                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	203                             # DW_AT_decl_line
	.short	384                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x335:0xa DW_TAG_member
	.byte	48                              # DW_AT_name
	.long	932                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	203                             # DW_AT_decl_line
	.short	392                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x33f:0xa DW_TAG_member
	.byte	49                              # DW_AT_name
	.long	932                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	203                             # DW_AT_decl_line
	.short	400                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x349:0xa DW_TAG_member
	.byte	50                              # DW_AT_name
	.long	932                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	203                             # DW_AT_decl_line
	.short	408                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x353:0xa DW_TAG_member
	.byte	51                              # DW_AT_name
	.long	932                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	203                             # DW_AT_decl_line
	.short	416                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x35d:0xa DW_TAG_member
	.byte	52                              # DW_AT_name
	.long	981                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	214                             # DW_AT_decl_line
	.short	424                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x367:0xa DW_TAG_member
	.byte	53                              # DW_AT_name
	.long	981                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	215                             # DW_AT_decl_line
	.short	432                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x371:0xa DW_TAG_member
	.byte	54                              # DW_AT_name
	.long	35                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	216                             # DW_AT_decl_line
	.short	440                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x37b:0xa DW_TAG_member
	.byte	55                              # DW_AT_name
	.long	35                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	217                             # DW_AT_decl_line
	.short	444                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x385:0xa DW_TAG_member
	.byte	56                              # DW_AT_name
	.long	456                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	222                             # DW_AT_decl_line
	.short	448                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x38f:0xa DW_TAG_member
	.byte	57                              # DW_AT_name
	.long	456                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	223                             # DW_AT_decl_line
	.short	452                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x399:0xa DW_TAG_member
	.byte	58                              # DW_AT_name
	.long	35                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	225                             # DW_AT_decl_line
	.short	456                             # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x3a4:0x5 DW_TAG_pointer_type
	.long	35                              # DW_AT_type
	.byte	7                               # Abbrev [7] 0x3a9:0x5 DW_TAG_pointer_type
	.long	942                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x3ae:0x5 DW_TAG_pointer_type
	.long	456                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0x3b3:0x12 DW_TAG_array_type
	.long	456                             # DW_AT_type
	.byte	12                              # Abbrev [12] 0x3b8:0x6 DW_TAG_subrange_type
	.long	965                             # DW_AT_type
	.byte	4                               # DW_AT_count
	.byte	12                              # Abbrev [12] 0x3be:0x6 DW_TAG_subrange_type
	.long	965                             # DW_AT_type
	.byte	2                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	13                              # Abbrev [13] 0x3c5:0x4 DW_TAG_base_type
	.byte	36                              # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	11                              # Abbrev [11] 0x3c9:0xc DW_TAG_array_type
	.long	456                             # DW_AT_type
	.byte	12                              # Abbrev [12] 0x3ce:0x6 DW_TAG_subrange_type
	.long	965                             # DW_AT_type
	.byte	20                              # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x3d5:0x5 DW_TAG_pointer_type
	.long	932                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0x3da:0x12 DW_TAG_array_type
	.long	35                              # DW_AT_type
	.byte	12                              # Abbrev [12] 0x3df:0x6 DW_TAG_subrange_type
	.long	965                             # DW_AT_type
	.byte	4                               # DW_AT_count
	.byte	12                              # Abbrev [12] 0x3e5:0x6 DW_TAG_subrange_type
	.long	965                             # DW_AT_type
	.byte	2                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x3ec:0x5 DW_TAG_pointer_type
	.long	1009                            # DW_AT_type
	.byte	14                              # Abbrev [14] 0x3f1:0x7f DW_TAG_structure_type
	.byte	73                              # DW_AT_name
	.byte	80                              # DW_AT_byte_size
	.byte	1                               # DW_AT_decl_file
	.short	289                             # DW_AT_decl_line
	.byte	15                              # Abbrev [15] 0x3f7:0xa DW_TAG_member
	.byte	61                              # DW_AT_name
	.long	981                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	290                             # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x401:0xa DW_TAG_member
	.byte	62                              # DW_AT_name
	.long	981                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	291                             # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x40b:0xa DW_TAG_member
	.byte	63                              # DW_AT_name
	.long	981                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	292                             # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x415:0xa DW_TAG_member
	.byte	64                              # DW_AT_name
	.long	981                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	293                             # DW_AT_decl_line
	.byte	24                              # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x41f:0xa DW_TAG_member
	.byte	65                              # DW_AT_name
	.long	39                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	299                             # DW_AT_decl_line
	.byte	32                              # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x429:0xa DW_TAG_member
	.byte	66                              # DW_AT_name
	.long	39                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	299                             # DW_AT_decl_line
	.byte	40                              # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x433:0xa DW_TAG_member
	.byte	67                              # DW_AT_name
	.long	39                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	299                             # DW_AT_decl_line
	.byte	48                              # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x43d:0xa DW_TAG_member
	.byte	68                              # DW_AT_name
	.long	39                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	299                             # DW_AT_decl_line
	.byte	56                              # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x447:0xa DW_TAG_member
	.byte	69                              # DW_AT_name
	.long	35                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	308                             # DW_AT_decl_line
	.byte	64                              # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x451:0xa DW_TAG_member
	.byte	70                              # DW_AT_name
	.long	35                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	309                             # DW_AT_decl_line
	.byte	68                              # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x45b:0xa DW_TAG_member
	.byte	71                              # DW_AT_name
	.long	35                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	311                             # DW_AT_decl_line
	.byte	72                              # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x465:0xa DW_TAG_member
	.byte	72                              # DW_AT_name
	.long	35                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	312                             # DW_AT_decl_line
	.byte	76                              # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x470:0x5 DW_TAG_pointer_type
	.long	1141                            # DW_AT_type
	.byte	7                               # Abbrev [7] 0x475:0x5 DW_TAG_pointer_type
	.long	1146                            # DW_AT_type
	.byte	14                              # Abbrev [14] 0x47a:0x2f DW_TAG_structure_type
	.byte	79                              # DW_AT_name
	.byte	32                              # DW_AT_byte_size
	.byte	1                               # DW_AT_decl_file
	.short	374                             # DW_AT_decl_line
	.byte	15                              # Abbrev [15] 0x480:0xa DW_TAG_member
	.byte	75                              # DW_AT_name
	.long	35                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	375                             # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x48a:0xa DW_TAG_member
	.byte	76                              # DW_AT_name
	.long	460                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	376                             # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x494:0xa DW_TAG_member
	.byte	77                              # DW_AT_name
	.long	932                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	377                             # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	15                              # Abbrev [15] 0x49e:0xa DW_TAG_member
	.byte	78                              # DW_AT_name
	.long	932                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.short	378                             # DW_AT_decl_line
	.byte	24                              # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.long	420                             # Length of String Offsets Set
	.short	5
	.short	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)" # string offset=0
.Linfo_string1:
	.asciz	"fast_algorithms.c"             # string offset=105
.Linfo_string2:
	.asciz	"/n/eecs583b/home/zderosia/final/EECS_583_Final_Project/Benchmarks/CINT2006_full/456.hmmer/src" # string offset=123
.Linfo_string3:
	.asciz	"int"                           # string offset=217
.Linfo_string4:
	.asciz	"P7Viterbi"                     # string offset=221
.Linfo_string5:
	.asciz	"float"                         # string offset=231
.Linfo_string6:
	.asciz	"dsq"                           # string offset=237
.Linfo_string7:
	.asciz	"char"                          # string offset=241
.Linfo_string8:
	.asciz	"L"                             # string offset=246
.Linfo_string9:
	.asciz	"hmm"                           # string offset=248
.Linfo_string10:
	.asciz	"name"                          # string offset=252
.Linfo_string11:
	.asciz	"acc"                           # string offset=257
.Linfo_string12:
	.asciz	"desc"                          # string offset=261
.Linfo_string13:
	.asciz	"rf"                            # string offset=266
.Linfo_string14:
	.asciz	"cs"                            # string offset=269
.Linfo_string15:
	.asciz	"ca"                            # string offset=272
.Linfo_string16:
	.asciz	"comlog"                        # string offset=275
.Linfo_string17:
	.asciz	"nseq"                          # string offset=282
.Linfo_string18:
	.asciz	"ctime"                         # string offset=287
.Linfo_string19:
	.asciz	"map"                           # string offset=293
.Linfo_string20:
	.asciz	"checksum"                      # string offset=297
.Linfo_string21:
	.asciz	"tpri"                          # string offset=306
.Linfo_string22:
	.asciz	"mpri"                          # string offset=311
.Linfo_string23:
	.asciz	"ipri"                          # string offset=316
.Linfo_string24:
	.asciz	"ga1"                           # string offset=321
.Linfo_string25:
	.asciz	"ga2"                           # string offset=325
.Linfo_string26:
	.asciz	"tc1"                           # string offset=329
.Linfo_string27:
	.asciz	"tc2"                           # string offset=333
.Linfo_string28:
	.asciz	"nc1"                           # string offset=337
.Linfo_string29:
	.asciz	"nc2"                           # string offset=341
.Linfo_string30:
	.asciz	"M"                             # string offset=345
.Linfo_string31:
	.asciz	"t"                             # string offset=347
.Linfo_string32:
	.asciz	"mat"                           # string offset=349
.Linfo_string33:
	.asciz	"ins"                           # string offset=353
.Linfo_string34:
	.asciz	"tbd1"                          # string offset=357
.Linfo_string35:
	.asciz	"xt"                            # string offset=362
.Linfo_string36:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=365
.Linfo_string37:
	.asciz	"begin"                         # string offset=385
.Linfo_string38:
	.asciz	"end"                           # string offset=391
.Linfo_string39:
	.asciz	"null"                          # string offset=395
.Linfo_string40:
	.asciz	"p1"                            # string offset=400
.Linfo_string41:
	.asciz	"tsc"                           # string offset=403
.Linfo_string42:
	.asciz	"msc"                           # string offset=407
.Linfo_string43:
	.asciz	"isc"                           # string offset=411
.Linfo_string44:
	.asciz	"xsc"                           # string offset=415
.Linfo_string45:
	.asciz	"bsc"                           # string offset=419
.Linfo_string46:
	.asciz	"esc"                           # string offset=423
.Linfo_string47:
	.asciz	"tsc_mem"                       # string offset=427
.Linfo_string48:
	.asciz	"msc_mem"                       # string offset=435
.Linfo_string49:
	.asciz	"isc_mem"                       # string offset=443
.Linfo_string50:
	.asciz	"bsc_mem"                       # string offset=451
.Linfo_string51:
	.asciz	"esc_mem"                       # string offset=459
.Linfo_string52:
	.asciz	"dnam"                          # string offset=467
.Linfo_string53:
	.asciz	"dnai"                          # string offset=472
.Linfo_string54:
	.asciz	"dna2"                          # string offset=477
.Linfo_string55:
	.asciz	"dna4"                          # string offset=482
.Linfo_string56:
	.asciz	"mu"                            # string offset=487
.Linfo_string57:
	.asciz	"lambda"                        # string offset=490
.Linfo_string58:
	.asciz	"flags"                         # string offset=497
.Linfo_string59:
	.asciz	"plan7_s"                       # string offset=503
.Linfo_string60:
	.asciz	"mx"                            # string offset=511
.Linfo_string61:
	.asciz	"xmx"                           # string offset=514
.Linfo_string62:
	.asciz	"mmx"                           # string offset=518
.Linfo_string63:
	.asciz	"imx"                           # string offset=522
.Linfo_string64:
	.asciz	"dmx"                           # string offset=526
.Linfo_string65:
	.asciz	"xmx_mem"                       # string offset=530
.Linfo_string66:
	.asciz	"mmx_mem"                       # string offset=538
.Linfo_string67:
	.asciz	"imx_mem"                       # string offset=546
.Linfo_string68:
	.asciz	"dmx_mem"                       # string offset=554
.Linfo_string69:
	.asciz	"maxN"                          # string offset=562
.Linfo_string70:
	.asciz	"maxM"                          # string offset=567
.Linfo_string71:
	.asciz	"padN"                          # string offset=572
.Linfo_string72:
	.asciz	"padM"                          # string offset=577
.Linfo_string73:
	.asciz	"dpmatrix_s"                    # string offset=582
.Linfo_string74:
	.asciz	"ret_tr"                        # string offset=593
.Linfo_string75:
	.asciz	"tlen"                          # string offset=600
.Linfo_string76:
	.asciz	"statetype"                     # string offset=605
.Linfo_string77:
	.asciz	"nodeidx"                       # string offset=615
.Linfo_string78:
	.asciz	"pos"                           # string offset=623
.Linfo_string79:
	.asciz	"p7trace_s"                     # string offset=627
.Linfo_string80:
	.asciz	"tr"                            # string offset=637
.Linfo_string81:
	.asciz	"i"                             # string offset=640
.Linfo_string82:
	.asciz	"k"                             # string offset=642
.Linfo_string83:
	.asciz	"sc"                            # string offset=644
.Linfo_string84:
	.asciz	"mc"                            # string offset=647
.Linfo_string85:
	.asciz	"dc"                            # string offset=650
.Linfo_string86:
	.asciz	"ic"                            # string offset=653
.Linfo_string87:
	.asciz	"ms"                            # string offset=656
.Linfo_string88:
	.asciz	"is"                            # string offset=659
.Linfo_string89:
	.asciz	"mpp"                           # string offset=662
.Linfo_string90:
	.asciz	"mpc"                           # string offset=666
.Linfo_string91:
	.asciz	"ip"                            # string offset=670
.Linfo_string92:
	.asciz	"bp"                            # string offset=673
.Linfo_string93:
	.asciz	"ep"                            # string offset=676
.Linfo_string94:
	.asciz	"xmb"                           # string offset=679
.Linfo_string95:
	.asciz	"xme"                           # string offset=683
.Linfo_string96:
	.asciz	"dpp"                           # string offset=687
.Linfo_string97:
	.asciz	"tpmm"                          # string offset=691
.Linfo_string98:
	.asciz	"tpmi"                          # string offset=696
.Linfo_string99:
	.asciz	"tpmd"                          # string offset=701
.Linfo_string100:
	.asciz	"tpim"                          # string offset=706
.Linfo_string101:
	.asciz	"tpii"                          # string offset=711
.Linfo_string102:
	.asciz	"tpdm"                          # string offset=716
.Linfo_string103:
	.asciz	"tpdd"                          # string offset=721
	.section	.debug_str_offsets,"",@progbits
	.long	.Linfo_string0
	.long	.Linfo_string1
	.long	.Linfo_string2
	.long	.Linfo_string3
	.long	.Linfo_string4
	.long	.Linfo_string5
	.long	.Linfo_string6
	.long	.Linfo_string7
	.long	.Linfo_string8
	.long	.Linfo_string9
	.long	.Linfo_string10
	.long	.Linfo_string11
	.long	.Linfo_string12
	.long	.Linfo_string13
	.long	.Linfo_string14
	.long	.Linfo_string15
	.long	.Linfo_string16
	.long	.Linfo_string17
	.long	.Linfo_string18
	.long	.Linfo_string19
	.long	.Linfo_string20
	.long	.Linfo_string21
	.long	.Linfo_string22
	.long	.Linfo_string23
	.long	.Linfo_string24
	.long	.Linfo_string25
	.long	.Linfo_string26
	.long	.Linfo_string27
	.long	.Linfo_string28
	.long	.Linfo_string29
	.long	.Linfo_string30
	.long	.Linfo_string31
	.long	.Linfo_string32
	.long	.Linfo_string33
	.long	.Linfo_string34
	.long	.Linfo_string35
	.long	.Linfo_string36
	.long	.Linfo_string37
	.long	.Linfo_string38
	.long	.Linfo_string39
	.long	.Linfo_string40
	.long	.Linfo_string41
	.long	.Linfo_string42
	.long	.Linfo_string43
	.long	.Linfo_string44
	.long	.Linfo_string45
	.long	.Linfo_string46
	.long	.Linfo_string47
	.long	.Linfo_string48
	.long	.Linfo_string49
	.long	.Linfo_string50
	.long	.Linfo_string51
	.long	.Linfo_string52
	.long	.Linfo_string53
	.long	.Linfo_string54
	.long	.Linfo_string55
	.long	.Linfo_string56
	.long	.Linfo_string57
	.long	.Linfo_string58
	.long	.Linfo_string59
	.long	.Linfo_string60
	.long	.Linfo_string61
	.long	.Linfo_string62
	.long	.Linfo_string63
	.long	.Linfo_string64
	.long	.Linfo_string65
	.long	.Linfo_string66
	.long	.Linfo_string67
	.long	.Linfo_string68
	.long	.Linfo_string69
	.long	.Linfo_string70
	.long	.Linfo_string71
	.long	.Linfo_string72
	.long	.Linfo_string73
	.long	.Linfo_string74
	.long	.Linfo_string75
	.long	.Linfo_string76
	.long	.Linfo_string77
	.long	.Linfo_string78
	.long	.Linfo_string79
	.long	.Linfo_string80
	.long	.Linfo_string81
	.long	.Linfo_string82
	.long	.Linfo_string83
	.long	.Linfo_string84
	.long	.Linfo_string85
	.long	.Linfo_string86
	.long	.Linfo_string87
	.long	.Linfo_string88
	.long	.Linfo_string89
	.long	.Linfo_string90
	.long	.Linfo_string91
	.long	.Linfo_string92
	.long	.Linfo_string93
	.long	.Linfo_string94
	.long	.Linfo_string95
	.long	.Linfo_string96
	.long	.Linfo_string97
	.long	.Linfo_string98
	.long	.Linfo_string99
	.long	.Linfo_string100
	.long	.Linfo_string101
	.long	.Linfo_string102
	.long	.Linfo_string103
	.section	.debug_addr,"",@progbits
	.long	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.short	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.Lfunc_begin0
.Ldebug_addr_end0:
	.ident	"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym ResizePlan7Matrix
	.addrsig_sym P7ViterbiTrace
	.addrsig_sym Scorify
	.section	.debug_line,"",@progbits
.Lline_table_start0:
