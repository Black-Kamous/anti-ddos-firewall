; ModuleID = 'lpm_test.c'
source_filename = "lpm_test.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { [13 x i32]*, i32*, [255 x i32]*, [0 x %struct.inner_map*] }
%struct.inner_map = type { [1 x i32]*, [8 x i32]*, i32*, i32* }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }

@xdp_patch_ports_func.____fmt = internal constant [6 x i8] c"Here\0A\00", align 1, !dbg !0
@main_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !56
@xdp_patch_ports_func.____fmt.1 = internal constant [12 x i8] c"sipaddr %x\0A\00", align 1, !dbg !34
@xdp_patch_ports_func.____fmt.2 = internal constant [14 x i8] c"inner map %d\0A\00", align 1, !dbg !41
@xdp_patch_ports_func.____fmt.3 = internal constant [19 x i8] c"ttl %d, %d in map\0A\00", align 1, !dbg !46
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !51
@llvm.compiler.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon* @main_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_patch_ports_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_patch_ports_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp" !dbg !2 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !106, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i32 2, metadata !107, metadata !DIExpression()), !dbg !163
  %4 = bitcast i32* %2 to i8*, !dbg !164
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #4, !dbg !164
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !165
  %6 = load i32, i32* %5, align 4, !dbg !165, !tbaa !166
  %7 = zext i32 %6 to i64, !dbg !171
  %8 = inttoptr i64 %7 to i8*, !dbg !172
  call void @llvm.dbg.value(metadata i8* %8, metadata !124, metadata !DIExpression()), !dbg !163
  %9 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !173
  %10 = load i32, i32* %9, align 4, !dbg !173, !tbaa !174
  %11 = zext i32 %10 to i64, !dbg !175
  %12 = inttoptr i64 %11 to i8*, !dbg !176
  call void @llvm.dbg.value(metadata i8* %12, metadata !125, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i8* %12, metadata !126, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !110, metadata !DIExpression(DW_OP_deref)), !dbg !163
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !177, metadata !DIExpression()) #4, !dbg !186
  call void @llvm.dbg.value(metadata i8* %8, metadata !184, metadata !DIExpression()) #4, !dbg !186
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !185, metadata !DIExpression()) #4, !dbg !186
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !188, metadata !DIExpression()) #4, !dbg !213
  call void @llvm.dbg.value(metadata i8* %8, metadata !200, metadata !DIExpression()) #4, !dbg !213
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !201, metadata !DIExpression()) #4, !dbg !213
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !202, metadata !DIExpression()) #4, !dbg !213
  call void @llvm.dbg.value(metadata i8* %12, metadata !203, metadata !DIExpression()) #4, !dbg !213
  call void @llvm.dbg.value(metadata i32 14, metadata !204, metadata !DIExpression()) #4, !dbg !213
  %13 = getelementptr i8, i8* %12, i64 14, !dbg !215
  %14 = icmp ugt i8* %13, %8, !dbg !217
  br i1 %14, label %88, label %15, !dbg !218

15:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %12, metadata !203, metadata !DIExpression()) #4, !dbg !213
  call void @llvm.dbg.value(metadata i8* %13, metadata !126, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i8* %13, metadata !205, metadata !DIExpression()) #4, !dbg !213
  %16 = getelementptr inbounds i8, i8* %12, i64 12, !dbg !219
  %17 = bitcast i8* %16 to i16*, !dbg !219
  call void @llvm.dbg.value(metadata i16 undef, metadata !211, metadata !DIExpression()) #4, !dbg !213
  call void @llvm.dbg.value(metadata i32 0, metadata !212, metadata !DIExpression()) #4, !dbg !213
  %18 = inttoptr i64 %7 to %struct.vlan_hdr*
  %19 = load i16, i16* %17, align 1, !dbg !213, !tbaa !220
  call void @llvm.dbg.value(metadata i16 %19, metadata !211, metadata !DIExpression()) #4, !dbg !213
  call void @llvm.dbg.value(metadata i16 %19, metadata !222, metadata !DIExpression()) #4, !dbg !227
  %20 = icmp eq i16 %19, 129, !dbg !233
  %21 = icmp ne i16 %19, -22392, !dbg !234
  %22 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %20) #4
  %23 = xor i1 %22, true, !dbg !234
  %24 = select i1 %23, i1 %21, i1 false, !dbg !234
  br i1 %24, label %46, label %25, !dbg !235

25:                                               ; preds = %15
  %26 = getelementptr i8, i8* %12, i64 18, !dbg !236
  %27 = bitcast i8* %26 to %struct.vlan_hdr*, !dbg !236
  %28 = icmp ugt %struct.vlan_hdr* %27, %18, !dbg !238
  br i1 %28, label %46, label %29, !dbg !239

29:                                               ; preds = %25
  call void @llvm.dbg.value(metadata i16 undef, metadata !211, metadata !DIExpression()) #4, !dbg !213
  %30 = getelementptr i8, i8* %12, i64 16, !dbg !240
  %31 = bitcast i8* %30 to i16*, !dbg !240
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %27, metadata !205, metadata !DIExpression()) #4, !dbg !213
  call void @llvm.dbg.value(metadata i32 1, metadata !212, metadata !DIExpression()) #4, !dbg !213
  %32 = load i16, i16* %31, align 1, !dbg !213, !tbaa !220
  call void @llvm.dbg.value(metadata i16 %32, metadata !211, metadata !DIExpression()) #4, !dbg !213
  call void @llvm.dbg.value(metadata i16 %32, metadata !222, metadata !DIExpression()) #4, !dbg !227
  %33 = icmp eq i16 %32, 129, !dbg !233
  %34 = icmp ne i16 %32, -22392, !dbg !234
  %35 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %33) #4
  %36 = xor i1 %35, true, !dbg !234
  %37 = select i1 %36, i1 %34, i1 false, !dbg !234
  br i1 %37, label %46, label %38, !dbg !235

38:                                               ; preds = %29
  %39 = getelementptr i8, i8* %12, i64 22, !dbg !236
  %40 = bitcast i8* %39 to %struct.vlan_hdr*, !dbg !236
  %41 = icmp ugt %struct.vlan_hdr* %40, %18, !dbg !238
  br i1 %41, label %46, label %42, !dbg !239

42:                                               ; preds = %38
  call void @llvm.dbg.value(metadata i16 undef, metadata !211, metadata !DIExpression()) #4, !dbg !213
  %43 = getelementptr i8, i8* %12, i64 20, !dbg !240
  %44 = bitcast i8* %43 to i16*, !dbg !240
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %40, metadata !205, metadata !DIExpression()) #4, !dbg !213
  call void @llvm.dbg.value(metadata i32 2, metadata !212, metadata !DIExpression()) #4, !dbg !213
  %45 = load i16, i16* %44, align 1, !dbg !213, !tbaa !220
  call void @llvm.dbg.value(metadata i16 %45, metadata !211, metadata !DIExpression()) #4, !dbg !213
  br label %46

46:                                               ; preds = %15, %25, %29, %38, %42
  %47 = phi i8* [ %13, %25 ], [ %13, %15 ], [ %26, %29 ], [ %26, %38 ], [ %39, %42 ], !dbg !213
  %48 = phi i16 [ %19, %25 ], [ %19, %15 ], [ %32, %29 ], [ %32, %38 ], [ %45, %42 ], !dbg !213
  call void @llvm.dbg.value(metadata i8* %47, metadata !126, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i16 %48, metadata !108, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !163
  %49 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @xdp_patch_ports_func.____fmt, i64 0, i64 0), i32 6) #4, !dbg !241
  %50 = icmp eq i16 %48, 8, !dbg !243
  br i1 %50, label %51, label %88, !dbg !244

51:                                               ; preds = %46
  call void @llvm.dbg.value(metadata i8* %47, metadata !131, metadata !DIExpression()), !dbg !245
  %52 = bitcast i32* %3 to i8*, !dbg !246
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %52) #4, !dbg !246
  call void @llvm.dbg.value(metadata i32 255, metadata !153, metadata !DIExpression()), !dbg !245
  store i32 255, i32* %3, align 4, !dbg !247, !tbaa !248
  %53 = getelementptr inbounds i8, i8* %47, i64 20, !dbg !249
  %54 = bitcast i8* %53 to %struct.iphdr*, !dbg !249
  %55 = inttoptr i64 %7 to %struct.iphdr*, !dbg !251
  %56 = icmp ugt %struct.iphdr* %54, %55, !dbg !252
  br i1 %56, label %86, label %57, !dbg !253

57:                                               ; preds = %51
  %58 = load i8, i8* %47, align 4, !dbg !254
  %59 = shl i8 %58, 2, !dbg !255
  %60 = and i8 %59, 60, !dbg !255
  call void @llvm.dbg.value(metadata i8 %60, metadata !152, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !245
  %61 = icmp ult i8 %60, 20, !dbg !256
  br i1 %61, label %86, label %62, !dbg !258

62:                                               ; preds = %57
  %63 = zext i8 %60 to i64
  call void @llvm.dbg.value(metadata i64 %63, metadata !152, metadata !DIExpression()), !dbg !245
  %64 = getelementptr i8, i8* %47, i64 %63, !dbg !259
  %65 = icmp ugt i8* %64, %8, !dbg !261
  br i1 %65, label %86, label %66, !dbg !262

66:                                               ; preds = %62
  call void @llvm.dbg.value(metadata i8* %64, metadata !126, metadata !DIExpression()), !dbg !163
  %67 = getelementptr inbounds i8, i8* %47, i64 8, !dbg !263
  %68 = load i8, i8* %67, align 4, !dbg !263, !tbaa !264
  %69 = zext i8 %68 to i32, !dbg !266
  call void @llvm.dbg.value(metadata i32 %69, metadata !153, metadata !DIExpression()), !dbg !245
  store i32 %69, i32* %3, align 4, !dbg !267, !tbaa !248
  %70 = getelementptr inbounds i8, i8* %47, i64 12, !dbg !268
  %71 = bitcast i8* %70 to i32*, !dbg !268
  %72 = load i32, i32* %71, align 4, !dbg !268, !tbaa !269
  call void @llvm.dbg.value(metadata i32 %72, metadata !109, metadata !DIExpression()), !dbg !163
  store i32 %72, i32* %2, align 4, !dbg !270, !tbaa !248
  call void @llvm.dbg.value(metadata %struct.inner_map* null, metadata !154, metadata !DIExpression()), !dbg !245
  call void @llvm.dbg.value(metadata i32* %2, metadata !109, metadata !DIExpression(DW_OP_deref)), !dbg !163
  %73 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon* @main_map to i8*), i8* nonnull %4) #4, !dbg !271
  call void @llvm.dbg.value(metadata i8* %73, metadata !154, metadata !DIExpression()), !dbg !245
  %74 = load i32, i32* %2, align 4, !dbg !272, !tbaa !248
  call void @llvm.dbg.value(metadata i32 %74, metadata !109, metadata !DIExpression()), !dbg !163
  %75 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @xdp_patch_ports_func.____fmt.1, i64 0, i64 0), i32 12, i32 %74) #4, !dbg !272
  %76 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @xdp_patch_ports_func.____fmt.2, i64 0, i64 0), i32 14, i8* %73) #4, !dbg !274
  %77 = icmp eq i8* %73, null, !dbg !276
  br i1 %77, label %87, label %78, !dbg !278

78:                                               ; preds = %66
  call void @llvm.dbg.value(metadata i32* %3, metadata !153, metadata !DIExpression(DW_OP_deref)), !dbg !245
  %79 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* nonnull %73, i8* nonnull %52) #4, !dbg !279
  call void @llvm.dbg.value(metadata i8* %79, metadata !155, metadata !DIExpression()), !dbg !245
  %80 = icmp eq i8* %79, null, !dbg !281
  br i1 %80, label %87, label %81, !dbg !283

81:                                               ; preds = %78
  %82 = bitcast i8* %79 to i32*, !dbg !279
  call void @llvm.dbg.value(metadata i32* %82, metadata !155, metadata !DIExpression()), !dbg !245
  %83 = load i32, i32* %3, align 4, !dbg !284, !tbaa !248
  call void @llvm.dbg.value(metadata i32 %83, metadata !153, metadata !DIExpression()), !dbg !245
  %84 = load i32, i32* %82, align 4, !dbg !284, !tbaa !248
  %85 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @xdp_patch_ports_func.____fmt.3, i64 0, i64 0), i32 19, i32 %83, i32 %84) #4, !dbg !284
  br label %87, !dbg !287

86:                                               ; preds = %51, %57, %62
  call void @llvm.dbg.value(metadata i32 1, metadata !107, metadata !DIExpression()), !dbg !163
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %52) #4, !dbg !289
  br label %88

87:                                               ; preds = %66, %81, %78
  call void @llvm.dbg.value(metadata i32 1, metadata !107, metadata !DIExpression()), !dbg !163
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %52) #4, !dbg !289
  br label %88

88:                                               ; preds = %1, %46, %87, %86
  %89 = phi i32 [ 0, %86 ], [ 1, %87 ], [ 2, %46 ], [ 0, %1 ], !dbg !163
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #4, !dbg !290
  ret i32 %89, !dbg !290
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #3

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!19}
!llvm.module.flags = !{!158, !159, !160, !161}
!llvm.ident = !{!162}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 57, type: !157, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "xdp_patch_ports_func", scope: !3, file: !3, line: 42, type: !4, scopeLine: 43, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !19, retainedNodes: !105)
!3 = !DIFile(filename: "lpm_test.c", directory: "/root/qname_intercepter/ip_filter")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !9, line: 2856, size: 160, elements: !10)
!9 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/root/qname_intercepter/ip_filter")
!10 = !{!11, !15, !16, !17, !18}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !8, file: !9, line: 2857, baseType: !12, size: 32)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !13, line: 27, baseType: !14)
!13 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !8, file: !9, line: 2858, baseType: !12, size: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !8, file: !9, line: 2859, baseType: !12, size: 32, offset: 64)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !8, file: !9, line: 2861, baseType: !12, size: 32, offset: 96)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !8, file: !9, line: 2862, baseType: !12, size: 32, offset: 128)
!19 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Alpine clang version 13.0.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !20, retainedTypes: !28, globals: !33, splitDebugInlining: false, nameTableKind: None)
!20 = !{!21}
!21 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !9, line: 2845, baseType: !14, size: 32, elements: !22)
!22 = !{!23, !24, !25, !26, !27}
!23 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!24 = !DIEnumerator(name: "XDP_DROP", value: 1)
!25 = !DIEnumerator(name: "XDP_PASS", value: 2)
!26 = !DIEnumerator(name: "XDP_TX", value: 3)
!27 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!28 = !{!29, !30, !31}
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!30 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !13, line: 24, baseType: !32)
!32 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!33 = !{!0, !34, !41, !46, !51, !56, !91, !98}
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 82, type: !36, isLocal: true, isDefinition: true)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 96, elements: !39)
!37 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !38)
!38 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!39 = !{!40}
!40 = !DISubrange(count: 12)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 83, type: !43, isLocal: true, isDefinition: true)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 112, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 14)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 90, type: !48, isLocal: true, isDefinition: true)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 152, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 19)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(name: "_license", scope: !19, file: !3, line: 106, type: !53, isLocal: false, isDefinition: true)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 32, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 4)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "main_map", scope: !19, file: !3, line: 28, type: !58, isLocal: false, isDefinition: true)
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 22, size: 192, elements: !59)
!59 = !{!60, !65, !67, !72}
!60 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !58, file: !3, line: 23, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 416, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 13)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !58, file: !3, line: 24, baseType: !66, size: 64, offset: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !58, file: !3, line: 26, baseType: !68, size: 64, offset: 128)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 8160, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 255)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "values", scope: !58, file: !3, line: 27, baseType: !73, offset: 192)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !74, elements: !89)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "inner_map", file: !3, line: 15, size: 256, elements: !76)
!76 = !{!77, !82, !87, !88}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !75, file: !3, line: 16, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 1)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !75, file: !3, line: 17, baseType: !83, size: 64, offset: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 256, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 8)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !75, file: !3, line: 18, baseType: !66, size: 64, offset: 128)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !75, file: !3, line: 19, baseType: !66, size: 64, offset: 192)
!89 = !{!90}
!90 = !DISubrange(count: -1)
!91 = !DIGlobalVariableExpression(var: !92, expr: !DIExpression())
!92 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !19, file: !93, line: 176, type: !94, isLocal: true, isDefinition: true)
!93 = !DIFile(filename: "/usr/include/bpf/bpf_helper_defs.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DISubroutineType(types: !96)
!96 = !{!30, !97, !12, null}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!98 = !DIGlobalVariableExpression(var: !99, expr: !DIExpression())
!99 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !19, file: !93, line: 55, type: !100, isLocal: true, isDefinition: true)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DISubroutineType(types: !102)
!102 = !{!29, !29, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!105 = !{!106, !107, !108, !109, !110, !124, !125, !126, !131, !152, !153, !154, !155, !156}
!106 = !DILocalVariable(name: "ctx", arg: 1, scope: !2, file: !3, line: 42, type: !7)
!107 = !DILocalVariable(name: "action", scope: !2, file: !3, line: 44, type: !6)
!108 = !DILocalVariable(name: "eth_type", scope: !2, file: !3, line: 45, type: !6)
!109 = !DILocalVariable(name: "saddrv4", scope: !2, file: !3, line: 46, type: !12)
!110 = !DILocalVariable(name: "eth", scope: !2, file: !3, line: 47, type: !111)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !113, line: 169, size: 112, elements: !114)
!113 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!114 = !{!115, !120, !121}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !112, file: !113, line: 170, baseType: !116, size: 48)
!116 = !DICompositeType(tag: DW_TAG_array_type, baseType: !117, size: 48, elements: !118)
!117 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!118 = !{!119}
!119 = !DISubrange(count: 6)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !112, file: !113, line: 171, baseType: !116, size: 48, offset: 48)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !112, file: !113, line: 172, baseType: !122, size: 16, offset: 96)
!122 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !123, line: 25, baseType: !31)
!123 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!124 = !DILocalVariable(name: "data_end", scope: !2, file: !3, line: 48, type: !29)
!125 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 49, type: !29)
!126 = !DILocalVariable(name: "nh", scope: !2, file: !3, line: 50, type: !127)
!127 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !128, line: 33, size: 64, elements: !129)
!128 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/root/qname_intercepter/ip_filter")
!129 = !{!130}
!130 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !127, file: !128, line: 34, baseType: !29, size: 64)
!131 = !DILocalVariable(name: "iph", scope: !132, file: !3, line: 60, type: !134)
!132 = distinct !DILexicalBlock(scope: !133, file: !3, line: 59, column: 39)
!133 = distinct !DILexicalBlock(scope: !2, file: !3, line: 59, column: 6)
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 64)
!135 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !136, line: 86, size: 160, elements: !137)
!136 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!137 = !{!138, !140, !141, !142, !143, !144, !145, !146, !147, !149, !151}
!138 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !135, file: !136, line: 88, baseType: !139, size: 4, flags: DIFlagBitField, extraData: i64 0)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !13, line: 21, baseType: !117)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !135, file: !136, line: 89, baseType: !139, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !135, file: !136, line: 96, baseType: !139, size: 8, offset: 8)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !135, file: !136, line: 97, baseType: !122, size: 16, offset: 16)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !135, file: !136, line: 98, baseType: !122, size: 16, offset: 32)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !135, file: !136, line: 99, baseType: !122, size: 16, offset: 48)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !135, file: !136, line: 100, baseType: !139, size: 8, offset: 64)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !135, file: !136, line: 101, baseType: !139, size: 8, offset: 72)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !135, file: !136, line: 102, baseType: !148, size: 16, offset: 80)
!148 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !123, line: 31, baseType: !31)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !135, file: !136, line: 103, baseType: !150, size: 32, offset: 96)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !123, line: 27, baseType: !12)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !135, file: !136, line: 104, baseType: !150, size: 32, offset: 128)
!152 = !DILocalVariable(name: "hdrsize", scope: !132, file: !3, line: 61, type: !6)
!153 = !DILocalVariable(name: "ttl", scope: !132, file: !3, line: 62, type: !12)
!154 = !DILocalVariable(name: "res", scope: !132, file: !3, line: 80, type: !74)
!155 = !DILocalVariable(name: "ttlp", scope: !132, file: !3, line: 85, type: !66)
!156 = !DILabel(scope: !2, name: "out", file: !3, line: 102)
!157 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 48, elements: !118)
!158 = !{i32 7, !"Dwarf Version", i32 4}
!159 = !{i32 2, !"Debug Info Version", i32 3}
!160 = !{i32 1, !"wchar_size", i32 4}
!161 = !{i32 7, !"frame-pointer", i32 2}
!162 = !{!"Alpine clang version 13.0.1"}
!163 = !DILocation(line: 0, scope: !2)
!164 = !DILocation(line: 46, column: 2, scope: !2)
!165 = !DILocation(line: 48, column: 38, scope: !2)
!166 = !{!167, !168, i64 4}
!167 = !{!"xdp_md", !168, i64 0, !168, i64 4, !168, i64 8, !168, i64 12, !168, i64 16}
!168 = !{!"int", !169, i64 0}
!169 = !{!"omnipotent char", !170, i64 0}
!170 = !{!"Simple C/C++ TBAA"}
!171 = !DILocation(line: 48, column: 27, scope: !2)
!172 = !DILocation(line: 48, column: 19, scope: !2)
!173 = !DILocation(line: 49, column: 34, scope: !2)
!174 = !{!167, !168, i64 0}
!175 = !DILocation(line: 49, column: 23, scope: !2)
!176 = !DILocation(line: 49, column: 15, scope: !2)
!177 = !DILocalVariable(name: "nh", arg: 1, scope: !178, file: !128, line: 124, type: !181)
!178 = distinct !DISubprogram(name: "parse_ethhdr", scope: !128, file: !128, line: 124, type: !179, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !19, retainedNodes: !183)
!179 = !DISubroutineType(types: !180)
!180 = !{!6, !181, !29, !182}
!181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!183 = !{!177, !184, !185}
!184 = !DILocalVariable(name: "data_end", arg: 2, scope: !178, file: !128, line: 125, type: !29)
!185 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !178, file: !128, line: 126, type: !182)
!186 = !DILocation(line: 0, scope: !178, inlinedAt: !187)
!187 = distinct !DILocation(line: 52, column: 13, scope: !2)
!188 = !DILocalVariable(name: "nh", arg: 1, scope: !189, file: !128, line: 79, type: !181)
!189 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !128, file: !128, line: 79, type: !190, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !19, retainedNodes: !199)
!190 = !DISubroutineType(types: !191)
!191 = !{!6, !181, !29, !182, !192}
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!193 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !128, line: 64, size: 32, elements: !194)
!194 = !{!195}
!195 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !193, file: !128, line: 65, baseType: !196, size: 32)
!196 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 32, elements: !197)
!197 = !{!198}
!198 = !DISubrange(count: 2)
!199 = !{!188, !200, !201, !202, !203, !204, !205, !211, !212}
!200 = !DILocalVariable(name: "data_end", arg: 2, scope: !189, file: !128, line: 80, type: !29)
!201 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !189, file: !128, line: 81, type: !182)
!202 = !DILocalVariable(name: "vlans", arg: 4, scope: !189, file: !128, line: 82, type: !192)
!203 = !DILocalVariable(name: "eth", scope: !189, file: !128, line: 84, type: !111)
!204 = !DILocalVariable(name: "hdrsize", scope: !189, file: !128, line: 85, type: !6)
!205 = !DILocalVariable(name: "vlh", scope: !189, file: !128, line: 86, type: !206)
!206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !207, size: 64)
!207 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !128, line: 42, size: 32, elements: !208)
!208 = !{!209, !210}
!209 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !207, file: !128, line: 43, baseType: !122, size: 16)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !207, file: !128, line: 44, baseType: !122, size: 16, offset: 16)
!211 = !DILocalVariable(name: "h_proto", scope: !189, file: !128, line: 87, type: !31)
!212 = !DILocalVariable(name: "i", scope: !189, file: !128, line: 88, type: !6)
!213 = !DILocation(line: 0, scope: !189, inlinedAt: !214)
!214 = distinct !DILocation(line: 129, column: 9, scope: !178, inlinedAt: !187)
!215 = !DILocation(line: 93, column: 14, scope: !216, inlinedAt: !214)
!216 = distinct !DILexicalBlock(scope: !189, file: !128, line: 93, column: 6)
!217 = !DILocation(line: 93, column: 24, scope: !216, inlinedAt: !214)
!218 = !DILocation(line: 93, column: 6, scope: !189, inlinedAt: !214)
!219 = !DILocation(line: 99, column: 17, scope: !189, inlinedAt: !214)
!220 = !{!221, !221, i64 0}
!221 = !{!"short", !169, i64 0}
!222 = !DILocalVariable(name: "h_proto", arg: 1, scope: !223, file: !128, line: 68, type: !31)
!223 = distinct !DISubprogram(name: "proto_is_vlan", scope: !128, file: !128, line: 68, type: !224, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !19, retainedNodes: !226)
!224 = !DISubroutineType(types: !225)
!225 = !{!6, !31}
!226 = !{!222}
!227 = !DILocation(line: 0, scope: !223, inlinedAt: !228)
!228 = distinct !DILocation(line: 106, column: 8, scope: !229, inlinedAt: !214)
!229 = distinct !DILexicalBlock(scope: !230, file: !128, line: 106, column: 7)
!230 = distinct !DILexicalBlock(scope: !231, file: !128, line: 105, column: 39)
!231 = distinct !DILexicalBlock(scope: !232, file: !128, line: 105, column: 2)
!232 = distinct !DILexicalBlock(scope: !189, file: !128, line: 105, column: 2)
!233 = !DILocation(line: 70, column: 20, scope: !223, inlinedAt: !228)
!234 = !DILocation(line: 70, column: 46, scope: !223, inlinedAt: !228)
!235 = !DILocation(line: 106, column: 7, scope: !230, inlinedAt: !214)
!236 = !DILocation(line: 109, column: 11, scope: !237, inlinedAt: !214)
!237 = distinct !DILexicalBlock(scope: !230, file: !128, line: 109, column: 7)
!238 = !DILocation(line: 109, column: 15, scope: !237, inlinedAt: !214)
!239 = !DILocation(line: 109, column: 7, scope: !230, inlinedAt: !214)
!240 = !DILocation(line: 112, column: 18, scope: !230, inlinedAt: !214)
!241 = !DILocation(line: 57, column: 2, scope: !242)
!242 = distinct !DILexicalBlock(scope: !2, file: !3, line: 57, column: 2)
!243 = !DILocation(line: 59, column: 15, scope: !133)
!244 = !DILocation(line: 59, column: 6, scope: !2)
!245 = !DILocation(line: 0, scope: !132)
!246 = !DILocation(line: 62, column: 3, scope: !132)
!247 = !DILocation(line: 62, column: 9, scope: !132)
!248 = !{!168, !168, i64 0}
!249 = !DILocation(line: 64, column: 11, scope: !250)
!250 = distinct !DILexicalBlock(scope: !132, file: !3, line: 64, column: 7)
!251 = !DILocation(line: 64, column: 17, scope: !250)
!252 = !DILocation(line: 64, column: 15, scope: !250)
!253 = !DILocation(line: 64, column: 7, scope: !132)
!254 = !DILocation(line: 67, column: 18, scope: !132)
!255 = !DILocation(line: 67, column: 22, scope: !132)
!256 = !DILocation(line: 69, column: 14, scope: !257)
!257 = distinct !DILexicalBlock(scope: !132, file: !3, line: 69, column: 6)
!258 = !DILocation(line: 69, column: 6, scope: !132)
!259 = !DILocation(line: 73, column: 14, scope: !260)
!260 = distinct !DILexicalBlock(scope: !132, file: !3, line: 73, column: 7)
!261 = !DILocation(line: 73, column: 24, scope: !260)
!262 = !DILocation(line: 73, column: 7, scope: !132)
!263 = !DILocation(line: 77, column: 14, scope: !132)
!264 = !{!265, !169, i64 8}
!265 = !{!"iphdr", !169, i64 0, !169, i64 0, !169, i64 1, !221, i64 2, !221, i64 4, !221, i64 6, !169, i64 8, !169, i64 9, !221, i64 10, !168, i64 12, !168, i64 16}
!266 = !DILocation(line: 77, column: 9, scope: !132)
!267 = !DILocation(line: 77, column: 7, scope: !132)
!268 = !DILocation(line: 78, column: 18, scope: !132)
!269 = !{!265, !168, i64 12}
!270 = !DILocation(line: 78, column: 11, scope: !132)
!271 = !DILocation(line: 81, column: 15, scope: !132)
!272 = !DILocation(line: 82, column: 3, scope: !273)
!273 = distinct !DILexicalBlock(scope: !132, file: !3, line: 82, column: 3)
!274 = !DILocation(line: 83, column: 3, scope: !275)
!275 = distinct !DILexicalBlock(scope: !132, file: !3, line: 83, column: 3)
!276 = !DILocation(line: 86, column: 12, scope: !277)
!277 = distinct !DILexicalBlock(scope: !132, file: !3, line: 86, column: 12)
!278 = !DILocation(line: 86, column: 12, scope: !132)
!279 = !DILocation(line: 87, column: 11, scope: !280)
!280 = distinct !DILexicalBlock(scope: !277, file: !3, line: 86, column: 16)
!281 = !DILocation(line: 89, column: 7, scope: !282)
!282 = distinct !DILexicalBlock(scope: !280, file: !3, line: 89, column: 7)
!283 = !DILocation(line: 89, column: 7, scope: !280)
!284 = !DILocation(line: 90, column: 5, scope: !285)
!285 = distinct !DILexicalBlock(scope: !286, file: !3, line: 90, column: 5)
!286 = distinct !DILexicalBlock(scope: !282, file: !3, line: 89, column: 12)
!287 = !DILocation(line: 92, column: 13, scope: !288)
!288 = distinct !DILexicalBlock(scope: !280, file: !3, line: 92, column: 7)
!289 = !DILocation(line: 98, column: 2, scope: !133)
!290 = !DILocation(line: 104, column: 1, scope: !2)
