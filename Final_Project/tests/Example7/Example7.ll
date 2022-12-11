; ModuleID = 'Example7.bc'
source_filename = "Example7.c"
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
  store i32 0, i32* %sc, align 4
  store i32 3, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc41, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %loopAmount.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end43

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
  store i32 1, i32* %k, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc, %for.body
  %20 = load i32, i32* %k, align 4
  %21 = load i32, i32* %loopCount.addr, align 4
  %cmp14 = icmp sle i32 %20, %21
  br i1 %cmp14, label %for.body15, label %for.end

for.body15:                                       ; preds = %for.cond13
  call void asm sideeffect "xchg %r13, %r13", "~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !6
  %22 = load i32*, i32** %b, align 8
  %23 = load i32, i32* %k, align 4
  %sub16 = sub nsw i32 %23, 1
  %idxprom17 = sext i32 %sub16 to i64
  %arrayidx18 = getelementptr inbounds i32, i32* %22, i64 %idxprom17
  %24 = load i32, i32* %arrayidx18, align 4
  %25 = load i32*, i32** %c, align 8
  %26 = load i32, i32* %k, align 4
  %sub19 = sub nsw i32 %26, 1
  %idxprom20 = sext i32 %sub19 to i64
  %arrayidx21 = getelementptr inbounds i32, i32* %25, i64 %idxprom20
  %27 = load i32, i32* %arrayidx21, align 4
  %add = add nsw i32 %24, %27
  %28 = load i32*, i32** %a, align 8
  %29 = load i32, i32* %k, align 4
  %idxprom22 = sext i32 %29 to i64
  %arrayidx23 = getelementptr inbounds i32, i32* %28, i64 %idxprom22
  store i32 %add, i32* %arrayidx23, align 4
  %30 = load i32*, i32** %t, align 8
  %31 = load i32, i32* %k, align 4
  %idxprom24 = sext i32 %31 to i64
  %arrayidx25 = getelementptr inbounds i32, i32* %30, i64 %idxprom24
  %32 = load i32, i32* %arrayidx25, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %arrayidx25, align 4
  %33 = load i32*, i32** %b, align 8
  %34 = load i32, i32* %k, align 4
  %sub26 = sub nsw i32 %34, 1
  %idxprom27 = sext i32 %sub26 to i64
  %arrayidx28 = getelementptr inbounds i32, i32* %33, i64 %idxprom27
  %35 = load i32, i32* %arrayidx28, align 4
  %36 = load i32*, i32** %c, align 8
  %37 = load i32, i32* %k, align 4
  %sub29 = sub nsw i32 %37, 1
  %idxprom30 = sext i32 %sub29 to i64
  %arrayidx31 = getelementptr inbounds i32, i32* %36, i64 %idxprom30
  %38 = load i32, i32* %arrayidx31, align 4
  %add32 = add nsw i32 %35, %38
  %39 = load i32*, i32** %e, align 8
  %40 = load i32, i32* %k, align 4
  %idxprom33 = sext i32 %40 to i64
  %arrayidx34 = getelementptr inbounds i32, i32* %39, i64 %idxprom33
  store i32 %add32, i32* %arrayidx34, align 4
  call void asm sideeffect "xchg %r13, %r13", "~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !7
  %41 = load i32*, i32** %t, align 8
  %42 = load i32, i32* %k, align 4
  %idxprom35 = sext i32 %42 to i64
  %arrayidx36 = getelementptr inbounds i32, i32* %41, i64 %idxprom35
  %43 = load i32, i32* %arrayidx36, align 4
  %44 = load i32*, i32** %p, align 8
  %45 = load i32, i32* %k, align 4
  %idxprom37 = sext i32 %45 to i64
  %arrayidx38 = getelementptr inbounds i32, i32* %44, i64 %idxprom37
  %46 = load i32, i32* %arrayidx38, align 4
  %add39 = add nsw i32 %46, %43
  store i32 %add39, i32* %arrayidx38, align 4
  call void asm sideeffect "xchg %r13, %r13", "~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !8
  br label %for.inc

for.inc:                                          ; preds = %for.body15
  %47 = load i32, i32* %k, align 4
  %inc40 = add nsw i32 %47, 1
  store i32 %inc40, i32* %k, align 4
  br label %for.cond13, !llvm.loop !9

for.end:                                          ; preds = %for.cond13
  br label %for.inc41

for.inc41:                                        ; preds = %for.end
  %48 = load i32, i32* %i, align 4
  %inc42 = add nsw i32 %48, 1
  store i32 %inc42, i32* %i, align 4
  br label %for.cond, !llvm.loop !10

for.end43:                                        ; preds = %for.cond
  %49 = load i32, i32* %sc, align 4
  ret i32 %49
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
!6 = !{i64 1769}
!7 = !{i64 1908}
!8 = !{i64 2189}
!9 = distinct !{!9, !5}
!10 = distinct !{!10, !5}
