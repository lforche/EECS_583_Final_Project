#!/bin/bash
### run.sh
### benchmark runner script
### Locate this script at each benchmark directory. e.g, 583simple/run.sh
### usage: ./run.sh ${benchmark_name} ${input} 
### e.g., ./run.sh compress compress.in or ./run.sh simple or ./run.sh wc cccp.c
### Note: Do NOT inlude inputs/ in ${input}, `./run.sh compress inputs/compress.in` will provide different results

# PATH_MYPASS=~/final/EECS_583_Final_Project/Final_Project/build/finalprojectpass/LLVMHW1.so ### Action Required: Specify the path to your pass ###
PATH_MYPASS=~/Final_Project/build/finalprojectpass/LLVMHW1.so
NAME_MYPASS=-finalproject ### Action Required: Specify the name for your pass ###
# BENCHMARK = "Example5"
BENCH=Example5.c
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
clang -O2 -emit-llvm -c Example5.c -o Example5.bc
opt -O2 -enable-new-pm=0 -loop-simplify Example5.bc -o Example5.ls.bc
opt -O2 -enable-new-pm=0 -pgo-instr-gen -instrprof Example5.ls.bc -o Example5.ls.prof.bc
clang -O2 -fprofile-instr-generate Example5.ls.prof.bc -o Example5.prof
setup
# Apply your pass to bitcode (IR)
# opt -enable-new-pm=0 -pgo-instr-use -pgo-test-profile-file=${1}.profdata -load ${PATH_MYPASS} ${NAME_MYPASS} < ${1}.bc > /dev/null
opt -enable-new-pm=0 -load ${PATH_MYPASS} ${NAME_MYPASS} < ${2}.bc > /dev/null

opt -enable-new-pm=0 -dot-cfg Example5.bc > /dev/null
cat .P7Viterbi.dot | dot -Tpdf > ./optimized.pdf

else
clang -emit-llvm -c Example5.c -o Example5.bc
opt -enable-new-pm=0 -loop-simplify Example5.bc -o Example5.ls.bc
opt -enable-new-pm=0 -pgo-instr-gen -instrprof Example5.ls.bc -o Example5.ls.prof.bc
clang -fprofile-instr-generate Example5.ls.prof.bc -o Example5.prof
setup
# Apply your pass to bitcode (IR)
# opt -enable-new-pm=0 -pgo-instr-use -pgo-test-profile-file=${1}.profdata -load ${PATH_MYPASS} ${NAME_MYPASS} < ${1}.bc > /dev/null
# opt -enable-new-pm=0 -load ${PATH_MYPASS} ${NAME_MYPASS} < Example5.bc > /dev/null
opt -enable-new-pm=0 -load ${PATH_MYPASS} ${NAME_MYPASS} < ${1}.bc > /dev/null

opt -enable-new-pm=0 -dot-cfg Example5.bc > /dev/null
cat .P7Viterbi.dot | dot -Tpdf > ./unoptimized.pdf
fi


