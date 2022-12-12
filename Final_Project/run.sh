#!/bin/bash
### run.sh
### benchmark runner script
### Locate this script in tests directory. e.g, cd ../tests ; bash Final_Project/tests/run.sh
### usage: for optimized code run -- bash Final_Project/tests/run.sh -opt ${Example}
### usage: for unoptimized code run -- bash Final_Project/tests/run.sh ${Example}

PATH_MYPASS=~/final/EECS_583_Final_Project/Final_Project/build/finalprojectpass/LLVMHW1.so 
# PATH_MYPASS=~/Final_Project/build/finalprojectpass/LLVMHW1.so

PASS=-finalproject-performance                   # Choose either -finalproject-performance or -finalproject-control
# PASS=-finalproject-control

INPUT=${1:-opt}

setup(){
if [[ ! -z "${INPUT}" ]]; then
echo "INPUT:${INPUT}"
ln -sf input1/${INPUT} .
fi
}

cleanup(){
rm *.bc
rm *.prof
}

# clean up previous runs
cleanup
# Prepare input to run
setup

if [ ${1} == -opt ]
then
# clang -O2 -S -emit-llvm -c ${1}.c
clang -O2 -emit-llvm -c ${2}.c -o ${2}.bc
opt -O2 -enable-new-pm=0 ${2}.bc -o ${2}.ls.bc
opt -O2 -enable-new-pm=0 -pgo-instr-gen -instrprof ${2}.ls.bc -o ${2}.ls.prof.bc
clang -O2 -fprofile-instr-generate ${2}.ls.prof.bc -o ${2}.prof

# Prepare input to run
setup
# Apply your pass to bitcode (IR)
opt -enable-new-pm=0 --indvars -f -load ${PATH_MYPASS} ${PASS} ${2}.bc > ${2}.ls.bc 2> /dev/null
opt -enable-new-pm=0 --indvars -S -load ${PATH_MYPASS} ${PASS} ${2}.bc > ${2}.ll
# opt -enable-new-pm=0 --indvars -pgo-instr-use -load ${PATH_MYPASS} ${NAME_MYPASS} < ${2}.bc > /dev/null

clang ${2}.ls.bc -o ${2}_pass
clang ${2}.bc -o ${2}_no_pass


else
# clang -S -emit-llvm -c ${1}.c
clang -emit-llvm -c ${1}.c -o ${1}.bc
opt -enable-new-pm=0 ${1}.bc -o ${1}.ls.bc
opt -enable-new-pm=0 -pgo-instr-gen -instrprof ${1}.ls.bc -o ${1}.ls.prof.bc
clang -fprofile-instr-generate ${1}.ls.prof.bc -o ${1}.prof

# Prepare input to run
setup
# Apply your pass to bitcode (IR)
# opt -enable-new-pm=0 --indvars -f -load ${PATH_MYPASS} ${PASS} ${1}.bc > ${1}.ls.bc 2> /dev/null
opt -enable-new-pm=0 --indvars -S -load ${PATH_MYPASS} -finalproject-control ${1}.bc > ${1}.ll
# opt -enable-new-pm=0 --indvars -pgo-instr-use -load ${PATH_MYPASS} ${NAME_MYPASS} < ${1}.bc > /dev/null


fi