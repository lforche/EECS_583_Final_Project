	.text
	.file	"fast_algorithms.c"
	.globl	P7Viterbi                       # -- Begin function P7Viterbi
	.p2align	4, 0x90
	.type	P7Viterbi,@function
P7Viterbi:                              # @P7Viterbi
.Lfunc_begin0:
	.file	0 "/n/eecs583b/home/zderosia/final/EECS_583_Final_Project/Benchmarks/CINT2006_full/456.hmmer/src" "fast_algorithms.c" md5 0x8a81c02d2bbe20cbd773b3ccf7aab907
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
	.loc	0 91 21 prologue_end            # fast_algorithms.c:91:21
	movq	-32(%rbp), %rdi
	.loc	0 91 25 is_stmt 0               # fast_algorithms.c:91:25
	movl	-12(%rbp), %esi
	.loc	0 91 28                         # fast_algorithms.c:91:28
	movq	-24(%rbp), %rax
	.loc	0 91 33                         # fast_algorithms.c:91:33
	movl	136(%rax), %edx
	.loc	0 91 3                          # fast_algorithms.c:91:3
	leaq	-56(%rbp), %rcx
	leaq	-64(%rbp), %r8
	leaq	-72(%rbp), %r9
	leaq	-80(%rbp), %rax
	movq	%rax, (%rsp)
	callq	ResizePlan7Matrix
	.loc	0 95 3 is_stmt 1                # fast_algorithms.c:95:3
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc	0 95 15 is_stmt 0               # fast_algorithms.c:95:15
	movl	$0, 16(%rax)
	.loc	0 96 17 is_stmt 1               # fast_algorithms.c:96:17
	movq	-24(%rbp), %rax
	movl	336(%rax), %ecx
	.loc	0 96 3 is_stmt 0                # fast_algorithms.c:96:3
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc	0 96 15                         # fast_algorithms.c:96:15
	movl	%ecx, (%rax)
	.loc	0 97 31 is_stmt 1               # fast_algorithms.c:97:31
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc	0 97 43 is_stmt 0               # fast_algorithms.c:97:43
	movl	$-987654321, 12(%rax)           # imm = 0xC521974F
	.loc	0 97 17                         # fast_algorithms.c:97:17
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc	0 97 29                         # fast_algorithms.c:97:29
	movl	$-987654321, 8(%rax)            # imm = 0xC521974F
	.loc	0 97 3                          # fast_algorithms.c:97:3
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc	0 97 15                         # fast_algorithms.c:97:15
	movl	$-987654321, 4(%rax)            # imm = 0xC521974F
	.loc	0 98 10 is_stmt 1               # fast_algorithms.c:98:10
	movl	$0, -88(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	.loc	0 98 15 is_stmt 0               # fast_algorithms.c:98:15
	movl	-88(%rbp), %eax
	.loc	0 98 20                         # fast_algorithms.c:98:20
	movq	-24(%rbp), %rcx
	.loc	0 98 17                         # fast_algorithms.c:98:17
	cmpl	136(%rcx), %eax
	.loc	0 98 3                          # fast_algorithms.c:98:3
	jg	.LBB0_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	0 99 29 is_stmt 1               # fast_algorithms.c:99:29
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 99 39 is_stmt 0               # fast_algorithms.c:99:39
	movl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
	.loc	0 99 17                         # fast_algorithms.c:99:17
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 99 27                         # fast_algorithms.c:99:27
	movl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
	.loc	0 99 5                          # fast_algorithms.c:99:5
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 99 15                         # fast_algorithms.c:99:15
	movl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	0 98 29 is_stmt 1               # fast_algorithms.c:98:29
	movl	-88(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -88(%rbp)
	.loc	0 98 3 is_stmt 0                # fast_algorithms.c:98:3
	jmp	.LBB0_1
.LBB0_4:                                # %for.end
	.loc	0 103 14 is_stmt 1              # fast_algorithms.c:103:14
	movq	-24(%rbp), %rax
	.loc	0 103 19 is_stmt 0              # fast_algorithms.c:103:19
	movl	136(%rax), %eax
	.loc	0 103 12                        # fast_algorithms.c:103:12
	movl	%eax, -252(%rbp)
	.loc	0 111 11 is_stmt 1              # fast_algorithms.c:111:11
	movq	-24(%rbp), %rax
	.loc	0 111 16 is_stmt 0              # fast_algorithms.c:111:16
	movq	312(%rax), %rax
	.loc	0 111 11                        # fast_algorithms.c:111:11
	movq	(%rax), %rax
	.loc	0 111 9                         # fast_algorithms.c:111:9
	movq	%rax, -200(%rbp)
	.loc	0 112 11 is_stmt 1              # fast_algorithms.c:112:11
	movq	-24(%rbp), %rax
	.loc	0 112 16 is_stmt 0              # fast_algorithms.c:112:16
	movq	312(%rax), %rax
	.loc	0 112 11                        # fast_algorithms.c:112:11
	movq	24(%rax), %rax
	.loc	0 112 9                         # fast_algorithms.c:112:9
	movq	%rax, -224(%rbp)
	.loc	0 113 11 is_stmt 1              # fast_algorithms.c:113:11
	movq	-24(%rbp), %rax
	.loc	0 113 16 is_stmt 0              # fast_algorithms.c:113:16
	movq	312(%rax), %rax
	.loc	0 113 11                        # fast_algorithms.c:113:11
	movq	40(%rax), %rax
	.loc	0 113 9                         # fast_algorithms.c:113:9
	movq	%rax, -240(%rbp)
	.loc	0 114 11 is_stmt 1              # fast_algorithms.c:114:11
	movq	-24(%rbp), %rax
	.loc	0 114 16 is_stmt 0              # fast_algorithms.c:114:16
	movq	312(%rax), %rax
	.loc	0 114 11                        # fast_algorithms.c:114:11
	movq	16(%rax), %rax
	.loc	0 114 9                         # fast_algorithms.c:114:9
	movq	%rax, -216(%rbp)
	.loc	0 115 11 is_stmt 1              # fast_algorithms.c:115:11
	movq	-24(%rbp), %rax
	.loc	0 115 16 is_stmt 0              # fast_algorithms.c:115:16
	movq	312(%rax), %rax
	.loc	0 115 11                        # fast_algorithms.c:115:11
	movq	48(%rax), %rax
	.loc	0 115 9                         # fast_algorithms.c:115:9
	movq	%rax, -248(%rbp)
	.loc	0 116 11 is_stmt 1              # fast_algorithms.c:116:11
	movq	-24(%rbp), %rax
	.loc	0 116 16 is_stmt 0              # fast_algorithms.c:116:16
	movq	312(%rax), %rax
	.loc	0 116 11                        # fast_algorithms.c:116:11
	movq	8(%rax), %rax
	.loc	0 116 9                         # fast_algorithms.c:116:9
	movq	%rax, -208(%rbp)
	.loc	0 117 11 is_stmt 1              # fast_algorithms.c:117:11
	movq	-24(%rbp), %rax
	.loc	0 117 16 is_stmt 0              # fast_algorithms.c:117:16
	movq	312(%rax), %rax
	.loc	0 117 11                        # fast_algorithms.c:117:11
	movq	32(%rax), %rax
	.loc	0 117 9                         # fast_algorithms.c:117:9
	movq	%rax, -232(%rbp)
	.loc	0 118 11 is_stmt 1              # fast_algorithms.c:118:11
	movq	-24(%rbp), %rax
	.loc	0 118 16 is_stmt 0              # fast_algorithms.c:118:16
	movq	368(%rax), %rax
	.loc	0 118 9                         # fast_algorithms.c:118:9
	movq	%rax, -168(%rbp)
	.loc	0 119 10 is_stmt 1              # fast_algorithms.c:119:10
	movl	$1, -84(%rbp)
.LBB0_5:                                # %for.cond36
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
                                        #     Child Loop BB0_31 Depth 2
	.loc	0 119 15 is_stmt 0              # fast_algorithms.c:119:15
	movl	-84(%rbp), %eax
	.loc	0 119 17                        # fast_algorithms.c:119:17
	cmpl	-12(%rbp), %eax
	.loc	0 119 3                         # fast_algorithms.c:119:3
	jg	.LBB0_50
# %bb.6:                                # %for.body38
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 120 13 is_stmt 1              # fast_algorithms.c:120:13
	movq	-64(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 120 11 is_stmt 0              # fast_algorithms.c:120:11
	movq	%rax, -104(%rbp)
	.loc	0 121 13 is_stmt 1              # fast_algorithms.c:121:13
	movq	-80(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 121 11 is_stmt 0              # fast_algorithms.c:121:11
	movq	%rax, -112(%rbp)
	.loc	0 122 13 is_stmt 1              # fast_algorithms.c:122:13
	movq	-72(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 122 11 is_stmt 0              # fast_algorithms.c:122:11
	movq	%rax, -120(%rbp)
	.loc	0 123 13 is_stmt 1              # fast_algorithms.c:123:13
	movq	-64(%rbp), %rax
	.loc	0 123 17 is_stmt 0              # fast_algorithms.c:123:17
	movl	-84(%rbp), %ecx
	.loc	0 123 18                        # fast_algorithms.c:123:18
	subl	$1, %ecx
	.loc	0 123 13                        # fast_algorithms.c:123:13
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 123 11                        # fast_algorithms.c:123:11
	movq	%rax, -144(%rbp)
	.loc	0 124 13 is_stmt 1              # fast_algorithms.c:124:13
	movq	-80(%rbp), %rax
	.loc	0 124 17 is_stmt 0              # fast_algorithms.c:124:17
	movl	-84(%rbp), %ecx
	.loc	0 124 18                        # fast_algorithms.c:124:18
	subl	$1, %ecx
	.loc	0 124 13                        # fast_algorithms.c:124:13
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 124 11                        # fast_algorithms.c:124:11
	movq	%rax, -192(%rbp)
	.loc	0 125 13 is_stmt 1              # fast_algorithms.c:125:13
	movq	-72(%rbp), %rax
	.loc	0 125 17 is_stmt 0              # fast_algorithms.c:125:17
	movl	-84(%rbp), %ecx
	.loc	0 125 18                        # fast_algorithms.c:125:18
	subl	$1, %ecx
	.loc	0 125 13                        # fast_algorithms.c:125:13
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 125 11                        # fast_algorithms.c:125:11
	movq	%rax, -160(%rbp)
	.loc	0 126 13 is_stmt 1              # fast_algorithms.c:126:13
	movq	-56(%rbp), %rax
	.loc	0 126 17 is_stmt 0              # fast_algorithms.c:126:17
	movl	-84(%rbp), %ecx
	.loc	0 126 18                        # fast_algorithms.c:126:18
	subl	$1, %ecx
	.loc	0 126 13                        # fast_algorithms.c:126:13
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	movl	(%rax), %eax
	.loc	0 126 11                        # fast_algorithms.c:126:11
	movl	%eax, -180(%rbp)
	.loc	0 127 13 is_stmt 1              # fast_algorithms.c:127:13
	movq	-24(%rbp), %rax
	.loc	0 127 18 is_stmt 0              # fast_algorithms.c:127:18
	movq	320(%rax), %rax
	.loc	0 127 28                        # fast_algorithms.c:127:28
	movq	-8(%rbp), %rcx
	movslq	-84(%rbp), %rdx
	.loc	0 127 22                        # fast_algorithms.c:127:22
	movsbl	(%rcx,%rdx), %ecx
	.loc	0 127 13                        # fast_algorithms.c:127:13
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 127 11                        # fast_algorithms.c:127:11
	movq	%rax, -128(%rbp)
	.loc	0 128 13 is_stmt 1              # fast_algorithms.c:128:13
	movq	-24(%rbp), %rax
	.loc	0 128 18 is_stmt 0              # fast_algorithms.c:128:18
	movq	328(%rax), %rax
	.loc	0 128 28                        # fast_algorithms.c:128:28
	movq	-8(%rbp), %rcx
	movslq	-84(%rbp), %rdx
	.loc	0 128 22                        # fast_algorithms.c:128:22
	movsbl	(%rcx,%rdx), %ecx
	.loc	0 128 13                        # fast_algorithms.c:128:13
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 128 11                        # fast_algorithms.c:128:11
	movq	%rax, -136(%rbp)
	.loc	0 129 5 is_stmt 1               # fast_algorithms.c:129:5
	movq	-104(%rbp), %rax
	.loc	0 129 11 is_stmt 0              # fast_algorithms.c:129:11
	movl	$-987654321, (%rax)             # imm = 0xC521974F
	.loc	0 130 5 is_stmt 1               # fast_algorithms.c:130:5
	movq	-112(%rbp), %rax
	.loc	0 130 11 is_stmt 0              # fast_algorithms.c:130:11
	movl	$-987654321, (%rax)             # imm = 0xC521974F
	.loc	0 131 5 is_stmt 1               # fast_algorithms.c:131:5
	movq	-120(%rbp), %rax
	.loc	0 131 11 is_stmt 0              # fast_algorithms.c:131:11
	movl	$-987654321, (%rax)             # imm = 0xC521974F
	.loc	0 133 12 is_stmt 1              # fast_algorithms.c:133:12
	movl	$1, -88(%rbp)
.LBB0_7:                                # %for.cond69
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	0 133 17 is_stmt 0              # fast_algorithms.c:133:17
	movl	-88(%rbp), %eax
	.loc	0 133 19                        # fast_algorithms.c:133:19
	cmpl	-252(%rbp), %eax
	.loc	0 133 5                         # fast_algorithms.c:133:5
	jg	.LBB0_28
# %bb.8:                                # %for.body72
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 135 9 is_stmt 1               # fast_algorithms.c:135:9
	#APP
	xchgq	%r13, %r13
	#NO_APP
	.loc	0 136 21                        # fast_algorithms.c:136:21
	movq	-144(%rbp), %rax
	.loc	0 136 25 is_stmt 0              # fast_algorithms.c:136:25
	movl	-88(%rbp), %ecx
	.loc	0 136 26                        # fast_algorithms.c:136:26
	subl	$1, %ecx
	.loc	0 136 21                        # fast_algorithms.c:136:21
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	0 136 32                        # fast_algorithms.c:136:32
	movq	-200(%rbp), %rcx
	.loc	0 136 37                        # fast_algorithms.c:136:37
	movl	-88(%rbp), %edx
	.loc	0 136 38                        # fast_algorithms.c:136:38
	subl	$1, %edx
	.loc	0 136 32                        # fast_algorithms.c:136:32
	movslq	%edx, %rdx
	.loc	0 136 30                        # fast_algorithms.c:136:30
	addl	(%rcx,%rdx,4), %eax
	.loc	0 136 13                        # fast_algorithms.c:136:13
	movl	%eax, -256(%rbp)
	.loc	0 137 19 is_stmt 1              # fast_algorithms.c:137:19
	movq	-160(%rbp), %rax
	.loc	0 137 22 is_stmt 0              # fast_algorithms.c:137:22
	movl	-88(%rbp), %ecx
	.loc	0 137 23                        # fast_algorithms.c:137:23
	subl	$1, %ecx
	.loc	0 137 19                        # fast_algorithms.c:137:19
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	0 137 30                        # fast_algorithms.c:137:30
	movq	-224(%rbp), %rcx
	.loc	0 137 35                        # fast_algorithms.c:137:35
	movl	-88(%rbp), %edx
	.loc	0 137 36                        # fast_algorithms.c:137:36
	subl	$1, %edx
	.loc	0 137 30                        # fast_algorithms.c:137:30
	movslq	%edx, %rdx
	.loc	0 137 28                        # fast_algorithms.c:137:28
	addl	(%rcx,%rdx,4), %eax
	.loc	0 137 17                        # fast_algorithms.c:137:17
	movl	%eax, -92(%rbp)
	.loc	0 137 41                        # fast_algorithms.c:137:41
	cmpl	-256(%rbp), %eax
	.loc	0 137 13                        # fast_algorithms.c:137:13
	jle	.LBB0_10
# %bb.9:                                # %if.then
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 137 59                        # fast_algorithms.c:137:59
	movl	-92(%rbp), %eax
	.loc	0 137 57                        # fast_algorithms.c:137:57
	movl	%eax, -256(%rbp)
.LBB0_10:                               # %if.end
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 138 19 is_stmt 1              # fast_algorithms.c:138:19
	movq	-192(%rbp), %rax
	.loc	0 138 23 is_stmt 0              # fast_algorithms.c:138:23
	movl	-88(%rbp), %ecx
	.loc	0 138 24                        # fast_algorithms.c:138:24
	subl	$1, %ecx
	.loc	0 138 19                        # fast_algorithms.c:138:19
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	0 138 30                        # fast_algorithms.c:138:30
	movq	-240(%rbp), %rcx
	.loc	0 138 35                        # fast_algorithms.c:138:35
	movl	-88(%rbp), %edx
	.loc	0 138 36                        # fast_algorithms.c:138:36
	subl	$1, %edx
	.loc	0 138 30                        # fast_algorithms.c:138:30
	movslq	%edx, %rdx
	.loc	0 138 28                        # fast_algorithms.c:138:28
	addl	(%rcx,%rdx,4), %eax
	.loc	0 138 17                        # fast_algorithms.c:138:17
	movl	%eax, -92(%rbp)
	.loc	0 138 41                        # fast_algorithms.c:138:41
	cmpl	-256(%rbp), %eax
	.loc	0 138 13                        # fast_algorithms.c:138:13
	jle	.LBB0_12
# %bb.11:                               # %if.then97
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 138 59                        # fast_algorithms.c:138:59
	movl	-92(%rbp), %eax
	.loc	0 138 57                        # fast_algorithms.c:138:57
	movl	%eax, -256(%rbp)
.LBB0_12:                               # %if.end98
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 139 19 is_stmt 1              # fast_algorithms.c:139:19
	movl	-180(%rbp), %eax
	.loc	0 139 26 is_stmt 0              # fast_algorithms.c:139:26
	movq	-168(%rbp), %rcx
	movslq	-88(%rbp), %rdx
	.loc	0 139 24                        # fast_algorithms.c:139:24
	addl	(%rcx,%rdx,4), %eax
	.loc	0 139 17                        # fast_algorithms.c:139:17
	movl	%eax, -92(%rbp)
	.loc	0 139 41                        # fast_algorithms.c:139:41
	cmpl	-256(%rbp), %eax
	.loc	0 139 13                        # fast_algorithms.c:139:13
	jle	.LBB0_14
# %bb.13:                               # %if.then104
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 139 59                        # fast_algorithms.c:139:59
	movl	-92(%rbp), %eax
	.loc	0 139 57                        # fast_algorithms.c:139:57
	movl	%eax, -256(%rbp)
.LBB0_14:                               # %if.end105
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 140 18 is_stmt 1              # fast_algorithms.c:140:18
	movq	-128(%rbp), %rax
	movslq	-88(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	0 140 15 is_stmt 0              # fast_algorithms.c:140:15
	addl	-256(%rbp), %eax
	movl	%eax, -256(%rbp)
	.loc	0 141 19 is_stmt 1              # fast_algorithms.c:141:19
	cmpl	$-987654321, -256(%rbp)         # imm = 0xC521974F
	.loc	0 141 13 is_stmt 0              # fast_algorithms.c:141:13
	jge	.LBB0_16
# %bb.15:                               # %if.then111
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 141 35                        # fast_algorithms.c:141:35
	movl	$-987654321, -256(%rbp)         # imm = 0xC521974F
.LBB0_16:                               # %if.end112
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 142 17 is_stmt 1              # fast_algorithms.c:142:17
	movl	-256(%rbp), %edx
	.loc	0 142 9 is_stmt 0               # fast_algorithms.c:142:9
	movq	-104(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 142 15                        # fast_algorithms.c:142:15
	movl	%edx, (%rax,%rcx,4)
	.loc	0 144 21 is_stmt 1              # fast_algorithms.c:144:21
	movq	-112(%rbp), %rax
	.loc	0 144 24 is_stmt 0              # fast_algorithms.c:144:24
	movl	-88(%rbp), %ecx
	.loc	0 144 25                        # fast_algorithms.c:144:25
	subl	$1, %ecx
	.loc	0 144 21                        # fast_algorithms.c:144:21
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	0 144 31                        # fast_algorithms.c:144:31
	movq	-248(%rbp), %rcx
	.loc	0 144 36                        # fast_algorithms.c:144:36
	movl	-88(%rbp), %edx
	.loc	0 144 37                        # fast_algorithms.c:144:37
	subl	$1, %edx
	.loc	0 144 31                        # fast_algorithms.c:144:31
	movslq	%edx, %rdx
	.loc	0 144 29                        # fast_algorithms.c:144:29
	addl	(%rcx,%rdx,4), %eax
	.loc	0 144 13                        # fast_algorithms.c:144:13
	movl	%eax, -260(%rbp)
	.loc	0 145 19 is_stmt 1              # fast_algorithms.c:145:19
	movq	-104(%rbp), %rax
	.loc	0 145 22 is_stmt 0              # fast_algorithms.c:145:22
	movl	-88(%rbp), %ecx
	.loc	0 145 23                        # fast_algorithms.c:145:23
	subl	$1, %ecx
	.loc	0 145 19                        # fast_algorithms.c:145:19
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	0 145 29                        # fast_algorithms.c:145:29
	movq	-216(%rbp), %rcx
	.loc	0 145 34                        # fast_algorithms.c:145:34
	movl	-88(%rbp), %edx
	.loc	0 145 35                        # fast_algorithms.c:145:35
	subl	$1, %edx
	.loc	0 145 29                        # fast_algorithms.c:145:29
	movslq	%edx, %rdx
	.loc	0 145 27                        # fast_algorithms.c:145:27
	addl	(%rcx,%rdx,4), %eax
	.loc	0 145 17                        # fast_algorithms.c:145:17
	movl	%eax, -92(%rbp)
	.loc	0 145 40                        # fast_algorithms.c:145:40
	cmpl	-260(%rbp), %eax
	.loc	0 145 13                        # fast_algorithms.c:145:13
	jle	.LBB0_18
# %bb.17:                               # %if.then131
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 145 57                        # fast_algorithms.c:145:57
	movl	-92(%rbp), %eax
	.loc	0 145 55                        # fast_algorithms.c:145:55
	movl	%eax, -260(%rbp)
.LBB0_18:                               # %if.end132
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 146 19 is_stmt 1              # fast_algorithms.c:146:19
	cmpl	$-987654321, -260(%rbp)         # imm = 0xC521974F
	.loc	0 146 13 is_stmt 0              # fast_algorithms.c:146:13
	jge	.LBB0_20
# %bb.19:                               # %if.then135
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 146 35                        # fast_algorithms.c:146:35
	movl	$-987654321, -260(%rbp)         # imm = 0xC521974F
.LBB0_20:                               # %if.end136
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 147 17 is_stmt 1              # fast_algorithms.c:147:17
	movl	-260(%rbp), %edx
	.loc	0 147 9 is_stmt 0               # fast_algorithms.c:147:9
	movq	-112(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 147 15                        # fast_algorithms.c:147:15
	movl	%edx, (%rax,%rcx,4)
	.loc	0 148 9 is_stmt 1               # fast_algorithms.c:148:9
	#APP
	xchgq	%r13, %r13
	#NO_APP
	.loc	0 164 13                        # fast_algorithms.c:164:13
	movl	-88(%rbp), %eax
	.loc	0 164 15 is_stmt 0              # fast_algorithms.c:164:15
	cmpl	-252(%rbp), %eax
	.loc	0 164 13                        # fast_algorithms.c:164:13
	jge	.LBB0_26
# %bb.21:                               # %if.then141
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 165 21 is_stmt 1              # fast_algorithms.c:165:21
	movq	-144(%rbp), %rax
	movslq	-88(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	.loc	0 165 30 is_stmt 0              # fast_algorithms.c:165:30
	movq	-208(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 165 28                        # fast_algorithms.c:165:28
	addl	(%rax,%rcx,4), %edx
	.loc	0 165 13                        # fast_algorithms.c:165:13
	movq	-120(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 165 19                        # fast_algorithms.c:165:19
	movl	%edx, (%rax,%rcx,4)
	.loc	0 166 23 is_stmt 1              # fast_algorithms.c:166:23
	movq	-160(%rbp), %rax
	movslq	-88(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	0 166 31 is_stmt 0              # fast_algorithms.c:166:31
	movq	-232(%rbp), %rcx
	movslq	-88(%rbp), %rdx
	.loc	0 166 29                        # fast_algorithms.c:166:29
	addl	(%rcx,%rdx,4), %eax
	.loc	0 166 21                        # fast_algorithms.c:166:21
	movl	%eax, -92(%rbp)
	.loc	0 166 42                        # fast_algorithms.c:166:42
	movq	-120(%rbp), %rcx
	movslq	-88(%rbp), %rdx
	.loc	0 166 40                        # fast_algorithms.c:166:40
	cmpl	(%rcx,%rdx,4), %eax
	.loc	0 166 17                        # fast_algorithms.c:166:17
	jle	.LBB0_23
# %bb.22:                               # %if.then158
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 166 57                        # fast_algorithms.c:166:57
	movl	-92(%rbp), %edx
	.loc	0 166 49                        # fast_algorithms.c:166:49
	movq	-120(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 166 55                        # fast_algorithms.c:166:55
	movl	%edx, (%rax,%rcx,4)
.LBB0_23:                               # %if.end161
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 167 22 is_stmt 1              # fast_algorithms.c:167:22
	movq	-136(%rbp), %rax
	movslq	-88(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	.loc	0 167 13 is_stmt 0              # fast_algorithms.c:167:13
	movq	-120(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 167 19                        # fast_algorithms.c:167:19
	addl	(%rax,%rcx,4), %edx
	movl	%edx, (%rax,%rcx,4)
	.loc	0 168 17 is_stmt 1              # fast_algorithms.c:168:17
	movq	-120(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 168 23 is_stmt 0              # fast_algorithms.c:168:23
	cmpl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
	.loc	0 168 17                        # fast_algorithms.c:168:17
	jge	.LBB0_25
# %bb.24:                               # %if.then171
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 168 33                        # fast_algorithms.c:168:33
	movq	-120(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	0 168 39                        # fast_algorithms.c:168:39
	movl	$-987654321, (%rax,%rcx,4)      # imm = 0xC521974F
.LBB0_25:                               # %if.end174
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 169 9 is_stmt 1               # fast_algorithms.c:169:9
	jmp	.LBB0_26
.LBB0_26:                               # %if.end175
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 170 5                         # fast_algorithms.c:170:5
	jmp	.LBB0_27
.LBB0_27:                               # %for.inc176
                                        #   in Loop: Header=BB0_7 Depth=2
	.loc	0 133 26                        # fast_algorithms.c:133:26
	movl	-88(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -88(%rbp)
	.loc	0 133 5 is_stmt 0               # fast_algorithms.c:133:5
	jmp	.LBB0_7
.LBB0_28:                               # %for.end178
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 176 5 is_stmt 1               # fast_algorithms.c:176:5
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 176 17 is_stmt 0              # fast_algorithms.c:176:17
	movl	$-987654321, 16(%rax)           # imm = 0xC521974F
	.loc	0 177 15 is_stmt 1              # fast_algorithms.c:177:15
	movq	-56(%rbp), %rax
	.loc	0 177 19 is_stmt 0              # fast_algorithms.c:177:19
	movl	-84(%rbp), %ecx
	.loc	0 177 20                        # fast_algorithms.c:177:20
	subl	$1, %ecx
	.loc	0 177 15                        # fast_algorithms.c:177:15
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	movl	16(%rax), %eax
	.loc	0 177 31                        # fast_algorithms.c:177:31
	movq	-24(%rbp), %rcx
	.loc	0 177 29                        # fast_algorithms.c:177:29
	addl	340(%rcx), %eax
	.loc	0 177 13                        # fast_algorithms.c:177:13
	movl	%eax, -92(%rbp)
	.loc	0 177 52                        # fast_algorithms.c:177:52
	cmpl	$-987654321, %eax               # imm = 0xC521974F
	.loc	0 177 9                         # fast_algorithms.c:177:9
	jle	.LBB0_30
# %bb.29:                               # %if.then192
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 178 21 is_stmt 1              # fast_algorithms.c:178:21
	movl	-92(%rbp), %ecx
	.loc	0 178 7 is_stmt 0               # fast_algorithms.c:178:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 178 19                        # fast_algorithms.c:178:19
	movl	%ecx, 16(%rax)
.LBB0_30:                               # %if.end196
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 181 9 is_stmt 1               # fast_algorithms.c:181:9
	movl	$-987654321, -184(%rbp)         # imm = 0xC521974F
	.loc	0 182 11                        # fast_algorithms.c:182:11
	movq	-64(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 182 9 is_stmt 0               # fast_algorithms.c:182:9
	movq	%rax, -152(%rbp)
	.loc	0 183 11 is_stmt 1              # fast_algorithms.c:183:11
	movq	-24(%rbp), %rax
	.loc	0 183 16 is_stmt 0              # fast_algorithms.c:183:16
	movq	376(%rax), %rax
	.loc	0 183 9                         # fast_algorithms.c:183:9
	movq	%rax, -176(%rbp)
	.loc	0 184 12 is_stmt 1              # fast_algorithms.c:184:12
	movl	$1, -88(%rbp)
.LBB0_31:                               # %for.cond199
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	0 184 17 is_stmt 0              # fast_algorithms.c:184:17
	movl	-88(%rbp), %eax
	.loc	0 184 22                        # fast_algorithms.c:184:22
	movq	-24(%rbp), %rcx
	.loc	0 184 19                        # fast_algorithms.c:184:19
	cmpl	136(%rcx), %eax
	.loc	0 184 5                         # fast_algorithms.c:184:5
	jg	.LBB0_36
# %bb.32:                               # %for.body203
                                        #   in Loop: Header=BB0_31 Depth=2
	.loc	0 185 18 is_stmt 1              # fast_algorithms.c:185:18
	movq	-152(%rbp), %rax
	movslq	-88(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	0 185 27 is_stmt 0              # fast_algorithms.c:185:27
	movq	-176(%rbp), %rcx
	movslq	-88(%rbp), %rdx
	.loc	0 185 25                        # fast_algorithms.c:185:25
	addl	(%rcx,%rdx,4), %eax
	.loc	0 185 15                        # fast_algorithms.c:185:15
	movl	%eax, -92(%rbp)
	.loc	0 185 34                        # fast_algorithms.c:185:34
	cmpl	-184(%rbp), %eax
	.loc	0 185 11                        # fast_algorithms.c:185:11
	jle	.LBB0_34
# %bb.33:                               # %if.then211
                                        #   in Loop: Header=BB0_31 Depth=2
	.loc	0 185 47                        # fast_algorithms.c:185:47
	movl	-92(%rbp), %eax
	.loc	0 185 45                        # fast_algorithms.c:185:45
	movl	%eax, -184(%rbp)
.LBB0_34:                               # %if.end212
                                        #   in Loop: Header=BB0_31 Depth=2
	.loc	0 185 36                        # fast_algorithms.c:185:36
	jmp	.LBB0_35
.LBB0_35:                               # %for.inc213
                                        #   in Loop: Header=BB0_31 Depth=2
	.loc	0 184 31 is_stmt 1              # fast_algorithms.c:184:31
	movl	-88(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -88(%rbp)
	.loc	0 184 5 is_stmt 0               # fast_algorithms.c:184:5
	jmp	.LBB0_31
.LBB0_36:                               # %for.end215
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 186 19 is_stmt 1              # fast_algorithms.c:186:19
	movl	-184(%rbp), %ecx
	.loc	0 186 5 is_stmt 0               # fast_algorithms.c:186:5
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 186 17                        # fast_algorithms.c:186:17
	movl	%ecx, 4(%rax)
	.loc	0 188 5 is_stmt 1               # fast_algorithms.c:188:5
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 188 17 is_stmt 0              # fast_algorithms.c:188:17
	movl	$-987654321, 12(%rax)           # imm = 0xC521974F
	.loc	0 189 15 is_stmt 1              # fast_algorithms.c:189:15
	movq	-56(%rbp), %rax
	.loc	0 189 19 is_stmt 0              # fast_algorithms.c:189:19
	movl	-84(%rbp), %ecx
	.loc	0 189 20                        # fast_algorithms.c:189:20
	subl	$1, %ecx
	.loc	0 189 15                        # fast_algorithms.c:189:15
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	movl	12(%rax), %eax
	.loc	0 189 31                        # fast_algorithms.c:189:31
	movq	-24(%rbp), %rcx
	.loc	0 189 29                        # fast_algorithms.c:189:29
	addl	364(%rcx), %eax
	.loc	0 189 13                        # fast_algorithms.c:189:13
	movl	%eax, -92(%rbp)
	.loc	0 189 52                        # fast_algorithms.c:189:52
	cmpl	$-987654321, %eax               # imm = 0xC521974F
	.loc	0 189 9                         # fast_algorithms.c:189:9
	jle	.LBB0_38
# %bb.37:                               # %if.then232
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 190 21 is_stmt 1              # fast_algorithms.c:190:21
	movl	-92(%rbp), %ecx
	.loc	0 190 7 is_stmt 0               # fast_algorithms.c:190:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 190 19                        # fast_algorithms.c:190:19
	movl	%ecx, 12(%rax)
.LBB0_38:                               # %if.end236
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 191 15 is_stmt 1              # fast_algorithms.c:191:15
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	4(%rax), %eax
	.loc	0 191 31 is_stmt 0              # fast_algorithms.c:191:31
	movq	-24(%rbp), %rcx
	.loc	0 191 29                        # fast_algorithms.c:191:29
	addl	348(%rcx), %eax
	.loc	0 191 13                        # fast_algorithms.c:191:13
	movl	%eax, -92(%rbp)
	.loc	0 191 54                        # fast_algorithms.c:191:54
	movq	-56(%rbp), %rcx
	movslq	-84(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	.loc	0 191 52                        # fast_algorithms.c:191:52
	cmpl	12(%rcx), %eax
	.loc	0 191 9                         # fast_algorithms.c:191:9
	jle	.LBB0_40
# %bb.39:                               # %if.then249
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 192 21 is_stmt 1              # fast_algorithms.c:192:21
	movl	-92(%rbp), %ecx
	.loc	0 192 7 is_stmt 0               # fast_algorithms.c:192:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 192 19                        # fast_algorithms.c:192:19
	movl	%ecx, 12(%rax)
.LBB0_40:                               # %if.end253
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 195 5 is_stmt 1               # fast_algorithms.c:195:5
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 195 17 is_stmt 0              # fast_algorithms.c:195:17
	movl	$-987654321, (%rax)             # imm = 0xC521974F
	.loc	0 196 15 is_stmt 1              # fast_algorithms.c:196:15
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	16(%rax), %eax
	.loc	0 196 29 is_stmt 0              # fast_algorithms.c:196:29
	movq	-24(%rbp), %rcx
	.loc	0 196 27                        # fast_algorithms.c:196:27
	addl	336(%rcx), %eax
	.loc	0 196 13                        # fast_algorithms.c:196:13
	movl	%eax, -92(%rbp)
	.loc	0 196 50                        # fast_algorithms.c:196:50
	cmpl	$-987654321, %eax               # imm = 0xC521974F
	.loc	0 196 9                         # fast_algorithms.c:196:9
	jle	.LBB0_42
# %bb.41:                               # %if.then266
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 197 21 is_stmt 1              # fast_algorithms.c:197:21
	movl	-92(%rbp), %ecx
	.loc	0 197 7 is_stmt 0               # fast_algorithms.c:197:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 197 19                        # fast_algorithms.c:197:19
	movl	%ecx, (%rax)
.LBB0_42:                               # %if.end270
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 198 15 is_stmt 1              # fast_algorithms.c:198:15
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	12(%rax), %eax
	.loc	0 198 29 is_stmt 0              # fast_algorithms.c:198:29
	movq	-24(%rbp), %rcx
	.loc	0 198 27                        # fast_algorithms.c:198:27
	addl	360(%rcx), %eax
	.loc	0 198 13                        # fast_algorithms.c:198:13
	movl	%eax, -92(%rbp)
	.loc	0 198 52                        # fast_algorithms.c:198:52
	movq	-56(%rbp), %rcx
	movslq	-84(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	.loc	0 198 50                        # fast_algorithms.c:198:50
	cmpl	(%rcx), %eax
	.loc	0 198 9                         # fast_algorithms.c:198:9
	jle	.LBB0_44
# %bb.43:                               # %if.then283
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 199 21 is_stmt 1              # fast_algorithms.c:199:21
	movl	-92(%rbp), %ecx
	.loc	0 199 7 is_stmt 0               # fast_algorithms.c:199:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 199 19                        # fast_algorithms.c:199:19
	movl	%ecx, (%rax)
.LBB0_44:                               # %if.end287
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 202 5 is_stmt 1               # fast_algorithms.c:202:5
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	0 202 17 is_stmt 0              # fast_algorithms.c:202:17
	movl	$-987654321, 8(%rax)            # imm = 0xC521974F
	.loc	0 203 15 is_stmt 1              # fast_algorithms.c:203:15
	movq	-56(%rbp), %rax
	.loc	0 203 19 is_stmt 0              # fast_algorithms.c:203:19
	movl	-84(%rbp), %ecx
	.loc	0 203 20                        # fast_algorithms.c:203:20
	subl	$1, %ecx
	.loc	0 203 15                        # fast_algorithms.c:203:15
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	movl	8(%rax), %eax
	.loc	0 203 31                        # fast_algorithms.c:203:31
	movq	-24(%rbp), %rcx
	.loc	0 203 29                        # fast_algorithms.c:203:29
	addl	356(%rcx), %eax
	.loc	0 203 13                        # fast_algorithms.c:203:13
	movl	%eax, -92(%rbp)
	.loc	0 203 52                        # fast_algorithms.c:203:52
	cmpl	$-987654321, %eax               # imm = 0xC521974F
	.loc	0 203 9                         # fast_algorithms.c:203:9
	jle	.LBB0_46
# %bb.45:                               # %if.then301
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 204 21 is_stmt 1              # fast_algorithms.c:204:21
	movl	-92(%rbp), %ecx
	.loc	0 204 7 is_stmt 0               # fast_algorithms.c:204:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 204 19                        # fast_algorithms.c:204:19
	movl	%ecx, 8(%rax)
.LBB0_46:                               # %if.end305
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 205 15 is_stmt 1              # fast_algorithms.c:205:15
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	4(%rax), %eax
	.loc	0 205 29 is_stmt 0              # fast_algorithms.c:205:29
	movq	-24(%rbp), %rcx
	.loc	0 205 27                        # fast_algorithms.c:205:27
	addl	344(%rcx), %eax
	.loc	0 205 13                        # fast_algorithms.c:205:13
	movl	%eax, -92(%rbp)
	.loc	0 205 52                        # fast_algorithms.c:205:52
	movq	-56(%rbp), %rcx
	movslq	-84(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	.loc	0 205 50                        # fast_algorithms.c:205:50
	cmpl	8(%rcx), %eax
	.loc	0 205 9                         # fast_algorithms.c:205:9
	jle	.LBB0_48
# %bb.47:                               # %if.then318
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 206 21 is_stmt 1              # fast_algorithms.c:206:21
	movl	-92(%rbp), %ecx
	.loc	0 206 7 is_stmt 0               # fast_algorithms.c:206:7
	movq	-56(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	.loc	0 206 19                        # fast_algorithms.c:206:19
	movl	%ecx, 8(%rax)
.LBB0_48:                               # %if.end322
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 207 3 is_stmt 1               # fast_algorithms.c:207:3
	jmp	.LBB0_49
.LBB0_49:                               # %for.inc323
                                        #   in Loop: Header=BB0_5 Depth=1
	.loc	0 119 24                        # fast_algorithms.c:119:24
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
	.loc	0 119 3 is_stmt 0               # fast_algorithms.c:119:3
	jmp	.LBB0_5
.LBB0_50:                               # %for.end325
	.loc	0 209 8 is_stmt 1               # fast_algorithms.c:209:8
	movq	-56(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	8(%rax), %eax
	.loc	0 209 22 is_stmt 0              # fast_algorithms.c:209:22
	movq	-24(%rbp), %rcx
	.loc	0 209 20                        # fast_algorithms.c:209:20
	addl	352(%rcx), %eax
	.loc	0 209 6                         # fast_algorithms.c:209:6
	movl	%eax, -92(%rbp)
	.loc	0 211 14 is_stmt 1              # fast_algorithms.c:211:14
	cmpq	$0, -40(%rbp)
	.loc	0 211 7 is_stmt 0               # fast_algorithms.c:211:7
	je	.LBB0_52
# %bb.51:                               # %if.then335
	.loc	0 212 20 is_stmt 1              # fast_algorithms.c:212:20
	movq	-24(%rbp), %rdi
	.loc	0 212 25 is_stmt 0              # fast_algorithms.c:212:25
	movq	-8(%rbp), %rsi
	.loc	0 212 30                        # fast_algorithms.c:212:30
	movl	-12(%rbp), %edx
	.loc	0 212 33                        # fast_algorithms.c:212:33
	movq	-32(%rbp), %rcx
	.loc	0 212 5                         # fast_algorithms.c:212:5
	leaq	-48(%rbp), %r8
	callq	P7ViterbiTrace
	.loc	0 213 15 is_stmt 1              # fast_algorithms.c:213:15
	movq	-48(%rbp), %rcx
	.loc	0 213 6 is_stmt 0               # fast_algorithms.c:213:6
	movq	-40(%rbp), %rax
	.loc	0 213 13                        # fast_algorithms.c:213:13
	movq	%rcx, (%rax)
.LBB0_52:                               # %if.end336
	.loc	0 216 18 is_stmt 1              # fast_algorithms.c:216:18
	movl	-92(%rbp), %edi
	.loc	0 216 10 is_stmt 0              # fast_algorithms.c:216:10
	callq	Scorify
	.loc	0 216 3                         # fast_algorithms.c:216:3
	addq	$272, %rsp                      # imm = 0x110
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp1:
.Lfunc_end0:
	.size	P7Viterbi, .Lfunc_end0-P7Viterbi
	.cfi_endproc
                                        # -- End function
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	0                               # DW_CHILDREN_no
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
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0x17 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.short	12                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.long	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.long	.Laddr_table_base0              # DW_AT_addr_base
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.long	16                              # Length of String Offsets Set
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
	.section	.debug_str_offsets,"",@progbits
	.long	.Linfo_string0
	.long	.Linfo_string1
	.long	.Linfo_string2
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
