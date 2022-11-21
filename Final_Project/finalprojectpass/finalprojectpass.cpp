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
	struct HW1: public FunctionPass {
        static char ID;

		HW1() : FunctionPass(ID) {
        }
        // Specify the list of analysis passes that will be used inside your pass.
        void getAnalysisUsage(AnalysisUsage &AU) const{
            AU.addRequired<BlockFrequencyInfoWrapperPass>(); // Analysis pass to load block execution count
            AU.addRequired<BranchProbabilityInfoWrapperPass>();  // Analysis pass to load branch probability
        }

		virtual bool runOnFunction(Function &F) override{
            //Create objects for each analysis pass
            BranchProbabilityInfo &bpi = getAnalysis<BranchProbabilityInfoWrapperPass>().getBPI(); 
            BlockFrequencyInfo &bfi = getAnalysis<BlockFrequencyInfoWrapperPass>().getBFI();
            double ialu = 0, ialuProb = 0, falu = 0, faluProb = 0, mem = 0, memProb = 0, biasBr = 0, biasBrProb = 0, unBiasBr = 0, unBiasBrProb = 0, others = 0, othersProb = 0;

            int count = 0;
            int DynOpCounts = 0;
            for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
                count = bfi.getBlockProfileCount(&*bb).getValue();
                if (count != 0) {
                    for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                        DynOpCounts += count;
                        bool bias = false;
                        if ((i -> getOpcode() == Instruction::Br) || (i -> getOpcode() == Instruction::Switch) || (i -> getOpcode() == Instruction::IndirectBr)) {
                            for (int j = 0; j < i -> getNumSuccessors(); j++) {
                                if (bpi.getEdgeProbability((&*bb), j) > BranchProbability(4, 5)) {
                                    biasBr += count;
                                    bias = true;
                                } 
                            }
                            if (bias == false)
                                unBiasBr += count;
                        } else if ((i -> getOpcode() == Instruction::Add) || (i -> getOpcode() == Instruction::Sub) || (i -> getOpcode() == Instruction::Mul) || (i -> getOpcode() == Instruction::UDiv) || (i -> getOpcode() == Instruction::SDiv) || (i -> getOpcode() == Instruction::URem) || (i -> getOpcode() == Instruction::Shl) || (i -> getOpcode() == Instruction::LShr) || (i -> getOpcode() == Instruction::AShr) || (i -> getOpcode() == Instruction::And) || (i -> getOpcode() == Instruction::Or) || (i -> getOpcode() == Instruction::Xor) || (i -> getOpcode() == Instruction::ICmp) || (i -> getOpcode() == Instruction::SRem))
                            ialu += count;
                        else if ((i -> getOpcode() == Instruction::FAdd) || (i -> getOpcode() == Instruction::FSub) || (i -> getOpcode() == Instruction::FMul) || (i -> getOpcode() == Instruction::FDiv) || (i -> getOpcode() == Instruction::FRem) || (i -> getOpcode() == Instruction::FCmp))
                            falu += count;
                        else if ((i -> getOpcode() == Instruction::Alloca) || (i -> getOpcode() == Instruction::Load) || (i -> getOpcode() == Instruction::Store) || (i -> getOpcode() == Instruction::GetElementPtr) || (i -> getOpcode() == Instruction::Fence) || (i -> getOpcode() == Instruction::AtomicCmpXchg ) || (i -> getOpcode() == Instruction::AtomicRMW))
                            mem += count;
                        else 
                            others += count;
                    }
                } 
            }

            ialuProb = ialu / DynOpCounts;
            faluProb = falu / DynOpCounts;
            memProb = mem / DynOpCounts;
            biasBrProb = biasBr / DynOpCounts;
            unBiasBrProb = unBiasBr / DynOpCounts;
            othersProb = others / DynOpCounts;

            errs() << F.getName();
            errs() << ", " << DynOpCounts;
            if (DynOpCounts == 0) errs() << ", " << format("%.3f", ialu) << ", " << format("%.3f", falu) << ", " << format("%.3f", mem) << ", " << format("%.3f", biasBr) << ", " << format("%.3f", unBiasBr) << ", " << format("%.3f", others);
            else errs() << ", " << format("%.3f", ialuProb) << ", " << format("%.3f", faluProb) << ", " << format("%.3f", memProb) << ", " << format("%.3f", biasBrProb) << ", " << format("%.3f", unBiasBrProb) << ", " << format("%.3f", othersProb);
            errs() << "\n";

			return false; // template code is just return false
		}
	};
}
char HW1::ID = 0;
static RegisterPass<HW1> X("hw1", "HW1 pass",
    false /* Only looks at CFG */,
    false /* Analysis Pass */);
