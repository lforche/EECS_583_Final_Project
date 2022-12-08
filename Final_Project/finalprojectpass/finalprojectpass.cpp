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
            vector<Instruction*> storeInst, loadInst;
            vector<Loop*> cloneLoop;
            AAResults& AA = getAnalysis<AAResultsWrapperPass>().getAAResults();
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>().getSE();
            LoopAccessLegacyAnalysis* LAA = &getAnalysis<LoopAccessLegacyAnalysis>();
            DominatorTree& DT = getAnalysis<DominatorTreeWrapperPass>().getDomTree();
            
            for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
                // for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                    Loop* CurLoop = LI.getLoopFor(&(*bb));
                    if (CurLoop != NULL) {
                        // if (!CurLoop->isLoopSimplifyForm() || !CurLoop->isRotatedForm() || !CurLoop->getExitingBlock())
                        //     continue;
                        const LoopAccessInfo& LAI = LAA->getInfo(CurLoop);
                        errs() << CurLoop->getSubLoops().empty() << "\t" << *(bb->begin()) << "\n";
                        // if (!LAI.hasConvergentOp() && (LAI.getNumRuntimePointerChecks() || !LAI.getPSE().getUnionPredicate().isAlwaysTrue())) {
                            // errs() << LAI->getRuntimePointerChecking()->getNumberOfChecks() << "\n";
                            // LoopVersioning LVer(LAI, LAI.getRuntimePointerChecking()->getChecks(), CurLoop, &LI, &DT, &SE);
                            // LVer.versionLoop();
                            // LVer.annotateLoopWithNoAlias();
                        // }
                    }
                // }
            }
			return true; 
		}
	};
}

char FinalProject::ID = 0;
static RegisterPass<FinalProject> X("finalproject", "Final Project pass",
    false /* Only looks at CFG */,
    false /* Analysis Pass */);
