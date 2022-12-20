; ModuleID = 'lpm_test.c'
source_filename = "lpm_test.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.ipv4_lpm_key = type { i32, [16 x i8] }
%struct.anon = type { [11 x i32]*, %struct.ipv4_lpm_key*, i32*, [1 x i32]*, [255 x i32]* }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }

@__const.xdp_patch_ports_func.key = private unnamed_addr constant %struct.ipv4_lpm_key { i32 128, [16 x i8] zeroinitializer }, align 4
@dns_block_suffixes = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !0
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !23
@llvm.compiler.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon* @dns_block_suffixes to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_patch_ports_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_patch_ports_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_patch_ports" !dbg !72 {
  %2 = alloca %struct.ipv4_lpm_key, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !85, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.value(metadata i32 2, metadata !86, metadata !DIExpression()), !dbg !162
  %3 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !163
  %4 = load i32, i32* %3, align 4, !dbg !163, !tbaa !164
  %5 = zext i32 %4 to i64, !dbg !169
  %6 = inttoptr i64 %5 to i8*, !dbg !170
  call void @llvm.dbg.value(metadata i8* %6, metadata !149, metadata !DIExpression()), !dbg !162
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !171
  %8 = load i32, i32* %7, align 4, !dbg !171, !tbaa !172
  %9 = zext i32 %8 to i64, !dbg !173
  %10 = inttoptr i64 %9 to i8*, !dbg !174
  call void @llvm.dbg.value(metadata i8* %10, metadata !150, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.value(metadata i8* %10, metadata !151, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !89, metadata !DIExpression(DW_OP_deref)), !dbg !162
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !175, metadata !DIExpression()) #6, !dbg !184
  call void @llvm.dbg.value(metadata i8* %6, metadata !182, metadata !DIExpression()) #6, !dbg !184
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !183, metadata !DIExpression()) #6, !dbg !184
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !186, metadata !DIExpression()) #6, !dbg !211
  call void @llvm.dbg.value(metadata i8* %6, metadata !198, metadata !DIExpression()) #6, !dbg !211
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !199, metadata !DIExpression()) #6, !dbg !211
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !200, metadata !DIExpression()) #6, !dbg !211
  call void @llvm.dbg.value(metadata i8* %10, metadata !201, metadata !DIExpression()) #6, !dbg !211
  call void @llvm.dbg.value(metadata i32 14, metadata !202, metadata !DIExpression()) #6, !dbg !211
  %11 = getelementptr i8, i8* %10, i64 14, !dbg !213
  %12 = icmp ugt i8* %11, %6, !dbg !215
  br i1 %12, label %72, label %13, !dbg !216

13:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %10, metadata !201, metadata !DIExpression()) #6, !dbg !211
  call void @llvm.dbg.value(metadata i8* %11, metadata !151, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.value(metadata i8* %11, metadata !203, metadata !DIExpression()) #6, !dbg !211
  %14 = getelementptr inbounds i8, i8* %10, i64 12, !dbg !217
  %15 = bitcast i8* %14 to i16*, !dbg !217
  call void @llvm.dbg.value(metadata i16 undef, metadata !209, metadata !DIExpression()) #6, !dbg !211
  call void @llvm.dbg.value(metadata i32 0, metadata !210, metadata !DIExpression()) #6, !dbg !211
  %16 = inttoptr i64 %5 to %struct.vlan_hdr*
  %17 = load i16, i16* %15, align 1, !dbg !211, !tbaa !218
  call void @llvm.dbg.value(metadata i16 %17, metadata !209, metadata !DIExpression()) #6, !dbg !211
  call void @llvm.dbg.value(metadata i16 %17, metadata !220, metadata !DIExpression()) #6, !dbg !225
  %18 = icmp eq i16 %17, 129, !dbg !231
  %19 = icmp ne i16 %17, -22392, !dbg !232
  %20 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %18) #6
  %21 = xor i1 %20, true, !dbg !232
  %22 = select i1 %21, i1 %19, i1 false, !dbg !232
  br i1 %22, label %44, label %23, !dbg !233

23:                                               ; preds = %13
  %24 = getelementptr i8, i8* %10, i64 18, !dbg !234
  %25 = bitcast i8* %24 to %struct.vlan_hdr*, !dbg !234
  %26 = icmp ugt %struct.vlan_hdr* %25, %16, !dbg !236
  br i1 %26, label %44, label %27, !dbg !237

27:                                               ; preds = %23
  call void @llvm.dbg.value(metadata i16 undef, metadata !209, metadata !DIExpression()) #6, !dbg !211
  %28 = getelementptr i8, i8* %10, i64 16, !dbg !238
  %29 = bitcast i8* %28 to i16*, !dbg !238
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %25, metadata !203, metadata !DIExpression()) #6, !dbg !211
  call void @llvm.dbg.value(metadata i32 1, metadata !210, metadata !DIExpression()) #6, !dbg !211
  %30 = load i16, i16* %29, align 1, !dbg !211, !tbaa !218
  call void @llvm.dbg.value(metadata i16 %30, metadata !209, metadata !DIExpression()) #6, !dbg !211
  call void @llvm.dbg.value(metadata i16 %30, metadata !220, metadata !DIExpression()) #6, !dbg !225
  %31 = icmp eq i16 %30, 129, !dbg !231
  %32 = icmp ne i16 %30, -22392, !dbg !232
  %33 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %31) #6
  %34 = xor i1 %33, true, !dbg !232
  %35 = select i1 %34, i1 %32, i1 false, !dbg !232
  br i1 %35, label %44, label %36, !dbg !233

36:                                               ; preds = %27
  %37 = getelementptr i8, i8* %10, i64 22, !dbg !234
  %38 = bitcast i8* %37 to %struct.vlan_hdr*, !dbg !234
  %39 = icmp ugt %struct.vlan_hdr* %38, %16, !dbg !236
  br i1 %39, label %44, label %40, !dbg !237

40:                                               ; preds = %36
  call void @llvm.dbg.value(metadata i16 undef, metadata !209, metadata !DIExpression()) #6, !dbg !211
  %41 = getelementptr i8, i8* %10, i64 20, !dbg !238
  %42 = bitcast i8* %41 to i16*, !dbg !238
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %38, metadata !203, metadata !DIExpression()) #6, !dbg !211
  call void @llvm.dbg.value(metadata i32 2, metadata !210, metadata !DIExpression()) #6, !dbg !211
  %43 = load i16, i16* %42, align 1, !dbg !211, !tbaa !218
  call void @llvm.dbg.value(metadata i16 %43, metadata !209, metadata !DIExpression()) #6, !dbg !211
  br label %44

44:                                               ; preds = %13, %23, %27, %36, %40
  %45 = phi i8* [ %11, %23 ], [ %11, %13 ], [ %24, %27 ], [ %24, %36 ], [ %37, %40 ], !dbg !211
  %46 = phi i16 [ %17, %23 ], [ %17, %13 ], [ %30, %27 ], [ %30, %36 ], [ %43, %40 ], !dbg !211
  call void @llvm.dbg.value(metadata i8* %45, metadata !151, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.value(metadata i16 %46, metadata !87, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !162
  %47 = icmp eq i16 %46, 8, !dbg !239
  br i1 %47, label %48, label %72, !dbg !239

48:                                               ; preds = %44
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !102, metadata !DIExpression(DW_OP_deref)), !dbg !162
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !240, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.value(metadata i8* %6, metadata !246, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !247, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.value(metadata i8* %45, metadata !248, metadata !DIExpression()), !dbg !250
  %49 = getelementptr inbounds i8, i8* %45, i64 20, !dbg !252
  %50 = icmp ugt i8* %49, %6, !dbg !254
  br i1 %50, label %64, label %51, !dbg !255

51:                                               ; preds = %48
  %52 = load i8, i8* %45, align 4, !dbg !256
  %53 = shl i8 %52, 2, !dbg !257
  %54 = and i8 %53, 60, !dbg !257
  call void @llvm.dbg.value(metadata i8 %54, metadata !249, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !250
  %55 = icmp ult i8 %54, 20, !dbg !258
  br i1 %55, label %64, label %56, !dbg !260

56:                                               ; preds = %51
  %57 = zext i8 %54 to i64
  call void @llvm.dbg.value(metadata i64 %57, metadata !249, metadata !DIExpression()), !dbg !250
  %58 = getelementptr i8, i8* %45, i64 %57, !dbg !261
  %59 = icmp ugt i8* %58, %6, !dbg !263
  br i1 %59, label %64, label %60, !dbg !264

60:                                               ; preds = %56
  call void @llvm.dbg.value(metadata i8* %58, metadata !151, metadata !DIExpression()), !dbg !162
  %61 = getelementptr inbounds i8, i8* %45, i64 12, !dbg !265
  %62 = bitcast i8* %61 to i32*, !dbg !265
  %63 = load i32, i32* %62, align 4, !dbg !265, !tbaa !266
  br label %64, !dbg !268

64:                                               ; preds = %48, %51, %56, %60
  %65 = phi i32 [ %63, %60 ], [ -1, %48 ], [ -1, %51 ], [ -1, %56 ], !dbg !250
  call void @llvm.dbg.value(metadata i32 %65, metadata !88, metadata !DIExpression()), !dbg !162
  %66 = bitcast %struct.ipv4_lpm_key* %2 to i8*, !dbg !269
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %66) #6, !dbg !269
  call void @llvm.dbg.declare(metadata %struct.ipv4_lpm_key* %2, metadata !156, metadata !DIExpression()), !dbg !270
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %66, i8* noundef nonnull align 4 dereferenceable(20) bitcast (%struct.ipv4_lpm_key* @__const.xdp_patch_ports_func.key to i8*), i64 20, i1 false), !dbg !270
  %67 = getelementptr inbounds %struct.ipv4_lpm_key, %struct.ipv4_lpm_key* %2, i64 0, i32 1, i64 0, !dbg !271
  %68 = bitcast i8* %67 to i32*, !dbg !271
  store i32 %65, i32* %68, align 4, !dbg !272, !tbaa !273
  call void @llvm.dbg.value(metadata i64* null, metadata !159, metadata !DIExpression()), !dbg !274
  %69 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon* @dns_block_suffixes to i8*), i8* nonnull %66) #6, !dbg !275
  call void @llvm.dbg.value(metadata i8* %69, metadata !159, metadata !DIExpression()), !dbg !274
  %70 = icmp eq i8* %69, null, !dbg !276
  %71 = select i1 %70, i32 2, i32 1, !dbg !278
  call void @llvm.dbg.value(metadata i32 %71, metadata !86, metadata !DIExpression()), !dbg !162
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %66) #6, !dbg !279
  br label %72

72:                                               ; preds = %44, %1, %64
  %73 = phi i32 [ %71, %64 ], [ 0, %1 ], [ 2, %44 ]
  ret i32 %73, !dbg !280
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #5

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!67, !68, !69, !70}
!llvm.ident = !{!71}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dns_block_suffixes", scope: !2, file: !3, line: 32, type: !37, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Alpine clang version 13.0.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !14, globals: !22, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "lpm_test.c", directory: "/root/qname_intercepter/xdp_lpm_test")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 5497, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !{!15, !16, !17, !20}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !18, line: 24, baseType: !19)
!18 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!19 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !18, line: 27, baseType: !7)
!22 = !{!23, !0, !29}
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 106, type: !25, isLocal: false, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 32, elements: !27)
!26 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!27 = !{!28}
!28 = !DISubrange(count: 4)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !31, line: 33, type: !32, isLocal: true, isDefinition: true)
!31 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/root/qname_intercepter/xdp_lpm_test")
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DISubroutineType(types: !34)
!34 = !{!15, !15, !35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 26, size: 320, elements: !38)
!38 = !{!39, !45, !56, !57, !62}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !37, file: !3, line: 27, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 352, elements: !43)
!42 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !37, file: !3, line: 28, baseType: !46, size: 64, offset: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv4_lpm_key", file: !3, line: 21, size: 160, elements: !48)
!48 = !{!49, !50}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !47, file: !3, line: 22, baseType: !21, size: 32)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !47, file: !3, line: 23, baseType: !51, size: 128, offset: 32)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 128, elements: !54)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !18, line: 21, baseType: !53)
!53 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!54 = !{!55}
!55 = !DISubrange(count: 16)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !37, file: !3, line: 29, baseType: !20, size: 64, offset: 128)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !37, file: !3, line: 30, baseType: !58, size: 64, offset: 192)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 32, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 1)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !37, file: !3, line: 31, baseType: !63, size: 64, offset: 256)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 8160, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 255)
!67 = !{i32 7, !"Dwarf Version", i32 4}
!68 = !{i32 2, !"Debug Info Version", i32 3}
!69 = !{i32 1, !"wchar_size", i32 4}
!70 = !{i32 7, !"frame-pointer", i32 2}
!71 = !{!"Alpine clang version 13.0.1"}
!72 = distinct !DISubprogram(name: "xdp_patch_ports_func", scope: !3, file: !3, line: 65, type: !73, scopeLine: 66, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !84)
!73 = !DISubroutineType(types: !74)
!74 = !{!42, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5508, size: 192, elements: !77)
!77 = !{!78, !79, !80, !81, !82, !83}
!78 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !76, file: !6, line: 5509, baseType: !21, size: 32)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !76, file: !6, line: 5510, baseType: !21, size: 32, offset: 32)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !76, file: !6, line: 5511, baseType: !21, size: 32, offset: 64)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !76, file: !6, line: 5513, baseType: !21, size: 32, offset: 96)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !76, file: !6, line: 5514, baseType: !21, size: 32, offset: 128)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !76, file: !6, line: 5516, baseType: !21, size: 32, offset: 160)
!84 = !{!85, !86, !87, !88, !89, !102, !120, !149, !150, !151, !156, !159, !161}
!85 = !DILocalVariable(name: "ctx", arg: 1, scope: !72, file: !3, line: 65, type: !75)
!86 = !DILocalVariable(name: "action", scope: !72, file: !3, line: 67, type: !42)
!87 = !DILocalVariable(name: "eth_type", scope: !72, file: !3, line: 68, type: !42)
!88 = !DILocalVariable(name: "saddrv4", scope: !72, file: !3, line: 69, type: !21)
!89 = !DILocalVariable(name: "eth", scope: !72, file: !3, line: 70, type: !90)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !92, line: 169, size: 112, elements: !93)
!92 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!93 = !{!94, !98, !99}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !91, file: !92, line: 170, baseType: !95, size: 48)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 48, elements: !96)
!96 = !{!97}
!97 = !DISubrange(count: 6)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !91, file: !92, line: 171, baseType: !95, size: 48, offset: 48)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !91, file: !92, line: 172, baseType: !100, size: 16, offset: 96)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !101, line: 25, baseType: !17)
!101 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!102 = !DILocalVariable(name: "iphdr", scope: !72, file: !3, line: 71, type: !103)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !105, line: 86, size: 160, elements: !106)
!105 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!106 = !{!107, !108, !109, !110, !111, !112, !113, !114, !115, !117, !119}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !104, file: !105, line: 88, baseType: !52, size: 4, flags: DIFlagBitField, extraData: i64 0)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !104, file: !105, line: 89, baseType: !52, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !104, file: !105, line: 96, baseType: !52, size: 8, offset: 8)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !104, file: !105, line: 97, baseType: !100, size: 16, offset: 16)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !104, file: !105, line: 98, baseType: !100, size: 16, offset: 32)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !104, file: !105, line: 99, baseType: !100, size: 16, offset: 48)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !104, file: !105, line: 100, baseType: !52, size: 8, offset: 64)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !104, file: !105, line: 101, baseType: !52, size: 8, offset: 72)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !104, file: !105, line: 102, baseType: !116, size: 16, offset: 80)
!116 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !101, line: 31, baseType: !17)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !104, file: !105, line: 103, baseType: !118, size: 32, offset: 96)
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !101, line: 27, baseType: !21)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !104, file: !105, line: 104, baseType: !118, size: 32, offset: 128)
!120 = !DILocalVariable(name: "ipv6hdr", scope: !72, file: !3, line: 72, type: !121)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !123, line: 117, size: 320, elements: !124)
!123 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "")
!124 = !{!125, !126, !127, !131, !132, !133, !134, !148}
!125 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !122, file: !123, line: 119, baseType: !52, size: 4, flags: DIFlagBitField, extraData: i64 0)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !122, file: !123, line: 120, baseType: !52, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !122, file: !123, line: 127, baseType: !128, size: 24, offset: 8)
!128 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 24, elements: !129)
!129 = !{!130}
!130 = !DISubrange(count: 3)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !122, file: !123, line: 129, baseType: !100, size: 16, offset: 32)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !122, file: !123, line: 130, baseType: !52, size: 8, offset: 48)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !122, file: !123, line: 131, baseType: !52, size: 8, offset: 56)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !122, file: !123, line: 133, baseType: !135, size: 128, offset: 64)
!135 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !136, line: 33, size: 128, elements: !137)
!136 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "")
!137 = !{!138}
!138 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !135, file: !136, line: 40, baseType: !139, size: 128)
!139 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !135, file: !136, line: 34, size: 128, elements: !140)
!140 = !{!141, !142, !146}
!141 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !139, file: !136, line: 35, baseType: !51, size: 128)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !139, file: !136, line: 37, baseType: !143, size: 128)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !100, size: 128, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 8)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !139, file: !136, line: 38, baseType: !147, size: 128)
!147 = !DICompositeType(tag: DW_TAG_array_type, baseType: !118, size: 128, elements: !27)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !122, file: !123, line: 134, baseType: !135, size: 128, offset: 192)
!149 = !DILocalVariable(name: "data_end", scope: !72, file: !3, line: 73, type: !15)
!150 = !DILocalVariable(name: "data", scope: !72, file: !3, line: 74, type: !15)
!151 = !DILocalVariable(name: "nh", scope: !72, file: !3, line: 75, type: !152)
!152 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !153, line: 33, size: 64, elements: !154)
!153 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/root/qname_intercepter/xdp_lpm_test")
!154 = !{!155}
!155 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !152, file: !153, line: 34, baseType: !15, size: 64)
!156 = !DILocalVariable(name: "key", scope: !157, file: !3, line: 86, type: !47)
!157 = distinct !DILexicalBlock(scope: !158, file: !3, line: 83, column: 39)
!158 = distinct !DILexicalBlock(scope: !72, file: !3, line: 83, column: 6)
!159 = !DILocalVariable(name: "res", scope: !157, file: !3, line: 89, type: !160)
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!161 = !DILabel(scope: !72, name: "out", file: !3, line: 102)
!162 = !DILocation(line: 0, scope: !72)
!163 = !DILocation(line: 73, column: 38, scope: !72)
!164 = !{!165, !166, i64 4}
!165 = !{!"xdp_md", !166, i64 0, !166, i64 4, !166, i64 8, !166, i64 12, !166, i64 16, !166, i64 20}
!166 = !{!"int", !167, i64 0}
!167 = !{!"omnipotent char", !168, i64 0}
!168 = !{!"Simple C/C++ TBAA"}
!169 = !DILocation(line: 73, column: 27, scope: !72)
!170 = !DILocation(line: 73, column: 19, scope: !72)
!171 = !DILocation(line: 74, column: 34, scope: !72)
!172 = !{!165, !166, i64 0}
!173 = !DILocation(line: 74, column: 23, scope: !72)
!174 = !DILocation(line: 74, column: 15, scope: !72)
!175 = !DILocalVariable(name: "nh", arg: 1, scope: !176, file: !153, line: 124, type: !179)
!176 = distinct !DISubprogram(name: "parse_ethhdr", scope: !153, file: !153, line: 124, type: !177, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !181)
!177 = !DISubroutineType(types: !178)
!178 = !{!42, !179, !15, !180}
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !152, size: 64)
!180 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!181 = !{!175, !182, !183}
!182 = !DILocalVariable(name: "data_end", arg: 2, scope: !176, file: !153, line: 125, type: !15)
!183 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !176, file: !153, line: 126, type: !180)
!184 = !DILocation(line: 0, scope: !176, inlinedAt: !185)
!185 = distinct !DILocation(line: 77, column: 13, scope: !72)
!186 = !DILocalVariable(name: "nh", arg: 1, scope: !187, file: !153, line: 79, type: !179)
!187 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !153, file: !153, line: 79, type: !188, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !197)
!188 = !DISubroutineType(types: !189)
!189 = !{!42, !179, !15, !180, !190}
!190 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !191, size: 64)
!191 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !153, line: 64, size: 32, elements: !192)
!192 = !{!193}
!193 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !191, file: !153, line: 65, baseType: !194, size: 32)
!194 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 32, elements: !195)
!195 = !{!196}
!196 = !DISubrange(count: 2)
!197 = !{!186, !198, !199, !200, !201, !202, !203, !209, !210}
!198 = !DILocalVariable(name: "data_end", arg: 2, scope: !187, file: !153, line: 80, type: !15)
!199 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !187, file: !153, line: 81, type: !180)
!200 = !DILocalVariable(name: "vlans", arg: 4, scope: !187, file: !153, line: 82, type: !190)
!201 = !DILocalVariable(name: "eth", scope: !187, file: !153, line: 84, type: !90)
!202 = !DILocalVariable(name: "hdrsize", scope: !187, file: !153, line: 85, type: !42)
!203 = !DILocalVariable(name: "vlh", scope: !187, file: !153, line: 86, type: !204)
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64)
!205 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !153, line: 42, size: 32, elements: !206)
!206 = !{!207, !208}
!207 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !205, file: !153, line: 43, baseType: !100, size: 16)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !205, file: !153, line: 44, baseType: !100, size: 16, offset: 16)
!209 = !DILocalVariable(name: "h_proto", scope: !187, file: !153, line: 87, type: !17)
!210 = !DILocalVariable(name: "i", scope: !187, file: !153, line: 88, type: !42)
!211 = !DILocation(line: 0, scope: !187, inlinedAt: !212)
!212 = distinct !DILocation(line: 129, column: 9, scope: !176, inlinedAt: !185)
!213 = !DILocation(line: 93, column: 14, scope: !214, inlinedAt: !212)
!214 = distinct !DILexicalBlock(scope: !187, file: !153, line: 93, column: 6)
!215 = !DILocation(line: 93, column: 24, scope: !214, inlinedAt: !212)
!216 = !DILocation(line: 93, column: 6, scope: !187, inlinedAt: !212)
!217 = !DILocation(line: 99, column: 17, scope: !187, inlinedAt: !212)
!218 = !{!219, !219, i64 0}
!219 = !{!"short", !167, i64 0}
!220 = !DILocalVariable(name: "h_proto", arg: 1, scope: !221, file: !153, line: 68, type: !17)
!221 = distinct !DISubprogram(name: "proto_is_vlan", scope: !153, file: !153, line: 68, type: !222, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !224)
!222 = !DISubroutineType(types: !223)
!223 = !{!42, !17}
!224 = !{!220}
!225 = !DILocation(line: 0, scope: !221, inlinedAt: !226)
!226 = distinct !DILocation(line: 106, column: 8, scope: !227, inlinedAt: !212)
!227 = distinct !DILexicalBlock(scope: !228, file: !153, line: 106, column: 7)
!228 = distinct !DILexicalBlock(scope: !229, file: !153, line: 105, column: 39)
!229 = distinct !DILexicalBlock(scope: !230, file: !153, line: 105, column: 2)
!230 = distinct !DILexicalBlock(scope: !187, file: !153, line: 105, column: 2)
!231 = !DILocation(line: 70, column: 20, scope: !221, inlinedAt: !226)
!232 = !DILocation(line: 70, column: 46, scope: !221, inlinedAt: !226)
!233 = !DILocation(line: 106, column: 7, scope: !228, inlinedAt: !212)
!234 = !DILocation(line: 109, column: 11, scope: !235, inlinedAt: !212)
!235 = distinct !DILexicalBlock(scope: !228, file: !153, line: 109, column: 7)
!236 = !DILocation(line: 109, column: 15, scope: !235, inlinedAt: !212)
!237 = !DILocation(line: 109, column: 7, scope: !228, inlinedAt: !212)
!238 = !DILocation(line: 112, column: 18, scope: !228, inlinedAt: !212)
!239 = !DILocation(line: 83, column: 6, scope: !72)
!240 = !DILocalVariable(name: "nh", arg: 1, scope: !241, file: !3, line: 34, type: !179)
!241 = distinct !DISubprogram(name: "parse_iphdr_saddr", scope: !3, file: !3, line: 34, type: !242, scopeLine: 37, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !245)
!242 = !DISubroutineType(types: !243)
!243 = !{!42, !179, !15, !244}
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!245 = !{!240, !246, !247, !248, !249}
!246 = !DILocalVariable(name: "data_end", arg: 2, scope: !241, file: !3, line: 35, type: !15)
!247 = !DILocalVariable(name: "iphdr", arg: 3, scope: !241, file: !3, line: 36, type: !244)
!248 = !DILocalVariable(name: "iph", scope: !241, file: !3, line: 38, type: !103)
!249 = !DILocalVariable(name: "hdrsize", scope: !241, file: !3, line: 39, type: !42)
!250 = !DILocation(line: 0, scope: !241, inlinedAt: !251)
!251 = distinct !DILocation(line: 84, column: 13, scope: !157)
!252 = !DILocation(line: 41, column: 10, scope: !253, inlinedAt: !251)
!253 = distinct !DILexicalBlock(scope: !241, file: !3, line: 41, column: 6)
!254 = !DILocation(line: 41, column: 14, scope: !253, inlinedAt: !251)
!255 = !DILocation(line: 41, column: 6, scope: !241, inlinedAt: !251)
!256 = !DILocation(line: 44, column: 17, scope: !241, inlinedAt: !251)
!257 = !DILocation(line: 44, column: 21, scope: !241, inlinedAt: !251)
!258 = !DILocation(line: 46, column: 13, scope: !259, inlinedAt: !251)
!259 = distinct !DILexicalBlock(scope: !241, file: !3, line: 46, column: 5)
!260 = !DILocation(line: 46, column: 5, scope: !241, inlinedAt: !251)
!261 = !DILocation(line: 50, column: 14, scope: !262, inlinedAt: !251)
!262 = distinct !DILexicalBlock(scope: !241, file: !3, line: 50, column: 6)
!263 = !DILocation(line: 50, column: 24, scope: !262, inlinedAt: !251)
!264 = !DILocation(line: 50, column: 6, scope: !241, inlinedAt: !251)
!265 = !DILocation(line: 56, column: 14, scope: !241, inlinedAt: !251)
!266 = !{!267, !166, i64 12}
!267 = !{!"iphdr", !167, i64 0, !167, i64 0, !167, i64 1, !219, i64 2, !219, i64 4, !219, i64 6, !167, i64 8, !167, i64 9, !219, i64 10, !166, i64 12, !166, i64 16}
!268 = !DILocation(line: 56, column: 2, scope: !241, inlinedAt: !251)
!269 = !DILocation(line: 86, column: 3, scope: !157)
!270 = !DILocation(line: 86, column: 23, scope: !157)
!271 = !DILocation(line: 87, column: 3, scope: !157)
!272 = !DILocation(line: 87, column: 21, scope: !157)
!273 = !{!166, !166, i64 0}
!274 = !DILocation(line: 0, scope: !157)
!275 = !DILocation(line: 90, column: 15, scope: !157)
!276 = !DILocation(line: 91, column: 12, scope: !277)
!277 = distinct !DILexicalBlock(scope: !157, file: !3, line: 91, column: 12)
!278 = !DILocation(line: 0, scope: !158)
!279 = !DILocation(line: 96, column: 2, scope: !158)
!280 = !DILocation(line: 104, column: 1, scope: !72)
