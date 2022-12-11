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
            AAResults& AA = getAnalysis<AAResultsWrapperPass>().getAAResults();
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>().getSE();
            LoopAccessLegacyAnalysis* LAA = &getAnalysis<LoopAccessLegacyAnalysis>();
            DominatorTree& DT = getAnalysis<DominatorTreeWrapperPass>().getDomTree();

            llvm::LLVMContext &context = F.getContext();
            
            // Step 1: Create any variables used across pass

            // arrayIdxInst : instruction to store in variable to save on loads
            // startInst    : instruction that starts the usage range for arrayIdxInst
            // endInst      : instruction that ends the usage range for arrayIdxInst
            // numUses      : number of uses for the arrayIdxInst 
            // tempStartInst: temp variable instruction that starts the usage range for arrayIdxInst
            // tempEndInst  : temp variable instruction that ends the usage range for arrayIdxInst
            // tempUses     : temp variable number of uses for the arrayIdxInst
            // cmpIdxArrays : get the store and load instruction that are in the usage range for arrayIdxInst
            // loopCountInst: instruction to store icmp instructions that hold variables compared to in loop preheaders
            // loopCountVar : store the variable compared to in loop
            // loopStartVal : store starting value for a loop 
            Instruction* arrayIdxInst; 
            Instruction* startInst;
            Instruction* endInst;
            int numUses = 0;           
            Instruction* tempStartInst;
            Instruction* tempEndInst;
            int tempUses = 0;
            set<Value*> cmpIdxArrays;
            Instruction* loopCountInst = nullptr;
            Value* loopCountVar = nullptr;
            ConstantInt* loopStartVal = nullptr;

            // Step 2: Find instruction best to use for implementation of pass
            for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
                // Check if there is an ICmp statement to get the loopCountInst
                if (isa<ICmpInst>(bb->begin()))
                    loopCountInst = &*(bb->begin());

                for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                    // Get the loop of this basic block
                    Loop* L = LI.getLoopFor(&(*bb));

                    // Find arrayidx instructions with the uses
                    // No need to check the type of instruction because GetElementPtr appears to 
                    //      only be used in store and load instructions since it does the calculation of addresses
                    // First check if the loop is valid, the instruction is a GetElementPtr, and it has users
                    if (L != nullptr && isa<GetElementPtrInst>(*i) && !i->users().empty()) {
                        // Create the temporary variables to find the arrayIdx with the most uses
                        // since for (auto it : i->users()) appears to iterate backwards, the first user is actually
                        //      the last user in the loop for the current instruction hence why tempEndInst is initialized
                        //      to the first user
                        tempEndInst = dyn_cast<Instruction>(*(i->user_begin())); 

                        // Set tempUses to zero and iterate over users of the current instruction to determine
                        //      if the current instruction has more users and set tempStartInst to that user
                        //      if the current loop contains the basic block that has that instruction
                        tempUses = 0;
                        for (auto it : i->users()) {
                            if (L->contains(dyn_cast<Instruction>(it)->getParent()) && dyn_cast<Instruction>(it) != arrayIdxInst) {
                                tempUses += 1;
                                tempStartInst = dyn_cast<Instruction>(it);
                            }
                        }
                        
                        // If the number of users for the current is greater than the previously found amount
                        //      replace all of the none temporary variables to save it for future use
                        if (tempUses > numUses) {
                            numUses = tempUses;
                            startInst = tempStartInst;
                            endInst = tempEndInst;
                            arrayIdxInst = dyn_cast<Instruction>(i);
                        }

                        // Check if the loopCountInst is in the loop's preheader and is in fact the loopCountVar
                        //      so the starting value of the loop and loopCountVar can be stored for future use
                        if (loopCountInst != nullptr && loopCountInst->getParent() == L->getLoopPreheader()) {
                            Optional<Loop::LoopBounds> loopBounds = Loop::LoopBounds::getBounds(*L, *(L->getInductionVariable(SE)), SE);
                            loopStartVal = dyn_cast<ConstantInt>(&loopBounds->getInitialIVValue());
                            loopCountVar = loopCountInst->getOperand(0);
                        }
                    } 
                }
            }
            errs() << F.getName() << "\n";
            if (F.getName() == "main")
            {
                errs() << "IN MAIN... EXITING...\n";
                return false;
            }
            errs() << "\n";

            // Step 3: Iterate over the start and end range finding any store and load instructions
            if (startInst != nullptr && arrayIdxInst != nullptr) {
                for (BasicBlock::iterator i = startInst->getIterator(), e = endInst->getIterator(); i != e; ++i++) {
                    // Verify that the instruction is either a load or a store and isn't the startInst and doesn't 
                    //      use the arrayIdxInst in it
                    if (isa<StoreInst>(*i)  && (&(*i) != startInst) && (dyn_cast<Instruction>(i->getOperand(1)) != arrayIdxInst)) {
                        cmpIdxArrays.insert(i->getOperand(1));
                    } else if (isa<LoadInst>(*i)  && (&(*i) != startInst) && (dyn_cast<Instruction>(i->getOperand(0)) != arrayIdxInst)) {
                        cmpIdxArrays.insert(i->getOperand(0));
                    }
                }
            }

            // Step 4: Use the starting value and the final variable of the desired loop to generate the 
            //      if statements that go in the preheader --- NEEDS WORK
            if (cmpIdxArrays.empty())
            {
                errs() << "cmpIdxArrays is empty. Optimization cannot be applied..." << "\n";
                return 0;
            } 
            
            Loop *outerLoop = getOuterLoopByInst(arrayIdxInst, LI);
            Loop *innerLoop = getInnerLoopByInst(arrayIdxInst, LI);

            //Find first instruction of the first basic block of the function
            BasicBlock *bb = &(*(F.begin()));
            Instruction *firstInst = getInstByIndex(bb, 0);

            llvm::Type *i8Ty = llvm::Type::getInt8Ty(context);
            llvm::Type *i32Ty = llvm::Type::getInt32Ty(context);

            //Create isUnaliased and TemporaryInt. Initialise isUnaliased to 0
            const Twine tunaliasedName = "isUnaliased";
            const Twine tintName = "tint";
            auto tunaliasedPtr = new AllocaInst(i8Ty, 0, tunaliasedName, firstInst);
            auto tintPtr = new AllocaInst(i32Ty, 0, tintName, firstInst);

            Value *zero = llvm::ConstantInt::get(i8Ty, 0);
            StoreInst *tunStr = new StoreInst(zero, tunaliasedPtr, firstInst);

            BasicBlock *arrayBB = arrayIdxInst->getParent();
            // errs() << arrayBB->getParent()->getName() << "\n";

            errs() << "\nOuter Loop: " << outerLoop->getName() << "\nDepth: " << outerLoop->getSubLoops().size() << "\n";
            errs() << "\nInner Loop: " << innerLoop->getName() << "\nDepth: " << innerLoop->getLoopDepth() << "\n";

            /*/////////Zach///////////*/

            ////////////////////////////
            
            /*////////Lindsey/////////*/
            
            ////////////////////////////
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

        Loop *getOuterLoopByInst(Instruction *inst, LoopInfo &LI)
        {
            Loop *outerLoop = nullptr;
            Loop *tempLoop = nullptr;
            for (auto L : LI)
            {
                errs() << L->getName() << "\n";

                if (L->contains(inst))
                {
                    outerLoop = L;
                }
            }

            tempLoop = outerLoop;
            bool isInDeeperLoop = true;

            while (tempLoop->getSubLoops().size() != 0 && isInDeeperLoop)
            {
                for (auto L : tempLoop->getSubLoops())
                {
                    if (L->contains(inst))
                    {
                        outerLoop = tempLoop;
                        tempLoop = L;
                    }
                }
                if (tempLoop == outerLoop)
                {
                    isInDeeperLoop = false;
                }
                
            }

            return outerLoop;
        }

        Loop *getInnerLoopByInst(Instruction *inst, LoopInfo &LI)
        {
            Loop *innerLoop;
            Loop *outerLoop = getOuterLoopByInst(inst, LI);

            for (auto L : outerLoop->getSubLoops())
            {
                if (L->contains(inst))
                {
                    innerLoop = L;
                }
            }
            return innerLoop;
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
