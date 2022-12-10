; ModuleID = 'Example7.c'
source_filename = "Example7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@LOOPCOUNT = dso_local local_unnamed_addr constant i32 100, align 4
@INFTY = dso_local local_unnamed_addr constant i32 10, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"TOTAL CPU TIME: %f\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"b[0]: %p\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"c[0]: %p\0A\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"e[0]: %p\0A\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"t[0]: %p\0A\00", align 1
@str = private unnamed_addr constant [15 x i8] c"t is unaliased\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %call22 = tail call i64 @clock() #5
  %call24 = tail call i64 @clock() #5
  %sub = sub nsw i64 %call24, %call22
  %conv = sitofp i64 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  %call26 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %call27 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i64 0, i64 0), double noundef %div)
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i64 @clock() local_unnamed_addr #1

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @P6Viterbi(i32** nocapture noundef readonly %x, i32** nocapture noundef readonly %y, i32** nocapture noundef readonly %z, i32** nocapture noundef readonly %q, i32 noundef %loopAmount, i32 noundef %loopCount) local_unnamed_addr #2 {
entry:
  %cmp176 = icmp sgt i32 %loopAmount, 3
  br i1 %cmp176, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %idxprom13 = sext i32 %loopCount to i64
  %cmp49.not174 = icmp slt i32 %loopCount, 1
  %0 = add i32 %loopCount, 1
  %wide.trip.count185 = zext i32 %loopAmount to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.cond.cleanup50, %entry
  ret i32 0

for.body:                                         ; preds = %for.body.lr.ph, %for.cond.cleanup50
  %indvars.iv180 = phi i64 [ 3, %for.body.lr.ph ], [ %indvars.iv.next181, %for.cond.cleanup50 ]
  %arrayidx = getelementptr inbounds i32*, i32** %x, i64 %indvars.iv180
  %1 = load i32*, i32** %arrayidx, align 8, !tbaa !3
  %arrayidx2 = getelementptr inbounds i32*, i32** %y, i64 %indvars.iv180
  %2 = load i32*, i32** %arrayidx2, align 8, !tbaa !3
  %arrayidx4 = getelementptr inbounds i32*, i32** %z, i64 %indvars.iv180
  %3 = load i32*, i32** %arrayidx4, align 8, !tbaa !3
  %4 = add nsw i64 %indvars.iv180, -1
  %arrayidx6 = getelementptr inbounds i32*, i32** %x, i64 %4
  %5 = load i32*, i32** %arrayidx6, align 8, !tbaa !3
  %6 = add nsw i64 %indvars.iv180, -3
  %arrayidx9 = getelementptr inbounds i32*, i32** %y, i64 %6
  %7 = load i32*, i32** %arrayidx9, align 8, !tbaa !3
  %arrayidx12 = getelementptr inbounds i32*, i32** %q, i64 %6
  %8 = load i32*, i32** %arrayidx12, align 8, !tbaa !3
  %arrayidx14 = getelementptr inbounds i32, i32* %2, i64 %idxprom13
  %arrayidx15 = getelementptr inbounds i32, i32* %8, i64 1
  %cmp16 = icmp ult i32* %arrayidx14, %arrayidx15
  br i1 %cmp16, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %arrayidx17 = getelementptr inbounds i32, i32* %2, i64 1
  %arrayidx19 = getelementptr inbounds i32, i32* %8, i64 %idxprom13
  %cmp20 = icmp ugt i32* %arrayidx17, %arrayidx19
  %arrayidx22 = getelementptr inbounds i32, i32* %3, i64 %idxprom13
  %cmp24 = icmp ult i32* %arrayidx22, %arrayidx15
  %or.cond = select i1 %cmp20, i1 %cmp24, i1 false
  br i1 %or.cond, label %if.then, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %lor.lhs.false
  %arrayidx26 = getelementptr inbounds i32, i32* %3, i64 1
  %cmp29 = icmp ugt i32* %arrayidx26, %arrayidx19
  %arrayidx32 = getelementptr inbounds i32, i32* %5, i64 %idxprom13
  %cmp34 = icmp ult i32* %arrayidx32, %arrayidx15
  %or.cond172 = select i1 %cmp29, i1 %cmp34, i1 false
  %arrayidx36 = getelementptr inbounds i32, i32* %5, i64 1
  %cmp39 = icmp ugt i32* %arrayidx36, %arrayidx19
  %or.cond173 = select i1 %or.cond172, i1 true, i1 %cmp39
  br i1 %or.cond173, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false25, %lor.lhs.false, %for.body
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @str, i64 0, i64 0))
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false25
  %call41 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32* noundef %2)
  %call43 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i32* noundef %3)
  %call45 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0), i32* noundef %5)
  %call47 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i64 0, i64 0), i32* noundef %8)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %cmp60 = phi i1 [ false, %if.else ], [ true, %if.then ]
  br i1 %cmp49.not174, label %for.cond.cleanup50, label %for.body51

for.cond.cleanup50:                               ; preds = %for.inc, %if.end
  %indvars.iv.next181 = add nuw nsw i64 %indvars.iv180, 1
  %exitcond186.not = icmp eq i64 %indvars.iv.next181, %wide.trip.count185
  br i1 %exitcond186.not, label %for.cond.cleanup, label %for.body, !llvm.loop !7

for.body51:                                       ; preds = %if.end, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 1, %if.end ]
  %9 = add nsw i64 %indvars.iv, -1
  %arrayidx54 = getelementptr inbounds i32, i32* %2, i64 %9
  %10 = load i32, i32* %arrayidx54, align 4, !tbaa !9
  %arrayidx57 = getelementptr inbounds i32, i32* %3, i64 %9
  %11 = load i32, i32* %arrayidx57, align 4, !tbaa !9
  %add = add nsw i32 %11, %10
  %arrayidx59 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv
  store i32 %add, i32* %arrayidx59, align 4, !tbaa !9
  %arrayidx63 = getelementptr inbounds i32, i32* %8, i64 %indvars.iv
  %12 = load i32, i32* %arrayidx63, align 4, !tbaa !9
  %inc = add nsw i32 %12, 1
  br i1 %cmp60, label %if.then61, label %if.else78

if.then61:                                        ; preds = %for.body51
  %13 = load i32, i32* %arrayidx54, align 4, !tbaa !9
  %14 = load i32, i32* %arrayidx57, align 4, !tbaa !9
  %add70 = add nsw i32 %14, %13
  %arrayidx72 = getelementptr inbounds i32, i32* %5, i64 %indvars.iv
  store i32 %add70, i32* %arrayidx72, align 4, !tbaa !9
  store i32 %inc, i32* %arrayidx63, align 4, !tbaa !9
  br label %for.inc

if.else78:                                        ; preds = %for.body51
  store i32 %inc, i32* %arrayidx63, align 4, !tbaa !9
  %15 = load i32, i32* %arrayidx54, align 4, !tbaa !9
  %16 = load i32, i32* %arrayidx57, align 4, !tbaa !9
  %add88 = add nsw i32 %16, %15
  %arrayidx90 = getelementptr inbounds i32, i32* %5, i64 %indvars.iv
  store i32 %add88, i32* %arrayidx90, align 4, !tbaa !9
  %17 = load i32, i32* %arrayidx63, align 4, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %if.then61, %if.else78
  %inc.sink = phi i32 [ %inc, %if.then61 ], [ %17, %if.else78 ]
  %arrayidx76 = getelementptr inbounds i32, i32* %7, i64 %indvars.iv
  %18 = load i32, i32* %arrayidx76, align 4, !tbaa !9
  %add77 = add nsw i32 %18, %inc.sink
  store i32 %add77, i32* %arrayidx76, align 4, !tbaa !9
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup50, label %for.body51, !llvm.loop !11
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #4

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !5, i64 0}
!11 = distinct !{!11, !8}
