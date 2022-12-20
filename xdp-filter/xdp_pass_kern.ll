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

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@dns_block_suffixes = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !58
@__const.get_qname_lpm_key.____fmt = private unnamed_addr constant [15 x i8] c"rev suffix:%s\0A\00", align 1
@__const.get_qname_lpm_key.____fmt.1 = private unnamed_addr constant [10 x i8] c"q len:%d\0A\00", align 1
@llvm.compiler.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon* @dns_block_suffixes to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_patch_ports_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_patch_ports_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_patch_ports" !dbg !106 {
  %2 = alloca [15 x i8], align 1
  %3 = alloca [10 x i8], align 1
  %4 = alloca %struct.qname_lpm_key, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !119, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata i32 2, metadata !120, metadata !DIExpression()), !dbg !207
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !208
  %6 = load i32, i32* %5, align 4, !dbg !208, !tbaa !209
  %7 = zext i32 %6 to i64, !dbg !214
  %8 = inttoptr i64 %7 to i8*, !dbg !215
  call void @llvm.dbg.value(metadata i8* %8, metadata !195, metadata !DIExpression()), !dbg !207
  %9 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !216
  %10 = load i32, i32* %9, align 4, !dbg !216, !tbaa !217
  %11 = zext i32 %10 to i64, !dbg !218
  %12 = inttoptr i64 %11 to i8*, !dbg !219
  call void @llvm.dbg.value(metadata i8* %12, metadata !196, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata i8* %12, metadata !197, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !123, metadata !DIExpression(DW_OP_deref)), !dbg !207
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !220, metadata !DIExpression()) #8, !dbg !229
  call void @llvm.dbg.value(metadata i8* %8, metadata !227, metadata !DIExpression()) #8, !dbg !229
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !228, metadata !DIExpression()) #8, !dbg !229
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !231, metadata !DIExpression()) #8, !dbg !256
  call void @llvm.dbg.value(metadata i8* %8, metadata !243, metadata !DIExpression()) #8, !dbg !256
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !244, metadata !DIExpression()) #8, !dbg !256
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !245, metadata !DIExpression()) #8, !dbg !256
  call void @llvm.dbg.value(metadata i8* %12, metadata !246, metadata !DIExpression()) #8, !dbg !256
  call void @llvm.dbg.value(metadata i32 14, metadata !247, metadata !DIExpression()) #8, !dbg !256
  %13 = getelementptr i8, i8* %12, i64 14, !dbg !258
  %14 = icmp ugt i8* %13, %8, !dbg !260
  br i1 %14, label %161, label %15, !dbg !261

15:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %12, metadata !246, metadata !DIExpression()) #8, !dbg !256
  call void @llvm.dbg.value(metadata i8* %13, metadata !197, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata i8* %13, metadata !248, metadata !DIExpression()) #8, !dbg !256
  %16 = getelementptr inbounds i8, i8* %12, i64 12, !dbg !262
  %17 = bitcast i8* %16 to i16*, !dbg !262
  call void @llvm.dbg.value(metadata i16 undef, metadata !254, metadata !DIExpression()) #8, !dbg !256
  call void @llvm.dbg.value(metadata i32 0, metadata !255, metadata !DIExpression()) #8, !dbg !256
  %18 = inttoptr i64 %7 to %struct.vlan_hdr*
  %19 = load i16, i16* %17, align 1, !dbg !256, !tbaa !263
  call void @llvm.dbg.value(metadata i16 %19, metadata !254, metadata !DIExpression()) #8, !dbg !256
  call void @llvm.dbg.value(metadata i16 %19, metadata !265, metadata !DIExpression()) #8, !dbg !270
  %20 = icmp eq i16 %19, 129, !dbg !276
  %21 = icmp ne i16 %19, -22392, !dbg !277
  %22 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %20) #8
  %23 = xor i1 %22, true, !dbg !277
  %24 = select i1 %23, i1 %21, i1 false, !dbg !277
  br i1 %24, label %46, label %25, !dbg !278

25:                                               ; preds = %15
  %26 = getelementptr i8, i8* %12, i64 18, !dbg !279
  %27 = bitcast i8* %26 to %struct.vlan_hdr*, !dbg !279
  %28 = icmp ugt %struct.vlan_hdr* %27, %18, !dbg !281
  br i1 %28, label %46, label %29, !dbg !282

29:                                               ; preds = %25
  call void @llvm.dbg.value(metadata i16 undef, metadata !254, metadata !DIExpression()) #8, !dbg !256
  %30 = getelementptr i8, i8* %12, i64 16, !dbg !283
  %31 = bitcast i8* %30 to i16*, !dbg !283
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %27, metadata !248, metadata !DIExpression()) #8, !dbg !256
  call void @llvm.dbg.value(metadata i32 1, metadata !255, metadata !DIExpression()) #8, !dbg !256
  %32 = load i16, i16* %31, align 1, !dbg !256, !tbaa !263
  call void @llvm.dbg.value(metadata i16 %32, metadata !254, metadata !DIExpression()) #8, !dbg !256
  call void @llvm.dbg.value(metadata i16 %32, metadata !265, metadata !DIExpression()) #8, !dbg !270
  %33 = icmp eq i16 %32, 129, !dbg !276
  %34 = icmp ne i16 %32, -22392, !dbg !277
  %35 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %33) #8
  %36 = xor i1 %35, true, !dbg !277
  %37 = select i1 %36, i1 %34, i1 false, !dbg !277
  br i1 %37, label %46, label %38, !dbg !278

38:                                               ; preds = %29
  %39 = getelementptr i8, i8* %12, i64 22, !dbg !279
  %40 = bitcast i8* %39 to %struct.vlan_hdr*, !dbg !279
  %41 = icmp ugt %struct.vlan_hdr* %40, %18, !dbg !281
  br i1 %41, label %46, label %42, !dbg !282

42:                                               ; preds = %38
  call void @llvm.dbg.value(metadata i16 undef, metadata !254, metadata !DIExpression()) #8, !dbg !256
  %43 = getelementptr i8, i8* %12, i64 20, !dbg !283
  %44 = bitcast i8* %43 to i16*, !dbg !283
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %40, metadata !248, metadata !DIExpression()) #8, !dbg !256
  call void @llvm.dbg.value(metadata i32 2, metadata !255, metadata !DIExpression()) #8, !dbg !256
  %45 = load i16, i16* %44, align 1, !dbg !256, !tbaa !263
  call void @llvm.dbg.value(metadata i16 %45, metadata !254, metadata !DIExpression()) #8, !dbg !256
  br label %46

46:                                               ; preds = %15, %25, %29, %38, %42
  %47 = phi i8* [ %13, %25 ], [ %13, %15 ], [ %26, %29 ], [ %26, %38 ], [ %39, %42 ], !dbg !256
  %48 = phi i16 [ %19, %25 ], [ %19, %15 ], [ %32, %29 ], [ %32, %38 ], [ %45, %42 ], !dbg !256
  call void @llvm.dbg.value(metadata i8* %47, metadata !197, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata i16 %48, metadata !121, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !207
  switch i16 %48, label %161 [
    i16 8, label %49
    i16 -8826, label %61
  ], !dbg !284

49:                                               ; preds = %46
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !136, metadata !DIExpression(DW_OP_deref)), !dbg !207
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !285, metadata !DIExpression()), !dbg !295
  call void @llvm.dbg.value(metadata i8* %8, metadata !291, metadata !DIExpression()), !dbg !295
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !292, metadata !DIExpression()), !dbg !295
  call void @llvm.dbg.value(metadata i8* %47, metadata !293, metadata !DIExpression()), !dbg !295
  %50 = getelementptr inbounds i8, i8* %47, i64 20, !dbg !299
  %51 = icmp ugt i8* %50, %8, !dbg !301
  br i1 %51, label %161, label %52, !dbg !302

52:                                               ; preds = %49
  %53 = load i8, i8* %47, align 4, !dbg !303
  %54 = shl i8 %53, 2, !dbg !304
  %55 = and i8 %54, 60, !dbg !304
  call void @llvm.dbg.value(metadata i8 %55, metadata !294, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !295
  %56 = icmp ult i8 %55, 20, !dbg !305
  br i1 %56, label %161, label %57, !dbg !307

57:                                               ; preds = %52
  %58 = zext i8 %55 to i64
  call void @llvm.dbg.value(metadata i64 %58, metadata !294, metadata !DIExpression()), !dbg !295
  %59 = getelementptr i8, i8* %47, i64 %58, !dbg !308
  %60 = icmp ugt i8* %59, %8, !dbg !310
  br i1 %60, label %161, label %66, !dbg !311

61:                                               ; preds = %46
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !312, metadata !DIExpression()), !dbg !321
  call void @llvm.dbg.value(metadata i8* %8, metadata !318, metadata !DIExpression()), !dbg !321
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !319, metadata !DIExpression()), !dbg !321
  call void @llvm.dbg.value(metadata i8* %47, metadata !320, metadata !DIExpression()), !dbg !321
  %62 = getelementptr inbounds i8, i8* %47, i64 40, !dbg !325
  %63 = bitcast i8* %62 to %struct.ipv6hdr*, !dbg !325
  %64 = inttoptr i64 %7 to %struct.ipv6hdr*, !dbg !327
  %65 = icmp ugt %struct.ipv6hdr* %63, %64, !dbg !328
  br i1 %65, label %161, label %66, !dbg !329

66:                                               ; preds = %61, %57
  %67 = phi i64 [ 9, %57 ], [ 6, %61 ]
  %68 = phi i8* [ %59, %57 ], [ %62, %61 ], !dbg !330
  %69 = getelementptr inbounds i8, i8* %47, i64 %67, !dbg !331
  %70 = load i8, i8* %69, align 1, !dbg !331, !tbaa !332
  call void @llvm.dbg.value(metadata i8* %68, metadata !197, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata i8 %70, metadata !122, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !207
  %71 = icmp eq i8 %70, 17, !dbg !333
  br i1 %71, label %72, label %161, !dbg !334

72:                                               ; preds = %66
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !335, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata i8* %8, metadata !341, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata %struct.udphdr** undef, metadata !342, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata i8* %68, metadata !344, metadata !DIExpression()), !dbg !345
  %73 = getelementptr inbounds i8, i8* %68, i64 8, !dbg !347
  %74 = bitcast i8* %73 to %struct.udphdr*, !dbg !347
  %75 = inttoptr i64 %7 to %struct.udphdr*, !dbg !349
  %76 = icmp ugt %struct.udphdr* %74, %75, !dbg !350
  %77 = select i1 %76, i8* %68, i8* %73, !dbg !351
  call void @llvm.dbg.value(metadata i8* %77, metadata !197, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata i32 undef, metadata !202, metadata !DIExpression()), !dbg !352
  %78 = getelementptr inbounds i8, i8* %77, i64 12, !dbg !353
  %79 = icmp ugt i8* %78, %8, !dbg !355
  br i1 %79, label %161, label %80, !dbg !356

80:                                               ; preds = %72
  %81 = getelementptr inbounds i8, i8* %77, i64 4, !dbg !357
  %82 = bitcast i8* %81 to i16*, !dbg !357
  %83 = load i16, i16* %82, align 2, !dbg !358, !tbaa !263
  call void @llvm.dbg.value(metadata i16 %83, metadata !205, metadata !DIExpression()), !dbg !352
  %84 = icmp eq i16 %83, 0, !dbg !359
  br i1 %84, label %161, label %85, !dbg !361

85:                                               ; preds = %80
  %86 = bitcast %struct.qname_lpm_key* %4 to i8*, !dbg !362
  call void @llvm.lifetime.start.p0i8(i64 68, i8* nonnull %86) #8, !dbg !362
  tail call void @llvm.experimental.noalias.scope.decl(metadata !364), !dbg !362
  call void @llvm.dbg.value(metadata i8* %78, metadata !367, metadata !DIExpression()) #8, !dbg !393
  call void @llvm.dbg.value(metadata i8* %8, metadata !372, metadata !DIExpression()) #8, !dbg !393
  call void @llvm.dbg.declare(metadata %struct.qname_lpm_key* %4, metadata !373, metadata !DIExpression()) #8, !dbg !395
  %87 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %4, i64 0, i32 1, i64 0, !dbg !395
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(68) %87, i8 0, i64 64, i1 false) #8, !dbg !395, !alias.scope !364
  %88 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %4, i64 0, i32 0, !dbg !395
  store i32 64, i32* %88, align 4, !dbg !395, !alias.scope !364
  call void @llvm.dbg.value(metadata i32 0, metadata !374, metadata !DIExpression()) #8, !dbg !393
  call void @llvm.dbg.value(metadata i8 0, metadata !375, metadata !DIExpression()) #8, !dbg !393
  br label %89, !dbg !396

89:                                               ; preds = %98, %85
  %90 = phi i32 [ 0, %85 ], [ %101, %98 ]
  call void @llvm.dbg.value(metadata i32 %90, metadata !374, metadata !DIExpression()) #8, !dbg !393
  %91 = sext i32 %90 to i64, !dbg !397
  %92 = getelementptr inbounds i8, i8* %78, i64 %91, !dbg !397
  %93 = getelementptr inbounds i8, i8* %92, i64 1, !dbg !400
  %94 = icmp ugt i8* %93, %8, !dbg !401
  br i1 %94, label %160, label %95, !dbg !402

95:                                               ; preds = %89
  %96 = load i8, i8* %92, align 1, !dbg !403, !tbaa !332, !noalias !364
  call void @llvm.dbg.value(metadata i8 %96, metadata !375, metadata !DIExpression()) #8, !dbg !393
  %97 = icmp eq i8 %96, 0, !dbg !404
  br i1 %97, label %105, label %98, !dbg !406

98:                                               ; preds = %95
  %99 = sext i8 %96 to i32, !dbg !407
  %100 = add i32 %90, 1, !dbg !408
  %101 = add i32 %100, %99, !dbg !409
  call void @llvm.dbg.value(metadata i32 %101, metadata !374, metadata !DIExpression()) #8, !dbg !393
  %102 = icmp slt i32 %101, 64, !dbg !410
  br i1 %102, label %89, label %103, !dbg !396, !llvm.loop !411

103:                                              ; preds = %98
  call void @llvm.dbg.value(metadata i32 undef, metadata !374, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #8, !dbg !393
  %104 = add nsw i32 %101, -2, !dbg !414
  call void @llvm.dbg.value(metadata i32 0, metadata !377, metadata !DIExpression()) #8, !dbg !393
  call void @llvm.dbg.value(metadata i8 undef, metadata !378, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_plus_uconst, 1, DW_OP_stack_value)) #8, !dbg !393
  br label %108, !dbg !415

105:                                              ; preds = %95
  call void @llvm.dbg.value(metadata i32 %90, metadata !374, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #8, !dbg !393
  %106 = add nsw i32 %90, -2, !dbg !414
  call void @llvm.dbg.value(metadata i32 %106, metadata !376, metadata !DIExpression()) #8, !dbg !393
  call void @llvm.dbg.value(metadata i32 0, metadata !377, metadata !DIExpression()) #8, !dbg !393
  call void @llvm.dbg.value(metadata i8 undef, metadata !378, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_plus_uconst, 1, DW_OP_stack_value)) #8, !dbg !393
  %107 = icmp sgt i32 %90, 0, !dbg !416
  br i1 %107, label %108, label %154, !dbg !415

108:                                              ; preds = %105, %103
  %109 = phi i32 [ %104, %103 ], [ %106, %105 ]
  %110 = phi i32 [ %101, %103 ], [ %90, %105 ]
  %111 = load i8, i8* %78, align 1, !dbg !417, !tbaa !332, !noalias !364
  call void @llvm.dbg.value(metadata i8 %111, metadata !378, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_plus_uconst, 1, DW_OP_stack_value)) #8, !dbg !393
  %112 = sext i8 %111 to i32, !dbg !417
  call void @llvm.dbg.value(metadata i32 %112, metadata !378, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #8, !dbg !393
  br label %113, !dbg !418

113:                                              ; preds = %146, %108
  %114 = phi i32 [ %141, %146 ], [ 0, %108 ]
  %115 = phi i32 [ %149, %146 ], [ %112, %108 ]
  call void @llvm.dbg.value(metadata i32 %114, metadata !377, metadata !DIExpression()) #8, !dbg !393
  call void @llvm.dbg.value(metadata i32 %115, metadata !378, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #8, !dbg !393
  %116 = add nsw i32 %114, 1, !dbg !419
  call void @llvm.dbg.value(metadata i32 %116, metadata !377, metadata !DIExpression()) #8, !dbg !393
  %117 = icmp slt i32 %114, %115, !dbg !420
  %118 = icmp slt i32 %114, 63, !dbg !421
  %119 = and i1 %118, %117, !dbg !421
  br i1 %119, label %120, label %140, !dbg !418

120:                                              ; preds = %113
  %121 = sext i32 %114 to i64, !dbg !422
  %122 = sext i32 %115 to i64, !dbg !422
  call void @llvm.dbg.value(metadata i32 0, metadata !379, metadata !DIExpression()) #8, !dbg !423
  %123 = add nsw i64 %121, 2, !dbg !424
  %124 = getelementptr inbounds i8, i8* %78, i64 %123, !dbg !424
  %125 = icmp ugt i8* %124, %8, !dbg !426
  br i1 %125, label %160, label %126, !dbg !422

126:                                              ; preds = %120
  %127 = add nsw i64 %121, 1, !dbg !422
  br label %132, !dbg !418

128:                                              ; preds = %132
  call void @llvm.dbg.value(metadata i32 0, metadata !379, metadata !DIExpression()) #8, !dbg !423
  %129 = add nsw i64 %133, 2, !dbg !424
  %130 = getelementptr inbounds i8, i8* %78, i64 %129, !dbg !424
  %131 = icmp ugt i8* %130, %8, !dbg !426
  br i1 %131, label %160, label %132, !dbg !422

132:                                              ; preds = %126, %128
  %133 = phi i64 [ %134, %128 ], [ %127, %126 ]
  call void @llvm.dbg.value(metadata i64 %133, metadata !377, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #8, !dbg !393
  %134 = add nsw i64 %133, 1, !dbg !419
  call void @llvm.dbg.value(metadata i64 %134, metadata !377, metadata !DIExpression()) #8, !dbg !393
  %135 = icmp slt i64 %133, %122, !dbg !420
  %136 = icmp slt i64 %133, 63, !dbg !421
  %137 = and i1 %135, %136, !dbg !421
  br i1 %137, label %128, label %138, !dbg !418

138:                                              ; preds = %132
  %139 = trunc i64 %134 to i32, !dbg !427
  br label %140, !dbg !427

140:                                              ; preds = %138, %113
  %141 = phi i32 [ %116, %113 ], [ %139, %138 ], !dbg !419
  call void @llvm.dbg.value(metadata i32 0, metadata !382, metadata !DIExpression()) #8, !dbg !428
  %142 = sext i32 %141 to i64, !dbg !429
  %143 = getelementptr inbounds i8, i8* %78, i64 %142, !dbg !429
  %144 = getelementptr inbounds i8, i8* %143, i64 1, !dbg !431
  %145 = icmp ugt i8* %144, %8, !dbg !432
  br i1 %145, label %160, label %146, !dbg !433

146:                                              ; preds = %140
  %147 = load i8, i8* %143, align 1, !dbg !434, !tbaa !332, !noalias !364
  %148 = sext i8 %147 to i32, !dbg !434
  %149 = add nsw i32 %141, %148, !dbg !435
  call void @llvm.dbg.value(metadata i32 %141, metadata !377, metadata !DIExpression()) #8, !dbg !393
  call void @llvm.dbg.value(metadata i32 %149, metadata !378, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #8, !dbg !393
  %150 = icmp slt i32 %141, %110, !dbg !416
  %151 = icmp slt i32 %141, 64, !dbg !436
  %152 = and i1 %150, %151, !dbg !436
  br i1 %152, label %113, label %153, !dbg !415

153:                                              ; preds = %146
  store i8 46, i8* %87, align 4, !tbaa !332, !alias.scope !364
  br label %154, !dbg !437

154:                                              ; preds = %153, %105
  %155 = phi i32 [ %106, %105 ], [ %109, %153 ]
  %156 = getelementptr inbounds [15 x i8], [15 x i8]* %2, i64 0, i64 0, !dbg !437
  call void @llvm.lifetime.start.p0i8(i64 15, i8* nonnull %156) #8, !dbg !437, !noalias !364
  call void @llvm.dbg.declare(metadata [15 x i8]* %2, metadata !383, metadata !DIExpression()) #8, !dbg !437
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(15) %156, i8* noundef nonnull align 1 dereferenceable(15) getelementptr inbounds ([15 x i8], [15 x i8]* @__const.get_qname_lpm_key.____fmt, i64 0, i64 0), i64 15, i1 false) #8, !dbg !437, !noalias !364
  %157 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %156, i32 15, i8* nonnull %87) #8, !dbg !437
  call void @llvm.lifetime.end.p0i8(i64 15, i8* nonnull %156) #8, !dbg !438, !noalias !364
  %158 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 0, !dbg !439
  call void @llvm.lifetime.start.p0i8(i64 10, i8* nonnull %158) #8, !dbg !439, !noalias !364
  call void @llvm.dbg.declare(metadata [10 x i8]* %3, metadata !388, metadata !DIExpression()) #8, !dbg !439
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(10) %158, i8* noundef nonnull align 1 dereferenceable(10) getelementptr inbounds ([10 x i8], [10 x i8]* @__const.get_qname_lpm_key.____fmt.1, i64 0, i64 0), i64 10, i1 false) #8, !dbg !439
  %159 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %158, i32 10, i32 %155) #8, !dbg !439
  call void @llvm.lifetime.end.p0i8(i64 10, i8* nonnull %158) #8, !dbg !440, !noalias !364
  br label %160, !dbg !441

160:                                              ; preds = %89, %140, %120, %128, %154
  call void @llvm.lifetime.end.p0i8(i64 68, i8* nonnull %86) #8, !dbg !362
  br label %161, !dbg !442

161:                                              ; preds = %61, %57, %52, %49, %1, %66, %46, %80, %160, %72
  %162 = phi i32 [ 2, %66 ], [ 2, %46 ], [ 2, %80 ], [ 2, %160 ], [ 2, %72 ], [ 0, %1 ], [ 2, %49 ], [ 2, %52 ], [ 2, %57 ], [ 2, %61 ]
  ret i32 %162, !dbg !443
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #5

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #6

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.experimental.noalias.scope.decl(metadata) #7

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nounwind readnone }
attributes #7 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!101, !102, !103, !104}
!llvm.ident = !{!105}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 161, type: !98, isLocal: false, isDefinition: true)
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
!57 = !{!0, !58, !90}
!58 = !DIGlobalVariableExpression(var: !59, expr: !DIExpression())
!59 = distinct !DIGlobalVariable(name: "dns_block_suffixes", scope: !2, file: !3, line: 36, type: !60, isLocal: false, isDefinition: true)
!60 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 30, size: 320, elements: !61)
!61 = !{!62, !68, !78, !80, !85}
!62 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !60, file: !3, line: 31, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 352, elements: !66)
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !{!67}
!67 = !DISubrange(count: 11)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !60, file: !3, line: 32, baseType: !69, size: 64, offset: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "qname_lpm_key", file: !3, line: 25, size: 544, elements: !71)
!71 = !{!72, !74}
!72 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !70, file: !3, line: 26, baseType: !73, size: 32)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !49, line: 27, baseType: !7)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "rev_suf", scope: !70, file: !3, line: 27, baseType: !75, size: 512, offset: 32)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 512, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 64)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !60, file: !3, line: 33, baseType: !79, size: 64, offset: 128)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !60, file: !3, line: 34, baseType: !81, size: 64, offset: 192)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 32, elements: !83)
!83 = !{!84}
!84 = !DISubrange(count: 1)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !60, file: !3, line: 35, baseType: !86, size: 64, offset: 256)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 8160, elements: !88)
!88 = !{!89}
!89 = !DISubrange(count: 255)
!90 = !DIGlobalVariableExpression(var: !91, expr: !DIExpression())
!91 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !92, line: 152, type: !93, isLocal: true, isDefinition: true)
!92 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/root/qname_intercepter/xdp-filter")
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DISubroutineType(types: !95)
!95 = !{!65, !96, !73, null}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !56)
!98 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 32, elements: !99)
!99 = !{!100}
!100 = !DISubrange(count: 4)
!101 = !{i32 7, !"Dwarf Version", i32 4}
!102 = !{i32 2, !"Debug Info Version", i32 3}
!103 = !{i32 1, !"wchar_size", i32 4}
!104 = !{i32 7, !"frame-pointer", i32 2}
!105 = !{!"Alpine clang version 13.0.1"}
!106 = distinct !DISubprogram(name: "xdp_patch_ports_func", scope: !3, file: !3, line: 113, type: !107, scopeLine: 114, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !118)
!107 = !DISubroutineType(types: !108)
!108 = !{!65, !109}
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5508, size: 192, elements: !111)
!111 = !{!112, !113, !114, !115, !116, !117}
!112 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !110, file: !6, line: 5509, baseType: !73, size: 32)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !110, file: !6, line: 5510, baseType: !73, size: 32, offset: 32)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !110, file: !6, line: 5511, baseType: !73, size: 32, offset: 64)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !110, file: !6, line: 5513, baseType: !73, size: 32, offset: 96)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !110, file: !6, line: 5514, baseType: !73, size: 32, offset: 128)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !110, file: !6, line: 5516, baseType: !73, size: 32, offset: 160)
!118 = !{!119, !120, !121, !122, !123, !136, !154, !186, !195, !196, !197, !202, !205, !206}
!119 = !DILocalVariable(name: "ctx", arg: 1, scope: !106, file: !3, line: 113, type: !109)
!120 = !DILocalVariable(name: "action", scope: !106, file: !3, line: 115, type: !65)
!121 = !DILocalVariable(name: "eth_type", scope: !106, file: !3, line: 116, type: !65)
!122 = !DILocalVariable(name: "ip_type", scope: !106, file: !3, line: 116, type: !65)
!123 = !DILocalVariable(name: "eth", scope: !106, file: !3, line: 117, type: !124)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !125, size: 64)
!125 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !126, line: 169, size: 112, elements: !127)
!126 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!127 = !{!128, !132, !133}
!128 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !125, file: !126, line: 170, baseType: !129, size: 48)
!129 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 48, elements: !130)
!130 = !{!131}
!131 = !DISubrange(count: 6)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !125, file: !126, line: 171, baseType: !129, size: 48, offset: 48)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !125, file: !126, line: 172, baseType: !134, size: 16, offset: 96)
!134 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !135, line: 25, baseType: !48)
!135 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!136 = !DILocalVariable(name: "iphdr", scope: !106, file: !3, line: 118, type: !137)
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 64)
!138 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !139, line: 86, size: 160, elements: !140)
!139 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!140 = !{!141, !142, !143, !144, !145, !146, !147, !148, !149, !151, !153}
!141 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !138, file: !139, line: 88, baseType: !52, size: 4, flags: DIFlagBitField, extraData: i64 0)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !138, file: !139, line: 89, baseType: !52, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !138, file: !139, line: 96, baseType: !52, size: 8, offset: 8)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !138, file: !139, line: 97, baseType: !134, size: 16, offset: 16)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !138, file: !139, line: 98, baseType: !134, size: 16, offset: 32)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !138, file: !139, line: 99, baseType: !134, size: 16, offset: 48)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !138, file: !139, line: 100, baseType: !52, size: 8, offset: 64)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !138, file: !139, line: 101, baseType: !52, size: 8, offset: 72)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !138, file: !139, line: 102, baseType: !150, size: 16, offset: 80)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !135, line: 31, baseType: !48)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !138, file: !139, line: 103, baseType: !152, size: 32, offset: 96)
!152 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !135, line: 27, baseType: !73)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !138, file: !139, line: 104, baseType: !152, size: 32, offset: 128)
!154 = !DILocalVariable(name: "ipv6hdr", scope: !106, file: !3, line: 119, type: !155)
!155 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !156, size: 64)
!156 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !157, line: 117, size: 320, elements: !158)
!157 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "")
!158 = !{!159, !160, !161, !165, !166, !167, !168, !185}
!159 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !156, file: !157, line: 119, baseType: !52, size: 4, flags: DIFlagBitField, extraData: i64 0)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !156, file: !157, line: 120, baseType: !52, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !156, file: !157, line: 127, baseType: !162, size: 24, offset: 8)
!162 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 24, elements: !163)
!163 = !{!164}
!164 = !DISubrange(count: 3)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !156, file: !157, line: 129, baseType: !134, size: 16, offset: 32)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !156, file: !157, line: 130, baseType: !52, size: 8, offset: 48)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !156, file: !157, line: 131, baseType: !52, size: 8, offset: 56)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !156, file: !157, line: 133, baseType: !169, size: 128, offset: 64)
!169 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !170, line: 33, size: 128, elements: !171)
!170 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "")
!171 = !{!172}
!172 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !169, file: !170, line: 40, baseType: !173, size: 128)
!173 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !169, file: !170, line: 34, size: 128, elements: !174)
!174 = !{!175, !179, !183}
!175 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !173, file: !170, line: 35, baseType: !176, size: 128)
!176 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 128, elements: !177)
!177 = !{!178}
!178 = !DISubrange(count: 16)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !173, file: !170, line: 37, baseType: !180, size: 128)
!180 = !DICompositeType(tag: DW_TAG_array_type, baseType: !134, size: 128, elements: !181)
!181 = !{!182}
!182 = !DISubrange(count: 8)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !173, file: !170, line: 38, baseType: !184, size: 128)
!184 = !DICompositeType(tag: DW_TAG_array_type, baseType: !152, size: 128, elements: !99)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !156, file: !157, line: 134, baseType: !169, size: 128, offset: 192)
!186 = !DILocalVariable(name: "udphdr", scope: !106, file: !3, line: 120, type: !187)
!187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !188, size: 64)
!188 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !189, line: 23, size: 64, elements: !190)
!189 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "")
!190 = !{!191, !192, !193, !194}
!191 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !188, file: !189, line: 24, baseType: !134, size: 16)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !188, file: !189, line: 25, baseType: !134, size: 16, offset: 16)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !188, file: !189, line: 26, baseType: !134, size: 16, offset: 32)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !188, file: !189, line: 27, baseType: !150, size: 16, offset: 48)
!195 = !DILocalVariable(name: "data_end", scope: !106, file: !3, line: 121, type: !46)
!196 = !DILocalVariable(name: "data", scope: !106, file: !3, line: 122, type: !46)
!197 = !DILocalVariable(name: "nh", scope: !106, file: !3, line: 123, type: !198)
!198 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !199, line: 33, size: 64, elements: !200)
!199 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/root/qname_intercepter/xdp-filter")
!200 = !{!201}
!201 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !198, file: !199, line: 34, baseType: !46, size: 64)
!202 = !DILocalVariable(name: "udppld", scope: !203, file: !3, line: 140, type: !73)
!203 = distinct !DILexicalBlock(scope: !204, file: !3, line: 139, column: 30)
!204 = distinct !DILexicalBlock(scope: !106, file: !3, line: 139, column: 6)
!205 = !DILocalVariable(name: "qrn", scope: !203, file: !3, line: 149, type: !48)
!206 = !DILabel(scope: !106, name: "out", file: !3, line: 157)
!207 = !DILocation(line: 0, scope: !106)
!208 = !DILocation(line: 121, column: 38, scope: !106)
!209 = !{!210, !211, i64 4}
!210 = !{!"xdp_md", !211, i64 0, !211, i64 4, !211, i64 8, !211, i64 12, !211, i64 16, !211, i64 20}
!211 = !{!"int", !212, i64 0}
!212 = !{!"omnipotent char", !213, i64 0}
!213 = !{!"Simple C/C++ TBAA"}
!214 = !DILocation(line: 121, column: 27, scope: !106)
!215 = !DILocation(line: 121, column: 19, scope: !106)
!216 = !DILocation(line: 122, column: 34, scope: !106)
!217 = !{!210, !211, i64 0}
!218 = !DILocation(line: 122, column: 23, scope: !106)
!219 = !DILocation(line: 122, column: 15, scope: !106)
!220 = !DILocalVariable(name: "nh", arg: 1, scope: !221, file: !199, line: 124, type: !224)
!221 = distinct !DISubprogram(name: "parse_ethhdr", scope: !199, file: !199, line: 124, type: !222, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !226)
!222 = !DISubroutineType(types: !223)
!223 = !{!65, !224, !46, !225}
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !198, size: 64)
!225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!226 = !{!220, !227, !228}
!227 = !DILocalVariable(name: "data_end", arg: 2, scope: !221, file: !199, line: 125, type: !46)
!228 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !221, file: !199, line: 126, type: !225)
!229 = !DILocation(line: 0, scope: !221, inlinedAt: !230)
!230 = distinct !DILocation(line: 125, column: 13, scope: !106)
!231 = !DILocalVariable(name: "nh", arg: 1, scope: !232, file: !199, line: 79, type: !224)
!232 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !199, file: !199, line: 79, type: !233, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !242)
!233 = !DISubroutineType(types: !234)
!234 = !{!65, !224, !46, !225, !235}
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64)
!236 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !199, line: 64, size: 32, elements: !237)
!237 = !{!238}
!238 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !236, file: !199, line: 65, baseType: !239, size: 32)
!239 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 32, elements: !240)
!240 = !{!241}
!241 = !DISubrange(count: 2)
!242 = !{!231, !243, !244, !245, !246, !247, !248, !254, !255}
!243 = !DILocalVariable(name: "data_end", arg: 2, scope: !232, file: !199, line: 80, type: !46)
!244 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !232, file: !199, line: 81, type: !225)
!245 = !DILocalVariable(name: "vlans", arg: 4, scope: !232, file: !199, line: 82, type: !235)
!246 = !DILocalVariable(name: "eth", scope: !232, file: !199, line: 84, type: !124)
!247 = !DILocalVariable(name: "hdrsize", scope: !232, file: !199, line: 85, type: !65)
!248 = !DILocalVariable(name: "vlh", scope: !232, file: !199, line: 86, type: !249)
!249 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !250, size: 64)
!250 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !199, line: 42, size: 32, elements: !251)
!251 = !{!252, !253}
!252 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !250, file: !199, line: 43, baseType: !134, size: 16)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !250, file: !199, line: 44, baseType: !134, size: 16, offset: 16)
!254 = !DILocalVariable(name: "h_proto", scope: !232, file: !199, line: 87, type: !48)
!255 = !DILocalVariable(name: "i", scope: !232, file: !199, line: 88, type: !65)
!256 = !DILocation(line: 0, scope: !232, inlinedAt: !257)
!257 = distinct !DILocation(line: 129, column: 9, scope: !221, inlinedAt: !230)
!258 = !DILocation(line: 93, column: 14, scope: !259, inlinedAt: !257)
!259 = distinct !DILexicalBlock(scope: !232, file: !199, line: 93, column: 6)
!260 = !DILocation(line: 93, column: 24, scope: !259, inlinedAt: !257)
!261 = !DILocation(line: 93, column: 6, scope: !232, inlinedAt: !257)
!262 = !DILocation(line: 99, column: 17, scope: !232, inlinedAt: !257)
!263 = !{!264, !264, i64 0}
!264 = !{!"short", !212, i64 0}
!265 = !DILocalVariable(name: "h_proto", arg: 1, scope: !266, file: !199, line: 68, type: !48)
!266 = distinct !DISubprogram(name: "proto_is_vlan", scope: !199, file: !199, line: 68, type: !267, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !269)
!267 = !DISubroutineType(types: !268)
!268 = !{!65, !48}
!269 = !{!265}
!270 = !DILocation(line: 0, scope: !266, inlinedAt: !271)
!271 = distinct !DILocation(line: 106, column: 8, scope: !272, inlinedAt: !257)
!272 = distinct !DILexicalBlock(scope: !273, file: !199, line: 106, column: 7)
!273 = distinct !DILexicalBlock(scope: !274, file: !199, line: 105, column: 39)
!274 = distinct !DILexicalBlock(scope: !275, file: !199, line: 105, column: 2)
!275 = distinct !DILexicalBlock(scope: !232, file: !199, line: 105, column: 2)
!276 = !DILocation(line: 70, column: 20, scope: !266, inlinedAt: !271)
!277 = !DILocation(line: 70, column: 46, scope: !266, inlinedAt: !271)
!278 = !DILocation(line: 106, column: 7, scope: !273, inlinedAt: !257)
!279 = !DILocation(line: 109, column: 11, scope: !280, inlinedAt: !257)
!280 = distinct !DILexicalBlock(scope: !273, file: !199, line: 109, column: 7)
!281 = !DILocation(line: 109, column: 15, scope: !280, inlinedAt: !257)
!282 = !DILocation(line: 109, column: 7, scope: !273, inlinedAt: !257)
!283 = !DILocation(line: 112, column: 18, scope: !273, inlinedAt: !257)
!284 = !DILocation(line: 131, column: 6, scope: !106)
!285 = !DILocalVariable(name: "nh", arg: 1, scope: !286, file: !199, line: 151, type: !224)
!286 = distinct !DISubprogram(name: "parse_iphdr", scope: !199, file: !199, line: 151, type: !287, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !290)
!287 = !DISubroutineType(types: !288)
!288 = !{!65, !224, !46, !289}
!289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64)
!290 = !{!285, !291, !292, !293, !294}
!291 = !DILocalVariable(name: "data_end", arg: 2, scope: !286, file: !199, line: 152, type: !46)
!292 = !DILocalVariable(name: "iphdr", arg: 3, scope: !286, file: !199, line: 153, type: !289)
!293 = !DILocalVariable(name: "iph", scope: !286, file: !199, line: 155, type: !137)
!294 = !DILocalVariable(name: "hdrsize", scope: !286, file: !199, line: 156, type: !65)
!295 = !DILocation(line: 0, scope: !286, inlinedAt: !296)
!296 = distinct !DILocation(line: 132, column: 13, scope: !297)
!297 = distinct !DILexicalBlock(scope: !298, file: !3, line: 131, column: 39)
!298 = distinct !DILexicalBlock(scope: !106, file: !3, line: 131, column: 6)
!299 = !DILocation(line: 158, column: 10, scope: !300, inlinedAt: !296)
!300 = distinct !DILexicalBlock(scope: !286, file: !199, line: 158, column: 6)
!301 = !DILocation(line: 158, column: 14, scope: !300, inlinedAt: !296)
!302 = !DILocation(line: 158, column: 6, scope: !286, inlinedAt: !296)
!303 = !DILocation(line: 161, column: 17, scope: !286, inlinedAt: !296)
!304 = !DILocation(line: 161, column: 21, scope: !286, inlinedAt: !296)
!305 = !DILocation(line: 163, column: 13, scope: !306, inlinedAt: !296)
!306 = distinct !DILexicalBlock(scope: !286, file: !199, line: 163, column: 5)
!307 = !DILocation(line: 163, column: 5, scope: !286, inlinedAt: !296)
!308 = !DILocation(line: 167, column: 14, scope: !309, inlinedAt: !296)
!309 = distinct !DILexicalBlock(scope: !286, file: !199, line: 167, column: 6)
!310 = !DILocation(line: 167, column: 24, scope: !309, inlinedAt: !296)
!311 = !DILocation(line: 167, column: 6, scope: !286, inlinedAt: !296)
!312 = !DILocalVariable(name: "nh", arg: 1, scope: !313, file: !199, line: 132, type: !224)
!313 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !199, file: !199, line: 132, type: !314, scopeLine: 135, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !317)
!314 = !DISubroutineType(types: !315)
!315 = !{!65, !224, !46, !316}
!316 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !155, size: 64)
!317 = !{!312, !318, !319, !320}
!318 = !DILocalVariable(name: "data_end", arg: 2, scope: !313, file: !199, line: 133, type: !46)
!319 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !313, file: !199, line: 134, type: !316)
!320 = !DILocalVariable(name: "ip6h", scope: !313, file: !199, line: 136, type: !155)
!321 = !DILocation(line: 0, scope: !313, inlinedAt: !322)
!322 = distinct !DILocation(line: 134, column: 13, scope: !323)
!323 = distinct !DILexicalBlock(scope: !324, file: !3, line: 133, column: 48)
!324 = distinct !DILexicalBlock(scope: !298, file: !3, line: 133, column: 13)
!325 = !DILocation(line: 142, column: 11, scope: !326, inlinedAt: !322)
!326 = distinct !DILexicalBlock(scope: !313, file: !199, line: 142, column: 6)
!327 = !DILocation(line: 142, column: 17, scope: !326, inlinedAt: !322)
!328 = !DILocation(line: 142, column: 15, scope: !326, inlinedAt: !322)
!329 = !DILocation(line: 142, column: 6, scope: !313, inlinedAt: !322)
!330 = !DILocation(line: 123, column: 25, scope: !106)
!331 = !DILocation(line: 0, scope: !298)
!332 = !{!212, !212, i64 0}
!333 = !DILocation(line: 139, column: 14, scope: !204)
!334 = !DILocation(line: 139, column: 6, scope: !106)
!335 = !DILocalVariable(name: "nh", arg: 1, scope: !336, file: !199, line: 224, type: !224)
!336 = distinct !DISubprogram(name: "parse_udphdr", scope: !199, file: !199, line: 224, type: !337, scopeLine: 227, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !340)
!337 = !DISubroutineType(types: !338)
!338 = !{!65, !224, !46, !339}
!339 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 64)
!340 = !{!335, !341, !342, !343, !344}
!341 = !DILocalVariable(name: "data_end", arg: 2, scope: !336, file: !199, line: 225, type: !46)
!342 = !DILocalVariable(name: "udphdr", arg: 3, scope: !336, file: !199, line: 226, type: !339)
!343 = !DILocalVariable(name: "len", scope: !336, file: !199, line: 228, type: !65)
!344 = !DILocalVariable(name: "h", scope: !336, file: !199, line: 229, type: !187)
!345 = !DILocation(line: 0, scope: !336, inlinedAt: !346)
!346 = distinct !DILocation(line: 140, column: 18, scope: !203)
!347 = !DILocation(line: 231, column: 8, scope: !348, inlinedAt: !346)
!348 = distinct !DILexicalBlock(scope: !336, file: !199, line: 231, column: 6)
!349 = !DILocation(line: 231, column: 14, scope: !348, inlinedAt: !346)
!350 = !DILocation(line: 231, column: 12, scope: !348, inlinedAt: !346)
!351 = !DILocation(line: 231, column: 6, scope: !336, inlinedAt: !346)
!352 = !DILocation(line: 0, scope: !203)
!353 = !DILocation(line: 145, column: 22, scope: !354)
!354 = distinct !DILexicalBlock(scope: !203, file: !3, line: 145, column: 6)
!355 = !DILocation(line: 145, column: 27, scope: !354)
!356 = !DILocation(line: 145, column: 6, scope: !203)
!357 = !DILocation(line: 149, column: 35, scope: !203)
!358 = !DILocation(line: 149, column: 15, scope: !203)
!359 = !DILocation(line: 150, column: 10, scope: !360)
!360 = distinct !DILexicalBlock(scope: !203, file: !3, line: 150, column: 6)
!361 = !DILocation(line: 150, column: 6, scope: !203)
!362 = !DILocation(line: 151, column: 4, scope: !363)
!363 = distinct !DILexicalBlock(scope: !360, file: !3, line: 150, column: 14)
!364 = !{!365}
!365 = distinct !{!365, !366, !"get_qname_lpm_key: argument 0"}
!366 = distinct !{!366, !"get_qname_lpm_key"}
!367 = !DILocalVariable(name: "base", arg: 1, scope: !368, file: !3, line: 38, type: !96)
!368 = distinct !DISubprogram(name: "get_qname_lpm_key", scope: !3, file: !3, line: 38, type: !369, scopeLine: 38, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !371)
!369 = !DISubroutineType(types: !370)
!370 = !{!70, !96, !46}
!371 = !{!367, !372, !373, !374, !375, !376, !377, !378, !379, !382, !383, !388}
!372 = !DILocalVariable(name: "data_end", arg: 2, scope: !368, file: !3, line: 38, type: !46)
!373 = !DILocalVariable(name: "qlk", scope: !368, file: !3, line: 39, type: !70)
!374 = !DILocalVariable(name: "qend", scope: !368, file: !3, line: 43, type: !65)
!375 = !DILocalVariable(name: "tmp", scope: !368, file: !3, line: 44, type: !56)
!376 = !DILocalVariable(name: "qlen", scope: !368, file: !3, line: 55, type: !65)
!377 = !DILocalVariable(name: "ind", scope: !368, file: !3, line: 56, type: !65)
!378 = !DILocalVariable(name: "nd", scope: !368, file: !3, line: 57, type: !65)
!379 = !DILocalVariable(name: "i", scope: !380, file: !3, line: 61, type: !65)
!380 = distinct !DILexicalBlock(scope: !381, file: !3, line: 60, column: 35)
!381 = distinct !DILexicalBlock(scope: !368, file: !3, line: 58, column: 37)
!382 = !DILocalVariable(name: "j", scope: !381, file: !3, line: 69, type: !65)
!383 = !DILocalVariable(name: "____fmt", scope: !384, file: !3, line: 77, type: !385)
!384 = distinct !DILexicalBlock(scope: !368, file: !3, line: 77, column: 2)
!385 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 120, elements: !386)
!386 = !{!387}
!387 = !DISubrange(count: 15)
!388 = !DILocalVariable(name: "____fmt", scope: !389, file: !3, line: 78, type: !390)
!389 = distinct !DILexicalBlock(scope: !368, file: !3, line: 78, column: 2)
!390 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 80, elements: !391)
!391 = !{!392}
!392 = !DISubrange(count: 10)
!393 = !DILocation(line: 0, scope: !368, inlinedAt: !394)
!394 = distinct !DILocation(line: 151, column: 4, scope: !363)
!395 = !DILocation(line: 39, column: 23, scope: !368, inlinedAt: !394)
!396 = !DILocation(line: 45, column: 2, scope: !368, inlinedAt: !394)
!397 = !DILocation(line: 46, column: 10, scope: !398, inlinedAt: !394)
!398 = distinct !DILexicalBlock(scope: !399, file: !3, line: 46, column: 6)
!399 = distinct !DILexicalBlock(scope: !368, file: !3, line: 45, column: 23)
!400 = !DILocation(line: 46, column: 15, scope: !398, inlinedAt: !394)
!401 = !DILocation(line: 46, column: 18, scope: !398, inlinedAt: !394)
!402 = !DILocation(line: 46, column: 6, scope: !399, inlinedAt: !394)
!403 = !DILocation(line: 50, column: 9, scope: !399, inlinedAt: !394)
!404 = !DILocation(line: 51, column: 10, scope: !405, inlinedAt: !394)
!405 = distinct !DILexicalBlock(scope: !399, file: !3, line: 51, column: 6)
!406 = !DILocation(line: 51, column: 6, scope: !399, inlinedAt: !394)
!407 = !DILocation(line: 51, column: 6, scope: !405, inlinedAt: !394)
!408 = !DILocation(line: 52, column: 14, scope: !399, inlinedAt: !394)
!409 = !DILocation(line: 52, column: 8, scope: !399, inlinedAt: !394)
!410 = !DILocation(line: 45, column: 12, scope: !368, inlinedAt: !394)
!411 = distinct !{!411, !396, !412, !413}
!412 = !DILocation(line: 53, column: 2, scope: !368, inlinedAt: !394)
!413 = !{!"llvm.loop.mustprogress"}
!414 = !DILocation(line: 55, column: 17, scope: !368, inlinedAt: !394)
!415 = !DILocation(line: 58, column: 2, scope: !368, inlinedAt: !394)
!416 = !DILocation(line: 58, column: 11, scope: !368, inlinedAt: !394)
!417 = !DILocation(line: 57, column: 12, scope: !368, inlinedAt: !394)
!418 = !DILocation(line: 60, column: 3, scope: !381, inlinedAt: !394)
!419 = !DILocation(line: 59, column: 6, scope: !381, inlinedAt: !394)
!420 = !DILocation(line: 60, column: 12, scope: !381, inlinedAt: !394)
!421 = !DILocation(line: 60, column: 16, scope: !381, inlinedAt: !394)
!422 = !DILocation(line: 62, column: 7, scope: !380, inlinedAt: !394)
!423 = !DILocation(line: 0, scope: !380, inlinedAt: !394)
!424 = !DILocation(line: 62, column: 15, scope: !425, inlinedAt: !394)
!425 = distinct !DILexicalBlock(scope: !380, file: !3, line: 62, column: 7)
!426 = !DILocation(line: 62, column: 18, scope: !425, inlinedAt: !394)
!427 = !DILocation(line: 70, column: 18, scope: !381, inlinedAt: !394)
!428 = !DILocation(line: 0, scope: !381, inlinedAt: !394)
!429 = !DILocation(line: 71, column: 10, scope: !430, inlinedAt: !394)
!430 = distinct !DILexicalBlock(scope: !381, file: !3, line: 71, column: 6)
!431 = !DILocation(line: 71, column: 14, scope: !430, inlinedAt: !394)
!432 = !DILocation(line: 71, column: 17, scope: !430, inlinedAt: !394)
!433 = !DILocation(line: 71, column: 6, scope: !381, inlinedAt: !394)
!434 = !DILocation(line: 75, column: 12, scope: !381, inlinedAt: !394)
!435 = !DILocation(line: 75, column: 11, scope: !381, inlinedAt: !394)
!436 = !DILocation(line: 58, column: 18, scope: !368, inlinedAt: !394)
!437 = !DILocation(line: 77, column: 2, scope: !384, inlinedAt: !394)
!438 = !DILocation(line: 77, column: 2, scope: !368, inlinedAt: !394)
!439 = !DILocation(line: 78, column: 2, scope: !389, inlinedAt: !394)
!440 = !DILocation(line: 78, column: 2, scope: !368, inlinedAt: !394)
!441 = !DILocation(line: 79, column: 2, scope: !368, inlinedAt: !394)
!442 = !DILocation(line: 152, column: 3, scope: !363)
!443 = !DILocation(line: 159, column: 1, scope: !106)
