; ModuleID = 'probe6.4cfde88763a71e9a-cgu.0'
source_filename = "probe6.4cfde88763a71e9a-cgu.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx11.0.0"

; core::f64::<impl f64>::is_subnormal
; Function Attrs: inlinehint uwtable
define internal zeroext i1 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$12is_subnormal17hd40d40386990ce04E"(double %self) unnamed_addr #0 {
start:
  %_2 = alloca i8, align 1
; call core::f64::<impl f64>::classify
  %0 = call i8 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$8classify17h7628600715654c11E"(double %self), !range !1
  store i8 %0, ptr %_2, align 1
  %1 = load i8, ptr %_2, align 1, !range !1, !noundef !2
  %_3 = zext i8 %1 to i64
  %2 = icmp eq i64 %_3, 3
  ret i1 %2
}

; probe6::probe
; Function Attrs: uwtable
define void @_ZN6probe65probe17hcfb2f442e3dd438dE() unnamed_addr #1 {
start:
; call core::f64::<impl f64>::is_subnormal
  %_1 = call zeroext i1 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$12is_subnormal17hd40d40386990ce04E"(double 1.000000e+00)
  ret void
}

; core::f64::<impl f64>::classify
; Function Attrs: uwtable
declare i8 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$8classify17h7628600715654c11E"(double) unnamed_addr #1

attributes #0 = { inlinehint uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-m1" }
attributes #1 = { uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-m1" }

!llvm.module.flags = !{!0}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i8 0, i8 5}
!2 = !{}
