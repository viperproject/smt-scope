(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:21:47
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._loop-invs_._tmp_in_loop_condition_._tmp_in_loop_condition.rs_tmp_in_loop_condition--test-Both.vpr
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
(declare-fun bool%trigger ($Snap $Ref) Bool)
(declare-fun raw_ref$u8%trigger ($Snap $Ref) Bool)
(declare-fun struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global%trigger ($Snap $Ref) Bool)
(declare-fun tuple0$%trigger ($Snap $Ref) Bool)
(declare-fun u32%trigger ($Snap $Ref) Bool)
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
; var _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global: Ref
(declare-const _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global@34@01 $Ref)
; [exec]
; var _aux_havoc_u32: Ref
(declare-const _aux_havoc_u32@35@01 $Ref)
; [exec]
; var __t32: Bool
(declare-const __t32@36@01 Bool)
; [exec]
; var __t33: Bool
(declare-const __t33@37@01 Bool)
; [exec]
; var __t34: Bool
(declare-const __t34@38@01 Bool)
; [exec]
; var __t35: Bool
(declare-const __t35@39@01 Bool)
; [exec]
; var _1: Ref
(declare-const _1@40@01 $Ref)
; [exec]
; var _2: Int
(declare-const _2@41@01 Int)
; [exec]
; var _3: Int
(declare-const _3@42@01 Int)
; [exec]
; var _4: Ref
(declare-const _4@43@01 $Ref)
; [exec]
; var _5: Ref
(declare-const _5@44@01 $Ref)
; [exec]
; var _6: Int
(declare-const _6@45@01 Int)
; [exec]
; var _7: Int
(declare-const _7@46@01 Int)
; [exec]
; var _8: Ref
(declare-const _8@47@01 $Ref)
; [exec]
; var _9: Ref
(declare-const _9@48@01 $Ref)
; [exec]
; var _10: Ref
(declare-const _10@49@01 $Ref)
; [exec]
; var _11: Ref
(declare-const _11@50@01 $Ref)
; [exec]
; var _14: Ref
(declare-const _14@51@01 $Ref)
; [exec]
; var _15: Ref
(declare-const _15@52@01 $Ref)
; [exec]
; var _16: Ref
(declare-const _16@53@01 $Ref)
; [exec]
; var _17: Ref
(declare-const _17@54@01 $Ref)
; [exec]
; var _18: Int
(declare-const _18@55@01 Int)
; [exec]
; var _19: Int
(declare-const _19@56@01 Int)
; [exec]
; var _20: Ref
(declare-const _20@57@01 $Ref)
; [exec]
; var _21: Ref
(declare-const _21@58@01 $Ref)
; [exec]
; var _22: Int
(declare-const _22@59@01 Int)
; [exec]
; var _23: Int
(declare-const _23@60@01 Int)
; [exec]
; var _24: Ref
(declare-const _24@61@01 $Ref)
; [exec]
; var _25: Ref
(declare-const _25@62@01 $Ref)
; [exec]
; var _26: Ref
(declare-const _26@63@01 $Ref)
; [exec]
; var _27: Ref
(declare-const _27@64@01 $Ref)
; [exec]
; var _28: Ref
(declare-const _28@65@01 $Ref)
; [exec]
; var _29: Int
(declare-const _29@66@01 Int)
; [exec]
; var _30: Int
(declare-const _30@67@01 Int)
; [exec]
; var _31: Ref
(declare-const _31@68@01 $Ref)
; [exec]
; var _32: Ref
(declare-const _32@69@01 $Ref)
; [exec]
; var _33: Int
(declare-const _33@70@01 Int)
; [exec]
; var _34: Int
(declare-const _34@71@01 Int)
; [exec]
; var _35: Ref
(declare-const _35@72@01 $Ref)
; [exec]
; var _36: Ref
(declare-const _36@73@01 $Ref)
; [exec]
; var _37: Ref
(declare-const _37@74@01 $Ref)
; [exec]
; var _38: Ref
(declare-const _38@75@01 $Ref)
; [exec]
; var _42: Ref
(declare-const _42@76@01 $Ref)
; [exec]
; var _43: Int
(declare-const _43@77@01 Int)
; [exec]
; var _44: Int
(declare-const _44@78@01 Int)
; [exec]
; var _45: Ref
(declare-const _45@79@01 $Ref)
; [exec]
; var _46: Ref
(declare-const _46@80@01 $Ref)
; [exec]
; var _47: Int
(declare-const _47@81@01 Int)
; [exec]
; var _48: Int
(declare-const _48@82@01 Int)
; [exec]
; var _49: Ref
(declare-const _49@83@01 $Ref)
; [exec]
; var _50: Ref
(declare-const _50@84@01 $Ref)
; [exec]
; var _51: Ref
(declare-const _51@85@01 $Ref)
; [exec]
; var _52: Ref
(declare-const _52@86@01 $Ref)
; [exec]
; var _54: Ref
(declare-const _54@87@01 $Ref)
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
; label pre
; [exec]
; __t0 := true
; [exec]
; _2 := builtin$havoc_int()
(declare-const ret@88@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _2 := 8
; [exec]
; _3 := builtin$havoc_int()
(declare-const ret@89@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _3 := 8
; [exec]
; label l0
; [exec]
; assert true
; [exec]
; assert _2 >= 0
; [eval] _2 >= 0
; [exec]
; assert _3 >= 0
; [eval] _3 >= 0
; [exec]
; exhale _2 >= 0 && _3 >= 0
; [eval] _2 >= 0
; [eval] _3 >= 0
; [exec]
; _4 := builtin$havoc_ref()
(declare-const ret@90@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_4), write)
(declare-const $t@91@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@92@01 $Snap)
(assert (= $t@92@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l1
; [exec]
; __t1 := true
; [exec]
; _5 := builtin$havoc_ref()
(declare-const ret@93@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_5.val_ref, write)
(declare-const $t@94@01 $Ref)
(assert (not (= ret@93@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global := builtin$havoc_ref()
(declare-const ret@95@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _5.val_ref := _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global
; [exec]
; inhale acc(struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global(_5.val_ref), write)
(declare-const $t@96@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _6 := builtin$havoc_int()
(declare-const ret@97@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _6 := 4
; [exec]
; _7 := builtin$havoc_int()
(declare-const ret@98@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _7 := 4
; [exec]
; label l2
; [exec]
; assert true
; [exec]
; assert _6 >= 0
; [eval] _6 >= 0
; [exec]
; assert _7 >= 0
; [eval] _7 >= 0
; [exec]
; exhale _6 >= 0 && _7 >= 0
; [eval] _6 >= 0
; [eval] _7 >= 0
; [exec]
; _8 := builtin$havoc_ref()
(declare-const ret@99@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_8), write)
(declare-const $t@100@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@99@01)))
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
(declare-const $t@101@01 $Snap)
(assert (= $t@101@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l3
; [exec]
; __t2 := true
; [exec]
; _9 := builtin$havoc_ref()
(declare-const ret@102@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_9.val_ref, write)
(declare-const $t@103@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@102@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@102@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@104@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _9.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@102@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_9.val_ref), write)
(declare-const $t@105@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l4
; [exec]
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@106@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _9.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@102@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_9.val_ref), write)
(declare-const $t@107@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@106@01)))
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
(declare-const $t@108@01 $Snap)
(assert (= $t@108@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l5
; [exec]
; __t3 := true
; [exec]
; _5.val_ref := _9
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@93@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l6
; [exec]
; __t4 := true
; [exec]
; _1 := _5
; [exec]
; label l7
; [exec]
; __t5 := true
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@109@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_10.val_ref, write)
(declare-const $t@110@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@109@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _10.val_ref := _1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(_1.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(assert (read$%precondition $Snap.unit))
(pop) ; 3
; Joined path conditions
(assert (read$%precondition $Snap.unit))
(push) ; 3
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))))
(assert (<=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@93@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_10.val_ref.val_ref, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@111@01 $Ref)
(declare-const $t@112@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@112@01 ret@102@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@112@01 $t@111@01))))
(assert (<=
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit))))
(assert (<=
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@93@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(_1.val_ref.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@112@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@112@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@102@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_10.val_ref.val_ref.val_ref, read$())
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@113@01 $Ref)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@112@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@114@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@114@01 ret@106@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@114@01 $t@113@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@102@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(u32(_1.val_ref.val_ref), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@112@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@114@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@106@01 $t@114@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_10.val_ref.val_ref.val_ref), read$())
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@112@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@115@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@106@01 $t@114@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@116@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@116@01 $t@107@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@116@01 $t@115@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l8
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | True | live]
; [else-branch: 0 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | True]
; [exec]
; exhale acc(u32(_10.val_ref.val_ref.val_ref), read$())
; [eval] read$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@112@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@112@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@112@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@106@01 $t@114@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
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
; exhale acc(_10.val_ref.val_ref.val_ref, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@112@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@112@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@112@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@102@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
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
; exhale acc(_10.val_ref.val_ref, read$())
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
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@93@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
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
; inhale acc(_1.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@117@01 $Ref)
(declare-const $t@118@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@118@01 $t@112@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@118@01 $t@117@01))))
(assert (<=
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit)))))
(assert (<=
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@93@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_1.val_ref.val_ref, write - read$())
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@119@01 $Ref)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@118@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@118@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@120@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@120@01 $t@114@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@120@01 $t@119@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@102@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(u32(_1.val_ref.val_ref), write - read$())
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@118@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@121@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@106@01 $t@120@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@122@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@122@01 $t@116@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@122@01 $t@121@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _11 := builtin$havoc_ref()
(declare-const ret@123@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_11.val_ref, write)
(declare-const $t@124@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@123@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@123@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@123@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@123@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _11.val_ref := _1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@123@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@123@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@123@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l9
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; label l10
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@125@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(u32(_16), write)
(declare-const $t@126@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@125@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@125@01)))
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
; inhale true
(declare-const $t@127@01 $Snap)
(assert (= $t@127@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l11
; [exec]
; __t8 := true
; [exec]
; _15 := builtin$havoc_ref()
(declare-const ret@128@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_15.val_bool, write)
(declare-const $t@129@01 Bool)
(assert (not (= ret@128@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(u32(_16), write)
(assert (= $t@126@01 ($Snap.combine ($Snap.first $t@126@01) ($Snap.second $t@126@01))))
(assert (not (= ret@125@01 $Ref.null)))
(assert (= ($Snap.second $t@126@01) $Snap.unit))
; [eval] 0 <= self.val_int
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@126@01))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (u32%trigger $t@126@01 ret@125@01))
; [exec]
; _15.val_bool := _16.val_int < 55
; [eval] _16.val_int < 55
(declare-const val_bool@130@01 Bool)
(assert (= val_bool@130@01 (< ($SortWrappers.$SnapToInt ($Snap.first $t@126@01)) 55)))
; [exec]
; _18 := builtin$havoc_int()
(declare-const ret@131@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _18 := 8
; [exec]
; _19 := builtin$havoc_int()
(declare-const ret@132@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _19 := 8
; [exec]
; label l12
; [exec]
; assert true
; [exec]
; assert _18 >= 0
; [eval] _18 >= 0
; [exec]
; assert _19 >= 0
; [eval] _19 >= 0
; [exec]
; exhale _18 >= 0 && _19 >= 0
; [eval] _18 >= 0
; [eval] _19 >= 0
; [exec]
; _20 := builtin$havoc_ref()
(declare-const ret@133@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_20), write)
(declare-const $t@134@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@133@01)))
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
; inhale true
(declare-const $t@135@01 $Snap)
(assert (= $t@135@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l13
; [exec]
; __t9 := true
; [exec]
; _21 := builtin$havoc_ref()
(declare-const ret@136@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_21.val_ref, write)
(declare-const $t@137@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@136@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global := builtin$havoc_ref()
(declare-const ret@138@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _21.val_ref := _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global(_21.val_ref), write)
(declare-const $t@139@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@95@01 ret@138@01)))
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
; _22 := builtin$havoc_int()
(declare-const ret@140@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _22 := 4
; [exec]
; _23 := builtin$havoc_int()
(declare-const ret@141@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _23 := 4
; [exec]
; label l14
; [exec]
; assert true
; [exec]
; assert _22 >= 0
; [eval] _22 >= 0
; [exec]
; assert _23 >= 0
; [eval] _23 >= 0
; [exec]
; exhale _22 >= 0 && _23 >= 0
; [eval] _22 >= 0
; [eval] _23 >= 0
; [exec]
; _24 := builtin$havoc_ref()
(declare-const ret@142@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_24), write)
(declare-const $t@143@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@142@01)))
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
; inhale true
(declare-const $t@144@01 $Snap)
(assert (= $t@144@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l15
; [exec]
; __t10 := true
; [exec]
; _25 := builtin$havoc_ref()
(declare-const ret@145@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_25.val_ref, write)
(declare-const $t@146@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@145@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@147@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _25.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_25.val_ref), write)
(declare-const $t@148@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@147@01)))
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
; label l16
; [exec]
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@149@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _25.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@145@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_25.val_ref), write)
(declare-const $t@150@01 $Snap)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@149@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@149@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@149@01)))
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
; inhale true
(declare-const $t@151@01 $Snap)
(assert (= $t@151@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l17
; [exec]
; __t11 := true
; [exec]
; _21.val_ref := _25
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l18
; [exec]
; __t12 := true
; [exec]
; _17 := _21
; [exec]
; label l19
; [exec]
; __t13 := true
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@152@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_26.val_ref, write)
(declare-const $t@153@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@152@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@152@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@152@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@152@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@152@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@152@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@152@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _26.val_ref := _17
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@152@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@152@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@152@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@152@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@152@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@152@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(_17.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@136@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_26.val_ref.val_ref, read$())
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
(declare-const $t@154@01 $Ref)
(declare-const $t@155@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@155@01 ret@145@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@155@01 $t@154@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@136@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(_17.val_ref.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@155@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@145@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_26.val_ref.val_ref.val_ref, read$())
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
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
(declare-const $t@156@01 $Ref)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@155@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@157@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@157@01 ret@149@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@157@01 $t@156@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@145@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(u32(_17.val_ref.val_ref), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@155@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@157@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@106@01 $t@157@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@147@01 $t@157@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@149@01 $t@157@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_26.val_ref.val_ref.val_ref), read$())
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@155@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
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
(declare-const $t@158@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@149@01 $t@157@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $t@159@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@159@01 $t@150@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@159@01 $t@158@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l20
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 1 | True | live]
; [else-branch: 1 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | True]
; [exec]
; exhale acc(u32(_26.val_ref.val_ref.val_ref), read$())
; [eval] read$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@155@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@149@01 $t@157@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(_26.val_ref.val_ref.val_ref, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@155@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@155@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@145@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(_26.val_ref.val_ref, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@136@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_17.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@160@01 $Ref)
(declare-const $t@161@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@161@01 $t@155@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@161@01 $t@160@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@136@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_17.val_ref.val_ref, write - read$())
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@162@01 $Ref)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@161@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@163@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@163@01 $t@157@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@163@01 $t@162@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@145@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(u32(_17.val_ref.val_ref), write - read$())
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@161@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@164@01 $Snap)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@149@01 $t@163@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@165@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@165@01 $t@159@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@165@01 $t@164@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@166@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_27.val_ref, write)
(declare-const $t@167@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@166@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27.val_ref := _17
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@166@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l21
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@168@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_14.val_bool, write)
(declare-const $t@169@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@168@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@168@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _14.val_bool := _15.val_bool
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@168@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l22
; [exec]
; __t14 := true
; [exec]
; __t32 := _14.val_bool
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@130@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@130@01))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | val_bool@130@01 | live]
; [else-branch: 2 | !(val_bool@130@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | val_bool@130@01]
(assert val_bool@130@01)
; [exec]
; label bb0
; [exec]
; fold acc(bool(_15), write)
(assert (bool%trigger ($SortWrappers.BoolTo$Snap val_bool@130@01) ret@128@01))
; [exec]
; fold acc(bool(_14), write)
(assert (bool%trigger ($SortWrappers.BoolTo$Snap val_bool@130@01) ret@168@01))
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@168@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert true
; [exec]
; exhale acc(bool(_15), write) &&
;   (acc(raw_ref$u8(_20), write) &&
;   (acc(raw_ref$u8(_24), write) && acc(bool(_14), write)))
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@170@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _15 := builtin$havoc_ref()
(declare-const ret@171@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@172@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _17 := builtin$havoc_ref()
(declare-const ret@173@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _18 := builtin$havoc_int()
(declare-const ret@174@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _19 := builtin$havoc_int()
(declare-const ret@175@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _20 := builtin$havoc_ref()
(declare-const ret@176@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _21 := builtin$havoc_ref()
(declare-const ret@177@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _22 := builtin$havoc_int()
(declare-const ret@178@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _23 := builtin$havoc_int()
(declare-const ret@179@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _24 := builtin$havoc_ref()
(declare-const ret@180@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _25 := builtin$havoc_ref()
(declare-const ret@181@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@182@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@183@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _28 := builtin$havoc_ref()
(declare-const ret@184@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _29 := builtin$havoc_int()
(declare-const ret@185@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _30 := builtin$havoc_int()
(declare-const ret@186@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _31 := builtin$havoc_ref()
(declare-const ret@187@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _32 := builtin$havoc_ref()
(declare-const ret@188@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _33 := builtin$havoc_int()
(declare-const ret@189@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _34 := builtin$havoc_int()
(declare-const ret@190@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _35 := builtin$havoc_ref()
(declare-const ret@191@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _36 := builtin$havoc_ref()
(declare-const ret@192@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _37 := builtin$havoc_ref()
(declare-const ret@193@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _38 := builtin$havoc_ref()
(declare-const ret@194@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t10 := builtin$havoc_bool()
(declare-const ret@195@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t11 := builtin$havoc_bool()
(declare-const ret@196@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t12 := builtin$havoc_bool()
(declare-const ret@197@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t13 := builtin$havoc_bool()
(declare-const ret@198@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t14 := builtin$havoc_bool()
(declare-const ret@199@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t15 := builtin$havoc_bool()
(declare-const ret@200@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t16 := builtin$havoc_bool()
(declare-const ret@201@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t17 := builtin$havoc_bool()
(declare-const ret@202@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t18 := builtin$havoc_bool()
(declare-const ret@203@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t19 := builtin$havoc_bool()
(declare-const ret@204@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t20 := builtin$havoc_bool()
(declare-const ret@205@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t21 := builtin$havoc_bool()
(declare-const ret@206@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t33 := builtin$havoc_bool()
(declare-const ret@207@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t34 := builtin$havoc_bool()
(declare-const ret@208@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t6 := builtin$havoc_bool()
(declare-const ret@209@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t7 := builtin$havoc_bool()
(declare-const ret@210@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t8 := builtin$havoc_bool()
(declare-const ret@211@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t9 := builtin$havoc_bool()
(declare-const ret@212@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global := builtin$havoc_ref()
(declare-const ret@213@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@214@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(bool(_15), write) &&
;   (acc(raw_ref$u8(_20), write) &&
;   (acc(raw_ref$u8(_24), write) && acc(bool(_14), write)))
(declare-const $t@215@01 $Snap)
(assert (= $t@215@01 ($Snap.combine ($Snap.first $t@215@01) ($Snap.second $t@215@01))))
(assert (=
  ($Snap.second $t@215@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@215@01))
    ($Snap.second ($Snap.second $t@215@01)))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@215@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@215@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@215@01))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@180@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@180@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@176@01 ret@180@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@170@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@216@01 $Snap)
(assert (= $t@216@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; label l25
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@217@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(u32(_16), write)
(declare-const $t@218@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@217@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@217@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@217@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@217@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@219@01 $Snap)
(assert (= $t@219@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l26
; [exec]
; __t8 := true
; [exec]
; _15 := builtin$havoc_ref()
(declare-const ret@220@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_15.val_bool, write)
(declare-const $t@221@01 Bool)
(assert (not (= ret@220@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(u32(_16), write)
(assert (= $t@218@01 ($Snap.combine ($Snap.first $t@218@01) ($Snap.second $t@218@01))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@125@01 ret@217@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@217@01 $Ref.null)))
(assert (= ($Snap.second $t@218@01) $Snap.unit))
; [eval] 0 <= self.val_int
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@218@01))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (u32%trigger $t@218@01 ret@217@01))
; [exec]
; _15.val_bool := _16.val_int < 55
; [eval] _16.val_int < 55
(declare-const val_bool@222@01 Bool)
(assert (= val_bool@222@01 (< ($SortWrappers.$SnapToInt ($Snap.first $t@218@01)) 55)))
; [exec]
; _18 := builtin$havoc_int()
(declare-const ret@223@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _18 := 8
; [exec]
; _19 := builtin$havoc_int()
(declare-const ret@224@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _19 := 8
; [exec]
; label l27
; [exec]
; inhale true
(declare-const $t@225@01 $Snap)
(assert (= $t@225@01 $Snap.unit))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert _18 >= 0
; [eval] _18 >= 0
; [exec]
; assert _19 >= 0
; [eval] _19 >= 0
; [exec]
; exhale _18 >= 0 && _19 >= 0
; [eval] _18 >= 0
; [eval] _19 >= 0
; [exec]
; _20 := builtin$havoc_ref()
(declare-const ret@226@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_20), write)
(declare-const $t@227@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@180@01 ret@226@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@226@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@226@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@176@01 ret@226@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@228@01 $Snap)
(assert (= $t@228@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l28
; [exec]
; __t9 := true
; [exec]
; _21 := builtin$havoc_ref()
(declare-const ret@229@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_21.val_ref, write)
(declare-const $t@230@01 $Ref)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@229@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global := builtin$havoc_ref()
(declare-const ret@231@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _21.val_ref := _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global(_21.val_ref), write)
(declare-const $t@232@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@95@01 ret@231@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@231@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _22 := builtin$havoc_int()
(declare-const ret@233@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _22 := 4
; [exec]
; _23 := builtin$havoc_int()
(declare-const ret@234@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _23 := 4
; [exec]
; label l29
; [exec]
; inhale true
(declare-const $t@235@01 $Snap)
(assert (= $t@235@01 $Snap.unit))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert _22 >= 0
; [eval] _22 >= 0
; [exec]
; assert _23 >= 0
; [eval] _23 >= 0
; [exec]
; exhale _22 >= 0 && _23 >= 0
; [eval] _22 >= 0
; [eval] _23 >= 0
; [exec]
; _24 := builtin$havoc_ref()
(declare-const ret@236@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_24), write)
(declare-const $t@237@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@226@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@180@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@176@01 ret@236@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@238@01 $Snap)
(assert (= $t@238@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l30
; [exec]
; __t10 := true
; [exec]
; _25 := builtin$havoc_ref()
(declare-const ret@239@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_25.val_ref, write)
(declare-const $t@240@01 $Ref)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@239@01)))
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
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@241@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _25.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_25.val_ref), write)
(declare-const $t@242@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@241@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@241@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@241@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@241@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l31
; [exec]
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@243@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _25.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@239@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_25.val_ref), write)
(declare-const $t@244@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@243@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@243@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@243@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@243@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@243@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@245@01 $Snap)
(assert (= $t@245@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l32
; [exec]
; __t11 := true
; [exec]
; _21.val_ref := _25
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@229@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l33
; [exec]
; __t12 := true
; [exec]
; _17 := _21
; [exec]
; label l34
; [exec]
; __t13 := true
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@246@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_26.val_ref, write)
(declare-const $t@247@01 $Ref)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@246@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _26.val_ref := _17
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@246@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(_17.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@229@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_26.val_ref.val_ref, read$())
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
(declare-const $t@248@01 $Ref)
(declare-const $t@249@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@249@01 ret@239@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@249@01 $t@248@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@229@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(_17.val_ref.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@249@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@239@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_26.val_ref.val_ref.val_ref, read$())
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
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
(declare-const $t@250@01 $Ref)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@249@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@251@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@251@01 ret@243@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@251@01 $t@250@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@239@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(u32(_17.val_ref.val_ref), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@249@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@147@01 $t@251@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@106@01 $t@251@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@251@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@149@01 $t@251@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@241@01 $t@251@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@243@01 $t@251@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_26.val_ref.val_ref.val_ref), read$())
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@249@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
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
(declare-const $t@252@01 $Snap)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@243@01 $t@251@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@253@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@253@01 $t@244@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@253@01 $t@252@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l35
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 3 | True | live]
; [else-branch: 3 | False | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | True]
; [exec]
; exhale acc(u32(_26.val_ref.val_ref.val_ref), read$())
; [eval] read$()
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@249@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@243@01 $t@251@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(_26.val_ref.val_ref.val_ref, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@249@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@249@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@239@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(_26.val_ref.val_ref, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@229@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_17.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@254@01 $Ref)
(declare-const $t@255@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@255@01 $t@249@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@255@01 $t@254@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@229@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_17.val_ref.val_ref, write - read$())
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@256@01 $Ref)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@255@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@255@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@255@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@255@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@255@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@255@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@255@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@255@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@255@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@255@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@257@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@257@01 $t@251@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@257@01 $t@256@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@239@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(u32(_17.val_ref.val_ref), write - read$())
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@255@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@258@01 $Snap)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@243@01 $t@257@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@259@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@259@01 $t@253@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@259@01 $t@258@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@260@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_27.val_ref, write)
(declare-const $t@261@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@260@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27.val_ref := _17
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l36
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@262@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_14.val_bool, write)
(declare-const $t@263@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@220@01 ret@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@262@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _14.val_bool := _15.val_bool
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@220@01 ret@262@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l37
; [exec]
; __t14 := true
; [exec]
; __t33 := _14.val_bool
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not val_bool@222@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not val_bool@222@01))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 4 | val_bool@222@01 | live]
; [else-branch: 4 | !(val_bool@222@01) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 4 | val_bool@222@01]
(assert val_bool@222@01)
; [exec]
; label bb2
; [exec]
; __t15 := true
; [exec]
; _29 := builtin$havoc_int()
(declare-const ret@264@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _29 := 8
; [exec]
; _30 := builtin$havoc_int()
(declare-const ret@265@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _30 := 8
; [exec]
; label l40
; [exec]
; assert true
; [exec]
; assert _29 >= 0
; [eval] _29 >= 0
; [exec]
; assert _30 >= 0
; [eval] _30 >= 0
; [exec]
; exhale _29 >= 0 && _30 >= 0
; [eval] _29 >= 0
; [eval] _30 >= 0
; [exec]
; _31 := builtin$havoc_ref()
(declare-const ret@266@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_31), write)
(declare-const $t@267@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@176@01 ret@266@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@266@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@266@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@180@01 ret@266@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@226@01 ret@266@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@236@01 ret@266@01)))
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
; inhale true
(declare-const $t@268@01 $Snap)
(assert (= $t@268@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l41
; [exec]
; __t16 := true
; [exec]
; _32 := builtin$havoc_ref()
(declare-const ret@269@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_32.val_ref, write)
(declare-const $t@270@01 $Ref)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@269@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global := builtin$havoc_ref()
(declare-const ret@271@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _32.val_ref := _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global(_32.val_ref), write)
(declare-const $t@272@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@95@01 ret@271@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@231@01 ret@271@01)))
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
; _33 := builtin$havoc_int()
(declare-const ret@273@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _33 := 4
; [exec]
; _34 := builtin$havoc_int()
(declare-const ret@274@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _34 := 4
; [exec]
; label l42
; [exec]
; assert true
; [exec]
; assert _33 >= 0
; [eval] _33 >= 0
; [exec]
; assert _34 >= 0
; [eval] _34 >= 0
; [exec]
; exhale _33 >= 0 && _34 >= 0
; [eval] _33 >= 0
; [eval] _34 >= 0
; [exec]
; _35 := builtin$havoc_ref()
(declare-const ret@275@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_35), write)
(declare-const $t@276@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@266@01 ret@275@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@176@01 ret@275@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@275@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@275@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@180@01 ret@275@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@226@01 ret@275@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@236@01 ret@275@01)))
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
; inhale true
(declare-const $t@277@01 $Snap)
(assert (= $t@277@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l43
; [exec]
; __t17 := true
; [exec]
; _36 := builtin$havoc_ref()
(declare-const ret@278@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_36.val_ref, write)
(declare-const $t@279@01 $Ref)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@278@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@280@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _36.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_36.val_ref), write)
(declare-const $t@281@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@243@01 ret@280@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@280@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@280@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@280@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@280@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@280@01)))
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
; label l44
; [exec]
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@282@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _36.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@278@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_36.val_ref), write)
(declare-const $t@283@01 $Snap)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@280@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@243@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@282@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@282@01)))
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
; inhale true
(declare-const $t@284@01 $Snap)
(assert (= $t@284@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l45
; [exec]
; __t18 := true
; [exec]
; _32.val_ref := _36
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l46
; [exec]
; __t19 := true
; [exec]
; _28 := _32
; [exec]
; label l47
; [exec]
; __t20 := true
; [exec]
; _37 := builtin$havoc_ref()
(declare-const ret@285@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_37.val_ref, write)
(declare-const $t@286@01 $Ref)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@285@01)))
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
; _37.val_ref := _28
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@285@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(_28.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@269@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_37.val_ref.val_ref, read$())
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
(declare-const $t@287@01 $Ref)
(declare-const $t@288@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@288@01 ret@278@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@288@01 $t@287@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@269@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(_28.val_ref.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@269@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@288@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@278@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_37.val_ref.val_ref.val_ref, read$())
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
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
(declare-const $t@289@01 $Ref)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@288@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(declare-const $t@290@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@290@01 ret@282@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@290@01 $t@289@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@278@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(u32(_28.val_ref.val_ref), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@288@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@241@01 $t@290@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@149@01 $t@290@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@290@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@106@01 $t@290@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@147@01 $t@290@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@243@01 $t@290@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@280@01 $t@290@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@282@01 $t@290@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_37.val_ref.val_ref.val_ref), read$())
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@288@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
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
(declare-const $t@291@01 $Snap)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@282@01 $t@290@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(declare-const $t@292@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@292@01 $t@283@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@292@01 $t@291@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l48
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 5 | True | live]
; [else-branch: 5 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 5 | True]
; [exec]
; exhale acc(u32(_37.val_ref.val_ref.val_ref), read$())
; [eval] read$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@269@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@288@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@282@01 $t@290@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
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
; exhale acc(_37.val_ref.val_ref.val_ref, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@269@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@288@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@288@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@278@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
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
; exhale acc(_37.val_ref.val_ref, read$())
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
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@269@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
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
; inhale acc(_28.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@293@01 $Ref)
(declare-const $t@294@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@294@01 $t@288@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@294@01 $t@293@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@269@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_28.val_ref.val_ref, write - read$())
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@295@01 $Ref)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@294@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@294@01)))
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
(assert (not (= ret@278@01 $t@294@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@296@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@296@01 $t@290@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@296@01 $t@295@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@278@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(u32(_28.val_ref.val_ref), write - read$())
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@294@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@297@01 $Snap)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@282@01 $t@296@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@298@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@298@01 $t@292@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@298@01 $t@297@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _38 := builtin$havoc_ref()
(declare-const ret@299@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_38.val_ref, write)
(declare-const $t@300@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@299@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _38.val_ref := _28
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@299@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l49
; [exec]
; __t21 := true
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; label l50
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@301@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(u32(_16), write)
(declare-const $t@302@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@280@01 ret@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@243@01 ret@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@282@01 ret@301@01)))
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
; inhale true
(declare-const $t@303@01 $Snap)
(assert (= $t@303@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l51
; [exec]
; __t8 := true
; [exec]
; _15 := builtin$havoc_ref()
(declare-const ret@304@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_15.val_bool, write)
(declare-const $t@305@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@220@01 ret@304@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@262@01 ret@304@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@304@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(u32(_16), write)
(assert (= $t@302@01 ($Snap.combine ($Snap.first $t@302@01) ($Snap.second $t@302@01))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@217@01 ret@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@125@01 ret@301@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@301@01 $Ref.null)))
(assert (= ($Snap.second $t@302@01) $Snap.unit))
; [eval] 0 <= self.val_int
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@302@01))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (u32%trigger $t@302@01 ret@301@01))
; [exec]
; _15.val_bool := _16.val_int < 55
; [eval] _16.val_int < 55
(declare-const val_bool@306@01 Bool)
(assert (= val_bool@306@01 (< ($SortWrappers.$SnapToInt ($Snap.first $t@302@01)) 55)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@220@01 ret@304@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@262@01 ret@304@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; _18 := builtin$havoc_int()
(declare-const ret@307@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _18 := 8
; [exec]
; _19 := builtin$havoc_int()
(declare-const ret@308@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _19 := 8
; [exec]
; label l52
; [exec]
; assert true
; [exec]
; assert _18 >= 0
; [eval] _18 >= 0
; [exec]
; assert _19 >= 0
; [eval] _19 >= 0
; [exec]
; exhale _18 >= 0 && _19 >= 0
; [eval] _18 >= 0
; [eval] _19 >= 0
; [exec]
; _20 := builtin$havoc_ref()
(declare-const ret@309@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_20), write)
(declare-const $t@310@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@236@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@226@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@180@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@176@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@266@01 ret@309@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@275@01 ret@309@01)))
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
; inhale true
(declare-const $t@311@01 $Snap)
(assert (= $t@311@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l53
; [exec]
; __t9 := true
; [exec]
; _21 := builtin$havoc_ref()
(declare-const ret@312@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_21.val_ref, write)
(declare-const $t@313@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@312@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global := builtin$havoc_ref()
(declare-const ret@314@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _21.val_ref := _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global(_21.val_ref), write)
(declare-const $t@315@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@231@01 ret@314@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@95@01 ret@314@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@314@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@271@01 ret@314@01)))
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
; _22 := builtin$havoc_int()
(declare-const ret@316@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _22 := 4
; [exec]
; _23 := builtin$havoc_int()
(declare-const ret@317@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _23 := 4
; [exec]
; label l54
; [exec]
; assert true
; [exec]
; assert _22 >= 0
; [eval] _22 >= 0
; [exec]
; assert _23 >= 0
; [eval] _23 >= 0
; [exec]
; exhale _22 >= 0 && _23 >= 0
; [eval] _22 >= 0
; [eval] _23 >= 0
; [exec]
; _24 := builtin$havoc_ref()
(declare-const ret@318@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_24), write)
(declare-const $t@319@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@309@01 ret@318@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@236@01 ret@318@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@226@01 ret@318@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@180@01 ret@318@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@318@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@318@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@176@01 ret@318@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@266@01 ret@318@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@275@01 ret@318@01)))
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
; inhale true
(declare-const $t@320@01 $Snap)
(assert (= $t@320@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l55
; [exec]
; __t10 := true
; [exec]
; _25 := builtin$havoc_ref()
(declare-const ret@321@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_25.val_ref, write)
(declare-const $t@322@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@321@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@323@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _25.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_25.val_ref), write)
(declare-const $t@324@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@282@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@243@01 ret@323@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@280@01 ret@323@01)))
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
; label l56
; [exec]
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@325@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _25.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@321@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_25.val_ref), write)
(declare-const $t@326@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@323@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@282@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@243@01 ret@325@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@280@01 ret@325@01)))
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
; inhale true
(declare-const $t@327@01 $Snap)
(assert (= $t@327@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l57
; [exec]
; __t11 := true
; [exec]
; _21.val_ref := _25
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@312@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l58
; [exec]
; __t12 := true
; [exec]
; _17 := _21
; [exec]
; label l59
; [exec]
; __t13 := true
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@328@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_26.val_ref, write)
(declare-const $t@329@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@328@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _26.val_ref := _17
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@328@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(_17.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@312@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_26.val_ref.val_ref, read$())
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
(declare-const $t@330@01 $Ref)
(declare-const $t@331@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@331@01 ret@321@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@331@01 $t@330@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@312@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(_17.val_ref.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@299@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@269@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@321@01 $t@331@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@321@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_26.val_ref.val_ref.val_ref, read$())
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
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
(declare-const $t@332@01 $Ref)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@321@01 $t@331@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@333@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@333@01 ret@325@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@333@01 $t@332@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@321@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(u32(_17.val_ref.val_ref), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@321@01 $t@331@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@280@01 $t@333@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@243@01 $t@333@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@147@01 $t@333@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@106@01 $t@333@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@333@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@149@01 $t@333@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@241@01 $t@333@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@282@01 $t@333@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@323@01 $t@333@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@325@01 $t@333@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_26.val_ref.val_ref.val_ref), read$())
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@321@01 $t@331@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
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
(declare-const $t@334@01 $Snap)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@325@01 $t@333@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@335@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@335@01 $t@326@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@335@01 $t@334@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l60
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | True | live]
; [else-branch: 6 | False | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 6 | True]
; [exec]
; exhale acc(u32(_26.val_ref.val_ref.val_ref), read$())
; [eval] read$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@299@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@269@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@328@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@321@01 $t@331@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@325@01 $t@333@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
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
; exhale acc(_26.val_ref.val_ref.val_ref, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@299@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@269@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@328@01 $t@331@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@321@01 $t@331@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@321@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
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
; exhale acc(_26.val_ref.val_ref, read$())
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
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@312@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
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
; inhale acc(_17.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const $t@336@01 $Ref)
(declare-const $t@337@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@337@01 $t@331@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@337@01 $t@336@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@312@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_17.val_ref.val_ref, write - read$())
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const $t@338@01 $Ref)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@299@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@269@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@328@01 $t@337@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@321@01 $t@337@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const $t@339@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@339@01 $t@333@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@339@01 $t@338@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@321@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(u32(_17.val_ref.val_ref), write - read$())
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@321@01 $t@337@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const $t@340@01 $Snap)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@325@01 $t@339@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const $t@341@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@341@01 $t@335@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@341@01 $t@340@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@342@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_27.val_ref, write)
(declare-const $t@343@01 $Ref)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@328@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@342@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27.val_ref := _17
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@328@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@342@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l61
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@344@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_14.val_bool, write)
(declare-const $t@345@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@304@01 ret@344@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@220@01 ret@344@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@262@01 ret@344@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@344@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _14.val_bool := _15.val_bool
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@262@01 ret@344@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@220@01 ret@344@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@304@01 ret@344@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l62
; [exec]
; __t14 := true
; [exec]
; __t34 := _14.val_bool
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@306@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not val_bool@306@01))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 7 | val_bool@306@01 | live]
; [else-branch: 7 | !(val_bool@306@01) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 7 | val_bool@306@01]
(assert val_bool@306@01)
; [exec]
; label loop6_group1_bb6
; [exec]
; fold acc(bool(_15), write)
(assert (bool%trigger ($SortWrappers.BoolTo$Snap val_bool@306@01) ret@304@01))
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@170@01 ret@304@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@304@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(bool(_14), write)
(assert (bool%trigger ($SortWrappers.BoolTo$Snap val_bool@306@01) ret@344@01))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@344@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@170@01 ret@344@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@304@01 ret@344@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert true
; [exec]
; exhale acc(bool(_15), write) &&
;   (acc(raw_ref$u8(_20), write) &&
;   (acc(raw_ref$u8(_24), write) && acc(bool(_14), write)))
; [exec]
; inhale false
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 7 | !(val_bool@306@01)]
(assert (not val_bool@306@01))
(pop) ; 10
; [eval] !__t34
(push) ; 10
(set-option :timeout 10)
(assert (not val_bool@306@01))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@306@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 8 | !(val_bool@306@01) | live]
; [else-branch: 8 | val_bool@306@01 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 8 | !(val_bool@306@01)]
(assert (not val_bool@306@01))
; [exec]
; label bb3
; [exec]
; label bb4
; [exec]
; __t22 := true
; [exec]
; _43 := builtin$havoc_int()
(declare-const ret@346@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _43 := 8
; [exec]
; _44 := builtin$havoc_int()
(declare-const ret@347@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _44 := 8
; [exec]
; label l65
; [exec]
; assert true
; [exec]
; assert _43 >= 0
; [eval] _43 >= 0
; [exec]
; assert _44 >= 0
; [eval] _44 >= 0
; [exec]
; exhale _43 >= 0 && _44 >= 0
; [eval] _43 >= 0
; [eval] _44 >= 0
; [exec]
; _45 := builtin$havoc_ref()
(declare-const ret@348@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_45), write)
(declare-const $t@349@01 $Snap)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@275@01 ret@348@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@266@01 ret@348@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@176@01 ret@348@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@348@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@348@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@180@01 ret@348@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@226@01 ret@348@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@236@01 ret@348@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@309@01 ret@348@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@318@01 ret@348@01)))
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
; inhale true
(declare-const $t@350@01 $Snap)
(assert (= $t@350@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l66
; [exec]
; __t23 := true
; [exec]
; _46 := builtin$havoc_ref()
(declare-const ret@351@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_46.val_ref, write)
(declare-const $t@352@01 $Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@342@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@328@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@351@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global := builtin$havoc_ref()
(declare-const ret@353@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _46.val_ref := _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@328@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@342@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global(_46.val_ref), write)
(declare-const $t@354@01 $Snap)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@271@01 ret@353@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@353@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@95@01 ret@353@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@231@01 ret@353@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@314@01 ret@353@01)))
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
; _47 := builtin$havoc_int()
(declare-const ret@355@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _47 := 4
; [exec]
; _48 := builtin$havoc_int()
(declare-const ret@356@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _48 := 4
; [exec]
; label l67
; [exec]
; assert true
; [exec]
; assert _47 >= 0
; [eval] _47 >= 0
; [exec]
; assert _48 >= 0
; [eval] _48 >= 0
; [exec]
; exhale _47 >= 0 && _48 >= 0
; [eval] _47 >= 0
; [eval] _48 >= 0
; [exec]
; _49 := builtin$havoc_ref()
(declare-const ret@357@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_49), write)
(declare-const $t@358@01 $Snap)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@348@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@275@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@266@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@176@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@180@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@226@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@236@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@309@01 ret@357@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@318@01 ret@357@01)))
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
; inhale true
(declare-const $t@359@01 $Snap)
(assert (= $t@359@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l68
; [exec]
; __t24 := true
; [exec]
; _50 := builtin$havoc_ref()
(declare-const ret@360@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_50.val_ref, write)
(declare-const $t@361@01 $Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@342@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@328@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@351@01 ret@360@01)))
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
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@362@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _50.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@351@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@328@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@342@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_50.val_ref), write)
(declare-const $t@363@01 $Snap)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@325@01 ret@362@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@280@01 ret@362@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@243@01 ret@362@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@362@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@362@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@362@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@362@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@362@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@282@01 ret@362@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@323@01 ret@362@01)))
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
; label l69
; [exec]
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@364@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _50.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@351@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@328@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@342@01 ret@360@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_50.val_ref), write)
(declare-const $t@365@01 $Snap)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@362@01 ret@364@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@325@01 ret@364@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@280@01 ret@364@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@243@01 ret@364@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@364@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@364@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@364@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@364@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@241@01 ret@364@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@282@01 ret@364@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@323@01 ret@364@01)))
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
; inhale true
(declare-const $t@366@01 $Snap)
(assert (= $t@366@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l70
; [exec]
; __t25 := true
; [exec]
; _46.val_ref := _50
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@328@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@342@01 ret@351@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l71
; [exec]
; __t26 := true
; [exec]
; _42 := _46
; [exec]
; label l72
; [exec]
; __t27 := true
; [exec]
; _51 := builtin$havoc_ref()
(declare-const ret@367@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_51.val_ref, write)
(declare-const $t@368@01 $Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@342@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@328@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@351@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@367@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _51.val_ref := _42
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@351@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@328@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@342@01 ret@367@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(_42.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@351@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_51.val_ref.val_ref, read$())
; [eval] read$()
(set-option :timeout 0)
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
(declare-const $t@369@01 $Ref)
(declare-const $t@370@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@370@01 ret@360@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@370@01 $t@369@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@351@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(_42.val_ref.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@351@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@342@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@328@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@269@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@299@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@321@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@370@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@360@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_51.val_ref.val_ref.val_ref, read$())
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
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
(declare-const $t@371@01 $Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@370@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(declare-const $t@372@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@372@01 ret@364@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@372@01 $t@371@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@360@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(u32(_42.val_ref.val_ref), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@370@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@323@01 $t@372@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@282@01 $t@372@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@241@01 $t@372@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@149@01 $t@372@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@372@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@106@01 $t@372@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@147@01 $t@372@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@243@01 $t@372@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@280@01 $t@372@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@325@01 $t@372@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@362@01 $t@372@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@364@01 $t@372@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_51.val_ref.val_ref.val_ref), read$())
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@370@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
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
(declare-const $t@373@01 $Snap)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@364@01 $t@372@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(declare-const $t@374@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@374@01 $t@365@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@374@01 $t@373@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l73
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 9 | True | live]
; [else-branch: 9 | False | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 9 | True]
; [exec]
; exhale acc(u32(_51.val_ref.val_ref.val_ref), read$())
; [eval] read$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@351@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@342@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@328@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@269@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@299@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@321@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@367@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@370@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@364@01 $t@372@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
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
; exhale acc(_51.val_ref.val_ref.val_ref, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@351@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@342@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@328@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@269@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@299@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@321@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@367@01 $t@370@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@370@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@360@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
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
; exhale acc(_51.val_ref.val_ref, read$())
; [eval] read$()
(set-option :timeout 0)
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
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@351@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 12
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
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
; inhale acc(_42.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const $t@375@01 $Ref)
(declare-const $t@376@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@376@01 $t@370@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@376@01 $t@375@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@351@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_42.val_ref.val_ref, write - read$())
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const $t@377@01 $Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@342@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@312@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@328@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@278@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@229@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@246@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@239@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@285@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@269@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@299@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@321@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@367@01 $t@376@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@376@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const $t@378@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@378@01 $t@372@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@378@01 $t@377@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@360@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(u32(_42.val_ref.val_ref), write - read$())
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@360@01 $t@376@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const $t@379@01 $Snap)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@364@01 $t@378@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const $t@380@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@380@01 $t@374@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@380@01 $t@379@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _52 := builtin$havoc_ref()
(declare-const ret@381@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_52.val_ref, write)
(declare-const $t@382@01 $Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@342@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@328@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@367@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@351@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@381@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _52.val_ref := _42
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@351@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@367@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@321@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@299@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@269@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@285@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@239@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@246@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@229@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@278@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@328@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@312@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@342@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@360@01 ret@381@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l74
; [exec]
; _54 := builtin$havoc_ref()
(declare-const ret@383@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_54.val_bool, write)
(declare-const $t@384@01 Bool)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@344@01 ret@383@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@262@01 ret@383@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@220@01 ret@383@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@304@01 ret@383@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@383@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _54.val_bool := false
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@304@01 ret@383@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@220@01 ret@383@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@262@01 ret@383@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@344@01 ret@383@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t35 := _54.val_bool
; [then-branch: 10 | False | dead]
; [else-branch: 10 | True | live]
(set-option :timeout 0)
(push) ; 12
; [else-branch: 10 | True]
(pop) ; 12
; [eval] !__t35
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 11 | True | live]
; [else-branch: 11 | False | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 11 | True]
; [exec]
; label bb5
; [exec]
; __t29 := true
; [exec]
; __t30 := true
; [exec]
; __t31 := true
; [exec]
; label l78
; [exec]
; fold acc(tuple0$(_0), write)
(assert (tuple0$%trigger $Snap.unit _0@1@01))
; [exec]
; assert true
; [exec]
; exhale acc(tuple0$(_0), write)
; [exec]
; label end_of_method
(pop) ; 12
(pop) ; 11
; [eval] !__t27
; [then-branch: 12 | False | dead]
; [else-branch: 12 | True | live]
(push) ; 11
; [else-branch: 12 | True]
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 8 | val_bool@306@01]
(assert val_bool@306@01)
(pop) ; 10
(pop) ; 9
; [eval] !__t13
; [then-branch: 13 | False | dead]
; [else-branch: 13 | True | live]
(push) ; 9
; [else-branch: 13 | True]
(pop) ; 9
(pop) ; 8
; [eval] !__t20
; [then-branch: 14 | False | dead]
; [else-branch: 14 | True | live]
(push) ; 8
; [else-branch: 14 | True]
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 4 | !(val_bool@222@01)]
(assert (not val_bool@222@01))
(pop) ; 7
; [eval] !__t33
(push) ; 7
(set-option :timeout 10)
(assert (not val_bool@222@01))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not val_bool@222@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 15 | !(val_bool@222@01) | live]
; [else-branch: 15 | val_bool@222@01 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 15 | !(val_bool@222@01)]
(assert (not val_bool@222@01))
; [exec]
; label bb1
; [exec]
; label end_of_method
(pop) ; 7
(push) ; 7
; [else-branch: 15 | val_bool@222@01]
(assert val_bool@222@01)
(pop) ; 7
(pop) ; 6
; [eval] !__t13
; [then-branch: 16 | False | dead]
; [else-branch: 16 | True | live]
(push) ; 6
; [else-branch: 16 | True]
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(val_bool@130@01)]
(assert (not val_bool@130@01))
(pop) ; 5
; [eval] !__t32
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@130@01))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@130@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 17 | !(val_bool@130@01) | live]
; [else-branch: 17 | val_bool@130@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 17 | !(val_bool@130@01)]
(assert (not val_bool@130@01))
; [exec]
; label return
; [exec]
; label bb4
; [exec]
; __t22 := true
; [exec]
; _43 := builtin$havoc_int()
(declare-const ret@385@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _43 := 8
; [exec]
; _44 := builtin$havoc_int()
(declare-const ret@386@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _44 := 8
; [exec]
; label l65
; [exec]
; assert true
; [exec]
; assert _43 >= 0
; [eval] _43 >= 0
; [exec]
; assert _44 >= 0
; [eval] _44 >= 0
; [exec]
; exhale _43 >= 0 && _44 >= 0
; [eval] _43 >= 0
; [eval] _44 >= 0
; [exec]
; _45 := builtin$havoc_ref()
(declare-const ret@387@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_45), write)
(declare-const $t@388@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@387@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@387@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@387@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@387@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@389@01 $Snap)
(assert (= $t@389@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l66
; [exec]
; __t23 := true
; [exec]
; _46 := builtin$havoc_ref()
(declare-const ret@390@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_46.val_ref, write)
(declare-const $t@391@01 $Ref)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@390@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global := builtin$havoc_ref()
(declare-const ret@392@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _46.val_ref := _aux_havoc_struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(struct$m_std$$boxed$$Box$u32$struct$m_std$$alloc$$Global(_46.val_ref), write)
(declare-const $t@393@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@95@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@138@01 ret@392@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _47 := builtin$havoc_int()
(declare-const ret@394@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _47 := 4
; [exec]
; _48 := builtin$havoc_int()
(declare-const ret@395@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _48 := 4
; [exec]
; label l67
; [exec]
; assert true
; [exec]
; assert _47 >= 0
; [eval] _47 >= 0
; [exec]
; assert _48 >= 0
; [eval] _48 >= 0
; [exec]
; exhale _47 >= 0 && _48 >= 0
; [eval] _47 >= 0
; [eval] _48 >= 0
; [exec]
; _49 := builtin$havoc_ref()
(declare-const ret@396@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(raw_ref$u8(_49), write)
(declare-const $t@397@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@387@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@99@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@90@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@396@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@398@01 $Snap)
(assert (= $t@398@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l68
; [exec]
; __t24 := true
; [exec]
; _50 := builtin$havoc_ref()
(declare-const ret@399@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_50.val_ref, write)
(declare-const $t@400@01 $Ref)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@390@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@399@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@401@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _50.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@390@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_50.val_ref), write)
(declare-const $t@402@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@401@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@401@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@401@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@401@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l69
; [exec]
; _aux_havoc_u32 := builtin$havoc_ref()
(declare-const ret@403@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _50.val_ref := _aux_havoc_u32
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@390@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@399@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_50.val_ref), write)
(declare-const $t@404@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@401@01 ret@403@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@149@01 ret@403@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@403@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@106@01 ret@403@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@147@01 ret@403@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@405@01 $Snap)
(assert (= $t@405@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label l70
; [exec]
; __t25 := true
; [exec]
; _46.val_ref := _50
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@399@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@390@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l71
; [exec]
; __t26 := true
; [exec]
; _42 := _46
; [exec]
; label l72
; [exec]
; __t27 := true
; [exec]
; _51 := builtin$havoc_ref()
(declare-const ret@406@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_51.val_ref, write)
(declare-const $t@407@01 $Ref)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@399@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@390@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@406@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _51.val_ref := _42
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@390@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@399@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@406@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(_42.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@390@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_51.val_ref.val_ref, read$())
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
(declare-const $t@408@01 $Ref)
(declare-const $t@409@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@409@01 ret@399@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@409@01 $t@408@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@390@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(_42.val_ref.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@390@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@399@01 $t@409@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
  (not (= ret@399@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_51.val_ref.val_ref.val_ref, read$())
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
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
(declare-const $t@410@01 $Ref)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@399@01 $t@409@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@411@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@411@01 ret@403@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@411@01 $t@410@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@399@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(u32(_42.val_ref.val_ref), write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@399@01 $t@409@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@147@01 $t@411@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@106@01 $t@411@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@104@01 $t@411@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@149@01 $t@411@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@401@01 $t@411@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@403@01 $t@411@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (read$ $Snap.unit))
      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(u32(_51.val_ref.val_ref.val_ref), read$())
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@399@01 $t@409@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
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
(declare-const $t@412@01 $Snap)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@403@01 $t@411@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@413@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@413@01 $t@404@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@413@01 $t@412@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l73
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 18 | True | live]
; [else-branch: 18 | False | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 18 | True]
; [exec]
; exhale acc(u32(_51.val_ref.val_ref.val_ref), read$())
; [eval] read$()
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@390@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@406@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@399@01 $t@409@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@403@01 $t@411@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(_51.val_ref.val_ref.val_ref, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@390@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@406@01 $t@409@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@399@01 $t@409@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@399@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(_51.val_ref.val_ref, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@390@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_42.val_ref, write - read$())
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@414@01 $Ref)
(declare-const $t@415@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@415@01 $t@409@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@415@01 $t@414@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@390@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_42.val_ref.val_ref, write - read$())
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@416@01 $Ref)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@166@01 $t@415@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@415@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@152@01 $t@415@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 $t@415@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 $t@415@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@93@01 $t@415@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@123@01 $t@415@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@145@01 $t@415@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@406@01 $t@415@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@399@01 $t@415@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@417@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@417@01 $t@411@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@417@01 $t@416@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@399@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(u32(_42.val_ref.val_ref), write - read$())
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@399@01 $t@415@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] write - read$()
; [eval] read$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or
  (= (- $Perm.Write (read$ $Snap.unit)) $Perm.No)
  (< $Perm.No (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@418@01 $Snap)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@403@01 $t@417@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@419@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@419@01 $t@413@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@419@01 $t@418@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _52 := builtin$havoc_ref()
(declare-const ret@420@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_52.val_ref, write)
(declare-const $t@421@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@399@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@390@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@420@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _52.val_ref := _42
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@390@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@406@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@145@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@123@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@93@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@102@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@152@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@166@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@399@01 ret@420@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l74
; [exec]
; _54 := builtin$havoc_ref()
(declare-const ret@422@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_54.val_bool, write)
(declare-const $t@423@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@422@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@422@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@422@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _54.val_bool := false
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@128@01 ret@422@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@168@01 ret@422@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t35 := _54.val_bool
; [then-branch: 19 | False | dead]
; [else-branch: 19 | True | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 19 | True]
(pop) ; 7
; [eval] !__t35
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 20 | True | live]
; [else-branch: 20 | False | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 20 | True]
; [exec]
; label bb5
; [exec]
; __t29 := true
; [exec]
; __t30 := true
; [exec]
; __t31 := true
; [exec]
; label l78
; [exec]
; fold acc(tuple0$(_0), write)
(assert (tuple0$%trigger $Snap.unit _0@1@01))
; [exec]
; assert true
; [exec]
; exhale acc(tuple0$(_0), write)
; [exec]
; label end_of_method
(pop) ; 7
(pop) ; 6
; [eval] !__t27
; [then-branch: 21 | False | dead]
; [else-branch: 21 | True | live]
(push) ; 6
; [else-branch: 21 | True]
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 17 | val_bool@130@01]
(assert val_bool@130@01)
(pop) ; 5
(pop) ; 4
; [eval] !__t13
; [then-branch: 22 | False | dead]
; [else-branch: 22 | True | live]
(push) ; 4
; [else-branch: 22 | True]
(pop) ; 4
(pop) ; 3
; [eval] !__t5
; [then-branch: 23 | False | dead]
; [else-branch: 23 | True | live]
(push) ; 3
; [else-branch: 23 | True]
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_bool ----------
(declare-const ret@424@01 Bool)
(declare-const ret@425@01 Bool)
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
(declare-const ret@426@01 Int)
(declare-const ret@427@01 Int)
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
(declare-const ret@428@01 $Ref)
(declare-const ret@429@01 $Ref)
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
