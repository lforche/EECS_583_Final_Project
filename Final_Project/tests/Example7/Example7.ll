; ModuleID = 'Example7.bc'
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
  %broadcast.splatinsert69 = insertelement <2 x i8*> poison, i8* %call, i64 0
  %broadcast.splat70 = shufflevector <2 x i8*> %broadcast.splatinsert69, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert71 = insertelement <2 x i8*> poison, i8* %call1, i64 0
  %broadcast.splat72 = shufflevector <2 x i8*> %broadcast.splatinsert71, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert73 = insertelement <2 x i8*> poison, i8* %call1, i64 0
  %broadcast.splat74 = shufflevector <2 x i8*> %broadcast.splatinsert73, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert75 = insertelement <2 x i8*> poison, i8* %call2, i64 0
  %broadcast.splat76 = shufflevector <2 x i8*> %broadcast.splatinsert75, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert77 = insertelement <2 x i8*> poison, i8* %call2, i64 0
  %broadcast.splat78 = shufflevector <2 x i8*> %broadcast.splatinsert77, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert79 = insertelement <2 x i8*> poison, i8* %call3, i64 0
  %broadcast.splat80 = shufflevector <2 x i8*> %broadcast.splatinsert79, <2 x i8*> poison, <2 x i32> zeroinitializer
  %broadcast.splatinsert81 = insertelement <2 x i8*> poison, i8* %call3, i64 0
  %broadcast.splat82 = shufflevector <2 x i8*> %broadcast.splatinsert81, <2 x i8*> poison, <2 x i32> zeroinitializer
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
  store <2 x i8*> %broadcast.splat70, <2 x i8*>* %27, align 8, !tbaa !7
  %28 = getelementptr inbounds i32*, i32** %5, i64 %index
  %29 = bitcast i32** %28 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat72, <2 x i8*>* %29, align 8, !tbaa !7
  %30 = getelementptr inbounds i32*, i32** %28, i64 2
  %31 = bitcast i32** %30 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat74, <2 x i8*>* %31, align 8, !tbaa !7
  %32 = getelementptr inbounds i32*, i32** %6, i64 %index
  %33 = bitcast i32** %32 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat76, <2 x i8*>* %33, align 8, !tbaa !7
  %34 = getelementptr inbounds i32*, i32** %32, i64 2
  %35 = bitcast i32** %34 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat78, <2 x i8*>* %35, align 8, !tbaa !7
  %36 = getelementptr inbounds i32*, i32** %7, i64 %index
  %37 = bitcast i32** %36 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat80, <2 x i8*>* %37, align 8, !tbaa !7
  %38 = getelementptr inbounds i32*, i32** %36, i64 2
  %39 = bitcast i32** %38 to <2 x i8*>*
  store <2 x i8*> %broadcast.splat82, <2 x i8*>* %39, align 8, !tbaa !7
  %index.next = add nuw nsw i64 %index, 4
  %40 = icmp eq i64 %index.next, 100000000
  br i1 %40, label %for.cond.cleanup, label %vector.body, !llvm.loop !9

for.cond.cleanup:                                 ; preds = %vector.body
  %call22 = tail call i64 @clock() #5
  %arrayidx6.phi.trans.insert.i = getelementptr inbounds i32*, i32** %4, i64 2
  %.pre.i = load i32*, i32** %arrayidx6.phi.trans.insert.i, align 8, !tbaa !7
  br label %for.body.i

for.body.i:                                       ; preds = %for.cond.cleanup15.i, %for.cond.cleanup
  %41 = phi i32* [ %.pre.i, %for.cond.cleanup ], [ %42, %for.cond.cleanup15.i ]
  %indvars.iv107.i = phi i64 [ 3, %for.cond.cleanup ], [ %indvars.iv.next108.i, %for.cond.cleanup15.i ]
  %arrayidx.i = getelementptr inbounds i32*, i32** %4, i64 %indvars.iv107.i
  %42 = load i32*, i32** %arrayidx.i, align 8, !tbaa !7
  %arrayidx2.i = getelementptr inbounds i32*, i32** %5, i64 %indvars.iv107.i
  %43 = load i32*, i32** %arrayidx2.i, align 8, !tbaa !7
  %arrayidx4.i = getelementptr inbounds i32*, i32** %6, i64 %indvars.iv107.i
  %44 = load i32*, i32** %arrayidx4.i, align 8, !tbaa !7
  %45 = add nsw i64 %indvars.iv107.i, -3
  %arrayidx9.i = getelementptr inbounds i32*, i32** %5, i64 %45
  %46 = load i32*, i32** %arrayidx9.i, align 8, !tbaa !7
  %arrayidx12.i = getelementptr inbounds i32*, i32** %7, i64 %45
  %47 = load i32*, i32** %arrayidx12.i, align 8, !tbaa !7
  br label %for.body16.i

for.cond.cleanup15.i:                             ; preds = %for.body16.i
  %indvars.iv.next108.i = add nuw nsw i64 %indvars.iv107.i, 1
  %exitcond113.not.i = icmp eq i64 %indvars.iv.next108.i, 10
  br i1 %exitcond113.not.i, label %P6Viterbi.exit, label %for.body.i, !llvm.loop !12

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
  %arrayidx39.i = getelementptr inbounds i32, i32* %43, i64 %indvars.iv.i
  store i32 %54, i32* %arrayidx39.i, align 4, !tbaa !3
  %55 = load i32, i32* %arrayidx35.i, align 4, !tbaa !3
  %arrayidx43.i = getelementptr inbounds i32, i32* %44, i64 %indvars.iv.i
  store i32 %55, i32* %arrayidx43.i, align 4, !tbaa !3
  %56 = load i32, i32* %arrayidx26.i, align 4, !tbaa !3
  %inc46.i = add nsw i32 %56, 1
  store i32 %inc46.i, i32* %arrayidx26.i, align 4, !tbaa !3
  %arrayidx50.i = getelementptr inbounds i32, i32* %46, i64 %indvars.iv.i
  %57 = load i32, i32* %arrayidx50.i, align 4, !tbaa !3
  %add51.i = add nsw i32 %57, %inc46.i
  store i32 %add51.i, i32* %arrayidx50.i, align 4, !tbaa !3
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
  %isUnaliased = alloca i8, align 1
  %tint = alloca i32, align 4
  store i8 0, i8* %isUnaliased, align 1
  %cmp101 = icmp sgt i32 %loopAmount, 3
  br i1 %cmp101, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %cmp14.not99 = icmp slt i32 %loopCount, 1
  %0 = add i32 %loopCount, 1
  %wide.trip.count112 = zext i32 %loopAmount to i64
  %arrayidx6.phi.trans.insert = getelementptr inbounds i32*, i32** %x, i64 2
  %.pre = load i32*, i32** %arrayidx6.phi.trans.insert, align 8, !tbaa !7
  %wide.trip.count = zext i32 %0 to i64
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.cond.cleanup15
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret i32 0

for.body:                                         ; preds = %for.body.lr.ph, %for.cond.cleanup15
  %1 = phi i32* [ %.pre, %for.body.lr.ph ], [ %2, %for.cond.cleanup15 ]
  %indvars.iv107 = phi i64 [ 3, %for.body.lr.ph ], [ %indvars.iv.next108, %for.cond.cleanup15 ]
  %arrayidx = getelementptr inbounds i32*, i32** %x, i64 %indvars.iv107
  %2 = load i32*, i32** %arrayidx, align 8, !tbaa !7
  %arrayidx2 = getelementptr inbounds i32*, i32** %y, i64 %indvars.iv107
  %3 = load i32*, i32** %arrayidx2, align 8, !tbaa !7
  %arrayidx4 = getelementptr inbounds i32*, i32** %z, i64 %indvars.iv107
  %4 = load i32*, i32** %arrayidx4, align 8, !tbaa !7
  %5 = add nsw i64 %indvars.iv107, -3
  %arrayidx9 = getelementptr inbounds i32*, i32** %y, i64 %5
  %6 = load i32*, i32** %arrayidx9, align 8, !tbaa !7
  %arrayidx12 = getelementptr inbounds i32*, i32** %q, i64 %5
  %7 = load i32*, i32** %arrayidx12, align 8, !tbaa !7
  br i1 %cmp14.not99, label %for.cond.cleanup15, label %for.body16.preheader

for.body16.preheader:                             ; preds = %for.body
  %tunalias = load i8, i8* %isUnaliased, align 1
  %arrIdxLow = getelementptr inbounds i32, i32* %7, i64 1
  %arrIdxHi = getelementptr inbounds i32, i32* %7, i32 %loopCount
  %unaliasedCheck = icmp ne i8 %tunalias, 1
  br i1 %unaliasedCheck, label %8, label %19

8:                                                ; preds = %for.body16.preheader
  %cmpHi0 = getelementptr inbounds i32, i32* %7, i32 %loopCount
  %lCheck = icmp ult i32* %cmpHi0, %arrIdxLow
  br i1 %lCheck, label %10, label %9

9:                                                ; preds = %8
  %cmpLow0 = getelementptr inbounds i32, i32* %7, i64 1
  %rCheck0 = icmp ugt i32* %cmpLow0, %arrIdxHi
  br i1 %rCheck0, label %10, label %19

10:                                               ; preds = %8, %9
  %cmpHi1 = getelementptr inbounds i32, i32* %7, i32 %loopCount
  %Check = icmp ult i32* %cmpHi1, %arrIdxLow
  br i1 %Check, label %12, label %11

11:                                               ; preds = %10
  %cmpLow1 = getelementptr inbounds i32, i32* %7, i64 1
  %rCheck1 = icmp ugt i32* %cmpLow1, %arrIdxHi
  br i1 %rCheck1, label %12, label %19

12:                                               ; preds = %10, %11
  %cmpHi2 = getelementptr inbounds i32, i32* %7, i32 %loopCount
  %heck = icmp ult i32* %cmpHi2, %arrIdxLow
  br i1 %heck, label %14, label %13

13:                                               ; preds = %12
  %cmpLow2 = getelementptr inbounds i32, i32* %7, i64 1
  %rCheck2 = icmp ugt i32* %cmpLow2, %arrIdxHi
  br i1 %rCheck2, label %14, label %19

14:                                               ; preds = %12, %13
  %cmpHi3 = getelementptr inbounds i32, i32* %7, i32 %loopCount
  %eck = icmp ult i32* %cmpHi3, %arrIdxLow
  br i1 %eck, label %16, label %15

15:                                               ; preds = %14
  %cmpLow3 = getelementptr inbounds i32, i32* %7, i64 1
  %rCheck3 = icmp ugt i32* %cmpLow3, %arrIdxHi
  br i1 %rCheck3, label %16, label %19

16:                                               ; preds = %14, %15
  %cmpHi4 = getelementptr inbounds i32, i32* %7, i32 %loopCount
  %ck = icmp ult i32* %cmpHi4, %arrIdxLow
  br i1 %ck, label %18, label %17

17:                                               ; preds = %16
  %cmpLow4 = getelementptr inbounds i32, i32* %7, i64 1
  %rCheck4 = icmp ugt i32* %cmpLow4, %arrIdxHi
  br i1 %rCheck4, label %18, label %19

18:                                               ; preds = %16, %17
  store i8 1, i8* %isUnaliased, align 1
  br label %19

19:                                               ; preds = %18, %17, %15, %13, %11, %9, %for.body16.preheader
  %tunalias1 = load i8, i8* %isUnaliased, align 1
  br label %for.body16

for.cond.cleanup15.loopexit:                      ; preds = %47
  br label %for.cond.cleanup15

for.cond.cleanup15:                               ; preds = %for.cond.cleanup15.loopexit, %for.body
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond113.not = icmp eq i64 %indvars.iv.next108, %wide.trip.count112
  br i1 %exitcond113.not, label %for.cond.cleanup.loopexit, label %for.body, !llvm.loop !12

for.body16:                                       ; preds = %19, %47
  %indvars.iv = phi i64 [ %indvars.iv.next, %47 ], [ 1, %19 ]
  %20 = add nsw i64 %indvars.iv, -1
  %arrayidx19 = getelementptr inbounds i32, i32* %3, i64 %20
  %21 = load i32, i32* %arrayidx19, align 4, !tbaa !3
  %arrayidx22 = getelementptr inbounds i32, i32* %4, i64 %20
  %22 = load i32, i32* %arrayidx22, align 4, !tbaa !3
  %add = add nsw i32 %22, %21
  %arrayidx24 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv
  store i32 %add, i32* %arrayidx24, align 4, !tbaa !3
  %arrayidx26 = getelementptr inbounds i32, i32* %7, i64 %indvars.iv
  %tunCmp = icmp eq i8 %tunalias1, 1
  br i1 %tunCmp, label %23, label %35

23:                                               ; preds = %for.body16
  %24 = load i32, i32* %arrayidx26, align 4, !tbaa !3
  %25 = load i32, i32* %arrayidx26, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %arrayidx26, align 4, !tbaa !3
  %27 = load i32, i32* %arrayidx19, align 4, !tbaa !3
  %28 = load i32, i32* %arrayidx22, align 4, !tbaa !3
  %29 = add nsw i32 %28, %27
  %30 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv
  store i32 %29, i32* %30, align 4, !tbaa !3
  %31 = load i32, i32* %arrayidx26, align 4, !tbaa !3
  %32 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv
  store i32 %31, i32* %32, align 4, !tbaa !3
  %33 = load i32, i32* %30, align 4, !tbaa !3
  %34 = getelementptr inbounds i32, i32* %4, i64 %indvars.iv
  store i32 %33, i32* %34, align 4, !tbaa !3
  br label %47

35:                                               ; preds = %for.body16
  %36 = load i32, i32* %arrayidx26, align 4, !tbaa !3
  %37 = load i32, i32* %arrayidx26, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %arrayidx26, align 4, !tbaa !3
  %39 = load i32, i32* %arrayidx19, align 4, !tbaa !3
  %40 = load i32, i32* %arrayidx22, align 4, !tbaa !3
  %41 = add nsw i32 %40, %39
  %42 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv
  store i32 %41, i32* %42, align 4, !tbaa !3
  %43 = load i32, i32* %arrayidx26, align 4, !tbaa !3
  %44 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv
  store i32 %43, i32* %44, align 4, !tbaa !3
  %45 = load i32, i32* %42, align 4, !tbaa !3
  %46 = getelementptr inbounds i32, i32* %4, i64 %indvars.iv
  store i32 %45, i32* %46, align 4, !tbaa !3
  br label %47

47:                                               ; preds = %35, %23
  %phi12 = phi i32* [ %34, %23 ], [ %46, %35 ]
  %phi11 = phi i32 [ %33, %23 ], [ %45, %35 ]
  %phi10 = phi i32* [ %32, %23 ], [ %44, %35 ]
  %phi9 = phi i32 [ %31, %23 ], [ %43, %35 ]
  %phi8 = phi i32* [ %30, %23 ], [ %42, %35 ]
  %phi7 = phi i32 [ %29, %23 ], [ %41, %35 ]
  %phi6 = phi i32 [ %28, %23 ], [ %40, %35 ]
  %phi5 = phi i32 [ %27, %23 ], [ %39, %35 ]
  %phi4 = phi i32 [ %26, %23 ], [ %38, %35 ]
  %phi3 = phi i32 [ %25, %23 ], [ %37, %35 ]
  %phi = phi i32 [ %24, %23 ], [ %36, %35 ]
  %48 = load i32, i32* %arrayidx26, align 4, !tbaa !3
  %inc46 = add nsw i32 %48, 1
  store i32 %inc46, i32* %arrayidx26, align 4, !tbaa !3
  %arrayidx50 = getelementptr inbounds i32, i32* %6, i64 %indvars.iv
  %49 = load i32, i32* %arrayidx50, align 4, !tbaa !3
  %add51 = add nsw i32 %49, %inc46
  store i32 %add51, i32* %arrayidx50, align 4, !tbaa !3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup15.loopexit, label %for.body16, !llvm.loop !13
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
