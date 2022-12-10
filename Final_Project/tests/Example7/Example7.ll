; ModuleID = 'Example7.c'
source_filename = "Example7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@LOOPCOUNT = dso_local local_unnamed_addr constant i32 100000000, align 4
@INFTY = dso_local local_unnamed_addr constant i32 10, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"TOTAL CPU TIME: %f\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %call = tail call noalias dereferenceable_or_null(400000000) i8* @malloc(i64 noundef 400000000) #5
  %0 = bitcast i8* %call to i32*
  %call1 = tail call noalias dereferenceable_or_null(400000000) i8* @malloc(i64 noundef 400000000) #5
  %1 = bitcast i8* %call1 to i32*
  %call2 = tail call noalias dereferenceable_or_null(400000000) i8* @malloc(i64 noundef 400000000) #5
  %2 = bitcast i8* %call2 to i32*
  %call3 = tail call noalias dereferenceable_or_null(400000000) i8* @malloc(i64 noundef 400000000) #5
  %3 = bitcast i8* %call3 to i32*
  %call4 = tail call noalias dereferenceable_or_null(800000000) i8* @malloc(i64 noundef 800000000) #5
  %4 = bitcast i8* %call4 to i32**
  %call5 = tail call noalias dereferenceable_or_null(800000000) i8* @malloc(i64 noundef 800000000) #5
  %5 = bitcast i8* %call5 to i32**
  %call6 = tail call noalias dereferenceable_or_null(800000000) i8* @malloc(i64 noundef 800000000) #5
  %6 = bitcast i8* %call6 to i32**
  %call7 = tail call noalias dereferenceable_or_null(800000000) i8* @malloc(i64 noundef 800000000) #5
  %7 = bitcast i8* %call7 to i32**
  %broadcast.splatinsert = insertelement <2 x i8*> poison, i8* %call, i64 0
  %broadcast.splat = shufflevector <2 x i8*> %broadcast.splatinsert, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert67 = insertelement <2 x i8*> poison, i8* %call, i64 0
  %broadcast.splat68 = shufflevector <2 x i8*> %broadcast.splatinsert67, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert69 = insertelement <2 x i8*> poison, i8* %call1, i64 0
  %broadcast.splat70 = shufflevector <2 x i8*> %broadcast.splatinsert69, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert71 = insertelement <2 x i8*> poison, i8* %call1, i64 0
  %broadcast.splat72 = shufflevector <2 x i8*> %broadcast.splatinsert71, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert73 = insertelement <2 x i8*> poison, i8* %call2, i64 0
  %broadcast.splat74 = shufflevector <2 x i8*> %broadcast.splatinsert73, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert75 = insertelement <2 x i8*> poison, i8* %call2, i64 0
  %broadcast.splat76 = shufflevector <2 x i8*> %broadcast.splatinsert75, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert77 = insertelement <2 x i8*> poison, i8* %call3, i64 0
  %broadcast.splat78 = shufflevector <2 x i8*> %broadcast.splatinsert77, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert79 = insertelement <2 x i8*> poison, i8* %call3, i64 0
  %broadcast.splat80 = shufflevector <2 x i8*> %broadcast.splatinsert79, <2 x i8*> poison, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %8 = getelementptr inbounds i32, i32* %0, i64 %index
  %9 = bitcast i32* %8 to <2 x i32>*
  store <2 x i32> <i32 1, i32 1>, <2 x i32>* %9, align 4, !tbaa !3
  %10 = getelementptr inbounds i32, i32* %8, i64 2
  %11 = bitcast i32* %10 to <2 x i32>*
  store <2 x i32> <i32 1, i32 1>, <2 x i32>* %11, align 4, !tbaa !3
  %12 = getelementptr inbounds i32, i32* %1, i64 %index
  %13 = bitcast i32* %12 to <2 x i32>*
  store <2 x i32> <i32 2, i32 2>, <2 x i32>* %13, align 4, !tbaa !3
  %14 = getelementptr inbounds i32, i32* %12, i64 2
  %15 = bitcast i32* %14 to <2 x i32>*
  store <2 x i32> <i32 2, i32 2>, <2 x i32>* %15, align 4, !tbaa !3
  %16 = getelementptr inbounds i32, i32* %2, i64 %index
  %17 = bitcast i32* %16 to <2 x i32>*
  store <2 x i32> <i32 3, i32 3>, <2 x i32>* %17, align 4, !tbaa !3
  %18 = getelementptr inbounds i32, i32* %16, i64 2
  %19 = bitcast i32* %18 to <2 x i32>*
  store <2 x i32> <i32 3, i32 3>, <2 x i32>* %19, align 4, !tbaa !3
  %20 = getelementptr inbounds i32, i32* %3, i64 %index
  %21 = bitcast i32* %20 to <2 x i32>*
  store <2 x i32> <i32 4, i32 4>, <2 x i32>* %21, align 4, !tbaa !3
  %22 = getelementptr inbounds i32, i32* %20, i64 2
  %23 = bitcast i32* %22 to <2 x i32>*
  store <2 x i32> <i32 4, i32 4>, <2 x i32>* %23, align 4, !tbaa !3
  %24 = getelementptr inbounds i32*, i32** %4, i64 %index
  %25 = bitcast i32** %24 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat, <2 x i8*>* %25, align 8, !tbaa !7
  %26 = getelementptr inbounds i32*, i32** %24, i64 2
  %27 = bitcast i32** %26 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat68, <2 x i8*>* %27, align 8, !tbaa !7
  %28 = getelementptr inbounds i32*, i32** %5, i64 %index
  %29 = bitcast i32** %28 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat70, <2 x i8*>* %29, align 8, !tbaa !7
  %30 = getelementptr inbounds i32*, i32** %28, i64 2
  %31 = bitcast i32** %30 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat72, <2 x i8*>* %31, align 8, !tbaa !7
  %32 = getelementptr inbounds i32*, i32** %6, i64 %index
  %33 = bitcast i32** %32 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat74, <2 x i8*>* %33, align 8, !tbaa !7
  %34 = getelementptr inbounds i32*, i32** %32, i64 2
  %35 = bitcast i32** %34 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat76, <2 x i8*>* %35, align 8, !tbaa !7
  %36 = getelementptr inbounds i32*, i32** %7, i64 %index
  %37 = bitcast i32** %36 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat78, <2 x i8*>* %37, align 8, !tbaa !7
  %38 = getelementptr inbounds i32*, i32** %36, i64 2
  %39 = bitcast i32** %38 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat80, <2 x i8*>* %39, align 8, !tbaa !7
  %index.next = add nuw i64 %index, 4
  %40 = icmp eq i64 %index.next, 100000000
  br i1 %40, label %for.cond.cleanup, label %vector.body, !llvm.loop !9

for.cond.cleanup:                                 ; preds = %vector.body
  %call22 = tail call i64 @clock() #5
  %arrayidx6.phi.trans.insert.i = getelementptr inbounds i32*, i32** %4, i64 2
  %.pre.i = load i32*, i32** %arrayidx6.phi.trans.insert.i, align 8, !tbaa !7
  br label %for.body.i

for.body.i:                                       ; preds = %for.cond.cleanup15.i, %for.cond.cleanup
  %41 = phi i32* [ %.pre.i, %for.cond.cleanup ], [ %42, %for.cond.cleanup15.i ]
  %indvars.iv84.i = phi i64 [ 3, %for.cond.cleanup ], [ %indvars.iv.next85.i, %for.cond.cleanup15.i ]
  %arrayidx.i = getelementptr inbounds i32*, i32** %4, i64 %indvars.iv84.i
  %42 = load i32*, i32** %arrayidx.i, align 8, !tbaa !7
  %arrayidx2.i = getelementptr inbounds i32*, i32** %5, i64 %indvars.iv84.i
  %43 = load i32*, i32** %arrayidx2.i, align 8, !tbaa !7
  %arrayidx4.i = getelementptr inbounds i32*, i32** %6, i64 %indvars.iv84.i
  %44 = load i32*, i32** %arrayidx4.i, align 8, !tbaa !7
  %45 = add nsw i64 %indvars.iv84.i, -3
  %arrayidx9.i = getelementptr inbounds i32*, i32** %5, i64 %45
  %46 = load i32*, i32** %arrayidx9.i, align 8, !tbaa !7
  %arrayidx12.i = getelementptr inbounds i32*, i32** %7, i64 %45
  %47 = load i32*, i32** %arrayidx12.i, align 8, !tbaa !7
  br label %for.body16.i

for.cond.cleanup15.i:                             ; preds = %for.body16.i
  %indvars.iv.next85.i = add nuw nsw i64 %indvars.iv84.i, 1
  %exitcond90.not.i = icmp eq i64 %indvars.iv.next85.i, 10
  br i1 %exitcond90.not.i, label %P6Viterbi.exit, label %for.body.i, !llvm.loop !12

for.body16.i:                                     ; preds = %for.body16.i, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body16.i ], [ 1, %for.body.i ]
  %48 = add nsw i64 %indvars.iv.i, -1
  %arrayidx19.i = getelementptr inbounds i32, i32* %43, i64 %48
  %49 = load i32, i32* %arrayidx19.i, align 4, !tbaa !3
  %arrayidx22.i = getelementptr inbounds i32, i32* %44, i64 %48
  %50 = load i32, i32* %arrayidx22.i, align 4, !tbaa !3
  %add.i = add nsw i32 %50, %49
  %arrayidx24.i = getelementptr inbounds i32, i32* %42, i64 %indvars.iv.i
  store i32 %add.i, i32* %arrayidx24.i, align 4, !tbaa !3
  %arrayidx26.i = getelementptr inbounds i32, i32* %47, i64 %indvars.iv.i
  %51 = load i32, i32* %arrayidx26.i, align 4, !tbaa !3
  %inc.i = add nsw i32 %51, 1
  store i32 %inc.i, i32* %arrayidx26.i, align 4, !tbaa !3
  %52 = load i32, i32* %arrayidx19.i, align 4, !tbaa !3
  %53 = load i32, i32* %arrayidx22.i, align 4, !tbaa !3
  %add33.i = add nsw i32 %53, %52
  %arrayidx35.i = getelementptr inbounds i32, i32* %41, i64 %indvars.iv.i
  store i32 %add33.i, i32* %arrayidx35.i, align 4, !tbaa !3
  %54 = load i32, i32* %arrayidx26.i, align 4, !tbaa !3
  %arrayidx39.i = getelementptr inbounds i32, i32* %46, i64 %indvars.iv.i
  %55 = load i32, i32* %arrayidx39.i, align 4, !tbaa !3
  %add40.i = add nsw i32 %55, %54
  store i32 %add40.i, i32* %arrayidx39.i, align 4, !tbaa !3
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 100000001
  br i1 %exitcond.not.i, label %for.cond.cleanup15.i, label %for.body16.i, !llvm.loop !13

P6Viterbi.exit:                                   ; preds = %for.cond.cleanup15.i
  %call24 = tail call i64 @clock() #5
  %sub = sub nsw i64 %call24, %call22
  %conv = sitofp i64 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  %call26 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %call27 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i64 0, i64 0), double noundef %div)
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local i64 @clock() local_unnamed_addr #2

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i32 @P6Viterbi(i32** nocapture noundef readonly %x, i32** nocapture noundef readonly %y, i32** nocapture noundef readonly %z, i32** nocapture noundef readonly %q, i32 noundef %loopAmount, i32 noundef %loopCount) local_unnamed_addr #3 {
entry:
  %cmp80 = icmp sgt i32 %loopAmount, 3
  br i1 %cmp80, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %cmp14.not78 = icmp slt i32 %loopCount, 1
  %0 = add i32 %loopCount, 1
  %wide.trip.count89 = zext i32 %loopAmount to i64
  %arrayidx6.phi.trans.insert = getelementptr inbounds i32*, i32** %x, i64 2
  %.pre = load i32*, i32** %arrayidx6.phi.trans.insert, align 8, !tbaa !7
  %wide.trip.count = zext i32 %0 to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.cond.cleanup15, %entry
  ret i32 0

for.body:                                         ; preds = %for.body.lr.ph, %for.cond.cleanup15
  %1 = phi i32* [ %.pre, %for.body.lr.ph ], [ %2, %for.cond.cleanup15 ]
  %indvars.iv84 = phi i64 [ 3, %for.body.lr.ph ], [ %indvars.iv.next85, %for.cond.cleanup15 ]
  %arrayidx = getelementptr inbounds i32*, i32** %x, i64 %indvars.iv84
  %2 = load i32*, i32** %arrayidx, align 8, !tbaa !7
  %arrayidx2 = getelementptr inbounds i32*, i32** %y, i64 %indvars.iv84
  %3 = load i32*, i32** %arrayidx2, align 8, !tbaa !7
  %arrayidx4 = getelementptr inbounds i32*, i32** %z, i64 %indvars.iv84
  %4 = load i32*, i32** %arrayidx4, align 8, !tbaa !7
  %5 = add nsw i64 %indvars.iv84, -3
  %arrayidx9 = getelementptr inbounds i32*, i32** %y, i64 %5
  %6 = load i32*, i32** %arrayidx9, align 8, !tbaa !7
  %arrayidx12 = getelementptr inbounds i32*, i32** %q, i64 %5
  %7 = load i32*, i32** %arrayidx12, align 8, !tbaa !7
  br i1 %cmp14.not78, label %for.cond.cleanup15, label %for.body16

for.cond.cleanup15:                               ; preds = %for.body16, %for.body
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond90.not = icmp eq i64 %indvars.iv.next85, %wide.trip.count89
  br i1 %exitcond90.not, label %for.cond.cleanup, label %for.body, !llvm.loop !12

for.body16:                                       ; preds = %for.body, %for.body16
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body16 ], [ 1, %for.body ]
  %8 = add nsw i64 %indvars.iv, -1
  %arrayidx19 = getelementptr inbounds i32, i32* %3, i64 %8
  %9 = load i32, i32* %arrayidx19, align 4, !tbaa !3
  %arrayidx22 = getelementptr inbounds i32, i32* %4, i64 %8
  %10 = load i32, i32* %arrayidx22, align 4, !tbaa !3
  %add = add nsw i32 %10, %9
  %arrayidx24 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv
  store i32 %add, i32* %arrayidx24, align 4, !tbaa !3
  %arrayidx26 = getelementptr inbounds i32, i32* %7, i64 %indvars.iv
  %11 = load i32, i32* %arrayidx26, align 4, !tbaa !3
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %arrayidx26, align 4, !tbaa !3
  %12 = load i32, i32* %arrayidx19, align 4, !tbaa !3
  %13 = load i32, i32* %arrayidx22, align 4, !tbaa !3
  %add33 = add nsw i32 %13, %12
  %arrayidx35 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv
  store i32 %add33, i32* %arrayidx35, align 4, !tbaa !3
  %14 = load i32, i32* %arrayidx26, align 4, !tbaa !3
  %arrayidx39 = getelementptr inbounds i32, i32* %6, i64 %indvars.iv
  %15 = load i32, i32* %arrayidx39, align 4, !tbaa !3
  %add40 = add nsw i32 %15, %14
  store i32 %add40, i32* %arrayidx39, align 4, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup15, label %for.body16, !llvm.loop !13
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #4

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
