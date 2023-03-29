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
@main_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !51
@xdp_patch_ports_func.____fmt.1 = internal constant [14 x i8] c"inner map %d\0A\00", align 1, !dbg !34
@xdp_patch_ports_func.____fmt.2 = internal constant [20 x i8] c"ttl %d, %ld in map\0A\00", align 1, !dbg !41
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !46
@llvm.compiler.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon* @main_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_patch_ports_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_patch_ports_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp" !dbg !2 {
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !101, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.value(metadata i32 2, metadata !102, metadata !DIExpression()), !dbg !158
  %4 = bitcast i32* %2 to i8*, !dbg !159
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #4, !dbg !159
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !160
  %6 = load i32, i32* %5, align 4, !dbg !160, !tbaa !161
  %7 = zext i32 %6 to i64, !dbg !166
  %8 = inttoptr i64 %7 to i8*, !dbg !167
  call void @llvm.dbg.value(metadata i8* %8, metadata !119, metadata !DIExpression()), !dbg !158
  %9 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !168
  %10 = load i32, i32* %9, align 4, !dbg !168, !tbaa !169
  %11 = zext i32 %10 to i64, !dbg !170
  %12 = inttoptr i64 %11 to i8*, !dbg !171
  call void @llvm.dbg.value(metadata i8* %12, metadata !120, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.value(metadata i8* %12, metadata !121, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !105, metadata !DIExpression(DW_OP_deref)), !dbg !158
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !172, metadata !DIExpression()) #4, !dbg !181
  call void @llvm.dbg.value(metadata i8* %8, metadata !179, metadata !DIExpression()) #4, !dbg !181
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !180, metadata !DIExpression()) #4, !dbg !181
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !183, metadata !DIExpression()) #4, !dbg !208
  call void @llvm.dbg.value(metadata i8* %8, metadata !195, metadata !DIExpression()) #4, !dbg !208
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !196, metadata !DIExpression()) #4, !dbg !208
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !197, metadata !DIExpression()) #4, !dbg !208
  call void @llvm.dbg.value(metadata i8* %12, metadata !198, metadata !DIExpression()) #4, !dbg !208
  call void @llvm.dbg.value(metadata i32 14, metadata !199, metadata !DIExpression()) #4, !dbg !208
  %13 = getelementptr i8, i8* %12, i64 14, !dbg !210
  %14 = icmp ugt i8* %13, %8, !dbg !212
  br i1 %14, label %82, label %15, !dbg !213

15:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %12, metadata !198, metadata !DIExpression()) #4, !dbg !208
  call void @llvm.dbg.value(metadata i8* %13, metadata !121, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.value(metadata i8* %13, metadata !200, metadata !DIExpression()) #4, !dbg !208
  %16 = getelementptr inbounds i8, i8* %12, i64 12, !dbg !214
  %17 = bitcast i8* %16 to i16*, !dbg !214
  call void @llvm.dbg.value(metadata i16 undef, metadata !206, metadata !DIExpression()) #4, !dbg !208
  call void @llvm.dbg.value(metadata i32 0, metadata !207, metadata !DIExpression()) #4, !dbg !208
  %18 = inttoptr i64 %7 to %struct.vlan_hdr*
  %19 = load i16, i16* %17, align 1, !dbg !208, !tbaa !215
  call void @llvm.dbg.value(metadata i16 %19, metadata !206, metadata !DIExpression()) #4, !dbg !208
  call void @llvm.dbg.value(metadata i16 %19, metadata !217, metadata !DIExpression()) #4, !dbg !222
  %20 = icmp eq i16 %19, 129, !dbg !228
  %21 = icmp ne i16 %19, -22392, !dbg !229
  %22 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %20) #4
  %23 = xor i1 %22, true, !dbg !229
  %24 = select i1 %23, i1 %21, i1 false, !dbg !229
  br i1 %24, label %46, label %25, !dbg !230

25:                                               ; preds = %15
  %26 = getelementptr i8, i8* %12, i64 18, !dbg !231
  %27 = bitcast i8* %26 to %struct.vlan_hdr*, !dbg !231
  %28 = icmp ugt %struct.vlan_hdr* %27, %18, !dbg !233
  br i1 %28, label %46, label %29, !dbg !234

29:                                               ; preds = %25
  call void @llvm.dbg.value(metadata i16 undef, metadata !206, metadata !DIExpression()) #4, !dbg !208
  %30 = getelementptr i8, i8* %12, i64 16, !dbg !235
  %31 = bitcast i8* %30 to i16*, !dbg !235
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %27, metadata !200, metadata !DIExpression()) #4, !dbg !208
  call void @llvm.dbg.value(metadata i32 1, metadata !207, metadata !DIExpression()) #4, !dbg !208
  %32 = load i16, i16* %31, align 1, !dbg !208, !tbaa !215
  call void @llvm.dbg.value(metadata i16 %32, metadata !206, metadata !DIExpression()) #4, !dbg !208
  call void @llvm.dbg.value(metadata i16 %32, metadata !217, metadata !DIExpression()) #4, !dbg !222
  %33 = icmp eq i16 %32, 129, !dbg !228
  %34 = icmp ne i16 %32, -22392, !dbg !229
  %35 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %33) #4
  %36 = xor i1 %35, true, !dbg !229
  %37 = select i1 %36, i1 %34, i1 false, !dbg !229
  br i1 %37, label %46, label %38, !dbg !230

38:                                               ; preds = %29
  %39 = getelementptr i8, i8* %12, i64 22, !dbg !231
  %40 = bitcast i8* %39 to %struct.vlan_hdr*, !dbg !231
  %41 = icmp ugt %struct.vlan_hdr* %40, %18, !dbg !233
  br i1 %41, label %46, label %42, !dbg !234

42:                                               ; preds = %38
  call void @llvm.dbg.value(metadata i16 undef, metadata !206, metadata !DIExpression()) #4, !dbg !208
  %43 = getelementptr i8, i8* %12, i64 20, !dbg !235
  %44 = bitcast i8* %43 to i16*, !dbg !235
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %40, metadata !200, metadata !DIExpression()) #4, !dbg !208
  call void @llvm.dbg.value(metadata i32 2, metadata !207, metadata !DIExpression()) #4, !dbg !208
  %45 = load i16, i16* %44, align 1, !dbg !208, !tbaa !215
  call void @llvm.dbg.value(metadata i16 %45, metadata !206, metadata !DIExpression()) #4, !dbg !208
  br label %46

46:                                               ; preds = %15, %25, %29, %38, %42
  %47 = phi i8* [ %13, %25 ], [ %13, %15 ], [ %26, %29 ], [ %26, %38 ], [ %39, %42 ], !dbg !208
  %48 = phi i16 [ %19, %25 ], [ %19, %15 ], [ %32, %29 ], [ %32, %38 ], [ %45, %42 ], !dbg !208
  call void @llvm.dbg.value(metadata i8* %47, metadata !121, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.value(metadata i16 %48, metadata !103, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !158
  %49 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @xdp_patch_ports_func.____fmt, i64 0, i64 0), i32 6) #4, !dbg !236
  %50 = icmp eq i16 %48, 8, !dbg !238
  br i1 %50, label %51, label %82, !dbg !239

51:                                               ; preds = %46
  call void @llvm.dbg.value(metadata i8* %47, metadata !126, metadata !DIExpression()), !dbg !240
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %3) #4, !dbg !241
  call void @llvm.dbg.value(metadata i8 -1, metadata !148, metadata !DIExpression()), !dbg !240
  store i8 -1, i8* %3, align 1, !dbg !242, !tbaa !243
  %52 = getelementptr inbounds i8, i8* %47, i64 20, !dbg !244
  %53 = bitcast i8* %52 to %struct.iphdr*, !dbg !244
  %54 = inttoptr i64 %7 to %struct.iphdr*, !dbg !246
  %55 = icmp ugt %struct.iphdr* %53, %54, !dbg !247
  br i1 %55, label %80, label %56, !dbg !248

56:                                               ; preds = %51
  %57 = load i8, i8* %47, align 4, !dbg !249
  %58 = shl i8 %57, 2, !dbg !250
  %59 = and i8 %58, 60, !dbg !250
  call void @llvm.dbg.value(metadata i8 %59, metadata !147, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !240
  %60 = icmp ult i8 %59, 20, !dbg !251
  br i1 %60, label %80, label %61, !dbg !253

61:                                               ; preds = %56
  %62 = zext i8 %59 to i64
  call void @llvm.dbg.value(metadata i64 %62, metadata !147, metadata !DIExpression()), !dbg !240
  %63 = getelementptr i8, i8* %47, i64 %62, !dbg !254
  %64 = icmp ugt i8* %63, %8, !dbg !256
  br i1 %64, label %80, label %65, !dbg !257

65:                                               ; preds = %61
  call void @llvm.dbg.value(metadata i8* %63, metadata !121, metadata !DIExpression()), !dbg !158
  %66 = getelementptr inbounds i8, i8* %47, i64 8, !dbg !258
  %67 = load i8, i8* %66, align 4, !dbg !258, !tbaa !259
  call void @llvm.dbg.value(metadata i8 %67, metadata !148, metadata !DIExpression()), !dbg !240
  store i8 %67, i8* %3, align 1, !dbg !261, !tbaa !243
  %68 = getelementptr inbounds i8, i8* %47, i64 12, !dbg !262
  %69 = bitcast i8* %68 to i32*, !dbg !262
  %70 = load i32, i32* %69, align 4, !dbg !262, !tbaa !263
  call void @llvm.dbg.value(metadata i32 %70, metadata !104, metadata !DIExpression()), !dbg !158
  store i32 %70, i32* %2, align 4, !dbg !264, !tbaa !265
  call void @llvm.dbg.value(metadata %struct.inner_map* null, metadata !149, metadata !DIExpression()), !dbg !240
  call void @llvm.dbg.value(metadata i32* %2, metadata !104, metadata !DIExpression(DW_OP_deref)), !dbg !158
  %71 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon* @main_map to i8*), i8* nonnull %4) #4, !dbg !266
  call void @llvm.dbg.value(metadata i8* %71, metadata !149, metadata !DIExpression()), !dbg !240
  %72 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @xdp_patch_ports_func.____fmt.1, i64 0, i64 0), i32 14, i8* %71) #4, !dbg !267
  %73 = icmp eq i8* %71, null, !dbg !269
  br i1 %73, label %81, label %74, !dbg !271

74:                                               ; preds = %65
  call void @llvm.dbg.value(metadata i8* %3, metadata !148, metadata !DIExpression(DW_OP_deref)), !dbg !240
  %75 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* nonnull %71, i8* nonnull %3) #4, !dbg !272
  call void @llvm.dbg.value(metadata i8* %75, metadata !150, metadata !DIExpression()), !dbg !240
  %76 = load i8, i8* %3, align 1, !dbg !274, !tbaa !243
  call void @llvm.dbg.value(metadata i8 %76, metadata !148, metadata !DIExpression()), !dbg !240
  %77 = zext i8 %76 to i32, !dbg !274
  %78 = ptrtoint i8* %75 to i64, !dbg !274
  %79 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @xdp_patch_ports_func.____fmt.2, i64 0, i64 0), i32 20, i32 %77, i64 %78) #4, !dbg !274
  br label %81, !dbg !276

80:                                               ; preds = %51, %56, %61
  call void @llvm.dbg.value(metadata i32 1, metadata !102, metadata !DIExpression()), !dbg !158
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %3) #4, !dbg !278
  br label %82

81:                                               ; preds = %65, %74
  call void @llvm.dbg.value(metadata i32 1, metadata !102, metadata !DIExpression()), !dbg !158
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %3) #4, !dbg !278
  br label %82

82:                                               ; preds = %1, %46, %81, %80
  %83 = phi i32 [ 0, %80 ], [ 1, %81 ], [ 2, %46 ], [ 0, %1 ], !dbg !158
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #4, !dbg !279
  ret i32 %83, !dbg !279
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
!llvm.module.flags = !{!153, !154, !155, !156}
!llvm.ident = !{!157}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 57, type: !152, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "xdp_patch_ports_func", scope: !3, file: !3, line: 42, type: !4, scopeLine: 43, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !19, retainedNodes: !100)
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
!28 = !{!29, !30, !31, !6}
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!30 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !13, line: 24, baseType: !32)
!32 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!33 = !{!0, !34, !41, !46, !51, !86, !93}
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 82, type: !36, isLocal: true, isDefinition: true)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 112, elements: !39)
!37 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !38)
!38 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!39 = !{!40}
!40 = !DISubrange(count: 14)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 87, type: !43, isLocal: true, isDefinition: true)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 160, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 20)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "_license", scope: !19, file: !3, line: 102, type: !48, isLocal: false, isDefinition: true)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 32, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 4)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(name: "main_map", scope: !19, file: !3, line: 28, type: !53, isLocal: false, isDefinition: true)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 22, size: 192, elements: !54)
!54 = !{!55, !60, !62, !67}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !53, file: !3, line: 23, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 416, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 13)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !53, file: !3, line: 24, baseType: !61, size: 64, offset: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !53, file: !3, line: 26, baseType: !63, size: 64, offset: 128)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 8160, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 255)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "values", scope: !53, file: !3, line: 27, baseType: !68, offset: 192)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, elements: !84)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "inner_map", file: !3, line: 15, size: 256, elements: !71)
!71 = !{!72, !77, !82, !83}
!72 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !70, file: !3, line: 16, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 1)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !70, file: !3, line: 17, baseType: !78, size: 64, offset: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 256, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 8)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !70, file: !3, line: 18, baseType: !61, size: 64, offset: 128)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !70, file: !3, line: 19, baseType: !61, size: 64, offset: 192)
!84 = !{!85}
!85 = !DISubrange(count: -1)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !19, file: !88, line: 176, type: !89, isLocal: true, isDefinition: true)
!88 = !DIFile(filename: "/usr/include/bpf/bpf_helper_defs.h", directory: "")
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DISubroutineType(types: !91)
!91 = !{!30, !92, !12, null}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!93 = !DIGlobalVariableExpression(var: !94, expr: !DIExpression())
!94 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !19, file: !88, line: 55, type: !95, isLocal: true, isDefinition: true)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DISubroutineType(types: !97)
!97 = !{!29, !29, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!100 = !{!101, !102, !103, !104, !105, !119, !120, !121, !126, !147, !148, !149, !150, !151}
!101 = !DILocalVariable(name: "ctx", arg: 1, scope: !2, file: !3, line: 42, type: !7)
!102 = !DILocalVariable(name: "action", scope: !2, file: !3, line: 44, type: !6)
!103 = !DILocalVariable(name: "eth_type", scope: !2, file: !3, line: 45, type: !6)
!104 = !DILocalVariable(name: "saddrv4", scope: !2, file: !3, line: 46, type: !12)
!105 = !DILocalVariable(name: "eth", scope: !2, file: !3, line: 47, type: !106)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !108, line: 169, size: 112, elements: !109)
!108 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!109 = !{!110, !115, !116}
!110 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !107, file: !108, line: 170, baseType: !111, size: 48)
!111 = !DICompositeType(tag: DW_TAG_array_type, baseType: !112, size: 48, elements: !113)
!112 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!113 = !{!114}
!114 = !DISubrange(count: 6)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !107, file: !108, line: 171, baseType: !111, size: 48, offset: 48)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !107, file: !108, line: 172, baseType: !117, size: 16, offset: 96)
!117 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !118, line: 25, baseType: !31)
!118 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!119 = !DILocalVariable(name: "data_end", scope: !2, file: !3, line: 48, type: !29)
!120 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 49, type: !29)
!121 = !DILocalVariable(name: "nh", scope: !2, file: !3, line: 50, type: !122)
!122 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !123, line: 33, size: 64, elements: !124)
!123 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/root/qname_intercepter/ip_filter")
!124 = !{!125}
!125 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !122, file: !123, line: 34, baseType: !29, size: 64)
!126 = !DILocalVariable(name: "iph", scope: !127, file: !3, line: 60, type: !129)
!127 = distinct !DILexicalBlock(scope: !128, file: !3, line: 59, column: 39)
!128 = distinct !DILexicalBlock(scope: !2, file: !3, line: 59, column: 6)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !131, line: 86, size: 160, elements: !132)
!131 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!132 = !{!133, !135, !136, !137, !138, !139, !140, !141, !142, !144, !146}
!133 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !130, file: !131, line: 88, baseType: !134, size: 4, flags: DIFlagBitField, extraData: i64 0)
!134 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !13, line: 21, baseType: !112)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !130, file: !131, line: 89, baseType: !134, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !130, file: !131, line: 96, baseType: !134, size: 8, offset: 8)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !130, file: !131, line: 97, baseType: !117, size: 16, offset: 16)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !130, file: !131, line: 98, baseType: !117, size: 16, offset: 32)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !130, file: !131, line: 99, baseType: !117, size: 16, offset: 48)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !130, file: !131, line: 100, baseType: !134, size: 8, offset: 64)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !130, file: !131, line: 101, baseType: !134, size: 8, offset: 72)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !130, file: !131, line: 102, baseType: !143, size: 16, offset: 80)
!143 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !118, line: 31, baseType: !31)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !130, file: !131, line: 103, baseType: !145, size: 32, offset: 96)
!145 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !118, line: 27, baseType: !12)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !130, file: !131, line: 104, baseType: !145, size: 32, offset: 128)
!147 = !DILocalVariable(name: "hdrsize", scope: !127, file: !3, line: 61, type: !6)
!148 = !DILocalVariable(name: "ttl", scope: !127, file: !3, line: 62, type: !134)
!149 = !DILocalVariable(name: "res", scope: !127, file: !3, line: 80, type: !69)
!150 = !DILocalVariable(name: "ttlp", scope: !127, file: !3, line: 84, type: !61)
!151 = !DILabel(scope: !2, name: "out", file: !3, line: 98)
!152 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 48, elements: !113)
!153 = !{i32 7, !"Dwarf Version", i32 4}
!154 = !{i32 2, !"Debug Info Version", i32 3}
!155 = !{i32 1, !"wchar_size", i32 4}
!156 = !{i32 7, !"frame-pointer", i32 2}
!157 = !{!"Alpine clang version 13.0.1"}
!158 = !DILocation(line: 0, scope: !2)
!159 = !DILocation(line: 46, column: 2, scope: !2)
!160 = !DILocation(line: 48, column: 38, scope: !2)
!161 = !{!162, !163, i64 4}
!162 = !{!"xdp_md", !163, i64 0, !163, i64 4, !163, i64 8, !163, i64 12, !163, i64 16}
!163 = !{!"int", !164, i64 0}
!164 = !{!"omnipotent char", !165, i64 0}
!165 = !{!"Simple C/C++ TBAA"}
!166 = !DILocation(line: 48, column: 27, scope: !2)
!167 = !DILocation(line: 48, column: 19, scope: !2)
!168 = !DILocation(line: 49, column: 34, scope: !2)
!169 = !{!162, !163, i64 0}
!170 = !DILocation(line: 49, column: 23, scope: !2)
!171 = !DILocation(line: 49, column: 15, scope: !2)
!172 = !DILocalVariable(name: "nh", arg: 1, scope: !173, file: !123, line: 124, type: !176)
!173 = distinct !DISubprogram(name: "parse_ethhdr", scope: !123, file: !123, line: 124, type: !174, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !19, retainedNodes: !178)
!174 = !DISubroutineType(types: !175)
!175 = !{!6, !176, !29, !177}
!176 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!178 = !{!172, !179, !180}
!179 = !DILocalVariable(name: "data_end", arg: 2, scope: !173, file: !123, line: 125, type: !29)
!180 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !173, file: !123, line: 126, type: !177)
!181 = !DILocation(line: 0, scope: !173, inlinedAt: !182)
!182 = distinct !DILocation(line: 52, column: 13, scope: !2)
!183 = !DILocalVariable(name: "nh", arg: 1, scope: !184, file: !123, line: 79, type: !176)
!184 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !123, file: !123, line: 79, type: !185, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !19, retainedNodes: !194)
!185 = !DISubroutineType(types: !186)
!186 = !{!6, !176, !29, !177, !187}
!187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !188, size: 64)
!188 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !123, line: 64, size: 32, elements: !189)
!189 = !{!190}
!190 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !188, file: !123, line: 65, baseType: !191, size: 32)
!191 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 32, elements: !192)
!192 = !{!193}
!193 = !DISubrange(count: 2)
!194 = !{!183, !195, !196, !197, !198, !199, !200, !206, !207}
!195 = !DILocalVariable(name: "data_end", arg: 2, scope: !184, file: !123, line: 80, type: !29)
!196 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !184, file: !123, line: 81, type: !177)
!197 = !DILocalVariable(name: "vlans", arg: 4, scope: !184, file: !123, line: 82, type: !187)
!198 = !DILocalVariable(name: "eth", scope: !184, file: !123, line: 84, type: !106)
!199 = !DILocalVariable(name: "hdrsize", scope: !184, file: !123, line: 85, type: !6)
!200 = !DILocalVariable(name: "vlh", scope: !184, file: !123, line: 86, type: !201)
!201 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !202, size: 64)
!202 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !123, line: 42, size: 32, elements: !203)
!203 = !{!204, !205}
!204 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !202, file: !123, line: 43, baseType: !117, size: 16)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !202, file: !123, line: 44, baseType: !117, size: 16, offset: 16)
!206 = !DILocalVariable(name: "h_proto", scope: !184, file: !123, line: 87, type: !31)
!207 = !DILocalVariable(name: "i", scope: !184, file: !123, line: 88, type: !6)
!208 = !DILocation(line: 0, scope: !184, inlinedAt: !209)
!209 = distinct !DILocation(line: 129, column: 9, scope: !173, inlinedAt: !182)
!210 = !DILocation(line: 93, column: 14, scope: !211, inlinedAt: !209)
!211 = distinct !DILexicalBlock(scope: !184, file: !123, line: 93, column: 6)
!212 = !DILocation(line: 93, column: 24, scope: !211, inlinedAt: !209)
!213 = !DILocation(line: 93, column: 6, scope: !184, inlinedAt: !209)
!214 = !DILocation(line: 99, column: 17, scope: !184, inlinedAt: !209)
!215 = !{!216, !216, i64 0}
!216 = !{!"short", !164, i64 0}
!217 = !DILocalVariable(name: "h_proto", arg: 1, scope: !218, file: !123, line: 68, type: !31)
!218 = distinct !DISubprogram(name: "proto_is_vlan", scope: !123, file: !123, line: 68, type: !219, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !19, retainedNodes: !221)
!219 = !DISubroutineType(types: !220)
!220 = !{!6, !31}
!221 = !{!217}
!222 = !DILocation(line: 0, scope: !218, inlinedAt: !223)
!223 = distinct !DILocation(line: 106, column: 8, scope: !224, inlinedAt: !209)
!224 = distinct !DILexicalBlock(scope: !225, file: !123, line: 106, column: 7)
!225 = distinct !DILexicalBlock(scope: !226, file: !123, line: 105, column: 39)
!226 = distinct !DILexicalBlock(scope: !227, file: !123, line: 105, column: 2)
!227 = distinct !DILexicalBlock(scope: !184, file: !123, line: 105, column: 2)
!228 = !DILocation(line: 70, column: 20, scope: !218, inlinedAt: !223)
!229 = !DILocation(line: 70, column: 46, scope: !218, inlinedAt: !223)
!230 = !DILocation(line: 106, column: 7, scope: !225, inlinedAt: !209)
!231 = !DILocation(line: 109, column: 11, scope: !232, inlinedAt: !209)
!232 = distinct !DILexicalBlock(scope: !225, file: !123, line: 109, column: 7)
!233 = !DILocation(line: 109, column: 15, scope: !232, inlinedAt: !209)
!234 = !DILocation(line: 109, column: 7, scope: !225, inlinedAt: !209)
!235 = !DILocation(line: 112, column: 18, scope: !225, inlinedAt: !209)
!236 = !DILocation(line: 57, column: 2, scope: !237)
!237 = distinct !DILexicalBlock(scope: !2, file: !3, line: 57, column: 2)
!238 = !DILocation(line: 59, column: 15, scope: !128)
!239 = !DILocation(line: 59, column: 6, scope: !2)
!240 = !DILocation(line: 0, scope: !127)
!241 = !DILocation(line: 62, column: 3, scope: !127)
!242 = !DILocation(line: 62, column: 8, scope: !127)
!243 = !{!164, !164, i64 0}
!244 = !DILocation(line: 64, column: 11, scope: !245)
!245 = distinct !DILexicalBlock(scope: !127, file: !3, line: 64, column: 7)
!246 = !DILocation(line: 64, column: 17, scope: !245)
!247 = !DILocation(line: 64, column: 15, scope: !245)
!248 = !DILocation(line: 64, column: 7, scope: !127)
!249 = !DILocation(line: 67, column: 18, scope: !127)
!250 = !DILocation(line: 67, column: 22, scope: !127)
!251 = !DILocation(line: 69, column: 14, scope: !252)
!252 = distinct !DILexicalBlock(scope: !127, file: !3, line: 69, column: 6)
!253 = !DILocation(line: 69, column: 6, scope: !127)
!254 = !DILocation(line: 73, column: 14, scope: !255)
!255 = distinct !DILexicalBlock(scope: !127, file: !3, line: 73, column: 7)
!256 = !DILocation(line: 73, column: 24, scope: !255)
!257 = !DILocation(line: 73, column: 7, scope: !127)
!258 = !DILocation(line: 77, column: 14, scope: !127)
!259 = !{!260, !164, i64 8}
!260 = !{!"iphdr", !164, i64 0, !164, i64 0, !164, i64 1, !216, i64 2, !216, i64 4, !216, i64 6, !164, i64 8, !164, i64 9, !216, i64 10, !163, i64 12, !163, i64 16}
!261 = !DILocation(line: 77, column: 7, scope: !127)
!262 = !DILocation(line: 78, column: 18, scope: !127)
!263 = !{!260, !163, i64 12}
!264 = !DILocation(line: 78, column: 11, scope: !127)
!265 = !{!163, !163, i64 0}
!266 = !DILocation(line: 81, column: 15, scope: !127)
!267 = !DILocation(line: 82, column: 3, scope: !268)
!268 = distinct !DILexicalBlock(scope: !127, file: !3, line: 82, column: 3)
!269 = !DILocation(line: 85, column: 12, scope: !270)
!270 = distinct !DILexicalBlock(scope: !127, file: !3, line: 85, column: 12)
!271 = !DILocation(line: 85, column: 12, scope: !127)
!272 = !DILocation(line: 86, column: 11, scope: !273)
!273 = distinct !DILexicalBlock(scope: !270, file: !3, line: 85, column: 16)
!274 = !DILocation(line: 87, column: 4, scope: !275)
!275 = distinct !DILexicalBlock(scope: !273, file: !3, line: 87, column: 4)
!276 = !DILocation(line: 88, column: 13, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !3, line: 88, column: 7)
!278 = !DILocation(line: 94, column: 2, scope: !128)
!279 = !DILocation(line: 100, column: 1, scope: !2)
