(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:12:59
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._loop-invs_._complex_guard_._complex_guard.rs_complex_guard--test-Both.vpr
; Verifier id: 00
; ------------------------------------------------------------
; Begin preamble
; ////////// Static preamble
; 
; ; /z3config.smt2
(set-option :print-success true) ; Boogie: false
(set-option :global-decls true) ; Necessary for push pop mode
(set-option :auto_config false)
(set-option :smt.case_split 3)
(set-option :smt.delay_units true)
(set-option :type_check true)
(set-option :smt.mbqi false)
(set-option :pp.bv_literals false)
(set-option :smt.qi.eager_threshold 100)
(set-option :smt.arith.solver 2)
(set-option :model.v2 true)
(set-option :smt.qi.max_multi_patterns 1000)
; 
; ; /preamble.smt2
(declare-datatypes (($Snap 0)) ((
    ($Snap.unit)
    ($Snap.combine ($Snap.first $Snap) ($Snap.second $Snap)))))
(declare-sort $Ref 0)
(declare-const $Ref.null $Ref)
(declare-sort $FPM 0)
(declare-sort $PPM 0)
(define-sort $Perm () Real)
(define-const $Perm.Write $Perm 1.0)
(define-const $Perm.No $Perm 0.0)
(define-fun $Perm.isValidVar ((p $Perm)) Bool
	(<= $Perm.No p))
(define-fun $Perm.isReadVar ((p $Perm)) Bool
    (and ($Perm.isValidVar p)
         (not (= p $Perm.No))))
(define-fun $Perm.min ((p1 $Perm) (p2 $Perm)) Real
    (ite (<= p1 p2) p1 p2))
(define-fun $Math.min ((a Int) (b Int)) Int
    (ite (<= a b) a b))
(define-fun $Math.clip ((a Int)) Int
    (ite (< a 0) 0 a))
; ////////// Sorts
; ////////// Sort wrappers
; Declaring additional sort wrappers
(declare-fun $SortWrappers.IntTo$Snap (Int) $Snap)
(declare-fun $SortWrappers.$SnapToInt ($Snap) Int)
(assert (forall ((x Int)) (!
    (= x ($SortWrappers.$SnapToInt($SortWrappers.IntTo$Snap x)))
    :pattern (($SortWrappers.IntTo$Snap x))
    :qid |$Snap.$SnapToIntTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IntTo$Snap($SortWrappers.$SnapToInt x)))
    :pattern (($SortWrappers.$SnapToInt x))
    :qid |$Snap.IntTo$SnapToInt|
    )))
(declare-fun $SortWrappers.BoolTo$Snap (Bool) $Snap)
(declare-fun $SortWrappers.$SnapToBool ($Snap) Bool)
(assert (forall ((x Bool)) (!
    (= x ($SortWrappers.$SnapToBool($SortWrappers.BoolTo$Snap x)))
    :pattern (($SortWrappers.BoolTo$Snap x))
    :qid |$Snap.$SnapToBoolTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.BoolTo$Snap($SortWrappers.$SnapToBool x)))
    :pattern (($SortWrappers.$SnapToBool x))
    :qid |$Snap.BoolTo$SnapToBool|
    )))
(declare-fun $SortWrappers.$RefTo$Snap ($Ref) $Snap)
(declare-fun $SortWrappers.$SnapTo$Ref ($Snap) $Ref)
(assert (forall ((x $Ref)) (!
    (= x ($SortWrappers.$SnapTo$Ref($SortWrappers.$RefTo$Snap x)))
    :pattern (($SortWrappers.$RefTo$Snap x))
    :qid |$Snap.$SnapTo$RefTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$RefTo$Snap($SortWrappers.$SnapTo$Ref x)))
    :pattern (($SortWrappers.$SnapTo$Ref x))
    :qid |$Snap.$RefTo$SnapTo$Ref|
    )))
(declare-fun $SortWrappers.$PermTo$Snap ($Perm) $Snap)
(declare-fun $SortWrappers.$SnapTo$Perm ($Snap) $Perm)
(assert (forall ((x $Perm)) (!
    (= x ($SortWrappers.$SnapTo$Perm($SortWrappers.$PermTo$Snap x)))
    :pattern (($SortWrappers.$PermTo$Snap x))
    :qid |$Snap.$SnapTo$PermTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PermTo$Snap($SortWrappers.$SnapTo$Perm x)))
    :pattern (($SortWrappers.$SnapTo$Perm x))
    :qid |$Snap.$PermTo$SnapTo$Perm|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.___BitVec_32_To$Snap ((_ BitVec 32)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_32_ ($Snap) (_ BitVec 32))
(assert (forall ((x (_ BitVec 32))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_32_($SortWrappers.___BitVec_32_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_32_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_32_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_32_To$Snap($SortWrappers.$SnapTo___BitVec_32_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_32_ x))
    :qid |$Snap.___BitVec_32_To$SnapTo___BitVec_32_|
    )))
(declare-fun $SortWrappers.___FloatingPoint_8_24_To$Snap ((_ FloatingPoint 8 24)) $Snap)
(declare-fun $SortWrappers.$SnapTo___FloatingPoint_8_24_ ($Snap) (_ FloatingPoint 8 24))
(assert (forall ((x (_ FloatingPoint 8 24))) (!
    (= x ($SortWrappers.$SnapTo___FloatingPoint_8_24_($SortWrappers.___FloatingPoint_8_24_To$Snap x)))
    :pattern (($SortWrappers.___FloatingPoint_8_24_To$Snap x))
    :qid |$Snap.$SnapTo___FloatingPoint_8_24_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___FloatingPoint_8_24_To$Snap($SortWrappers.$SnapTo___FloatingPoint_8_24_ x)))
    :pattern (($SortWrappers.$SnapTo___FloatingPoint_8_24_ x))
    :qid |$Snap.___FloatingPoint_8_24_To$SnapTo___FloatingPoint_8_24_|
    )))
(declare-fun $SortWrappers.___BitVec_64_To$Snap ((_ BitVec 64)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_64_ ($Snap) (_ BitVec 64))
(assert (forall ((x (_ BitVec 64))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_64_($SortWrappers.___BitVec_64_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_64_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_64_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_64_To$Snap($SortWrappers.$SnapTo___BitVec_64_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_64_ x))
    :qid |$Snap.___BitVec_64_To$SnapTo___BitVec_64_|
    )))
(declare-fun $SortWrappers.___FloatingPoint_12_52_To$Snap ((_ FloatingPoint 12 52)) $Snap)
(declare-fun $SortWrappers.$SnapTo___FloatingPoint_12_52_ ($Snap) (_ FloatingPoint 12 52))
(assert (forall ((x (_ FloatingPoint 12 52))) (!
    (= x ($SortWrappers.$SnapTo___FloatingPoint_12_52_($SortWrappers.___FloatingPoint_12_52_To$Snap x)))
    :pattern (($SortWrappers.___FloatingPoint_12_52_To$Snap x))
    :qid |$Snap.$SnapTo___FloatingPoint_12_52_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___FloatingPoint_12_52_To$Snap($SortWrappers.$SnapTo___FloatingPoint_12_52_ x)))
    :pattern (($SortWrappers.$SnapTo___FloatingPoint_12_52_ x))
    :qid |$Snap.___FloatingPoint_12_52_To$SnapTo___FloatingPoint_12_52_|
    )))
(declare-fun $SortWrappers.___BitVec_8_To$Snap ((_ BitVec 8)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_8_ ($Snap) (_ BitVec 8))
(assert (forall ((x (_ BitVec 8))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_8_($SortWrappers.___BitVec_8_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_8_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_8_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_8_To$Snap($SortWrappers.$SnapTo___BitVec_8_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_8_ x))
    :qid |$Snap.___BitVec_8_To$SnapTo___BitVec_8_|
    )))
(declare-fun $SortWrappers.___BitVec_16_To$Snap ((_ BitVec 16)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_16_ ($Snap) (_ BitVec 16))
(assert (forall ((x (_ BitVec 16))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_16_($SortWrappers.___BitVec_16_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_16_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_16_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_16_To$Snap($SortWrappers.$SnapTo___BitVec_16_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_16_ x))
    :qid |$Snap.___BitVec_16_To$SnapTo___BitVec_16_|
    )))
(declare-fun $SortWrappers.___BitVec_128_To$Snap ((_ BitVec 128)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_128_ ($Snap) (_ BitVec 128))
(assert (forall ((x (_ BitVec 128))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_128_($SortWrappers.___BitVec_128_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_128_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_128_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_128_To$Snap($SortWrappers.$SnapTo___BitVec_128_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_128_ x))
    :qid |$Snap.___BitVec_128_To$SnapTo___BitVec_128_|
    )))
; ////////// Symbols
; Declaring symbols related to program functions (from program analysis)
(declare-fun read$ ($Snap) $Perm)
(declare-fun read$%limited ($Snap) $Perm)
(declare-const read$%stateless Bool)
(declare-fun read$%precondition ($Snap) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun DeadBorrowToken$%trigger ($Snap Int) Bool)
(declare-fun i32%trigger ($Snap $Ref) Bool)
(declare-fun tuple0$%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap)) (!
  (= (read$%limited s@$) (read$ s@$))
  :pattern ((read$ s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as read$%stateless  Bool)
  :pattern ((read$%limited s@$))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) (=>
    (read$%precondition s@$)
    (and (< $Perm.No result@0@00) (< result@0@00 $Perm.Write))))
  :pattern ((read$%limited s@$))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-4|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m_test ----------
(declare-const _0@0@01 $Ref)
(declare-const _0@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var __t0: Bool
(declare-const __t0@2@01 Bool)
; [exec]
; var __t1: Bool
(declare-const __t1@3@01 Bool)
; [exec]
; var __t2: Bool
(declare-const __t2@4@01 Bool)
; [exec]
; var __t3: Bool
(declare-const __t3@5@01 Bool)
; [exec]
; var __t4: Bool
(declare-const __t4@6@01 Bool)
; [exec]
; var __t5: Bool
(declare-const __t5@7@01 Bool)
; [exec]
; var __t6: Bool
(declare-const __t6@8@01 Bool)
; [exec]
; var __t7: Bool
(declare-const __t7@9@01 Bool)
; [exec]
; var __t8: Bool
(declare-const __t8@10@01 Bool)
; [exec]
; var __t9: Bool
(declare-const __t9@11@01 Bool)
; [exec]
; var __t10: Bool
(declare-const __t10@12@01 Bool)
; [exec]
; var __t11: Bool
(declare-const __t11@13@01 Bool)
; [exec]
; var __t12: Bool
(declare-const __t12@14@01 Bool)
; [exec]
; var __t13: Bool
(declare-const __t13@15@01 Bool)
; [exec]
; var __t14: Bool
(declare-const __t14@16@01 Bool)
; [exec]
; var __t15: Bool
(declare-const __t15@17@01 Bool)
; [exec]
; var __t16: Bool
(declare-const __t16@18@01 Bool)
; [exec]
; var __t17: Bool
(declare-const __t17@19@01 Bool)
; [exec]
; var __t18: Bool
(declare-const __t18@20@01 Bool)
; [exec]
; var __t19: Bool
(declare-const __t19@21@01 Bool)
; [exec]
; var __t20: Bool
(declare-const __t20@22@01 Bool)
; [exec]
; var __t21: Bool
(declare-const __t21@23@01 Bool)
; [exec]
; var __t22: Bool
(declare-const __t22@24@01 Bool)
; [exec]
; var __t23: Bool
(declare-const __t23@25@01 Bool)
; [exec]
; var __t24: Bool
(declare-const __t24@26@01 Bool)
; [exec]
; var __t25: Bool
(declare-const __t25@27@01 Bool)
; [exec]
; var __t26: Bool
(declare-const __t26@28@01 Bool)
; [exec]
; var __t27: Bool
(declare-const __t27@29@01 Bool)
; [exec]
; var __t28: Bool
(declare-const __t28@30@01 Bool)
; [exec]
; var __t29: Bool
(declare-const __t29@31@01 Bool)
; [exec]
; var __t30: Bool
(declare-const __t30@32@01 Bool)
; [exec]
; var __t31: Bool
(declare-const __t31@33@01 Bool)
; [exec]
; var __t32: Bool
(declare-const __t32@34@01 Bool)
; [exec]
; var __t33: Bool
(declare-const __t33@35@01 Bool)
; [exec]
; var __t34: Bool
(declare-const __t34@36@01 Bool)
; [exec]
; var __t35: Bool
(declare-const __t35@37@01 Bool)
; [exec]
; var __t36: Bool
(declare-const __t36@38@01 Bool)
; [exec]
; var __t37: Bool
(declare-const __t37@39@01 Bool)
; [exec]
; var __t38: Bool
(declare-const __t38@40@01 Bool)
; [exec]
; var __t39: Bool
(declare-const __t39@41@01 Bool)
; [exec]
; var __t40: Bool
(declare-const __t40@42@01 Bool)
; [exec]
; var __t41: Bool
(declare-const __t41@43@01 Bool)
; [exec]
; var __t42: Bool
(declare-const __t42@44@01 Bool)
; [exec]
; var __t43: Bool
(declare-const __t43@45@01 Bool)
; [exec]
; var __t44: Bool
(declare-const __t44@46@01 Bool)
; [exec]
; var __t45: Bool
(declare-const __t45@47@01 Bool)
; [exec]
; var __t46: Bool
(declare-const __t46@48@01 Bool)
; [exec]
; var __t47: Bool
(declare-const __t47@49@01 Bool)
; [exec]
; var __t48: Bool
(declare-const __t48@50@01 Bool)
; [exec]
; var __t49: Bool
(declare-const __t49@51@01 Bool)
; [exec]
; var __t50: Bool
(declare-const __t50@52@01 Bool)
; [exec]
; var __t51: Bool
(declare-const __t51@53@01 Bool)
; [exec]
; var __t52: Bool
(declare-const __t52@54@01 Bool)
; [exec]
; var __t53: Bool
(declare-const __t53@55@01 Bool)
; [exec]
; var __t54: Bool
(declare-const __t54@56@01 Bool)
; [exec]
; var __t55: Bool
(declare-const __t55@57@01 Bool)
; [exec]
; var __t56: Bool
(declare-const __t56@58@01 Bool)
; [exec]
; var __t57: Bool
(declare-const __t57@59@01 Bool)
; [exec]
; var __t58: Bool
(declare-const __t58@60@01 Bool)
; [exec]
; var __t59: Bool
(declare-const __t59@61@01 Bool)
; [exec]
; var __t60: Bool
(declare-const __t60@62@01 Bool)
; [exec]
; var __t61: Bool
(declare-const __t61@63@01 Bool)
; [exec]
; var __t62: Bool
(declare-const __t62@64@01 Bool)
; [exec]
; var __t63: Bool
(declare-const __t63@65@01 Bool)
; [exec]
; var __t64: Bool
(declare-const __t64@66@01 Bool)
; [exec]
; var __t65: Bool
(declare-const __t65@67@01 Bool)
; [exec]
; var __t66: Bool
(declare-const __t66@68@01 Bool)
; [exec]
; var __t67: Bool
(declare-const __t67@69@01 Bool)
; [exec]
; var __t68: Bool
(declare-const __t68@70@01 Bool)
; [exec]
; var __t69: Bool
(declare-const __t69@71@01 Bool)
; [exec]
; var __t70: Bool
(declare-const __t70@72@01 Bool)
; [exec]
; var __t71: Bool
(declare-const __t71@73@01 Bool)
; [exec]
; var __t72: Bool
(declare-const __t72@74@01 Bool)
; [exec]
; var __t73: Bool
(declare-const __t73@75@01 Bool)
; [exec]
; var __t74: Bool
(declare-const __t74@76@01 Bool)
; [exec]
; var __t75: Bool
(declare-const __t75@77@01 Bool)
; [exec]
; var __t76: Bool
(declare-const __t76@78@01 Bool)
; [exec]
; var __t77: Bool
(declare-const __t77@79@01 Bool)
; [exec]
; var __t78: Bool
(declare-const __t78@80@01 Bool)
; [exec]
; var __t79: Bool
(declare-const __t79@81@01 Bool)
; [exec]
; var __t80: Bool
(declare-const __t80@82@01 Bool)
; [exec]
; var __t81: Bool
(declare-const __t81@83@01 Bool)
; [exec]
; var __t82: Bool
(declare-const __t82@84@01 Bool)
; [exec]
; var _1: Ref
(declare-const _1@85@01 $Ref)
; [exec]
; var _5: Ref
(declare-const _5@86@01 $Ref)
; [exec]
; var _9: Ref
(declare-const _9@87@01 $Ref)
; [exec]
; var _10: Ref
(declare-const _10@88@01 $Ref)
; [exec]
; var _12: Ref
(declare-const _12@89@01 $Ref)
; [exec]
; var _13: Int
(declare-const _13@90@01 Int)
; [exec]
; var _14: Ref
(declare-const _14@91@01 $Ref)
; [exec]
; var _15: Int
(declare-const _15@92@01 Int)
; [exec]
; var _16: Ref
(declare-const _16@93@01 $Ref)
; [exec]
; var _18: Ref
(declare-const _18@94@01 $Ref)
; [exec]
; var _23: Ref
(declare-const _23@95@01 $Ref)
; [exec]
; var _24: Int
(declare-const _24@96@01 Int)
; [exec]
; var _27: Ref
(declare-const _27@97@01 $Ref)
; [exec]
; var _28: Int
(declare-const _28@98@01 Int)
; [exec]
; var _30: Ref
(declare-const _30@99@01 $Ref)
; [exec]
; var _34: Int
(declare-const _34@100@01 Int)
; [exec]
; var _36: Ref
(declare-const _36@101@01 $Ref)
; [exec]
; var _39: Ref
(declare-const _39@102@01 $Ref)
; [exec]
; var _41: Ref
(declare-const _41@103@01 $Ref)
; [exec]
; var _42: Int
(declare-const _42@104@01 Int)
; [exec]
; var _45: Ref
(declare-const _45@105@01 $Ref)
; [exec]
; var _46: Int
(declare-const _46@106@01 Int)
; [exec]
; var _48: Ref
(declare-const _48@107@01 $Ref)
; [exec]
; var _52: Ref
(declare-const _52@108@01 $Ref)
; [exec]
; var _53: Int
(declare-const _53@109@01 Int)
; [exec]
; var _58: Ref
(declare-const _58@110@01 $Ref)
; [exec]
; var _59: Ref
(declare-const _59@111@01 $Ref)
; [exec]
; var _60: Int
(declare-const _60@112@01 Int)
; [exec]
; label start
; [exec]
; __t0 := false
; [exec]
; __t1 := false
; [exec]
; __t2 := false
; [exec]
; __t3 := false
; [exec]
; __t4 := false
; [exec]
; __t5 := false
; [exec]
; __t6 := false
; [exec]
; __t7 := false
; [exec]
; __t8 := false
; [exec]
; __t9 := false
; [exec]
; __t10 := false
; [exec]
; __t11 := false
; [exec]
; __t12 := false
; [exec]
; __t13 := false
; [exec]
; __t14 := false
; [exec]
; __t15 := false
; [exec]
; __t16 := false
; [exec]
; __t17 := false
; [exec]
; __t18 := false
; [exec]
; __t19 := false
; [exec]
; __t20 := false
; [exec]
; __t21 := false
; [exec]
; __t22 := false
; [exec]
; __t23 := false
; [exec]
; __t24 := false
; [exec]
; __t25 := false
; [exec]
; __t26 := false
; [exec]
; __t27 := false
; [exec]
; __t28 := false
; [exec]
; __t29 := false
; [exec]
; __t30 := false
; [exec]
; __t31 := false
; [exec]
; __t32 := false
; [exec]
; __t33 := false
; [exec]
; label pre
; [exec]
; __t0 := true
; [exec]
; _1 := builtin$havoc_ref()
(declare-const ret@113@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_1.val_int, write)
(declare-const $t@114@01 Int)
(assert (not (= ret@113@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _1.val_int := 0
; [exec]
; __t1 := true
; [exec]
; _5 := builtin$havoc_ref()
(declare-const ret@115@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_5.val_bool, write)
(declare-const $t@116@01 Bool)
(assert (not (= ret@115@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _5.val_bool := false
; [exec]
; __t34 := _5.val_bool
; [exec]
; __t2 := true
; [exec]
; __t3 := true
; [exec]
; __t4 := true
; [exec]
; __t5 := true
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@117@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_10.val_int, write)
(declare-const $t@118@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@113@01 ret@117@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@117@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _10.val_int := _1.val_int
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@113@01 ret@117@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l0
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@119@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _13 := _1.val_int
; [exec]
; label l1
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@120@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _15 := _10.val_int
; [exec]
; label l2
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@121@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0, write)
(declare-const $t@122@01 $Ref)
(assert (not (= ret@121@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0.val_int, write)
(declare-const $t@123@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@122@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@113@01 $t@122@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@122@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1, write)
(declare-const $t@124@01 $Ref)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1.val_bool, write)
(declare-const $t@125@01 Bool)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@124@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.tuple_0.val_int := _15 + 10
; [eval] _15 + 10
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@113@01 $t@122@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@122@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; _16.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t35 := _16.tuple_1.val_bool
; [exec]
; assert !__t35
; [eval] !__t35
; [exec]
; __t8 := true
; [exec]
; _14 := _16.tuple_0
; [exec]
; label l3
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@126@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_bool, write)
(declare-const $t@127@01 Bool)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@126@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _12.val_bool := _13 < _14.val_int
; [eval] _13 < _14.val_int
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@126@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t36 := _12.val_bool
; [eval] !__t36
; [then-branch: 0 | False | dead]
; [else-branch: 0 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | True]
(pop) ; 3
; [eval] !!__t36
; [eval] !__t36
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 1 | True | live]
; [else-branch: 1 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | True]
; [exec]
; label return
; [exec]
; __t9 := true
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@128@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.val_bool, write)
(declare-const $t@129@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@128@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@128@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@128@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@128@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _18.val_bool := false
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@128@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@128@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@128@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t37 := _18.val_bool
; [exec]
; fold acc(i32(_1), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap 0) ret@113@01))
; [exec]
; fold acc(i32(_10), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap 0) ret@117@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@113@01 ret@117@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_10), write) in
;     (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
; [eval] (unfolding acc(i32(_10), write) in (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@117@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10)
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@113@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@113@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int < _10.val_int + 10
; [eval] _10.val_int + 10
(pop) ; 5
; Joined path conditions
(pop) ; 4
; Joined path conditions
; [exec]
; assert true
; [exec]
; exhale acc(i32(_1), write) && acc(i32(_10), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 4
(assert (read$%precondition $Snap.unit))
(pop) ; 4
; Joined path conditions
(assert (read$%precondition $Snap.unit))
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; _1 := builtin$havoc_ref()
(declare-const ret@130@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@131@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@132@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@133@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@134@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@135@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@136@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@137@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _24 := builtin$havoc_int()
(declare-const ret@138@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@139@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@140@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@141@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t10 := builtin$havoc_bool()
(declare-const ret@142@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t11 := builtin$havoc_bool()
(declare-const ret@143@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t12 := builtin$havoc_bool()
(declare-const ret@144@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t13 := builtin$havoc_bool()
(declare-const ret@145@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t14 := builtin$havoc_bool()
(declare-const ret@146@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t15 := builtin$havoc_bool()
(declare-const ret@147@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t38 := builtin$havoc_bool()
(declare-const ret@148@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t39 := builtin$havoc_bool()
(declare-const ret@149@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t40 := builtin$havoc_bool()
(declare-const ret@150@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t41 := builtin$havoc_bool()
(declare-const ret@151@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t42 := builtin$havoc_bool()
(declare-const ret@152@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t43 := builtin$havoc_bool()
(declare-const ret@153@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t44 := builtin$havoc_bool()
(declare-const ret@154@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t45 := builtin$havoc_bool()
(declare-const ret@155@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t46 := builtin$havoc_bool()
(declare-const ret@156@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t6 := builtin$havoc_bool()
(declare-const ret@157@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t7 := builtin$havoc_bool()
(declare-const ret@158@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t8 := builtin$havoc_bool()
(declare-const ret@159@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t9 := builtin$havoc_bool()
(declare-const ret@160@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(i32(_1), write) && acc(i32(_10), read$())
(declare-const $t@161@01 $Snap)
(assert (= $t@161@01 ($Snap.combine ($Snap.first $t@161@01) ($Snap.second $t@161@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@162@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
    (= $t@162@01 ($SortWrappers.IntTo$Snap 0)))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@162@01 ($Snap.second $t@161@01)))))
(assert (<=
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@163@01 $Snap)
(assert (= $t@163@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@164@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@130@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.first $t@161@01) ret@130@01))
; [exec]
; _13 := _1.val_int
(declare-const _13@165@01 Int)
(assert (= _13@165@01 ($SortWrappers.$SnapToInt ($Snap.first $t@161@01))))
; [exec]
; label l6
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@166@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_10), write)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@117@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@117@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger $t@162@01 ret@117@01))
; [exec]
; _15 := _10.val_int
(declare-const _15@167@01 Int)
(assert (= _15@167@01 ($SortWrappers.$SnapToInt $t@162@01)))
; [exec]
; label l7
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@168@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0, write)
(declare-const $t@169@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@168@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@168@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0.val_int, write)
(declare-const $t@170@01 Int)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@169@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@169@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@169@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@169@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1, write)
(declare-const $t@171@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@168@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1.val_bool, write)
(declare-const $t@172@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@171@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.tuple_0.val_int := _15 + 10
; [eval] _15 + 10
(declare-const val_int@173@01 Int)
(assert (= val_int@173@01 (+ _15@167@01 10)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@169@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@169@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@169@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; _16.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t38 := _16.tuple_1.val_bool
; [exec]
; inhale !__t38
(declare-const $t@174@01 $Snap)
(assert (= $t@174@01 $Snap.unit))
; [eval] !__t38
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t8 := true
; [exec]
; _14 := _16.tuple_0
; [exec]
; label l8
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@175@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_bool, write)
(declare-const $t@176@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@175@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _12.val_bool := _13 < _14.val_int
; [eval] _13 < _14.val_int
(declare-const val_bool@177@01 Bool)
(assert (= val_bool@177@01 (< _13@165@01 val_int@173@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t39 := _12.val_bool
; [eval] !__t39
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@177@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@177@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | !(val_bool@177@01) | live]
; [else-branch: 2 | val_bool@177@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | !(val_bool@177@01)]
(assert (not val_bool@177@01))
; [exec]
; label loop5_group1_loop7_group1_bb7
; [exec]
; label end_of_method
(pop) ; 4
(push) ; 4
; [else-branch: 2 | val_bool@177@01]
(assert val_bool@177@01)
(pop) ; 4
; [eval] !!__t39
; [eval] !__t39
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@177@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@177@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 3 | val_bool@177@01 | live]
; [else-branch: 3 | !(val_bool@177@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | val_bool@177@01]
(assert val_bool@177@01)
; [exec]
; label bb0
; [exec]
; __t9 := true
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@178@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.val_bool, write)
(declare-const $t@179@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@178@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _18.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t40 := _18.val_bool
; [exec]
; inhale _1.val_int < _10.val_int + 10
(declare-const $t@180@01 $Snap)
(assert (= $t@180@01 $Snap.unit))
; [eval] _1.val_int < _10.val_int + 10
; [eval] _10.val_int + 10
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.first $t@161@01))
  (+ ($SortWrappers.$SnapToInt $t@162@01) 10)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t10 := true
; [exec]
; __t11 := true
; [exec]
; _24 := builtin$havoc_int()
(declare-const ret@181@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _24 := _1.val_int
(declare-const _24@182@01 Int)
(assert (= _24@182@01 ($SortWrappers.$SnapToInt ($Snap.first $t@161@01))))
; [exec]
; label l11
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@183@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_23.val_bool, write)
(declare-const $t@184@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@183@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _23.val_bool := _24 == 123123
; [eval] _24 == 123123
(declare-const val_bool@185@01 Bool)
(assert (= val_bool@185@01 (= _24@182@01 123123)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@183@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t41 := _23.val_bool
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@185@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 4 | val_bool@185@01 | dead]
; [else-branch: 4 | !(val_bool@185@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 4 | !(val_bool@185@01)]
(assert (not val_bool@185@01))
(pop) ; 5
; [eval] !__t41
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@185@01))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@185@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 5 | !(val_bool@185@01) | live]
; [else-branch: 5 | val_bool@185@01 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | !(val_bool@185@01)]
(assert (not val_bool@185@01))
; [exec]
; label bb1
; [exec]
; __t12 := true
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@186@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _28 := _1.val_int
(declare-const _28@187@01 Int)
(assert (= _28@187@01 ($SortWrappers.$SnapToInt ($Snap.first $t@161@01))))
; [exec]
; label l14
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@188@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_27.val_bool, write)
(declare-const $t@189@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@188@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27.val_bool := _28 == 234234
; [eval] _28 == 234234
(declare-const val_bool@190@01 Bool)
(assert (= val_bool@190@01 (= _28@187@01 234234)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t42 := _27.val_bool
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@190@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | val_bool@190@01 | dead]
; [else-branch: 6 | !(val_bool@190@01) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 6 | !(val_bool@190@01)]
(assert (not val_bool@190@01))
(pop) ; 6
; [eval] !__t42
(push) ; 6
(set-option :timeout 10)
(assert (not val_bool@190@01))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@190@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 7 | !(val_bool@190@01) | live]
; [else-branch: 7 | val_bool@190@01 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 7 | !(val_bool@190@01)]
(assert (not val_bool@190@01))
; [exec]
; label bb3
; [exec]
; __t14 := true
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@191@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.tuple_0, write)
(declare-const $t@192@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@191@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.tuple_0.val_int, write)
(declare-const $t@193@01 Int)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@192@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.tuple_1, write)
(declare-const $t@194@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.tuple_1.val_bool, write)
(declare-const $t@195@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@194@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _30.tuple_0.val_int := _1.val_int + 1
; [eval] _1.val_int + 1
(declare-const val_int@196@01 Int)
(assert (= val_int@196@01 (+ ($SortWrappers.$SnapToInt ($Snap.first $t@161@01)) 1)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; _30.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@194@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t43 := _30.tuple_1.val_bool
; [exec]
; assert !__t43
; [eval] !__t43
; [exec]
; __t15 := true
; [exec]
; _1 := _30.tuple_0
; [exec]
; label l17
; [exec]
; label loop5_start
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@197@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _13 := _1.val_int
; [exec]
; label l18
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@198@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _15 := _10.val_int
(declare-const _15@199@01 Int)
(assert (= _15@199@01 ($SortWrappers.$SnapToInt $t@162@01)))
; [exec]
; label l19
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@200@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0, write)
(declare-const $t@201@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@200@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@200@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@200@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@200@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0.val_int, write)
(declare-const $t@202@01 Int)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@201@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@201@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@201@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@201@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@192@01 $t@201@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@201@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1, write)
(declare-const $t@203@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@200@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@200@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@200@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1.val_bool, write)
(declare-const $t@204@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@203@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.tuple_0.val_int := _15 + 10
; [eval] _15 + 10
(declare-const val_int@205@01 Int)
(assert (= val_int@205@01 (+ _15@199@01 10)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@192@01 $t@201@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@201@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@201@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@201@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@201@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; _16.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@203@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t44 := _16.tuple_1.val_bool
; [exec]
; assert !__t44
; [eval] !__t44
; [exec]
; __t8 := true
; [exec]
; _14 := _16.tuple_0
; [exec]
; label l20
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@206@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_bool, write)
(declare-const $t@207@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@206@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _12.val_bool := _13 < _14.val_int
; [eval] _13 < _14.val_int
(declare-const val_bool@208@01 Bool)
(assert (= val_bool@208@01 (< val_int@196@01 val_int@205@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@206@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t45 := _12.val_bool
; [eval] !__t45
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not val_bool@208@01))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not val_bool@208@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 8 | !(val_bool@208@01) | live]
; [else-branch: 8 | val_bool@208@01 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 8 | !(val_bool@208@01)]
(assert (not val_bool@208@01))
; [exec]
; label loop5_group1_bb6
; [exec]
; label loop5_group1_loop7_group1_bb9
; [exec]
; __t17 := true
; [exec]
; label l4
; [exec]
; __t18 := true
; [exec]
; _34 := builtin$havoc_int()
(declare-const ret@209@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _34 := _1.val_int
; [exec]
; label l23
; [exec]
; _9 := builtin$havoc_ref()
(declare-const ret@210@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_9.val_bool, write)
(declare-const $t@211@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@210@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _9.val_bool := _34 < 55
; [eval] _34 < 55
(declare-const val_bool@212@01 Bool)
(assert (= val_bool@212@01 (< val_int@196@01 55)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@210@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t47 := _9.val_bool
; [eval] !__t47
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not val_bool@212@01))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 9 | !(val_bool@212@01) | dead]
; [else-branch: 9 | val_bool@212@01 | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 9 | val_bool@212@01]
(assert val_bool@212@01)
(pop) ; 8
; [eval] !!__t47
; [eval] !__t47
(push) ; 8
(set-option :timeout 10)
(assert (not (not val_bool@212@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not val_bool@212@01))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 10 | val_bool@212@01 | live]
; [else-branch: 10 | !(val_bool@212@01) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 10 | val_bool@212@01]
(assert val_bool@212@01)
; [exec]
; label l5
; [exec]
; __t19 := true
; [exec]
; _36 := builtin$havoc_ref()
(declare-const ret@213@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_36.val_bool, write)
(declare-const $t@214@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@213@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _36.val_bool := false
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@213@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t48 := _36.val_bool
; [exec]
; fold acc(i32(_1), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@196@01) $t@192@01))
; [exec]
; assert (unfolding acc(i32(_1), write) in
;     (_1.val_int >= 0 || _1.val_int % 10 == 0 ?
;       _1.val_int % 10 :
;       _1.val_int % 10 - 10) ==
;     0 &&
;     _1.val_int < 55)
; [eval] (unfolding acc(i32(_1), write) in (_1.val_int >= 0 || _1.val_int % 10 == 0 ? _1.val_int % 10 : _1.val_int % 10 - 10) == 0 && _1.val_int < 55)
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] (_1.val_int >= 0 || _1.val_int % 10 == 0 ? _1.val_int % 10 : _1.val_int % 10 - 10) == 0 && _1.val_int < 55
; [eval] (_1.val_int >= 0 || _1.val_int % 10 == 0 ? _1.val_int % 10 : _1.val_int % 10 - 10) == 0
; [eval] (_1.val_int >= 0 || _1.val_int % 10 == 0 ? _1.val_int % 10 : _1.val_int % 10 - 10)
; [eval] _1.val_int >= 0 || _1.val_int % 10 == 0
; [eval] _1.val_int >= 0
(set-option :timeout 0)
(push) ; 10
; [then-branch: 11 | val_int@196@01 >= 0 | live]
; [else-branch: 11 | !(val_int@196@01 >= 0) | live]
(push) ; 11
; [then-branch: 11 | val_int@196@01 >= 0]
(assert (>= val_int@196@01 0))
(pop) ; 11
(push) ; 11
; [else-branch: 11 | !(val_int@196@01 >= 0)]
(assert (not (>= val_int@196@01 0)))
; [eval] _1.val_int % 10 == 0
; [eval] _1.val_int % 10
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (not (>= val_int@196@01 0)) (>= val_int@196@01 0)))
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (not (or (>= val_int@196@01 0) (= (mod val_int@196@01 10) 0)))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (or (>= val_int@196@01 0) (= (mod val_int@196@01 10) 0))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 12 | val_int@196@01 >= 0 || val_int@196@01 % 10 == 0 | live]
; [else-branch: 12 | !(val_int@196@01 >= 0 || val_int@196@01 % 10 == 0) | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 12 | val_int@196@01 >= 0 || val_int@196@01 % 10 == 0]
(assert (or (>= val_int@196@01 0) (= (mod val_int@196@01 10) 0)))
; [eval] _1.val_int % 10
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (or (>= val_int@196@01 0) (= (mod val_int@196@01 10) 0)))
(push) ; 10
; [then-branch: 13 | val_int@196@01 % 10 == 0 | live]
; [else-branch: 13 | val_int@196@01 % 10 != 0 | live]
(push) ; 11
; [then-branch: 13 | val_int@196@01 % 10 == 0]
(assert (= (mod val_int@196@01 10) 0))
; [eval] _1.val_int < 55
(pop) ; 11
(push) ; 11
; [else-branch: 13 | val_int@196@01 % 10 != 0]
(assert (not (= (mod val_int@196@01 10) 0)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (not (= (mod val_int@196@01 10) 0)) (= (mod val_int@196@01 10) 0)))
(pop) ; 9
; Joined path conditions
(assert (and
  (or (not (>= val_int@196@01 0)) (>= val_int@196@01 0))
  (or (>= val_int@196@01 0) (= (mod val_int@196@01 10) 0))
  (or (not (= (mod val_int@196@01 10) 0)) (= (mod val_int@196@01 10) 0))))
(push) ; 9
(assert (not (and (< val_int@196@01 55) (= (mod val_int@196@01 10) 0))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (and (< val_int@196@01 55) (= (mod val_int@196@01 10) 0)))
; [exec]
; assert true
; [exec]
; exhale acc(i32(_1), write)
; [exec]
; _1 := builtin$havoc_ref()
(declare-const ret@215@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@216@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@217@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@218@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@219@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@220@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@221@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@222@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@223@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _24 := builtin$havoc_int()
(declare-const ret@224@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@225@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@226@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@227@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _34 := builtin$havoc_int()
(declare-const ret@228@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _36 := builtin$havoc_ref()
(declare-const ret@229@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _39 := builtin$havoc_ref()
(declare-const ret@230@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _41 := builtin$havoc_ref()
(declare-const ret@231@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _42 := builtin$havoc_int()
(declare-const ret@232@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _45 := builtin$havoc_ref()
(declare-const ret@233@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _46 := builtin$havoc_int()
(declare-const ret@234@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _48 := builtin$havoc_ref()
(declare-const ret@235@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _9 := builtin$havoc_ref()
(declare-const ret@236@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t10 := builtin$havoc_bool()
(declare-const ret@237@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t11 := builtin$havoc_bool()
(declare-const ret@238@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t12 := builtin$havoc_bool()
(declare-const ret@239@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t13 := builtin$havoc_bool()
(declare-const ret@240@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t14 := builtin$havoc_bool()
(declare-const ret@241@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t15 := builtin$havoc_bool()
(declare-const ret@242@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t16 := builtin$havoc_bool()
(declare-const ret@243@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t17 := builtin$havoc_bool()
(declare-const ret@244@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t18 := builtin$havoc_bool()
(declare-const ret@245@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t19 := builtin$havoc_bool()
(declare-const ret@246@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t20 := builtin$havoc_bool()
(declare-const ret@247@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t21 := builtin$havoc_bool()
(declare-const ret@248@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t22 := builtin$havoc_bool()
(declare-const ret@249@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t23 := builtin$havoc_bool()
(declare-const ret@250@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t24 := builtin$havoc_bool()
(declare-const ret@251@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t25 := builtin$havoc_bool()
(declare-const ret@252@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t26 := builtin$havoc_bool()
(declare-const ret@253@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t4 := builtin$havoc_bool()
(declare-const ret@254@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t49 := builtin$havoc_bool()
(declare-const ret@255@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t5 := builtin$havoc_bool()
(declare-const ret@256@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t50 := builtin$havoc_bool()
(declare-const ret@257@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t51 := builtin$havoc_bool()
(declare-const ret@258@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t52 := builtin$havoc_bool()
(declare-const ret@259@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t53 := builtin$havoc_bool()
(declare-const ret@260@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t54 := builtin$havoc_bool()
(declare-const ret@261@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t55 := builtin$havoc_bool()
(declare-const ret@262@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t56 := builtin$havoc_bool()
(declare-const ret@263@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t57 := builtin$havoc_bool()
(declare-const ret@264@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t58 := builtin$havoc_bool()
(declare-const ret@265@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t59 := builtin$havoc_bool()
(declare-const ret@266@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t6 := builtin$havoc_bool()
(declare-const ret@267@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t60 := builtin$havoc_bool()
(declare-const ret@268@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t61 := builtin$havoc_bool()
(declare-const ret@269@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t62 := builtin$havoc_bool()
(declare-const ret@270@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t63 := builtin$havoc_bool()
(declare-const ret@271@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t64 := builtin$havoc_bool()
(declare-const ret@272@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t65 := builtin$havoc_bool()
(declare-const ret@273@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t66 := builtin$havoc_bool()
(declare-const ret@274@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t67 := builtin$havoc_bool()
(declare-const ret@275@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t68 := builtin$havoc_bool()
(declare-const ret@276@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t69 := builtin$havoc_bool()
(declare-const ret@277@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t7 := builtin$havoc_bool()
(declare-const ret@278@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t70 := builtin$havoc_bool()
(declare-const ret@279@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t71 := builtin$havoc_bool()
(declare-const ret@280@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t72 := builtin$havoc_bool()
(declare-const ret@281@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t73 := builtin$havoc_bool()
(declare-const ret@282@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t74 := builtin$havoc_bool()
(declare-const ret@283@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t75 := builtin$havoc_bool()
(declare-const ret@284@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t76 := builtin$havoc_bool()
(declare-const ret@285@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t77 := builtin$havoc_bool()
(declare-const ret@286@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t78 := builtin$havoc_bool()
(declare-const ret@287@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t79 := builtin$havoc_bool()
(declare-const ret@288@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t8 := builtin$havoc_bool()
(declare-const ret@289@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t80 := builtin$havoc_bool()
(declare-const ret@290@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t9 := builtin$havoc_bool()
(declare-const ret@291@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(i32(_1), write)
(declare-const $t@292@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@293@01 $Snap)
(assert (= $t@293@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; __t4 := true
; [exec]
; __t5 := true
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@294@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_10.val_int, write)
(declare-const $t@295@01 Int)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@294@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@215@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@215@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@215@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@215@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@215@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@294@01 ret@215@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@215@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($SortWrappers.IntTo$Snap $t@292@01) ret@215@01))
; [exec]
; _10.val_int := _1.val_int
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@215@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l26
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@296@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _13 := _1.val_int
; [exec]
; label l27
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@297@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _15 := _10.val_int
; [exec]
; label l28
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@298@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0, write)
(declare-const $t@299@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@298@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0.val_int, write)
(declare-const $t@300@01 Int)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@215@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@299@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1, write)
(declare-const $t@301@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1.val_bool, write)
(declare-const $t@302@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@301@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.tuple_0.val_int := _15 + 10
; [eval] _15 + 10
(declare-const val_int@303@01 Int)
(assert (= val_int@303@01 (+ $t@292@01 10)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@215@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; _16.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t49 := _16.tuple_1.val_bool
; [exec]
; inhale !__t49
(declare-const $t@304@01 $Snap)
(assert (= $t@304@01 $Snap.unit))
; [eval] !__t49
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t8 := true
; [exec]
; _14 := _16.tuple_0
; [exec]
; label l29
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@305@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_bool, write)
(declare-const $t@306@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@305@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _12.val_bool := _13 < _14.val_int
; [eval] _13 < _14.val_int
(declare-const val_bool@307@01 Bool)
(assert (= val_bool@307@01 (< $t@292@01 val_int@303@01)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@305@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t50 := _12.val_bool
; [eval] !__t50
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not val_bool@307@01))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 14 | !(val_bool@307@01) | dead]
; [else-branch: 14 | val_bool@307@01 | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 14 | val_bool@307@01]
(assert val_bool@307@01)
(pop) ; 9
; [eval] !!__t50
; [eval] !__t50
(push) ; 9
(set-option :timeout 10)
(assert (not (not val_bool@307@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not val_bool@307@01))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 15 | val_bool@307@01 | live]
; [else-branch: 15 | !(val_bool@307@01) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 15 | val_bool@307@01]
(assert val_bool@307@01)
; [exec]
; label loop5_group1_loop7_group2_bb10
; [exec]
; __t9 := true
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@308@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.val_bool, write)
(declare-const $t@309@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@308@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _18.val_bool := false
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@308@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t51 := _18.val_bool
; [exec]
; fold acc(i32(_1), write)
; [exec]
; fold acc(i32(_10), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap $t@292@01) ret@294@01))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@215@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale (unfolding acc(i32(_10), write) in
;     (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
(declare-const $t@310@01 $Snap)
(assert (= $t@310@01 $Snap.unit))
; [eval] (unfolding acc(i32(_10), write) in (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
(set-option :timeout 0)
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@299@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10)
(set-option :timeout 0)
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@215@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@215@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@215@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@215@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@215@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@299@01 ret@215@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@294@01 ret@215@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int < _10.val_int + 10
; [eval] _10.val_int + 10
(pop) ; 11
; Joined path conditions
(pop) ; 10
; Joined path conditions
(assert (< $t@292@01 (+ $t@292@01 10)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@311@01 $Snap)
(assert (= $t@311@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(i32(_1), write) && acc(i32(_10), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; _1 := builtin$havoc_ref()
(declare-const ret@312@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@313@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@314@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@315@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@316@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@317@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@318@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@319@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _24 := builtin$havoc_int()
(declare-const ret@320@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@321@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@322@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@323@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t10 := builtin$havoc_bool()
(declare-const ret@324@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t11 := builtin$havoc_bool()
(declare-const ret@325@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t12 := builtin$havoc_bool()
(declare-const ret@326@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t13 := builtin$havoc_bool()
(declare-const ret@327@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t14 := builtin$havoc_bool()
(declare-const ret@328@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t15 := builtin$havoc_bool()
(declare-const ret@329@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t52 := builtin$havoc_bool()
(declare-const ret@330@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t53 := builtin$havoc_bool()
(declare-const ret@331@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t54 := builtin$havoc_bool()
(declare-const ret@332@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t55 := builtin$havoc_bool()
(declare-const ret@333@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t56 := builtin$havoc_bool()
(declare-const ret@334@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t57 := builtin$havoc_bool()
(declare-const ret@335@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t58 := builtin$havoc_bool()
(declare-const ret@336@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t59 := builtin$havoc_bool()
(declare-const ret@337@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t6 := builtin$havoc_bool()
(declare-const ret@338@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t60 := builtin$havoc_bool()
(declare-const ret@339@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t7 := builtin$havoc_bool()
(declare-const ret@340@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t8 := builtin$havoc_bool()
(declare-const ret@341@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t9 := builtin$havoc_bool()
(declare-const ret@342@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(i32(_1), write) && acc(i32(_10), read$())
(declare-const $t@343@01 $Snap)
(assert (= $t@343@01 ($Snap.combine ($Snap.first $t@343@01) ($Snap.second $t@343@01))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@294@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const $t@344@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
    (= $t@344@01 ($SortWrappers.IntTo$Snap $t@292@01)))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@344@01 ($Snap.second $t@343@01)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@345@01 $Snap)
(assert (= $t@345@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@346@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@299@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@312@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.first $t@343@01) ret@312@01))
; [exec]
; _13 := _1.val_int
(declare-const _13@347@01 Int)
(assert (= _13@347@01 ($SortWrappers.$SnapToInt ($Snap.first $t@343@01))))
; [exec]
; label l32
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@348@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_10), write)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@299@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger $t@344@01 ret@294@01))
; [exec]
; _15 := _10.val_int
(declare-const _15@349@01 Int)
(assert (= _15@349@01 ($SortWrappers.$SnapToInt $t@344@01)))
; [exec]
; label l33
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@350@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0, write)
(declare-const $t@351@01 $Ref)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@350@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@350@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@350@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@350@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@350@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@350@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0.val_int, write)
(declare-const $t@352@01 Int)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@351@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1, write)
(declare-const $t@353@01 $Ref)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@350@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@350@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@350@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@350@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@350@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1.val_bool, write)
(declare-const $t@354@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@353@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.tuple_0.val_int := _15 + 10
; [eval] _15 + 10
(declare-const val_int@355@01 Int)
(assert (= val_int@355@01 (+ _15@349@01 10)))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@351@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; _16.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@353@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t52 := _16.tuple_1.val_bool
; [exec]
; inhale !__t52
(declare-const $t@356@01 $Snap)
(assert (= $t@356@01 $Snap.unit))
; [eval] !__t52
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t8 := true
; [exec]
; _14 := _16.tuple_0
; [exec]
; label l34
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@357@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_bool, write)
(declare-const $t@358@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@357@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _12.val_bool := _13 < _14.val_int
; [eval] _13 < _14.val_int
(declare-const val_bool@359@01 Bool)
(assert (= val_bool@359@01 (< _13@347@01 val_int@355@01)))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t53 := _12.val_bool
; [eval] !__t53
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not val_bool@359@01))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@359@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 16 | !(val_bool@359@01) | live]
; [else-branch: 16 | val_bool@359@01 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 16 | !(val_bool@359@01)]
(assert (not val_bool@359@01))
; [exec]
; label loop5_group1_loop7_group2b_bb10
; [exec]
; label end_of_method
(pop) ; 10
(push) ; 10
; [else-branch: 16 | val_bool@359@01]
(assert val_bool@359@01)
(pop) ; 10
; [eval] !!__t53
; [eval] !__t53
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@359@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not val_bool@359@01))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 17 | val_bool@359@01 | live]
; [else-branch: 17 | !(val_bool@359@01) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 17 | val_bool@359@01]
(assert val_bool@359@01)
; [exec]
; label loop5_group1_loop7_inv_pre
; [exec]
; __t9 := true
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@360@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.val_bool, write)
(declare-const $t@361@01 Bool)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@360@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _18.val_bool := false
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t54 := _18.val_bool
; [exec]
; inhale _1.val_int < _10.val_int + 10
(declare-const $t@362@01 $Snap)
(assert (= $t@362@01 $Snap.unit))
; [eval] _1.val_int < _10.val_int + 10
; [eval] _10.val_int + 10
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.first $t@343@01))
  (+ ($SortWrappers.$SnapToInt $t@344@01) 10)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t10 := true
; [exec]
; __t11 := true
; [exec]
; _24 := builtin$havoc_int()
(declare-const ret@363@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _24 := _1.val_int
(declare-const _24@364@01 Int)
(assert (= _24@364@01 ($SortWrappers.$SnapToInt ($Snap.first $t@343@01))))
; [exec]
; label l37
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@365@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_23.val_bool, write)
(declare-const $t@366@01 Bool)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@365@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _23.val_bool := _24 == 123123
; [eval] _24 == 123123
(declare-const val_bool@367@01 Bool)
(assert (= val_bool@367@01 (= _24@364@01 123123)))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@365@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t55 := _23.val_bool
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not val_bool@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not val_bool@367@01))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 18 | val_bool@367@01 | live]
; [else-branch: 18 | !(val_bool@367@01) | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 18 | val_bool@367@01]
(assert val_bool@367@01)
; [exec]
; label l10
; [exec]
; __t16 := true
; [exec]
; label l12
; [exec]
; __t18 := true
; [exec]
; _34 := builtin$havoc_int()
(declare-const ret@368@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _34 := _1.val_int
(declare-const _34@369@01 Int)
(assert (= _34@369@01 ($SortWrappers.$SnapToInt ($Snap.first $t@343@01))))
; [exec]
; label l49
; [exec]
; _9 := builtin$havoc_ref()
(declare-const ret@370@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_9.val_bool, write)
(declare-const $t@371@01 Bool)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@370@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _9.val_bool := _34 < 55
; [eval] _34 < 55
(declare-const val_bool@372@01 Bool)
(assert (= val_bool@372@01 (< _34@369@01 55)))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t61 := _9.val_bool
; [eval] !__t61
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not val_bool@372@01))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (not val_bool@372@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 19 | !(val_bool@372@01) | live]
; [else-branch: 19 | val_bool@372@01 | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 19 | !(val_bool@372@01)]
(assert (not val_bool@372@01))
; [exec]
; label loop5_inv_post_perm
; [exec]
; label end_of_method
(pop) ; 12
; [eval] !!__t61
; [eval] !__t61
(push) ; 12
(set-option :timeout 10)
(assert (not (not val_bool@372@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 20 | val_bool@372@01 | dead]
; [else-branch: 20 | !(val_bool@372@01) | live]
(set-option :timeout 0)
(push) ; 12
; [else-branch: 20 | !(val_bool@372@01)]
(assert (not val_bool@372@01))
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 18 | !(val_bool@367@01)]
(assert (not val_bool@367@01))
(pop) ; 11
; [eval] !__t55
(push) ; 11
(set-option :timeout 10)
(assert (not val_bool@367@01))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not val_bool@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 21 | !(val_bool@367@01) | live]
; [else-branch: 21 | val_bool@367@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 21 | !(val_bool@367@01)]
(assert (not val_bool@367@01))
; [exec]
; label loop5_group1_loop7_inv_post_perm
; [exec]
; __t12 := true
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@373@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _28 := _1.val_int
(declare-const _28@374@01 Int)
(assert (= _28@374@01 ($SortWrappers.$SnapToInt ($Snap.first $t@343@01))))
; [exec]
; label l40
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@375@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_27.val_bool, write)
(declare-const $t@376@01 Bool)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@375@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27.val_bool := _28 == 234234
; [eval] _28 == 234234
(declare-const val_bool@377@01 Bool)
(assert (= val_bool@377@01 (= _28@374@01 234234)))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@375@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t56 := _27.val_bool
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (not val_bool@377@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not val_bool@377@01))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 22 | val_bool@377@01 | live]
; [else-branch: 22 | !(val_bool@377@01) | live]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 22 | val_bool@377@01]
(assert val_bool@377@01)
; [exec]
; label loop5_group1_loop7_group2a_bb7
; [exec]
; __t13 := true
; [exec]
; label loop5_group1_loop7_group2a_bb8
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@378@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _13 := _1.val_int
(declare-const _13@379@01 Int)
(assert (= _13@379@01 ($SortWrappers.$SnapToInt ($Snap.first $t@343@01))))
; [exec]
; label l44
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@380@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _15 := _10.val_int
(declare-const _15@381@01 Int)
(assert (= _15@381@01 ($SortWrappers.$SnapToInt $t@344@01)))
; [exec]
; label l45
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@382@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0, write)
(declare-const $t@383@01 $Ref)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@382@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@382@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@382@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@382@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@382@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@382@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@382@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0.val_int, write)
(declare-const $t@384@01 Int)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@383@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1, write)
(declare-const $t@385@01 $Ref)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@382@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@382@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@382@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@382@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@382@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@382@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1.val_bool, write)
(declare-const $t@386@01 Bool)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@385@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.tuple_0.val_int := _15 + 10
; [eval] _15 + 10
(declare-const val_int@387@01 Int)
(assert (= val_int@387@01 (+ _15@381@01 10)))
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@383@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [exec]
; _16.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@385@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t58 := _16.tuple_1.val_bool
; [exec]
; inhale !__t58
(declare-const $t@388@01 $Snap)
(assert (= $t@388@01 $Snap.unit))
; [eval] !__t58
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t8 := true
; [exec]
; _14 := _16.tuple_0
; [exec]
; label l46
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@389@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_bool, write)
(declare-const $t@390@01 Bool)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@385@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@389@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _12.val_bool := _13 < _14.val_int
; [eval] _13 < _14.val_int
(declare-const val_bool@391@01 Bool)
(assert (= val_bool@391@01 (< _13@379@01 val_int@387@01)))
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@385@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@389@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t59 := _12.val_bool
; [eval] !__t59
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not val_bool@391@01))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 23 | !(val_bool@391@01) | dead]
; [else-branch: 23 | val_bool@391@01 | live]
(set-option :timeout 0)
(push) ; 13
; [else-branch: 23 | val_bool@391@01]
(assert val_bool@391@01)
(pop) ; 13
; [eval] !!__t59
; [eval] !__t59
(push) ; 13
(set-option :timeout 10)
(assert (not (not val_bool@391@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not val_bool@391@01))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 24 | val_bool@391@01 | live]
; [else-branch: 24 | !(val_bool@391@01) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 24 | val_bool@391@01]
(assert val_bool@391@01)
; [exec]
; label loop5_group1_loop7_group2a_bb9
; [exec]
; __t9 := true
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@392@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.val_bool, write)
(declare-const $t@393@01 Bool)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@385@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@389@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@392@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _18.val_bool := false
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@389@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@385@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t60 := _18.val_bool
; [exec]
; fold acc(i32(_1), write)
; [exec]
; fold acc(i32(_10), write)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale (unfolding acc(i32(_10), write) in
;     (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
(declare-const $t@394@01 $Snap)
(assert (= $t@394@01 $Snap.unit))
; [eval] (unfolding acc(i32(_10), write) in (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
(set-option :timeout 0)
(push) ; 14
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@383@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@351@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@299@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10)
(set-option :timeout 0)
(push) ; 15
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@299@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@351@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@383@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@294@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int < _10.val_int + 10
; [eval] _10.val_int + 10
(pop) ; 15
; Joined path conditions
(pop) ; 14
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@395@01 $Snap)
(assert (= $t@395@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(i32(_1), write) && acc(i32(_10), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(push) ; 14
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(push) ; 14
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale false
(pop) ; 13
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 22 | !(val_bool@377@01)]
(assert (not val_bool@377@01))
(pop) ; 12
; [eval] !__t56
(push) ; 12
(set-option :timeout 10)
(assert (not val_bool@377@01))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (not val_bool@377@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 25 | !(val_bool@377@01) | live]
; [else-branch: 25 | val_bool@377@01 | live]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 25 | !(val_bool@377@01)]
(assert (not val_bool@377@01))
; [exec]
; label loop5_group1_loop7_inv_post_fnspc
; [exec]
; __t14 := true
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@396@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.tuple_0, write)
(declare-const $t@397@01 $Ref)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@396@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.tuple_0.val_int, write)
(declare-const $t@398@01 Int)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@397@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.tuple_1, write)
(declare-const $t@399@01 $Ref)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.tuple_1.val_bool, write)
(declare-const $t@400@01 Bool)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@399@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _30.tuple_0.val_int := _1.val_int + 1
; [eval] _1.val_int + 1
(declare-const val_int@401@01 Int)
(assert (= val_int@401@01 (+ ($SortWrappers.$SnapToInt ($Snap.first $t@343@01)) 1)))
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [exec]
; _30.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@399@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t57 := _30.tuple_1.val_bool
; [exec]
; inhale !__t57
(declare-const $t@402@01 $Snap)
(assert (= $t@402@01 $Snap.unit))
; [eval] !__t57
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t15 := true
; [exec]
; _1 := _30.tuple_0
; [exec]
; label l43
; [exec]
; label loop5_group1_loop7_group2a_bb8
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@403@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _13 := _1.val_int
; [exec]
; label l44
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@404@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _15 := _10.val_int
(declare-const _15@405@01 Int)
(assert (= _15@405@01 ($SortWrappers.$SnapToInt $t@344@01)))
; [exec]
; label l45
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@406@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0, write)
(declare-const $t@407@01 $Ref)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@406@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0.val_int, write)
(declare-const $t@408@01 Int)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@407@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1, write)
(declare-const $t@409@01 $Ref)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1.val_bool, write)
(declare-const $t@410@01 Bool)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@409@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.tuple_0.val_int := _15 + 10
; [eval] _15 + 10
(declare-const val_int@411@01 Int)
(assert (= val_int@411@01 (+ _15@405@01 10)))
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@407@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [exec]
; _16.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t58 := _16.tuple_1.val_bool
; [exec]
; inhale !__t58
(declare-const $t@412@01 $Snap)
(assert (= $t@412@01 $Snap.unit))
; [eval] !__t58
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t8 := true
; [exec]
; _14 := _16.tuple_0
; [exec]
; label l46
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@413@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_bool, write)
(declare-const $t@414@01 Bool)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@413@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _12.val_bool := _13 < _14.val_int
; [eval] _13 < _14.val_int
(declare-const val_bool@415@01 Bool)
(assert (= val_bool@415@01 (< val_int@401@01 val_int@411@01)))
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@413@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t59 := _12.val_bool
; [eval] !__t59
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not val_bool@415@01))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (not val_bool@415@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 26 | !(val_bool@415@01) | live]
; [else-branch: 26 | val_bool@415@01 | live]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 26 | !(val_bool@415@01)]
(assert (not val_bool@415@01))
; [exec]
; label l9
; [exec]
; label loop5_group1_loop7_group3_bb13
; [exec]
; __t17 := true
; [exec]
; label l12
; [exec]
; __t18 := true
; [exec]
; _34 := builtin$havoc_int()
(declare-const ret@416@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _34 := _1.val_int
; [exec]
; label l49
; [exec]
; _9 := builtin$havoc_ref()
(declare-const ret@417@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_9.val_bool, write)
(declare-const $t@418@01 Bool)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@417@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _9.val_bool := _34 < 55
; [eval] _34 < 55
(declare-const val_bool@419@01 Bool)
(assert (= val_bool@419@01 (< val_int@401@01 55)))
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@417@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t61 := _9.val_bool
; [eval] !__t61
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not val_bool@419@01))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (not val_bool@419@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 27 | !(val_bool@419@01) | live]
; [else-branch: 27 | val_bool@419@01 | live]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 27 | !(val_bool@419@01)]
(assert (not val_bool@419@01))
; [exec]
; label loop5_inv_post_perm
; [exec]
; label end_of_method
(pop) ; 14
(push) ; 14
; [else-branch: 27 | val_bool@419@01]
(assert val_bool@419@01)
(pop) ; 14
; [eval] !!__t61
; [eval] !__t61
(push) ; 14
(set-option :timeout 10)
(assert (not (not val_bool@419@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not val_bool@419@01))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 28 | val_bool@419@01 | live]
; [else-branch: 28 | !(val_bool@419@01) | live]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 28 | val_bool@419@01]
(assert val_bool@419@01)
; [exec]
; label l13
; [exec]
; __t19 := true
; [exec]
; _36 := builtin$havoc_ref()
(declare-const ret@420@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_36.val_bool, write)
(declare-const $t@421@01 Bool)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@420@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _36.val_bool := false
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t62 := _36.val_bool
; [exec]
; inhale (_1.val_int >= 0 || _1.val_int % 10 == 0 ?
;     _1.val_int % 10 :
;     _1.val_int % 10 - 10) ==
;   0 &&
;   _1.val_int < 55
(declare-const $t@422@01 $Snap)
(assert (= $t@422@01 ($Snap.combine ($Snap.first $t@422@01) ($Snap.second $t@422@01))))
(assert (= ($Snap.first $t@422@01) $Snap.unit))
; [eval] (_1.val_int >= 0 || _1.val_int % 10 == 0 ? _1.val_int % 10 : _1.val_int % 10 - 10) == 0
; [eval] (_1.val_int >= 0 || _1.val_int % 10 == 0 ? _1.val_int % 10 : _1.val_int % 10 - 10)
; [eval] _1.val_int >= 0 || _1.val_int % 10 == 0
; [eval] _1.val_int >= 0
(set-option :timeout 0)
(push) ; 15
; [then-branch: 29 | val_int@401@01 >= 0 | live]
; [else-branch: 29 | !(val_int@401@01 >= 0) | live]
(push) ; 16
; [then-branch: 29 | val_int@401@01 >= 0]
(assert (>= val_int@401@01 0))
(pop) ; 16
(push) ; 16
; [else-branch: 29 | !(val_int@401@01 >= 0)]
(assert (not (>= val_int@401@01 0)))
; [eval] _1.val_int % 10 == 0
; [eval] _1.val_int % 10
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (or (not (>= val_int@401@01 0)) (>= val_int@401@01 0)))
(push) ; 15
(push) ; 16
(set-option :timeout 10)
(assert (not (not (or (>= val_int@401@01 0) (= (mod val_int@401@01 10) 0)))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (or (>= val_int@401@01 0) (= (mod val_int@401@01 10) 0))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 30 | val_int@401@01 >= 0 || val_int@401@01 % 10 == 0 | live]
; [else-branch: 30 | !(val_int@401@01 >= 0 || val_int@401@01 % 10 == 0) | live]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 30 | val_int@401@01 >= 0 || val_int@401@01 % 10 == 0]
(assert (or (>= val_int@401@01 0) (= (mod val_int@401@01 10) 0)))
; [eval] _1.val_int % 10
(pop) ; 16
(push) ; 16
; [else-branch: 30 | !(val_int@401@01 >= 0 || val_int@401@01 % 10 == 0)]
(assert (not (or (>= val_int@401@01 0) (= (mod val_int@401@01 10) 0))))
; [eval] _1.val_int % 10 - 10
; [eval] _1.val_int % 10
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (or
  (not (or (>= val_int@401@01 0) (= (mod val_int@401@01 10) 0)))
  (or (>= val_int@401@01 0) (= (mod val_int@401@01 10) 0))))
(assert (=
  (ite
    (or (>= val_int@401@01 0) (= (mod val_int@401@01 10) 0))
    (mod val_int@401@01 10)
    (- (mod val_int@401@01 10) 10))
  0))
(assert (= ($Snap.second $t@422@01) $Snap.unit))
; [eval] _1.val_int < 55
(assert (< val_int@401@01 55))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t20 := true
; [exec]
; __t21 := true
; [exec]
; _39 := builtin$havoc_ref()
(declare-const ret@423@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_39.tuple_0, write)
(declare-const $t@424@01 $Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@423@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_39.tuple_0.val_int, write)
(declare-const $t@425@01 Int)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@424@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_39.tuple_1, write)
(declare-const $t@426@01 $Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@423@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_39.tuple_1.val_bool, write)
(declare-const $t@427@01 Bool)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@420@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@417@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@413@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@409@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@426@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _39.tuple_0.val_int := _1.val_int + 1
; [eval] _1.val_int + 1
(declare-const val_int@428@01 Int)
(assert (= val_int@428@01 (+ val_int@401@01 1)))
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@424@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; _39.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@420@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@417@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@413@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@409@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@426@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t63 := _39.tuple_1.val_bool
; [exec]
; assert !__t63
; [eval] !__t63
; [exec]
; __t22 := true
; [exec]
; _1 := _39.tuple_0
; [exec]
; label l52
; [exec]
; _42 := builtin$havoc_int()
(declare-const ret@429@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _42 := _1.val_int
; [exec]
; label l53
; [exec]
; _41 := builtin$havoc_ref()
(declare-const ret@430@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_41.val_bool, write)
(declare-const $t@431@01 Bool)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@430@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _41.val_bool := _42 == 456456
; [eval] _42 == 456456
(declare-const val_bool@432@01 Bool)
(assert (= val_bool@432@01 (= val_int@428@01 456456)))
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@430@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t64 := _41.val_bool
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not val_bool@432@01)))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 31 | val_bool@432@01 | dead]
; [else-branch: 31 | !(val_bool@432@01) | live]
(set-option :timeout 0)
(push) ; 15
; [else-branch: 31 | !(val_bool@432@01)]
(assert (not val_bool@432@01))
(pop) ; 15
; [eval] !__t64
(push) ; 15
(set-option :timeout 10)
(assert (not val_bool@432@01))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not val_bool@432@01)))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 32 | !(val_bool@432@01) | live]
; [else-branch: 32 | val_bool@432@01 | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 32 | !(val_bool@432@01)]
(assert (not val_bool@432@01))
; [exec]
; label loop5_group1_loop7_group3_bb15
; [exec]
; __t23 := true
; [exec]
; _46 := builtin$havoc_int()
(declare-const ret@433@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _46 := _1.val_int
; [exec]
; label l56
; [exec]
; _45 := builtin$havoc_ref()
(declare-const ret@434@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_45.val_bool, write)
(declare-const $t@435@01 Bool)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@434@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _45.val_bool := _46 == 567567
; [eval] _46 == 567567
(declare-const val_bool@436@01 Bool)
(assert (= val_bool@436@01 (= val_int@428@01 567567)))
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@434@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t65 := _45.val_bool
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (not val_bool@436@01)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 33 | val_bool@436@01 | dead]
; [else-branch: 33 | !(val_bool@436@01) | live]
(set-option :timeout 0)
(push) ; 16
; [else-branch: 33 | !(val_bool@436@01)]
(assert (not val_bool@436@01))
(pop) ; 16
; [eval] !__t65
(push) ; 16
(set-option :timeout 10)
(assert (not val_bool@436@01))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (not val_bool@436@01)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 34 | !(val_bool@436@01) | live]
; [else-branch: 34 | val_bool@436@01 | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 34 | !(val_bool@436@01)]
(assert (not val_bool@436@01))
; [exec]
; label l15
; [exec]
; __t25 := true
; [exec]
; _48 := builtin$havoc_ref()
(declare-const ret@437@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_48.tuple_0, write)
(declare-const $t@438@01 $Ref)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@423@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@437@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_48.tuple_0.val_int, write)
(declare-const $t@439@01 Int)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@424@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@438@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_48.tuple_1, write)
(declare-const $t@440@01 $Ref)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@423@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@437@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_48.tuple_1.val_bool, write)
(declare-const $t@441@01 Bool)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@434@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@430@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@426@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@420@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@417@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@413@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@409@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@440@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _48.tuple_0.val_int := _1.val_int - 1
; [eval] _1.val_int - 1
(declare-const val_int@442@01 Int)
(assert (= val_int@442@01 (- val_int@428@01 1)))
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@424@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [exec]
; _48.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@434@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@430@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@426@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@420@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@417@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@413@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@409@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@440@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t66 := _48.tuple_1.val_bool
; [exec]
; assert !__t66
; [eval] !__t66
; [exec]
; __t26 := true
; [exec]
; _1 := _48.tuple_0
; [exec]
; label l59
; [exec]
; label loop5_group1_loop7_group3_bb16
; [exec]
; __t4 := true
; [exec]
; __t5 := true
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@443@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_10.val_int, write)
(declare-const $t@444@01 Int)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@438@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@424@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@407@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@397@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@351@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@299@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@294@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@443@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _10.val_int := _1.val_int
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@294@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@299@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@351@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@397@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@407@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@424@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@438@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l60
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@445@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _13 := _1.val_int
; [exec]
; label l61
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@446@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _15 := _10.val_int
; [exec]
; label l62
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@447@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0, write)
(declare-const $t@448@01 $Ref)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@437@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@423@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@447@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0.val_int, write)
(declare-const $t@449@01 Int)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@443@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@424@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@438@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@448@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1, write)
(declare-const $t@450@01 $Ref)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@437@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@423@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@447@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1.val_bool, write)
(declare-const $t@451@01 Bool)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@440@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@434@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@430@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@426@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@420@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@417@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@413@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@409@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@450@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.tuple_0.val_int := _15 + 10
; [eval] _15 + 10
(declare-const val_int@452@01 Int)
(assert (= val_int@452@01 (+ val_int@442@01 10)))
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@438@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@424@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@443@01 $t@448@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [exec]
; _16.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@440@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@434@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@430@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@426@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@420@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@417@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@413@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@409@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@450@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t67 := _16.tuple_1.val_bool
; [exec]
; assert !__t67
; [eval] !__t67
; [exec]
; __t8 := true
; [exec]
; _14 := _16.tuple_0
; [exec]
; label l63
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@453@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_bool, write)
(declare-const $t@454@01 Bool)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@453@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _12.val_bool := _13 < _14.val_int
; [eval] _13 < _14.val_int
(declare-const val_bool@455@01 Bool)
(assert (= val_bool@455@01 (< val_int@442@01 val_int@452@01)))
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@453@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t68 := _12.val_bool
; [eval] !__t68
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not val_bool@455@01))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [then-branch: 35 | !(val_bool@455@01) | dead]
; [else-branch: 35 | val_bool@455@01 | live]
(set-option :timeout 0)
(push) ; 17
; [else-branch: 35 | val_bool@455@01]
(assert val_bool@455@01)
(pop) ; 17
; [eval] !!__t68
; [eval] !__t68
(push) ; 17
(set-option :timeout 10)
(assert (not (not val_bool@455@01)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not val_bool@455@01))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [then-branch: 36 | val_bool@455@01 | live]
; [else-branch: 36 | !(val_bool@455@01) | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 36 | val_bool@455@01]
(assert val_bool@455@01)
; [exec]
; label loop5_group1_loop7_group3_bb17
; [exec]
; __t9 := true
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@456@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.val_bool, write)
(declare-const $t@457@01 Bool)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@456@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _18.val_bool := false
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@456@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t69 := _18.val_bool
; [exec]
; fold acc(i32(_1), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@442@01) $t@438@01))
; [exec]
; fold acc(i32(_10), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@442@01) ret@443@01))
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@438@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_10), write) in
;     (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
; [eval] (unfolding acc(i32(_10), write) in (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
(set-option :timeout 0)
(push) ; 18
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@448@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@424@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@407@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@397@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@351@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@299@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@294@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10)
(set-option :timeout 0)
(push) ; 19
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@424@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@448@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@443@01 $t@438@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int < _10.val_int + 10
; [eval] _10.val_int + 10
(pop) ; 19
; Joined path conditions
(pop) ; 18
; Joined path conditions
(set-option :timeout 0)
(push) ; 18
(assert (not (< val_int@442@01 (+ val_int@442@01 10))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (< val_int@442@01 (+ val_int@442@01 10)))
; [exec]
; assert true
; [exec]
; exhale acc(i32(_1), write) && acc(i32(_10), read$())
; [eval] read$()
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; [exec]
; _1 := builtin$havoc_ref()
(declare-const ret@458@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@459@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@460@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@461@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@462@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@463@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@464@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@465@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _24 := builtin$havoc_int()
(declare-const ret@466@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@467@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@468@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@469@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t10 := builtin$havoc_bool()
(declare-const ret@470@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t11 := builtin$havoc_bool()
(declare-const ret@471@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t12 := builtin$havoc_bool()
(declare-const ret@472@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t13 := builtin$havoc_bool()
(declare-const ret@473@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t14 := builtin$havoc_bool()
(declare-const ret@474@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t15 := builtin$havoc_bool()
(declare-const ret@475@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t6 := builtin$havoc_bool()
(declare-const ret@476@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t7 := builtin$havoc_bool()
(declare-const ret@477@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t70 := builtin$havoc_bool()
(declare-const ret@478@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t71 := builtin$havoc_bool()
(declare-const ret@479@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t72 := builtin$havoc_bool()
(declare-const ret@480@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t73 := builtin$havoc_bool()
(declare-const ret@481@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t74 := builtin$havoc_bool()
(declare-const ret@482@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t75 := builtin$havoc_bool()
(declare-const ret@483@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t76 := builtin$havoc_bool()
(declare-const ret@484@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t77 := builtin$havoc_bool()
(declare-const ret@485@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t78 := builtin$havoc_bool()
(declare-const ret@486@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t8 := builtin$havoc_bool()
(declare-const ret@487@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t9 := builtin$havoc_bool()
(declare-const ret@488@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(i32(_1), write) && acc(i32(_10), read$())
(declare-const $t@489@01 $Snap)
(assert (= $t@489@01 ($Snap.combine ($Snap.first $t@489@01) ($Snap.second $t@489@01))))
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@443@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(declare-const $t@490@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
    (= $t@490@01 ($SortWrappers.IntTo$Snap val_int@442@01)))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@490@01 ($Snap.second $t@489@01)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@491@01 $Snap)
(assert (= $t@491@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@492@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@448@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@424@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@407@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@397@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@351@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@299@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@294@01 ret@458@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@458@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.first $t@489@01) ret@458@01))
; [exec]
; _13 := _1.val_int
(declare-const _13@493@01 Int)
(assert (= _13@493@01 ($SortWrappers.$SnapToInt ($Snap.first $t@489@01))))
; [exec]
; label l66
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@494@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_10), write)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@294@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@299@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@351@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@397@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@407@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@424@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@448@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@458@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger $t@490@01 ret@443@01))
; [exec]
; _15 := _10.val_int
(declare-const _15@495@01 Int)
(assert (= _15@495@01 ($SortWrappers.$SnapToInt $t@490@01)))
; [exec]
; label l67
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@496@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0, write)
(declare-const $t@497@01 $Ref)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@447@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@437@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@423@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@496@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0.val_int, write)
(declare-const $t@498@01 Int)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@443@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@424@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@448@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@458@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@497@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1, write)
(declare-const $t@499@01 $Ref)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@447@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@437@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@423@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@496@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1.val_bool, write)
(declare-const $t@500@01 Bool)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@456@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@453@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@450@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@440@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@434@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@430@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@426@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@420@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@417@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@413@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@409@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@499@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.tuple_0.val_int := _15 + 10
; [eval] _15 + 10
(declare-const val_int@501@01 Int)
(assert (= val_int@501@01 (+ _15@495@01 10)))
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@458@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@448@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@424@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@443@01 $t@497@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; [exec]
; _16.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@456@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@453@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@450@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@440@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@434@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@430@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@426@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@420@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@417@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@413@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@409@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@499@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t70 := _16.tuple_1.val_bool
; [exec]
; inhale !__t70
(declare-const $t@502@01 $Snap)
(assert (= $t@502@01 $Snap.unit))
; [eval] !__t70
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t8 := true
; [exec]
; _14 := _16.tuple_0
; [exec]
; label l68
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@503@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_bool, write)
(declare-const $t@504@01 Bool)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@503@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _12.val_bool := _13 < _14.val_int
; [eval] _13 < _14.val_int
(declare-const val_bool@505@01 Bool)
(assert (= val_bool@505@01 (< _13@493@01 val_int@501@01)))
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@503@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t71 := _12.val_bool
; [eval] !__t71
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not val_bool@505@01))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (not val_bool@505@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; [then-branch: 37 | !(val_bool@505@01) | live]
; [else-branch: 37 | val_bool@505@01 | live]
(set-option :timeout 0)
(push) ; 18
; [then-branch: 37 | !(val_bool@505@01)]
(assert (not val_bool@505@01))
; [exec]
; label loop5_group1_bb14
; [exec]
; label end_of_method
(pop) ; 18
(push) ; 18
; [else-branch: 37 | val_bool@505@01]
(assert val_bool@505@01)
(pop) ; 18
; [eval] !!__t71
; [eval] !__t71
(push) ; 18
(set-option :timeout 10)
(assert (not (not val_bool@505@01)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not val_bool@505@01))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; [then-branch: 38 | val_bool@505@01 | live]
; [else-branch: 38 | !(val_bool@505@01) | live]
(set-option :timeout 0)
(push) ; 18
; [then-branch: 38 | val_bool@505@01]
(assert val_bool@505@01)
; [exec]
; label loop5_group1_loop7_group3_bb18
; [exec]
; __t9 := true
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@506@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.val_bool, write)
(declare-const $t@507@01 Bool)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@506@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _18.val_bool := false
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@506@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t72 := _18.val_bool
; [exec]
; inhale _1.val_int < _10.val_int + 10
(declare-const $t@508@01 $Snap)
(assert (= $t@508@01 $Snap.unit))
; [eval] _1.val_int < _10.val_int + 10
; [eval] _10.val_int + 10
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.first $t@489@01))
  (+ ($SortWrappers.$SnapToInt $t@490@01) 10)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t10 := true
; [exec]
; __t11 := true
; [exec]
; _24 := builtin$havoc_int()
(declare-const ret@509@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _24 := _1.val_int
(declare-const _24@510@01 Int)
(assert (= _24@510@01 ($SortWrappers.$SnapToInt ($Snap.first $t@489@01))))
; [exec]
; label l71
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@511@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_23.val_bool, write)
(declare-const $t@512@01 Bool)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@511@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _23.val_bool := _24 == 123123
; [eval] _24 == 123123
(declare-const val_bool@513@01 Bool)
(assert (= val_bool@513@01 (= _24@510@01 123123)))
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@511@01)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t73 := _23.val_bool
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (not val_bool@513@01)))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [then-branch: 39 | val_bool@513@01 | dead]
; [else-branch: 39 | !(val_bool@513@01) | live]
(set-option :timeout 0)
(push) ; 19
; [else-branch: 39 | !(val_bool@513@01)]
(assert (not val_bool@513@01))
(pop) ; 19
; [eval] !__t73
(push) ; 19
(set-option :timeout 10)
(assert (not val_bool@513@01))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (not val_bool@513@01)))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [then-branch: 40 | !(val_bool@513@01) | live]
; [else-branch: 40 | val_bool@513@01 | dead]
(set-option :timeout 0)
(push) ; 19
; [then-branch: 40 | !(val_bool@513@01)]
(assert (not val_bool@513@01))
; [exec]
; label loop5_group1_loop7_group4_bb7
; [exec]
; __t12 := true
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@514@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _28 := _1.val_int
(declare-const _28@515@01 Int)
(assert (= _28@515@01 ($SortWrappers.$SnapToInt ($Snap.first $t@489@01))))
; [exec]
; label l74
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@516@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_27.val_bool, write)
(declare-const $t@517@01 Bool)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@516@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27.val_bool := _28 == 234234
; [eval] _28 == 234234
(declare-const val_bool@518@01 Bool)
(assert (= val_bool@518@01 (= _28@515@01 234234)))
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@516@01)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t74 := _27.val_bool
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (not val_bool@518@01)))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
; [then-branch: 41 | val_bool@518@01 | dead]
; [else-branch: 41 | !(val_bool@518@01) | live]
(set-option :timeout 0)
(push) ; 20
; [else-branch: 41 | !(val_bool@518@01)]
(assert (not val_bool@518@01))
(pop) ; 20
; [eval] !__t74
(push) ; 20
(set-option :timeout 10)
(assert (not val_bool@518@01))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(set-option :timeout 10)
(assert (not (not val_bool@518@01)))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
; [then-branch: 42 | !(val_bool@518@01) | live]
; [else-branch: 42 | val_bool@518@01 | dead]
(set-option :timeout 0)
(push) ; 20
; [then-branch: 42 | !(val_bool@518@01)]
(assert (not val_bool@518@01))
; [exec]
; label loop5_group1_loop7_group4_bb8
; [exec]
; __t14 := true
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@519@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.tuple_0, write)
(declare-const $t@520@01 $Ref)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@496@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@447@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@437@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@423@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@519@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.tuple_0.val_int, write)
(declare-const $t@521@01 Int)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@443@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@424@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@448@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@458@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@497@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@520@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.tuple_1, write)
(declare-const $t@522@01 $Ref)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@496@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@447@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@437@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@423@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@519@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.tuple_1.val_bool, write)
(declare-const $t@523@01 Bool)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@516@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@511@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@506@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@503@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@499@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@456@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@453@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@450@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@440@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@434@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@430@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@426@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@420@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@417@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@413@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@409@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@522@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _30.tuple_0.val_int := _1.val_int + 1
; [eval] _1.val_int + 1
(declare-const val_int@524@01 Int)
(assert (= val_int@524@01 (+ ($SortWrappers.$SnapToInt ($Snap.first $t@489@01)) 1)))
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@497@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@458@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@448@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@424@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@443@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
; [exec]
; _30.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@516@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@511@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@506@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@503@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@499@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@456@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@453@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@450@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@440@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@434@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@430@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@426@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@420@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@417@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@413@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@409@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@522@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t75 := _30.tuple_1.val_bool
; [exec]
; assert !__t75
; [eval] !__t75
; [exec]
; __t15 := true
; [exec]
; _1 := _30.tuple_0
; [exec]
; label l77
; [exec]
; label l21
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _13 := builtin$havoc_int()
(declare-const ret@525@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _13 := _1.val_int
; [exec]
; label l78
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@526@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _15 := _10.val_int
(declare-const _15@527@01 Int)
(assert (= _15@527@01 ($SortWrappers.$SnapToInt $t@490@01)))
; [exec]
; label l79
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@528@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0, write)
(declare-const $t@529@01 $Ref)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@519@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@496@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@447@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@437@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@423@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@528@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0.val_int, write)
(declare-const $t@530@01 Int)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@443@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@424@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@448@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@458@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@497@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@520@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@529@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1, write)
(declare-const $t@531@01 $Ref)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@519@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@496@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@447@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@437@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@423@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@396@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@350@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@298@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@191@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@200@01 ret@528@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1.val_bool, write)
(declare-const $t@532@01 Bool)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@522@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@516@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@511@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@506@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@503@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@499@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@456@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@453@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@450@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@440@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@434@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@430@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@426@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@420@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@417@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@413@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@409@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@531@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.tuple_0.val_int := _15 + 10
; [eval] _15 + 10
(declare-const val_int@533@01 Int)
(assert (= val_int@533@01 (+ _15@527@01 10)))
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@520@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@497@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@458@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@448@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@424@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@443@01 $t@529@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
; [exec]
; _16.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@522@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@516@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@511@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@506@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@503@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@499@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@456@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@453@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@450@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@440@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@434@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@430@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@426@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@420@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@417@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@413@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@409@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@399@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@375@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@365@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@357@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@353@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@308@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@305@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@301@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@115@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@124@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@126@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@128@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@178@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@183@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@194@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@203@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@206@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@210@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@213@01 $t@531@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t76 := _16.tuple_1.val_bool
; [exec]
; assert !__t76
; [eval] !__t76
; [exec]
; __t8 := true
; [exec]
; _14 := _16.tuple_0
; [exec]
; label l80
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@534@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_bool, write)
(declare-const $t@535@01 Bool)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@534@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _12.val_bool := _13 < _14.val_int
; [eval] _13 < _14.val_int
(declare-const val_bool@536@01 Bool)
(assert (= val_bool@536@01 (< val_int@524@01 val_int@533@01)))
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@534@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t77 := _12.val_bool
; [eval] !__t77
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not val_bool@536@01))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (not val_bool@536@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
; [then-branch: 43 | !(val_bool@536@01) | live]
; [else-branch: 43 | val_bool@536@01 | live]
(set-option :timeout 0)
(push) ; 21
; [then-branch: 43 | !(val_bool@536@01)]
(assert (not val_bool@536@01))
; [exec]
; label loop5_group1_loop7_group5_bb10
; [exec]
; label loop5_group1_bb20
; [exec]
; __t17 := true
; [exec]
; label l24
; [exec]
; __t18 := true
; [exec]
; _34 := builtin$havoc_int()
(declare-const ret@537@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _34 := _1.val_int
; [exec]
; label l83
; [exec]
; _9 := builtin$havoc_ref()
(declare-const ret@538@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_9.val_bool, write)
(declare-const $t@539@01 Bool)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@534@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@538@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _9.val_bool := _34 < 55
; [eval] _34 < 55
(declare-const val_bool@540@01 Bool)
(assert (= val_bool@540@01 (< val_int@524@01 55)))
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@534@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@538@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t79 := _9.val_bool
; [eval] !__t79
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not val_bool@540@01))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (not val_bool@540@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
; [then-branch: 44 | !(val_bool@540@01) | live]
; [else-branch: 44 | val_bool@540@01 | live]
(set-option :timeout 0)
(push) ; 22
; [then-branch: 44 | !(val_bool@540@01)]
(assert (not val_bool@540@01))
; [exec]
; label loop5_group2_bb21
; [exec]
; label loop5_group2a_bb5
; [exec]
; __t28 := true
; [exec]
; label loop5_group2a_bb6
; [exec]
; __t29 := true
; [exec]
; _53 := builtin$havoc_int()
(declare-const ret@541@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _53 := _1.val_int
; [exec]
; label l86
; [exec]
; _52 := builtin$havoc_ref()
(declare-const ret@542@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_52.val_bool, write)
(declare-const $t@543@01 Bool)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@534@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@538@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@542@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _52.val_bool := _53 > 55
; [eval] _53 > 55
(declare-const val_bool@544@01 Bool)
(assert (= val_bool@544@01 (> val_int@524@01 55)))
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@538@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@534@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@542@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t81 := _52.val_bool
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (not val_bool@544@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not val_bool@544@01))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
; [then-branch: 45 | val_bool@544@01 | live]
; [else-branch: 45 | !(val_bool@544@01) | dead]
(set-option :timeout 0)
(push) ; 23
; [then-branch: 45 | val_bool@544@01]
(assert val_bool@544@01)
; [exec]
; label loop5_group2a_loop7_group1_bb7
; [exec]
; __t30 := true
; [exec]
; _60 := builtin$havoc_int()
(declare-const ret@545@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _60 := _1.val_int
; [exec]
; label l89
; [exec]
; _59 := builtin$havoc_ref()
(declare-const ret@546@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_59.val_bool, write)
(declare-const $t@547@01 Bool)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@534@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@538@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@542@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@546@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _59.val_bool := _60 == 60
; [eval] _60 == 60
(declare-const val_bool@548@01 Bool)
(assert (= val_bool@548@01 (= val_int@524@01 60)))
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@542@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@538@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@534@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@546@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
; [exec]
; _58 := builtin$havoc_ref()
(declare-const ret@549@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_58.val_bool, write)
(declare-const $t@550@01 Bool)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@534@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@538@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@542@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@546@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@549@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _58.val_bool := !_59.val_bool
; [eval] !_59.val_bool
(declare-const val_bool@551@01 Bool)
(assert (= val_bool@551@01 (not val_bool@548@01)))
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@546@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@542@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@538@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@534@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@549@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t82 := _58.val_bool
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (not val_bool@551@01)))
(check-sat)
; unsat
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
; [then-branch: 46 | val_bool@551@01 | dead]
; [else-branch: 46 | !(val_bool@551@01) | live]
(set-option :timeout 0)
(push) ; 24
; [else-branch: 46 | !(val_bool@551@01)]
(assert (not val_bool@551@01))
(pop) ; 24
; [eval] !__t82
(push) ; 24
(set-option :timeout 10)
(assert (not val_bool@551@01))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (not val_bool@551@01)))
(check-sat)
; unsat
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
; [then-branch: 47 | !(val_bool@551@01) | live]
; [else-branch: 47 | val_bool@551@01 | dead]
(set-option :timeout 0)
(push) ; 24
; [then-branch: 47 | !(val_bool@551@01)]
(assert (not val_bool@551@01))
; [exec]
; label loop5_group2a_loop7_group1_bb8
; [exec]
; __t32 := true
; [exec]
; label l93
; [exec]
; fold acc(tuple0$(_0), write)
(assert (tuple0$%trigger $Snap.unit _0@1@01))
; [exec]
; assert true
; [exec]
; exhale acc(tuple0$(_0), write)
; [exec]
; label end_of_method
(pop) ; 24
(pop) ; 23
; [eval] !__t81
(push) ; 23
(set-option :timeout 10)
(assert (not val_bool@544@01))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
; [then-branch: 48 | !(val_bool@544@01) | dead]
; [else-branch: 48 | val_bool@544@01 | live]
(set-option :timeout 0)
(push) ; 23
; [else-branch: 48 | val_bool@544@01]
(assert val_bool@544@01)
(pop) ; 23
(pop) ; 22
(push) ; 22
; [else-branch: 44 | val_bool@540@01]
(assert val_bool@540@01)
(pop) ; 22
; [eval] !!__t79
; [eval] !__t79
(push) ; 22
(set-option :timeout 10)
(assert (not (not val_bool@540@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not val_bool@540@01))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
; [then-branch: 49 | val_bool@540@01 | live]
; [else-branch: 49 | !(val_bool@540@01) | live]
(set-option :timeout 0)
(push) ; 22
; [then-branch: 49 | val_bool@540@01]
(assert val_bool@540@01)
; [exec]
; label l25
; [exec]
; __t19 := true
; [exec]
; _36 := builtin$havoc_ref()
(declare-const ret@552@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_36.val_bool, write)
(declare-const $t@553@01 Bool)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@534@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@538@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@552@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _36.val_bool := false
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@538@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@534@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@552@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t80 := _36.val_bool
; [exec]
; fold acc(i32(_1), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@524@01) $t@520@01))
; [exec]
; assert (unfolding acc(i32(_1), write) in
;     (_1.val_int >= 0 || _1.val_int % 10 == 0 ?
;       _1.val_int % 10 :
;       _1.val_int % 10 - 10) ==
;     0 &&
;     _1.val_int < 55)
; [eval] (unfolding acc(i32(_1), write) in (_1.val_int >= 0 || _1.val_int % 10 == 0 ? _1.val_int % 10 : _1.val_int % 10 - 10) == 0 && _1.val_int < 55)
(set-option :timeout 0)
(push) ; 23
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@443@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@424@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@448@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@458@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@497@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@529@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
; [eval] (_1.val_int >= 0 || _1.val_int % 10 == 0 ? _1.val_int % 10 : _1.val_int % 10 - 10) == 0 && _1.val_int < 55
; [eval] (_1.val_int >= 0 || _1.val_int % 10 == 0 ? _1.val_int % 10 : _1.val_int % 10 - 10) == 0
; [eval] (_1.val_int >= 0 || _1.val_int % 10 == 0 ? _1.val_int % 10 : _1.val_int % 10 - 10)
; [eval] _1.val_int >= 0 || _1.val_int % 10 == 0
; [eval] _1.val_int >= 0
(set-option :timeout 0)
(push) ; 24
; [then-branch: 50 | val_int@524@01 >= 0 | live]
; [else-branch: 50 | !(val_int@524@01 >= 0) | live]
(push) ; 25
; [then-branch: 50 | val_int@524@01 >= 0]
(assert (>= val_int@524@01 0))
(pop) ; 25
(push) ; 25
; [else-branch: 50 | !(val_int@524@01 >= 0)]
(assert (not (>= val_int@524@01 0)))
; [eval] _1.val_int % 10 == 0
; [eval] _1.val_int % 10
(pop) ; 25
(pop) ; 24
; Joined path conditions
; Joined path conditions
(assert (or (not (>= val_int@524@01 0)) (>= val_int@524@01 0)))
(push) ; 24
(push) ; 25
(set-option :timeout 10)
(assert (not (not (or (>= val_int@524@01 0) (= (mod val_int@524@01 10) 0)))))
(check-sat)
; unknown
(pop) ; 25
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 25
(set-option :timeout 10)
(assert (not (or (>= val_int@524@01 0) (= (mod val_int@524@01 10) 0))))
(check-sat)
; unsat
(pop) ; 25
; 0.00s
; (get-info :all-statistics)
; [then-branch: 51 | val_int@524@01 >= 0 || val_int@524@01 % 10 == 0 | live]
; [else-branch: 51 | !(val_int@524@01 >= 0 || val_int@524@01 % 10 == 0) | dead]
(set-option :timeout 0)
(push) ; 25
; [then-branch: 51 | val_int@524@01 >= 0 || val_int@524@01 % 10 == 0]
(assert (or (>= val_int@524@01 0) (= (mod val_int@524@01 10) 0)))
; [eval] _1.val_int % 10
(pop) ; 25
(pop) ; 24
; Joined path conditions
(assert (or (>= val_int@524@01 0) (= (mod val_int@524@01 10) 0)))
(push) ; 24
; [then-branch: 52 | val_int@524@01 % 10 == 0 | live]
; [else-branch: 52 | val_int@524@01 % 10 != 0 | live]
(push) ; 25
; [then-branch: 52 | val_int@524@01 % 10 == 0]
(assert (= (mod val_int@524@01 10) 0))
; [eval] _1.val_int < 55
(pop) ; 25
(push) ; 25
; [else-branch: 52 | val_int@524@01 % 10 != 0]
(assert (not (= (mod val_int@524@01 10) 0)))
(pop) ; 25
(pop) ; 24
; Joined path conditions
; Joined path conditions
(assert (or (not (= (mod val_int@524@01 10) 0)) (= (mod val_int@524@01 10) 0)))
(pop) ; 23
; Joined path conditions
(assert (and
  (or (not (>= val_int@524@01 0)) (>= val_int@524@01 0))
  (or (>= val_int@524@01 0) (= (mod val_int@524@01 10) 0))
  (or (not (= (mod val_int@524@01 10) 0)) (= (mod val_int@524@01 10) 0))))
(push) ; 23
(assert (not (and (< val_int@524@01 55) (= (mod val_int@524@01 10) 0))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(assert (and (< val_int@524@01 55) (= (mod val_int@524@01 10) 0)))
; [exec]
; assert true
; [exec]
; exhale acc(i32(_1), write)
; [exec]
; inhale false
(pop) ; 22
(push) ; 22
; [else-branch: 49 | !(val_bool@540@01)]
(assert (not val_bool@540@01))
(pop) ; 22
(pop) ; 21
(push) ; 21
; [else-branch: 43 | val_bool@536@01]
(assert val_bool@536@01)
(pop) ; 21
; [eval] !!__t77
; [eval] !__t77
(push) ; 21
(set-option :timeout 10)
(assert (not (not val_bool@536@01)))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not val_bool@536@01))
(check-sat)
; unknown
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
; [then-branch: 53 | val_bool@536@01 | live]
; [else-branch: 53 | !(val_bool@536@01) | live]
(set-option :timeout 0)
(push) ; 21
; [then-branch: 53 | val_bool@536@01]
(assert val_bool@536@01)
; [exec]
; label l22
; [exec]
; __t9 := true
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@554@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.val_bool, write)
(declare-const $t@555@01 Bool)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@534@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@554@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _18.val_bool := false
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@534@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@531@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@522@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@516@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@511@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@506@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@503@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@499@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@456@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@453@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@450@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@440@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@434@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@430@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@426@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@420@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@417@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@554@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t78 := _18.val_bool
; [exec]
; fold acc(i32(_1), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@524@01) $t@520@01))
; [exec]
; fold acc(i32(_10), write)
(set-option :timeout 0)
(push) ; 22
(set-option :timeout 10)
(assert (not (= $t@520@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_10), write) in
;     (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
; [eval] (unfolding acc(i32(_10), write) in (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
(set-option :timeout 0)
(push) ; 22
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@529@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@497@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@458@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@448@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@424@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@407@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@397@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@351@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@299@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= ret@294@01 ret@443@01)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10)
(set-option :timeout 0)
(push) ; 23
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@397@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@424@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@448@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@458@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@497@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= $t@529@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 24
(set-option :timeout 10)
(assert (not (= ret@443@01 $t@520@01)))
(check-sat)
; unknown
(pop) ; 24
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int < _10.val_int + 10
; [eval] _10.val_int + 10
(pop) ; 23
; Joined path conditions
(pop) ; 22
; Joined path conditions
(set-option :timeout 0)
(push) ; 22
(assert (not (< val_int@524@01 (+ ($SortWrappers.$SnapToInt $t@490@01) 10))))
(check-sat)
; unsat
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(assert (< val_int@524@01 (+ ($SortWrappers.$SnapToInt $t@490@01) 10)))
; [exec]
; assert true
; [exec]
; exhale acc(i32(_1), write) && acc(i32(_10), read$())
; [eval] read$()
(push) ; 22
(pop) ; 22
; Joined path conditions
(push) ; 22
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(push) ; 22
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(push) ; 22
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale false
(pop) ; 21
(set-option :timeout 0)
(push) ; 21
; [else-branch: 53 | !(val_bool@536@01)]
(assert (not val_bool@536@01))
(pop) ; 21
(pop) ; 20
(pop) ; 19
(pop) ; 18
(push) ; 18
; [else-branch: 38 | !(val_bool@505@01)]
(assert (not val_bool@505@01))
(pop) ; 18
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
(push) ; 14
; [else-branch: 28 | !(val_bool@419@01)]
(assert (not val_bool@419@01))
(pop) ; 14
(pop) ; 13
(push) ; 13
; [else-branch: 26 | val_bool@415@01]
(assert val_bool@415@01)
(pop) ; 13
; [eval] !!__t59
; [eval] !__t59
(push) ; 13
(set-option :timeout 10)
(assert (not (not val_bool@415@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not val_bool@415@01))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 54 | val_bool@415@01 | live]
; [else-branch: 54 | !(val_bool@415@01) | live]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 54 | val_bool@415@01]
(assert val_bool@415@01)
; [exec]
; label loop5_group1_loop7_group2a_bb9
; [exec]
; __t9 := true
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@556@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.val_bool, write)
(declare-const $t@557@01 Bool)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@556@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _18.val_bool := false
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@413@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@409@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@399@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@375@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@365@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@357@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@353@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@308@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@305@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@301@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@210@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= ret@213@01 ret@556@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t60 := _18.val_bool
; [exec]
; fold acc(i32(_1), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@401@01) $t@397@01))
; [exec]
; fold acc(i32(_10), write)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= $t@397@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale (unfolding acc(i32(_10), write) in
;     (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
(declare-const $t@558@01 $Snap)
(assert (= $t@558@01 $Snap.unit))
; [eval] (unfolding acc(i32(_10), write) in (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
(set-option :timeout 0)
(push) ; 14
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@407@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@351@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@299@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@117@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@294@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10)
(set-option :timeout 0)
(push) ; 15
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@299@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@351@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= $t@407@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= ret@294@01 $t@397@01)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int < _10.val_int + 10
; [eval] _10.val_int + 10
(pop) ; 15
; Joined path conditions
(pop) ; 14
; Joined path conditions
(assert (< val_int@401@01 (+ ($SortWrappers.$SnapToInt $t@344@01) 10)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@559@01 $Snap)
(assert (= $t@559@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(i32(_1), write) && acc(i32(_10), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(push) ; 14
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(push) ; 14
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale false
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 54 | !(val_bool@415@01)]
(assert (not val_bool@415@01))
(pop) ; 13
(pop) ; 12
(push) ; 12
; [else-branch: 25 | val_bool@377@01]
(assert val_bool@377@01)
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 21 | val_bool@367@01]
(assert val_bool@367@01)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 17 | !(val_bool@359@01)]
(assert (not val_bool@359@01))
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 8 | val_bool@208@01]
(assert val_bool@208@01)
(pop) ; 7
; [eval] !!__t45
; [eval] !__t45
(push) ; 7
(set-option :timeout 10)
(assert (not (not val_bool@208@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not val_bool@208@01))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 55 | val_bool@208@01 | live]
; [else-branch: 55 | !(val_bool@208@01) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 55 | val_bool@208@01]
(assert val_bool@208@01)
; [exec]
; label loop5_group1_bb5
; [exec]
; __t9 := true
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@560@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.val_bool, write)
(declare-const $t@561@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@560@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _18.val_bool := false
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@206@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@203@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@194@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@183@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@178@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@126@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@124@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@560@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t46 := _18.val_bool
; [exec]
; fold acc(i32(_1), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@196@01) $t@192@01))
; [exec]
; fold acc(i32(_10), write)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@192@01 ret@117@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_10), write) in
;     (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
; [eval] (unfolding acc(i32(_10), write) in (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10))
(set-option :timeout 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@201@01 ret@117@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@117@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@117@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@122@01 ret@117@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_1), write) in _1.val_int < _10.val_int + 10)
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@122@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@130@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@169@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@201@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@117@01 $t@192@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int < _10.val_int + 10
; [eval] _10.val_int + 10
(pop) ; 9
; Joined path conditions
(pop) ; 8
; Joined path conditions
(set-option :timeout 0)
(push) ; 8
(assert (not (< val_int@196@01 (+ ($SortWrappers.$SnapToInt $t@162@01) 10))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (< val_int@196@01 (+ ($SortWrappers.$SnapToInt $t@162@01) 10)))
; [exec]
; assert true
; [exec]
; exhale acc(i32(_1), write) && acc(i32(_10), read$())
; [eval] read$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale false
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 55 | !(val_bool@208@01)]
(assert (not val_bool@208@01))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(val_bool@177@01)]
(assert (not val_bool@177@01))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_bool ----------
(declare-const ret@562@01 Bool)
(declare-const ret@563@01 Bool)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_int ----------
(declare-const ret@564@01 Int)
(declare-const ret@565@01 Int)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_ref ----------
(declare-const ret@566@01 $Ref)
(declare-const ret@567@01 $Ref)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
