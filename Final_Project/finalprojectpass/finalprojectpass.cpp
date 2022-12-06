#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopIterator.h"
#include "llvm/Analysis/LoopPass.h"
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
#include "llvm/Analysis/LoopAccessAnalysis.h"

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
            // LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();

            for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
                // for(LoopInfo::iterator L = LI.begin(), e = LI.end(); L!=e; ++L) {
                //     if((*L)->contains(&*bb)){
                        for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                            // errs() << (*i) << "\n";
                            if (isa<GetElementPtrInst>(i)) {
                                if (isa<StoreInst>((&(*(i)))->getNextNode())) {
                                    errs() << *((*i).getNextNode()) << "\t" << *(i->getNextNode()->getOperand(1)) << "\n";
                                    storeInst.push_back((*i).getNextNode());
                                }
                                else if (isa<LoadInst>((&(*(i)))->getNextNode())) {
                                    errs() << *((*i).getNextNode()) << "\t" << *(i->getNextNode()->getOperand(0)) << "\n";
                                    loadInst.push_back((*i).getNextNode());
                                } 
                            }
                        }
                    //     errs() << "-----\n";
                    // }
                // }
            }

            if (storeInst.size() > 0) {
                errs() << "---------\n";
                for (auto sto : storeInst) {
                    for (auto lo : loadInst) {
                        errs() << *sto << "\t" << *lo << "\n"; // << *(sto->getOperand(1)) << "\t" << *(lo->getOperand(0)) << "\n";
                        if (AA.isMustAlias(sto->getOperand(1), lo->getOperand(0)))
                            errs() << AA.alias(sto->getOperand(1), lo->getOperand(0)) << "\n";
                        else if (AA.isNoAlias(sto->getOperand(1), lo->getOperand(0))) {
                            errs() << AA.alias(sto->getOperand(1), lo->getOperand(0)) << "\n";
                        } else
                            errs() << AA.alias(sto->getOperand(1), lo->getOperand(0)) << "\n"; 
                    }
                }
            }
			return false; 
		}

        void getAnalysisUsage(AnalysisUsage &AU) const override {
            AU.addRequired<AAResultsWrapperPass>();
            // AU.addRequired<LoopInfoWrapperPass>();
        }
	};
}

char FinalProject::ID = 0;
static RegisterPass<FinalProject> X("finalproject", "Final Project pass",
    false /* Only looks at CFG */,
    false /* Analysis Pass */);
