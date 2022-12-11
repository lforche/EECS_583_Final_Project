; ModuleID = 'Example6.c'
source_filename = "Example6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@LOOPCOUNT = dso_local local_unnamed_addr constant i32 100000000, align 4
@INFTY = dso_local local_unnamed_addr constant i32 10, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %call = tail call noalias dereferenceable_or_null(400000000) i8* @malloc(i64 noundef 400000000) #4
  %0 = bitcast i8* %call to i32*
  %call1 = tail call noalias dereferenceable_or_null(400000000) i8* @malloc(i64 noundef 400000000) #4
  %1 = bitcast i8* %call1 to i32*
  %call2 = tail call noalias dereferenceable_or_null(400000000) i8* @malloc(i64 noundef 400000000) #4
  %2 = bitcast i8* %call2 to i32*
  %call3 = tail call noalias dereferenceable_or_null(800000000) i8* @malloc(i64 noundef 800000000) #4
  %3 = bitcast i8* %call3 to i32**
  %call4 = tail call noalias dereferenceable_or_null(800000000) i8* @malloc(i64 noundef 800000000) #4
  %4 = bitcast i8* %call4 to i32**
  %call5 = tail call noalias dereferenceable_or_null(800000000) i8* @malloc(i64 noundef 800000000) #4
  %5 = bitcast i8* %call5 to i32**
  %call6 = tail call noalias dereferenceable_or_null(800000000) i8* @malloc(i64 noundef 800000000) #4
  %6 = bitcast i8* %call6 to i32**
  %broadcast.splatinsert = insertelement <2 x i8*> poison, i8* %call, i64 0
  %broadcast.splat = shufflevector <2 x i8*> %broadcast.splatinsert, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert50 = insertelement <2 x i8*> poison, i8* %call, i64 0
  %broadcast.splat51 = shufflevector <2 x i8*> %broadcast.splatinsert50, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert52 = insertelement <2 x i8*> poison, i8* %call1, i64 0
  %broadcast.splat53 = shufflevector <2 x i8*> %broadcast.splatinsert52, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert54 = insertelement <2 x i8*> poison, i8* %call1, i64 0
  %broadcast.splat55 = shufflevector <2 x i8*> %broadcast.splatinsert54, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert56 = insertelement <2 x i8*> poison, i8* %call2, i64 0
  %broadcast.splat57 = shufflevector <2 x i8*> %broadcast.splatinsert56, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert58 = insertelement <2 x i8*> poison, i8* %call2, i64 0
  %broadcast.splat59 = shufflevector <2 x i8*> %broadcast.splatinsert58, <2 x i8*> poison, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %7 = getelementptr inbounds i32, i32* %0, i64 %index
  %8 = bitcast i32* %7 to <2 x i32>*
  store <2 x i32> <i32 1, i32 1>, <2 x i32>* %8, align 4, !tbaa !3
  %9 = getelementptr inbounds i32, i32* %7, i64 2
  %10 = bitcast i32* %9 to <2 x i32>*
  store <2 x i32> <i32 1, i32 1>, <2 x i32>* %10, align 4, !tbaa !3
  %11 = getelementptr inbounds i32, i32* %1, i64 %index
  %12 = bitcast i32* %11 to <2 x i32>*
  store <2 x i32> <i32 2, i32 2>, <2 x i32>* %12, align 4, !tbaa !3
  %13 = getelementptr inbounds i32, i32* %11, i64 2
  %14 = bitcast i32* %13 to <2 x i32>*
  store <2 x i32> <i32 2, i32 2>, <2 x i32>* %14, align 4, !tbaa !3
  %15 = getelementptr inbounds i32, i32* %2, i64 %index
  %16 = bitcast i32* %15 to <2 x i32>*
  store <2 x i32> <i32 3, i32 3>, <2 x i32>* %16, align 4, !tbaa !3
  %17 = getelementptr inbounds i32, i32* %15, i64 2
  %18 = bitcast i32* %17 to <2 x i32>*
  store <2 x i32> <i32 3, i32 3>, <2 x i32>* %18, align 4, !tbaa !3
  %19 = getelementptr inbounds i32*, i32** %3, i64 %index
  %20 = bitcast i32** %19 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat, <2 x i8*>* %20, align 8, !tbaa !7
  %21 = getelementptr inbounds i32*, i32** %19, i64 2
  %22 = bitcast i32** %21 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat51, <2 x i8*>* %22, align 8, !tbaa !7
  %23 = getelementptr inbounds i32*, i32** %4, i64 %index
  %24 = bitcast i32** %23 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat53, <2 x i8*>* %24, align 8, !tbaa !7
  %25 = getelementptr inbounds i32*, i32** %23, i64 2
  %26 = bitcast i32** %25 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat55, <2 x i8*>* %26, align 8, !tbaa !7
  %27 = getelementptr inbounds i32*, i32** %5, i64 %index
  %28 = bitcast i32** %27 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat57, <2 x i8*>* %28, align 8, !tbaa !7
  %29 = getelementptr inbounds i32*, i32** %27, i64 2
  %30 = bitcast i32** %29 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat59, <2 x i8*>* %30, align 8, !tbaa !7
  %31 = getelementptr inbounds i32*, i32** %6, i64 %index
  %32 = bitcast i32** %31 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat53, <2 x i8*>* %32, align 8, !tbaa !7
  %33 = getelementptr inbounds i32*, i32** %31, i64 2
  %34 = bitcast i32** %33 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat55, <2 x i8*>* %34, align 8, !tbaa !7
  %index.next = add nuw i64 %index, 4
  %35 = icmp eq i64 %index.next, 100000000
  br i1 %35, label %for.cond.cleanup, label %vector.body, !llvm.loop !9

for.cond.cleanup:                                 ; preds = %vector.body
  %call19 = tail call i32 @P6Viterbi(i32** noundef nonnull %3, i32** noundef nonnull %4, i32** noundef nonnull %5, i32** noundef nonnull %6, i32 noundef 10, i32 noundef 100000000)
  %call20 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %call19)
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i32 @P6Viterbi(i32** nocapture noundef readonly %x, i32** nocapture noundef readonly %y, i32** nocapture noundef readonly %z, i32** nocapture noundef readonly %q, i32 noundef %loopAmount, i32 noundef %loopCount) local_unnamed_addr #3 {
entry:
  %cmp301 = icmp sgt i32 %loopAmount, 3
  br i1 %cmp301, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %cmp46.not299 = icmp slt i32 %loopCount, 1
  %0 = add i32 %loopCount, 1
  %wide.trip.count313 = zext i32 %loopAmount to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.cond.cleanup47, %entry
  %sc.0.lcssa = phi i32 [ 0, %entry ], [ %sc.1.lcssa, %for.cond.cleanup47 ]
  ret i32 %sc.0.lcssa

for.body:                                         ; preds = %for.body.lr.ph, %for.cond.cleanup47
  %indvars.iv307 = phi i64 [ 3, %for.body.lr.ph ], [ %indvars.iv.next308, %for.cond.cleanup47 ]
  %sc.0302 = phi i32 [ 0, %for.body.lr.ph ], [ %sc.1.lcssa, %for.cond.cleanup47 ]
  %arrayidx = getelementptr inbounds i32*, i32** %x, i64 %indvars.iv307
  %1 = load i32*, i32** %arrayidx, align 8, !tbaa !7
  %arrayidx2 = getelementptr inbounds i32*, i32** %y, i64 %indvars.iv307
  %2 = load i32*, i32** %arrayidx2, align 8, !tbaa !7
  %arrayidx4 = getelementptr inbounds i32*, i32** %z, i64 %indvars.iv307
  %3 = load i32*, i32** %arrayidx4, align 8, !tbaa !7
  %arrayidx6 = getelementptr inbounds i32*, i32** %q, i64 %indvars.iv307
  %4 = load i32*, i32** %arrayidx6, align 8, !tbaa !7
  %5 = add nsw i64 %indvars.iv307, -1
  %arrayidx8 = getelementptr inbounds i32*, i32** %x, i64 %5
  %6 = load i32*, i32** %arrayidx8, align 8, !tbaa !7
  %arrayidx11 = getelementptr inbounds i32*, i32** %y, i64 %5
  %7 = load i32*, i32** %arrayidx11, align 8, !tbaa !7
  %arrayidx14 = getelementptr inbounds i32*, i32** %z, i64 %5
  %8 = load i32*, i32** %arrayidx14, align 8, !tbaa !7
  %arrayidx17 = getelementptr inbounds i32*, i32** %q, i64 %5
  %9 = load i32*, i32** %arrayidx17, align 8, !tbaa !7
  %10 = add nsw i64 %indvars.iv307, -2
  %arrayidx20 = getelementptr inbounds i32*, i32** %x, i64 %10
  %11 = load i32*, i32** %arrayidx20, align 8, !tbaa !7
  %arrayidx23 = getelementptr inbounds i32*, i32** %y, i64 %10
  %12 = load i32*, i32** %arrayidx23, align 8, !tbaa !7
  %arrayidx26 = getelementptr inbounds i32*, i32** %z, i64 %10
  %13 = load i32*, i32** %arrayidx26, align 8, !tbaa !7
  %arrayidx29 = getelementptr inbounds i32*, i32** %q, i64 %10
  %14 = load i32*, i32** %arrayidx29, align 8, !tbaa !7
  %15 = add nsw i64 %indvars.iv307, -3
  %arrayidx32 = getelementptr inbounds i32*, i32** %x, i64 %15
  %16 = load i32*, i32** %arrayidx32, align 8, !tbaa !7
  %arrayidx35 = getelementptr inbounds i32*, i32** %y, i64 %15
  %17 = load i32*, i32** %arrayidx35, align 8, !tbaa !7
  %arrayidx38 = getelementptr inbounds i32*, i32** %z, i64 %15
  %18 = load i32*, i32** %arrayidx38, align 8, !tbaa !7
  %arrayidx41 = getelementptr inbounds i32*, i32** %q, i64 %15
  %19 = load i32*, i32** %arrayidx41, align 8, !tbaa !7
  br i1 %cmp46.not299, label %for.cond.cleanup47, label %for.body48

for.cond.cleanup47:                               ; preds = %for.inc, %for.body
  %sc.1.lcssa = phi i32 [ %sc.0302, %for.body ], [ %sc.2, %for.inc ]
  %indvars.iv.next308 = add nuw nsw i64 %indvars.iv307, 1
  %exitcond314.not = icmp eq i64 %indvars.iv.next308, %wide.trip.count313
  br i1 %exitcond314.not, label %for.cond.cleanup, label %for.body, !llvm.loop !12

for.body48:                                       ; preds = %for.body, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 1, %for.body ]
  %20 = add nsw i64 %indvars.iv, -1
  %arrayidx51 = getelementptr inbounds i32, i32* %2, i64 %20
  %21 = load i32, i32* %arrayidx51, align 4, !tbaa !3
  %arrayidx54 = getelementptr inbounds i32, i32* %3, i64 %20
  %22 = load i32, i32* %arrayidx54, align 4, !tbaa !3
  %add = add nsw i32 %22, %21
  %arrayidx56 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv
  store i32 %add, i32* %arrayidx56, align 4, !tbaa !3
  %arrayidx59 = getelementptr inbounds i32, i32* %4, i64 %20
  %23 = load i32, i32* %arrayidx59, align 4, !tbaa !3
  %arrayidx62 = getelementptr inbounds i32, i32* %6, i64 %20
  %24 = load i32, i32* %arrayidx62, align 4, !tbaa !3
  %add63 = add nsw i32 %24, %23
  %cmp66 = icmp sgt i32 %add63, %add
  %spec.store.select = select i1 %cmp66, i32 %add63, i32 %add
  store i32 %spec.store.select, i32* %arrayidx56, align 4
  %arrayidx71 = getelementptr inbounds i32, i32* %7, i64 %20
  %25 = load i32, i32* %arrayidx71, align 4, !tbaa !3
  %arrayidx74 = getelementptr inbounds i32, i32* %8, i64 %20
  %26 = load i32, i32* %arrayidx74, align 4, !tbaa !3
  %add75 = add nsw i32 %26, %25
  %cmp78 = icmp sgt i32 %add75, %spec.store.select
  %spec.store.select294 = select i1 %cmp78, i32 %add75, i32 %spec.store.select
  store i32 %spec.store.select294, i32* %arrayidx56, align 4
  %arrayidx84 = getelementptr inbounds i32, i32* %9, i64 %indvars.iv
  %27 = load i32, i32* %arrayidx84, align 4, !tbaa !3
  %arrayidx86 = getelementptr inbounds i32, i32* %11, i64 %indvars.iv
  %28 = load i32, i32* %arrayidx86, align 4, !tbaa !3
  %add87 = add nsw i32 %28, %27
  %cmp90 = icmp sgt i32 %add87, %spec.store.select294
  %spec.store.select297 = select i1 %cmp90, i32 %add87, i32 %spec.store.select294
  store i32 %spec.store.select297, i32* %arrayidx56, align 4
  %arrayidx96 = getelementptr inbounds i32, i32* %12, i64 %indvars.iv
  %29 = load i32, i32* %arrayidx96, align 4, !tbaa !3
  %add99 = add nsw i32 %spec.store.select297, %29
  %30 = icmp sgt i32 %add99, -10
  %spec.select = select i1 %30, i32 %add99, i32 -10
  store i32 %spec.select, i32* %arrayidx56, align 4, !tbaa !3
  %arrayidx109 = getelementptr inbounds i32, i32* %13, i64 %20
  %31 = load i32, i32* %arrayidx109, align 4, !tbaa !3
  %arrayidx112 = getelementptr inbounds i32, i32* %14, i64 %20
  %32 = load i32, i32* %arrayidx112, align 4, !tbaa !3
  %add113 = add nsw i32 %32, %31
  %arrayidx115 = getelementptr inbounds i32, i32* %13, i64 %indvars.iv
  store i32 %add113, i32* %arrayidx115, align 4, !tbaa !3
  %arrayidx118 = getelementptr inbounds i32, i32* %1, i64 %20
  %33 = load i32, i32* %arrayidx118, align 4, !tbaa !3
  %arrayidx121 = getelementptr inbounds i32, i32* %16, i64 %20
  %34 = load i32, i32* %arrayidx121, align 4, !tbaa !3
  %add122 = add nsw i32 %34, %33
  %cmp125 = icmp sgt i32 %add122, %add113
  %spec.store.select295 = select i1 %cmp125, i32 %add122, i32 %add113
  %35 = icmp sgt i32 %spec.store.select295, -10
  %spec.store.select298 = select i1 %35, i32 %spec.store.select295, i32 -10
  store i32 %spec.store.select298, i32* %arrayidx115, align 4
  %cmp137 = icmp ult i64 %indvars.iv, 10
  br i1 %cmp137, label %if.then138, label %for.inc

if.then138:                                       ; preds = %for.body48
  %arrayidx140 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv
  %36 = load i32, i32* %arrayidx140, align 4, !tbaa !3
  %arrayidx142 = getelementptr inbounds i32, i32* %18, i64 %indvars.iv
  %37 = load i32, i32* %arrayidx142, align 4, !tbaa !3
  %add143 = add nsw i32 %37, %36
  %arrayidx145 = getelementptr inbounds i32, i32* %17, i64 %indvars.iv
  store i32 %add143, i32* %arrayidx145, align 4, !tbaa !3
  %arrayidx147 = getelementptr inbounds i32, i32* %4, i64 %indvars.iv
  %38 = load i32, i32* %arrayidx147, align 4, !tbaa !3
  %arrayidx149 = getelementptr inbounds i32, i32* %19, i64 %indvars.iv
  %39 = load i32, i32* %arrayidx149, align 4, !tbaa !3
  %add150 = add nsw i32 %39, %38
  %cmp153 = icmp sgt i32 %add150, %add143
  %spec.store.select293 = select i1 %cmp153, i32 %add150, i32 %add143
  store i32 %spec.store.select293, i32* %arrayidx145, align 4
  %40 = load i32, i32* %arrayidx149, align 4, !tbaa !3
  %add162 = add nsw i32 %spec.store.select293, %40
  %41 = icmp sgt i32 %add162, -10
  %spec.store.select296 = select i1 %41, i32 %add162, i32 -10
  store i32 %spec.store.select296, i32* %arrayidx145, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.then138, %for.body48
  %sc.2 = phi i32 [ %add122, %for.body48 ], [ %add150, %if.then138 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup47, label %for.body48, !llvm.loop !13
}

attributes #0 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
