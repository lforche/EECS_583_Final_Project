#NO_APP
gcc_compiled.:
.text
	.even
.globl _gen_tstsi
_gen_tstsi:
	link a6,#0
	movel a6@(8),sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr _gen_rtx
	unlk a6
	rts
	.even
.globl _gen_tsthi
_gen_tsthi:
	link a6,#0
	movel a6@(8),sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr _gen_rtx
	unlk a6
	rts
	.even
.globl _gen_tstqi
_gen_tstqi:
	link a6,#0
	movel a6@(8),sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr _gen_rtx
	unlk a6
	rts
	.even
.globl _gen_tstsf
_gen_tstsf:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),d2
	jbsr _start_sequence
	movel d2,d0
	btst #6,_target_flags+3
	jeq L5
	pea 4:w
	jbsr _gen_reg_rtx
	movel d0,sp@-
	clrl sp@-
	pea 27:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	pea 2:w
	jbsr _gen_rtvec
	movel d0,sp@-
	clrl sp@-
	pea 20:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #44,sp
	jra L6
L5:
	movel d0,d2
	movel d2,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr _gen_rtx
	movel d0,sp@-
	jbsr _emit_insn
	addw #20,sp
L6:
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _gen_tstdf
_gen_tstdf:
	link a6,#0
	moveml #0x2020,sp@-
	movel a6@(8),d2
	jbsr _start_sequence
	movel d2,d0
	btst #6,_target_flags+3
	jeq L8
	pea 4:w
	jbsr _gen_reg_rtx
	movel d0,sp@-
	clrl sp@-
	pea 27:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	pea 2:w
	jbsr _gen_rtvec
	movel d0,sp@-
	clrl sp@-
	pea 20:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #44,sp
	jra L9
L8:
	movel d0,d2
	movel d2,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr _gen_rtx
	movel d0,sp@-
	jbsr _emit_insn
	addw #20,sp
L9:
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-8),#0x404
	unlk a6
	rts
	.even
.globl _gen_cmpsi
_gen_cmpsi:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 43:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_cmphi
_gen_cmphi:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 43:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_cmpqi
_gen_cmpqi:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 43:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_cmpdf
_gen_cmpdf:
	link a6,#0
	moveml #0x3c20,sp@-
	movel a6@(8),d3
	movel a6@(12),d2
	jbsr _start_sequence
	movel d3,d4
	movel d2,d5
	btst #6,_target_flags+3
	jeq L14
	movel d2,sp@-
	movel d4,sp@-
	clrl sp@-
	pea 43:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,d2
	addw #32,sp
	pea 4:w
	jbsr _gen_reg_rtx
	movel d0,sp@-
	clrl sp@-
	pea 27:w
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	pea 2:w
	jbsr _gen_rtvec
	movel d0,sp@-
	clrl sp@-
	pea 20:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #44,sp
	jra L15
L14:
	movel d5,sp@-
	movel d4,sp@-
	clrl sp@-
	pea 43:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #36,sp
L15:
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-20),#0x43c
	unlk a6
	rts
	.even
.globl _gen_cmpsf
_gen_cmpsf:
	link a6,#0
	moveml #0x3c20,sp@-
	movel a6@(8),d3
	movel a6@(12),d2
	jbsr _start_sequence
	movel d3,d4
	movel d2,d5
	btst #6,_target_flags+3
	jeq L17
	movel d2,sp@-
	movel d4,sp@-
	clrl sp@-
	pea 43:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,d2
	addw #32,sp
	pea 4:w
	jbsr _gen_reg_rtx
	movel d0,sp@-
	clrl sp@-
	pea 27:w
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	pea 2:w
	jbsr _gen_rtvec
	movel d0,sp@-
	clrl sp@-
	pea 20:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #44,sp
	jra L18
L17:
	movel d5,sp@-
	movel d4,sp@-
	clrl sp@-
	pea 43:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #36,sp
L18:
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-20),#0x43c
	unlk a6
	rts
	.even
.globl _gen_movsi
_gen_movsi:
	link a6,#0
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr _gen_rtx
	unlk a6
	rts
	.even
.globl _gen_movhi
_gen_movhi:
	link a6,#0
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr _gen_rtx
	unlk a6
	rts
	.even
.globl _gen_movstricthi
_gen_movstricthi:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 36:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_movqi
_gen_movqi:
	link a6,#0
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr _gen_rtx
	unlk a6
	rts
	.even
.globl _gen_movstrictqi
_gen_movstrictqi:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 36:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_movsf
_gen_movsf:
	link a6,#0
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr _gen_rtx
	unlk a6
	rts
	.even
.globl _gen_movdf
_gen_movdf:
	link a6,#0
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr _gen_rtx
	unlk a6
	rts
	.even
.globl _gen_movdi
_gen_movdi:
	link a6,#0
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr _gen_rtx
	unlk a6
	rts
	.even
.globl _gen_pushasi
_gen_pushasi:
	link a6,#0
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr _gen_rtx
	unlk a6
	rts
	.even
.globl _gen_truncsiqi2
_gen_truncsiqi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 79:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_trunchiqi2
_gen_trunchiqi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 79:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_truncsihi2
_gen_truncsihi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 79:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_zero_extendhisi2
_gen_zero_extendhisi2:
	link a6,#0
	moveml #0x3c30,sp@-
	movel a6@(8),d5
	movel a6@(12),d2
	jbsr _start_sequence
	movel d5,d3
	movel d2,d4
	movel d3,sp@-
	movel d2,sp@-
	jbsr _make_safe_from
	movel d0,d2
	movel d2,d4
	movel d3,d5
	movel _const0_rtx,sp@-
	movel d5,sp@-
	clrl sp@-
	pea 25:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	lea _emit_insn,a3
	jbsr a3@
	movel d2,sp@-
	clrl sp@-
	movel d5,sp@-
	pea 2:w
	pea 35:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 36:w
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr a3@
	addw #48,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-24),#0xc3c
	unlk a6
	rts
	.even
.globl _gen_zero_extendqihi2
_gen_zero_extendqihi2:
	link a6,#0
	moveml #0x3c30,sp@-
	movel a6@(8),d5
	movel a6@(12),d2
	jbsr _start_sequence
	movel d5,d3
	movel d2,d4
	movel d3,sp@-
	movel d2,sp@-
	jbsr _make_safe_from
	movel d0,d2
	movel d2,d4
	movel d3,d5
	movel _const0_rtx,sp@-
	movel d5,sp@-
	clrl sp@-
	pea 25:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	lea _emit_insn,a3
	jbsr a3@
	movel d2,sp@-
	clrl sp@-
	movel d5,sp@-
	pea 1:w
	pea 35:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 36:w
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr a3@
	addw #48,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-24),#0xc3c
	unlk a6
	rts
	.even
.globl _gen_zero_extendqisi2
_gen_zero_extendqisi2:
	link a6,#0
	moveml #0x3c30,sp@-
	movel a6@(8),d5
	movel a6@(12),d2
	jbsr _start_sequence
	movel d5,d3
	movel d2,d4
	movel d3,sp@-
	movel d2,sp@-
	jbsr _make_safe_from
	movel d0,d2
	movel d2,d4
	movel d3,d5
	movel _const0_rtx,sp@-
	movel d5,sp@-
	clrl sp@-
	pea 25:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	lea _emit_insn,a3
	jbsr a3@
	movel d2,sp@-
	clrl sp@-
	movel d5,sp@-
	pea 1:w
	pea 35:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 36:w
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr a3@
	addw #48,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-24),#0xc3c
	unlk a6
	rts
	.even
.globl _gen_extendhisi2
_gen_extendhisi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 77:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_extendqihi2
_gen_extendqihi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 77:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_extendqisi2
_gen_extendqisi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 77:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_extendsfdf2
_gen_extendsfdf2:
	link a6,#0
	moveml #0x3c20,sp@-
	movel a6@(8),d5
	movel a6@(12),d2
	jbsr _start_sequence
	movel d5,d3
	movel d2,d4
	movel d3,d5
	movel d2,sp@-
	pea 11:w
	pea 80:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d5,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #32,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-20),#0x43c
	unlk a6
	rts
	.even
.globl _gen_truncdfsf2
_gen_truncdfsf2:
	link a6,#0
	moveml #0x3c20,sp@-
	movel a6@(8),d5
	movel a6@(12),d2
	jbsr _start_sequence
	movel d5,d3
	movel d2,d4
	movel d3,d5
	movel d2,sp@-
	pea 10:w
	pea 81:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d5,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #32,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-20),#0x43c
	unlk a6
	rts
	.even
.globl _gen_floatsisf2
_gen_floatsisf2:
	link a6,#0
	moveml #0x3c20,sp@-
	movel a6@(8),d5
	movel a6@(12),d2
	jbsr _start_sequence
	movel d5,d3
	movel d2,d4
	movel d3,d5
	movel d2,sp@-
	pea 10:w
	pea 82:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d5,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #32,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-20),#0x43c
	unlk a6
	rts
	.even
.globl _gen_floatsidf2
_gen_floatsidf2:
	link a6,#0
	moveml #0x3c20,sp@-
	movel a6@(8),d5
	movel a6@(12),d2
	jbsr _start_sequence
	movel d5,d3
	movel d2,d4
	movel d3,d5
	movel d2,sp@-
	pea 11:w
	pea 82:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d5,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #32,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-20),#0x43c
	unlk a6
	rts
	.even
.globl _gen_floathisf2
_gen_floathisf2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 10:w
	pea 82:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_floathidf2
_gen_floathidf2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 11:w
	pea 82:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_floatqisf2
_gen_floatqisf2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 10:w
	pea 82:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_floatqidf2
_gen_floatqidf2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 11:w
	pea 82:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_ftruncdf2
_gen_ftruncdf2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 11:w
	pea 83:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_ftruncsf2
_gen_ftruncsf2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 10:w
	pea 83:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_fixsfqi2
_gen_fixsfqi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 83:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_fixsfhi2
_gen_fixsfhi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 83:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_fixsfsi2
_gen_fixsfsi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 83:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_fixdfqi2
_gen_fixdfqi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 83:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_fixdfhi2
_gen_fixdfhi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 83:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_fixdfsi2
_gen_fixdfsi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 83:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_fix_truncsfsi2
_gen_fix_truncsfsi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 10:w
	pea 83:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	pea 4:w
	pea 83:w
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_fix_truncdfsi2
_gen_fix_truncdfsi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 11:w
	pea 83:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	pea 4:w
	pea 83:w
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_addsi3
_gen_addsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 44:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_addhi3
_gen_addhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 44:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_addqi3
_gen_addqi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 44:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_adddf3
_gen_adddf3:
	link a6,#-12
	moveml #0x3820,sp@-
	movel a6@(8),d2
	movel a6@(12),d3
	movel a6@(16),d4
	jbsr _start_sequence
	movel d2,a6@(-12)
	movel d3,a6@(-8)
	movel d4,a6@(-4)
	movel d4,sp@-
	movel d3,sp@-
	pea 11:w
	pea 44:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #36,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-28),#0x41c
	unlk a6
	rts
	.even
.globl _gen_addsf3
_gen_addsf3:
	link a6,#-12
	moveml #0x3820,sp@-
	movel a6@(8),d2
	movel a6@(12),d3
	movel a6@(16),d4
	jbsr _start_sequence
	movel d2,a6@(-12)
	movel d3,a6@(-8)
	movel d4,a6@(-4)
	movel d4,sp@-
	movel d3,sp@-
	pea 10:w
	pea 44:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #36,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-28),#0x41c
	unlk a6
	rts
	.even
.globl _gen_subsi3
_gen_subsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 45:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_subhi3
_gen_subhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 45:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_subqi3
_gen_subqi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 45:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_subdf3
_gen_subdf3:
	link a6,#-12
	moveml #0x3820,sp@-
	movel a6@(8),d2
	movel a6@(12),d3
	movel a6@(16),d4
	jbsr _start_sequence
	movel d2,a6@(-12)
	movel d3,a6@(-8)
	movel d4,a6@(-4)
	movel d4,sp@-
	movel d3,sp@-
	pea 11:w
	pea 45:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #36,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-28),#0x41c
	unlk a6
	rts
	.even
.globl _gen_subsf3
_gen_subsf3:
	link a6,#-12
	moveml #0x3820,sp@-
	movel a6@(8),d2
	movel a6@(12),d3
	movel a6@(16),d4
	jbsr _start_sequence
	movel d2,a6@(-12)
	movel d3,a6@(-8)
	movel d4,a6@(-4)
	movel d4,sp@-
	movel d3,sp@-
	pea 10:w
	pea 45:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #36,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-28),#0x41c
	unlk a6
	rts
	.even
.globl _gen_mulhi3
_gen_mulhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 47:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_mulhisi3
_gen_mulhisi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 47:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_mulsi3
_gen_mulsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 47:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_umulhi3
_gen_umulhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 50:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_umulhisi3
_gen_umulhisi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 50:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_umulsi3
_gen_umulsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 50:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_muldf3
_gen_muldf3:
	link a6,#-12
	moveml #0x3820,sp@-
	movel a6@(8),d2
	movel a6@(12),d3
	movel a6@(16),d4
	jbsr _start_sequence
	movel d2,a6@(-12)
	movel d3,a6@(-8)
	movel d4,a6@(-4)
	movel d4,sp@-
	movel d3,sp@-
	pea 11:w
	pea 47:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #36,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-28),#0x41c
	unlk a6
	rts
	.even
.globl _gen_mulsf3
_gen_mulsf3:
	link a6,#-12
	moveml #0x3820,sp@-
	movel a6@(8),d2
	movel a6@(12),d3
	movel a6@(16),d4
	jbsr _start_sequence
	movel d2,a6@(-12)
	movel d3,a6@(-8)
	movel d4,a6@(-4)
	movel d4,sp@-
	movel d3,sp@-
	pea 10:w
	pea 47:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #36,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-28),#0x41c
	unlk a6
	rts
	.even
.globl _gen_divhi3
_gen_divhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 48:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_divhisi3
_gen_divhisi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 48:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_divsi3
_gen_divsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 48:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_udivhi3
_gen_udivhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 51:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_udivhisi3
_gen_udivhisi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 51:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_udivsi3
_gen_udivsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 51:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_divdf3
_gen_divdf3:
	link a6,#-12
	moveml #0x3820,sp@-
	movel a6@(8),d2
	movel a6@(12),d3
	movel a6@(16),d4
	jbsr _start_sequence
	movel d2,a6@(-12)
	movel d3,a6@(-8)
	movel d4,a6@(-4)
	movel d4,sp@-
	movel d3,sp@-
	pea 11:w
	pea 48:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #36,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-28),#0x41c
	unlk a6
	rts
	.even
.globl _gen_divsf3
_gen_divsf3:
	link a6,#-12
	moveml #0x3820,sp@-
	movel a6@(8),d2
	movel a6@(12),d3
	movel a6@(16),d4
	jbsr _start_sequence
	movel d2,a6@(-12)
	movel d3,a6@(-8)
	movel d4,a6@(-4)
	movel d4,sp@-
	movel d3,sp@-
	pea 10:w
	pea 48:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #36,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-28),#0x41c
	unlk a6
	rts
	.even
.globl _gen_modhi3
_gen_modhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 49:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_modhisi3
_gen_modhisi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 49:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_umodhi3
_gen_umodhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 52:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_umodhisi3
_gen_umodhisi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 52:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_divmodsi4
_gen_divmodsi4:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(12),d2
	movel a6@(16),d3
	movel d3,sp@-
	movel d2,sp@-
	pea 4:w
	pea 49:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(20),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	movel d3,sp@-
	movel d2,sp@-
	pea 4:w
	pea 48:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	pea 2:w
	jbsr _gen_rtvec
	movel d0,sp@-
	clrl sp@-
	pea 20:w
	jbsr a2@
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _gen_udivmodsi4
_gen_udivmodsi4:
	link a6,#0
	moveml #0x3020,sp@-
	movel a6@(12),d2
	movel a6@(16),d3
	movel d3,sp@-
	movel d2,sp@-
	pea 4:w
	pea 52:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(20),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	movel d3,sp@-
	movel d2,sp@-
	pea 4:w
	pea 51:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	pea 2:w
	jbsr _gen_rtvec
	movel d0,sp@-
	clrl sp@-
	pea 20:w
	jbsr a2@
	moveml a6@(-12),#0x40c
	unlk a6
	rts
	.even
.globl _gen_andsi3
_gen_andsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 53:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_andhi3
_gen_andhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 53:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_andqi3
_gen_andqi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 53:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_iorsi3
_gen_iorsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 54:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_iorhi3
_gen_iorhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 54:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_iorqi3
_gen_iorqi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 54:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_xorsi3
_gen_xorsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 55:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_xorhi3
_gen_xorhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 55:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_xorqi3
_gen_xorqi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 55:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_negsi2
_gen_negsi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 46:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_neghi2
_gen_neghi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 46:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_negqi2
_gen_negqi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 46:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_negsf2
_gen_negsf2:
	link a6,#0
	moveml #0x3c20,sp@-
	movel a6@(8),d5
	movel a6@(12),d2
	jbsr _start_sequence
	movel d5,d3
	movel d2,d4
	movel d3,d5
	movel d2,sp@-
	pea 10:w
	pea 46:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d5,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #32,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-20),#0x43c
	unlk a6
	rts
	.even
.globl _gen_negdf2
_gen_negdf2:
	link a6,#0
	moveml #0x3c20,sp@-
	movel a6@(8),d5
	movel a6@(12),d2
	jbsr _start_sequence
	movel d5,d3
	movel d2,d4
	movel d3,d5
	movel d2,sp@-
	pea 11:w
	pea 46:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d5,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #32,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-20),#0x43c
	unlk a6
	rts
	.even
.globl _gen_abssf2
_gen_abssf2:
	link a6,#0
	moveml #0x3c20,sp@-
	movel a6@(8),d5
	movel a6@(12),d2
	jbsr _start_sequence
	movel d5,d3
	movel d2,d4
	movel d3,d5
	movel d2,sp@-
	pea 10:w
	pea 86:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d5,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #32,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-20),#0x43c
	unlk a6
	rts
	.even
.globl _gen_absdf2
_gen_absdf2:
	link a6,#0
	moveml #0x3c20,sp@-
	movel a6@(8),d5
	movel a6@(12),d2
	jbsr _start_sequence
	movel d5,d3
	movel d2,d4
	movel d3,d5
	movel d2,sp@-
	pea 11:w
	pea 86:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d5,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #32,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-20),#0x43c
	unlk a6
	rts
	.even
.globl _gen_one_cmplsi2
_gen_one_cmplsi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 56:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_one_cmplhi2
_gen_one_cmplhi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 56:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_one_cmplqi2
_gen_one_cmplqi2:
	link a6,#0
	movel a2,sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 56:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_ashlsi3
_gen_ashlsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 58:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_ashlhi3
_gen_ashlhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 58:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_ashlqi3
_gen_ashlqi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 58:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_ashrsi3
_gen_ashrsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 60:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_ashrhi3
_gen_ashrhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 60:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_ashrqi3
_gen_ashrqi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 60:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_lshlsi3
_gen_lshlsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 57:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_lshlhi3
_gen_lshlhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 57:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_lshlqi3
_gen_lshlqi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 57:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_lshrsi3
_gen_lshrsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 61:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_lshrhi3
_gen_lshrhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 61:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_lshrqi3
_gen_lshrqi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 61:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_rotlsi3
_gen_rotlsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 59:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_rotlhi3
_gen_rotlhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 59:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_rotlqi3
_gen_rotlqi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 59:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_rotrsi3
_gen_rotrsi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 62:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_rotrhi3
_gen_rotrhi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 2:w
	pea 62:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_rotrqi3
_gen_rotrqi3:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 1:w
	pea 62:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_extv
_gen_extv:
	link a6,#0
	movel a2,sp@-
	movel a6@(20),sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 89:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_extzv
_gen_extzv:
	link a6,#0
	movel a2,sp@-
	movel a6@(20),sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	pea 4:w
	pea 90:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_insv
_gen_insv:
	link a6,#0
	movel a2,sp@-
	movel a6@(20),sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	pea 4:w
	pea 90:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #20,sp
	movel d0,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_seq
_gen_seq:
	link a6,#0
	movel a2,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 68:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_sne
_gen_sne:
	link a6,#0
	movel a2,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 67:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_sgt
_gen_sgt:
	link a6,#0
	movel a2,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 70:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_sgtu
_gen_sgtu:
	link a6,#0
	movel a2,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 74:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_slt
_gen_slt:
	link a6,#0
	movel a2,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 72:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_sltu
_gen_sltu:
	link a6,#0
	movel a2,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 76:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_sge
_gen_sge:
	link a6,#0
	movel a2,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 69:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_sgeu
_gen_sgeu:
	link a6,#0
	movel a2,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 73:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_sle
_gen_sle:
	link a6,#0
	movel a2,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 71:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_sleu
_gen_sleu:
	link a6,#0
	movel a2,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 75:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_beq
_gen_beq:
	link a6,#0
	movel a2,sp@-
	movel _pc_rtx,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 38:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 68:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 42:w
	jbsr a2@
	movel d0,sp@-
	movel _pc_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_bne
_gen_bne:
	link a6,#0
	movel a2,sp@-
	movel _pc_rtx,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 38:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 67:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 42:w
	jbsr a2@
	movel d0,sp@-
	movel _pc_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_bgt
_gen_bgt:
	link a6,#0
	movel a2,sp@-
	movel _pc_rtx,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 38:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 70:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 42:w
	jbsr a2@
	movel d0,sp@-
	movel _pc_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_bgtu
_gen_bgtu:
	link a6,#0
	movel a2,sp@-
	movel _pc_rtx,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 38:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 74:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 42:w
	jbsr a2@
	movel d0,sp@-
	movel _pc_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_blt
_gen_blt:
	link a6,#0
	movel a2,sp@-
	movel _pc_rtx,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 38:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 72:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 42:w
	jbsr a2@
	movel d0,sp@-
	movel _pc_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_bltu
_gen_bltu:
	link a6,#0
	movel a2,sp@-
	movel _pc_rtx,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 38:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 76:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 42:w
	jbsr a2@
	movel d0,sp@-
	movel _pc_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_bge
_gen_bge:
	link a6,#0
	movel a2,sp@-
	movel _pc_rtx,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 38:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 69:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 42:w
	jbsr a2@
	movel d0,sp@-
	movel _pc_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_bgeu
_gen_bgeu:
	link a6,#0
	movel a2,sp@-
	movel _pc_rtx,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 38:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 73:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 42:w
	jbsr a2@
	movel d0,sp@-
	movel _pc_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_ble
_gen_ble:
	link a6,#0
	movel a2,sp@-
	movel _pc_rtx,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 38:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 71:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 42:w
	jbsr a2@
	movel d0,sp@-
	movel _pc_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_bleu
_gen_bleu:
	link a6,#0
	movel a2,sp@-
	movel _pc_rtx,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 38:w
	lea _gen_rtx,a2
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 75:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 42:w
	jbsr a2@
	movel d0,sp@-
	movel _pc_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_casesi_1
_gen_casesi_1:
	link a6,#-20
	moveml #0x3e30,sp@-
	movel a6@(8),d5
	movel a6@(12),d6
	movel a6@(16),d3
	movel a6@(20),d4
	movel a6@(24),d2
	jbsr _start_sequence
	movel d5,a6@(-20)
	movel d6,a6@(-16)
	movel d3,a6@(-12)
	movel d4,a6@(-8)
	movel d2,a6@(-4)
	movel d6,sp@-
	movel d5,sp@-
	pea 4:w
	pea 44:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d4,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	lea _emit_insn,a3
	jbsr a3@
	addw #36,sp
	movel d4,sp@-
	movel d3,sp@-
	clrl sp@-
	pea 43:w
	jbsr a2@
	movel d0,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr a3@
	addw #36,sp
	movel _pc_rtx,sp@-
	movel d2,sp@-
	clrl sp@-
	pea 38:w
	jbsr a2@
	addw #12,sp
	movel d0,sp@-
	movel _const0_rtx,sp@-
	movel _cc0_rtx,sp@-
	clrl sp@-
	pea 76:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	clrl sp@-
	pea 42:w
	jbsr a2@
	movel d0,sp@-
	movel _pc_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_jump_insn
	addw #40,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-48),#0xc7c
	unlk a6
	rts
	.even
.globl _gen_casesi_2
_gen_casesi_2:
	link a6,#-12
	moveml #0x3820,sp@-
	movel a6@(8),d2
	movel a6@(12),d4
	movel a6@(16),d3
	jbsr _start_sequence
	movel d2,a6@(-12)
	movel d4,a6@(-8)
	movel d3,a6@(-4)
	movel d4,sp@-
	pea 2:w
	pea 37:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_insn
	addw #32,sp
	movel d3,sp@-
	clrl sp@-
	pea 38:w
	jbsr a2@
	movel d0,sp@-
	clrl sp@-
	pea 26:w
	jbsr a2@
	movel d0,sp@-
	movel d2,sp@-
	movel _pc_rtx,sp@-
	pea 4:w
	pea 44:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	movel _pc_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	addw #16,sp
	movel d0,sp@-
	pea 2:w
	jbsr _gen_rtvec
	movel d0,sp@-
	clrl sp@-
	pea 20:w
	jbsr a2@
	movel d0,sp@-
	jbsr _emit_jump_insn
	addw #52,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-28),#0x41c
	unlk a6
	rts
	.even
.globl _gen_casesi
_gen_casesi:
	link a6,#-20
	moveml #0x2038,sp@-
	movel a6@(12),d2
	jbsr _start_sequence
	movel a6@(8),a6@(-20)
	movel d2,a6@(-16)
	movel a6@(16),a6@(-12)
	movel a6@(20),a6@(-8)
	movel a6@(24),a6@(-4)
	movel d2,sp@-
	pea 4:w
	jbsr _negate_rtx
	movel d0,a6@(-16)
	pea 4:w
	lea _gen_reg_rtx,a2
	jbsr a2@
	movel d0,d2
	movel a6@(-4),sp@-
	movel d2,sp@-
	movel a6@(-12),sp@-
	movel a6@(-16),sp@-
	movel a6@(-20),sp@-
	jbsr _gen_casesi_1
	movel d0,sp@-
	lea _emit_insn,a3
	jbsr a3@
	addw #36,sp
	movel a6@(-8),sp@-
	clrl sp@-
	pea 38:w
	lea _gen_rtx,a4
	jbsr a4@
	movel d0,sp@-
	pea 2:w
	clrl sp@-
	pea 30:w
	jbsr a4@
	addw #12,sp
	movel d0,sp@-
	movel d2,sp@-
	pea 4:w
	pea 47:w
	jbsr a4@
	addw #16,sp
	movel d0,sp@-
	pea 4:w
	pea 44:w
	jbsr a4@
	movel d0,sp@-
	pea 2:w
	jbsr _memory_address_noforce
	addw #36,sp
	movel a6@(-8),sp@-
	movel d0,sp@-
	pea 2:w
	jbsr a2@
	addqw #4,sp
	movel d0,sp@-
	jbsr _gen_casesi_2
	movel d0,sp@-
	jbsr a3@
	addw #16,sp
	jbsr _gen_sequence
	movel d0,d2
	jbsr _end_sequence
	movel d2,d0
	moveml a6@(-36),#0x1c04
	unlk a6
	rts
	.even
.globl _gen_jump
_gen_jump:
	link a6,#0
	movel a2,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 38:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel _pc_rtx,sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_call
_gen_call:
	link a6,#0
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 28:w
	jbsr _gen_rtx
	unlk a6
	rts
	.even
.globl _gen_call_value
_gen_call_value:
	link a6,#0
	movel a2,sp@-
	movel a6@(16),sp@-
	movel a6@(12),sp@-
	clrl sp@-
	pea 28:w
	lea _gen_rtx,a2
	jbsr a2@
	movel d0,sp@-
	movel a6@(8),sp@-
	clrl sp@-
	pea 25:w
	jbsr a2@
	movel a6@(-4),a2
	unlk a6
	rts
	.even
.globl _gen_return
_gen_return:
	link a6,#0
	clrl sp@-
	pea 29:w
	jbsr _gen_rtx
	unlk a6
	rts
