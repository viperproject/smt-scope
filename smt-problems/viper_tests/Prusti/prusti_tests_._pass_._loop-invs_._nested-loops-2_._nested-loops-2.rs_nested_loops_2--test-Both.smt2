(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:05:15
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._loop-invs_._nested-loops-2_._nested-loops-2.rs_nested_loops_2--test-Both.vpr
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
; var _1: Ref
(declare-const _1@53@01 $Ref)
; [exec]
; var _2: Ref
(declare-const _2@54@01 $Ref)
; [exec]
; var _3: Ref
(declare-const _3@55@01 $Ref)
; [exec]
; var _4: Ref
(declare-const _4@56@01 $Ref)
; [exec]
; var _7: Ref
(declare-const _7@57@01 $Ref)
; [exec]
; var _8: Int
(declare-const _8@58@01 Int)
; [exec]
; var _9: Int
(declare-const _9@59@01 Int)
; [exec]
; var _11: Ref
(declare-const _11@60@01 $Ref)
; [exec]
; var _15: Ref
(declare-const _15@61@01 $Ref)
; [exec]
; var _19: Ref
(declare-const _19@62@01 $Ref)
; [exec]
; var _24: Ref
(declare-const _24@63@01 $Ref)
; [exec]
; var _28: Ref
(declare-const _28@64@01 $Ref)
; [exec]
; var _29: Ref
(declare-const _29@65@01 $Ref)
; [exec]
; var _31: Ref
(declare-const _31@66@01 $Ref)
; [exec]
; var _32: Int
(declare-const _32@67@01 Int)
; [exec]
; var _33: Int
(declare-const _33@68@01 Int)
; [exec]
; var _35: Ref
(declare-const _35@69@01 $Ref)
; [exec]
; var _39: Ref
(declare-const _39@70@01 $Ref)
; [exec]
; var _43: Ref
(declare-const _43@71@01 $Ref)
; [exec]
; var _48: Ref
(declare-const _48@72@01 $Ref)
; [exec]
; var _52: Int
(declare-const _52@73@01 Int)
; [exec]
; var _53: Ref
(declare-const _53@74@01 $Ref)
; [exec]
; var _54: Ref
(declare-const _54@75@01 $Ref)
; [exec]
; var _58: Ref
(declare-const _58@76@01 $Ref)
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
; inhale acc(i32(_1), write) && acc(i32(_2), write)
(declare-const $t@77@01 $Snap)
(assert (= $t@77@01 ($Snap.combine ($Snap.first $t@77@01) ($Snap.second $t@77@01))))
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1@53@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@78@01 $Snap)
(assert (= $t@78@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (unfolding acc(i32(_1), write) in _1.val_int >= 0)
(declare-const $t@79@01 $Snap)
(assert (= $t@79@01 $Snap.unit))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int >= 0)
(set-option :timeout 0)
(push) ; 3
(assert (i32%trigger ($Snap.first $t@77@01) _1@53@01))
(assert (not (= _1@53@01 $Ref.null)))
; [eval] _1.val_int >= 0
(pop) ; 3
; Joined path conditions
(assert (and (i32%trigger ($Snap.first $t@77@01) _1@53@01) (not (= _1@53@01 $Ref.null))))
(assert (>= ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)) 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label pre
; [exec]
; __t0 := true
; [exec]
; _3 := builtin$havoc_ref()
(declare-const ret@80@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_3.val_int, write)
(declare-const $t@81@01 Int)
(assert (not (= ret@80@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _3.val_int := 0
; [exec]
; _4 := builtin$havoc_ref()
(declare-const ret@82@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_4.val_int, write)
(declare-const $t@83@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@80@01 ret@82@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@82@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _4.val_int := 0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@80@01 ret@82@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t1 := true
; [exec]
; __t2 := true
; [exec]
; _8 := builtin$havoc_int()
(declare-const ret@84@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _8 := _4.val_int
; [exec]
; label l0
; [exec]
; _9 := builtin$havoc_int()
(declare-const ret@85@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@80@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@82@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _9 := _1.val_int
(declare-const _9@86@01 Int)
(assert (= _9@86@01 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
; [exec]
; label l1
; [exec]
; _7 := builtin$havoc_ref()
(declare-const ret@87@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_7.val_bool, write)
(declare-const $t@88@01 Bool)
(assert (not (= ret@87@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _7.val_bool := _8 < _9
; [eval] _8 < _9
(declare-const val_bool@89@01 Bool)
(assert (= val_bool@89@01 (< 0 _9@86@01)))
; [exec]
; __t29 := _7.val_bool
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not val_bool@89@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not val_bool@89@01))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | val_bool@89@01 | live]
; [else-branch: 0 | !(val_bool@89@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | val_bool@89@01]
(assert val_bool@89@01)
; [exec]
; label bb0
; [exec]
; __t3 := true
; [exec]
; _11 := builtin$havoc_ref()
(declare-const ret@90@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_11.val_bool, write)
(declare-const $t@91@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@90@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@90@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _11.val_bool := false
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@90@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t30 := _11.val_bool
; [exec]
; fold acc(i32(_3), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap 0) ret@80@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@80@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(i32(_4), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap 0) ret@82@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@82@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@80@01 ret@82@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@80@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _2@54@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@82@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_4), write) in
;     (unfolding acc(i32(_3), write) in
;       (unfolding acc(i32(_2), write) in
;         (unfolding acc(i32(_1), write) in
;           _1.val_int ==
;           old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) &&
;           (_2.val_int ==
;           old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) &&
;           (_4.val_int <= _1.val_int &&
;           (!(_2.val_int >= 0) || _3.val_int >= 0)))))))
; [eval] (unfolding acc(i32(_4), write) in (unfolding acc(i32(_3), write) in (unfolding acc(i32(_2), write) in (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))))))
(set-option :timeout 0)
(push) ; 4
; [eval] (unfolding acc(i32(_3), write) in (unfolding acc(i32(_2), write) in (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0))))))
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@82@01 ret@80@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_2), write) in (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))))
(set-option :timeout 0)
(push) ; 6
(assert (i32%trigger ($Snap.second $t@77@01) _2@54@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@82@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@80@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= _2@54@01 $Ref.null)))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0))))
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@80@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@82@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _2@54@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
; [then-branch: 1 | True | live]
; [else-branch: 1 | False | live]
(push) ; 9
; [then-branch: 1 | True]
; [eval] _2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
; [then-branch: 2 | True | live]
; [else-branch: 2 | False | live]
(push) ; 11
; [then-branch: 2 | True]
; [eval] _4.val_int <= _1.val_int
(push) ; 12
; [then-branch: 3 | 0 <= First:($t@77@01) | live]
; [else-branch: 3 | !(0 <= First:($t@77@01)) | live]
(push) ; 13
; [then-branch: 3 | 0 <= First:($t@77@01)]
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
; [eval] !(_2.val_int >= 0) || _3.val_int >= 0
; [eval] !(_2.val_int >= 0)
; [eval] _2.val_int >= 0
(push) ; 14
; [then-branch: 4 | !(Second:($t@77@01) >= 0) | live]
; [else-branch: 4 | Second:($t@77@01) >= 0 | live]
(push) ; 15
; [then-branch: 4 | !(Second:($t@77@01) >= 0)]
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)))
(pop) ; 15
(push) ; 15
; [else-branch: 4 | Second:($t@77@01) >= 0]
(assert (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0))
; [eval] _3.val_int >= 0
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or
  (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)
  (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0))))
(pop) ; 13
(push) ; 13
; [else-branch: 3 | !(0 <= First:($t@77@01))]
(assert (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (or
      (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)
      (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0))))))
; Joined path conditions
(assert (or
  (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
(pop) ; 11
(push) ; 11
; [else-branch: 2 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (and
  (=>
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (and
      (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
      (or
        (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)
        (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)))))
  (or
    (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))))
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 1 | False]
(assert false)
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (and
  (=>
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (and
      (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
      (or
        (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)
        (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)))))
  (or
    (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))))
; Joined path conditions
(pop) ; 7
; Joined path conditions
(assert (and
  (=>
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (and
      (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
      (or
        (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)
        (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)))))
  (or
    (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))))
(pop) ; 6
; Joined path conditions
(assert (and
  (i32%trigger ($Snap.second $t@77@01) _2@54@01)
  (not (= _2@54@01 $Ref.null))
  (=>
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (and
      (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
      (or
        (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)
        (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)))))
  (or
    (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))))
(pop) ; 5
; Joined path conditions
(assert (and
  (i32%trigger ($Snap.second $t@77@01) _2@54@01)
  (not (= _2@54@01 $Ref.null))
  (=>
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (and
      (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
      (or
        (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)
        (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)))))
  (or
    (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))))
(pop) ; 4
; Joined path conditions
(assert (and
  (i32%trigger ($Snap.second $t@77@01) _2@54@01)
  (not (= _2@54@01 $Ref.null))
  (=>
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (and
      (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
      (or
        (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)
        (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)))))
  (or
    (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))))
(push) ; 4
(assert (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
; [exec]
; assert true
; [exec]
; exhale acc(i32(_3), write) &&
;   (acc(i32(_4), write) && (acc(i32(_1), read$()) && acc(i32(_2), read$())))
; [eval] read$()
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
(push) ; 4
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
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
; _11 := builtin$havoc_ref()
(declare-const ret@92@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _15 := builtin$havoc_ref()
(declare-const ret@93@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _19 := builtin$havoc_ref()
(declare-const ret@94@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _24 := builtin$havoc_ref()
(declare-const ret@95@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _28 := builtin$havoc_ref()
(declare-const ret@96@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _29 := builtin$havoc_ref()
(declare-const ret@97@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _3 := builtin$havoc_ref()
(declare-const ret@98@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _31 := builtin$havoc_ref()
(declare-const ret@99@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _32 := builtin$havoc_int()
(declare-const ret@100@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _33 := builtin$havoc_int()
(declare-const ret@101@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _35 := builtin$havoc_ref()
(declare-const ret@102@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _39 := builtin$havoc_ref()
(declare-const ret@103@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _4 := builtin$havoc_ref()
(declare-const ret@104@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _43 := builtin$havoc_ref()
(declare-const ret@105@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _48 := builtin$havoc_ref()
(declare-const ret@106@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _52 := builtin$havoc_int()
(declare-const ret@107@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _53 := builtin$havoc_ref()
(declare-const ret@108@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _54 := builtin$havoc_ref()
(declare-const ret@109@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _58 := builtin$havoc_ref()
(declare-const ret@110@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _7 := builtin$havoc_ref()
(declare-const ret@111@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _8 := builtin$havoc_int()
(declare-const ret@112@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _9 := builtin$havoc_int()
(declare-const ret@113@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t1 := builtin$havoc_bool()
(declare-const ret@114@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t10 := builtin$havoc_bool()
(declare-const ret@115@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t11 := builtin$havoc_bool()
(declare-const ret@116@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t12 := builtin$havoc_bool()
(declare-const ret@117@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t13 := builtin$havoc_bool()
(declare-const ret@118@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t14 := builtin$havoc_bool()
(declare-const ret@119@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t15 := builtin$havoc_bool()
(declare-const ret@120@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t16 := builtin$havoc_bool()
(declare-const ret@121@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t17 := builtin$havoc_bool()
(declare-const ret@122@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t18 := builtin$havoc_bool()
(declare-const ret@123@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t19 := builtin$havoc_bool()
(declare-const ret@124@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t2 := builtin$havoc_bool()
(declare-const ret@125@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t20 := builtin$havoc_bool()
(declare-const ret@126@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t21 := builtin$havoc_bool()
(declare-const ret@127@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t22 := builtin$havoc_bool()
(declare-const ret@128@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t23 := builtin$havoc_bool()
(declare-const ret@129@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t24 := builtin$havoc_bool()
(declare-const ret@130@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t25 := builtin$havoc_bool()
(declare-const ret@131@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t26 := builtin$havoc_bool()
(declare-const ret@132@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t27 := builtin$havoc_bool()
(declare-const ret@133@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t3 := builtin$havoc_bool()
(declare-const ret@134@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t31 := builtin$havoc_bool()
(declare-const ret@135@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t32 := builtin$havoc_bool()
(declare-const ret@136@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t33 := builtin$havoc_bool()
(declare-const ret@137@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t34 := builtin$havoc_bool()
(declare-const ret@138@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t35 := builtin$havoc_bool()
(declare-const ret@139@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t36 := builtin$havoc_bool()
(declare-const ret@140@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t37 := builtin$havoc_bool()
(declare-const ret@141@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t38 := builtin$havoc_bool()
(declare-const ret@142@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t39 := builtin$havoc_bool()
(declare-const ret@143@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t4 := builtin$havoc_bool()
(declare-const ret@144@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t40 := builtin$havoc_bool()
(declare-const ret@145@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t41 := builtin$havoc_bool()
(declare-const ret@146@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t42 := builtin$havoc_bool()
(declare-const ret@147@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t43 := builtin$havoc_bool()
(declare-const ret@148@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t44 := builtin$havoc_bool()
(declare-const ret@149@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t45 := builtin$havoc_bool()
(declare-const ret@150@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t46 := builtin$havoc_bool()
(declare-const ret@151@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t47 := builtin$havoc_bool()
(declare-const ret@152@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t48 := builtin$havoc_bool()
(declare-const ret@153@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t49 := builtin$havoc_bool()
(declare-const ret@154@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t5 := builtin$havoc_bool()
(declare-const ret@155@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t50 := builtin$havoc_bool()
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
; inhale acc(i32(_3), write) &&
;   (acc(i32(_4), write) && (acc(i32(_1), read$()) && acc(i32(_2), read$())))
(declare-const $t@161@01 $Snap)
(assert (= $t@161@01 ($Snap.combine ($Snap.first $t@161@01) ($Snap.second $t@161@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@161@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@161@01))
    ($Snap.second ($Snap.second $t@161@01)))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@104@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@104@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@104@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@161@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@161@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))
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
    (= $t@162@01 ($Snap.first $t@77@01)))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (= $t@162@01 ($Snap.first ($Snap.second ($Snap.second $t@161@01)))))))
(assert (<=
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit))))
; [eval] read$()
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
(declare-const $t@163@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
    (= $t@163@01 ($Snap.second $t@77@01)))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (= $t@163@01 ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@164@01 $Snap)
(assert (= $t@164@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; __t1 := true
; [exec]
; __t2 := true
; [exec]
; _8 := builtin$havoc_int()
(declare-const ret@165@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_4), write)
(assert (not (= ret@104@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.first ($Snap.second $t@161@01)) ret@104@01))
; [exec]
; _8 := _4.val_int
(declare-const _8@166@01 Int)
(assert (= _8@166@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))))
; [exec]
; label l4
; [exec]
; _9 := builtin$havoc_int()
(declare-const ret@167@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_1), write)
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
(assert (not (= ret@104@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger $t@162@01 _1@53@01))
; [exec]
; _9 := _1.val_int
(declare-const _9@168@01 Int)
(assert (= _9@168@01 ($SortWrappers.$SnapToInt $t@162@01)))
; [exec]
; label l5
; [exec]
; _7 := builtin$havoc_ref()
(declare-const ret@169@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_7.val_bool, write)
(declare-const $t@170@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@169@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _7.val_bool := _8 < _9
; [eval] _8 < _9
(declare-const val_bool@171@01 Bool)
(assert (= val_bool@171@01 (< _8@166@01 _9@168@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t31 := _7.val_bool
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@171@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@171@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 5 | val_bool@171@01 | live]
; [else-branch: 5 | !(val_bool@171@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | val_bool@171@01]
(assert val_bool@171@01)
; [exec]
; label loop1_group1_bb1
; [exec]
; __t3 := true
; [exec]
; _11 := builtin$havoc_ref()
(declare-const ret@172@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_11.val_bool, write)
(declare-const $t@173@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@172@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _11.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t32 := _11.val_bool
; [exec]
; inhale (unfolding acc(i32(_3), write) in
;     (unfolding acc(i32(_2), write) in
;       _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) &&
;       (_2.val_int ==
;       old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) &&
;       (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))))
(declare-const $t@174@01 $Snap)
(assert (= $t@174@01 $Snap.unit))
; [eval] (unfolding acc(i32(_3), write) in (unfolding acc(i32(_2), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))))
(set-option :timeout 0)
(push) ; 5
(assert (i32%trigger ($Snap.first $t@161@01) ret@98@01))
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@98@01 $Ref.null)))
; [eval] (unfolding acc(i32(_2), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0))))
(set-option :timeout 0)
(push) ; 6
(push) ; 7
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
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
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
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (i32%trigger $t@163@01 _2@54@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@53@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@104@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@98@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 6 | $t@162@01 == First:($t@77@01) | live]
; [else-branch: 6 | $t@162@01 != First:($t@77@01) | live]
(push) ; 8
; [then-branch: 6 | $t@162@01 == First:($t@77@01)]
(assert (=
  ($SortWrappers.$SnapToInt $t@162@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
; [eval] _2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 7 | $t@163@01 == Second:($t@77@01) | live]
; [else-branch: 7 | $t@163@01 != Second:($t@77@01) | live]
(push) ; 10
; [then-branch: 7 | $t@163@01 == Second:($t@77@01)]
(assert (=
  ($SortWrappers.$SnapToInt $t@163@01)
  ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
; [eval] _4.val_int <= _1.val_int
(push) ; 11
; [then-branch: 8 | First:(Second:($t@161@01)) <= $t@162@01 | live]
; [else-branch: 8 | !(First:(Second:($t@161@01)) <= $t@162@01) | live]
(push) ; 12
; [then-branch: 8 | First:(Second:($t@161@01)) <= $t@162@01]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
  ($SortWrappers.$SnapToInt $t@162@01)))
; [eval] !(_2.val_int >= 0) || _3.val_int >= 0
; [eval] !(_2.val_int >= 0)
; [eval] _2.val_int >= 0
(push) ; 13
; [then-branch: 9 | !($t@163@01 >= 0) | live]
; [else-branch: 9 | $t@163@01 >= 0 | live]
(push) ; 14
; [then-branch: 9 | !($t@163@01 >= 0)]
(assert (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0)))
(pop) ; 14
(push) ; 14
; [else-branch: 9 | $t@163@01 >= 0]
(assert (>= ($SortWrappers.$SnapToInt $t@163@01) 0))
; [eval] _3.val_int >= 0
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or
  (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
  (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0))))
(pop) ; 12
(push) ; 12
; [else-branch: 8 | !(First:(Second:($t@161@01)) <= $t@162@01)]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
    ($SortWrappers.$SnapToInt $t@162@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
    ($SortWrappers.$SnapToInt $t@162@01))
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
      ($SortWrappers.$SnapToInt $t@162@01))
    (or
      (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
      (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0))))))
; Joined path conditions
(assert (or
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
      ($SortWrappers.$SnapToInt $t@162@01)))
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
    ($SortWrappers.$SnapToInt $t@162@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 7 | $t@163@01 != Second:($t@77@01)]
(assert (not
  (=
    ($SortWrappers.$SnapToInt $t@163@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@163@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
  (and
    (=
      ($SortWrappers.$SnapToInt $t@163@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
    (=>
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
        ($SortWrappers.$SnapToInt $t@162@01))
      (and
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
          ($SortWrappers.$SnapToInt $t@162@01))
        (or
          (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
          (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0)))))
    (or
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
          ($SortWrappers.$SnapToInt $t@162@01)))
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
        ($SortWrappers.$SnapToInt $t@162@01))))))
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapToInt $t@163@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@163@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))
(pop) ; 8
(push) ; 8
; [else-branch: 6 | $t@162@01 != First:($t@77@01)]
(assert (not
  (=
    ($SortWrappers.$SnapToInt $t@162@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@162@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=
      ($SortWrappers.$SnapToInt $t@162@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@163@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=
          ($SortWrappers.$SnapToInt $t@163@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
        (=>
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
            ($SortWrappers.$SnapToInt $t@162@01))
          (and
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
              ($SortWrappers.$SnapToInt $t@162@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0)))))
        (or
          (not
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
              ($SortWrappers.$SnapToInt $t@162@01)))
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
            ($SortWrappers.$SnapToInt $t@162@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@163@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@163@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapToInt $t@162@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@162@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
(pop) ; 6
; Joined path conditions
(assert (and
  (i32%trigger $t@163@01 _2@54@01)
  (=>
    (=
      ($SortWrappers.$SnapToInt $t@162@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (and
      (=
        ($SortWrappers.$SnapToInt $t@162@01)
        ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
      (=>
        (=
          ($SortWrappers.$SnapToInt $t@163@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
        (and
          (=
            ($SortWrappers.$SnapToInt $t@163@01)
            ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
          (=>
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
              ($SortWrappers.$SnapToInt $t@162@01))
            (and
              (<=
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
                ($SortWrappers.$SnapToInt $t@162@01))
              (or
                (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
                (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0)))))
          (or
            (not
              (<=
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
                ($SortWrappers.$SnapToInt $t@162@01)))
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
              ($SortWrappers.$SnapToInt $t@162@01)))))
      (or
        (not
          (=
            ($SortWrappers.$SnapToInt $t@163@01)
            ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
        (=
          ($SortWrappers.$SnapToInt $t@163@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))))
  (or
    (not
      (=
        ($SortWrappers.$SnapToInt $t@162@01)
        ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
    (=
      ($SortWrappers.$SnapToInt $t@162@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))))
(pop) ; 5
; Joined path conditions
(assert (and
  (i32%trigger ($Snap.first $t@161@01) ret@98@01)
  (not (= ret@98@01 $Ref.null))
  (i32%trigger $t@163@01 _2@54@01)
  (=>
    (=
      ($SortWrappers.$SnapToInt $t@162@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (and
      (=
        ($SortWrappers.$SnapToInt $t@162@01)
        ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
      (=>
        (=
          ($SortWrappers.$SnapToInt $t@163@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
        (and
          (=
            ($SortWrappers.$SnapToInt $t@163@01)
            ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
          (=>
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
              ($SortWrappers.$SnapToInt $t@162@01))
            (and
              (<=
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
                ($SortWrappers.$SnapToInt $t@162@01))
              (or
                (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
                (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0)))))
          (or
            (not
              (<=
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
                ($SortWrappers.$SnapToInt $t@162@01)))
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
              ($SortWrappers.$SnapToInt $t@162@01)))))
      (or
        (not
          (=
            ($SortWrappers.$SnapToInt $t@163@01)
            ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
        (=
          ($SortWrappers.$SnapToInt $t@163@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))))
  (or
    (not
      (=
        ($SortWrappers.$SnapToInt $t@162@01)
        ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
    (=
      ($SortWrappers.$SnapToInt $t@162@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))))
(assert (and
  (and
    (and
      (or
        (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0))
        (>= ($SortWrappers.$SnapToInt ($Snap.first $t@161@01)) 0))
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01)))
        ($SortWrappers.$SnapToInt $t@162@01)))
    (=
      ($SortWrappers.$SnapToInt $t@163@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@162@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t4 := true
; [exec]
; __t5 := true
; [exec]
; _15 := builtin$havoc_ref()
(declare-const ret@175@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_15.val_bool, write)
(declare-const $t@176@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@175@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _15.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@175@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t33 := _15.val_bool
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _19 := builtin$havoc_ref()
(declare-const ret@177@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_19.val_bool, write)
(declare-const $t@178@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@177@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _19.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t34 := _19.val_bool
; [exec]
; __t8 := true
; [exec]
; __t9 := true
; [exec]
; _24 := builtin$havoc_ref()
(declare-const ret@179@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_24.val_bool, write)
(declare-const $t@180@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@179@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _24.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t35 := _24.val_bool
; [exec]
; __t10 := true
; [exec]
; __t11 := true
; [exec]
; _28 := builtin$havoc_ref()
(declare-const ret@181@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_28.tuple_0, write)
(declare-const $t@182@01 $Ref)
(assert (not (= ret@181@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_28.tuple_0.val_int, write)
(declare-const $t@183@01 Int)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@53@01 $t@182@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@182@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@182@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_28.tuple_1, write)
(declare-const $t@184@01 $Ref)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(_28.tuple_1.val_bool, write)
(declare-const $t@185@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@177@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@172@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@87@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@90@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@184@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_3), write)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@182@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _28.tuple_0.val_int := _3.val_int + 1
; [eval] _3.val_int + 1
(declare-const val_int@186@01 Int)
(assert (= val_int@186@01 (+ ($SortWrappers.$SnapToInt ($Snap.first $t@161@01)) 1)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@53@01 $t@182@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@182@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@98@01 $t@182@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; _28.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@90@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@87@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@172@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@177@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@184@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t36 := _28.tuple_1.val_bool
; [exec]
; assert !__t36
; [eval] !__t36
; [exec]
; __t12 := true
; [exec]
; _3 := _28.tuple_0
; [exec]
; label l8
; [exec]
; _29 := builtin$havoc_ref()
(declare-const ret@187@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_29.val_int, write)
(declare-const $t@188@01 Int)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@182@01 ret@187@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@187@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@187@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@187@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@187@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _29.val_int := 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@187@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@187@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@187@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@182@01 ret@187@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t13 := true
; [exec]
; __t14 := true
; [exec]
; _32 := builtin$havoc_int()
(declare-const ret@189@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _32 := _29.val_int
; [exec]
; label l9
; [exec]
; _33 := builtin$havoc_int()
(declare-const ret@190@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _33 := _1.val_int
(declare-const _33@191@01 Int)
(assert (= _33@191@01 ($SortWrappers.$SnapToInt $t@162@01)))
; [exec]
; label l10
; [exec]
; _31 := builtin$havoc_ref()
(declare-const ret@192@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_31.val_bool, write)
(declare-const $t@193@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@192@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _31.val_bool := _32 < _33
; [eval] _32 < _33
(declare-const val_bool@194@01 Bool)
(assert (= val_bool@194@01 (< 0 _33@191@01)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@192@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t37 := _31.val_bool
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@194@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@194@01))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 10 | val_bool@194@01 | live]
; [else-branch: 10 | !(val_bool@194@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | val_bool@194@01]
(assert val_bool@194@01)
; [exec]
; label l2
; [exec]
; __t15 := true
; [exec]
; _35 := builtin$havoc_ref()
(declare-const ret@195@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_35.val_bool, write)
(declare-const $t@196@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@195@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _35.val_bool := false
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t38 := _35.val_bool
; [exec]
; fold acc(i32(_3), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@186@01) $t@182@01))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _2@54@01 $t@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(i32(_29), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap 0) ret@187@01))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@187@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@182@01 ret@187@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@182@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _2@54@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@187@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_3), write) in
;     (unfolding acc(i32(_29), write) in
;       (unfolding acc(i32(_2), write) in
;         (unfolding acc(i32(_1), write) in
;           _1.val_int ==
;           old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) &&
;           (_2.val_int ==
;           old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) &&
;           (_29.val_int <= _1.val_int &&
;           (!(_2.val_int >= 0) || _3.val_int >= 0)))))))
; [eval] (unfolding acc(i32(_3), write) in (unfolding acc(i32(_29), write) in (unfolding acc(i32(_2), write) in (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))))))
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@98@01 $t@182@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@182@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_29), write) in (unfolding acc(i32(_2), write) in (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0))))))
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@187@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@187@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@182@01 ret@187@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_2), write) in (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))))
(set-option :timeout 0)
(push) ; 8
(push) ; 9
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
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
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
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@182@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@98@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@187@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0))))
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@187@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@104@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@98@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@182@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _2@54@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
; [then-branch: 11 | $t@162@01 == First:($t@77@01) | live]
; [else-branch: 11 | $t@162@01 != First:($t@77@01) | live]
(push) ; 11
; [then-branch: 11 | $t@162@01 == First:($t@77@01)]
; [eval] _2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
; [then-branch: 12 | $t@163@01 == Second:($t@77@01) | live]
; [else-branch: 12 | $t@163@01 != Second:($t@77@01) | live]
(push) ; 13
; [then-branch: 12 | $t@163@01 == Second:($t@77@01)]
; [eval] _29.val_int <= _1.val_int
(push) ; 14
; [then-branch: 13 | 0 <= $t@162@01 | live]
; [else-branch: 13 | !(0 <= $t@162@01) | live]
(push) ; 15
; [then-branch: 13 | 0 <= $t@162@01]
(assert (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))
; [eval] !(_2.val_int >= 0) || _3.val_int >= 0
; [eval] !(_2.val_int >= 0)
; [eval] _2.val_int >= 0
(push) ; 16
; [then-branch: 14 | !($t@163@01 >= 0) | live]
; [else-branch: 14 | $t@163@01 >= 0 | live]
(push) ; 17
; [then-branch: 14 | !($t@163@01 >= 0)]
(assert (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0)))
(pop) ; 17
(push) ; 17
; [else-branch: 14 | $t@163@01 >= 0]
(assert (>= ($SortWrappers.$SnapToInt $t@163@01) 0))
; [eval] _3.val_int >= 0
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (or
  (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
  (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0))))
(pop) ; 15
(push) ; 15
; [else-branch: 13 | !(0 <= $t@162@01)]
(assert (not (<= 0 ($SortWrappers.$SnapToInt $t@162@01))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert (=>
  (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
  (and
    (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
    (or
      (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
      (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0))))))
; Joined path conditions
(assert (or
  (not (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))
  (<= 0 ($SortWrappers.$SnapToInt $t@162@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 12 | $t@163@01 != Second:($t@77@01)]
(assert (not
  (=
    ($SortWrappers.$SnapToInt $t@163@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@163@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
  (and
    (=>
      (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
      (and
        (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
        (or
          (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
          (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0)))))
    (or
      (not (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))
      (<= 0 ($SortWrappers.$SnapToInt $t@162@01))))))
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapToInt $t@163@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@163@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))
(pop) ; 11
(push) ; 11
; [else-branch: 11 | $t@162@01 != First:($t@77@01)]
(assert (not
  (=
    ($SortWrappers.$SnapToInt $t@162@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@162@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@163@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=>
          (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
          (and
            (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0)))))
        (or
          (not (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))
          (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@163@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@163@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
; Joined path conditions
(pop) ; 9
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@162@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@163@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=>
          (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
          (and
            (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0)))))
        (or
          (not (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))
          (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@163@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@163@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
(pop) ; 8
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@162@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@163@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=>
          (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
          (and
            (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0)))))
        (or
          (not (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))
          (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@163@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@163@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
(pop) ; 7
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@162@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@163@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=>
          (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
          (and
            (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0)))))
        (or
          (not (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))
          (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@163@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@163@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
(pop) ; 6
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@162@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@163@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=>
          (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
          (and
            (<= 0 ($SortWrappers.$SnapToInt $t@162@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@163@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0)))))
        (or
          (not (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))
          (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@163@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@163@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
(push) ; 6
(assert (not (and
  (and
    (and
      (or
        (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0))
        (>= val_int@186@01 0))
      (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))
    (=
      ($SortWrappers.$SnapToInt $t@163@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@162@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (or
        (not (>= ($SortWrappers.$SnapToInt $t@163@01) 0))
        (>= val_int@186@01 0))
      (<= 0 ($SortWrappers.$SnapToInt $t@162@01)))
    (=
      ($SortWrappers.$SnapToInt $t@163@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@162@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
; [exec]
; assert true
; [exec]
; exhale acc(i32(_3), write) &&
;   (acc(i32(_29), write) && (acc(i32(_1), read$()) && acc(i32(_2), read$())))
; [eval] read$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
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
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; _29 := builtin$havoc_ref()
(declare-const ret@197@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _3 := builtin$havoc_ref()
(declare-const ret@198@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _31 := builtin$havoc_ref()
(declare-const ret@199@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _32 := builtin$havoc_int()
(declare-const ret@200@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _33 := builtin$havoc_int()
(declare-const ret@201@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _35 := builtin$havoc_ref()
(declare-const ret@202@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _39 := builtin$havoc_ref()
(declare-const ret@203@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _43 := builtin$havoc_ref()
(declare-const ret@204@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _48 := builtin$havoc_ref()
(declare-const ret@205@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _52 := builtin$havoc_int()
(declare-const ret@206@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _53 := builtin$havoc_ref()
(declare-const ret@207@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _54 := builtin$havoc_ref()
(declare-const ret@208@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t13 := builtin$havoc_bool()
(declare-const ret@209@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t14 := builtin$havoc_bool()
(declare-const ret@210@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t15 := builtin$havoc_bool()
(declare-const ret@211@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t16 := builtin$havoc_bool()
(declare-const ret@212@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t17 := builtin$havoc_bool()
(declare-const ret@213@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t18 := builtin$havoc_bool()
(declare-const ret@214@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t19 := builtin$havoc_bool()
(declare-const ret@215@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t20 := builtin$havoc_bool()
(declare-const ret@216@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t21 := builtin$havoc_bool()
(declare-const ret@217@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t22 := builtin$havoc_bool()
(declare-const ret@218@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t23 := builtin$havoc_bool()
(declare-const ret@219@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t24 := builtin$havoc_bool()
(declare-const ret@220@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t25 := builtin$havoc_bool()
(declare-const ret@221@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t39 := builtin$havoc_bool()
(declare-const ret@222@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t40 := builtin$havoc_bool()
(declare-const ret@223@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t41 := builtin$havoc_bool()
(declare-const ret@224@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t42 := builtin$havoc_bool()
(declare-const ret@225@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t43 := builtin$havoc_bool()
(declare-const ret@226@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t44 := builtin$havoc_bool()
(declare-const ret@227@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t45 := builtin$havoc_bool()
(declare-const ret@228@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t46 := builtin$havoc_bool()
(declare-const ret@229@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t47 := builtin$havoc_bool()
(declare-const ret@230@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(i32(_3), write) &&
;   (acc(i32(_29), write) && (acc(i32(_1), read$()) && acc(i32(_2), read$())))
(declare-const $t@231@01 $Snap)
(assert (= $t@231@01 ($Snap.combine ($Snap.first $t@231@01) ($Snap.second $t@231@01))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@231@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@231@01))
    ($Snap.second ($Snap.second $t@231@01)))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@231@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@231@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@231@01))))))
; [eval] read$()
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@232@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
    (= $t@232@01 $t@162@01))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (= $t@232@01 ($Snap.first ($Snap.second ($Snap.second $t@231@01)))))))
; [eval] read$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@233@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@233@01 $t@163@01))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (= $t@233@01 ($Snap.second ($Snap.second ($Snap.second $t@231@01)))))))
(assert (<=
  $Perm.No
  (+
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@234@01 $Snap)
(assert (= $t@234@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; __t13 := true
; [exec]
; __t14 := true
; [exec]
; _32 := builtin$havoc_int()
(declare-const ret@235@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_29), write)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@197@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.first ($Snap.second $t@231@01)) ret@197@01))
; [exec]
; _32 := _29.val_int
(declare-const _32@236@01 Int)
(assert (= _32@236@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))))
; [exec]
; label l13
; [exec]
; _33 := builtin$havoc_int()
(declare-const ret@237@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 6
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
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
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
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@104@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@98@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@197@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger $t@232@01 _1@53@01))
; [exec]
; _33 := _1.val_int
(declare-const _33@238@01 Int)
(assert (= _33@238@01 ($SortWrappers.$SnapToInt $t@232@01)))
; [exec]
; label l14
; [exec]
; _31 := builtin$havoc_ref()
(declare-const ret@239@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_31.val_bool, write)
(declare-const $t@240@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@239@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _31.val_bool := _32 < _33
; [eval] _32 < _33
(declare-const val_bool@241@01 Bool)
(assert (= val_bool@241@01 (< _32@236@01 _33@238@01)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t39 := _31.val_bool
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@241@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not val_bool@241@01))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 15 | val_bool@241@01 | live]
; [else-branch: 15 | !(val_bool@241@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 15 | val_bool@241@01]
(assert val_bool@241@01)
; [exec]
; label loop1_group2_bb3
; [exec]
; __t15 := true
; [exec]
; _35 := builtin$havoc_ref()
(declare-const ret@242@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_35.val_bool, write)
(declare-const $t@243@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@242@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _35.val_bool := false
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t40 := _35.val_bool
; [exec]
; inhale (unfolding acc(i32(_3), write) in
;     (unfolding acc(i32(_2), write) in
;       _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) &&
;       (_2.val_int ==
;       old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) &&
;       (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))))
(declare-const $t@244@01 $Snap)
(assert (= $t@244@01 $Snap.unit))
; [eval] (unfolding acc(i32(_3), write) in (unfolding acc(i32(_2), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))))
(set-option :timeout 0)
(push) ; 7
(assert (i32%trigger ($Snap.first $t@231@01) ret@198@01))
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@197@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@198@01 $Ref.null)))
; [eval] (unfolding acc(i32(_2), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0))))
(set-option :timeout 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (+
              (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (+
              (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (i32%trigger $t@233@01 _2@54@01))
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@53@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@98@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@197@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@198@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 16 | $t@232@01 == First:($t@77@01) | live]
; [else-branch: 16 | $t@232@01 != First:($t@77@01) | live]
(push) ; 10
; [then-branch: 16 | $t@232@01 == First:($t@77@01)]
(assert (=
  ($SortWrappers.$SnapToInt $t@232@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
; [eval] _2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
; [then-branch: 17 | $t@233@01 == Second:($t@77@01) | live]
; [else-branch: 17 | $t@233@01 != Second:($t@77@01) | live]
(push) ; 12
; [then-branch: 17 | $t@233@01 == Second:($t@77@01)]
(assert (=
  ($SortWrappers.$SnapToInt $t@233@01)
  ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
; [eval] _29.val_int <= _1.val_int
(push) ; 13
; [then-branch: 18 | First:(Second:($t@231@01)) <= $t@232@01 | live]
; [else-branch: 18 | !(First:(Second:($t@231@01)) <= $t@232@01) | live]
(push) ; 14
; [then-branch: 18 | First:(Second:($t@231@01)) <= $t@232@01]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
  ($SortWrappers.$SnapToInt $t@232@01)))
; [eval] !(_2.val_int >= 0) || _3.val_int >= 0
; [eval] !(_2.val_int >= 0)
; [eval] _2.val_int >= 0
(push) ; 15
; [then-branch: 19 | !($t@233@01 >= 0) | live]
; [else-branch: 19 | $t@233@01 >= 0 | live]
(push) ; 16
; [then-branch: 19 | !($t@233@01 >= 0)]
(assert (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))
(pop) ; 16
(push) ; 16
; [else-branch: 19 | $t@233@01 >= 0]
(assert (>= ($SortWrappers.$SnapToInt $t@233@01) 0))
; [eval] _3.val_int >= 0
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (or
  (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
  (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0))))
(pop) ; 14
(push) ; 14
; [else-branch: 18 | !(First:(Second:($t@231@01)) <= $t@232@01)]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
    ($SortWrappers.$SnapToInt $t@232@01))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
(assert (=>
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
    ($SortWrappers.$SnapToInt $t@232@01))
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
      ($SortWrappers.$SnapToInt $t@232@01))
    (or
      (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
      (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0))))))
; Joined path conditions
(assert (or
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
      ($SortWrappers.$SnapToInt $t@232@01)))
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
    ($SortWrappers.$SnapToInt $t@232@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 17 | $t@233@01 != Second:($t@77@01)]
(assert (not
  (=
    ($SortWrappers.$SnapToInt $t@233@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@233@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
  (and
    (=
      ($SortWrappers.$SnapToInt $t@233@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
    (=>
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
        ($SortWrappers.$SnapToInt $t@232@01))
      (and
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
          ($SortWrappers.$SnapToInt $t@232@01))
        (or
          (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
          (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
    (or
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
          ($SortWrappers.$SnapToInt $t@232@01)))
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
        ($SortWrappers.$SnapToInt $t@232@01))))))
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapToInt $t@233@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@233@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))
(pop) ; 10
(push) ; 10
; [else-branch: 16 | $t@232@01 != First:($t@77@01)]
(assert (not
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=
      ($SortWrappers.$SnapToInt $t@232@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
        (=>
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
            ($SortWrappers.$SnapToInt $t@232@01))
          (and
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
              ($SortWrappers.$SnapToInt $t@232@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
        (or
          (not
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
              ($SortWrappers.$SnapToInt $t@232@01)))
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
            ($SortWrappers.$SnapToInt $t@232@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapToInt $t@232@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
(pop) ; 8
; Joined path conditions
(assert (and
  (i32%trigger $t@233@01 _2@54@01)
  (=>
    (=
      ($SortWrappers.$SnapToInt $t@232@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (and
      (=
        ($SortWrappers.$SnapToInt $t@232@01)
        ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
      (=>
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
        (and
          (=
            ($SortWrappers.$SnapToInt $t@233@01)
            ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
          (=>
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
              ($SortWrappers.$SnapToInt $t@232@01))
            (and
              (<=
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
                ($SortWrappers.$SnapToInt $t@232@01))
              (or
                (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
                (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
          (or
            (not
              (<=
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
                ($SortWrappers.$SnapToInt $t@232@01)))
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
              ($SortWrappers.$SnapToInt $t@232@01)))))
      (or
        (not
          (=
            ($SortWrappers.$SnapToInt $t@233@01)
            ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))))
  (or
    (not
      (=
        ($SortWrappers.$SnapToInt $t@232@01)
        ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
    (=
      ($SortWrappers.$SnapToInt $t@232@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))))
(pop) ; 7
; Joined path conditions
(assert (and
  (i32%trigger ($Snap.first $t@231@01) ret@198@01)
  (not (= ret@198@01 $Ref.null))
  (i32%trigger $t@233@01 _2@54@01)
  (=>
    (=
      ($SortWrappers.$SnapToInt $t@232@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (and
      (=
        ($SortWrappers.$SnapToInt $t@232@01)
        ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
      (=>
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
        (and
          (=
            ($SortWrappers.$SnapToInt $t@233@01)
            ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
          (=>
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
              ($SortWrappers.$SnapToInt $t@232@01))
            (and
              (<=
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
                ($SortWrappers.$SnapToInt $t@232@01))
              (or
                (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
                (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
          (or
            (not
              (<=
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
                ($SortWrappers.$SnapToInt $t@232@01)))
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
              ($SortWrappers.$SnapToInt $t@232@01)))))
      (or
        (not
          (=
            ($SortWrappers.$SnapToInt $t@233@01)
            ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))))
  (or
    (not
      (=
        ($SortWrappers.$SnapToInt $t@232@01)
        ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
    (=
      ($SortWrappers.$SnapToInt $t@232@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))))
(assert (and
  (and
    (and
      (or
        (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0))
        (>= ($SortWrappers.$SnapToInt ($Snap.first $t@231@01)) 0))
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01)))
        ($SortWrappers.$SnapToInt $t@232@01)))
    (=
      ($SortWrappers.$SnapToInt $t@233@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t16 := true
; [exec]
; __t17 := true
; [exec]
; _39 := builtin$havoc_ref()
(declare-const ret@245@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_39.val_bool, write)
(declare-const $t@246@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@245@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _39.val_bool := false
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@245@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t41 := _39.val_bool
; [exec]
; __t18 := true
; [exec]
; __t19 := true
; [exec]
; _43 := builtin$havoc_ref()
(declare-const ret@247@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_43.val_bool, write)
(declare-const $t@248@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@245@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@247@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _43.val_bool := false
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@245@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t42 := _43.val_bool
; [exec]
; __t20 := true
; [exec]
; __t21 := true
; [exec]
; _48 := builtin$havoc_ref()
(declare-const ret@249@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_48.val_bool, write)
(declare-const $t@250@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@245@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@247@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@249@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _48.val_bool := false
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@247@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@245@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t43 := _48.val_bool
; [exec]
; __t22 := true
; [exec]
; __t23 := true
; [exec]
; _52 := builtin$havoc_int()
(declare-const ret@251@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_2), write)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (+
              (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (+
              (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@197@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@98@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@104@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@53@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _52 := _2.val_int
(declare-const _52@252@01 Int)
(assert (= _52@252@01 ($SortWrappers.$SnapToInt $t@233@01)))
; [exec]
; label l17
; [exec]
; _53 := builtin$havoc_ref()
(declare-const ret@253@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_53.tuple_0, write)
(declare-const $t@254@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@181@01 ret@253@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@253@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_53.tuple_0.val_int, write)
(declare-const $t@255@01 Int)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _2@54@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@197@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@98@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@53@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@254@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_53.tuple_1, write)
(declare-const $t@256@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@181@01 ret@253@01)))
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
; inhale acc(_53.tuple_1.val_bool, write)
(declare-const $t@257@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@242@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@245@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@247@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@249@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@256@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_3), write)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@197@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@254@01 ret@198@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _53.tuple_0.val_int := _3.val_int + _52
; [eval] _3.val_int + _52
(declare-const val_int@258@01 Int)
(assert (=
  val_int@258@01
  (+ ($SortWrappers.$SnapToInt ($Snap.first $t@231@01)) _52@252@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _2@54@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@197@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@98@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@53@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@198@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; _53.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@249@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@247@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@245@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@242@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 $t@256@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t44 := _53.tuple_1.val_bool
; [exec]
; assert !__t44
; [eval] !__t44
; [exec]
; __t24 := true
; [exec]
; _3 := _53.tuple_0
; [exec]
; label l18
; [exec]
; _54 := builtin$havoc_ref()
(declare-const ret@259@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_54.tuple_0, write)
(declare-const $t@260@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@181@01 ret@259@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@253@01 ret@259@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@259@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_54.tuple_0.val_int, write)
(declare-const $t@261@01 Int)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@198@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@53@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@98@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@197@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _2@54@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@254@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@260@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_54.tuple_1, write)
(declare-const $t@262@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@181@01 ret@259@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@253@01 ret@259@01)))
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
; inhale acc(_54.tuple_1.val_bool, write)
(declare-const $t@263@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@256@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@249@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@247@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@245@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@242@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@262@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _54.tuple_0.val_int := _29.val_int + 1
; [eval] _29.val_int + 1
(declare-const val_int@264@01 Int)
(assert (=
  val_int@264@01
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@231@01))) 1)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@254@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _2@54@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@197@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@98@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@53@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@198@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; _54.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@256@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@249@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@247@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@245@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@242@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 $t@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t45 := _54.tuple_1.val_bool
; [exec]
; assert !__t45
; [eval] !__t45
; [exec]
; __t25 := true
; [exec]
; _29 := _54.tuple_0
; [exec]
; label l19
; [exec]
; __t13 := true
; [exec]
; __t14 := true
; [exec]
; _32 := builtin$havoc_int()
(declare-const ret@265@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _32 := _29.val_int
; [exec]
; label l20
; [exec]
; _33 := builtin$havoc_int()
(declare-const ret@266@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _33 := _1.val_int
(declare-const _33@267@01 Int)
(assert (= _33@267@01 ($SortWrappers.$SnapToInt $t@232@01)))
; [exec]
; label l21
; [exec]
; _31 := builtin$havoc_ref()
(declare-const ret@268@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_31.val_bool, write)
(declare-const $t@269@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@245@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@247@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@256@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@262@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@268@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _31.val_bool := _32 < _33
; [eval] _32 < _33
(declare-const val_bool@270@01 Bool)
(assert (= val_bool@270@01 (< val_int@264@01 _33@267@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@262@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@256@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@247@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@245@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@268@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t46 := _31.val_bool
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not val_bool@270@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not val_bool@270@01))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 20 | val_bool@270@01 | live]
; [else-branch: 20 | !(val_bool@270@01) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 20 | val_bool@270@01]
(assert val_bool@270@01)
; [exec]
; label l6
; [exec]
; __t15 := true
; [exec]
; _35 := builtin$havoc_ref()
(declare-const ret@271@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_35.val_bool, write)
(declare-const $t@272@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@245@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@247@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@256@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@262@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@271@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _35.val_bool := false
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@262@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@256@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@247@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@245@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t47 := _35.val_bool
; [exec]
; fold acc(i32(_3), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@258@01) $t@254@01))
; [exec]
; fold acc(i32(_29), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@264@01) $t@260@01))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@254@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@254@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@260@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(i32(_2), write)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@260@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@254@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _1@53@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_3), write) in
;     (unfolding acc(i32(_29), write) in
;       (unfolding acc(i32(_2), write) in
;         (unfolding acc(i32(_1), write) in
;           _1.val_int ==
;           old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) &&
;           (_2.val_int ==
;           old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) &&
;           (_29.val_int <= _1.val_int &&
;           (!(_2.val_int >= 0) || _3.val_int >= 0)))))))
; [eval] (unfolding acc(i32(_3), write) in (unfolding acc(i32(_29), write) in (unfolding acc(i32(_2), write) in (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))))))
(set-option :timeout 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@197@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@98@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@198@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_29), write) in (unfolding acc(i32(_2), write) in (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0))))))
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@198@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@98@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@197@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@254@01 $t@260@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_2), write) in (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))))
(set-option :timeout 0)
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@254@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@197@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@98@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@104@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@198@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@260@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0))))
(set-option :timeout 0)
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@260@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@198@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@104@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@98@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@197@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@254@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= _2@54@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_29.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
; [then-branch: 21 | $t@232@01 == First:($t@77@01) | live]
; [else-branch: 21 | $t@232@01 != First:($t@77@01) | live]
(push) ; 13
; [then-branch: 21 | $t@232@01 == First:($t@77@01)]
; [eval] _2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
; [then-branch: 22 | $t@233@01 == Second:($t@77@01) | live]
; [else-branch: 22 | $t@233@01 != Second:($t@77@01) | live]
(push) ; 15
; [then-branch: 22 | $t@233@01 == Second:($t@77@01)]
; [eval] _29.val_int <= _1.val_int
(push) ; 16
; [then-branch: 23 | val_int@264@01 <= $t@232@01 | live]
; [else-branch: 23 | !(val_int@264@01 <= $t@232@01) | live]
(push) ; 17
; [then-branch: 23 | val_int@264@01 <= $t@232@01]
(assert (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))
; [eval] !(_2.val_int >= 0) || _3.val_int >= 0
; [eval] !(_2.val_int >= 0)
; [eval] _2.val_int >= 0
(push) ; 18
; [then-branch: 24 | !($t@233@01 >= 0) | live]
; [else-branch: 24 | $t@233@01 >= 0 | live]
(push) ; 19
; [then-branch: 24 | !($t@233@01 >= 0)]
(assert (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))
(pop) ; 19
(push) ; 19
; [else-branch: 24 | $t@233@01 >= 0]
(assert (>= ($SortWrappers.$SnapToInt $t@233@01) 0))
; [eval] _3.val_int >= 0
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (or
  (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
  (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0))))
(pop) ; 17
(push) ; 17
; [else-branch: 23 | !(val_int@264@01 <= $t@232@01)]
(assert (not (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert (=>
  (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
  (and
    (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
    (or
      (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
      (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0))))))
; Joined path conditions
(assert (or
  (not (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))
  (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))))
(pop) ; 15
(push) ; 15
; [else-branch: 22 | $t@233@01 != Second:($t@77@01)]
(assert (not
  (=
    ($SortWrappers.$SnapToInt $t@233@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@233@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
  (and
    (=>
      (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
      (and
        (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
        (or
          (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
          (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
    (or
      (not (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))
      (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))))))
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapToInt $t@233@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@233@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))
(pop) ; 13
(push) ; 13
; [else-branch: 21 | $t@232@01 != First:($t@77@01)]
(assert (not
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=>
          (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
          (and
            (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
        (or
          (not (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))
          (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
; Joined path conditions
(pop) ; 11
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=>
          (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
          (and
            (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
        (or
          (not (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))
          (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
(pop) ; 10
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=>
          (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
          (and
            (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
        (or
          (not (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))
          (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
(pop) ; 9
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=>
          (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
          (and
            (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
        (or
          (not (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))
          (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
(pop) ; 8
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=>
          (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
          (and
            (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
        (or
          (not (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))
          (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
(push) ; 8
(assert (not (and
  (and
    (and
      (or
        (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0))
        (>= val_int@258@01 0))
      (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))
    (=
      ($SortWrappers.$SnapToInt $t@233@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (or
        (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0))
        (>= val_int@258@01 0))
      (<= val_int@264@01 ($SortWrappers.$SnapToInt $t@232@01)))
    (=
      ($SortWrappers.$SnapToInt $t@233@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
; [exec]
; assert true
; [exec]
; exhale acc(i32(_3), write) &&
;   (acc(i32(_29), write) && (acc(i32(_1), read$()) && acc(i32(_2), read$())))
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
; [eval] read$()
(set-option :timeout 0)
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
; [else-branch: 20 | !(val_bool@270@01)]
(assert (not val_bool@270@01))
(pop) ; 7
; [eval] !__t46
(push) ; 7
(set-option :timeout 10)
(assert (not val_bool@270@01))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not val_bool@270@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 25 | !(val_bool@270@01) | live]
; [else-branch: 25 | val_bool@270@01 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 25 | !(val_bool@270@01)]
(assert (not val_bool@270@01))
; [exec]
; label loop1_inv_pre
; [exec]
; label loop1_inv_post_perm
; [exec]
; __t26 := true
; [exec]
; _58 := builtin$havoc_ref()
(declare-const ret@273@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_58.tuple_0, write)
(declare-const $t@274@01 $Ref)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@259@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@181@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@253@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@273@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_58.tuple_0.val_int, write)
(declare-const $t@275@01 Int)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@198@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _1@53@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@98@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@197@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _2@54@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@254@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@260@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@274@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_58.tuple_1, write)
(declare-const $t@276@01 $Ref)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@259@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@181@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@253@01 ret@273@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_58.tuple_1.val_bool, write)
(declare-const $t@277@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@268@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@262@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@256@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@249@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@247@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@245@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@242@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@177@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@172@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@87@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@90@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@184@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@192@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@195@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@276@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _58.tuple_0.val_int := _4.val_int + 1
; [eval] _4.val_int + 1
(declare-const val_int@278@01 Int)
(assert (=
  val_int@278@01
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01))) 1)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@260@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@254@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _2@54@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@197@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@98@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _1@53@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@198@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; _58.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@268@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@262@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@256@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@249@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@247@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@245@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@242@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@177@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@175@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@172@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@87@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@90@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@184@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@192@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@195@01 $t@276@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t48 := _58.tuple_1.val_bool
; [exec]
; assert !__t48
; [eval] !__t48
; [exec]
; __t27 := true
; [exec]
; _4 := _58.tuple_0
; [exec]
; label l24
; [exec]
; __t1 := true
; [exec]
; __t2 := true
; [exec]
; _8 := builtin$havoc_int()
(declare-const ret@279@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _8 := _4.val_int
; [exec]
; label l25
; [exec]
; _9 := builtin$havoc_int()
(declare-const ret@280@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _9 := _1.val_int
(declare-const _9@281@01 Int)
(assert (= _9@281@01 ($SortWrappers.$SnapToInt $t@232@01)))
; [exec]
; label l26
; [exec]
; _7 := builtin$havoc_ref()
(declare-const ret@282@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_7.val_bool, write)
(declare-const $t@283@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@245@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@247@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@256@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@262@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@276@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@282@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _7.val_bool := _8 < _9
; [eval] _8 < _9
(declare-const val_bool@284@01 Bool)
(assert (= val_bool@284@01 (< val_int@278@01 _9@281@01)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@276@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@262@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@256@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@247@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@245@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t49 := _7.val_bool
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not val_bool@284@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not val_bool@284@01))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 26 | val_bool@284@01 | live]
; [else-branch: 26 | !(val_bool@284@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 26 | val_bool@284@01]
(assert val_bool@284@01)
; [exec]
; label loop1_group2a_bb2
; [exec]
; __t3 := true
; [exec]
; _11 := builtin$havoc_ref()
(declare-const ret@285@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_11.val_bool, write)
(declare-const $t@286@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@245@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@247@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@256@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@262@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@276@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@282@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@285@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _11.val_bool := false
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@282@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@276@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@268@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@262@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@256@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@249@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@247@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@245@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@242@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@177@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@175@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@172@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@87@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@184@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@192@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t50 := _11.val_bool
; [exec]
; fold acc(i32(_3), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@258@01) $t@254@01))
; [exec]
; fold acc(i32(_4), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@278@01) $t@274@01))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@254@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@254@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@274@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(i32(_2), write)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@274@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@254@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@53@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_4), write) in
;     (unfolding acc(i32(_3), write) in
;       (unfolding acc(i32(_2), write) in
;         (unfolding acc(i32(_1), write) in
;           _1.val_int ==
;           old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) &&
;           (_2.val_int ==
;           old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) &&
;           (_4.val_int <= _1.val_int &&
;           (!(_2.val_int >= 0) || _3.val_int >= 0)))))))
; [eval] (unfolding acc(i32(_4), write) in (unfolding acc(i32(_3), write) in (unfolding acc(i32(_2), write) in (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))))))
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@260@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@197@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@98@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@198@01 $t@274@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_3), write) in (unfolding acc(i32(_2), write) in (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0))))))
(set-option :timeout 0)
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@198@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@98@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@197@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@260@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@274@01 $t@254@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_2), write) in (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))))
(set-option :timeout 0)
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@274@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@260@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@197@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@98@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@104@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@198@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@254@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0))))
(set-option :timeout 0)
(push) ; 12
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@254@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@198@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@104@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@98@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@197@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@260@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@274@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= _2@54@01 _1@53@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)) && (_2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) && (_4.val_int <= _1.val_int && (!(_2.val_int >= 0) || _3.val_int >= 0)))
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
; [then-branch: 27 | $t@232@01 == First:($t@77@01) | live]
; [else-branch: 27 | $t@232@01 != First:($t@77@01) | live]
(push) ; 14
; [then-branch: 27 | $t@232@01 == First:($t@77@01)]
(assert (=
  ($SortWrappers.$SnapToInt $t@232@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))
; [eval] _2.val_int == old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
; [then-branch: 28 | $t@233@01 == Second:($t@77@01) | live]
; [else-branch: 28 | $t@233@01 != Second:($t@77@01) | live]
(push) ; 16
; [then-branch: 28 | $t@233@01 == Second:($t@77@01)]
(assert (=
  ($SortWrappers.$SnapToInt $t@233@01)
  ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
; [eval] _4.val_int <= _1.val_int
(push) ; 17
; [then-branch: 29 | val_int@278@01 <= $t@232@01 | live]
; [else-branch: 29 | !(val_int@278@01 <= $t@232@01) | live]
(push) ; 18
; [then-branch: 29 | val_int@278@01 <= $t@232@01]
(assert (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))
; [eval] !(_2.val_int >= 0) || _3.val_int >= 0
; [eval] !(_2.val_int >= 0)
; [eval] _2.val_int >= 0
(push) ; 19
; [then-branch: 30 | !($t@233@01 >= 0) | live]
; [else-branch: 30 | $t@233@01 >= 0 | live]
(push) ; 20
; [then-branch: 30 | !($t@233@01 >= 0)]
(assert (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))
(pop) ; 20
(push) ; 20
; [else-branch: 30 | $t@233@01 >= 0]
(assert (>= ($SortWrappers.$SnapToInt $t@233@01) 0))
; [eval] _3.val_int >= 0
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(assert (or
  (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
  (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0))))
(pop) ; 18
(push) ; 18
; [else-branch: 29 | !(val_int@278@01 <= $t@232@01)]
(assert (not (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))))
(pop) ; 18
(pop) ; 17
; Joined path conditions
(assert (=>
  (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
  (and
    (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
    (or
      (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
      (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0))))))
; Joined path conditions
(assert (or
  (not (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))
  (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))))
(pop) ; 16
(push) ; 16
; [else-branch: 28 | $t@233@01 != Second:($t@77@01)]
(assert (not
  (=
    ($SortWrappers.$SnapToInt $t@233@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@233@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
  (and
    (=
      ($SortWrappers.$SnapToInt $t@233@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
    (=>
      (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
      (and
        (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
        (or
          (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
          (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
    (or
      (not (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))
      (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))))))
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapToInt $t@233@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@233@01)
    ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))
(pop) ; 14
(push) ; 14
; [else-branch: 27 | $t@232@01 != First:($t@77@01)]
(assert (not
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=
      ($SortWrappers.$SnapToInt $t@232@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
        (=>
          (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
          (and
            (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
        (or
          (not (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))
          (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
; Joined path conditions
(pop) ; 12
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=
      ($SortWrappers.$SnapToInt $t@232@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
        (=>
          (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
          (and
            (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
        (or
          (not (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))
          (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
(pop) ; 11
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=
      ($SortWrappers.$SnapToInt $t@232@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
        (=>
          (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
          (and
            (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
        (or
          (not (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))
          (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
(pop) ; 10
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=
      ($SortWrappers.$SnapToInt $t@232@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
        (=>
          (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
          (and
            (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
        (or
          (not (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))
          (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
(pop) ; 9
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
  (and
    (=
      ($SortWrappers.$SnapToInt $t@232@01)
      ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))
    (=>
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
      (and
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))
        (=>
          (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
          (and
            (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01))
            (or
              (>= ($SortWrappers.$SnapToInt $t@233@01) 0)
              (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0)))))
        (or
          (not (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))
          (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt $t@233@01)
          ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
      (=
        ($SortWrappers.$SnapToInt $t@233@01)
        ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)))))))
(push) ; 9
(assert (not (and
  (and
    (and
      (or
        (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0))
        (>= val_int@258@01 0))
      (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))
    (=
      ($SortWrappers.$SnapToInt $t@233@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (or
        (not (>= ($SortWrappers.$SnapToInt $t@233@01) 0))
        (>= val_int@258@01 0))
      (<= val_int@278@01 ($SortWrappers.$SnapToInt $t@232@01)))
    (=
      ($SortWrappers.$SnapToInt $t@233@01)
      ($SortWrappers.$SnapToInt ($Snap.second $t@77@01))))
  (=
    ($SortWrappers.$SnapToInt $t@232@01)
    ($SortWrappers.$SnapToInt ($Snap.first $t@77@01)))))
; [exec]
; assert true
; [exec]
; exhale acc(i32(_3), write) &&
;   (acc(i32(_4), write) && (acc(i32(_1), read$()) && acc(i32(_2), read$())))
; [eval] read$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale false
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 26 | !(val_bool@284@01)]
(assert (not val_bool@284@01))
(pop) ; 8
; [eval] !__t49
(push) ; 8
(set-option :timeout 10)
(assert (not val_bool@284@01))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not val_bool@284@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 31 | !(val_bool@284@01) | live]
; [else-branch: 31 | val_bool@284@01 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 31 | !(val_bool@284@01)]
(assert (not val_bool@284@01))
; [exec]
; label loop1_inv_post_fnspc
; [exec]
; label loop1_group2a_bb1
; [exec]
; __t28 := true
; [exec]
; _0 := builtin$havoc_ref()
(declare-const ret@287@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_0.val_int, write)
(declare-const $t@288@01 Int)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@274@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@260@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@254@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@197@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@287@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _0.val_int := _3.val_int
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@197@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@254@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@260@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@274@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l29
; [exec]
; label l31
; [exec]
; fold acc(i32(_0), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@258@01) ret@287@01))
; [exec]
; assert (unfolding acc(i32(_0), write) in
;     !(old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) >= 0) ||
;     _0.val_int >= 0)
; [eval] (unfolding acc(i32(_0), write) in !(old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) >= 0) || _0.val_int >= 0)
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@198@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@197@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@254@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@260@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@274@01 ret@287@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] !(old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) >= 0) || _0.val_int >= 0
; [eval] !(old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) >= 0)
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) >= 0
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
; [then-branch: 32 | !(Second:($t@77@01) >= 0) | live]
; [else-branch: 32 | Second:($t@77@01) >= 0 | live]
(push) ; 11
; [then-branch: 32 | !(Second:($t@77@01) >= 0)]
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)))
(pop) ; 11
(push) ; 11
; [else-branch: 32 | Second:($t@77@01) >= 0]
(assert (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0))
; [eval] _0.val_int >= 0
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)
  (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0))))
(pop) ; 9
; Joined path conditions
(assert (or
  (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)
  (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0))))
(push) ; 9
(assert (not (or
  (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0))
  (>= val_int@258@01 0))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0))
  (>= val_int@258@01 0)))
; [exec]
; assert true
; [exec]
; exhale acc(i32(_0), write)
; [exec]
; label end_of_method
(pop) ; 8
(push) ; 8
; [else-branch: 31 | val_bool@284@01]
(assert val_bool@284@01)
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 25 | val_bool@270@01]
(assert val_bool@270@01)
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 15 | !(val_bool@241@01)]
(assert (not val_bool@241@01))
(pop) ; 6
; [eval] !__t39
(push) ; 6
(set-option :timeout 10)
(assert (not val_bool@241@01))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@241@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 33 | !(val_bool@241@01) | live]
; [else-branch: 33 | val_bool@241@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 33 | !(val_bool@241@01)]
(assert (not val_bool@241@01))
; [exec]
; label l3
; [exec]
; label end_of_method
(pop) ; 6
(push) ; 6
; [else-branch: 33 | val_bool@241@01]
(assert val_bool@241@01)
(pop) ; 6
(pop) ; 5
; [eval] !__t37
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@194@01))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 34 | !(val_bool@194@01) | dead]
; [else-branch: 34 | val_bool@194@01 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 34 | val_bool@194@01]
(assert val_bool@194@01)
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(val_bool@171@01)]
(assert (not val_bool@171@01))
(pop) ; 4
; [eval] !__t31
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@171@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@171@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 35 | !(val_bool@171@01) | live]
; [else-branch: 35 | val_bool@171@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 35 | !(val_bool@171@01)]
(assert (not val_bool@171@01))
; [exec]
; label loop1_start
; [exec]
; label end_of_method
(pop) ; 4
(push) ; 4
; [else-branch: 35 | val_bool@171@01]
(assert val_bool@171@01)
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(val_bool@89@01)]
(assert (not val_bool@89@01))
(pop) ; 3
; [eval] !__t29
(push) ; 3
(set-option :timeout 10)
(assert (not val_bool@89@01))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not val_bool@89@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 36 | !(val_bool@89@01) | live]
; [else-branch: 36 | val_bool@89@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 36 | !(val_bool@89@01)]
(assert (not val_bool@89@01))
; [exec]
; label return
; [exec]
; unfold acc(i32(_2), write)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@82@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@80@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@53@01 _2@54@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= _2@54@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.second $t@77@01) _2@54@01))
; [exec]
; label loop1_group2a_bb1
; [exec]
; __t28 := true
; [exec]
; _0 := builtin$havoc_ref()
(declare-const ret@289@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_0.val_int, write)
(declare-const $t@290@01 Int)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@289@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@80@01 ret@289@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@82@01 ret@289@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@289@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@289@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _0.val_int := _3.val_int
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@289@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@82@01 ret@289@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@80@01 ret@289@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@289@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l29
; [exec]
; label l31
; [exec]
; fold acc(i32(_0), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap 0) ret@289@01))
; [exec]
; assert (unfolding acc(i32(_0), write) in
;     !(old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) >= 0) ||
;     _0.val_int >= 0)
; [eval] (unfolding acc(i32(_0), write) in !(old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) >= 0) || _0.val_int >= 0)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= _2@54@01 ret@289@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@82@01 ret@289@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@80@01 ret@289@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@53@01 ret@289@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] !(old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) >= 0) || _0.val_int >= 0
; [eval] !(old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) >= 0)
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) >= 0
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 37 | !(Second:($t@77@01) >= 0) | live]
; [else-branch: 37 | Second:($t@77@01) >= 0 | live]
(push) ; 6
; [then-branch: 37 | !(Second:($t@77@01) >= 0)]
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 37 | Second:($t@77@01) >= 0]
(assert (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0))
; [eval] _0.val_int >= 0
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)
  (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0))))
(pop) ; 4
; Joined path conditions
(assert (or
  (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0)
  (not (>= ($SortWrappers.$SnapToInt ($Snap.second $t@77@01)) 0))))
; [exec]
; assert true
; [exec]
; exhale acc(i32(_0), write)
; [exec]
; label end_of_method
(pop) ; 3
(push) ; 3
; [else-branch: 36 | val_bool@89@01]
(assert val_bool@89@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_bool ----------
(declare-const ret@291@01 Bool)
(declare-const ret@292@01 Bool)
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
(declare-const ret@293@01 Int)
(declare-const ret@294@01 Int)
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
(declare-const ret@295@01 $Ref)
(declare-const ret@296@01 $Ref)
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
