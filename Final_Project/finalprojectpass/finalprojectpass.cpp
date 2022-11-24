#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/AliasAnalysis.h"
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
            // set<Instruction> arrRefInst;
            // AliasAnalysis *AA = &getAnalysis<AAResultsWrapperPass>().getAAResults();
            for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
                for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                    // if ((&(*(i)))->getNextNode() != nullptr
                    // && (&(*(i)))->getOpcode() == Instruction::Store && ((&(*(i)))->getNextNode())->getOpcode() == Instruction::Load)
                    // if ((*i).getNumOperands()) {
                    // if (isa<FunctionType>(*i)){
                        errs() << *i << "\t" << (i->getFunction()->getName()) << "\n";
                        if (i->getFunction()->getName() == "myFunc") {
                            for(auto arg = i->getFunction()->arg_begin(); arg != i->getFunction()->arg_end(); arg++)
                                errs() << *arg << "\n";
                        }

                        // for (auto it : ((*i).getOperand(0))->users()) {
                        //     if (isa<GetElementPtrInst>(*i)) {
                        //         // arrRefInst.insert(dyn_cast<Instruction>(i));
                        //         errs() << *i << "\n";
                        //     }
                        // }
                        // errs() << "\n------" << *i << "\t" << *((*i).getOperand(0)) << "-------\n";
                            // errs() /*<< *(i) << "\t"*/ << i->getNextNode()->getOperand(1) << "\t" << i->getNextNode()->getNextNode()->getOperand(0) << "\n";
                        // errs() << (&(*(i)))->getOpcodeName() << "\n";
                        // errs() << (&(*(i)))->getOpcodeName() << "\t" << ((&(*(i)))->getNextNode())->getOpcodeName() << "\n";
                        // errs() << (*i) << "\t" << (*(&(*(i)))->getNextNode()) << "---" << dyn_cast<StoreInst>(&(*(i)))->getPointerOperand()->getName() << "\t" << ((&(*(i)))->getNextNode())->getOperand(0)->getName() << "\n";
                    // }
                }
            }
			return false; 
		}
	};
}
char FinalProject::ID = 0;
static RegisterPass<FinalProject> X("finalproject", "Final Project pass",
    false /* Only looks at CFG */,
    false /* Analysis Pass */);
