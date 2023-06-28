; ModuleID = 'qn.c'
source_filename = "qn.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.1 = type { [11 x i32]*, %struct.qname_lpm_key*, %struct.qname_lpm_key*, [1 x i32]*, [1023 x i32]* }
%struct.qname_lpm_key = type { i32, [64 x i8] }
%struct.anon.2 = type { [2 x i32]*, i32*, i64*, [2 x i32]* }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.udphdr = type { i16, i16, i16, i16 }

@xdp_patch_ports_func.____fmt = internal constant [8 x i8] c"rev %s\0A\00", align 1, !dbg !0
@main_map = dso_local global %struct.anon.1 zeroinitializer, section ".maps", align 8, !dbg !87
@xdp_patch_ports_func.____fmt.1 = internal constant [12 x i8] c"k index %d\0A\00", align 1, !dbg !71
@xdp_patch_ports_func.____fmt.2 = internal constant [16 x i8] c"matched len %d\0A\00", align 1, !dbg !77
@stats_map = dso_local global %struct.anon.2 zeroinitializer, section ".maps", align 8, !dbg !116
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !82
@llvm.compiler.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.1* @main_map to i8*), i8* bitcast (%struct.anon.2* @stats_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_patch_ports_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_patch_ports_func(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp_patch_ports" !dbg !2 {
  %2 = alloca [64 x i8], align 1
  %3 = alloca i32, align 4
  %4 = alloca %struct.qname_lpm_key, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !152, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i32 2, metadata !153, metadata !DIExpression()), !dbg !237
  %5 = bitcast i32* %3 to i8*, !dbg !238
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #7, !dbg !238
  call void @llvm.dbg.value(metadata i32 0, metadata !169, metadata !DIExpression()), !dbg !237
  store i32 0, i32* %3, align 4, !dbg !239, !tbaa !240
  call void @llvm.dbg.value(metadata i64* null, metadata !170, metadata !DIExpression()), !dbg !237
  %6 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !244
  %7 = load i32, i32* %6, align 4, !dbg !244, !tbaa !245
  %8 = zext i32 %7 to i64, !dbg !247
  %9 = inttoptr i64 %8 to i8*, !dbg !248
  call void @llvm.dbg.value(metadata i8* %9, metadata !171, metadata !DIExpression()), !dbg !237
  %10 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !249
  %11 = load i32, i32* %10, align 4, !dbg !249, !tbaa !250
  %12 = zext i32 %11 to i64, !dbg !251
  %13 = inttoptr i64 %12 to i8*, !dbg !252
  call void @llvm.dbg.value(metadata i8* %13, metadata !172, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i8* %13, metadata !173, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !156, metadata !DIExpression(DW_OP_deref)), !dbg !237
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !253, metadata !DIExpression()) #7, !dbg !262
  call void @llvm.dbg.value(metadata i8* %9, metadata !260, metadata !DIExpression()) #7, !dbg !262
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !261, metadata !DIExpression()) #7, !dbg !262
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !264, metadata !DIExpression()) #7, !dbg !287
  call void @llvm.dbg.value(metadata i8* %9, metadata !274, metadata !DIExpression()) #7, !dbg !287
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !275, metadata !DIExpression()) #7, !dbg !287
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !276, metadata !DIExpression()) #7, !dbg !287
  call void @llvm.dbg.value(metadata i8* %13, metadata !277, metadata !DIExpression()) #7, !dbg !287
  call void @llvm.dbg.value(metadata i32 14, metadata !278, metadata !DIExpression()) #7, !dbg !287
  %14 = getelementptr i8, i8* %13, i64 14, !dbg !289
  %15 = icmp ugt i8* %14, %9, !dbg !291
  br i1 %15, label %170, label %16, !dbg !292

16:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %13, metadata !277, metadata !DIExpression()) #7, !dbg !287
  call void @llvm.dbg.value(metadata i8* %14, metadata !173, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i8* %14, metadata !279, metadata !DIExpression()) #7, !dbg !287
  %17 = getelementptr inbounds i8, i8* %13, i64 12, !dbg !293
  %18 = bitcast i8* %17 to i16*, !dbg !293
  call void @llvm.dbg.value(metadata i16 undef, metadata !285, metadata !DIExpression()) #7, !dbg !287
  call void @llvm.dbg.value(metadata i32 0, metadata !286, metadata !DIExpression()) #7, !dbg !287
  %19 = load i16, i16* %18, align 1, !dbg !287, !tbaa !294
  call void @llvm.dbg.value(metadata i16 %19, metadata !285, metadata !DIExpression()) #7, !dbg !287
  %20 = inttoptr i64 %8 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i16 %19, metadata !296, metadata !DIExpression()) #7, !dbg !301
  %21 = icmp eq i16 %19, 129, !dbg !307
  %22 = icmp eq i16 %19, -22392, !dbg !308
  %23 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %21) #7
  %24 = or i1 %22, %23, !dbg !308
  %25 = xor i1 %24, true, !dbg !309
  %26 = getelementptr i8, i8* %13, i64 18
  %27 = bitcast i8* %26 to %struct.vlan_hdr*
  %28 = icmp ugt %struct.vlan_hdr* %27, %20
  %29 = select i1 %25, i1 true, i1 %28, !dbg !310
  br i1 %29, label %47, label %30, !dbg !310

30:                                               ; preds = %16
  call void @llvm.dbg.value(metadata i16 undef, metadata !285, metadata !DIExpression()) #7, !dbg !287
  %31 = getelementptr i8, i8* %13, i64 16, !dbg !311
  %32 = bitcast i8* %31 to i16*, !dbg !311
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %27, metadata !279, metadata !DIExpression()) #7, !dbg !287
  call void @llvm.dbg.value(metadata i32 1, metadata !286, metadata !DIExpression()) #7, !dbg !287
  %33 = load i16, i16* %32, align 1, !dbg !287, !tbaa !294
  call void @llvm.dbg.value(metadata i16 %33, metadata !285, metadata !DIExpression()) #7, !dbg !287
  call void @llvm.dbg.value(metadata i16 %33, metadata !296, metadata !DIExpression()) #7, !dbg !301
  %34 = icmp eq i16 %33, 129, !dbg !307
  %35 = icmp eq i16 %33, -22392, !dbg !308
  %36 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %34) #7
  %37 = or i1 %35, %36, !dbg !308
  %38 = xor i1 %37, true, !dbg !309
  %39 = getelementptr i8, i8* %13, i64 22
  %40 = bitcast i8* %39 to %struct.vlan_hdr*
  %41 = icmp ugt %struct.vlan_hdr* %40, %20
  %42 = select i1 %38, i1 true, i1 %41, !dbg !310
  br i1 %42, label %47, label %43, !dbg !310

43:                                               ; preds = %30
  call void @llvm.dbg.value(metadata i16 undef, metadata !285, metadata !DIExpression()) #7, !dbg !287
  %44 = getelementptr i8, i8* %13, i64 20, !dbg !311
  %45 = bitcast i8* %44 to i16*, !dbg !311
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %40, metadata !279, metadata !DIExpression()) #7, !dbg !287
  call void @llvm.dbg.value(metadata i32 2, metadata !286, metadata !DIExpression()) #7, !dbg !287
  %46 = load i16, i16* %45, align 1, !dbg !287, !tbaa !294
  call void @llvm.dbg.value(metadata i16 %46, metadata !285, metadata !DIExpression()) #7, !dbg !287
  br label %47

47:                                               ; preds = %16, %30, %43
  %48 = phi i8* [ %14, %16 ], [ %26, %30 ], [ %39, %43 ], !dbg !287
  %49 = phi i16 [ %19, %16 ], [ %33, %30 ], [ %46, %43 ], !dbg !287
  call void @llvm.dbg.value(metadata i8* %48, metadata !173, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i16 %49, metadata !154, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !237
  %50 = icmp eq i16 %49, 8, !dbg !312
  br i1 %50, label %51, label %161, !dbg !313

51:                                               ; preds = %47
  call void @llvm.dbg.value(metadata i8* %48, metadata !178, metadata !DIExpression()), !dbg !314
  %52 = getelementptr inbounds i8, i8* %48, i64 20, !dbg !315
  %53 = bitcast i8* %52 to %struct.iphdr*, !dbg !315
  %54 = inttoptr i64 %8 to %struct.iphdr*, !dbg !317
  %55 = icmp ugt %struct.iphdr* %53, %54, !dbg !318
  br i1 %55, label %170, label %56, !dbg !319

56:                                               ; preds = %51
  %57 = load i8, i8* %48, align 4, !dbg !320
  %58 = shl i8 %57, 2, !dbg !321
  %59 = and i8 %58, 60, !dbg !321
  call void @llvm.dbg.value(metadata i8 %59, metadata !209, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !314
  %60 = icmp ult i8 %59, 20, !dbg !322
  br i1 %60, label %170, label %61, !dbg !324

61:                                               ; preds = %56
  %62 = zext i8 %59 to i64
  call void @llvm.dbg.value(metadata i64 %62, metadata !209, metadata !DIExpression()), !dbg !314
  %63 = getelementptr i8, i8* %48, i64 %62, !dbg !325
  %64 = icmp ugt i8* %63, %9, !dbg !327
  br i1 %64, label %170, label %65, !dbg !328

65:                                               ; preds = %61
  call void @llvm.dbg.value(metadata i8* %63, metadata !173, metadata !DIExpression()), !dbg !237
  %66 = getelementptr inbounds i8, i8* %48, i64 9, !dbg !329
  %67 = load i8, i8* %66, align 1, !dbg !329, !tbaa !330
  call void @llvm.dbg.value(metadata i8 %67, metadata !155, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !237
  %68 = icmp eq i8 %67, 17, !dbg !332
  br i1 %68, label %69, label %161, !dbg !333

69:                                               ; preds = %65
  call void @llvm.dbg.value(metadata i32 -1, metadata !210, metadata !DIExpression()), !dbg !334
  call void @llvm.dbg.value(metadata i8* %63, metadata !213, metadata !DIExpression()), !dbg !334
  %70 = getelementptr inbounds i8, i8* %63, i64 8, !dbg !335
  %71 = bitcast i8* %70 to %struct.udphdr*, !dbg !335
  %72 = inttoptr i64 %8 to %struct.udphdr*, !dbg !337
  %73 = icmp ugt %struct.udphdr* %71, %72, !dbg !338
  br i1 %73, label %170, label %74, !dbg !339

74:                                               ; preds = %69
  call void @llvm.dbg.value(metadata i8* %70, metadata !173, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.value(metadata i32 undef, metadata !210, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !334
  %75 = getelementptr inbounds i8, i8* %70, i64 12, !dbg !340
  %76 = icmp ugt i8* %75, %9, !dbg !342
  br i1 %76, label %161, label %77, !dbg !343

77:                                               ; preds = %74
  %78 = getelementptr inbounds i8, i8* %70, i64 4, !dbg !344
  %79 = bitcast i8* %78 to i16*, !dbg !344
  %80 = load i16, i16* %79, align 2, !dbg !345, !tbaa !294
  call void @llvm.dbg.value(metadata i16 %80, metadata !222, metadata !DIExpression()), !dbg !334
  call void @llvm.dbg.value(metadata i32 0, metadata !223, metadata !DIExpression()), !dbg !334
  %81 = icmp eq i16 %80, 0, !dbg !346
  br i1 %81, label %161, label %82, !dbg !347

82:                                               ; preds = %77
  %83 = bitcast %struct.qname_lpm_key* %4 to i8*, !dbg !348
  call void @llvm.lifetime.start.p0i8(i64 68, i8* nonnull %83) #7, !dbg !348
  call void @llvm.dbg.declare(metadata %struct.qname_lpm_key* %4, metadata !224, metadata !DIExpression()), !dbg !349
  tail call void @llvm.experimental.noalias.scope.decl(metadata !350), !dbg !353
  call void @llvm.dbg.value(metadata i8* %75, metadata !354, metadata !DIExpression()) #7, !dbg !369
  call void @llvm.dbg.value(metadata i8* %9, metadata !359, metadata !DIExpression()) #7, !dbg !369
  call void @llvm.dbg.declare(metadata %struct.qname_lpm_key* %4, metadata !360, metadata !DIExpression()) #7, !dbg !371
  %84 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %4, i64 0, i32 1, i64 0, !dbg !371
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(68) %84, i8 0, i64 64, i1 false) #7, !dbg !371, !alias.scope !350
  call void @llvm.dbg.value(metadata i64 0, metadata !361, metadata !DIExpression()) #7, !dbg !369
  call void @llvm.dbg.value(metadata i8 0, metadata !362, metadata !DIExpression()) #7, !dbg !369
  call void @llvm.dbg.value(metadata i8 0, metadata !363, metadata !DIExpression()) #7, !dbg !369
  %85 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !372
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %85) #7, !dbg !372, !noalias !350
  call void @llvm.dbg.declare(metadata [64 x i8]* %2, metadata !364, metadata !DIExpression()) #7, !dbg !373
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(64) %85, i8 0, i64 64, i1 false) #7, !dbg !373, !noalias !350
  br label %86, !dbg !374

86:                                               ; preds = %106, %82
  %87 = phi i64 [ 0, %82 ], [ %108, %106 ]
  %88 = phi i8 [ 0, %82 ], [ %107, %106 ]
  call void @llvm.dbg.value(metadata i64 %87, metadata !361, metadata !DIExpression()) #7, !dbg !369
  call void @llvm.dbg.value(metadata i8 %88, metadata !362, metadata !DIExpression()) #7, !dbg !369
  %89 = getelementptr i8, i8* %75, i64 %87, !dbg !375
  %90 = getelementptr i8, i8* %89, i64 1, !dbg !378
  %91 = icmp ugt i8* %90, %9, !dbg !379
  br i1 %91, label %127, label %92, !dbg !380

92:                                               ; preds = %86
  %93 = sext i8 %88 to i64, !dbg !381
  %94 = icmp eq i64 %87, %93, !dbg !383
  %95 = load i8, i8* %89, align 1, !dbg !384, !tbaa !385, !noalias !350
  br i1 %94, label %96, label %104, !dbg !386

96:                                               ; preds = %92
  call void @llvm.dbg.value(metadata i8 %88, metadata !363, metadata !DIExpression()) #7, !dbg !369
  call void @llvm.dbg.value(metadata i8 %95, metadata !362, metadata !DIExpression()) #7, !dbg !369
  %97 = icmp eq i8 %95, 0, !dbg !387
  br i1 %97, label %110, label %98, !dbg !390

98:                                               ; preds = %96
  %99 = icmp sgt i8 %95, 63, !dbg !391
  br i1 %99, label %127, label %100, !dbg !393

100:                                              ; preds = %98
  %101 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 %87, !dbg !394
  store i8 46, i8* %101, align 1, !dbg !395, !tbaa !385, !noalias !350
  %102 = add i8 %88, 1, !dbg !396
  %103 = add i8 %102, %95, !dbg !397
  call void @llvm.dbg.value(metadata i8 %103, metadata !362, metadata !DIExpression()) #7, !dbg !369
  br label %106, !dbg !398

104:                                              ; preds = %92
  %105 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 %87, !dbg !399
  store i8 %95, i8* %105, align 1, !dbg !401, !tbaa !385, !noalias !350
  br label %106

106:                                              ; preds = %104, %100
  %107 = phi i8 [ %103, %100 ], [ %88, %104 ], !dbg !369
  call void @llvm.dbg.value(metadata i8 %107, metadata !362, metadata !DIExpression()) #7, !dbg !369
  %108 = add nuw nsw i64 %87, 1, !dbg !402
  call void @llvm.dbg.value(metadata i64 %108, metadata !361, metadata !DIExpression()) #7, !dbg !369
  %109 = icmp eq i64 %108, 64, !dbg !403
  br i1 %109, label %127, label %86, !dbg !374, !llvm.loop !404

110:                                              ; preds = %96
  %111 = add nsw i64 %87, -1, !dbg !407
  call void @llvm.dbg.value(metadata i64 %111, metadata !365, metadata !DIExpression()) #7, !dbg !369
  call void @llvm.dbg.value(metadata i64 %111, metadata !361, metadata !DIExpression()) #7, !dbg !369
  %112 = icmp eq i64 %111, 0, !dbg !408
  br i1 %112, label %125, label %113, !dbg !409

113:                                              ; preds = %110, %119
  %114 = phi i64 [ %123, %119 ], [ %111, %110 ]
  call void @llvm.dbg.value(metadata i64 %114, metadata !361, metadata !DIExpression()) #7, !dbg !369
  %115 = sub nuw nsw i64 %111, %114, !dbg !410
  call void @llvm.dbg.value(metadata i64 %115, metadata !366, metadata !DIExpression()) #7, !dbg !411
  %116 = icmp ugt i64 %115, 63, !dbg !412
  br i1 %116, label %125, label %117, !dbg !414

117:                                              ; preds = %113
  %118 = icmp ugt i64 %114, 63
  br i1 %118, label %127, label %119, !dbg !415

119:                                              ; preds = %117
  %120 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 %114, !dbg !417
  %121 = load i8, i8* %120, align 1, !dbg !417, !tbaa !385, !noalias !350
  %122 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %4, i64 0, i32 1, i64 %115, !dbg !418
  store i8 %121, i8* %122, align 1, !dbg !419, !tbaa !385, !alias.scope !350
  %123 = add nsw i64 %114, -1, !dbg !420
  call void @llvm.dbg.value(metadata i64 %123, metadata !361, metadata !DIExpression()) #7, !dbg !369
  %124 = icmp eq i64 %123, 0, !dbg !408
  br i1 %124, label %125, label %113, !dbg !409

125:                                              ; preds = %119, %113, %110
  %126 = trunc i64 %111 to i32, !dbg !421
  br label %127, !dbg !422

127:                                              ; preds = %86, %98, %106, %117, %125
  %128 = phi i32 [ %126, %125 ], [ 0, %117 ], [ 0, %106 ], [ 0, %98 ], [ 0, %86 ], !dbg !369
  %129 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %4, i64 0, i32 0, !dbg !371
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %85) #7, !dbg !423, !noalias !350
  call void @llvm.dbg.value(metadata i32 %128, metadata !223, metadata !DIExpression()), !dbg !334
  store i32 64, i32* %129, align 4, !dbg !424, !tbaa !425
  %130 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @xdp_patch_ports_func.____fmt, i64 0, i64 0), i32 noundef 8, i8* noundef nonnull %84) #7, !dbg !427
  call void @llvm.dbg.value(metadata %struct.qname_lpm_key* null, metadata !227, metadata !DIExpression()), !dbg !429
  %131 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.1* @main_map to i8*), i8* noundef nonnull %83) #7, !dbg !430
  call void @llvm.dbg.value(metadata i8* %131, metadata !227, metadata !DIExpression()), !dbg !429
  %132 = icmp eq i8* %131, null, !dbg !432
  br i1 %132, label %159, label %133, !dbg !433

133:                                              ; preds = %127
  %134 = bitcast i8* %131 to i32*, !dbg !434
  %135 = load i32, i32* %134, align 4, !dbg !434, !tbaa !425
  %136 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @xdp_patch_ports_func.____fmt.1, i64 0, i64 0), i32 noundef 12, i32 noundef %135) #7, !dbg !434
  call void @llvm.dbg.value(metadata i32 %128, metadata !223, metadata !DIExpression()), !dbg !334
  %137 = icmp eq i32 %128, 0, !dbg !437
  br i1 %137, label %160, label %138, !dbg !438

138:                                              ; preds = %133
  %139 = getelementptr inbounds i8, i8* %131, i64 4
  %140 = zext i32 %128 to i64, !dbg !438
  br label %141, !dbg !438

141:                                              ; preds = %138, %155
  %142 = phi i64 [ %140, %138 ], [ %156, %155 ]
  call void @llvm.dbg.value(metadata i64 %142, metadata !223, metadata !DIExpression()), !dbg !334
  %143 = getelementptr inbounds %struct.qname_lpm_key, %struct.qname_lpm_key* %4, i64 0, i32 1, i64 %142, !dbg !439
  %144 = load i8, i8* %143, align 1, !dbg !439, !tbaa !385
  %145 = icmp eq i8 %144, 0, !dbg !442
  br i1 %145, label %155, label %146, !dbg !443

146:                                              ; preds = %141
  %147 = getelementptr inbounds i8, i8* %139, i64 %142, !dbg !444
  %148 = load i8, i8* %147, align 1, !dbg !444, !tbaa !385
  %149 = icmp eq i8 %148, 0, !dbg !445
  %150 = icmp eq i8 %144, %148
  %151 = select i1 %149, i1 true, i1 %150, !dbg !446
  br i1 %151, label %155, label %152, !dbg !446

152:                                              ; preds = %146
  %153 = trunc i64 %142 to i32, !dbg !447
  %154 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @xdp_patch_ports_func.____fmt.2, i64 0, i64 0), i32 noundef 16, i32 noundef %153) #7, !dbg !447
  call void @llvm.dbg.value(metadata i32 2, metadata !153, metadata !DIExpression()), !dbg !237
  br label %159, !dbg !452

155:                                              ; preds = %146, %141
  %156 = add nsw i64 %142, -1, !dbg !453
  %157 = trunc i64 %156 to i32, !dbg !453
  call void @llvm.dbg.value(metadata i32 %157, metadata !223, metadata !DIExpression()), !dbg !334
  %158 = icmp eq i32 %157, 0, !dbg !437
  br i1 %158, label %160, label %141, !dbg !438, !llvm.loop !454

159:                                              ; preds = %152, %127
  call void @llvm.dbg.value(metadata i32 1, metadata !153, metadata !DIExpression()), !dbg !237
  call void @llvm.lifetime.end.p0i8(i64 68, i8* nonnull %83) #7, !dbg !456
  call void @llvm.dbg.label(metadata !228), !dbg !457
  br label %161, !dbg !458

160:                                              ; preds = %155, %133
  call void @llvm.dbg.value(metadata i32 1, metadata !153, metadata !DIExpression()), !dbg !237
  call void @llvm.lifetime.end.p0i8(i64 68, i8* nonnull %83) #7, !dbg !456
  call void @llvm.dbg.label(metadata !228), !dbg !457
  call void @llvm.dbg.value(metadata i32 1, metadata !169, metadata !DIExpression()), !dbg !237
  store i32 1, i32* %3, align 4, !dbg !459, !tbaa !240
  br label %161, !dbg !461

161:                                              ; preds = %74, %77, %47, %65, %159, %160
  %162 = phi i32 [ 1, %160 ], [ 2, %159 ], [ 2, %65 ], [ 2, %47 ], [ 2, %77 ], [ 2, %74 ]
  call void @llvm.dbg.value(metadata i32* %3, metadata !169, metadata !DIExpression(DW_OP_deref)), !dbg !237
  %163 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.2* @stats_map to i8*), i8* noundef nonnull %5) #7, !dbg !462
  %164 = bitcast i8* %163 to i64*, !dbg !462
  call void @llvm.dbg.value(metadata i64* %164, metadata !170, metadata !DIExpression()), !dbg !237
  %165 = icmp eq i8* %163, null, !dbg !463
  br i1 %165, label %170, label %166, !dbg !465

166:                                              ; preds = %161
  %167 = load i64, i64* %164, align 8, !dbg !466, !tbaa !468
  %168 = add i64 %167, 1, !dbg !470
  store i64 %168, i64* %164, align 8, !dbg !471, !tbaa !468
  call void @llvm.dbg.value(metadata i32* %3, metadata !169, metadata !DIExpression(DW_OP_deref)), !dbg !237
  %169 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.2* @stats_map to i8*), i8* noundef nonnull %5, i8* noundef nonnull %163, i64 noundef 0) #7, !dbg !472
  br label %170, !dbg !473

170:                                              ; preds = %61, %56, %51, %1, %69, %161, %166
  %171 = phi i32 [ %162, %166 ], [ %162, %161 ], [ 0, %69 ], [ 0, %1 ], [ 0, %51 ], [ 0, %56 ], [ 0, %61 ], !dbg !237
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #7, !dbg !474
  ret i32 %171, !dbg !474
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #5

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.experimental.noalias.scope.decl(metadata) #6

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind readnone }
attributes #6 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!19}
!llvm.module.flags = !{!232, !233, !234, !235}
!llvm.ident = !{!236}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 150, type: !229, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "xdp_patch_ports_func", scope: !3, file: !3, line: 83, type: !4, scopeLine: 84, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !19, retainedNodes: !151)
!3 = !DIFile(filename: "qn.c", directory: "/root/anti-ddos-firewall/qname_filter", checksumkind: CSK_MD5, checksum: "8b180f3173b36b1937b3f8c2b6f9b132")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !9, line: 2856, size: 160, elements: !10)
!9 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/root/anti-ddos-firewall/qname_filter", checksumkind: CSK_MD5, checksum: "db1ce4e5e29770657167bc8f57af9388")
!10 = !{!11, !15, !16, !17, !18}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !8, file: !9, line: 2857, baseType: !12, size: 32)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !13, line: 27, baseType: !14)
!13 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !8, file: !9, line: 2858, baseType: !12, size: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !8, file: !9, line: 2859, baseType: !12, size: 32, offset: 64)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !8, file: !9, line: 2861, baseType: !12, size: 32, offset: 96)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !8, file: !9, line: 2862, baseType: !12, size: 32, offset: 128)
!19 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.6", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !20, retainedTypes: !59, globals: !70, splitDebugInlining: false, nameTableKind: None)
!20 = !{!21, !28}
!21 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !9, line: 2845, baseType: !14, size: 32, elements: !22)
!22 = !{!23, !24, !25, !26, !27}
!23 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!24 = !DIEnumerator(name: "XDP_DROP", value: 1)
!25 = !DIEnumerator(name: "XDP_PASS", value: 2)
!26 = !DIEnumerator(name: "XDP_TX", value: 3)
!27 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!28 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !29, line: 28, baseType: !14, size: 32, elements: !30)
!29 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "9a7f04155c254fef1b7ada5eb82c984c")
!30 = !{!31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58}
!31 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!32 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!33 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!34 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!35 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!36 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!37 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!38 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!39 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!40 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!41 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!42 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!43 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!44 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!45 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!46 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!47 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!48 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!49 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!50 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!51 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!52 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!53 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!54 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!55 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!56 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!57 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!58 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!59 = !{!60, !61, !62, !64, !67, !68}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!61 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !13, line: 24, baseType: !63)
!63 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !13, line: 21, baseType: !66)
!66 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !{!0, !71, !77, !82, !87, !116, !132, !139, !146}
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 156, type: !73, isLocal: true, isDefinition: true)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !74, size: 96, elements: !75)
!74 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !69)
!75 = !{!76}
!76 = !DISubrange(count: 12)
!77 = !DIGlobalVariableExpression(var: !78, expr: !DIExpression())
!78 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 160, type: !79, isLocal: true, isDefinition: true)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !74, size: 128, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 16)
!82 = !DIGlobalVariableExpression(var: !83, expr: !DIExpression())
!83 = distinct !DIGlobalVariable(name: "_license", scope: !19, file: !3, line: 186, type: !84, isLocal: false, isDefinition: true)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 32, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 4)
!87 = !DIGlobalVariableExpression(var: !88, expr: !DIExpression())
!88 = distinct !DIGlobalVariable(name: "main_map", scope: !19, file: !3, line: 28, type: !89, isLocal: false, isDefinition: true)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 22, size: 320, elements: !90)
!90 = !{!91, !96, !105, !106, !111}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !89, file: !3, line: 23, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 352, elements: !94)
!94 = !{!95}
!95 = !DISubrange(count: 11)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !89, file: !3, line: 24, baseType: !97, size: 64, offset: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "qname_lpm_key", file: !3, line: 17, size: 544, elements: !99)
!99 = !{!100, !101}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !98, file: !3, line: 18, baseType: !12, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "rev_suf", scope: !98, file: !3, line: 19, baseType: !102, size: 512, offset: 32)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 512, elements: !103)
!103 = !{!104}
!104 = !DISubrange(count: 64)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !89, file: !3, line: 25, baseType: !97, size: 64, offset: 128)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !89, file: !3, line: 26, baseType: !107, size: 64, offset: 192)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !109)
!109 = !{!110}
!110 = !DISubrange(count: 1)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !89, file: !3, line: 27, baseType: !112, size: 64, offset: 256)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32736, elements: !114)
!114 = !{!115}
!115 = !DISubrange(count: 1023)
!116 = !DIGlobalVariableExpression(var: !117, expr: !DIExpression())
!117 = distinct !DIGlobalVariable(name: "stats_map", scope: !19, file: !3, line: 35, type: !118, isLocal: false, isDefinition: true)
!118 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 30, size: 256, elements: !119)
!119 = !{!120, !125, !127, !131}
!120 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !118, file: !3, line: 31, baseType: !121, size: 64)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 64, elements: !123)
!123 = !{!124}
!124 = !DISubrange(count: 2)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !118, file: !3, line: 32, baseType: !126, size: 64, offset: 64)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !118, file: !3, line: 33, baseType: !128, size: 64, offset: 128)
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !13, line: 31, baseType: !130)
!130 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !118, file: !3, line: 34, baseType: !121, size: 64, offset: 192)
!132 = !DIGlobalVariableExpression(var: !133, expr: !DIExpression())
!133 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !19, file: !134, line: 176, type: !135, isLocal: true, isDefinition: true)
!134 = !DIFile(filename: "../../multi-filters/lib/libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/root/anti-ddos-firewall/qname_filter", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = !DISubroutineType(types: !137)
!137 = !{!61, !138, !12, null}
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!139 = !DIGlobalVariableExpression(var: !140, expr: !DIExpression())
!140 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !19, file: !134, line: 55, type: !141, isLocal: true, isDefinition: true)
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !142, size: 64)
!142 = !DISubroutineType(types: !143)
!143 = !{!60, !60, !144}
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !145, size: 64)
!145 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!146 = !DIGlobalVariableExpression(var: !147, expr: !DIExpression())
!147 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !19, file: !134, line: 77, type: !148, isLocal: true, isDefinition: true)
!148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !149, size: 64)
!149 = !DISubroutineType(types: !150)
!150 = !{!61, !60, !144, !144, !129}
!151 = !{!152, !153, !154, !155, !156, !169, !170, !171, !172, !173, !178, !209, !210, !213, !222, !223, !224, !227, !228}
!152 = !DILocalVariable(name: "ctx", arg: 1, scope: !2, file: !3, line: 83, type: !7)
!153 = !DILocalVariable(name: "action", scope: !2, file: !3, line: 85, type: !6)
!154 = !DILocalVariable(name: "eth_type", scope: !2, file: !3, line: 86, type: !6)
!155 = !DILocalVariable(name: "ip_type", scope: !2, file: !3, line: 86, type: !6)
!156 = !DILocalVariable(name: "eth", scope: !2, file: !3, line: 87, type: !157)
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!158 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !159, line: 168, size: 112, elements: !160)
!159 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!160 = !{!161, !165, !166}
!161 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !158, file: !159, line: 169, baseType: !162, size: 48)
!162 = !DICompositeType(tag: DW_TAG_array_type, baseType: !66, size: 48, elements: !163)
!163 = !{!164}
!164 = !DISubrange(count: 6)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !158, file: !159, line: 170, baseType: !162, size: 48, offset: 48)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !158, file: !159, line: 171, baseType: !167, size: 16, offset: 96)
!167 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !168, line: 25, baseType: !62)
!168 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!169 = !DILocalVariable(name: "stk", scope: !2, file: !3, line: 88, type: !12)
!170 = !DILocalVariable(name: "stptr", scope: !2, file: !3, line: 89, type: !128)
!171 = !DILocalVariable(name: "data_end", scope: !2, file: !3, line: 90, type: !60)
!172 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 91, type: !60)
!173 = !DILocalVariable(name: "nh", scope: !2, file: !3, line: 92, type: !174)
!174 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !175, line: 33, size: 64, elements: !176)
!175 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/root/anti-ddos-firewall/qname_filter", checksumkind: CSK_MD5, checksum: "172efdd203783aed49c0ce78645261a8")
!176 = !{!177}
!177 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !174, file: !175, line: 34, baseType: !60, size: 64)
!178 = !DILocalVariable(name: "iph", scope: !179, file: !3, line: 100, type: !181)
!179 = distinct !DILexicalBlock(scope: !180, file: !3, line: 99, column: 39)
!180 = distinct !DILexicalBlock(scope: !2, file: !3, line: 99, column: 6)
!181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !182, size: 64)
!182 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !183, line: 87, size: 160, elements: !184)
!183 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!184 = !{!185, !186, !187, !188, !189, !190, !191, !192, !193, !195}
!185 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !182, file: !183, line: 89, baseType: !65, size: 4, flags: DIFlagBitField, extraData: i64 0)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !182, file: !183, line: 90, baseType: !65, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !182, file: !183, line: 97, baseType: !65, size: 8, offset: 8)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !182, file: !183, line: 98, baseType: !167, size: 16, offset: 16)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !182, file: !183, line: 99, baseType: !167, size: 16, offset: 32)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !182, file: !183, line: 100, baseType: !167, size: 16, offset: 48)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !182, file: !183, line: 101, baseType: !65, size: 8, offset: 64)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !182, file: !183, line: 102, baseType: !65, size: 8, offset: 72)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !182, file: !183, line: 103, baseType: !194, size: 16, offset: 80)
!194 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !168, line: 31, baseType: !62)
!195 = !DIDerivedType(tag: DW_TAG_member, scope: !182, file: !183, line: 104, baseType: !196, size: 64, offset: 96)
!196 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !182, file: !183, line: 104, size: 64, elements: !197)
!197 = !{!198, !204}
!198 = !DIDerivedType(tag: DW_TAG_member, scope: !196, file: !183, line: 104, baseType: !199, size: 64)
!199 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !196, file: !183, line: 104, size: 64, elements: !200)
!200 = !{!201, !203}
!201 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !199, file: !183, line: 104, baseType: !202, size: 32)
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !168, line: 27, baseType: !12)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !199, file: !183, line: 104, baseType: !202, size: 32, offset: 32)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !196, file: !183, line: 104, baseType: !205, size: 64)
!205 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !196, file: !183, line: 104, size: 64, elements: !206)
!206 = !{!207, !208}
!207 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !205, file: !183, line: 104, baseType: !202, size: 32)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !205, file: !183, line: 104, baseType: !202, size: 32, offset: 32)
!209 = !DILocalVariable(name: "hdrsize", scope: !179, file: !3, line: 101, type: !6)
!210 = !DILocalVariable(name: "udppld", scope: !211, file: !3, line: 125, type: !12)
!211 = distinct !DILexicalBlock(scope: !212, file: !3, line: 124, column: 30)
!212 = distinct !DILexicalBlock(scope: !2, file: !3, line: 124, column: 6)
!213 = !DILocalVariable(name: "h", scope: !211, file: !3, line: 126, type: !214)
!214 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !215, size: 64)
!215 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !216, line: 23, size: 64, elements: !217)
!216 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "", checksumkind: CSK_MD5, checksum: "53c0d42e1bf6d93b39151764be2d20fb")
!217 = !{!218, !219, !220, !221}
!218 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !215, file: !216, line: 24, baseType: !167, size: 16)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !215, file: !216, line: 25, baseType: !167, size: 16, offset: 16)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !215, file: !216, line: 26, baseType: !167, size: 16, offset: 32)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !215, file: !216, line: 27, baseType: !194, size: 16, offset: 48)
!222 = !DILocalVariable(name: "qrn", scope: !211, file: !3, line: 141, type: !62)
!223 = !DILocalVariable(name: "qlen", scope: !211, file: !3, line: 142, type: !12)
!224 = !DILocalVariable(name: "qlk", scope: !225, file: !3, line: 144, type: !98)
!225 = distinct !DILexicalBlock(scope: !226, file: !3, line: 143, column: 14)
!226 = distinct !DILexicalBlock(scope: !211, file: !3, line: 143, column: 6)
!227 = !DILocalVariable(name: "tval", scope: !225, file: !3, line: 151, type: !97)
!228 = !DILabel(scope: !2, name: "out", file: !3, line: 175)
!229 = !DICompositeType(tag: DW_TAG_array_type, baseType: !74, size: 64, elements: !230)
!230 = !{!231}
!231 = !DISubrange(count: 8)
!232 = !{i32 7, !"Dwarf Version", i32 5}
!233 = !{i32 2, !"Debug Info Version", i32 3}
!234 = !{i32 1, !"wchar_size", i32 4}
!235 = !{i32 7, !"frame-pointer", i32 2}
!236 = !{!"Ubuntu clang version 14.0.6"}
!237 = !DILocation(line: 0, scope: !2)
!238 = !DILocation(line: 88, column: 2, scope: !2)
!239 = !DILocation(line: 88, column: 8, scope: !2)
!240 = !{!241, !241, i64 0}
!241 = !{!"int", !242, i64 0}
!242 = !{!"omnipotent char", !243, i64 0}
!243 = !{!"Simple C/C++ TBAA"}
!244 = !DILocation(line: 90, column: 38, scope: !2)
!245 = !{!246, !241, i64 4}
!246 = !{!"xdp_md", !241, i64 0, !241, i64 4, !241, i64 8, !241, i64 12, !241, i64 16}
!247 = !DILocation(line: 90, column: 27, scope: !2)
!248 = !DILocation(line: 90, column: 19, scope: !2)
!249 = !DILocation(line: 91, column: 34, scope: !2)
!250 = !{!246, !241, i64 0}
!251 = !DILocation(line: 91, column: 23, scope: !2)
!252 = !DILocation(line: 91, column: 15, scope: !2)
!253 = !DILocalVariable(name: "nh", arg: 1, scope: !254, file: !175, line: 124, type: !257)
!254 = distinct !DISubprogram(name: "parse_ethhdr", scope: !175, file: !175, line: 124, type: !255, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !19, retainedNodes: !259)
!255 = !DISubroutineType(types: !256)
!256 = !{!6, !257, !60, !258}
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64)
!258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !157, size: 64)
!259 = !{!253, !260, !261}
!260 = !DILocalVariable(name: "data_end", arg: 2, scope: !254, file: !175, line: 125, type: !60)
!261 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !254, file: !175, line: 126, type: !258)
!262 = !DILocation(line: 0, scope: !254, inlinedAt: !263)
!263 = distinct !DILocation(line: 94, column: 13, scope: !2)
!264 = !DILocalVariable(name: "nh", arg: 1, scope: !265, file: !175, line: 79, type: !257)
!265 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !175, file: !175, line: 79, type: !266, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !19, retainedNodes: !273)
!266 = !DISubroutineType(types: !267)
!267 = !{!6, !257, !60, !258, !268}
!268 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !269, size: 64)
!269 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !175, line: 64, size: 32, elements: !270)
!270 = !{!271}
!271 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !269, file: !175, line: 65, baseType: !272, size: 32)
!272 = !DICompositeType(tag: DW_TAG_array_type, baseType: !62, size: 32, elements: !123)
!273 = !{!264, !274, !275, !276, !277, !278, !279, !285, !286}
!274 = !DILocalVariable(name: "data_end", arg: 2, scope: !265, file: !175, line: 80, type: !60)
!275 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !265, file: !175, line: 81, type: !258)
!276 = !DILocalVariable(name: "vlans", arg: 4, scope: !265, file: !175, line: 82, type: !268)
!277 = !DILocalVariable(name: "eth", scope: !265, file: !175, line: 84, type: !157)
!278 = !DILocalVariable(name: "hdrsize", scope: !265, file: !175, line: 85, type: !6)
!279 = !DILocalVariable(name: "vlh", scope: !265, file: !175, line: 86, type: !280)
!280 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !281, size: 64)
!281 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !175, line: 42, size: 32, elements: !282)
!282 = !{!283, !284}
!283 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !281, file: !175, line: 43, baseType: !167, size: 16)
!284 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !281, file: !175, line: 44, baseType: !167, size: 16, offset: 16)
!285 = !DILocalVariable(name: "h_proto", scope: !265, file: !175, line: 87, type: !62)
!286 = !DILocalVariable(name: "i", scope: !265, file: !175, line: 88, type: !6)
!287 = !DILocation(line: 0, scope: !265, inlinedAt: !288)
!288 = distinct !DILocation(line: 129, column: 9, scope: !254, inlinedAt: !263)
!289 = !DILocation(line: 93, column: 14, scope: !290, inlinedAt: !288)
!290 = distinct !DILexicalBlock(scope: !265, file: !175, line: 93, column: 6)
!291 = !DILocation(line: 93, column: 24, scope: !290, inlinedAt: !288)
!292 = !DILocation(line: 93, column: 6, scope: !265, inlinedAt: !288)
!293 = !DILocation(line: 99, column: 17, scope: !265, inlinedAt: !288)
!294 = !{!295, !295, i64 0}
!295 = !{!"short", !242, i64 0}
!296 = !DILocalVariable(name: "h_proto", arg: 1, scope: !297, file: !175, line: 68, type: !62)
!297 = distinct !DISubprogram(name: "proto_is_vlan", scope: !175, file: !175, line: 68, type: !298, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !19, retainedNodes: !300)
!298 = !DISubroutineType(types: !299)
!299 = !{!6, !62}
!300 = !{!296}
!301 = !DILocation(line: 0, scope: !297, inlinedAt: !302)
!302 = distinct !DILocation(line: 106, column: 8, scope: !303, inlinedAt: !288)
!303 = distinct !DILexicalBlock(scope: !304, file: !175, line: 106, column: 7)
!304 = distinct !DILexicalBlock(scope: !305, file: !175, line: 105, column: 39)
!305 = distinct !DILexicalBlock(scope: !306, file: !175, line: 105, column: 2)
!306 = distinct !DILexicalBlock(scope: !265, file: !175, line: 105, column: 2)
!307 = !DILocation(line: 70, column: 20, scope: !297, inlinedAt: !302)
!308 = !DILocation(line: 70, column: 46, scope: !297, inlinedAt: !302)
!309 = !DILocation(line: 106, column: 8, scope: !303, inlinedAt: !288)
!310 = !DILocation(line: 106, column: 7, scope: !304, inlinedAt: !288)
!311 = !DILocation(line: 112, column: 18, scope: !304, inlinedAt: !288)
!312 = !DILocation(line: 99, column: 15, scope: !180)
!313 = !DILocation(line: 99, column: 6, scope: !2)
!314 = !DILocation(line: 0, scope: !179)
!315 = !DILocation(line: 103, column: 11, scope: !316)
!316 = distinct !DILexicalBlock(scope: !179, file: !3, line: 103, column: 7)
!317 = !DILocation(line: 103, column: 17, scope: !316)
!318 = !DILocation(line: 103, column: 15, scope: !316)
!319 = !DILocation(line: 103, column: 7, scope: !179)
!320 = !DILocation(line: 106, column: 18, scope: !179)
!321 = !DILocation(line: 106, column: 22, scope: !179)
!322 = !DILocation(line: 108, column: 14, scope: !323)
!323 = distinct !DILexicalBlock(scope: !179, file: !3, line: 108, column: 6)
!324 = !DILocation(line: 108, column: 6, scope: !179)
!325 = !DILocation(line: 112, column: 14, scope: !326)
!326 = distinct !DILexicalBlock(scope: !179, file: !3, line: 112, column: 7)
!327 = !DILocation(line: 112, column: 24, scope: !326)
!328 = !DILocation(line: 112, column: 7, scope: !179)
!329 = !DILocation(line: 116, column: 19, scope: !179)
!330 = !{!331, !242, i64 9}
!331 = !{!"iphdr", !242, i64 0, !242, i64 0, !242, i64 1, !295, i64 2, !295, i64 4, !295, i64 6, !242, i64 8, !242, i64 9, !295, i64 10, !242, i64 12}
!332 = !DILocation(line: 124, column: 14, scope: !212)
!333 = !DILocation(line: 124, column: 6, scope: !2)
!334 = !DILocation(line: 0, scope: !211)
!335 = !DILocation(line: 128, column: 9, scope: !336)
!336 = distinct !DILexicalBlock(scope: !211, file: !3, line: 128, column: 7)
!337 = !DILocation(line: 128, column: 15, scope: !336)
!338 = !DILocation(line: 128, column: 13, scope: !336)
!339 = !DILocation(line: 128, column: 7, scope: !211)
!340 = !DILocation(line: 137, column: 22, scope: !341)
!341 = distinct !DILexicalBlock(scope: !211, file: !3, line: 137, column: 6)
!342 = !DILocation(line: 137, column: 27, scope: !341)
!343 = !DILocation(line: 137, column: 6, scope: !211)
!344 = !DILocation(line: 141, column: 35, scope: !211)
!345 = !DILocation(line: 141, column: 15, scope: !211)
!346 = !DILocation(line: 143, column: 10, scope: !226)
!347 = !DILocation(line: 143, column: 6, scope: !211)
!348 = !DILocation(line: 144, column: 4, scope: !225)
!349 = !DILocation(line: 144, column: 25, scope: !225)
!350 = !{!351}
!351 = distinct !{!351, !352, !"get_qname_lpm_key: argument 0"}
!352 = distinct !{!352, !"get_qname_lpm_key"}
!353 = !DILocation(line: 144, column: 31, scope: !225)
!354 = !DILocalVariable(name: "base", arg: 1, scope: !355, file: !3, line: 37, type: !138)
!355 = distinct !DISubprogram(name: "get_qname_lpm_key", scope: !3, file: !3, line: 37, type: !356, scopeLine: 37, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !19, retainedNodes: !358)
!356 = !DISubroutineType(types: !357)
!357 = !{!98, !138, !60}
!358 = !{!354, !359, !360, !361, !362, !363, !364, !365, !366, !368}
!359 = !DILocalVariable(name: "data_end", arg: 2, scope: !355, file: !3, line: 37, type: !60)
!360 = !DILocalVariable(name: "qlk", scope: !355, file: !3, line: 38, type: !98)
!361 = !DILocalVariable(name: "qend", scope: !355, file: !3, line: 42, type: !129)
!362 = !DILocalVariable(name: "tmp", scope: !355, file: !3, line: 43, type: !69)
!363 = !DILocalVariable(name: "sv", scope: !355, file: !3, line: 43, type: !69)
!364 = !DILocalVariable(name: "qnbuf", scope: !355, file: !3, line: 44, type: !102)
!365 = !DILocalVariable(name: "qlen", scope: !355, file: !3, line: 62, type: !129)
!366 = !DILocalVariable(name: "i", scope: !367, file: !3, line: 65, type: !129)
!367 = distinct !DILexicalBlock(scope: !355, file: !3, line: 64, column: 17)
!368 = !DILabel(scope: !355, name: "fail", file: !3, line: 74)
!369 = !DILocation(line: 0, scope: !355, inlinedAt: !370)
!370 = distinct !DILocation(line: 144, column: 31, scope: !225)
!371 = !DILocation(line: 38, column: 23, scope: !355, inlinedAt: !370)
!372 = !DILocation(line: 44, column: 2, scope: !355, inlinedAt: !370)
!373 = !DILocation(line: 44, column: 7, scope: !355, inlinedAt: !370)
!374 = !DILocation(line: 46, column: 2, scope: !355, inlinedAt: !370)
!375 = !DILocation(line: 47, column: 17, scope: !376, inlinedAt: !370)
!376 = distinct !DILexicalBlock(scope: !377, file: !3, line: 47, column: 6)
!377 = distinct !DILexicalBlock(scope: !355, file: !3, line: 46, column: 23)
!378 = !DILocation(line: 47, column: 22, scope: !376, inlinedAt: !370)
!379 = !DILocation(line: 47, column: 25, scope: !376, inlinedAt: !370)
!380 = !DILocation(line: 47, column: 6, scope: !377, inlinedAt: !370)
!381 = !DILocation(line: 48, column: 14, scope: !382, inlinedAt: !370)
!382 = distinct !DILexicalBlock(scope: !377, file: !3, line: 48, column: 6)
!383 = !DILocation(line: 48, column: 11, scope: !382, inlinedAt: !370)
!384 = !DILocation(line: 0, scope: !382, inlinedAt: !370)
!385 = !{!242, !242, i64 0}
!386 = !DILocation(line: 48, column: 6, scope: !377, inlinedAt: !370)
!387 = !DILocation(line: 51, column: 11, scope: !388, inlinedAt: !370)
!388 = distinct !DILexicalBlock(scope: !389, file: !3, line: 51, column: 7)
!389 = distinct !DILexicalBlock(scope: !382, file: !3, line: 48, column: 18)
!390 = !DILocation(line: 51, column: 7, scope: !389, inlinedAt: !370)
!391 = !DILocation(line: 52, column: 11, scope: !392, inlinedAt: !370)
!392 = distinct !DILexicalBlock(scope: !389, file: !3, line: 52, column: 7)
!393 = !DILocation(line: 52, column: 7, scope: !389, inlinedAt: !370)
!394 = !DILocation(line: 53, column: 4, scope: !389, inlinedAt: !370)
!395 = !DILocation(line: 53, column: 16, scope: !389, inlinedAt: !370)
!396 = !DILocation(line: 54, column: 12, scope: !389, inlinedAt: !370)
!397 = !DILocation(line: 54, column: 16, scope: !389, inlinedAt: !370)
!398 = !DILocation(line: 55, column: 3, scope: !389, inlinedAt: !370)
!399 = !DILocation(line: 56, column: 4, scope: !400, inlinedAt: !370)
!400 = distinct !DILexicalBlock(scope: !382, file: !3, line: 55, column: 8)
!401 = !DILocation(line: 56, column: 16, scope: !400, inlinedAt: !370)
!402 = !DILocation(line: 58, column: 7, scope: !377, inlinedAt: !370)
!403 = !DILocation(line: 46, column: 12, scope: !355, inlinedAt: !370)
!404 = distinct !{!404, !374, !405, !406}
!405 = !DILocation(line: 59, column: 2, scope: !355, inlinedAt: !370)
!406 = !{!"llvm.loop.mustprogress"}
!407 = !DILocation(line: 62, column: 19, scope: !355, inlinedAt: !370)
!408 = !DILocation(line: 64, column: 13, scope: !355, inlinedAt: !370)
!409 = !DILocation(line: 64, column: 2, scope: !355, inlinedAt: !370)
!410 = !DILocation(line: 65, column: 17, scope: !367, inlinedAt: !370)
!411 = !DILocation(line: 0, scope: !367, inlinedAt: !370)
!412 = !DILocation(line: 66, column: 7, scope: !413, inlinedAt: !370)
!413 = distinct !DILexicalBlock(scope: !367, file: !3, line: 66, column: 6)
!414 = !DILocation(line: 66, column: 6, scope: !367, inlinedAt: !370)
!415 = !DILocation(line: 67, column: 13, scope: !416, inlinedAt: !370)
!416 = distinct !DILexicalBlock(scope: !367, file: !3, line: 67, column: 6)
!417 = !DILocation(line: 68, column: 20, scope: !367, inlinedAt: !370)
!418 = !DILocation(line: 68, column: 3, scope: !367, inlinedAt: !370)
!419 = !DILocation(line: 68, column: 18, scope: !367, inlinedAt: !370)
!420 = !DILocation(line: 69, column: 7, scope: !367, inlinedAt: !370)
!421 = !DILocation(line: 71, column: 18, scope: !355, inlinedAt: !370)
!422 = !DILocation(line: 72, column: 2, scope: !355, inlinedAt: !370)
!423 = !DILocation(line: 77, column: 1, scope: !355, inlinedAt: !370)
!424 = !DILocation(line: 146, column: 18, scope: !225)
!425 = !{!426, !241, i64 0}
!426 = !{!"qname_lpm_key", !241, i64 0, !242, i64 4}
!427 = !DILocation(line: 150, column: 4, scope: !428)
!428 = distinct !DILexicalBlock(scope: !225, file: !3, line: 150, column: 4)
!429 = !DILocation(line: 0, scope: !225)
!430 = !DILocation(line: 152, column: 16, scope: !431)
!431 = distinct !DILexicalBlock(scope: !225, file: !3, line: 152, column: 7)
!432 = !DILocation(line: 152, column: 14, scope: !431)
!433 = !DILocation(line: 152, column: 7, scope: !225)
!434 = !DILocation(line: 156, column: 5, scope: !435)
!435 = distinct !DILexicalBlock(scope: !436, file: !3, line: 156, column: 5)
!436 = distinct !DILexicalBlock(scope: !431, file: !3, line: 155, column: 9)
!437 = !DILocation(line: 157, column: 16, scope: !436)
!438 = !DILocation(line: 157, column: 5, scope: !436)
!439 = !DILocation(line: 158, column: 9, scope: !440)
!440 = distinct !DILexicalBlock(scope: !441, file: !3, line: 158, column: 9)
!441 = distinct !DILexicalBlock(scope: !436, file: !3, line: 157, column: 20)
!442 = !DILocation(line: 158, column: 27, scope: !440)
!443 = !DILocation(line: 158, column: 35, scope: !440)
!444 = !DILocation(line: 158, column: 38, scope: !440)
!445 = !DILocation(line: 158, column: 58, scope: !440)
!446 = !DILocation(line: 158, column: 9, scope: !441)
!447 = !DILocation(line: 160, column: 8, scope: !448)
!448 = distinct !DILexicalBlock(scope: !449, file: !3, line: 160, column: 8)
!449 = distinct !DILexicalBlock(scope: !450, file: !3, line: 159, column: 51)
!450 = distinct !DILexicalBlock(scope: !451, file: !3, line: 159, column: 10)
!451 = distinct !DILexicalBlock(scope: !440, file: !3, line: 158, column: 66)
!452 = !DILocation(line: 162, column: 8, scope: !449)
!453 = !DILocation(line: 165, column: 10, scope: !441)
!454 = distinct !{!454, !438, !455, !406}
!455 = !DILocation(line: 166, column: 5, scope: !436)
!456 = !DILocation(line: 170, column: 3, scope: !226)
!457 = !DILocation(line: 175, column: 1, scope: !2)
!458 = !DILocation(line: 176, column: 5, scope: !2)
!459 = !DILocation(line: 177, column: 7, scope: !460)
!460 = distinct !DILexicalBlock(scope: !2, file: !3, line: 176, column: 5)
!461 = !DILocation(line: 177, column: 3, scope: !460)
!462 = !DILocation(line: 178, column: 10, scope: !2)
!463 = !DILocation(line: 179, column: 5, scope: !464)
!464 = distinct !DILexicalBlock(scope: !2, file: !3, line: 179, column: 5)
!465 = !DILocation(line: 179, column: 5, scope: !2)
!466 = !DILocation(line: 180, column: 12, scope: !467)
!467 = distinct !DILexicalBlock(scope: !464, file: !3, line: 179, column: 12)
!468 = !{!469, !469, i64 0}
!469 = !{!"long long", !242, i64 0}
!470 = !DILocation(line: 180, column: 19, scope: !467)
!471 = !DILocation(line: 180, column: 10, scope: !467)
!472 = !DILocation(line: 181, column: 3, scope: !467)
!473 = !DILocation(line: 182, column: 2, scope: !467)
!474 = !DILocation(line: 184, column: 1, scope: !2)
