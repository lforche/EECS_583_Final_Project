#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"
#include "llvm/Support/Format.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/CFG.h"
#include <iostream>

using namespace std;
using namespace llvm;
namespace{
	struct FinalProject: public FunctionPass {
        static char ID;

		FinalProject() : FunctionPass(ID) {
        }

		virtual bool runOnFunction(Function &F) override{
            for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
                for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) 
                    errs() << *(i) << "\n";
            }

			return false; 
		}
	};
}
char FinalProject::ID = 0;
static RegisterPass<FinalProject> X("finalproject", "Final Project pass",
    false /* Only looks at CFG */,
    false /* Analysis Pass */);
