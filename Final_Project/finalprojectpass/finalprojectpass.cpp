#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Support/Format.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/InstrTypes.h"
#include <iostream>

using namespace std;
using namespace llvm;
namespace{
	struct FinalProject: public FunctionPass {
        static char ID;

		FinalProject() : FunctionPass(ID) {
        }

		virtual bool runOnFunction(Function &F) override{
            vector<Instruction*> aliasedInst;
            for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
                for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                    // if ((&(*(i)))->getNextNode() != nullptr
                    // && (&(*(i)))->getOpcode() == Instruction::Store && ((&(*(i)))->getNextNode())->getOpcode() == Instruction::Load)
                    // if ((*i).getNumOperands()) {
                    if (isa<GetElementPtrInst>(i)) {
                        if (aliasedInst.size() == 0 && isa<StoreInst>((&(*(i)))->getNextNode())) {
                            errs() << *((*i).getNextNode()) << "\t" << (i->getNextNode()->getOperand(1)) << "\n";
                            aliasedInst.push_back(&(*i));
                        }
                        else if (aliasedInst.size() == 1 && isa<LoadInst>((&(*(i)))->getNextNode())) {
                            errs() << *((*i).getNextNode()) << "\t" << (i->getNextNode()->getOperand(0)) << "\n";
                            // if ((i->getOperand(0) == aliasedInst[0]->getOperand(0)) && (i->getOperand(1) == aliasedInst[0]->getOperand(1)))
                            //     errs() << "ahh\n"; 
                            aliasedInst.push_back(&(*i));
                        }
                        // if (i->getFunction()->getName() == "main" && isa<CallInst>(i)) {
                        //     errs() << "\n------1-" << *i << "\t" << (i->getFunction()->getName()) << "------\n";
                        //     for(auto arg = dyn_cast<CallInst>(i)->getCalledFunction()->arg_begin(); arg != dyn_cast<CallInst>(i)->getCalledFunction()->arg_end(); arg++) {
                        //         for (auto it : (arg)->users()) {
                        //             if (isa<StoreInst>(it)) {
                        //                 arrParems.push_back(it->getOperand(1));
                        //                 errs() << *(it->getOperand(1)) << "\n";
                        //             }
                        //         }
                        //     }
                        //     errs() << "\n------2-" << dyn_cast<CallInst>(i)->getCalledFunction()->getName() << "------\n";
                        // }

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
                    }
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
