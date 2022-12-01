

# Include standard template for this suite
-include ../../Makefile.defaults
RR=/home/armandb/llvm-project/build/bin/clang
llc=/home/armandb/llvm-project/build/bin/llc
dis=/home/armandb/llvm-project/build/bin/llvm-dis
opt=/home/armandb/llvm-project/build/bin/opt
# CC=/home/armandb/llvm-project/build/bin/clang
CC=gcc

# RR=gcc
# RR=x86_64-conda-linux-gnu-gcc
#TODO all used to have DSPEC_CPU DNDEBUG. Just put it back right before OPT. a2m doesn't have dspec_cpu
all:
	$(CC) $(CFLAGS) -c -o alphabet.o -DSPEC_CPU      -DNDEBUG $(OPT)                alphabet.c
	$(CC) $(CFLAGS) -c -o core_algorithms.o -DSPEC_CPU      -DNDEBUG $(OPT)                core_algorithms.c
	$(CC) $(CFLAGS) -c -o debug.o -DSPEC_CPU      -DNDEBUG $(OPT)                debug.c
	$(CC) $(CFLAGS) -c -o display.o -DSPEC_CPU      -DNDEBUG $(OPT)                display.c
	$(CC) $(CFLAGS) -c -o emit.o -DSPEC_CPU      -DNDEBUG $(OPT)                emit.c
	$(CC) $(CFLAGS) -c -o emulation.o -DSPEC_CPU      -DNDEBUG $(OPT)                emulation.c
	#
	$(CC) $(CFLAGS) -c -o fast_algorithms.o -DSPEC_CPU   -DNDEBUG $(OPT) fast_algorithms.c -msse4.1 #-march=native #native was doing SOMETHING
	@# $(RR) $(CFLAGS) -c -S -o fast_algorithms.s -DSPEC_CPU      -DNDEBUG $(OPT) fast_algorithms.c #-march=native
	#
	$(CC) $(CFLAGS) -c -o histogram.o -DSPEC_CPU      -DNDEBUG $(OPT)                histogram.c
	$(CC) $(CFLAGS) -c -o hmmio.o -DSPEC_CPU      -DNDEBUG $(OPT)                hmmio.c
	$(CC) $(CFLAGS) -c -o hmmcalibrate.o -DSPEC_CPU      -DNDEBUG $(OPT)                hmmcalibrate.c
	$(CC) $(CFLAGS) -c -o hmmsearch.o -DSPEC_CPU      -DNDEBUG $(OPT)                hmmsearch.c
	$(CC) $(CFLAGS) -c -o mathsupport.o -DSPEC_CPU      -DNDEBUG $(OPT)                mathsupport.c
	$(CC) $(CFLAGS) -c -o masks.o -DSPEC_CPU      -DNDEBUG $(OPT)                masks.c
	$(CC) $(CFLAGS) -c -o misc.o -DSPEC_CPU      -DNDEBUG $(OPT)                misc.c
	$(CC) $(CFLAGS) -c -o modelmakers.o -DSPEC_CPU      -DNDEBUG $(OPT)                modelmakers.c
	$(CC) $(CFLAGS) -c -o plan7.o -DSPEC_CPU      -DNDEBUG $(OPT)                plan7.c
	$(CC) $(CFLAGS) -c -o plan9.o -DSPEC_CPU      -DNDEBUG $(OPT)                plan9.c
	$(CC) $(CFLAGS) -c -o postprob.o -DSPEC_CPU      -DNDEBUG $(OPT)                postprob.c
	$(CC) $(CFLAGS) -c -o prior.o -DSPEC_CPU      -DNDEBUG $(OPT)                prior.c
	$(CC) $(CFLAGS) -c -o tophits.o -DSPEC_CPU      -DNDEBUG $(OPT)                tophits.c
	$(CC) $(CFLAGS) -c -o trace.o -DSPEC_CPU      -DNDEBUG $(OPT)                trace.c
	$(CC) $(CFLAGS) -c -o ucbqsort.o -DSPEC_CPU      -DNDEBUG $(OPT)                ucbqsort.c
	$(CC) $(CFLAGS) -c -o a2m.o       -DNDEBUG $(OPT)                a2m.c
	$(CC) $(CFLAGS) -c -o aligneval.o -DSPEC_CPU      -DNDEBUG $(OPT)                aligneval.c
	$(CC) $(CFLAGS) -c -o alignio.o -DSPEC_CPU      -DNDEBUG $(OPT)                alignio.c
	$(CC) $(CFLAGS) -c -o clustal.o -DSPEC_CPU      -DNDEBUG $(OPT)                clustal.c
	$(CC) $(CFLAGS) -c -o cluster.o -DSPEC_CPU      -DNDEBUG $(OPT)                cluster.c
	$(CC) $(CFLAGS) -c -o dayhoff.o -DSPEC_CPU      -DNDEBUG $(OPT)                dayhoff.c
	$(CC) $(CFLAGS) -c -o eps.o -DSPEC_CPU      -DNDEBUG $(OPT)                eps.c
	$(CC) $(CFLAGS) -c -o file.o -DSPEC_CPU      -DNDEBUG $(OPT)                file.c
	$(CC) $(CFLAGS) -c -o getopt.o -DSPEC_CPU      -DNDEBUG $(OPT)                getopt.c
	$(CC) $(CFLAGS) -c -o gki.o -DSPEC_CPU      -DNDEBUG $(OPT)                gki.c
	$(CC) $(CFLAGS) -c -o gsi.o -DSPEC_CPU      -DNDEBUG $(OPT)                gsi.c
	$(CC) $(CFLAGS) -c -o hsregex.o -DSPEC_CPU      -DNDEBUG $(OPT)                hsregex.c
	$(CC) $(CFLAGS) -c -o iupac.o -DSPEC_CPU      -DNDEBUG $(OPT)                iupac.c
	$(CC) $(CFLAGS) -c -o msa.o -DSPEC_CPU      -DNDEBUG $(OPT)                msa.c
	$(CC) $(CFLAGS) -c -o msf.o -DSPEC_CPU      -DNDEBUG $(OPT)                msf.c
	$(CC) $(CFLAGS) -c -o phylip.o -DSPEC_CPU      -DNDEBUG $(OPT)                phylip.c
	$(CC) $(CFLAGS) -c -o revcomp.o -DSPEC_CPU      -DNDEBUG $(OPT)                revcomp.c
	$(CC) $(CFLAGS) -c -o rk.o -DSPEC_CPU      -DNDEBUG $(OPT)                rk.c
	$(CC) $(CFLAGS) -c -o selex.o -DSPEC_CPU      -DNDEBUG $(OPT)                selex.c
	$(CC) $(CFLAGS) -c -o seqencode.o -DSPEC_CPU      -DNDEBUG $(OPT)                seqencode.c
	$(CC) $(CFLAGS) -c -o shuffle.o -DSPEC_CPU      -DNDEBUG $(OPT)                shuffle.c
	$(CC) $(CFLAGS) -c -o sqerror.o -DSPEC_CPU      -DNDEBUG $(OPT)                sqerror.c
	$(CC) $(CFLAGS) -c -o sqio.o -DSPEC_CPU      -DNDEBUG $(OPT)                sqio.c
	$(CC) $(CFLAGS) -c -o squidcore.o -DSPEC_CPU      -DNDEBUG $(OPT)                squidcore.c
	$(CC) $(CFLAGS) -c -o sre_ctype.o -DSPEC_CPU      -DNDEBUG $(OPT)                sre_ctype.c
	$(CC) $(CFLAGS) -c -o sre_math.o -DSPEC_CPU      -DNDEBUG $(OPT)                sre_math.c
	$(CC) $(CFLAGS) -c -o sre_random.o -DSPEC_CPU      -DNDEBUG $(OPT)                sre_random.c
	$(CC) $(CFLAGS) -c -o sre_string.o -DSPEC_CPU      -DNDEBUG $(OPT)                sre_string.c
	$(CC) $(CFLAGS) -c -o ssi.o -DSPEC_CPU      -DNDEBUG $(OPT)                ssi.c
	$(CC) $(CFLAGS) -c -o stack.o -DSPEC_CPU      -DNDEBUG $(OPT)                stack.c
	$(CC) $(CFLAGS) -c -o stockholm.o -DSPEC_CPU      -DNDEBUG $(OPT)                stockholm.c
	$(CC) $(CFLAGS) -c -o translate.o -DSPEC_CPU      -DNDEBUG $(OPT)                translate.c
	$(CC) $(CFLAGS) -c -o types.o -DSPEC_CPU      -DNDEBUG $(OPT)                types.c
	$(CC) $(CFLAGS) -c -o vectorops.o -DSPEC_CPU      -DNDEBUG $(OPT)                vectorops.c
	$(CC) $(CFLAGS) -c -o weight.o -DSPEC_CPU      -DNDEBUG $(OPT)                weight.c
	$(CC) $(CFLAGS)    -DNDEBUG $(OPT)          alphabet.o core_algorithms.o debug.o display.o emit.o emulation.o fast_algorithms.o histogram.o hmmio.o hmmcalibrate.o hmmsearch.o mathsupport.o masks.o misc.o modelmakers.o plan7.o plan9.o postprob.o prior.o tophits.o trace.o ucbqsort.o a2m.o aligneval.o alignio.o clustal.o cluster.o dayhoff.o eps.o file.o getopt.o gki.o gsi.o hsregex.o iupac.o msa.o msf.o phylip.o revcomp.o rk.o selex.o seqencode.o shuffle.o sqerror.o sqio.o squidcore.o sre_ctype.o sre_math.o sre_random.o sre_string.o ssi.o stack.o stockholm.o translate.o types.o vectorops.o weight.o             -lm        -o hmmer #all

# vecSi128:
# 	#VEC
# 	$(RR) $(CFLAGS) -c -o fast_algorithms.o -DSPEC_CPU -DUSE_VEC -DSI128 -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
# 	$(RR) $(CFLAGS) -c -S -o fa_vecSi128.s -DSPEC_CPU  -DUSE_VEC -DSI128 -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
# 	$(RR) $(CFLAGS)    -DNDEBUG $(OPT)          alphabet.o core_algorithms.o debug.o display.o emit.o emulation.o fast_algorithms.o histogram.o hmmio.o hmmcalibrate.o hmmsearch.o mathsupport.o masks.o misc.o modelmakers.o plan7.o plan9.o postprob.o prior.o tophits.o trace.o ucbqsort.o a2m.o aligneval.o alignio.o clustal.o cluster.o dayhoff.o eps.o file.o getopt.o gki.o gsi.o hsregex.o iupac.o msa.o msf.o phylip.o revcomp.o rk.o selex.o seqencode.o shuffle.o sqerror.o sqio.o squidcore.o sre_ctype.o sre_math.o sre_random.o sre_string.o ssi.o stack.o stockholm.o translate.o types.o vectorops.o weight.o             -lm        -o hmmer_si128

# vecSi128_native:
# 	#VEC NATIVE
# 	$(RR) $(CFLAGS) -c -o fast_algorithms.o -DSPEC_CPU     -DUSE_VEC -DSI128 -DNDEBUG $(OPT) fast_algorithms.c -march=native #native was doing SOMETHING
# 	$(RR) $(CFLAGS) -c -gline-tables-only -S -o fa_vecSi128Native.s -DSPEC_CPU  -DUSE_VEC -DSI128 -DNDEBUG $(OPT) fast_algorithms.c -march=native	
# 	$(RR) $(CFLAGS)    -DNDEBUG $(OPT)          alphabet.o core_algorithms.o debug.o display.o emit.o emulation.o fast_algorithms.o histogram.o hmmio.o hmmcalibrate.o hmmsearch.o mathsupport.o masks.o misc.o modelmakers.o plan7.o plan9.o postprob.o prior.o tophits.o trace.o ucbqsort.o a2m.o aligneval.o alignio.o clustal.o cluster.o dayhoff.o eps.o file.o getopt.o gki.o gsi.o hsregex.o iupac.o msa.o msf.o phylip.o revcomp.o rk.o selex.o seqencode.o shuffle.o sqerror.o sqio.o squidcore.o sre_ctype.o sre_math.o sre_random.o sre_string.o ssi.o stack.o stockholm.o translate.o types.o vectorops.o weight.o             -lm        -o hmmer_si128N

vecSi32:
	$(RR) $(CFLAGS) -c -o fast_algorithms.o -DSPEC_CPU -DUSE_VEC -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
	$(RR) $(CFLAGS) -c -S -gline-tables-only -o fa_vecSi32.s -DSPEC_CPU  -DUSE_VEC -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
	$(RR) $(CFLAGS)    -DNDEBUG $(OPT)          alphabet.o core_algorithms.o debug.o display.o emit.o emulation.o fast_algorithms.o \
	histogram.o hmmio.o hmmcalibrate.o hmmsearch.o mathsupport.o masks.o misc.o modelmakers.o plan7.o plan9.o postprob.o prior.o \
	tophits.o trace.o ucbqsort.o a2m.o aligneval.o alignio.o clustal.o cluster.o dayhoff.o eps.o file.o getopt.o gki.o gsi.o \
	hsregex.o iupac.o msa.o msf.o phylip.o revcomp.o rk.o selex.o seqencode.o shuffle.o sqerror.o sqio.o squidcore.o sre_ctype.o \
	sre_math.o sre_random.o sre_string.o ssi.o stack.o stockholm.o translate.o types.o vectorops.o weight.o             -lm        -o hmmer_si32

vecSi32FromAsm:
# 	$(RR) $(CFLAGS) -gline-tables-only -c -emit-llvm -o fa_vecSi32.bc -DSPEC_CPU -DUSE_VEC -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
# 	$(RR) $(CFLAGS) -c -emit-llvm -o fa_vecSi32.bc -DSPEC_CPU -DUSE_VEC -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
# 	$(llc) fa_vecSi32_ASM.bc -O3 -o fa_vecSi32_ASM.s
	$(RR) -c fa_vecSi32_handASM.s -O3 -o fast_algorithms.o
	$(RR) $(CFLAGS)    -DNDEBUG $(OPT)          alphabet.o core_algorithms.o debug.o display.o emit.o emulation.o fast_algorithms.o \
	histogram.o hmmio.o hmmcalibrate.o hmmsearch.o mathsupport.o masks.o misc.o modelmakers.o plan7.o plan9.o postprob.o prior.o \
	 tophits.o trace.o ucbqsort.o a2m.o aligneval.o alignio.o clustal.o cluster.o dayhoff.o eps.o file.o getopt.o gki.o gsi.o \
	 hsregex.o iupac.o msa.o msf.o phylip.o revcomp.o rk.o selex.o seqencode.o shuffle.o sqerror.o sqio.o squidcore.o sre_ctype.o \
	 sre_math.o sre_random.o sre_string.o ssi.o stack.o stockholm.o translate.o types.o vectorops.o weight.o             -lm        -o hmmer_si32



vecSi32_native:
	$(RR) $(CFLAGS) -c -o fast_algorithms.o -DSPEC_CPU -DUSE_VEC -DNDEBUG $(OPT) fast_algorithms.c -msse4.1 -march=native
	$(RR) $(CFLAGS) -c -gline-tables-only -S -o fa_vecSi32Native.s -DSPEC_CPU  -DUSE_VEC -DNDEBUG $(OPT) fast_algorithms.c -msse4.1 -march=native
	$(RR) $(CFLAGS)    -DNDEBUG $(OPT)          alphabet.o core_algorithms.o debug.o display.o emit.o emulation.o fast_algorithms.o histogram.o hmmio.o hmmcalibrate.o hmmsearch.o mathsupport.o masks.o misc.o modelmakers.o plan7.o plan9.o postprob.o prior.o tophits.o trace.o ucbqsort.o a2m.o aligneval.o alignio.o clustal.o cluster.o dayhoff.o eps.o file.o getopt.o gki.o gsi.o hsregex.o iupac.o msa.o msf.o phylip.o revcomp.o rk.o selex.o seqencode.o shuffle.o sqerror.o sqio.o squidcore.o sre_ctype.o sre_math.o sre_random.o sre_string.o ssi.o stack.o stockholm.o translate.o types.o vectorops.o weight.o             -lm        -o hmmer_si32N

orig:
	#ORIG
	$(RR) $(CFLAGS) -c -gline-tables-only -emit-llvm -o fa_orig.bc -DSPEC_CPU  -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
	$(dis) fa_orig.bc -o fa_orig.ll 
	$(opt) -S -O3 fa_orig.bc -o fa_orig2.ll

	$(RR) $(CFLAGS) -c -o fast_algorithms.o -DSPEC_CPU     -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
	$(RR) $(CFLAGS) -c -gline-tables-only -S -o fa_orig.s -DSPEC_CPU  -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
	$(RR) $(CFLAGS)    -DNDEBUG $(OPT)          alphabet.o core_algorithms.o debug.o display.o emit.o emulation.o fast_algorithms.o \
	histogram.o hmmio.o hmmcalibrate.o hmmsearch.o mathsupport.o masks.o misc.o modelmakers.o plan7.o plan9.o postprob.o prior.o tophits.o \
	trace.o ucbqsort.o a2m.o aligneval.o alignio.o clustal.o cluster.o dayhoff.o eps.o file.o getopt.o gki.o gsi.o hsregex.o iupac.o msa.o \
	msf.o phylip.o revcomp.o rk.o selex.o seqencode.o shuffle.o sqerror.o sqio.o squidcore.o sre_ctype.o sre_math.o sre_random.o sre_string.o \
	ssi.o stack.o stockholm.o translate.o types.o vectorops.o weight.o             -lm        -o hmmer_orig

temp:
	$(RR) $(CFLAGS) -c -gline-tables-only -emit-llvm -o fa_temp.bc -DSPEC_CPU -DUSE_TEMP -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
	$(dis) fa_temp.bc -o fa_temp.ll 
	$(opt) -S -O3 fa_temp.bc -o fa_temp2.ll

	$(RR) $(CFLAGS) -c -o fast_algorithms.o -DSPEC_CPU   -DUSE_TEMP  -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
	$(RR) $(CFLAGS) -c -gline-tables-only -S -o fa_temp.s -DSPEC_CPU -DUSE_TEMP  -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
	$(RR) $(CFLAGS)    -DNDEBUG $(OPT)          alphabet.o core_algorithms.o debug.o display.o emit.o emulation.o fast_algorithms.o \
	histogram.o hmmio.o hmmcalibrate.o hmmsearch.o mathsupport.o masks.o misc.o modelmakers.o plan7.o plan9.o postprob.o prior.o tophits.o \
	trace.o ucbqsort.o a2m.o aligneval.o alignio.o clustal.o cluster.o dayhoff.o eps.o file.o getopt.o gki.o gsi.o hsregex.o iupac.o msa.o \
	msf.o phylip.o revcomp.o rk.o selex.o seqencode.o shuffle.o sqerror.o sqio.o squidcore.o sre_ctype.o sre_math.o sre_random.o sre_string.o \
	ssi.o stack.o stockholm.o translate.o types.o vectorops.o weight.o             -lm        -o hmmer_temp




orig_native:
	#ORIG NATIVE
	$(RR) $(CFLAGS) -c -o fast_algorithms.o -DSPEC_CPU     -DNDEBUG $(OPT) fast_algorithms.c -march=native #native was doing SOMETHING
	$(RR) $(CFLAGS) -c -gline-tables-only -S -o fa_origNative.s -DSPEC_CPU  -DNDEBUG $(OPT) fast_algorithms.c -march=native	
	$(RR) $(CFLAGS)    -DNDEBUG $(OPT)          alphabet.o core_algorithms.o debug.o display.o emit.o emulation.o fast_algorithms.o histogram.o hmmio.o hmmcalibrate.o hmmsearch.o mathsupport.o masks.o misc.o modelmakers.o plan7.o plan9.o postprob.o prior.o tophits.o trace.o ucbqsort.o a2m.o aligneval.o alignio.o clustal.o cluster.o dayhoff.o eps.o file.o getopt.o gki.o gsi.o hsregex.o iupac.o msa.o msf.o phylip.o revcomp.o rk.o selex.o seqencode.o shuffle.o sqerror.o sqio.o squidcore.o sre_ctype.o sre_math.o sre_random.o sre_string.o ssi.o stack.o stockholm.o translate.o types.o vectorops.o weight.o             -lm        -o hmmer_origN















demo:
	$(RR) $(CFLAGS) -c -S -o fa_control.s -DSPEC_CPU  -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
	$(RR) $(CFLAGS) -c -gline-tables-only -S -o fa_linetable.s -DSPEC_CPU  -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
	$(RR) $(CFLAGS) -c -g -S -o fa_g.s -DSPEC_CPU  -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
	$(RR) $(CFLAGS) -c -g -S -fverbose-asm -o fa_gverbose.s -DSPEC_CPU  -DNDEBUG $(OPT) fast_algorithms.c -msse4.1

cfg:
	$(RR) $(CFLAGS) -c -emit-llvm -o fast_algorithms.bc -DSPEC_CPU     -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
	$(llc) -o fa_orig.s -view-machine-block-freq-propagation-dags=fraction -view-bfi-func-name=P7Viterbi -O3 fast_algorithms.bc

asm_mod:
	$(RR) $(CFLAGS) -c -o fa_control.o -DSPEC_CPU  -DNDEBUG $(OPT) fa_control.s -msse4.1	
















# gcc_orig:
# 	gcc $(CFLAGS) -c -o fast_algorithms.o -DSPEC_CPU     -DNDEBUG $(OPT) fast_algorithms.c 
# 	gcc $(CFLAGS) -c -S -o fa_gccOrig.s -DSPEC_CPU  -DNDEBUG $(OPT) fast_algorithms.c	
# 	gcc $(CFLAGS)    -DNDEBUG $(OPT)          alphabet.o core_algorithms.o debug.o display.o emit.o emulation.o fast_algorithms.o histogram.o hmmio.o hmmcalibrate.o hmmsearch.o mathsupport.o masks.o misc.o modelmakers.o plan7.o plan9.o postprob.o prior.o tophits.o trace.o ucbqsort.o a2m.o aligneval.o alignio.o clustal.o cluster.o dayhoff.o eps.o file.o getopt.o gki.o gsi.o hsregex.o iupac.o msa.o msf.o phylip.o revcomp.o rk.o selex.o seqencode.o shuffle.o sqerror.o sqio.o squidcore.o sre_ctype.o sre_math.o sre_random.o sre_string.o ssi.o stack.o stockholm.o translate.o types.o vectorops.o weight.o             -lm        -o hmmer_gcc


# gcc_orig_native:
# 	gcc $(CFLAGS) -c -o fast_algorithms.o -DSPEC_CPU     -DNDEBUG $(OPT) fast_algorithms.c -march=native #native was doing SOMETHING
# 	gcc $(CFLAGS) -c -S -o fa_gccOrigNative.s -DSPEC_CPU  -DNDEBUG $(OPT) fast_algorithms.c -march=native	
# 	gcc $(CFLAGS)    -DNDEBUG $(OPT)          alphabet.o core_algorithms.o debug.o display.o emit.o emulation.o fast_algorithms.o histogram.o hmmio.o hmmcalibrate.o hmmsearch.o mathsupport.o masks.o misc.o modelmakers.o plan7.o plan9.o postprob.o prior.o tophits.o trace.o ucbqsort.o a2m.o aligneval.o alignio.o clustal.o cluster.o dayhoff.o eps.o file.o getopt.o gki.o gsi.o hsregex.o iupac.o msa.o msf.o phylip.o revcomp.o rk.o selex.o seqencode.o shuffle.o sqerror.o sqio.o squidcore.o sre_ctype.o sre_math.o sre_random.o sre_string.o ssi.o stack.o stockholm.o translate.o types.o vectorops.o weight.o             -lm        -o hmmer_gccN

# gcc_si32:
# 	gcc $(CFLAGS) -c -o fast_algorithms.o -DSPEC_CPU -DUSE_VEC -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
# 	gcc $(CFLAGS) -c -S -o fa_gccVecSi32.s -DSPEC_CPU  -DUSE_VEC -DNDEBUG $(OPT) fast_algorithms.c -msse4.1
# 	gcc $(CFLAGS)    -DNDEBUG $(OPT)          alphabet.o core_algorithms.o debug.o display.o emit.o emulation.o fast_algorithms.o histogram.o hmmio.o hmmcalibrate.o hmmsearch.o mathsupport.o masks.o misc.o modelmakers.o plan7.o plan9.o postprob.o prior.o tophits.o trace.o ucbqsort.o a2m.o aligneval.o alignio.o clustal.o cluster.o dayhoff.o eps.o file.o getopt.o gki.o gsi.o hsregex.o iupac.o msa.o msf.o phylip.o revcomp.o rk.o selex.o seqencode.o shuffle.o sqerror.o sqio.o squidcore.o sre_ctype.o sre_math.o sre_random.o sre_string.o ssi.o stack.o stockholm.o translate.o types.o vectorops.o weight.o             -lm        -o hmmer_gccSi32N



arm:
	aarch64-linux-gcc $(CFLAGS) -c -S -o fast_algorithms_sve.s -DSPEC_CPU   -DNDEBUG $(OPT)       fast_algorithms.c #create sve asm
	aarch64-linux-gcc $(CFLAGS) -c -S -o fast_algorithms_nosve.s -DSPEC_CPU   -DNDEBUG $(OPT) -fno-tree-vectorize       fast_algorithms.c #create no vec asm
	aarch64-linux-gcc $(CFLAGS) -c -S -o fast_algorithms_neon.s -DSPEC_CPU   -DNDEBUG $(OPT) -march=armv8-a       fast_algorithms.c #create sve asm


clean:
	rm *.o
	rm hmmer
# $(CC) $(CFLAGS) -c -emit-llvm -o fast_algorithms.bc -DSPEC_CPU      -DNDEBUG $(OPT)                fast_algorithms.c
# /home/armandb/llvm_6_0_1/build/bin/llc -filetype=asm fast_algorithms.bc -o fast_algorithms.s                          #create x86 asm 
# $(CC) $(CFLAGS) -c -emit-llvm -S -o fast_algorithms.ll -DSPEC_CPU      -DNDEBUG $(OPT)                fast_algorithms.c #create llvm ir from clang
#$(CC) $(CFLAGS) -c -emit-llvm -S -o fast_algorithms.ll -DSPEC_CPU      -DNDEBUG $(OPT)                fast_algorithms.c
#$(CC) $(CFLAGS) -c -emit-llvm -S -o fast_algorithms_novec.ll -DSPEC_CPU      -DNDEBUG $(OPT) -fno-vectorize -fno-tree-vectorize -fno-slp-vectorize               fast_algorithms.c
#gcc $(CFLAGS) -c -S -o fast_algorithms.s -DSPEC_CPU      -DNDEBUG $(OPT)   -fno-tree-vectorize           fast_algorithms.c #adding/removing the msse4.1 changes the code
