#include "llvm/Transforms/Utils/LoopVersioning.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopIterator.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/IR/Dominators.h"
#include "llvm/Analysis/LoopAccessAnalysis.h"
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
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/LoopNestAnalysis.h"

using namespace std;
using namespace llvm;

namespace Performance{
	struct FinalProject: public FunctionPass {
        static char ID;

		FinalProject() : FunctionPass(ID) {}
        
        void getAnalysisUsage(AnalysisUsage &AU) const override {
            AU.addRequired<AAResultsWrapperPass>();
            AU.addRequired<LoopInfoWrapperPass>();
            AU.addPreserved<LoopInfoWrapperPass>();
            AU.addRequired<LoopAccessLegacyAnalysis>();
            AU.addRequired<DominatorTreeWrapperPass>();
            AU.addPreserved<DominatorTreeWrapperPass>();
            AU.addRequired<ScalarEvolutionWrapperPass>();
        }

		virtual bool runOnFunction(Function &F) override{
            vector<Instruction*> loadInst;
            AAResults& AA = getAnalysis<AAResultsWrapperPass>().getAAResults();
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>().getSE();
            LoopAccessLegacyAnalysis* LAA = &getAnalysis<LoopAccessLegacyAnalysis>();
            DominatorTree& DT = getAnalysis<DominatorTreeWrapperPass>().getDomTree();
            
            Loop* L;
            Instruction* arrayIdxInst;
            Instruction* startInst;
            Instruction* endInst;
            Instruction* tempStartInst;
            Instruction* tempEndInst;
            int numUses = 0;
            int temp = 0;

            for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
                // errs() << "--------------------------\n" << *(F.getFunction().getEntryBlock().begin()) << "--------------------------\n";
                for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                    // Create Variables
                    L = LI.getLoopFor(&(*bb));
                    // Step 1: find arrayidx instructions with the most store/load uses
                    if (L && isa<GetElementPtrInst>(*i) && i->hasName()) {
                        // check if the users are store and/or load instructions and exist in the same loop as the current instruction
                        if (!i->users().empty()) {
                            // GetElementPtr appears to only be used in store and load instructions since it does the calculation of addresses
                            tempEndInst = dyn_cast<Instruction>(*(i->user_begin())); 
                            temp = 0;
                            for (auto it : i->users()) {
                                if (L->contains(dyn_cast<Instruction>(it)->getParent())) {
                                    temp += 1;
                                    tempStartInst = dyn_cast<Instruction>(it);
                                }
                            }
                            if (temp > numUses) {
                                numUses = temp;
                                startInst = tempStartInst;
                                endInst = tempEndInst;
                                arrayIdxInst = dyn_cast<Instruction>(i);
                            }
                        }
                    }
                }
            }
            errs() << *startInst << "\n" << *endInst << "\n" << *arrayIdxInst << "\n\n";
			return true; 
		}
	};
}

char Performance::FinalProject::ID = 0;
static RegisterPass<Performance::FinalProject> X("finalproject-performance", "Final Project Performance pass",
    false /* Only looks at CFG */,
    false /* Analysis Pass */);

namespace Control {
	struct FinalProject: public FunctionPass {
        static char ID;

		FinalProject() : FunctionPass(ID) {}

		virtual bool runOnFunction(Function &F) override{
            return true; 
		}
	};
}

char Control::FinalProject::ID = 0;
static RegisterPass<Control::FinalProject> Y("finalproject-control", "Final Project Control pass",
    false /* Only looks at CFG */,
    false /* Analysis Pass */);
