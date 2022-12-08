#!/bin/bash
### run.sh
### benchmark runner script
### Locate this script at each benchmark directory. e.g, 583simple/run.sh
### usage: ./run.sh ${benchmark_name} ${input} 
### e.g., ./run.sh compress compress.in or ./run.sh simple or ./run.sh wc cccp.c
### Note: Do NOT inlude inputs/ in ${input}, `./run.sh compress inputs/compress.in` will provide different results

PATH_MYPASS=~/final/EECS_583_Final_Project/Final_Project/build/finalprojectpass/LLVMHW1.so ### Action Required: Specify the path to your pass ###
NAME_MYPASS=-finalproject ### Action Required: Specify the name for your pass ###
BENCH=${1}.c
INPUT=${2}

setup(){
if [[ ! -z "${INPUT}" ]]; then
echo "INPUT:${INPUT}"
ln -sf input1/${INPUT} .
fi
}

cleanup(){
rm *.profdata
rm *.bc
rm *.prof
rm *.profraw
if [[ ! -z "${INPUT}" ]]; then
rm *.in
rm *.in.Z
fi
}

# clean up previous runs
cleanup
# Prepare input to run
setup
# # Convert source code to bitcode (IR)
# clang -emit-llvm -c ${1}.c -o ${1}.bc
# # Canonicalize natural loops
# opt -enable-new-pm=0 -loop-simplify ${1}.bc -o ${1}.ls.bc
# # Instrument profiler
# opt -enable-new-pm=0 -pgo-instr-gen -instrprof ${1}.ls.bc -o ${1}.ls.prof.bc
# # Generate binary executable with profiler embedded
# clang -fprofile-instr-generate ${1}.ls.prof.bc -o ${1}.prof

# Convert source code to bitcode (IR)
clang -O2 -emit-llvm -c ${1}.c -o ${1}.bc
# Canonicalize natural loops
opt -O2 -enable-new-pm=0 -loop-simplify ${1}.bc -o ${1}.ls.bc
# Instrument profiler
opt -O2 -enable-new-pm=0 -pgo-instr-gen -instrprof ${1}.ls.bc -o ${1}.ls.prof.bc
# Generate binary executable with profiler embedded
clang -O2 -fprofile-instr-generate ${1}.ls.prof.bc -o ${1}.prof

# Generate profiled data
./${1}.prof ${INPUT}
llvm-profdata merge -o ${1}.profdata default.profraw

# Prepare input to run
setup
# Apply your pass to bitcode (IR)
opt -enable-new-pm=0 -pgo-instr-use -pgo-test-profile-file=${1}.profdata -load ${PATH_MYPASS} ${NAME_MYPASS} < ${1}.bc > /dev/null
