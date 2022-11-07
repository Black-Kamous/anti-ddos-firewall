; ModuleID = 'xdp_pass_kern.c'
source_filename = "xdp_pass_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

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

@suf_end = dso_local local_unnamed_addr constant i32 13, align 4, !dbg !0
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !54
@llvm.compiler.used = appending global [2 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_patch_ports_func to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree nounwind readonly willreturn
define dso_local i32 @xdp_patch_ports_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_patch_ports" !dbg !68 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !82, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata i32 2, metadata !83, metadata !DIExpression()), !dbg !168
  %2 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !169
  %3 = load i32, i32* %2, align 4, !dbg !169, !tbaa !170
  %4 = zext i32 %3 to i64, !dbg !175
  %5 = inttoptr i64 %4 to i8*, !dbg !176
  call void @llvm.dbg.value(metadata i8* %5, metadata !160, metadata !DIExpression()), !dbg !168
  %6 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !177
  %7 = load i32, i32* %6, align 4, !dbg !177, !tbaa !178
  %8 = zext i32 %7 to i64, !dbg !179
  %9 = inttoptr i64 %8 to i8*, !dbg !180
  call void @llvm.dbg.value(metadata i8* %9, metadata !161, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata i8* %9, metadata !162, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !86, metadata !DIExpression(DW_OP_deref)), !dbg !168
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !181, metadata !DIExpression()) #4, !dbg !190
  call void @llvm.dbg.value(metadata i8* %5, metadata !188, metadata !DIExpression()) #4, !dbg !190
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !189, metadata !DIExpression()) #4, !dbg !190
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !192, metadata !DIExpression()) #4, !dbg !217
  call void @llvm.dbg.value(metadata i8* %5, metadata !204, metadata !DIExpression()) #4, !dbg !217
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !205, metadata !DIExpression()) #4, !dbg !217
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !206, metadata !DIExpression()) #4, !dbg !217
  call void @llvm.dbg.value(metadata i8* %9, metadata !207, metadata !DIExpression()) #4, !dbg !217
  call void @llvm.dbg.value(metadata i32 14, metadata !208, metadata !DIExpression()) #4, !dbg !217
  %10 = getelementptr i8, i8* %9, i64 14, !dbg !219
  %11 = icmp ugt i8* %10, %5, !dbg !221
  br i1 %11, label %81, label %12, !dbg !222

12:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %9, metadata !207, metadata !DIExpression()) #4, !dbg !217
  call void @llvm.dbg.value(metadata i8* %10, metadata !162, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata i8* %10, metadata !209, metadata !DIExpression()) #4, !dbg !217
  %13 = getelementptr inbounds i8, i8* %9, i64 12, !dbg !223
  %14 = bitcast i8* %13 to i16*, !dbg !223
  call void @llvm.dbg.value(metadata i16 undef, metadata !215, metadata !DIExpression()) #4, !dbg !217
  call void @llvm.dbg.value(metadata i32 0, metadata !216, metadata !DIExpression()) #4, !dbg !217
  %15 = inttoptr i64 %4 to %struct.vlan_hdr*
  %16 = load i16, i16* %14, align 1, !dbg !217, !tbaa !224
  call void @llvm.dbg.value(metadata i16 %16, metadata !215, metadata !DIExpression()) #4, !dbg !217
  call void @llvm.dbg.value(metadata i16 %16, metadata !226, metadata !DIExpression()) #4, !dbg !231
  %17 = icmp eq i16 %16, 129, !dbg !237
  %18 = icmp ne i16 %16, -22392, !dbg !238
  %19 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %17) #4
  %20 = xor i1 %19, true, !dbg !238
  %21 = select i1 %20, i1 %18, i1 false, !dbg !238
  br i1 %21, label %43, label %22, !dbg !239

22:                                               ; preds = %12
  %23 = getelementptr i8, i8* %9, i64 18, !dbg !240
  %24 = bitcast i8* %23 to %struct.vlan_hdr*, !dbg !240
  %25 = icmp ugt %struct.vlan_hdr* %24, %15, !dbg !242
  br i1 %25, label %43, label %26, !dbg !243

26:                                               ; preds = %22
  call void @llvm.dbg.value(metadata i16 undef, metadata !215, metadata !DIExpression()) #4, !dbg !217
  %27 = getelementptr i8, i8* %9, i64 16, !dbg !244
  %28 = bitcast i8* %27 to i16*, !dbg !244
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %24, metadata !209, metadata !DIExpression()) #4, !dbg !217
  call void @llvm.dbg.value(metadata i32 1, metadata !216, metadata !DIExpression()) #4, !dbg !217
  %29 = load i16, i16* %28, align 1, !dbg !217, !tbaa !224
  call void @llvm.dbg.value(metadata i16 %29, metadata !215, metadata !DIExpression()) #4, !dbg !217
  call void @llvm.dbg.value(metadata i16 %29, metadata !226, metadata !DIExpression()) #4, !dbg !231
  %30 = icmp eq i16 %29, 129, !dbg !237
  %31 = icmp ne i16 %29, -22392, !dbg !238
  %32 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %30) #4
  %33 = xor i1 %32, true, !dbg !238
  %34 = select i1 %33, i1 %31, i1 false, !dbg !238
  br i1 %34, label %43, label %35, !dbg !239

35:                                               ; preds = %26
  %36 = getelementptr i8, i8* %9, i64 22, !dbg !240
  %37 = bitcast i8* %36 to %struct.vlan_hdr*, !dbg !240
  %38 = icmp ugt %struct.vlan_hdr* %37, %15, !dbg !242
  br i1 %38, label %43, label %39, !dbg !243

39:                                               ; preds = %35
  call void @llvm.dbg.value(metadata i16 undef, metadata !215, metadata !DIExpression()) #4, !dbg !217
  %40 = getelementptr i8, i8* %9, i64 20, !dbg !244
  %41 = bitcast i8* %40 to i16*, !dbg !244
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %37, metadata !209, metadata !DIExpression()) #4, !dbg !217
  call void @llvm.dbg.value(metadata i32 2, metadata !216, metadata !DIExpression()) #4, !dbg !217
  %42 = load i16, i16* %41, align 1, !dbg !217, !tbaa !224
  call void @llvm.dbg.value(metadata i16 %42, metadata !215, metadata !DIExpression()) #4, !dbg !217
  br label %43

43:                                               ; preds = %12, %22, %26, %35, %39
  %44 = phi i8* [ %10, %22 ], [ %10, %12 ], [ %23, %26 ], [ %23, %35 ], [ %36, %39 ], !dbg !217
  %45 = phi i16 [ %16, %22 ], [ %16, %12 ], [ %29, %26 ], [ %29, %35 ], [ %42, %39 ], !dbg !217
  call void @llvm.dbg.value(metadata i8* %44, metadata !162, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata i16 %45, metadata !84, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !168
  switch i16 %45, label %81 [
    i16 8, label %46
    i16 -8826, label %58
  ], !dbg !245

46:                                               ; preds = %43
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !100, metadata !DIExpression(DW_OP_deref)), !dbg !168
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !246, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i8* %5, metadata !252, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !253, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i8* %44, metadata !254, metadata !DIExpression()), !dbg !256
  %47 = getelementptr inbounds i8, i8* %44, i64 20, !dbg !260
  %48 = icmp ugt i8* %47, %5, !dbg !262
  br i1 %48, label %81, label %49, !dbg !263

49:                                               ; preds = %46
  %50 = load i8, i8* %44, align 4, !dbg !264
  %51 = shl i8 %50, 2, !dbg !265
  %52 = and i8 %51, 60, !dbg !265
  call void @llvm.dbg.value(metadata i8 %52, metadata !255, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !256
  %53 = icmp ult i8 %52, 20, !dbg !266
  br i1 %53, label %81, label %54, !dbg !268

54:                                               ; preds = %49
  %55 = zext i8 %52 to i64
  call void @llvm.dbg.value(metadata i64 %55, metadata !255, metadata !DIExpression()), !dbg !256
  %56 = getelementptr i8, i8* %44, i64 %55, !dbg !269
  %57 = icmp ugt i8* %56, %5, !dbg !271
  br i1 %57, label %81, label %63, !dbg !272

58:                                               ; preds = %43
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !273, metadata !DIExpression()), !dbg !282
  call void @llvm.dbg.value(metadata i8* %5, metadata !279, metadata !DIExpression()), !dbg !282
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !280, metadata !DIExpression()), !dbg !282
  call void @llvm.dbg.value(metadata i8* %44, metadata !281, metadata !DIExpression()), !dbg !282
  %59 = getelementptr inbounds i8, i8* %44, i64 40, !dbg !286
  %60 = bitcast i8* %59 to %struct.ipv6hdr*, !dbg !286
  %61 = inttoptr i64 %4 to %struct.ipv6hdr*, !dbg !288
  %62 = icmp ugt %struct.ipv6hdr* %60, %61, !dbg !289
  br i1 %62, label %81, label %63, !dbg !290

63:                                               ; preds = %58, %54
  %64 = phi i64 [ 9, %54 ], [ 6, %58 ]
  %65 = phi i8* [ %56, %54 ], [ %59, %58 ], !dbg !291
  %66 = getelementptr inbounds i8, i8* %44, i64 %64, !dbg !292
  %67 = load i8, i8* %66, align 1, !dbg !292, !tbaa !293
  call void @llvm.dbg.value(metadata i8* %65, metadata !162, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata i8 %67, metadata !85, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !168
  %68 = icmp eq i8 %67, 17, !dbg !294
  br i1 %68, label %69, label %81, !dbg !296

69:                                               ; preds = %63
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !297, metadata !DIExpression()) #4, !dbg !307
  call void @llvm.dbg.value(metadata i8* %5, metadata !303, metadata !DIExpression()) #4, !dbg !307
  call void @llvm.dbg.value(metadata %struct.udphdr** undef, metadata !304, metadata !DIExpression()) #4, !dbg !307
  call void @llvm.dbg.value(metadata i8* %65, metadata !306, metadata !DIExpression()) #4, !dbg !307
  %70 = getelementptr inbounds i8, i8* %65, i64 8, !dbg !311
  %71 = bitcast i8* %70 to %struct.udphdr*, !dbg !311
  %72 = inttoptr i64 %4 to %struct.udphdr*, !dbg !313
  %73 = icmp ugt %struct.udphdr* %71, %72, !dbg !314
  br i1 %73, label %81, label %74, !dbg !315

74:                                               ; preds = %69
  call void @llvm.dbg.value(metadata i8* %65, metadata !306, metadata !DIExpression()) #4, !dbg !307
  call void @llvm.dbg.value(metadata %struct.udphdr* %71, metadata !162, metadata !DIExpression()), !dbg !168
  %75 = getelementptr inbounds i8, i8* %65, i64 4, !dbg !316
  %76 = bitcast i8* %75 to i16*, !dbg !316
  %77 = load i16, i16* %76, align 2, !dbg !316, !tbaa !317
  %78 = tail call i16 @llvm.bswap.i16(i16 %77) #4
  call void @llvm.dbg.value(metadata i16 %78, metadata !305, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)) #4, !dbg !307
  %79 = icmp ult i16 %78, 8, !dbg !319
  br i1 %79, label %81, label %80, !dbg !321

80:                                               ; preds = %74
  call void @llvm.dbg.value(metadata i16 %78, metadata !305, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)) #4, !dbg !307
  call void @llvm.dbg.value(metadata i16 %78, metadata !305, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)) #4, !dbg !307
  call void @llvm.dbg.value(metadata i8* undef, metadata !162, metadata !DIExpression()), !dbg !168
  br label %81, !dbg !322

81:                                               ; preds = %69, %74, %80, %58, %54, %49, %46, %1, %43, %63
  %82 = phi i32 [ 2, %80 ], [ 2, %63 ], [ 2, %43 ], [ 0, %1 ], [ 2, %46 ], [ 2, %49 ], [ 2, %54 ], [ 2, %58 ], [ 0, %74 ], [ 0, %69 ], !dbg !168
  call void @llvm.dbg.value(metadata i32 %82, metadata !83, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.label(metadata !167), !dbg !323
  ret i32 %82, !dbg !324
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #3

attributes #0 = { mustprogress nofree nounwind readonly willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!63, !64, !65, !66}
!llvm.ident = !{!67}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "suf_end", scope: !2, file: !3, line: 16, type: !61, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Alpine clang version 13.0.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !45, globals: !53, splitDebugInlining: false, nameTableKind: None)
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
!45 = !{!46, !47, !48, !51}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!47 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !49, line: 24, baseType: !50)
!49 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!50 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !{!0, !54, !59}
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 83, type: !56, isLocal: false, isDefinition: true)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 32, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 4)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(name: "suf", scope: !2, file: !3, line: 15, type: !51, isLocal: true, isDefinition: true)
!61 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !62)
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !{i32 7, !"Dwarf Version", i32 4}
!64 = !{i32 2, !"Debug Info Version", i32 3}
!65 = !{i32 1, !"wchar_size", i32 4}
!66 = !{i32 7, !"frame-pointer", i32 2}
!67 = !{!"Alpine clang version 13.0.1"}
!68 = distinct !DISubprogram(name: "xdp_patch_ports_func", scope: !3, file: !3, line: 42, type: !69, scopeLine: 43, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !81)
!69 = !DISubroutineType(types: !70)
!70 = !{!62, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5508, size: 192, elements: !73)
!73 = !{!74, !76, !77, !78, !79, !80}
!74 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !72, file: !6, line: 5509, baseType: !75, size: 32)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !49, line: 27, baseType: !7)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !72, file: !6, line: 5510, baseType: !75, size: 32, offset: 32)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !72, file: !6, line: 5511, baseType: !75, size: 32, offset: 64)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !72, file: !6, line: 5513, baseType: !75, size: 32, offset: 96)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !72, file: !6, line: 5514, baseType: !75, size: 32, offset: 128)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !72, file: !6, line: 5516, baseType: !75, size: 32, offset: 160)
!81 = !{!82, !83, !84, !85, !86, !100, !119, !151, !160, !161, !162, !167}
!82 = !DILocalVariable(name: "ctx", arg: 1, scope: !68, file: !3, line: 42, type: !71)
!83 = !DILocalVariable(name: "action", scope: !68, file: !3, line: 44, type: !62)
!84 = !DILocalVariable(name: "eth_type", scope: !68, file: !3, line: 45, type: !62)
!85 = !DILocalVariable(name: "ip_type", scope: !68, file: !3, line: 45, type: !62)
!86 = !DILocalVariable(name: "eth", scope: !68, file: !3, line: 46, type: !87)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !89, line: 169, size: 112, elements: !90)
!89 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!90 = !{!91, !96, !97}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !88, file: !89, line: 170, baseType: !92, size: 48)
!92 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 48, elements: !94)
!93 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!94 = !{!95}
!95 = !DISubrange(count: 6)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !88, file: !89, line: 171, baseType: !92, size: 48, offset: 48)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !88, file: !89, line: 172, baseType: !98, size: 16, offset: 96)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !99, line: 25, baseType: !48)
!99 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!100 = !DILocalVariable(name: "iphdr", scope: !68, file: !3, line: 47, type: !101)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !103, line: 86, size: 160, elements: !104)
!103 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!104 = !{!105, !107, !108, !109, !110, !111, !112, !113, !114, !116, !118}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !102, file: !103, line: 88, baseType: !106, size: 4, flags: DIFlagBitField, extraData: i64 0)
!106 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !49, line: 21, baseType: !93)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !102, file: !103, line: 89, baseType: !106, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !102, file: !103, line: 96, baseType: !106, size: 8, offset: 8)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !102, file: !103, line: 97, baseType: !98, size: 16, offset: 16)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !102, file: !103, line: 98, baseType: !98, size: 16, offset: 32)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !102, file: !103, line: 99, baseType: !98, size: 16, offset: 48)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !102, file: !103, line: 100, baseType: !106, size: 8, offset: 64)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !102, file: !103, line: 101, baseType: !106, size: 8, offset: 72)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !102, file: !103, line: 102, baseType: !115, size: 16, offset: 80)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !99, line: 31, baseType: !48)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !102, file: !103, line: 103, baseType: !117, size: 32, offset: 96)
!117 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !99, line: 27, baseType: !75)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !102, file: !103, line: 104, baseType: !117, size: 32, offset: 128)
!119 = !DILocalVariable(name: "ipv6hdr", scope: !68, file: !3, line: 48, type: !120)
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!121 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !122, line: 117, size: 320, elements: !123)
!122 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "")
!123 = !{!124, !125, !126, !130, !131, !132, !133, !150}
!124 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !121, file: !122, line: 119, baseType: !106, size: 4, flags: DIFlagBitField, extraData: i64 0)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !121, file: !122, line: 120, baseType: !106, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !121, file: !122, line: 127, baseType: !127, size: 24, offset: 8)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 24, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 3)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !121, file: !122, line: 129, baseType: !98, size: 16, offset: 32)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !121, file: !122, line: 130, baseType: !106, size: 8, offset: 48)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !121, file: !122, line: 131, baseType: !106, size: 8, offset: 56)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !121, file: !122, line: 133, baseType: !134, size: 128, offset: 64)
!134 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !135, line: 33, size: 128, elements: !136)
!135 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "")
!136 = !{!137}
!137 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !134, file: !135, line: 40, baseType: !138, size: 128)
!138 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !134, file: !135, line: 34, size: 128, elements: !139)
!139 = !{!140, !144, !148}
!140 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !138, file: !135, line: 35, baseType: !141, size: 128)
!141 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 128, elements: !142)
!142 = !{!143}
!143 = !DISubrange(count: 16)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !138, file: !135, line: 37, baseType: !145, size: 128)
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 128, elements: !146)
!146 = !{!147}
!147 = !DISubrange(count: 8)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !138, file: !135, line: 38, baseType: !149, size: 128)
!149 = !DICompositeType(tag: DW_TAG_array_type, baseType: !117, size: 128, elements: !57)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !121, file: !122, line: 134, baseType: !134, size: 128, offset: 192)
!151 = !DILocalVariable(name: "udphdr", scope: !68, file: !3, line: 49, type: !152)
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !154, line: 23, size: 64, elements: !155)
!154 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "")
!155 = !{!156, !157, !158, !159}
!156 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !153, file: !154, line: 24, baseType: !98, size: 16)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !153, file: !154, line: 25, baseType: !98, size: 16, offset: 16)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !153, file: !154, line: 26, baseType: !98, size: 16, offset: 32)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !153, file: !154, line: 27, baseType: !115, size: 16, offset: 48)
!160 = !DILocalVariable(name: "data_end", scope: !68, file: !3, line: 50, type: !46)
!161 = !DILocalVariable(name: "data", scope: !68, file: !3, line: 51, type: !46)
!162 = !DILocalVariable(name: "nh", scope: !68, file: !3, line: 52, type: !163)
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !164, line: 33, size: 64, elements: !165)
!164 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/root/qname_intercepter/xdp-filter")
!165 = !{!166}
!166 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !163, file: !164, line: 34, baseType: !46, size: 64)
!167 = !DILabel(scope: !68, name: "out", file: !3, line: 79)
!168 = !DILocation(line: 0, scope: !68)
!169 = !DILocation(line: 50, column: 38, scope: !68)
!170 = !{!171, !172, i64 4}
!171 = !{!"xdp_md", !172, i64 0, !172, i64 4, !172, i64 8, !172, i64 12, !172, i64 16, !172, i64 20}
!172 = !{!"int", !173, i64 0}
!173 = !{!"omnipotent char", !174, i64 0}
!174 = !{!"Simple C/C++ TBAA"}
!175 = !DILocation(line: 50, column: 27, scope: !68)
!176 = !DILocation(line: 50, column: 19, scope: !68)
!177 = !DILocation(line: 51, column: 34, scope: !68)
!178 = !{!171, !172, i64 0}
!179 = !DILocation(line: 51, column: 23, scope: !68)
!180 = !DILocation(line: 51, column: 15, scope: !68)
!181 = !DILocalVariable(name: "nh", arg: 1, scope: !182, file: !164, line: 124, type: !185)
!182 = distinct !DISubprogram(name: "parse_ethhdr", scope: !164, file: !164, line: 124, type: !183, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !187)
!183 = !DISubroutineType(types: !184)
!184 = !{!62, !185, !46, !186}
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64)
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!187 = !{!181, !188, !189}
!188 = !DILocalVariable(name: "data_end", arg: 2, scope: !182, file: !164, line: 125, type: !46)
!189 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !182, file: !164, line: 126, type: !186)
!190 = !DILocation(line: 0, scope: !182, inlinedAt: !191)
!191 = distinct !DILocation(line: 54, column: 13, scope: !68)
!192 = !DILocalVariable(name: "nh", arg: 1, scope: !193, file: !164, line: 79, type: !185)
!193 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !164, file: !164, line: 79, type: !194, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !203)
!194 = !DISubroutineType(types: !195)
!195 = !{!62, !185, !46, !186, !196}
!196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !197, size: 64)
!197 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !164, line: 64, size: 32, elements: !198)
!198 = !{!199}
!199 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !197, file: !164, line: 65, baseType: !200, size: 32)
!200 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 32, elements: !201)
!201 = !{!202}
!202 = !DISubrange(count: 2)
!203 = !{!192, !204, !205, !206, !207, !208, !209, !215, !216}
!204 = !DILocalVariable(name: "data_end", arg: 2, scope: !193, file: !164, line: 80, type: !46)
!205 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !193, file: !164, line: 81, type: !186)
!206 = !DILocalVariable(name: "vlans", arg: 4, scope: !193, file: !164, line: 82, type: !196)
!207 = !DILocalVariable(name: "eth", scope: !193, file: !164, line: 84, type: !87)
!208 = !DILocalVariable(name: "hdrsize", scope: !193, file: !164, line: 85, type: !62)
!209 = !DILocalVariable(name: "vlh", scope: !193, file: !164, line: 86, type: !210)
!210 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64)
!211 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !164, line: 42, size: 32, elements: !212)
!212 = !{!213, !214}
!213 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !211, file: !164, line: 43, baseType: !98, size: 16)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !211, file: !164, line: 44, baseType: !98, size: 16, offset: 16)
!215 = !DILocalVariable(name: "h_proto", scope: !193, file: !164, line: 87, type: !48)
!216 = !DILocalVariable(name: "i", scope: !193, file: !164, line: 88, type: !62)
!217 = !DILocation(line: 0, scope: !193, inlinedAt: !218)
!218 = distinct !DILocation(line: 129, column: 9, scope: !182, inlinedAt: !191)
!219 = !DILocation(line: 93, column: 14, scope: !220, inlinedAt: !218)
!220 = distinct !DILexicalBlock(scope: !193, file: !164, line: 93, column: 6)
!221 = !DILocation(line: 93, column: 24, scope: !220, inlinedAt: !218)
!222 = !DILocation(line: 93, column: 6, scope: !193, inlinedAt: !218)
!223 = !DILocation(line: 99, column: 17, scope: !193, inlinedAt: !218)
!224 = !{!225, !225, i64 0}
!225 = !{!"short", !173, i64 0}
!226 = !DILocalVariable(name: "h_proto", arg: 1, scope: !227, file: !164, line: 68, type: !48)
!227 = distinct !DISubprogram(name: "proto_is_vlan", scope: !164, file: !164, line: 68, type: !228, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !230)
!228 = !DISubroutineType(types: !229)
!229 = !{!62, !48}
!230 = !{!226}
!231 = !DILocation(line: 0, scope: !227, inlinedAt: !232)
!232 = distinct !DILocation(line: 106, column: 8, scope: !233, inlinedAt: !218)
!233 = distinct !DILexicalBlock(scope: !234, file: !164, line: 106, column: 7)
!234 = distinct !DILexicalBlock(scope: !235, file: !164, line: 105, column: 39)
!235 = distinct !DILexicalBlock(scope: !236, file: !164, line: 105, column: 2)
!236 = distinct !DILexicalBlock(scope: !193, file: !164, line: 105, column: 2)
!237 = !DILocation(line: 70, column: 20, scope: !227, inlinedAt: !232)
!238 = !DILocation(line: 70, column: 46, scope: !227, inlinedAt: !232)
!239 = !DILocation(line: 106, column: 7, scope: !234, inlinedAt: !218)
!240 = !DILocation(line: 109, column: 11, scope: !241, inlinedAt: !218)
!241 = distinct !DILexicalBlock(scope: !234, file: !164, line: 109, column: 7)
!242 = !DILocation(line: 109, column: 15, scope: !241, inlinedAt: !218)
!243 = !DILocation(line: 109, column: 7, scope: !234, inlinedAt: !218)
!244 = !DILocation(line: 112, column: 18, scope: !234, inlinedAt: !218)
!245 = !DILocation(line: 60, column: 6, scope: !68)
!246 = !DILocalVariable(name: "nh", arg: 1, scope: !247, file: !164, line: 151, type: !185)
!247 = distinct !DISubprogram(name: "parse_iphdr", scope: !164, file: !164, line: 151, type: !248, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !251)
!248 = !DISubroutineType(types: !249)
!249 = !{!62, !185, !46, !250}
!250 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!251 = !{!246, !252, !253, !254, !255}
!252 = !DILocalVariable(name: "data_end", arg: 2, scope: !247, file: !164, line: 152, type: !46)
!253 = !DILocalVariable(name: "iphdr", arg: 3, scope: !247, file: !164, line: 153, type: !250)
!254 = !DILocalVariable(name: "iph", scope: !247, file: !164, line: 155, type: !101)
!255 = !DILocalVariable(name: "hdrsize", scope: !247, file: !164, line: 156, type: !62)
!256 = !DILocation(line: 0, scope: !247, inlinedAt: !257)
!257 = distinct !DILocation(line: 61, column: 13, scope: !258)
!258 = distinct !DILexicalBlock(scope: !259, file: !3, line: 60, column: 39)
!259 = distinct !DILexicalBlock(scope: !68, file: !3, line: 60, column: 6)
!260 = !DILocation(line: 158, column: 10, scope: !261, inlinedAt: !257)
!261 = distinct !DILexicalBlock(scope: !247, file: !164, line: 158, column: 6)
!262 = !DILocation(line: 158, column: 14, scope: !261, inlinedAt: !257)
!263 = !DILocation(line: 158, column: 6, scope: !247, inlinedAt: !257)
!264 = !DILocation(line: 161, column: 17, scope: !247, inlinedAt: !257)
!265 = !DILocation(line: 161, column: 21, scope: !247, inlinedAt: !257)
!266 = !DILocation(line: 163, column: 13, scope: !267, inlinedAt: !257)
!267 = distinct !DILexicalBlock(scope: !247, file: !164, line: 163, column: 5)
!268 = !DILocation(line: 163, column: 5, scope: !247, inlinedAt: !257)
!269 = !DILocation(line: 167, column: 14, scope: !270, inlinedAt: !257)
!270 = distinct !DILexicalBlock(scope: !247, file: !164, line: 167, column: 6)
!271 = !DILocation(line: 167, column: 24, scope: !270, inlinedAt: !257)
!272 = !DILocation(line: 167, column: 6, scope: !247, inlinedAt: !257)
!273 = !DILocalVariable(name: "nh", arg: 1, scope: !274, file: !164, line: 132, type: !185)
!274 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !164, file: !164, line: 132, type: !275, scopeLine: 135, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !278)
!275 = !DISubroutineType(types: !276)
!276 = !{!62, !185, !46, !277}
!277 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!278 = !{!273, !279, !280, !281}
!279 = !DILocalVariable(name: "data_end", arg: 2, scope: !274, file: !164, line: 133, type: !46)
!280 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !274, file: !164, line: 134, type: !277)
!281 = !DILocalVariable(name: "ip6h", scope: !274, file: !164, line: 136, type: !120)
!282 = !DILocation(line: 0, scope: !274, inlinedAt: !283)
!283 = distinct !DILocation(line: 63, column: 13, scope: !284)
!284 = distinct !DILexicalBlock(scope: !285, file: !3, line: 62, column: 48)
!285 = distinct !DILexicalBlock(scope: !259, file: !3, line: 62, column: 13)
!286 = !DILocation(line: 142, column: 11, scope: !287, inlinedAt: !283)
!287 = distinct !DILexicalBlock(scope: !274, file: !164, line: 142, column: 6)
!288 = !DILocation(line: 142, column: 17, scope: !287, inlinedAt: !283)
!289 = !DILocation(line: 142, column: 15, scope: !287, inlinedAt: !283)
!290 = !DILocation(line: 142, column: 6, scope: !274, inlinedAt: !283)
!291 = !DILocation(line: 52, column: 25, scope: !68)
!292 = !DILocation(line: 0, scope: !259)
!293 = !{!173, !173, i64 0}
!294 = !DILocation(line: 68, column: 14, scope: !295)
!295 = distinct !DILexicalBlock(scope: !68, file: !3, line: 68, column: 6)
!296 = !DILocation(line: 68, column: 6, scope: !68)
!297 = !DILocalVariable(name: "nh", arg: 1, scope: !298, file: !164, line: 224, type: !185)
!298 = distinct !DISubprogram(name: "parse_udphdr", scope: !164, file: !164, line: 224, type: !299, scopeLine: 227, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !302)
!299 = !DISubroutineType(types: !300)
!300 = !{!62, !185, !46, !301}
!301 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !152, size: 64)
!302 = !{!297, !303, !304, !305, !306}
!303 = !DILocalVariable(name: "data_end", arg: 2, scope: !298, file: !164, line: 225, type: !46)
!304 = !DILocalVariable(name: "udphdr", arg: 3, scope: !298, file: !164, line: 226, type: !301)
!305 = !DILocalVariable(name: "len", scope: !298, file: !164, line: 228, type: !62)
!306 = !DILocalVariable(name: "h", scope: !298, file: !164, line: 229, type: !152)
!307 = !DILocation(line: 0, scope: !298, inlinedAt: !308)
!308 = distinct !DILocation(line: 69, column: 7, scope: !309)
!309 = distinct !DILexicalBlock(scope: !310, file: !3, line: 69, column: 7)
!310 = distinct !DILexicalBlock(scope: !295, file: !3, line: 68, column: 30)
!311 = !DILocation(line: 231, column: 8, scope: !312, inlinedAt: !308)
!312 = distinct !DILexicalBlock(scope: !298, file: !164, line: 231, column: 6)
!313 = !DILocation(line: 231, column: 14, scope: !312, inlinedAt: !308)
!314 = !DILocation(line: 231, column: 12, scope: !312, inlinedAt: !308)
!315 = !DILocation(line: 231, column: 6, scope: !298, inlinedAt: !308)
!316 = !DILocation(line: 237, column: 8, scope: !298, inlinedAt: !308)
!317 = !{!318, !225, i64 4}
!318 = !{!"udphdr", !225, i64 0, !225, i64 2, !225, i64 4, !225, i64 6}
!319 = !DILocation(line: 238, column: 10, scope: !320, inlinedAt: !308)
!320 = distinct !DILexicalBlock(scope: !298, file: !164, line: 238, column: 6)
!321 = !DILocation(line: 238, column: 6, scope: !298, inlinedAt: !308)
!322 = !DILocation(line: 69, column: 7, scope: !310)
!323 = !DILocation(line: 79, column: 1, scope: !68)
!324 = !DILocation(line: 80, column: 2, scope: !68)
