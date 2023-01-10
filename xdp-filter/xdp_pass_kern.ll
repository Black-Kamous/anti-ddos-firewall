; ModuleID = 'xdp_pass_kern.c'
source_filename = "xdp_pass_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { [11 x i32]*, %struct.qname_lpm_key*, i32*, [1 x i32]*, [255 x i32]* }
%struct.qname_lpm_key = type { i32, [64 x i8] }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }
%struct.udphdr = type { i16, i16, i16, i16 }

@dns_block_suffixes = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !0
@__const.xdp_patch_ports_func.____fmt = private unnamed_addr constant [19 x i8] c"blocked prefix: %d\00", align 1
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !58
@__const.get_qname_lpm_key.____fmt = private unnamed_addr constant [11 x i8] c"dm len:%d\0A\00", align 1
@__const.get_qname_lpm_key.____fmt.1 = private unnamed_addr constant [15 x i8] c"rev suffix:%s\0A\00", align 1
@llvm.compiler.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon* @dns_block_suffixes to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_patch_ports_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_patch_ports_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_patch_ports" !dbg !113 {
  %2 = alloca [64 x i8], align 1
  %3 = alloca [11 x i8], align 1
  %4 = alloca [15 x i8], align 1
  %5 = alloca %struct.qname_lpm_key, align 4
  %6 = alloca [19 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !126, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata i32 2, metadata !127, metadata !DIExpression()), !dbg !225
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !226
  %8 = load i32, i32* %7, align 4, !dbg !226, !tbaa !227
  %9 = zext i32 %8 to i64, !dbg !232
  %10 = inttoptr i64 %9 to i8*, !dbg !233
  call void @llvm.dbg.value(metadata i8* %10, metadata !202, metadata !DIExpression()), !dbg !225
  %11 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !234
  %12 = load i32, i32* %11, align 4, !dbg !234, !tbaa !235
  %13 = zext i32 %12 to i64, !dbg !236
  %14 = inttoptr i64 %13 to i8*, !dbg !237
  call void @llvm.dbg.value(metadata i8* %14, metadata !203, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata i8* %14, metadata !204, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !130, metadata !DIExpression(DW_OP_deref)), !dbg !225
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !238, metadata !DIExpression()) #8, !dbg !247
  call void @llvm.dbg.value(metadata i8* %10, metadata !245, metadata !DIExpression()) #8, !dbg !247
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !246, metadata !DIExpression()) #8, !dbg !247
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !249, metadata !DIExpression()) #8, !dbg !274
  call void @llvm.dbg.value(metadata i8* %10, metadata !261, metadata !DIExpression()) #8, !dbg !274
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !262, metadata !DIExpression()) #8, !dbg !274
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !263, metadata !DIExpression()) #8, !dbg !274
  call void @llvm.dbg.value(metadata i8* %14, metadata !264, metadata !DIExpression()) #8, !dbg !274
  call void @llvm.dbg.value(metadata i32 14, metadata !265, metadata !DIExpression()) #8, !dbg !274
  %15 = getelementptr i8, i8* %14, i64 14, !dbg !276
  %16 = icmp ugt i8* %15, %10, !dbg !278
  br i1 %16, label %151, label %17, !dbg !279

17:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %14, metadata !264, metadata !DIExpression()) #8, !dbg !274
  call void @llvm.dbg.value(metadata i8* %15, metadata !204, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata i8* %15, metadata !266, metadata !DIExpression()) #8, !dbg !274
  %18 = getelementptr inbounds i8, i8* %14, i64 12, !dbg !280
  %19 = bitcast i8* %18 to i16*, !dbg !280
  call void @llvm.dbg.value(metadata i16 undef, metadata !272, metadata !DIExpression()) #8, !dbg !274
  call void @llvm.dbg.value(metadata i32 0, metadata !273, metadata !DIExpression()) #8, !dbg !274
  %20 = inttoptr i64 %9 to %struct.vlan_hdr*
  %21 = load i16, i16* %19, align 1, !dbg !274, !tbaa !281
  call void @llvm.dbg.value(metadata i16 %21, metadata !272, metadata !DIExpression()) #8, !dbg !274
  call void @llvm.dbg.value(metadata i16 %21, metadata !283, metadata !DIExpression()) #8, !dbg !288
  %22 = icmp eq i16 %21, 129, !dbg !294
  %23 = icmp ne i16 %21, -22392, !dbg !295
  %24 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %22) #8
  %25 = xor i1 %24, true, !dbg !295
  %26 = select i1 %25, i1 %23, i1 false, !dbg !295
  br i1 %26, label %48, label %27, !dbg !296

27:                                               ; preds = %17
  %28 = getelementptr i8, i8* %14, i64 18, !dbg !297
  %29 = bitcast i8* %28 to %struct.vlan_hdr*, !dbg !297
  %30 = icmp ugt %struct.vlan_hdr* %29, %20, !dbg !299
  br i1 %30, label %48, label %31, !dbg !300

31:                                               ; preds = %27
  call void @llvm.dbg.value(metadata i16 undef, metadata !272, metadata !DIExpression()) #8, !dbg !274
  %32 = getelementptr i8, i8* %14, i64 16, !dbg !301
  %33 = bitcast i8* %32 to i16*, !dbg !301
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %29, metadata !266, metadata !DIExpression()) #8, !dbg !274
  call void @llvm.dbg.value(metadata i32 1, metadata !273, metadata !DIExpression()) #8, !dbg !274
  %34 = load i16, i16* %33, align 1, !dbg !274, !tbaa !281
  call void @llvm.dbg.value(metadata i16 %34, metadata !272, metadata !DIExpression()) #8, !dbg !274
  call void @llvm.dbg.value(metadata i16 %34, metadata !283, metadata !DIExpression()) #8, !dbg !288
  %35 = icmp eq i16 %34, 129, !dbg !294
  %36 = icmp ne i16 %34, -22392, !dbg !295
  %37 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %35) #8
  %38 = xor i1 %37, true, !dbg !295
  %39 = select i1 %38, i1 %36, i1 false, !dbg !295
  br i1 %39, label %48, label %40, !dbg !296

40:                                               ; preds = %31
  %41 = getelementptr i8, i8* %14, i64 22, !dbg !297
  %42 = bitcast i8* %41 to %struct.vlan_hdr*, !dbg !297
  %43 = icmp ugt %struct.vlan_hdr* %42, %20, !dbg !299
  br i1 %43, label %48, label %44, !dbg !300

44:                                               ; preds = %40
  call void @llvm.dbg.value(metadata i16 undef, metadata !272, metadata !DIExpression()) #8, !dbg !274
  %45 = getelementptr i8, i8* %14, i64 20, !dbg !301
  %46 = bitcast i8* %45 to i16*, !dbg !301
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %42, metadata !266, metadata !DIExpression()) #8, !dbg !274
  call void @llvm.dbg.value(metadata i32 2, metadata !273, metadata !DIExpression()) #8, !dbg !274
  %47 = load i16, i16* %46, align 1, !dbg !274, !tbaa !281
  call void @llvm.dbg.value(metadata i16 %47, metadata !272, metadata !DIExpression()) #8, !dbg !274
  br label %48

48:                                               ; preds = %17, %27, %31, %40, %44
  %49 = phi i8* [ %15, %27 ], [ %15, %17 ], [ %28, %31 ], [ %28, %40 ], [ %41, %44 ], !dbg !274
  %50 = phi i16 [ %21, %27 ], [ %21, %17 ], [ %34, %31 ], [ %34, %40 ], [ %47, %44 ], !dbg !274
  call void @llvm.dbg.value(metadata i8* %49, metadata !204, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata i16 %50, metadata !128, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !225
  switch i16 %50, label %151 [
    i16 8, label %51
    i16 -8826, label %63
  ], !dbg !302

51:                                               ; preds = %48
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !143, metadata !DIExpression(DW_OP_deref)), !dbg !225
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !303, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i8* %10, metadata !309, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !310, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i8* %49, metadata !311, metadata !DIExpression()), !dbg !313
  %52 = getelementptr inbounds i8, i8* %49, i64 20, !dbg !317
  %53 = icmp ugt i8* %52, %10, !dbg !319
  br i1 %53, label %151, label %54, !dbg !320

54:                                               ; preds = %51
  %55 = load i8, i8* %49, align 4, !dbg !321
  %56 = shl i8 %55, 2, !dbg !322
  %57 = and i8 %56, 60, !dbg !322
  call void @llvm.dbg.value(metadata i8 %57, metadata !312, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !313
  %58 = icmp ult i8 %57, 20, !dbg !323
  br i1 %58, label %151, label %59, !dbg !325

59:                                               ; preds = %54
  %60 = zext i8 %57 to i64
  call void @llvm.dbg.value(metadata i64 %60, metadata !312, metadata !DIExpression()), !dbg !313
  %61 = getelementptr i8, i8* %49, i64 %60, !dbg !326
  %62 = icmp ugt i8* %61, %10, !dbg !328
  br i1 %62, label %151, label %68, !dbg !329

63:                                               ; preds = %48
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !330, metadata !DIExpression()), !dbg !339
  call void @llvm.dbg.value(metadata i8* %10, metadata !336, metadata !DIExpression()), !dbg !339
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !337, metadata !DIExpression()), !dbg !339
  call void @llvm.dbg.value(metadata i8* %49, metadata !338, metadata !DIExpression()), !dbg !339
  %64 = getelementptr inbounds i8, i8* %49, i64 40, !dbg !343
  %65 = bitcast i8* %64 to %struct.ipv6hdr*, !dbg !343
  %66 = inttoptr i64 %9 to %struct.ipv6hdr*, !dbg !345
  %67 = icmp ugt %struct.ipv6hdr* %65, %66, !dbg !346
  br i1 %67, label %151, label %68, !dbg !347

68:                                               ; preds = %63, %59
  %69 = phi i64 [ 9, %59 ], [ 6, %63 ]
  %70 = phi i8* [ %61, %59 ], [ %64, %63 ], !dbg !348
  %71 = getelementptr inbounds i8, i8* %49, i64 %69, !dbg !349
  %72 = load i8, i8* %71, align 1, !dbg !349, !tbaa !350
  call void @llvm.dbg.value(metadata i8* %70, metadata !204, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata i8 %72, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !225
  %73 = icmp eq i8 %72, 17, !dbg !351
  br i1 %73, label %74, label %151, !dbg !352

74:                                               ; preds = %68
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !353, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i8* %10, metadata !359, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata %struct.udphdr** undef, metadata !360, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i8* %70, metadata !362, metadata !DIExpression()), !dbg !363
  %75 = getelementptr inbounds i8, i8* %70, i64 8, !dbg !365
  %76 = bitcast i8* %75 to %struct.udphdr*, !dbg !365
  %77 = inttoptr i64 %9 to %struct.udphdr*, !dbg !367
  %78 = icmp ugt %struct.udphdr* %76, %77, !dbg !368
  %79 = select i1 %78, i8* %70, i8* %75, !dbg !369
  call void @llvm.dbg.value(metadata i8* %79, metadata !204, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata i32 undef, metadata !209, metadata !DIExpression()), !dbg !370
  %80 = getelementptr inbounds i8, i8* %79, i64 12, !dbg !371
  %81 = icmp ugt i8* %80, %10, !dbg !373
  br i1 %81, label %151, label %82, !dbg !374

82:                                               ; preds = %74
  %83 = getelementptr inbounds i8, i8* %79, i64 4, !dbg !375
  %84 = bitcast i8* %83 to i16*, !dbg !375
  %85 = load i16, i16* %84, align 2, !dbg !376, !tbaa !281
  call void @llvm.dbg.value(metadata i16 %85, metadata !212, metadata !DIExpression()), !dbg !370
  %86 = icmp eq i16 %85, 0, !dbg !377
  br i1 %86, label %151, label %87, !dbg !378

87:                                               ; preds = %82
  %88 = bitcast %struct.qname_lpm_key* %5 to i8*, !dbg !379
  call void @llvm.lifetime.start.p0i8(i64 68, i8* nonnull %88) #8, !dbg !379
  call void @llvm.dbg.declare(metadata %struct.qname_lpm_key* %5, metadata !213, metadata !DIExpression()), !dbg !380
  tail call void @llvm.experimental.noalias.scope.decl(metadata !381), !dbg !384
  call void @llvm.dbg.value(metadata i8* %80, metadata !385, metadata !DIExpression()) #8, !dbg !413
  call void @llvm.dbg.value(metadata i8* %10, metadata !390, metadata !DIExpression()) #8, !dbg !413
  call void @llvm.dbg.declare(metadata %struct.qname_lpm_key* %5, metadata !391, metadata !DIExpression()) #8, !dbg !415
  %89 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %5, i64 0, i32 1, i64 0, !dbg !415
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(68) %89, i8 0, i64 64, i1 false) #8, !dbg !415, !alias.scope !381
  %90 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %5, i64 0, i32 0, !dbg !415
  store i32 64, i32* %90, align 4, !dbg !415, !alias.scope !381
  call void @llvm.dbg.value(metadata i64 0, metadata !392, metadata !DIExpression()) #8, !dbg !413
  call void @llvm.dbg.value(metadata i8 0, metadata !395, metadata !DIExpression()) #8, !dbg !413
  call void @llvm.dbg.value(metadata i8 0, metadata !396, metadata !DIExpression()) #8, !dbg !413
  %91 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !416
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %91) #8, !dbg !416, !noalias !381
  call void @llvm.dbg.declare(metadata [64 x i8]* %2, metadata !397, metadata !DIExpression()) #8, !dbg !417
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(64) %91, i8 0, i64 64, i1 false) #8, !dbg !417, !noalias !381
  %92 = getelementptr inbounds [11 x i8], [11 x i8]* %3, i64 0, i64 0
  br label %93, !dbg !418

93:                                               ; preds = %118, %87
  %94 = phi i64 [ 0, %87 ], [ %120, %118 ]
  %95 = phi i8 [ 0, %87 ], [ %119, %118 ]
  call void @llvm.dbg.value(metadata i64 %94, metadata !392, metadata !DIExpression()) #8, !dbg !413
  call void @llvm.dbg.value(metadata i8 %95, metadata !395, metadata !DIExpression()) #8, !dbg !413
  %96 = getelementptr i8, i8* %80, i64 %94, !dbg !419
  %97 = getelementptr i8, i8* %96, i64 1, !dbg !421
  %98 = icmp ugt i8* %97, %10, !dbg !422
  br i1 %98, label %135, label %99, !dbg !423

99:                                               ; preds = %93
  %100 = sext i8 %95 to i64, !dbg !424
  %101 = icmp eq i64 %94, %100, !dbg !425
  %102 = load i8, i8* %96, align 1, !dbg !426, !tbaa !350, !noalias !381
  br i1 %101, label %103, label %116, !dbg !427

103:                                              ; preds = %99
  call void @llvm.dbg.value(metadata i8 %95, metadata !396, metadata !DIExpression()) #8, !dbg !413
  call void @llvm.dbg.value(metadata i8 %102, metadata !395, metadata !DIExpression()) #8, !dbg !413
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %92) #8, !dbg !428, !noalias !381
  call void @llvm.dbg.declare(metadata [11 x i8]* %3, metadata !398, metadata !DIExpression()) #8, !dbg !428
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(11) %92, i8* noundef nonnull align 1 dereferenceable(11) getelementptr inbounds ([11 x i8], [11 x i8]* @__const.get_qname_lpm_key.____fmt, i64 0, i64 0), i64 11, i1 false) #8, !dbg !428, !noalias !381
  %104 = sext i8 %102 to i32, !dbg !428
  %105 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %92, i32 11, i32 %104) #8, !dbg !428, !noalias !381
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %92) #8, !dbg !429, !noalias !381
  %106 = icmp eq i8 %102, 0, !dbg !430
  br i1 %106, label %107, label %110, !dbg !432

107:                                              ; preds = %103
  %108 = add nsw i64 %94, -1, !dbg !433
  call void @llvm.dbg.value(metadata i64 %108, metadata !392, metadata !DIExpression()) #8, !dbg !413
  %109 = icmp eq i64 %108, 0, !dbg !434
  br i1 %109, label %136, label %122, !dbg !435

110:                                              ; preds = %103
  %111 = icmp sgt i8 %102, 63, !dbg !436
  br i1 %111, label %135, label %112, !dbg !438

112:                                              ; preds = %110
  %113 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 %94, !dbg !439
  store i8 46, i8* %113, align 1, !dbg !440, !tbaa !350, !noalias !381
  %114 = add i8 %95, 1, !dbg !441
  %115 = add i8 %114, %102, !dbg !442
  call void @llvm.dbg.value(metadata i8 %115, metadata !395, metadata !DIExpression()) #8, !dbg !413
  br label %118, !dbg !443

116:                                              ; preds = %99
  %117 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 %94, !dbg !444
  store i8 %102, i8* %117, align 1, !dbg !446, !tbaa !350, !noalias !381
  br label %118

118:                                              ; preds = %116, %112
  %119 = phi i8 [ %115, %112 ], [ %95, %116 ], !dbg !413
  call void @llvm.dbg.value(metadata i8 %119, metadata !395, metadata !DIExpression()) #8, !dbg !413
  %120 = add nuw nsw i64 %94, 1, !dbg !447
  call void @llvm.dbg.value(metadata i64 %120, metadata !392, metadata !DIExpression()) #8, !dbg !413
  %121 = icmp eq i64 %120, 64, !dbg !448
  br i1 %121, label %135, label %93, !dbg !418, !llvm.loop !449

122:                                              ; preds = %107, %129
  %123 = phi i64 [ %133, %129 ], [ %108, %107 ]
  %124 = phi i64 [ %123, %129 ], [ %94, %107 ]
  %125 = sub nsw i64 %94, %124, !dbg !452
  call void @llvm.dbg.value(metadata i64 %125, metadata !405, metadata !DIExpression()) #8, !dbg !453
  %126 = icmp ugt i64 %125, 63, !dbg !454
  br i1 %126, label %136, label %127, !dbg !456

127:                                              ; preds = %122
  %128 = icmp ugt i64 %123, 63
  br i1 %128, label %135, label %129, !dbg !457

129:                                              ; preds = %127
  %130 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 %123, !dbg !459
  %131 = load i8, i8* %130, align 1, !dbg !459, !tbaa !350, !noalias !381
  %132 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %5, i64 0, i32 1, i64 %125, !dbg !460
  store i8 %131, i8* %132, align 1, !dbg !461, !tbaa !350, !alias.scope !381
  call void @llvm.dbg.value(metadata i64 %123, metadata !392, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #8, !dbg !413
  %133 = add nsw i64 %123, -1, !dbg !433
  call void @llvm.dbg.value(metadata i64 %133, metadata !392, metadata !DIExpression()) #8, !dbg !413
  %134 = icmp eq i64 %133, 0, !dbg !434
  br i1 %134, label %136, label %122, !dbg !435

135:                                              ; preds = %93, %110, %118, %127
  call void @llvm.dbg.label(metadata !412) #8, !dbg !462
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %91) #8, !dbg !463, !noalias !381
  br label %149, !dbg !464

136:                                              ; preds = %122, %129, %107
  %137 = getelementptr inbounds [15 x i8], [15 x i8]* %4, i64 0, i64 0, !dbg !465
  call void @llvm.lifetime.start.p0i8(i64 15, i8* nonnull %137) #8, !dbg !465, !noalias !381
  call void @llvm.dbg.declare(metadata [15 x i8]* %4, metadata !407, metadata !DIExpression()) #8, !dbg !465
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(15) %137, i8* noundef nonnull align 1 dereferenceable(15) getelementptr inbounds ([15 x i8], [15 x i8]* @__const.get_qname_lpm_key.____fmt.1, i64 0, i64 0), i64 15, i1 false) #8, !dbg !465, !noalias !381
  %138 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %137, i32 15, i8* nonnull %89) #8, !dbg !465
  call void @llvm.lifetime.end.p0i8(i64 15, i8* nonnull %137) #8, !dbg !466, !noalias !381
  %139 = load i32, i32* %90, align 4, !dbg !467, !tbaa !469
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %91) #8, !dbg !463, !noalias !381
  %140 = icmp eq i32 %139, 0, !dbg !471
  br i1 %140, label %149, label %141, !dbg !464

141:                                              ; preds = %136
  call void @llvm.dbg.value(metadata i32* null, metadata !216, metadata !DIExpression()), !dbg !472
  %142 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon* @dns_block_suffixes to i8*), i8* nonnull %88) #8, !dbg !473
  call void @llvm.dbg.value(metadata i8* %142, metadata !216, metadata !DIExpression()), !dbg !472
  %143 = icmp eq i8* %142, null, !dbg !474
  br i1 %143, label %149, label %144, !dbg !475

144:                                              ; preds = %141
  %145 = bitcast i8* %142 to i32*, !dbg !473
  call void @llvm.dbg.value(metadata i32* %145, metadata !216, metadata !DIExpression()), !dbg !472
  %146 = getelementptr inbounds [19 x i8], [19 x i8]* %6, i64 0, i64 0, !dbg !476
  call void @llvm.lifetime.start.p0i8(i64 19, i8* nonnull %146) #8, !dbg !476
  call void @llvm.dbg.declare(metadata [19 x i8]* %6, metadata !217, metadata !DIExpression()), !dbg !476
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(19) %146, i8* noundef nonnull align 1 dereferenceable(19) getelementptr inbounds ([19 x i8], [19 x i8]* @__const.xdp_patch_ports_func.____fmt, i64 0, i64 0), i64 19, i1 false), !dbg !476
  %147 = load i32, i32* %145, align 4, !dbg !476, !tbaa !477
  %148 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %146, i32 19, i32 %147) #8, !dbg !476
  call void @llvm.lifetime.end.p0i8(i64 19, i8* nonnull %146) #8, !dbg !478
  call void @llvm.dbg.value(metadata i32 1, metadata !127, metadata !DIExpression()), !dbg !225
  br label %149, !dbg !479

149:                                              ; preds = %135, %144, %141, %136
  %150 = phi i32 [ 0, %136 ], [ 1, %144 ], [ 2, %141 ], [ 0, %135 ], !dbg !472
  call void @llvm.dbg.value(metadata i32 %150, metadata !127, metadata !DIExpression()), !dbg !225
  call void @llvm.lifetime.end.p0i8(i64 68, i8* nonnull %88) #8, !dbg !480
  br label %151

151:                                              ; preds = %63, %59, %54, %51, %1, %68, %48, %149, %82, %74
  %152 = phi i32 [ 2, %68 ], [ 2, %48 ], [ 2, %74 ], [ %150, %149 ], [ 2, %82 ], [ 0, %1 ], [ 2, %51 ], [ 2, %54 ], [ 2, %59 ], [ 2, %63 ]
  ret i32 %152, !dbg !481
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
!1 = distinct !DIGlobalVariable(name: "dns_block_suffixes", scope: !2, file: !3, line: 33, type: !80, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Alpine clang version 13.0.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !45, globals: !57, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_pass_kern.c", directory: "/root/qname_intercepter/xdp-filter")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 5497, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "")
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
!65 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/root/qname_intercepter/xdp-filter")
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
!113 = distinct !DISubprogram(name: "xdp_patch_ports_func", scope: !3, file: !3, line: 83, type: !114, scopeLine: 84, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !125)
!114 = !DISubroutineType(types: !115)
!115 = !{!76, !116}
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5508, size: 192, elements: !118)
!118 = !{!119, !120, !121, !122, !123, !124}
!119 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !117, file: !6, line: 5509, baseType: !79, size: 32)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !117, file: !6, line: 5510, baseType: !79, size: 32, offset: 32)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !117, file: !6, line: 5511, baseType: !79, size: 32, offset: 64)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !117, file: !6, line: 5513, baseType: !79, size: 32, offset: 96)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !117, file: !6, line: 5514, baseType: !79, size: 32, offset: 128)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !117, file: !6, line: 5516, baseType: !79, size: 32, offset: 160)
!125 = !{!126, !127, !128, !129, !130, !143, !161, !193, !202, !203, !204, !209, !212, !213, !216, !217, !224}
!126 = !DILocalVariable(name: "ctx", arg: 1, scope: !113, file: !3, line: 83, type: !116)
!127 = !DILocalVariable(name: "action", scope: !113, file: !3, line: 85, type: !76)
!128 = !DILocalVariable(name: "eth_type", scope: !113, file: !3, line: 86, type: !76)
!129 = !DILocalVariable(name: "ip_type", scope: !113, file: !3, line: 86, type: !76)
!130 = !DILocalVariable(name: "eth", scope: !113, file: !3, line: 87, type: !131)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !133, line: 169, size: 112, elements: !134)
!133 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!134 = !{!135, !139, !140}
!135 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !132, file: !133, line: 170, baseType: !136, size: 48)
!136 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 48, elements: !137)
!137 = !{!138}
!138 = !DISubrange(count: 6)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !132, file: !133, line: 171, baseType: !136, size: 48, offset: 48)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !132, file: !133, line: 172, baseType: !141, size: 16, offset: 96)
!141 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !142, line: 25, baseType: !48)
!142 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!143 = !DILocalVariable(name: "iphdr", scope: !113, file: !3, line: 88, type: !144)
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !145, size: 64)
!145 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !146, line: 86, size: 160, elements: !147)
!146 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!147 = !{!148, !149, !150, !151, !152, !153, !154, !155, !156, !158, !160}
!148 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !145, file: !146, line: 88, baseType: !52, size: 4, flags: DIFlagBitField, extraData: i64 0)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !145, file: !146, line: 89, baseType: !52, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !145, file: !146, line: 96, baseType: !52, size: 8, offset: 8)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !145, file: !146, line: 97, baseType: !141, size: 16, offset: 16)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !145, file: !146, line: 98, baseType: !141, size: 16, offset: 32)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !145, file: !146, line: 99, baseType: !141, size: 16, offset: 48)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !145, file: !146, line: 100, baseType: !52, size: 8, offset: 64)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !145, file: !146, line: 101, baseType: !52, size: 8, offset: 72)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !145, file: !146, line: 102, baseType: !157, size: 16, offset: 80)
!157 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !142, line: 31, baseType: !48)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !145, file: !146, line: 103, baseType: !159, size: 32, offset: 96)
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !142, line: 27, baseType: !79)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !145, file: !146, line: 104, baseType: !159, size: 32, offset: 128)
!161 = !DILocalVariable(name: "ipv6hdr", scope: !113, file: !3, line: 89, type: !162)
!162 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64)
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !164, line: 117, size: 320, elements: !165)
!164 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "")
!165 = !{!166, !167, !168, !172, !173, !174, !175, !192}
!166 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !163, file: !164, line: 119, baseType: !52, size: 4, flags: DIFlagBitField, extraData: i64 0)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !163, file: !164, line: 120, baseType: !52, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !163, file: !164, line: 127, baseType: !169, size: 24, offset: 8)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 24, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 3)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !163, file: !164, line: 129, baseType: !141, size: 16, offset: 32)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !163, file: !164, line: 130, baseType: !52, size: 8, offset: 48)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !163, file: !164, line: 131, baseType: !52, size: 8, offset: 56)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !163, file: !164, line: 133, baseType: !176, size: 128, offset: 64)
!176 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !177, line: 33, size: 128, elements: !178)
!177 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "")
!178 = !{!179}
!179 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !176, file: !177, line: 40, baseType: !180, size: 128)
!180 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !176, file: !177, line: 34, size: 128, elements: !181)
!181 = !{!182, !186, !190}
!182 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !180, file: !177, line: 35, baseType: !183, size: 128)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 128, elements: !184)
!184 = !{!185}
!185 = !DISubrange(count: 16)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !180, file: !177, line: 37, baseType: !187, size: 128)
!187 = !DICompositeType(tag: DW_TAG_array_type, baseType: !141, size: 128, elements: !188)
!188 = !{!189}
!189 = !DISubrange(count: 8)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !180, file: !177, line: 38, baseType: !191, size: 128)
!191 = !DICompositeType(tag: DW_TAG_array_type, baseType: !159, size: 128, elements: !61)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !163, file: !164, line: 134, baseType: !176, size: 128, offset: 192)
!193 = !DILocalVariable(name: "udphdr", scope: !113, file: !3, line: 90, type: !194)
!194 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !195, size: 64)
!195 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !196, line: 23, size: 64, elements: !197)
!196 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "")
!197 = !{!198, !199, !200, !201}
!198 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !195, file: !196, line: 24, baseType: !141, size: 16)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !195, file: !196, line: 25, baseType: !141, size: 16, offset: 16)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !195, file: !196, line: 26, baseType: !141, size: 16, offset: 32)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !195, file: !196, line: 27, baseType: !157, size: 16, offset: 48)
!202 = !DILocalVariable(name: "data_end", scope: !113, file: !3, line: 91, type: !46)
!203 = !DILocalVariable(name: "data", scope: !113, file: !3, line: 92, type: !46)
!204 = !DILocalVariable(name: "nh", scope: !113, file: !3, line: 93, type: !205)
!205 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !206, line: 33, size: 64, elements: !207)
!206 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/root/qname_intercepter/xdp-filter")
!207 = !{!208}
!208 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !205, file: !206, line: 34, baseType: !46, size: 64)
!209 = !DILocalVariable(name: "udppld", scope: !210, file: !3, line: 110, type: !79)
!210 = distinct !DILexicalBlock(scope: !211, file: !3, line: 109, column: 30)
!211 = distinct !DILexicalBlock(scope: !113, file: !3, line: 109, column: 6)
!212 = !DILocalVariable(name: "qrn", scope: !210, file: !3, line: 119, type: !48)
!213 = !DILocalVariable(name: "qlk", scope: !214, file: !3, line: 121, type: !89)
!214 = distinct !DILexicalBlock(scope: !215, file: !3, line: 120, column: 14)
!215 = distinct !DILexicalBlock(scope: !210, file: !3, line: 120, column: 6)
!216 = !DILocalVariable(name: "tval", scope: !214, file: !3, line: 126, type: !97)
!217 = !DILocalVariable(name: "____fmt", scope: !218, file: !3, line: 131, type: !221)
!218 = distinct !DILexicalBlock(scope: !219, file: !3, line: 131, column: 5)
!219 = distinct !DILexicalBlock(scope: !220, file: !3, line: 130, column: 9)
!220 = distinct !DILexicalBlock(scope: !214, file: !3, line: 127, column: 7)
!221 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 152, elements: !222)
!222 = !{!223}
!223 = !DISubrange(count: 19)
!224 = !DILabel(scope: !113, name: "out", file: !3, line: 140)
!225 = !DILocation(line: 0, scope: !113)
!226 = !DILocation(line: 91, column: 38, scope: !113)
!227 = !{!228, !229, i64 4}
!228 = !{!"xdp_md", !229, i64 0, !229, i64 4, !229, i64 8, !229, i64 12, !229, i64 16, !229, i64 20}
!229 = !{!"int", !230, i64 0}
!230 = !{!"omnipotent char", !231, i64 0}
!231 = !{!"Simple C/C++ TBAA"}
!232 = !DILocation(line: 91, column: 27, scope: !113)
!233 = !DILocation(line: 91, column: 19, scope: !113)
!234 = !DILocation(line: 92, column: 34, scope: !113)
!235 = !{!228, !229, i64 0}
!236 = !DILocation(line: 92, column: 23, scope: !113)
!237 = !DILocation(line: 92, column: 15, scope: !113)
!238 = !DILocalVariable(name: "nh", arg: 1, scope: !239, file: !206, line: 124, type: !242)
!239 = distinct !DISubprogram(name: "parse_ethhdr", scope: !206, file: !206, line: 124, type: !240, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !244)
!240 = !DISubroutineType(types: !241)
!241 = !{!76, !242, !46, !243}
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64)
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!244 = !{!238, !245, !246}
!245 = !DILocalVariable(name: "data_end", arg: 2, scope: !239, file: !206, line: 125, type: !46)
!246 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !239, file: !206, line: 126, type: !243)
!247 = !DILocation(line: 0, scope: !239, inlinedAt: !248)
!248 = distinct !DILocation(line: 95, column: 13, scope: !113)
!249 = !DILocalVariable(name: "nh", arg: 1, scope: !250, file: !206, line: 79, type: !242)
!250 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !206, file: !206, line: 79, type: !251, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !260)
!251 = !DISubroutineType(types: !252)
!252 = !{!76, !242, !46, !243, !253}
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !254, size: 64)
!254 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !206, line: 64, size: 32, elements: !255)
!255 = !{!256}
!256 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !254, file: !206, line: 65, baseType: !257, size: 32)
!257 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 32, elements: !258)
!258 = !{!259}
!259 = !DISubrange(count: 2)
!260 = !{!249, !261, !262, !263, !264, !265, !266, !272, !273}
!261 = !DILocalVariable(name: "data_end", arg: 2, scope: !250, file: !206, line: 80, type: !46)
!262 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !250, file: !206, line: 81, type: !243)
!263 = !DILocalVariable(name: "vlans", arg: 4, scope: !250, file: !206, line: 82, type: !253)
!264 = !DILocalVariable(name: "eth", scope: !250, file: !206, line: 84, type: !131)
!265 = !DILocalVariable(name: "hdrsize", scope: !250, file: !206, line: 85, type: !76)
!266 = !DILocalVariable(name: "vlh", scope: !250, file: !206, line: 86, type: !267)
!267 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !268, size: 64)
!268 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !206, line: 42, size: 32, elements: !269)
!269 = !{!270, !271}
!270 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !268, file: !206, line: 43, baseType: !141, size: 16)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !268, file: !206, line: 44, baseType: !141, size: 16, offset: 16)
!272 = !DILocalVariable(name: "h_proto", scope: !250, file: !206, line: 87, type: !48)
!273 = !DILocalVariable(name: "i", scope: !250, file: !206, line: 88, type: !76)
!274 = !DILocation(line: 0, scope: !250, inlinedAt: !275)
!275 = distinct !DILocation(line: 129, column: 9, scope: !239, inlinedAt: !248)
!276 = !DILocation(line: 93, column: 14, scope: !277, inlinedAt: !275)
!277 = distinct !DILexicalBlock(scope: !250, file: !206, line: 93, column: 6)
!278 = !DILocation(line: 93, column: 24, scope: !277, inlinedAt: !275)
!279 = !DILocation(line: 93, column: 6, scope: !250, inlinedAt: !275)
!280 = !DILocation(line: 99, column: 17, scope: !250, inlinedAt: !275)
!281 = !{!282, !282, i64 0}
!282 = !{!"short", !230, i64 0}
!283 = !DILocalVariable(name: "h_proto", arg: 1, scope: !284, file: !206, line: 68, type: !48)
!284 = distinct !DISubprogram(name: "proto_is_vlan", scope: !206, file: !206, line: 68, type: !285, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !287)
!285 = !DISubroutineType(types: !286)
!286 = !{!76, !48}
!287 = !{!283}
!288 = !DILocation(line: 0, scope: !284, inlinedAt: !289)
!289 = distinct !DILocation(line: 106, column: 8, scope: !290, inlinedAt: !275)
!290 = distinct !DILexicalBlock(scope: !291, file: !206, line: 106, column: 7)
!291 = distinct !DILexicalBlock(scope: !292, file: !206, line: 105, column: 39)
!292 = distinct !DILexicalBlock(scope: !293, file: !206, line: 105, column: 2)
!293 = distinct !DILexicalBlock(scope: !250, file: !206, line: 105, column: 2)
!294 = !DILocation(line: 70, column: 20, scope: !284, inlinedAt: !289)
!295 = !DILocation(line: 70, column: 46, scope: !284, inlinedAt: !289)
!296 = !DILocation(line: 106, column: 7, scope: !291, inlinedAt: !275)
!297 = !DILocation(line: 109, column: 11, scope: !298, inlinedAt: !275)
!298 = distinct !DILexicalBlock(scope: !291, file: !206, line: 109, column: 7)
!299 = !DILocation(line: 109, column: 15, scope: !298, inlinedAt: !275)
!300 = !DILocation(line: 109, column: 7, scope: !291, inlinedAt: !275)
!301 = !DILocation(line: 112, column: 18, scope: !291, inlinedAt: !275)
!302 = !DILocation(line: 101, column: 6, scope: !113)
!303 = !DILocalVariable(name: "nh", arg: 1, scope: !304, file: !206, line: 151, type: !242)
!304 = distinct !DISubprogram(name: "parse_iphdr", scope: !206, file: !206, line: 151, type: !305, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !308)
!305 = !DISubroutineType(types: !306)
!306 = !{!76, !242, !46, !307}
!307 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !144, size: 64)
!308 = !{!303, !309, !310, !311, !312}
!309 = !DILocalVariable(name: "data_end", arg: 2, scope: !304, file: !206, line: 152, type: !46)
!310 = !DILocalVariable(name: "iphdr", arg: 3, scope: !304, file: !206, line: 153, type: !307)
!311 = !DILocalVariable(name: "iph", scope: !304, file: !206, line: 155, type: !144)
!312 = !DILocalVariable(name: "hdrsize", scope: !304, file: !206, line: 156, type: !76)
!313 = !DILocation(line: 0, scope: !304, inlinedAt: !314)
!314 = distinct !DILocation(line: 102, column: 13, scope: !315)
!315 = distinct !DILexicalBlock(scope: !316, file: !3, line: 101, column: 39)
!316 = distinct !DILexicalBlock(scope: !113, file: !3, line: 101, column: 6)
!317 = !DILocation(line: 158, column: 10, scope: !318, inlinedAt: !314)
!318 = distinct !DILexicalBlock(scope: !304, file: !206, line: 158, column: 6)
!319 = !DILocation(line: 158, column: 14, scope: !318, inlinedAt: !314)
!320 = !DILocation(line: 158, column: 6, scope: !304, inlinedAt: !314)
!321 = !DILocation(line: 161, column: 17, scope: !304, inlinedAt: !314)
!322 = !DILocation(line: 161, column: 21, scope: !304, inlinedAt: !314)
!323 = !DILocation(line: 163, column: 13, scope: !324, inlinedAt: !314)
!324 = distinct !DILexicalBlock(scope: !304, file: !206, line: 163, column: 5)
!325 = !DILocation(line: 163, column: 5, scope: !304, inlinedAt: !314)
!326 = !DILocation(line: 167, column: 14, scope: !327, inlinedAt: !314)
!327 = distinct !DILexicalBlock(scope: !304, file: !206, line: 167, column: 6)
!328 = !DILocation(line: 167, column: 24, scope: !327, inlinedAt: !314)
!329 = !DILocation(line: 167, column: 6, scope: !304, inlinedAt: !314)
!330 = !DILocalVariable(name: "nh", arg: 1, scope: !331, file: !206, line: 132, type: !242)
!331 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !206, file: !206, line: 132, type: !332, scopeLine: 135, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !335)
!332 = !DISubroutineType(types: !333)
!333 = !{!76, !242, !46, !334}
!334 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64)
!335 = !{!330, !336, !337, !338}
!336 = !DILocalVariable(name: "data_end", arg: 2, scope: !331, file: !206, line: 133, type: !46)
!337 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !331, file: !206, line: 134, type: !334)
!338 = !DILocalVariable(name: "ip6h", scope: !331, file: !206, line: 136, type: !162)
!339 = !DILocation(line: 0, scope: !331, inlinedAt: !340)
!340 = distinct !DILocation(line: 104, column: 13, scope: !341)
!341 = distinct !DILexicalBlock(scope: !342, file: !3, line: 103, column: 48)
!342 = distinct !DILexicalBlock(scope: !316, file: !3, line: 103, column: 13)
!343 = !DILocation(line: 142, column: 11, scope: !344, inlinedAt: !340)
!344 = distinct !DILexicalBlock(scope: !331, file: !206, line: 142, column: 6)
!345 = !DILocation(line: 142, column: 17, scope: !344, inlinedAt: !340)
!346 = !DILocation(line: 142, column: 15, scope: !344, inlinedAt: !340)
!347 = !DILocation(line: 142, column: 6, scope: !331, inlinedAt: !340)
!348 = !DILocation(line: 93, column: 25, scope: !113)
!349 = !DILocation(line: 0, scope: !316)
!350 = !{!230, !230, i64 0}
!351 = !DILocation(line: 109, column: 14, scope: !211)
!352 = !DILocation(line: 109, column: 6, scope: !113)
!353 = !DILocalVariable(name: "nh", arg: 1, scope: !354, file: !206, line: 224, type: !242)
!354 = distinct !DISubprogram(name: "parse_udphdr", scope: !206, file: !206, line: 224, type: !355, scopeLine: 227, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !358)
!355 = !DISubroutineType(types: !356)
!356 = !{!76, !242, !46, !357}
!357 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !194, size: 64)
!358 = !{!353, !359, !360, !361, !362}
!359 = !DILocalVariable(name: "data_end", arg: 2, scope: !354, file: !206, line: 225, type: !46)
!360 = !DILocalVariable(name: "udphdr", arg: 3, scope: !354, file: !206, line: 226, type: !357)
!361 = !DILocalVariable(name: "len", scope: !354, file: !206, line: 228, type: !76)
!362 = !DILocalVariable(name: "h", scope: !354, file: !206, line: 229, type: !194)
!363 = !DILocation(line: 0, scope: !354, inlinedAt: !364)
!364 = distinct !DILocation(line: 110, column: 18, scope: !210)
!365 = !DILocation(line: 231, column: 8, scope: !366, inlinedAt: !364)
!366 = distinct !DILexicalBlock(scope: !354, file: !206, line: 231, column: 6)
!367 = !DILocation(line: 231, column: 14, scope: !366, inlinedAt: !364)
!368 = !DILocation(line: 231, column: 12, scope: !366, inlinedAt: !364)
!369 = !DILocation(line: 231, column: 6, scope: !354, inlinedAt: !364)
!370 = !DILocation(line: 0, scope: !210)
!371 = !DILocation(line: 115, column: 22, scope: !372)
!372 = distinct !DILexicalBlock(scope: !210, file: !3, line: 115, column: 6)
!373 = !DILocation(line: 115, column: 27, scope: !372)
!374 = !DILocation(line: 115, column: 6, scope: !210)
!375 = !DILocation(line: 119, column: 35, scope: !210)
!376 = !DILocation(line: 119, column: 15, scope: !210)
!377 = !DILocation(line: 120, column: 10, scope: !215)
!378 = !DILocation(line: 120, column: 6, scope: !210)
!379 = !DILocation(line: 121, column: 4, scope: !214)
!380 = !DILocation(line: 121, column: 25, scope: !214)
!381 = !{!382}
!382 = distinct !{!382, !383, !"get_qname_lpm_key: argument 0"}
!383 = distinct !{!383, !"get_qname_lpm_key"}
!384 = !DILocation(line: 121, column: 31, scope: !214)
!385 = !DILocalVariable(name: "base", arg: 1, scope: !386, file: !3, line: 35, type: !77)
!386 = distinct !DISubprogram(name: "get_qname_lpm_key", scope: !3, file: !3, line: 35, type: !387, scopeLine: 35, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !389)
!387 = !DISubroutineType(types: !388)
!388 = !{!89, !77, !46}
!389 = !{!385, !390, !391, !392, !395, !396, !397, !398, !404, !405, !407, !412}
!390 = !DILocalVariable(name: "data_end", arg: 2, scope: !386, file: !3, line: 35, type: !46)
!391 = !DILocalVariable(name: "qlk", scope: !386, file: !3, line: 36, type: !89)
!392 = !DILocalVariable(name: "qend", scope: !386, file: !3, line: 40, type: !393)
!393 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !49, line: 31, baseType: !394)
!394 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!395 = !DILocalVariable(name: "tmp", scope: !386, file: !3, line: 41, type: !56)
!396 = !DILocalVariable(name: "sv", scope: !386, file: !3, line: 41, type: !56)
!397 = !DILocalVariable(name: "qnbuf", scope: !386, file: !3, line: 42, type: !93)
!398 = !DILocalVariable(name: "____fmt", scope: !399, file: !3, line: 49, type: !403)
!399 = distinct !DILexicalBlock(scope: !400, file: !3, line: 49, column: 4)
!400 = distinct !DILexicalBlock(scope: !401, file: !3, line: 46, column: 18)
!401 = distinct !DILexicalBlock(scope: !402, file: !3, line: 46, column: 6)
!402 = distinct !DILexicalBlock(scope: !386, file: !3, line: 44, column: 23)
!403 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 88, elements: !85)
!404 = !DILocalVariable(name: "qlen", scope: !386, file: !3, line: 61, type: !393)
!405 = !DILocalVariable(name: "i", scope: !406, file: !3, line: 64, type: !393)
!406 = distinct !DILexicalBlock(scope: !386, file: !3, line: 63, column: 17)
!407 = !DILocalVariable(name: "____fmt", scope: !408, file: !3, line: 71, type: !409)
!408 = distinct !DILexicalBlock(scope: !386, file: !3, line: 71, column: 2)
!409 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 120, elements: !410)
!410 = !{!411}
!411 = !DISubrange(count: 15)
!412 = !DILabel(scope: !386, name: "fail", file: !3, line: 74)
!413 = !DILocation(line: 0, scope: !386, inlinedAt: !414)
!414 = distinct !DILocation(line: 121, column: 31, scope: !214)
!415 = !DILocation(line: 36, column: 23, scope: !386, inlinedAt: !414)
!416 = !DILocation(line: 42, column: 2, scope: !386, inlinedAt: !414)
!417 = !DILocation(line: 42, column: 7, scope: !386, inlinedAt: !414)
!418 = !DILocation(line: 44, column: 2, scope: !386, inlinedAt: !414)
!419 = !DILocation(line: 45, column: 17, scope: !420, inlinedAt: !414)
!420 = distinct !DILexicalBlock(scope: !402, file: !3, line: 45, column: 6)
!421 = !DILocation(line: 45, column: 22, scope: !420, inlinedAt: !414)
!422 = !DILocation(line: 45, column: 25, scope: !420, inlinedAt: !414)
!423 = !DILocation(line: 45, column: 6, scope: !402, inlinedAt: !414)
!424 = !DILocation(line: 46, column: 14, scope: !401, inlinedAt: !414)
!425 = !DILocation(line: 46, column: 11, scope: !401, inlinedAt: !414)
!426 = !DILocation(line: 0, scope: !401, inlinedAt: !414)
!427 = !DILocation(line: 46, column: 6, scope: !402, inlinedAt: !414)
!428 = !DILocation(line: 49, column: 4, scope: !399, inlinedAt: !414)
!429 = !DILocation(line: 49, column: 4, scope: !400, inlinedAt: !414)
!430 = !DILocation(line: 50, column: 11, scope: !431, inlinedAt: !414)
!431 = distinct !DILexicalBlock(scope: !400, file: !3, line: 50, column: 7)
!432 = !DILocation(line: 50, column: 7, scope: !400, inlinedAt: !414)
!433 = !DILocation(line: 62, column: 6, scope: !386, inlinedAt: !414)
!434 = !DILocation(line: 63, column: 13, scope: !386, inlinedAt: !414)
!435 = !DILocation(line: 63, column: 2, scope: !386, inlinedAt: !414)
!436 = !DILocation(line: 51, column: 11, scope: !437, inlinedAt: !414)
!437 = distinct !DILexicalBlock(scope: !400, file: !3, line: 51, column: 7)
!438 = !DILocation(line: 51, column: 7, scope: !400, inlinedAt: !414)
!439 = !DILocation(line: 52, column: 4, scope: !400, inlinedAt: !414)
!440 = !DILocation(line: 52, column: 16, scope: !400, inlinedAt: !414)
!441 = !DILocation(line: 53, column: 12, scope: !400, inlinedAt: !414)
!442 = !DILocation(line: 53, column: 16, scope: !400, inlinedAt: !414)
!443 = !DILocation(line: 54, column: 3, scope: !400, inlinedAt: !414)
!444 = !DILocation(line: 55, column: 4, scope: !445, inlinedAt: !414)
!445 = distinct !DILexicalBlock(scope: !401, file: !3, line: 54, column: 8)
!446 = !DILocation(line: 55, column: 16, scope: !445, inlinedAt: !414)
!447 = !DILocation(line: 57, column: 7, scope: !402, inlinedAt: !414)
!448 = !DILocation(line: 44, column: 12, scope: !386, inlinedAt: !414)
!449 = distinct !{!449, !418, !450, !451}
!450 = !DILocation(line: 58, column: 2, scope: !386, inlinedAt: !414)
!451 = !{!"llvm.loop.mustprogress"}
!452 = !DILocation(line: 64, column: 17, scope: !406, inlinedAt: !414)
!453 = !DILocation(line: 0, scope: !406, inlinedAt: !414)
!454 = !DILocation(line: 65, column: 7, scope: !455, inlinedAt: !414)
!455 = distinct !DILexicalBlock(scope: !406, file: !3, line: 65, column: 6)
!456 = !DILocation(line: 65, column: 6, scope: !406, inlinedAt: !414)
!457 = !DILocation(line: 66, column: 13, scope: !458, inlinedAt: !414)
!458 = distinct !DILexicalBlock(scope: !406, file: !3, line: 66, column: 6)
!459 = !DILocation(line: 67, column: 20, scope: !406, inlinedAt: !414)
!460 = !DILocation(line: 67, column: 3, scope: !406, inlinedAt: !414)
!461 = !DILocation(line: 67, column: 18, scope: !406, inlinedAt: !414)
!462 = !DILocation(line: 74, column: 1, scope: !386, inlinedAt: !414)
!463 = !DILocation(line: 77, column: 1, scope: !386, inlinedAt: !414)
!464 = !DILocation(line: 122, column: 7, scope: !214)
!465 = !DILocation(line: 71, column: 2, scope: !408, inlinedAt: !414)
!466 = !DILocation(line: 71, column: 2, scope: !386, inlinedAt: !414)
!467 = !DILocation(line: 122, column: 11, scope: !468)
!468 = distinct !DILexicalBlock(scope: !214, file: !3, line: 122, column: 7)
!469 = !{!470, !229, i64 0}
!470 = !{!"qname_lpm_key", !229, i64 0, !230, i64 4}
!471 = !DILocation(line: 122, column: 21, scope: !468)
!472 = !DILocation(line: 0, scope: !214)
!473 = !DILocation(line: 127, column: 16, scope: !220)
!474 = !DILocation(line: 127, column: 14, scope: !220)
!475 = !DILocation(line: 127, column: 7, scope: !214)
!476 = !DILocation(line: 131, column: 5, scope: !218)
!477 = !{!229, !229, i64 0}
!478 = !DILocation(line: 131, column: 5, scope: !219)
!479 = !DILocation(line: 133, column: 5, scope: !219)
!480 = !DILocation(line: 135, column: 3, scope: !215)
!481 = !DILocation(line: 142, column: 1, scope: !113)
