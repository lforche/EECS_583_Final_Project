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
#include "llvm/Transforms/Utils/BasicBlockUtils.h"

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
            // LLVMContextRef 
            vector<Instruction*> loadInst;
            AAResults& AA = getAnalysis<AAResultsWrapperPass>().getAAResults();
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>().getSE();
            LoopAccessLegacyAnalysis* LAA = &getAnalysis<LoopAccessLegacyAnalysis>();
            DominatorTree& DT = getAnalysis<DominatorTreeWrapperPass>().getDomTree();
            int q = 0;
            for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
                for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                    // get loop
                    q++;
                    Loop* L = LI.getLoopFor(&(*bb));
                 
                    if (L && L->getInductionVariable(SE)) {
                        Optional<Loop::LoopBounds> loopBounds = Loop::LoopBounds::getBounds(*L, *(L->getInductionVariable(SE)), SE);
                        if (loopBounds) {
                            // gets start index
                            ConstantInt* startVar = dyn_cast<ConstantInt>(&loopBounds->getInitialIVValue()); 
                         
                            // gets end index and can maybe use?
                            // ConstantInt* endVar = dyn_cast<ConstantInt>(&loopBounds->getFinalIVValue());  
                         
                            // get tripCount and can maybe use?                        
                            // unsigned int tripCount = SE.getSmallConstantTripCount(L);
                         
                            // gets M variable instruction -- use since end index and tripCount don't work
                            ICmpInst* endVarInst = L->getLatchCmpInst(); 
                
                            // gets M variable operand -- wide exit count
                            Value* endVarOp = endVarInst->getOperand(1); 
                
                            if (startVar && endVarOp) {
                                // errs() << startVar->getValue() << "\t" << *endVarOp << "\n";
                            }
                        }
                    }
                  
                if (q==2)
                    {
                        // errs() << "\nHERE\n\n";
                        const Twine tunaliasedName = "tunaliased";
                        const Twine tintName = "tint";
                        // Instruction *temp = i->clone();
                        llvm::Type *i8Ty = llvm::Type::getInt32Ty((*bb).getContext());
                        llvm::Type *i32Ty = llvm::Type::getInt32Ty((*bb).getContext());
                        Instruction& firstInst = *(i);
                        // errs() << firstInst << "\n";
                        auto tunaliased = new AllocaInst(i8Ty, 0, tunaliasedName, &firstInst);
                        auto tint = new AllocaInst(i32Ty, 0, tintName, &firstInst);
                        errs() << "Inserted: " << *tunaliased << "\n";
                        errs() << "Parent: " << tunaliased->getParent()->getName() << "\n";
                        errs() << "Function: " << tunaliased->getFunction()->getName() << "\n\n";

                        llvm::Value *v = llvm::BinaryOperator::CreateAdd(tunaliased, tint, "theyAdded", &firstInst);

                        // StoreInst *str = new StoreInst(tunaliased, tint, &firstInst);

                        // auto x = getInstByIndex(&(*bb), 5);

                        // x->replaceAllUsesWith(tint);

                        // auto addIns = new AddInst
                        // auto tint = new AllocaInst(llvm::Type::getInt8Ty(F.getContext()), 0, tintName, &(*bb));
                        // SplitBlockAndInsertIfThenElse();
                    }
                }
            }

            for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
                for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                    Instruction &myIns = *i;
                    errs() << myIns << "\n";
                }
            }

			return true; 
		}

        Instruction *getInstByIndex(BasicBlock *bb, int index)
        {
            int temp = 0;
            for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i)
            {
                if (temp == index)
                {
                    return &(*i);
                }
                temp++;
            }
            return nullptr;
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
