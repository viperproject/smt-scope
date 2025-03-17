(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:08:05
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._loop-invs_._nested-loops-3_._nested-loops-3.rs_nested_loops_3--test-Both.vpr
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
; var _1: Ref
(declare-const _1@51@01 $Ref)
; [exec]
; var _2: Ref
(declare-const _2@52@01 $Ref)
; [exec]
; var _3: Ref
(declare-const _3@53@01 $Ref)
; [exec]
; var _6: Ref
(declare-const _6@54@01 $Ref)
; [exec]
; var _7: Int
(declare-const _7@55@01 Int)
; [exec]
; var _8: Int
(declare-const _8@56@01 Int)
; [exec]
; var _10: Ref
(declare-const _10@57@01 $Ref)
; [exec]
; var _13: Ref
(declare-const _13@58@01 $Ref)
; [exec]
; var _14: Ref
(declare-const _14@59@01 $Ref)
; [exec]
; var _16: Ref
(declare-const _16@60@01 $Ref)
; [exec]
; var _17: Int
(declare-const _17@61@01 Int)
; [exec]
; var _18: Int
(declare-const _18@62@01 Int)
; [exec]
; var _20: Ref
(declare-const _20@63@01 $Ref)
; [exec]
; var _23: Ref
(declare-const _23@64@01 $Ref)
; [exec]
; var _24: Ref
(declare-const _24@65@01 $Ref)
; [exec]
; var _26: Ref
(declare-const _26@66@01 $Ref)
; [exec]
; var _27: Int
(declare-const _27@67@01 Int)
; [exec]
; var _28: Int
(declare-const _28@68@01 Int)
; [exec]
; var _30: Ref
(declare-const _30@69@01 $Ref)
; [exec]
; var _33: Ref
(declare-const _33@70@01 $Ref)
; [exec]
; var _34: Ref
(declare-const _34@71@01 $Ref)
; [exec]
; var _38: Ref
(declare-const _38@72@01 $Ref)
; [exec]
; var _42: Ref
(declare-const _42@73@01 $Ref)
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
; inhale acc(i32(_1), write)
(declare-const $t@74@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@75@01 $Snap)
(assert (= $t@75@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (unfolding acc(i32(_1), write) in _1.val_int >= 0)
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 $Snap.unit))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int >= 0)
(set-option :timeout 0)
(push) ; 3
(assert (i32%trigger ($SortWrappers.IntTo$Snap $t@74@01) _1@51@01))
(assert (not (= _1@51@01 $Ref.null)))
; [eval] _1.val_int >= 0
(pop) ; 3
; Joined path conditions
(assert (and
  (i32%trigger ($SortWrappers.IntTo$Snap $t@74@01) _1@51@01)
  (not (= _1@51@01 $Ref.null))))
(assert (>= $t@74@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label pre
; [exec]
; __t0 := true
; [exec]
; _2 := builtin$havoc_ref()
(declare-const ret@77@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_2.val_int, write)
(declare-const $t@78@01 Int)
(assert (not (= ret@77@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _2.val_int := 0
; [exec]
; _3 := builtin$havoc_ref()
(declare-const ret@79@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_3.val_int, write)
(declare-const $t@80@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@77@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@79@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _3.val_int := 0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@77@01 ret@79@01)))
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
; _7 := builtin$havoc_int()
(declare-const ret@81@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _7 := _3.val_int
; [exec]
; label l0
; [exec]
; _8 := builtin$havoc_int()
(declare-const ret@82@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@77@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@51@01)))
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
; _8 := _1.val_int
; [exec]
; label l1
; [exec]
; _6 := builtin$havoc_ref()
(declare-const ret@83@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_6.val_bool, write)
(declare-const $t@84@01 Bool)
(assert (not (= ret@83@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _6.val_bool := _7 < _8
; [eval] _7 < _8
(declare-const val_bool@85@01 Bool)
(assert (= val_bool@85@01 (< 0 $t@74@01)))
; [exec]
; __t25 := _6.val_bool
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not val_bool@85@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not val_bool@85@01))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | val_bool@85@01 | live]
; [else-branch: 0 | !(val_bool@85@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | val_bool@85@01]
(assert val_bool@85@01)
; [exec]
; label bb0
; [exec]
; __t3 := true
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@86@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_10.val_bool, write)
(declare-const $t@87@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@86@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@86@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _10.val_bool := false
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@86@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t26 := _10.val_bool
; [exec]
; fold acc(i32(_2), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap 0) ret@77@01))
; [exec]
; fold acc(i32(_3), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap 0) ret@79@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@77@01 ret@79@01)))
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
(assert (not (= ret@77@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_1), write) in
;     _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)))
(set-option :timeout 0)
(push) ; 4
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
; Joined path conditions
; [exec]
; assert true
; [exec]
; exhale acc(i32(_2), write) &&
;   (acc(i32(_3), write) && acc(i32(_1), read$()))
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
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@88@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@89@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@90@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@91@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _17 := builtin$havoc_int()
(declare-const ret@92@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _18 := builtin$havoc_int()
(declare-const ret@93@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _2 := builtin$havoc_ref()
(declare-const ret@94@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _20 := builtin$havoc_ref()
(declare-const ret@95@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@96@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _24 := builtin$havoc_ref()
(declare-const ret@97@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@98@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_int()
(declare-const ret@99@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@100@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _3 := builtin$havoc_ref()
(declare-const ret@101@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@102@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _33 := builtin$havoc_ref()
(declare-const ret@103@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _34 := builtin$havoc_ref()
(declare-const ret@104@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _38 := builtin$havoc_ref()
(declare-const ret@105@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _42 := builtin$havoc_ref()
(declare-const ret@106@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _6 := builtin$havoc_ref()
(declare-const ret@107@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _7 := builtin$havoc_int()
(declare-const ret@108@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _8 := builtin$havoc_int()
(declare-const ret@109@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t1 := builtin$havoc_bool()
(declare-const ret@110@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t10 := builtin$havoc_bool()
(declare-const ret@111@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t11 := builtin$havoc_bool()
(declare-const ret@112@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t12 := builtin$havoc_bool()
(declare-const ret@113@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t13 := builtin$havoc_bool()
(declare-const ret@114@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t14 := builtin$havoc_bool()
(declare-const ret@115@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t15 := builtin$havoc_bool()
(declare-const ret@116@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t16 := builtin$havoc_bool()
(declare-const ret@117@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t17 := builtin$havoc_bool()
(declare-const ret@118@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t18 := builtin$havoc_bool()
(declare-const ret@119@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t19 := builtin$havoc_bool()
(declare-const ret@120@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t2 := builtin$havoc_bool()
(declare-const ret@121@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t20 := builtin$havoc_bool()
(declare-const ret@122@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t21 := builtin$havoc_bool()
(declare-const ret@123@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t22 := builtin$havoc_bool()
(declare-const ret@124@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t23 := builtin$havoc_bool()
(declare-const ret@125@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t27 := builtin$havoc_bool()
(declare-const ret@126@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t28 := builtin$havoc_bool()
(declare-const ret@127@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t29 := builtin$havoc_bool()
(declare-const ret@128@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t3 := builtin$havoc_bool()
(declare-const ret@129@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t30 := builtin$havoc_bool()
(declare-const ret@130@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t31 := builtin$havoc_bool()
(declare-const ret@131@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t32 := builtin$havoc_bool()
(declare-const ret@132@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t33 := builtin$havoc_bool()
(declare-const ret@133@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t34 := builtin$havoc_bool()
(declare-const ret@134@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t35 := builtin$havoc_bool()
(declare-const ret@135@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t36 := builtin$havoc_bool()
(declare-const ret@136@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t37 := builtin$havoc_bool()
(declare-const ret@137@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t38 := builtin$havoc_bool()
(declare-const ret@138@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t39 := builtin$havoc_bool()
(declare-const ret@139@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t4 := builtin$havoc_bool()
(declare-const ret@140@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t40 := builtin$havoc_bool()
(declare-const ret@141@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t41 := builtin$havoc_bool()
(declare-const ret@142@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t42 := builtin$havoc_bool()
(declare-const ret@143@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t43 := builtin$havoc_bool()
(declare-const ret@144@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t44 := builtin$havoc_bool()
(declare-const ret@145@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t45 := builtin$havoc_bool()
(declare-const ret@146@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t46 := builtin$havoc_bool()
(declare-const ret@147@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t47 := builtin$havoc_bool()
(declare-const ret@148@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t48 := builtin$havoc_bool()
(declare-const ret@149@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t5 := builtin$havoc_bool()
(declare-const ret@150@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t6 := builtin$havoc_bool()
(declare-const ret@151@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t7 := builtin$havoc_bool()
(declare-const ret@152@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t8 := builtin$havoc_bool()
(declare-const ret@153@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t9 := builtin$havoc_bool()
(declare-const ret@154@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(i32(_2), write) &&
;   (acc(i32(_3), write) && acc(i32(_1), read$()))
(declare-const $t@155@01 $Snap)
(assert (= $t@155@01 ($Snap.combine ($Snap.first $t@155@01) ($Snap.second $t@155@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@155@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@155@01))
    ($Snap.second ($Snap.second $t@155@01)))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@101@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@101@01)))
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
(declare-const $t@156@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
    (= $t@156@01 ($SortWrappers.IntTo$Snap $t@74@01)))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (= $t@156@01 ($Snap.second ($Snap.second $t@155@01))))))
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
(declare-const $t@157@01 $Snap)
(assert (= $t@157@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; __t1 := true
; [exec]
; __t2 := true
; [exec]
; _7 := builtin$havoc_int()
(declare-const ret@158@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_3), write)
(assert (not (= ret@101@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.first ($Snap.second $t@155@01)) ret@101@01))
; [exec]
; _7 := _3.val_int
(declare-const _7@159@01 Int)
(assert (= _7@159@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@155@01)))))
; [exec]
; label l4
; [exec]
; _8 := builtin$havoc_int()
(declare-const ret@160@01 Int)
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
(assert (not (= ret@101@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger $t@156@01 _1@51@01))
; [exec]
; _8 := _1.val_int
(declare-const _8@161@01 Int)
(assert (= _8@161@01 ($SortWrappers.$SnapToInt $t@156@01)))
; [exec]
; label l5
; [exec]
; _6 := builtin$havoc_ref()
(declare-const ret@162@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_6.val_bool, write)
(declare-const $t@163@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@162@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@162@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@162@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _6.val_bool := _7 < _8
; [eval] _7 < _8
(declare-const val_bool@164@01 Bool)
(assert (= val_bool@164@01 (< _7@159@01 _8@161@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@162@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@162@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t27 := _6.val_bool
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@164@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@164@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 1 | val_bool@164@01 | live]
; [else-branch: 1 | !(val_bool@164@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | val_bool@164@01]
(assert val_bool@164@01)
; [exec]
; label loop1_group1_bb1
; [exec]
; __t3 := true
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@165@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_10.val_bool, write)
(declare-const $t@166@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@165@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@165@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@165@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@165@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _10.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@165@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@165@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@165@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t28 := _10.val_bool
; [exec]
; inhale _1.val_int ==
;   old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
(declare-const $t@167@01 $Snap)
(assert (= $t@167@01 $Snap.unit))
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(assert (= ($SortWrappers.$SnapToInt $t@156@01) $t@74@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t4 := true
; [exec]
; __t5 := true
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@168@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_13.tuple_0, write)
(declare-const $t@169@01 $Ref)
(assert (not (= ret@168@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_13.tuple_0.val_int, write)
(declare-const $t@170@01 Int)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@51@01 $t@169@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@101@01 $t@169@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@169@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_13.tuple_1, write)
(declare-const $t@171@01 $Ref)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(_13.tuple_1.val_bool, write)
(declare-const $t@172@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@165@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@162@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@86@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@83@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@171@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_2), write)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@101@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@94@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@94@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.first $t@155@01) ret@94@01))
; [exec]
; _13.tuple_0.val_int := _2.val_int + 1
; [eval] _2.val_int + 1
(declare-const val_int@173@01 Int)
(assert (= val_int@173@01 (+ ($SortWrappers.$SnapToInt ($Snap.first $t@155@01)) 1)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@51@01 $t@169@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@101@01 $t@169@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@94@01 $t@169@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; _13.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@83@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@86@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@162@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@165@01 $t@171@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t29 := _13.tuple_1.val_bool
; [exec]
; assert !__t29
; [eval] !__t29
; [exec]
; __t6 := true
; [exec]
; _2 := _13.tuple_0
; [exec]
; label l8
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@174@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_14.val_int, write)
(declare-const $t@175@01 Int)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@101@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@174@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _14.val_int := 0
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@101@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@174@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t7 := true
; [exec]
; __t8 := true
; [exec]
; _17 := builtin$havoc_int()
(declare-const ret@176@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _17 := _14.val_int
; [exec]
; label l9
; [exec]
; _18 := builtin$havoc_int()
(declare-const ret@177@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _18 := _1.val_int
(declare-const _18@178@01 Int)
(assert (= _18@178@01 ($SortWrappers.$SnapToInt $t@156@01)))
; [exec]
; label l10
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@179@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_16.val_bool, write)
(declare-const $t@180@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@179@01)))
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
; _16.val_bool := _17 < _18
; [eval] _17 < _18
(declare-const val_bool@181@01 Bool)
(assert (= val_bool@181@01 (< 0 _18@178@01)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t30 := _16.val_bool
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@181@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@181@01))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | val_bool@181@01 | live]
; [else-branch: 2 | !(val_bool@181@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | val_bool@181@01]
(assert val_bool@181@01)
; [exec]
; label l2
; [exec]
; __t9 := true
; [exec]
; _20 := builtin$havoc_ref()
(declare-const ret@182@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_20.val_bool, write)
(declare-const $t@183@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@182@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _20.val_bool := false
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t31 := _20.val_bool
; [exec]
; fold acc(i32(_2), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@173@01) $t@169@01))
; [exec]
; fold acc(i32(_14), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap 0) ret@174@01))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@169@01 ret@174@01)))
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
(assert (not (= $t@169@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@174@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_1), write) in
;     _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)))
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@94@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@101@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
; Joined path conditions
; [exec]
; assert true
; [exec]
; exhale acc(i32(_2), write) &&
;   (acc(i32(_14), write) && acc(i32(_1), read$()))
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
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@184@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@185@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _17 := builtin$havoc_int()
(declare-const ret@186@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _18 := builtin$havoc_int()
(declare-const ret@187@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _2 := builtin$havoc_ref()
(declare-const ret@188@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _20 := builtin$havoc_ref()
(declare-const ret@189@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@190@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _24 := builtin$havoc_ref()
(declare-const ret@191@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@192@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_int()
(declare-const ret@193@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@194@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@195@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _33 := builtin$havoc_ref()
(declare-const ret@196@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _34 := builtin$havoc_ref()
(declare-const ret@197@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _38 := builtin$havoc_ref()
(declare-const ret@198@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t10 := builtin$havoc_bool()
(declare-const ret@199@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t11 := builtin$havoc_bool()
(declare-const ret@200@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t12 := builtin$havoc_bool()
(declare-const ret@201@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t13 := builtin$havoc_bool()
(declare-const ret@202@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t14 := builtin$havoc_bool()
(declare-const ret@203@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t15 := builtin$havoc_bool()
(declare-const ret@204@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t16 := builtin$havoc_bool()
(declare-const ret@205@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t17 := builtin$havoc_bool()
(declare-const ret@206@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t18 := builtin$havoc_bool()
(declare-const ret@207@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t19 := builtin$havoc_bool()
(declare-const ret@208@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t20 := builtin$havoc_bool()
(declare-const ret@209@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t21 := builtin$havoc_bool()
(declare-const ret@210@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t32 := builtin$havoc_bool()
(declare-const ret@211@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t33 := builtin$havoc_bool()
(declare-const ret@212@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t34 := builtin$havoc_bool()
(declare-const ret@213@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t35 := builtin$havoc_bool()
(declare-const ret@214@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t36 := builtin$havoc_bool()
(declare-const ret@215@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t37 := builtin$havoc_bool()
(declare-const ret@216@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t38 := builtin$havoc_bool()
(declare-const ret@217@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t39 := builtin$havoc_bool()
(declare-const ret@218@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t40 := builtin$havoc_bool()
(declare-const ret@219@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t41 := builtin$havoc_bool()
(declare-const ret@220@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t42 := builtin$havoc_bool()
(declare-const ret@221@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t43 := builtin$havoc_bool()
(declare-const ret@222@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t44 := builtin$havoc_bool()
(declare-const ret@223@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t45 := builtin$havoc_bool()
(declare-const ret@224@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t7 := builtin$havoc_bool()
(declare-const ret@225@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t8 := builtin$havoc_bool()
(declare-const ret@226@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t9 := builtin$havoc_bool()
(declare-const ret@227@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(i32(_2), write) &&
;   (acc(i32(_14), write) && acc(i32(_1), read$()))
(declare-const $t@228@01 $Snap)
(assert (= $t@228@01 ($Snap.combine ($Snap.first $t@228@01) ($Snap.second $t@228@01))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@228@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@228@01))
    ($Snap.second ($Snap.second $t@228@01)))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@184@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@184@01)))
(check-sat)
; unknown
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
(declare-const $t@229@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
    (= $t@229@01 $t@156@01))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (= $t@229@01 ($Snap.second ($Snap.second $t@228@01))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@230@01 $Snap)
(assert (= $t@230@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; __t7 := true
; [exec]
; __t8 := true
; [exec]
; _17 := builtin$havoc_int()
(declare-const ret@231@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_14), write)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@101@01 ret@184@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@184@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@184@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.first ($Snap.second $t@228@01)) ret@184@01))
; [exec]
; _17 := _14.val_int
(declare-const _17@232@01 Int)
(assert (= _17@232@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@228@01)))))
; [exec]
; label l13
; [exec]
; _18 := builtin$havoc_int()
(declare-const ret@233@01 Int)
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
(assert (not (= ret@94@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@101@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@184@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger $t@229@01 _1@51@01))
; [exec]
; _18 := _1.val_int
(declare-const _18@234@01 Int)
(assert (= _18@234@01 ($SortWrappers.$SnapToInt $t@229@01)))
; [exec]
; label l14
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@235@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.val_bool, write)
(declare-const $t@236@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@235@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.val_bool := _17 < _18
; [eval] _17 < _18
(declare-const val_bool@237@01 Bool)
(assert (= val_bool@237@01 (< _17@232@01 _18@234@01)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@235@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t32 := _16.val_bool
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@237@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not val_bool@237@01))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 3 | val_bool@237@01 | live]
; [else-branch: 3 | !(val_bool@237@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | val_bool@237@01]
(assert val_bool@237@01)
; [exec]
; label loop1_group2_bb3
; [exec]
; __t9 := true
; [exec]
; _20 := builtin$havoc_ref()
(declare-const ret@238@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_20.val_bool, write)
(declare-const $t@239@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@238@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _20.val_bool := false
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@238@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t33 := _20.val_bool
; [exec]
; inhale _1.val_int ==
;   old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
(declare-const $t@240@01 $Snap)
(assert (= $t@240@01 $Snap.unit))
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(assert (= ($SortWrappers.$SnapToInt $t@229@01) $t@74@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t10 := true
; [exec]
; __t11 := true
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@241@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_23.tuple_0, write)
(declare-const $t@242@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@241@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@241@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_23.tuple_0.val_int, write)
(declare-const $t@243@01 Int)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@51@01 $t@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@94@01 $t@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@101@01 $t@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@184@01 $t@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@242@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_23.tuple_1, write)
(declare-const $t@244@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@241@01)))
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
; inhale acc(_23.tuple_1.val_bool, write)
(declare-const $t@245@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@238@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@235@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@182@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@83@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@86@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@162@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@165@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@244@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_2), write)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@184@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@101@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@242@01 ret@188@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@188@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.first $t@228@01) ret@188@01))
; [exec]
; _23.tuple_0.val_int := _2.val_int + 1
; [eval] _2.val_int + 1
(declare-const val_int@246@01 Int)
(assert (= val_int@246@01 (+ ($SortWrappers.$SnapToInt ($Snap.first $t@228@01)) 1)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@51@01 $t@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@94@01 $t@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@101@01 $t@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@184@01 $t@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@242@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; _23.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@165@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@162@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@86@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@83@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@182@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@235@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@238@01 $t@244@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t34 := _23.tuple_1.val_bool
; [exec]
; assert !__t34
; [eval] !__t34
; [exec]
; __t12 := true
; [exec]
; _2 := _23.tuple_0
; [exec]
; label l17
; [exec]
; _24 := builtin$havoc_ref()
(declare-const ret@247@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_24.val_int, write)
(declare-const $t@248@01 Int)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@242@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@101@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@184@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@247@01)))
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
; _24.val_int := 0
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@184@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@101@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@242@01 ret@247@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t13 := true
; [exec]
; __t14 := true
; [exec]
; _27 := builtin$havoc_int()
(declare-const ret@249@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _27 := _24.val_int
; [exec]
; label l18
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@250@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _28 := _1.val_int
(declare-const _28@251@01 Int)
(assert (= _28@251@01 ($SortWrappers.$SnapToInt $t@229@01)))
; [exec]
; label l19
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@252@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_26.val_bool, write)
(declare-const $t@253@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@252@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _26.val_bool := _27 < _28
; [eval] _27 < _28
(declare-const val_bool@254@01 Bool)
(assert (= val_bool@254@01 (< 0 _28@251@01)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t35 := _26.val_bool
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not val_bool@254@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not val_bool@254@01))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 4 | val_bool@254@01 | live]
; [else-branch: 4 | !(val_bool@254@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 4 | val_bool@254@01]
(assert val_bool@254@01)
; [exec]
; label loop1_inv_post_perm
; [exec]
; __t15 := true
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@255@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.val_bool, write)
(declare-const $t@256@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@255@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _30.val_bool := false
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t36 := _30.val_bool
; [exec]
; fold acc(i32(_2), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@246@01) $t@242@01))
; [exec]
; fold acc(i32(_24), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap 0) ret@247@01))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@242@01 ret@247@01)))
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
(assert (not (= $t@242@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@247@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_1), write) in
;     _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)))
(set-option :timeout 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@184@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@101@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@94@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(pop) ; 8
; Joined path conditions
; [exec]
; assert true
; [exec]
; exhale acc(i32(_2), write) &&
;   (acc(i32(_24), write) && acc(i32(_1), read$()))
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
; _2 := builtin$havoc_ref()
(declare-const ret@257@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _24 := builtin$havoc_ref()
(declare-const ret@258@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@259@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_int()
(declare-const ret@260@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@261@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@262@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _33 := builtin$havoc_ref()
(declare-const ret@263@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _34 := builtin$havoc_ref()
(declare-const ret@264@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t13 := builtin$havoc_bool()
(declare-const ret@265@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t14 := builtin$havoc_bool()
(declare-const ret@266@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t15 := builtin$havoc_bool()
(declare-const ret@267@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t16 := builtin$havoc_bool()
(declare-const ret@268@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t17 := builtin$havoc_bool()
(declare-const ret@269@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t18 := builtin$havoc_bool()
(declare-const ret@270@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t19 := builtin$havoc_bool()
(declare-const ret@271@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t37 := builtin$havoc_bool()
(declare-const ret@272@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t38 := builtin$havoc_bool()
(declare-const ret@273@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t39 := builtin$havoc_bool()
(declare-const ret@274@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t40 := builtin$havoc_bool()
(declare-const ret@275@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t41 := builtin$havoc_bool()
(declare-const ret@276@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t42 := builtin$havoc_bool()
(declare-const ret@277@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(i32(_2), write) &&
;   (acc(i32(_24), write) && acc(i32(_1), read$()))
(declare-const $t@278@01 $Snap)
(assert (= $t@278@01 ($Snap.combine ($Snap.first $t@278@01) ($Snap.second $t@278@01))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@257@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@278@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@278@01))
    ($Snap.second ($Snap.second $t@278@01)))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@257@01 ret@258@01)))
(check-sat)
; unknown
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
(declare-const $t@279@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
    (= $t@279@01 $t@229@01))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (= $t@279@01 ($Snap.second ($Snap.second $t@278@01))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@280@01 $Snap)
(assert (= $t@280@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; __t13 := true
; [exec]
; __t14 := true
; [exec]
; _27 := builtin$havoc_int()
(declare-const ret@281@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_24), write)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@101@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@184@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@258@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.first ($Snap.second $t@278@01)) ret@258@01))
; [exec]
; _27 := _24.val_int
(declare-const _27@282@01 Int)
(assert (= _27@282@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@278@01)))))
; [exec]
; label l22
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@283@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 8
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
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
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
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@188@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@184@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@101@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@94@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@258@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger $t@279@01 _1@51@01))
; [exec]
; _28 := _1.val_int
(declare-const _28@284@01 Int)
(assert (= _28@284@01 ($SortWrappers.$SnapToInt $t@279@01)))
; [exec]
; label l23
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@285@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_26.val_bool, write)
(declare-const $t@286@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@285@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _26.val_bool := _27 < _28
; [eval] _27 < _28
(declare-const val_bool@287@01 Bool)
(assert (= val_bool@287@01 (< _27@282@01 _28@284@01)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t37 := _26.val_bool
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not val_bool@287@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not val_bool@287@01))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 5 | val_bool@287@01 | live]
; [else-branch: 5 | !(val_bool@287@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 5 | val_bool@287@01]
(assert val_bool@287@01)
; [exec]
; label loop1_group2a_bb1
; [exec]
; __t15 := true
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@288@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.val_bool, write)
(declare-const $t@289@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@288@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _30.val_bool := false
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t38 := _30.val_bool
; [exec]
; inhale _1.val_int ==
;   old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
(declare-const $t@290@01 $Snap)
(assert (= $t@290@01 $Snap.unit))
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (= ($SortWrappers.$SnapToInt $t@279@01) $t@74@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t16 := true
; [exec]
; __t17 := true
; [exec]
; _33 := builtin$havoc_ref()
(declare-const ret@291@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_33.tuple_0, write)
(declare-const $t@292@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@291@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@291@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@291@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_33.tuple_0.val_int, write)
(declare-const $t@293@01 Int)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@51@01 $t@292@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@292@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@184@01 $t@292@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@101@01 $t@292@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@94@01 $t@292@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 $t@292@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@292@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_33.tuple_1, write)
(declare-const $t@294@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@291@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@291@01)))
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
; inhale acc(_33.tuple_1.val_bool, write)
(declare-const $t@295@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@288@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@244@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@165@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@162@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@86@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@83@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@182@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@235@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@238@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@294@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_2), write)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 ret@257@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@257@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@101@01 ret@257@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@184@01 ret@257@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@257@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@257@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@292@01 ret@257@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@257@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (i32%trigger ($Snap.first $t@278@01) ret@257@01))
; [exec]
; _33.tuple_0.val_int := _2.val_int + 1
; [eval] _2.val_int + 1
(declare-const val_int@296@01 Int)
(assert (= val_int@296@01 (+ ($SortWrappers.$SnapToInt ($Snap.first $t@278@01)) 1)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@51@01 $t@292@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@292@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@184@01 $t@292@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@101@01 $t@292@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@94@01 $t@292@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 $t@292@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@257@01 $t@292@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; _33.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@238@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@235@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@182@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@83@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@86@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@162@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@165@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@244@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@288@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t39 := _33.tuple_1.val_bool
; [exec]
; assert !__t39
; [eval] !__t39
; [exec]
; __t18 := true
; [exec]
; _2 := _33.tuple_0
; [exec]
; label l26
; [exec]
; _34 := builtin$havoc_ref()
(declare-const ret@297@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_34.tuple_0, write)
(declare-const $t@298@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@297@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@297@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@291@01 ret@297@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@297@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_34.tuple_0.val_int, write)
(declare-const $t@299@01 Int)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@257@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@94@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@101@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@184@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@51@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@292@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@298@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_34.tuple_1, write)
(declare-const $t@300@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@297@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@297@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@291@01 ret@297@01)))
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
; inhale acc(_34.tuple_1.val_bool, write)
(declare-const $t@301@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@294@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@238@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@235@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@182@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@83@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@86@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@162@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@165@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@244@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@288@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@300@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _34.tuple_0.val_int := _24.val_int + 1
; [eval] _24.val_int + 1
(declare-const val_int@302@01 Int)
(assert (=
  val_int@302@01
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@278@01))) 1)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@292@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@51@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@184@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@101@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@94@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@257@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; _34.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@294@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@238@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@235@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@182@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@83@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@86@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@162@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@165@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@244@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@288@01 $t@300@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t40 := _34.tuple_1.val_bool
; [exec]
; assert !__t40
; [eval] !__t40
; [exec]
; __t19 := true
; [exec]
; _24 := _34.tuple_0
; [exec]
; label l27
; [exec]
; __t13 := true
; [exec]
; __t14 := true
; [exec]
; _27 := builtin$havoc_int()
(declare-const ret@303@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _27 := _24.val_int
; [exec]
; label l28
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@304@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _28 := _1.val_int
(declare-const _28@305@01 Int)
(assert (= _28@305@01 ($SortWrappers.$SnapToInt $t@279@01)))
; [exec]
; label l29
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@306@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_26.val_bool, write)
(declare-const $t@307@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@288@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@294@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@300@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@306@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _26.val_bool := _27 < _28
; [eval] _27 < _28
(declare-const val_bool@308@01 Bool)
(assert (= val_bool@308@01 (< val_int@302@01 _28@305@01)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@300@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@294@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@288@01 ret@306@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t41 := _26.val_bool
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not val_bool@308@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not val_bool@308@01))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | val_bool@308@01 | live]
; [else-branch: 6 | !(val_bool@308@01) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 6 | val_bool@308@01]
(assert val_bool@308@01)
; [exec]
; label loop1_group3_loop8_group1_bb8
; [exec]
; __t15 := true
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@309@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_30.val_bool, write)
(declare-const $t@310@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@288@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@294@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@300@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@306@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@309@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _30.val_bool := false
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@306@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@300@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@294@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@288@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t42 := _30.val_bool
; [exec]
; fold acc(i32(_2), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@296@01) $t@292@01))
; [exec]
; fold acc(i32(_24), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@302@01) $t@298@01))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@292@01 $t@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@292@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@298@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_1), write) in
;     _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)))
(set-option :timeout 0)
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@257@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@258@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@94@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@101@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@184@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@188@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(pop) ; 10
; Joined path conditions
; [exec]
; assert true
; [exec]
; exhale acc(i32(_2), write) &&
;   (acc(i32(_24), write) && acc(i32(_1), read$()))
; [eval] read$()
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
; inhale false
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 6 | !(val_bool@308@01)]
(assert (not val_bool@308@01))
(pop) ; 9
; [eval] !__t41
(push) ; 9
(set-option :timeout 10)
(assert (not val_bool@308@01))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not val_bool@308@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 7 | !(val_bool@308@01) | live]
; [else-branch: 7 | val_bool@308@01 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 7 | !(val_bool@308@01)]
(assert (not val_bool@308@01))
; [exec]
; label loop1_group2a_bb2
; [exec]
; label l6
; [exec]
; __t20 := true
; [exec]
; _38 := builtin$havoc_ref()
(declare-const ret@311@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_38.tuple_0, write)
(declare-const $t@312@01 $Ref)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@297@01 ret@311@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@311@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@311@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@291@01 ret@311@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@311@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_38.tuple_0.val_int, write)
(declare-const $t@313@01 Int)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@257@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@258@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@94@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@101@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@184@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@51@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@292@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@298@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@312@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_38.tuple_1, write)
(declare-const $t@314@01 $Ref)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@297@01 ret@311@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@311@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@311@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@291@01 ret@311@01)))
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
; inhale acc(_38.tuple_1.val_bool, write)
(declare-const $t@315@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@306@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@300@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@294@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@238@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@235@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@182@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@83@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@86@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@162@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@165@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@244@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@252@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@255@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@288@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@314@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _38.tuple_0.val_int := _14.val_int + 1
; [eval] _14.val_int + 1
(declare-const val_int@316@01 Int)
(assert (=
  val_int@316@01
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@228@01))) 1)))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@298@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@292@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@51@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@184@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@101@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@94@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@258@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@257@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; _38.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@306@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@300@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@294@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@238@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@235@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@182@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@83@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@86@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@162@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@165@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@244@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@252@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@255@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@288@01 $t@314@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t43 := _38.tuple_1.val_bool
; [exec]
; assert !__t43
; [eval] !__t43
; [exec]
; __t21 := true
; [exec]
; _14 := _38.tuple_0
; [exec]
; label l32
; [exec]
; __t7 := true
; [exec]
; __t8 := true
; [exec]
; _17 := builtin$havoc_int()
(declare-const ret@317@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _17 := _14.val_int
; [exec]
; label l33
; [exec]
; _18 := builtin$havoc_int()
(declare-const ret@318@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _18 := _1.val_int
(declare-const _18@319@01 Int)
(assert (= _18@319@01 ($SortWrappers.$SnapToInt $t@279@01)))
; [exec]
; label l34
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@320@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_16.val_bool, write)
(declare-const $t@321@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@288@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@294@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@300@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@306@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@314@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@320@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.val_bool := _17 < _18
; [eval] _17 < _18
(declare-const val_bool@322@01 Bool)
(assert (= val_bool@322@01 (< val_int@316@01 _18@319@01)))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@314@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@306@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@300@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@294@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@288@01 ret@320@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t44 := _16.val_bool
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@322@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not val_bool@322@01))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 8 | val_bool@322@01 | live]
; [else-branch: 8 | !(val_bool@322@01) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 8 | val_bool@322@01]
(assert val_bool@322@01)
; [exec]
; label loop1_group3_loop8_start
; [exec]
; __t9 := true
; [exec]
; _20 := builtin$havoc_ref()
(declare-const ret@323@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_20.val_bool, write)
(declare-const $t@324@01 Bool)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@288@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@294@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@300@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@306@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@314@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@320@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@323@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _20.val_bool := false
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@320@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@314@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@306@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@300@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@294@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@288@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t45 := _20.val_bool
; [exec]
; fold acc(i32(_2), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@296@01) $t@292@01))
; [exec]
; fold acc(i32(_14), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@316@01) $t@312@01))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@292@01 $t@312@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; [exec]
; fold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@292@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@312@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_1), write) in
;     _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)))
(set-option :timeout 0)
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@257@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@258@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@94@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@101@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@184@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@188@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@298@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(pop) ; 11
; Joined path conditions
; [exec]
; assert true
; [exec]
; exhale acc(i32(_2), write) &&
;   (acc(i32(_14), write) && acc(i32(_1), read$()))
; [eval] read$()
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale false
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 8 | !(val_bool@322@01)]
(assert (not val_bool@322@01))
(pop) ; 10
; [eval] !__t44
(push) ; 10
(set-option :timeout 10)
(assert (not val_bool@322@01))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@322@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 9 | !(val_bool@322@01) | live]
; [else-branch: 9 | val_bool@322@01 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 9 | !(val_bool@322@01)]
(assert (not val_bool@322@01))
; [exec]
; label l7
; [exec]
; label loop1_group2b_bb3
; [exec]
; __t22 := true
; [exec]
; _42 := builtin$havoc_ref()
(declare-const ret@325@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_42.tuple_0, write)
(declare-const $t@326@01 $Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@311@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@297@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@291@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@325@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_42.tuple_0.val_int, write)
(declare-const $t@327@01 Int)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@257@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@258@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@94@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@101@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@184@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= _1@51@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@292@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@298@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@312@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@326@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_42.tuple_1, write)
(declare-const $t@328@01 $Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@311@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@297@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@291@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_42.tuple_1.val_bool, write)
(declare-const $t@329@01 Bool)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@320@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@314@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@306@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@300@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@294@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@238@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@235@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@182@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@83@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@86@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@162@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@165@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@244@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@252@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@255@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@288@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@328@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _42.tuple_0.val_int := _3.val_int + 1
; [eval] _3.val_int + 1
(declare-const val_int@330@01 Int)
(assert (=
  val_int@330@01
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@155@01))) 1)))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@312@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@298@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@292@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= _1@51@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@188@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@184@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@101@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@94@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@258@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@257@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; _42.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@320@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@314@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@306@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@300@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@294@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@238@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@235@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@182@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@179@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@171@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@83@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@86@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@162@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@165@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@244@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@252@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@255@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@288@01 $t@328@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t46 := _42.tuple_1.val_bool
; [exec]
; assert !__t46
; [eval] !__t46
; [exec]
; __t23 := true
; [exec]
; _3 := _42.tuple_0
; [exec]
; label l37
; [exec]
; __t1 := true
; [exec]
; __t2 := true
; [exec]
; _7 := builtin$havoc_int()
(declare-const ret@331@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _7 := _3.val_int
; [exec]
; label l38
; [exec]
; _8 := builtin$havoc_int()
(declare-const ret@332@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _8 := _1.val_int
(declare-const _8@333@01 Int)
(assert (= _8@333@01 ($SortWrappers.$SnapToInt $t@279@01)))
; [exec]
; label l39
; [exec]
; _6 := builtin$havoc_ref()
(declare-const ret@334@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_6.val_bool, write)
(declare-const $t@335@01 Bool)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@288@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@294@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@300@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@306@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@314@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@320@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@328@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@334@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _6.val_bool := _7 < _8
; [eval] _7 < _8
(declare-const val_bool@336@01 Bool)
(assert (= val_bool@336@01 (< val_int@330@01 _8@333@01)))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@328@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@320@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@314@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@306@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@300@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@294@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@288@01 ret@334@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t47 := _6.val_bool
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not val_bool@336@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not val_bool@336@01))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 10 | val_bool@336@01 | live]
; [else-branch: 10 | !(val_bool@336@01) | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 10 | val_bool@336@01]
(assert val_bool@336@01)
; [exec]
; label loop1_group3_bb7
; [exec]
; __t3 := true
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@337@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_10.val_bool, write)
(declare-const $t@338@01 Bool)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@288@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@294@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@300@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@306@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@314@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@320@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@328@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@334@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@337@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _10.val_bool := false
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@334@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@328@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@320@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@314@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@306@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@300@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@294@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@238@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@235@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@179@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@171@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@83@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@86@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@162@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@165@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@244@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@288@01 ret@337@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t48 := _10.val_bool
; [exec]
; fold acc(i32(_2), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@296@01) $t@292@01))
; [exec]
; fold acc(i32(_3), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@330@01) $t@326@01))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@292@01 $t@326@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(i32(_1), write)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@292@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@326@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert (unfolding acc(i32(_1), write) in
;     _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int)))
(set-option :timeout 0)
(push) ; 12
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@257@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@258@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@94@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@101@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@184@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= ret@188@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@298@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= $t@312@01 _1@51@01)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] _1.val_int == old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(i32(_1), write) in _1.val_int))
; [eval] (unfolding acc(i32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 13
(pop) ; 13
; Joined path conditions
(pop) ; 12
; Joined path conditions
; [exec]
; assert true
; [exec]
; exhale acc(i32(_2), write) &&
;   (acc(i32(_3), write) && acc(i32(_1), read$()))
; [eval] read$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale false
(pop) ; 11
(set-option :timeout 0)
(push) ; 11
; [else-branch: 10 | !(val_bool@336@01)]
(assert (not val_bool@336@01))
(pop) ; 11
; [eval] !__t47
(push) ; 11
(set-option :timeout 10)
(assert (not val_bool@336@01))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not val_bool@336@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 11 | !(val_bool@336@01) | live]
; [else-branch: 11 | val_bool@336@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 11 | !(val_bool@336@01)]
(assert (not val_bool@336@01))
; [exec]
; label loop1_group3_bb5
; [exec]
; label loop1_group3_bb6
; [exec]
; __t24 := true
; [exec]
; _0 := builtin$havoc_ref()
(declare-const ret@339@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_0.val_int, write)
(declare-const $t@340@01 Int)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@326@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@312@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@298@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@292@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@184@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@101@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@258@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@257@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@339@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _0.val_int := _2.val_int
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@257@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@258@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@94@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@101@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@184@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@292@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@298@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@312@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= $t@326@01 ret@339@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l42
; [exec]
; label l44
; [exec]
; fold acc(i32(_0), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@296@01) ret@339@01))
; [exec]
; assert true
; [exec]
; exhale acc(i32(_0), write)
; [exec]
; label end_of_method
(pop) ; 11
(set-option :timeout 0)
(push) ; 11
; [else-branch: 11 | val_bool@336@01]
(assert val_bool@336@01)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 9 | val_bool@322@01]
(assert val_bool@322@01)
(pop) ; 10
(pop) ; 9
(push) ; 9
; [else-branch: 7 | val_bool@308@01]
(assert val_bool@308@01)
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 5 | !(val_bool@287@01)]
(assert (not val_bool@287@01))
(pop) ; 8
; [eval] !__t37
(push) ; 8
(set-option :timeout 10)
(assert (not val_bool@287@01))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not val_bool@287@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 12 | !(val_bool@287@01) | live]
; [else-branch: 12 | val_bool@287@01 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 12 | !(val_bool@287@01)]
(assert (not val_bool@287@01))
; [exec]
; label loop1_inv_post_fnspc
; [exec]
; label end_of_method
(pop) ; 8
(push) ; 8
; [else-branch: 12 | val_bool@287@01]
(assert val_bool@287@01)
(pop) ; 8
(pop) ; 7
; [eval] !__t35
(push) ; 7
(set-option :timeout 10)
(assert (not val_bool@254@01))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | !(val_bool@254@01) | dead]
; [else-branch: 13 | val_bool@254@01 | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 13 | val_bool@254@01]
(assert val_bool@254@01)
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 3 | !(val_bool@237@01)]
(assert (not val_bool@237@01))
(pop) ; 6
; [eval] !__t32
(push) ; 6
(set-option :timeout 10)
(assert (not val_bool@237@01))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@237@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 14 | !(val_bool@237@01) | live]
; [else-branch: 14 | val_bool@237@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 14 | !(val_bool@237@01)]
(assert (not val_bool@237@01))
; [exec]
; label l3
; [exec]
; label end_of_method
(pop) ; 6
(push) ; 6
; [else-branch: 14 | val_bool@237@01]
(assert val_bool@237@01)
(pop) ; 6
(pop) ; 5
; [eval] !__t30
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@181@01))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 15 | !(val_bool@181@01) | dead]
; [else-branch: 15 | val_bool@181@01 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 15 | val_bool@181@01]
(assert val_bool@181@01)
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(val_bool@164@01)]
(assert (not val_bool@164@01))
(pop) ; 4
; [eval] !__t27
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@164@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@164@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 16 | !(val_bool@164@01) | live]
; [else-branch: 16 | val_bool@164@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | !(val_bool@164@01)]
(assert (not val_bool@164@01))
; [exec]
; label loop1_start
; [exec]
; label end_of_method
(pop) ; 4
(push) ; 4
; [else-branch: 16 | val_bool@164@01]
(assert val_bool@164@01)
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(val_bool@85@01)]
(assert (not val_bool@85@01))
(pop) ; 3
; [eval] !__t25
(push) ; 3
(set-option :timeout 10)
(assert (not val_bool@85@01))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not val_bool@85@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 17 | !(val_bool@85@01) | live]
; [else-branch: 17 | val_bool@85@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 17 | !(val_bool@85@01)]
(assert (not val_bool@85@01))
; [exec]
; label return
; [exec]
; label loop1_group3_bb6
; [exec]
; __t24 := true
; [exec]
; _0 := builtin$havoc_ref()
(declare-const ret@341@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_0.val_int, write)
(declare-const $t@342@01 Int)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@341@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@77@01 ret@341@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@341@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@341@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _0.val_int := _2.val_int
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@51@01 ret@341@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@77@01 ret@341@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@341@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l42
; [exec]
; label l44
; [exec]
; fold acc(i32(_0), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap 0) ret@341@01))
; [exec]
; assert true
; [exec]
; exhale acc(i32(_0), write)
; [exec]
; label end_of_method
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 17 | val_bool@85@01]
(assert val_bool@85@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_bool ----------
(declare-const ret@343@01 Bool)
(declare-const ret@344@01 Bool)
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
(declare-const ret@345@01 Int)
(declare-const ret@346@01 Int)
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
(declare-const ret@347@01 $Ref)
(declare-const ret@348@01 $Ref)
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
