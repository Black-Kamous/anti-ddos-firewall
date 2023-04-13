; ModuleID = 'urf.c'
source_filename = "urf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { [1 x i32]*, i32*, i32*, [65535 x i32]* }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }

@main_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !0
@xdp_patch_ports_func.____fmt = internal constant [12 x i8] c"sipaddr %x\0A\00", align 1, !dbg !21
@xdp_patch_ports_func.____fmt.1 = internal constant [8 x i8] c"val %d\0A\00", align 1, !dbg !92
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !97
@llvm.compiler.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon* @main_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_patch_ports_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_patch_ports_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp" !dbg !23 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !37, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.value(metadata i32 2, metadata !38, metadata !DIExpression()), !dbg !135
  %3 = bitcast i32* %2 to i8*, !dbg !136
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #4, !dbg !136
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !137
  %5 = load i32, i32* %4, align 4, !dbg !137, !tbaa !138
  %6 = zext i32 %5 to i64, !dbg !143
  %7 = inttoptr i64 %6 to i8*, !dbg !144
  call void @llvm.dbg.value(metadata i8* %7, metadata !55, metadata !DIExpression()), !dbg !135
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !145
  %9 = load i32, i32* %8, align 4, !dbg !145, !tbaa !146
  %10 = zext i32 %9 to i64, !dbg !147
  %11 = inttoptr i64 %10 to i8*, !dbg !148
  call void @llvm.dbg.value(metadata i8* %11, metadata !56, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.value(metadata i8* %11, metadata !57, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !41, metadata !DIExpression(DW_OP_deref)), !dbg !135
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !149, metadata !DIExpression()) #4, !dbg !158
  call void @llvm.dbg.value(metadata i8* %7, metadata !156, metadata !DIExpression()) #4, !dbg !158
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !157, metadata !DIExpression()) #4, !dbg !158
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !160, metadata !DIExpression()) #4, !dbg !185
  call void @llvm.dbg.value(metadata i8* %7, metadata !172, metadata !DIExpression()) #4, !dbg !185
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !173, metadata !DIExpression()) #4, !dbg !185
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !174, metadata !DIExpression()) #4, !dbg !185
  call void @llvm.dbg.value(metadata i8* %11, metadata !175, metadata !DIExpression()) #4, !dbg !185
  call void @llvm.dbg.value(metadata i32 14, metadata !176, metadata !DIExpression()) #4, !dbg !185
  %12 = getelementptr i8, i8* %11, i64 14, !dbg !187
  %13 = icmp ugt i8* %12, %7, !dbg !189
  br i1 %13, label %79, label %14, !dbg !190

14:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %11, metadata !175, metadata !DIExpression()) #4, !dbg !185
  call void @llvm.dbg.value(metadata i8* %12, metadata !57, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.value(metadata i8* %12, metadata !177, metadata !DIExpression()) #4, !dbg !185
  %15 = getelementptr inbounds i8, i8* %11, i64 12, !dbg !191
  %16 = bitcast i8* %15 to i16*, !dbg !191
  call void @llvm.dbg.value(metadata i16 undef, metadata !183, metadata !DIExpression()) #4, !dbg !185
  call void @llvm.dbg.value(metadata i32 0, metadata !184, metadata !DIExpression()) #4, !dbg !185
  %17 = inttoptr i64 %6 to %struct.vlan_hdr*
  %18 = load i16, i16* %16, align 1, !dbg !185, !tbaa !192
  call void @llvm.dbg.value(metadata i16 %18, metadata !183, metadata !DIExpression()) #4, !dbg !185
  call void @llvm.dbg.value(metadata i16 %18, metadata !194, metadata !DIExpression()) #4, !dbg !199
  %19 = icmp eq i16 %18, 129, !dbg !205
  %20 = icmp ne i16 %18, -22392, !dbg !206
  %21 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %19) #4
  %22 = xor i1 %21, true, !dbg !206
  %23 = select i1 %22, i1 %20, i1 false, !dbg !206
  br i1 %23, label %45, label %24, !dbg !207

24:                                               ; preds = %14
  %25 = getelementptr i8, i8* %11, i64 18, !dbg !208
  %26 = bitcast i8* %25 to %struct.vlan_hdr*, !dbg !208
  %27 = icmp ugt %struct.vlan_hdr* %26, %17, !dbg !210
  br i1 %27, label %45, label %28, !dbg !211

28:                                               ; preds = %24
  call void @llvm.dbg.value(metadata i16 undef, metadata !183, metadata !DIExpression()) #4, !dbg !185
  %29 = getelementptr i8, i8* %11, i64 16, !dbg !212
  %30 = bitcast i8* %29 to i16*, !dbg !212
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %26, metadata !177, metadata !DIExpression()) #4, !dbg !185
  call void @llvm.dbg.value(metadata i32 1, metadata !184, metadata !DIExpression()) #4, !dbg !185
  %31 = load i16, i16* %30, align 1, !dbg !185, !tbaa !192
  call void @llvm.dbg.value(metadata i16 %31, metadata !183, metadata !DIExpression()) #4, !dbg !185
  call void @llvm.dbg.value(metadata i16 %31, metadata !194, metadata !DIExpression()) #4, !dbg !199
  %32 = icmp eq i16 %31, 129, !dbg !205
  %33 = icmp ne i16 %31, -22392, !dbg !206
  %34 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %32) #4
  %35 = xor i1 %34, true, !dbg !206
  %36 = select i1 %35, i1 %33, i1 false, !dbg !206
  br i1 %36, label %45, label %37, !dbg !207

37:                                               ; preds = %28
  %38 = getelementptr i8, i8* %11, i64 22, !dbg !208
  %39 = bitcast i8* %38 to %struct.vlan_hdr*, !dbg !208
  %40 = icmp ugt %struct.vlan_hdr* %39, %17, !dbg !210
  br i1 %40, label %45, label %41, !dbg !211

41:                                               ; preds = %37
  call void @llvm.dbg.value(metadata i16 undef, metadata !183, metadata !DIExpression()) #4, !dbg !185
  %42 = getelementptr i8, i8* %11, i64 20, !dbg !212
  %43 = bitcast i8* %42 to i16*, !dbg !212
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %39, metadata !177, metadata !DIExpression()) #4, !dbg !185
  call void @llvm.dbg.value(metadata i32 2, metadata !184, metadata !DIExpression()) #4, !dbg !185
  %44 = load i16, i16* %43, align 1, !dbg !185, !tbaa !192
  call void @llvm.dbg.value(metadata i16 %44, metadata !183, metadata !DIExpression()) #4, !dbg !185
  br label %45

45:                                               ; preds = %14, %24, %28, %37, %41
  %46 = phi i8* [ %12, %24 ], [ %12, %14 ], [ %25, %28 ], [ %25, %37 ], [ %38, %41 ], !dbg !185
  %47 = phi i16 [ %18, %24 ], [ %18, %14 ], [ %31, %28 ], [ %31, %37 ], [ %44, %41 ], !dbg !185
  call void @llvm.dbg.value(metadata i8* %46, metadata !57, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.value(metadata i16 %47, metadata !39, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !135
  %48 = icmp eq i16 %47, 8, !dbg !213
  br i1 %48, label %49, label %79, !dbg !214

49:                                               ; preds = %45
  call void @llvm.dbg.value(metadata i8* %46, metadata !62, metadata !DIExpression()), !dbg !215
  %50 = getelementptr inbounds i8, i8* %46, i64 20, !dbg !216
  %51 = bitcast i8* %50 to %struct.iphdr*, !dbg !216
  %52 = inttoptr i64 %6 to %struct.iphdr*, !dbg !218
  %53 = icmp ugt %struct.iphdr* %51, %52, !dbg !219
  br i1 %53, label %77, label %54, !dbg !220

54:                                               ; preds = %49
  %55 = load i8, i8* %46, align 4, !dbg !221
  %56 = shl i8 %55, 2, !dbg !222
  %57 = and i8 %56, 60, !dbg !222
  call void @llvm.dbg.value(metadata i8 %57, metadata !83, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !215
  %58 = icmp ult i8 %57, 20, !dbg !223
  br i1 %58, label %77, label %59, !dbg !225

59:                                               ; preds = %54
  %60 = zext i8 %57 to i64
  call void @llvm.dbg.value(metadata i64 %60, metadata !83, metadata !DIExpression()), !dbg !215
  %61 = getelementptr i8, i8* %46, i64 %60, !dbg !226
  %62 = icmp ugt i8* %61, %7, !dbg !228
  br i1 %62, label %77, label %63, !dbg !229

63:                                               ; preds = %59
  call void @llvm.dbg.value(metadata i8* %61, metadata !57, metadata !DIExpression()), !dbg !135
  %64 = getelementptr inbounds i8, i8* %46, i64 12, !dbg !230
  %65 = bitcast i8* %64 to i32*, !dbg !230
  %66 = load i32, i32* %65, align 4, !dbg !230, !tbaa !231
  call void @llvm.dbg.value(metadata i32 %66, metadata !40, metadata !DIExpression()), !dbg !135
  store i32 %66, i32* %2, align 4, !dbg !233, !tbaa !234
  call void @llvm.dbg.value(metadata i32* null, metadata !84, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.value(metadata i32* %2, metadata !40, metadata !DIExpression(DW_OP_deref)), !dbg !135
  %67 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon* @main_map to i8*), i8* nonnull %3) #4, !dbg !235
  %68 = bitcast i8* %67 to i32*, !dbg !235
  call void @llvm.dbg.value(metadata i32* %68, metadata !84, metadata !DIExpression()), !dbg !215
  %69 = load i32, i32* %2, align 4, !dbg !236, !tbaa !234
  call void @llvm.dbg.value(metadata i32 %69, metadata !40, metadata !DIExpression()), !dbg !135
  %70 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @xdp_patch_ports_func.____fmt, i64 0, i64 0), i32 12, i32 %69) #4, !dbg !236
  %71 = icmp eq i8* %67, null, !dbg !238
  br i1 %71, label %79, label %72, !dbg !240

72:                                               ; preds = %63
  %73 = load i32, i32* %68, align 4, !dbg !241, !tbaa !234
  %74 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @xdp_patch_ports_func.____fmt.1, i64 0, i64 0), i32 8, i32 %73) #4, !dbg !241
  %75 = load i32, i32* %68, align 4, !dbg !244, !tbaa !234
  %76 = icmp eq i32 %75, 1, !dbg !246
  br i1 %76, label %77, label %79, !dbg !247

77:                                               ; preds = %49, %54, %59, %72
  %78 = phi i32 [ 2, %72 ], [ 0, %59 ], [ 0, %54 ], [ 0, %49 ]
  call void @llvm.dbg.value(metadata i32 1, metadata !38, metadata !DIExpression()), !dbg !135
  br label %79

79:                                               ; preds = %1, %45, %72, %63, %77
  %80 = phi i32 [ %78, %77 ], [ 2, %45 ], [ 1, %72 ], [ 1, %63 ], [ 0, %1 ], !dbg !135
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #4, !dbg !248
  ret i32 %80, !dbg !248
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!130, !131, !132, !133}
!llvm.ident = !{!134}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "main_map", scope: !2, file: !3, line: 18, type: !116, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Alpine clang version 13.0.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "urf.c", directory: "/root/qname_intercepter/ur_filter")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/root/qname_intercepter/ur_filter")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !{!15, !16, !17}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !18, line: 24, baseType: !19)
!18 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!19 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!20 = !{!21, !92, !97, !0, !102, !110}
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "____fmt", scope: !23, file: !3, line: 60, type: !87, isLocal: true, isDefinition: true)
!23 = distinct !DISubprogram(name: "xdp_patch_ports_func", scope: !3, file: !3, line: 23, type: !24, scopeLine: 24, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !36)
!24 = !DISubroutineType(types: !25)
!25 = !{!26, !27}
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !29)
!29 = !{!30, !32, !33, !34, !35}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !28, file: !6, line: 2857, baseType: !31, size: 32)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !18, line: 27, baseType: !7)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !28, file: !6, line: 2858, baseType: !31, size: 32, offset: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !28, file: !6, line: 2859, baseType: !31, size: 32, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !28, file: !6, line: 2861, baseType: !31, size: 32, offset: 96)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !28, file: !6, line: 2862, baseType: !31, size: 32, offset: 128)
!36 = !{!37, !38, !39, !40, !41, !55, !56, !57, !62, !83, !84, !86}
!37 = !DILocalVariable(name: "ctx", arg: 1, scope: !23, file: !3, line: 23, type: !27)
!38 = !DILocalVariable(name: "action", scope: !23, file: !3, line: 25, type: !26)
!39 = !DILocalVariable(name: "eth_type", scope: !23, file: !3, line: 26, type: !26)
!40 = !DILocalVariable(name: "saddrv4", scope: !23, file: !3, line: 27, type: !31)
!41 = !DILocalVariable(name: "eth", scope: !23, file: !3, line: 28, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !44, line: 169, size: 112, elements: !45)
!44 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!45 = !{!46, !51, !52}
!46 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !43, file: !44, line: 170, baseType: !47, size: 48)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 48, elements: !49)
!48 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!49 = !{!50}
!50 = !DISubrange(count: 6)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !43, file: !44, line: 171, baseType: !47, size: 48, offset: 48)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !43, file: !44, line: 172, baseType: !53, size: 16, offset: 96)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !54, line: 25, baseType: !17)
!54 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!55 = !DILocalVariable(name: "data_end", scope: !23, file: !3, line: 29, type: !15)
!56 = !DILocalVariable(name: "data", scope: !23, file: !3, line: 30, type: !15)
!57 = !DILocalVariable(name: "nh", scope: !23, file: !3, line: 31, type: !58)
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !59, line: 33, size: 64, elements: !60)
!59 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/root/qname_intercepter/ur_filter")
!60 = !{!61}
!61 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !58, file: !59, line: 34, baseType: !15, size: 64)
!62 = !DILocalVariable(name: "iph", scope: !63, file: !3, line: 40, type: !65)
!63 = distinct !DILexicalBlock(scope: !64, file: !3, line: 39, column: 39)
!64 = distinct !DILexicalBlock(scope: !23, file: !3, line: 39, column: 6)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !67, line: 86, size: 160, elements: !68)
!67 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!68 = !{!69, !71, !72, !73, !74, !75, !76, !77, !78, !80, !82}
!69 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !66, file: !67, line: 88, baseType: !70, size: 4, flags: DIFlagBitField, extraData: i64 0)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !18, line: 21, baseType: !48)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !66, file: !67, line: 89, baseType: !70, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !66, file: !67, line: 96, baseType: !70, size: 8, offset: 8)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !66, file: !67, line: 97, baseType: !53, size: 16, offset: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !66, file: !67, line: 98, baseType: !53, size: 16, offset: 32)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !66, file: !67, line: 99, baseType: !53, size: 16, offset: 48)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !66, file: !67, line: 100, baseType: !70, size: 8, offset: 64)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !66, file: !67, line: 101, baseType: !70, size: 8, offset: 72)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !66, file: !67, line: 102, baseType: !79, size: 16, offset: 80)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !54, line: 31, baseType: !17)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !66, file: !67, line: 103, baseType: !81, size: 32, offset: 96)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !54, line: 27, baseType: !31)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !66, file: !67, line: 104, baseType: !81, size: 32, offset: 128)
!83 = !DILocalVariable(name: "hdrsize", scope: !63, file: !3, line: 41, type: !26)
!84 = !DILocalVariable(name: "res", scope: !63, file: !3, line: 58, type: !85)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!86 = !DILabel(scope: !23, name: "out", file: !3, line: 70)
!87 = !DICompositeType(tag: DW_TAG_array_type, baseType: !88, size: 96, elements: !90)
!88 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !89)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !{!91}
!91 = !DISubrange(count: 12)
!92 = !DIGlobalVariableExpression(var: !93, expr: !DIExpression())
!93 = distinct !DIGlobalVariable(name: "____fmt", scope: !23, file: !3, line: 61, type: !94, isLocal: true, isDefinition: true)
!94 = !DICompositeType(tag: DW_TAG_array_type, baseType: !88, size: 64, elements: !95)
!95 = !{!96}
!96 = !DISubrange(count: 8)
!97 = !DIGlobalVariableExpression(var: !98, expr: !DIExpression())
!98 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 74, type: !99, isLocal: false, isDefinition: true)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !89, size: 32, elements: !100)
!100 = !{!101}
!101 = !DISubrange(count: 4)
!102 = !DIGlobalVariableExpression(var: !103, expr: !DIExpression())
!103 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !104, line: 55, type: !105, isLocal: true, isDefinition: true)
!104 = !DIFile(filename: "/usr/include/bpf/bpf_helper_defs.h", directory: "")
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DISubroutineType(types: !107)
!107 = !{!15, !15, !108}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!110 = !DIGlobalVariableExpression(var: !111, expr: !DIExpression())
!111 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !104, line: 176, type: !112, isLocal: true, isDefinition: true)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DISubroutineType(types: !114)
!114 = !{!16, !115, !31, null}
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!116 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 13, size: 256, elements: !117)
!117 = !{!118, !123, !124, !125}
!118 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !116, file: !3, line: 14, baseType: !119, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 32, elements: !121)
!121 = !{!122}
!122 = !DISubrange(count: 1)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !116, file: !3, line: 15, baseType: !85, size: 64, offset: 64)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !116, file: !3, line: 16, baseType: !85, size: 64, offset: 128)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !116, file: !3, line: 17, baseType: !126, size: 64, offset: 192)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 2097120, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 65535)
!130 = !{i32 7, !"Dwarf Version", i32 4}
!131 = !{i32 2, !"Debug Info Version", i32 3}
!132 = !{i32 1, !"wchar_size", i32 4}
!133 = !{i32 7, !"frame-pointer", i32 2}
!134 = !{!"Alpine clang version 13.0.1"}
!135 = !DILocation(line: 0, scope: !23)
!136 = !DILocation(line: 27, column: 2, scope: !23)
!137 = !DILocation(line: 29, column: 38, scope: !23)
!138 = !{!139, !140, i64 4}
!139 = !{!"xdp_md", !140, i64 0, !140, i64 4, !140, i64 8, !140, i64 12, !140, i64 16}
!140 = !{!"int", !141, i64 0}
!141 = !{!"omnipotent char", !142, i64 0}
!142 = !{!"Simple C/C++ TBAA"}
!143 = !DILocation(line: 29, column: 27, scope: !23)
!144 = !DILocation(line: 29, column: 19, scope: !23)
!145 = !DILocation(line: 30, column: 34, scope: !23)
!146 = !{!139, !140, i64 0}
!147 = !DILocation(line: 30, column: 23, scope: !23)
!148 = !DILocation(line: 30, column: 15, scope: !23)
!149 = !DILocalVariable(name: "nh", arg: 1, scope: !150, file: !59, line: 124, type: !153)
!150 = distinct !DISubprogram(name: "parse_ethhdr", scope: !59, file: !59, line: 124, type: !151, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !155)
!151 = !DISubroutineType(types: !152)
!152 = !{!26, !153, !15, !154}
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!155 = !{!149, !156, !157}
!156 = !DILocalVariable(name: "data_end", arg: 2, scope: !150, file: !59, line: 125, type: !15)
!157 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !150, file: !59, line: 126, type: !154)
!158 = !DILocation(line: 0, scope: !150, inlinedAt: !159)
!159 = distinct !DILocation(line: 33, column: 13, scope: !23)
!160 = !DILocalVariable(name: "nh", arg: 1, scope: !161, file: !59, line: 79, type: !153)
!161 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !59, file: !59, line: 79, type: !162, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !171)
!162 = !DISubroutineType(types: !163)
!163 = !{!26, !153, !15, !154, !164}
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !59, line: 64, size: 32, elements: !166)
!166 = !{!167}
!167 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !165, file: !59, line: 65, baseType: !168, size: 32)
!168 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 32, elements: !169)
!169 = !{!170}
!170 = !DISubrange(count: 2)
!171 = !{!160, !172, !173, !174, !175, !176, !177, !183, !184}
!172 = !DILocalVariable(name: "data_end", arg: 2, scope: !161, file: !59, line: 80, type: !15)
!173 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !161, file: !59, line: 81, type: !154)
!174 = !DILocalVariable(name: "vlans", arg: 4, scope: !161, file: !59, line: 82, type: !164)
!175 = !DILocalVariable(name: "eth", scope: !161, file: !59, line: 84, type: !42)
!176 = !DILocalVariable(name: "hdrsize", scope: !161, file: !59, line: 85, type: !26)
!177 = !DILocalVariable(name: "vlh", scope: !161, file: !59, line: 86, type: !178)
!178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!179 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !59, line: 42, size: 32, elements: !180)
!180 = !{!181, !182}
!181 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !179, file: !59, line: 43, baseType: !53, size: 16)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !179, file: !59, line: 44, baseType: !53, size: 16, offset: 16)
!183 = !DILocalVariable(name: "h_proto", scope: !161, file: !59, line: 87, type: !17)
!184 = !DILocalVariable(name: "i", scope: !161, file: !59, line: 88, type: !26)
!185 = !DILocation(line: 0, scope: !161, inlinedAt: !186)
!186 = distinct !DILocation(line: 129, column: 9, scope: !150, inlinedAt: !159)
!187 = !DILocation(line: 93, column: 14, scope: !188, inlinedAt: !186)
!188 = distinct !DILexicalBlock(scope: !161, file: !59, line: 93, column: 6)
!189 = !DILocation(line: 93, column: 24, scope: !188, inlinedAt: !186)
!190 = !DILocation(line: 93, column: 6, scope: !161, inlinedAt: !186)
!191 = !DILocation(line: 99, column: 17, scope: !161, inlinedAt: !186)
!192 = !{!193, !193, i64 0}
!193 = !{!"short", !141, i64 0}
!194 = !DILocalVariable(name: "h_proto", arg: 1, scope: !195, file: !59, line: 68, type: !17)
!195 = distinct !DISubprogram(name: "proto_is_vlan", scope: !59, file: !59, line: 68, type: !196, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !198)
!196 = !DISubroutineType(types: !197)
!197 = !{!26, !17}
!198 = !{!194}
!199 = !DILocation(line: 0, scope: !195, inlinedAt: !200)
!200 = distinct !DILocation(line: 106, column: 8, scope: !201, inlinedAt: !186)
!201 = distinct !DILexicalBlock(scope: !202, file: !59, line: 106, column: 7)
!202 = distinct !DILexicalBlock(scope: !203, file: !59, line: 105, column: 39)
!203 = distinct !DILexicalBlock(scope: !204, file: !59, line: 105, column: 2)
!204 = distinct !DILexicalBlock(scope: !161, file: !59, line: 105, column: 2)
!205 = !DILocation(line: 70, column: 20, scope: !195, inlinedAt: !200)
!206 = !DILocation(line: 70, column: 46, scope: !195, inlinedAt: !200)
!207 = !DILocation(line: 106, column: 7, scope: !202, inlinedAt: !186)
!208 = !DILocation(line: 109, column: 11, scope: !209, inlinedAt: !186)
!209 = distinct !DILexicalBlock(scope: !202, file: !59, line: 109, column: 7)
!210 = !DILocation(line: 109, column: 15, scope: !209, inlinedAt: !186)
!211 = !DILocation(line: 109, column: 7, scope: !202, inlinedAt: !186)
!212 = !DILocation(line: 112, column: 18, scope: !202, inlinedAt: !186)
!213 = !DILocation(line: 39, column: 15, scope: !64)
!214 = !DILocation(line: 39, column: 6, scope: !23)
!215 = !DILocation(line: 0, scope: !63)
!216 = !DILocation(line: 43, column: 11, scope: !217)
!217 = distinct !DILexicalBlock(scope: !63, file: !3, line: 43, column: 7)
!218 = !DILocation(line: 43, column: 17, scope: !217)
!219 = !DILocation(line: 43, column: 15, scope: !217)
!220 = !DILocation(line: 43, column: 7, scope: !63)
!221 = !DILocation(line: 46, column: 18, scope: !63)
!222 = !DILocation(line: 46, column: 22, scope: !63)
!223 = !DILocation(line: 48, column: 14, scope: !224)
!224 = distinct !DILexicalBlock(scope: !63, file: !3, line: 48, column: 6)
!225 = !DILocation(line: 48, column: 6, scope: !63)
!226 = !DILocation(line: 52, column: 14, scope: !227)
!227 = distinct !DILexicalBlock(scope: !63, file: !3, line: 52, column: 7)
!228 = !DILocation(line: 52, column: 24, scope: !227)
!229 = !DILocation(line: 52, column: 7, scope: !63)
!230 = !DILocation(line: 56, column: 18, scope: !63)
!231 = !{!232, !140, i64 12}
!232 = !{!"iphdr", !141, i64 0, !141, i64 0, !141, i64 1, !193, i64 2, !193, i64 4, !193, i64 6, !141, i64 8, !141, i64 9, !193, i64 10, !140, i64 12, !140, i64 16}
!233 = !DILocation(line: 56, column: 11, scope: !63)
!234 = !{!140, !140, i64 0}
!235 = !DILocation(line: 59, column: 15, scope: !63)
!236 = !DILocation(line: 60, column: 3, scope: !237)
!237 = distinct !DILexicalBlock(scope: !63, file: !3, line: 60, column: 3)
!238 = !DILocation(line: 61, column: 6, scope: !239)
!239 = distinct !DILexicalBlock(scope: !63, file: !3, line: 61, column: 6)
!240 = !DILocation(line: 61, column: 6, scope: !63)
!241 = !DILocation(line: 61, column: 11, scope: !242)
!242 = distinct !DILexicalBlock(scope: !243, file: !3, line: 61, column: 11)
!243 = distinct !DILexicalBlock(scope: !239, file: !3, line: 61, column: 10)
!244 = !DILocation(line: 63, column: 14, scope: !245)
!245 = distinct !DILexicalBlock(scope: !63, file: !3, line: 63, column: 6)
!246 = !DILocation(line: 63, column: 19, scope: !245)
!247 = !DILocation(line: 63, column: 6, scope: !63)
!248 = !DILocation(line: 72, column: 1, scope: !23)
