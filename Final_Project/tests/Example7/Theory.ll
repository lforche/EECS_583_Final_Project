; ModuleID = 'Theory.bc'
source_filename = "Theory.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@LOOPCOUNT = dso_local constant i32 100000000, align 4
@INFTY = dso_local constant i32 10, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"TOTAL CPU TIME: %f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %cc = alloca i32*, align 8
  %dd = alloca i32*, align 8
  %ee = alloca i32*, align 8
  %ff = alloca i32*, align 8
  %ccc = alloca i32**, align 8
  %ddd = alloca i32**, align 8
  %eee = alloca i32**, align 8
  %fff = alloca i32**, align 8
  %i = alloca i32, align 4
  %start_t = alloca i64, align 8
  %end_t = alloca i64, align 8
  %total_t = alloca double, align 8
  store i32 0, i32* %retval, align 4
  store i32 1, i32* %c, align 4
  store i32 2, i32* %d, align 4
  store i32 3, i32* %e, align 4
  store i32 4, i32* %f, align 4
  %call = call noalias i8* @malloc(i64 noundef 400000000) #3
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %cc, align 8
  %call1 = call noalias i8* @malloc(i64 noundef 400000000) #3
  %1 = bitcast i8* %call1 to i32*
  store i32* %1, i32** %dd, align 8
  %call2 = call noalias i8* @malloc(i64 noundef 400000000) #3
  %2 = bitcast i8* %call2 to i32*
  store i32* %2, i32** %ee, align 8
  %call3 = call noalias i8* @malloc(i64 noundef 400000000) #3
  %3 = bitcast i8* %call3 to i32*
  store i32* %3, i32** %ff, align 8
  %call4 = call noalias i8* @malloc(i64 noundef 800000000) #3
  %4 = bitcast i8* %call4 to i32**
  store i32** %4, i32*** %ccc, align 8
  %call5 = call noalias i8* @malloc(i64 noundef 800000000) #3
  %5 = bitcast i8* %call5 to i32**
  store i32** %5, i32*** %ddd, align 8
  %call6 = call noalias i8* @malloc(i64 noundef 800000000) #3
  %6 = bitcast i8* %call6 to i32**
  store i32** %6, i32*** %eee, align 8
  %call7 = call noalias i8* @malloc(i64 noundef 800000000) #3
  %7 = bitcast i8* %call7 to i32**
  store i32** %7, i32*** %fff, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %8, 100000000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %c, align 4
  %10 = load i32*, i32** %cc, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom = sext i32 %11 to i64
  %arrayidx = getelementptr inbounds i32, i32* %10, i64 %idxprom
  store i32 %9, i32* %arrayidx, align 4
  %12 = load i32, i32* %d, align 4
  %13 = load i32*, i32** %dd, align 8
  %14 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %14 to i64
  %arrayidx9 = getelementptr inbounds i32, i32* %13, i64 %idxprom8
  store i32 %12, i32* %arrayidx9, align 4
  %15 = load i32, i32* %e, align 4
  %16 = load i32*, i32** %ee, align 8
  %17 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %17 to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %16, i64 %idxprom10
  store i32 %15, i32* %arrayidx11, align 4
  %18 = load i32, i32* %f, align 4
  %19 = load i32*, i32** %ff, align 8
  %20 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %20 to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %19, i64 %idxprom12
  store i32 %18, i32* %arrayidx13, align 4
  %21 = load i32*, i32** %cc, align 8
  %22 = load i32**, i32*** %ccc, align 8
  %23 = load i32, i32* %i, align 4
  %idxprom14 = sext i32 %23 to i64
  %arrayidx15 = getelementptr inbounds i32*, i32** %22, i64 %idxprom14
  store i32* %21, i32** %arrayidx15, align 8
  %24 = load i32*, i32** %dd, align 8
  %25 = load i32**, i32*** %ddd, align 8
  %26 = load i32, i32* %i, align 4
  %idxprom16 = sext i32 %26 to i64
  %arrayidx17 = getelementptr inbounds i32*, i32** %25, i64 %idxprom16
  store i32* %24, i32** %arrayidx17, align 8
  %27 = load i32*, i32** %ee, align 8
  %28 = load i32**, i32*** %eee, align 8
  %29 = load i32, i32* %i, align 4
  %idxprom18 = sext i32 %29 to i64
  %arrayidx19 = getelementptr inbounds i32*, i32** %28, i64 %idxprom18
  store i32* %27, i32** %arrayidx19, align 8
  %30 = load i32*, i32** %ff, align 8
  %31 = load i32**, i32*** %fff, align 8
  %32 = load i32, i32* %i, align 4
  %idxprom20 = sext i32 %32 to i64
  %arrayidx21 = getelementptr inbounds i32*, i32** %31, i64 %idxprom20
  store i32* %30, i32** %arrayidx21, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %33 = load i32, i32* %i, align 4
  %inc = add nsw i32 %33, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  %call22 = call i64 @clock() #3
  store i64 %call22, i64* %start_t, align 8
  %34 = load i32**, i32*** %ccc, align 8
  %35 = load i32**, i32*** %ddd, align 8
  %36 = load i32**, i32*** %eee, align 8
  %37 = load i32**, i32*** %fff, align 8
  %call23 = call i32 @P6Viterbi(i32** noundef %34, i32** noundef %35, i32** noundef %36, i32** noundef %37, i32 noundef 10, i32 noundef 100000000)
  store i32 %call23, i32* %c, align 4
  %call24 = call i64 @clock() #3
  store i64 %call24, i64* %end_t, align 8
  %38 = load i64, i64* %end_t, align 8
  %39 = load i64, i64* %start_t, align 8
  %sub = sub nsw i64 %38, %39
  %conv = sitofp i64 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  store double %div, double* %total_t, align 8
  %40 = load i32**, i32*** %ccc, align 8
  %41 = load i32**, i32*** %ddd, align 8
  %42 = load i32**, i32*** %eee, align 8
  %43 = load i32**, i32*** %fff, align 8
  %call25 = call i32 @P6Viterbi(i32** noundef %40, i32** noundef %41, i32** noundef %42, i32** noundef %43, i32 noundef 1, i32 noundef 100000000)
  %call26 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %call25)
  %44 = load double, double* %total_t, align 8
  %call27 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i64 0, i64 0), double noundef %44)
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare dso_local i64 @clock() #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @P6Viterbi(i32** noundef %x, i32** noundef %y, i32** noundef %z, i32** noundef %q, i32 noundef %loopAmount, i32 noundef %loopCount) #0 {
entry:
  %x.addr = alloca i32**, align 8
  %y.addr = alloca i32**, align 8
  %z.addr = alloca i32**, align 8
  %q.addr = alloca i32**, align 8
  %loopAmount.addr = alloca i32, align 4
  %loopCount.addr = alloca i32, align 4
  %tunalias = alloca i32, align 4
  %tint = alloca i32, align 4
  %a = alloca i32*, align 8
  %b = alloca i32*, align 8
  %c = alloca i32*, align 8
  %e = alloca i32*, align 8
  %p = alloca i32*, align 8
  %t = alloca i32*, align 8
  %bint = alloca i32, align 4
  %cint = alloca i32, align 4
  %sc = alloca i32, align 4
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  store i32** %x, i32*** %x.addr, align 8
  store i32** %y, i32*** %y.addr, align 8
  store i32** %z, i32*** %z.addr, align 8
  store i32** %q, i32*** %q.addr, align 8
  store i32 %loopAmount, i32* %loopAmount.addr, align 4
  store i32 %loopCount, i32* %loopCount.addr, align 4
  store i32 0, i32* %tunalias, align 4
  store i32 0, i32* %sc, align 4
  store i32 3, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc93, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %loopAmount.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end95

for.body:                                         ; preds = %for.cond
  %2 = load i32**, i32*** %x.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32*, i32** %2, i64 %idxprom
  %4 = load i32*, i32** %arrayidx, align 8
  store i32* %4, i32** %a, align 8
  %5 = load i32**, i32*** %y.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %6 to i64
  %arrayidx2 = getelementptr inbounds i32*, i32** %5, i64 %idxprom1
  %7 = load i32*, i32** %arrayidx2, align 8
  store i32* %7, i32** %b, align 8
  %8 = load i32**, i32*** %z.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %9 to i64
  %arrayidx4 = getelementptr inbounds i32*, i32** %8, i64 %idxprom3
  %10 = load i32*, i32** %arrayidx4, align 8
  store i32* %10, i32** %c, align 8
  %11 = load i32**, i32*** %x.addr, align 8
  %12 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %12, 1
  %idxprom5 = sext i32 %sub to i64
  %arrayidx6 = getelementptr inbounds i32*, i32** %11, i64 %idxprom5
  %13 = load i32*, i32** %arrayidx6, align 8
  store i32* %13, i32** %e, align 8
  %14 = load i32**, i32*** %y.addr, align 8
  %15 = load i32, i32* %i, align 4
  %sub7 = sub nsw i32 %15, 3
  %idxprom8 = sext i32 %sub7 to i64
  %arrayidx9 = getelementptr inbounds i32*, i32** %14, i64 %idxprom8
  %16 = load i32*, i32** %arrayidx9, align 8
  store i32* %16, i32** %p, align 8
  %17 = load i32**, i32*** %q.addr, align 8
  %18 = load i32, i32* %i, align 4
  %sub10 = sub nsw i32 %18, 3
  %idxprom11 = sext i32 %sub10 to i64
  %arrayidx12 = getelementptr inbounds i32*, i32** %17, i64 %idxprom11
  %19 = load i32*, i32** %arrayidx12, align 8
  store i32* %19, i32** %t, align 8
  %20 = load i32, i32* %tunalias, align 4
  %cmp13 = icmp ne i32 %20, 1
  br i1 %cmp13, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %21 = load i32*, i32** %b, align 8
  %22 = load i32, i32* %loopCount.addr, align 4
  %idxprom14 = sext i32 %22 to i64
  %arrayidx15 = getelementptr inbounds i32, i32* %21, i64 %idxprom14
  %23 = load i32*, i32** %t, align 8
  %arrayidx16 = getelementptr inbounds i32, i32* %23, i64 1
  %cmp17 = icmp ult i32* %arrayidx15, %arrayidx16
  br i1 %cmp17, label %land.lhs.true22, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %24 = load i32*, i32** %b, align 8
  %arrayidx18 = getelementptr inbounds i32, i32* %24, i64 1
  %25 = load i32*, i32** %t, align 8
  %26 = load i32, i32* %loopCount.addr, align 4
  %idxprom19 = sext i32 %26 to i64
  %arrayidx20 = getelementptr inbounds i32, i32* %25, i64 %idxprom19
  %cmp21 = icmp ugt i32* %arrayidx18, %arrayidx20
  br i1 %cmp21, label %land.lhs.true22, label %if.end

land.lhs.true22:                                  ; preds = %lor.lhs.false, %land.lhs.true
  %27 = load i32*, i32** %c, align 8
  %28 = load i32, i32* %loopCount.addr, align 4
  %idxprom23 = sext i32 %28 to i64
  %arrayidx24 = getelementptr inbounds i32, i32* %27, i64 %idxprom23
  %29 = load i32*, i32** %t, align 8
  %arrayidx25 = getelementptr inbounds i32, i32* %29, i64 1
  %cmp26 = icmp ult i32* %arrayidx24, %arrayidx25
  br i1 %cmp26, label %land.lhs.true32, label %lor.lhs.false27

lor.lhs.false27:                                  ; preds = %land.lhs.true22
  %30 = load i32*, i32** %c, align 8
  %arrayidx28 = getelementptr inbounds i32, i32* %30, i64 1
  %31 = load i32*, i32** %t, align 8
  %32 = load i32, i32* %loopCount.addr, align 4
  %idxprom29 = sext i32 %32 to i64
  %arrayidx30 = getelementptr inbounds i32, i32* %31, i64 %idxprom29
  %cmp31 = icmp ugt i32* %arrayidx28, %arrayidx30
  br i1 %cmp31, label %land.lhs.true32, label %if.end

land.lhs.true32:                                  ; preds = %lor.lhs.false27, %land.lhs.true22
  %33 = load i32*, i32** %e, align 8
  %34 = load i32, i32* %loopCount.addr, align 4
  %idxprom33 = sext i32 %34 to i64
  %arrayidx34 = getelementptr inbounds i32, i32* %33, i64 %idxprom33
  %35 = load i32*, i32** %t, align 8
  %arrayidx35 = getelementptr inbounds i32, i32* %35, i64 1
  %cmp36 = icmp ult i32* %arrayidx34, %arrayidx35
  br i1 %cmp36, label %if.then, label %lor.lhs.false37

lor.lhs.false37:                                  ; preds = %land.lhs.true32
  %36 = load i32*, i32** %e, align 8
  %arrayidx38 = getelementptr inbounds i32, i32* %36, i64 1
  %37 = load i32*, i32** %t, align 8
  %38 = load i32, i32* %loopCount.addr, align 4
  %idxprom39 = sext i32 %38 to i64
  %arrayidx40 = getelementptr inbounds i32, i32* %37, i64 %idxprom39
  %cmp41 = icmp ugt i32* %arrayidx38, %arrayidx40
  br i1 %cmp41, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false37, %land.lhs.true32
  store i32 1, i32* %tunalias, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false37, %lor.lhs.false27, %lor.lhs.false, %for.body
  store i32 1, i32* %k, align 4
  br label %for.cond42

for.cond42:                                       ; preds = %for.inc, %if.end
  %39 = load i32, i32* %k, align 4
  %40 = load i32, i32* %loopCount.addr, align 4
  %cmp43 = icmp sle i32 %39, %40
  br i1 %cmp43, label %for.body44, label %for.end

for.body44:                                       ; preds = %for.cond42
  %41 = load i32*, i32** %b, align 8
  %42 = load i32, i32* %k, align 4
  %sub45 = sub nsw i32 %42, 1
  %idxprom46 = sext i32 %sub45 to i64
  %arrayidx47 = getelementptr inbounds i32, i32* %41, i64 %idxprom46
  %43 = load i32, i32* %arrayidx47, align 4
  %44 = load i32*, i32** %c, align 8
  %45 = load i32, i32* %k, align 4
  %sub48 = sub nsw i32 %45, 1
  %idxprom49 = sext i32 %sub48 to i64
  %arrayidx50 = getelementptr inbounds i32, i32* %44, i64 %idxprom49
  %46 = load i32, i32* %arrayidx50, align 4
  %add = add nsw i32 %43, %46
  %47 = load i32*, i32** %a, align 8
  %48 = load i32, i32* %k, align 4
  %idxprom51 = sext i32 %48 to i64
  %arrayidx52 = getelementptr inbounds i32, i32* %47, i64 %idxprom51
  store i32 %add, i32* %arrayidx52, align 4
  %49 = load i32, i32* %tunalias, align 4
  %cmp53 = icmp eq i32 %49, 1
  br i1 %cmp53, label %if.then54, label %if.else

if.then54:                                        ; preds = %for.body44
  %50 = load i32*, i32** %t, align 8
  %51 = load i32, i32* %k, align 4
  %idxprom55 = sext i32 %51 to i64
  %arrayidx56 = getelementptr inbounds i32, i32* %50, i64 %idxprom55
  %52 = load i32, i32* %arrayidx56, align 4
  store i32 %52, i32* %tint, align 4
  %53 = load i32, i32* %tint, align 4
  %54 = load i32, i32* %sc, align 4
  %add57 = add nsw i32 %54, %53
  store i32 %add57, i32* %sc, align 4
  %55 = load i32*, i32** %b, align 8
  %56 = load i32, i32* %k, align 4
  %sub58 = sub nsw i32 %56, 1
  %idxprom59 = sext i32 %sub58 to i64
  %arrayidx60 = getelementptr inbounds i32, i32* %55, i64 %idxprom59
  %57 = load i32, i32* %arrayidx60, align 4
  %58 = load i32*, i32** %c, align 8
  %59 = load i32, i32* %k, align 4
  %sub61 = sub nsw i32 %59, 1
  %idxprom62 = sext i32 %sub61 to i64
  %arrayidx63 = getelementptr inbounds i32, i32* %58, i64 %idxprom62
  %60 = load i32, i32* %arrayidx63, align 4
  %add64 = add nsw i32 %57, %60
  %61 = load i32*, i32** %e, align 8
  %62 = load i32, i32* %k, align 4
  %idxprom65 = sext i32 %62 to i64
  %arrayidx66 = getelementptr inbounds i32, i32* %61, i64 %idxprom65
  store i32 %add64, i32* %arrayidx66, align 4
  %63 = load i32, i32* %tint, align 4
  %64 = load i32*, i32** %t, align 8
  %65 = load i32, i32* %k, align 4
  %idxprom67 = sext i32 %65 to i64
  %arrayidx68 = getelementptr inbounds i32, i32* %64, i64 %idxprom67
  store i32 %63, i32* %arrayidx68, align 4
  %66 = load i32, i32* %tint, align 4
  %67 = load i32*, i32** %p, align 8
  %68 = load i32, i32* %k, align 4
  %idxprom69 = sext i32 %68 to i64
  %arrayidx70 = getelementptr inbounds i32, i32* %67, i64 %idxprom69
  %69 = load i32, i32* %arrayidx70, align 4
  %add71 = add nsw i32 %69, %66
  store i32 %add71, i32* %arrayidx70, align 4
  br label %if.end89

if.else:                                          ; preds = %for.body44
  %70 = load i32*, i32** %t, align 8
  %71 = load i32, i32* %k, align 4
  %idxprom72 = sext i32 %71 to i64
  %arrayidx73 = getelementptr inbounds i32, i32* %70, i64 %idxprom72
  %72 = load i32, i32* %arrayidx73, align 4
  %73 = load i32, i32* %sc, align 4
  %add74 = add nsw i32 %73, %72
  store i32 %add74, i32* %sc, align 4
  %74 = load i32*, i32** %b, align 8
  %75 = load i32, i32* %k, align 4
  %sub75 = sub nsw i32 %75, 1
  %idxprom76 = sext i32 %sub75 to i64
  %arrayidx77 = getelementptr inbounds i32, i32* %74, i64 %idxprom76
  %76 = load i32, i32* %arrayidx77, align 4
  %77 = load i32*, i32** %c, align 8
  %78 = load i32, i32* %k, align 4
  %sub78 = sub nsw i32 %78, 1
  %idxprom79 = sext i32 %sub78 to i64
  %arrayidx80 = getelementptr inbounds i32, i32* %77, i64 %idxprom79
  %79 = load i32, i32* %arrayidx80, align 4
  %add81 = add nsw i32 %76, %79
  %80 = load i32*, i32** %e, align 8
  %81 = load i32, i32* %k, align 4
  %idxprom82 = sext i32 %81 to i64
  %arrayidx83 = getelementptr inbounds i32, i32* %80, i64 %idxprom82
  store i32 %add81, i32* %arrayidx83, align 4
  %82 = load i32*, i32** %t, align 8
  %83 = load i32, i32* %k, align 4
  %idxprom84 = sext i32 %83 to i64
  %arrayidx85 = getelementptr inbounds i32, i32* %82, i64 %idxprom84
  %84 = load i32, i32* %arrayidx85, align 4
  %85 = load i32*, i32** %p, align 8
  %86 = load i32, i32* %k, align 4
  %idxprom86 = sext i32 %86 to i64
  %arrayidx87 = getelementptr inbounds i32, i32* %85, i64 %idxprom86
  %87 = load i32, i32* %arrayidx87, align 4
  %add88 = add nsw i32 %87, %84
  store i32 %add88, i32* %arrayidx87, align 4
  br label %if.end89

if.end89:                                         ; preds = %if.else, %if.then54
  %88 = load i32*, i32** %p, align 8
  %89 = load i32, i32* %k, align 4
  %idxprom90 = sext i32 %89 to i64
  %arrayidx91 = getelementptr inbounds i32, i32* %88, i64 %idxprom90
  %90 = load i32, i32* %arrayidx91, align 4
  %91 = load i32, i32* %sc, align 4
  %add92 = add nsw i32 %91, %90
  store i32 %add92, i32* %sc, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end89
  %92 = load i32, i32* %k, align 4
  %inc = add nsw i32 %92, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond42, !llvm.loop !6

for.end:                                          ; preds = %for.cond42
  br label %for.inc93

for.inc93:                                        ; preds = %for.end
  %93 = load i32, i32* %i, align 4
  %inc94 = add nsw i32 %93, 1
  store i32 %inc94, i32* %i, align 4
  br label %for.cond, !llvm.loop !7

for.end95:                                        ; preds = %for.cond
  %94 = load i32, i32* %sc, align 4
  ret i32 %94
}

declare dso_local i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5}
!7 = distinct !{!7, !5}
