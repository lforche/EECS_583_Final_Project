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

using namespace std;
using namespace llvm;
namespace{
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
            
            for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
                for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                    if (isa<StoreInst>(*i)) {
                        if (loadInst.size() > 0) {
                            for (Instruction* inst : loadInst) {
                                for (Instruction* inst2 : loadInst) {
                                    // if (!inst->isIdenticalTo(inst2)) {
                                        if (AA.isMustAlias(inst->getOperand(0), inst2->getOperand(0)))
                                            errs() << "yes" << "\t" << *inst << "\t" << *inst2 << "\n";
                                        else if (AA.isNoAlias(inst->getOperand(0), inst2->getOperand(0)))
                                            errs() << "nah" << "\t" << *inst << "\t" << *inst2 << "\n";
                                        else
                                            errs() << "maybe" << "\t" << *inst << "\t" << *inst2 << "\n";
                                        // if (count(inst.getOperand(0)->users().begin(), inst.getOperand(0)->users().end(), *i))
                                        // errs() << count(inst->getOperand(0)->users().begin(), inst->getOperand(0)->users().end(), *i) << "\t" << count(inst2->getOperand(0)->users().begin(), inst2->getOperand(0)->users().end(), *i) << "\n";
                                    // }
                                }
                            }
                        } 
                        loadInst.clear();
                    }
                    if (isa<LoadInst>(*i)) {
                        loadInst.push_back(&*i);
                        errs() << *i << "\n";
                    }
                }
            }
			return true; 
		}
	};
}

char FinalProject::ID = 0;
static RegisterPass<FinalProject> X("finalproject", "Final Project pass",
    false /* Only looks at CFG */,
    false /* Analysis Pass */);
