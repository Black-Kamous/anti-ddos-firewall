; ModuleID = 'xdp_pass_kern.c'
source_filename = "xdp_pass_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { [11 x i32]*, %struct.qname_lpm_key*, i32*, [1 x i32]*, [255 x i32]* }
%struct.qname_lpm_key = type { i32, [64 x i8] }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }
%struct.udphdr = type { i16, i16, i16, i16 }

@main_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !0
@__const.xdp_patch_ports_func.____fmt = private unnamed_addr constant [19 x i8] c"blocked prefix: %d\00", align 1
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !58
@__const.get_qname_lpm_key.____fmt = private unnamed_addr constant [11 x i8] c"dm len:%d\0A\00", align 1
@__const.get_qname_lpm_key.____fmt.1 = private unnamed_addr constant [15 x i8] c"rev suffix:%s\0A\00", align 1
@llvm.compiler.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon* @main_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_patch_ports_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_patch_ports_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_patch_ports" !dbg !113 {
  %2 = alloca [64 x i8], align 1
  %3 = alloca [11 x i8], align 1
  %4 = alloca [15 x i8], align 1
  %5 = alloca %struct.qname_lpm_key, align 4
  %6 = alloca [19 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !125, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i32 2, metadata !126, metadata !DIExpression()), !dbg !224
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !225
  %8 = load i32, i32* %7, align 4, !dbg !225, !tbaa !226
  %9 = zext i32 %8 to i64, !dbg !231
  %10 = inttoptr i64 %9 to i8*, !dbg !232
  call void @llvm.dbg.value(metadata i8* %10, metadata !201, metadata !DIExpression()), !dbg !224
  %11 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !233
  %12 = load i32, i32* %11, align 4, !dbg !233, !tbaa !234
  %13 = zext i32 %12 to i64, !dbg !235
  %14 = inttoptr i64 %13 to i8*, !dbg !236
  call void @llvm.dbg.value(metadata i8* %14, metadata !202, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i8* %14, metadata !203, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !129, metadata !DIExpression(DW_OP_deref)), !dbg !224
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !237, metadata !DIExpression()) #8, !dbg !246
  call void @llvm.dbg.value(metadata i8* %10, metadata !244, metadata !DIExpression()) #8, !dbg !246
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !245, metadata !DIExpression()) #8, !dbg !246
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !248, metadata !DIExpression()) #8, !dbg !273
  call void @llvm.dbg.value(metadata i8* %10, metadata !260, metadata !DIExpression()) #8, !dbg !273
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !261, metadata !DIExpression()) #8, !dbg !273
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !262, metadata !DIExpression()) #8, !dbg !273
  call void @llvm.dbg.value(metadata i8* %14, metadata !263, metadata !DIExpression()) #8, !dbg !273
  call void @llvm.dbg.value(metadata i32 14, metadata !264, metadata !DIExpression()) #8, !dbg !273
  %15 = getelementptr i8, i8* %14, i64 14, !dbg !275
  %16 = icmp ugt i8* %15, %10, !dbg !277
  br i1 %16, label %151, label %17, !dbg !278

17:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %14, metadata !263, metadata !DIExpression()) #8, !dbg !273
  call void @llvm.dbg.value(metadata i8* %15, metadata !203, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i8* %15, metadata !265, metadata !DIExpression()) #8, !dbg !273
  %18 = getelementptr inbounds i8, i8* %14, i64 12, !dbg !279
  %19 = bitcast i8* %18 to i16*, !dbg !279
  call void @llvm.dbg.value(metadata i16 undef, metadata !271, metadata !DIExpression()) #8, !dbg !273
  call void @llvm.dbg.value(metadata i32 0, metadata !272, metadata !DIExpression()) #8, !dbg !273
  %20 = inttoptr i64 %9 to %struct.vlan_hdr*
  %21 = load i16, i16* %19, align 1, !dbg !273, !tbaa !280
  call void @llvm.dbg.value(metadata i16 %21, metadata !271, metadata !DIExpression()) #8, !dbg !273
  call void @llvm.dbg.value(metadata i16 %21, metadata !282, metadata !DIExpression()) #8, !dbg !287
  %22 = icmp eq i16 %21, 129, !dbg !293
  %23 = icmp ne i16 %21, -22392, !dbg !294
  %24 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %22) #8
  %25 = xor i1 %24, true, !dbg !294
  %26 = select i1 %25, i1 %23, i1 false, !dbg !294
  br i1 %26, label %48, label %27, !dbg !295

27:                                               ; preds = %17
  %28 = getelementptr i8, i8* %14, i64 18, !dbg !296
  %29 = bitcast i8* %28 to %struct.vlan_hdr*, !dbg !296
  %30 = icmp ugt %struct.vlan_hdr* %29, %20, !dbg !298
  br i1 %30, label %48, label %31, !dbg !299

31:                                               ; preds = %27
  call void @llvm.dbg.value(metadata i16 undef, metadata !271, metadata !DIExpression()) #8, !dbg !273
  %32 = getelementptr i8, i8* %14, i64 16, !dbg !300
  %33 = bitcast i8* %32 to i16*, !dbg !300
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %29, metadata !265, metadata !DIExpression()) #8, !dbg !273
  call void @llvm.dbg.value(metadata i32 1, metadata !272, metadata !DIExpression()) #8, !dbg !273
  %34 = load i16, i16* %33, align 1, !dbg !273, !tbaa !280
  call void @llvm.dbg.value(metadata i16 %34, metadata !271, metadata !DIExpression()) #8, !dbg !273
  call void @llvm.dbg.value(metadata i16 %34, metadata !282, metadata !DIExpression()) #8, !dbg !287
  %35 = icmp eq i16 %34, 129, !dbg !293
  %36 = icmp ne i16 %34, -22392, !dbg !294
  %37 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %35) #8
  %38 = xor i1 %37, true, !dbg !294
  %39 = select i1 %38, i1 %36, i1 false, !dbg !294
  br i1 %39, label %48, label %40, !dbg !295

40:                                               ; preds = %31
  %41 = getelementptr i8, i8* %14, i64 22, !dbg !296
  %42 = bitcast i8* %41 to %struct.vlan_hdr*, !dbg !296
  %43 = icmp ugt %struct.vlan_hdr* %42, %20, !dbg !298
  br i1 %43, label %48, label %44, !dbg !299

44:                                               ; preds = %40
  call void @llvm.dbg.value(metadata i16 undef, metadata !271, metadata !DIExpression()) #8, !dbg !273
  %45 = getelementptr i8, i8* %14, i64 20, !dbg !300
  %46 = bitcast i8* %45 to i16*, !dbg !300
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %42, metadata !265, metadata !DIExpression()) #8, !dbg !273
  call void @llvm.dbg.value(metadata i32 2, metadata !272, metadata !DIExpression()) #8, !dbg !273
  %47 = load i16, i16* %46, align 1, !dbg !273, !tbaa !280
  call void @llvm.dbg.value(metadata i16 %47, metadata !271, metadata !DIExpression()) #8, !dbg !273
  br label %48

48:                                               ; preds = %17, %27, %31, %40, %44
  %49 = phi i8* [ %15, %27 ], [ %15, %17 ], [ %28, %31 ], [ %28, %40 ], [ %41, %44 ], !dbg !273
  %50 = phi i16 [ %21, %27 ], [ %21, %17 ], [ %34, %31 ], [ %34, %40 ], [ %47, %44 ], !dbg !273
  call void @llvm.dbg.value(metadata i8* %49, metadata !203, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i16 %50, metadata !127, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !224
  switch i16 %50, label %151 [
    i16 8, label %51
    i16 -8826, label %63
  ], !dbg !301

51:                                               ; preds = %48
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !142, metadata !DIExpression(DW_OP_deref)), !dbg !224
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !302, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i8* %10, metadata !308, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !309, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i8* %49, metadata !310, metadata !DIExpression()), !dbg !312
  %52 = getelementptr inbounds i8, i8* %49, i64 20, !dbg !316
  %53 = icmp ugt i8* %52, %10, !dbg !318
  br i1 %53, label %151, label %54, !dbg !319

54:                                               ; preds = %51
  %55 = load i8, i8* %49, align 4, !dbg !320
  %56 = shl i8 %55, 2, !dbg !321
  %57 = and i8 %56, 60, !dbg !321
  call void @llvm.dbg.value(metadata i8 %57, metadata !311, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !312
  %58 = icmp ult i8 %57, 20, !dbg !322
  br i1 %58, label %151, label %59, !dbg !324

59:                                               ; preds = %54
  %60 = zext i8 %57 to i64
  call void @llvm.dbg.value(metadata i64 %60, metadata !311, metadata !DIExpression()), !dbg !312
  %61 = getelementptr i8, i8* %49, i64 %60, !dbg !325
  %62 = icmp ugt i8* %61, %10, !dbg !327
  br i1 %62, label %151, label %68, !dbg !328

63:                                               ; preds = %48
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !329, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.value(metadata i8* %10, metadata !335, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !336, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.value(metadata i8* %49, metadata !337, metadata !DIExpression()), !dbg !338
  %64 = getelementptr inbounds i8, i8* %49, i64 40, !dbg !342
  %65 = bitcast i8* %64 to %struct.ipv6hdr*, !dbg !342
  %66 = inttoptr i64 %9 to %struct.ipv6hdr*, !dbg !344
  %67 = icmp ugt %struct.ipv6hdr* %65, %66, !dbg !345
  br i1 %67, label %151, label %68, !dbg !346

68:                                               ; preds = %63, %59
  %69 = phi i64 [ 9, %59 ], [ 6, %63 ]
  %70 = phi i8* [ %61, %59 ], [ %64, %63 ], !dbg !347
  %71 = getelementptr inbounds i8, i8* %49, i64 %69, !dbg !348
  %72 = load i8, i8* %71, align 1, !dbg !348, !tbaa !349
  call void @llvm.dbg.value(metadata i8* %70, metadata !203, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i8 %72, metadata !128, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !224
  %73 = icmp eq i8 %72, 17, !dbg !350
  br i1 %73, label %74, label %151, !dbg !351

74:                                               ; preds = %68
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !352, metadata !DIExpression()), !dbg !362
  call void @llvm.dbg.value(metadata i8* %10, metadata !358, metadata !DIExpression()), !dbg !362
  call void @llvm.dbg.value(metadata %struct.udphdr** undef, metadata !359, metadata !DIExpression()), !dbg !362
  call void @llvm.dbg.value(metadata i8* %70, metadata !361, metadata !DIExpression()), !dbg !362
  %75 = getelementptr inbounds i8, i8* %70, i64 8, !dbg !364
  %76 = bitcast i8* %75 to %struct.udphdr*, !dbg !364
  %77 = inttoptr i64 %9 to %struct.udphdr*, !dbg !366
  %78 = icmp ugt %struct.udphdr* %76, %77, !dbg !367
  %79 = select i1 %78, i8* %70, i8* %75, !dbg !368
  call void @llvm.dbg.value(metadata i8* %79, metadata !203, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i32 undef, metadata !208, metadata !DIExpression()), !dbg !369
  %80 = getelementptr inbounds i8, i8* %79, i64 12, !dbg !370
  %81 = icmp ugt i8* %80, %10, !dbg !372
  br i1 %81, label %151, label %82, !dbg !373

82:                                               ; preds = %74
  %83 = getelementptr inbounds i8, i8* %79, i64 4, !dbg !374
  %84 = bitcast i8* %83 to i16*, !dbg !374
  %85 = load i16, i16* %84, align 2, !dbg !375, !tbaa !280
  call void @llvm.dbg.value(metadata i16 %85, metadata !211, metadata !DIExpression()), !dbg !369
  %86 = icmp eq i16 %85, 0, !dbg !376
  br i1 %86, label %151, label %87, !dbg !377

87:                                               ; preds = %82
  %88 = bitcast %struct.qname_lpm_key* %5 to i8*, !dbg !378
  call void @llvm.lifetime.start.p0i8(i64 68, i8* nonnull %88) #8, !dbg !378
  call void @llvm.dbg.declare(metadata %struct.qname_lpm_key* %5, metadata !212, metadata !DIExpression()), !dbg !379
  tail call void @llvm.experimental.noalias.scope.decl(metadata !380), !dbg !383
  call void @llvm.dbg.value(metadata i8* %80, metadata !384, metadata !DIExpression()) #8, !dbg !412
  call void @llvm.dbg.value(metadata i8* %10, metadata !389, metadata !DIExpression()) #8, !dbg !412
  call void @llvm.dbg.declare(metadata %struct.qname_lpm_key* %5, metadata !390, metadata !DIExpression()) #8, !dbg !414
  %89 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %5, i64 0, i32 1, i64 0, !dbg !414
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(68) %89, i8 0, i64 64, i1 false) #8, !dbg !414, !alias.scope !380
  %90 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %5, i64 0, i32 0, !dbg !414
  store i32 64, i32* %90, align 4, !dbg !414, !alias.scope !380
  call void @llvm.dbg.value(metadata i64 0, metadata !391, metadata !DIExpression()) #8, !dbg !412
  call void @llvm.dbg.value(metadata i8 0, metadata !394, metadata !DIExpression()) #8, !dbg !412
  call void @llvm.dbg.value(metadata i8 0, metadata !395, metadata !DIExpression()) #8, !dbg !412
  %91 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !415
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %91) #8, !dbg !415, !noalias !380
  call void @llvm.dbg.declare(metadata [64 x i8]* %2, metadata !396, metadata !DIExpression()) #8, !dbg !416
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(64) %91, i8 0, i64 64, i1 false) #8, !dbg !416, !noalias !380
  %92 = getelementptr inbounds [11 x i8], [11 x i8]* %3, i64 0, i64 0
  br label %93, !dbg !417

93:                                               ; preds = %118, %87
  %94 = phi i64 [ 0, %87 ], [ %120, %118 ]
  %95 = phi i8 [ 0, %87 ], [ %119, %118 ]
  call void @llvm.dbg.value(metadata i64 %94, metadata !391, metadata !DIExpression()) #8, !dbg !412
  call void @llvm.dbg.value(metadata i8 %95, metadata !394, metadata !DIExpression()) #8, !dbg !412
  %96 = getelementptr i8, i8* %80, i64 %94, !dbg !418
  %97 = getelementptr i8, i8* %96, i64 1, !dbg !420
  %98 = icmp ugt i8* %97, %10, !dbg !421
  br i1 %98, label %135, label %99, !dbg !422

99:                                               ; preds = %93
  %100 = sext i8 %95 to i64, !dbg !423
  %101 = icmp eq i64 %94, %100, !dbg !424
  %102 = load i8, i8* %96, align 1, !dbg !425, !tbaa !349, !noalias !380
  br i1 %101, label %103, label %116, !dbg !426

103:                                              ; preds = %99
  call void @llvm.dbg.value(metadata i8 %95, metadata !395, metadata !DIExpression()) #8, !dbg !412
  call void @llvm.dbg.value(metadata i8 %102, metadata !394, metadata !DIExpression()) #8, !dbg !412
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %92) #8, !dbg !427, !noalias !380
  call void @llvm.dbg.declare(metadata [11 x i8]* %3, metadata !397, metadata !DIExpression()) #8, !dbg !427
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(11) %92, i8* noundef nonnull align 1 dereferenceable(11) getelementptr inbounds ([11 x i8], [11 x i8]* @__const.get_qname_lpm_key.____fmt, i64 0, i64 0), i64 11, i1 false) #8, !dbg !427, !noalias !380
  %104 = sext i8 %102 to i32, !dbg !427
  %105 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %92, i32 11, i32 %104) #8, !dbg !427, !noalias !380
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %92) #8, !dbg !428, !noalias !380
  %106 = icmp eq i8 %102, 0, !dbg !429
  br i1 %106, label %107, label %110, !dbg !431

107:                                              ; preds = %103
  %108 = add nsw i64 %94, -1, !dbg !432
  call void @llvm.dbg.value(metadata i64 %108, metadata !391, metadata !DIExpression()) #8, !dbg !412
  %109 = icmp eq i64 %108, 0, !dbg !433
  br i1 %109, label %136, label %122, !dbg !434

110:                                              ; preds = %103
  %111 = icmp sgt i8 %102, 63, !dbg !435
  br i1 %111, label %135, label %112, !dbg !437

112:                                              ; preds = %110
  %113 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 %94, !dbg !438
  store i8 46, i8* %113, align 1, !dbg !439, !tbaa !349, !noalias !380
  %114 = add i8 %95, 1, !dbg !440
  %115 = add i8 %114, %102, !dbg !441
  call void @llvm.dbg.value(metadata i8 %115, metadata !394, metadata !DIExpression()) #8, !dbg !412
  br label %118, !dbg !442

116:                                              ; preds = %99
  %117 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 %94, !dbg !443
  store i8 %102, i8* %117, align 1, !dbg !445, !tbaa !349, !noalias !380
  br label %118

118:                                              ; preds = %116, %112
  %119 = phi i8 [ %115, %112 ], [ %95, %116 ], !dbg !412
  call void @llvm.dbg.value(metadata i8 %119, metadata !394, metadata !DIExpression()) #8, !dbg !412
  %120 = add nuw nsw i64 %94, 1, !dbg !446
  call void @llvm.dbg.value(metadata i64 %120, metadata !391, metadata !DIExpression()) #8, !dbg !412
  %121 = icmp eq i64 %120, 64, !dbg !447
  br i1 %121, label %135, label %93, !dbg !417, !llvm.loop !448

122:                                              ; preds = %107, %129
  %123 = phi i64 [ %133, %129 ], [ %108, %107 ]
  %124 = phi i64 [ %123, %129 ], [ %94, %107 ]
  %125 = sub nsw i64 %94, %124, !dbg !451
  call void @llvm.dbg.value(metadata i64 %125, metadata !404, metadata !DIExpression()) #8, !dbg !452
  %126 = icmp ugt i64 %125, 63, !dbg !453
  br i1 %126, label %136, label %127, !dbg !455

127:                                              ; preds = %122
  %128 = icmp ugt i64 %123, 63
  br i1 %128, label %135, label %129, !dbg !456

129:                                              ; preds = %127
  %130 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 %123, !dbg !458
  %131 = load i8, i8* %130, align 1, !dbg !458, !tbaa !349, !noalias !380
  %132 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %5, i64 0, i32 1, i64 %125, !dbg !459
  store i8 %131, i8* %132, align 1, !dbg !460, !tbaa !349, !alias.scope !380
  call void @llvm.dbg.value(metadata i64 %123, metadata !391, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #8, !dbg !412
  %133 = add nsw i64 %123, -1, !dbg !432
  call void @llvm.dbg.value(metadata i64 %133, metadata !391, metadata !DIExpression()) #8, !dbg !412
  %134 = icmp eq i64 %133, 0, !dbg !433
  br i1 %134, label %136, label %122, !dbg !434

135:                                              ; preds = %93, %110, %118, %127
  call void @llvm.dbg.label(metadata !411) #8, !dbg !461
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %91) #8, !dbg !462, !noalias !380
  br label %149, !dbg !463

136:                                              ; preds = %122, %129, %107
  %137 = getelementptr inbounds [15 x i8], [15 x i8]* %4, i64 0, i64 0, !dbg !464
  call void @llvm.lifetime.start.p0i8(i64 15, i8* nonnull %137) #8, !dbg !464, !noalias !380
  call void @llvm.dbg.declare(metadata [15 x i8]* %4, metadata !406, metadata !DIExpression()) #8, !dbg !464
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(15) %137, i8* noundef nonnull align 1 dereferenceable(15) getelementptr inbounds ([15 x i8], [15 x i8]* @__const.get_qname_lpm_key.____fmt.1, i64 0, i64 0), i64 15, i1 false) #8, !dbg !464, !noalias !380
  %138 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %137, i32 15, i8* nonnull %89) #8, !dbg !464
  call void @llvm.lifetime.end.p0i8(i64 15, i8* nonnull %137) #8, !dbg !465, !noalias !380
  %139 = load i32, i32* %90, align 4, !dbg !466, !tbaa !468
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %91) #8, !dbg !462, !noalias !380
  %140 = icmp eq i32 %139, 0, !dbg !470
  br i1 %140, label %149, label %141, !dbg !463

141:                                              ; preds = %136
  call void @llvm.dbg.value(metadata i32* null, metadata !215, metadata !DIExpression()), !dbg !471
  %142 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon* @main_map to i8*), i8* nonnull %88) #8, !dbg !472
  call void @llvm.dbg.value(metadata i8* %142, metadata !215, metadata !DIExpression()), !dbg !471
  %143 = icmp eq i8* %142, null, !dbg !473
  br i1 %143, label %149, label %144, !dbg !474

144:                                              ; preds = %141
  %145 = bitcast i8* %142 to i32*, !dbg !472
  call void @llvm.dbg.value(metadata i32* %145, metadata !215, metadata !DIExpression()), !dbg !471
  %146 = getelementptr inbounds [19 x i8], [19 x i8]* %6, i64 0, i64 0, !dbg !475
  call void @llvm.lifetime.start.p0i8(i64 19, i8* nonnull %146) #8, !dbg !475
  call void @llvm.dbg.declare(metadata [19 x i8]* %6, metadata !216, metadata !DIExpression()), !dbg !475
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(19) %146, i8* noundef nonnull align 1 dereferenceable(19) getelementptr inbounds ([19 x i8], [19 x i8]* @__const.xdp_patch_ports_func.____fmt, i64 0, i64 0), i64 19, i1 false), !dbg !475
  %147 = load i32, i32* %145, align 4, !dbg !475, !tbaa !476
  %148 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %146, i32 19, i32 %147) #8, !dbg !475
  call void @llvm.lifetime.end.p0i8(i64 19, i8* nonnull %146) #8, !dbg !477
  call void @llvm.dbg.value(metadata i32 1, metadata !126, metadata !DIExpression()), !dbg !224
  br label %149, !dbg !478

149:                                              ; preds = %135, %144, %141, %136
  %150 = phi i32 [ 0, %136 ], [ 1, %144 ], [ 2, %141 ], [ 0, %135 ], !dbg !471
  call void @llvm.dbg.value(metadata i32 %150, metadata !126, metadata !DIExpression()), !dbg !224
  call void @llvm.lifetime.end.p0i8(i64 68, i8* nonnull %88) #8, !dbg !479
  br label %151

151:                                              ; preds = %63, %59, %54, %51, %1, %68, %48, %149, %82, %74
  %152 = phi i32 [ 2, %68 ], [ 2, %48 ], [ 2, %74 ], [ %150, %149 ], [ 2, %82 ], [ 0, %1 ], [ 2, %51 ], [ 2, %54 ], [ 2, %59 ], [ 2, %63 ]
  ret i32 %152, !dbg !480
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #5

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #6

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.experimental.noalias.scope.decl(metadata) #7

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nounwind readnone }
attributes #7 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!108, !109, !110, !111}
!llvm.ident = !{!112}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "main_map", scope: !2, file: !3, line: 33, type: !80, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Alpine clang version 13.0.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !45, globals: !57, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_pass_kern.c", directory: "/root/qname_intercepter/qname_filter")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/root/qname_intercepter/qname_filter")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !15, line: 28, baseType: !7, size: 32, elements: !16)
!15 = !DIFile(filename: "/usr/include/linux/in.h", directory: "")
!16 = !{!17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44}
!17 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!18 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!19 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!20 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!21 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!22 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!23 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!24 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!25 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!26 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!27 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!28 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!29 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!30 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!31 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!32 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!33 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!34 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!35 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!36 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!37 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!38 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!39 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!40 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!41 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!42 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!43 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!44 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!45 = !{!46, !47, !48, !51, !54, !55}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!47 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !49, line: 24, baseType: !50)
!49 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!50 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !49, line: 21, baseType: !53)
!53 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !{!58, !0, !63, !71}
!58 = !DIGlobalVariableExpression(var: !59, expr: !DIExpression())
!59 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 144, type: !60, isLocal: false, isDefinition: true)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 32, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 4)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression())
!64 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !65, line: 33, type: !66, isLocal: true, isDefinition: true)
!65 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/root/qname_intercepter/qname_filter")
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DISubroutineType(types: !68)
!68 = !{!46, !46, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !65, line: 152, type: !73, isLocal: true, isDefinition: true)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !77, !79, null}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !56)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !49, line: 27, baseType: !7)
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 27, size: 320, elements: !81)
!81 = !{!82, !87, !96, !98, !103}
!82 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !80, file: !3, line: 28, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 352, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 11)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !80, file: !3, line: 29, baseType: !88, size: 64, offset: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "qname_lpm_key", file: !3, line: 22, size: 544, elements: !90)
!90 = !{!91, !92}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !89, file: !3, line: 23, baseType: !79, size: 32)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "rev_suf", scope: !89, file: !3, line: 24, baseType: !93, size: 512, offset: 32)
!93 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 512, elements: !94)
!94 = !{!95}
!95 = !DISubrange(count: 64)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !80, file: !3, line: 30, baseType: !97, size: 64, offset: 128)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !80, file: !3, line: 31, baseType: !99, size: 64, offset: 192)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 32, elements: !101)
!101 = !{!102}
!102 = !DISubrange(count: 1)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !80, file: !3, line: 32, baseType: !104, size: 64, offset: 256)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 8160, elements: !106)
!106 = !{!107}
!107 = !DISubrange(count: 255)
!108 = !{i32 7, !"Dwarf Version", i32 4}
!109 = !{i32 2, !"Debug Info Version", i32 3}
!110 = !{i32 1, !"wchar_size", i32 4}
!111 = !{i32 7, !"frame-pointer", i32 2}
!112 = !{!"Alpine clang version 13.0.1"}
!113 = distinct !DISubprogram(name: "xdp_patch_ports_func", scope: !3, file: !3, line: 83, type: !114, scopeLine: 84, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !124)
!114 = !DISubroutineType(types: !115)
!115 = !{!76, !116}
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !118)
!118 = !{!119, !120, !121, !122, !123}
!119 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !117, file: !6, line: 2857, baseType: !79, size: 32)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !117, file: !6, line: 2858, baseType: !79, size: 32, offset: 32)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !117, file: !6, line: 2859, baseType: !79, size: 32, offset: 64)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !117, file: !6, line: 2861, baseType: !79, size: 32, offset: 96)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !117, file: !6, line: 2862, baseType: !79, size: 32, offset: 128)
!124 = !{!125, !126, !127, !128, !129, !142, !160, !192, !201, !202, !203, !208, !211, !212, !215, !216, !223}
!125 = !DILocalVariable(name: "ctx", arg: 1, scope: !113, file: !3, line: 83, type: !116)
!126 = !DILocalVariable(name: "action", scope: !113, file: !3, line: 85, type: !76)
!127 = !DILocalVariable(name: "eth_type", scope: !113, file: !3, line: 86, type: !76)
!128 = !DILocalVariable(name: "ip_type", scope: !113, file: !3, line: 86, type: !76)
!129 = !DILocalVariable(name: "eth", scope: !113, file: !3, line: 87, type: !130)
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!131 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !132, line: 169, size: 112, elements: !133)
!132 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!133 = !{!134, !138, !139}
!134 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !131, file: !132, line: 170, baseType: !135, size: 48)
!135 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 48, elements: !136)
!136 = !{!137}
!137 = !DISubrange(count: 6)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !131, file: !132, line: 171, baseType: !135, size: 48, offset: 48)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !131, file: !132, line: 172, baseType: !140, size: 16, offset: 96)
!140 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !141, line: 25, baseType: !48)
!141 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!142 = !DILocalVariable(name: "iphdr", scope: !113, file: !3, line: 88, type: !143)
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !144, size: 64)
!144 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !145, line: 86, size: 160, elements: !146)
!145 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!146 = !{!147, !148, !149, !150, !151, !152, !153, !154, !155, !157, !159}
!147 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !144, file: !145, line: 88, baseType: !52, size: 4, flags: DIFlagBitField, extraData: i64 0)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !144, file: !145, line: 89, baseType: !52, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !144, file: !145, line: 96, baseType: !52, size: 8, offset: 8)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !144, file: !145, line: 97, baseType: !140, size: 16, offset: 16)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !144, file: !145, line: 98, baseType: !140, size: 16, offset: 32)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !144, file: !145, line: 99, baseType: !140, size: 16, offset: 48)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !144, file: !145, line: 100, baseType: !52, size: 8, offset: 64)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !144, file: !145, line: 101, baseType: !52, size: 8, offset: 72)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !144, file: !145, line: 102, baseType: !156, size: 16, offset: 80)
!156 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !141, line: 31, baseType: !48)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !144, file: !145, line: 103, baseType: !158, size: 32, offset: 96)
!158 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !141, line: 27, baseType: !79)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !144, file: !145, line: 104, baseType: !158, size: 32, offset: 128)
!160 = !DILocalVariable(name: "ipv6hdr", scope: !113, file: !3, line: 89, type: !161)
!161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64)
!162 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !163, line: 117, size: 320, elements: !164)
!163 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "")
!164 = !{!165, !166, !167, !171, !172, !173, !174, !191}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !162, file: !163, line: 119, baseType: !52, size: 4, flags: DIFlagBitField, extraData: i64 0)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !162, file: !163, line: 120, baseType: !52, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !162, file: !163, line: 127, baseType: !168, size: 24, offset: 8)
!168 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 24, elements: !169)
!169 = !{!170}
!170 = !DISubrange(count: 3)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !162, file: !163, line: 129, baseType: !140, size: 16, offset: 32)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !162, file: !163, line: 130, baseType: !52, size: 8, offset: 48)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !162, file: !163, line: 131, baseType: !52, size: 8, offset: 56)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !162, file: !163, line: 133, baseType: !175, size: 128, offset: 64)
!175 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !176, line: 33, size: 128, elements: !177)
!176 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "")
!177 = !{!178}
!178 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !175, file: !176, line: 40, baseType: !179, size: 128)
!179 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !175, file: !176, line: 34, size: 128, elements: !180)
!180 = !{!181, !185, !189}
!181 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !179, file: !176, line: 35, baseType: !182, size: 128)
!182 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 128, elements: !183)
!183 = !{!184}
!184 = !DISubrange(count: 16)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !179, file: !176, line: 37, baseType: !186, size: 128)
!186 = !DICompositeType(tag: DW_TAG_array_type, baseType: !140, size: 128, elements: !187)
!187 = !{!188}
!188 = !DISubrange(count: 8)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !179, file: !176, line: 38, baseType: !190, size: 128)
!190 = !DICompositeType(tag: DW_TAG_array_type, baseType: !158, size: 128, elements: !61)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !162, file: !163, line: 134, baseType: !175, size: 128, offset: 192)
!192 = !DILocalVariable(name: "udphdr", scope: !113, file: !3, line: 90, type: !193)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !194, size: 64)
!194 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !195, line: 23, size: 64, elements: !196)
!195 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "")
!196 = !{!197, !198, !199, !200}
!197 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !194, file: !195, line: 24, baseType: !140, size: 16)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !194, file: !195, line: 25, baseType: !140, size: 16, offset: 16)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !194, file: !195, line: 26, baseType: !140, size: 16, offset: 32)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !194, file: !195, line: 27, baseType: !156, size: 16, offset: 48)
!201 = !DILocalVariable(name: "data_end", scope: !113, file: !3, line: 91, type: !46)
!202 = !DILocalVariable(name: "data", scope: !113, file: !3, line: 92, type: !46)
!203 = !DILocalVariable(name: "nh", scope: !113, file: !3, line: 93, type: !204)
!204 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !205, line: 33, size: 64, elements: !206)
!205 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/root/qname_intercepter/qname_filter")
!206 = !{!207}
!207 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !204, file: !205, line: 34, baseType: !46, size: 64)
!208 = !DILocalVariable(name: "udppld", scope: !209, file: !3, line: 110, type: !79)
!209 = distinct !DILexicalBlock(scope: !210, file: !3, line: 109, column: 30)
!210 = distinct !DILexicalBlock(scope: !113, file: !3, line: 109, column: 6)
!211 = !DILocalVariable(name: "qrn", scope: !209, file: !3, line: 119, type: !48)
!212 = !DILocalVariable(name: "qlk", scope: !213, file: !3, line: 121, type: !89)
!213 = distinct !DILexicalBlock(scope: !214, file: !3, line: 120, column: 14)
!214 = distinct !DILexicalBlock(scope: !209, file: !3, line: 120, column: 6)
!215 = !DILocalVariable(name: "tval", scope: !213, file: !3, line: 126, type: !97)
!216 = !DILocalVariable(name: "____fmt", scope: !217, file: !3, line: 131, type: !220)
!217 = distinct !DILexicalBlock(scope: !218, file: !3, line: 131, column: 5)
!218 = distinct !DILexicalBlock(scope: !219, file: !3, line: 130, column: 9)
!219 = distinct !DILexicalBlock(scope: !213, file: !3, line: 127, column: 7)
!220 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 152, elements: !221)
!221 = !{!222}
!222 = !DISubrange(count: 19)
!223 = !DILabel(scope: !113, name: "out", file: !3, line: 140)
!224 = !DILocation(line: 0, scope: !113)
!225 = !DILocation(line: 91, column: 38, scope: !113)
!226 = !{!227, !228, i64 4}
!227 = !{!"xdp_md", !228, i64 0, !228, i64 4, !228, i64 8, !228, i64 12, !228, i64 16}
!228 = !{!"int", !229, i64 0}
!229 = !{!"omnipotent char", !230, i64 0}
!230 = !{!"Simple C/C++ TBAA"}
!231 = !DILocation(line: 91, column: 27, scope: !113)
!232 = !DILocation(line: 91, column: 19, scope: !113)
!233 = !DILocation(line: 92, column: 34, scope: !113)
!234 = !{!227, !228, i64 0}
!235 = !DILocation(line: 92, column: 23, scope: !113)
!236 = !DILocation(line: 92, column: 15, scope: !113)
!237 = !DILocalVariable(name: "nh", arg: 1, scope: !238, file: !205, line: 124, type: !241)
!238 = distinct !DISubprogram(name: "parse_ethhdr", scope: !205, file: !205, line: 124, type: !239, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !243)
!239 = !DISubroutineType(types: !240)
!240 = !{!76, !241, !46, !242}
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !204, size: 64)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!243 = !{!237, !244, !245}
!244 = !DILocalVariable(name: "data_end", arg: 2, scope: !238, file: !205, line: 125, type: !46)
!245 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !238, file: !205, line: 126, type: !242)
!246 = !DILocation(line: 0, scope: !238, inlinedAt: !247)
!247 = distinct !DILocation(line: 95, column: 13, scope: !113)
!248 = !DILocalVariable(name: "nh", arg: 1, scope: !249, file: !205, line: 79, type: !241)
!249 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !205, file: !205, line: 79, type: !250, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !259)
!250 = !DISubroutineType(types: !251)
!251 = !{!76, !241, !46, !242, !252}
!252 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !253, size: 64)
!253 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !205, line: 64, size: 32, elements: !254)
!254 = !{!255}
!255 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !253, file: !205, line: 65, baseType: !256, size: 32)
!256 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 32, elements: !257)
!257 = !{!258}
!258 = !DISubrange(count: 2)
!259 = !{!248, !260, !261, !262, !263, !264, !265, !271, !272}
!260 = !DILocalVariable(name: "data_end", arg: 2, scope: !249, file: !205, line: 80, type: !46)
!261 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !249, file: !205, line: 81, type: !242)
!262 = !DILocalVariable(name: "vlans", arg: 4, scope: !249, file: !205, line: 82, type: !252)
!263 = !DILocalVariable(name: "eth", scope: !249, file: !205, line: 84, type: !130)
!264 = !DILocalVariable(name: "hdrsize", scope: !249, file: !205, line: 85, type: !76)
!265 = !DILocalVariable(name: "vlh", scope: !249, file: !205, line: 86, type: !266)
!266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !267, size: 64)
!267 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !205, line: 42, size: 32, elements: !268)
!268 = !{!269, !270}
!269 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !267, file: !205, line: 43, baseType: !140, size: 16)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !267, file: !205, line: 44, baseType: !140, size: 16, offset: 16)
!271 = !DILocalVariable(name: "h_proto", scope: !249, file: !205, line: 87, type: !48)
!272 = !DILocalVariable(name: "i", scope: !249, file: !205, line: 88, type: !76)
!273 = !DILocation(line: 0, scope: !249, inlinedAt: !274)
!274 = distinct !DILocation(line: 129, column: 9, scope: !238, inlinedAt: !247)
!275 = !DILocation(line: 93, column: 14, scope: !276, inlinedAt: !274)
!276 = distinct !DILexicalBlock(scope: !249, file: !205, line: 93, column: 6)
!277 = !DILocation(line: 93, column: 24, scope: !276, inlinedAt: !274)
!278 = !DILocation(line: 93, column: 6, scope: !249, inlinedAt: !274)
!279 = !DILocation(line: 99, column: 17, scope: !249, inlinedAt: !274)
!280 = !{!281, !281, i64 0}
!281 = !{!"short", !229, i64 0}
!282 = !DILocalVariable(name: "h_proto", arg: 1, scope: !283, file: !205, line: 68, type: !48)
!283 = distinct !DISubprogram(name: "proto_is_vlan", scope: !205, file: !205, line: 68, type: !284, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !286)
!284 = !DISubroutineType(types: !285)
!285 = !{!76, !48}
!286 = !{!282}
!287 = !DILocation(line: 0, scope: !283, inlinedAt: !288)
!288 = distinct !DILocation(line: 106, column: 8, scope: !289, inlinedAt: !274)
!289 = distinct !DILexicalBlock(scope: !290, file: !205, line: 106, column: 7)
!290 = distinct !DILexicalBlock(scope: !291, file: !205, line: 105, column: 39)
!291 = distinct !DILexicalBlock(scope: !292, file: !205, line: 105, column: 2)
!292 = distinct !DILexicalBlock(scope: !249, file: !205, line: 105, column: 2)
!293 = !DILocation(line: 70, column: 20, scope: !283, inlinedAt: !288)
!294 = !DILocation(line: 70, column: 46, scope: !283, inlinedAt: !288)
!295 = !DILocation(line: 106, column: 7, scope: !290, inlinedAt: !274)
!296 = !DILocation(line: 109, column: 11, scope: !297, inlinedAt: !274)
!297 = distinct !DILexicalBlock(scope: !290, file: !205, line: 109, column: 7)
!298 = !DILocation(line: 109, column: 15, scope: !297, inlinedAt: !274)
!299 = !DILocation(line: 109, column: 7, scope: !290, inlinedAt: !274)
!300 = !DILocation(line: 112, column: 18, scope: !290, inlinedAt: !274)
!301 = !DILocation(line: 101, column: 6, scope: !113)
!302 = !DILocalVariable(name: "nh", arg: 1, scope: !303, file: !205, line: 151, type: !241)
!303 = distinct !DISubprogram(name: "parse_iphdr", scope: !205, file: !205, line: 151, type: !304, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !307)
!304 = !DISubroutineType(types: !305)
!305 = !{!76, !241, !46, !306}
!306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!307 = !{!302, !308, !309, !310, !311}
!308 = !DILocalVariable(name: "data_end", arg: 2, scope: !303, file: !205, line: 152, type: !46)
!309 = !DILocalVariable(name: "iphdr", arg: 3, scope: !303, file: !205, line: 153, type: !306)
!310 = !DILocalVariable(name: "iph", scope: !303, file: !205, line: 155, type: !143)
!311 = !DILocalVariable(name: "hdrsize", scope: !303, file: !205, line: 156, type: !76)
!312 = !DILocation(line: 0, scope: !303, inlinedAt: !313)
!313 = distinct !DILocation(line: 102, column: 13, scope: !314)
!314 = distinct !DILexicalBlock(scope: !315, file: !3, line: 101, column: 39)
!315 = distinct !DILexicalBlock(scope: !113, file: !3, line: 101, column: 6)
!316 = !DILocation(line: 158, column: 10, scope: !317, inlinedAt: !313)
!317 = distinct !DILexicalBlock(scope: !303, file: !205, line: 158, column: 6)
!318 = !DILocation(line: 158, column: 14, scope: !317, inlinedAt: !313)
!319 = !DILocation(line: 158, column: 6, scope: !303, inlinedAt: !313)
!320 = !DILocation(line: 161, column: 17, scope: !303, inlinedAt: !313)
!321 = !DILocation(line: 161, column: 21, scope: !303, inlinedAt: !313)
!322 = !DILocation(line: 163, column: 13, scope: !323, inlinedAt: !313)
!323 = distinct !DILexicalBlock(scope: !303, file: !205, line: 163, column: 5)
!324 = !DILocation(line: 163, column: 5, scope: !303, inlinedAt: !313)
!325 = !DILocation(line: 167, column: 14, scope: !326, inlinedAt: !313)
!326 = distinct !DILexicalBlock(scope: !303, file: !205, line: 167, column: 6)
!327 = !DILocation(line: 167, column: 24, scope: !326, inlinedAt: !313)
!328 = !DILocation(line: 167, column: 6, scope: !303, inlinedAt: !313)
!329 = !DILocalVariable(name: "nh", arg: 1, scope: !330, file: !205, line: 132, type: !241)
!330 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !205, file: !205, line: 132, type: !331, scopeLine: 135, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !334)
!331 = !DISubroutineType(types: !332)
!332 = !{!76, !241, !46, !333}
!333 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 64)
!334 = !{!329, !335, !336, !337}
!335 = !DILocalVariable(name: "data_end", arg: 2, scope: !330, file: !205, line: 133, type: !46)
!336 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !330, file: !205, line: 134, type: !333)
!337 = !DILocalVariable(name: "ip6h", scope: !330, file: !205, line: 136, type: !161)
!338 = !DILocation(line: 0, scope: !330, inlinedAt: !339)
!339 = distinct !DILocation(line: 104, column: 13, scope: !340)
!340 = distinct !DILexicalBlock(scope: !341, file: !3, line: 103, column: 48)
!341 = distinct !DILexicalBlock(scope: !315, file: !3, line: 103, column: 13)
!342 = !DILocation(line: 142, column: 11, scope: !343, inlinedAt: !339)
!343 = distinct !DILexicalBlock(scope: !330, file: !205, line: 142, column: 6)
!344 = !DILocation(line: 142, column: 17, scope: !343, inlinedAt: !339)
!345 = !DILocation(line: 142, column: 15, scope: !343, inlinedAt: !339)
!346 = !DILocation(line: 142, column: 6, scope: !330, inlinedAt: !339)
!347 = !DILocation(line: 93, column: 25, scope: !113)
!348 = !DILocation(line: 0, scope: !315)
!349 = !{!229, !229, i64 0}
!350 = !DILocation(line: 109, column: 14, scope: !210)
!351 = !DILocation(line: 109, column: 6, scope: !113)
!352 = !DILocalVariable(name: "nh", arg: 1, scope: !353, file: !205, line: 224, type: !241)
!353 = distinct !DISubprogram(name: "parse_udphdr", scope: !205, file: !205, line: 224, type: !354, scopeLine: 227, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !357)
!354 = !DISubroutineType(types: !355)
!355 = !{!76, !241, !46, !356}
!356 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!357 = !{!352, !358, !359, !360, !361}
!358 = !DILocalVariable(name: "data_end", arg: 2, scope: !353, file: !205, line: 225, type: !46)
!359 = !DILocalVariable(name: "udphdr", arg: 3, scope: !353, file: !205, line: 226, type: !356)
!360 = !DILocalVariable(name: "len", scope: !353, file: !205, line: 228, type: !76)
!361 = !DILocalVariable(name: "h", scope: !353, file: !205, line: 229, type: !193)
!362 = !DILocation(line: 0, scope: !353, inlinedAt: !363)
!363 = distinct !DILocation(line: 110, column: 18, scope: !209)
!364 = !DILocation(line: 231, column: 8, scope: !365, inlinedAt: !363)
!365 = distinct !DILexicalBlock(scope: !353, file: !205, line: 231, column: 6)
!366 = !DILocation(line: 231, column: 14, scope: !365, inlinedAt: !363)
!367 = !DILocation(line: 231, column: 12, scope: !365, inlinedAt: !363)
!368 = !DILocation(line: 231, column: 6, scope: !353, inlinedAt: !363)
!369 = !DILocation(line: 0, scope: !209)
!370 = !DILocation(line: 115, column: 22, scope: !371)
!371 = distinct !DILexicalBlock(scope: !209, file: !3, line: 115, column: 6)
!372 = !DILocation(line: 115, column: 27, scope: !371)
!373 = !DILocation(line: 115, column: 6, scope: !209)
!374 = !DILocation(line: 119, column: 35, scope: !209)
!375 = !DILocation(line: 119, column: 15, scope: !209)
!376 = !DILocation(line: 120, column: 10, scope: !214)
!377 = !DILocation(line: 120, column: 6, scope: !209)
!378 = !DILocation(line: 121, column: 4, scope: !213)
!379 = !DILocation(line: 121, column: 25, scope: !213)
!380 = !{!381}
!381 = distinct !{!381, !382, !"get_qname_lpm_key: argument 0"}
!382 = distinct !{!382, !"get_qname_lpm_key"}
!383 = !DILocation(line: 121, column: 31, scope: !213)
!384 = !DILocalVariable(name: "base", arg: 1, scope: !385, file: !3, line: 35, type: !77)
!385 = distinct !DISubprogram(name: "get_qname_lpm_key", scope: !3, file: !3, line: 35, type: !386, scopeLine: 35, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !388)
!386 = !DISubroutineType(types: !387)
!387 = !{!89, !77, !46}
!388 = !{!384, !389, !390, !391, !394, !395, !396, !397, !403, !404, !406, !411}
!389 = !DILocalVariable(name: "data_end", arg: 2, scope: !385, file: !3, line: 35, type: !46)
!390 = !DILocalVariable(name: "qlk", scope: !385, file: !3, line: 36, type: !89)
!391 = !DILocalVariable(name: "qend", scope: !385, file: !3, line: 40, type: !392)
!392 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !49, line: 31, baseType: !393)
!393 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!394 = !DILocalVariable(name: "tmp", scope: !385, file: !3, line: 41, type: !56)
!395 = !DILocalVariable(name: "sv", scope: !385, file: !3, line: 41, type: !56)
!396 = !DILocalVariable(name: "qnbuf", scope: !385, file: !3, line: 42, type: !93)
!397 = !DILocalVariable(name: "____fmt", scope: !398, file: !3, line: 49, type: !402)
!398 = distinct !DILexicalBlock(scope: !399, file: !3, line: 49, column: 4)
!399 = distinct !DILexicalBlock(scope: !400, file: !3, line: 46, column: 18)
!400 = distinct !DILexicalBlock(scope: !401, file: !3, line: 46, column: 6)
!401 = distinct !DILexicalBlock(scope: !385, file: !3, line: 44, column: 23)
!402 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 88, elements: !85)
!403 = !DILocalVariable(name: "qlen", scope: !385, file: !3, line: 61, type: !392)
!404 = !DILocalVariable(name: "i", scope: !405, file: !3, line: 64, type: !392)
!405 = distinct !DILexicalBlock(scope: !385, file: !3, line: 63, column: 17)
!406 = !DILocalVariable(name: "____fmt", scope: !407, file: !3, line: 71, type: !408)
!407 = distinct !DILexicalBlock(scope: !385, file: !3, line: 71, column: 2)
!408 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 120, elements: !409)
!409 = !{!410}
!410 = !DISubrange(count: 15)
!411 = !DILabel(scope: !385, name: "fail", file: !3, line: 74)
!412 = !DILocation(line: 0, scope: !385, inlinedAt: !413)
!413 = distinct !DILocation(line: 121, column: 31, scope: !213)
!414 = !DILocation(line: 36, column: 23, scope: !385, inlinedAt: !413)
!415 = !DILocation(line: 42, column: 2, scope: !385, inlinedAt: !413)
!416 = !DILocation(line: 42, column: 7, scope: !385, inlinedAt: !413)
!417 = !DILocation(line: 44, column: 2, scope: !385, inlinedAt: !413)
!418 = !DILocation(line: 45, column: 17, scope: !419, inlinedAt: !413)
!419 = distinct !DILexicalBlock(scope: !401, file: !3, line: 45, column: 6)
!420 = !DILocation(line: 45, column: 22, scope: !419, inlinedAt: !413)
!421 = !DILocation(line: 45, column: 25, scope: !419, inlinedAt: !413)
!422 = !DILocation(line: 45, column: 6, scope: !401, inlinedAt: !413)
!423 = !DILocation(line: 46, column: 14, scope: !400, inlinedAt: !413)
!424 = !DILocation(line: 46, column: 11, scope: !400, inlinedAt: !413)
!425 = !DILocation(line: 0, scope: !400, inlinedAt: !413)
!426 = !DILocation(line: 46, column: 6, scope: !401, inlinedAt: !413)
!427 = !DILocation(line: 49, column: 4, scope: !398, inlinedAt: !413)
!428 = !DILocation(line: 49, column: 4, scope: !399, inlinedAt: !413)
!429 = !DILocation(line: 50, column: 11, scope: !430, inlinedAt: !413)
!430 = distinct !DILexicalBlock(scope: !399, file: !3, line: 50, column: 7)
!431 = !DILocation(line: 50, column: 7, scope: !399, inlinedAt: !413)
!432 = !DILocation(line: 62, column: 6, scope: !385, inlinedAt: !413)
!433 = !DILocation(line: 63, column: 13, scope: !385, inlinedAt: !413)
!434 = !DILocation(line: 63, column: 2, scope: !385, inlinedAt: !413)
!435 = !DILocation(line: 51, column: 11, scope: !436, inlinedAt: !413)
!436 = distinct !DILexicalBlock(scope: !399, file: !3, line: 51, column: 7)
!437 = !DILocation(line: 51, column: 7, scope: !399, inlinedAt: !413)
!438 = !DILocation(line: 52, column: 4, scope: !399, inlinedAt: !413)
!439 = !DILocation(line: 52, column: 16, scope: !399, inlinedAt: !413)
!440 = !DILocation(line: 53, column: 12, scope: !399, inlinedAt: !413)
!441 = !DILocation(line: 53, column: 16, scope: !399, inlinedAt: !413)
!442 = !DILocation(line: 54, column: 3, scope: !399, inlinedAt: !413)
!443 = !DILocation(line: 55, column: 4, scope: !444, inlinedAt: !413)
!444 = distinct !DILexicalBlock(scope: !400, file: !3, line: 54, column: 8)
!445 = !DILocation(line: 55, column: 16, scope: !444, inlinedAt: !413)
!446 = !DILocation(line: 57, column: 7, scope: !401, inlinedAt: !413)
!447 = !DILocation(line: 44, column: 12, scope: !385, inlinedAt: !413)
!448 = distinct !{!448, !417, !449, !450}
!449 = !DILocation(line: 58, column: 2, scope: !385, inlinedAt: !413)
!450 = !{!"llvm.loop.mustprogress"}
!451 = !DILocation(line: 64, column: 17, scope: !405, inlinedAt: !413)
!452 = !DILocation(line: 0, scope: !405, inlinedAt: !413)
!453 = !DILocation(line: 65, column: 7, scope: !454, inlinedAt: !413)
!454 = distinct !DILexicalBlock(scope: !405, file: !3, line: 65, column: 6)
!455 = !DILocation(line: 65, column: 6, scope: !405, inlinedAt: !413)
!456 = !DILocation(line: 66, column: 13, scope: !457, inlinedAt: !413)
!457 = distinct !DILexicalBlock(scope: !405, file: !3, line: 66, column: 6)
!458 = !DILocation(line: 67, column: 20, scope: !405, inlinedAt: !413)
!459 = !DILocation(line: 67, column: 3, scope: !405, inlinedAt: !413)
!460 = !DILocation(line: 67, column: 18, scope: !405, inlinedAt: !413)
!461 = !DILocation(line: 74, column: 1, scope: !385, inlinedAt: !413)
!462 = !DILocation(line: 77, column: 1, scope: !385, inlinedAt: !413)
!463 = !DILocation(line: 122, column: 7, scope: !213)
!464 = !DILocation(line: 71, column: 2, scope: !407, inlinedAt: !413)
!465 = !DILocation(line: 71, column: 2, scope: !385, inlinedAt: !413)
!466 = !DILocation(line: 122, column: 11, scope: !467)
!467 = distinct !DILexicalBlock(scope: !213, file: !3, line: 122, column: 7)
!468 = !{!469, !228, i64 0}
!469 = !{!"qname_lpm_key", !228, i64 0, !229, i64 4}
!470 = !DILocation(line: 122, column: 21, scope: !467)
!471 = !DILocation(line: 0, scope: !213)
!472 = !DILocation(line: 127, column: 16, scope: !219)
!473 = !DILocation(line: 127, column: 14, scope: !219)
!474 = !DILocation(line: 127, column: 7, scope: !213)
!475 = !DILocation(line: 131, column: 5, scope: !217)
!476 = !{!228, !228, i64 0}
!477 = !DILocation(line: 131, column: 5, scope: !218)
!478 = !DILocation(line: 133, column: 5, scope: !218)
!479 = !DILocation(line: 135, column: 3, scope: !214)
!480 = !DILocation(line: 142, column: 1, scope: !113)
