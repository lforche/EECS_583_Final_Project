#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Support/Format.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include <iostream>

using namespace std;
using namespace llvm;
namespace{
	struct FinalProject: public FunctionPass {
        static char ID;

		FinalProject() : FunctionPass(ID) {
        }

		virtual bool runOnFunction(Function &F) override{
            vector<Instruction*> storeInst, loadInst;
            AAResults& AA = getAnalysis<AAResultsWrapperPass>().getAAResults();

            for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
                for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                    if (isa<GetElementPtrInst>(i)) {
                        if (isa<StoreInst>((&(*(i)))->getNextNode())) {
                            // errs() << *((*i).getNextNode()) << "\t" << *(i->getNextNode()->getOperand(1)) << "\n";
                            storeInst.push_back((*i).getNextNode());
                        }
                        else if (isa<LoadInst>((&(*(i)))->getNextNode())) {
                            // errs() << *((*i).getNextNode()) << "\t" << *(i->getNextNode()->getOperand(0)) << "\n";
                            loadInst.push_back((*i).getNextNode());
                        } 
                    }
                }
            }

            if (storeInst.size() > 0) {
                // errs() << "---------\n";
                for (auto sto : storeInst) {
                    for (auto lo : loadInst) {
                        errs() << *sto << "\t" << *lo << "---a---\n" << *(sto->getOperand(1)) << "\t" << *(lo->getOperand(0)) << "---b---\n";
                        if (AA.isMustAlias(sto->getOperand(1), lo->getOperand(0)))
                            errs() << "yes" << "\n";
                        else if (AA.isNoAlias(sto->getOperand(1), lo->getOperand(0)))
                            errs() << "nah" << "\n";
                        else
                            errs() << "maybe" << "\n"; 
                    }
                }
            }
			return false; 
		}

        void getAnalysisUsage(AnalysisUsage &AU) const override {
            AU.addRequired<llvm::AAResultsWrapperPass>();
        }
	};
}

char FinalProject::ID = 0;
static RegisterPass<FinalProject> X("finalproject", "Final Project pass",
    false /* Only looks at CFG */,
    false /* Analysis Pass */);
